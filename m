Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A69110E06A
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jan 2024 12:11:55 +0000 (UTC)
Date: Wed, 10 Jan 2024 13:11:45 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
Subject: Re: [PATCH i-g-t v2 1/3] lib/rendercopy: Add render-copy xe2
 implementation
Message-ID: <20240110121145.uonzt4nalqobsdre@zkempczy-mobl2>
References: <20240109132105.10958-1-zbigniew.kempczynski@intel.com>
 <20240109132105.10958-2-zbigniew.kempczynski@intel.com>
 <16e6cb06a82700ec55510b0d60a21c14682b6786.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <16e6cb06a82700ec55510b0d60a21c14682b6786.camel@intel.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jan 10, 2024 at 09:43:43AM +0100, Grzegorzek, Dominik wrote:
> Hi Zbyszek, 
> On Tue, 2024-01-09 at 14:21 +0100, Zbigniew Kempczyński wrote:
> > > Due to small differences between xe2 and previous 3d pipeline I decided
> > > to adopt this in gen9 render-copy function instead of introducing a new one.
> > > Xe2 uses large GRFs (512-bit) where coordinates occupy only 2 GRF
> > > registers (instead 4 on 256-bit GRFs). This requires shader adoption
> > > on data preparation for sampler/render target write.
> > > 
> > > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > > Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> > > Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> > > ---
> > >  lib/i915/shaders/ps/gen20_render_copy.asm |  8 ++++
> > >  lib/rendercopy.h                          |  4 ++
> > >  lib/rendercopy_gen9.c                     | 57 +++++++++++++++++++++--
> > >  lib/xe2_render.h                          | 14 ++++++
> > >  4 files changed, 79 insertions(+), 4 deletions(-)
> > >  create mode 100644 lib/i915/shaders/ps/gen20_render_copy.asm
> > >  create mode 100644 lib/xe2_render.h
> > > 
> > > diff --git a/lib/i915/shaders/ps/gen20_render_copy.asm b/lib/i915/shaders/ps/gen20_render_copy.asm
> > > new file mode 100644
> > > index 0000000000..330417966d
> > > --- /dev/null
> > > +++ b/lib/i915/shaders/ps/gen20_render_copy.asm
> > > @@ -0,0 +1,8 @@
> > > +L0:
> > > +(W)     mad (16|M0)              acc0.0<1>:f   r6.3<0;0>:f      r1.0<1;1>:f       r6.0<0>:f
> > > +(W)     mad (16|M0)              r113.0<1>:f   acc0.0<1;1>:f    r1.0<1;1>:f       r6.1<0>:f
> > > +(W)     mad (16|M0)              acc0.0<1>:f   r6.7<0;0>:f      r1.0<1;1>:f       r6.4<0>:f
> > > +(W)     mad (16|M0)              r114.0<1>:f   acc0.0<1;1>:f    r2.0<1;1>:f       r6.5<0>:f
> > > +(W)     send.smpl (16|M0)        r12      r113  null:0  0x0            0x04420001           {F@1,$0} // wr:2+0, rd:4; simd16 sample:u+v+r+ai+mlod using sampler index 0
> > > +(W)     send.rc (16|M0)          null     r12   null:0  0x0            0x08031400           {EOT,$0} // wr:4+0, rd:0; full-precision render target write SIMD16; last render target to surface 0
> > > +L96:
> > > diff --git a/lib/rendercopy.h b/lib/rendercopy.h
> > > index 0d81d27f83..3733e8a09f 100644
> > > --- a/lib/rendercopy.h
> > > +++ b/lib/rendercopy.h
> > > @@ -43,6 +43,10 @@ void gen12p71_render_copyfunc(struct intel_bb *ibb,
> > >  			      struct intel_buf *src, uint32_t src_x, uint32_t src_y,
> > >  			      uint32_t width, uint32_t height,
> > >  			      struct intel_buf *dst, uint32_t dst_x, uint32_t dst_y);
> > > +void xe2_render_copyfunc(struct intel_bb *ibb,
> > > +			 struct intel_buf *src, uint32_t src_x, uint32_t src_y,
> > > +			 uint32_t width, uint32_t height,
> > > +			 struct intel_buf *dst, uint32_t dst_x, uint32_t dst_y);
> > >  void gen12_render_copyfunc(struct intel_bb *ibb,
> > >  			   struct intel_buf *src, uint32_t src_x, uint32_t src_y,
> > >  			   uint32_t width, uint32_t height,
> > > diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
> > > index 363bc6c1b2..adf0436f35 100644
> > > --- a/lib/rendercopy_gen9.c
> > > +++ b/lib/rendercopy_gen9.c
> > > @@ -22,6 +22,7 @@
> > >  #include "intel_mocs.h"
> > >  #include "rendercopy.h"
> > >  #include "gen9_render.h"
> > > +#include "xe2_render.h"
> > >  #include "intel_reg.h"
> > >  #include "igt_aux.h"
> > >  #include "intel_chipset.h"
> > > @@ -136,6 +137,15 @@ static const uint32_t gen12p71_render_copy[][4] = {
> > >  	{ 0x80041131, 0x00000004, 0x50007144, 0x00c40000 },
> > >  };
> > >  
> > > +static const uint32_t xe2_render_copy[][4] = {
> > > +	{ 0x8010005b, 0x200002a0, 0x020a0634, 0x06040105 },
> > > +	{ 0x8010005b, 0x710402a8, 0x020a2001, 0x06140105 },
> > > +	{ 0x8010005b, 0x200002a0, 0x020a0674, 0x06440105 },
> > > +	{ 0x8010005b, 0x720402a8, 0x020a2001, 0x06540205 },
> > > +	{ 0x80122031, 0x0c240000, 0x20027114, 0x00800000 },
> > > +	{ 0x8010c031, 0x00000004, 0x58000c24, 0x00c40000 },
> > > +};
> > > +
> > >  /* Mostly copy+paste from gen6, except height, width, pitch moved */
> > >  static uint32_t
> > >  gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
> > > @@ -545,7 +555,10 @@ gen9_emit_state_base_address(struct intel_bb *ibb) {
> > >  	/* WaBindlessSurfaceStateModifyEnable:skl,bxt */
> > >  	/* The length has to be one less if we dont modify
> > >  	   bindless state */
> > > -	intel_bb_out(ibb, GEN4_STATE_BASE_ADDRESS | (19 - 1 - 2));
> > > +	if (AT_LEAST_GEN(intel_get_drm_devid(ibb->fd), 20))
> > > +		intel_bb_out(ibb, GEN4_STATE_BASE_ADDRESS | 20);
> > > +	else
> > > +		intel_bb_out(ibb, GEN4_STATE_BASE_ADDRESS | (19 - 1 - 2));
> > >  
> > >  	/* general */
> > >  	intel_bb_out(ibb, 0 | BASE_ADDRESS_MODIFY);
> > > @@ -586,6 +599,13 @@ gen9_emit_state_base_address(struct intel_bb *ibb) {
> > >  	intel_bb_out(ibb, 0);
> > >  	intel_bb_out(ibb, 0);
> > >  	intel_bb_out(ibb, 0);
> > > +
> > > +	if (AT_LEAST_GEN(intel_get_drm_devid(ibb->fd), 20)) {
> > > +		/* Bindless sampler */
> > > +		intel_bb_out(ibb, 0);
> > > +		intel_bb_out(ibb, 0);
> > > +		intel_bb_out(ibb, 0);
> > > +	}
> > >  }
> > >  
> > >  static void
> > > @@ -753,7 +773,12 @@ gen9_emit_ds(struct intel_bb *ibb) {
> > >  
> > >  static void
> > >  gen8_emit_wm_hz_op(struct intel_bb *ibb) {
> > > -	intel_bb_out(ibb, GEN8_3DSTATE_WM_HZ_OP | (5-2));
> > > +	if (AT_LEAST_GEN(intel_get_drm_devid(ibb->fd), 20)) {
> > > +		intel_bb_out(ibb, GEN8_3DSTATE_WM_HZ_OP | (6-2));
> > > +		intel_bb_out(ibb, 0);
> > > +	} else {
> > > +		intel_bb_out(ibb, GEN8_3DSTATE_WM_HZ_OP | (5-2));
> > > +	}
> > >  	intel_bb_out(ibb, 0);
> > >  	intel_bb_out(ibb, 0);
> > >  	intel_bb_out(ibb, 0);
> > > @@ -852,7 +877,11 @@ gen8_emit_ps(struct intel_bb *ibb, uint32_t kernel, bool fast_clear) {
> > >  	intel_bb_out(ibb, (max_threads - 1) << GEN8_3DSTATE_PS_MAX_THREADS_SHIFT |
> > >  	             GEN6_3DSTATE_WM_16_DISPATCH_ENABLE |
> > >  	             (fast_clear ? GEN8_3DSTATE_FAST_CLEAR_ENABLE : 0));
> > > -	intel_bb_out(ibb, 6 << GEN6_3DSTATE_WM_DISPATCH_START_GRF_0_SHIFT);
> > > +	if (AT_LEAST_GEN(intel_get_drm_devid(ibb->fd), 20))
> > > +		intel_bb_out(ibb, 6 << GEN6_3DSTATE_WM_DISPATCH_START_GRF_0_SHIFT |
> > > +			     GENXE_KERNEL0_POLY_PACK16_FIXED << GENXE_KERNEL0_PACKING_POLICY);
> > > +	else
> > > +		intel_bb_out(ibb, 6 << GEN6_3DSTATE_WM_DISPATCH_START_GRF_0_SHIFT);
> > >  	intel_bb_out(ibb, 0); // kernel 1
> > >  	intel_bb_out(ibb, 0); /* kernel 1 hi */
> > >  	intel_bb_out(ibb, 0); // kernel 2
> > > @@ -862,6 +891,7 @@ gen8_emit_ps(struct intel_bb *ibb, uint32_t kernel, bool fast_clear) {
> > >  	intel_bb_out(ibb, GEN8_PS_BLEND_HAS_WRITEABLE_RT);
> > >  
> > >  	intel_bb_out(ibb, GEN8_3DSTATE_PS_EXTRA | (2 - 2));
> > > +
> extra newline?
> > >  	intel_bb_out(ibb, GEN8_PSX_PIXEL_SHADER_VALID | GEN8_PSX_ATTRIBUTE_ENABLE);
> > >  }
> > >  
> > > @@ -903,6 +933,9 @@ gen9_emit_depth(struct intel_bb *ibb)
> > >  
> > >  static void
> > >  gen7_emit_clear(struct intel_bb *ibb) {
> > > +	if (AT_LEAST_GEN(intel_get_drm_devid(ibb->fd), 20))
> > > +		return;
> > > +
> > >  	intel_bb_out(ibb, GEN7_3DSTATE_CLEAR_PARAMS | (3-2));
> > >  	intel_bb_out(ibb, 0);
> > >  	intel_bb_out(ibb, 1); // clear valid
> > > @@ -911,7 +944,10 @@ gen7_emit_clear(struct intel_bb *ibb) {
> > >  static void
> > >  gen6_emit_drawing_rectangle(struct intel_bb *ibb, const struct intel_buf *dst)
> > >  {
> > > -	intel_bb_out(ibb, GEN4_3DSTATE_DRAWING_RECTANGLE | (4 - 2));
> > > +	if (AT_LEAST_GEN(intel_get_drm_devid(ibb->fd), 20))
> > > +		intel_bb_out(ibb, GENXE2_3DSTATE_DRAWING_RECTANGLE_FAST | (4 - 2));
> > > +	else
> > > +		intel_bb_out(ibb, GEN4_3DSTATE_DRAWING_RECTANGLE | (4 - 2));
> > >  	intel_bb_out(ibb, 0);
> > >  	intel_bb_out(ibb, (intel_buf_height(dst) - 1) << 16 | (intel_buf_width(dst) - 1));
> > >  	intel_bb_out(ibb, 0);
> > > @@ -1220,6 +1256,19 @@ void gen12p71_render_copyfunc(struct intel_bb *ibb,
> > >  			sizeof(gen12p71_render_copy));
> > >  }
> > >  
> > > +void xe2_render_copyfunc(struct intel_bb *ibb,
> > > +			 struct intel_buf *src, uint32_t src_x, uint32_t src_y,
> > > +			 uint32_t width, uint32_t height,
> > > +			 struct intel_buf *dst, uint32_t dst_x, uint32_t dst_y)
> > > +{
> > > +	_gen9_render_op(ibb, src, src_x, src_y,
> > > +			  width, height, dst, dst_x, dst_y,
> > > +			  NULL,
> > > +			  NULL,
> > > +			  xe2_render_copy,
> > > +			  sizeof(xe2_render_copy));
> > > +}
> > > +
> > >  void mtl_render_copyfunc(struct intel_bb *ibb,
> > >  			 struct intel_buf *src,
> > >  			 unsigned int src_x, unsigned int src_y,
> > > diff --git a/lib/xe2_render.h b/lib/xe2_render.h
> > > new file mode 100644
> > > index 0000000000..3db7a84894
> > > --- /dev/null
> > > +++ b/lib/xe2_render.h
> > > @@ -0,0 +1,14 @@
> > > +/* SPDX-License-Identifier: MIT */
> > > +/*
> > > + * Copyright © 2024 Intel Corporation
> > > + */
> > > +#ifndef GENXE2_RENDER_H
> > > +#define GENXE2_RENDER_H
> Fix this guard to match file name as well.
> 
> With that: 
> Reviewed-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>


Thanks for the review, above nits will be addressed in v3.

--
Zbigniew

> > > +
> > > +#define GENXE2_3DSTATE_DRAWING_RECTANGLE_FAST	GEN4_3D(3, 0, 0)
> > > +
> > > +/* 3DSTATE_PS dword6 */
> > > +# define GENXE_KERNEL0_PACKING_POLICY		24
> > > +#  define GENXE_KERNEL0_POLY_PACK16_FIXED	3
> > > +
> > > +#endif
> 
