enum npuzzleError : Error
{
    case success
    case fail, argc, open, size, nbline, unvalidline, sizeline
    case unknow
    
    func what() -> String
    {
        switch self
        {
        case .success:
            return "The proccess successfully end"
        case .fail:
            return "One error occur"
        case .argc:
            return "You should give a pathFileName in Parameter"
        case .size:
            return "size are unvalid"
        case .nbline:
            return "number of line are more or less the than size"
        case .sizeline:
            return "The size of the line is more or less than the size"
        case .unvalidline:
            return "A line is unvalid"
         case .open:
            return "Open The pathFileName fail"
        default:
            return "Unknow error"
        }
    }
}
