Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45A4310EBC9
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Mar 2023 17:30:35 +0000 (UTC)
Date: Wed, 29 Mar 2023 19:30:28 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <20230329173028.et4rkhyifwott35i@zkempczy-mobl2>
References: <20230327201254.2834-1-juhapekka.heikkila@gmail.com>
 <20230327201254.2834-3-juhapekka.heikkila@gmail.com>
 <20230328065042.tiwacahkm77bbb75@zkempczy-mobl2>
 <1041bd8f-0925-24c2-6142-c4f6f2dbf308@intel.com>
 <ca75501f-b92d-97e8-58a1-053ed313415e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ca75501f-b92d-97e8-58a1-053ed313415e@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] lib/igt_fb: switch blitcopy to use
 lib/i915/i915_blt functions
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

On Tue, Mar 28, 2023 at 08:29:40PM +0300, Juha-Pekka Heikkila wrote:
> Hei,
> 
> thanks for the comments. This was my first attempt on this and I got those
> failures which Zbigniew's comment explained how those happen. I'll soon send
> new version.. I was also wondering about insertion of that offset in the
> other patch, it somehow feels bit out of place but didn't find better place
> for it.

I'm sorry, I forgot comment 'offset' field.

There's no problem from adding it, I wondered to add those at the end
of the structure with detailed description. And 'offset' is a little bit
confusing. Maybe 'plane_offset' would be better?


