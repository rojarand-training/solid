struct Contact {
    let name: String
        let phoneNumber: String
}

struct ContactsUnavailableError: Error {}

struct LocalSourceOfContacts {
    func load() throws -> [Contact] {
        print("Loading from local database ...")
            if Int.random(in :1...10)%3 == 0 {
                return [Contact(name: "Robert", phoneNumber: "111-222-333")]
            } else {
                throw ContactsUnavailableError()
            }
    }
}

struct NetworkSourceOfContacts {
    func load() throws -> [Contact] {
        print("Loading from local network ...")
            if Int.random(in: 1...10)%3 == 0 {
                return [Contact(name: "Mike", phoneNumber: "755-444-666")]
            } else {
                throw ContactsUnavailableError()
            }
    }
}

struct ContactRepository {
    private let primarySource = LocalSourceOfContacts()
    private let secondarySource = NetworkSourceOfContacts()

    func load() -> [Contact] {
        let result = loadFromPrimarySource()
        if !result.isEmpty {
            return result
        } else {
            return loadFromSecondarySource()
        }
    } 

    private func loadFromPrimarySource() -> [Contact] {
        do {
            return try primarySource.load()
        } catch {
            return []
        }
    }

    private func loadFromSecondarySource() -> [Contact] {
        do {
            return try secondarySource.load()
        } catch {
            return []
        }
    }
}

print(ContactRepository().load())
