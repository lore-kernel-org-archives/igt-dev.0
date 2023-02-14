Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25E9C10E8BA
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Feb 2023 12:23:24 +0000 (UTC)
Date: Tue, 14 Feb 2023 13:23:20 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Zbigniew =?UTF-8?B?S2VtcGN6ecWEc2tp?= <zbigniew.kempczynski@intel.com>
Message-ID: <20230214132320.6575b3cd@maurocar-mobl2>
In-Reply-To: <20230213085217.br2yosw3con23ht4@zkempczy-mobl2>
References: <20230209115712.3240666-1-mauro.chehab@linux.intel.com>
 <20230209115712.3240666-2-mauro.chehab@linux.intel.com>
 <20230213085217.br2yosw3con23ht4@zkempczy-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/1] scripts:igt-doc.py: add a parser
 to document tests inlined
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

On Mon, 13 Feb 2023 09:52:17 +0100
Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com> wrote:

> On Thu, Feb 09, 2023 at 12:57:12PM +0100, Mauro Carvalho Chehab wrote:
> > From: Mauro Carvalho Chehab <mchehab@kernel.org>
> >=20
> > Tests need to be documentation, as otherwise its goal will be
> > lost with time. Keeping documentation out of the sources is also
> > not such a good idea, as they tend to bitrot.
> >=20
> > So, add a script to allow keeping the documentation inlined, and
> > add tools to verify if the documentation has gaps.
> >=20
> > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> > ---
> >  scripts/igt_doc.py | 487 +++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 487 insertions(+)
> >  create mode 100755 scripts/igt_doc.py
> >=20
> > diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
> > new file mode 100755
> > index 000000000000..292d99c1ef92
> > --- /dev/null
> > +++ b/scripts/igt_doc.py
> > @@ -0,0 +1,487 @@
> > +#!/usr/bin/env python3
> > +# pylint: disable=3DC0301,R0914,R0912,R0915
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +## Copyright (C) 2023    Intel Corporation                 ##
> > +## Author: Mauro Carvalho Chehab <mchehab@kernel.org>      ##
> > +##                                                         ##
> > +## Allow keeping inlined test documentation and validate   ##
> > +## if the documentation is kept updated.                   ##
> > +
> > +"""Maintain test plan and test implementation documentation on IGT."""
> > +
> > +import argparse
> > +import fileinput
> > +import re
> > +import subprocess
> > +import sys
> > +
> > +IGT_BUILD_PATH =3D 'build/'
> > +IGT_RUNNER =3D '/runner/igt_runner'
> > +
> > +# Fields that mat be inside TEST and SUBTEST macros
> > +fields =3D [
> > +    'Category',       # Hardware building block / Software building bl=
ock / ...
> > +    'Sub-category',   # waitfence / dmabuf/ sysfs / debugfs / ...
> > +    'Coverered functionality', # basic test / ...
> > +    'Test type',      # functionality test / pereformance / stress
> > +    'Run type',       # BAT / workarouds / stress / developer-specific=
 / ...
> > +    'Issues?',        # Bug tracker issue(s)
> > +    'Platforms?',     # all / DG1 / DG2 / TGL / MTL / PVC / ATS-M / ..=
. =20
>=20
> I think plurar form is enough. Anyway according to our discussion implicit
> use of Platforms would need to touch all the tests when new platform will
> be added.

I'll keep just one form here.

>=20
> I agree with your that 'Excluded Platforms' is much better because we can
> add new platform without touching source code.
>=20
> > +    'Platform requirements?',  # Any other specific platform requireme=
nts
> > +    'Depends on',     # some other IGT test, like igt@test@subtes
> > +    'Requirements?',  # other non-platform requirements
> > +    'Description']    # Description of the test
> > +
> > +#
> > +# Expand subtests
> > +#
> > +
> > +class TestList:
> > +    """Parse and handle test lists with test/subtest documentation."""
> > +    def __init__(self):
> > +        self.doc =3D {}
> > +        self.test_number =3D 0
> > +        self.min_test_prefix =3D ''
> > +
> > +    def expand_subtest(self, fname, test_name, test):
> > +        """Expand subtest wildcards providing an array with subtests"""
> > +        subtest_array =3D []
> > +
> > +        for subtest in self.doc[test]["subtest"].keys():
> > +            summary =3D test_name + '@' + self.doc[test]["subtest"][su=
btest]["Summary"]
> > +
> > +            if not summary:
> > +                continue
> > +
> > +            num_vars =3D summary.count('%')
> > +
> > +            if num_vars =3D=3D 0:
> > +                subtest_dict =3D {}
> > +
> > +                # Trivial case: no need to expand anything
> > +                subtest_dict["Summary"] =3D summary
> > +
> > +                for k in sorted(self.doc[test]["subtest"][subtest].key=
s()):
> > +                    if k =3D=3D 'Summary':
> > +                        continue
> > +                    if k =3D=3D 'arg':
> > +                        continue
> > +
> > +                    if self.doc[test]["subtest"][subtest][k] =3D=3D se=
lf.doc[test][k]:
> > +                        continue
> > +
> > +                    subtest_dict[k] =3D self.doc[test]["subtest"][subt=
est][k]
> > +                    subtest_array.append(subtest_dict)
> > +
> > +                continue
> > +
> > +            # Handle summaries with wildcards
> > +
> > +            # Convert arguments into an array
> > +            arg_array =3D {}
> > +            arg_ref =3D self.doc[test]["subtest"][subtest]["arg"]
> > +
> > +            for arg_k in self.doc[test]["arg"][arg_ref].keys():
> > +                arg_array[arg_k] =3D []
> > +                if int(arg_k) > num_vars:
> > +                    continue
> > +
> > +                for arg_el in sorted(self.doc[test]["arg"][arg_ref][ar=
g_k].keys()):
> > +                    arg_array[arg_k].append(arg_el)
> > +
> > +            size =3D len(arg_array)
> > +
> > +            if size < num_vars:
> > +                sys.exit(f"{fname}:subtest {summary} needs {num_vars} =
arguments but only {size} are defined.")
> > +
> > +            for j in range(0, num_vars):
> > +                if arg_array[j] is None:
> > +                    sys.exit(f"{fname}:subtest{summary} needs arg[{j}]=
, but this is not defined.")
> > +
> > +
> > +            # convert numeric wildcards to string ones
> > +            summary =3D re.sub(r'%(d|ld|lld|i|u|lu|llu)','%s', summary)
> > +
> > +            pos =3D [ 0 ] * num_vars
> > +            args =3D [ 0 ] * num_vars
> > +            arg_map =3D [ 0 ] * num_vars
> > +
> > +            while 1:
> > +                for j in range(0, num_vars):
> > +                    arg_val =3D arg_array[j][pos[j]]
> > +                    args[j] =3D arg_val
> > +
> > +                    if arg_val in self.doc[test]["arg"][arg_ref][j]:
> > +                        arg_map[j] =3D self.doc[test]["arg"][arg_ref][=
j][arg_val]
> > +                        if re.match(r"\<.*\>", self.doc[test]["arg"][a=
rg_ref][j][arg_val]):
> > +                            args[j] =3D "<" + arg_val + ">"
> > +                    else:
> > +                        arg_map[j] =3D arg_val =20
>=20
> That's most complicated part. Have you considered using itertools.product=
()?

This is complex, but I don't think using product() would help.

See, this function is not a simple product, as it not only expands
the wildcards, but it is also meant to replace "arg[n]" occurrences
inside Description and other fields.

We might use a lambda function, but this won't make the function
simpler, as the same logic that it is here would need to be inside
the lambda function, which, IMO, it would make it even harder to
understand.

> > +        with open(fname, 'r', encoding=3D'utf8') as handle:
> > +            arg_ref =3D None
> > +            current_test =3D ''
> > +            subtest_number =3D 0
> > +
> > +            for file_line in handle:
> > +                if re.match(r'^\s*\*$', file_line):
> > +                    continue
> > +
> > +                if re.match(r'^\s*\*/$', file_line):
> > +                    handle_section =3D ''
> > +                    current_subtest =3D None
> > +                    arg_ref =3D None
> > +                    cur_arg =3D -1
> > +
> > +                    continue
> > +
> > +                if re.match(r'^\s*/\*\*$', file_line):
> > +                    handle_section =3D '1'
> > +                    continue
> > +
> > +                if not handle_section:
> > +                    continue
> > +
> > +                file_line =3D re.sub(r'^\s*\*\s*', '', file_line)
> > +
> > +                # Handle only known sections
> > +                if handle_section =3D=3D '1':
> > +                    current_field =3D ''
> > +
> > +                    # Check if it is a new TEST section
> > +                    if (match :=3D re.match(r'^TEST:\s*(.*)', file_lin=
e)):
> > +                        current_test =3D self.test_number
> > +                        self.test_number +=3D 1
> > +
> > +                        handle_section =3D 'test'
> > +
> > +                        self.doc[current_test] =3D {}
> > +                        self.doc[current_test]["arg"] =3D {}
> > +                        self.doc[current_test]["Summary"] =3D match.gr=
oup(1)
> > +                        self.doc[current_test]["File"] =3D fname
> > +                        self.doc[current_test]["subtest"] =3D {}
> > +                        current_subtest =3D None
> > +
> > +                        continue
> > +
> > +                # Check if it is a new SUBTEST section
> > +                if (match :=3D re.match(r'^SUBTESTS?:\s*(.*)', file_li=
ne)):
> > +                    current_subtest =3D subtest_number
> > +                    subtest_number +=3D 1
> > +
> > +                    current_field =3D ''
> > +                    handle_section =3D 'subtest'
> > +
> > +                    self.doc[current_test]["subtest"][current_subtest]=
 =3D {}
> > +
> > +                    self.doc[current_test]["subtest"][current_subtest]=
["Summary"] =3D match.group(1)
> > +                    self.doc[current_test]["subtest"][current_subtest]=
["Description"] =3D ''
> > +
> > +                    if not arg_ref:
> > +                        arg_ref =3D arg_number
> > +                        arg_number +=3D 1
> > +                        self.doc[current_test]["arg"][arg_ref] =3D {}
> > +
> > +                    self.doc[current_test]["subtest"][current_subtest]=
["arg"] =3D arg_ref
> > +
> > +                    continue
> > +
> > +                # It is a known section. Parse its contents
> > +                if (match :=3D re.match(field_re, file_line)):
> > +                    current_field =3D match.group(1).lower().capitaliz=
e()
> > +                    match_val =3D match.group(2)
> > +
> > +                    if handle_section =3D=3D 'test':
> > +                        self.doc[current_test][current_field] =3D matc=
h_val
> > +                    else:
> > +                        self.doc[current_test]["subtest"][current_subt=
est][current_field] =3D match_val
> > +
> > +                    cur_arg =3D -1
> > +
> > +                    continue
> > +
> > +                # Use hashes for arguments to avoid duplication
> > +                if (match :=3D re.match(r'arg\[(\d+)\]:\s*(.*)', file_=
line)):
> > +                    current_field =3D ''
> > +                    if arg_ref is None:
> > +                        sys.exit(f"{fname}:{fileinput.filelineno()}: a=
rguments should be defined after one or more subtests, at the same comment")
> > +
> > +                    cur_arg =3D int(match.group(1)) - 1
> > +                    if cur_arg not in self.doc[current_test]["arg"][ar=
g_ref]:
> > +                        self.doc[current_test]["arg"][arg_ref][cur_arg=
] =3D {}
> > +
> > +                    cur_arg_element =3D match.group(2)
> > +
> > +                    if match.group(2):
> > +                        # Should be used only for numeric values
> > +                        self.doc[current_test]["arg"][arg_ref][cur_arg=
][cur_arg_element] =3D "<" + match.group(2) + ">"
> > +
> > +                    continue =20
>=20
> Above section introduces arg[] syntax which is not trivial to understand
> from the source code itself. I think adding dedicated readme or explanati=
on
> in the commit message is a must. Especially cases when you have more than
> single arg[] (I wondered does it will do produce is in separate method).

I'll add an explanation at the class docstring.

> Imo your change requires to be reviewed by CI team. It introduced alterna=
tive
> form of tracking tests (via comments) which might in the future help to p=
roduce
> testlists. That discrepancy (you're validating this with using igt_runner)
> might be an issue in the future.

I don't see how this would be an issue. The goal here is really to
document the tests, and not to provide any sort of automation for
running them on CI.

Ok, in the future such documents could be used to generate testlists, but
this is not trivial, specially for tests that use "%d" wildcards.

> Have you considered to extend igt_subtest.*(), igt_describe()? I mean
> all fields you're proposing could be provided with multivalue function.
> Great of pros of such attitude would be 1:1 consistence betweeen test/sub=
test
> names and documentation field you've proposed. In this case extracting
> documentation would require to run runner what is cons due to execution
> time (but we're already getting testplans this way).

On contrary of more modern languages where you can even embed documentation
in a way that the language interpreter would parse, C was not conceived to=
=20
contain descriptions inside its code. Extending igt_subtest macro would
require changes on all already-existing code, which would be a nightmare.

If we end adding a newer macro (igt_subtest_documented), nothing would
prevent that newer tests will keep using the old macros.

Also, each subtest may have its own:

    'Category'
    'Sub-category'
    'Functionality'
    'Test category'
    'Run type'
    'Issue'
    'GPU excluded platforms'
    'GPU requirements'
    'Depends on'
    'Test requirements'
    'Description'

Or may just inherit them from the test. Inherit properties from a
class is something that C doesn't handle too well.

So, it doesn't sound a good idea. The best is really to place comments
as C comments, and then process them externally.

Regards,
Mauro
