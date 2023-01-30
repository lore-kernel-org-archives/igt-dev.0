Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42DB610E09A
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jan 2023 19:26:31 +0000 (UTC)
Date: Mon, 30 Jan 2023 20:26:05 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Karolina Stolarek <karolina.stolarek@intel.com>
Message-ID: <20230130192605.bm7ji6kkrxywzpc4@zkempczy-mobl2>
References: <cover.1674469729.git.karolina.stolarek@intel.com>
 <e5566d38c432c8ab1608700569f6804b97fa15c4.1674469729.git.karolina.stolarek@intel.com>
 <20230126121350.kdyvqhcr477izj5e@zkempczy-mobl2>
 <2ab35ef4-c027-99c5-721f-95b845cd0620@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2ab35ef4-c027-99c5-721f-95b845cd0620@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] lib/i915_blt: Split up
 blt_copy_object functions
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

On Mon, Jan 30, 2023 at 09:21:09AM +0100, Karolina Stolarek wrote:
> Hi,
> 
> On 26.01.2023 13:13, Zbigniew Kempczyński wrote:
> > On Mon, Jan 23, 2023 at 11:52:43AM +0100, Karolina Stolarek wrote:
> > > Add dedicated functions to set and create blt_copy_object depending on
> > > the copy type. Extract the common path so it can be called both in fast
> > > and block copy setup. Move mocs field in blt_copy_object so it's next
> > > to the compression-specific fields.
> > > 
> > > Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
> > > ---
> > >   lib/i915/i915_blt.c            | 92 ++++++++++++++++++++++++----------
> > >   lib/i915/i915_blt.h            | 29 +++++++----
> > >   tests/i915/gem_ccs.c           | 39 +++++++-------
> > >   tests/i915/gem_exercise_blt.c  | 18 +++----
> > >   tests/i915/gem_lmem_swapping.c | 13 ++---
> > >   5 files changed, 117 insertions(+), 74 deletions(-)
> > > 
> > > diff --git a/lib/i915/i915_blt.c b/lib/i915/i915_blt.c
> > > index 3e64efeb..979c7161 100644
> > > --- a/lib/i915/i915_blt.c
> > > +++ b/lib/i915/i915_blt.c
> > > @@ -1214,12 +1214,29 @@ void blt_set_batch(struct blt_copy_batch *batch,
> > >   	batch->region = region;
> > >   }
> > > -struct blt_copy_object *
> > > -blt_create_object(int i915, uint32_t region,
> > > -		  uint32_t width, uint32_t height, uint32_t bpp, uint8_t mocs,
> > > -		  enum blt_tiling_type tiling,
> > > -		  enum blt_compression compression,
> > > -		  enum blt_compression_type compression_type)
> > > +static void blt_set_object_common(struct blt_copy_object *obj,
> > > +				  uint32_t handle, uint64_t size,
> > > +				  uint32_t region, enum blt_tiling_type tiling)
> > > +{
> > > +	obj->handle = handle;
> > > +	obj->size = size;
> > > +	obj->region = region;
> > > +	obj->tiling = tiling;
> > > +}
> > > +
> > > +static void blt_set_object_compression(struct blt_copy_object *obj, uint8_t mocs,
> > > +				       enum blt_compression compression,
> > > +				       enum blt_compression_type compression_type)
> > > +{
> > > +	obj->mocs = mocs;
> > > +	obj->compression = compression;
> > > +	obj->compression_type = compression_type;
> > > +}
> > > +
> > > +static struct blt_copy_object *
> > > +blt_create_object_common(int i915, uint32_t region, uint32_t width,
> > > +			 uint32_t height, uint32_t bpp,
> > > +			 enum blt_tiling_type tiling)
> > 
> > This should be public. We assume above fields are common to all
> > supported commands we have (block-copy, fast-copy, etc), so user
> > can call this generic function and it should work for all
> > blit instructions. That means that you should fill mocs here even
> > if user didn't explicitly passed this value.
> > 
> > Rename this to blt_create_object(), I don't think _common suffix
> > is really necessary here.
> 
> But this means we'd have blt_create_block_copy and blt_create_object, as it
> wouldn't make sense to also have blt_create_fast_object. Having a special
> treatment of block-copy would make things confusing.

I think we should have smallest universal blt_create_object() which
should take minimal arguments list to cover all blit commands we
support. Internally it can fill additional fields like mocs for
block-copy (it is necessary to do proper blit).  I mean we should
provide some single and simple blit function which internally will
select instruction supported for platform. Currently we have a lot
of conditional code which should be handled by library call, not in
the test itself.

