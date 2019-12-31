Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D982C89ED3
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Dec 2019 08:41:00 +0000 (UTC)
From: "Kahola, Mika" <mika.kahola@intel.com>
Date: Tue, 31 Dec 2019 08:40:55 +0000
Message-ID: <b709fae8959718bde383bb354252583272e00d8c.camel@intel.com>
References: <20191230034040.21943-4-imre.deak@intel.com>
 <20191230175841.8584-1-imre.deak@intel.com>
In-Reply-To: <20191230175841.8584-1-imre.deak@intel.com>
Content-Language: en-US
Content-ID: <32EE41D4C2E1BB4CA879D840A568103B@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 03/10] lib/igt_buf: Extend igt_buf to
 include two color surfaces
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Deak,
 Imre" <imre.deak@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, 2019-12-30 at 19:58 +0200, Imre Deak wrote:
> UV FBs have two color surfaces so extend the igt_buf struct
> accordingly
> to support blitting such FBs.
> 
> The patch is produced with the coccinelle patch below.
> 
> No functional changes.
> 
> @@
> @@
> 
> struct igt_buf {
> 	...
> -	uint32_t stride;
> 	...
> -	uint32_t size;
> +	struct {
> +		uint32_t stride;
> +		uint32_t size;
> +	} surface[2];
> 	...
> };
> 
> @@
> struct igt_buf b;
> @@
> 
> <...
> (
> - b.stride
> + b.surface[0].stride
> > 
> 
> - b.size
> + b.surface[0].size
> )
> ...>
> 
> @@
> struct igt_buf *b;
> @@
> 
> <...
> (
> - b->size
> + b->surface[0].size
> > 
> 
> - b->stride
> + b->surface[0].stride
> )
> ...>
> 
> @@
> identifier I;
> expression E1;
> expression E2;
> @@
> 
> (
> struct igt_buf I = {
> -	.size = E1,
> -	.stride = E2,
> +	.surface[0] = {
> +		.size = E1,
> +		.stride = E2,
> +	},
> };
> > 
> 
> struct igt_buf I = {
> -	.size = E1,
> +	.surface[0] = {
> +		.size = E1,
> +	},
> };
> > 
> 
> struct igt_buf I = {
> -	.stride = E1,
> +	.surface[0] = {
> +		.stride = E1,
> +	},
> };
> )
> 
> v2:
> - Rebase on latest upstream. (Mika)
> 
> Cc: Mika Kahola <mika.kahola@intel.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>

Reviewed-by: Mika Kahola <mika.kahola@intel.com>

