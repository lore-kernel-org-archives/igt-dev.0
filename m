Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE2CBCD37B4
	for <igt-dev@archiver.kernel.org>; Wed,  4 Sep 2024 12:23:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7350310E790;
	Wed,  4 Sep 2024 12:23:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DMhQE5AG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA84610E790
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Sep 2024 12:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725452590; x=1756988590;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jWJUymQZTvIZ4FumK4FFnpvTKER1zQqeJ38Ur8PxNOc=;
 b=DMhQE5AGv8JaSxoyJVdAUqpC+iVvdQmBIPxLPBqfOCmjKXTSZoBBZmdr
 LrlWlifNJob1/nGoGr+UxkiZcxDcaQU3oV6p92g9LL7TvQr1cCc+0JKaK
 jaSYv/CdbgitTKiMPZZnalnAKthMuIrc1PAeHtKL3Ry4AOZ0n7Ju7Ppyb
 Z4PwEqqy7zhMYjHO3pSynYPBDEMNrEGeY2VVuR2HWsEvAnXpgDDbnOWyq
 KqOuFbcqQUUW57RiVb1+z6Dv5pZqFDgdlEUsqUtGoZgp68vHWSJW8hIMM
 BH7LIVPENVt3xLHIcWLEF1UhPzHCiV557oWA1GpmgzTSXW+T1x/hQdcWc A==;
X-CSE-ConnectionGUID: yDSctJq9R4qAU25pt5Kkkw==
X-CSE-MsgGUID: vmrWBYpRSKmyzbbRS9IWXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="34770421"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="34770421"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 05:23:09 -0700
X-CSE-ConnectionGUID: 3W38k2mBQQ6MBONOnZUehA==
X-CSE-MsgGUID: nYjz6zK0RsWUG77pF6w1eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="69883239"
Received: from ltuz-desk.ger.corp.intel.com (HELO localhost) ([10.245.246.40])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 05:23:06 -0700
Date: Wed, 4 Sep 2024 14:23:03 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: Re: [PATCH i-g-t v5 04/17] lib/gpgpu_shader: Add write_on_exception
 template
Message-ID: <20240904122303.l7t4jcpp2htyte3m@zkempczy-mobl2>
References: <20240829144547.105371-1-christoph.manszewski@intel.com>
 <20240829144547.105371-5-christoph.manszewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829144547.105371-5-christoph.manszewski@intel.com>
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

