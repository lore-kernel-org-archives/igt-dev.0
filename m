Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EEDD10E1C8
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Nov 2023 12:47:35 +0000 (UTC)
Date: Wed, 29 Nov 2023 13:47:31 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20231129124731.qtttacbxrjmlbpjl@kamilkon-desk.igk.intel.com>
References: <20231128164551.77343-1-mauro.chehab@linux.intel.com>
 <20231128164551.77343-3-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231128164551.77343-3-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH RFC 2/3] scripts/igt_doc.py: add a logic to
 generate Intel CI testlists
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
On 2023-11-28 at 17:43:02 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Testlist for Intel CI requires parsing not only IGT testlists,
> but also block and permit lists. This is currently handled
> internally, but not from the documentation.

Remove comma before "but", s/, but/ but/

> 
> Now that we have everything set in place, add a method for
> generating it at IGT. The logic there is somewhat generic,

Same here, remove comma.

> but it expects some fields with a namespace as defined on
> tests/intel/*.json files.
> 
> So, instead of placing at the generic code (test_list.py),

s/So, instead/Instead/

> add them to igt_doc.py, where IGT-specific glue can easily
> be added while keeping test_list.py generic enought to be
--------------------------------------------- ^^^^^^^
s/enought/enough

With this,
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> used on other projects.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  scripts/igt_doc.py   | 148 ++++++++++++++++++++++++++++++++++++++++++-
>  scripts/test_list.py |   3 +
>  2 files changed, 150 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
> index ab6179366831..a807d2bb373d 100755
> --- a/scripts/igt_doc.py
> +++ b/scripts/igt_doc.py
> @@ -11,10 +11,150 @@
>  """Maintain test plan and test implementation documentation on IGT."""
>  
>  import argparse
> +import os
> +import re
>  import sys
>  
>  from test_list import TestList
>  
> +class IgtTestList(TestList):
> +    """
> +        This class implements testlist generation as expected by Intel CI.
> +        It does that by handling test lists split by "Run type" and
> +        using GPU (or configuration) specific fields, being "GPU" for a
> +        permit list of tests, and "GPU excluded platform" for a block
> +        list of tests.
> +
> +        The logic below has "priority zero" rules, which are:
> +
> +        - if the test is not on any block lists nor it contains
> +          "GPU" or "GPU excluded platform", it won't be blocked;
> +        - if the test is in "all" block list, it will be blocked for all
> +          GPUs. Values from "GPU" and "GPU excluded platform" will be ignored.
> +
> +        If none of the above rules apply, it will handle GPU positive
> +        and negative rules:
> +
> +        - if "GPU" field is present on such test, the default is
> +          is to block the test (default_gpu_value = False). If not
> +          present, the default is to not block (default_gpu_value = True).
> +
> +        Now, it will check for "GPU" and "GPU excluded platform":
> +
> +        - it sets the default according to default_gpu_value.
> +
> +        Then:
> +
> +        - if "GPU" exists, for each GPU listed on the list, it will
> +          unblock the test;
> +        - if "GPU excluded platform" exists, for each GPU listed on
> +          the list, it will block the test.
> +    """
> +    def gen_intelci_testlist(self): #pylint: disable=R0912
> +        """Return a list of gpu configs and testlists."""
> +
> +        subtest_dict = self.expand_dictionary(True)
> +
> +        # Create a tests_per_list dict
> +        gpus = set()
> +        tests_per_list = {}
> +        split_regex = re.compile(r",\s*")
> +
> +        for subname, subtest in subtest_dict.items():
> +            run_type = subtest.get("Run type", "other")
> +
> +            run_type_set = set(split_regex.split(run_type))
> +            for run_type in run_type_set:
> +                if run_type not in tests_per_list:
> +                    tests_per_list[run_type] = {}
> +
> +                if subname not in tests_per_list[run_type]:
> +                    tests_per_list[run_type][subname] = {}
> +
> +                if "GPU" in subtest:
> +                    for gpu_list in split_regex.split(subtest["GPU"]):
> +                        gpus.add(gpu_list)
> +                        tests_per_list[run_type][subname][gpu_list] = True
> +
> +                if "GPU excluded platform" in subtest:
> +                    for gpu_list in split_regex.split(subtest["GPU excluded platform"]):
> +                        gpus.add(gpu_list)
> +                        tests_per_list[run_type][subname][gpu_list] = False
> +
> +        # Handle block and permit lists
> +
> +        for run_type in tests_per_list.keys(): # pylint: disable=C0201,C0206
> +            for subname, gpu in tests_per_list[run_type].items():
> +
> +                # Trivial case: fields not defined
> +                if not gpus:
> +                    tests_per_list[run_type][subname]["all"] = True
> +                    continue
> +
> +                if not gpu:
> +                    tests_per_list[run_type][subname] = {}
> +                    for gpu in gpus:
> +                        tests_per_list[run_type][subname][gpu] = True
> +                    continue
> +
> +                default_gpu_value = True
> +                for gpu, value in tests_per_list[run_type][subname].items():
> +                    if value:
> +                        default_gpu_value = False
> +                        break
> +                    if not gpu in tests_per_list[run_type][subname]:
> +                        for gpu in gpus:
> +                            tests_per_list[run_type][subname][gpu] = default_gpu_value
> +
> +                if "all" in tests_per_list[run_type][subname]:
> +                    if not tests_per_list[run_type][subname]["all"]:
> +                        for gpu in gpus:
> +                            tests_per_list[run_type][subname][gpu] = False
> +
> +        return (gpus, tests_per_list)
> +
> +    def write_intelci_testlist(self, directory):
> +        '''Create testlist directory (if needed) and files'''
> +
> +        if not os.path.exists(directory):
> +            os.makedirs(directory)
> +
> +        (gpus, tests_per_list)  = self.gen_intelci_testlist()
> +        testlists = {}
> +
> +        for run_type in tests_per_list.keys(): # pylint: disable=C0201,C0206
> +            for subname, gpu_dict in tests_per_list[run_type].items():
> +                for gpu, value in gpu_dict.items():
> +                    run_name = re.sub(r"[\W_]+", "-", run_type)
> +                    gpu = re.sub(r"[\W_]+", "-", gpu)
> +
> +                    if gpus:
> +                        name = f"{run_name}_{gpu}".lower()
> +                    else:
> +                        name = run_name.lower()
> +
> +                    if not name.startswith(self.driver_name.lower()):
> +                        name = f"{self.driver_name.lower()}_{name}"
> +
> +                    name = re.sub(r"_+", "_", name)
> +
> +                    if name not in testlists:
> +                        testlists[name] = set()
> +
> +                    if value:
> +                        testlists[name].add(subname)
> +
> +        for testlist, subtests in testlists.items():
> +            if testlist == "":
> +                testlist = "other"
> +
> +
> +            fname = os.path.join(directory, testlist) + ".testlist"
> +            with open(fname, 'w', encoding='utf8') as handler:
> +                for sub in sorted(subtests):
> +                    handler.write (f"{sub}\n")
> +                print(f"{fname} created.")
> +
>  def main():
>      """
>      Main logic
> @@ -48,12 +188,14 @@ def main():
>                          default=igt_build_path)
>      parser.add_argument("--gen-testlist",
>                          help="Generate documentation at the GEN_TESTLIST directory, using SORT_FIELD to split the tests. Requires --sort-field.")
> +    parser.add_argument("--intelci-testlist",
> +                        help="Generate testlists for Intel CI integration at the INTELCI_TESTLIST directory.")
>      parser.add_argument('--files', nargs='+',
>                          help="File name(s) to be processed")
>  
>      parse_args = parser.parse_args()
>  
> -    tests = TestList(config_fname = parse_args.config,
> +    tests = IgtTestList(config_fname = parse_args.config,
>                          include_plan = parse_args.include_plan,
>                          file_list = parse_args.files,
>                          igt_build_path = parse_args.igt_build_path)
> @@ -77,6 +219,10 @@ def main():
>              sys.exit("Need a field to split the testlists")
>          tests.gen_testlist(parse_args.gen_testlist, parse_args.sort_field)
>  
> +    if parse_args.intelci_testlist:
> +        run = True
> +        tests.write_intelci_testlist(parse_args.intelci_testlist)
> +
>      if parse_args.to_json:
>          run = True
>          tests.print_json(parse_args.to_json)
> diff --git a/scripts/test_list.py b/scripts/test_list.py
> index 3954e883ada3..36eea5fb1c76 100644
> --- a/scripts/test_list.py
> +++ b/scripts/test_list.py
> @@ -263,6 +263,7 @@ class TestList:
>          self.filters = {}
>          self.subtest_separator = subtest_separator
>          self.main_name = main_name
> +        self.driver_name = ""
>  
>          self.internal_fields =  [ '_summary_', '_arg_', '_subtest_line_' ]
>  
> @@ -289,6 +290,8 @@ class TestList:
>              cfg_path = "./"
>              driver_name = main_name
>  
> +        self.driver_name = driver_name
> +
>          if sources_path:
>              cfg_path = os.path.realpath(sources_path) + "/"
>  
> -- 
> 2.42.0
> 