> ---
>  lib/gpu_cmds.c                       |  4 +-
>  lib/igt_draw.c                       |  8 ++--
>  lib/igt_fb.c                         |  4 +-
>  lib/intel_aux_pgtable.c              |  5 ++-
>  lib/intel_batchbuffer.c              |  8 ++--
>  lib/intel_batchbuffer.h              |  6 ++-
>  lib/rendercopy_gen4.c                |  4 +-
>  lib/rendercopy_gen6.c                |  4 +-
>  lib/rendercopy_gen7.c                |  4 +-
>  lib/rendercopy_gen8.c                |  4 +-
>  lib/rendercopy_gen9.c                |  4 +-
>  lib/rendercopy_i830.c                |  8 ++--
>  lib/rendercopy_i915.c                |  8 ++--
>  lib/veboxcopy_gen12.c                |  6 ++-
>  tests/i915/gem_concurrent_all.c      | 10 +++--
>  tests/i915/gem_gpgpu_fill.c          |  4 +-
>  tests/i915/gem_media_fill.c          |  4 +-
>  tests/i915/gem_media_vme.c           |  6 +--
>  tests/i915/gem_ppgtt.c               |  8 ++--
>  tests/i915/gem_read_read_speed.c     | 10 +++--
>  tests/i915/gem_render_copy.c         | 35 +++++++++--------
>  tests/i915/gem_render_copy_redux.c   |  4 +-
>  tests/i915/gem_render_linear_blits.c | 24 +++++------
>  tests/i915/gem_render_tiled_blits.c  |  8 ++--
>  tests/i915/gem_ring_sync_copy.c      |  4 +-
>  tests/i915/gem_stress.c              | 59 +++++++++++++++-----------
> --
>  tests/i915/i915_pm_sseu.c            |  7 ++--
>  tests/kms_big_fb.c                   | 10 +++--
>  tests/kms_cursor_crc.c               |  4 +-
>  tests/kms_psr.c                      |  4 +-
>  tests/perf.c                         |  4 +-
>  31 files changed, 151 insertions(+), 131 deletions(-)
> 
> diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
> index 8d270ee8..79412725 100644
> --- a/lib/gpu_cmds.c
> +++ b/lib/gpu_cmds.c
> @@ -119,7 +119,7 @@ gen7_fill_surface_state(struct intel_batchbuffer
> *batch,
>  	ss->ss2.height = igt_buf_height(buf) - 1;
>  	ss->ss2.width  = igt_buf_width(buf) - 1;
>  
> -	ss->ss3.pitch  = buf->stride - 1;
> +	ss->ss3.pitch  = buf->surface[0].stride - 1;
>  
>  	ss->ss7.shader_chanel_select_r = 4;
>  	ss->ss7.shader_chanel_select_g = 5;
> @@ -422,7 +422,7 @@ gen8_fill_surface_state(struct intel_batchbuffer
> *batch,
>  
>  	ss->ss2.height = igt_buf_height(buf) - 1;
>  	ss->ss2.width  = igt_buf_width(buf) - 1;
> -	ss->ss3.pitch  = buf->stride - 1;
> +	ss->ss3.pitch  = buf->surface[0].stride - 1;
>  
>  	ss->ss7.shader_chanel_select_r = 4;
>  	ss->ss7.shader_chanel_select_g = 5;
> diff --git a/lib/igt_draw.c b/lib/igt_draw.c
> index 7e0edec1..6950bc49 100644
> --- a/lib/igt_draw.c
> +++ b/lib/igt_draw.c
> @@ -603,14 +603,14 @@ static void draw_rect_render(int fd, struct
> cmd_data *cmd_data,
>  	igt_assert(dst);
>  
>  	src_buf.bo = src;
> -	src_buf.stride = tmp.stride;
> +	src_buf.surface[0].stride = tmp.stride;
>  	src_buf.tiling = I915_TILING_NONE;
> -	src_buf.size = tmp.size;
> +	src_buf.surface[0].size = tmp.size;
>  	src_buf.bpp = tmp.bpp;
>  	dst_buf.bo = dst;
> -	dst_buf.stride = buf->stride;
> +	dst_buf.surface[0].stride = buf->stride;
>  	dst_buf.tiling = tiling;
> -	dst_buf.size = buf->size;
> +	dst_buf.surface[0].size = buf->size;
>  	dst_buf.bpp = buf->bpp;
>  
>  	batch = intel_batchbuffer_alloc(cmd_data->bufmgr, devid);
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 0e1b8493..cc0fb373 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -1977,9 +1977,9 @@ static void init_buf(struct fb_blit_upload
> *blit,
>  	buf->bo = gem_handle_to_libdrm_bo(blit->bufmgr, blit->fd,
>  					  name, fb->gem_handle);
>  	buf->tiling = igt_fb_mod_to_tiling(fb->modifier);
> -	buf->stride = fb->strides[0];
> +	buf->surface[0].stride = fb->strides[0];
>  	buf->bpp = fb->plane_bpp[0];
> -	buf->size = fb->size;
> +	buf->surface[0].size = fb->size;
>  
>  	if (is_ccs_modifier(fb->modifier)) {
>  		igt_assert_eq(fb->strides[0] & 127, 0);
> diff --git a/lib/intel_aux_pgtable.c b/lib/intel_aux_pgtable.c
> index dab83a9a..5addb2e2 100644
> --- a/lib/intel_aux_pgtable.c
> +++ b/lib/intel_aux_pgtable.c
> @@ -77,7 +77,8 @@ pgt_table_count(int address_bits, const struct
> igt_buf **bufs, int buf_count)
>  		/* Avoid double counting for overlapping aligned bufs.
> */
>  		start = max(start, end);
>  
> -		end = ALIGN(buf->bo->offset64 + buf->size, 1UL <<
> address_bits);
> +		end = ALIGN(buf->bo->offset64 + buf->surface[0].size,
> +			    1UL << address_bits);
>  		igt_assert(end >= start);
>  
>  		count += (end - start) >> address_bits;
> @@ -255,7 +256,7 @@ pgt_populate_entries_for_buf(struct pgtable *pgt,
>  			       uint64_t top_table)
>  {
>  	uint64_t surface_addr = buf->bo->offset64;
> -	uint64_t surface_end = surface_addr + buf->size;
> +	uint64_t surface_end = surface_addr + buf->surface[0].size;
>  	uint64_t aux_addr = buf->bo->offset64 + buf->ccs[0].offset;
>  	uint64_t l1_flags = pgt_get_l1_flags(buf);
>  	uint64_t lx_flags = pgt_get_lx_flags();
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index 51aae4dc..3dc89024 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -512,7 +512,7 @@ intel_copy_bo(struct intel_batchbuffer *batch,
>   */
>  unsigned igt_buf_width(const struct igt_buf *buf)
>  {
> -	return buf->stride/(buf->bpp / 8);
> +	return buf->surface[0].stride/(buf->bpp / 8);
>  }
>  
>  /**
> @@ -526,7 +526,7 @@ unsigned igt_buf_width(const struct igt_buf *buf)
>   */
>  unsigned igt_buf_height(const struct igt_buf *buf)
>  {
> -	return buf->size/buf->stride;
> +	return buf->surface[0].size/buf->surface[0].stride;
>  }
>  
>  /*
> @@ -785,8 +785,8 @@ void igt_blitter_fast_copy(struct
> intel_batchbuffer *batch,
>  
>  	igt_assert(src->bpp == dst->bpp);
>  
> -	src_pitch = fast_copy_pitch(src->stride, src->tiling);
> -	dst_pitch = fast_copy_pitch(dst->stride, src->tiling);
> +	src_pitch = fast_copy_pitch(src->surface[0].stride, src-
> >tiling);
> +	dst_pitch = fast_copy_pitch(dst->surface[0].stride, src-
> >tiling);
>  	dword0 = fast_copy_dword0(src->tiling, dst->tiling);
>  	dword1 = fast_copy_dword1(src->tiling, dst->tiling, dst->bpp);
>  
> diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
> index 63d32188..69580839 100644
> --- a/lib/intel_batchbuffer.h
> +++ b/lib/intel_batchbuffer.h
> @@ -232,12 +232,14 @@ enum i915_compression {
>   */
>  struct igt_buf {
>  	drm_intel_bo *bo;
> -	uint32_t stride;
>  	uint32_t tiling;
>  	enum i915_compression compression;
>  	uint32_t bpp;
>  	uint32_t *data;
> -	uint32_t size;
> +	struct {
> +		uint32_t stride;
> +		uint32_t size;
> +	} surface[2];
>  	struct {
>  		uint32_t offset;
>  		uint32_t stride;
> diff --git a/lib/rendercopy_gen4.c b/lib/rendercopy_gen4.c
> index 42de77f9..d07b8e48 100644
> --- a/lib/rendercopy_gen4.c
> +++ b/lib/rendercopy_gen4.c
> @@ -142,7 +142,7 @@ gen4_bind_buf(struct intel_batchbuffer *batch,
>  	uint32_t write_domain, read_domain;
>  	int ret;
>  
> -	igt_assert_lte(buf->stride, 128*1024);
> +	igt_assert_lte(buf->surface[0].stride, 128*1024);
>  	igt_assert_lte(igt_buf_width(buf), 8192);
>  	igt_assert_lte(igt_buf_height(buf), 8192);
>  
> @@ -176,7 +176,7 @@ gen4_bind_buf(struct intel_batchbuffer *batch,
>  
>  	ss->ss2.height = igt_buf_height(buf) - 1;
>  	ss->ss2.width  = igt_buf_width(buf) - 1;
> -	ss->ss3.pitch  = buf->stride - 1;
> +	ss->ss3.pitch  = buf->surface[0].stride - 1;
>  	ss->ss3.tiled_surface = buf->tiling != I915_TILING_NONE;
>  	ss->ss3.tile_walk     = buf->tiling == I915_TILING_Y;
>  
> diff --git a/lib/rendercopy_gen6.c b/lib/rendercopy_gen6.c
> index 83c7d694..87034774 100644
> --- a/lib/rendercopy_gen6.c
> +++ b/lib/rendercopy_gen6.c
> @@ -79,7 +79,7 @@ gen6_bind_buf(struct intel_batchbuffer *batch,
> const struct igt_buf *buf,
>  	uint32_t write_domain, read_domain;
>  	int ret;
>  
> -	igt_assert_lte(buf->stride, 128*1024);
> +	igt_assert_lte(buf->surface[0].stride, 128*1024);
>  	igt_assert_lte(igt_buf_width(buf), 8192);
>  	igt_assert_lte(igt_buf_height(buf), 8192);
>  
> @@ -113,7 +113,7 @@ gen6_bind_buf(struct intel_batchbuffer *batch,
> const struct igt_buf *buf,
>  
>  	ss->ss2.height = igt_buf_height(buf) - 1;
>  	ss->ss2.width  = igt_buf_width(buf) - 1;
> -	ss->ss3.pitch  = buf->stride - 1;
> +	ss->ss3.pitch  = buf->surface[0].stride - 1;
>  	ss->ss3.tiled_surface = buf->tiling != I915_TILING_NONE;
>  	ss->ss3.tile_walk     = buf->tiling == I915_TILING_Y;
>  
> diff --git a/lib/rendercopy_gen7.c b/lib/rendercopy_gen7.c
> index a3c8b7f3..b88b75e9 100644
> --- a/lib/rendercopy_gen7.c
> +++ b/lib/rendercopy_gen7.c
> @@ -65,7 +65,7 @@ gen7_bind_buf(struct intel_batchbuffer *batch,
>  	uint32_t write_domain, read_domain;
>  	int ret;
>  
> -	igt_assert_lte(buf->stride, 256*1024);
> +	igt_assert_lte(buf->surface[0].stride, 256*1024);
>  	igt_assert_lte(igt_buf_width(buf), 16384);
>  	igt_assert_lte(igt_buf_height(buf), 16384);
>  
> @@ -92,7 +92,7 @@ gen7_bind_buf(struct intel_batchbuffer *batch,
>  	ss[1] = buf->bo->offset;
>  	ss[2] = ((igt_buf_width(buf) - 1)  << GEN7_SURFACE_WIDTH_SHIFT
> |
>  		 (igt_buf_height(buf) - 1) <<
> GEN7_SURFACE_HEIGHT_SHIFT);
> -	ss[3] = (buf->stride - 1) << GEN7_SURFACE_PITCH_SHIFT;
> +	ss[3] = (buf->surface[0].stride - 1) <<
> GEN7_SURFACE_PITCH_SHIFT;
>  	ss[4] = 0;
>  	if (IS_VALLEYVIEW(batch->devid))
>  		ss[5] = VLV_MOCS_L3 << 16;
> diff --git a/lib/rendercopy_gen8.c b/lib/rendercopy_gen8.c
> index e22d8501..8e02d846 100644
> --- a/lib/rendercopy_gen8.c
> +++ b/lib/rendercopy_gen8.c
> @@ -151,7 +151,7 @@ gen8_bind_buf(struct intel_batchbuffer *batch,
>  	uint32_t write_domain, read_domain, offset;
>  	int ret;
>  
> -	igt_assert_lte(buf->stride, 256*1024);
> +	igt_assert_lte(buf->surface[0].stride, 256*1024);
>  	igt_assert_lte(igt_buf_width(buf), 16384);
>  	igt_assert_lte(igt_buf_height(buf), 16384);
>  
> @@ -199,7 +199,7 @@ gen8_bind_buf(struct intel_batchbuffer *batch,
>  
>  	ss->ss2.height = igt_buf_height(buf) - 1;
>  	ss->ss2.width  = igt_buf_width(buf) - 1;
> -	ss->ss3.pitch  = buf->stride - 1;
> +	ss->ss3.pitch  = buf->surface[0].stride - 1;
>  
>  	ss->ss7.shader_chanel_select_r = 4;
>  	ss->ss7.shader_chanel_select_g = 5;
> diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
> index 4d4541e3..835c8d80 100644
> --- a/lib/rendercopy_gen9.c
> +++ b/lib/rendercopy_gen9.c
> @@ -199,7 +199,7 @@ gen8_bind_buf(struct intel_batchbuffer *batch,
> const struct igt_buf *buf,
>  	uint32_t write_domain, read_domain, offset;
>  	int ret;
>  
> -	igt_assert_lte(buf->stride, 256*1024);
> +	igt_assert_lte(buf->surface[0].stride, 256*1024);
>  	igt_assert_lte(igt_buf_width(buf), 16384);
>  	igt_assert_lte(igt_buf_height(buf), 16384);
>  
> @@ -250,7 +250,7 @@ gen8_bind_buf(struct intel_batchbuffer *batch,
> const struct igt_buf *buf,
>  
>  	ss->ss2.height = igt_buf_height(buf) - 1;
>  	ss->ss2.width  = igt_buf_width(buf) - 1;
> -	ss->ss3.pitch  = buf->stride - 1;
> +	ss->ss3.pitch  = buf->surface[0].stride - 1;
>  
>  	ss->ss7.skl.shader_chanel_select_r = 4;
>  	ss->ss7.skl.shader_chanel_select_g = 5;
> diff --git a/lib/rendercopy_i830.c b/lib/rendercopy_i830.c
> index e8c04718..ca815122 100644
> --- a/lib/rendercopy_i830.c
> +++ b/lib/rendercopy_i830.c
> @@ -138,7 +138,7 @@ static void gen2_emit_target(struct
> intel_batchbuffer *batch,
>  	uint32_t tiling;
>  	uint32_t format;
>  
> -	igt_assert_lte(dst->stride, 8192);
> +	igt_assert_lte(dst->surface[0].stride, 8192);
>  	igt_assert_lte(igt_buf_width(dst), 2048);
>  	igt_assert_lte(igt_buf_height(dst), 2048);
>  
> @@ -156,7 +156,7 @@ static void gen2_emit_target(struct
> intel_batchbuffer *batch,
>  		tiling |= BUF_3D_TILE_WALK_Y;
>  
>  	OUT_BATCH(_3DSTATE_BUF_INFO_CMD);
> -	OUT_BATCH(BUF_3D_ID_COLOR_BACK | tiling | BUF_3D_PITCH(dst-
> >stride));
> +	OUT_BATCH(BUF_3D_ID_COLOR_BACK | tiling | BUF_3D_PITCH(dst-
> >surface[0].stride));
>  	OUT_RELOC(dst->bo, I915_GEM_DOMAIN_RENDER,
> I915_GEM_DOMAIN_RENDER, 0);
>  
>  	OUT_BATCH(_3DSTATE_DST_BUF_VARS_CMD);
> @@ -179,7 +179,7 @@ static void gen2_emit_texture(struct
> intel_batchbuffer *batch,
>  	uint32_t tiling;
>  	uint32_t format;
>  
> -	igt_assert_lte(src->stride, 8192);
> +	igt_assert_lte(src->surface[0].stride, 8192);
>  	igt_assert_lte(igt_buf_width(src), 2048);
>  	igt_assert_lte(igt_buf_height(src), 2048);
>  
> @@ -201,7 +201,7 @@ static void gen2_emit_texture(struct
> intel_batchbuffer *batch,
>  	OUT_BATCH((igt_buf_height(src) - 1) << TM0S1_HEIGHT_SHIFT |
>  		  (igt_buf_width(src) - 1) << TM0S1_WIDTH_SHIFT |
>  		  format | tiling);
> -	OUT_BATCH((src->stride / 4 - 1) << TM0S2_PITCH_SHIFT |
> TM0S2_MAP_2D);
> +	OUT_BATCH((src->surface[0].stride / 4 - 1) << TM0S2_PITCH_SHIFT
> | TM0S2_MAP_2D);
>  	OUT_BATCH(FILTER_NEAREST << TM0S3_MAG_FILTER_SHIFT |
>  		  FILTER_NEAREST << TM0S3_MIN_FILTER_SHIFT |
>  		  MIPFILTER_NONE << TM0S3_MIP_FILTER_SHIFT);
> diff --git a/lib/rendercopy_i915.c b/lib/rendercopy_i915.c
> index 1baa7a1b..56e1863e 100644
> --- a/lib/rendercopy_i915.c
> +++ b/lib/rendercopy_i915.c
> @@ -88,7 +88,7 @@ void gen3_render_copyfunc(struct intel_batchbuffer
> *batch,
>  #define TEX_COUNT 1
>  		uint32_t format_bits, tiling_bits = 0;
>  
> -		igt_assert_lte(src->stride, 8192);
> +		igt_assert_lte(src->surface[0].stride, 8192);
>  		igt_assert_lte(igt_buf_width(src), 2048);
>  		igt_assert_lte(igt_buf_height(src), 2048);
>  
> @@ -110,7 +110,7 @@ void gen3_render_copyfunc(struct
> intel_batchbuffer *batch,
>  		OUT_BATCH(format_bits | tiling_bits |
>  			  (igt_buf_height(src) - 1) << MS3_HEIGHT_SHIFT
> |
>  			  (igt_buf_width(src) - 1) << MS3_WIDTH_SHIFT);
> -		OUT_BATCH((src->stride/4-1) << MS4_PITCH_SHIFT);
> +		OUT_BATCH((src->surface[0].stride/4-1) <<
> MS4_PITCH_SHIFT);
>  
>  		OUT_BATCH(_3DSTATE_SAMPLER_STATE | (3 * TEX_COUNT));
>  		OUT_BATCH((1 << TEX_COUNT) - 1);
> @@ -128,7 +128,7 @@ void gen3_render_copyfunc(struct
> intel_batchbuffer *batch,
>  		uint32_t tiling_bits = 0;
>  		uint32_t format_bits;
>  
> -		igt_assert_lte(dst->stride, 8192);
> +		igt_assert_lte(dst->surface[0].stride, 8192);
>  		igt_assert_lte(igt_buf_width(dst), 2048);
>  		igt_assert_lte(igt_buf_height(dst), 2048);
>  
> @@ -146,7 +146,7 @@ void gen3_render_copyfunc(struct
> intel_batchbuffer *batch,
>  
>  		OUT_BATCH(_3DSTATE_BUF_INFO_CMD);
>  		OUT_BATCH(BUF_3D_ID_COLOR_BACK | tiling_bits |
> -			  BUF_3D_PITCH(dst->stride));
> +			  BUF_3D_PITCH(dst->surface[0].stride));
>  		OUT_RELOC(dst->bo, I915_GEM_DOMAIN_RENDER,
> I915_GEM_DOMAIN_RENDER, 0);
>  
>  		OUT_BATCH(_3DSTATE_DST_BUF_VARS_CMD);
> diff --git a/lib/veboxcopy_gen12.c b/lib/veboxcopy_gen12.c
> index 87800941..2f017514 100644
> --- a/lib/veboxcopy_gen12.c
> +++ b/lib/veboxcopy_gen12.c
> @@ -248,12 +248,14 @@ void gen12_vebox_copyfunc(struct
> intel_batchbuffer *batch,
>  	/* TODO: add support for more formats */
>  	igt_assert(src->bpp == 32);
>  	emit_surface_state_cmd(batch, VEBOX_SURFACE_INPUT,
> -			       width, height, src->bpp, src->stride,
> +			       width, height, src->bpp,
> +			       src->surface[0].stride,
>  			       src->tiling, R8G8B8A8_UNORM);
>  
>  	igt_assert(dst->bpp == 32);
>  	emit_surface_state_cmd(batch, VEBOX_SURFACE_OUTPUT,
> -			       width, height, dst->bpp, dst->stride,
> +			       width, height, dst->bpp,
> +			       dst->surface[0].stride,
>  			       dst->tiling, R8G8B8A8_UNORM);
>  
>  	emit_tiling_convert_cmd(batch,
> diff --git a/tests/i915/gem_concurrent_all.c
> b/tests/i915/gem_concurrent_all.c
> index 6486bebf..f1be4a85 100644
> --- a/tests/i915/gem_concurrent_all.c
> +++ b/tests/i915/gem_concurrent_all.c
> @@ -851,15 +851,17 @@ static void render_copy_bo(struct buffers *b,
> drm_intel_bo *dst, drm_intel_bo *s
>  {
>  	struct igt_buf d = {
>  		.bo = dst,
> -		.size = b->npixels * 4,
>  		.num_tiles = b->npixels * 4,
> -		.stride = b->width * 4,
> +		.surface[0] = {
> +			.size = b->npixels * 4, .stride = b->width * 4,
> +		},
>  		.bpp = 32,
>  	}, s = {
>  		.bo = src,
> -		.size = b->npixels * 4,
>  		.num_tiles = b->npixels * 4,
> -		.stride = b->width * 4,
> +		.surface[0] = {
> +			.size = b->npixels * 4, .stride = b->width * 4,
> +		},
>  		.bpp = 32,
>  	};
>  	uint32_t swizzle;
> diff --git a/tests/i915/gem_gpgpu_fill.c
> b/tests/i915/gem_gpgpu_fill.c
> index 68918c3e..b2d401d6 100644
> --- a/tests/i915/gem_gpgpu_fill.c
> +++ b/tests/i915/gem_gpgpu_fill.c
> @@ -75,9 +75,9 @@ static void scratch_buf_init(data_t *data, struct
> igt_buf *buf,
>  	memset(buf, 0, sizeof(*buf));
>  
>  	buf->bo = bo;
> -	buf->stride = stride;
> +	buf->surface[0].stride = stride;
>  	buf->tiling = I915_TILING_NONE;
> -	buf->size = SIZE;
> +	buf->surface[0].size = SIZE;
>  	buf->bpp = 32;
>  }
>  
> diff --git a/tests/i915/gem_media_fill.c
> b/tests/i915/gem_media_fill.c
> index a7d7708c..c880bae9 100644
> --- a/tests/i915/gem_media_fill.c
> +++ b/tests/i915/gem_media_fill.c
> @@ -78,9 +78,9 @@ static void scratch_buf_init(data_t *data, struct
> igt_buf *buf,
>  	memset(buf, 0, sizeof(*buf));
>  
>  	buf->bo = bo;
> -	buf->stride = stride;
> +	buf->surface[0].stride = stride;
>  	buf->tiling = I915_TILING_NONE;
> -	buf->size = SIZE;
> +	buf->surface[0].size = SIZE;
>  	buf->bpp = 32;
>  }
>  
> diff --git a/tests/i915/gem_media_vme.c b/tests/i915/gem_media_vme.c
> index d5045ad1..20f5ca35 100644
> --- a/tests/i915/gem_media_vme.c
> +++ b/tests/i915/gem_media_vme.c
> @@ -58,7 +58,7 @@ scratch_buf_init(drm_intel_bufmgr *bufmgr,
>  
>  	buf->bo = bo;
>  	buf->tiling = I915_TILING_NONE;
> -	buf->size = size;
> +	buf->surface[0].size = size;
>  }
>  
>  static void scratch_buf_init_src(drm_intel_bufmgr *bufmgr, struct
> igt_buf *buf)
> @@ -71,14 +71,14 @@ static void scratch_buf_init_src(drm_intel_bufmgr
> *bufmgr, struct igt_buf *buf)
>  	 * with this vme kernel.
>  	 */
>  
> -	buf->stride = STRIDE;
> +	buf->surface[0].stride = STRIDE;
>  }
>  
>  static void scratch_buf_init_dst(drm_intel_bufmgr *bufmgr, struct
> igt_buf *buf)
>  {
>  	scratch_buf_init(bufmgr, buf, OUTPUT_SIZE);
>  
> -	buf->stride = 1;
> +	buf->surface[0].stride = 1;
>  }
>  
>  static uint64_t switch_off_n_bits(uint64_t mask, unsigned int n)
> diff --git a/tests/i915/gem_ppgtt.c b/tests/i915/gem_ppgtt.c
> index 89cdc4db..4c7d3ba2 100644
> --- a/tests/i915/gem_ppgtt.c
> +++ b/tests/i915/gem_ppgtt.c
> @@ -73,9 +73,9 @@ static void scratch_buf_init(struct igt_buf *buf,
>  	memset(buf, 0, sizeof(*buf));
>  
>  	buf->bo = create_bo(bufmgr, pixel);
> -	buf->stride = STRIDE;
> +	buf->surface[0].stride = STRIDE;
>  	buf->tiling = I915_TILING_NONE;
> -	buf->size = SIZE;
> +	buf->surface[0].size = SIZE;
>  	buf->bpp = 32;
>  }
>  
> @@ -140,9 +140,9 @@ static void fork_rcs_copy(int timeout, uint32_t
> final,
>  		}
>  
>  		buf.bo = dst[child];
> -		buf.stride = STRIDE;
> +		buf.surface[0].stride = STRIDE;
>  		buf.tiling = I915_TILING_NONE;
> -		buf.size = SIZE;
> +		buf.surface[0].size = SIZE;
>  		buf.bpp = 32;
>  
>  		i = 0;
> diff --git a/tests/i915/gem_read_read_speed.c
> b/tests/i915/gem_read_read_speed.c
> index 8b5ba8f7..2aab2204 100644
> --- a/tests/i915/gem_read_read_speed.c
> +++ b/tests/i915/gem_read_read_speed.c
> @@ -53,15 +53,17 @@ static drm_intel_bo *rcs_copy_bo(drm_intel_bo
> *dst, drm_intel_bo *src)
>  {
>  	struct igt_buf d = {
>  		.bo = dst,
> -		.size = width * height * 4,
>  		.num_tiles = width * height * 4,
> -		.stride = width * 4,
> +		.surface[0] = {
> +			.size = width * height * 4, .stride = width *
> 4,
> +		},
>  		.bpp = 32,
>  	}, s = {
>  		.bo = src,
> -		.size = width * height * 4,
>  		.num_tiles = width * height * 4,
> -		.stride = width * 4,
> +		.surface[0] = {
> +			.size = width * height * 4, .stride = width *
> 4,
> +		},
>  		.bpp = 32,
>  	};
>  	uint32_t swizzle;
> diff --git a/tests/i915/gem_render_copy.c
> b/tests/i915/gem_render_copy.c
> index df0d045e..5abb2036 100644
> --- a/tests/i915/gem_render_copy.c
> +++ b/tests/i915/gem_render_copy.c
> @@ -118,7 +118,8 @@ static void copy_linear_to_yf(data_t *data,
> struct igt_buf *buf,
>  	for (int y = 0; y < height; y++) {
>  		for (int x = 0; x < width; x++) {
>  			uint32_t *ptr = yf_ptr(map, x, y,
> -					       buf->stride, buf->bpp /
> 8);
> +					       buf->surface[0].stride,
> +					       buf->bpp / 8);
>  
>  			*ptr = linear[y * width + x];
>  		}
> @@ -142,7 +143,8 @@ static void copy_yf_to_linear(data_t *data,
> struct igt_buf *buf,
>  	for (int y = 0; y < height; y++) {
>  		for (int x = 0; x < width; x++) {
>  			uint32_t *ptr = yf_ptr(map, x, y,
> -					       buf->stride, buf->bpp /
> 8);
> +					       buf->surface[0].stride,
> +					       buf->bpp / 8);
>  
>  			linear[y * width + x] = *ptr;
>  		}
> @@ -231,7 +233,7 @@ static void scratch_buf_write_to_png(data_t
> *data, struct igt_buf *buf,
>  						      CAIRO_FORMAT_RGB2
> 4,
>  						      igt_buf_width(buf
> ),
>  						      igt_buf_height(bu
> f),
> -						      buf->stride);
> +						      buf-
> >surface[0].stride);
>  	ret = cairo_surface_write_to_png(surface,
> make_filename(filename));
>  	igt_assert(ret == CAIRO_STATUS_SUCCESS);
>  	cairo_surface_destroy(surface);
> @@ -324,7 +326,7 @@ static void scratch_buf_draw_pattern(data_t
> *data, struct igt_buf *buf,
>  						      CAIRO_FORMAT_RGB2
> 4,
>  						      igt_buf_width(buf
> ),
>  						      igt_buf_height(bu
> f),
> -						      buf->stride);
> +						      buf-
> >surface[0].stride);
>  
>  	cr = cairo_create(surface);
>  
> @@ -403,7 +405,7 @@ scratch_buf_copy(data_t *data,
>  		for (int y = 0; y < h; y++) {
>  			for (int x = 0; x < w; x++) {
>  				const uint32_t *ptr = yf_ptr(map, sx+x,
> sy+y,
> -							     src-
> >stride,
> +							     src-
> >surface[0].stride,
>  							     src->bpp /
> 8);
>  
>  				linear_dst[(dy+y) * width + dx+x] =
> *ptr;
> @@ -458,14 +460,14 @@ static void scratch_buf_init(data_t *data,
> struct igt_buf *buf,
>  		 * turn mapped by one L1 AUX page table entry.
>  		 */
>  		if (intel_gen(data->devid) >= 12)
> -			buf->stride = ALIGN(width * (bpp / 8), 128 *
> 4);
> +			buf->surface[0].stride = ALIGN(width * (bpp /
> 8), 128 * 4);
>  		else
> -			buf->stride = ALIGN(width * (bpp / 8), 128);
> +			buf->surface[0].stride = ALIGN(width * (bpp /
> 8), 128);
>  
>  		if (intel_gen(data->devid) >= 12)
>  			height = ALIGN(height, 4 * 32);
>  
> -		buf->size = buf->stride * height;
> +		buf->surface[0].size = buf->surface[0].stride * height;
>  		buf->tiling = tiling;
>  		buf->bpp = bpp;
>  
> @@ -473,7 +475,7 @@ static void scratch_buf_init(data_t *data, struct
> igt_buf *buf,
>  		aux_height = scratch_buf_aux_height(data->devid, buf);
>  
>  		buf->compression = compression;
> -		buf->ccs[0].offset = buf->stride * ALIGN(height, 32);
> +		buf->ccs[0].offset = buf->surface[0].stride *
> ALIGN(height, 32);
>  		buf->ccs[0].stride = aux_width;
>  
>  		size = buf->ccs[0].offset + aux_width * aux_height;
> @@ -481,18 +483,19 @@ static void scratch_buf_init(data_t *data,
> struct igt_buf *buf,
>  		buf->bo = drm_intel_bo_alloc(data->bufmgr, "", size,
> 4096);
>  
>  		if (tiling == I915_TILING_Y) {
> -			drm_intel_bo_set_tiling(buf->bo, &tiling, buf-
> >stride);
> +			drm_intel_bo_set_tiling(buf->bo, &tiling,
> +						buf-
> >surface[0].stride);
>  			igt_assert_eq(tiling, req_tiling);
>  		}
>  	} else if (req_tiling == I915_TILING_Yf) {
>  		int size;
>  
> -		buf->stride = ALIGN(width * (bpp / 8), 128);
> -		buf->size = buf->stride * height;
> +		buf->surface[0].stride = ALIGN(width * (bpp / 8), 128);
> +		buf->surface[0].size = buf->surface[0].stride * height;
>  		buf->tiling = tiling;
>  		buf->bpp = bpp;
>  
> -		size = buf->stride * ALIGN(height, 32);
> +		size = buf->surface[0].stride * ALIGN(height, 32);
>  
>  		buf->bo = drm_intel_bo_alloc(data->bufmgr, "", size,
> 4096);
>  	} else {
> @@ -501,9 +504,9 @@ static void scratch_buf_init(data_t *data, struct
> igt_buf *buf,
>  						   &tiling, &pitch, 0);
>  		igt_assert_eq(tiling, req_tiling);
>  
> -		buf->stride = pitch;
> +		buf->surface[0].stride = pitch;
>  		buf->tiling = tiling;
> -		buf->size = pitch * height;
> +		buf->surface[0].size = pitch * height;
>  		buf->bpp = bpp;
>  	}
>  
> @@ -806,7 +809,7 @@ static void test(data_t *data, uint32_t
> src_tiling, uint32_t dst_tiling,
>  					      0, 0,
> igt_buf_width(&dst),
>  					      igt_buf_height(&dst),
>  					      AUB_DUMP_BMP_FORMAT_ARGB_
> 8888,
> -					      dst.stride, 0);
> +					      dst.surface[0].stride,
> 0);
>  		drm_intel_bufmgr_gem_set_aub_dump(data->bufmgr, false);
>  	} else if (check_all_pixels) {
>  		scratch_buf_check_all(data, &dst, &ref);
> diff --git a/tests/i915/gem_render_copy_redux.c
> b/tests/i915/gem_render_copy_redux.c
> index ef601c22..2388fc24 100644
> --- a/tests/i915/gem_render_copy_redux.c
> +++ b/tests/i915/gem_render_copy_redux.c
> @@ -106,9 +106,9 @@ static void scratch_buf_init(data_t *data, struct
> igt_buf *buf,
>  	memset(buf, 0, sizeof(*buf));
>  
>  	buf->bo = bo;
> -	buf->stride = stride;
> +	buf->surface[0].stride = stride;
>  	buf->tiling = I915_TILING_NONE;
> -	buf->size = SIZE;
> +	buf->surface[0].size = SIZE;
>  	buf->bpp = 32;
>  }
>  
> diff --git a/tests/i915/gem_render_linear_blits.c
> b/tests/i915/gem_render_linear_blits.c
> index a726652b..666a43cd 100644
> --- a/tests/i915/gem_render_linear_blits.c
> +++ b/tests/i915/gem_render_linear_blits.c
> @@ -108,15 +108,15 @@ static void run_test (int fd, int count)
>  		struct igt_buf src = {}, dst = {};
>  
>  		src.bo = bo[i % count];
> -		src.stride = STRIDE;
> +		src.surface[0].stride = STRIDE;
>  		src.tiling = I915_TILING_NONE;
> -		src.size = SIZE;
> +		src.surface[0].size = SIZE;
>  		src.bpp = 32;
>  
>  		dst.bo = bo[(i + 1) % count];
> -		dst.stride = STRIDE;
> +		dst.surface[0].stride = STRIDE;
>  		dst.tiling = I915_TILING_NONE;
> -		dst.size = SIZE;
> +		dst.surface[0].size = SIZE;
>  		dst.bpp = 32;
>  
>  		render_copy(batch, NULL, &src, 0, 0, WIDTH, HEIGHT,
> &dst, 0, 0);
> @@ -133,15 +133,15 @@ static void run_test (int fd, int count)
>  		struct igt_buf src = {}, dst = {};
>  
>  		src.bo = bo[(i + 1) % count];
> -		src.stride = STRIDE;
> +		src.surface[0].stride = STRIDE;
>  		src.tiling = I915_TILING_NONE;
> -		src.size = SIZE;
> +		src.surface[0].size = SIZE;
>  		src.bpp = 32;
>  
>  		dst.bo = bo[i % count];
> -		dst.stride = STRIDE;
> +		dst.surface[0].stride = STRIDE;
>  		dst.tiling = I915_TILING_NONE;
> -		dst.size = SIZE;
> +		dst.surface[0].size = SIZE;
>  		dst.bpp = 32;
>  
>  		render_copy(batch, NULL, &src, 0, 0, WIDTH, HEIGHT,
> &dst, 0, 0);
> @@ -160,15 +160,15 @@ static void run_test (int fd, int count)
>  			continue;
>  
>  		src.bo = bo[s];
> -		src.stride = STRIDE;
> +		src.surface[0].stride = STRIDE;
>  		src.tiling = I915_TILING_NONE;
> -		src.size = SIZE;
> +		src.surface[0].size = SIZE;
>  		src.bpp = 32;
>  
>  		dst.bo = bo[d];
> -		dst.stride = STRIDE;
> +		dst.surface[0].stride = STRIDE;
>  		dst.tiling = I915_TILING_NONE;
> -		dst.size = SIZE;
> +		dst.surface[0].size = SIZE;
>  		dst.bpp = 32;
>  
>  		render_copy(batch, NULL, &src, 0, 0, WIDTH, HEIGHT,
> &dst, 0, 0);
> diff --git a/tests/i915/gem_render_tiled_blits.c
> b/tests/i915/gem_render_tiled_blits.c
> index 14018329..1de1b72c 100644
> --- a/tests/i915/gem_render_tiled_blits.c
> +++ b/tests/i915/gem_render_tiled_blits.c
> @@ -66,9 +66,9 @@ check_bo(struct intel_batchbuffer *batch, struct
> igt_buf *buf, uint32_t val)
>  	int i;
>  
>  	tmp.bo = linear;
> -	tmp.stride = STRIDE;
> +	tmp.surface[0].stride = STRIDE;
>  	tmp.tiling = I915_TILING_NONE;
> -	tmp.size = SIZE;
> +	tmp.surface[0].size = SIZE;
>  	tmp.bpp = 32;
>  
>  	render_copy(batch, NULL, buf, 0, 0, WIDTH, HEIGHT, &tmp, 0, 0);
> @@ -132,9 +132,9 @@ static void run_test (int fd, int count)
>  		buf[i].bo = drm_intel_bo_alloc_tiled(bufmgr, "",
>  						     WIDTH, HEIGHT, 4,
>  						     &tiling, &pitch,
> 0);
> -		buf[i].stride = pitch;
> +		buf[i].surface[0].stride = pitch;
>  		buf[i].tiling = tiling;
> -		buf[i].size = SIZE;
> +		buf[i].surface[0].size = SIZE;
>  		buf[i].bpp = 32;
>  
>  		start_val[i] = start;
> diff --git a/tests/i915/gem_ring_sync_copy.c
> b/tests/i915/gem_ring_sync_copy.c
> index 1e5728bc..ddf5f750 100644
> --- a/tests/i915/gem_ring_sync_copy.c
> +++ b/tests/i915/gem_ring_sync_copy.c
> @@ -134,9 +134,9 @@ static void scratch_buf_init_from_bo(struct
> igt_buf *buf, drm_intel_bo *bo)
>  	memset(buf, 0, sizeof(*buf));
>  
>  	buf->bo = bo;
> -	buf->stride = 4 * WIDTH;
> +	buf->surface[0].stride = 4 * WIDTH;
>  	buf->tiling = I915_TILING_NONE;
> -	buf->size = 4 * WIDTH * HEIGHT;
> +	buf->surface[0].size = 4 * WIDTH * HEIGHT;
>  	buf->bpp = 32;
>  }
>  
> diff --git a/tests/i915/gem_stress.c b/tests/i915/gem_stress.c
> index 57e2909c..50245b93 100644
> --- a/tests/i915/gem_stress.c
> +++ b/tests/i915/gem_stress.c
> @@ -155,8 +155,8 @@ struct {
>  static void tile2xy(struct igt_buf *buf, unsigned tile, unsigned *x,
> unsigned *y)
>  {
>  	igt_assert(tile < buf->num_tiles);
> -	*x = (tile*options.tile_size) % (buf->stride/sizeof(uint32_t));
> -	*y = ((tile*options.tile_size) / (buf-
> >stride/sizeof(uint32_t))) * options.tile_size;
> +	*x = (tile*options.tile_size) % (buf-
> >surface[0].stride/sizeof(uint32_t));
> +	*y = ((tile*options.tile_size) / (buf-
> >surface[0].stride/sizeof(uint32_t))) * options.tile_size;
>  }
>  
>  static void emit_blt(drm_intel_bo *src_bo, uint32_t src_tiling,
> unsigned src_pitch,
> @@ -268,8 +268,10 @@ static void cpu_copyfunc(struct igt_buf *src,
> unsigned src_x, unsigned src_y,
>  		set_to_cpu_domain(dst, 1);
>  	}
>  
> -	cpucpy2d(src->data, src->stride/sizeof(uint32_t), src_x, src_y,
> -		 dst->data, dst->stride/sizeof(uint32_t), dst_x, dst_y,
> +	cpucpy2d(src->data, src->surface[0].stride/sizeof(uint32_t),
> src_x,
> +		 src_y,
> +		 dst->data, dst->surface[0].stride/sizeof(uint32_t),
> dst_x,
> +		 dst_y,
>  		 logical_tile_no);
>  }
>  
> @@ -287,7 +289,7 @@ static void prw_copyfunc(struct igt_buf *src,
> unsigned src_x, unsigned src_y,
>  
>  	if (src->tiling == I915_TILING_NONE) {
>  		for (i = 0; i < options.tile_size; i++) {
> -			unsigned ofs = src_x*sizeof(uint32_t) + src-
> >stride*(src_y + i);
> +			unsigned ofs = src_x*sizeof(uint32_t) + src-
> >surface[0].stride*(src_y + i);
>  			drm_intel_bo_get_subdata(src->bo, ofs,
>  						 options.tile_size*size
> of(uint32_t),
>  						 tmp_tile +
> options.tile_size*i);
> @@ -296,13 +298,14 @@ static void prw_copyfunc(struct igt_buf *src,
> unsigned src_x, unsigned src_y,
>  		if (options.use_cpu_maps)
>  			set_to_cpu_domain(src, 0);
>  
> -		cpucpy2d(src->data, src->stride/sizeof(uint32_t),
> src_x, src_y,
> +		cpucpy2d(src->data, src-
> >surface[0].stride/sizeof(uint32_t),
> +			 src_x, src_y,
>  			 tmp_tile, options.tile_size, 0, 0,
> logical_tile_no);
>  	}
>  
>  	if (dst->tiling == I915_TILING_NONE) {
>  		for (i = 0; i < options.tile_size; i++) {
> -			unsigned ofs = dst_x*sizeof(uint32_t) + dst-
> >stride*(dst_y + i);
> +			unsigned ofs = dst_x*sizeof(uint32_t) + dst-
> >surface[0].stride*(dst_y + i);
>  			drm_intel_bo_subdata(dst->bo, ofs,
>  					     options.tile_size*sizeof(u
> int32_t),
>  					     tmp_tile +
> options.tile_size*i);
> @@ -312,7 +315,8 @@ static void prw_copyfunc(struct igt_buf *src,
> unsigned src_x, unsigned src_y,
>  			set_to_cpu_domain(dst, 1);
>  
>  		cpucpy2d(tmp_tile, options.tile_size, 0, 0,
> -			 dst->data, dst->stride/sizeof(uint32_t),
> dst_x, dst_y,
> +			 dst->data, dst-
> >surface[0].stride/sizeof(uint32_t),
> +			 dst_x, dst_y,
>  			 logical_tile_no);
>  	}
>  }
> @@ -327,9 +331,9 @@ static void blitter_copyfunc(struct igt_buf *src,
> unsigned src_x, unsigned src_y
>  	if (keep_gpu_busy_counter & 1 && !fence_storm)
>  		keep_gpu_busy();
>  
> -	emit_blt(src->bo, src->tiling, src->stride, src_x, src_y,
> +	emit_blt(src->bo, src->tiling, src->surface[0].stride, src_x,
> src_y,
>  		 options.tile_size, options.tile_size,
> -		 dst->bo, dst->tiling, dst->stride, dst_x, dst_y);
> +		 dst->bo, dst->tiling, dst->surface[0].stride, dst_x,
> dst_y);
>  
>  	if (!(keep_gpu_busy_counter & 1) && !fence_storm)
>  		keep_gpu_busy();
> @@ -441,7 +445,7 @@ static void fan_out(void)
>  
>  		cpucpy2d(tmp_tile, options.tile_size, 0, 0,
>  			 buffers[current_set][buf_idx].data,
> -			 buffers[current_set][buf_idx].stride /
> sizeof(uint32_t),
> +			 buffers[current_set][buf_idx].surface[0].strid
> e / sizeof(uint32_t),
>  			 x, y, i);
>  	}
>  
> @@ -465,7 +469,7 @@ static void fan_in_and_check(void)
>  			set_to_cpu_domain(&buffers[current_set][buf_idx
> ], 0);
>  
>  		cpucpy2d(buffers[current_set][buf_idx].data,
> -			 buffers[current_set][buf_idx].stride /
> sizeof(uint32_t),
> +			 buffers[current_set][buf_idx].surface[0].strid
> e / sizeof(uint32_t),
>  			 x, y,
>  			 tmp_tile, options.tile_size, 0, 0,
>  			 i);
> @@ -476,15 +480,15 @@ static void sanitize_stride(struct igt_buf
> *buf)
>  {
>  
>  	if (igt_buf_height(buf) > options.max_dimension)
> -		buf->stride = buf->size / options.max_dimension;
> +		buf->surface[0].stride = buf->surface[0].size /
> options.max_dimension;
>  
>  	if (igt_buf_height(buf) < options.tile_size)
> -		buf->stride = buf->size / options.tile_size;
> +		buf->surface[0].stride = buf->surface[0].size /
> options.tile_size;
>  
>  	if (igt_buf_width(buf) < options.tile_size)
> -		buf->stride = options.tile_size * sizeof(uint32_t);
> +		buf->surface[0].stride = options.tile_size *
> sizeof(uint32_t);
>  
> -	igt_assert(buf->stride <= 8192);
> +	igt_assert(buf->surface[0].stride <= 8192);
>  	igt_assert(igt_buf_width(buf) <= options.max_dimension);
>  	igt_assert(igt_buf_height(buf) <= options.max_dimension);
>  
> @@ -498,10 +502,10 @@ static void init_buffer(struct igt_buf *buf,
> unsigned size)
>  	memset(buf, 0, sizeof(*buf));
>  
>  	buf->bo = drm_intel_bo_alloc(bufmgr, "tiled bo", size, 4096);
> -	buf->size = size;
> +	buf->surface[0].size = size;
>  	igt_assert(buf->bo);
>  	buf->tiling = I915_TILING_NONE;
> -	buf->stride = 4096;
> +	buf->surface[0].stride = 4096;
>  	buf->bpp = 32;
>  
>  	sanitize_stride(buf);
> @@ -560,25 +564,26 @@ static void init_set(unsigned set)
>  		if (buffers[set][i].tiling == I915_TILING_NONE) {
>  			/* min 64 byte stride */
>  			r %= 8;
> -			buffers[set][i].stride = 64 * (1 << r);
> +			buffers[set][i].surface[0].stride = 64 * (1 <<
> r);
>  		} else if (IS_GEN2(devid)) {
>  			/* min 128 byte stride */
>  			r %= 7;
> -			buffers[set][i].stride = 128 * (1 << r);
> +			buffers[set][i].surface[0].stride = 128 * (1 <<
> r);
>  		} else {
>  			/* min 512 byte stride */
>  			r %= 5;
> -			buffers[set][i].stride = 512 * (1 << r);
> +			buffers[set][i].surface[0].stride = 512 * (1 <<
> r);
>  		}
>  
>  		sanitize_stride(&buffers[set][i]);
>  
>  		gem_set_tiling(drm_fd, buffers[set][i].bo->handle,
>  			       buffers[set][i].tiling,
> -			       buffers[set][i].stride);
> +			       buffers[set][i].surface[0].stride);
>  
>  		if (options.trace_tile != -1 && i ==
> options.trace_tile/options.tiles_per_buf)
> -			igt_info("changing buffer %i containing tile
> %i: tiling %i, stride %i\n", i, options.trace_tile,
> buffers[set][i].tiling, buffers[set][i].stride);
> +			igt_info("changing buffer %i containing tile
> %i: tiling %i, stride %i\n", i, options.trace_tile,
> buffers[set][i].tiling,
> +				 buffers[set][i].surface[0].stride);
>  	}
>  }
>  
> @@ -616,10 +621,10 @@ static void copy_tiles(unsigned *permutation)
>  
>  		if (options.no_hw) {
>  			cpucpy2d(src_buf->data,
> -				 src_buf->stride / sizeof(uint32_t),
> +				 src_buf->surface[0].stride /
> sizeof(uint32_t),
>  				 src_x, src_y,
>  				 dst_buf->data,
> -				 dst_buf->stride / sizeof(uint32_t),
> +				 dst_buf->surface[0].stride /
> sizeof(uint32_t),
>  				 dst_x, dst_y,
>  				 i);
>  		} else {
> @@ -808,7 +813,7 @@ static void check_render_copyfunc(void)
>  
>  		memset(src.data, 0xff, options.scratch_buf_size);
>  		for (j = 0; j < options.tile_size; j++) {
> -			ptr = (uint32_t*)((char *)src.data + sx*4 +
> (sy+j) * src.stride);
> +			ptr = (uint32_t*)((char *)src.data + sx*4 +
> (sy+j) * src.surface[0].stride);
>  			for (i = 0; i < options.tile_size; i++)
>  				ptr[i] = j * options.tile_size + i;
>  		}
> @@ -819,7 +824,7 @@ static void check_render_copyfunc(void)
>  			set_to_cpu_domain(&dst, 0);
>  
>  		for (j = 0; j < options.tile_size; j++) {
> -			ptr = (uint32_t*)((char *)dst.data + dx*4 +
> (dy+j) * dst.stride);
> +			ptr = (uint32_t*)((char *)dst.data + dx*4 +
> (dy+j) * dst.surface[0].stride);
>  			for (i = 0; i < options.tile_size; i++)
>  				if (ptr[i] != j * options.tile_size +
> i) {
>  					igt_info("render copyfunc
> mismatch at (%d, %d): found %d, expected %d\n", i, j, ptr[i], j *
> options.tile_size + i);
> diff --git a/tests/i915/i915_pm_sseu.c b/tests/i915/i915_pm_sseu.c
> index e671e190..c2dee118 100644
> --- a/tests/i915/i915_pm_sseu.c
> +++ b/tests/i915/i915_pm_sseu.c
> @@ -299,10 +299,11 @@ gem_init(void)
>  	igt_assert(gem.batch);
>  	gem.init = 3;
>  
> -	gem.buf.stride = sizeof(uint32_t);
> +	gem.buf.surface[0].stride = sizeof(uint32_t);
>  	gem.buf.tiling = I915_TILING_NONE;
> -	gem.buf.size = gem.buf.stride;
> -	gem.buf.bo = drm_intel_bo_alloc(gem.bufmgr, "", gem.buf.size,
> 4096);
> +	gem.buf.surface[0].size = gem.buf.surface[0].stride;
> +	gem.buf.bo = drm_intel_bo_alloc(gem.bufmgr, "",
> +					gem.buf.surface[0].size, 4096);
>  	gem.buf.bpp = 32;
>  	igt_assert(gem.buf.bo);
>  	gem.init = 4;
> diff --git a/tests/kms_big_fb.c b/tests/kms_big_fb.c
> index c5d002ca..eb144da9 100644
> --- a/tests/kms_big_fb.c
> +++ b/tests/kms_big_fb.c
> @@ -60,9 +60,9 @@ static void init_buf(data_t *data,
>  	buf->bo = gem_handle_to_libdrm_bo(data->bufmgr, data->drm_fd,
>  					  name, fb->gem_handle);
>  	buf->tiling = igt_fb_mod_to_tiling(fb->modifier);
> -	buf->stride = fb->strides[0];
> +	buf->surface[0].stride = fb->strides[0];
>  	buf->bpp = fb->plane_bpp[0];
> -	buf->size = fb->size;
> +	buf->surface[0].size = fb->size;
>  }
>  
>  static void fini_buf(struct igt_buf *buf)
> @@ -99,8 +99,10 @@ static void copy_pattern(data_t *data,
>  		h = min(h, src_fb->height - sy);
>  		h = min(h, dst_fb->height - dy);
>  
> -		intel_blt_copy(data->batch, src.bo, sx, sy, src.stride,
> -			       dst.bo, dx, dy, dst.stride, w, h,
> dst.bpp);
> +		intel_blt_copy(data->batch, src.bo, sx, sy,
> +			       src.surface[0].stride,
> +			       dst.bo, dx, dy, dst.surface[0].stride,
> w, h,
> +			       dst.bpp);
>  	}
>  
>  	fini_buf(&dst);
> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> index 630b9be7..f105e295 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -385,9 +385,9 @@ static void cleanup_crtc(data_t *data)
>  static void scratch_buf_init(data_t *data, int buffer)
>  {
>  	data->igtbo[buffer].bo = data->drmibo[buffer];
> -	data->igtbo[buffer].stride = data-
> >primary_fb[buffer].strides[0];
> +	data->igtbo[buffer].surface[0].stride = data-
> >primary_fb[buffer].strides[0];
>  	data->igtbo[buffer].tiling = data->primary_fb[buffer].modifier;
> -	data->igtbo[buffer].size = data->primary_fb[buffer].size;
> +	data->igtbo[buffer].surface[0].size = data-
> >primary_fb[buffer].size;
>  	data->igtbo[buffer].bpp = data-
> >primary_fb[buffer].plane_bpp[0];
>  }
>  
> diff --git a/tests/kms_psr.c b/tests/kms_psr.c
> index 232c80aa..d9be87d9 100644
> --- a/tests/kms_psr.c
> +++ b/tests/kms_psr.c
> @@ -153,9 +153,9 @@ static void scratch_buf_init(struct igt_buf *buf,
> drm_intel_bo *bo,
>  	memset(buf, 0, sizeof(*buf));
>  
>  	buf->bo = bo;
> -	buf->stride = stride;
> +	buf->surface[0].stride = stride;
>  	buf->tiling = I915_TILING_X;
> -	buf->size = size;
> +	buf->surface[0].size = size;
>  	buf->bpp = 32;
>  }
>  
> diff --git a/tests/perf.c b/tests/perf.c
> index f5dd6051..982277df 100644
> --- a/tests/perf.c
> +++ b/tests/perf.c
> @@ -506,9 +506,9 @@ scratch_buf_init(drm_intel_bufmgr *bufmgr,
>  	memset(buf, 0, sizeof(*buf));
>  
>  	buf->bo = bo;
> -	buf->stride = stride;
> +	buf->surface[0].stride = stride;
>  	buf->tiling = I915_TILING_NONE;
> -	buf->size = size;
> +	buf->surface[0].size = size;
>  	buf->bpp = 32;
>  }
>  
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
