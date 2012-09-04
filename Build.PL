use Module::Build;
Module::Build->new(
    module_name => 'Date::Period::Human',
    license     => 'perl',
    requires => {
        'Date::Calc' => 0,
        'DateTime::Format::MySQL' => 0,
        'Test::More' => 0,
        'Test::Exception' => 0,
    },
)->create_build_script;

