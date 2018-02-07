using System;
using System.Collections.Generic;
 
public class Program
{
    public static void Comb(int k, int n)
    {
            int[] output = new int[k]; //stores a combination of k length 
            Stack<int> stack = new Stack<int>();
            stack.Push(0);
 
            while (stack.Count > 0) {
                Console.WriteLine(stack.Count);
                Console.WriteLine();
                int index = stack.Count - 1;
                int value = stack.Pop();
 
                while (value < n) { //This is the limit for n. 
                    output[index++] = value++;
                    stack.Push(value);

                    if (index == k) { //Once we reach k numbers, print the output. 
                        Console.WriteLine(string.Join(" ", output));
                        Console.WriteLine();
                        break;
                    }
                }
            }
    }
 
    static void Main(string[] args)
    {
        int k = Convert.ToInt32(args[0]);
        int n = Convert.ToInt32(args[1]);
        Comb(k,n);
    }
}