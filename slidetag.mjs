// ugly hack, substitutions don't exist yet: https://github.com/jupyter-book/mystmd/issues/852
const slidetag = {
  name: 'slidetag',
  alias: ["slidetag"],
  doc: 'slidetag.',
  run(data) {
    // uncomment desired
    // return [{ type: 'h3', value: "SLIDETAG" }];
    return [{ type: 'text', value: "" }];
  },
};

const plugin = { name: 'slidetag', directives: [slidetag] };

export default plugin;
