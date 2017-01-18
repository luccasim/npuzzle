enum npuzzleError : Error
{
    case success
    case fail, argc, open
    case unknow
    
    func what() -> String
    {
        switch self {
        case .success:
            return "The proccess successfully end"
        case .fail:
            return "One error occur"
        case .argc:
            return "You should give a pathFileName in Parameter"
        case .open:
            return "Open The pathFileName fail"
        default:
            return "Unknow error"
        }
    }
}
