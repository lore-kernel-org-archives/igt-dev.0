Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFB8110E38A
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Mar 2023 09:19:02 +0000 (UTC)
Date: Tue, 7 Mar 2023 10:18:58 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Zbigniew =?UTF-8?B?S2VtcGN6ecWEc2tp?= <zbigniew.kempczynski@intel.com>
Message-ID: <20230307101858.1dc632d2@maurocar-mobl2>
In-Reply-To: <20230302110947.548610-8-zbigniew.kempczynski@intel.com>
References: <20230302110947.548610-1-zbigniew.kempczynski@intel.com>
 <20230302110947.548610-8-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t v4 7/8] docs/testplan: Introduce new way
 for documenting IGT
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu,  2 Mar 2023 12:09:46 +0100
Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com> wrote:

> Add custom targets to allow building the testplan documentation
> for the Xe driver.
>=20
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> Signed-off-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>

Well, I wrote this one, so obviously:

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> ---
>  docs/meson.build           |   1 +
>  docs/testplan/meson.build  |  28 +++
>  docs/testplan/testplan.css |   7 +
>  meson_options.txt          |   4 +
>  scripts/igt_doc.py         | 490 +++++++++++++++++++++++++++++++++----
>  scripts/meson.build        |   2 +
>  6 files changed, 479 insertions(+), 53 deletions(-)
>  create mode 100644 docs/testplan/meson.build
>  create mode 100644 docs/testplan/testplan.css
>=20
> diff --git a/docs/meson.build b/docs/meson.build
> index ead14c4015..01edf64f04 100644
> --- a/docs/meson.build
> +++ b/docs/meson.build
> @@ -1 +1,2 @@
>  subdir('reference')
> +subdir('testplan')
> diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
> new file mode 100644
> index 0000000000..4b55ca6ae5
> --- /dev/null
> +++ b/docs/testplan/meson.build
> @@ -0,0 +1,28 @@
> +build_testplan =3D get_option('testplan')
> +
> +rst2html =3D find_program('rst2html-3', 'rst2html', required : build_tes=
tplan)
> +
> +stylesheet =3D meson.current_source_dir() + '/testplan.css'
> +
> +if igt_doc_script.found()
> +    # Xe test documentation
> +    testplan =3D 'xe_tests'
> +
> +    rst =3D custom_target(testplan + '.rst',
> +                        build_by_default : true,
> +                        command : [ igt_doc_script, '--config', '@INPUT@=
', '--rest', '@OUTPUT@' ],
> +                        input : xe_test_config,
> +                        output : testplan + '.rst'
> +                        )
> +    if rst2html.found()
> +        custom_target(testplan + '.html',
> +                      build_by_default : true,
> +                      command : [ rst2html, '--stylesheet=3D' + styleshe=
et, '--field-name-limit=3D0', '@INPUT@', '@OUTPUT@' ],
> +                      input : rst,
> +                      output : testplan + '.html'
> +                      )
> +    endif
> +endif
> +
> +build_info +=3D 'Build ReST test documentation: @0@'.format(igt_doc_scri=
pt.found())
> +build_info +=3D 'Build html testplan documentation: @0@'.format(rst2html=
.found())
> diff --git a/docs/testplan/testplan.css b/docs/testplan/testplan.css
> new file mode 100644
> index 0000000000..8aa7b7105c
> --- /dev/null
> +++ b/docs/testplan/testplan.css
> @@ -0,0 +1,7 @@
> +@import url(html4css1.css);
> +
> +.literal {
> +	background: lightgrey;
> +        color: darkblue;
> +        font-size: 14px;
> +}
> diff --git a/meson_options.txt b/meson_options.txt
> index d978813b4f..fb48ba780d 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -20,6 +20,10 @@ option('man',
>         type : 'feature',
>         description : 'Build man pages')
> =20
> +option('testplan',
> +       type : 'feature',
> +       description : 'Build testplan documentation pages in ReST and htm=
l')
> +
>  option('docs',
>         type : 'feature',
>         description : 'Build documentation')
> diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
> index b7e3129d3f..f2227a9720 100755
> --- a/scripts/igt_doc.py
> +++ b/scripts/igt_doc.py
> @@ -1,5 +1,5 @@
>  #!/usr/bin/env python3
> -# pylint: disable=3DC0301,R0914,R0912,R0915
> +# pylint: disable=3DC0301,R0902,R0914,R0912,R0915,R1702
>  # SPDX-License-Identifier: (GPL-2.0 OR MIT)
> =20
>  ## Copyright (C) 2023    Intel Corporation                 ##
> @@ -11,26 +11,87 @@
>  """Maintain test plan and test implementation documentation on IGT."""
> =20
>  import argparse
> +import glob
> +import json
> +import os
>  import re
>  import subprocess
>  import sys
> =20
> -IGT_BUILD_PATH =3D 'build/'
> +IGT_BUILD_PATH =3D 'build'
>  IGT_RUNNER =3D 'runner/igt_runner'
> =20
> -# Fields that mat be inside TEST and SUBTEST macros
> -fields =3D [
> -    'Category',       # Hardware building block / Software building bloc=
k / ...
> -    'Sub-category',   # waitfence / dmabuf/ sysfs / debugfs / ...
> -    'Functionality',  # basic test / ...
> -    'Test category',  # functionality test / pereformance / stress
> -    'Run type',       # BAT / workarouds / stress / developer-specific /=
 ...
> -    'Issue',          # Bug tracker issue(s)
> -    'GPU excluded platforms',     # none / DG1 / DG2 / TGL / MTL / PVC /=
 ATS-M / ...
> -    'GPU requirements',  # Any other specific platform requirements
> -    'Depends on',     # some other IGT test, like igt@test@subtes
> -    'Test requirements',  # other non-platform requirements
> -    'Description']    # Description of the test
> +#
> +# ancillary functions to sort dictionary hierarchy
> +#
> +def _sort_per_level(item):
> +    if "level" not in item[1]["_properties_"]:
> +        return item[0]
> +
> +    return "%05d_%05d_%s" % (item[1]["_properties_"]["level"], item[1]["=
_properties_"]["sublevel"], item[0])   # pylint: disable=3DC0209
> +
> +def _sort_using_array(item, array):
> +    ret_str =3D ''
> +    for field in array:
> +        if field in item[1]:
> +            ret_str +=3D '_' + field + '_' + item[1][field]
> +
> +    if ret_str =3D=3D '':
> +        ret_str=3D"________"
> +
> +    return ret_str
> +
> +#
> +# Ancillary logic to allow plurals on fields
> +#
> +# As suggested at https://stackoverflow.com/questions/18902608/generatin=
g-the-plural-form-of-a-noun/19018986
> +#
> +
> +def plural(field):
> +
> +    """
> +    Poor man's conversion to plural.
> +
> +    It should cover usual English plural rules, although it is not meant
> +    to cover exceptions (except for a few ones that could be useful on a=
ctual
> +    fields).
> +
> +"""
> +
> +    if (match :=3D re.match(r"(.*)\b(\S+)", field)):
> +        ret_str =3D match.group(1)
> +        word =3D match.group(2)
> +
> +        if word.isupper():
> +            ret_str +=3D word
> +        elif word =3D=3D "of" or word =3D=3D "off" or word =3D=3D "on" o=
r word =3D=3D"description" or word =3D=3D "todo":
> +            ret_str +=3D word
> +        elif word.endswith('ed'):
> +            ret_str +=3D word
> +        elif word[-1:] in ['s', 'x', 'z']:
> +            ret_str +=3D word + 'es'
> +        elif word[-2:] in ['sh', 'ch']:
> +            ret_str +=3D word + 'es'
> +        elif word.endswith('fe'):
> +            ret_str +=3D word[:-2] + 'ves'
> +        elif word.endswith('f'):
> +            ret_str +=3D word[:-1] + 'ves'
> +        elif word.endswith('y'):
> +            ret_str +=3D word[:-1] + 'ies'
> +        elif word.endswith('o'):
> +            ret_str +=3D word + 'es'
> +        elif word.endswith('us'):
> +            ret_str +=3D word[:-2] + 'i'
> +        elif word.endswith('on'):
> +            ret_str +=3D word[:-2] + 'a'
> +        elif word.endswith('an'):
> +            ret_str +=3D word[:-2] + 'en'
> +        else:
> +            ret_str +=3D word + 's'
> +
> +        return ret_str
> +    else:
> +        return field
> =20
>  #
>  # TestList class definition
> @@ -107,19 +168,160 @@ class TestList:
>      The wildcard arguments there need to be expanded. This is done by
>      defining arg[1] to arg[n] at the same code comment that contains the
>      SUBTEST as those variables are locally processed on each comment lin=
e.
> -    """
> =20
> +    This script needs a configuration file, in JSON format, describing t=
he
> +    fields which will be parsed for TEST and/or SUBTEST tags.
> +
> +    An exemple of such file is:
> +
> +    {
> +        "files": [ "tests/driver/*.c" ],
> +        "fields": {
> +            "Category": {
> +                "_properties_": {
> +                    "is_field": true,
> +                    "description": "Contains the major group for the tes=
ted functionality"
> +                },
> +                "Hardware": {
> +                    "Sub-category": {
> +                        "_properties_": {
> +                            "is_field": true,
> +                            "description": "Contains the minor group of =
the functionality"
> +                        }
> +                    }
> +                },
> +                "Software building block": {
> +                    "Type": {
> +                        "_properties_": {
> +                            "is_field": true,
> +                            "description": "Contains the minor group of =
the functionality"
> +                        }
> +                    }
> +                }
> +            },
> +            "Description" : {
> +                "_properties_": {
> +                    "is_field": true,
> +                    "description": "Provides a description for the test/=
subtest."
> +                }
> +            }
> +        }
> +    }
> +
> +    On such structure, entries having ["_properties_"]["is_field"] =3D=
=3D true
> +    are fields. When this is not found (or it is False), it indicates a
> +    possible value.
> +
> +    So, the above JSON config file expects tags like those:
> +
> +    TEST: foo
> +    Description: foo
> +
> +    SUBTEST: bar
> +    Category: Hardware
> +    Sub-category: EU
> +    Description: test bar on EU
> +
> +    SUBTEST: foobar
> +    Category: Software
> +    Type: ioctl
> +    Description: test ioctls
> +    """
> =20
> -    def __init__(self):
> +    def __init__(self, config_fname, file_list):
>          self.doc =3D {}
>          self.test_number =3D 0
>          self.min_test_prefix =3D ''
> +        self.config =3D None
> +        self.filenames =3D file_list
> +        self.props =3D {}
> +        self.config_fname =3D config_fname
> +        self.level_count =3D 0
> +        self.field_list =3D {}
> +
> +        with open(config_fname, 'r', encoding=3D'utf8') as handle:
> +            self.config =3D json.load(handle)
> +
> +            self.__add_field(None, 0, 0, self.config["fields"])
> +
> +            sublevel_count =3D [ 0 ] * self.level_count
> +
> +            for field, item in self.props.items():
> +                if "is_field" not in item["_properties_"]:
> +                    continue
> +                if "sublevel" in item["_properties_"]:
> +                    level =3D item["_properties_"]["level"]
> +                    sublevel_count[level - 1] +=3D 1
> +                if item["_properties_"]["is_field"]:
> +                    lc =3D field.lower()
> +                    self.field_list[lc] =3D field
> +                    pl =3D plural(lc)
> +                    if lc !=3D pl:
> +                        self.field_list[pl] =3D field
> +
> +            # Remove non-multilevel items, as we're only interested on
> +            # hierarchical item levels here
> +            for field, item in self.props.items():
> +                if "sublevel" in item["_properties_"]:
> +                    level =3D item["_properties_"]["level"]
> +                    if sublevel_count[level - 1] =3D=3D 1:
> +                        del item["_properties_"]["level"]
> +                        del item["_properties_"]["sublevel"]
> +            del self.props["_properties_"]
> +
> +            if not self.filenames:
> +                self.filenames =3D []
> +                files =3D self.config["files"]
> +                for f in files:
> +                    f =3D os.path.realpath(os.path.dirname(config_fname)=
) + "/" + f
> +                    for fname in glob.glob(f):
> +                        self.filenames.append(fname)
> +
> +        if not self.filenames:
> +            sys.exit("Need file names to be processed")
> +
> +        # Parse files, expanding wildcards
> +        field_re =3D re.compile(r"(" + '|'.join(self.field_list.keys()) =
+ r'):\s*(.*)', re.I)
> +
> +        for fname in self.filenames:
> +            self.__add_file_documentation(fname, field_re)
> =20
>      #
>      # ancillary methods
>      #
> =20
> -    def expand_subtest(self, fname, test_name, test):
> +    def __add_field(self, name, sublevel, hierarchy_level, field):
> +
> +        """ Flatten config fields into a non-hierarchical dictionary """
> +
> +        for key in field:
> +            if key not in self.props:
> +                self.props[key] =3D {}
> +                self.props[key]["_properties_"] =3D {}
> +
> +            if name:
> +                if key =3D=3D "_properties_":
> +                    if key not in self.props:
> +                        self.props[key] =3D {}
> +                    self.props[name][key].update(field[key])
> +
> +                    if "is_field" in self.props[name][key]:
> +                        if self.props[name][key]["is_field"]:
> +                            sublevel +=3D 1
> +                            hierarchy_level +=3D 1
> +                            if "sublevel" in self.props[name][key]:
> +                                if self.props[name][key]["sublevel"] !=
=3D sublevel:
> +                                    sys.exit(f"Error: config defined {na=
me} as sublevel {self.props[key]['sublevel']}, but wants to redefine as sub=
level {sublevel}")
> +
> +                            self.props[name][key]["level"] =3D self.leve=
l_count
> +                            self.props[name][key]["sublevel"] =3D sublev=
el
> +                    continue
> +            else:
> +                self.level_count +=3D 1
> +
> +            self.__add_field(key, sublevel, hierarchy_level, field[key])
> +
> +    def expand_subtest(self, fname, test_name, test, allow_inherit):
> =20
>          """Expand subtest wildcards providing an array with subtests"""
> =20
> @@ -145,11 +347,13 @@ class TestList:
>                      if k =3D=3D 'arg':
>                          continue
> =20
> -                    if self.doc[test]["subtest"][subtest][k] =3D=3D self=
.doc[test][k]:
> -                        continue
> +                    if not allow_inherit:
> +                        if k in self.doc[test] and self.doc[test]["subte=
st"][subtest][k] =3D=3D self.doc[test][k]:
> +                            continue
> =20
>                      subtest_dict[k] =3D self.doc[test]["subtest"][subtes=
t][k]
> -                    subtest_array.append(subtest_dict)
> +
> +                subtest_array.append(subtest_dict)
> =20
>                  continue
> =20
> @@ -210,8 +414,11 @@ class TestList:
> =20
>                      sub_field =3D self.doc[test]["subtest"][subtest][fie=
ld]
>                      sub_field =3D re.sub(r"%?\barg\[(\d+)\]", lambda m: =
arg_map[int(m.group(1)) - 1], sub_field) # pylint: disable=3DW0640
> -                    if sub_field =3D=3D self.doc[test][field]:
> -                        continue
> +
> +                    if not allow_inherit:
> +                        if field in self.doc[test]:
> +                            if sub_field in self.doc[test][field] and su=
b_field =3D=3D self.doc[test][field]:
> +                                continue
> =20
>                      subtest_dict[field] =3D sub_field
> =20
> @@ -232,14 +439,63 @@ class TestList:
> =20
>          return subtest_array
> =20
> +    def expand_dictionary(self, subtest_only):
> +
> +        """ prepares a dictionary with subtest arguments expanded """
> +
> +        test_dict =3D {}
> +
> +        for test in self.doc:                   # pylint: disable=3DC0206
> +            fname =3D self.doc[test]["File"]
> +
> +            name =3D re.sub(r'.*tests/', '', fname)
> +            name =3D re.sub(r'\.[ch]', '', name)
> +            name =3D "igt@" + name
> +
> +            if not subtest_only:
> +                test_dict[name] =3D {}
> +
> +                for field in self.doc[test]:
> +                    if field =3D=3D "subtest":
> +                        continue
> +                    if field =3D=3D "arg":
> +                        continue
> +
> +                    test_dict[name][field] =3D self.doc[test][field]
> +                dic =3D test_dict[name]
> +            else:
> +                dic =3D test_dict
> +
> +            subtest_array =3D self.expand_subtest(fname, name, test, sub=
test_only)
> +            for subtest in subtest_array:
> +                summary =3D subtest["Summary"]
> +
> +                dic[summary] =3D {}
> +                for field in sorted(subtest.keys()):
> +                    if field =3D=3D 'Summary':
> +                        continue
> +                    if field =3D=3D 'arg':
> +                        continue
> +                    dic[summary][field] =3D subtest[field]
> +
> +        return test_dict
> +
>      #
>      # Output methods
>      #
> =20
> -    def print_test(self):
> +    def print_rest_flat(self, filename):
> =20
>          """Print tests and subtests ordered by tests"""
> =20
> +        original_stdout =3D sys.stdout
> +        f =3D None
> +
> +        if filename:
> +            f =3D open(filename, "w", encoding=3D'utf8')
> +
> +            sys.stdout =3D f
> +
>          for test in sorted(self.doc.keys()):
>              fname =3D self.doc[test]["File"]
> =20
> @@ -260,7 +516,7 @@ class TestList:
> =20
>                  print(f":{field}: {self.doc[test][field]}")
> =20
> -            subtest_array =3D self.expand_subtest(fname, name, test)
> +            subtest_array =3D self.expand_subtest(fname, name, test, Fal=
se)
> =20
>              for subtest in subtest_array:
>                  print()
> @@ -281,6 +537,107 @@ class TestList:
>              print()
>              print()
> =20
> +        if f:
> +            f.close()
> +        sys.stdout =3D original_stdout
> +
> +    def print_nested_rest(self, filename):
> +
> +        """Print tests and subtests ordered by tests"""
> +
> +        original_stdout =3D sys.stdout
> +        f =3D None
> +
> +        if filename:
> +            f =3D open(filename, "w", encoding=3D'utf8')
> +
> +            sys.stdout =3D f
> +
> +        """Print tests and subtests using fields hierarchy"""
> +
> +        # Identify the sort order for the fields
> +        fields_order =3D []
> +        fields =3D sorted(self.props.items(), key =3D _sort_per_level)
> +        for item in fields:
> +            fields_order.append(item[0])
> +
> +        # Receives a flat subtest dictionary, with wildcards expanded
> +        subtest_dict =3D self.expand_dictionary(True)
> +
> +        subtests =3D sorted(subtest_dict.items(),
> +                          key =3D lambda x: _sort_using_array(x, fields_=
order))
> +
> +        # Use the level markers below
> +        level_markers=3D'=3D-^_~:.`"*+#'
> +
> +        # Print the data
> +        old_fields =3D [ '' ] * len(fields_order)
> +
> +        for subtest, fields in subtests:
> +            # Check what level has different message
> +            for cur_level in range(0, len(fields_order)):  # pylint: dis=
able=3DC0200
> +                field =3D fields_order[cur_level]
> +                if not "level" in self.props[field]["_properties_"]:
> +                    continue
> +                if field in fields:
> +                    if old_fields[cur_level] !=3D fields[field]:
> +                        break
> +
> +            # print hierarchy
> +            for i in range(cur_level, len(fields_order)):
> +                if not "level" in self.props[fields_order[i]]["_properti=
es_"]:
> +                    continue
> +                if not fields_order[i] in fields:
> +                    continue
> +                marker =3D self.props[fields_order[i]]["_properties_"]["=
sublevel"]
> +
> +                title_str =3D fields_order[i] + ": " + fields[fields_ord=
er[i]]
> +
> +                if marker >=3D len(level_markers):
> +                    sys.exit(f"Too many levels: {marker}, maximum limit =
is {len(level_markers):}")
> +
> +                print(title_str)
> +                print(level_markers[marker] * len(title_str))
> +                print()
> +
> +            print()
> +            print("``" + subtest + "``")
> +            print()
> +
> +            # print non-hierarchy fields
> +            for field in fields_order:
> +                if "level" in self.props[field]["_properties_"]:
> +                    continue
> +
> +                if field in fields:
> +                    print(f":{field}: {fields[field]}")
> +
> +            # Store current values
> +            for i in range(cur_level, len(fields_order)):
> +                field =3D fields_order[i]
> +                if not "level" in self.props[field]["_properties_"]:
> +                    continue
> +                if field in fields:
> +                    old_fields[i] =3D fields[field]
> +                else:
> +                    old_fields[i] =3D ''
> +
> +            print()
> +
> +        if f:
> +            f.close()
> +        sys.stdout =3D original_stdout
> +
> +    def print_json(self, out_fname):
> +
> +        """Adds the contents of test/subtest documentation form a file"""
> +
> +        # Receives a dictionary with tests->subtests with expanded subte=
sts
> +        test_dict =3D self.expand_dictionary(False)
> +
> +        with open(out_fname, "w", encoding=3D'utf8') as write_file:
> +            json.dump(test_dict, write_file, indent =3D 4)
> +
>      #
>      # Subtest list methods
>      #
> @@ -298,7 +655,7 @@ class TestList:
>              test_name =3D re.sub(r'\.[ch]', '', test_name)
>              test_name =3D "igt@" + test_name
> =20
> -            subtest_array =3D self.expand_subtest(fname, test_name, test)
> +            subtest_array =3D self.expand_subtest(fname, test_name, test=
, False)
> =20
>              for subtest in subtest_array:
>                  subtests.append(subtest["Summary"])
> @@ -318,14 +675,15 @@ class TestList:
>              doc_subtests[i] =3D re.sub(r'\<[^\>]+\>', r'\\d+', doc_subte=
sts[i])
> =20
>          # Get a list of tests from
> -        result =3D subprocess.run([ f"{IGT_BUILD_PATH}/{IGT_RUNNER}",  #=
 pylint: disable=3DW1510
> -                                "-L", "-t",  self.min_test_prefix,
> -                                f"{IGT_BUILD_PATH}/tests"],
> -                                capture_output =3D True, text =3D True)
> -        if result.returncode:
> -            print( result.stdout)
> -            print("Error:", result.stderr)
> -            sys.exit(result.returncode)
> +        try:
> +            result =3D subprocess.run([ f"{IGT_BUILD_PATH}/{IGT_RUNNER}",
> +                                    "-L", "-t",  self.min_test_prefix,
> +                                    f"{IGT_BUILD_PATH}/tests"], check =
=3D True,
> +                                    capture_output =3D True, text =3D Tr=
ue)
> +        except subprocess.CalledProcessError as sub_err:
> +            print(sub_err.stderr)
> +            print("Error:", sub_err)
> +            sys.exit(1)
> =20
>          run_subtests =3D sorted(result.stdout.splitlines())
> =20
> @@ -368,7 +726,7 @@ class TestList:
>      # File handling methods
>      #
> =20
> -    def add_file_documentation(self, fname, field_re):
> +    def __add_file_documentation(self, fname, field_re):
> =20
>          """Adds the contents of test/subtest documentation form a file"""
> =20
> @@ -443,7 +801,22 @@ class TestList:
>                      current_field =3D ''
>                      handle_section =3D 'subtest'
> =20
> +                    # subtests inherit properties from the tests
>                      self.doc[current_test]["subtest"][current_subtest] =
=3D {}
> +                    for field in self.doc[current_test].keys():
> +                        if field =3D=3D "arg":
> +                            continue
> +                        if field =3D=3D "summary":
> +                            continue
> +                        if field =3D=3D "File":
> +                            continue
> +                        if field =3D=3D "subtest":
> +                            continue
> +                        if field =3D=3D "_properties_":
> +                            continue
> +                        if field =3D=3D "Description":
> +                            continue
> +                        self.doc[current_test]["subtest"][current_subtes=
t][field] =3D self.doc[current_test][field]
> =20
>                      self.doc[current_test]["subtest"][current_subtest]["=
Summary"] =3D match.group(1)
>                      self.doc[current_test]["subtest"][current_subtest]["=
Description"] =3D ''
> @@ -459,7 +832,7 @@ class TestList:
> =20
>                  # It is a known section. Parse its contents
>                  if (match :=3D re.match(field_re, file_line)):
> -                    current_field =3D match.group(1).lower().capitalize()
> +                    current_field =3D self.field_list[match.group(1).low=
er()]
>                      match_val =3D match.group(2)
> =20
>                      if handle_section =3D=3D 'test':
> @@ -506,17 +879,19 @@ class TestList:
> =20
>                  if (match :=3D re.match(r'^(.*):', file_line)):
>                      sys.exit(f"{fname}:{file_ln + 1}: Error: unrecognize=
d field '%s'. Need to add at %s" %
> -                            (match.group(1), fname))
> +                            (match.group(1), self.config_fname))
> =20
>                  # Handle multi-line field contents
>                  if current_field:
>                      if (match :=3D re.match(r'\s*(.*)', file_line)):
>                          if handle_section =3D=3D 'test':
> -                            self.doc[current_test][current_field] +=3D "=
 " + \
> -                                match.group(1)
> +                            dic =3D self.doc[current_test]
>                          else:
> -                            self.doc[current_test]["subtest"][current_su=
btest][current_field] +=3D " " + \
> -                                match.group(1)
> +                            dic =3D self.doc[current_test]["subtest"][cu=
rrent_subtest]
> +
> +                        if dic[current_field] !=3D '':
> +                            dic[current_field] +=3D " "
> +                        dic[current_field] +=3D match.group(1)
> =20
>                      continue
> =20
> @@ -529,8 +904,9 @@ class TestList:
>                          if match:
>                              self.doc[current_test]["arg"][arg_ref][cur_a=
rg][cur_arg_element] =3D match.group(1) + ' ' + match_val + ">"
>                          else:
> -                            self.doc[current_test]["arg"][arg_ref][cur_a=
rg][cur_arg_element] +=3D ' ' + match_val
> -
> +                            if self.doc[current_test]["arg"][arg_ref][cu=
r_arg][cur_arg_element] !=3D '':
> +                                self.doc[current_test]["arg"][arg_ref][c=
ur_arg][cur_arg_element] +=3D ' '
> +                            self.doc[current_test]["arg"][arg_ref][cur_a=
rg][cur_arg_element] +=3D match_val
>                      continue
> =20
>  #
> @@ -540,8 +916,14 @@ class TestList:
>  parser =3D argparse.ArgumentParser(description =3D "Print formatted kern=
el documentation to stdout.",
>                                   formatter_class =3D argparse.ArgumentDe=
faultsHelpFormatter,
>                                   epilog =3D 'If no action specified, ass=
ume --rest.')
> -parser.add_argument("--rest", action=3D"store_true",
> -                    help=3D"Generate documentation from the source files=
, in ReST file format.")
> +parser.add_argument("--config", required =3D True,
> +                    help=3D"JSON file describing the test plan template")
> +parser.add_argument("--rest",
> +                    help=3D"Output documentation from the source files i=
n REST file.")
> +parser.add_argument("--per-test", action=3D"store_true",
> +                    help=3D"Modifies ReST output to print subtests per t=
est.")
> +parser.add_argument("--to-json",
> +                    help=3D"Output test documentation in JSON format as =
TO_JSON file")
>  parser.add_argument("--show-subtests", action=3D"store_true",
>                      help=3D"Shows the name of the documented subtests in=
 alphabetical order.")
>  parser.add_argument("--check-testlist", action=3D"store_true",
> @@ -549,17 +931,12 @@ parser.add_argument("--check-testlist", action=3D"s=
tore_true",
>  parser.add_argument("--igt-build-path",
>                      help=3D"Path where the IGT runner is sitting. Used b=
y --check-testlist.",
>                      default=3DIGT_BUILD_PATH)
> -parser.add_argument('--files', nargs=3D'+', required=3DTrue,
> +parser.add_argument('--files', nargs=3D'+',
>                      help=3D"File name(s) to be processed")
> =20
>  parse_args =3D parser.parse_args()
> =20
> -field_regex =3D re.compile(r"(" + '|'.join(fields) + r'):\s*(.*)', re.I)
> -
> -tests =3D TestList()
> -
> -for filename in parse_args.files:
> -    tests.add_file_documentation(filename, field_regex)
> +tests =3D TestList(parse_args.config, parse_args.files)
> =20
>  RUN =3D 0
>  if parse_args.show_subtests:
> @@ -571,5 +948,12 @@ if parse_args.check_testlist:
>      RUN =3D 1
>      tests.check_tests()
> =20
> +if parse_args.to_json:
> +    RUN =3D 1
> +    tests.print_json(parse_args.to_json)
> +
>  if not RUN or parse_args.rest:
> -    tests.print_test()
> +    if parse_args.per_test:
> +        tests.print_rest_flat(parse_args.rest)
> +    else:
> +        tests.print_nested_rest(parse_args.rest)
> diff --git a/scripts/meson.build b/scripts/meson.build
> index 342972e660..9ab3376e84 100644
> --- a/scripts/meson.build
> +++ b/scripts/meson.build
> @@ -11,3 +11,5 @@ if build_tests
>  		install_data(prog, install_dir : bindir, install_mode : 'r-xr-xr-x')
>  	endforeach
>  endif
> +
> +igt_doc_script =3D find_program('igt_doc.py')
