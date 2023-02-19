struct Contact {
    let name: String
    let phoneNumber: String
}

struct ContactsUnavailableError: Error {}

protocol SourceOfContacts {
    func load() throws -> [Contact]
}

struct LocalSourceOfContacts: SourceOfContacts {
    func load() throws -> [Contact] {
        print("Loading from local database ...")
        if Int.random(in :1...10)%3 == 0 {
            return [Contact(name: "Robert", phoneNumber: "111-222-333")]
        } else {
            throw ContactsUnavailableError()
        }
    }
}

struct NetworkSourceOfContacts: SourceOfContacts {
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
    let primarySource: SourceOfContacts
    let secondarySource: SourceOfContacts

    func load() -> [Contact] {
        let result = load(from: primarySource)
        if !result.isEmpty {
            return result
        }
        return load(from: secondarySource)
    } 


    private func load(from source: SourceOfContacts) -> [Contact] {
        do {
            return try source.load()
        } catch {
            return []
        }
    }
}

let repository = ContactRepository(primarySource: LocalSourceOfContacts(), 
                                secondarySource: NetworkSourceOfContacts())
print(repository.load())
