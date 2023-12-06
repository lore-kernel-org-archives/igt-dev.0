Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C301910E71F
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Dec 2023 13:13:35 +0000 (UTC)
Date: Wed, 6 Dec 2023 14:13:31 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20231206131331.3jslx4c4knnrphbj@kamilkon-desk.igk.intel.com>
References: <c4d830023b60b1bc2c09d1383230afabe445248e.1701693214.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c4d830023b60b1bc2c09d1383230afabe445248e.1701693214.git.mchehab@kernel.org>
Subject: Re: [igt-dev] [PATCH] scripts/test_list.py: better identify planned
 tests
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
On 2023-12-04 at 13:33:35 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> When planned tests are used, use a different start tag for
> planned tests.
-- ^^^^^^^^^^^
s/planned tests./them./

Add here also what is intended useage and example how/where such
planned tests will be annotated, would it be in test description
or in ci testlist?

With that
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  scripts/test_list.py | 55 ++++++++++++++++++++++++++++++--------------
>  1 file changed, 38 insertions(+), 17 deletions(-)
> 
> diff --git a/scripts/test_list.py b/scripts/test_list.py
> index 7e0e45ca3732..eeb452091fbf 100644
> --- a/scripts/test_list.py
> +++ b/scripts/test_list.py
> @@ -249,7 +249,8 @@ class TestList:
>                   igt_build_path = None,
>                   config_dict = None, sources_path = None,
>                   test_tag = "TEST", subtest_tag = "SUBTESTS?",
> -                 main_name = "igt", subtest_separator = "@"):
> +                 main_name = "igt", planned_name = "planned",
> +                 subtest_separator = "@"):
>          self.doc = {}
>          self.test_number = 0
>          self.config = None
> @@ -262,7 +263,9 @@ class TestList:
>          self.title = None
>          self.filters = {}
>          self.subtest_separator = subtest_separator
> -        self.main_name = main_name
> +
> +        # Set a default value
> +        driver_name = main_name
>  
>          self.internal_fields =  [ '_summary_', '_arg_', '_subtest_line_' ]
>  
> @@ -270,8 +273,11 @@ class TestList:
>          if bool(config_fname) == bool(config_dict):
>              sys.exit("Error: either config filename or config dict shall be used")
>  
> -        if self.main_name:
> -            self.main_name += subtest_separator
> +        if main_name:
> +            main_name += subtest_separator
> +
> +        if planned_name:
> +            planned_name += subtest_separator
>  
>          implemented_class = None
>  
> @@ -287,7 +293,6 @@ class TestList:
>              self.config = config_dict
>              config_origin = "config dict"
>              cfg_path = "./"
> -            driver_name = main_name
>  
>          if "drivers" in self.config:
>              self.drivers = self.config["drivers"]
> @@ -341,7 +346,9 @@ class TestList:
>                          for name in value.keys():
>                              match_type = update.get("include-type", "subtest-match")
>  
> -                            self.read_testlist(match_type, field, testlist, name, cfg_path + value[name])
> +                            self.read_testlist(match_type, main_name, field,
> +                                               testlist, name,
> +                                               cfg_path + value[name])
>  
>                      update["include"] = testlist
>  
> @@ -352,7 +359,9 @@ class TestList:
>                          for name in value.keys():
>                              match_type = update.get("exclude-type", "subtest-match")
>  
> -                            self.read_testlist(match_type, field, testlist, name, cfg_path + value[name])
> +                            self.read_testlist(match_type, main_name, field,
> +                                               testlist, name,
> +                                               cfg_path + value[name])
>  
>                      update["exclude"] = testlist
>  
> @@ -414,12 +423,14 @@ class TestList:
>              if fname == '':
>                  continue
>  
> -            self.__add_file_documentation(fname, implemented_class, field_re,
> +            self.__add_file_documentation(fname, main_name,
> +                                          implemented_class, field_re,
>                                            test_tag, subtest_tag, config_origin)
>  
>          if include_plan:
>              for fname in self.plan_filenames:
> -                self.__add_file_documentation(fname, planned_class, field_re,
> +                self.__add_file_documentation(fname, planned_name,
> +                                              planned_class, field_re,
>                                                test_tag, subtest_tag, config_origin)
>  
>      #
> @@ -456,9 +467,15 @@ class TestList:
>  
>              self.__add_field(key, sublevel, hierarchy_level, field[key])
>  
> -    def read_testlist(self, match_type, field, testlist, name, filename):
> +    def read_testlist(self, match_type, base_name, field, testlist,
> +                      name, filename):
>  
> -        """ Read a list of tests with a common value from a file"""
> +        """
> +        Read a list of tests with a common value from a file.
> +
> +        Tests on this list are matched only for actual tests, not
> +        for planned ones.
> +        """
>  
>          match_type_regex = set(["regex", "regex-ignorecase"])
>          match_type_str = set(["subtest-match"])
> @@ -473,7 +490,7 @@ class TestList:
>              flags = re.IGNORECASE
>  
>          base = r"^\s*({}[^\s\{}]+)(\S*)\s*(\#.*)?$"
> -        regex = re.compile(base.format(self.main_name, self.subtest_separator))
> +        regex = re.compile(base.format(base_name, self.subtest_separator))
>  
>          if name not in testlist:
>              testlist[name] = []
> @@ -711,10 +728,11 @@ class TestList:
>  
>          for test in self.doc:                   # pylint: disable=C0206
>              fname = self.doc[test]["File"]
> +            base_name = self.doc[test]["_base_name_"]
>  
>              name = re.sub(r'.*/', '', fname)
>              name = re.sub(r'\.[\w+]$', '', name)
> -            name = self.main_name + name
> +            name = base_name + name
>  
>              if not subtest_only:
>                  test_dict[name] = {}
> @@ -757,10 +775,11 @@ class TestList:
>  
>          for test in sorted(self.doc.keys()):
>              fname = self.doc[test]["File"]
> +            base_name = self.doc[test]["_base_name_"]
>  
>              name = re.sub(r'.*/', '', fname)
>              name = re.sub(r'\.[ch]', '', name)
> -            name = self.main_name + name
> +            name = base_name + name
>  
>              tmp_subtest = self.expand_subtest(fname, name, test, False)
>  
> @@ -1036,10 +1055,11 @@ class TestList:
>          subtest_array = []
>          for test in sorted(self.doc.keys()):
>              fname = self.doc[test]["File"]
> +            base_name = self.doc[test]["_base_name_"]
>  
>              test_name = re.sub(r'.*/', '', fname)
>              test_name = re.sub(r'\.[ch]', '', test_name)
> -            test_name = self.main_name + test_name
> +            test_name = base_name + test_name
>  
>              subtest_array += self.expand_subtest(fname, test_name, test, True)
>  
> @@ -1178,8 +1198,8 @@ class TestList:
>      # File handling methods
>      #
>  
> -    def __add_file_documentation(self, fname, implemented_class, field_re,
> -                                 test_tag, subtest_tag, config_origin):
> +    def __add_file_documentation(self, fname, base_name, implemented_class,
> +                                 field_re, test_tag, subtest_tag, config_origin):
>  
>          """Adds the contents of test/subtest documentation form a file"""
>  
> @@ -1241,6 +1261,7 @@ class TestList:
>                          self.doc[current_test] = {}
>                          self.doc[current_test]["_arg_"] = {}
>                          self.doc[current_test]["_summary_"] = match.group(1)
> +                        self.doc[current_test]["_base_name_"] = base_name
>                          self.doc[current_test]["File"] = fname
>                          self.doc[current_test]["subtest"] = {}
>                          self.doc[current_test]["_subtest_line_"] = {}
> -- 
> 2.43.0
> 

