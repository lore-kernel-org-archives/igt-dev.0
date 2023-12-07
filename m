Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BD9910E8E3
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Dec 2023 15:41:56 +0000 (UTC)
Date: Thu, 7 Dec 2023 16:41:52 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] xe_live_ktest: Use xe_live_test kernel
 module
Message-ID: <20231207164152.57be3d07@maurocar-mobl2>
In-Reply-To: <20231205224926.2188996-1-lucas.demarchi@intel.com>
References: <20231205224926.2188996-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue,  5 Dec 2023 14:49:26 -0800
Lucas De Marchi <lucas.demarchi@intel.com> wrote:

> https://patchwork.freedesktop.org/series/126786/ groups all the live
> tests into a single kernel module. Use that module to run any of the
> tests triggered by igt.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  tests/intel/xe_live_ktest.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/intel/xe_live_ktest.c b/tests/intel/xe_live_ktest.c
> index fe7b2e69f..c8bd68928 100644
> --- a/tests/intel/xe_live_ktest.c
> +++ b/tests/intel/xe_live_ktest.c
> @@ -19,15 +19,10 @@
>   * Functionality: migrate
>   */
>  
> -struct kunit_tests {
> -	const char *kunit;
> -	const char *name;
> -};
> -
> -static const struct kunit_tests live_tests[] = {
> -	{ "xe_bo_test",		"bo" },
> -	{ "xe_dma_buf_test",	"dmabuf" },
> -	{ "xe_migrate_test",	"migrate" },
> +static const char *live_tests[] = {
> +	"bo",
> +	"dmabuf",
> +	"migrate",
>  };
>  
>  igt_main
> @@ -35,5 +30,5 @@ igt_main
>  	int i;
>  
>  	for (i = 0; i < ARRAY_SIZE(live_tests); i++)
> -		igt_kunit(live_tests[i].kunit, live_tests[i].name, NULL);
> +		igt_kunit("xe_live_test", live_tests[i], NULL);

This loop will modprobe xe_live_test the times. Just do something
like:

	igt_kunit("xe_live_test", "live_tests", NULL);

>  }

Regards,
Mauro
