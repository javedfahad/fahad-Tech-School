
    public class WrapperClassSample {
        public Account acc { get; set; }
        public List<Contact> con { get; set; }
    
        public WrapperClassSample() {
            acc = new Account();
            con = new List<Contact>();
        }
    }
