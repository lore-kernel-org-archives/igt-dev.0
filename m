Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC57410E53D
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Dec 2022 10:20:36 +0000 (UTC)
Date: Thu, 22 Dec 2022 11:20:31 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y6Qvb3/Ec/JRzhJZ@kamilkon-desk1>
References: <cover.1671446367.git.karolina.stolarek@intel.com>
 <cab83734d1709e78e642e2de6d6dd88d30a3e41f.1671446367.git.karolina.stolarek@intel.com>
 <Y6MRL5p0zcqMQ/0T@kamilkon-desk1>
 <e7628c0a-1abc-4620-53fc-d60c26afcea3@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e7628c0a-1abc-4620-53fc-d60c26afcea3@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 3/4] lib/i915_blt: Extract init
 functions for blt_copy_object
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

Hi Karolina,

On 2022-12-22 at 10:50:45 +0100, Karolina Stolarek wrote:
> On 21.12.2022 14:59, Kamil Konieczny wrote:
> > Hi Karolina,
> > 
> > please improve commit description,
> > imho s/Extract init/Add common/
> 
> But we're reusing the code, not adding new one.

Sorry I should wrote that for your first patch:

[PATCH i-g-t 1/4] lib: Describe supported blitter commands and tiling formats

That one should also be changed.

Btw that "Extract" seems to describe what you did in tests but imho it is
better to write in Subject: that you added new functions into lib. You will
describe why and how you did it in message.

Regards,
Kamil

