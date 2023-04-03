Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7383710E3CF
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Apr 2023 10:20:42 +0000 (UTC)
Message-ID: <4f6040b2-02d8-af61-7907-965632d08aeb@linux.intel.com>
Date: Mon, 3 Apr 2023 11:20:38 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230331195915.5839-1-umesh.nerlige.ramappa@intel.com>
 <20230331195915.5839-3-umesh.nerlige.ramappa@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230331195915.5839-3-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/drm_fdinfo: Drop active
 busyness tests for GuC backend
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 31/03/2023 20:59, Umesh Nerlige Ramappa wrote:
> With GuC scheduling backends, the context busyness for an active context is
> obtained from the GuC FW. The support for this is WIP, so disable tests that
> check TEST_BUSY until the feature is implemented.
> 
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>   tests/i915/drm_fdinfo.c | 148 +++++++++++++++++++++-------------------
>   1 file changed, 79 insertions(+), 69 deletions(-)
> 
> diff --git a/tests/i915/drm_fdinfo.c b/tests/i915/drm_fdinfo.c
> index 65b8b830..5df33933 100644
> --- a/tests/i915/drm_fdinfo.c
> +++ b/tests/i915/drm_fdinfo.c
> @@ -761,83 +761,93 @@ igt_main
>   	igt_subtest("virtual-idle")
>   		virtual(i915, &ctx->cfg, 0);
>   
> -	/**
> -	 * Test that a single engine reports load correctly.
> -	 */
> -	test_each_engine("busy", i915, ctx, e)
> -		single(i915, ctx, e, TEST_BUSY);
> -
> -	igt_subtest("virtual-busy")
> -		virtual(i915, &ctx->cfg, TEST_BUSY);
> -
> -	test_each_engine("busy-idle", i915, ctx, e)
> -		single(i915, ctx, e, TEST_BUSY | TEST_TRAILING_IDLE);
> -
> -	igt_subtest("virtual-busy-idle")
> -		virtual(i915, &ctx->cfg, TEST_BUSY | TEST_TRAILING_IDLE);
> -
> -	test_each_engine("busy-hang", i915, ctx, e) {
> -		igt_hang_t hang = igt_allow_hang(i915, ctx->id, 0);
> -
> -		single(i915, ctx, e, TEST_BUSY | FLAG_HANG);
> -
> -		igt_disallow_hang(i915, hang);
> -	}
> -
> -	igt_subtest("virtual-busy-hang")
> -		virtual(i915, &ctx->cfg, TEST_BUSY | FLAG_HANG);
> -
> -	/**
> -	 * Test that when one engine is loaded other report no
> -	 * load.
> -	 */
> -	test_each_engine("busy-check-all", i915, ctx, e)
> -		busy_check_all(i915, ctx, e, num_engines, classes, num_classes,
> -			       TEST_BUSY);
> +	igt_fixture {
> +		/**
> +		 * With GuC scheduling backends, the context busyness for a
> +		 * active context is obtained from the GUC FW. The support for
> +		 * this is WIP, so disable tests that check TEST_BUSY until the
> +		 * feature is implemented.
> +		 */
> +		igt_require(!gem_using_guc_submission(i915));
>   
> -	test_each_engine("busy-idle-check-all", i915, ctx, e)
> -		busy_check_all(i915, ctx, e, num_engines, classes, num_classes,
> -			       TEST_BUSY | TEST_TRAILING_IDLE);
> +		/**
> +		 * Test that a single engine reports load correctly.
> +		 */
> +		test_each_engine("busy", i915, ctx, e)
> +			single(i915, ctx, e, TEST_BUSY);

Hm I think executing tests from fixture blocks shouldn't be done. Don't 
remember why but I thought so..

Maybe as an alternative you put that igt_require into tests themselves?

Like:

if (flags & TEST_BUSY)
	igt_require(!gem_using_guc_submission(i915));

Thoughts?

Regards,

Tvrtko

>   
> -	/**
> -	 * Test that when all except one engine are loaded all
> -	 * loads are correctly reported.
> -	 */
> -	test_each_engine("most-busy-check-all", i915, ctx, e)
> -		most_busy_check_all(i915, ctx, e, num_engines,
> -				    classes, num_classes,
> -				    TEST_BUSY);
> +		igt_subtest("virtual-busy")
> +			virtual(i915, &ctx->cfg, TEST_BUSY);
>   
> -	test_each_engine("most-busy-idle-check-all", i915, ctx, e)
> -		most_busy_check_all(i915, ctx, e, num_engines,
> -				    classes, num_classes,
> -				    TEST_BUSY | TEST_TRAILING_IDLE);
> +		test_each_engine("busy-idle", i915, ctx, e)
> +			single(i915, ctx, e, TEST_BUSY | TEST_TRAILING_IDLE);
>   
> -	/**
> -	 * Test that when all engines are loaded all loads are
> -	 * correctly reported.
> -	 */
> -	igt_subtest("all-busy-check-all")
> -		all_busy_check_all(i915, ctx, num_engines, classes, num_classes,
> -				   TEST_BUSY);
> +		igt_subtest("virtual-busy-idle")
> +			virtual(i915, &ctx->cfg, TEST_BUSY | TEST_TRAILING_IDLE);
>   
> -	igt_subtest("all-busy-idle-check-all")
> -		all_busy_check_all(i915, ctx, num_engines, classes, num_classes,
> -				   TEST_BUSY | TEST_TRAILING_IDLE);
> +		test_each_engine("busy-hang", i915, ctx, e) {
> +			igt_hang_t hang = igt_allow_hang(i915, ctx->id, 0);
>   
> -	igt_subtest("virtual-busy-all")
> -		virtual_all(i915, &ctx->cfg, TEST_BUSY);
> +			single(i915, ctx, e, TEST_BUSY | FLAG_HANG);
>   
> -	igt_subtest("virtual-busy-idle-all")
> -		virtual_all(i915, &ctx->cfg, TEST_BUSY | TEST_TRAILING_IDLE);
> +			igt_disallow_hang(i915, hang);
> +		}
>   
> -	igt_subtest("virtual-busy-hang-all")
> -		virtual_all(i915, &ctx->cfg, TEST_BUSY | FLAG_HANG);
> -	/**
> -	 * Test for no cross-client contamination.
> -	 */
> -	test_each_engine("isolation", i915, ctx, e)
> -		single(i915, ctx, e, TEST_BUSY | TEST_ISOLATION);
> +		igt_subtest("virtual-busy-hang")
> +			virtual(i915, &ctx->cfg, TEST_BUSY | FLAG_HANG);
> +
> +		/**
> +		 * Test that when one engine is loaded other report no
> +		 * load.
> +		 */
> +		test_each_engine("busy-check-all", i915, ctx, e)
> +			busy_check_all(i915, ctx, e, num_engines, classes, num_classes,
> +					TEST_BUSY);
> +
> +		test_each_engine("busy-idle-check-all", i915, ctx, e)
> +			busy_check_all(i915, ctx, e, num_engines, classes, num_classes,
> +					TEST_BUSY | TEST_TRAILING_IDLE);
> +
> +		/**
> +		 * Test that when all except one engine are loaded all
> +		 * loads are correctly reported.
> +		 */
> +		test_each_engine("most-busy-check-all", i915, ctx, e)
> +			most_busy_check_all(i915, ctx, e, num_engines,
> +					classes, num_classes,
> +					TEST_BUSY);
> +
> +		test_each_engine("most-busy-idle-check-all", i915, ctx, e)
> +			most_busy_check_all(i915, ctx, e, num_engines,
> +					classes, num_classes,
> +					TEST_BUSY | TEST_TRAILING_IDLE);
> +
> +		/**
> +		 * Test that when all engines are loaded all loads are
> +		 * correctly reported.
> +		 */
> +		igt_subtest("all-busy-check-all")
> +			all_busy_check_all(i915, ctx, num_engines, classes, num_classes,
> +					TEST_BUSY);
> +
> +		igt_subtest("all-busy-idle-check-all")
> +			all_busy_check_all(i915, ctx, num_engines, classes, num_classes,
> +					TEST_BUSY | TEST_TRAILING_IDLE);
> +
> +		igt_subtest("virtual-busy-all")
> +			virtual_all(i915, &ctx->cfg, TEST_BUSY);
> +
> +		igt_subtest("virtual-busy-idle-all")
> +			virtual_all(i915, &ctx->cfg, TEST_BUSY | TEST_TRAILING_IDLE);
> +
> +		igt_subtest("virtual-busy-hang-all")
> +			virtual_all(i915, &ctx->cfg, TEST_BUSY | FLAG_HANG);
> +		/**
> +		 * Test for no cross-client contamination.
> +		 */
> +		test_each_engine("isolation", i915, ctx, e)
> +			single(i915, ctx, e, TEST_BUSY | TEST_ISOLATION);
> +	}
>   
>   	igt_fixture {
>   		intel_ctx_destroy(i915, ctx);
