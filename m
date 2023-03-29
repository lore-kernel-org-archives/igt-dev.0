Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD73A10EBE4
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Mar 2023 17:49:52 +0000 (UTC)
Date: Wed, 29 Mar 2023 19:49:48 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230329174948.hbfkh3yhu2gcmo2x@kamilkon-desk1>
References: <20230327133155.2428454-1-mauro.chehab@linux.intel.com>
 <20230327133155.2428454-3-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230327133155.2428454-3-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 02/11] scripts/igt_doc.py: move
 show_subtests logic to the class
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

On 2023-03-27 at 15:31:46 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Simplify the main code and avoid warnings about global vars with
> pylint by moving its code to a separate function.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/igt_doc.py | 34 ++++++++++++++++++++--------------
>  1 file changed, 20 insertions(+), 14 deletions(-)
> 
> diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
> index 67ab7984dd11..cc2768ae0847 100755
> --- a/scripts/igt_doc.py
> +++ b/scripts/igt_doc.py
> @@ -1018,6 +1018,25 @@ class TestList:
>                  sys.exit(f"{fname}:{file_ln + 1}: Error: unrecognized line. Need to add field at %s?\n\t==> %s" %
>                           (self.config_fname, file_line))
>  
> +    def show_subtests(self, sort_field, filter_field):
> +
> +        """Show subtests, allowing sort and filter a field """
> +
> +        if sort_field:
> +            test_subtests = tests.get_subtests(sort_field, filter_field)
> +            for val_key in sorted(test_subtests.keys()):
> +                if not test_subtests[val_key]:
> +                    continue
> +                if val_key == "":
> +                    print("not defined:")
> +                else:
> +                    print(f"{val_key}:")
> +                    for sub in test_subtests[val_key]:
> +                        print (f"  {sub}")
> +        else:
> +            for sub in tests.get_subtests(sort_field, filter_field)[""]:
> +                print (sub)
> +
>  #
>  # Main
>  #
> @@ -1056,20 +1075,7 @@ tests = TestList(parse_args.config, parse_args.include_plan, parse_args.files)
>  RUN = 0
>  if parse_args.show_subtests:
>      RUN = 1
> -    if parse_args.sort_field:
> -        test_subtests = tests.get_subtests(parse_args.sort_field, parse_args.filter_field)
> -        for val_key in sorted(test_subtests.keys()):
> -            if not test_subtests[val_key]:
> -                continue
> -            if val_key == "":
> -                print("not defined:")
> -            else:
> -                print(f"{val_key}:")
> -            for sub in test_subtests[val_key]:
> -                print (f"  {sub}")
> -    else:
> -        for sub in tests.get_subtests(parse_args.sort_field, parse_args.filter_field)[""]:
> -            print (sub)
> +    tests.show_subtests(parse_args.sort_field, parse_args.filter_field)
>  
>  if parse_args.check_testlist:
>      RUN = 1
> -- 
> 2.39.2
> 

