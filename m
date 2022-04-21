Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76FD310F360
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Apr 2022 06:55:08 +0000 (UTC)
Date: Thu, 21 Apr 2022 12:26:01 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20220421065600.GA18679@intel.com>
References: <20220421065008.24682-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220421065008.24682-1-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_lmem_swapping: Add
 parallel-random-verify-ccs subtest
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

On 2022-04-21 at 08:50:08 +0200, Zbigniew Kempczyński wrote:
> For this subtest we need to use allocator thread so parallel subtests
> need to be executed in allocator multi-process aware environment.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Looks good to me. And tested too.

Reviewed-by: Ramalingam C <ramalingam.c@intel.com>

> Cc: Ramalingam C <ramalingam.c@intel.com>
> ---
>  tests/i915/gem_lmem_swapping.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/tests/i915/gem_lmem_swapping.c b/tests/i915/gem_lmem_swapping.c
> index e58a1f505f..5d93e9daae 100644
> --- a/tests/i915/gem_lmem_swapping.c
> +++ b/tests/i915/gem_lmem_swapping.c
> @@ -576,6 +576,7 @@ static void test_evict(int i915,
>  	if (flags & TEST_PARALLEL) {
>  		int fd = gem_reopen_driver(i915);
>  
> +		intel_allocator_multiprocess_start();
>  		ctx = intel_ctx_create_all_physical(fd);
>  		__gem_context_set_persistence(fd, ctx->id, false);
>  
> @@ -586,6 +587,7 @@ static void test_evict(int i915,
>  		igt_waitchildren();
>  		intel_ctx_destroy(fd, ctx);
>  		close(fd);
> +		intel_allocator_multiprocess_stop();
>  	} else {
>  		__do_evict(i915, ctx, &region->region, &params, params.seed);
>  	}
> @@ -747,6 +749,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>  		{ "verify-random-ccs", TEST_CCS | TEST_RANDOM },
>  		{ "heavy-verify-random-ccs", TEST_CCS | TEST_RANDOM | TEST_HEAVY },
>  		{ "heavy-verify-multi-ccs", TEST_CCS | TEST_RANDOM | TEST_HEAVY | TEST_ENGINES | TEST_MULTI },
> +		{ "parallel-random-verify-ccs", TEST_PARALLEL | TEST_RANDOM | TEST_CCS },
>  		{ }
>  	};
>  	const intel_ctx_t *ctx;
> -- 
> 2.32.0
> 
