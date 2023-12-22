Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1111E10E6E0
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Dec 2023 05:37:38 +0000 (UTC)
Date: Fri, 22 Dec 2023 06:37:31 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH i-g-t 01/12] lib/rendercopy: Add deltas to all surface
 relocs
Message-ID: <20231222053731.ph6cjqgis2yh6upr@zkempczy-mobl2>
References: <20231220175934.22849-1-ville.syrjala@linux.intel.com>
 <20231220175934.22849-2-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231220175934.22849-2-ville.syrjala@linux.intel.com>
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

On Wed, Dec 20, 2023 at 07:59:23PM +0200, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> In order to copy stuff not at offset 0 in the BO we need
> to include the delta in the relocs/etc.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  lib/rendercopy_gen4.c |  9 +++++----
>  lib/rendercopy_gen6.c |  9 +++++----
>  lib/rendercopy_gen7.c |  9 +++++----
>  lib/rendercopy_gen8.c |  9 +++++----
>  lib/rendercopy_gen9.c | 13 +++++++------
>  lib/rendercopy_i830.c | 10 +++++++---
>  lib/rendercopy_i915.c |  6 ++++--
>  7 files changed, 38 insertions(+), 27 deletions(-)
> 
> diff --git a/lib/rendercopy_gen4.c b/lib/rendercopy_gen4.c
> index 8536d6b632c5..d10e5b7780c0 100644
> --- a/lib/rendercopy_gen4.c
> +++ b/lib/rendercopy_gen4.c
> @@ -148,10 +148,11 @@ gen4_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst)
>  	ss->ss0.data_return_format = SURFACERETURNFORMAT_FLOAT32;
>  	ss->ss0.color_blend = 1;
>  
> -	address = intel_bb_offset_reloc(ibb, buf->handle,
> -					read_domain, write_domain,
> -					intel_bb_offset(ibb) + 4,
> -					buf->addr.offset);
> +	address = intel_bb_offset_reloc_with_delta(ibb, buf->handle,
> +						   read_domain, write_domain,
> +						   buf->surface[0].offset,
> +						   intel_bb_offset(ibb) + 4,
> +						   buf->addr.offset);
>  	ss->ss1.base_addr = (uint32_t) address;

