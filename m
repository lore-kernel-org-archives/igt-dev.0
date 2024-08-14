Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4053C52D7D
	for <igt-dev@archiver.kernel.org>; Wed, 14 Aug 2024 11:32:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9243E10E44A;
	Wed, 14 Aug 2024 11:32:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k3SxF2qA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD83610E43E
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Aug 2024 11:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723635147; x=1755171147;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=j9boNdoR9mZwqP5XfZG5QUxg6WFwfgQHiJyuCSyt0Kk=;
 b=k3SxF2qAv8y4XcIAtrfkixRXDITO4XWrzyQafoftwdpDuKmWP215lfLo
 OFn7SjYmBhXUFT8QyWYKc8tVIG6/EbyjJ1EnnQ+93eR00lGM5+0LnsLgi
 nlMUonsuNspLej2cdz//iFS+fdySuBvw3CbGJ4GUMZOuLfLJwoGEBcF8E
 OBN4a8dheMEtvyMbj8Yi7gOuxmsshEUexhngKXnX2wECvgcGVPwkpvFN/
 ArCt9M0xKajc2n1t+IIbsa+fim3eCCz/1uz9hTDghnrOujmmRf6SPL3Ef
 PnwbRYxrRN7Hq1Dh/jw4fjxEKICR9+E/bUgNZVGHd4piglp8vx3ARp+HX w==;
X-CSE-ConnectionGUID: WGk6W4/YTtaZvJ+xxm5J1w==
X-CSE-MsgGUID: M5B2z5pyT1C7RrI/R0whkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="21488270"
X-IronPort-AV: E=Sophos;i="6.09,145,1716274800"; d="scan'208";a="21488270"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 04:32:26 -0700
X-CSE-ConnectionGUID: hk1BkN9QQaKr3qh8aPL/EQ==
X-CSE-MsgGUID: dXomUcZjTt+n0TuDJRMgzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,145,1716274800"; d="scan'208";a="82217511"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.246.30.61])
 ([10.246.30.61])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 04:32:24 -0700
Message-ID: <62edd5b2-c326-4210-ba3b-20a3d4fa154c@intel.com>
Date: Wed, 14 Aug 2024 13:32:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] lib/gpgpu_fill: Write kernel using inline iga64
 api
To: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
References: <20240814085636.1091046-1-dominik.grzegorzek@intel.com>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240814085636.1091046-1-dominik.grzegorzek@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



