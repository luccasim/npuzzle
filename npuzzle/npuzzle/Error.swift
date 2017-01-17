enum npuzzleError : Error
{
    case success
    case fail
    case unknow
    
    func what() -> String
    {
        switch self {
        case .success:
            return "The proccess successfully end"
        case .fail:
            return "One error occur"
        default:
            return "Unknow error"
        }
    }
}