> 
> couple of comments below.
> 
> On 28.3.2023 17.10, Karolina Stolarek wrote:
> > On 28.03.2023 08:50, Zbigniew Kempczyński wrote:
> > > On Mon, Mar 27, 2023 at 11:12:54PM +0300, Juha-Pekka Heikkila wrote:
> > > > reduce code duplication
> > > > 
> > > > Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> > > > ---
> > > >   lib/igt_fb.c | 214 +++++++++++++++++++++++++++++++++++++++++++++------
> > > >   1 file changed, 192 insertions(+), 22 deletions(-)
> > > > 
> > > > diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> > > > index ba89e1f60..06ebe4818 100644
> > > > --- a/lib/igt_fb.c
> > > > +++ b/lib/igt_fb.c
> > > > @@ -35,6 +35,8 @@
> > > >   #include "drmtest.h"
> > > >   #include "i915/gem_create.h"
> > > >   #include "i915/gem_mman.h"
> > > > +#include "i915/i915_blt.h"
> > > > +#include "i915/intel_mocs.h"
> > > >   #include "igt_aux.h"
> > > >   #include "igt_color_encoding.h"
> > > >   #include "igt_fb.h"
> > > > @@ -2680,12 +2682,134 @@ static void copy_with_engine(struct
> > > > fb_blit_upload *blit,
> > > >       fini_buf(src);
> > > >   }
> > > > +static struct blt_copy_object *blt_fb_init(const struct igt_fb *fb,
> > > > +                       uint32_t plane, uint32_t memregion)
> > > > +{
> > > > +    uint32_t name, handle;
> > > > +    struct blt_copy_object *blt;
> > > > +    enum blt_tiling_type blt_tile;
> > > > +    uint64_t stride;
> > > > +
> > > > +    blt = malloc(sizeof(*blt));
> > > > +    igt_assert(blt);
> > > > +
> > > > +    name = gem_flink(fb->fd, fb->gem_handle);
> > > > +    handle = gem_open(fb->fd, name);
> > > > +
> > > > +    switch (igt_fb_mod_to_tiling(fb->modifier)) {
> > > > +    case I915_TILING_X:
> > > > +        blt_tile = T_XMAJOR;
> > > 
> > > I wonder to add helper in i915_blt: i915_tiling_to_blt_tile(int tile);
> > 
> > I wish we could move on from using I915_TILING_* for tiling formats that
> > don't require fences. It would be great if we could switch on
> > blt_tiling_type when doing blit copy, especially when we have checks
> > that ensure the correct mapping.
> > 
> > I mean, we could add such a helper, but do we want to keep it as a
> > permanent solution?
> > 
> > > 
> > > BTW Karolina added asserts which should map 1:1 i915 -> blt. Tile4 is
> > > not added there yet but it can be, so i915_tiline_to_blt_tile() can
> > > simply return tile;
> > > 
> > > then those few cases could looks like:
> > > 
> > > case I915_TILING_X:
> > > case I915_TILING_Y:
> > > case I915_TILING_4:
> > >     blt_tile = i915_tiling_to_blt_tile(...);
> > >     stride = fb->strides[plane] / 4;
> > >     break;
> > > case I915_TILING_NONE:
> > >     ...
> 
> i915_tiling_to_blt_tile is coming in some yet unmerged set? I didn't find it
> in my igt.

No, I suggested you could add this. Assumption is we want 1:1 mapping
between I915_TILING_<fmt> and T_<fmt> so simple return int to enum value
is enough.

> 
> > > 
> > > > +        stride = fb->strides[plane] / 4;
> > > > +        break;
> > > > +    case I915_TILING_Y:
> > > > +        blt_tile = T_YMAJOR;
> > > > +        stride = fb->strides[plane] / 4;
> > > > +        break;
> > > > +    case I915_TILING_4:
> > > > +        blt_tile = T_TILE4;
> > > > +        stride = fb->strides[plane] / 4;
> > > > +        break;
> > > > +    case I915_TILING_NONE:
> > > > +    default:
> > > > +        blt_tile = T_LINEAR;
> > > > +        stride = fb->strides[plane];
> > > > +        break;
> > > > +    }
> > > > +
> > > > +    blt_set_object(blt, handle, fb->size, memregion,
> > > > +               intel_get_uc_mocs(fb->fd),
> > > > +               blt_tile,
> > > > +               is_ccs_modifier(fb->modifier) ?
> > > > COMPRESSION_ENABLED : COMPRESSION_DISABLED,
> > > > +               is_gen12_mc_ccs_modifier(fb->modifier) ?
> > > > COMPRESSION_TYPE_MEDIA : COMPRESSION_TYPE_3D);
> > > > +
> > > > +    blt_set_geom(blt, stride, 0, 0, fb->width,
> > > > fb->plane_height[plane], 0, 0);
> > > > +
> > > > +    blt->offset = fb->offsets[plane];
> > > > +
> > > > +    blt->ptr = gem_mmap__device_coherent(fb->fd, handle, 0, fb->size,
> > > > +                         PROT_READ | PROT_WRITE);
> > > > +    return blt;
> > > > +}
> > > > +
> > > > +static enum blt_color_depth blt_get_bpp(const struct igt_fb *fb)
> > > > +{
> > > > +    switch (fb->plane_bpp[0]) {
> > > > +    case 8:
> > > > +        return CD_8bit;
> > > > +    case 16:
> > > > +        return CD_16bit;
> > > > +    case 32:
> > > > +        return CD_32bit;
> > > > +    case 64:
> > > > +        return CD_64bit;
> > > > +    case 96:
> > > > +        return CD_96bit;
> > > > +    case 128:
> > > > +        return CD_128bit;
> > > > +    default:
> > > > +        igt_assert(0);
> > > > +    }
> > > > +}
> > > > +
> > > > +#define BLT_TARGET_RC(x) (x.compression == COMPRESSION_ENABLED && \
> > > > +              x.compression_type == COMPRESSION_TYPE_3D)
> > > > +
> > > > +#define BLT_TARGET_MC(x) (x.compression == COMPRESSION_ENABLED && \
> > > > +              x.compression_type == COMPRESSION_TYPE_MEDIA)
> > > > +
> > > > +static uint32_t blt_compression_format(struct blt_copy_data *blt,
> > > > +                       const struct igt_fb *fb)
> > > > +{
> > > > +    if (blt->src.compression == COMPRESSION_DISABLED &&
> > > > +        blt->dst.compression == COMPRESSION_DISABLED)
> > > > +        return 0;
> > > > +
> > > > +    if (BLT_TARGET_RC(blt->src) || BLT_TARGET_RC(blt->dst)) {
> > > > +        switch (blt->color_depth)
> > > > +        {
> > > > +        case CD_32bit:
> > > > +            return 8;
> > > > +        default:
> > > > +            igt_assert_f(0, "COMPRESSION_TYPE_3D unknown color
> > > > depth\n");
> > > > +        }
> > > > +    }
> > > > +
> > > > +    if (BLT_TARGET_MC(blt->src) || BLT_TARGET_MC(blt->dst)) {
> > > > +        switch (fb->drm_format)
> > > > +        {
> > > > +        case DRM_FORMAT_XRGB8888:
> > > > +            return 8;
> > > > +        case DRM_FORMAT_XYUV8888:
> > > > +            return 9;
> > > > +        case DRM_FORMAT_NV12:
> > > > +            return 9;
> > > > +        case DRM_FORMAT_P010:
> > > > +        case DRM_FORMAT_P012:
> > > > +        case DRM_FORMAT_P016:
> > > > +            return 8;
> > > > +        default:
> > > > +            igt_assert_f(0, "COMPRESSION_TYPE_MEDIA unknown format\n");
> > > > +        }
> > > > +    } else {
> > > > +        igt_assert_f(0, "unknown compression\n");
> > > > +    }
> > > > +}
> > > > +
> > > >   static void blitcopy(const struct igt_fb *dst_fb,
> > > >                const struct igt_fb *src_fb)
> > > >   {
> > > >       uint32_t src_tiling, dst_tiling;
> > > >       uint32_t ctx = 0;
> > > >       uint64_t ahnd = 0;
> > > > +    const intel_ctx_t *ictx =
> > > > intel_ctx_create_all_physical(src_fb->fd);
> > > > +    struct intel_execution_engine2 *e;
> > > > +    uint32_t bb;
> > > > +    uint64_t bb_size = 4096;
> > > > +    struct blt_copy_data blt = {};
> > > > +    struct blt_copy_object *src, *dst;
> > > > +    struct blt_block_copy_data_ext ext = {}, *pext = NULL;
> > > > +    uint32_t mem_region = HAS_FLATCCS(intel_get_drm_devid(src_fb->fd))
> > > > +               ? REGION_LMEM(0) : REGION_SMEM;
> > > >       igt_assert_eq(dst_fb->fd, src_fb->fd);
> > > >       igt_assert_eq(dst_fb->num_planes, src_fb->num_planes);
> > > > @@ -2697,36 +2821,81 @@ static void blitcopy(const struct igt_fb
> > > > *dst_fb,
> > > >           igt_require(gem_has_contexts(dst_fb->fd));
> > > >           ctx = gem_context_create(dst_fb->fd);
> > > >           ahnd = get_reloc_ahnd(dst_fb->fd, ctx);
> > > > +
> > > > +        igt_assert(__gem_create_in_memory_regions(src_fb->fd,
> > > > +                              &bb,
> > > > +                              &bb_size,
> > > > +                              mem_region) == 0);
> > > > +
> > > > +        for_each_ctx_engine(src_fb->fd, ictx, e) {
> > > > +            if (gem_engine_can_block_copy(src_fb->fd, e))
> > > > +                break;
> > > > +        }
> > > >       }
> > > >       for (int i = 0; i < dst_fb->num_planes; i++) {
> > > >           igt_assert_eq(dst_fb->plane_bpp[i], src_fb->plane_bpp[i]);
> > > >           igt_assert_eq(dst_fb->plane_width[i], src_fb->plane_width[i]);
> > > >           igt_assert_eq(dst_fb->plane_height[i],
> > > > src_fb->plane_height[i]);
> > > > -        /*
> > > > -         * On GEN12+ X-tiled format support is removed from the fast
> > > > -         * blit command, so use the XY_SRC blit command for it
> > > > -         * instead.
> > > > -         */
> > > > +
> > > >           if (fast_blit_ok(src_fb) && fast_blit_ok(dst_fb)) {
> > > 
> > > I think this blit fail when ahnd == 0 as i915_blt requires softpinning.
> 
> I think this is what I saw as failures in ci on tgl and some gen9 testboxes.
> Before sending I tested only with dg2 and adlp so I didn't see this problem
> earlier.

Karolina did a good job with intel_cmds_info and i915_blt helpers which
allows test if command/tiling is supported on dedicated platform.
We may start to replacing above and not fully reliable functions
(fast_blit_ok()) with i915_blt checkers.


> 
> > 
> > Also, are we fine with the fact that we'll only cover gen 8 and above
> > (due to the softpinning requirement)?
> > 
> > > 
> > > 'if (ahnd && fast_blit_ok(src_fb) && fast_blit_ok(dst_fb))' should work.
> > 
> > I had a quick look at the function, and I wonder if we could i915_blt
> > helpers here instead. There seem to be other factors that we have to
> > consider here, but the display version checks seem similar to what we
> > have in intel_cmd_info lib.
> > 
> 
> fast_blit_ok(..) checks also fb for x-tiling so I think I'll stay with that
> for now.

I suggest replace fast_blit_ok() body and use blt_has_fast_copy() and
blt_block_copy_supports_tiling() but I won't insist.

> 
> > 
> > > 
> > > > -            igt_blitter_fast_copy__raw(dst_fb->fd,
> > > > -                           ahnd, ctx, NULL,
> > > > -                           src_fb->gem_handle,
> > > > -                           src_fb->offsets[i],
> > > > -                           src_fb->strides[i],
> > > > -                           src_tiling,
> > > > -                           0, 0, /* src_x, src_y */
> > > > -                           src_fb->size,
> > > > -                           dst_fb->plane_width[i],
> > > > -                           dst_fb->plane_height[i],
> > > > -                           dst_fb->plane_bpp[i],
> > > > -                           dst_fb->gem_handle,
> > > > -                           dst_fb->offsets[i],
> > > > -                           dst_fb->strides[i],
> > > > -                           dst_tiling,
> > > > -                           0, 0 /* dst_x, dst_y */,
> > > > -                           dst_fb->size);
> > > > +            memset(&blt, 0, sizeof(blt));
> > > > +            blt.color_depth = blt_get_bpp(src_fb);
> > > > +
> > > > +            src = blt_fb_init(src_fb, i, mem_region);
> > > > +            dst = blt_fb_init(dst_fb, i, mem_region);
> > > > +
> > > > +            blt_set_copy_object(&blt.src, src);
> > > > +            blt_set_copy_object(&blt.dst, dst);
> > > > +
> > > > +            blt_set_batch(&blt.bb, bb, bb_size, mem_region);
> > > > +
> > > > +            blt_fast_copy(src_fb->fd, ictx, e, ahnd, &blt);
> > > > +            gem_sync(src_fb->fd, blt.dst.handle);
> > > > +
> > > > +            blt_destroy_object(src_fb->fd, src);
> > > > +            blt_destroy_object(dst_fb->fd, dst);
> > > > +        } else if (ahnd) {
> > > 
> > > I would also check if this else supports block-copy.
> > > 
> > > If you prefer newer instructions (like fast-copy) with i915_blt it
> > > requires valid ahnd (>0). Instead of using wrapper:
> > > 
> > > ahnd = get_reloc_ahnd(fd, ctx);
> > > 
> > > you may enforce softpinning by:
> > > 
> > > ahnd = intel_allocator_open(fd, ctx, INTEL_ALLOCATOR_RELOC);
> > > 
> > > Then i915_blt functions will work as you expect. But this will change
> > > previous logic to prefer older blits instead new ones.
> > > 
> 
> I now put above "ahnd && blt_has_block_copy(src_fb->fd)". I'll need to check
> test runtimes what will come from different boxes to see if there's
> something more needed to do with these, as long as runtimes wont start to
> grow I'll be ok either way of getting ahnd.

Ok, looks good to me (I would also check tilings supported by the command,
but this is not a must).

--
Zbigniew

> 
> /Juha-Pekka
> 
> > > 
> > > > +            /*
> > > > +            * On GEN12+ X-tiled format support is removed from
> > > > +            * the fast blit command, so use the block copy blit
> > > > +            * command for it instead.
> > > > +            */
> > > > +            src = blt_fb_init(src_fb, i, mem_region);
> > > > +            dst = blt_fb_init(dst_fb, i, mem_region);
> > > > +
> > > > +            memset(&blt, 0, sizeof(blt));
> > > > +            blt.print_bb = true;
> > > > +            blt.color_depth = blt_get_bpp(src_fb);
> > > > +            blt_set_copy_object(&blt.src, src);
> > > > +            blt_set_copy_object(&blt.dst, dst);
> > > > +
> > > > +            if (HAS_FLATCCS(intel_get_drm_devid(src_fb->fd))) {
> > > > +                blt_set_object_ext(&ext.src,
> > > > +                           blt_compression_format(&blt, src_fb),
> > > > +                           src_fb->width, src_fb->height,
> > > > +                           SURFACE_TYPE_2D);
> > > > +
> > > > +                blt_set_object_ext(&ext.dst,
> > > > +                           blt_compression_format(&blt, dst_fb),
> > > > +                           dst_fb->width, dst_fb->height,
> > > > +                           SURFACE_TYPE_2D);
> > > > +
> > > > +                pext = &ext;
> > > > +            }
> > > > +
> > > > +            blt_set_batch(&blt.bb, bb, bb_size, mem_region);
> > > > +
> > > > +            blt_block_copy(src_fb->fd, ictx, e, ahnd, &blt, pext);
> > > > +            gem_sync(src_fb->fd, blt.dst.handle);
> > > > +
> > > > +            blt_destroy_object(src_fb->fd, src);
> > > > +            blt_destroy_object(dst_fb->fd, dst);
> > > >           } else {
> > > > +            /*
> > > > +             * If on legacy hardware where relocations are supported
> > > > +             * we'll use XY_SRC blit command instead
> > > > +             */
> > > >               igt_blitter_src_copy(dst_fb->fd,
> > > >                            ahnd, ctx, NULL,
> > > >                            src_fb->gem_handle,
> > > > @@ -2750,6 +2919,7 @@ static void blitcopy(const struct igt_fb *dst_fb,
> > > >       if (ctx)
> > > >           gem_context_destroy(dst_fb->fd, ctx);
> > > >       put_ahnd(ahnd);
> > > > +    intel_ctx_destroy(src_fb->fd, ictx);
> > > >   }
> > > >   static void free_linear_mapping(struct fb_blit_upload *blit)
> > > > -- 
> > > > 2.39.0
> > > > 
> 
