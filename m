Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2F4710E6F1
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Nov 2023 11:48:36 +0000 (UTC)
Date: Thu, 30 Nov 2023 12:48:24 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20231130124824.6d6d5035@maurocar-mobl2>
In-Reply-To: <20231130104715.5tz6l57bzqkwxt5h@kamilkon-desk.igk.intel.com>
References: <20231130071253.114028-1-mauro.chehab@linux.intel.com>
 <20231130071253.114028-2-mauro.chehab@linux.intel.com>
 <20231130104715.5tz6l57bzqkwxt5h@kamilkon-desk.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 1/1] scripts/igt_doc.py: rewrite intelci
 testlist logic
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

On Thu, 30 Nov 2023 11:47:15 +0100
Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:

> Hi Mauro,
> On 2023-11-30 at 08:11:50 +0100, Mauro Carvalho Chehab wrote:
> > From: Mauro Carvalho Chehab <mchehab@kernel.org>
> > 
> > Cleanup the block/accept testlist code, reducing one step on it,
> > and fixing some issues at testlist generation.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>  
> 
> Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
> Btw could you add in separate patch documentation for this new option?
> I am afraid it wil be lost in patchwork but should be in code
> or in one of commit description. Alternativly, write it somewhere,
> what about igt_doc_examples.txt with examples?

There is already documentation as part of :

$ ./scripts/igt_doc.py --help
usage: igt_doc.py [-h] --config CONFIG [--rest REST] [--per-test] [--to-json TO_JSON] [--show-subtests] [--sort-field SORT_FIELD] [--filter-field [FILTER_FIELD ...]] [--check-testlist] [--include-plan] [--igt-build-path IGT_BUILD_PATH]
                  [--gen-testlist GEN_TESTLIST] [--intelci-testlist INTELCI_TESTLIST] [--files FILES [FILES ...]]

Print formatted kernel documentation to stdout.

options:
  -h, --help            show this help message and exit
  --config CONFIG       JSON file describing the test plan template (default: None)
  --rest REST           Output documentation from the source files in REST file. (default: None)
  --per-test            Modifies ReST output to print subtests per test. (default: False)
  --to-json TO_JSON     Output test documentation in JSON format as TO_JSON file (default: None)
  --show-subtests       Shows the name of the documented subtests in alphabetical order. (default: False)
  --sort-field SORT_FIELD
                        modify --show-subtests to sort output based on SORT_FIELD value (default: None)
  --filter-field [FILTER_FIELD ...]
                        filter subtests based on regular expressions given by FILTER_FIELD=~'regex' (default: None)
  --check-testlist      Compare documentation against IGT built tests. (default: False)
  --include-plan        Include test plans, if any. (default: False)
  --igt-build-path IGT_BUILD_PATH
                        Path to the IGT build directory. Used by --check-testlist. (default: build)
  --gen-testlist GEN_TESTLIST
                        Generate documentation at the GEN_TESTLIST directory, using SORT_FIELD to split the tests. Requires --sort-field. (default: None)
  --intelci-testlist INTELCI_TESTLIST
                        Generate testlists for Intel CI integration at the INTELCI_TESTLIST directory. (default: None)
  --files FILES [FILES ...]
                        File name(s) to be processed (default: None)

If no action specified, assume --rest.

Developer's documentation is also there:


$ pydoc scripts/igt_doc.py 


Help on module igt_doc:

NAME
    igt_doc - Maintain test plan and test implementation documentation on IGT.

