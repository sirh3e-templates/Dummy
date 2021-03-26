namespace Sirh3e.Dummy
{
    public class Foo<T>
    {
        public T? Value { get; set; }
        
        public static class Factory
        {
            public static Foo<T> CreateDefault()
                => new();
            
            public static Foo<T> CreateDefaultByValue(T value)
                => new()
                {
                    Value = value
                };
        }
    }
}
