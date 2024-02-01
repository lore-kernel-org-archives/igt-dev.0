Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E6C8C48286
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 19:32:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DD3E10E635;
	Thu,  1 Feb 2024 19:32:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nBpsc++a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAED910E635
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 19:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706815941; x=1738351941;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=EgRBfWhaM9mOXe//ChC3pwMUbEMhgy9IN6h3smwWUjU=;
 b=nBpsc++a5NfjsjqekhgYQGKn8UsqWf6lwCDaDCc6kQ6Rl7H6aZ57m4+8
 mHiy91czCuMoNQo4vCNHrCnq5oP2r85gkRkcGypd7ap8C7ifPG3vhNU5s
 lz4GIyRJYn8nNFE+pSyS0eOOMQOdtv4lNJx/3lB6C4XNq42ePDE+FIwxG
 ywAK+oe2nOialn/XWuxbucgjApT1aH4r1ncDi/dCrLFoDiCLFwJoluqLX
 kdPGuO16na+huNONBVVrBJ8qhowLW9E8C7H41hoaAWWfIdBaypBFiABxK
 do9iYyEMztbnarthV6pE8SrMy2MLk0S3C6SBqGTSzKbforscRgikg0TjB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="181921"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; 
   d="scan'208";a="181921"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 11:32:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="912227187"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; d="scan'208";a="912227187"
Received: from unknown (HELO localhost) ([10.245.85.128])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 11:32:18 -0800
Date: Thu, 1 Feb 2024 20:32:15 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Karolina Stolarek <karolina.stolarek@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Karolina Drobnik <karolina.drobnik@intel.com>
Subject: Re: [PATCH i-g-t v4 4/5] tests/xe-ccs: Add tests which exercise
 small to large blit sizes
Message-ID: <20240201193215.t7xkktttcj2mrqz2@zkempczy-mobl2>
References: <20240201100724.257845-1-zbigniew.kempczynski@intel.com>
 <20240201100724.257845-5-zbigniew.kempczynski@intel.com>
 <f23fc1d6-1bf6-4059-8366-44ec238a78e6@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f23fc1d6-1bf6-4059-8366-44ec238a78e6@intel.com>
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

On Thu, Feb 01, 2024 at 03:09:30PM +0100, Karolina Stolarek wrote:
> On 1.02.2024 11:07, Zbigniew Kempczyński wrote:
> > Testing block-copy for 512 x 512 x 32bpp is not enough to verify
> > blit is working for different (small) and not always aligned
> > resolutions. Add 'increment' subtests which checks blits from
> > small (1x1) to large (512x512) resolutions.
> > 
> > To avoid too long execution resolution increment equals 15x15 pixels.
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Karolina Drobnik <karolina.drobnik@intel.com>
> > ---
> 
> Thanks for the comment on why the step is 15 px wide.
> 
> I wonder if we could just start testing the compressed case from bigger
> widths and heights, instead of adding that if on the mid surface. But
> probably we'd limit the coverage, so let's leave it as it is.

