Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31F2210E55C
 for <igt-dev@lists.freedesktop.org>; Fri,  5 May 2023 04:55:18 +0000 (UTC)
Date: Fri, 5 May 2023 06:55:12 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Message-ID: <20230505065512.04e14e77@maurocar-mobl2>
In-Reply-To: <20230504102451.3047783-4-bhanuprakash.modem@intel.com>
References: <20230504102451.3047783-1-bhanuprakash.modem@intel.com>
 <20230504102451.3047783-4-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t 3/3] scripts/test_list: Ignore non-XE tests
 for missing documentation
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

On Thu,  4 May 2023 15:54:51 +0530
Bhanuprakash Modem <bhanuprakash.modem@intel.com> wrote:

> To add the test file to tests_config.json, documentation is
> mandatory for all the subtests, else we'll end up with the
> compilation failure.

That's because you added a command on patch 2/3 to make it to check
for documentation gaps at build time. Just replace:

	'extra_args': check_testlist
to:
	'extra_args': []

To avoid that.

No need of hacking the source code.

> 
> It's completely make sense to consider the documentation as
> mandatory for newly created test files like xe_*.c. But for
> existing files, it is very painful to add the documentation
> for all the subtests in that file.
> 
> Example: tests/kms_flip.c
> It has N number of subtests, but we are using 2-3 subtests
> for BAT. Will slowly add the documentation for remaining
> subtests.
> 
> So, for non-XE subtests, don't fail the compilation for
> missing documentation. Once the documentation is done for
> all the subtests we can revert this patch.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  scripts/test_list.py | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/test_list.py b/scripts/test_list.py
> index 1c5e195eb..3c959d6b9 100755
> --- a/scripts/test_list.py
> +++ b/scripts/test_list.py
> @@ -876,11 +876,16 @@ class TestList:
>              if not found:
>                  doc_uneeded.append(doc_test)
>  
> +        xe_regex = r"^(igt@xe_.*@.*$)"
>          for run_test in run_subtests:
>              found = False
>              if re.match(test_regex, run_test):
>                  found = True
> -            if not found:
> +            #
> +            # FIXME: Drop this XE specific check once documentation is done
> +            # for all subtests.
> +            #
> +            if not found and re.match(xe_regex, run_test):
>                  run_missing.append(run_test)

NACK.

>  
>          if doc_uneeded:
