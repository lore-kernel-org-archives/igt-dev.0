Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D8610E1C9
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Jan 2023 15:29:36 +0000 (UTC)
Date: Mon, 9 Jan 2023 16:29:31 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Karolina Stolarek <karolina.stolarek@intel.com>
Message-ID: <20230109152931.tg334xu56vhahop7@zkempczy-mobl2>
References: <cover.1671793169.git.karolina.stolarek@intel.com>
 <8a3c0858c3ec28effba60781915efd16c3369efe.1671793169.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8a3c0858c3ec28effba60781915efd16c3369efe.1671793169.git.karolina.stolarek@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 4/6] lib/i915_blt: Add common
 functions for blt_copy_object
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

On Fri, Dec 23, 2022 at 12:13:49PM +0100, Karolina Stolarek wrote:
> gem_ccs and gem_lmem_swapping tests share a number of functions.
> Extract them to i915_blt so they are accessible for both tests.
> Delete local definitions. Add blt_* prefixes to avoid potential
> name clash.
> 
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>

Ok, you've migrated common initialization part to library.

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> ---
>  lib/i915/i915_blt.c            |  95 ++++++++++++++++
>  lib/i915/i915_blt.h            |  30 ++++-
>  tests/i915/gem_ccs.c           | 196 +++++++++------------------------
>  tests/i915/gem_lmem_swapping.c |  81 +++-----------
>  4 files changed, 191 insertions(+), 211 deletions(-)
> 
> diff --git a/lib/i915/i915_blt.c b/lib/i915/i915_blt.c
> index 23ee2218..f0d148e4 100644
> --- a/lib/i915/i915_blt.c
> +++ b/lib/i915/i915_blt.c
> @@ -1123,6 +1123,101 @@ int blt_fast_copy(int i915,
>  	return ret;
>  }
>  
> +void blt_set_geom(struct blt_copy_object *obj, uint32_t pitch,
> +		  int16_t x1, int16_t y1, int16_t x2, int16_t y2,
> +		  uint16_t x_offset, uint16_t y_offset)
> +{
> +	obj->pitch = pitch;
> +	obj->x1 = x1;
> +	obj->y1 = y1;
> +	obj->x2 = x2;
> +	obj->y2 = y2;
> +	obj->x_offset = x_offset;
> +	obj->y_offset = y_offset;
> +}
> +
> +void blt_set_batch(struct blt_copy_batch *batch,
> +		   uint32_t handle, uint64_t size, uint32_t region)
> +{
> +	batch->handle = handle;
> +	batch->size = size;
> +	batch->region = region;
> +}
> +
> +struct blt_copy_object *
> +blt_create_object(int i915, uint32_t region,
> +		  uint32_t width, uint32_t height, uint32_t bpp, uint8_t mocs,
> +		  enum blt_tiling_type tiling,
> +		  enum blt_compression compression,
> +		  enum blt_compression_type compression_type,
> +		  bool create_mapping)
> +{
> +	struct blt_copy_object *obj;
> +	uint64_t size = width * height * bpp / 8;
> +	uint32_t stride = tiling == T_LINEAR ? width * 4 : width;
> +	uint32_t handle;
> +
> +	obj = calloc(1, sizeof(*obj));
> +
> +	obj->size = size;
> +	igt_assert(__gem_create_in_memory_regions(i915, &handle,
> +						  &size, region) == 0);
> +
> +	blt_set_object(obj, handle, size, region, mocs, tiling,
> +		       compression, compression_type);
> +	blt_set_geom(obj, stride, 0, 0, width, height, 0, 0);
> +
> +	if (create_mapping)
> +		obj->ptr = gem_mmap__device_coherent(i915, handle, 0, size,
> +						     PROT_READ | PROT_WRITE);
> +
> +	return obj;
> +}
> +
> +void blt_destroy_object(int i915, struct blt_copy_object *obj)
> +{
> +	if (obj->ptr)
> +		munmap(obj->ptr, obj->size);
> +
> +	gem_close(i915, obj->handle);
> +	free(obj);
> +}
> +
> +void blt_set_object(struct blt_copy_object *obj,
> +		    uint32_t handle, uint64_t size, uint32_t region,
> +		    uint8_t mocs, enum blt_tiling_type tiling,
> +		    enum blt_compression compression,
> +		    enum blt_compression_type compression_type)
> +{
> +	obj->handle = handle;
> +	obj->size = size;
> +	obj->region = region;
> +	obj->mocs = mocs;
> +	obj->tiling = tiling;
> +	obj->compression = compression;
> +	obj->compression_type = compression_type;
> +}
> +
> +void blt_set_object_ext(struct blt_block_copy_object_ext *obj,
> +			uint8_t compression_format,
> +			uint16_t surface_width, uint16_t surface_height,
> +			enum blt_surface_type surface_type)
> +{
> +	obj->compression_format = compression_format;
> +	obj->surface_width = surface_width;
> +	obj->surface_height = surface_height;
> +	obj->surface_type = surface_type;
> +
> +	/* Ensure mip tail won't overlap lod */
> +	obj->mip_tail_start_lod = 0xf;
> +}
> +
> +void blt_set_copy_object(struct blt_copy_object *obj,
> +			 const struct blt_copy_object *orig)
> +{
> +	memcpy(obj, orig, sizeof(*obj));
> +}
> +
>  /**
>   * blt_surface_fill_rect:
>   * @i915: drm fd
> diff --git a/lib/i915/i915_blt.h b/lib/i915/i915_blt.h
> index 3730c7c0..0f084055 100644
> --- a/lib/i915/i915_blt.h
> +++ b/lib/i915/i915_blt.h
> @@ -202,10 +202,36 @@ int blt_fast_copy(int i915,
>  		  uint64_t ahnd,
>  		  const struct blt_copy_data *blt);
>  
> +void blt_set_geom(struct blt_copy_object *obj, uint32_t pitch,
> +		  int16_t x1, int16_t y1, int16_t x2, int16_t y2,
> +		  uint16_t x_offset, uint16_t y_offset);
> +void blt_set_batch(struct blt_copy_batch *batch,
> +		   uint32_t handle, uint64_t size, uint32_t region);
> +
> +struct blt_copy_object *
> +blt_create_object(int i915, uint32_t region,
> +		  uint32_t width, uint32_t height, uint32_t bpp, uint8_t mocs,
> +		  enum blt_tiling_type tiling,
> +		  enum blt_compression compression,
> +		  enum blt_compression_type compression_type,
> +		  bool create_mapping);
> +void blt_destroy_object(int i915, struct blt_copy_object *obj);
> +void blt_set_object(struct blt_copy_object *obj,
> +		    uint32_t handle, uint64_t size, uint32_t region,
> +		    uint8_t mocs, enum blt_tiling_type tiling,
> +		    enum blt_compression compression,
> +		    enum blt_compression_type compression_type);
> +void blt_set_object_ext(struct blt_block_copy_object_ext *obj,
> +			uint8_t compression_format,
> +			uint16_t surface_width, uint16_t surface_height,
> +			enum blt_surface_type surface_type);
> +void blt_set_copy_object(struct blt_copy_object *obj,
> +			 const struct blt_copy_object *orig);
> +
>  void blt_surface_info(const char *info,
>  		      const struct blt_copy_object *obj);
>  void blt_surface_fill_rect(int i915, const struct blt_copy_object *obj,
>  			   uint32_t width, uint32_t height);
>  void blt_surface_to_png(int i915, uint32_t run_id, const char *fileid,
> -		    const struct blt_copy_object *obj,
> -		    uint32_t width, uint32_t height);
> +			const struct blt_copy_object *obj,
> +			uint32_t width, uint32_t height);
> diff --git a/tests/i915/gem_ccs.c b/tests/i915/gem_ccs.c
> index 10327050..b2da04b1 100644
> --- a/tests/i915/gem_ccs.c
> +++ b/tests/i915/gem_ccs.c
> @@ -44,56 +44,6 @@ struct test_config {
>  	bool suspend_resume;
>  };
>  
> -static void set_object(struct blt_copy_object *obj,
> -		       uint32_t handle, uint64_t size, uint32_t region,
> -		       uint8_t mocs, enum blt_tiling_type tiling,
> -		       enum blt_compression compression,
> -		       enum blt_compression_type compression_type)
> -{
> -	obj->handle = handle;
> -	obj->size = size;
> -	obj->region = region;
> -	obj->mocs = mocs;
> -	obj->tiling = tiling;
> -	obj->compression = compression;
> -	obj->compression_type = compression_type;
> -}
> -
> -static void set_geom(struct blt_copy_object *obj, uint32_t pitch,
> -		     int16_t x1, int16_t y1, int16_t x2, int16_t y2,
> -		     uint16_t x_offset, uint16_t y_offset)
> -{
> -	obj->pitch = pitch;
> -	obj->x1 = x1;
> -	obj->y1 = y1;
> -	obj->x2 = x2;
> -	obj->y2 = y2;
> -	obj->x_offset = x_offset;
> -	obj->y_offset = y_offset;
> -}
> -
> -static void set_batch(struct blt_copy_batch *batch,
> -		      uint32_t handle, uint64_t size, uint32_t region)
> -{
> -	batch->handle = handle;
> -	batch->size = size;
> -	batch->region = region;
> -}
> -
> -static void set_object_ext(struct blt_block_copy_object_ext *obj,
> -			   uint8_t compression_format,
> -			   uint16_t surface_width, uint16_t surface_height,
> -			   enum blt_surface_type surface_type)
> -{
> -	obj->compression_format = compression_format;
> -	obj->surface_width = surface_width;
> -	obj->surface_height = surface_height;
> -	obj->surface_type = surface_type;
> -
> -	/* Ensure mip tail won't overlap lod */
> -	obj->mip_tail_start_lod = 0xf;
> -}
> -
>  static void set_surf_object(struct blt_ctrl_surf_copy_object *obj,
>  			    uint32_t handle, uint32_t region, uint64_t size,
>  			    uint8_t mocs, enum blt_access_type access_type)
> @@ -105,51 +55,6 @@ static void set_surf_object(struct blt_ctrl_surf_copy_object *obj,
>  	obj->access_type = access_type;
>  }
>  
> -static struct blt_copy_object *
> -create_object(int i915, uint32_t region,
> -	      uint32_t width, uint32_t height, uint32_t bpp, uint8_t mocs,
> -	      enum blt_tiling_type tiling,
> -	      enum blt_compression compression,
> -	      enum blt_compression_type compression_type,
> -	      bool create_mapping)
> -{
> -	struct blt_copy_object *obj;
> -	uint64_t size = width * height * bpp / 8;
> -	uint32_t stride = tiling == T_LINEAR ? width * 4 : width;
> -	uint32_t handle;
> -
> -	obj = calloc(1, sizeof(*obj));
> -
> -	obj->size = size;
> -	igt_assert(__gem_create_in_memory_regions(i915, &handle,
> -						  &size, region) == 0);
> -
> -	set_object(obj, handle, size, region, mocs, tiling,
> -		   compression, compression_type);
> -	set_geom(obj, stride, 0, 0, width, height, 0, 0);
> -
> -	if (create_mapping)
> -		obj->ptr = gem_mmap__device_coherent(i915, handle, 0, size,
> -						     PROT_READ | PROT_WRITE);
> -
> -	return obj;
> -}
> -
> -static void destroy_object(int i915, struct blt_copy_object *obj)
> -{
> -	if (obj->ptr)
> -		munmap(obj->ptr, obj->size);
> -
> -	gem_close(i915, obj->handle);
> -	free(obj);
> -}
> -
> -static void set_blt_object(struct blt_copy_object *obj,
> -			   const struct blt_copy_object *orig)
> -{
> -	memcpy(obj, orig, sizeof(*obj));
> -}
> -
>  #define PRINT_SURFACE_INFO(name, obj) do { \
>  	if (param.print_surface_info) \
>  		blt_surface_info((name), (obj)); } while (0)
> @@ -189,7 +94,7 @@ static void surf_copy(int i915,
>  			uc_mocs, INDIRECT_ACCESS);
>  	set_surf_object(&surf.dst, ccs, REGION_SMEM, ccssize,
>  			uc_mocs, DIRECT_ACCESS);
> -	set_batch(&surf.bb, bb, bb_size, REGION_SMEM);
> +	blt_set_batch(&surf.bb, bb, bb_size, REGION_SMEM);
>  	blt_ctrl_surf_copy(i915, ctx, e, ahnd, &surf);
>  	gem_sync(i915, surf.dst.handle);
>  
> @@ -236,13 +141,13 @@ static void surf_copy(int i915,
>  	memset(&blt, 0, sizeof(blt));
>  	blt.color_depth = CD_32bit;
>  	blt.print_bb = param.print_bb;
> -	set_blt_object(&blt.src, mid);
> -	set_blt_object(&blt.dst, dst);
> -	set_object_ext(&ext.src, mid->compression_type, mid->x2, mid->y2, SURFACE_TYPE_2D);
> -	set_object_ext(&ext.dst, 0, dst->x2, dst->y2, SURFACE_TYPE_2D);
> +	blt_set_copy_object(&blt.src, mid);
> +	blt_set_copy_object(&blt.dst, dst);
> +	blt_set_object_ext(&ext.src, mid->compression_type, mid->x2, mid->y2, SURFACE_TYPE_2D);
> +	blt_set_object_ext(&ext.dst, 0, dst->x2, dst->y2, SURFACE_TYPE_2D);
>  	bb_size = 4096;
>  	bb = gem_create_from_pool(i915, &bb_size, REGION_SMEM);
> -	set_batch(&blt.bb, bb, bb_size, REGION_SMEM);
> +	blt_set_batch(&blt.bb, bb, bb_size, REGION_SMEM);
>  	blt_block_copy(i915, ctx, e, ahnd, &blt, &ext);
>  	gem_sync(i915, blt.dst.handle);
>  	WRITE_PNG(i915, run_id, "corrupted", &blt.dst, dst->x2, dst->y2);
> @@ -399,12 +304,12 @@ static void block_copy(int i915,
>  	if (!blt_supports_compression(i915))
>  		pext = NULL;
>  
> -	src = create_object(i915, region1, width, height, bpp, uc_mocs,
> -			    T_LINEAR, COMPRESSION_DISABLED, comp_type, true);
> -	mid = create_object(i915, mid_region, width, height, bpp, uc_mocs,
> -			    mid_tiling, mid_compression, comp_type, true);
> -	dst = create_object(i915, region1, width, height, bpp, uc_mocs,
> -			    T_LINEAR, COMPRESSION_DISABLED, comp_type, true);
> +	src = blt_create_object(i915, region1, width, height, bpp, uc_mocs,
> +				T_LINEAR, COMPRESSION_DISABLED, comp_type, true);
> +	mid = blt_create_object(i915, mid_region, width, height, bpp, uc_mocs,
> +				mid_tiling, mid_compression, comp_type, true);
> +	dst = blt_create_object(i915, region1, width, height, bpp, uc_mocs,
> +				T_LINEAR, COMPRESSION_DISABLED, comp_type, true);
>  	igt_assert(src->size == dst->size);
>  	PRINT_SURFACE_INFO("src", src);
>  	PRINT_SURFACE_INFO("mid", mid);
> @@ -416,11 +321,11 @@ static void block_copy(int i915,
>  	memset(&blt, 0, sizeof(blt));
>  	blt.color_depth = CD_32bit;
>  	blt.print_bb = param.print_bb;
> -	set_blt_object(&blt.src, src);
> -	set_blt_object(&blt.dst, mid);
> -	set_object_ext(&ext.src, 0, width, height, SURFACE_TYPE_2D);
> -	set_object_ext(&ext.dst, mid_compression_format, width, height, SURFACE_TYPE_2D);
> -	set_batch(&blt.bb, bb, bb_size, region1);
> +	blt_set_copy_object(&blt.src, src);
> +	blt_set_copy_object(&blt.dst, mid);
> +	blt_set_object_ext(&ext.src, 0, width, height, SURFACE_TYPE_2D);
> +	blt_set_object_ext(&ext.dst, mid_compression_format, width, height, SURFACE_TYPE_2D);
> +	blt_set_batch(&blt.bb, bb, bb_size, region1);
>  
>  	blt_block_copy(i915, ctx, e, ahnd, &blt, pext);
>  	gem_sync(i915, mid->handle);
> @@ -462,26 +367,26 @@ static void block_copy(int i915,
>  	memset(&blt, 0, sizeof(blt));
>  	blt.color_depth = CD_32bit;
>  	blt.print_bb = param.print_bb;
> -	set_blt_object(&blt.src, mid);
> -	set_blt_object(&blt.dst, dst);
> -	set_object_ext(&ext.src, mid_compression_format, width, height, SURFACE_TYPE_2D);
> -	set_object_ext(&ext.dst, 0, width, height, SURFACE_TYPE_2D);
> +	blt_set_copy_object(&blt.src, mid);
> +	blt_set_copy_object(&blt.dst, dst);
> +	blt_set_object_ext(&ext.src, mid_compression_format, width, height, SURFACE_TYPE_2D);
> +	blt_set_object_ext(&ext.dst, 0, width, height, SURFACE_TYPE_2D);
>  	if (config->inplace) {
> -		set_object(&blt.dst, mid->handle, dst->size, mid->region, 0,
> -			   T_LINEAR, COMPRESSION_DISABLED, comp_type);
> +		blt_set_object(&blt.dst, mid->handle, dst->size, mid->region, 0,
> +			       T_LINEAR, COMPRESSION_DISABLED, comp_type);
>  		blt.dst.ptr = mid->ptr;
>  	}
>  
> -	set_batch(&blt.bb, bb, bb_size, region1);
> +	blt_set_batch(&blt.bb, bb, bb_size, region1);
>  	blt_block_copy(i915, ctx, e, ahnd, &blt, pext);
>  	gem_sync(i915, blt.dst.handle);
>  	WRITE_PNG(i915, run_id, "dst", &blt.dst, width, height);
>  
>  	result = memcmp(src->ptr, blt.dst.ptr, src->size);
>  
> -	destroy_object(i915, src);
> -	destroy_object(i915, mid);
> -	destroy_object(i915, dst);
> +	blt_destroy_object(i915, src);
> +	blt_destroy_object(i915, mid);
> +	blt_destroy_object(i915, dst);
>  	gem_close(i915, bb);
>  	put_ahnd(ahnd);
>  
> @@ -515,14 +420,14 @@ static void block_multicopy(int i915,
>  	if (!blt_supports_compression(i915))
>  		pext3 = NULL;
>  
> -	src = create_object(i915, region1, width, height, bpp, uc_mocs,
> -			    T_LINEAR, COMPRESSION_DISABLED, comp_type, true);
> -	mid = create_object(i915, mid_region, width, height, bpp, uc_mocs,
> -			    mid_tiling, mid_compression, comp_type, true);
> -	dst = create_object(i915, region1, width, height, bpp, uc_mocs,
> -			    mid_tiling, COMPRESSION_DISABLED, comp_type, true);
> -	final = create_object(i915, region1, width, height, bpp, uc_mocs,
> -			      T_LINEAR, COMPRESSION_DISABLED, comp_type, true);
> +	src = blt_create_object(i915, region1, width, height, bpp, uc_mocs,
> +				T_LINEAR, COMPRESSION_DISABLED, comp_type, true);
> +	mid = blt_create_object(i915, mid_region, width, height, bpp, uc_mocs,
> +				mid_tiling, mid_compression, comp_type, true);
> +	dst = blt_create_object(i915, region1, width, height, bpp, uc_mocs,
> +				mid_tiling, COMPRESSION_DISABLED, comp_type, true);
> +	final = blt_create_object(i915, region1, width, height, bpp, uc_mocs,
> +				  T_LINEAR, COMPRESSION_DISABLED, comp_type, true);
>  	igt_assert(src->size == dst->size);
>  	PRINT_SURFACE_INFO("src", src);
>  	PRINT_SURFACE_INFO("mid", mid);
> @@ -534,22 +439,23 @@ static void block_multicopy(int i915,
>  	memset(&blt3, 0, sizeof(blt3));
>  	blt3.color_depth = CD_32bit;
>  	blt3.print_bb = param.print_bb;
> -	set_blt_object(&blt3.src, src);
> -	set_blt_object(&blt3.mid, mid);
> -	set_blt_object(&blt3.dst, dst);
> -	set_blt_object(&blt3.final, final);
> +	blt_set_copy_object(&blt3.src, src);
> +	blt_set_copy_object(&blt3.mid, mid);
> +	blt_set_copy_object(&blt3.dst, dst);
> +	blt_set_copy_object(&blt3.final, final);
>  
>  	if (config->inplace) {
> -		set_object(&blt3.dst, mid->handle, dst->size, mid->region, mid->mocs,
> -			   mid_tiling, COMPRESSION_DISABLED, comp_type);
> +		blt_set_object(&blt3.dst, mid->handle, dst->size, mid->region,
> +			       mid->mocs, mid_tiling, COMPRESSION_DISABLED,
> +			       comp_type);
>  		blt3.dst.ptr = mid->ptr;
>  	}
>  
> -	set_object_ext(&ext3.src, 0, width, height, SURFACE_TYPE_2D);
> -	set_object_ext(&ext3.mid, mid_compression_format, width, height, SURFACE_TYPE_2D);
> -	set_object_ext(&ext3.dst, 0, width, height, SURFACE_TYPE_2D);
> -	set_object_ext(&ext3.final, 0, width, height, SURFACE_TYPE_2D);
> -	set_batch(&blt3.bb, bb, bb_size, region1);
> +	blt_set_object_ext(&ext3.src, 0, width, height, SURFACE_TYPE_2D);
> +	blt_set_object_ext(&ext3.mid, mid_compression_format, width, height, SURFACE_TYPE_2D);
> +	blt_set_object_ext(&ext3.dst, 0, width, height, SURFACE_TYPE_2D);
> +	blt_set_object_ext(&ext3.final, 0, width, height, SURFACE_TYPE_2D);
> +	blt_set_batch(&blt3.bb, bb, bb_size, region1);
>  
>  	blt_block_copy3(i915, ctx, e, ahnd, &blt3, pext3);
>  	gem_sync(i915, blt3.final.handle);
> @@ -562,10 +468,10 @@ static void block_multicopy(int i915,
>  
>  	result = memcmp(src->ptr, blt3.final.ptr, src->size);
>  
> -	destroy_object(i915, src);
> -	destroy_object(i915, mid);
> -	destroy_object(i915, dst);
> -	destroy_object(i915, final);
> +	blt_destroy_object(i915, src);
> +	blt_destroy_object(i915, mid);
> +	blt_destroy_object(i915, dst);
> +	blt_destroy_object(i915, final);
>  	gem_close(i915, bb);
>  	put_ahnd(ahnd);
>  
> diff --git a/tests/i915/gem_lmem_swapping.c b/tests/i915/gem_lmem_swapping.c
> index 9388d4de..55b044ec 100644
> --- a/tests/i915/gem_lmem_swapping.c
> +++ b/tests/i915/gem_lmem_swapping.c
> @@ -76,53 +76,6 @@ struct object {
>  	struct blt_copy_object *blt_obj;
>  };
>  
> -static void set_object(struct blt_copy_object *obj,
> -		       uint32_t handle, uint64_t size, uint32_t region,
> -		       uint8_t mocs, enum blt_tiling_type tiling,
> -		       enum blt_compression compression,
> -		       enum blt_compression_type compression_type)
> -{
> -	obj->handle = handle;
> -	obj->size = size;
> -	obj->region = region;
> -	obj->mocs = mocs;
> -	obj->tiling = tiling;
> -	obj->compression = compression;
> -	obj->compression_type = compression_type;
> -}
> -
> -static void set_geom(struct blt_copy_object *obj, uint32_t pitch,
> -		     int16_t x1, int16_t y1, int16_t x2, int16_t y2,
> -		     uint16_t x_offset, uint16_t y_offset)
> -{
> -	obj->pitch = pitch;
> -	obj->x1 = x1;
> -	obj->y1 = y1;
> -	obj->x2 = x2;
> -	obj->y2 = y2;
> -	obj->x_offset = x_offset;
> -	obj->y_offset = y_offset;
> -}
> -
> -static void set_batch(struct blt_copy_batch *batch,
> -		      uint32_t handle, uint64_t size, uint32_t region)
> -{
> -	batch->handle = handle;
> -	batch->size = size;
> -	batch->region = region;
> -}
> -
> -static void set_object_ext(struct blt_block_copy_object_ext *obj,
> -			   uint8_t compression_format,
> -			   uint16_t surface_width, uint16_t surface_height,
> -			   enum blt_surface_type surface_type)
> -{
> -	obj->compression_format = compression_format;
> -	obj->surface_width = surface_width;
> -	obj->surface_height = surface_height;
> -	obj->surface_type = surface_type;
> -}
> -
>  static uint32_t create_bo(int i915,
>  			  uint64_t *size,
>  			  struct drm_i915_gem_memory_class_instance *region,
> @@ -179,7 +132,7 @@ init_object_ccs(int i915, struct object *obj, struct blt_copy_object *tmp,
>  	cmd = calloc(1, sizeof(*cmd));
>  	igt_assert(cmd);
>  	cmd->handle = gem_create_from_pool(i915, &size, region);
> -	set_batch(cmd, cmd->handle, size, region);
> +	blt_set_batch(cmd, cmd->handle, size, region);
>  
>  	buf = gem_mmap__device_coherent(i915, tmp->handle, 0, obj->size, PROT_WRITE);
>  	gem_set_domain(i915, tmp->handle, I915_GEM_DOMAIN_WC, I915_GEM_DOMAIN_WC);
> @@ -195,9 +148,9 @@ init_object_ccs(int i915, struct object *obj, struct blt_copy_object *tmp,
>  	memcpy(&blt.dst, obj->blt_obj, sizeof(blt.dst));
>  	memcpy(&blt.bb, cmd, sizeof(blt.bb));
>  
> -	set_object_ext(&ext.src, 0, tmp->x2, tmp->y2, SURFACE_TYPE_2D);
> -	set_object_ext(&ext.dst, 0, obj->blt_obj->x2, obj->blt_obj->y2,
> -		       SURFACE_TYPE_2D);
> +	blt_set_object_ext(&ext.src, 0, tmp->x2, tmp->y2, SURFACE_TYPE_2D);
> +	blt_set_object_ext(&ext.dst, 0, obj->blt_obj->x2, obj->blt_obj->y2,
> +			   SURFACE_TYPE_2D);
>  
>  	blt_block_copy(i915, ctx, e, ahnd, &blt, pext);
>  	free(cmd);
> @@ -244,7 +197,7 @@ verify_object_ccs(int i915, const struct object *obj,
>  	cmd = calloc(1, sizeof(*cmd));
>  	igt_assert(cmd);
>  	cmd->handle = gem_create_from_pool(i915, &size, region);
> -	set_batch(cmd, cmd->handle, size, region);
> +	blt_set_batch(cmd, cmd->handle, size, region);
>  
>  	memset(&blt, 0, sizeof(blt));
>  	blt.color_depth = CD_32bit;
> @@ -256,9 +209,9 @@ verify_object_ccs(int i915, const struct object *obj,
>  	blt.dst.x2 = min(obj->blt_obj->x2, tmp->x2);
>  	blt.dst.y2 = min(obj->blt_obj->y2, tmp->y2);
>  
> -	set_object_ext(&ext.src, 0, obj->blt_obj->x2, obj->blt_obj->y2,
> -		       SURFACE_TYPE_2D);
> -	set_object_ext(&ext.dst, 0, tmp->x2, tmp->y2, SURFACE_TYPE_2D);
> +	blt_set_object_ext(&ext.src, 0, obj->blt_obj->x2, obj->blt_obj->y2,
> +			   SURFACE_TYPE_2D);
> +	blt_set_object_ext(&ext.dst, 0, tmp->x2, tmp->y2, SURFACE_TYPE_2D);
>  	blt_block_copy(i915, ctx, e, ahnd, &blt, pext);
>  
>  	buf = gem_mmap__device_coherent(i915, tmp->handle, 0,
> @@ -364,11 +317,11 @@ static void __do_evict(int i915,
>  
>  		tmp->handle = gem_create_in_memory_regions(i915, params->size.max,
>  				   INTEL_MEMORY_REGION_ID(I915_SYSTEM_MEMORY, 0));
> -		set_object(tmp, tmp->handle, params->size.max,
> -			   INTEL_MEMORY_REGION_ID(I915_SYSTEM_MEMORY, 0),
> -			   intel_get_uc_mocs(i915), T_LINEAR,
> -			   COMPRESSION_DISABLED, COMPRESSION_TYPE_3D);
> -		set_geom(tmp, stride, 0, 0, width, height, 0, 0);
> +		blt_set_object(tmp, tmp->handle, params->size.max,
> +			       INTEL_MEMORY_REGION_ID(I915_SYSTEM_MEMORY, 0),
> +			       intel_get_uc_mocs(i915), T_LINEAR,
> +			       COMPRESSION_DISABLED, COMPRESSION_TYPE_3D);
> +		blt_set_geom(tmp, stride, 0, 0, width, height, 0, 0);
>  	}
>  
>  	size = 0;
> @@ -395,10 +348,10 @@ static void __do_evict(int i915,
>  
>  			obj->blt_obj = calloc(1, sizeof(*obj->blt_obj));
>  			igt_assert(obj->blt_obj);
> -			set_object(obj->blt_obj, obj->handle, obj->size, region_id,
> -				   intel_get_uc_mocs(i915), T_LINEAR,
> -				   COMPRESSION_ENABLED, COMPRESSION_TYPE_3D);
> -			set_geom(obj->blt_obj, stride, 0, 0, width, height, 0, 0);
> +			blt_set_object(obj->blt_obj, obj->handle, obj->size, region_id,
> +				       intel_get_uc_mocs(i915), T_LINEAR,
> +				       COMPRESSION_ENABLED, COMPRESSION_TYPE_3D);
> +			blt_set_geom(obj->blt_obj, stride, 0, 0, width, height, 0, 0);
>  			init_object_ccs(i915, obj, tmp, rand(), blt_ctx,
>  					region_id, ahnd);
>  		} else if (params->flags & TEST_VERIFY) {
> -- 
> 2.25.1
> 
