// wrapper of htmlspecialchars
// In PHP 5.4, defualt value of htmlspecialchars 3rd parameter is changed
// from 'ISO8859-1' to 'UTF-8',
// but if in ja_JP mode, html data encoding is 'EUC-JP', not 'UTF-8'.
// htmlspecialchars discard invalid encoding characters,
// so in ja_JP mode, EUC-JP characters are discarded.
function sq_htmlspecialchars($string) {
    $encoding = 'iso8859-1';
    if (function_exists('mb_internal_encoding')) {
        $encoding = mb_internal_encoding();
    }
    return htmlspecialchars($string, ENT_COMPAT | ENT_HTML401, $encoding);
}
