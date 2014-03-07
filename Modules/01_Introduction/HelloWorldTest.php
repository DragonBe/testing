<?php

require_once 'HelloWorld.php';
class HelloWorldTest extends PHPUnit_Framework_TestCase
{
    public function testSayReturnsHelloWorld()
    {
        $hw = new HelloWorld();
	$this->assertSame("Hello World!", $hw->say());
    }
}
