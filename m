Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4586FD4414B
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 11:39:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05AD710E61D;
	Tue, 19 Nov 2024 11:39:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FS90BAVO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EF3C10E61D
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 11:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732016343; x=1763552343;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=juE8n3FWapp00HRjdFN9iaQf3lwxH0Y0GhbTr9siQ48=;
 b=FS90BAVOp0T8vMVsjBVR4Ez6VtZN3o7bxkLmXnxAM/JwukhIt8jg0kMA
 Opsfl/ERJIIX2hvAyMyCOENVXaUBSym7C+utPa4TEHcGU4a3Qt8XyHaTI
 Ub0HDJRvUi4ARoKWzFQ9RgN3MtgD0ixthQ3hkx/TARFqp81g9Qz3TDVP/
 5JUg+er24SREOgQTHGkbboNN8DFxP3i3ahQK+WBB79iyGP1F8yS/CX5VO
 1aSAQg9aA/tzGqNZHMg6PxkrmNuJtdl8yN+xqXMXVx0CL8ophauK/0SoX
 3YrGntgq/e9cRxT/NrwZlWzh2Fvwmoj3JTGPxf92GN/zJLRU2d12EQEqW g==;
X-CSE-ConnectionGUID: cmGyNkHSQIm84zWa0vAKvw==
X-CSE-MsgGUID: QrmNShwATkufA1f1d97t5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="32253727"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="32253727"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 03:39:03 -0800
X-CSE-ConnectionGUID: eDWOPQ1iQ9WLssDPFjzsGg==
X-CSE-MsgGUID: QF3oirOLQGS3gsj7qbysOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89920201"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.244.74])
 ([10.245.244.74])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 03:39:02 -0800
Message-ID: <9b4d1bd7-9918-48aa-85cf-3ad6c1cb90ac@intel.com>
Date: Tue, 19 Nov 2024 12:38:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/4] lib/gpgpu_shader: Add causing a read pagefault
 from the eu thread
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, mika.kuoppala@intel.com,
 dominik.grzegorzek@intel.com
References: <20241115141132.866838-1-gwan-gyeong.mun@intel.com>
 <20241115141132.866838-3-gwan-gyeong.mun@intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241115141132.866838-3-gwan-gyeong.mun@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi Gwan-gyeong,

On 15.11.2024 15:11, Gwan-gyeong Mun wrote:
> Create a function that causing a read pagefault using the eu thread load
> instruction. If the given ppgtt address points to an unallocated ppgtt
> virtual address,  this shader can cause a read pagefault.
> To directly use a 64-bit address as an argument, use the
> Untyped 2D Block Array Load Instruction.
> 
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> ---
>   lib/gpgpu_shader.c          | 92 +++++++++++++++++++++++++++++++++++++
>   lib/gpgpu_shader.h          |  1 +
>   lib/iga64_generated_codes.c | 21 ++++++++-
>   3 files changed, 113 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
> index 7a2f0d28d..d7c47be80 100644
> --- a/lib/gpgpu_shader.c
> +++ b/lib/gpgpu_shader.c
> @@ -912,3 +912,95 @@ void gpgpu_shader__end_system_routine_step_if_eq(struct gpgpu_shader *shdr,
>   	", 0x807fffff, /* leave breakpoint exception */
>   	y_offset, value, 0x7fffff /* clear all exceptions */ );
>   }
> +
> +/**
> + * gpgpu_shader__read_page_fault:
> + * @shdr: shader to be modified
> + * @ppgtt_addr: ppgtt virtual address to raise pagefault
> + *
> + * For a given arbitrary ppgtt virtual address, it raises a pagefault using
> + * the eu thread load instruction.
> + */
> +void gpgpu_shader__read_page_fault(struct gpgpu_shader *shdr, uint64_t ppgtt_addr)

I admit I haven't read much into the assembly however a question about 
the naming and intention of this function comes to mind - why does this 
function carry the "read_page_fault" suffix? Isn't this supposed to be a 
complementary "read" function to the previously introduced 
"gpgpu_shader__write_offset" function?

