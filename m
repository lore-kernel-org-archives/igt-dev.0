Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EE3A10E03A
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Mar 2023 17:51:28 +0000 (UTC)
Date: Wed, 29 Mar 2023 19:51:24 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230329175124.nodgjgkw7jqrdgyk@kamilkon-desk1>
References: <20230327133155.2428454-1-mauro.chehab@linux.intel.com>
 <20230327133155.2428454-4-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230327133155.2428454-4-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 03/11] scripts/igt_doc.py: add support
 to generate testlists
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

On 2023-03-27 at 15:31:47 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> As the testlists are part of the documentation, add support
> to generate them from the documentation on an specified
> directory.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/igt_doc.py | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
> index cc2768ae0847..efbcee5e74e2 100755
> --- a/scripts/igt_doc.py
> +++ b/scripts/igt_doc.py
> @@ -1037,6 +1037,35 @@ class TestList:
>              for sub in tests.get_subtests(sort_field, filter_field)[""]:
>                  print (sub)
>  
> +    def gen_testlist(self, directory, sort_field, filter_field):
> +
> +        """Generate testlists from the test documentation"""
> +
> +        test_prefix = os.path.commonprefix(self.get_subtests()[""])
> +        test_prefix = re.sub(r'^igt@', '', test_prefix)
> +
> +        test_subtests = self.get_subtests(sort_field, filter_field)
> +
> +        for test in test_subtests.keys():  # pylint: disable=C0201,C0206
> +            if not test_subtests[test]:
> +                continue
> +
> +            testlist = test.lower()
> +            if testlist == "":
> +                fname = "other"
> +            elif testlist == "bat":
> +                fname = "fast-feedback"
> +            else:
> +                fname = testlist
> +
> +            fname = directory + "/" + test_prefix + fname + ".testlist"
> +            fname = re.sub(r"[\s_]+", "-", fname)
> +
> +            with open(fname, 'w', encoding='utf8') as handler:
> +                for sub in test_subtests[test]:
> +                    handler.write (f"{sub}\n")
> +                print(f"{fname} created.")
> +
>  #
>  # Main
>  #
> @@ -1065,6 +1094,8 @@ parser.add_argument("--include-plan", action="store_true",
>  parser.add_argument("--igt-build-path",
>                      help="Path where the IGT runner is sitting. Used by --check-testlist.",
>                      default=IGT_BUILD_PATH)
> +parser.add_argument("--gen-testlist",
> +                    help="Generate documentation at the GEN_TESTLIST directory, using SORT_FIELD to split the tests. Requires --sort-field.")
>  parser.add_argument('--files', nargs='+',
>                      help="File name(s) to be processed")
>  
> @@ -1081,6 +1112,12 @@ if parse_args.check_testlist:
>      RUN = 1
>      tests.check_tests()
>  
> +if parse_args.gen_testlist:
> +    RUN = 1
> +    if not parse_args.sort_field:
> +        sys.exit("Need a field to split the testlists")
> +    tests.gen_testlist(parse_args.gen_testlist, parse_args.sort_field, parse_args.filter_field)
> +
>  if parse_args.to_json:
>      RUN = 1
>      tests.print_json(parse_args.to_json)
> -- 
> 2.39.2
> 

