<?php


use PHPUnit\Framework\TestCase;

class AssertTest extends TestCase
{

    public function test_assert_ok()
    {
        assert(true);
        $this->assertFalse(false, 'runs, assert is ok');
    }

    public function test_assert_fail()
    {
        assert(false);
        $this->assertFalse(TRUE, 'Never runs, assert fails');
    }

}
