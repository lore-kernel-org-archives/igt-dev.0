Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA3DCD3436
	for <igt-dev@archiver.kernel.org>; Tue,  5 May 2026 10:05:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C07BA10EA46;
	Tue,  5 May 2026 10:05:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dQq+tQK+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E78F10EA3D
 for <igt-dev@lists.freedesktop.org>; Tue,  5 May 2026 10:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777975529; x=1809511529;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Z8B9Pe973HPV+pHI9bsIBbzUAg55K6LgeqUhsXvIqGw=;
 b=dQq+tQK+nRxQT37BCC/tfp6hgBwOhKk/6DYaOBKaiKF7fp0zmSt7JMjd
 JtfMk2ulCkXzrLIO0HQ1SVWGFUx0BIjCI2DtCuFjQggWsQ8QVX/YYvIK3
 diZcgeM0Dnas+JSYO8w4OgowirP6cXRECTPgUD0zaU0vXrMDV5AUbvDno
 QXTnhV3+e15d7hIlRZNk1kKhM1DL2Q6xRR67XYZFlhq2mo1Z+DktWG6zv
 dwNG8I1pbr5PM7dWFrQzsSCiG4aq5GmYCaJzVm6y6aBtQ+DlEJjhRtOEv
 IWCRygWnMxw0Zp2+jaVbJHyBMnCxlcNlTqHAQkjQEKdrhS89rPhoMmu2b g==;
X-CSE-ConnectionGUID: 0WqqxmfwSousRIGNcI4Sug==
X-CSE-MsgGUID: dEIDgj0LR0SmkAvYTEesSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="90214810"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="90214810"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 03:05:29 -0700
X-CSE-ConnectionGUID: vS1qcN61SIu3SaEnroiBnw==
X-CSE-MsgGUID: m0lIo6ZtQsCpU8alaoFdxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="259123571"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.4])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 03:05:28 -0700
Date: Tue, 5 May 2026 12:05:26 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Subject: Re: [PATCH i-g-t 1/2] lib/gpgpu_fill: Add support for xe3p gpgpu fill
Message-ID: <qilf4swypr6vtk5t6rlpeqfon3cybkebbroigac36hheuqv5rs@xcddvk4v27zp>
References: <20260422191922.274036-4-zbigniew.kempczynski@intel.com>
 <20260422191922.274036-5-zbigniew.kempczynski@intel.com>
 <030d1aef-01f7-4169-9613-9bfbddfc4f05@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <030d1aef-01f7-4169-9613-9bfbddfc4f05@intel.com>
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

On Tue, May 05, 2026 at 10:33:08AM +0200, Hajda, Andrzej wrote:
> W dniu 22.04.2026 o 21:19, Zbigniew KempczyÅski pisze:
> > XE3P uses in non-legacy mode COMPUTE_WALKER_2 so adopt pipeline and
> > shader in gpgpu library to properly handle gpgpu fill.
> > 
> > Difference between previous platforms shaders is no surface state
> > is used so all geometry must be handled by the pipeline / shader
> > (accesses to memory are via untyped global [ugm]). Threads spawned
> > here are still SIMD16, but due to conditional writing to ugm memory
> > with 4B vector using 4x1 sizes and positions become possible.
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> > ---
> >   lib/gpgpu_fill.c                     | 117 +++++++++++++++++++++++++++
> >   lib/gpgpu_fill.c.gen.iga64_codes.c   |  47 ++++++++++-
> >   lib/gpgpu_fill.h                     |   8 ++
> >   lib/gpgpu_shader.c                   |   6 +-
> >   lib/gpgpu_shader.c.gen.iga64_codes.c |   6 +-
> >   lib/gpu_cmds.c                       |  93 +++++++++++++++++----
> >   lib/gpu_cmds.h                       |  14 ++++
> >   lib/intel_batchbuffer.c              |   4 +-
> >   8 files changed, 274 insertions(+), 21 deletions(-)
> > 
> > diff --git a/lib/gpgpu_fill.c b/lib/gpgpu_fill.c
> > index f83eee5f21..4d5689be59 100644
> > --- a/lib/gpgpu_fill.c
> > +++ b/lib/gpgpu_fill.c
> > @@ -28,11 +28,13 @@
> >   #include <i915_drm.h>
> >   #include "intel_reg.h"
> > +#include <ioctl_wrappers.h>
> 
> I think better would be to no mix system and user-defined includes, ie lift
> this up 2 lines.

