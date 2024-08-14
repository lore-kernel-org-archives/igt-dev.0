Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85BEAC3DA4A
	for <igt-dev@archiver.kernel.org>; Wed, 14 Aug 2024 11:29:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36F6910E43B;
	Wed, 14 Aug 2024 11:29:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UahFpH/n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFB5D10E43B
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Aug 2024 11:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723634999; x=1755170999;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=1iFwXA0L393RkB0ZC2ac+uSv6N2DdLD8oPwSXO1sujc=;
 b=UahFpH/npAHvKmdeqrmYU8VDqoHpE7Z0wG2NM4ab/EcquihAEnN2B+oJ
 sRJT2OLl3vRECvP/kk36JiCa8rmSKBRq9l7puO7P9RPmrXxYXDh9k2hqn
 QTdw/q/qJNsTX0r+dZu1Chcqd5+gktXehQYNz03XV03r5R+db1n4VXew9
 cbrF7QzTPg5bhIr7hQdh+JxI5Au0rZPFW4ywaic2RTNN8IobZYMevP1c0
 rakfc3oroT7BVhrF4LWlrYaktDfYmaZKsuHx/gkFTIYN5WCq0E31IK//0
 1yEvu1hgRbZb2TdeLquzjtKEeFuTEj/UG6RqoUtsgKn2S4ik63+glvgLQ A==;
X-CSE-ConnectionGUID: U1P9Tn2gSwmZwDo2xw0ZTg==
X-CSE-MsgGUID: pCkbRdEjT5C7Prmb/PlQKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="25645828"
X-IronPort-AV: E=Sophos;i="6.09,145,1716274800"; d="scan'208";a="25645828"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 04:29:58 -0700
X-CSE-ConnectionGUID: IQULCaLnTPeY6vw3kMwTzQ==
X-CSE-MsgGUID: unxp6AadT0u0r5LhFbFtKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,145,1716274800"; d="scan'208";a="59275019"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.246.30.61])
 ([10.246.30.61])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 04:29:58 -0700
Message-ID: <690eac26-a1d9-469c-9b01-fd4c8d871fde@intel.com>
Date: Wed, 14 Aug 2024 13:29:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/gpgpu_shader: Fix compilation warning and write
 dword shader
To: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240814095843.1108680-1-dominik.grzegorzek@intel.com>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240814095843.1108680-1-dominik.grzegorzek@intel.com>
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



