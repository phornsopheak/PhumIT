CKEDITOR.editorConfig = function( config )
{
  config.extraPlugins = 'widget,lineutils,eqneditor,codeTag,codesnippet';
  config.codeSnippet_theme = 'atelier-dune.dark';

  config.codeSnippet_languages = {
    javascript: 'JavaScript',
    php: 'PHP'
  };
};