On Thu, Aug 29, 2024 at 04:45:34PM +0200, Christoph Manszewski wrote:
> From: Andrzej Hajda <andrzej.hajda@intel.com>
> 
> Writing specific value to memory location on unexpected value in exception
> register allows to report errors from inside shader or siplet.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>  lib/gpgpu_shader.c          |  56 ++++++++++++++++++++
>  lib/gpgpu_shader.h          |   2 +
>  lib/iga64_generated_codes.c | 102 +++++++++++++++++++++++++++++++++++-
>  3 files changed, 159 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
> index c723577e6..4097857f2 100644
> --- a/lib/gpgpu_shader.c
> +++ b/lib/gpgpu_shader.c
> @@ -634,6 +634,62 @@ void gpgpu_shader__write_dword(struct gpgpu_shader *shdr, uint32_t value,
>  	", 2, y_offset, 3, value, value, value, value);
>  }
>  
> +/**
> + * gpgpu_shader__write_on_exception:
> + * @shdr: shader to be modified
> + * @value: dword to be written
> + * @y_offset: write target offset within the surface in rows
> + * @mask: mask to be applied on exception register
> + * @expected: expected value of exception register with @mask applied
> + *
> + * Check if bits specified by @mask in exception register(cr0.1) are equal
> + * to provided ones: cr0.1 & @mask == @expected,
> + * if yes fill dword in (row, column/dword) == (tg_id_y + @y_offset, tg_id_x).
> + */
> +void gpgpu_shader__write_on_exception(struct gpgpu_shader *shdr, uint32_t value,
> +				      uint32_t y_offset, uint32_t mask, uint32_t expected)
> +{
> +	emit_iga64_code(shdr, write_on_exception, "					\n\
> +	// Clear message header								\n\
> +(W)	mov (16|M0)              r4.0<1>:ud    0x0:ud					\n\
> +	// Payload									\n\
> +(W)	mov (1|M0)               r5.0<1>:ud    ARG(3):ud				\n\
> +(W)	mov (1|M0)               r5.1<1>:ud    ARG(4):ud				\n\
> +(W)	mov (1|M0)               r5.2<1>:ud    ARG(5):ud				\n\
> +(W)	mov (1|M0)               r5.3<1>:ud    ARG(6):ud				\n\

ARG(4)-ARG(6) are unused and confusing here. Please get rid of them.

> +#if GEN_VER < 2000 // prepare Media Block Write						\n\
> +	// X offset of the block in bytes := (thread group id X << ARG(0))		\n\
> +(W)	shl (1|M0)               r4.0<1>:ud    r0.1<0;1,0>:ud    ARG(0):ud		\n\
> +	// Y offset of the block in rows := thread group id Y				\n\
> +(W)	mov (1|M0)               r4.1<1>:ud    r0.6<0;1,0>:ud				\n\
> +(W)	add (1|M0)               r4.1<1>:ud    r4.1<0;1,0>:ud   ARG(1):ud		\n\
> +	// block width [0,63] representing 1 to 64 bytes				\n\
> +(W)	mov (1|M0)               r4.2<1>:ud    ARG(2):ud				\n\
> +	// FFTID := FFTID from R0 header						\n\
> +(W)	mov (1|M0)               r4.4<1>:ud    r0.5<0;1,0>:ud				\n\
> +#else // prepare Typed 2D Block Store							\n\
> +	// Load r2.0-3 with tg id X << ARG(0)						\n\
> +(W)	shl (1|M0)               r2.0<1>:ud    r0.1<0;1,0>:ud    ARG(0):ud		\n\
> +	// Load r2.4-7 with tg id Y + ARG(1):ud						\n\
> +(W)	mov (1|M0)               r2.1<1>:ud    r0.6<0;1,0>:ud				\n\
> +(W)	add (1|M0)               r2.1<1>:ud    r2.1<0;1,0>:ud    ARG(1):ud		\n\
> +	// Store X and Y block start (160:191 and 192:223)				\n\
> +(W)	mov (2|M0)               r4.5<1>:ud    r2.0<2;2,1>:ud				\n\
> +	// Store X and Y block max_size (224:231 and 232:239)				\n\
> +(W)	mov (1|M0)               r4.7<1>:ud    ARG(2):ud				\n\
> +#endif											\n\
> +	// Check if masked exception is equal to provided value and write conditionally \n\
> +(W)      and (1|M0)              r3.0<1>:ud     cr0.1<0;1,0>:ud ARG(7):ud		\n\
> +(W)      mov (1|M0)              f0.0<1>:ud     0x0:ud					\n\
> +(W)      cmp (1|M0)     (eq)f0.0 null:ud        r3.0<0;1,0>:ud  ARG(8):ud		\n\
> +#if GEN_VER < 2000 // Media Block Write							\n\
> +(W&f0.0) send.dc1 (16|M0)        null     r4   src1_null 0    0x40A8000			\n\
> +#else // Typed 2D Block Store								\n\
> +(W&f0.0) send.tgm (16|M0)        null     r4   null:0    0    0x64000007		\n\
> +#endif											\n\
> +	", 2, y_offset, 3, value, value, value, value, mask, expected);

I thought first and third argument might be directly entered in the code
but after replace there's harder to find where they are used. I mean
I looked for ARG(0) to find the place where 2 lands. So I suggest just
to remove 'value' duplicates for ARG(4)-ARG(6) only.

--
Zbigniew

> +}
> +
>  /**
>   * gpgpu_shader__end_system_routine:
>   * @shdr: shader to be modified
> diff --git a/lib/gpgpu_shader.h b/lib/gpgpu_shader.h
> index e4ca0be4c..76ff4989e 100644
> --- a/lib/gpgpu_shader.h
> +++ b/lib/gpgpu_shader.h
> @@ -74,6 +74,8 @@ void gpgpu_shader__end_system_routine_step_if_eq(struct gpgpu_shader *shdr,
>  void gpgpu_shader__write_aip(struct gpgpu_shader *shdr, uint32_t y_offset);
>  void gpgpu_shader__write_dword(struct gpgpu_shader *shdr, uint32_t value,
>  			       uint32_t y_offset);
> +void gpgpu_shader__write_on_exception(struct gpgpu_shader *shdr, uint32_t dw,
> +			       uint32_t y_offset, uint32_t mask, uint32_t value);
>  void gpgpu_shader__label(struct gpgpu_shader *shdr, int label_id);
>  void gpgpu_shader__jump(struct gpgpu_shader *shdr, int label_id);
>  void gpgpu_shader__jump_neq(struct gpgpu_shader *shdr, int label_id,
> diff --git a/lib/iga64_generated_codes.c b/lib/iga64_generated_codes.c
> index dd849eebc..c084ddcd7 100644
> --- a/lib/iga64_generated_codes.c
> +++ b/lib/iga64_generated_codes.c
> @@ -3,7 +3,7 @@
>  
>  #include "gpgpu_shader.h"
>  
> -#define MD5_SUM_IGA64_ASMS 33b7cd843e3b009c123a85a6c520d7d0
> +#define MD5_SUM_IGA64_ASMS 85cd452f0cdcf3fe54bb0b2a7424e12a
>  
>  struct iga64_template const iga64_code_gpgpu_fill[] = {
>  	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
> @@ -192,6 +192,106 @@ struct iga64_template const iga64_code_breakpoint_suppress[] = {
>  	}}
>  };
>  
> +struct iga64_template const iga64_code_write_on_exception[] = {
> +	{ .gen_ver = 2000, .size = 68, .code = (const uint32_t []) {
> +		0x80100061, 0x04054220, 0x00000000, 0x00000000,
> +		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
> +		0x80000061, 0x05154220, 0x00000000, 0xc0ded004,
> +		0x80000061, 0x05254220, 0x00000000, 0xc0ded005,
> +		0x80000061, 0x05354220, 0x00000000, 0xc0ded006,
> +		0x80000069, 0x02058220, 0x02000014, 0xc0ded000,
> +		0x80000061, 0x02150220, 0x00000064, 0x00000000,
> +		0x80001940, 0x02158220, 0x02000214, 0xc0ded001,
> +		0x80041961, 0x04550220, 0x00220205, 0x00000000,
> +		0x80000061, 0x04754220, 0x00000000, 0xc0ded002,
> +		0x80000965, 0x03058220, 0x02008010, 0xc0ded007,
> +		0x80000961, 0x30014220, 0x00000000, 0x00000000,
> +		0x80001a70, 0x00018220, 0x12000304, 0xc0ded008,
> +		0x84134031, 0x00000000, 0xd00e0494, 0x04000000,
> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 1270, .size = 72, .code = (const uint32_t []) {
> +		0x80040061, 0x04054220, 0x00000000, 0x00000000,
> +		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
> +		0x80000061, 0x05254220, 0x00000000, 0xc0ded004,
> +		0x80000061, 0x05454220, 0x00000000, 0xc0ded005,
> +		0x80000061, 0x05654220, 0x00000000, 0xc0ded006,
> +		0x80000069, 0x04058220, 0x02000024, 0xc0ded000,
> +		0x80000061, 0x04250220, 0x000000c4, 0x00000000,
> +		0x80001940, 0x04258220, 0x02000424, 0xc0ded001,
> +		0x80000061, 0x04454220, 0x00000000, 0xc0ded002,
> +		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
> +		0x80000965, 0x03058220, 0x02008020, 0xc0ded007,
> +		0x80000961, 0x30014220, 0x00000000, 0x00000000,
> +		0x80001a70, 0x00018220, 0x12000304, 0xc0ded008,
> +		0x80001a01, 0x00010000, 0x00000000, 0x00000000,
> +		0x81044031, 0x00000000, 0xc0000414, 0x02a00000,
> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 1260, .size = 68, .code = (const uint32_t []) {
> +		0x80100061, 0x04054220, 0x00000000, 0x00000000,
> +		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
> +		0x80000061, 0x05154220, 0x00000000, 0xc0ded004,
> +		0x80000061, 0x05254220, 0x00000000, 0xc0ded005,
> +		0x80000061, 0x05354220, 0x00000000, 0xc0ded006,
> +		0x80000069, 0x04058220, 0x02000014, 0xc0ded000,
> +		0x80000061, 0x04150220, 0x00000064, 0x00000000,
> +		0x80001940, 0x04158220, 0x02000414, 0xc0ded001,
> +		0x80000061, 0x04254220, 0x00000000, 0xc0ded002,
> +		0x80000061, 0x04450220, 0x00000054, 0x00000000,
> +		0x80000965, 0x03058220, 0x02008010, 0xc0ded007,
> +		0x80000961, 0x30014220, 0x00000000, 0x00000000,
> +		0x80001a70, 0x00018220, 0x12000304, 0xc0ded008,
> +		0x84134031, 0x00000000, 0xc0000414, 0x02a00000,
> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 1250, .size = 72, .code = (const uint32_t []) {
> +		0x80040061, 0x04054220, 0x00000000, 0x00000000,
> +		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
> +		0x80000061, 0x05254220, 0x00000000, 0xc0ded004,
> +		0x80000061, 0x05454220, 0x00000000, 0xc0ded005,
> +		0x80000061, 0x05654220, 0x00000000, 0xc0ded006,
> +		0x80000069, 0x04058220, 0x02000024, 0xc0ded000,
> +		0x80000061, 0x04250220, 0x000000c4, 0x00000000,
> +		0x80001940, 0x04258220, 0x02000424, 0xc0ded001,
> +		0x80000061, 0x04454220, 0x00000000, 0xc0ded002,
> +		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
> +		0x80000965, 0x03058220, 0x02008020, 0xc0ded007,
> +		0x80000961, 0x30014220, 0x00000000, 0x00000000,
> +		0x80001a70, 0x00018220, 0x12000304, 0xc0ded008,
> +		0x80001a01, 0x00010000, 0x00000000, 0x00000000,
> +		0x81044031, 0x00000000, 0xc0000414, 0x02a00000,
> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 0, .size = 68, .code = (const uint32_t []) {
> +		0x80040061, 0x04054220, 0x00000000, 0x00000000,
> +		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
> +		0x80000061, 0x05254220, 0x00000000, 0xc0ded004,
> +		0x80000061, 0x05454220, 0x00000000, 0xc0ded005,
> +		0x80000061, 0x05654220, 0x00000000, 0xc0ded006,
> +		0x80000069, 0x04058220, 0x02000024, 0xc0ded000,
> +		0x80000061, 0x04250220, 0x000000c4, 0x00000000,
> +		0x80000140, 0x04258220, 0x02000424, 0xc0ded001,
> +		0x80000061, 0x04454220, 0x00000000, 0xc0ded002,
> +		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
> +		0x80000165, 0x03058220, 0x02008020, 0xc0ded007,
> +		0x80000161, 0x30014220, 0x00000000, 0x00000000,
> +		0x80000270, 0x00018220, 0x12000304, 0xc0ded008,
> +		0x8104a031, 0x00000000, 0xc0000414, 0x02a00000,
> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> +		0x80000101, 0x00010000, 0x00000000, 0x00000000,
> +	}}
> +};
> +
>  struct iga64_template const iga64_code_media_block_write[] = {
>  	{ .gen_ver = 2000, .size = 56, .code = (const uint32_t []) {
>  		0x80100061, 0x04054220, 0x00000000, 0x00000000,
> -- 
> 2.34.1
> 
