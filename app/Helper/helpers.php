<?php

function getOldData($data, $key, $default = null)
{
    return old($key, data_get($data, $key));
}