> 
> > On 2022-12-19 at 12:49:10 +0100, Karolina Stolarek wrote:
> > > gem_ccs and gem_lmem_swapping share a couple of functions. Extract them
> > > to i915_blt so they are accessible for both tests. Delete local
> > ---------------------------------------------------- ^
> > That sentence is not needed here or if you want you can write
> > about refactoring (you replaced those functions with lib calls).
> > 
> > > definitions.
> > 
> > > 
> > > Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
> > > ---
> > > Karolina's comment: I'm not convinced it's the best place for them.
> > > 					These functions are more specific to the tests
> > - ^^^
> > Please avoid huge empty spaces here.
> 
> Heh, I should've eyed it in vim before sending. Anyway, everything below --
> is ignored when the patch is applied.
> > 
> > > 					than lib functions. So, I'd appreciate
> > > 					suggestions on where I can move them to.
> > > 
> > >   lib/i915/i915_blt.c            | 81 ++++++++++++++++++++++++++++++++++
> > >   lib/i915/i915_blt.h            | 22 +++++++++
> > >   tests/i915/gem_ccs.c           | 81 ----------------------------------
> > >   tests/i915/gem_lmem_swapping.c | 36 ---------------
> > >   4 files changed, 103 insertions(+), 117 deletions(-)
> > > 
> > > diff --git a/lib/i915/i915_blt.c b/lib/i915/i915_blt.c
> > > index 2513dfc0..0f9f7265 100644
> > > --- a/lib/i915/i915_blt.c
> > > +++ b/lib/i915/i915_blt.c
> > > @@ -1053,6 +1053,87 @@ int blt_fast_copy(int i915,
> > >   	return ret;
> > >   }
> > 
> > You need to add descriptions to all lib functions you added.
> 
> I wrote in my cover letter that it's WIP and will add it in v2.
> 
> > > +void set_geom(struct blt_copy_object *obj, uint32_t pitch,
> > ------- ^
> > The name was ok inside test, but in lib imho it's better add
> > some common prefix, maybe blt_ ? For example:
> > 
> > void blt_set_geom(...params here...
> > 
> 
> Suggested by Zbigniewa and already applies, thanks
> 
> 
> All the best,
> Karolina
> > > +	      int16_t x1, int16_t y1, int16_t x2, int16_t y2,
> > > +	      uint16_t x_offset, uint16_t y_offset)
> > > +{
> > > +	obj->pitch = pitch;
> > > +	obj->x1 = x1;
> > > +	obj->y1 = y1;
> > > +	obj->x2 = x2;
> > > +	obj->y2 = y2;
> > > +	obj->x_offset = x_offset;
> > > +	obj->y_offset = y_offset;
> > > +}
> > > +
> > > +void set_batch(struct blt_copy_batch *batch,
> > ------- ^
> > 
> > > +	       uint32_t handle, uint64_t size, uint32_t region)
> > > +{
> > > +	batch->handle = handle;
> > > +	batch->size = size;
> > > +	batch->region = region;
> > > +}
> > > +
> > > +struct blt_copy_object *
> > > +create_object(int i915, uint32_t region,
> > ------- ^
> > 
> > > +	      uint32_t width, uint32_t height, uint32_t bpp, uint8_t mocs,
> > > +	      enum tiling_type tiling,
> > > +	      enum blt_compression compression,
> > > +	      enum blt_compression_type compression_type,
> > > +	      bool create_mapping)
> > > +{
> > > +	struct blt_copy_object *obj;
> > > +	uint64_t size = width * height * bpp / 8;
> > > +	uint32_t stride = tiling == T_LINEAR ? width * 4 : width;
> > > +	uint32_t handle;
> > > +
> > > +	obj = calloc(1, sizeof(*obj));
> > > +
> > > +	obj->size = size;
> > > +	igt_assert(__gem_create_in_memory_regions(i915, &handle,
> > > +						  &size, region) == 0);
> > > +
> > > +	set_object(obj, handle, size, region, mocs, tiling,
> > > +		   compression, compression_type);
> > > +	set_geom(obj, stride, 0, 0, width, height, 0, 0);
> > > +
> > > +	if (create_mapping)
> > > +		obj->ptr = gem_mmap__device_coherent(i915, handle, 0, size,
> > > +						     PROT_READ | PROT_WRITE);
> > > +
> > > +	return obj;
> > > +}
> > > +
> > > +void destroy_object(int i915, struct blt_copy_object *obj)
> > ------- ^
> > 
> > > +{
> > > +	if (obj->ptr)
> > > +		munmap(obj->ptr, obj->size);
> > > +
> > > +	gem_close(i915, obj->handle);
> > > +	free(obj);
> > > +}
> > > +
> > > +void set_object(struct blt_copy_object *obj,
> > ------- ^
> > blt_set_object
> > 
> > > +		uint32_t handle, uint64_t size, uint32_t region,
> > > +		uint8_t mocs, enum tiling_type tiling,
> > > +		enum blt_compression compression,
> > > +		enum blt_compression_type compression_type)
> > > +{
> > > +	obj->handle = handle;
> > > +	obj->size = size;
> > > +	obj->region = region;
> > > +	obj->mocs = mocs;
> > > +	obj->tiling = tiling;
> > > +	obj->compression = compression;
> > > +	obj->compression_type = compression_type;
> > > +}
> > > +
> > > +void set_blt_object(struct blt_copy_object *obj,
> > ------- ^
> > This will clash with above name blt_set_object ?
> > Maybe blt_set_copy_object ?
> > 
> > Regards,
> > Kamil
> > 
> > > +		    const struct blt_copy_object *orig)
> > > +{
> > > +	memcpy(obj, orig, sizeof(*obj));
> > > +}
> > > +
> > >   /**
> > >    * blt_surface_fill_rect:
> > >    * @i915: drm fd
> > > diff --git a/lib/i915/i915_blt.h b/lib/i915/i915_blt.h
> > > index f1cf5408..1ef459c8 100644
> > > --- a/lib/i915/i915_blt.h
> > > +++ b/lib/i915/i915_blt.h
> > > @@ -198,6 +198,28 @@ int blt_fast_copy(int i915,
> > >   		  uint64_t ahnd,
> > >   		  const struct blt_copy_data *blt);
> > > +void set_geom(struct blt_copy_object *obj, uint32_t pitch,
> > > +	      int16_t x1, int16_t y1, int16_t x2, int16_t y2,
> > > +	      uint16_t x_offset, uint16_t y_offset);
> > > +void set_batch(struct blt_copy_batch *batch,
> > > +	       uint32_t handle, uint64_t size, uint32_t region);
> > > +
> > > +struct blt_copy_object *
> > > +create_object(int i915, uint32_t region,
> > > +	      uint32_t width, uint32_t height, uint32_t bpp, uint8_t mocs,
> > > +	      enum tiling_type tiling,
> > > +	      enum blt_compression compression,
> > > +	      enum blt_compression_type compression_type,
> > > +	      bool create_mapping);
> > > +void destroy_object(int i915, struct blt_copy_object *obj);
> > > +void set_object(struct blt_copy_object *obj,
> > > +		uint32_t handle, uint64_t size, uint32_t region,
> > > +		uint8_t mocs, enum tiling_type tiling,
> > > +		enum blt_compression compression,
> > > +		enum blt_compression_type compression_type);
> > > +void set_blt_object(struct blt_copy_object *obj,
> > > +		    const struct blt_copy_object *orig);
> > > +
> > >   void blt_surface_info(const char *info,
> > >   		      const struct blt_copy_object *obj);
> > >   void blt_surface_fill_rect(int i915, const struct blt_copy_object *obj,
> > > diff --git a/tests/i915/gem_ccs.c b/tests/i915/gem_ccs.c
> > > index 4c137c94..30ee60fd 100644
> > > --- a/tests/i915/gem_ccs.c
> > > +++ b/tests/i915/gem_ccs.c
> > > @@ -44,42 +44,6 @@ struct test_config {
> > >   	bool suspend_resume;
> > >   };
> > > -static void set_object(struct blt_copy_object *obj,
> > > -		       uint32_t handle, uint64_t size, uint32_t region,
> > > -		       uint8_t mocs, enum tiling_type tiling,
> > > -		       enum blt_compression compression,
> > > -		       enum blt_compression_type compression_type)
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
> > > -static void set_geom(struct blt_copy_object *obj, uint32_t pitch,
> > > -		     int16_t x1, int16_t y1, int16_t x2, int16_t y2,
> > > -		     uint16_t x_offset, uint16_t y_offset)
> > > -{
> > > -	obj->pitch = pitch;
> > > -	obj->x1 = x1;
> > > -	obj->y1 = y1;
> > > -	obj->x2 = x2;
> > > -	obj->y2 = y2;
> > > -	obj->x_offset = x_offset;
> > > -	obj->y_offset = y_offset;
> > > -}
> > > -
> > > -static void set_batch(struct blt_copy_batch *batch,
> > > -		      uint32_t handle, uint64_t size, uint32_t region)
> > > -{
> > > -	batch->handle = handle;
> > > -	batch->size = size;
> > > -	batch->region = region;
> > > -}
> > > -
> > >   static void set_object_ext(struct blt_block_copy_object_ext *obj,
> > >   			   uint8_t compression_format,
> > >   			   uint16_t surface_width, uint16_t surface_height,
> > > @@ -105,51 +69,6 @@ static void set_surf_object(struct blt_ctrl_surf_copy_object *obj,
> > >   	obj->access_type = access_type;
> > >   }
> > > -static struct blt_copy_object *
> > > -create_object(int i915, uint32_t region,
> > > -	      uint32_t width, uint32_t height, uint32_t bpp, uint8_t mocs,
> > > -	      enum tiling_type tiling,
> > > -	      enum blt_compression compression,
> > > -	      enum blt_compression_type compression_type,
> > > -	      bool create_mapping)
> > > -{
> > > -	struct blt_copy_object *obj;
> > > -	uint64_t size = width * height * bpp / 8;
> > > -	uint32_t stride = tiling == T_LINEAR ? width * 4 : width;
> > > -	uint32_t handle;
> > > -
> > > -	obj = calloc(1, sizeof(*obj));
> > > -
> > > -	obj->size = size;
> > > -	igt_assert(__gem_create_in_memory_regions(i915, &handle,
> > > -						  &size, region) == 0);
> > > -
> > > -	set_object(obj, handle, size, region, mocs, tiling,
> > > -		   compression, compression_type);
> > > -	set_geom(obj, stride, 0, 0, width, height, 0, 0);
> > > -
> > > -	if (create_mapping)
> > > -		obj->ptr = gem_mmap__device_coherent(i915, handle, 0, size,
> > > -						     PROT_READ | PROT_WRITE);
> > > -
> > > -	return obj;
> > > -}
> > > -
> > > -static void destroy_object(int i915, struct blt_copy_object *obj)
> > > -{
> > > -	if (obj->ptr)
> > > -		munmap(obj->ptr, obj->size);
> > > -
> > > -	gem_close(i915, obj->handle);
> > > -	free(obj);
> > > -}
> > > -
> > > -static void set_blt_object(struct blt_copy_object *obj,
> > > -			   const struct blt_copy_object *orig)
> > > -{
> > > -	memcpy(obj, orig, sizeof(*obj));
> > > -}
> > > -
> > >   #define PRINT_SURFACE_INFO(name, obj) do { \
> > >   	if (param.print_surface_info) \
> > >   		blt_surface_info((name), (obj)); } while (0)
> > > diff --git a/tests/i915/gem_lmem_swapping.c b/tests/i915/gem_lmem_swapping.c
> > > index 8cff35d5..746fbf80 100644
> > > --- a/tests/i915/gem_lmem_swapping.c
> > > +++ b/tests/i915/gem_lmem_swapping.c
> > > @@ -76,42 +76,6 @@ struct object {
> > >   	struct blt_copy_object *blt_obj;
> > >   };
> > > -static void set_object(struct blt_copy_object *obj,
> > > -		       uint32_t handle, uint64_t size, uint32_t region,
> > > -		       uint8_t mocs, enum tiling_type tiling,
> > > -		       enum blt_compression compression,
> > > -		       enum blt_compression_type compression_type)
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
> > > -static void set_geom(struct blt_copy_object *obj, uint32_t pitch,
> > > -		     int16_t x1, int16_t y1, int16_t x2, int16_t y2,
> > > -		     uint16_t x_offset, uint16_t y_offset)
> > > -{
> > > -	obj->pitch = pitch;
> > > -	obj->x1 = x1;
> > > -	obj->y1 = y1;
> > > -	obj->x2 = x2;
> > > -	obj->y2 = y2;
> > > -	obj->x_offset = x_offset;
> > > -	obj->y_offset = y_offset;
> > > -}
> > > -
> > > -static void set_batch(struct blt_copy_batch *batch,
> > > -		      uint32_t handle, uint64_t size, uint32_t region)
> > > -{
> > > -	batch->handle = handle;
> > > -	batch->size = size;
> > > -	batch->region = region;
> > > -}
> > > -
> > >   static void set_object_ext(struct blt_block_copy_object_ext *obj,
> > >   			   uint8_t compression_format,
> > >   			   uint16_t surface_width, uint16_t surface_height,
> > > -- 
> > > 2.25.1
> > > 
