// ugly hack, substitutions don't exist yet: https://github.com/jupyter-book/mystmd/issues/852
const slidetag = {
  name: 'slidetag',
  doc: 'slidetag.',
  run(data) {
    // uncomment if need slide tags for video recording, then restart webserver
    // return [{ type: 'html', value: '<div style="color:red; font-weight:bold; font-size:x-large;">SLIDETAG</div>' }];
    return [{ type: 'text', value: "" }];
  },
};

const plugin = { name: 'slidetag', directives: [slidetag] };

export default plugin;
