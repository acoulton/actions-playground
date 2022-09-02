module.exports = async ({ github, context, core }) => {

  core.notice('This is a generic notice');
  core.warning('And a warning attached to a file', {
    title: 'I have a title',
    file: '.github/workflows/check-annotations.yml',
  });
  core.notice('Here is an annotation on an unchanged file https://www.foo.bar/here', {file: 'LICENSE', startLine: 1})
  await core.summary
    .addHeading('Built JS')
    .addRaw('I got info for you')
    .addLink('https://www.foo.bar/here')
    .write();
  console.log(`created annotations`);
};
