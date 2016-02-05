<?php
 
class LocalTest extends PHPUnit_Extensions_SeleniumTestCase
{
    protected function setUp()
    {
        $this->setHost('localhost');
        $this->setPort(4444);
        $this->setBrowser('firefox');
        $this->setBrowserUrl('http://localhost');
        $this->shareSession(true);
    }
 
    public function testLoadPage()
    {
        $this->open('http://localhost/tests/simpleTests.html');
        $this->assertTrue(1===1);
        $this->assertTitle('phpunit selenium test');
    }

}
?>
