Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D94CD37AC
	for <igt-dev@archiver.kernel.org>; Mon, 11 May 2026 07:39:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EBF910E4E1;
	Mon, 11 May 2026 07:39:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V34tc/lO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E87110E4E1
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2026 07:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778485135; x=1810021135;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=tDHTSMNuT+JiI8+joU8UWtVCV1aLehvNSXWTAbMW5HY=;
 b=V34tc/lONLn4SfKoVagkuAysS/+PE85Jo9hpVi5IoqgQOuL0c8sTrNUc
 mJJS72MtyD0FAYcvysQYTOtnGofqD/KetMsfPBpiRm+4gXmOz1Qg+L0uN
 bgduLiA83SH0rLuC+W7jh3dsXB01OMKywNt6hF74UVUwjibu+NSRV2AfT
 yssEtuKRqkjwAsGy+PSrJhJjfdcH6AJ6HLLT0cxqDZKluawzgKMqRsiJM
 pMqycNyArCTT5k6T9tqZaOTUDnY1fiplTJtE/UpPthJ8R/0Z9Dn510CJ3
 enqRn88Xq0EVG/3mGCeca6qI28gD1MhPfIzzjPIQ1CCx6sH05VzcfI7Ni A==;
X-CSE-ConnectionGUID: EBwWlYoDRWCPZ3pJqYG1cQ==
X-CSE-MsgGUID: sRuTp7IOQfGDw/71Be3c3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="79349113"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="79349113"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 00:38:55 -0700
X-CSE-ConnectionGUID: V9SzLDxKSDeMG9EMcOlt+g==
X-CSE-MsgGUID: 6tA1QH8OSlyt3fCakoheeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="236523230"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.218])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 00:38:53 -0700
Date: Mon, 11 May 2026 09:38:51 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH 2/2] lib/gpgpu_shader: use raw strings in all asms
Message-ID: <2fczccdiew5pwzwzcyu4jxkunkntbvnio5ndsjtzmvsekycukm@373lfti5eswu>
References: <20260507-switch_asms_to_raw_strings-v1-0-487fa0f9ea2f@intel.com>
 <20260507-switch_asms_to_raw_strings-v1-2-487fa0f9ea2f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260507-switch_asms_to_raw_strings-v1-2-487fa0f9ea2f@intel.com>
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

On Thu, May 07, 2026 at 05:15:41PM +0200, Andrzej Hajda wrote:
> Raw strings are cleaner and more convenient.
> No changes in generated files (beside checksums)
> shows that this patch should not have functional impact.