Ack.

> 
> >   #include "drmtest.h"
> >   #include "gpgpu_fill.h"
> >   #include "gpgpu_shader.h"
> >   #include "gpu_cmds.h"
> > +#include "xe/xe_util.h"
> >   /* lib/i915/shaders/gpgpu/gpgpu_fill.gxa */
> >   static const uint32_t gen7_gpgpu_kernel[][4] = {
> > @@ -328,6 +330,81 @@ mov (1|M0)		 r4.14<1>:w	0xF:w					\n\
> >   send.tgm (16|M0)	null	r4	null	0x0	0x64000007		\n\
> >   #endif										\n\
> >   	");
> > +	gpgpu_shader__eot(kernel);
> > +	return kernel;
> > +}
> > +
> > +static struct gpgpu_shader *__xe3p_gpgpu_kernel(int xe, struct intel_buf *buf)
> > +{
> > +	struct gpgpu_shader *kernel = gpgpu_shader_create(xe);
> > +	uint64_t offset = xe_canonical_va(xe, buf->addr.offset);
> > +
> > +	emit_iga64_code(kernel, xe3p_gpgpu_fill, "				\n\
> > +#define IGA64_FLAGS \"\"							\n\
> 
> For new shaders please use raw strings, see for example [1]. In such case
> you can also avoid backslashes in IGA64_FLAGS.
> 
> [1]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tests/intel/xe_eudebug_online.c?ref_type=heads#L262

Ok, I'll change and resubmit.

> 
> > +#define RX		r0.1							\n\
> > +#define RY		r0.6							\n\
> > +#define COLOR		r1.0							\n\
> > +#define SURFWIDTH	r1.1							\n\
> > +#define SURFHEIGHT	r1.2							\n\
> > +#define WIDTH		r1.3							\n\
> > +#define HEIGHT		r1.4							\n\
> > +#define XPOS		r1.5							\n\
> > +#define YPOS		r1.6							\n\
> > +#define OFFSET		r2.0							\n\
> > +#define XOFFSET		r2.1							\n\
> > +#define YOFFSET		r2.2							\n\
> > +#define XEND		r2.3							\n\
> > +#define XCURRENT	r2.4							\n\
> > +#define TMP		r2.7							\n\
> > +#define ADDR_LO		r3.0							\n\
> > +#define ADDR_HI		r3.1							\n\
> > +#if GEN_VER >= 3500								\n\
> > +(W)	add (1)		XEND<1>:ud	XPOS:ud		WIDTH:ud		\n\
> > +(W)	mov (1)		OFFSET<1>:ud	0x0:ud					\n\
> > +										\n\
> > +(W)	shl (1)		XOFFSET<1>:ud	RX:ud		0x4:ud			\n\
> > +(W)	add (1)		XOFFSET<1>:ud	XOFFSET:ud	XPOS:ud			\n\
> > +(W)	mov (1)		XCURRENT<1>:ud	XOFFSET:ud				\n\
> > +										\n\
> > +(W)	add (1)		TMP<1>:ud	RY:ud		YPOS:ud			\n\
> > +(W)	mul (1)		YOFFSET<1>:ud	TMP:ud		SURFWIDTH:ud		\n\
> > +(W)	add (1)		OFFSET<1>:ud	XOFFSET:ud	YOFFSET:ud		\n\
> > +										\n\
> > +// Set base address with scalar register					\n\
> > +(W)	add (1)		ADDR_LO<1>:ud	OFFSET:ud	ARG(0):ud		\n\
> > +(W)	mov (1)		ADDR_HI<1>:ud	ARG(1):ud				\n\
> > +(W)	mov (1)		s0.0<1>:ud	ADDR_LO:ud				\n\
> > +(W)	mov (1)		s0.1<1>:ud	ADDR_HI:ud				\n\
> > +										\n\
> > +// color									\n\
> > +(W)	mov (4)		r20.0<1>:ub		COLOR:ub			\n\
> > +										\n\
> > +// A64 offset									\n\
> > +(W)	mov (8)		r30.0<1>:uq		0x0:uq				\n\
> > +										\n\
> > +//dword: 0									\n\
> > +(W)	cmp (1)		(lt)f0.0 null:ud        XCURRENT:ud	XEND:ud		\n\
> > +(W&f0.0)sendg.ugm (1)	null	r30:1	r20:1	s0.0	0x29404			\n\
> > +//dword: 1									\n\
> > +(W)	add (1)		XCURRENT<1>:ud		XCURRENT:ud	4:ud		\n\
> > +(W)	add (1)		ADDR_LO<1>:ud		ADDR_LO:ud	0x4:ud		\n\
> > +(W)	mov (1)		s0.0<1>:ud		ADDR_LO:ud			\n\
> > +(W)	cmp (1)		(lt)f0.0 null:ud        XCURRENT:ud	XEND:ud		\n\
> > +(W&f0.0)sendg.ugm (1)	null	r30:1	r20:1	s0.0	0x29404			\n\
> > +//dword: 2									\n\
> > +(W)	add (1)		XCURRENT<1>:ud		XCURRENT:ud	4:ud		\n\
> > +(W)	add (1)		ADDR_LO<1>:ud		ADDR_LO:ud	0x4:ud		\n\
> > +(W)	mov (1)		s0.0<1>:ud		ADDR_LO:ud			\n\
> > +(W)	cmp (1)		(lt)f0.0 null:ud        XCURRENT:ud	XEND:ud		\n\
> > +(W&f0.0)sendg.ugm (1)	null	r30:1	r20:1	s0.0	0x29404			\n\
> > +//dword: 3									\n\
> > +(W)	add (1)		XCURRENT<1>:ud		XCURRENT:ud	4:ud		\n\
> > +(W)	add (1)		ADDR_LO<1>:ud		ADDR_LO:ud	0x4:ud		\n\
> > +(W)	mov (1)		s0.0<1>:ud		ADDR_LO:ud			\n\
> > +(W)	cmp (1)		(lt)f0.0 null:ud        XCURRENT:ud	XEND:ud		\n\
> > +(W&f0.0)sendg.ugm (1)	null	r30:1	r20:1	s0.0	0x29404			\n\
> > +#endif										\n\
> > +", lower_32_bits(offset), upper_32_bits(offset));
> 
> Not sure if wouldn't be better to pass offset via inline data, IMO explicit
> parameters should be for things which can vary between users, but no strong
> feelings. Just this way it is passed in gpgpu_shader.

I'm almost sure I tried to pass address via inline data and I
encountered some problem (maybe pebkac). So I've chosen patching
within shader infra.

I'll alter the shader if you want, however it also verifies patching
works correctly in the shader lib.

> 
> >   	gpgpu_shader__eot(kernel);
> >   	return kernel;
> > @@ -373,6 +450,46 @@ void xehp_gpgpu_fillfunc(int i915,
> >   	intel_bb_destroy(ibb);
> >   }
> > +void xe3p_gpgpu_fillfunc(int i915,
> 
> Hmm, xe3p and i915 :) Please use fd instead.

Right, I'll fix and resubmit.

> 
> > +			 struct intel_buf *buf,
> > +			 unsigned int x, unsigned int y,
> > +			 unsigned int width, unsigned int height,
> > +			 uint8_t color)
> > +{
> > +	struct intel_bb *ibb;
> > +	struct gpgpu_shader *kernel;
> > +	struct xe3p_interface_descriptor_data idd;
> > +
> > +	ibb = intel_bb_create(i915, PAGE_SIZE);
> > +	intel_bb_add_intel_buf(ibb, buf, true);
> > +
> > +	intel_bb_ptr_set(ibb, BATCH_STATE_SPLIT);
> > +
> > +	kernel = __xe3p_gpgpu_kernel(i915, buf);
> > +	xe3p_fill_interface_descriptor(ibb, buf, kernel->instr,
> > +				       kernel->size * 4, &idd);
> > +	gpgpu_shader_destroy(kernel);
> > +
> > +	intel_bb_ptr_set(ibb, 0);
> > +
> > +	/* GPGPU pipeline */
> > +	intel_bb_out(ibb, GEN7_PIPELINE_SELECT | GEN9_PIPELINE_SELECTION_MASK |
> > +		  PIPELINE_SELECT_GPGPU);
> > +	xe3p_emit_state_base_address(ibb);
> > +	xehp_emit_state_compute_mode(ibb, false);
> > +	xe3p_emit_fill_compute_walk2(ibb, buf->width * buf->bpp / 8, buf->height,
> > +				     x, y, width, height, &idd, color);
> > +
> > +	intel_bb_out(ibb, MI_BATCH_BUFFER_END);
> > +	intel_bb_ptr_align(ibb, 32);
> > +
> > +	intel_bb_exec(ibb, intel_bb_offset(ibb),
> > +		      I915_EXEC_RENDER | I915_EXEC_NO_RELOC, true);
> > +
> > +	intel_bb_destroy(ibb);
> > +}
> > +
> > +
> >   void gen9_gpgpu_fillfunc(int i915,
> >   			 struct intel_buf *buf,
> >   			 unsigned x, unsigned y,
> > diff --git a/lib/gpgpu_fill.c.gen.iga64_codes.c b/lib/gpgpu_fill.c.gen.iga64_codes.c
> > index 400ff7b18a..ac2ec0caea 100644
> > --- a/lib/gpgpu_fill.c.gen.iga64_codes.c
> > +++ b/lib/gpgpu_fill.c.gen.iga64_codes.c
> > @@ -3,7 +3,52 @@
> >   #include "gpgpu_shader.h"
> > -#define MD5_SUM_IGA64_ASMS ebaa9e23021939d874c576c7cea482bf
> > +#define MD5_SUM_IGA64_ASMS c0fcff5c21cc4826b2f8f2e6624d4c5c
> > +
> > +struct iga64_template const iga64_code_xe3p_gpgpu_fill[] = {
> > +	{ .gen_ver = 3500, .size = 148, .code = (const uint32_t []) {
> > +		0x80000040, 0x02350220, 0x02000154, 0x00100134,
> > +		0x80000061, 0x02054220, 0x00000000, 0x00000000,
> > +		0x80000069, 0x02158220, 0x02000014, 0x00000004,
> > +		0x80001940, 0x02150220, 0x02000214, 0x00100154,
> > +		0x80001961, 0x02450220, 0x00000214, 0x00000000,
> > +		0x80000040, 0x02750220, 0x02000064, 0x00100164,
> > +		0x80001941, 0x02250220, 0x02000274, 0x00100114,
> > +		0x80001940, 0x02050220, 0x02000214, 0x00100224,
> > +		0x80001940, 0x03058220, 0x02000204, 0xc0ded000,
> > +		0x80000061, 0x03154220, 0x00000000, 0xc0ded001,
> > +		0x80001a61, 0x60010220, 0x00000304, 0x00000000,
> > +		0x80001a61, 0x60110220, 0x00000314, 0x00000000,
> > +		0x80080061, 0x14050000, 0x00000104, 0x00000000,
> > +		0x800c0061, 0x1e054330, 0x00000000, 0x00000000,
> > +		0x80001f70, 0x00010220, 0x52000244, 0x00100234,
> > +		0x84032033, 0x00000004, 0xf0021e0c, 0x9404140c,
> > +		0x80000040, 0x02458220, 0x02000244, 0x00000004,
> > +		0x80000040, 0x03058220, 0x02000304, 0x00000004,
> > +		0x8000a001, 0x00010000, 0x00000000, 0x00000000,
> > +		0x80001961, 0x60010220, 0x00000304, 0x00000000,
> > +		0x80001b70, 0x00010220, 0x52000244, 0x00100234,
> > +		0x84032133, 0x00000004, 0xf0021e0c, 0x9404140c,
> > +		0x80000040, 0x02458220, 0x02000244, 0x00000004,
> > +		0x80000040, 0x03058220, 0x02000304, 0x00000004,
> > +		0x8000a101, 0x00010000, 0x00000000, 0x00000000,
> > +		0x80001961, 0x60010220, 0x00000304, 0x00000000,
> > +		0x80001b70, 0x00010220, 0x52000244, 0x00100234,
> > +		0x84032233, 0x00000004, 0xf0021e0c, 0x9404140c,
> > +		0x80000040, 0x02458220, 0x02000244, 0x00000004,
> > +		0x80000040, 0x03058220, 0x02000304, 0x00000004,
> > +		0x8000a201, 0x00010000, 0x00000000, 0x00000000,
> > +		0x80001961, 0x60010220, 0x00000304, 0x00000000,
> > +		0x80001b70, 0x00010220, 0x52000244, 0x00100234,
> > +		0x84032333, 0x00000004, 0xf0021e0c, 0x9404140c,
> > +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> > +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> > +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> > +	}},
> > +	{ .gen_ver = 0, .size = 0, .code = (const uint32_t []) {
> > +
> > +	}}
> > +};
> >   struct iga64_template const iga64_code_gpgpu_fill[] = {
> >   	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
> > diff --git a/lib/gpgpu_fill.h b/lib/gpgpu_fill.h
> > index a483859e5e..417c920672 100644
> > --- a/lib/gpgpu_fill.h
> > +++ b/lib/gpgpu_fill.h
> > @@ -68,4 +68,12 @@ xehp_gpgpu_fillfunc(int i915,
> >   		    unsigned int width, unsigned int height,
> >   		    uint8_t color);
> > +void
> > +xe3p_gpgpu_fillfunc(int i915,
> > +		    struct intel_buf *dst,
> > +		    unsigned int x, unsigned int y,
> > +		    unsigned int width, unsigned int height,
> > +		    uint8_t color);
> > +
> > +
> >   #endif /* GPGPU_FILL_H */
> > diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
> > index ffa357eeb1..ccab4d4b0f 100644
> > --- a/lib/gpgpu_shader.c
> > +++ b/lib/gpgpu_shader.c
> > @@ -599,8 +599,12 @@ void gpgpu_shader__eot(struct gpgpu_shader *shdr)
> >   (W)	mov (8|M0)               r112.0<1>:ud  r0.0<8;8,1>:ud			\n\
> >   #if GEN_VER < 1250								\n\
> >   (W)	send.ts (16|M0)          null r112 null 0x10000000 0x02000010 {EOT,@1}	\n\
> > -#else										\n\
> > +										\n\
> > +#elif GEN_VER <= 3000								\n\
> >   (W)	send.gtwy (8|M0)         null r112 src1_null     0 0x02000000 {EOT}	\n\
> > +										\n\
> > +#else										\n\
> > +(W)	sendg.gtwy (1|M0)        null     r0:1  null:0  0x0 {EOT}		\n\
> >   #endif										\n\
> >   		");
> >   }
> > diff --git a/lib/gpgpu_shader.c.gen.iga64_codes.c b/lib/gpgpu_shader.c.gen.iga64_codes.c
> > index 59172cdfd1..064564cfb2 100644
> > --- a/lib/gpgpu_shader.c.gen.iga64_codes.c
> > +++ b/lib/gpgpu_shader.c.gen.iga64_codes.c
> > @@ -3,7 +3,7 @@
> >   #include "gpgpu_shader.h"
> > -#define MD5_SUM_IGA64_ASMS 4311fff3bece03802f3220b7d239c33b
> > +#define MD5_SUM_IGA64_ASMS bd1d8e873d1021863cf0b0cde7c332ea
> >   struct iga64_template const iga64_code_read_a64_d32[] = {
> >   	{ .gen_ver = 2000, .size = 40, .code = (const uint32_t []) {
> > @@ -843,6 +843,10 @@ struct iga64_template const iga64_code_jump[] = {
> >   };
> >   struct iga64_template const iga64_code_eot[] = {
> > +	{ .gen_ver = 3500, .size = 8, .code = (const uint32_t []) {
> > +		0x800c0061, 0x70050220, 0x00460005, 0x00000000,
> > +		0x8000c033, 0x00000001, 0x3000000c, 0x00000000,
> > +	}},
> >   	{ .gen_ver = 2000, .size = 8, .code = (const uint32_t []) {
> >   		0x800c0061, 0x70050220, 0x00460005, 0x00000000,
> >   		0x800f2031, 0x00000004, 0x3000700c, 0x00000000,
> > diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
> > index 10c8bfb8dd..c61f5fe5fc 100644
> > --- a/lib/gpu_cmds.c
> > +++ b/lib/gpu_cmds.c
> > @@ -1267,13 +1267,14 @@ xehp_emit_compute_walk(struct intel_bb *ibb,
> >   	}
> >   }
> > -void
> > -xe3p_emit_compute_walk2(struct intel_bb *ibb,
> > -			unsigned int x, unsigned int y,
> > -			unsigned int width, unsigned int height,
> > -			struct xe3p_interface_descriptor_data *pidd,
> > -			uint32_t max_threads,
> > -			struct xe3p_cw2_interrupt_data *intdata)
> > +static void
> > +__xe3p_emit_compute_walk2(struct intel_bb *ibb,
> > +			  unsigned int x, unsigned int y,
> > +			  unsigned int width, unsigned int height,
> > +			  struct xe3p_interface_descriptor_data *pidd,
> > +			  uint32_t max_threads,
> > +			  struct xe3p_cw2_interrupt_data *intdata,
> > +			  struct xe3p_cw2_gpgpu_fill_data *filldata)
> 
> Hmm, 9th parameter. This is asking for refactoring, maybe it can be done
> later.

Original code I got has additional function which varies with
these calculations but I don't want to duplicate the code.

> 
> >   {
> >   	/*
> >   	 * Max Threads represent range: [1, 2^16-1],
> > @@ -1282,6 +1283,14 @@ xe3p_emit_compute_walk2(struct intel_bb *ibb,
> >   	const uint32_t MAX_THREADS = (1 << 16) - 1;
> >   	uint32_t x_dim, y_dim, mask, max;
> > +	if (filldata) {
> > +		if (width + x > filldata->buf_width)
> > +			width = filldata->buf_width - x;
> > +
> > +		if (height + y > filldata->buf_height)
> > +			height = filldata->buf_height - y;
> > +	}
> > +
> 
> This is quite ugly, why do we need these ifs, here and below.
> Just asking if we can avoid conditionals somehow.
> And what is width/height and what is their relation with
> filldata->buf_(width|height_) ?

To not exceed buffer boundary. Original code were limited to fill
in 16x16 granularity but here I wanted to break this limitation
and work at least in 4x4 (shader and workload dimension allows
to work it with 4x1).

> 
> 
> >   	/*
> >   	 * Simply do SIMD16 based dispatch, so every thread uses
> >   	 * SIMD16 channels.
> > @@ -1294,7 +1303,7 @@ xe3p_emit_compute_walk2(struct intel_bb *ibb,
> >   	 * thread group Y = height;
> >   	 */
> >   	x_dim = (x + width + 15) / 16;
> > -	y_dim = y + height;
> > +	y_dim = height + y * (filldata ? 0 : 1);
> 
> Again strange conditional.

Position x and y where to fill are calculated within shader. So y_dim
is raw height.

> 
> >   	mask = (x + width) & 15;
> >   	if (mask == 0)
> > @@ -1332,9 +1341,15 @@ xe3p_emit_compute_walk2(struct intel_bb *ibb,
> >   	intel_bb_out(ibb, 1);						//dw8
> >   	/* Thread Group ID Starting X, Y, Z */
> > -	intel_bb_out(ibb, x / 16);					//dw9
> > -	intel_bb_out(ibb, y);						//dw10
> > -	intel_bb_out(ibb, 0);						//dw11
> > +	if (filldata) {
> > +		intel_bb_out(ibb, 0);					//dw9
> > +		intel_bb_out(ibb, 0);					//dw10
> > +		intel_bb_out(ibb, 0);					//dw11
> > +	} else {
> > +		intel_bb_out(ibb, x / 16);				//dw9
> > +		intel_bb_out(ibb, y);					//dw10
> > +		intel_bb_out(ibb, 0);					//dw11
> > +	}
> 
> This is another problem with x, y - it seems they are unused (almost) in
> case filldata is present.

I'm not sure we're on same page. For filldata x/y == 0 because shader
does the job. When filldata == NULL workload is automatically positioned
to some start x/y position (original compute walk code was designed this
way and I left this intact). Currently there's no use case - xe_non_msix.c
also uses x/y == 0.

> 
> >   	/* partition type / id / size */
> >   	intel_bb_out(ibb, 0);						//dw12-13
> > @@ -1366,12 +1381,26 @@ xe3p_emit_compute_walk2(struct intel_bb *ibb,
> >   		}
> >   	}
> > -	/* Inline data */
> > -	/* DW31 and DW32 of Inline data will be copied into R0.14 and R0.15. */
> > -	/* The rest of DW33 through DW46 will be copied to the following GRFs. */
> > -	intel_bb_out(ibb, x_dim);					//dw31
> > -	for (int i = 0; i < 15; i++) {					//dw32-46
> > -		intel_bb_out(ibb, 0);
> > +	if (filldata) {
> > +		/* Inline data */
> > +		intel_bb_out(ibb, (uint32_t) filldata->color);		//dw31
> > +		intel_bb_out(ibb, (uint32_t) filldata->buf_width);	//dw32
> > +		intel_bb_out(ibb, (uint32_t) filldata->buf_height);	//dw33
> > +		intel_bb_out(ibb, (uint32_t) width);			//dw34
> > +		intel_bb_out(ibb, (uint32_t) height);			//dw35
> > +		intel_bb_out(ibb, (uint32_t) x);			//dw36
> > +		intel_bb_out(ibb, (uint32_t) y);			//dw37
> 
> No need to perform explicit conversion.

Ack.

> 
> > +		for (int i = 0; i < 9; i++) {				//dw38-46
> > +			intel_bb_out(ibb, 0x0);
> > +		}
> 
> No need for parenthesis.

Ack.

> 
> > +	} else {
> > +		/* Inline data */
> > +		/* DW31 and DW32 of Inline data will be copied into R0.14 and R0.15. */
> > +		/* The rest of DW33 through DW46 will be copied to the following GRFs. */
> > +		intel_bb_out(ibb, x_dim);				//dw31
> > +		for (int i = 0; i < 15; i++) {				//dw32-46
> > +			intel_bb_out(ibb, 0);
> > +		}
> 
> No need for parenthesis.

Ack.

> 
> 
> >   	}
> >   	/* Post Sync command payload 1 */
> > @@ -1392,3 +1421,33 @@ xe3p_emit_compute_walk2(struct intel_bb *ibb,
> >   	/* Preempt CS Interrupt Vector: Saved by HW on a TG preemption */
> >   	intel_bb_out(ibb, 0);						//dw62
> >   }
> > +
> > +void
> > +xe3p_emit_compute_walk2(struct intel_bb *ibb,
> > +			unsigned int x, unsigned int y,
> > +			unsigned int width, unsigned int height,
> > +			struct xe3p_interface_descriptor_data *pidd,
> > +			uint32_t max_threads,
> > +			struct xe3p_cw2_interrupt_data *intdata)
> > +{
> > +	__xe3p_emit_compute_walk2(ibb, x, y, width, height,
> > +				  pidd, max_threads, intdata, NULL);
> > +}
> > +
> > +void
> > +xe3p_emit_fill_compute_walk2(struct intel_bb *ibb,
> > +			     unsigned int buf_width, unsigned int buf_height,
> > +			     unsigned int x, unsigned int y,
> > +			     unsigned int width, unsigned int height,
> > +			     struct xe3p_interface_descriptor_data *pidd,
> > +			     uint8_t color)
> > +{
> > +	struct xe3p_cw2_gpgpu_fill_data filldata = {
> > +		.buf_width = buf_width,
> > +		.buf_height = buf_height,
> > +		.color = color,
> > +	};
> > +
> > +	__xe3p_emit_compute_walk2(ibb, x, y, width, height,
> > +				  pidd, 64, NULL, &filldata);
> > +}
> 
> 
> As I commented before - abstraction looks problematic (parameter inflation,
> null checks in shared code, parameter duplication).

What null checks and parameter duplication you mean?

Thanks for the review
--
Zbigniew

> 
> Regards
> Andrzej
> 
> > diff --git a/lib/gpu_cmds.h b/lib/gpu_cmds.h
> > index b3bfb137b0..a8a92d0f29 100644
> > --- a/lib/gpu_cmds.h
> > +++ b/lib/gpu_cmds.h
> > @@ -45,6 +45,12 @@ struct xe3p_cw2_interrupt_data {
> >   	uint64_t post_sync_val;
> >   };
> > +struct xe3p_cw2_gpgpu_fill_data {
> > +	uint32_t buf_width;
> > +	uint32_t buf_height;
> > +	uint8_t color;
> > +};
> > +
> >   uint32_t
> >   gen7_fill_curbe_buffer_data(struct intel_bb *ibb, uint8_t color);
> > @@ -168,4 +174,12 @@ xe3p_emit_compute_walk2(struct intel_bb *ibb,
> >   			uint32_t max_threads,
> >   			struct xe3p_cw2_interrupt_data *intdata);
> > +void
> > +xe3p_emit_fill_compute_walk2(struct intel_bb *ibb,
> > +			     unsigned int buf_width, unsigned int buf_height,
> > +			     unsigned int x, unsigned int y,
> > +			     unsigned int width, unsigned int height,
> > +			     struct xe3p_interface_descriptor_data *pidd,
> > +			     uint8_t color);
> > +
> >   #endif /* GPU_CMDS_H */
> > diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> > index b095065746..189a411968 100644
> > --- a/lib/intel_batchbuffer.c
> > +++ b/lib/intel_batchbuffer.c
> > @@ -769,7 +769,9 @@ igt_fillfunc_t igt_get_gpgpu_fillfunc(int devid)
> >   {
> >   	igt_fillfunc_t fill = NULL;
> > -	if (intel_graphics_ver(devid) >= IP_VER(12, 50))
> > +	if (intel_graphics_ver(devid) >= IP_VER(35, 0))
> > +		fill = xe3p_gpgpu_fillfunc;
> > +	else if (intel_graphics_ver(devid) >= IP_VER(12, 50))
> >   		fill = xehp_gpgpu_fillfunc;
> >   	else if (IS_GEN12(devid))
> >   		fill = gen12_gpgpu_fillfunc;
> 
