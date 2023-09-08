Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42D2A10E056
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Sep 2023 08:15:04 +0000 (UTC)
Date: Fri, 8 Sep 2023 10:14:59 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230908101459.2cc2b026@maurocar-mobl2>
In-Reply-To: <20230907121921.766n7zyuxmpmpztp@kamilkon-desk.igk.intel.com>
References: <20230907101852.522819-1-mauro.chehab@linux.intel.com>
 <20230907101852.522819-2-mauro.chehab@linux.intel.com>
 <20230907121921.766n7zyuxmpmpztp@kamilkon-desk.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v3 1/7] test_list.py: add support for
 reading testlist regular expressions
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, tomasz.mistat@intel.com,
 jari.tahvanainen@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, 7 Sep 2023 14:19:21 +0200
Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:

> Hi Mauro,
> 
> On 2023-09-07 at 12:17:32 +0200, Mauro Carvalho Chehab wrote:
> > From: Mauro Carvalho Chehab <mchehab@kernel.org>
> > 
> > If defined, use testlist and blocklist files to update the
> > fields that use it.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> > ---
> >  scripts/test_list.py | 75 ++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 75 insertions(+)
> > 
> > diff --git a/scripts/test_list.py b/scripts/test_list.py
> > index 2171f8b50617..c1518a904baf 100644
> > --- a/scripts/test_list.py
> > +++ b/scripts/test_list.py
> > @@ -260,6 +260,8 @@ class TestList:
> >          self.igt_build_path = igt_build_path
> >          self.level_count = 0
> >          self.field_list = {}
> > +        self.testlist = {}
> > +        self.blocklist = {}
> >          self.title = None
> >          self.filters = {}
> >          self.subtest_separator = subtest_separator
> > @@ -327,6 +329,23 @@ class TestList:
> >                  if sublevel_count[level - 1] == 1:
> >                      del item["_properties_"]["level"]
> >                      del item["_properties_"]["sublevel"]
> > +
> > +            # Read testlist files if any
> > +            if "testlists" in item["_properties_"]:
> > +                testlist = {}
> > +                for name in item["_properties_"]["testlists"].keys():
> > +                    self.read_testlist(testlist, name, cfg_path + item["_properties_"]["testlists"][name])
> > +
> > +                item["_properties_"]["testlist"] = testlist
> > +
> > +            # Read blocklist files if any
> > +            if "blocklists" in item["_properties_"]:
> > +                blocklist = {}
> > +                for name in item["_properties_"]["blocklists"].keys():
> > +                    self.read_testlist(blocklist, name, cfg_path + item["_properties_"]["blocklists"][name])  
> 
> May you read this in separate function? It is often regex,
> not igt@testname@subtest-name, for example:
> 
> igt@gem_concurrent_blit(@.*)?
> 
> igt@.*@.*-hibernate

The content of item["_properties_"]["blocklists"] is file names. Those
are defined inside the JSON config file.

The contenf of the file is indeed regular expressions. The
read_testlist() function handles that...

> 
> Regards,
> Kamil
> 
> > +
> > +                item["_properties_"]["blocklist"] = blocklist
> > +
> >          if "_properties_" in self.props:
> >              del self.props["_properties_"]
> >  
> > @@ -427,6 +446,19 @@ class TestList:
> >  
> >              self.__add_field(key, sublevel, hierarchy_level, field[key])
> >  
> > +    def read_testlist(self, testlist, name, filename):
> > +        base = r"^\s*({}[^\s\{}]+)(\S*)\s*(\#.*)?$"
> > +        regex = re.compile(base.format(self.main_name, self.subtest_separator))

... here, compiling them to speed up the per-test check later on, when
processing the field(s) that define testlist/blocklist filenames.

> > +
> > +        testlist[name] = []
> > +        with open(filename, 'r', newline = '', encoding = 'utf8') as fp:
> > +            for line in fp:
> > +                match = regex.match(line)
> > +                if match:
> > +                    test = match.group(1)
> > +                    subtest = match.group(2)
> > +                    testlist[name].append(re.compile(f"{test}{subtest}"))
> > +
> >      def __filter_subtest(self, test, subtest, field_not_found_value):
> >  
> >          """ Apply filter criteria to subtests """
> > @@ -444,6 +476,45 @@ class TestList:
> >          # None of the filtering rules were applied
> >          return False
> >  
> > +    def update_testlist_field(self, subtest_dict):
> > +        for field in self.props.keys():
> > +            if "_properties_" not in self.props[field]:
> > +                continue
> > +
> > +            if "testlist" not in self.props[field]["_properties_"]:
> > +                continue
> > +
> > +            testname = subtest_dict["_summary_"]
> > +
> > +            value = subtest_dict.get(field)
> > +            if value:
> > +                values = set(re.split(",\s*", value))
> > +            else:
> > +                values = set()
> > +
> > +            for names, regex_array in self.props[field]["_properties_"]["testlist"].items():
> > +                name = set(re.split(",\s*", names))
> > +                for regex in regex_array:
> > +                    if regex.match(testname):
> > +                        values.update(name)
> > +                        break
> > +
> > +            # If test is at a global blocklist, ignore it
> > +            set_full_if_empty = True
> > +            if "blocklist" in self.props[field]["_properties_"]:
> > +                for names, regex_array in self.props[field]["_properties_"]["testlist"].items():
> > +                    deleted_names = set(re.split(",\s*", names))
> > +                    for regex in regex_array:
> > +                        if regex.match(testname):
> > +                            if sorted(deleted_names) == sorted(values):
> > +                                set_full_if_empty = False
> > +                            values.discard(deleted_names)
> > +
> > +            if set_full_if_empty and not values:
> > +                values = set(["FULL"])
> > +
> > +            subtest_dict[field] = ", ".join(sorted(values))
> > +
> >      def expand_subtest(self, fname, test_name, test, allow_inherit, with_lines = False, with_subtest_nr = False):
> >  
> >          """Expand subtest wildcards providing an array with subtests"""
> > @@ -476,6 +547,8 @@ class TestList:
> >  
> >                      subtest_dict[k] = self.doc[test]["subtest"][subtest][k]
> >  
> > +                self.update_testlist_field(subtest_dict)
> > +
> >                  if with_lines:
> >                      subtest_dict["line"] = file_ln
> >  
> > @@ -549,6 +622,8 @@ class TestList:
> >  
> >                      subtest_dict[field] = sub_field
> >  
> > +                self.update_testlist_field(subtest_dict)
> > +
> >                  if with_lines:
> >                      subtest_dict["line"] = file_ln
> >  
> > -- 
> > 2.41.0
> >   