I mean sth like this:

srcobj = blt_create_object(i915, region, w, h, bpp, tiling);
dstobj = blt_create_object(i915, region, w, h, bpp, tiling);

blt_do_blit(i915, srcobj, dstobj);

or

pos = blt_emit_blit(i915, srcobj, dstobj, pos);

Underlying blt_emit_blit() should take care to fill batch with valid
blitter command supported on the platform. Otherwise what we're doing
still will stick to manual command selection with conditional code.

--
Zbigniew

> 
> The best option would be to have blt_create_fast_object and call it inside
> blt_create_block_object. It'd would be fine by the user, maybe slightly
> confusing for people who maintain the lib, but it should be alright.
> 
> I think we should separate the commands, even if they use the same struct
> underneath.
> 
> Thanks,
> Karolina
> > --
> > Zbigniew
> > 
> > >   {
> > >   	struct blt_copy_object *obj;
> > >   	uint64_t size = width * height * bpp / 8;
> > > @@ -1228,20 +1245,58 @@ blt_create_object(int i915, uint32_t region,
> > >   	obj = calloc(1, sizeof(*obj));
> > > -	obj->size = size;
> > >   	igt_assert(__gem_create_in_memory_regions(i915, &handle,
> > >   						  &size, region) == 0);
> > > +	obj->ptr = gem_mmap__device_coherent(i915, handle, 0, size,
> > > +					     PROT_READ | PROT_WRITE);
> > > +	obj->size = size;
> > > -	blt_set_object(obj, handle, size, region, mocs, tiling,
> > > -		       compression, compression_type);
> > > +	blt_set_object_common(obj, handle, size, region, tiling);
> > >   	blt_set_geom(obj, stride, 0, 0, width, height, 0, 0);
> > > -	obj->ptr = gem_mmap__device_coherent(i915, handle, 0, size,
> > > -					     PROT_READ | PROT_WRITE);
> > > +	return obj;
> > > +}
> > > +
> > > +struct blt_copy_object *
> > > +blt_create_block_object(int i915, uint32_t region,
> > > +			uint32_t width, uint32_t height, uint32_t bpp,
> > > +			uint8_t mocs, enum blt_tiling_type tiling,
> > > +			enum blt_compression compression,
> > > +			enum blt_compression_type compression_type)
> > a> +{
> > > +	struct blt_copy_object *obj;
> > > +
> > > +	obj = blt_create_object_common(i915, region, width, height, bpp, tiling);
> > > +	blt_set_object_compression(obj, mocs, compression, compression_type);
> > >   	return obj;
> > >   }
> > > +struct blt_copy_object *
> > > +blt_create_fast_object(int i915, uint32_t region, uint32_t width,
> > > +		       uint32_t height, uint32_t bpp,
> > > +		       enum blt_tiling_type tiling)
> > > +{
> > > +	return blt_create_object_common(i915, region, width, height, bpp, tiling);
> > > +}
> > > +
> > > +void blt_set_block_object(struct blt_copy_object *obj,
> > > +			  uint32_t handle, uint64_t size, uint32_t region,
> > > +			  uint8_t mocs, enum blt_tiling_type tiling,
> > > +			  enum blt_compression compression,
> > > +			  enum blt_compression_type compression_type)
> > > +{
> > > +	blt_set_object_common(obj, handle, size, region, tiling);
> > > +	blt_set_object_compression(obj, mocs, compression, compression_type);
> > > +}
> > > +
> > > +void blt_set_fast_object(struct blt_copy_object *obj,
> > > +			 uint32_t handle, uint64_t size,
> > > +			 uint32_t region, enum blt_tiling_type tiling)
> > > +{
> > > +	blt_set_object_common(obj, handle, size, region, tiling);
> > > +}
> > > +
> > >   void blt_destroy_object(int i915, struct blt_copy_object *obj)
> > >   {
> > >   	if (obj->ptr)
> > > @@ -1251,21 +1306,6 @@ void blt_destroy_object(int i915, struct blt_copy_object *obj)
> > >   	free(obj);
> > >   }
> > > -void blt_set_object(struct blt_copy_object *obj,
> > > -		    uint32_t handle, uint64_t size, uint32_t region,
> > > -		    uint8_t mocs, enum blt_tiling_type tiling,
> > > -		    enum blt_compression compression,
> > > -		    enum blt_compression_type compression_type)
> > > -{
> > > -	obj->handle = handle;
> > > -	obj->size = size;
> > > -	obj->region = region;
> > > -	obj->mocs = mocs;
> > > -	obj->tiling = tiling;
> > > -	obj->compression = compression;
> > > -	obj->compression_type = compression_type;
> > > -}
> > > -
> > >   void blt_set_object_ext(struct blt_block_copy_object_ext *obj,
> > >   			uint8_t compression_format,
> > >   			uint16_t surface_width, uint16_t surface_height,
> > > diff --git a/lib/i915/i915_blt.h b/lib/i915/i915_blt.h
> > > index eaf4cc1f..1bd29c8c 100644
> > > --- a/lib/i915/i915_blt.h
> > > +++ b/lib/i915/i915_blt.h
> > > @@ -75,8 +75,8 @@ struct blt_copy_object {
> > >   	uint32_t handle;
> > >   	uint32_t region;
> > >   	uint64_t size;
> > > -	uint8_t mocs;
> > >   	enum blt_tiling_type tiling;
> > > +	uint8_t mocs; /* BC only */
> > >   	enum blt_compression compression;  /* BC only */
> > >   	enum blt_compression_type compression_type; /* BC only */
> > >   	uint32_t pitch;
> > > @@ -214,17 +214,24 @@ void blt_set_batch(struct blt_copy_batch *batch,
> > >   		   uint32_t handle, uint64_t size, uint32_t region);
> > >   struct blt_copy_object *
> > > -blt_create_object(int i915, uint32_t region,
> > > -		  uint32_t width, uint32_t height, uint32_t bpp, uint8_t mocs,
> > > -		  enum blt_tiling_type tiling,
> > > -		  enum blt_compression compression,
> > > -		  enum blt_compression_type compression_type);
> > > +blt_create_block_object(int i915, uint32_t region,
> > > +			uint32_t width, uint32_t height, uint32_t bpp,
> > > +			uint8_t mocs, enum blt_tiling_type tiling,
> > > +			enum blt_compression compression,
> > > +			enum blt_compression_type compression_type);
> > > +struct blt_copy_object *
> > > +blt_create_fast_object(int i915, uint32_t region,
> > > +		       uint32_t width, uint32_t height, uint32_t bpp,
> > > +		       enum blt_tiling_type tiling);
> > >   void blt_destroy_object(int i915, struct blt_copy_object *obj);
> > > -void blt_set_object(struct blt_copy_object *obj,
> > > -		    uint32_t handle, uint64_t size, uint32_t region,
> > > -		    uint8_t mocs, enum blt_tiling_type tiling,
> > > -		    enum blt_compression compression,
> > > -		    enum blt_compression_type compression_type);
> > > +void blt_set_block_object(struct blt_copy_object *obj,
> > > +			  uint32_t handle, uint64_t size, uint32_t region,
> > > +			  uint8_t mocs, enum blt_tiling_type tiling,
> > > +			  enum blt_compression compression,
> > > +			  enum blt_compression_type compression_type);
> > > +void blt_set_fast_object(struct blt_copy_object *obj,
> > > +			 uint32_t handle, uint64_t size, uint32_t region,
> > > +			 enum blt_tiling_type tiling);
> > >   void blt_set_object_ext(struct blt_block_copy_object_ext *obj,
> > >   			uint8_t compression_format,
> > >   			uint16_t surface_width, uint16_t surface_height,
> > > diff --git a/tests/i915/gem_ccs.c b/tests/i915/gem_ccs.c
> > > index b7a32673..7e16c792 100644
> > > --- a/tests/i915/gem_ccs.c
> > > +++ b/tests/i915/gem_ccs.c
> > > @@ -360,12 +360,12 @@ static void block_copy(int i915,
> > >   	if (!blt_supports_compression(i915) && !IS_METEORLAKE(devid))
> > >   		pext = NULL;
> > > -	src = blt_create_object(i915, region1, width, height, bpp, uc_mocs,
> > > -				T_LINEAR, COMPRESSION_DISABLED, comp_type);
> > > -	mid = blt_create_object(i915, mid_region, width, height, bpp, uc_mocs,
> > > -				mid_tiling, mid_compression, comp_type);
> > > -	dst = blt_create_object(i915, region1, width, height, bpp, uc_mocs,
> > > -				T_LINEAR, COMPRESSION_DISABLED, comp_type);
> > > +	src = blt_create_block_object(i915, region1, width, height, bpp, uc_mocs,
> > > +				      T_LINEAR, COMPRESSION_DISABLED, comp_type);
> > > +	mid = blt_create_block_object(i915, mid_region, width, height, bpp, uc_mocs,
> > > +				      mid_tiling, mid_compression, comp_type);
> > > +	dst = blt_create_block_object(i915, region1, width, height, bpp, uc_mocs,
> > > +				      T_LINEAR, COMPRESSION_DISABLED, comp_type);
> > >   	igt_assert(src->size == dst->size);
> > >   	PRINT_SURFACE_INFO("src", src);
> > >   	PRINT_SURFACE_INFO("mid", mid);
> > > @@ -428,8 +428,9 @@ static void block_copy(int i915,
> > >   	blt_set_object_ext(&ext.src, mid_compression_format, width, height, SURFACE_TYPE_2D);
> > >   	blt_set_object_ext(&ext.dst, 0, width, height, SURFACE_TYPE_2D);
> > >   	if (config->inplace) {
> > > -		blt_set_object(&blt.dst, mid->handle, dst->size, mid->region, 0,
> > > -			       T_LINEAR, COMPRESSION_DISABLED, comp_type);
> > > +		blt_set_block_object(&blt.dst, mid->handle, dst->size,
> > > +				     mid->region, 0, T_LINEAR,
> > > +				     COMPRESSION_DISABLED, comp_type);
> > >   		blt.dst.ptr = mid->ptr;
> > >   	}
> > > @@ -476,14 +477,14 @@ static void block_multicopy(int i915,
> > >   	if (!blt_supports_compression(i915))
> > >   		pext3 = NULL;
> > > -	src = blt_create_object(i915, region1, width, height, bpp, uc_mocs,
> > > -				T_LINEAR, COMPRESSION_DISABLED, comp_type);
> > > -	mid = blt_create_object(i915, mid_region, width, height, bpp, uc_mocs,
> > > -				mid_tiling, mid_compression, comp_type);
> > > -	dst = blt_create_object(i915, region1, width, height, bpp, uc_mocs,
> > > -				mid_tiling, COMPRESSION_DISABLED, comp_type);
> > > -	final = blt_create_object(i915, region1, width, height, bpp, uc_mocs,
> > > -				  T_LINEAR, COMPRESSION_DISABLED, comp_type);
> > > +	src = blt_create_block_object(i915, region1, width, height, bpp, uc_mocs,
> > > +				      T_LINEAR, COMPRESSION_DISABLED, comp_type);
> > > +	mid = blt_create_block_object(i915, mid_region, width, height, bpp,
> > > +				      uc_mocs, mid_tiling, mid_compression, comp_type);
> > > +	dst = blt_create_block_object(i915, region1, width, height, bpp, uc_mocs,
> > > +				      mid_tiling, COMPRESSION_DISABLED, comp_type);
> > > +	final = blt_create_block_object(i915, region1, width, height, bpp, uc_mocs,
> > > +					T_LINEAR, COMPRESSION_DISABLED, comp_type);
> > >   	igt_assert(src->size == dst->size);
> > >   	PRINT_SURFACE_INFO("src", src);
> > >   	PRINT_SURFACE_INFO("mid", mid);
> > > @@ -501,9 +502,9 @@ static void block_multicopy(int i915,
> > >   	blt_set_copy_object(&blt3.final, final);
> > >   	if (config->inplace) {
> > > -		blt_set_object(&blt3.dst, mid->handle, dst->size, mid->region,
> > > -			       mid->mocs, mid_tiling, COMPRESSION_DISABLED,
> > > -			       comp_type);
> > > +		blt_set_block_object(&blt3.dst, mid->handle, dst->size,
> > > +				     mid->region, mid->mocs, mid_tiling,
> > > +				     COMPRESSION_DISABLED, comp_type);
> > >   		blt3.dst.ptr = mid->ptr;
> > >   	}
> > > diff --git a/tests/i915/gem_exercise_blt.c b/tests/i915/gem_exercise_blt.c
> > > index b1123356..5b7178df 100644
> > > --- a/tests/i915/gem_exercise_blt.c
> > > +++ b/tests/i915/gem_exercise_blt.c
> > > @@ -135,12 +135,9 @@ static void fast_copy_emit(int i915, const intel_ctx_t *ctx,
> > >   	igt_assert(__gem_create_in_memory_regions(i915, &bb, &bb_size, region1) == 0);
> > > -	src = blt_create_object(i915, region1, width, height, bpp, 0,
> > > -				T_LINEAR, COMPRESSION_DISABLED, 0);
> > > -	mid = blt_create_object(i915, region2, width, height, bpp, 0,
> > > -				mid_tiling, COMPRESSION_DISABLED, 0);
> > > -	dst = blt_create_object(i915, region1, width, height, bpp, 0,
> > > -				T_LINEAR, COMPRESSION_DISABLED, 0);
> > > +	src = blt_create_fast_object(i915, region1, width, height, bpp, T_LINEAR);
> > > +	mid = blt_create_fast_object(i915, region2, width, height, bpp, mid_tiling);
> > > +	dst = blt_create_fast_object(i915, region1, width, height, bpp, T_LINEAR);
> > >   	igt_assert(src->size == dst->size);
> > >   	PRINT_SURFACE_INFO("src", src);
> > > @@ -195,12 +192,9 @@ static void fast_copy(int i915, const intel_ctx_t *ctx,
> > >   	igt_assert(__gem_create_in_memory_regions(i915, &bb, &bb_size, region1) == 0);
> > > -	src = blt_create_object(i915, region1, width, height, bpp, 0,
> > > -				T_LINEAR, COMPRESSION_DISABLED, 0);
> > > -	mid = blt_create_object(i915, region2, width, height, bpp, 0,
> > > -				mid_tiling, COMPRESSION_DISABLED, 0);
> > > -	dst = blt_create_object(i915, region1, width, height, bpp, 0,
> > > -				T_LINEAR, COMPRESSION_DISABLED, 0);
> > > +	src = blt_create_fast_object(i915, region1, width, height, bpp, T_LINEAR);
> > > +	mid = blt_create_fast_object(i915, region2, width, height, bpp, mid_tiling);
> > > +	dst = blt_create_fast_object(i915, region1, width, height, bpp, T_LINEAR);
> > >   	igt_assert(src->size == dst->size);
> > >   	blt_surface_fill_rect(i915, src, width, height);
> > > diff --git a/tests/i915/gem_lmem_swapping.c b/tests/i915/gem_lmem_swapping.c
> > > index 55b044ec..3a6308ed 100644
> > > --- a/tests/i915/gem_lmem_swapping.c
> > > +++ b/tests/i915/gem_lmem_swapping.c
> > > @@ -317,9 +317,9 @@ static void __do_evict(int i915,
> > >   		tmp->handle = gem_create_in_memory_regions(i915, params->size.max,
> > >   				   INTEL_MEMORY_REGION_ID(I915_SYSTEM_MEMORY, 0));
> > > -		blt_set_object(tmp, tmp->handle, params->size.max,
> > > -			       INTEL_MEMORY_REGION_ID(I915_SYSTEM_MEMORY, 0),
> > > -			       intel_get_uc_mocs(i915), T_LINEAR,
> > > +		blt_set_block_object(tmp, tmp->handle, params->size.max,
> > > +				     INTEL_MEMORY_REGION_ID(I915_SYSTEM_MEMORY, 0),
> > > +				     intel_get_uc_mocs(i915), T_LINEAR,
> > >   			       COMPRESSION_DISABLED, COMPRESSION_TYPE_3D);
> > >   		blt_set_geom(tmp, stride, 0, 0, width, height, 0, 0);
> > >   	}
> > > @@ -348,9 +348,10 @@ static void __do_evict(int i915,
> > >   			obj->blt_obj = calloc(1, sizeof(*obj->blt_obj));
> > >   			igt_assert(obj->blt_obj);
> > > -			blt_set_object(obj->blt_obj, obj->handle, obj->size, region_id,
> > > -				       intel_get_uc_mocs(i915), T_LINEAR,
> > > -				       COMPRESSION_ENABLED, COMPRESSION_TYPE_3D);
> > > +			blt_set_block_object(obj->blt_obj, obj->handle, obj->size,
> > > +					     region_id, intel_get_uc_mocs(i915),
> > > +					     T_LINEAR, COMPRESSION_ENABLED,
> > > +					     COMPRESSION_TYPE_3D);
> > >   			blt_set_geom(obj->blt_obj, stride, 0, 0, width, height, 0, 0);
> > >   			init_object_ccs(i915, obj, tmp, rand(), blt_ctx,
> > >   					region_id, ahnd);
> > > -- 
> > > 2.25.1
> > > 
