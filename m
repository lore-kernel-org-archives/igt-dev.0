Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E3C3C4828D
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 20:03:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9816F10ECE5;
	Thu,  1 Feb 2024 20:03:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ruu57+XH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68DC610EC2E
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 20:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706817825; x=1738353825;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=/fS2tQfVdmjdbKy4iLK9AckDWfxhw1pv4+w+x9+0aTA=;
 b=Ruu57+XH+7jkEUGmVgnzKXSkMNPr5F8wbl+FRejQNamhgthpjlO7w/TH
 lQ2SDvUSU3H9qbi5IKR6G8lVoqVRHdUt6Weif/rDEp9cg/nsj7rW3Chvh
 jqqYkkOlwciAOOTZjwpadz9rbRJWmsPnUvYkgJDMSBW0TwV2sDwJ6sym2
 Fxl30jTVMF1Unbk2/X2Wl5vADls0blXZlGcbnxxdYvWO4fWB//F5EQdmz
 IDkzRibVcX9Lb/Z61VeJU0qRvkCBwu5op5ShdALI+7ofjPGblEq4M3ay8
 spKY21rKj56sVRgTfrhJ8Bf1NVf4xYmrHvJhdaKbg6HNCH9bqY7WiAm92 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="11360730"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; d="scan'208";a="11360730"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 11:57:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="789035598"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; d="scan'208";a="789035598"
Received: from unknown (HELO localhost) ([10.245.85.128])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 11:57:15 -0800
Date: Thu, 1 Feb 2024 20:57:12 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Karolina Stolarek <karolina.stolarek@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Karolina Drobnik <karolina.drobnik@intel.com>
Subject: Re: [PATCH i-g-t v4 5/5] tests/xe_exercise_blt: Exercise small to
 large fast-copy blits
Message-ID: <20240201195712.xly6psysmxzx3umv@zkempczy-mobl2>
References: <20240201100724.257845-1-zbigniew.kempczynski@intel.com>
 <20240201100724.257845-6-zbigniew.kempczynski@intel.com>
 <d4c9ad75-66b1-4959-a4f5-120ae7524453@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d4c9ad75-66b1-4959-a4f5-120ae7524453@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Thu, Feb 01, 2024 at 03:18:02PM +0100, Karolina Stolarek wrote:
> 
> On 1.02.2024 11:07, Zbigniew Kempczyński wrote:
> > Testing blitter with large size like 512x512 may be not enough
> > to verify small or unaligned blits works properly. Add subtest
> > which spread fast-copy blits from small to large.
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Karolina Drobnik <karolina.drobnik@intel.com>
> > ---
> >   tests/intel/xe_exercise_blt.c | 63 +++++++++++++++++++++++++++++------
> >   1 file changed, 52 insertions(+), 11 deletions(-)
> > 
> > diff --git a/tests/intel/xe_exercise_blt.c b/tests/intel/xe_exercise_blt.c
> > index ddf9d188a7..8b4bae282b 100644
> > --- a/tests/intel/xe_exercise_blt.c
> > +++ b/tests/intel/xe_exercise_blt.c
> > @@ -25,6 +25,10 @@
> >    *   Check fast-copy blit
> >    *   blitter
> >    *
> > + * SUBTEST: fast-copy-inc-dimension
> > + * Description:
> > + *   Check fast-copy blit with sizes from small to large
> > + *
> >    * SUBTEST: fast-copy-emit
> >    * Description:
> >    *   Check multiple fast-copy in one batch
> > @@ -40,6 +44,8 @@ static struct param {
> >   	bool print_surface_info;
> >   	int width;
> >   	int height;
> > +	int width_increment;
> > +	int width_steps;
> >   } param = {
> >   	.tiling = -1,
> >   	.write_png = false,
> > @@ -111,6 +117,7 @@ static int fast_copy_one_bb(int xe,
> >   }
> >   static void fast_copy_emit(int xe, const intel_ctx_t *ctx,
> > +			   uint32_t width, uint32_t height,
> >   			   uint32_t region1, uint32_t region2,
> >   			   enum blt_tiling_type mid_tiling)
> >   {
> > @@ -122,7 +129,7 @@ static void fast_copy_emit(int xe, const intel_ctx_t *ctx,
> >   	uint64_t ahnd = intel_allocator_open_full(xe, ctx->vm, 0, 0,
> >   						  INTEL_ALLOCATOR_SIMPLE,
> >   						  ALLOC_STRATEGY_LOW_TO_HIGH, 0);
> > -	uint32_t bb, width = param.width, height = param.height;
> > +	uint32_t bb;
> >   	int result;
> >   	bb = xe_bo_create(xe, 0, bb_size, region1, 0);
> > @@ -170,6 +177,7 @@ static void fast_copy_emit(int xe, const intel_ctx_t *ctx,
> >   }
> >   static void fast_copy(int xe, const intel_ctx_t *ctx,
> > +		      uint32_t width, uint32_t height,
> >   		      uint32_t region1, uint32_t region2,
> >   		      enum blt_tiling_type mid_tiling)
> >   {
> > @@ -181,7 +189,6 @@ static void fast_copy(int xe, const intel_ctx_t *ctx,
> >   						  INTEL_ALLOCATOR_SIMPLE,
> >   						  ALLOC_STRATEGY_LOW_TO_HIGH, 0);
> >   	uint32_t bb;
> > -	uint32_t width = param.width, height = param.height;
> >   	int result;
> >   	bb = xe_bo_create(xe, 0, bb_size, region1, 0);
> > @@ -241,14 +248,20 @@ enum fast_copy_func {
> >   };
> >   static char
> > -	*full_subtest_str(char *regtxt, enum blt_tiling_type tiling,
> > +	*full_subtest_str(char *regtxt, uint32_t width, uint32_t height,
> > +			  enum blt_tiling_type tiling,
> >   			  enum fast_copy_func func)
> >   {
> >   	char *name;
> >   	uint32_t len;
> > -	len = asprintf(&name, "%s-%s%s", blt_tiling_name(tiling), regtxt,
> > -		       func == FAST_COPY_EMIT ? "-emit" : "");
> > +	if (!width || !height)
> > +		len = asprintf(&name, "%s-%s%s", blt_tiling_name(tiling), regtxt,
> > +			       func == FAST_COPY_EMIT ? "-emit" : "");
> > +	else
> > +		len = asprintf(&name, "%s-%s%s-%ux%u", blt_tiling_name(tiling), regtxt,
> > +			       func == FAST_COPY_EMIT ? "-emit" : "",
> > +			       width, height);
> >   	igt_assert_f(len >= 0, "asprintf failed!\n");
> > @@ -264,6 +277,7 @@ static void fast_copy_test(int xe,
> >   	};
> >   	struct igt_collection *regions;
> >   	void (*copy_func)(int xe, const intel_ctx_t *ctx,
> > +			  uint32_t width, uint32_t height,
> >   			  uint32_t r1, uint32_t r2, enum blt_tiling_type tiling);
> >   	intel_ctx_t *ctx;
> >   	int tiling;
> > @@ -286,16 +300,32 @@ static void fast_copy_test(int xe,
> >   			copy_func = (func == FAST_COPY) ? fast_copy : fast_copy_emit;
> >   			regtxt = xe_memregion_dynamic_subtest_name(xe, regions);
> > -			test_name = full_subtest_str(regtxt, tiling, func);
> > -			igt_dynamic_f("%s", test_name) {
> > -				copy_func(xe, ctx,
> > -					  region1, region2,
> > -					  tiling);
> > +			if (!param.width_increment) {
> > +				test_name = full_subtest_str(regtxt, 0, 0, tiling, func);
> 
> I'd simply pass param.width and param.height here and use the common
> name for both width_increment and fixed size test cases. We don't have
> to keep the same "%s-%s%s" format, extending it would be fine (and
> helpful, I think).

I wanted to keep subtest name for previous test to avoid changes on
patchwork. That's why I passed 0 here.

--
Zbigniew

> 
> All the best,
> Karolina
> 
> > +				igt_dynamic_f("%s", test_name) {
> > +					copy_func(xe, ctx,
> > +						  param.width, param.height,
> > +						  region1, region2,
> > +						  tiling);
> > +				}
> > +				free(test_name);
> > +			} else {
> > +				for (int w = param.width;
> > +				     w < param.width + param.width_steps;
> > +				     w += param.width_increment) {
> > +					test_name = full_subtest_str(regtxt, w, w, tiling, func);
> > +					igt_dynamic_f("%s", test_name) {
> > +						copy_func(xe, ctx,
> > +							  w, w,
> > +							  region1, region2,
> > +							  tiling);
> > +					}
> > +					free(test_name);
> > +				}
> >   			}
> >   			free(regtxt);
> > -			free(test_name);
> >   			xe_exec_queue_destroy(xe, exec_queue);
> >   			xe_vm_destroy(xe, vm);
> >   			free(ctx);
> > @@ -367,6 +397,17 @@ igt_main_args("b:pst:W:H:", NULL, help_str, opt_handler, NULL)
> >   		fast_copy_test(xe, set, FAST_COPY);
> >   	}
> > +	igt_describe("Check fast-copy with increment width/height");
> > +	igt_subtest_with_dynamic("fast-copy-inc-dimension") {
> > +		param.width = 1;
> > +		param.height = 1;
> > +		param.width_increment = 15;
> > +		param.width_steps = 512;
> > +
> > +		fast_copy_test(xe, set, FAST_COPY);
> > +	}
> > +
> > +
> >   	igt_describe("Check multiple fast-copy in one batch");
> >   	igt_subtest_with_dynamic("fast-copy-emit") {
> >   		fast_copy_test(xe, set, FAST_COPY_EMIT);