It seems as if they both should just allow to read/write a specified 
ppgtt address and if it isn't bound then a page fault will occur. If 
that is the case I would suggest to use some matching naming, like 
"__write_ppgtt_offset/__read_ppgtt_offset" or some variation of what 
Andrzej suggested.

Thanks,
Christoph

> +{
> +	/* pagefault ppgtt virtual address */
> +	uint64_t addr = CANONICAL(ppgtt_addr);
> +
> +	igt_assert_f((addr & 0x3) == 0, "address must be aligned to DWord!\n");
> +
> +	emit_iga64_code(shdr, read_page_fault, "				\n\
> +#if GEN_VER >= 2000								\n\
> +// Unyped 2D Block Array Load 							\n\
> +// Instruction_Load2DBlockArray							\n\
> +// bspec: 63972									\n\
> +// src0 address payload (Untyped2DBLOCKAddressPayload) specifies both		\n\
> +//	the block parameters and the 2D Surface parameters.			\n\
> +// Untyped2DBLOCKAddressPayload							\n\
> +// bspec: 63986									\n\
> +// [243:240] Array Length: 0 (length is 1)					\n\
> +// [239:232] Block Height: 0 (height is 1)					\n\
> +// [231:224] Block Width: 0xf (width is 16)					\n\
> +// [223:192] Block Start Y: 0							\n\
> +// [191:160] Block Start X: 0							\n\
> +// [159:128] Untyped 2D Surface Pitch: 0x3f (pitch is 64 bytes)			\n\
> +// [127:96] Untyped 2D Surface Height: 0 (height is 1)				\n\
> +// [95:64] Untyped 2D Surface Width: 0x3f (width is 64 bytes)			\n\
> +// [63:0] Untyped 2D Surface Base Address					\n\
> +// initialize register								\n\
> +(W)	mov (8)			r30.0<1>:uq	0x0:uq				\n\
> +// [0:31] Untyped 2D Surface Base Address low					\n\
> +(W)	mov (1)			r30.0<1>:ud	ARG(0):ud			\n\
> +// [32:63] Untyped 2D Surface Base Address high					\n\
> +(W)	mov (1)			r30.1<1>:ud ARG(1):ud				\n\
> +// [95:64] Untyped 2D Surface Width: 0x3f					\n\
> +//	   (Width minus 1 (in bytes) of the 2D surface, it represents 64)	\n\
> +(W)	mov (1) 		r30.2<1>:ud	0x3f:ud				\n\
> +// [127:96] Untyped 2D Surface Height: 0x0					\n\
> +//	    (Height minus 1 (in number of data elements) of			\n\
> +//	    the Untyped 2D surface, it represents 1)				\n\
> +(W)	mov (1) 		r30.3<1>:ud	0x0:ud				\n\
> +// [159:128] Untyped 2D Surface Pitch: 0x3f					\n\
> +//	     (Pitch minus 1 (in bytes) of the 2D surface, it represents 64)	\n\
> +(W)	mov (1)			r30.4<1>:ud	0x3f:ud				\n\
> +// [231:224] Block Width: 0xf (15)						\n\
> +//	     (Specifies the width minus 1 (in number of data elements) for this	\n\
> +//	     rectangular region, it represents 16)				\n\
> +// Block width (encoded_value + 1) must be a multiple of DW (4 bytes).		\n\
> +// [239:232] Block Height: 0							\n\
> +//	     (Specifies the height minus 1 (in number of data elements) for	\n\
> +//	     this rectangular region, it represents 1)				\n\
> +// [243:240] Array Length: 0							\n\
> +//	     (Specifies Array Length minus 1 for Load2DBlockArray messages,	\n\
> +//	     must be zero for 2D Block Store messages, it represents 1)		\n\
> +(W)	mov (1)			r30.7<1>:ud	0xf:ud				\n\
> +//										\n\
> +// dest data payload format is selected by Data Size.				\n\
> +// Block Height x Block Width x Data size / GRF Register size			\n\
> +//	=> 1 x 16 x 32bit / 512bit = 1						\n\
> +// data payload format size is 1 GRF Register.					\n\
> +//										\n\
> +// send.ugm Untyped 2D Block Array Load						\n\
> +// Format: send.ugm (1) dst src0 src1 ExtMsg MsgDesc				\n\
> +// Execution Mask restriction: SIMT1						\n\
> +//										\n\
> +// Extended Message Descriptor (Dataport Extended Descriptor Imm 2D Block)	\n\
> +// bspec: 67780									\n\
> +// 0x0 =>									\n\
> +// [32:22] Global Y_offset: 0							\n\
> +// [21:12] Global X_offset: 0							\n\
> +//										\n\
> +// Message Descriptor								\n\
> +// bspec: 63972									\n\
> +// 0x2128403 =>									\n\
> +// [30:29] Address Type: 0 (FLAT)						\n\
> +// [28:25] Src0 Length: 1							\n\
> +// [24:20] Dest Length: 1							\n\
> +// [19:16] Cache : 2 (L1UC_L3UC) 10						\n\
> +// [15] Transpose Block: 1							\n\
> +// [11:9] Data Size: 2 (D32) 10							\n\
> +// [7] VNNI Transform: 0							\n\
> +// [5:0] Load Operation: 3 (Load 2D Block) 11					\n\
> +(W)	send.ugm (1)		r31	r30	null	0x0	0x2128403	\n\
> +#endif										\n\
> +	", lower_32_bits(addr), upper_32_bits(addr));
> +}
> \ No newline at end of file
> diff --git a/lib/gpgpu_shader.h b/lib/gpgpu_shader.h
> index 355b128b5..318550c52 100644
> --- a/lib/gpgpu_shader.h
> +++ b/lib/gpgpu_shader.h
> @@ -87,6 +87,7 @@ void gpgpu_shader__write_offset(struct gpgpu_shader *shdr, uint64_t ppgtt_offset
>   				uint32_t value);
>   void gpgpu_shader__write_on_exception(struct gpgpu_shader *shdr, uint32_t dw, uint32_t x_offset,
>   				      uint32_t y_offset, uint32_t mask, uint32_t value);
> +void gpgpu_shader__read_page_fault(struct gpgpu_shader *shdr, uint64_t ppgtt_addr);
>   void gpgpu_shader__label(struct gpgpu_shader *shdr, int label_id);
>   void gpgpu_shader__jump(struct gpgpu_shader *shdr, int label_id);
>   void gpgpu_shader__jump_neq(struct gpgpu_shader *shdr, int label_id,
> diff --git a/lib/iga64_generated_codes.c b/lib/iga64_generated_codes.c
> index b23613ac4..53a705358 100644
> --- a/lib/iga64_generated_codes.c
> +++ b/lib/iga64_generated_codes.c
> @@ -3,7 +3,7 @@
>   
>   #include "gpgpu_shader.h"
>   
> -#define MD5_SUM_IGA64_ASMS 4fcde43dedb9d3212f1d85b5b180b0c1
> +#define MD5_SUM_IGA64_ASMS 01290b5ecda7a6e765463558d6f59952
>   
>   struct iga64_template const iga64_code_gpgpu_fill[] = {
>   	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
> @@ -79,6 +79,25 @@ struct iga64_template const iga64_code_gpgpu_fill[] = {
>   	}}
>   };
>   
> +struct iga64_template const iga64_code_read_page_fault[] = {
> +	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
> +		0x800c0061, 0x1e054330, 0x00000000, 0x00000000,
> +		0x80000061, 0x1e054220, 0x00000000, 0xc0ded000,
> +		0x80000061, 0x1e154220, 0x00000000, 0xc0ded001,
> +		0x80000061, 0x1e254220, 0x00000000, 0x0000003f,
> +		0x80000061, 0x1e354220, 0x00000000, 0x00000000,
> +		0x80000061, 0x1e454220, 0x00000000, 0x0000003f,
> +		0x80000061, 0x1e754220, 0x00000000, 0x0000000f,
> +		0x80032031, 0x1f0c0000, 0xf8061e0c, 0x00a00000,
> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 0, .size = 0, .code = (const uint32_t []) {
> +
> +	}}
> +};
> +
>   struct iga64_template const iga64_code_end_system_routine_step_if_eq[] = {
>   	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
>   		0x80000966, 0x80018220, 0x02008000, 0x00008000,