CLASSES
    test_list.TestList(builtins.object)
        IgtTestList

    class IgtTestList(test_list.TestList)
     |  IgtTestList(config_fname=None, include_plan=False, file_list=None, igt_build_path=None, config_dict=None, sources_path=None, test_tag='TEST', subtest_tag='SUBTESTS?', main_name='igt', subtest_separator='@')
     |
     |  This class implements testlist generation as expected by Intel CI.
     |  It does that by handling test lists split by "Run type" and
     |  using GPU (or configuration) specific fields, being "GPU" for a
     |  permit list of tests, and "GPU excluded platform" for a block
     |  list of tests.
     |
     |  The logic below has "priority zero" rules, which are:
     |
     |  - if the test is not on any block lists nor it contains
     |    "GPU" or "GPU excluded platform", it won't be blocked;
     |  - if the test is in "all" block list, it will be blocked for all
     |    GPUs. Values from "GPU" and "GPU excluded platform" will be ignored.
     |
     |  If none of the above rules apply, it will handle GPU positive
     |  and negative rules:
     |
     |  - if "GPU" field is present on such test, the default is
     |    is to block the test (default_gpu_value = False). If not
     |    present, the default is to not block (default_gpu_value = True).
     |
     |  Now, it will check for "GPU" and "GPU excluded platform":
     |
     |  - it sets the default according to default_gpu_value.
     |
     |  Then:
     |
     |  - if "GPU" exists, for each GPU listed on the list, it will
     |    unblock the test;
     |  - if "GPU excluded platform" exists, for each GPU listed on
     |    the list, it will block the test.
     |
     |  Method resolution order:
     |      IgtTestList
     |      test_list.TestList
     |      builtins.object
     |
     |  Methods defined here:
     |
     |  gen_intelci_testlist(self)
     |      Return a list of gpu configs and testlists.
     |
     |  write_intelci_testlist(self, directory)
     |      Create testlist directory (if needed) and files
     |
     |  ----------------------------------------------------------------------
     |  Methods inherited from test_list.TestList:
     |
     |  __init__(self, config_fname=None, include_plan=False, file_list=None, igt_build_path=None, config_dict=None, sources_path=None, test_tag='TEST', subtest_tag='SUBTESTS?', main_name='igt', subtest_separator='@')
     |      Initialize self.  See help(type(self)) for accurate signature.
     |
     |  add_filter(self, filter_field_expr)
     |      Add a filter criteria for output data
     |
     |  check_tests(self)
     |      Compare documented subtests with the IGT test list
     |
     |  expand_dictionary(self, subtest_only)
     |      prepares a dictionary with subtest arguments expanded
     |
     |  expand_subtest(self, fname, test_name, test, allow_inherit, with_lines=False, with_subtest_nr=False)
     |      Expand subtest wildcards providing an array with subtests
     |
     |  gen_testlist(self, directory, sort_field)
     |      Generate testlists from the test documentation
     |
     |  get_spreadsheet(self, expand_fields=None)
     |      Return a bidimentional array with the test contents.
     |
     |      Its output is similar to a spreadsheet, so it can be used by a
     |      separate python file that would create a workbook's sheet.
     |
     |  get_subtests(self, sort_field=None, expand=None, with_order=False)
     |      Return an array with all subtests
     |
     |  get_testlist(self)
     |      Return a list of tests as reported by --list-subtests
     |
     |  print_json(self, out_fname)
     |      Adds the contents of test/subtest documentation form a file
     |
     |  print_nested_rest(self, filename=None, return_string=False)
     |      Print tests and subtests ordered by tests
     |
     |  print_rest_flat(self, filename=None, return_string=False)
     |      Print tests and subtests ordered by tests
     |
     |  read_testlist(self, match_type, field, testlist, name, filename)
     |      Read a list of tests with a common value from a file
     |
     |  show_subtests(self, sort_field)
     |      Show subtests, allowing sort and filter a field
     |
     |  update_testlist_field(self, subtest_dict)
     |      process include and exclude rules used by test lists read from files
     |
     |  ----------------------------------------------------------------------
     |  Data descriptors inherited from test_list.TestList:
     |
     |  __dict__
     |      dictionary for instance variables (if defined)
     |
     |  __weakref__
     |      list of weak references to the object (if defined)

FUNCTIONS
    main()
        Main logic

FILE
    /home/mchehab/devel/upstream/igt-gpu-tools/scripts/igt_doc.py



Regards,
Mauro
