Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A038110E07C
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Sep 2023 08:52:15 +0000 (UTC)
Date: Mon, 11 Sep 2023 10:51:54 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230911085154.nmreohnqdlib7v6r@kamilkon-desk.igk.intel.com>
References: <20230908083734.1084351-1-mauro.chehab@linux.intel.com>
 <20230908083734.1084351-2-mauro.chehab@linux.intel.com>
 <20230908174739.5p5x34ubwecpfyee@kamilkon-desk.igk.intel.com>
 <20230908211915.50b09a0f@maurocar-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230908211915.50b09a0f@maurocar-mobl2>
Subject: Re: [igt-dev] [PATCH i-g-t v4 01/11] test_list.py: add support for
 reading testlist regular expressions
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi Mauro,

On 2023-09-08 at 21:19:15 +0200, Mauro Carvalho Chehab wrote:
> On Fri, 8 Sep 2023 19:47:39 +0200
> Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:
> 
> > Hi Mauro,
> > On 2023-09-08 at 10:27:37 +0200, Mauro Carvalho Chehab wrote:
> > > From: Mauro Carvalho Chehab <mchehab@kernel.org>
> > > 
> > > If defined, use testlist and blocklist files to update the
> > > fields that use it.
> > > 
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Are you meant to add your A-B/R-B here or do a comment?
> 
> Can't see anything on this reply :-)

You are right, I was thinking I did write r-b here but as you
pointed it I forgot, feel free to add my r-b to v5 of this series,

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> 
> > > ---
> > >  scripts/test_list.py | 75 ++++++++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 75 insertions(+)
> > > 
> > > diff --git a/scripts/test_list.py b/scripts/test_list.py
> > > index 2171f8b50617..c1518a904baf 100644
> > > --- a/scripts/test_list.py
> > > +++ b/scripts/test_list.py
> > > @@ -260,6 +260,8 @@ class TestList:
> > >          self.igt_build_path = igt_build_path
> > >          self.level_count = 0
> > >          self.field_list = {}
> > > +        self.testlist = {}
> > > +        self.blocklist = {}
> > >          self.title = None
> > >          self.filters = {}
> > >          self.subtest_separator = subtest_separator
> > > @@ -327,6 +329,23 @@ class TestList:
> > >                  if sublevel_count[level - 1] == 1:
> > >                      del item["_properties_"]["level"]
> > >                      del item["_properties_"]["sublevel"]
> > > +
> > > +            # Read testlist files if any
> > > +            if "testlists" in item["_properties_"]:
> > > +                testlist = {}
> > > +                for name in item["_properties_"]["testlists"].keys():
> > > +                    self.read_testlist(testlist, name, cfg_path + item["_properties_"]["testlists"][name])
> > > +
> > > +                item["_properties_"]["testlist"] = testlist
> > > +
> > > +            # Read blocklist files if any
> > > +            if "blocklists" in item["_properties_"]:
> > > +                blocklist = {}
> > > +                for name in item["_properties_"]["blocklists"].keys():
> > > +                    self.read_testlist(blocklist, name, cfg_path + item["_properties_"]["blocklists"][name])
> > > +
> > > +                item["_properties_"]["blocklist"] = blocklist
> > > +
> > >          if "_properties_" in self.props:
> > >              del self.props["_properties_"]
> > >  
> > > @@ -427,6 +446,19 @@ class TestList:
> > >  
> > >              self.__add_field(key, sublevel, hierarchy_level, field[key])
> > >  
> > > +    def read_testlist(self, testlist, name, filename):
> > > +        base = r"^\s*({}[^\s\{}]+)(\S*)\s*(\#.*)?$"
> > > +        regex = re.compile(base.format(self.main_name, self.subtest_separator))
> > > +
> > > +        testlist[name] = []
> > > +        with open(filename, 'r', newline = '', encoding = 'utf8') as fp:
> > > +            for line in fp:
> > > +                match = regex.match(line)
> > > +                if match:
> > > +                    test = match.group(1)
> > > +                    subtest = match.group(2)
> > > +                    testlist[name].append(re.compile(f"{test}{subtest}"))
> > > +
> > >      def __filter_subtest(self, test, subtest, field_not_found_value):
> > >  
> > >          """ Apply filter criteria to subtests """
> > > @@ -444,6 +476,45 @@ class TestList:
> > >          # None of the filtering rules were applied
> > >          return False
> > >  
> > > +    def update_testlist_field(self, subtest_dict):
> > > +        for field in self.props.keys():
> > > +            if "_properties_" not in self.props[field]:
> > > +                continue
> > > +
> > > +            if "testlist" not in self.props[field]["_properties_"]:
> > > +                continue
> > > +
> > > +            testname = subtest_dict["_summary_"]
> > > +
> > > +            value = subtest_dict.get(field)
> > > +            if value:
> > > +                values = set(re.split(",\s*", value))
> > > +            else:
> > > +                values = set()
> > > +
> > > +            for names, regex_array in self.props[field]["_properties_"]["testlist"].items():
> > > +                name = set(re.split(",\s*", names))
> > > +                for regex in regex_array:
> > > +                    if regex.match(testname):
> > > +                        values.update(name)
> > > +                        break
> > > +
> > > +            # If test is at a global blocklist, ignore it
> > > +            set_full_if_empty = True
> > > +            if "blocklist" in self.props[field]["_properties_"]:
> > > +                for names, regex_array in self.props[field]["_properties_"]["testlist"].items():
> > > +                    deleted_names = set(re.split(",\s*", names))
> > > +                    for regex in regex_array:
> > > +                        if regex.match(testname):
> > > +                            if sorted(deleted_names) == sorted(values):
> > > +                                set_full_if_empty = False
> > > +                            values.discard(deleted_names)
> > > +
> > > +            if set_full_if_empty and not values:
> > > +                values = set(["FULL"])
> > > +
> > > +            subtest_dict[field] = ", ".join(sorted(values))
> > > +
> > >      def expand_subtest(self, fname, test_name, test, allow_inherit, with_lines = False, with_subtest_nr = False):
> > >  
> > >          """Expand subtest wildcards providing an array with subtests"""
> > > @@ -476,6 +547,8 @@ class TestList:
> > >  
> > >                      subtest_dict[k] = self.doc[test]["subtest"][subtest][k]
> > >  
> > > +                self.update_testlist_field(subtest_dict)
> > > +
> > >                  if with_lines:
> > >                      subtest_dict["line"] = file_ln
> > >  
> > > @@ -549,6 +622,8 @@ class TestList:
> > >  
> > >                      subtest_dict[field] = sub_field
> > >  
> > > +                self.update_testlist_field(subtest_dict)
> > > +
> > >                  if with_lines:
> > >                      subtest_dict["line"] = file_ln
> > >  
> > > -- 
> > > 2.41.0
> > >   

