<?php

require_once 'HelloWorld.php';
class HelloWorldTest extends PHPUnit_Framework_TestCase
{
    public function testSayReturnsHelloWorld()
    {
        $helloWorld = new HelloWorld();
        $result = $helloWorld->say();
        $expected = 'Hello World!';

	$this->assertSame($expected, $result,
        'We didn\'t got a hello world message');
    }
}
