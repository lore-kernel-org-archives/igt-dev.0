Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C3E8CEACDC
	for <igt-dev@archiver.kernel.org>; Tue,  1 Oct 2024 15:07:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE5E010E647;
	Tue,  1 Oct 2024 15:07:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gmjezuun";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 339F510E649
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Oct 2024 15:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727795229; x=1759331229;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=/qesyknXwUCgF/IZzTO27dSzQrcX0l9Lx6dYkIUhSl8=;
 b=Gmjezuun7jy5QBSN8dmVXFMJzBsc6pzQ6MsAj0Ls8pvRwZ1nLn3eSLzi
 bX9HrLaqhRPUt0ZqMoqR2WnRGEjLIV2avOLyymHWjLT/8dBvWcjXE0ntB
 UHCNgkWnhz4jWPYrCStuwD0OO80p6ti+/fFYw1TkOvgfXDtU4kQcuzHY/
 Bz3WN+N0XXikjurFvdKuf6qC4hM+f7+ZEkNZBTnEZUqS10bpTGPHwpaDO
 HAiYmSevBdd1iukaRf+mL1CQEHpooDukEHwIWcFQly9iPJzNbSOEWuNq+
 DrzxuMzl651id/kzQrtpthTKSw6VjATvjzFoCd32nphktVRkLjqWNzutp w==;
X-CSE-ConnectionGUID: 8oHckivmS+uAjsgXn5YN5g==
X-CSE-MsgGUID: W7xwuRjQSQiyvHu9SNr0rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="44397560"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="44397560"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 08:07:08 -0700
X-CSE-ConnectionGUID: Ddf2shjbSoOyksaNmPx7sA==
X-CSE-MsgGUID: Q2roRefqQxeKrAG56afzaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="73305652"
Received: from ksztyber-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.165])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 08:07:07 -0700
Date: Tue, 1 Oct 2024 17:07:05 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: igt-dev@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [PATCH i-g-t 1/2] lib/gpgpu_shader: Add x_offset parameter for
 gpgpu_shader__write_on_exception
Message-ID: <20241001150705.kysozwio55lgypsk@zkempczy-mobl2>
References: <20240925133003.41959-1-christoph.manszewski@intel.com>
 <20240925133003.41959-2-christoph.manszewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240925133003.41959-2-christoph.manszewski@intel.com>
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

On Wed, Sep 25, 2024 at 03:30:02PM +0200, Christoph Manszewski wrote:
> Currently gpgpu_shader__write_on_exception always writes the first
> column equal to thread group ID x. Make it possible to specify an offset
> from that value.
> 
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  lib/gpgpu_shader.c          | 29 +++++++-------
>  lib/gpgpu_shader.h          |  4 +-
>  lib/iga64_generated_codes.c | 77 ++++++++++++++++++++-----------------
>  tests/intel/xe_exec_sip.c   |  6 +--
>  4 files changed, 62 insertions(+), 54 deletions(-)
> 
> diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
> index 6d8c7ebb8..8df8d9612 100644
> --- a/lib/gpgpu_shader.c
> +++ b/lib/gpgpu_shader.c
> @@ -670,6 +670,7 @@ void gpgpu_shader__set_exception(struct gpgpu_shader *shdr, uint32_t value)
>   * gpgpu_shader__write_on_exception:
>   * @shdr: shader to be modified
>   * @value: dword to be written
> + * @x_offset: write target offset within the surface in columns added to the 'thread group id x'
>   * @y_offset: write target offset within the surface in rows
>   * @mask: mask to be applied on exception register
>   * @expected: expected value of exception register with @mask applied
> @@ -678,45 +679,47 @@ void gpgpu_shader__set_exception(struct gpgpu_shader *shdr, uint32_t value)
>   * to provided ones: cr0.1 & @mask == @expected,
>   * if yes fill dword in (row, column/dword) == (tg_id_y + @y_offset, tg_id_x).

tg_id_x + @x_offset

