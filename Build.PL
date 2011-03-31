use Module::Build;
Module::Build->new(
    module_name => 'Date::Period::Human',
    license     => 'perl',
    requires => {
        'Date::Calc' => 0,
    },
)->create_build_script;