On 14.08.2024 11:58, Dominik Grzegorzek wrote:
> 1) Fix src1_null macro definiton to match platforms which are mentioned in
> the comment above the declaration. (DG2+)
>
> Fixes:
> iga64 -Xauto-deps -Wall -p=12p71 lib/iga64_generated_codes.c.d/iga64_assembly_eot.12p71.asm
> line 2.37: warning: Src1.Length should suffix src1 register (e.g. r10:4)
> (W) send.gtwy (8|M0) null r112 null 0 0x02000000 {EOT}
>                                      ^
> 2) Zero out r4 register in media block write message to prevent
>     errors when the same register was used earlier in the shader.
>
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
> ---
>   lib/gpgpu_shader.c          |  4 ++--
>   lib/iga64_generated_codes.c | 18 +++++++++++-------
>   lib/iga64_macros.h          |  2 +-
>   3 files changed, 14 insertions(+), 10 deletions(-)
>
> diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
> index 991455c49..5cbb4346b 100644
> --- a/lib/gpgpu_shader.c
> +++ b/lib/gpgpu_shader.c
> @@ -286,6 +286,8 @@ void gpgpu_shader__write_dword(struct gpgpu_shader *shdr, uint32_t value,
>   (W)	mov (1|M0)               r5.1<1>:ud    ARG(4):ud			\n\
>   (W)	mov (1|M0)               r5.2<1>:ud    ARG(5):ud			\n\
>   (W)	mov (1|M0)               r5.3<1>:ud    ARG(6):ud			\n\
> +	// clear message header							\n\
> +(W)	mov (16|M0)              r4.0<1>:ud    0x0:ud				\n\
>   #if GEN_VER < 2000 // Media Block Write						\n\
>   	// X offset of the block in bytes := (thread group id X << ARG(0))	\n\
>   (W)	shl (1|M0)               r4.0<1>:ud    r0.1<0;1,0>:ud    ARG(0):ud	\n\
> @@ -303,8 +305,6 @@ void gpgpu_shader__write_dword(struct gpgpu_shader *shdr, uint32_t value,
>   	// Load r2.4-7 with tg id Y + ARG(1):ud					\n\
>   (W)	mov (1|M0)               r2.1<1>:ud    r0.6<0;1,0>:ud			\n\
>   (W)	add (1|M0)               r2.1<1>:ud    r2.1<0;1,0>:ud    ARG(1):ud	\n\
> -	// payload setup							\n\
> -(W)	mov (16|M0)              r4.0<1>:ud    0x0:ud				\n\
>   	// Store X and Y block start (160:191 and 192:223)			\n\
>   (W)	mov (2|M0)               r4.5<1>:ud    r2.0<2;2,1>:ud			\n\
>   	// Store X and Y block max_size (224:231 and 232:239)			\n\
> diff --git a/lib/iga64_generated_codes.c b/lib/iga64_generated_codes.c
> index 6a08c4844..1769f4ecf 100644
> --- a/lib/iga64_generated_codes.c
> +++ b/lib/iga64_generated_codes.c
> @@ -3,7 +3,7 @@
>   
>   #include "gpgpu_shader.h"
>   
> -#define MD5_SUM_IGA64_ASMS 2c503cbfbd7b3043e9a52188ae4da7a8
> +#define MD5_SUM_IGA64_ASMS cecee4a452aa9764b5eaebb60269f1a4
>   
>   struct iga64_template const iga64_code_media_block_write[] = {
>   	{ .gen_ver = 2000, .size = 56, .code = (const uint32_t []) {
> @@ -11,22 +11,23 @@ struct iga64_template const iga64_code_media_block_write[] = {
>   		0x80000061, 0x05154220, 0x00000000, 0xc0ded004,
>   		0x80000061, 0x05254220, 0x00000000, 0xc0ded005,
>   		0x80000061, 0x05354220, 0x00000000, 0xc0ded006,
> +		0x80100061, 0x04054220, 0x00000000, 0x00000000,
>   		0x80000069, 0x02058220, 0x02000014, 0xc0ded000,
>   		0x80000061, 0x02150220, 0x00000064, 0x00000000,
>   		0x80001940, 0x02158220, 0x02000214, 0xc0ded001,
> -		0x80100061, 0x04054220, 0x00000000, 0x00000000,
> -		0x80041a61, 0x04550220, 0x00220205, 0x00000000,
> +		0x80041961, 0x04550220, 0x00220205, 0x00000000,
>   		0x80000061, 0x04754220, 0x00000000, 0xc0ded002,
>   		0x80132031, 0x00000000, 0xd00e0494, 0x04000000,
>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 1270, .size = 56, .code = (const uint32_t []) {
> +	{ .gen_ver = 1270, .size = 60, .code = (const uint32_t []) {
>   		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
>   		0x80000061, 0x05254220, 0x00000000, 0xc0ded004,
>   		0x80000061, 0x05454220, 0x00000000, 0xc0ded005,
>   		0x80000061, 0x05654220, 0x00000000, 0xc0ded006,
> +		0x80040061, 0x04054220, 0x00000000, 0x00000000,
>   		0x80000069, 0x04058220, 0x02000024, 0xc0ded000,
>   		0x80000061, 0x04250220, 0x000000c4, 0x00000000,
>   		0x80001940, 0x04258220, 0x02000424, 0xc0ded001,
> @@ -38,11 +39,12 @@ struct iga64_template const iga64_code_media_block_write[] = {
>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 1260, .size = 52, .code = (const uint32_t []) {
> +	{ .gen_ver = 1260, .size = 56, .code = (const uint32_t []) {
>   		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
>   		0x80000061, 0x05154220, 0x00000000, 0xc0ded004,
>   		0x80000061, 0x05254220, 0x00000000, 0xc0ded005,
>   		0x80000061, 0x05354220, 0x00000000, 0xc0ded006,
> +		0x80100061, 0x04054220, 0x00000000, 0x00000000,
>   		0x80000069, 0x04058220, 0x02000014, 0xc0ded000,
>   		0x80000061, 0x04150220, 0x00000064, 0x00000000,
>   		0x80001940, 0x04158220, 0x02000414, 0xc0ded001,
> @@ -53,11 +55,12 @@ struct iga64_template const iga64_code_media_block_write[] = {
>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 1250, .size = 56, .code = (const uint32_t []) {
> +	{ .gen_ver = 1250, .size = 60, .code = (const uint32_t []) {
>   		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
>   		0x80000061, 0x05254220, 0x00000000, 0xc0ded004,
>   		0x80000061, 0x05454220, 0x00000000, 0xc0ded005,
>   		0x80000061, 0x05654220, 0x00000000, 0xc0ded006,
> +		0x80040061, 0x04054220, 0x00000000, 0x00000000,
>   		0x80000069, 0x04058220, 0x02000024, 0xc0ded000,
>   		0x80000061, 0x04250220, 0x000000c4, 0x00000000,
>   		0x80001940, 0x04258220, 0x02000424, 0xc0ded001,
> @@ -69,11 +72,12 @@ struct iga64_template const iga64_code_media_block_write[] = {
>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 0, .size = 52, .code = (const uint32_t []) {
> +	{ .gen_ver = 0, .size = 56, .code = (const uint32_t []) {
>   		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
>   		0x80000061, 0x05254220, 0x00000000, 0xc0ded004,
>   		0x80000061, 0x05454220, 0x00000000, 0xc0ded005,
>   		0x80000061, 0x05654220, 0x00000000, 0xc0ded006,
> +		0x80040061, 0x04054220, 0x00000000, 0x00000000,
>   		0x80000069, 0x04058220, 0x02000024, 0xc0ded000,
>   		0x80000061, 0x04250220, 0x000000c4, 0x00000000,
>   		0x80000140, 0x04258220, 0x02000424, 0xc0ded001,
> diff --git a/lib/iga64_macros.h b/lib/iga64_macros.h
> index f4ef5cb16..03cc726d4 100644
> --- a/lib/iga64_macros.h
> +++ b/lib/iga64_macros.h
> @@ -7,7 +7,7 @@
>   #define IGA64_MACROS_H
>   
>   /* send instruction for DG2+ requires 0 length in case src1 is null, BSpec: 47443 */
> -#if GEN_VER < 1271
> +#if GEN_VER <= 1250
>   #define src1_null null
>   #else
>   #define src1_null null:0