Both - small and large may lead to fail, depending on situation.
Especially in Tile64. 15x15 is picked intentionally to step by step
increase size which at some point will be modulo 16.
> 
> A small nit below.
> 
> >   tests/intel/xe_ccs.c | 144 +++++++++++++++++++++++++++++++++----------
> >   1 file changed, 112 insertions(+), 32 deletions(-)
> > 
> > diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
> > index a7785edcb1..627976049c 100644
> > --- a/tests/intel/xe_ccs.c
> > +++ b/tests/intel/xe_ccs.c
> > @@ -28,9 +28,15 @@
> >    * SUBTEST: block-copy-compressed
> >    * Description: Check block-copy flatccs compressed blit
> >    *
> > + * SUBTEST: block-copy-compressed-inc-dimension
> > + * Description: Check block-copy compressed blit for different sizes
> > + *
> >    * SUBTEST: block-copy-uncompressed
> >    * Description: Check block-copy uncompressed blit
> >    *
> > + * SUBTEST: block-copy-uncompressed-inc-dimension
> > + * Description: Check block-copy uncompressed blit for different sizes
> > + *
> >    * SUBTEST: block-multicopy-compressed
> >    * Description: Check block-multicopy flatccs compressed blit
> >    *
> > @@ -73,6 +79,8 @@ struct test_config {
> >   	bool surfcopy;
> >   	bool new_ctx;
> >   	bool suspend_resume;
> > +	int width_increment;
> > +	int width_steps;
> >   };
> >   #define PRINT_SURFACE_INFO(name, obj) do { \
> > @@ -286,9 +294,17 @@ static int blt_block_copy3(int xe,
> >   	return ret;
> >   }
> > +#define CHECK_MIN_WIDTH 2
> > +#define CHECK_MIN_HEIGHT 2
> > +#define MIN_EXP_WH(w, h) ((w) >= CHECK_MIN_WIDTH && (h) >= CHECK_MIN_HEIGHT)
> > +#define CHECK_FROM_WIDTH 256
> > +#define CHECK_FROM_HEIGHT 256
> > +#define FROM_EXP_WH(w, h) ((w) >= CHECK_FROM_WIDTH && (h) >= CHECK_FROM_HEIGHT)
> > +
> >   static void block_copy(int xe,
> >   		       intel_ctx_t *ctx,
> >   		       uint32_t region1, uint32_t region2,
> > +		       uint32_t width, uint32_t height,
> >   		       enum blt_tiling_type mid_tiling,
> >   		       const struct test_config *config)
> >   {
> > @@ -301,7 +317,7 @@ static void block_copy(int xe,
> >   	uint32_t run_id = mid_tiling;
> >   	uint32_t mid_region = (AT_LEAST_GEN(intel_get_drm_devid(xe), 20) &
> >   							!xe_has_vram(xe)) ? region1 : region2;
> > -	uint32_t width = param.width, height = param.height, bb;
> > +	uint32_t bb;
> >   	enum blt_compression mid_compression = config->compression;
> >   	int mid_compression_format = param.compression_format;
> >   	enum blt_compression_type comp_type = COMPRESSION_TYPE_3D;
> > @@ -339,9 +355,16 @@ static void block_copy(int xe,
> >   	blt_block_copy(xe, ctx, NULL, ahnd, &blt, pext);
> >   	intel_ctx_xe_sync(ctx, true);
> > -	/* We expect mid != src if there's compression */
> > -	if (mid->compression)
> > -		igt_assert(memcmp(src->ptr, mid->ptr, src->size) != 0);
> > +	/*
> > +	 * We expect mid != src if there's compression. Ignore this for small
> > +	 * width x height for linear as compression for gradient occurs in the
> > +	 * middle for bigger sizes. We also ignore 1x1 as this looks same for
> > +	 * xmajor.
> > +	 */
> > +	if (mid->compression && MIN_EXP_WH(width, height)) {
> > +		if (mid_tiling != T_LINEAR || FROM_EXP_WH(width, height))
> > +			igt_assert(memcmp(src->ptr, mid->ptr, src->size) != 0);
> > +	}
> >   	WRITE_PNG(xe, run_id, "mid", &blt.dst, width, height, bpp);
> > @@ -416,6 +439,7 @@ static void block_copy(int xe,
> >   static void block_multicopy(int xe,
> >   			    intel_ctx_t *ctx,
> >   			    uint32_t region1, uint32_t region2,
> > +			    uint32_t width, uint32_t height,
> >   			    enum blt_tiling_type mid_tiling,
> >   			    const struct test_config *config)
> >   {
> > @@ -429,7 +453,7 @@ static void block_multicopy(int xe,
> >   	uint32_t run_id = mid_tiling;
> >   	uint32_t mid_region = (AT_LEAST_GEN(intel_get_drm_devid(xe), 20) &
> >   							!xe_has_vram(xe)) ? region1 : region2;
> > -	uint32_t width = param.width, height = param.height, bb;
> > +	uint32_t bb;
> >   	enum blt_compression mid_compression = config->compression;
> >   	int mid_compression_format = param.compression_format;
> >   	enum blt_compression_type comp_type = COMPRESSION_TYPE_3D;
> > @@ -521,6 +545,7 @@ static const struct {
> >   	void (*copyfn)(int fd,
> >   		       intel_ctx_t *ctx,
> >   		       uint32_t region1, uint32_t region2,
> > +		       uint32_t width, uint32_t height,
> >   		       enum blt_tiling_type btype,
> >   		       const struct test_config *config);
> >   } copyfns[] = {
> > @@ -528,17 +553,44 @@ static const struct {
> >   	[BLOCK_MULTICOPY] = { "-multicopy", block_multicopy },
> >   };
> > -static void block_copy_test(int xe,
> > -			    const struct test_config *config,
> > -			    struct igt_collection *set,
> > -			    enum copy_func copy_function)
> > +static void single_copy(int xe, const struct test_config *config,
> > +			int32_t region1, uint32_t region2,
> > +			uint32_t width, uint32_t height,
> > +			int tiling, enum copy_func copy_function)
> >   {
> >   	struct drm_xe_engine_class_instance inst = {
> >   		.engine_class = DRM_XE_ENGINE_CLASS_COPY,
> >   	};
> > +	uint32_t vm, exec_queue;
> > +	uint32_t sync_bind, sync_out;
> >   	intel_ctx_t *ctx;
> > +
> > +	vm = xe_vm_create(xe, 0, 0);
> > +	exec_queue = xe_exec_queue_create(xe, vm, &inst, 0);
> > +	sync_bind = syncobj_create(xe, 0);
> > +	sync_out = syncobj_create(xe, 0);
> > +	ctx = intel_ctx_xe(xe, vm, exec_queue,
> > +			   0, sync_bind, sync_out);
> > +
> > +	copyfns[copy_function].copyfn(xe, ctx,
> > +				      region1, region2,
> > +				      width, height,
> > +				      tiling, config);
> > +
> > +	xe_exec_queue_destroy(xe, exec_queue);
> > +	xe_vm_destroy(xe, vm);
> > +	syncobj_destroy(xe, sync_bind);
> > +	syncobj_destroy(xe, sync_out);
> > +	free(ctx);
> > +}
> > +
> > +static void block_copy_test(int xe,
> > +			    const struct test_config *config,
> > +			    struct igt_collection *set,
> > +			    enum copy_func copy_function)
> > +{
> > +
> 
> ^-- there's an empty line (I almost missed that!)

Thanks for spotting this.

> 
> But apart from that, the patch is looking good, I think. Just fix that line,
> and:
> 
> Reviewed-by: Karolina Stolarek <karolina.stolarek@intel.com>

Ok, thanks for the review.

--
Zbigniew

> 
> >   	struct igt_collection *regions;
> > -	uint32_t vm, exec_queue;
> >   	int tiling;
> >   	if (config->compression && !blt_block_copy_supports_compression(xe))
> > @@ -555,6 +607,7 @@ static void block_copy_test(int xe,
> >   		for_each_variation_r(regions, 2, set) {
> >   			uint32_t region1, region2;
> >   			char *regtxt;
> > +			char testname[256];
> >   			region1 = igt_collection_get_value(regions, 0);
> >   			region2 = igt_collection_get_value(regions, 1);
> > @@ -566,30 +619,36 @@ static void block_copy_test(int xe,
> >   			regtxt = xe_memregion_dynamic_subtest_name(xe, regions);
> > -			igt_dynamic_f("%s-%s-compfmt%d-%s%s",
> > -				      blt_tiling_name(tiling),
> > -				      config->compression ?
> > -					      "compressed" : "uncompressed",
> > -				      param.compression_format, regtxt,
> > -				      copyfns[copy_function].suffix) {
> > -				uint32_t sync_bind, sync_out;
> > +			snprintf(testname, sizeof(testname),
> > +				 "%s-%s-compfmt%d-%s%s",
> > +				 blt_tiling_name(tiling),
> > +				 config->compression ?
> > +					 "compressed" : "uncompressed",
> > +				 param.compression_format, regtxt,
> > +				 copyfns[copy_function].suffix);
> > -				vm = xe_vm_create(xe, 0, 0);
> > -				exec_queue = xe_exec_queue_create(xe, vm, &inst, 0);
> > -				sync_bind = syncobj_create(xe, 0);
> > -				sync_out = syncobj_create(xe, 0);
> > -				ctx = intel_ctx_xe(xe, vm, exec_queue,
> > -						   0, sync_bind, sync_out);
> > +			if (!config->width_increment) {
> > +				igt_dynamic(testname)
> > +					single_copy(xe, config, region1, region2,
> > +						    param.width, param.height,
> > +						    tiling, copy_function);
> > +			} else {
> > +				for (int w = param.width;
> > +				     w < param.width + config->width_steps;
> > +				     w += config->width_increment) {
> > +					snprintf(testname, sizeof(testname),
> > +						 "%s-%s-compfmt%d-%s%s-%dx%d",
> > +						 blt_tiling_name(tiling),
> > +						 config->compression ?
> > +							 "compressed" : "uncompressed",
> > +						 param.compression_format, regtxt,
> > +						 copyfns[copy_function].suffix,
> > +						 w, w);
> > +					igt_dynamic(testname)
> > +						single_copy(xe, config, region1, region2,
> > +							    w, w, tiling, copy_function);
> > +				}
> > -				copyfns[copy_function].copyfn(xe, ctx,
> > -							      region1, region2,
> > -							      tiling, config);
> > -
> > -				xe_exec_queue_destroy(xe, exec_queue);
> > -				xe_vm_destroy(xe, vm);
> > -				syncobj_destroy(xe, sync_bind);
> > -				syncobj_destroy(xe, sync_out);
> > -				free(ctx);
> >   			}
> >   			free(regtxt);
> > @@ -669,6 +728,16 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
> >   		block_copy_test(xe, &config, set, BLOCK_COPY);
> >   	}
> > +	igt_describe("Check block-copy uncompressed blit with increment width/height");
> > +	igt_subtest_with_dynamic("block-copy-uncompressed-inc-dimension") {
> > +		struct test_config config = { .width_increment = 15,
> > +					      .width_steps = 512 };
> > +		param.width = 1;
> > +		param.height = 1;
> > +
> > +		block_copy_test(xe, &config, set, BLOCK_COPY);
> > +	}
> > +
> >   	igt_describe("Check block-copy flatccs compressed blit");
> >   	igt_subtest_with_dynamic("block-copy-compressed") {
> >   		struct test_config config = { .compression = true };
> > @@ -676,6 +745,17 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
> >   		block_copy_test(xe, &config, set, BLOCK_COPY);
> >   	}
> > +	igt_describe("Check block-copy compressed blit with increment width/height");
> > +	igt_subtest_with_dynamic("block-copy-compressed-inc-dimension") {
> > +		struct test_config config = { .compression = true,
> > +					      .width_increment = 15,
> > +					      .width_steps = 512 };
> > +		param.width = 1;
> > +		param.height = 1;
> > +
> > +		block_copy_test(xe, &config, set, BLOCK_COPY);
> > +	}
> > +
> >   	igt_describe("Check block-multicopy flatccs compressed blit");
> >   	igt_subtest_with_dynamic("block-multicopy-compressed") {
> >   		struct test_config config = { .compression = true };
