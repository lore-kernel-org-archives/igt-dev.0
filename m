Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E04FB10E17D
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Apr 2023 14:55:20 +0000 (UTC)
Date: Mon, 24 Apr 2023 16:55:16 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230424145516.k6vqqzwe6327ad65@kamilkon-desk1>
References: <20230424073237.15431-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230424073237.15431-1-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3] scripts/test_list.py: make filtering
 logic more generic
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

On 2023-04-24 at 09:32:37 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Allow multiple filter filters and filter also print outputs,
> except for the json one.
> 
> After the patch, applying multiple filters and display per-test
> documentation, for instance, could be done with commands like:
> 
>   ./scripts/igt_doc.py --config tests/xe/*.json --filter-field \
> 	 Sub-category=~execbuf run\ type=~bat --per-test
> 
> The filter will now be applied to all possible outputs of the
> script.
> 
> Requested-by: Jari Tahvanainen <jari.tahvanainen@intel.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/igt_doc.py   | 12 ++++--
>  scripts/test_list.py | 87 ++++++++++++++++++++++++++++++++------------
>  2 files changed, 71 insertions(+), 28 deletions(-)
> 
> diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
> index 01df35f98ace..38e2bdee4f2a 100755
> --- a/scripts/igt_doc.py
> +++ b/scripts/igt_doc.py
> @@ -32,8 +32,8 @@ parser.add_argument("--show-subtests", action="store_true",
>                      help="Shows the name of the documented subtests in alphabetical order.")
>  parser.add_argument("--sort-field",
>                      help="modify --show-subtests to sort output based on SORT_FIELD value")
> -parser.add_argument("--filter-field",
> -                    help="modify --show-subtests to filter output based a regex given by FILTER_FIELD=~'regex'")
> +parser.add_argument("--filter-field", nargs='*',
> +                    help="filter subtests based on regular expressions given by FILTER_FIELD=~'regex'")
>  parser.add_argument("--check-testlist", action="store_true",
>                      help="Compare documentation against IGT built tests.")
>  parser.add_argument("--include-plan", action="store_true",
> @@ -51,10 +51,14 @@ parse_args = parser.parse_args()
>  tests = TestList(parse_args.config, parse_args.include_plan, parse_args.files,
>                   parse_args.igt_build_path)
>  
> +if parse_args.filter_field:
> +    for filter_expr in parse_args.filter_field:
> +        tests.add_filter(filter_expr)
> +
>  RUN = 0
>  if parse_args.show_subtests:
>      RUN = 1
> -    tests.show_subtests(parse_args.sort_field, parse_args.filter_field)
> +    tests.show_subtests(parse_args.sort_field)
>  
>  if parse_args.check_testlist:
>      RUN = 1
> @@ -64,7 +68,7 @@ if parse_args.gen_testlist:
>      RUN = 1
>      if not parse_args.sort_field:
>          sys.exit("Need a field to split the testlists")
> -    tests.gen_testlist(parse_args.gen_testlist, parse_args.sort_field, parse_args.filter_field)
> +    tests.gen_testlist(parse_args.gen_testlist, parse_args.sort_field)
>  
>  if parse_args.to_json:
>      RUN = 1
> diff --git a/scripts/test_list.py b/scripts/test_list.py
> index 96d8883db122..1c5e195eb9d3 100755
> --- a/scripts/test_list.py
> +++ b/scripts/test_list.py
> @@ -257,6 +257,7 @@ class TestList:
>          self.level_count = 0
>          self.field_list = {}
>          self.title = None
> +        self.filters = {}
>  
>          driver_name = re.sub(r'(.*/)?([^\/]+)/.*', r'\2', config_fname).capitalize()
>  
> @@ -384,6 +385,23 @@ class TestList:
>  
>              self.__add_field(key, sublevel, hierarchy_level, field[key])
>  
> +    def __filter_subtest(self, test, subtest, field_not_found_value):
> +
> +        """ Apply filter criteria to subtests """
> +
> +        for filter_field, regex in self.filters.items():
> +            if filter_field in subtest:
> +                if not re.match(regex, subtest[filter_field]):
> +                    return True
> +            elif filter_field in test:
> +                if not re.match(regex, test[filter_field]):
> +                    return True
> +            else:
> +                return field_not_found_value
> +
> +        # None of the filtering rules were applied
> +        return False
> +
>      def expand_subtest(self, fname, test_name, test, allow_inherit):
>  
>          """Expand subtest wildcards providing an array with subtests"""
> @@ -532,6 +550,9 @@ class TestList:
>  
>              subtest_array = self.expand_subtest(fname, name, test, subtest_only)
>              for subtest in subtest_array:
> +                if self.__filter_subtest(test, subtest, True):
> +                    continue
> +
>                  summary = subtest["Summary"]
>  
>                  dic[summary] = {}
> @@ -570,6 +591,19 @@ class TestList:
>              name = re.sub(r'\.[ch]', '', name)
>              name = "igt@" + name
>  
> +            tmp_subtest = self.expand_subtest(fname, name, test, False)
> +
> +            # Get subtests first, to avoid displaying tests with
> +            # all filtered subtests
> +            subtest_array = []
> +            for subtest in tmp_subtest:
> +                if self.__filter_subtest(self.doc[test], subtest, True):
> +                    continue
> +                subtest_array.append(subtest)
> +
> +            if not subtest_array:
> +                continue
> +
>              print(len(name) * '=')
>              print(name)
>              print(len(name) * '=')
> @@ -583,9 +617,8 @@ class TestList:
>  
>                  print(f":{field}: {self.doc[test][field]}")
>  
> -            subtest_array = self.expand_subtest(fname, name, test, False)
> -
>              for subtest in subtest_array:
> +
>                  print()
>                  print(subtest["Summary"])
>                  print(len(subtest["Summary"]) * '=')
> @@ -708,11 +741,28 @@ class TestList:
>          with open(out_fname, "w", encoding='utf8') as write_file:
>              json.dump(test_dict, write_file, indent = 4)
>  
> +    #
> +    # Add filters
> +    #
> +    def add_filter(self, filter_field_expr):
> +
> +        """ Add a filter criteria for output data """
> +
> +        match = re.match(r"(.*)=~\s*(.*)", filter_field_expr)
> +        if not match:
> +            sys.exit(f"Filter field {filter_field_expr} is not at <field> =~ <regex> syntax")
> +        field = match.group(1).strip().lower()
> +        if field not in self.field_list:
> +            sys.exit(f"Field '{field}' is not defined")
> +        filter_field = self.field_list[field]
> +        regex = re.compile("{0}".format(match.group(2).strip()), re.I) # pylint: disable=C0209
> +        self.filters[filter_field] = regex
> +
>      #
>      # Subtest list methods
>      #
>  
> -    def get_subtests(self, sort_field = None, filter_field_expr = None):
> +    def get_subtests(self, sort_field = None):
>  
>          """Return an array with all subtests"""
>  
> @@ -724,17 +774,6 @@ class TestList:
>                  sys.exit(f"Field '{sort_field}' is not defined")
>              sort_field = self.field_list[sort_field.lower()]
>  
> -        if filter_field_expr:
> -            match = re.match(r"(.*)=~\s*(.*)", filter_field_expr)
> -            if not match:
> -                sys.exit(f"Filter field {filter_field_expr} is not at <field> =~ <regex> syntax")
> -
> -            field = match.group(1).strip().lower()
> -            if field not in self.field_list:
> -                sys.exit(f"Field '{field}' is not defined")
> -            filter_field = self.field_list[field]
> -            regex = re.compile("{0}".format(match.group(2).strip()), re.I) # pylint: disable=C0209
> -
>          for test in sorted(self.doc.keys()):
>              fname = self.doc[test]["File"]
>  
> @@ -745,11 +784,8 @@ class TestList:
>              subtest_array = self.expand_subtest(fname, test_name, test, True)
>  
>              for subtest in subtest_array:
> -                if filter_field_expr:
> -                    if filter_field not in subtest:
> -                        continue
> -                    if not re.match(regex, subtest[filter_field]):
> -                        continue
> +                if self.__filter_subtest(test, subtest, True):
> +                    continue
>  
>                  if sort_field:
>                      if sort_field in subtest:
> @@ -807,6 +843,9 @@ class TestList:
>          if not self.igt_build_path:
>              sys.exit("Need the IGT build path")
>  
> +        if self.filters:
> +            print("NOTE: test checks are affected by filters")
> +
>          doc_subtests = sorted(self.get_subtests()[""])
>  
>          for i in range(0, len(doc_subtests)): # pylint: disable=C0200
> @@ -1067,12 +1106,12 @@ class TestList:
>                  sys.exit(f"{fname}:{file_ln + 1}: Error: unrecognized line. Need to add field at %s?\n\t==> %s" %
>                           (self.config_fname, file_line))
>  
> -    def show_subtests(self, sort_field, filter_field):
> +    def show_subtests(self, sort_field):
>  
>          """Show subtests, allowing sort and filter a field """
>  
>          if sort_field:
> -            test_subtests = self.get_subtests(sort_field, filter_field)
> +            test_subtests = self.get_subtests(sort_field)
>              for val_key in sorted(test_subtests.keys()):
>                  if not test_subtests[val_key]:
>                      continue
> @@ -1083,17 +1122,17 @@ class TestList:
>                      for sub in test_subtests[val_key]:
>                          print (f"  {sub}")
>          else:
> -            for sub in self.get_subtests(sort_field, filter_field)[""]:
> +            for sub in self.get_subtests(sort_field)[""]:
>                  print (sub)
>  
> -    def gen_testlist(self, directory, sort_field, filter_field):
> +    def gen_testlist(self, directory, sort_field):
>  
>          """Generate testlists from the test documentation"""
>  
>          test_prefix = os.path.commonprefix(self.get_subtests()[""])
>          test_prefix = re.sub(r'^igt@', '', test_prefix)
>  
> -        test_subtests = self.get_subtests(sort_field, filter_field)
> +        test_subtests = self.get_subtests(sort_field)
>  
>          for test in test_subtests.keys():  # pylint: disable=C0201,C0206
>              if not test_subtests[test]:
> -- 
> 2.40.0
> 