Fully agree, R() looks much better:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>  lib/gpgpu_fill.c                                  |  86 ++--
>  lib/gpgpu_fill.c.gen.iga64_codes.c                |   2 +-
>  lib/gpgpu_shader.c                                | 492 +++++++++++-----------
>  lib/gpgpu_shader.c.gen.iga64_codes.c              |   2 +-
>  tests/intel/xe_prefetch_fault.c                   |  60 +--
>  tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c |   2 +-
>  6 files changed, 322 insertions(+), 322 deletions(-)
> 
> diff --git a/lib/gpgpu_fill.c b/lib/gpgpu_fill.c
> index d4d477fd81d5..ed13f6eb5781 100644
> --- a/lib/gpgpu_fill.c
> +++ b/lib/gpgpu_fill.c
> @@ -286,49 +286,49 @@ static struct gpgpu_shader *__xehp_gpgpu_kernel(int i915)
>  {
>  	struct gpgpu_shader *kernel = gpgpu_shader_create(i915);
>  
> -	emit_iga64_code(kernel, gpgpu_fill, "					\n\
> -// fill up r1 with target colour						\n\
> -mov (4|M0)		r1.0<1>:ub	r1.0<0;1,0>:ub				\n\
> -// prepare block x offset (Thread Group Id X * 16)				\n\
> -shl (1|M0)		r2.0<1>:ud	r0.1<0;1,0>:ud	0x4:ud			\n\
> -// prepare block y offset (Thread Group Id Y)					\n\
> -mov (1|M0)		r2.1<1>:ud	r0.6<0;1,0>:ud				\n\
> -// zero message header payload							\n\
> -mov (8|M0)		r4.0<1>:ud	0x0:ud					\n\
> -// fill up message payload with target colour					\n\
> -mov (16|M0)		r5.0<1>:ud	r1.0<0;1,0>:ud				\n\
> -#if GEN_VER < 2000								\n\
> -// load block offsets into message header payload				\n\
> -mov (2|M0)		r4.0<1>:ud	r2.0<2;2,1>:ud				\n\
> -// load block width								\n\
> -mov (1|M0)		r4.2<1>:ud	0xF:ud					\n\
> -// load FFTID from R0 header							\n\
> -mov (1|M0)		r4.4<1>:ud	r0.5<0;1,0>:ud				\n\
> -// Media block write to bti[0] surface						\n\
> -// Message Descriptor								\n\
> -//	0x40A8000:								\n\
> -//	[28:25]		Mlen: 2							\n\
> -//	[24:20]		Rlen: 0							\n\
> -//	[19]		Header: 1 (included)					\n\
> -//	[18:14]		MessageType: 0xA (media block write)			\n\
> -//	[7:0]		BTI: 0							\n\
> -send.dc1 (16|M0)	null	r4	src1_null	0x0	0x40A8000	\n\
> -#else										\n\
> -// load block offsets into message header payload				\n\
> -mov (2|M0)		r4.5<1>:ud	r2.0<2;2,1>:ud				\n\
> -// load block width								\n\
> -mov (1|M0)		 r4.14<1>:w	0xF:w					\n\
> -// Typed 2D block store to bti[0] surface					\n\
> -// Message Descriptor								\n\
> -//	0x6400007:								\n\
> -//	[30:29]		AddrType: 3 (BTI)					\n\
> -//	[28:25]		Mlen: 2							\n\
> -//	[24:20]		Rlen: 0							\n\
> -//	[19:17]		Caching: 0  (use state settings for both L1 and L3)	\n\
> -//	[5:0]		Opcode: 0x07  (store_block2d)				\n\
> -send.tgm (16|M0)	null	r4	null	0x0	0x64000007		\n\
> -#endif										\n\
> -	");
> +	emit_iga64_code(kernel, gpgpu_fill, R"(
> +// fill up r1 with target colour
> +mov (4|M0)		r1.0<1>:ub	r1.0<0;1,0>:ub
> +// prepare block x offset (Thread Group Id X * 16)
> +shl (1|M0)		r2.0<1>:ud	r0.1<0;1,0>:ud	0x4:ud
> +// prepare block y offset (Thread Group Id Y)
> +mov (1|M0)		r2.1<1>:ud	r0.6<0;1,0>:ud
> +// zero message header payload
> +mov (8|M0)		r4.0<1>:ud	0x0:ud
> +// fill up message payload with target colour
> +mov (16|M0)		r5.0<1>:ud	r1.0<0;1,0>:ud
> +#if GEN_VER < 2000
> +// load block offsets into message header payload
> +mov (2|M0)		r4.0<1>:ud	r2.0<2;2,1>:ud
> +// load block width
> +mov (1|M0)		r4.2<1>:ud	0xF:ud
> +// load FFTID from R0 header
> +mov (1|M0)		r4.4<1>:ud	r0.5<0;1,0>:ud
> +// Media block write to bti[0] surface
> +// Message Descriptor
> +//	0x40A8000:
> +//	[28:25]		Mlen: 2
> +//	[24:20]		Rlen: 0
> +//	[19]		Header: 1 (included)
> +//	[18:14]		MessageType: 0xA (media block write)
> +//	[7:0]		BTI: 0
> +send.dc1 (16|M0)	null	r4	src1_null	0x0	0x40A8000
> +#else
> +// load block offsets into message header payload
> +mov (2|M0)		r4.5<1>:ud	r2.0<2;2,1>:ud
> +// load block width
> +mov (1|M0)		 r4.14<1>:w	0xF:w
> +// Typed 2D block store to bti[0] surface
> +// Message Descriptor
> +//	0x6400007:
> +//	[30:29]		AddrType: 3 (BTI)
> +//	[28:25]		Mlen: 2
> +//	[24:20]		Rlen: 0
> +//	[19:17]		Caching: 0  (use state settings for both L1 and L3)
> +//	[5:0]		Opcode: 0x07  (store_block2d)
> +send.tgm (16|M0)	null	r4	null	0x0	0x64000007
> +#endif
> +	)");
>  	gpgpu_shader__eot(kernel);
>  	return kernel;
>  }
> diff --git a/lib/gpgpu_fill.c.gen.iga64_codes.c b/lib/gpgpu_fill.c.gen.iga64_codes.c
> index 8c61ce998497..7745a0ffe4e3 100644
> --- a/lib/gpgpu_fill.c.gen.iga64_codes.c
> +++ b/lib/gpgpu_fill.c.gen.iga64_codes.c
> @@ -3,7 +3,7 @@
>  
>  #include "gpgpu_shader.h"
>  
> -#define MD5_SUM_IGA64_ASMS a2e53c9b23d1d1bcb0e2271f8b47c7c7
> +#define MD5_SUM_IGA64_ASMS 3110292a24d751e5ae12a5bf30c8bf8b
>  
>  struct iga64_template const iga64_code_xe3p_gpgpu_fill[] = {
>  	{ .gen_ver = 3500, .size = 144, .code = (const uint32_t []) {
> diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
> index ccab4d4b0fd6..dbaa9a459454 100644
> --- a/lib/gpgpu_shader.c
> +++ b/lib/gpgpu_shader.c
> @@ -563,9 +563,9 @@ void gpgpu_shader__breakpoint(struct gpgpu_shader *shdr)
>   */
>  void gpgpu_shader__wait(struct gpgpu_shader *shdr)
>  {
> -	emit_iga64_code(shdr, sync_host, "	\n\
> -(W)	sync.host	        null		\n\
> -	");
> +	emit_iga64_code(shdr, sync_host, R"(
> +(W)	sync.host	        null
> +	)");
>  }
>  
>  /**
> @@ -576,9 +576,9 @@ void gpgpu_shader__wait(struct gpgpu_shader *shdr)
>   */
>  void gpgpu_shader__nop(struct gpgpu_shader *shdr)
>  {
> -	emit_iga64_code(shdr, nop, "	\n\
> -(W)	nop				\n\
> -	");
> +	emit_iga64_code(shdr, nop, R"(
> +(W)	nop
> +	)");
>  }
>  
>  /**
> @@ -590,23 +590,23 @@ void gpgpu_shader__nop(struct gpgpu_shader *shdr)
>  void gpgpu_shader__eot(struct gpgpu_shader *shdr)
>  {
>  	if (shdr->vrt == VRT_96)
> -		emit_iga64_code(shdr, eot_vrt, "				\n\
> -(W)	mov (8|M0)               r80.0<1>:ud  r0.0<8;8,1>:ud			\n\
> -(W)	send.gtwy (8|M0)         null r80 src1_null     0 0x02000000 {EOT}	\n\
> -		");
> +		emit_iga64_code(shdr, eot_vrt, R"(
> +(W)	mov (8|M0)               r80.0<1>:ud  r0.0<8;8,1>:ud
> +(W)	send.gtwy (8|M0)         null r80 src1_null     0 0x02000000 {EOT}
> +		)");
>  	else
> -		emit_iga64_code(shdr, eot, "					\n\
> -(W)	mov (8|M0)               r112.0<1>:ud  r0.0<8;8,1>:ud			\n\
> -#if GEN_VER < 1250								\n\
> -(W)	send.ts (16|M0)          null r112 null 0x10000000 0x02000010 {EOT,@1}	\n\
> -										\n\
> -#elif GEN_VER <= 3000								\n\
> -(W)	send.gtwy (8|M0)         null r112 src1_null     0 0x02000000 {EOT}	\n\
> -										\n\
> -#else										\n\
> -(W)	sendg.gtwy (1|M0)        null     r0:1  null:0  0x0 {EOT}		\n\
> -#endif										\n\
> -		");
> +		emit_iga64_code(shdr, eot, R"(
> +(W)	mov (8|M0)               r112.0<1>:ud  r0.0<8;8,1>:ud
> +#if GEN_VER < 1250
> +(W)	send.ts (16|M0)          null r112 null 0x10000000 0x02000010 {EOT,@1}
> +
> +#elif GEN_VER <= 3000
> +(W)	send.gtwy (8|M0)         null r112 src1_null     0 0x02000000 {EOT}
> +
> +#else
> +(W)	sendg.gtwy (1|M0)        null     r0:1  null:0  0x0 {EOT}
> +#endif
> +		)");
>  }
>  
>  /**
> @@ -662,10 +662,10 @@ void gpgpu_shader__jump(struct gpgpu_shader *shdr, int label_id)
>  {
>  	size_t shader_size;
>  
> -	shader_size = emit_iga64_code(shdr, jump, "	\n\
> -L0:							\n\
> -(W)	jmpi        L0					\n\
> -	");
> +	shader_size = emit_iga64_code(shdr, jump, R"(
> +L0:
> +(W)	jmpi        L0
> +	)");
>  
>  	__patch_indexed_jump(shdr, label_id, shader_size);
>  }
> @@ -685,15 +685,15 @@ void gpgpu_shader__jump_neq(struct gpgpu_shader *shdr, int label_id,
>  {
>  	uint32_t size;
>  
> -	size = emit_iga64_code(shdr, jump_dw_neq, "					\n\
> -L0:											\n\
> -		SET_SHARED_SPACE_ADDR(r30, ARG(0):ud, 4)				\n\
> -(W)		LOAD_SPACE_DW(r31, r30)							\n\
> -	// clear the flag register							\n\
> -(W)		mov (1|M0)               f0.0<1>:ud    0x0:ud				\n\
> -(W)		cmp (1|M0)    (ne)f0.0   null<1>:ud     r31.0<0;1,0>:ud   ARG(1):ud	\n\
> -(W&f0.0)	jmpi                     L0						\n\
> -	", y_offset, value);
> +	size = emit_iga64_code(shdr, jump_dw_neq, R"(
> +L0:
> +		SET_SHARED_SPACE_ADDR(r30, ARG(0):ud, 4)
> +(W)		LOAD_SPACE_DW(r31, r30)
> +	// clear the flag register
> +(W)		mov (1|M0)               f0.0<1>:ud    0x0:ud
> +(W)		cmp (1|M0)    (ne)f0.0   null<1>:ud     r31.0<0;1,0>:ud   ARG(1):ud
> +(W&f0.0)	jmpi                     L0
> +	)", y_offset, value);
>  
>  	__patch_indexed_jump(shdr, label_id, size);
>  }
> @@ -710,10 +710,10 @@ L0:											\n\
>   */
>  void gpgpu_shader__loop_begin(struct gpgpu_shader *shdr, int label_id)
>  {
> -	emit_iga64_code(shdr, clear_r40, "		\n\
> -L0:							\n\
> -(W)	mov (1|M0)               r40:ud    0x0:ud	\n\
> -	");
> +	emit_iga64_code(shdr, clear_r40, R"(
> +L0:
> +(W)	mov (1|M0)               r40:ud    0x0:ud
> +	)");
>  
>  	gpgpu_shader__label(shdr, label_id);
>  }
> @@ -730,13 +730,13 @@ void gpgpu_shader__loop_end(struct gpgpu_shader *shdr, int label_id, uint32_t it
>  {
>  	uint32_t size;
>  
> -	size = emit_iga64_code(shdr, inc_r40_jump_neq, "				\n\
> -L0:											\n\
> -(W)		add (1|M0)              r40:ud          r40.0<0;1,0>:ud 0x1:ud		\n\
> -(W)		mov (1|M0)              f0.0<1>:ud      0x0:ud				\n\
> -(W)		cmp (1|M0)    (ne)f0.0   null<1>:ud     r40.0<0;1,0>:ud   ARG(0):ud	\n\
> -(W&f0.0)	jmpi                     L0						\n\
> -	", iter);
> +	size = emit_iga64_code(shdr, inc_r40_jump_neq, R"(
> +L0:
> +(W)		add (1|M0)              r40:ud          r40.0<0;1,0>:ud 0x1:ud
> +(W)		mov (1|M0)              f0.0<1>:ud      0x0:ud
> +(W)		cmp (1|M0)    (ne)f0.0   null<1>:ud     r40.0<0;1,0>:ud   ARG(0):ud
> +(W&f0.0)	jmpi                     L0
> +	)", iter);
>  
>  	__patch_indexed_jump(shdr, label_id, size);
>  }
> @@ -752,15 +752,15 @@ L0:											\n\
>  void gpgpu_shader__common_target_write(struct gpgpu_shader *shdr,
>  				       uint32_t y_offset, const uint32_t value[4])
>  {
> -	emit_iga64_code(shdr, common_target_write, "				\n\
> -(W)	mov (16|M0)		r31.0<1>:ud	0x0:ud				\n\
> -(W)	mov (1|M0)		r31.0<1>:ud	ARG(1):ud			\n\
> -(W)	mov (1|M0)		r31.1<1>:ud	ARG(2):ud			\n\
> -(W)	mov (1|M0)		r31.2<1>:ud	ARG(3):ud			\n\
> -(W)	mov (1|M0)		r31.3<1>:ud	ARG(4):ud			\n\
> -	SET_SHARED_SPACE_ADDR(r30, ARG(0):ud, 16)				\n\
> -(W)	STORE_SPACE_DW(r30, r31)						\n\
> -	", y_offset, value[0], value[1], value[2], value[3]);
> +	emit_iga64_code(shdr, common_target_write, R"(
> +(W)	mov (16|M0)		r31.0<1>:ud	0x0:ud
> +(W)	mov (1|M0)		r31.0<1>:ud	ARG(1):ud
> +(W)	mov (1|M0)		r31.1<1>:ud	ARG(2):ud
> +(W)	mov (1|M0)		r31.2<1>:ud	ARG(3):ud
> +(W)	mov (1|M0)		r31.3<1>:ud	ARG(4):ud
> +	SET_SHARED_SPACE_ADDR(r30, ARG(0):ud, 16)
> +(W)	STORE_SPACE_DW(r30, r31)
> +	)", y_offset, value[0], value[1], value[2], value[3]);
>  }
>  
>  /**
> @@ -789,12 +789,12 @@ void gpgpu_shader__common_target_write_u32(struct gpgpu_shader *shdr,
>   */
>  void gpgpu_shader__write_aip(struct gpgpu_shader *shdr, uint32_t y_offset)
>  {
> -	emit_iga64_code(shdr, media_block_write_aip, "				\n\
> -	// Payload								\n\
> -(W)	mov (1|M0)               r5.0<1>:ud    cr0.2:ud				\n\
> -	SET_THREAD_SPACE_ADDR(r4, 0, ARG(0):ud, 4)				\n\
> -(W)	STORE_SPACE_DW(r4, r5)							\n\
> -	", y_offset);
> +	emit_iga64_code(shdr, media_block_write_aip, R"(
> +	// Payload
> +(W)	mov (1|M0)               r5.0<1>:ud    cr0.2:ud
> +	SET_THREAD_SPACE_ADDR(r4, 0, ARG(0):ud, 4)
> +(W)	STORE_SPACE_DW(r4, r5)
> +	)", y_offset);
>  }
>  
>  /**
> @@ -806,9 +806,9 @@ void gpgpu_shader__write_aip(struct gpgpu_shader *shdr, uint32_t y_offset)
>   */
>  void gpgpu_shader__increase_aip(struct gpgpu_shader *shdr, uint32_t value)
>  {
> -	emit_iga64_code(shdr, write_aip, "					\n\
> -(W)	add (1|M0)		cr0.2:ud	cr0.2:ud	ARG(0):ud	\n\
> -	", value);
> +	emit_iga64_code(shdr, write_aip, R"(
> +(W)	add (1|M0)		cr0.2:ud	cr0.2:ud	ARG(0):ud
> +	)", value);
>  }
>  
>  /**
> @@ -822,11 +822,11 @@ void gpgpu_shader__increase_aip(struct gpgpu_shader *shdr, uint32_t value)
>  void gpgpu_shader__write_dword(struct gpgpu_shader *shdr, uint32_t value,
>  			       uint32_t y_offset)
>  {
> -	emit_iga64_code(shdr, media_block_write, "		\n\
> -(W)	mov (1)		r5.0<1>:ud    ARG(1):ud			\n\
> -	SET_THREAD_SPACE_ADDR(r4, 0, ARG(0):ud, 4)		\n\
> -(W)	STORE_SPACE_DW(r4, r5)					\n\
> -	", y_offset, value);
> +	emit_iga64_code(shdr, media_block_write, R"(
> +(W)	mov (1)		r5.0<1>:ud    ARG(1):ud
> +	SET_THREAD_SPACE_ADDR(r4, 0, ARG(0):ud, 4)
> +(W)	STORE_SPACE_DW(r4, r5)
> +	)", y_offset, value);
>  }
>  
>  /**
> @@ -838,9 +838,9 @@ void gpgpu_shader__write_dword(struct gpgpu_shader *shdr, uint32_t value,
>   */
>  void gpgpu_shader__clear_exception(struct gpgpu_shader *shdr, uint32_t value)
>  {
> -	emit_iga64_code(shdr, clear_exception, "		\n\
> -(W)	and (1|M0) cr0.1<1>:ud cr0.1<0;1,0>:ud ARG(0):ud	\n\
> -	", ~value);
> +	emit_iga64_code(shdr, clear_exception, R"(
> +(W)	and (1|M0) cr0.1<1>:ud cr0.1<0;1,0>:ud ARG(0):ud
> +	)", ~value);
>  }
>  
>  /**
> @@ -852,9 +852,9 @@ void gpgpu_shader__clear_exception(struct gpgpu_shader *shdr, uint32_t value)
>   */
>  void gpgpu_shader__set_exception(struct gpgpu_shader *shdr, uint32_t value)
>  {
> -	emit_iga64_code(shdr, set_exception, "		\n\
> -(W)	or (1|M0) cr0.1<1>:ud cr0.1<0;1,0>:ud ARG(0):ud	\n\
> -	", value);
> +	emit_iga64_code(shdr, set_exception, R"(
> +(W)	or (1|M0) cr0.1<1>:ud cr0.1<0;1,0>:ud ARG(0):ud
> +	)", value);
>  }
>  
>  /**
> @@ -873,15 +873,15 @@ void gpgpu_shader__set_exception(struct gpgpu_shader *shdr, uint32_t value)
>  void gpgpu_shader__write_on_exception(struct gpgpu_shader *shdr, uint32_t value, uint32_t x_offset,
>  				      uint32_t y_offset, uint32_t mask, uint32_t expected)
>  {
> -	emit_iga64_code(shdr, write_on_exception, "					\n\
> -(W)	mov (1|M0)		r5.0<1>:ud	ARG(2):ud				\n\
> -	SET_THREAD_SPACE_ADDR(r4, ARG(0), ARG(1):ud, 4)				\n\
> -	// Check if masked exception is equal to provided value and write conditionally \n\
> -(W)     and (1|M0)		r3.0<1>:ud     cr0.1<0;1,0>:ud ARG(3):ud		\n\
> -(W)     mov (1|M0)		f0.0<1>:ud     0x0:ud					\n\
> -(W)     cmp (1|M0) (eq)f0.0	null:ud        r3.0<0;1,0>:ud  ARG(4):ud		\n\
> -(W&f0.0) STORE_SPACE_DW(r4, r5)								\n\
> -	", 4 * x_offset, y_offset, value, mask, expected);
> +	emit_iga64_code(shdr, write_on_exception, R"(
> +(W)	mov (1|M0)		r5.0<1>:ud	ARG(2):ud
> +	SET_THREAD_SPACE_ADDR(r4, ARG(0), ARG(1):ud, 4)
> +	// Check if masked exception is equal to provided value and write conditionally
> +(W)     and (1|M0)		r3.0<1>:ud     cr0.1<0;1,0>:ud ARG(3):ud
> +(W)     mov (1|M0)		f0.0<1>:ud     0x0:ud
> +(W)     cmp (1|M0) (eq)f0.0	null:ud        r3.0<0;1,0>:ud  ARG(4):ud
> +(W&f0.0) STORE_SPACE_DW(r4, r5)
> +	)", 4 * x_offset, y_offset, value, mask, expected);
>  }
>  
>  /**
> @@ -900,15 +900,15 @@ void gpgpu_shader__end_system_routine(struct gpgpu_shader *shdr,
>  	 * when sip was invoked by a breakpoint
>  	 */
>  	if (breakpoint_suppress)
> -		emit_iga64_code(shdr, breakpoint_suppress, "			\n\
> -(W)	or  (1|M0)               cr0.0<1>:ud   cr0.0<0;1,0>:ud   0x8000:ud	\n\
> -		");
> -
> -	emit_iga64_code(shdr, end_system_routine, "				\n\
> -(W)	and (1|M0)               cr0.1<1>:ud   cr0.1<0;1,0>:ud   ARG(0):ud	\n\
> -	// return to an application						\n\
> -(W)	and (1|M0)               cr0.0<1>:ud   cr0.0<0;1,0>:ud   0x7FFFFFFD:ud	\n\
> -	", 0x7fffff | (1 << 26)); /* clear all exceptions, except read only bit */
> +		emit_iga64_code(shdr, breakpoint_suppress, R"(
> +(W)	or  (1|M0)               cr0.0<1>:ud   cr0.0<0;1,0>:ud   0x8000:ud
> +		)");
> +
> +	emit_iga64_code(shdr, end_system_routine, R"(
> +(W)	and (1|M0)               cr0.1<1>:ud   cr0.1<0;1,0>:ud   ARG(0):ud
> +	// return to an application
> +(W)	and (1|M0)               cr0.0<1>:ud   cr0.0<0;1,0>:ud   0x7FFFFFFD:ud
> +	)", 0x7fffff | (1 << 26)); /* clear all exceptions, except read only bit */
>  }
>  
>  /**
> @@ -925,18 +925,18 @@ void gpgpu_shader__end_system_routine_step_if_eq(struct gpgpu_shader *shdr,
>  						 uint32_t y_offset,
>  						 uint32_t value)
>  {
> -	emit_iga64_code(shdr, end_system_routine_step_if_eq, "				\n\
> -(W)		or  (1|M0)               cr0.0<1>:ud   cr0.0<0;1,0>:ud   0x8000:ud	\n\
> -(W)		and (1|M0)               cr0.1<1>:ud   cr0.1<0;1,0>:ud   ARG(0):ud	\n\
> -		SET_SHARED_SPACE_ADDR(r30, ARG(0):ud, 4)				\n\
> -(W)		LOAD_SPACE_DW(r31, r30)							\n\
> -		// clear the flag register						\n\
> -(W)		mov (1|M0)               f0.0<1>:ud    0x0:ud				\n\
> -(W)		cmp (1|M0)    (ne)f0.0   null<1>:ud     r31.0<0;1,0>:ud   ARG(2):ud	\n\
> -(W&f0.0)	and (1|M0)              cr0.1<1>:ud     cr0.1<0;1,0>:ud   ARG(3):ud	\n\
> -		// return to an application						\n\
> -(W)		and (1|M0)               cr0.0<1>:ud   cr0.0<0;1,0>:ud   0x7FFFFFFD:ud	\n\
> -	", 0x807fffff, /* leave breakpoint exception */
> +	emit_iga64_code(shdr, end_system_routine_step_if_eq, R"(
> +(W)		or  (1|M0)               cr0.0<1>:ud   cr0.0<0;1,0>:ud   0x8000:ud
> +(W)		and (1|M0)               cr0.1<1>:ud   cr0.1<0;1,0>:ud   ARG(0):ud
> +		SET_SHARED_SPACE_ADDR(r30, ARG(0):ud, 4)
> +(W)		LOAD_SPACE_DW(r31, r30)
> +		// clear the flag register
> +(W)		mov (1|M0)               f0.0<1>:ud    0x0:ud
> +(W)		cmp (1|M0)    (ne)f0.0   null<1>:ud     r31.0<0;1,0>:ud   ARG(2):ud
> +(W&f0.0)	and (1|M0)              cr0.1<1>:ud     cr0.1<0;1,0>:ud   ARG(3):ud
> +		// return to an application
> +(W)		and (1|M0)               cr0.0<1>:ud   cr0.0<0;1,0>:ud   0x7FFFFFFD:ud
> +	)", 0x807fffff, /* leave breakpoint exception */
>  	y_offset, value, 0x7fffff /* clear all exceptions */ );
>  }
>  
> @@ -958,76 +958,76 @@ void gpgpu_shader__write_a64_d32(struct gpgpu_shader *shdr, uint64_t ppgtt_addr,
>  	uint64_t addr = CANONICAL(ppgtt_addr);
>  	igt_assert_f((addr & 0x3) == 0, "address must be aligned to DWord!\n");
>  
> -	emit_iga64_code(shdr, write_a64_d32, "					\n\
> -#if GEN_VER >= 2000								\n\
> -// Unyped 2D Block Store							\n\
> -// Instruction_Store2DBlock							\n\
> -// bspec: 63981									\n\
> -// src0 address payload (Untyped2DBLOCKAddressPayload) specifies both		\n\
> -//	the block parameters and the 2D Surface parameters.			\n\
> -// src1 data payload format is selected by Data Size.				\n\
> -// Untyped2DBLOCKAddressPayload							\n\
> -// bspec: 63986									\n\
> -// [243:240] Array Length: 0 (length is 1)					\n\
> -// [239:232] Block Height: 0 (height is 1)					\n\
> -// [231:224] Block Width: 0x3 (width is 4 bytes)				\n\
> -// [223:192] Block Start Y: 0							\n\
> -// [191:160] Block Start X: 0							\n\
> -// [159:128] Untyped 2D Surface Pitch: 0x3f (pitch is 64 bytes)			\n\
> -// [127:96] Untyped 2D Surface Height: 0 (height is 1)				\n\
> -// [95:64] Untyped 2D Surface Width: 0x3f (width is 64 bytes)			\n\
> -// [63:0] Untyped 2D Surface Base Address					\n\
> -// initialize register								\n\
> -(W)	mov (8)			r30.0<1>:uq	0x0:uq				\n\
> -// [31:0] Untyped 2D Surface Base Address low					\n\
> -(W)	mov (1)			r30.0<1>:ud	ARG(0):ud			\n\
> -// [63:32] Untyped 2D Surface Base Address high					\n\
> -(W)	mov (1)			r30.1<1>:ud ARG(1):ud				\n\
> -// [95:64] Untyped 2D Surface Width: 0x3f					\n\
> -//	   (Width minus 1 (in bytes) of the 2D surface, it represents 64)	\n\
> -(W)	mov (1) 		r30.2<1>:ud	0x3f:ud				\n\
> -// [159:128] Untyped 2D Surface Pitch: 0x3f					\n\
> -//	     (Pitch minus 1 (in bytes) of the 2D surface, it represents 64)	\n\
> -(W)	mov (1)			r30.4<1>:ud	0x3f:ud				\n\
> -// [231:224] Block Width: 0x3 (4 bytes)						\n\
> -//	     (Specifies the width minus 1 (in number of data elements) for this	\n\
> -//	     rectangular region, it represents 4)				\n\
> -// Block width (encoded_value + 1) must be a multiple of DW (4 bytes).		\n\
> -// [239:232] Block Height: 0							\n\
> -//	     (Specifies the height minus 1 (in number of data elements) for	\n\
> -//	     this rectangular region, it represents 1)				\n\
> -// [243:240] Array Length: 0							\n\
> -//	     (Specifies Array Length minus 1 for Load2DBlockArray messages,	\n\
> -//	     must be zero for 2D Block Store messages, it represents 1)		\n\
> -(W)	mov (1)			r30.7<1>:ud	0x3:ud				\n\
> -// src1 data payload size							\n\
> -// Block Height x Block Width x Data size / GRF Register size			\n\
> -//	=> 1 x 16 x 32bit / 512bit = 1						\n\
> -// data payload size is 1							\n\
> -(W)	mov (8)			r31.0<1>:uq	0x0:uq				\n\
> -(W)	mov (1|M0)		r31.0<1>:ud 	ARG(2):ud			\n\
> -// send.ugm Untyped 2D Block Array Store					\n\
> -// Format: send.ugm (1) dst src0 src1 ExtMsg MsgDesc				\n\
> -// Execution Mask restriction: SIMT1						\n\
> -//										\n\
> -// Extended Message Descriptor (Dataport Extended Descriptor Imm 2D Block)	\n\
> -// bspec: 67780									\n\
> -// 0x0 =>									\n\
> -// [32:22] Global Y_offset: 0							\n\
> -// [21:12] Global X_offset: 0							\n\
> -//										\n\
> -// Message Descriptor								\n\
> -// bspec: 63981									\n\
> -// 0x2020407 =>									\n\
> -// [30:29] Address Type: 0 (FLAT)						\n\
> -// [28:25] Src0 Length: 1							\n\
> -// [24:20] Dest Length: 0							\n\
> -// [19:16] Cache : 2 (L1UC_L3UC)						\n\
> -// [11:9] Data Size: 2 (D32)							\n\
> -// [5:0] Store Operation: 7							\n\
> -(W)	send.ugm (1)		null	r30	r31:1	0x0	0x2020407	\n\
> -#endif										\n\
> -	", lower_32_bits(addr), upper_32_bits(addr), value);
> +	emit_iga64_code(shdr, write_a64_d32, R"(
> +#if GEN_VER >= 2000
> +// Unyped 2D Block Store
> +// Instruction_Store2DBlock
> +// bspec: 63981
> +// src0 address payload (Untyped2DBLOCKAddressPayload) specifies both
> +//	the block parameters and the 2D Surface parameters.
> +// src1 data payload format is selected by Data Size.
> +// Untyped2DBLOCKAddressPayload
> +// bspec: 63986
> +// [243:240] Array Length: 0 (length is 1)
> +// [239:232] Block Height: 0 (height is 1)
> +// [231:224] Block Width: 0x3 (width is 4 bytes)
> +// [223:192] Block Start Y: 0
> +// [191:160] Block Start X: 0
> +// [159:128] Untyped 2D Surface Pitch: 0x3f (pitch is 64 bytes)
> +// [127:96] Untyped 2D Surface Height: 0 (height is 1)
> +// [95:64] Untyped 2D Surface Width: 0x3f (width is 64 bytes)
> +// [63:0] Untyped 2D Surface Base Address
> +// initialize register
> +(W)	mov (8)			r30.0<1>:uq	0x0:uq
> +// [31:0] Untyped 2D Surface Base Address low
> +(W)	mov (1)			r30.0<1>:ud	ARG(0):ud
> +// [63:32] Untyped 2D Surface Base Address high
> +(W)	mov (1)			r30.1<1>:ud ARG(1):ud
> +// [95:64] Untyped 2D Surface Width: 0x3f
> +//	   (Width minus 1 (in bytes) of the 2D surface, it represents 64)
> +(W)	mov (1)			r30.2<1>:ud	0x3f:ud
> +// [159:128] Untyped 2D Surface Pitch: 0x3f
> +//	     (Pitch minus 1 (in bytes) of the 2D surface, it represents 64)
> +(W)	mov (1)			r30.4<1>:ud	0x3f:ud
> +// [231:224] Block Width: 0x3 (4 bytes)
> +//	     (Specifies the width minus 1 (in number of data elements) for this
> +//	     rectangular region, it represents 4)
> +// Block width (encoded_value + 1) must be a multiple of DW (4 bytes).
> +// [239:232] Block Height: 0
> +//	     (Specifies the height minus 1 (in number of data elements) for
> +//	     this rectangular region, it represents 1)
> +// [243:240] Array Length: 0
> +//	     (Specifies Array Length minus 1 for Load2DBlockArray messages,
> +//	     must be zero for 2D Block Store messages, it represents 1)
> +(W)	mov (1)			r30.7<1>:ud	0x3:ud
> +// src1 data payload size
> +// Block Height x Block Width x Data size / GRF Register size
> +//	=> 1 x 16 x 32bit / 512bit = 1
> +// data payload size is 1
> +(W)	mov (8)			r31.0<1>:uq	0x0:uq
> +(W)	mov (1|M0)		r31.0<1>:ud	ARG(2):ud
> +// send.ugm Untyped 2D Block Array Store
> +// Format: send.ugm (1) dst src0 src1 ExtMsg MsgDesc
> +// Execution Mask restriction: SIMT1
> +//
> +// Extended Message Descriptor (Dataport Extended Descriptor Imm 2D Block)
> +// bspec: 67780
> +// 0x0 =>
> +// [32:22] Global Y_offset: 0
> +// [21:12] Global X_offset: 0
> +//
> +// Message Descriptor
> +// bspec: 63981
> +// 0x2020407 =>
> +// [30:29] Address Type: 0 (FLAT)
> +// [28:25] Src0 Length: 1
> +// [24:20] Dest Length: 0
> +// [19:16] Cache : 2 (L1UC_L3UC)
> +// [11:9] Data Size: 2 (D32)
> +// [5:0] Store Operation: 7
> +(W)	send.ugm (1)		null	r30	r31:1	0x0	0x2020407
> +#endif
> +	)", lower_32_bits(addr), upper_32_bits(addr), value);
>  }
>  
>  /**
> @@ -1047,75 +1047,75 @@ void gpgpu_shader__read_a64_d32(struct gpgpu_shader *shdr, uint64_t ppgtt_addr)
>  
>  	igt_assert_f((addr & 0x3) == 0, "address must be aligned to DWord!\n");
>  
> -	emit_iga64_code(shdr, read_a64_d32, "					\n\
> -#if GEN_VER >= 2000								\n\
> -// Unyped 2D Block Array Load 							\n\
> -// Instruction_Load2DBlockArray							\n\
> -// bspec: 63972									\n\
> -// src0 address payload (Untyped2DBLOCKAddressPayload) specifies both		\n\
> -//	the block parameters and the 2D Surface parameters.			\n\
> -// Untyped2DBLOCKAddressPayload							\n\
> -// bspec: 63986									\n\
> -// [243:240] Array Length: 0 (length is 1)					\n\
> -// [239:232] Block Height: 0 (height is 1)					\n\
> -// [231:224] Block Width: 0x3 (width is 4 bytes)				\n\
> -// [223:192] Block Start Y: 0							\n\
> -// [191:160] Block Start X: 0							\n\
> -// [159:128] Untyped 2D Surface Pitch: 0x3f (pitch is 64 bytes)			\n\
> -// [127:96] Untyped 2D Surface Height: 0 (height is 1)				\n\
> -// [95:64] Untyped 2D Surface Width: 0x3f (width is 64 bytes)			\n\
> -// [63:0] Untyped 2D Surface Base Address					\n\
> -// initialize register								\n\
> -(W)	mov (8)			r30.0<1>:uq	0x0:uq				\n\
> -// [31:0] Untyped 2D Surface Base Address low					\n\
> -(W)	mov (1)			r30.0<1>:ud	ARG(0):ud			\n\
> -// [63:32] Untyped 2D Surface Base Address high					\n\
> -(W)	mov (1)			r30.1<1>:ud ARG(1):ud				\n\
> -// [95:64] Untyped 2D Surface Width: 0x3f					\n\
> -//	   (Width minus 1 (in bytes) of the 2D surface, it represents 64)	\n\
> -(W)	mov (1) 		r30.2<1>:ud	0x3f:ud				\n\
> -// [159:128] Untyped 2D Surface Pitch: 0x3f					\n\
> -//	     (Pitch minus 1 (in bytes) of the 2D surface, it represents 64)	\n\
> -(W)	mov (1)			r30.4<1>:ud	0x3f:ud				\n\
> -// [231:224] Block Width: 0x3 (4 bytes)						\n\
> -//	     (Specifies the width minus 1 (in number of data elements) for this	\n\
> -//	     rectangular region, it represents 4)				\n\
> -// Block width (encoded_value + 1) must be a multiple of DW (4 bytes).		\n\
> -// [239:232] Block Height: 0							\n\
> -//	     (Specifies the height minus 1 (in number of data elements) for	\n\
> -//	     this rectangular region, it represents 1)				\n\
> -// [243:240] Array Length: 0							\n\
> -//	     (Specifies Array Length minus 1 for Load2DBlockArray messages,	\n\
> -//	     must be zero for 2D Block Store messages, it represents 1)		\n\
> -(W)	mov (1)			r30.7<1>:ud	0x3:ud				\n\
> -//										\n\
> -// dest data payload format is selected by Data Size.				\n\
> -// Block Height x Block Width x Data size / GRF Register size			\n\
> -//	=> 1 x 16 x 32bit / 512bit = 1						\n\
> -// data payload format size is 1 GRF Register.					\n\
> -//										\n\
> -// send.ugm Untyped 2D Block Array Load						\n\
> -// Format: send.ugm (1) dst src0 src1 ExtMsg MsgDesc				\n\
> -// Execution Mask restriction: SIMT1						\n\
> -//										\n\
> -// Extended Message Descriptor (Dataport Extended Descriptor Imm 2D Block)	\n\
> -// bspec: 67780									\n\
> -// 0x0 =>									\n\
> -// [32:22] Global Y_offset: 0							\n\
> -// [21:12] Global X_offset: 0							\n\
> -//										\n\
> -// Message Descriptor								\n\
> -// bspec: 63972									\n\
> -// 0x2128403 =>									\n\
> -// [30:29] Address Type: 0 (FLAT)						\n\
> -// [28:25] Src0 Length: 1							\n\
> -// [24:20] Dest Length: 1							\n\
> -// [19:16] Cache : 2 (L1UC_L3UC) 10						\n\
> -// [15] Transpose Block: 1							\n\
> -// [11:9] Data Size: 2 (D32) 10							\n\
> -// [7] VNNI Transform: 0							\n\
> -// [5:0] Load Operation: 3 (Load 2D Block) 11					\n\
> -(W)	send.ugm (1)		r31	r30	null	0x0	0x2128403	\n\
> -#endif										\n\
> -	", lower_32_bits(addr), upper_32_bits(addr));
> +	emit_iga64_code(shdr, read_a64_d32, R"(
> +#if GEN_VER >= 2000
> +// Unyped 2D Block Array Load
> +// Instruction_Load2DBlockArray
> +// bspec: 63972
> +// src0 address payload (Untyped2DBLOCKAddressPayload) specifies both
> +//	the block parameters and the 2D Surface parameters.
> +// Untyped2DBLOCKAddressPayload
> +// bspec: 63986
> +// [243:240] Array Length: 0 (length is 1)
> +// [239:232] Block Height: 0 (height is 1)
> +// [231:224] Block Width: 0x3 (width is 4 bytes)
> +// [223:192] Block Start Y: 0
> +// [191:160] Block Start X: 0
> +// [159:128] Untyped 2D Surface Pitch: 0x3f (pitch is 64 bytes)
> +// [127:96] Untyped 2D Surface Height: 0 (height is 1)
> +// [95:64] Untyped 2D Surface Width: 0x3f (width is 64 bytes)
> +// [63:0] Untyped 2D Surface Base Address
> +// initialize register
> +(W)	mov (8)			r30.0<1>:uq	0x0:uq
> +// [31:0] Untyped 2D Surface Base Address low
> +(W)	mov (1)			r30.0<1>:ud	ARG(0):ud
> +// [63:32] Untyped 2D Surface Base Address high
> +(W)	mov (1)			r30.1<1>:ud ARG(1):ud
> +// [95:64] Untyped 2D Surface Width: 0x3f
> +//	   (Width minus 1 (in bytes) of the 2D surface, it represents 64)
> +(W)	mov (1)			r30.2<1>:ud	0x3f:ud
> +// [159:128] Untyped 2D Surface Pitch: 0x3f
> +//	     (Pitch minus 1 (in bytes) of the 2D surface, it represents 64)
> +(W)	mov (1)			r30.4<1>:ud	0x3f:ud
> +// [231:224] Block Width: 0x3 (4 bytes)
> +//	     (Specifies the width minus 1 (in number of data elements) for this
> +//	     rectangular region, it represents 4)
> +// Block width (encoded_value + 1) must be a multiple of DW (4 bytes).
> +// [239:232] Block Height: 0
> +//	     (Specifies the height minus 1 (in number of data elements) for
> +//	     this rectangular region, it represents 1)
> +// [243:240] Array Length: 0
> +//	     (Specifies Array Length minus 1 for Load2DBlockArray messages,
> +//	     must be zero for 2D Block Store messages, it represents 1)
> +(W)	mov (1)			r30.7<1>:ud	0x3:ud
> +//
> +// dest data payload format is selected by Data Size.
> +// Block Height x Block Width x Data size / GRF Register size
> +//	=> 1 x 16 x 32bit / 512bit = 1
> +// data payload format size is 1 GRF Register.
> +//
> +// send.ugm Untyped 2D Block Array Load
> +// Format: send.ugm (1) dst src0 src1 ExtMsg MsgDesc
> +// Execution Mask restriction: SIMT1
> +//
> +// Extended Message Descriptor (Dataport Extended Descriptor Imm 2D Block)
> +// bspec: 67780
> +// 0x0 =>
> +// [32:22] Global Y_offset: 0
> +// [21:12] Global X_offset: 0
> +//
> +// Message Descriptor
> +// bspec: 63972
> +// 0x2128403 =>
> +// [30:29] Address Type: 0 (FLAT)
> +// [28:25] Src0 Length: 1
> +// [24:20] Dest Length: 1
> +// [19:16] Cache : 2 (L1UC_L3UC) 10
> +// [15] Transpose Block: 1
> +// [11:9] Data Size: 2 (D32) 10
> +// [7] VNNI Transform: 0
> +// [5:0] Load Operation: 3 (Load 2D Block) 11
> +(W)	send.ugm (1)		r31	r30	null	0x0	0x2128403
> +#endif
> +	)", lower_32_bits(addr), upper_32_bits(addr));
>  }
> diff --git a/lib/gpgpu_shader.c.gen.iga64_codes.c b/lib/gpgpu_shader.c.gen.iga64_codes.c
> index 064564cfb257..0b116fc4113e 100644
> --- a/lib/gpgpu_shader.c.gen.iga64_codes.c
> +++ b/lib/gpgpu_shader.c.gen.iga64_codes.c
> @@ -3,7 +3,7 @@
>  
>  #include "gpgpu_shader.h"
>  
> -#define MD5_SUM_IGA64_ASMS bd1d8e873d1021863cf0b0cde7c332ea
> +#define MD5_SUM_IGA64_ASMS 16bafa89cc2fb5f6617e3dac61120f47
>  
>  struct iga64_template const iga64_code_read_a64_d32[] = {
>  	{ .gen_ver = 2000, .size = 40, .code = (const uint32_t []) {
> diff --git a/tests/intel/xe_prefetch_fault.c b/tests/intel/xe_prefetch_fault.c
> index fcbf305b5eb2..605d4894680d 100644
> --- a/tests/intel/xe_prefetch_fault.c
> +++ b/tests/intel/xe_prefetch_fault.c
> @@ -49,36 +49,36 @@ static void gpgpu_shader__prefetch_fault(struct gpgpu_shader *shdr,
>  {
>  	igt_assert_f((addr & 0x3) == 0, "address must be aligned to DWord!\n");
>  
> -	emit_iga64_code(shdr, xe_prefetch_fault_prefetch, "			\n\
> -#define IGA64_FLAGS \"\"							\n\
> -#if GEN_VER >= 3500								\n\
> -L0:										\n\
> -// Set base address with scalar register					\n\
> -(W)	mov (1)		s0.0<1>:ud		ARG(0):ud			\n\
> -(W)	mov (1)		s0.1<1>:ud		ARG(1):ud			\n\
> -										\n\
> -// A64 offset									\n\
> -(W)	mov (8)		r30.0<1>:uq		0x0:uq				\n\
> -										\n\
> -// efficient 64bit Read with cached L1, cached L2 and cached L3			\n\
> -// sendg ugm load with SBID 3							\n\
> -// Message Descriptor								\n\
> -//      bspec:71885								\n\
> -//      0x99C00 =>								\n\
> -//      [45:44] Offset Scaling: 0 (disable)					\n\
> -//      [43:22] Global Offset: 0						\n\
> -//      [21] Overfetch: 0 (disable)						\n\
> -//      [19:16] Cache: 9 (L1 cached, L2 cached and L3 cached)			\n\
> -//      [15:14] Address Type and Size: 2 (Flat A64 Base, A64 Index)		\n\
> -//      [13:11] Data Size: 3 (D64)						\n\
> -//      [10:10] Transpose : 1 (enable)						\n\
> -//      [9:7] Vector Size: 0 (Vector length 1)					\n\
> -//      [5:0] Opcode: 0 (Load)							\n\
> -// Prefetch operations are implemented using a NULL destination register.       \n\
> -(W)	sendg.ugm (1|M0)	null	r30:1	null:0	s0.0	0x99C00	{A@1,$5}\n\
> -										\n\
> -#endif										\n\
> -	", lower_32_bits(addr), upper_32_bits(addr));
> +	emit_iga64_code(shdr, xe_prefetch_fault_prefetch, R"(
> +#define IGA64_FLAGS ""
> +#if GEN_VER >= 3500
> +L0:
> +// Set base address with scalar register
> +(W)	mov (1)		s0.0<1>:ud		ARG(0):ud
> +(W)	mov (1)		s0.1<1>:ud		ARG(1):ud
> +
> +// A64 offset
> +(W)	mov (8)		r30.0<1>:uq		0x0:uq
> +
> +// efficient 64bit Read with cached L1, cached L2 and cached L3
> +// sendg ugm load with SBID 3
> +// Message Descriptor
> +//      bspec:71885
> +//      0x99C00 =>
> +//      [45:44] Offset Scaling: 0 (disable)
> +//      [43:22] Global Offset: 0
> +//      [21] Overfetch: 0 (disable)
> +//      [19:16] Cache: 9 (L1 cached, L2 cached and L3 cached)
> +//      [15:14] Address Type and Size: 2 (Flat A64 Base, A64 Index)
> +//      [13:11] Data Size: 3 (D64)
> +//      [10:10] Transpose : 1 (enable)
> +//      [9:7] Vector Size: 0 (Vector length 1)
> +//      [5:0] Opcode: 0 (Load)
> +// Prefetch operations are implemented using a NULL destination register.
> +(W)	sendg.ugm (1|M0)	null	r30:1	null:0	s0.0	0x99C00	{A@1,$5}
> +
> +#endif
> +	)", lower_32_bits(addr), upper_32_bits(addr));
>  }
>  
>  static struct intel_buf *
> diff --git a/tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c b/tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c
> index 63d625a6530d..a95a09567b1e 100644
> --- a/tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c
> +++ b/tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c
> @@ -3,7 +3,7 @@
>  
>  #include "gpgpu_shader.h"
>  
> -#define MD5_SUM_IGA64_ASMS e7208e50b70deaed9d16527ee184bc5b
> +#define MD5_SUM_IGA64_ASMS 713349079409a65ca940d805eb29083b
>  
>  struct iga64_template const iga64_code_xe_prefetch_fault_prefetch[] = {
>  	{ .gen_ver = 3500, .size = 28, .code = (const uint32_t []) {
> 
> -- 
> 2.54.0
> 
