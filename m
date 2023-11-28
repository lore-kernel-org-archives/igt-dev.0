Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D410410E0A6
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Nov 2023 15:59:49 +0000 (UTC)
Date: Tue, 28 Nov 2023 16:59:45 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20231128155945.2vklefud2r4v2er2@kamilkon-desk.igk.intel.com>
References: <20231128105054.24317-1-mauro.chehab@linux.intel.com>
 <20231128105054.24317-6-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231128105054.24317-6-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 5/5] igt_doc.py: move the main code to a
 main() function
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
On 2023-11-28 at 11:49:00 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> That avoids having global variables inside the script and
> makes easier to add IGT-specific classes there.
> 
> No functional changes.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/igt_doc.py | 122 ++++++++++++++++++++++++---------------------
>  1 file changed, 65 insertions(+), 57 deletions(-)
> 
> diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
> index 86e49970ea28..ab6179366831 100755
> --- a/scripts/igt_doc.py
> +++ b/scripts/igt_doc.py
> @@ -15,69 +15,77 @@ import sys
>  
>  from test_list import TestList
>  
> -IGT_BUILD_PATH = 'build'
> +def main():
> +    """
> +    Main logic
> +    """
>  
> -parser = argparse.ArgumentParser(description = "Print formatted kernel documentation to stdout.",
> -                                 formatter_class = argparse.ArgumentDefaultsHelpFormatter,
> -                                 epilog = 'If no action specified, assume --rest.')
> -parser.add_argument("--config", required = True,
> -                    help="JSON file describing the test plan template")
> -parser.add_argument("--rest",
> -                    help="Output documentation from the source files in REST file.")
> -parser.add_argument("--per-test", action="store_true",
> -                    help="Modifies ReST output to print subtests per test.")
> -parser.add_argument("--to-json",
> -                    help="Output test documentation in JSON format as TO_JSON file")
> -parser.add_argument("--show-subtests", action="store_true",
> -                    help="Shows the name of the documented subtests in alphabetical order.")
> -parser.add_argument("--sort-field",
> -                    help="modify --show-subtests to sort output based on SORT_FIELD value")
> -parser.add_argument("--filter-field", nargs='*',
> -                    help="filter subtests based on regular expressions given by FILTER_FIELD=~'regex'")
> -parser.add_argument("--check-testlist", action="store_true",
> -                    help="Compare documentation against IGT built tests.")
> -parser.add_argument("--include-plan", action="store_true",
> -                    help="Include test plans, if any.")
> -parser.add_argument("--igt-build-path",
> -                    help="Path to the IGT build directory. Used by --check-testlist.",
> -                    default=IGT_BUILD_PATH)
> -parser.add_argument("--gen-testlist",
> -                    help="Generate documentation at the GEN_TESTLIST directory, using SORT_FIELD to split the tests. Requires --sort-field.")
> -parser.add_argument('--files', nargs='+',
> -                    help="File name(s) to be processed")
> +    igt_build_path = 'build'
>  
> -parse_args = parser.parse_args()
> +    parser = argparse.ArgumentParser(description = "Print formatted kernel documentation to stdout.",
> +                                    formatter_class = argparse.ArgumentDefaultsHelpFormatter,
> +                                    epilog = 'If no action specified, assume --rest.')
> +    parser.add_argument("--config", required = True,
> +                        help="JSON file describing the test plan template")
> +    parser.add_argument("--rest",
> +                        help="Output documentation from the source files in REST file.")
> +    parser.add_argument("--per-test", action="store_true",
> +                        help="Modifies ReST output to print subtests per test.")
> +    parser.add_argument("--to-json",
> +                        help="Output test documentation in JSON format as TO_JSON file")
> +    parser.add_argument("--show-subtests", action="store_true",
> +                        help="Shows the name of the documented subtests in alphabetical order.")
> +    parser.add_argument("--sort-field",
> +                        help="modify --show-subtests to sort output based on SORT_FIELD value")
> +    parser.add_argument("--filter-field", nargs='*',
> +                        help="filter subtests based on regular expressions given by FILTER_FIELD=~'regex'")
> +    parser.add_argument("--check-testlist", action="store_true",
> +                        help="Compare documentation against IGT built tests.")
> +    parser.add_argument("--include-plan", action="store_true",
> +                        help="Include test plans, if any.")
> +    parser.add_argument("--igt-build-path",
> +                        help="Path to the IGT build directory. Used by --check-testlist.",
> +                        default=igt_build_path)
> +    parser.add_argument("--gen-testlist",
> +                        help="Generate documentation at the GEN_TESTLIST directory, using SORT_FIELD to split the tests. Requires --sort-field.")
> +    parser.add_argument('--files', nargs='+',
> +                        help="File name(s) to be processed")
>  
> -tests = TestList(config_fname = parse_args.config,
> -                 include_plan = parse_args.include_plan,
> -                 file_list = parse_args.files,
> -                 igt_build_path = parse_args.igt_build_path)
> +    parse_args = parser.parse_args()
>  
> -if parse_args.filter_field:
> -    for filter_expr in parse_args.filter_field:
> -        tests.add_filter(filter_expr)
> +    tests = TestList(config_fname = parse_args.config,
> +                        include_plan = parse_args.include_plan,
> +                        file_list = parse_args.files,
> +                        igt_build_path = parse_args.igt_build_path)
>  
> -RUN = 0
> -if parse_args.show_subtests:
> -    RUN = 1
> -    tests.show_subtests(parse_args.sort_field)
> +    if parse_args.filter_field:
> +        for filter_expr in parse_args.filter_field:
> +            tests.add_filter(filter_expr)
>  
> -if parse_args.check_testlist:
> -    RUN = 1
> -    tests.check_tests()
> +    run = False
> +    if parse_args.show_subtests:
> +        run = True
> +        tests.show_subtests(parse_args.sort_field)
>  
> -if parse_args.gen_testlist:
> -    RUN = 1
> -    if not parse_args.sort_field:
> -        sys.exit("Need a field to split the testlists")
> -    tests.gen_testlist(parse_args.gen_testlist, parse_args.sort_field)
> +    if parse_args.check_testlist:
> +        run = True
> +        tests.check_tests()
>  
> -if parse_args.to_json:
> -    RUN = 1
> -    tests.print_json(parse_args.to_json)
> +    if parse_args.gen_testlist:
> +        run = True
> +        if not parse_args.sort_field:
> +            sys.exit("Need a field to split the testlists")
> +        tests.gen_testlist(parse_args.gen_testlist, parse_args.sort_field)
>  
> -if not RUN or parse_args.rest:
> -    if parse_args.per_test:
> -        tests.print_rest_flat(parse_args.rest)
> -    else:
> -        tests.print_nested_rest(parse_args.rest)
> +    if parse_args.to_json:
> +        run = True
> +        tests.print_json(parse_args.to_json)
> +
> +    if not run or parse_args.rest:
> +        if parse_args.per_test:
> +            tests.print_rest_flat(parse_args.rest)
> +        else:
> +            tests.print_nested_rest(parse_args.rest)
> +
> +if __name__ == '__main__':
> +    main()
> -- 
> 2.42.0
> 