On 14.08.2024 10:56, Dominik Grzegorzek wrote:
> Rewrite gpgpu_fill shaders to utilize the newly introduced
> method of writing IGA64 assembly inline.
>
> v2: start with gen12 (Andrzej)
>
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Christoph Manszewski <christoph.manszewski@intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> ---
>   lib/gpgpu_fill.c                              | 166 +++++++-----------
>   lib/gpgpu_fill.h                              |  19 --
>   lib/i915/shaders/gpgpu/gen12_gpgpu_kernel.asm |  12 --
>   .../shaders/gpgpu/gen12p72_gpgpu_kernel.asm   |  12 --
>   .../shaders/gpgpu/xe2lpg_gpgpu_kernel.asm     |  13 --
>   lib/i915/shaders/gpgpu/xehp_gpgpu_kernel.asm  |  12 --
>   lib/iga64_generated_codes.c                   |  76 +++++++-
>   lib/intel_batchbuffer.c                       |  10 +-
>   lib/meson.build                               |   2 +-
>   9 files changed, 140 insertions(+), 182 deletions(-)
>   delete mode 100644 lib/i915/shaders/gpgpu/gen12_gpgpu_kernel.asm
>   delete mode 100644 lib/i915/shaders/gpgpu/gen12p72_gpgpu_kernel.asm
>   delete mode 100644 lib/i915/shaders/gpgpu/xe2lpg_gpgpu_kernel.asm
>   delete mode 100644 lib/i915/shaders/gpgpu/xehp_gpgpu_kernel.asm
>
> diff --git a/lib/gpgpu_fill.c b/lib/gpgpu_fill.c
> index 1270c2b22..dc3ebd8f0 100644
> --- a/lib/gpgpu_fill.c
> +++ b/lib/gpgpu_fill.c
> @@ -31,6 +31,7 @@
>   #include "drmtest.h"
>   
>   #include "gpgpu_fill.h"
> +#include "gpgpu_shader.h"
>   #include "gpu_cmds.h"
>   
>   /* lib/i915/shaders/gpgpu/gpgpu_fill.gxa */
> @@ -86,56 +87,6 @@ static const uint32_t gen11_gpgpu_kernel[][4] = {
>   	{ 0x07800031, 0x20000a40, 0x06000e00, 0x82000010 },
>   };
>   
> -static const uint32_t gen12_gpgpu_kernel[][4] = {
> -	{ 0x00020061, 0x01050000, 0x00000104, 0x00000000 },
> -	{ 0x00000069, 0x02058220, 0x02000024, 0x00000004 },
> -	{ 0x00000061, 0x02250220, 0x000000c4, 0x00000000 },
> -	{ 0x00030061, 0x04050220, 0x00460005, 0x00000000 },
> -	{ 0x00010261, 0x04050220, 0x00220205, 0x00000000 },
> -	{ 0x00000061, 0x04454220, 0x00000000, 0x0000000f },
> -	{ 0x00040661, 0x05050220, 0x00000104, 0x00000000 },
> -	{ 0x00049031, 0x00000000, 0xc0000414, 0x02a00000 },
> -	{ 0x00030061, 0x70050220, 0x00460005, 0x00000000 },
> -	{ 0x00040131, 0x00000004, 0x7020700c, 0x10000000 },
> -};
> -
> -static const uint32_t xehp_gpgpu_kernel[][4] = {
> -	{ 0x00020061, 0x01050000, 0x00000104, 0x00000000 },
> -	{ 0x00000069, 0x02058220, 0x02000024, 0x00000004 },
> -	{ 0x00000061, 0x02250220, 0x000000c4, 0x00000000 },
> -	{ 0x00030061, 0x04050220, 0x00460005, 0x00000000 },
> -	{ 0x00011a61, 0x04050220, 0x00220205, 0x00000000 },
> -	{ 0x00000061, 0x04454220, 0x00000000, 0x0000000f },
> -	{ 0x00041e61, 0x05050220, 0x00000104, 0x00000000 },
> -	{ 0x80001901, 0x00010000, 0x00000000, 0x00000000 },
> -	{ 0x00044031, 0x00000000, 0xc0000414, 0x02a00000 },
> -	{ 0x00030031, 0x00000004, 0x3000500c, 0x00000000 },
> -};
> -
> -static const uint32_t xehpc_gpgpu_kernel[][4] = {
> -	{ 0x00080061, 0x01050000, 0x00000104, 0x00000000 },
> -	{ 0x00000069, 0x02058220, 0x02000014, 0x00000004 },
> -	{ 0x00000061, 0x02150220, 0x00000064, 0x00000000 },
> -	{ 0x000c0061, 0x04050220, 0x00460005, 0x00000000 },
> -	{ 0x00041a61, 0x04050220, 0x00220205, 0x00000000 },
> -	{ 0x00000061, 0x04254220, 0x00000000, 0x0000000f },
> -	{ 0x00101e61, 0x05050220, 0x00000104, 0x00000000 },
> -	{ 0x00132031, 0x00000000, 0xc0000414, 0x02a00000 },
> -	{ 0x000c0031, 0x00000004, 0x3000500c, 0x00000000 },
> -};
> -
> -static const uint32_t xe2lpg_gpgpu_kernel[][4] = {
> -	{ 0x00080061, 0x01050000, 0x00000104, 0x00000000 },
> -	{ 0x00000069, 0x02058220, 0x02000014, 0x00000004 },
> -	{ 0x00000061, 0x02150220, 0x00000064, 0x00000000 },
> -	{ 0x00100061, 0x04054220, 0x00000000, 0x00000000 },
> -	{ 0x00041a61, 0x04550220, 0x00220205, 0x00000000 },
> -	{ 0x00000061, 0x04754550, 0x00000000, 0x000f000f },
> -	{ 0x00101e61, 0x05050220, 0x00000104, 0x00000000 },
> -	{ 0x00132031, 0x00000000, 0xd00e0494, 0x04000000 },
> -	{ 0x000c0031, 0x00000004, 0x3000500c, 0x00000000 },
> -};
> -
>   /*
>    * This sets up the gpgpu pipeline,
>    *
> @@ -317,15 +268,66 @@ __gen9_gpgpu_fillfunc(int i915,
>   	intel_bb_destroy(ibb);
>   }
>   
> -static void
> -__xehp_gpgpu_fillfunc(int i915,
> -		      struct intel_buf *buf,
> -		      unsigned int x, unsigned int y,
> -		      unsigned int width, unsigned int height,
> -		      uint8_t color, const uint32_t kernel[][4],
> -		      size_t kernel_size)
> +static struct gpgpu_shader *__xehp_gpgpu_kernel(int i915)
> +{
> +	struct gpgpu_shader *kernel = gpgpu_shader_create(i915);
> +
> +	emit_iga64_code(kernel, gpgpu_fill, "					\n\
> +// fill up r1 with target colour						\n\
> +mov (4|M0)		r1.0<1>:ub	r1.0<0;1,0>:ub				\n\
> +// prepare block x offset (Thread Group Id X * 16)				\n\
> +shl (1|M0)		r2.0<1>:ud	r0.1<0;1,0>:ud	0x4:ud			\n\
> +// prepare block y offset (Thread Group Id Y)					\n\
> +mov (1|M0)		r2.1<1>:ud	r0.6<0;1,0>:ud				\n\
> +// zero message header payload							\n\
> +mov (8|M0)		r4.0<1>:ud	0x0:ud					\n\
> +// fill up message payload with target colour					\n\
> +mov (16|M0)		r5.0<1>:ud	r1.0<0;1,0>:ud				\n\
> +#if GEN_VER < 2000								\n\
> +// load block offsets into message header payload				\n\
> +mov (2|M0)		r4.0<1>:ud	r2.0<2;2,1>:ud				\n\
> +// load block width								\n\
> +mov (1|M0)		r4.2<1>:ud	0xF:ud					\n\
> +// load FFTID from R0 header							\n\
> +mov (1|M0)		r4.4<1>:ud	r0.5<0;1,0>:ud				\n\
> +// Media block write to bti[0] surface						\n\
> +// Message Descriptor								\n\
> +//	0x40A8000:								\n\
> +//	[28:25]		Mlen: 2							\n\
> +//	[24:20]		Rlen: 0							\n\
> +//	[19]		Header: 1 (included)					\n\
> +//	[18:14]		MessageType: 0xA (media block write)			\n\
> +//	[7:0]		BTI: 0							\n\
> +send.dc1 (16|M0)	null	r4	src1_null	0x0	0x40A8000	\n\
> +#else										\n\
> +// load block offsets into message header payload				\n\
> +mov (2|M0)		r4.5<1>:ud	r2.0<2;2,1>:ud				\n\
> +// load block width								\n\
> +mov (1|M0)		 r4.14<1>:w	0xF:w					\n\
> +// Typed 2D block store to bti[0] surface					\n\
> +// Message Descriptor								\n\
> +//	0x6400007:								\n\
> +//	[30:29]		AddrType: 3 (BTI)					\n\
> +//	[28:25]		Mlen: 2							\n\
> +//	[24:20]		Rlen: 0							\n\
> +//	[19:17]		Caching: 0  (use state settings for both L1 and L3)	\n\
> +//	[5:0]		Opcode: 0x07  (store_block2d)				\n\
> +send.tgm (16|M0)	null	r4	null	0x0	0x64000007		\n\
> +#endif										\n\
> +	");
> +
> +	gpgpu_shader__eot(kernel);
> +	return kernel;
> +}
> +
> +void xehp_gpgpu_fillfunc(int i915,
> +			 struct intel_buf *buf,
> +			 unsigned int x, unsigned int y,
> +			 unsigned int width, unsigned int height,
> +			 uint8_t color)
>   {
>   	struct intel_bb *ibb;
> +	struct gpgpu_shader *kernel;
>   	struct xehp_interface_descriptor_data idd;
>   
>   	ibb = intel_bb_create(i915, PAGE_SIZE);
> @@ -333,8 +335,10 @@ __xehp_gpgpu_fillfunc(int i915,
>   
>   	intel_bb_ptr_set(ibb, BATCH_STATE_SPLIT);
>   
> -	xehp_fill_interface_descriptor(ibb, buf,
> -				       kernel, kernel_size, &idd);
> +	kernel = __xehp_gpgpu_kernel(i915);
> +	xehp_fill_interface_descriptor(ibb, buf, kernel->instr,
> +				       kernel->size * 4, &idd);
> +	gpgpu_shader_destroy(kernel);
>   
>   	intel_bb_ptr_set(ibb, 0);
>   
> @@ -377,47 +381,3 @@ void gen11_gpgpu_fillfunc(int i915,
>   			      gen11_gpgpu_kernel,
>   			      sizeof(gen11_gpgpu_kernel));
>   }
> -
> -void gen12_gpgpu_fillfunc(int i915,
> -			  struct intel_buf *buf,
> -			  unsigned x, unsigned y,
> -			  unsigned width, unsigned height,
> -			  uint8_t color)
> -{
> -	__gen9_gpgpu_fillfunc(i915, buf, x, y, width, height, color,
> -			      gen12_gpgpu_kernel,
> -			      sizeof(gen12_gpgpu_kernel));
> -}
> -
> -void xehp_gpgpu_fillfunc(int i915,
> -			 struct intel_buf *buf,
> -			 unsigned int x, unsigned int y,
> -			 unsigned int width, unsigned int height,
> -			 uint8_t color)
> -{
> -	__xehp_gpgpu_fillfunc(i915, buf, x, y, width, height, color,
> -			      xehp_gpgpu_kernel,
> -			      sizeof(xehp_gpgpu_kernel));
> -}
> -
> -void xehpc_gpgpu_fillfunc(int i915,
> -			  struct intel_buf *buf,
> -			  unsigned int x, unsigned int y,
> -			  unsigned int width, unsigned int height,
> -			  uint8_t color)
> -{
> -	__xehp_gpgpu_fillfunc(i915, buf, x, y, width, height, color,
> -			      xehpc_gpgpu_kernel,
> -			      sizeof(xehpc_gpgpu_kernel));
> -}
> -
> -void xe2lpg_gpgpu_fillfunc(int i915,
> -			   struct intel_buf *buf,
> -			   unsigned int x, unsigned int y,
> -			   unsigned int width, unsigned int height,
> -			   uint8_t color)
> -{
> -	__xehp_gpgpu_fillfunc(i915, buf, x, y, width, height, color,
> -			      xe2lpg_gpgpu_kernel,
> -			      sizeof(xe2lpg_gpgpu_kernel));
> -}
> diff --git a/lib/gpgpu_fill.h b/lib/gpgpu_fill.h
> index c3b47c10a..f4e207077 100644
> --- a/lib/gpgpu_fill.h
> +++ b/lib/gpgpu_fill.h
> @@ -55,12 +55,6 @@ void gen11_gpgpu_fillfunc(int i915,
>   			  unsigned width, unsigned height,
>   			  uint8_t color);
>   
> -void gen12_gpgpu_fillfunc(int i915,
> -			  struct intel_buf *buf,
> -			  unsigned x, unsigned y,
> -			  unsigned width, unsigned height,
> -			  uint8_t color);
> -
>   void
>   xehp_gpgpu_fillfunc(int i915,
>   		    struct intel_buf *dst,
> @@ -68,17 +62,4 @@ xehp_gpgpu_fillfunc(int i915,
>   		    unsigned int width, unsigned int height,
>   		    uint8_t color);
>   
> -void
> -xehpc_gpgpu_fillfunc(int i915,
> -		     struct intel_buf *dst,
> -		     unsigned int x, unsigned int y,
> -		     unsigned int width, unsigned int height,
> -		     uint8_t color);
> -
> -void xe2lpg_gpgpu_fillfunc(int i915,
> -			   struct intel_buf *buf,
> -			   unsigned int x, unsigned int y,
> -			   unsigned int width, unsigned int height,
> -			   uint8_t color);
> -
>   #endif /* GPGPU_FILL_H */
> diff --git a/lib/i915/shaders/gpgpu/gen12_gpgpu_kernel.asm b/lib/i915/shaders/gpgpu/gen12_gpgpu_kernel.asm
> deleted file mode 100644
> index ede87a055..000000000
> --- a/lib/i915/shaders/gpgpu/gen12_gpgpu_kernel.asm
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -L0:
> -         mov (4|M0)               r1.0<1>:ub    r1.0<0;1,0>:ub
> -         shl (1|M0)               r2.0<1>:ud    r0.1<0;1,0>:ud    0x4:ud
> -         mov (1|M0)               r2.1<1>:ud    r0.6<0;1,0>:ud
> -         mov (8|M0)               r4.0<1>:ud    r0.0<8;8,1>:ud
> -         mov (2|M0)               r4.0<1>:ud    r2.0<2;2,1>:ud                   {@2}
> -         mov (1|M0)               r4.2<1>:ud    0xF:ud
> -         mov (16|M0)              r5.0<1>:ud    r1.0<0;1,0>:ud                   {@6}
> -         send.dc1 (16|M0)         null     r4      null    0x0         0x40A8000  {@1, $0} //    wr:2h+0, rd:0, Media Block Write msc:0, to #0
> -         mov (8|M0)               r112.0<1>:ud  r0.0<8;8,1>:ud
> -         send.ts (16|M0)          null     r112    null    0x10000000  0x2000010  {EOT, @1} //    wr:1+0, rd:0, fc: 0x10
> -L160:
> diff --git a/lib/i915/shaders/gpgpu/gen12p72_gpgpu_kernel.asm b/lib/i915/shaders/gpgpu/gen12p72_gpgpu_kernel.asm
> deleted file mode 100644
> index 52699a475..000000000
> --- a/lib/i915/shaders/gpgpu/gen12p72_gpgpu_kernel.asm
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -L0:
> -         mov (4|M0)               r1.0<1>:ub    r1.0<0;1,0>:ub
> -         shl (1|M0)               r2.0<1>:ud    r0.1<0;1,0>:ud    0x4:ud
> -         mov (1|M0)               r2.1<1>:ud    r0.6<0;1,0>:ud
> -         mov (8|M0)               r4.0<1>:ud    r0.0<8;8,1>:ud
> -         mov (2|M0)               r4.0<1>:ud    r2.0<2;2,1>:ud                   {I@2}
> -         mov (1|M0)               r4.2<1>:ud    0xF:ud
> -         mov (16|M0)              r5.0<1>:ud    r1.0<0;1,0>:ud                   {I@6}
> -(W)      sync.nop                             null                             {I@1}
> -         send.dc1 (16|M0)         null     r4      null:0    0x0         0x40A8000  {$0} //    wr:2h+0, rd:0, Media Block Write msc:0, to #0
> -         send.gtwy (8|M0)         null     r80     null:0    0x0         0x02000000 {EOT}
> -L176:
> diff --git a/lib/i915/shaders/gpgpu/xe2lpg_gpgpu_kernel.asm b/lib/i915/shaders/gpgpu/xe2lpg_gpgpu_kernel.asm
> deleted file mode 100644
> index e2ecc71f5..000000000
> --- a/lib/i915/shaders/gpgpu/xe2lpg_gpgpu_kernel.asm
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -L0:
> -         mov (4|M0)               r1.0<1>:ub    r1.0<0;1,0>:ub                        // Load r1.0-3 with color byte
> -         shl (1|M0)               r2.0<1>:ud    r0.1<0;1,0>:ud    0x4:ud              // Load r2.0-3 with tg id X << 4
> -         mov (1|M0)               r2.1<1>:ud    r0.6<0;1,0>:ud                        // Load r2.4-7 with tg id Y
> -
> -         // payload setup
> -         mov (16|M0)              r4.0<1>:ud    0x0:ud                                // Zero out register R4
> -         mov (2|M0)               r4.5<1>:ud    r2.0<2;2,1>:ud                        // Store X and Y block start (160:191 and 192:223)
> -         mov (1|M0)               r4.14<1>:w    0xF:w                                 // Store X and Y block size (224:231 and 232:239)
> -         mov (16|M0)              r5.0<1>:ud    r1.0<0;1,0>:ud                        // Load r5-r6 with color byte
> -
> -         send.tgm (16|M0)         null     r4    null:0    0x0    0x64000007          // Send TypedStore2DBlock to tgm port
> -         send.gtwy (8|M0)         null    r80    null:0    0x0    0x02000000 {EOT}
> diff --git a/lib/i915/shaders/gpgpu/xehp_gpgpu_kernel.asm b/lib/i915/shaders/gpgpu/xehp_gpgpu_kernel.asm
> deleted file mode 100644
> index 7adfbd0f0..000000000
> --- a/lib/i915/shaders/gpgpu/xehp_gpgpu_kernel.asm
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -L0:
> -         mov (4|M0)               r1.0<1>:ub    r1.0<0;1,0>:ub
> -         shl (1|M0)               r2.0<1>:ud    r0.1<0;1,0>:ud    0x4:ud
> -         mov (1|M0)               r2.1<1>:ud    r0.6<0;1,0>:ud
> -         mov (8|M0)               r4.0<1>:ud    r0.0<8;8,1>:ud
> -         mov (2|M0)               r4.0<1>:ud    r2.0<2;2,1>:ud                   {I@2}
> -         mov (1|M0)               r4.2<1>:ud    0xF:ud
> -         mov (16|M0)              r5.0<1>:ud    r1.0<0;1,0>:ud                   {I@6}
> -(W)      sync.nop                             null                             {I@1}
> -         send.dc1 (16|M0)         null     r4      null    0x0         0x40A8000  {$0} //    wr:2h+0, rd:0, Media Block Write msc:0, to #0
> -         send.gtwy (8|M0)         null     r80     null    0x0         0x02000000 {EOT}
> -L176:
> diff --git a/lib/iga64_generated_codes.c b/lib/iga64_generated_codes.c
> index 6a08c4844..c22b1e9e7 100644
> --- a/lib/iga64_generated_codes.c
> +++ b/lib/iga64_generated_codes.c
> @@ -3,7 +3,81 @@
>   
>   #include "gpgpu_shader.h"
>   
> -#define MD5_SUM_IGA64_ASMS 2c503cbfbd7b3043e9a52188ae4da7a8
> +#define MD5_SUM_IGA64_ASMS efa80cb5c2d50f515af3642cee8dc062
> +
> +struct iga64_template const iga64_code_gpgpu_fill[] = {
> +	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
> +		0x00080061, 0x01050000, 0x00000104, 0x00000000,
> +		0x00000069, 0x02058220, 0x02000014, 0x00000004,
> +		0x00000061, 0x02150220, 0x00000064, 0x00000000,
> +		0x000c0061, 0x04054220, 0x00000000, 0x00000000,
> +		0x00101c61, 0x05050220, 0x00000104, 0x00000000,
> +		0x00041b61, 0x04550220, 0x00220205, 0x00000000,
> +		0x00000061, 0x04754550, 0x00000000, 0x000f000f,
> +		0x00132031, 0x00000000, 0xd00e0494, 0x04000000,
> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 1270, .size = 52, .code = (const uint32_t []) {
> +		0x00020061, 0x01050000, 0x00000104, 0x00000000,
> +		0x00000069, 0x02058220, 0x02000024, 0x00000004,
> +		0x00000061, 0x02250220, 0x000000c4, 0x00000000,
> +		0x00030061, 0x04054220, 0x00000000, 0x00000000,
> +		0x00041c61, 0x05050220, 0x00000104, 0x00000000,
> +		0x00011b61, 0x04050220, 0x00220205, 0x00000000,
> +		0x00000061, 0x04454220, 0x00000000, 0x0000000f,
> +		0x00000061, 0x04850220, 0x000000a4, 0x00000000,
> +		0x80001901, 0x00010000, 0x00000000, 0x00000000,
> +		0x00044031, 0x00000000, 0xc0000414, 0x02a00000,
> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 1260, .size = 48, .code = (const uint32_t []) {
> +		0x00080061, 0x01050000, 0x00000104, 0x00000000,
> +		0x00000069, 0x02058220, 0x02000014, 0x00000004,
> +		0x00000061, 0x02150220, 0x00000064, 0x00000000,
> +		0x000c0061, 0x04054220, 0x00000000, 0x00000000,
> +		0x00101c61, 0x05050220, 0x00000104, 0x00000000,
> +		0x00041b61, 0x04050220, 0x00220205, 0x00000000,
> +		0x00000061, 0x04254220, 0x00000000, 0x0000000f,
> +		0x00000061, 0x04450220, 0x00000054, 0x00000000,
> +		0x00132031, 0x00000000, 0xc0000414, 0x02a00000,
> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 1250, .size = 52, .code = (const uint32_t []) {
> +		0x00020061, 0x01050000, 0x00000104, 0x00000000,
> +		0x00000069, 0x02058220, 0x02000024, 0x00000004,
> +		0x00000061, 0x02250220, 0x000000c4, 0x00000000,
> +		0x00030061, 0x04054220, 0x00000000, 0x00000000,
> +		0x00041c61, 0x05050220, 0x00000104, 0x00000000,
> +		0x00011b61, 0x04050220, 0x00220205, 0x00000000,
> +		0x00000061, 0x04454220, 0x00000000, 0x0000000f,
> +		0x00000061, 0x04850220, 0x000000a4, 0x00000000,
> +		0x80001901, 0x00010000, 0x00000000, 0x00000000,
> +		0x00044031, 0x00000000, 0xc0000414, 0x02a00000,
> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 0, .size = 48, .code = (const uint32_t []) {
> +		0x00020061, 0x01050000, 0x00000104, 0x00000000,
> +		0x00000069, 0x02058220, 0x02000024, 0x00000004,
> +		0x00000061, 0x02250220, 0x000000c4, 0x00000000,
> +		0x00030061, 0x04054220, 0x00000000, 0x00000000,
> +		0x00040461, 0x05050220, 0x00000104, 0x00000000,
> +		0x00010361, 0x04050220, 0x00220205, 0x00000000,
> +		0x00000061, 0x04454220, 0x00000000, 0x0000000f,
> +		0x00000061, 0x04850220, 0x000000a4, 0x00000000,
> +		0x00049031, 0x00000000, 0xc0000414, 0x02a00000,
> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> +		0x80000101, 0x00010000, 0x00000000, 0x00000000,
> +	}}
> +};
>   
>   struct iga64_template const iga64_code_media_block_write[] = {
>   	{ .gen_ver = 2000, .size = 56, .code = (const uint32_t []) {
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index 824e92831..a7185cf05 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -758,16 +758,8 @@ igt_fillfunc_t igt_get_gpgpu_fillfunc(int devid)
>   {
>   	igt_fillfunc_t fill = NULL;
>   
> -	if (intel_graphics_ver(devid) >= IP_VER(20, 0))
> -		fill = xe2lpg_gpgpu_fillfunc;
> -	else if (IS_METEORLAKE(devid))
> +	if (intel_graphics_ver(devid) >= IP_VER(12, 00))
>   		fill = xehp_gpgpu_fillfunc;
> -	else if (intel_graphics_ver(devid) >= IP_VER(12, 60))
> -		fill = xehpc_gpgpu_fillfunc;
> -	else if (intel_graphics_ver(devid) >= IP_VER(12, 50))
> -		fill = xehp_gpgpu_fillfunc;
> -	else if (IS_GEN12(devid))
> -		fill = gen12_gpgpu_fillfunc;
>   	else if (IS_GEN11(devid))
>   		fill = gen11_gpgpu_fillfunc;
>   	else if (IS_GEN9(devid) || IS_GEN10(devid))
> diff --git a/lib/meson.build b/lib/meson.build
> index f711e60a7..2fac522d3 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -216,7 +216,7 @@ lib_version = vcs_tag(input : 'version.h.in', output : 'version.h',
>   		      fallback : 'NO-GIT',
>   		      command : vcs_command )
>   
> -iga64_assembly_sources = [ 'gpgpu_shader.c' ]
> +iga64_assembly_sources = [ 'gpgpu_shader.c', 'gpgpu_fill.c' ]
>   
>   lib_intermediates = []
>   iga64_assembly_libs = []

