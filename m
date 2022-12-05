Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FD8410E0F6
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Dec 2022 06:28:51 +0000 (UTC)
Date: Mon, 5 Dec 2022 07:28:46 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20221205072846.1756189a@maurocar-mobl2>
In-Reply-To: <20221202205705.58879-7-kamil.konieczny@linux.intel.com>
References: <20221202205705.58879-1-kamil.konieczny@linux.intel.com>
 <20221202205705.58879-7-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 6/7] tests/i915/gem_exec_gttfill: add
 new subtest multigpu-basic
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

On Fri,  2 Dec 2022 21:57:04 +0100
Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:

> Add new subtest multigpu-basic to be run on two or more GPU cards
> simultanosly. For this to work test should be run with --device
> option, for example with:
>   --device=pci:vendor=Intel,device=discrete,card=0\;pci:vendor=Intel,device=discrete,card=1
> or
>   --device=pci:vendor=Intel,device=discrete,card=all
> 
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/i915/gem_exec_gttfill.c | 32 ++++++++++++++++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/i915/gem_exec_gttfill.c b/tests/i915/gem_exec_gttfill.c
> index f9f244d6..5be8428d 100644
> --- a/tests/i915/gem_exec_gttfill.c
> +++ b/tests/i915/gem_exec_gttfill.c
> @@ -24,6 +24,7 @@
>  #include "i915/gem.h"
>  #include "i915/gem_create.h"
>  #include "igt.h"
> +#include "igt_device_scan.h"
>  #include "igt_rand.h"
>  
>  IGT_TEST_DESCRIPTION("Fill the GTT with batches.");
> @@ -226,7 +227,7 @@ igt_main
>  {
>  	const struct intel_execution_engine2 *e;
>  	const intel_ctx_t *ctx;
> -	int i915 = -1;
> +	int i915 = -1, gpu_count;
>  
>  	igt_fixture {
>  		i915 = drm_open_driver(DRIVER_INTEL);
> @@ -258,9 +259,36 @@ igt_main
>  		fillgtt(i915, ctx, ALL_ENGINES, 20);
>  
>  	igt_fixture {
> -		intel_allocator_multiprocess_stop();
>  		igt_stop_hang_detector();
>  		intel_ctx_destroy(i915, ctx);
> +		// prepare multigpu tests
> +		gpu_count = igt_device_filter_count();
> +		if (gpu_count < 2)
> +			gpu_count = 1;

Same command as on patch 5/7: there's no need to add this check...

> +	}
> +
> +	igt_subtest("multigpu-basic") { /* run on two or more discrete cards */
> +		igt_require(gpu_count > 1);

As you're already asserting it here.

> +		igt_multi_fork(child, gpu_count) {
> +			int g_fd;
> +			// prepare
> +			g_fd = __drm_open_driver_another(child, DRIVER_INTEL);
> +			igt_assert(g_fd >= 0);
> +			ctx = intel_ctx_create_all_physical(g_fd);
> +			igt_fork_hang_detector(g_fd);
> +			// subtest
> +			fillgtt(g_fd, ctx, ALL_ENGINES, 1);
> +			// release resources
> +			igt_stop_hang_detector();
> +			intel_ctx_destroy(g_fd, ctx);
> +			close(g_fd);
> +		}
> +
> +		igt_waitchildren();
> +	}
> +
> +	igt_fixture {
> +		intel_allocator_multiprocess_stop();
>  		close(i915);
>  	}
>  }

After addressing it:

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Regards,
Mauro
