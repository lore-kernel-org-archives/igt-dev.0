Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57EE310E2B4
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Oct 2023 12:48:36 +0000 (UTC)
Date: Mon, 30 Oct 2023 13:48:31 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20231030124831.bw4bg46xvcmdtfgf@kamilkon-desk.igk.intel.com>
References: <20231030095206.108025-1-mauro.chehab@linux.intel.com>
 <20231030095206.108025-4-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231030095206.108025-4-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 3/7] runner/runner_tests: Fix name of
 no-subtests in unit tests
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
On 2023-10-30 at 10:49:58 +0100, Mauro Carvalho Chehab wrote:
> From: Petri Latvala <adrinael@adrinael.net>
> 
> Now that runner normalizes no-subtest entries in testlists, make sure
> the name matches what's available.
> 
> Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> Signed-off-by: Petri Latvala <adrinael@adrinael.net>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  runner/runner_tests.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/runner/runner_tests.c b/runner/runner_tests.c
> index e6024de11a60..11ff05bc0e7e 100644
> --- a/runner/runner_tests.c
> +++ b/runner/runner_tests.c
> @@ -802,7 +802,7 @@ igt_main
>  		char filename[] = "tmplistXXXXXX";
>  		const char testlisttext[] = "igt@successtest@first-subtest\n"
>  			"igt@successtest@second-subtest\n"
> -			"igt@nosubtests\n";
> +			"igt@no-subtests\n";
>  		int multiple;
>  		struct job_list *list = malloc(sizeof(*list));
>  
> @@ -830,7 +830,7 @@ igt_main
>  
>  				igt_assert_eqstr(list->entries[0].binary, "successtest");
>  				if (!multiple) igt_assert_eqstr(list->entries[1].binary, "successtest");
> -				igt_assert_eqstr(list->entries[multiple ? 1 : 2].binary, "nosubtests");
> +				igt_assert_eqstr(list->entries[multiple ? 1 : 2].binary, "no-subtests");
>  
>  				igt_assert_eq(list->entries[0].subtest_count, multiple ? 2 : 1);
>  				igt_assert_eq(list->entries[1].subtest_count, multiple ? 0 : 1);
> -- 
> 2.41.0
> 

