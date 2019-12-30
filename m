Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20DB389B42
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Dec 2019 12:02:26 +0000 (UTC)
From: "Kahola, Mika" <mika.kahola@intel.com>
Date: Mon, 30 Dec 2019 12:02:22 +0000
Message-ID: <7a1cb315e646129c77d66191bfa250637a28c44e.camel@intel.com>
References: <20191230034040.21943-1-imre.deak@intel.com>
 <20191230034040.21943-3-imre.deak@intel.com>
In-Reply-To: <20191230034040.21943-3-imre.deak@intel.com>
Content-Language: en-US
Content-ID: <D0DD4BF8731ACA45BDB4C0DB85BDD23D@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 02/10] lib/igt_buf: Extend igt_buf to
 include two CCS surfaces
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

On Mon, 2019-12-30 at 05:40 +0200, Imre Deak wrote:
> YUV FBs have two CCS surfaces so extend the igt_buf struct
> accordingly
> to support blitting such FBs.
> 
> The patch is produced with the coccinelle patch below, along with
> some
> w/s fixup.
> 
> No functional change.
> 
> @@
> @@
> 
> struct igt_buf {
> 	...
> 	struct {
> 		uint32_t offset;
> 		uint32_t stride;
> -	} aux;
> +	} ccs[2];
> 	...
> };
> 
> @@
> struct igt_buf *b;
> @@
> 
> (
> - b->aux.offset
> + b->ccs[0].offset
> > 
> 
> - b->aux.stride
> + b->ccs[0].stride
> )
> 
> @@
> struct igt_buf b;
> @@
> 
> (
> - b.aux.offset
> + b.ccs[0].offset
> > 
> 
> - b.aux.stride
> + b.ccs[0].stride
> )
> 
> Cc: Mika Kahola <mika.kahola@intel.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>

Reviewed-by: Mika Kahola <mika.kahola@intel.com>

