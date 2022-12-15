import Foundation

class Person: Hashable, CustomStringConvertible {
    private final let name: String

    init(name: String) {
        self.name = name
    }

    static func ==(lhs: Person, rhs: Person) -> Bool {
        lhs.name == rhs.name;
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }

    public var description: String { "Person(name='\(name)')" }
}

class Friendships {
    private final var friendships = [Person: Set<Person>]();

    func addFriendship(of: Person, with: Person) {
        if friendships[of]?.contains(with) == true || of == with {
            return
        }
        addRelationship(of: of, with: with)
        addRelationship(of: with, with: of)
    }

    func friendCount(friend: Person) -> Int {
        friendships[friend]?.count ?? 0
    }

    func removeFriendship(of: Person, with: Person) {
        if friendships[of] == nil || of == with {
            return
        }

        removeRelationship(of: of, with: with)
        removeRelationship(of: with, with: of)
    }

    private func addRelationship(of: Person, with: Person) {
        if friendships[of] == nil {
            friendships[of] = Set<Person>()
        }
        friendships[of]?.insert(with);
    }

    private func removeRelationship(of: Person, with: Person) {
        if friendships[of] == nil {
            return
        }
        friendships[of]?.remove(with);
    }

    static func test() {
        let person1 = Person(name: "1")
        let person2 = Person(name: "2")
        let person3 = Person(name: "3")

        let friendships = Friendships()

        friendships.addFriendship(of: person1, with: person2)
        friendships.addFriendship(of: person1, with: person3)
        friendships.addFriendship(of: person2, with: person3)

        print("Friendship Counts")
        print("\(person1);", "Expected: 2; Got: \(friendships.friendCount(friend: person1))")
        print("\(person2);", "Expected: 2; Got: \(friendships.friendCount(friend: person2))")
        print("\(person3);", "Expected: 2; Got: \(friendships.friendCount(friend: person3))")

        print("--- Remove friendship between \(person1) and \(person3) ---")
        friendships.removeFriendship(of: person1, with: person3)

        print("Friendship Counts")
        print("\(person1);", "Expected: 1; Got: \(friendships.friendCount(friend: person1))")
        print("\(person2);", "Expected: 2; Got: \(friendships.friendCount(friend: person2))")
        print("\(person3);", "Expected: 1; Got: \(friendships.friendCount(friend: person3))")
    }
}

Friendships.test()
