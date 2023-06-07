Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1EA610E533
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jun 2023 17:27:48 +0000 (UTC)
Date: Wed, 7 Jun 2023 19:27:43 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <20230607172743.66ccomut32uqivjd@zkempczy-mobl2>
References: <20230607113222.226473-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230607113222.226473-1-matthew.auld@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/xe/intel_bb: remove full-batch
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

On Wed, Jun 07, 2023 at 12:32:22PM +0100, Matthew Auld wrote:
> Currently this generates CAT errors due to over-fetch going beyond the
> boundaries of the GTT. However we also don't use scratch pages by
> default in Xe (hopeful plan is to get rid them completely), so no
> address with full-batch will be valid if HW over-fetches into the next
> page, unless we either inflate the batch size with padding, which
> defeats the purpose of the test, or enable scratch pages, which is not
> something we really want moving forward. With that rather just remove
> full-batch on Xe.
> 
> Bspec: 60223
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/262
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

LGTM:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> ---
>  tests/intel-ci/xe-fast-feedback.testlist |  1 -
>  tests/xe/xe_intel_bb.c                   | 31 ------------------------
>  2 files changed, 32 deletions(-)
> 
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index be243197a..fb5acd8a0 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -169,7 +169,6 @@ igt@xe_intel_bb@blit-simple
>  igt@xe_intel_bb@create-in-region
>  igt@xe_intel_bb@delta-check
>  igt@xe_intel_bb@destroy-bb
> -igt@xe_intel_bb@full-batch
>  igt@xe_intel_bb@intel-bb-blit-none
>  igt@xe_intel_bb@intel-bb-blit-x
>  igt@xe_intel_bb@intel-bb-blit-y
> diff --git a/tests/xe/xe_intel_bb.c b/tests/xe/xe_intel_bb.c
> index ed3529a1b..29b5ececb 100644
> --- a/tests/xe/xe_intel_bb.c
> +++ b/tests/xe/xe_intel_bb.c
> @@ -941,34 +941,6 @@ static void delta_check(struct buf_ops *bops)
>  		     expected, val);
>  }
>  
> -/**
> - * SUBTEST: full-batch
> - * Description: check bb totally filled is executing correct
> - * Run type: FULL
> - * TODO: change ``'Run type' == FULL`` to a better category
> - */
> -static void full_batch(struct buf_ops *bops)
> -{
> -	int xe = buf_ops_get_fd(bops);
> -	struct intel_bb *ibb;
> -	int i;
> -
> -	ibb = intel_bb_create(xe, PAGE_SIZE);
> -	if (debug_bb)
> -		intel_bb_set_debug(ibb, true);
> -
> -	for (i = 0; i < PAGE_SIZE / sizeof(uint32_t) - 1; i++)
> -		intel_bb_out(ibb, 0);
> -	intel_bb_emit_bbe(ibb);
> -
> -	igt_assert(intel_bb_offset(ibb) == PAGE_SIZE);
> -	intel_bb_exec(ibb, intel_bb_offset(ibb),
> -		      I915_EXEC_DEFAULT | I915_EXEC_NO_RELOC, true);
> -	intel_bb_reset(ibb, false);
> -
> -	intel_bb_destroy(ibb);
> -}
> -
>  /**
>   * SUBTEST: render
>   * Description: check intel-bb render pipeline
> @@ -1166,9 +1138,6 @@ igt_main_args("dpib", NULL, help_str, opt_handler, NULL)
>  	igt_subtest("delta-check")
>  		delta_check(bops);
>  
> -	igt_subtest("full-batch")
> -		full_batch(bops);
> -
>  	igt_subtest_with_dynamic("render") {
>  		igt_require(xe_has_engine_class(xe, DRM_XE_ENGINE_CLASS_RENDER));
>  
> -- 
> 2.40.1
> 