> ---
>  lib/igt_fb.c                 |  4 ++--
>  lib/intel_aux_pgtable.c      |  2 +-
>  lib/intel_batchbuffer.h      |  2 +-
>  lib/rendercopy_gen9.c        | 10 +++++-----
>  tests/i915/gem_render_copy.c | 10 +++++-----
>  5 files changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 7e99abb3..0e1b8493 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -1994,8 +1994,8 @@ static void init_buf(struct fb_blit_upload
> *blit,
>  		else
>  			buf->compression = I915_COMPRESSION_RENDER;
>  
> -		buf->aux.offset = fb->offsets[1];
> -		buf->aux.stride = fb->strides[1];
> +		buf->ccs[0].offset = fb->offsets[1];
> +		buf->ccs[0].stride = fb->strides[1];
>  	}
>  
>  	if (fb->modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC)
> diff --git a/lib/intel_aux_pgtable.c b/lib/intel_aux_pgtable.c
> index f8ce6754..dab83a9a 100644
> --- a/lib/intel_aux_pgtable.c
> +++ b/lib/intel_aux_pgtable.c
> @@ -256,7 +256,7 @@ pgt_populate_entries_for_buf(struct pgtable *pgt,
>  {
>  	uint64_t surface_addr = buf->bo->offset64;
>  	uint64_t surface_end = surface_addr + buf->size;
> -	uint64_t aux_addr = buf->bo->offset64 + buf->aux.offset;
> +	uint64_t aux_addr = buf->bo->offset64 + buf->ccs[0].offset;
>  	uint64_t l1_flags = pgt_get_l1_flags(buf);
>  	uint64_t lx_flags = pgt_get_lx_flags();
>  
> diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
> index c3028343..63d32188 100644
> --- a/lib/intel_batchbuffer.h
> +++ b/lib/intel_batchbuffer.h
> @@ -241,7 +241,7 @@ struct igt_buf {
>  	struct {
>  		uint32_t offset;
>  		uint32_t stride;
> -	} aux;
> +	} ccs[2];
>  	struct {
>  		uint32_t offset;
>  	} cc;
> diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
> index 88a94cbe..4d4541e3 100644
> --- a/lib/rendercopy_gen9.c
> +++ b/lib/rendercopy_gen9.c
> @@ -260,17 +260,17 @@ gen8_bind_buf(struct intel_batchbuffer *batch,
> const struct igt_buf *buf,
>  	if (buf->compression == I915_COMPRESSION_MEDIA)
>  		ss->ss7.tgl.media_compression = 1;
>  	else if (buf->compression == I915_COMPRESSION_RENDER) {
> -		igt_assert(buf->aux.stride);
> +		igt_assert(buf->ccs[0].stride);
>  
>  		ss->ss6.aux_mode = 0x5; /* AUX_CCS_E */
> -		ss->ss6.aux_pitch = (buf->aux.stride / 128) - 1;
> +		ss->ss6.aux_pitch = (buf->ccs[0].stride / 128) - 1;
>  
> -		ss->ss10.aux_base_addr = buf->bo->offset64 + buf-
> >aux.offset;
> -		ss->ss11.aux_base_addr_hi = (buf->bo->offset64 + buf-
> >aux.offset) >> 32;
> +		ss->ss10.aux_base_addr = buf->bo->offset64 + buf-
> >ccs[0].offset;
> +		ss->ss11.aux_base_addr_hi = (buf->bo->offset64 + buf-
> >ccs[0].offset) >> 32;
>  
>  		ret = drm_intel_bo_emit_reloc(batch->bo,
>  					      intel_batchbuffer_subdata
> _offset(batch, &ss->ss10),
> -					      buf->bo, buf->aux.offset,
> +					      buf->bo, buf-
> >ccs[0].offset,
>  					      read_domain,
> write_domain);
>  		assert(ret == 0);
>  	}
> diff --git a/tests/i915/gem_render_copy.c
> b/tests/i915/gem_render_copy.c
> index 137c7c18..df0d045e 100644
> --- a/tests/i915/gem_render_copy.c
> +++ b/tests/i915/gem_render_copy.c
> @@ -279,7 +279,7 @@ static void *linear_copy_aux(data_t *data, struct
> igt_buf *buf)
>  	map = gem_mmap__gtt(data->drm_fd, buf->bo->handle,
>  			    buf->bo->size, PROT_READ);
>  
> -	igt_memcpy_from_wc(linear, map + buf->aux.offset, aux_size);
> +	igt_memcpy_from_wc(linear, map + buf->ccs[0].offset, aux_size);
>  
>  	munmap(map, buf->bo->size);
>  
> @@ -300,7 +300,7 @@ static void scratch_buf_aux_write_to_png(data_t
> *data,
>  						      CAIRO_FORMAT_A8,
>  						      scratch_buf_aux_w
> idth(data->devid, buf),
>  						      scratch_buf_aux_h
> eight(data->devid, buf),
> -						      buf->aux.stride);
> +						      buf-
> >ccs[0].stride);
>  	ret = cairo_surface_write_to_png(surface,
> make_filename(filename));
>  	igt_assert(ret == CAIRO_STATUS_SUCCESS);
>  	cairo_surface_destroy(surface);
> @@ -473,10 +473,10 @@ static void scratch_buf_init(data_t *data,
> struct igt_buf *buf,
>  		aux_height = scratch_buf_aux_height(data->devid, buf);
>  
>  		buf->compression = compression;
> -		buf->aux.offset = buf->stride * ALIGN(height, 32);
> -		buf->aux.stride = aux_width;
> +		buf->ccs[0].offset = buf->stride * ALIGN(height, 32);
> +		buf->ccs[0].stride = aux_width;
>  
> -		size = buf->aux.offset + aux_width * aux_height;
> +		size = buf->ccs[0].offset + aux_width * aux_height;
>  
>  		buf->bo = drm_intel_bo_alloc(data->bufmgr, "", size,
> 4096);
>  
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
