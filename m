Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C75810E032
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Mar 2023 07:17:24 +0000 (UTC)
Date: Fri, 3 Mar 2023 08:17:20 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Karolina Stolarek <karolina.stolarek@intel.com>
Message-ID: <20230303071720.qg7c3mygoddbzitw@zkempczy-mobl2>
References: <20230302113946.1155746-1-karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302113946.1155746-1-karolina.stolarek@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/gem_ccs: Remove inplace subtests
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

On Thu, Mar 02, 2023 at 12:39:46PM +0100, Karolina Stolarek wrote:
> block-copy-inplace and block-multicopy-inplace attempt to
> decompress and detile in place, that is the destination surface
> is the mid surface. When working in full resolve mode of operation,
> the tiling format has to be the same for source and destination
> surfaces. We can't use different tiling formats, which defeats the
> purpose of these tests.
> 
> Remove the tests where we try to reuse the mid surface. Remove
> references to igt_hang_t, as without inplace subtests we expect
> to see no GPU hangs.
> 
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
> ---
>  tests/i915/gem_ccs.c | 38 +-------------------------------------
>  1 file changed, 1 insertion(+), 37 deletions(-)
> 
> diff --git a/tests/i915/gem_ccs.c b/tests/i915/gem_ccs.c
> index b7e8bda7..34408db9 100644
> --- a/tests/i915/gem_ccs.c
> +++ b/tests/i915/gem_ccs.c
> @@ -38,7 +38,6 @@ static struct param {
>  
>  struct test_config {
>  	bool compression;
> -	bool inplace;
>  	bool surfcopy;
>  	bool new_ctx;
>  	bool suspend_resume;
> @@ -423,11 +422,6 @@ static void block_copy(int i915,
>  	blt_set_copy_object(&blt.dst, dst);
>  	blt_set_object_ext(&ext.src, mid_compression_format, width, height, SURFACE_TYPE_2D);
>  	blt_set_object_ext(&ext.dst, 0, width, height, SURFACE_TYPE_2D);
> -	if (config->inplace) {
> -		blt_set_object(&blt.dst, mid->handle, dst->size, mid->region, 0,
> -			       T_LINEAR, COMPRESSION_DISABLED, comp_type);
> -		blt.dst.ptr = mid->ptr;
> -	}
>  
>  	blt_set_batch(&blt.bb, bb, bb_size, region1);
>  	blt_block_copy(i915, ctx, e, ahnd, &blt, pext);
> @@ -496,13 +490,6 @@ static void block_multicopy(int i915,
>  	blt_set_copy_object(&blt3.dst, dst);
>  	blt_set_copy_object(&blt3.final, final);
>  
> -	if (config->inplace) {
> -		blt_set_object(&blt3.dst, mid->handle, dst->size, mid->region,
> -			       mid->mocs, mid_tiling, COMPRESSION_DISABLED,
> -			       comp_type);
> -		blt3.dst.ptr = mid->ptr;
> -	}
> -
>  	blt_set_object_ext(&ext3.src, 0, width, height, SURFACE_TYPE_2D);
>  	blt_set_object_ext(&ext3.mid, mid_compression_format, width, height, SURFACE_TYPE_2D);
>  	blt_set_object_ext(&ext3.dst, 0, width, height, SURFACE_TYPE_2D);
> @@ -513,8 +500,7 @@ static void block_multicopy(int i915,
>  	gem_sync(i915, blt3.final.handle);
>  
>  	WRITE_PNG(i915, run_id, "src", &blt3.src, width, height);
> -	if (!config->inplace)
> -		WRITE_PNG(i915, run_id, "mid", &blt3.mid, width, height);
> +	WRITE_PNG(i915, run_id, "mid", &blt3.mid, width, height);
>  	WRITE_PNG(i915, run_id, "dst", &blt3.dst, width, height);
>  	WRITE_PNG(i915, run_id, "final", &blt3.final, width, height);
>  
> @@ -559,9 +545,6 @@ static void block_copy_test(int i915,
>  	if (config->compression && !blt_block_copy_supports_compression(i915))
>  		return;
>  
> -	if (config->inplace && !config->compression)
> -		return;
> -
>  	for_each_tiling(tiling) {
>  		if (!blt_block_copy_supports_tiling(i915, tiling) ||
>  		    (param.tiling >= 0 && param.tiling != tiling))
> @@ -656,7 +639,6 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
>  	struct igt_collection *set;
>  	const intel_ctx_t *ctx;
>  	int i915;
> -	igt_hang_t hang;
>  
>  	igt_fixture {
>  		i915 = drm_open_driver(DRIVER_INTEL);
> @@ -670,7 +652,6 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
>  					    I915_SYSTEM_MEMORY,
>  					    I915_DEVICE_MEMORY);
>  		ctx = intel_ctx_create_all_physical(i915);
> -		hang = igt_allow_hang(i915, ctx->id, 0);
>  	}
>  
>  	igt_describe("Check block-copy uncompressed blit");
> @@ -694,22 +675,6 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
>  		block_copy_test(i915, &config, ctx, set, BLOCK_MULTICOPY);
>  	}
>  
> -	igt_describe("Check block-copy flatccs inplace decompression blit");
> -	igt_subtest_with_dynamic("block-copy-inplace") {
> -		struct test_config config = { .compression = true,
> -					      .inplace = true };
> -
> -		block_copy_test(i915, &config, ctx, set, BLOCK_COPY);
> -	}
> -
> -	igt_describe("Check block-multicopy flatccs inplace decompression blit");
> -	igt_subtest_with_dynamic("block-multicopy-inplace") {
> -		struct test_config config = { .compression = true,
> -					      .inplace = true };
> -
> -		block_copy_test(i915, &config, ctx, set, BLOCK_MULTICOPY);
> -	}
> -

No. This one uses resolve with same tiling so it should stay.
Get rid of block-copy-inplace only.

--
Zbigniew

>  	igt_describe("Check flatccs data can be copied from/to surface");
>  	igt_subtest_with_dynamic("ctrl-surf-copy") {
>  		struct test_config config = { .compression = true,
> @@ -738,7 +703,6 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
>  	}
>  
>  	igt_fixture {
> -		igt_disallow_hang(i915, hang);
>  		close(i915);
>  	}
>  }
> -- 
> 2.25.1
> 