>   */
> -void gpgpu_shader__write_on_exception(struct gpgpu_shader *shdr, uint32_t value,
> +void gpgpu_shader__write_on_exception(struct gpgpu_shader *shdr, uint32_t value, uint32_t x_offset,
>  				      uint32_t y_offset, uint32_t mask, uint32_t expected)
>  {
>  	emit_iga64_code(shdr, write_on_exception, "					\n\
>  	// Clear message header								\n\
>  (W)	mov (16|M0)              r4.0<1>:ud    0x0:ud					\n\
>  	// Payload									\n\
> -(W)	mov (1|M0)               r5.0<1>:ud    ARG(3):ud				\n\
> +(W)	mov (1|M0)               r5.0<1>:ud    ARG(4):ud				\n\
>  #if GEN_VER < 2000 // prepare Media Block Write						\n\
>  	// X offset of the block in bytes := (thread group id X << ARG(0))		\n\
> -(W)	shl (1|M0)               r4.0<1>:ud    r0.1<0;1,0>:ud    ARG(0):ud		\n\
> +(W)	add (1|M0)               r4.0<1>:ud    r0.1<0;1,0>:ud	 ARG(1):ud		\n\
> +(W)	shl (1|M0)               r4.0<1>:ud    r4.0<0;1,0>:ud    ARG(0):ud		\n\
>  	// Y offset of the block in rows := thread group id Y				\n\
>  (W)	mov (1|M0)               r4.1<1>:ud    r0.6<0;1,0>:ud				\n\
> -(W)	add (1|M0)               r4.1<1>:ud    r4.1<0;1,0>:ud   ARG(1):ud		\n\
> +(W)	add (1|M0)               r4.1<1>:ud    r4.1<0;1,0>:ud   ARG(2):ud		\n\

You may drop mov and below should be enough:

	add (1|M0)               r4.1<1>:ud    r0.6<0;1,0>:ud    ARG(2):ud

>  	// block width [0,63] representing 1 to 64 bytes				\n\
> -(W)	mov (1|M0)               r4.2<1>:ud    ARG(2):ud				\n\
> +(W)	mov (1|M0)               r4.2<1>:ud    ARG(3):ud				\n\
>  	// FFTID := FFTID from R0 header						\n\
>  (W)	mov (1|M0)               r4.4<1>:ud    r0.5<0;1,0>:ud				\n\
>  #else // prepare Typed 2D Block Store							\n\
> -	// Load r2.0-3 with tg id X << ARG(0)						\n\
> -(W)	shl (1|M0)               r2.0<1>:ud    r0.1<0;1,0>:ud    ARG(0):ud		\n\
> -	// Load r2.4-7 with tg id Y + ARG(1):ud						\n\
> +	// Load r2.0 with tg id (X + ARG(1)) << ARG(0)					\n\
> +(W)	add (1|M0)               r2.0<1>:ud    r0.1<0;1,0>:ud	 ARG(1):ud		\n\
> +(W)	shl (1|M0)               r2.0<1>:ud    r2.0<0;1,0>:ud    ARG(0):ud		\n\
> +	// Load r2.4-7 with tg id Y + ARG(2):ud						\n\
>  (W)	mov (1|M0)               r2.1<1>:ud    r0.6<0;1,0>:ud				\n\
> -(W)	add (1|M0)               r2.1<1>:ud    r2.1<0;1,0>:ud    ARG(1):ud		\n\
> +(W)	add (1|M0)               r2.1<1>:ud    r2.1<0;1,0>:ud    ARG(2):ud		\n\

Same here.

>  	// Store X and Y block start (160:191 and 192:223)				\n\
>  (W)	mov (2|M0)               r4.5<1>:ud    r2.0<2;2,1>:ud				\n\
>  	// Store X and Y block max_size (224:231 and 232:239)				\n\
> -(W)	mov (1|M0)               r4.7<1>:ud    ARG(2):ud				\n\
> +(W)	mov (1|M0)               r4.7<1>:ud    ARG(3):ud				\n\
>  #endif											\n\
>  	// Check if masked exception is equal to provided value and write conditionally \n\
> -(W)      and (1|M0)              r3.0<1>:ud     cr0.1<0;1,0>:ud ARG(4):ud		\n\
> +(W)      and (1|M0)              r3.0<1>:ud     cr0.1<0;1,0>:ud ARG(5):ud		\n\
>  (W)      mov (1|M0)              f0.0<1>:ud     0x0:ud					\n\
> -(W)      cmp (1|M0)     (eq)f0.0 null:ud        r3.0<0;1,0>:ud  ARG(5):ud		\n\
> +(W)      cmp (1|M0)     (eq)f0.0 null:ud        r3.0<0;1,0>:ud  ARG(6):ud		\n\

Adding argument in the middle of the list makes a lot of noise in ARG(x)
changing. What a pity we don't have possibility of making definitions
like:

#define x_offset ARG(1)
#define y_offset ARG(2)

in the code. Changing definitions would keep code clear.

But that was my lousy thought, patch looks correct to me.
Feel free to incorporate my suggestions or not:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  #if GEN_VER < 2000 // Media Block Write							\n\
>  (W&f0.0) send.dc1 (16|M0)        null     r4   src1_null 0    0x40A8000			\n\
>  #else // Typed 2D Block Store								\n\
>  (W&f0.0) send.tgm (16|M0)        null     r4   null:0    0    0x64000007		\n\
>  #endif											\n\
> -	", 2, y_offset, 3, value, mask, expected);
> +	", 2, x_offset, y_offset, 3, value, mask, expected);
>  }
>  
>  /**
> diff --git a/lib/gpgpu_shader.h b/lib/gpgpu_shader.h
> index 53fe2869e..5f6260fb3 100644
> --- a/lib/gpgpu_shader.h
> +++ b/lib/gpgpu_shader.h
> @@ -82,8 +82,8 @@ void gpgpu_shader__end_system_routine_step_if_eq(struct gpgpu_shader *shdr,
>  void gpgpu_shader__write_aip(struct gpgpu_shader *shdr, uint32_t y_offset);
>  void gpgpu_shader__write_dword(struct gpgpu_shader *shdr, uint32_t value,
>  			       uint32_t y_offset);
> -void gpgpu_shader__write_on_exception(struct gpgpu_shader *shdr, uint32_t dw,
> -			       uint32_t y_offset, uint32_t mask, uint32_t value);
> +void gpgpu_shader__write_on_exception(struct gpgpu_shader *shdr, uint32_t dw, uint32_t x_offset,
> +				      uint32_t y_offset, uint32_t mask, uint32_t value);
>  void gpgpu_shader__label(struct gpgpu_shader *shdr, int label_id);
>  void gpgpu_shader__jump(struct gpgpu_shader *shdr, int label_id);
>  void gpgpu_shader__jump_neq(struct gpgpu_shader *shdr, int label_id,
> diff --git a/lib/iga64_generated_codes.c b/lib/iga64_generated_codes.c
> index fe6d68b70..91adc7313 100644
> --- a/lib/iga64_generated_codes.c
> +++ b/lib/iga64_generated_codes.c
> @@ -3,7 +3,7 @@
>  
>  #include "gpgpu_shader.h"
>  
> -#define MD5_SUM_IGA64_ASMS aa5c79b36f48404f1da21d2316e9f9f3
> +#define MD5_SUM_IGA64_ASMS a1dfb701367264e53d0d33f53d8769e3
>  
>  struct iga64_template const iga64_code_gpgpu_fill[] = {
>  	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
> @@ -193,83 +193,88 @@ struct iga64_template const iga64_code_breakpoint_suppress[] = {
>  };
>  
>  struct iga64_template const iga64_code_write_on_exception[] = {
> -	{ .gen_ver = 2000, .size = 56, .code = (const uint32_t []) {
> +	{ .gen_ver = 2000, .size = 60, .code = (const uint32_t []) {
>  		0x80100061, 0x04054220, 0x00000000, 0x00000000,
> -		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
> -		0x80000069, 0x02058220, 0x02000014, 0xc0ded000,
> +		0x80000061, 0x05054220, 0x00000000, 0xc0ded004,
> +		0x80000040, 0x02058220, 0x02000014, 0xc0ded001,
> +		0x80001969, 0x02058220, 0x02000204, 0xc0ded000,
>  		0x80000061, 0x02150220, 0x00000064, 0x00000000,
> -		0x80001940, 0x02158220, 0x02000214, 0xc0ded001,
> +		0x80001940, 0x02158220, 0x02000214, 0xc0ded002,
>  		0x80041961, 0x04550220, 0x00220205, 0x00000000,
> -		0x80000061, 0x04754220, 0x00000000, 0xc0ded002,
> -		0x80000965, 0x03058220, 0x02008010, 0xc0ded004,
> +		0x80000061, 0x04754220, 0x00000000, 0xc0ded003,
> +		0x80000965, 0x03058220, 0x02008010, 0xc0ded005,
>  		0x80000961, 0x30014220, 0x00000000, 0x00000000,
> -		0x80001a70, 0x00018220, 0x12000304, 0xc0ded005,
> +		0x80001a70, 0x00018220, 0x12000304, 0xc0ded006,
>  		0x84134031, 0x00000000, 0xd00e0494, 0x04000000,
>  		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>  		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver = 1270, .size = 60, .code = (const uint32_t []) {
> +	{ .gen_ver = 1270, .size = 64, .code = (const uint32_t []) {
>  		0x80040061, 0x04054220, 0x00000000, 0x00000000,
> -		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
> -		0x80000069, 0x04058220, 0x02000024, 0xc0ded000,
> +		0x80000061, 0x05054220, 0x00000000, 0xc0ded004,
> +		0x80000040, 0x04058220, 0x02000024, 0xc0ded001,
> +		0x80001969, 0x04058220, 0x02000404, 0xc0ded000,
>  		0x80000061, 0x04250220, 0x000000c4, 0x00000000,
> -		0x80001940, 0x04258220, 0x02000424, 0xc0ded001,
> -		0x80000061, 0x04454220, 0x00000000, 0xc0ded002,
> +		0x80001940, 0x04258220, 0x02000424, 0xc0ded002,
> +		0x80000061, 0x04454220, 0x00000000, 0xc0ded003,
>  		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
> -		0x80000965, 0x03058220, 0x02008020, 0xc0ded004,
> +		0x80000965, 0x03058220, 0x02008020, 0xc0ded005,
>  		0x80000961, 0x30014220, 0x00000000, 0x00000000,
> -		0x80001a70, 0x00018220, 0x12000304, 0xc0ded005,
> +		0x80001a70, 0x00018220, 0x12000304, 0xc0ded006,
>  		0x80001a01, 0x00010000, 0x00000000, 0x00000000,
>  		0x81044031, 0x00000000, 0xc0000414, 0x02a00000,
>  		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>  		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver = 1260, .size = 56, .code = (const uint32_t []) {
> +	{ .gen_ver = 1260, .size = 60, .code = (const uint32_t []) {
>  		0x80100061, 0x04054220, 0x00000000, 0x00000000,
> -		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
> -		0x80000069, 0x04058220, 0x02000014, 0xc0ded000,
> +		0x80000061, 0x05054220, 0x00000000, 0xc0ded004,
> +		0x80000040, 0x04058220, 0x02000014, 0xc0ded001,
> +		0x80001969, 0x04058220, 0x02000404, 0xc0ded000,
>  		0x80000061, 0x04150220, 0x00000064, 0x00000000,
> -		0x80001940, 0x04158220, 0x02000414, 0xc0ded001,
> -		0x80000061, 0x04254220, 0x00000000, 0xc0ded002,
> +		0x80001940, 0x04158220, 0x02000414, 0xc0ded002,
> +		0x80000061, 0x04254220, 0x00000000, 0xc0ded003,
>  		0x80000061, 0x04450220, 0x00000054, 0x00000000,
> -		0x80000965, 0x03058220, 0x02008010, 0xc0ded004,
> +		0x80000965, 0x03058220, 0x02008010, 0xc0ded005,
>  		0x80000961, 0x30014220, 0x00000000, 0x00000000,
> -		0x80001a70, 0x00018220, 0x12000304, 0xc0ded005,
> +		0x80001a70, 0x00018220, 0x12000304, 0xc0ded006,
>  		0x84134031, 0x00000000, 0xc0000414, 0x02a00000,
>  		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>  		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver = 1250, .size = 60, .code = (const uint32_t []) {
> +	{ .gen_ver = 1250, .size = 64, .code = (const uint32_t []) {
>  		0x80040061, 0x04054220, 0x00000000, 0x00000000,
> -		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
> -		0x80000069, 0x04058220, 0x02000024, 0xc0ded000,
> +		0x80000061, 0x05054220, 0x00000000, 0xc0ded004,
> +		0x80000040, 0x04058220, 0x02000024, 0xc0ded001,
> +		0x80001969, 0x04058220, 0x02000404, 0xc0ded000,
>  		0x80000061, 0x04250220, 0x000000c4, 0x00000000,
> -		0x80001940, 0x04258220, 0x02000424, 0xc0ded001,
> -		0x80000061, 0x04454220, 0x00000000, 0xc0ded002,
> +		0x80001940, 0x04258220, 0x02000424, 0xc0ded002,
> +		0x80000061, 0x04454220, 0x00000000, 0xc0ded003,
>  		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
> -		0x80000965, 0x03058220, 0x02008020, 0xc0ded004,
> +		0x80000965, 0x03058220, 0x02008020, 0xc0ded005,
>  		0x80000961, 0x30014220, 0x00000000, 0x00000000,
> -		0x80001a70, 0x00018220, 0x12000304, 0xc0ded005,
> +		0x80001a70, 0x00018220, 0x12000304, 0xc0ded006,
>  		0x80001a01, 0x00010000, 0x00000000, 0x00000000,
>  		0x81044031, 0x00000000, 0xc0000414, 0x02a00000,
>  		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>  		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver = 0, .size = 56, .code = (const uint32_t []) {
> +	{ .gen_ver = 0, .size = 60, .code = (const uint32_t []) {
>  		0x80040061, 0x04054220, 0x00000000, 0x00000000,
> -		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
> -		0x80000069, 0x04058220, 0x02000024, 0xc0ded000,
> +		0x80000061, 0x05054220, 0x00000000, 0xc0ded004,
> +		0x80000040, 0x04058220, 0x02000024, 0xc0ded001,
> +		0x80000169, 0x04058220, 0x02000404, 0xc0ded000,
>  		0x80000061, 0x04250220, 0x000000c4, 0x00000000,
> -		0x80000140, 0x04258220, 0x02000424, 0xc0ded001,
> -		0x80000061, 0x04454220, 0x00000000, 0xc0ded002,
> +		0x80000140, 0x04258220, 0x02000424, 0xc0ded002,
> +		0x80000061, 0x04454220, 0x00000000, 0xc0ded003,
>  		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
> -		0x80000165, 0x03058220, 0x02008020, 0xc0ded004,
> +		0x80000165, 0x03058220, 0x02008020, 0xc0ded005,
>  		0x80000161, 0x30014220, 0x00000000, 0x00000000,
> -		0x80000270, 0x00018220, 0x12000304, 0xc0ded005,
> +		0x80000270, 0x00018220, 0x12000304, 0xc0ded006,
>  		0x8104a031, 0x00000000, 0xc0000414, 0x02a00000,
>  		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>  		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> diff --git a/tests/intel/xe_exec_sip.c b/tests/intel/xe_exec_sip.c
> index ee4787d61..ed27d9c32 100644
> --- a/tests/intel/xe_exec_sip.c
> +++ b/tests/intel/xe_exec_sip.c
> @@ -93,14 +93,14 @@ static struct gpgpu_shader *get_shader(int fd, enum shader_type shader_type)
>  	case SHADER_INV_INSTR_DISABLED:
>  	case SHADER_INV_INSTR_WALKER_ENABLED:
>  		bad = (shader_type == SHADER_INV_INSTR_DISABLED) ? ILLEGAL_OPCODE_ENABLE : 0;
> -		gpgpu_shader__write_on_exception(shader, 1, 0, ILLEGAL_OPCODE_ENABLE, bad);
> +		gpgpu_shader__write_on_exception(shader, 1, 0, 0, ILLEGAL_OPCODE_ENABLE, bad);
>  		gpgpu_shader__nop(shader);
>  		gpgpu_shader__nop(shader);
>  		/* modify second nop, set only opcode bits[6:0] */
>  		shader->instr[gpgpu_shader_last_instr(shader)][0] = 0x7f;
>  		/* SIP should clear exception bit */
>  		bad = ILLEGAL_OPCODE_STATUS;
> -		gpgpu_shader__write_on_exception(shader, 2, 0, ILLEGAL_OPCODE_STATUS, bad);
> +		gpgpu_shader__write_on_exception(shader, 2, 0, 0, ILLEGAL_OPCODE_STATUS, bad);
>  		break;
>  	}
>  
> @@ -120,7 +120,7 @@ static struct gpgpu_shader *get_sip(int fd, enum sip_type sip_type, unsigned int
>  
>  	switch (sip_type) {
>  	case SIP_INV_INSTR:
> -		gpgpu_shader__write_on_exception(sip, 1, y_offset, ILLEGAL_OPCODE_STATUS, 0);
> +		gpgpu_shader__write_on_exception(sip, 1, 0, y_offset, ILLEGAL_OPCODE_STATUS, 0);
>  		break;
>  	default:
>  		break;
> -- 
> 2.34.1
> 
