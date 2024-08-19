Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B98C52D7C
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 17:51:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3143110E343;
	Mon, 19 Aug 2024 17:51:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OtVbiVZt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB6310E343
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 17:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724089894; x=1755625894;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Ewwaqca7gr6dEYddyrIeWLz2vqWf0YLYQHhObt4TU+U=;
 b=OtVbiVZtt+6HXfMmx4/N+MElKVo1rlMYHICSf9Yr4arN6WicZLbZcDrA
 JE7jyFZdb/Vsa2U6kCoHA0WVQXWIUHuR1cWTkb8wUnGRmbVYBE9I5KFtL
 wesUnTCZILeTyk8fuyoV6gRDvI1t62NqAC8NJrIhwc8ECJfoBDIlPaLFE
 vzYhNzB73ZTLIqTKx8dGDQKXAWNqGgUBE0DxARv3BpD7dVKs7NDo000OT
 bKYyQ3ThxE8YAbPEHV9lC2IF4V0hzgckLiU9q88Z3wCnLTd1ya9a2XIbl
 VaItFPpf/aTIccAR3k83MFPf7/36GBPDJixPIFBLezoaPT2/veD2C1gco Q==;
X-CSE-ConnectionGUID: DlTYPXedSF2yf4CcN1VWsw==
X-CSE-MsgGUID: pz12GP7fTvKC2whR5cSVTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22325405"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="22325405"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 10:51:34 -0700
X-CSE-ConnectionGUID: OuK/nMMmSQeGsiVImjKivw==
X-CSE-MsgGUID: 05xEQCxRQpaITQRtws+F1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="60279632"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 10:51:33 -0700
Date: Mon, 19 Aug 2024 19:51:30 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [PATCH i-g-t v2] lib/gpgpu_shader: Fix compilation warning and
 write dword shader
Message-ID: <20240819175130.ou26fda5jnhqbs3l@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
References: <20240814130423.1140740-1-dominik.grzegorzek@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240814130423.1140740-1-dominik.grzegorzek@intel.com>
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

Hi Dominik,
On 2024-08-14 at 15:04:23 +0200, Dominik Grzegorzek wrote:
> 1) Fix src1_null macro definition to match platforms which are mentioned in
> the comment above the declaration. (DG2+)
> 
> Fixes:
> iga64 -Xauto-deps -Wall -p=12p71 lib/iga64_generated_codes.c.d/iga64_assembly_eot.12p71.asm
> line 2.37: warning: Src1.Length should suffix src1 register (e.g. r10:4)
> (W) send.gtwy (8|M0) null r112 null 0 0x02000000 {EOT}
>                                     ^
> 2) Zero out r4 register in media block write message to prevent
>    errors when the same register was used earlier in the shader.
> 

Could you split this patch into two fixes? Now subject suggest
that you fixed one thing and write new dword shader, while it
looks like two fixes?

Regards,
Kamil

