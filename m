Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE6F410E61D
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Nov 2023 15:46:37 +0000 (UTC)
Date: Wed, 29 Nov 2023 16:46:33 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20231129154633.pesaxacfm452njey@kamilkon-desk.igk.intel.com>
References: <20231129123221.98948-1-mauro.chehab@linux.intel.com>
 <20231129123221.98948-4-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231129123221.98948-4-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] scripts/igt_doc.py: add a logic to
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
On 2023-11-29 at 13:25:36 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Testlist for Intel CI requires parsing not only IGT testlists,
> but also block and permit lists. This is currently handled
> internally, but not from the documentation.
> 
> Now that we have everything set in place, add a method for
> generating it at IGT. The logic there is somewhat generic,
> but it expects some fields with a namespace as defined on
> tests/intel/*.json files.
> 
> So, instead of placing at the generic code (test_list.py),
> add them to igt_doc.py, where IGT-specific glue can easily
> be added while keeping test_list.py generic enought to be
> used on other projects.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/igt_doc.py | 192 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 190 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
> index ab6179366831..0ec6e3e5ec97 100755
> --- a/scripts/igt_doc.py
> +++ b/scripts/igt_doc.py
> @@ -1,5 +1,5 @@
>  #!/usr/bin/env python3
> -# pylint: disable=C0301
> +# pylint: disable=C0301,C0201,C0206
>  # SPDX-License-Identifier: (GPL-2.0 OR MIT)
>  
>  ## Copyright (C) 2023    Intel Corporation                 ##
> @@ -11,10 +11,192 @@
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
> +            run_types = subtest.get("Run type", "other")
> +            run_type_set = set(split_regex.split(run_types))
> +
> +            run_type_set = set()
> +            for run_type in set(split_regex.split(run_types)):
> +                run_type = run_type.lower()
> +
> +                if run_type.startswith(tuple(self.drivers)):
> +                    run_type_set.add(run_type)
> +                else:
> +                    for driver in self.drivers:
> +                        run_type = f"{driver.lower()}_{run_type}"
> +                        run_type_set.add(run_type)
> +
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
> +        for run_type in tests_per_list.keys():
> +            for subname, gpu in tests_per_list[run_type].items():
> +
> +                # Trivial case: fields not defined
> +                if not gpus:
> +                    tests_per_list[run_type][subname]["default"] = True
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
> +                if default_gpu_value:
> +                    tests_per_list[run_type][subname]["default"] = True
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
> +        for run_type in tests_per_list.keys():
> +            for subname, gpu_dict in tests_per_list[run_type].items():
> +                for gpu, value in gpu_dict.items():
> +                    if gpu == "all":
> +                        continue
> +
> +                    gpu = re.sub(r"[\W_]+", "-", gpu).lower()
> +                    name = re.sub(r"[\W_]+", "-", run_type).lower()
> +                    name = re.sub(r"_+", "_", name)
> +
> +                    drivers = set(self.drivers)
> +
> +                    for driver in self.drivers:
> +                        driver = driver.lower()
> +
> +                        if name.startswith(driver):
> +                            all_drivers = False
> +                            name = re.sub(r"^" + driver + r"[\W_]*", "", name)
> +                            drivers = set([driver])
> +                            break
> +
> +                    for driver in drivers:
> +                        if driver not in testlists:
> +                            testlists[driver] = {}
> +
> +                        if gpu not in testlists[driver]:
> +                            testlists[driver][gpu] = {}
> +
> +                        if name not in testlists[driver][gpu]:
> +                            testlists[driver][gpu][name] = set()
> +
> +                        testlists[driver][gpu][name].add(subname)
> +
> +        for driver in testlists.keys():
> +            driver_path = os.path.join(directory, driver)
> +            try:
> +                os.makedirs(driver_path)
> +            except FileExistsError:
> +                pass
> +
> +            for gpu, names in testlists[driver].items():
> +                dname = os.path.join(driver_path, gpu)
> +                try:
> +                    os.makedirs(dname)
> +                except FileExistsError:
> +                    pass
> +
> +                for testlist, subtests in names.items():
> +                    if testlist == "":
> +                        testlist = "other"
> +
> +                    if not subtests:
> +                        print(f"Warning: empty testlist: {testlist}")
> +                        continue
> +
> +                    fname = os.path.join(dname, testlist) + ".testlist"
> +                    with open(fname, 'w', encoding='utf8') as handler:
> +                        for sub in sorted(subtests):
> +                            handler.write (f"{sub}\n")
> +                        print(f"{fname} created.")
> +
>  def main():
>      """
>      Main logic
> @@ -48,12 +230,14 @@ def main():
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
> @@ -77,6 +261,10 @@ def main():
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
> -- 
> 2.42.0
> 

