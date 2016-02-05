<?php
 
class GoogleTest extends PHPUnit_Extensions_SeleniumTestCase
{
    protected function setUp()
    {
        $this->setHost('localhost');
        $this->setPort(4444);
        $this->setBrowser('firefox');
        $this->setBrowserUrl('http://www.google.nl');
        $this->shareSession(true);
    }
 
    public function testLoadPage()
    {
        $this->open('http://www.google.nl');
        $this->assertTrue(1===1);
        $this->assertTitle('Google');
    }

}
?>