> v2: clear r4 before setting r5 (with small grfs the instruction also clears r5)
> 
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>  lib/gpgpu_shader.c          |  4 ++--
>  lib/iga64_generated_codes.c | 18 +++++++++++-------
>  lib/iga64_macros.h          |  2 +-
>  3 files changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
> index 991455c49..80bad342a 100644
> --- a/lib/gpgpu_shader.c
> +++ b/lib/gpgpu_shader.c
> @@ -281,6 +281,8 @@ void gpgpu_shader__write_dword(struct gpgpu_shader *shdr, uint32_t value,
>  			       uint32_t y_offset)
>  {
>  	emit_iga64_code(shdr, media_block_write, "				\n\
> +	// Clear message header							\n\
> +(W)	mov (16|M0)              r4.0<1>:ud    0x0:ud				\n\
>  	// Payload								\n\
>  (W)	mov (1|M0)               r5.0<1>:ud    ARG(3):ud			\n\
>  (W)	mov (1|M0)               r5.1<1>:ud    ARG(4):ud			\n\
> @@ -303,8 +305,6 @@ void gpgpu_shader__write_dword(struct gpgpu_shader *shdr, uint32_t value,
>  	// Load r2.4-7 with tg id Y + ARG(1):ud					\n\
>  (W)	mov (1|M0)               r2.1<1>:ud    r0.6<0;1,0>:ud			\n\
>  (W)	add (1|M0)               r2.1<1>:ud    r2.1<0;1,0>:ud    ARG(1):ud	\n\
> -	// payload setup							\n\
> -(W)	mov (16|M0)              r4.0<1>:ud    0x0:ud				\n\
>  	// Store X and Y block start (160:191 and 192:223)			\n\
>  (W)	mov (2|M0)               r4.5<1>:ud    r2.0<2;2,1>:ud			\n\
>  	// Store X and Y block max_size (224:231 and 232:239)			\n\
> diff --git a/lib/iga64_generated_codes.c b/lib/iga64_generated_codes.c
> index 6a08c4844..87270bb46 100644
> --- a/lib/iga64_generated_codes.c
> +++ b/lib/iga64_generated_codes.c
> @@ -3,10 +3,11 @@
>  
>  #include "gpgpu_shader.h"
>  
> -#define MD5_SUM_IGA64_ASMS 2c503cbfbd7b3043e9a52188ae4da7a8
> +#define MD5_SUM_IGA64_ASMS 96abf1aa2d0cc900ebba8203cefdd30c
>  
>  struct iga64_template const iga64_code_media_block_write[] = {
>  	{ .gen_ver = 2000, .size = 56, .code = (const uint32_t []) {
> +		0x80100061, 0x04054220, 0x00000000, 0x00000000,
>  		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
>  		0x80000061, 0x05154220, 0x00000000, 0xc0ded004,
>  		0x80000061, 0x05254220, 0x00000000, 0xc0ded005,
> @@ -14,15 +15,15 @@ struct iga64_template const iga64_code_media_block_write[] = {
>  		0x80000069, 0x02058220, 0x02000014, 0xc0ded000,
>  		0x80000061, 0x02150220, 0x00000064, 0x00000000,
>  		0x80001940, 0x02158220, 0x02000214, 0xc0ded001,
> -		0x80100061, 0x04054220, 0x00000000, 0x00000000,
> -		0x80041a61, 0x04550220, 0x00220205, 0x00000000,
> +		0x80041961, 0x04550220, 0x00220205, 0x00000000,
>  		0x80000061, 0x04754220, 0x00000000, 0xc0ded002,
>  		0x80132031, 0x00000000, 0xd00e0494, 0x04000000,
>  		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>  		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver = 1270, .size = 56, .code = (const uint32_t []) {
> +	{ .gen_ver = 1270, .size = 60, .code = (const uint32_t []) {
> +		0x80040061, 0x04054220, 0x00000000, 0x00000000,
>  		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
>  		0x80000061, 0x05254220, 0x00000000, 0xc0ded004,
>  		0x80000061, 0x05454220, 0x00000000, 0xc0ded005,
> @@ -38,7 +39,8 @@ struct iga64_template const iga64_code_media_block_write[] = {
>  		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver = 1260, .size = 52, .code = (const uint32_t []) {
> +	{ .gen_ver = 1260, .size = 56, .code = (const uint32_t []) {
> +		0x80100061, 0x04054220, 0x00000000, 0x00000000,
>  		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
>  		0x80000061, 0x05154220, 0x00000000, 0xc0ded004,
>  		0x80000061, 0x05254220, 0x00000000, 0xc0ded005,
> @@ -53,7 +55,8 @@ struct iga64_template const iga64_code_media_block_write[] = {
>  		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver = 1250, .size = 56, .code = (const uint32_t []) {
> +	{ .gen_ver = 1250, .size = 60, .code = (const uint32_t []) {
> +		0x80040061, 0x04054220, 0x00000000, 0x00000000,
>  		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
>  		0x80000061, 0x05254220, 0x00000000, 0xc0ded004,
>  		0x80000061, 0x05454220, 0x00000000, 0xc0ded005,
> @@ -69,7 +72,8 @@ struct iga64_template const iga64_code_media_block_write[] = {
>  		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>  	}},
> -	{ .gen_ver = 0, .size = 52, .code = (const uint32_t []) {
> +	{ .gen_ver = 0, .size = 56, .code = (const uint32_t []) {
> +		0x80040061, 0x04054220, 0x00000000, 0x00000000,
>  		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
>  		0x80000061, 0x05254220, 0x00000000, 0xc0ded004,
>  		0x80000061, 0x05454220, 0x00000000, 0xc0ded005,
> diff --git a/lib/iga64_macros.h b/lib/iga64_macros.h
> index f4ef5cb16..03cc726d4 100644
> --- a/lib/iga64_macros.h
> +++ b/lib/iga64_macros.h
> @@ -7,7 +7,7 @@
>  #define IGA64_MACROS_H
>  
>  /* send instruction for DG2+ requires 0 length in case src1 is null, BSpec: 47443 */
> -#if GEN_VER < 1271
> +#if GEN_VER <= 1250
>  #define src1_null null
>  #else
>  #define src1_null null:0
> -- 
> 2.34.1
> 
