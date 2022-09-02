module.exports = async ({ github, context, core }) => {

  core.notice('This is a generic notice');
  core.warning('And a warning attached to a file', {
    title: 'I have a title',
    file: '.github/workflows/check-annotations.yml',
  });
  console.log(`created annotations`);
};
