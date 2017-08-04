#DebugDescription
iOS模型打印

在开发当中，我们很多时候需要打印模型的所有属性。如果我们直接使用NSLog(@"%@",model);的方式，打印出来只是model的内存地址。这个demo是通过重写模型的description方法和debugDescription方法，来实现model打印显示属性。