I've just took a look to intel_bb_add_reloc() because I didn't
remember all details and I see address returned there is offset
at which object will be binded, not offset + delta.
Until this patch only users of this function reside in
rendercopy_gen9.c so for older platforms it doesn't matter
(xe driver doesn't support them).

Anyway, delta addition sets up 10-bit if buf->cc.offset is not zero.
I mean:

address = intel_bb_offset_reloc_with_delta(ibb, buf->handle,
					   read_domain, write_domain,
					   (buf->cc.offset ? (1 << 10) : 0)
					   | buf->ccs[0].offset,
					   intel_bb_offset(ibb) + 4 * 10,
					   buf->addr.offset);
ss->ss10.aux_base_addr = (address + buf->ccs[0].offset) >> 12;
ss->ss11.aux_base_addr_hi = (address + buf->ccs[0].offset) >> 32;

I wonder shouldn't intel_bb_add_reloc() return offset + delta.

I also have some doubts regarding:

	(buf->cc.offset ? (1 << 10) : 0) | buf->ccs[0].offset

This will set up bit-10 (if I'm not wrong clearvalue enable) only
when relocation will happen. Without relocation or on softpinning
this bit is never set.

Above also would require remove delta in __intel_bb_emit_reloc()
but if I'm not wrong this would be enough to start directly using
offset returned in intel_bb_add_reloc() derivatives.

Have I missed something?

--
Zbigniew


>  
>  	ss->ss2.height = intel_buf_height(buf) - 1;
> diff --git a/lib/rendercopy_gen6.c b/lib/rendercopy_gen6.c
> index e941257eb606..ebd4c5cf241c 100644
> --- a/lib/rendercopy_gen6.c
> +++ b/lib/rendercopy_gen6.c
> @@ -91,10 +91,11 @@ gen6_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst)
>  	ss->ss0.data_return_format = SURFACERETURNFORMAT_FLOAT32;
>  	ss->ss0.color_blend = 1;
>  
> -	address = intel_bb_offset_reloc(ibb, buf->handle,
> -					read_domain, write_domain,
> -					intel_bb_offset(ibb) + 4,
> -					buf->addr.offset);
> +	address = intel_bb_offset_reloc_with_delta(ibb, buf->handle,
> +						   read_domain, write_domain,
> +						   buf->surface[0].offset,
> +						   intel_bb_offset(ibb) + 4,
> +						   buf->addr.offset);
>  	ss->ss1.base_addr = (uint32_t) address;
>  
>  	ss->ss2.height = intel_buf_height(buf) - 1;
> diff --git a/lib/rendercopy_gen7.c b/lib/rendercopy_gen7.c
> index 267f6f8038ba..279eb45bdc36 100644
> --- a/lib/rendercopy_gen7.c
> +++ b/lib/rendercopy_gen7.c
> @@ -86,10 +86,11 @@ gen7_bind_buf(struct intel_bb *ibb,
>  		 gen7_tiling_bits(buf->tiling) |
>  		format << GEN7_SURFACE_FORMAT_SHIFT);
>  
> -	address = intel_bb_offset_reloc(ibb, buf->handle,
> -					read_domain, write_domain,
> -					intel_bb_offset(ibb) + 4,
> -					buf->addr.offset);
> +	address = intel_bb_offset_reloc_with_delta(ibb, buf->handle,
> +						   read_domain, write_domain,
> +						   intel_bb_offset(ibb) + 4,
> +						   buf->surface[0].offset,
> +						   buf->addr.offset);
>  	ss[1] = address;
>  	ss[2] = ((intel_buf_width(buf) - 1)  << GEN7_SURFACE_WIDTH_SHIFT |
>  		 (intel_buf_height(buf) - 1) << GEN7_SURFACE_HEIGHT_SHIFT);
> diff --git a/lib/rendercopy_gen8.c b/lib/rendercopy_gen8.c
> index ba7897fb475f..2039e5fc6b8e 100644
> --- a/lib/rendercopy_gen8.c
> +++ b/lib/rendercopy_gen8.c
> @@ -109,10 +109,11 @@ gen8_bind_buf(struct intel_bb *ibb,
>  		ss->ss1.memory_object_control = BDW_MOCS_PTE |
>  			BDW_MOCS_TC_L3_PTE | BDW_MOCS_AGE(0);
>  
> -	address = intel_bb_offset_reloc(ibb, buf->handle,
> -					read_domain, write_domain,
> -					intel_bb_offset(ibb) + 4 * 8,
> -					buf->addr.offset);
> +	address = intel_bb_offset_reloc_with_delta(ibb, buf->handle,
> +						   read_domain, write_domain,
> +						   buf->surface[0].offset,
> +						   intel_bb_offset(ibb) + 4 * 8,
> +						   buf->addr.offset);
>  	ss->ss8.base_addr = address;
>  	ss->ss9.base_addr_hi = address >> 32;
>  
> diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
> index 363bc6c1b203..bfac62b0fc23 100644
> --- a/lib/rendercopy_gen9.c
> +++ b/lib/rendercopy_gen9.c
> @@ -194,12 +194,13 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
>  	else if (buf->tiling == I915_TILING_Ys)
>  		ss->ss5.trmode = 2;
>  
> -	address = intel_bb_offset_reloc(ibb, buf->handle,
> -					read_domain, write_domain,
> -					intel_bb_offset(ibb) + 4 * 8,
> -					buf->addr.offset);
> -	ss->ss8.base_addr = address;
> -	ss->ss9.base_addr_hi = address >> 32;
> +	address = intel_bb_offset_reloc_with_delta(ibb, buf->handle,
> +						   read_domain, write_domain,
> +						   buf->surface[0].offset,
> +						   intel_bb_offset(ibb) + 4 * 8,
> +						   buf->addr.offset);
> +	ss->ss8.base_addr = (address + buf->surface[0].offset);
> +	ss->ss9.base_addr_hi = (address + buf->surface[0].offset) >> 32;
>  
>  	ss->ss2.height = intel_buf_height(buf) - 1;
>  	ss->ss2.width  = intel_buf_width(buf) - 1;
> diff --git a/lib/rendercopy_i830.c b/lib/rendercopy_i830.c
> index 4c4271493b4b..4b0ea3b859e2 100644
> --- a/lib/rendercopy_i830.c
> +++ b/lib/rendercopy_i830.c
> @@ -158,8 +158,10 @@ static void gen2_emit_target(struct intel_bb *ibb,
>  	intel_bb_out(ibb, _3DSTATE_BUF_INFO_CMD);
>  	intel_bb_out(ibb, BUF_3D_ID_COLOR_BACK | tiling |
>  		     BUF_3D_PITCH(dst->surface[0].stride));
> -	intel_bb_emit_reloc(ibb, dst->handle, I915_GEM_DOMAIN_RENDER,
> -			    I915_GEM_DOMAIN_RENDER, 0, dst->addr.offset);
> +	intel_bb_emit_reloc(ibb, dst->handle,
> +			    I915_GEM_DOMAIN_RENDER, I915_GEM_DOMAIN_RENDER,
> +			    dst->surface[0].offset,
> +			    dst->addr.offset);
>  
>  	intel_bb_out(ibb, _3DSTATE_DST_BUF_VARS_CMD);
>  	intel_bb_out(ibb, format |
> @@ -199,7 +201,9 @@ static void gen2_emit_texture(struct intel_bb *ibb,
>  		tiling |= TM0S1_TILE_WALK;
>  
>  	intel_bb_out(ibb, _3DSTATE_LOAD_STATE_IMMEDIATE_2 | LOAD_TEXTURE_MAP(unit) | 4);
> -	intel_bb_emit_reloc(ibb, src->handle, I915_GEM_DOMAIN_SAMPLER, 0, 0,
> +	intel_bb_emit_reloc(ibb, src->handle,
> +			    I915_GEM_DOMAIN_SAMPLER, 0,
> +			    src->surface[0].offset,
>  			    src->addr.offset);
>  	intel_bb_out(ibb, (intel_buf_height(src) - 1) << TM0S1_HEIGHT_SHIFT |
>  		     (intel_buf_width(src) - 1) << TM0S1_WIDTH_SHIFT |
> diff --git a/lib/rendercopy_i915.c b/lib/rendercopy_i915.c
> index 3e421301e6a6..94cdfb99af9a 100644
> --- a/lib/rendercopy_i915.c
> +++ b/lib/rendercopy_i915.c
> @@ -112,7 +112,8 @@ void gen3_render_copyfunc(struct intel_bb *ibb,
>  		intel_bb_out(ibb, (1 << TEX_COUNT) - 1);
>  		intel_bb_emit_reloc(ibb, src->handle,
>  				    I915_GEM_DOMAIN_SAMPLER, 0,
> -				    0, src->addr.offset);
> +				    src->surface[0].offset,
> +				    src->addr.offset);
>  		intel_bb_out(ibb, format_bits | tiling_bits |
>  			     (intel_buf_height(src) - 1) << MS3_HEIGHT_SHIFT |
>  			     (intel_buf_width(src) - 1) << MS3_WIDTH_SHIFT);
> @@ -155,7 +156,8 @@ void gen3_render_copyfunc(struct intel_bb *ibb,
>  			     BUF_3D_PITCH(dst->surface[0].stride));
>  		intel_bb_emit_reloc(ibb, dst->handle,
>  				    I915_GEM_DOMAIN_RENDER, I915_GEM_DOMAIN_RENDER,
> -				    0, dst->addr.offset);
> +				    dst->surface[0].offset,
> +				    dst->addr.offset);
>  
>  		intel_bb_out(ibb, _3DSTATE_DST_BUF_VARS_CMD);
>  		intel_bb_out(ibb, format_bits |
> -- 
> 2.41.0
> 
