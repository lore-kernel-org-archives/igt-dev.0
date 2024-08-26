Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C87FC5321E
	for <igt-dev@archiver.kernel.org>; Mon, 26 Aug 2024 09:44:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06DD110E116;
	Mon, 26 Aug 2024 09:44:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HyHwKD7I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9706B10E0DF
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Aug 2024 09:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724665493; x=1756201493;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=WAwRGCdacC0ufYxWOBYlzHi32YxCdB2exyZioIQXwyo=;
 b=HyHwKD7IIghLav7prLMTq8WGx7L/GKHyAYfG29K9yglutlch+AWJEuO+
 PQ75NIXTzxmuXA7ggRQyIchV4ISyXklRur4xYj6dZYmK7bDW9VM+UQ4Xx
 jxpAnVXKAEidkPs4/59q0TDGPuqYeD5c/pUsw+BuP8CeqgQl2Icldl/zd
 QeKEltXnW5eES1AITLB79imYt0XCGlrVXX9aIuvrvJIjHW3bSj2S75K81
 HLtHy08DTev4ltcZCPLbLvpsqpSgvJEc4OuTHnlyh/C4k2XtlnNOZmhuV
 iPxxn22ylSmmLO+dqmVCcJkuHTkZNpLxzaQb9JNc6JuTzMDzFOoEZsKpn g==;
X-CSE-ConnectionGUID: ZqiSoFFcRISb/xOJ50Cp4g==
X-CSE-MsgGUID: KbDp80SjSVmAjl0vkKegaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="33742246"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="33742246"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 02:44:53 -0700
X-CSE-ConnectionGUID: yLjxOpuBScKCwq64foz01Q==
X-CSE-MsgGUID: jsUkT1wlSiWKbKpCsDKxGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="67154351"
Received: from lbogdanm-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.84])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 02:44:49 -0700
Date: Mon, 26 Aug 2024 11:44:45 +0200
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
Subject: Re: [PATCH i-g-t v4 04/17] lib/gpgpu_shader: Extend shader building
 library
Message-ID: <20240826094445.jwaqtfk6fn7cdrbb@zkempczy-mobl2>
References: <20240823182222.305965-1-christoph.manszewski@intel.com>
 <20240823182222.305965-5-christoph.manszewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240823182222.305965-5-christoph.manszewski@intel.com>
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

On Fri, Aug 23, 2024 at 08:22:09PM +0200, Christoph Manszewski wrote:
> Add shader building functions and iga64 code used by eudebug subtests.
> 
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> ---
>  lib/gpgpu_shader.c          | 386 +++++++++++++++++++++++++++++++++-
>  lib/gpgpu_shader.h          |  24 ++-
>  lib/iga64_generated_codes.c | 401 +++++++++++++++++++++++++++++++++++-
>  3 files changed, 807 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
> index 80bad342a..3dab23942 100644
> --- a/lib/gpgpu_shader.c
> +++ b/lib/gpgpu_shader.c
> @@ -7,10 +7,16 @@
>  
>  #include <i915_drm.h>
>  
> +#include "igt_map.h"
>  #include "ioctl_wrappers.h"
>  #include "gpgpu_shader.h"
>  #include "gpu_cmds.h"
>  
> +struct label_entry {
> +	uint32_t id;
> +	uint32_t offset;
> +};
> +
>  #define IGA64_ARG0 0xc0ded000
>  #define IGA64_ARG_MASK 0xffffff00
>  
> @@ -32,7 +38,7 @@ static void gpgpu_shader_extend(struct gpgpu_shader *shdr)
>  	igt_assert(shdr->code);
>  }
>  
> -void
> +uint32_t
>  __emit_iga64_code(struct gpgpu_shader *shdr, struct iga64_template const *tpls,
>  		  int argc, uint32_t *argv)
>  {
> @@ -60,6 +66,8 @@ __emit_iga64_code(struct gpgpu_shader *shdr, struct iga64_template const *tpls,
>  	}
>  
>  	shdr->size += tpls->size;
> +
> +	return tpls->size;
>  }
>  
>  static uint32_t fill_sip(struct intel_bb *ibb,
> @@ -235,6 +243,7 @@ struct gpgpu_shader *gpgpu_shader_create(int fd)
>  	shdr->gen_ver = 100 * info->graphics_ver + info->graphics_rel;
>  	shdr->max_size = 16 * 4;
>  	shdr->code = malloc(4 * shdr->max_size);
> +	shdr->labels = igt_map_create(igt_map_hash_32, igt_map_equal_32);

Where's destroy for this map?

--
Zbigniew

>  	igt_assert(shdr->code);
>  	return shdr;
>  }
> @@ -251,6 +260,70 @@ void gpgpu_shader_destroy(struct gpgpu_shader *shdr)
>  	free(shdr);
>  }
>  
> +/**
> + * gpgpu_shader_dump:
> + * @shdr: shader to be printed
> + *
> + * Print shader instructions from @shdr in hex.
> + */
> +void gpgpu_shader_dump(struct gpgpu_shader *shdr)
> +{
> +	for (int i = 0; i < shdr->size / 4; i++)
> +		igt_info("0x%08x 0x%08x 0x%08x 0x%08x\n",
> +			 shdr->instr[i][0], shdr->instr[i][1],
> +			 shdr->instr[i][2], shdr->instr[i][3]);
> +}
> +
> +/**
> + * gpgpu_shader__breakpoint_on:
> + * @shdr: shader to create breakpoint in
> + * @cmd_no: index of the instruction to break on
> + *
> + * Insert a breakpoint on the @cmd_no'th instruction within @shdr.
> + */
> +void gpgpu_shader__breakpoint_on(struct gpgpu_shader *shdr, uint32_t cmd_no)
> +{
> +	shdr->instr[cmd_no][0] |= 1<<30;
> +}
> +
> +/**
> + * gpgpu_shader__breakpoint:
> + * @shdr: shader to create breakpoint in
> + *
> + * Insert a breakpoint on the last instruction in @shdr.
> + */
> +void gpgpu_shader__breakpoint(struct gpgpu_shader *shdr)
> +{
> +	gpgpu_shader__breakpoint_on(shdr, shdr->size / 4 - 1);
> +}
> +
> +/**
> + * gpgpu_shader__wait:
> + * @shdr: shader to be modified
> + *
> + * Append wait instruction to @shader. This instruction raises attention
> + * and stops execution.
> + */
> +void gpgpu_shader__wait(struct gpgpu_shader *shdr)
> +{
> +	emit_iga64_code(shdr, sync_host, "	\n\
> +(W)	sync.host	        null		\n\
> +	");
> +}
> +
> +/**
> + * gpgpu_shader__nop:
> + * @shdr: shader to be modified
> + *
> + * Append a no-op instruction to @shdr.
> + */
> +void gpgpu_shader__nop(struct gpgpu_shader *shdr)
> +{
> +	emit_iga64_code(shdr, nop, "	\n\
> +(W)	nop				\n\
> +	");
> +}
> +
>  /**
>   * gpgpu_shader__eot:
>   * @shdr: shader to be modified
> @@ -269,6 +342,247 @@ void gpgpu_shader__eot(struct gpgpu_shader *shdr)
>  	");
>  }
>  
> +/**
> + * gpgpu_shader__label:
> + * @shdr: shader to be modified
> + * @label_id: id of the label to be created
> + *
> + * Create a label for the last instruction within @shdr.
> + */
> +void gpgpu_shader__label(struct gpgpu_shader *shdr, int label_id)
> +{
> +	struct label_entry *l = malloc(sizeof(*l));
> +
> +	l->id = label_id;
> +	l->offset = shdr->size;
> +	igt_map_insert(shdr->labels, &l->id, l);
> +}
> +
> +#define OPCODE(x) (x & 0x7f)
> +#define OPCODE_JUMP_INDEXED 0x20
> +static void __patch_indexed_jump(struct gpgpu_shader *shdr, int label_id,
> +				 uint32_t jump_iga64_size)
> +{
> +	struct label_entry *l;
> +	uint32_t *start, *end, *label;
> +	int32_t relative;
> +
> +	l = igt_map_search(shdr->labels, &label_id);
> +	igt_assert(l);
> +
> +	igt_assert(jump_iga64_size % 4 == 0);
> +
> +	label = shdr->code + l->offset;
> +	end = shdr->code + shdr->size;
> +	start = end - jump_iga64_size;
> +
> +	for (; start < end; start += 4)
> +		if (OPCODE(*start) == OPCODE_JUMP_INDEXED) {
> +			relative = (label - start) * 4;
> +			*(start + 3) = relative;
> +			break;
> +		}
> +}
> +
> +/**
> + * gpgpu_shader__jump:
> + * @shdr: shader to be modified
> + * @label_id: label to jump to
> + *
> + * Append jump instruction to @shdr. Jump to instruction with label @label_id.
> + */
> +void gpgpu_shader__jump(struct gpgpu_shader *shdr, int label_id)
> +{
> +	size_t shader_size;
> +
> +	shader_size = emit_iga64_code(shdr, jump, "	\n\
> +L0:							\n\
> +(W)	jmpi        L0					\n\
> +	");
> +
> +	__patch_indexed_jump(shdr, label_id, shader_size);
> +}
> +
> +/**
> + * gpgpu_shader__jump_neq:
> + * @shdr: shader to be modified
> + * @label_id: label to jump to
> + * @y_offset: offset within target buffer in rows
> + * @value: expected value
> + *
> + * Append jump instruction to @shdr. Jump to instruction with label @label_id
> + * when @value is not equal to dword stored at @dw_offset within the surface.
> + *
> + * Note: @dw_offset has to be aligned to 4
> + */
> +void gpgpu_shader__jump_neq(struct gpgpu_shader *shdr, int label_id,
> +			    uint32_t y_offset, uint32_t value)
> +{
> +	uint32_t size;
> +
> +	size = emit_iga64_code(shdr, jump_dw_neq, "					\n\
> +L0:											\n\
> +(W)		mov (16|M0)              r30.0<1>:ud    0x0:ud				\n\
> +#if GEN_VER < 2000 // Media Block Write							\n\
> +	// Y offset of the block in rows := thread group id Y				\n\
> +(W)		mov (1|M0)               r30.1<1>:ud    ARG(0):ud			\n\
> +	// block width [0,63] representing 1 to 64 bytes, we want dword			\n\
> +(W)		mov (1|M0)               r30.2<1>:ud    0x3:ud				\n\
> +	// FFTID := FFTID from R0 header						\n\
> +(W)		mov (1|M0)               r30.4<1>:ud    r0.5<0;1,0>:ud  		\n\
> +(W)		send.dc1 (16|M0)         r31     r30      null    0x0	0x2190000	\n\
> +#else // Typed 2D Block Store								\n\
> +	// Store X and Y block start (160:191 and 192:223)				\n\
> +(W)            mov (2|M0)               r30.6<1>:ud    ARG(0):ud			\n\
> +	// Store X and Y block size (224:231 and 232:239)				\n\
> +(W)            mov (1|M0)               r30.7<1>:ud    0x3:ud				\n\
> +(W)            send.tgm (16|M0)         r31     r30    null:0    0x0    0x62100003	\n\
> +#endif											\n\
> +	// clear the flag register							\n\
> +(W)		mov (1|M0)               f0.0<1>:ud    0x0:ud				\n\
> +(W)		cmp (1|M0)    (ne)f0.0   null<1>:ud     r31.0<0;1,0>:ud   ARG(1):ud	\n\
> +(W&f0.0)	jmpi                     L0						\n\
> +	", y_offset, value);
> +
> +	__patch_indexed_jump(shdr, label_id, size);
> +}
> +
> +/**
> + * gpgpu_shader__loop_begin:
> + * @shdr: shader to be modified
> + * @label_id: id of the label to be created
> + *
> + * Begin a counting loop in @shdr. All subsequent instructions will constitute
> + * the loop body up until 'gpgpu_shader__loop_end' gets called. The first
> + * instruction of the loop will be at label @label_id.
> + */
> +void gpgpu_shader__loop_begin(struct gpgpu_shader *shdr, int label_id)
> +{
> +	emit_iga64_code(shdr, clear_r40, "		\n\
> +L0:							\n\
> +(W)	mov (1|M0)               r40:ud    0x0:ud	\n\
> +	");
> +
> +	gpgpu_shader__label(shdr, label_id);
> +}
> +
> +/**
> + * gpgpu_shader__loop_end:
> + * @shdr: shader to be modified
> + * @label_id: label id passed to 'gpgpu_shader__loop_begin'
> + * @iter: iteration count
> + *
> + * End loop body in @shdr.
> + */
> +void gpgpu_shader__loop_end(struct gpgpu_shader *shdr, int label_id, uint32_t iter)
> +{
> +	uint32_t size;
> +
> +	size = emit_iga64_code(shdr, inc_r40_jump_neq, "				\n\
> +L0:											\n\
> +(W)		add (1|M0)              r40:ud          r40.0<0;1,0>:ud 0x1:ud		\n\
> +(W)		mov (1|M0)              f0.0<1>:ud      0x0:ud				\n\
> +(W)		cmp (1|M0)    (ne)f0.0   null<1>:ud     r40.0<0;1,0>:ud   ARG(0):ud	\n\
> +(W&f0.0)	jmpi                     L0						\n\
> +	", iter);
> +
> +	__patch_indexed_jump(shdr, label_id, size);
> +}
> +
> +/**
> + * gpgpu_shader__common_target_write:
> + * @shdr: shader to be modified
> + * @y_offset: write target offset within target buffer in rows
> + * @value: oword to be written
> + *
> + * Write the oword stored in @value to the target buffer at @y_offset.
> + */
> +void gpgpu_shader__common_target_write(struct gpgpu_shader *shdr,
> +				       uint32_t y_offset, const uint32_t value[4])
> +{
> +	emit_iga64_code(shdr, common_target_write, "				\n\
> +(W)	mov (16|M0)		r31.0<1>:ud	0x0:ud				\n\
> +(W)	mov (1|M0)		r31.0<1>:ud	ARG(1):ud			\n\
> +(W)	mov (1|M0)		r31.1<1>:ud	ARG(2):ud			\n\
> +(W)	mov (1|M0)		r31.2<1>:ud	ARG(3):ud			\n\
> +(W)	mov (1|M0)		r31.3<1>:ud	ARG(4):ud			\n\
> +(W)	mov (16|M0)		r30.0<1>:ud	0x0:ud				\n\
> +#if GEN_VER < 2000 // Media Block Write						\n\
> +	// Y offset of the block in rows					\n\
> +(W)	mov (1|M0)		r30.1<1>:ud	ARG(0):ud			\n\
> +	// block width [0,63] representing 1 to 64 bytes			\n\
> +(W)	mov (1|M0)		r30.2<1>:ud	0xf:ud				\n\
> +	// FFTID := FFTID from R0 header					\n\
> +(W)	mov (1|M0)		r30.4<1>:ud	r0.5<0;1,0>:ud			\n\
> +	// written value							\n\
> +(W)	send.dc1 (16|M0)	null	r30	src1_null  0x0	0x40A8000	\n\
> +#else	// Typed 2D Block Store							\n\
> +	// Store X and Y block start (160:191 and 192:223)			\n\
> +(W)	mov (2|M0)              r30.6<1>:ud     ARG(0):ud			\n\
> +	// Store X and Y block size (224:231 and 232:239)			\n\
> +(W)	mov (1|M0)              r30.7<1>:ud     0xf:ud				\n\
> +(W)	send.tgm (16|M0)        null    r30     null:0  0x0     0x64000007	\n\
> +#endif										\n\
> +	", y_offset, value[0], value[1], value[2], value[3]);
> +}
> +
> +/**
> + * gpgpu_shader__common_target_write_u32:
> + * @shdr: shader to be modified
> + * @y_offset: write target offset within target buffer in rows
> + * @value: dword to be written
> + *
> + * Fill oword at @y_offset with dword stored in @value.
> + */
> +void gpgpu_shader__common_target_write_u32(struct gpgpu_shader *shdr,
> +					   uint32_t y_offset, uint32_t value)
> +{
> +	const uint32_t owblock[4] = {
> +		value, value, value, value
> +	};
> +	gpgpu_shader__common_target_write(shdr, y_offset, owblock);
> +}
> +
> +/**
> + * gpgpu_shader__write_aip:
> + * @shdr: shader to be modified
> + * @y_offset: write target offset within the surface in rows
> + *
> + * Write address instruction pointer to row tg_id_y + @y_offset.
> + */
> +void gpgpu_shader__write_aip(struct gpgpu_shader *shdr, uint32_t y_offset)
> +{
> +	emit_iga64_code(shdr, media_block_write_aip, "				\n\
> +	// Payload								\n\
> +(W)	mov (1|M0)               r5.0<1>:ud    cr0.2:ud				\n\
> +#if GEN_VER < 2000 // Media Block Write						\n\
> +	// X offset of the block in bytes := (thread group id X << ARG(0))	\n\
> +(W)	shl (1|M0)               r4.0<1>:ud    r0.1<0;1,0>:ud    0x2:ud		\n\
> +	// Y offset of the block in rows := thread group id Y			\n\
> +(W)	mov (1|M0)               r4.1<1>:ud    r0.6<0;1,0>:ud			\n\
> +(W)	add (1|M0)               r4.1<1>:ud    r4.1<0;1,0>:ud    ARG(0):ud	\n\
> +	// block width [0,63] representing 1 to 64 bytes			\n\
> +(W)	mov (1|M0)               r4.2<1>:ud    0x3:ud				\n\
> +	// FFTID := FFTID from R0 header					\n\
> +(W)	mov (1|M0)               r4.4<1>:ud    r0.5<0;1,0>:ud			\n\
> +(W)	send.dc1 (16|M0)         null     r4   src1_null 0       0x40A8000	\n\
> +#else // Typed 2D Block Store							\n\
> +	// Load r2.0-3 with tg id X << ARG(0)					\n\
> +(W)	shl (1|M0)               r2.0<1>:ud    r0.1<0;1,0>:ud    0x2:ud		\n\
> +	// Load r2.4-7 with tg id Y + ARG(1):ud					\n\
> +(W)	mov (1|M0)               r2.1<1>:ud    r0.6<0;1,0>:ud			\n\
> +(W)	add (1|M0)               r2.1<1>:ud    r2.1<0;1,0>:ud    ARG(0):ud	\n\
> +	// payload setup							\n\
> +(W)	mov (16|M0)              r4.0<1>:ud    0x0:ud				\n\
> +	// Store X and Y block start (160:191 and 192:223)			\n\
> +(W)	mov (2|M0)               r4.5<1>:ud    r2.0<2;2,1>:ud			\n\
> +	// Store X and Y block max_size (224:231 and 232:239)			\n\
> +(W)	mov (1|M0)               r4.7<1>:ud    0x3:ud				\n\
> +(W)	send.tgm (16|M0)         null     r4   null:0    0    0x64000007	\n\
> +#endif										\n\
> +	", y_offset);
> +}
> +
>  /**
>   * gpgpu_shader__write_dword:
>   * @shdr: shader to be modified
> @@ -313,3 +627,73 @@ void gpgpu_shader__write_dword(struct gpgpu_shader *shdr, uint32_t value,
>  #endif										\n\
>  	", 2, y_offset, 3, value, value, value, value);
>  }
> +
> +/**
> + * gpgpu_shader__end_system_routine:
> + * @shdr: shader to be modified
> + * @breakpoint_suppress: breakpoint suppress flag
> + *
> + * Return from system routine. To prevent infinite jumping to the system
> + * routine on a breakpoint, @breakpoint_suppres flag has to be set.
> + */
> +void gpgpu_shader__end_system_routine(struct gpgpu_shader *shdr,
> +				      bool breakpoint_suppress)
> +{
> +	/*
> +	 * set breakpoint suppress bit to avoid an endless loop
> +	 * when sip was invoked by a breakpoint
> +	 */
> +	if (breakpoint_suppress)
> +		emit_iga64_code(shdr, breakpoint_suppress, "			\n\
> +(W)	or  (1|M0)               cr0.0<1>:ud   cr0.0<0;1,0>:ud   0x8000:ud	\n\
> +		");
> +
> +	emit_iga64_code(shdr, end_system_routine, "				\n\
> +(W)	and (1|M0)               cr0.1<1>:ud   cr0.1<0;1,0>:ud   ARG(0):ud	\n\
> +	// return to an application						\n\
> +(W)	and (1|M0)               cr0.0<1>:ud   cr0.0<0;1,0>:ud   0x7FFFFFFD:ud	\n\
> +	", 0x7fffff | (1 << 26)); /* clear all exceptions, except read only bit */
> +}
> +
> +/**
> + * gpgpu_shader__end_system_routine_step_if_eq:
> + * @shdr: shader to be modified
> + * @y_offset: offset within target buffer in rows
> + * @value: expected value for single stepping execution
> + *
> + * Return from system routine. Don't clear breakpoint exception when @value
> + * is equal to value stored at @dw_offset. This triggers the system routine
> + * after the subsequent instruction, resulting in single stepping execution.
> + */
> +void gpgpu_shader__end_system_routine_step_if_eq(struct gpgpu_shader *shdr,
> +						 uint32_t y_offset,
> +						 uint32_t value)
> +{
> +	emit_iga64_code(shdr, end_system_routine_step_if_eq, "				\n\
> +(W)		or  (1|M0)               cr0.0<1>:ud   cr0.0<0;1,0>:ud   0x8000:ud	\n\
> +(W)		and (1|M0)               cr0.1<1>:ud   cr0.1<0;1,0>:ud   ARG(0):ud	\n\
> +(W)		mov (16|M0)              r30.0<1>:ud    0x0:ud				\n\
> +#if GEN_VER < 2000 // Media Block Write							\n\
> +		// Y offset of the block in rows := thread group id Y			\n\
> +(W)		mov (1|M0)               r30.1<1>:ud    ARG(1):ud			\n\
> +		// block width [0,63] representing 1 to 64 bytes, we want dword		\n\
> +(W)		mov (1|M0)               r30.2<1>:ud    0x3:ud				\n\
> +		// FFTID := FFTID from R0 header					\n\
> +(W)		mov (1|M0)               r30.4<1>:ud    r0.5<0;1,0>:ud			\n\
> +(W)		send.dc1 (16|M0)         r31     r30      null    0x0	0x2190000	\n\
> +#else	// Typed 2D Block Store								\n\
> +		// Store X and Y block start (160:191 and 192:223)			\n\
> +(W)		mov (2|M0)               r30.6<1>:ud    ARG(1):ud			\n\
> +		// Store X and Y block size (224:231 and 232:239)			\n\
> +(W)		mov (1|M0)               r30.7<1>:ud    0x3:ud				\n\
> +(W)		send.tgm (16|M0)         r31     r30    null:0    0x0    0x62100003	\n\
> +#endif											\n\
> +		// clear the flag register						\n\
> +(W)		mov (1|M0)               f0.0<1>:ud    0x0:ud				\n\
> +(W)		cmp (1|M0)    (ne)f0.0   null<1>:ud     r31.0<0;1,0>:ud   ARG(2):ud	\n\
> +(W&f0.0)	and (1|M0)              cr0.1<1>:ud     cr0.1<0;1,0>:ud   ARG(3):ud	\n\
> +		// return to an application						\n\
> +(W)		and (1|M0)               cr0.0<1>:ud   cr0.0<0;1,0>:ud   0x7FFFFFFD:ud	\n\
> +	", 0x807fffff, /* leave breakpoint exception */
> +	y_offset, value, 0x7fffff /* clear all exceptions */ );
> +}
> diff --git a/lib/gpgpu_shader.h b/lib/gpgpu_shader.h
> index 255f93b4d..e4ca0be4c 100644
> --- a/lib/gpgpu_shader.h
> +++ b/lib/gpgpu_shader.h
> @@ -21,6 +21,7 @@ struct gpgpu_shader {
>  		uint32_t *code;
>  		uint32_t (*instr)[4];
>  	};
> +	struct igt_map *labels;
>  };
>  
>  struct iga64_template {
> @@ -31,7 +32,7 @@ struct iga64_template {
>  
>  #pragma GCC diagnostic ignored "-Wnested-externs"
>  
> -void
> +uint32_t
>  __emit_iga64_code(struct gpgpu_shader *shdr, const struct iga64_template *tpls,
>  		  int argc, uint32_t *argv);
>  
> @@ -56,8 +57,27 @@ void gpgpu_shader_exec(struct intel_bb *ibb,
>  		       struct gpgpu_shader *sip,
>  		       uint64_t ring, bool explicit_engine);
>  
> +void gpgpu_shader__wait(struct gpgpu_shader *shdr);
> +void gpgpu_shader__breakpoint_on(struct gpgpu_shader *shdr, uint32_t cmd_no);
> +void gpgpu_shader__breakpoint(struct gpgpu_shader *shdr);
> +void gpgpu_shader__nop(struct gpgpu_shader *shdr);
>  void gpgpu_shader__eot(struct gpgpu_shader *shdr);
> +void gpgpu_shader__common_target_write(struct gpgpu_shader *shdr,
> +				       uint32_t y_offset, const uint32_t value[4]);
> +void gpgpu_shader__common_target_write_u32(struct gpgpu_shader *shdr,
> +				     uint32_t y_offset, uint32_t value);
> +void gpgpu_shader__end_system_routine(struct gpgpu_shader *shdr,
> +				      bool breakpoint_suppress);
> +void gpgpu_shader__end_system_routine_step_if_eq(struct gpgpu_shader *shdr,
> +						 uint32_t dw_offset,
> +						 uint32_t value);
> +void gpgpu_shader__write_aip(struct gpgpu_shader *shdr, uint32_t y_offset);
>  void gpgpu_shader__write_dword(struct gpgpu_shader *shdr, uint32_t value,
>  			       uint32_t y_offset);
> -
> +void gpgpu_shader__label(struct gpgpu_shader *shdr, int label_id);
> +void gpgpu_shader__jump(struct gpgpu_shader *shdr, int label_id);
> +void gpgpu_shader__jump_neq(struct gpgpu_shader *shdr, int label_id,
> +			    uint32_t dw_offset, uint32_t value);
> +void gpgpu_shader__loop_begin(struct gpgpu_shader *shdr, int label_id);
> +void gpgpu_shader__loop_end(struct gpgpu_shader *shdr, int label_id, uint32_t iter);
>  #endif /* GPGPU_SHADER_H */
> diff --git a/lib/iga64_generated_codes.c b/lib/iga64_generated_codes.c
> index 87270bb46..abfb1f203 100644
> --- a/lib/iga64_generated_codes.c
> +++ b/lib/iga64_generated_codes.c
> @@ -3,7 +3,120 @@
>  
>  #include "gpgpu_shader.h"
>  
> -#define MD5_SUM_IGA64_ASMS 96abf1aa2d0cc900ebba8203cefdd30c
> +#define MD5_SUM_IGA64_ASMS 590664a67ce2c1d01aa92b69d2f821f5
> +
> +struct iga64_template const iga64_code_end_system_routine_step_if_eq[] = {
> +	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
> +		0x80000966, 0x80018220, 0x02008000, 0x00008000,
> +		0x80000965, 0x80118220, 0x02008010, 0xc0ded000,
> +		0x80100961, 0x1e054220, 0x00000000, 0x00000000,
> +		0x80040061, 0x1e654220, 0x00000000, 0xc0ded001,
> +		0x80000061, 0x1e754220, 0x00000000, 0x00000003,
> +		0x80132031, 0x1f0c0000, 0xd0061e8c, 0x04000000,
> +		0x80000061, 0x30014220, 0x00000000, 0x00000000,
> +		0x80008070, 0x00018220, 0x22001f04, 0xc0ded002,
> +		0x84000965, 0x80118220, 0x02008010, 0xc0ded003,
> +		0x80000965, 0x80018220, 0x02008000, 0x7ffffffd,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 1270, .size = 52, .code = (const uint32_t []) {
> +		0x80000966, 0x80018220, 0x02008000, 0x00008000,
> +		0x80000965, 0x80218220, 0x02008020, 0xc0ded000,
> +		0x80040961, 0x1e054220, 0x00000000, 0x00000000,
> +		0x80000061, 0x1e254220, 0x00000000, 0xc0ded001,
> +		0x80000061, 0x1e454220, 0x00000000, 0x00000003,
> +		0x80000061, 0x1e850220, 0x000000a4, 0x00000000,
> +		0x80001901, 0x00010000, 0x00000000, 0x00000000,
> +		0x80044031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
> +		0x80000061, 0x30014220, 0x00000000, 0x00000000,
> +		0x80002070, 0x00018220, 0x22001f04, 0xc0ded002,
> +		0x81000965, 0x80218220, 0x02008020, 0xc0ded003,
> +		0x80000965, 0x80018220, 0x02008000, 0x7ffffffd,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 1260, .size = 48, .code = (const uint32_t []) {
> +		0x80000966, 0x80018220, 0x02008000, 0x00008000,
> +		0x80000965, 0x80118220, 0x02008010, 0xc0ded000,
> +		0x80100961, 0x1e054220, 0x00000000, 0x00000000,
> +		0x80000061, 0x1e154220, 0x00000000, 0xc0ded001,
> +		0x80000061, 0x1e254220, 0x00000000, 0x00000003,
> +		0x80000061, 0x1e450220, 0x00000054, 0x00000000,
> +		0x80132031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
> +		0x80000061, 0x30014220, 0x00000000, 0x00000000,
> +		0x80008070, 0x00018220, 0x22001f04, 0xc0ded002,
> +		0x84000965, 0x80118220, 0x02008010, 0xc0ded003,
> +		0x80000965, 0x80018220, 0x02008000, 0x7ffffffd,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 1250, .size = 52, .code = (const uint32_t []) {
> +		0x80000966, 0x80018220, 0x02008000, 0x00008000,
> +		0x80000965, 0x80218220, 0x02008020, 0xc0ded000,
> +		0x80040961, 0x1e054220, 0x00000000, 0x00000000,
> +		0x80000061, 0x1e254220, 0x00000000, 0xc0ded001,
> +		0x80000061, 0x1e454220, 0x00000000, 0x00000003,
> +		0x80000061, 0x1e850220, 0x000000a4, 0x00000000,
> +		0x80001901, 0x00010000, 0x00000000, 0x00000000,
> +		0x80044031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
> +		0x80000061, 0x30014220, 0x00000000, 0x00000000,
> +		0x80002070, 0x00018220, 0x22001f04, 0xc0ded002,
> +		0x81000965, 0x80218220, 0x02008020, 0xc0ded003,
> +		0x80000965, 0x80018220, 0x02008000, 0x7ffffffd,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 0, .size = 48, .code = (const uint32_t []) {
> +		0x80000166, 0x80018220, 0x02008000, 0x00008000,
> +		0x80000165, 0x80218220, 0x02008020, 0xc0ded000,
> +		0x80040161, 0x1e054220, 0x00000000, 0x00000000,
> +		0x80000061, 0x1e254220, 0x00000000, 0xc0ded001,
> +		0x80000061, 0x1e454220, 0x00000000, 0x00000003,
> +		0x80000061, 0x1e850220, 0x000000a4, 0x00000000,
> +		0x80049031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
> +		0x80000061, 0x30014220, 0x00000000, 0x00000000,
> +		0x80002070, 0x00018220, 0x22001f04, 0xc0ded002,
> +		0x81000165, 0x80218220, 0x02008020, 0xc0ded003,
> +		0x80000165, 0x80018220, 0x02008000, 0x7ffffffd,
> +		0x80000101, 0x00010000, 0x00000000, 0x00000000,
> +	}}
> +};
> +
> +struct iga64_template const iga64_code_end_system_routine[] = {
> +	{ .gen_ver = 2000, .size = 12, .code = (const uint32_t []) {
> +		0x80000965, 0x80118220, 0x02008010, 0xc0ded000,
> +		0x80000965, 0x80018220, 0x02008000, 0x7ffffffd,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 1270, .size = 12, .code = (const uint32_t []) {
> +		0x80000965, 0x80218220, 0x02008020, 0xc0ded000,
> +		0x80000965, 0x80018220, 0x02008000, 0x7ffffffd,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 1260, .size = 12, .code = (const uint32_t []) {
> +		0x80000965, 0x80118220, 0x02008010, 0xc0ded000,
> +		0x80000965, 0x80018220, 0x02008000, 0x7ffffffd,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 1250, .size = 12, .code = (const uint32_t []) {
> +		0x80000965, 0x80218220, 0x02008020, 0xc0ded000,
> +		0x80000965, 0x80018220, 0x02008000, 0x7ffffffd,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 0, .size = 12, .code = (const uint32_t []) {
> +		0x80000165, 0x80218220, 0x02008020, 0xc0ded000,
> +		0x80000165, 0x80018220, 0x02008000, 0x7ffffffd,
> +		0x80000101, 0x00010000, 0x00000000, 0x00000000,
> +	}}
> +};
> +
> +struct iga64_template const iga64_code_breakpoint_suppress[] = {
> +	{ .gen_ver = 1250, .size = 8, .code = (const uint32_t []) {
> +		0x80000966, 0x80018220, 0x02008000, 0x00008000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 0, .size = 8, .code = (const uint32_t []) {
> +		0x80000166, 0x80018220, 0x02008000, 0x00008000,
> +		0x80000101, 0x00010000, 0x00000000, 0x00000000,
> +	}}
> +};
>  
>  struct iga64_template const iga64_code_media_block_write[] = {
>  	{ .gen_ver = 2000, .size = 56, .code = (const uint32_t []) {
> @@ -90,6 +203,270 @@ struct iga64_template const iga64_code_media_block_write[] = {
>  	}}
>  };
>  
> +struct iga64_template const iga64_code_media_block_write_aip[] = {
> +	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
> +		0x80000961, 0x05050220, 0x00008020, 0x00000000,
> +		0x80000969, 0x02058220, 0x02000014, 0x00000002,
> +		0x80000061, 0x02150220, 0x00000064, 0x00000000,
> +		0x80001940, 0x02158220, 0x02000214, 0xc0ded000,
> +		0x80100061, 0x04054220, 0x00000000, 0x00000000,
> +		0x80041a61, 0x04550220, 0x00220205, 0x00000000,
> +		0x80000061, 0x04754220, 0x00000000, 0x00000003,
> +		0x80132031, 0x00000000, 0xd00e0494, 0x04000000,
> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 1270, .size = 44, .code = (const uint32_t []) {
> +		0x80000961, 0x05050220, 0x00008040, 0x00000000,
> +		0x80000969, 0x04058220, 0x02000024, 0x00000002,
> +		0x80000061, 0x04250220, 0x000000c4, 0x00000000,
> +		0x80001940, 0x04258220, 0x02000424, 0xc0ded000,
> +		0x80000061, 0x04454220, 0x00000000, 0x00000003,
> +		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
> +		0x80001901, 0x00010000, 0x00000000, 0x00000000,
> +		0x80044031, 0x00000000, 0xc0000414, 0x02a00000,
> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 1260, .size = 40, .code = (const uint32_t []) {
> +		0x80000961, 0x05050220, 0x00008020, 0x00000000,
> +		0x80000969, 0x04058220, 0x02000014, 0x00000002,
> +		0x80000061, 0x04150220, 0x00000064, 0x00000000,
> +		0x80001940, 0x04158220, 0x02000414, 0xc0ded000,
> +		0x80000061, 0x04254220, 0x00000000, 0x00000003,
> +		0x80000061, 0x04450220, 0x00000054, 0x00000000,
> +		0x80132031, 0x00000000, 0xc0000414, 0x02a00000,
> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 1250, .size = 44, .code = (const uint32_t []) {
> +		0x80000961, 0x05050220, 0x00008040, 0x00000000,
> +		0x80000969, 0x04058220, 0x02000024, 0x00000002,
> +		0x80000061, 0x04250220, 0x000000c4, 0x00000000,
> +		0x80001940, 0x04258220, 0x02000424, 0xc0ded000,
> +		0x80000061, 0x04454220, 0x00000000, 0x00000003,
> +		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
> +		0x80001901, 0x00010000, 0x00000000, 0x00000000,
> +		0x80044031, 0x00000000, 0xc0000414, 0x02a00000,
> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 0, .size = 40, .code = (const uint32_t []) {
> +		0x80000161, 0x05050220, 0x00008040, 0x00000000,
> +		0x80000169, 0x04058220, 0x02000024, 0x00000002,
> +		0x80000061, 0x04250220, 0x000000c4, 0x00000000,
> +		0x80000140, 0x04258220, 0x02000424, 0xc0ded000,
> +		0x80000061, 0x04454220, 0x00000000, 0x00000003,
> +		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
> +		0x80049031, 0x00000000, 0xc0000414, 0x02a00000,
> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> +		0x80000101, 0x00010000, 0x00000000, 0x00000000,
> +	}}
> +};
> +
> +struct iga64_template const iga64_code_common_target_write[] = {
> +	{ .gen_ver = 2000, .size = 48, .code = (const uint32_t []) {
> +		0x80100061, 0x1f054220, 0x00000000, 0x00000000,
> +		0x80000061, 0x1f054220, 0x00000000, 0xc0ded001,
> +		0x80000061, 0x1f154220, 0x00000000, 0xc0ded002,
> +		0x80000061, 0x1f254220, 0x00000000, 0xc0ded003,
> +		0x80000061, 0x1f354220, 0x00000000, 0xc0ded004,
> +		0x80100061, 0x1e054220, 0x00000000, 0x00000000,
> +		0x80040061, 0x1e654220, 0x00000000, 0xc0ded000,
> +		0x80000061, 0x1e754220, 0x00000000, 0x0000000f,
> +		0x80132031, 0x00000000, 0xd00e1e94, 0x04000000,
> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 1270, .size = 56, .code = (const uint32_t []) {
> +		0x80040061, 0x1f054220, 0x00000000, 0x00000000,
> +		0x80000061, 0x1f054220, 0x00000000, 0xc0ded001,
> +		0x80000061, 0x1f254220, 0x00000000, 0xc0ded002,
> +		0x80000061, 0x1f454220, 0x00000000, 0xc0ded003,
> +		0x80000061, 0x1f654220, 0x00000000, 0xc0ded004,
> +		0x80040061, 0x1e054220, 0x00000000, 0x00000000,
> +		0x80000061, 0x1e254220, 0x00000000, 0xc0ded000,
> +		0x80000061, 0x1e454220, 0x00000000, 0x0000000f,
> +		0x80000061, 0x1e850220, 0x000000a4, 0x00000000,
> +		0x80001901, 0x00010000, 0x00000000, 0x00000000,
> +		0x80044031, 0x00000000, 0xc0001e14, 0x02a00000,
> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 1260, .size = 52, .code = (const uint32_t []) {
> +		0x80100061, 0x1f054220, 0x00000000, 0x00000000,
> +		0x80000061, 0x1f054220, 0x00000000, 0xc0ded001,
> +		0x80000061, 0x1f154220, 0x00000000, 0xc0ded002,
> +		0x80000061, 0x1f254220, 0x00000000, 0xc0ded003,
> +		0x80000061, 0x1f354220, 0x00000000, 0xc0ded004,
> +		0x80100061, 0x1e054220, 0x00000000, 0x00000000,
> +		0x80000061, 0x1e154220, 0x00000000, 0xc0ded000,
> +		0x80000061, 0x1e254220, 0x00000000, 0x0000000f,
> +		0x80000061, 0x1e450220, 0x00000054, 0x00000000,
> +		0x80132031, 0x00000000, 0xc0001e14, 0x02a00000,
> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 1250, .size = 56, .code = (const uint32_t []) {
> +		0x80040061, 0x1f054220, 0x00000000, 0x00000000,
> +		0x80000061, 0x1f054220, 0x00000000, 0xc0ded001,
> +		0x80000061, 0x1f254220, 0x00000000, 0xc0ded002,
> +		0x80000061, 0x1f454220, 0x00000000, 0xc0ded003,
> +		0x80000061, 0x1f654220, 0x00000000, 0xc0ded004,
> +		0x80040061, 0x1e054220, 0x00000000, 0x00000000,
> +		0x80000061, 0x1e254220, 0x00000000, 0xc0ded000,
> +		0x80000061, 0x1e454220, 0x00000000, 0x0000000f,
> +		0x80000061, 0x1e850220, 0x000000a4, 0x00000000,
> +		0x80001901, 0x00010000, 0x00000000, 0x00000000,
> +		0x80044031, 0x00000000, 0xc0001e14, 0x02a00000,
> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 0, .size = 52, .code = (const uint32_t []) {
> +		0x80040061, 0x1f054220, 0x00000000, 0x00000000,
> +		0x80000061, 0x1f054220, 0x00000000, 0xc0ded001,
> +		0x80000061, 0x1f254220, 0x00000000, 0xc0ded002,
> +		0x80000061, 0x1f454220, 0x00000000, 0xc0ded003,
> +		0x80000061, 0x1f654220, 0x00000000, 0xc0ded004,
> +		0x80040061, 0x1e054220, 0x00000000, 0x00000000,
> +		0x80000061, 0x1e254220, 0x00000000, 0xc0ded000,
> +		0x80000061, 0x1e454220, 0x00000000, 0x0000000f,
> +		0x80000061, 0x1e850220, 0x000000a4, 0x00000000,
> +		0x80049031, 0x00000000, 0xc0001e14, 0x02a00000,
> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> +		0x80000101, 0x00010000, 0x00000000, 0x00000000,
> +	}}
> +};
> +
> +struct iga64_template const iga64_code_inc_r40_jump_neq[] = {
> +	{ .gen_ver = 2000, .size = 20, .code = (const uint32_t []) {
> +		0x80000040, 0x28058220, 0x02002804, 0x00000001,
> +		0x80000061, 0x30014220, 0x00000000, 0x00000000,
> +		0x80001a70, 0x00018220, 0x22002804, 0xc0ded000,
> +		0x84000020, 0x00004000, 0x00000000, 0xffffffd0,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 1270, .size = 20, .code = (const uint32_t []) {
> +		0x80000040, 0x28058220, 0x02002804, 0x00000001,
> +		0x80000061, 0x30014220, 0x00000000, 0x00000000,
> +		0x80001a70, 0x00018220, 0x22002804, 0xc0ded000,
> +		0x81000020, 0x00004000, 0x00000000, 0xffffffd0,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 1260, .size = 20, .code = (const uint32_t []) {
> +		0x80000040, 0x28058220, 0x02002804, 0x00000001,
> +		0x80000061, 0x30014220, 0x00000000, 0x00000000,
> +		0x80001a70, 0x00018220, 0x22002804, 0xc0ded000,
> +		0x84000020, 0x00004000, 0x00000000, 0xffffffd0,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 1250, .size = 20, .code = (const uint32_t []) {
> +		0x80000040, 0x28058220, 0x02002804, 0x00000001,
> +		0x80000061, 0x30014220, 0x00000000, 0x00000000,
> +		0x80001a70, 0x00018220, 0x22002804, 0xc0ded000,
> +		0x81000020, 0x00004000, 0x00000000, 0xffffffd0,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 0, .size = 20, .code = (const uint32_t []) {
> +		0x80000040, 0x28058220, 0x02002804, 0x00000001,
> +		0x80000061, 0x30014220, 0x00000000, 0x00000000,
> +		0x80000270, 0x00018220, 0x22002804, 0xc0ded000,
> +		0x81000020, 0x00004000, 0x00000000, 0xffffffd0,
> +		0x80000101, 0x00010000, 0x00000000, 0x00000000,
> +	}}
> +};
> +
> +struct iga64_template const iga64_code_clear_r40[] = {
> +	{ .gen_ver = 1250, .size = 8, .code = (const uint32_t []) {
> +		0x80000061, 0x28054220, 0x00000000, 0x00000000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 0, .size = 8, .code = (const uint32_t []) {
> +		0x80000061, 0x28054220, 0x00000000, 0x00000000,
> +		0x80000101, 0x00010000, 0x00000000, 0x00000000,
> +	}}
> +};
> +
> +struct iga64_template const iga64_code_jump_dw_neq[] = {
> +	{ .gen_ver = 2000, .size = 32, .code = (const uint32_t []) {
> +		0x80100061, 0x1e054220, 0x00000000, 0x00000000,
> +		0x80040061, 0x1e654220, 0x00000000, 0xc0ded000,
> +		0x80000061, 0x1e754220, 0x00000000, 0x00000003,
> +		0x80132031, 0x1f0c0000, 0xd0061e8c, 0x04000000,
> +		0x80000061, 0x30014220, 0x00000000, 0x00000000,
> +		0x80008070, 0x00018220, 0x22001f04, 0xc0ded001,
> +		0x84000020, 0x00004000, 0x00000000, 0xffffffa0,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 1270, .size = 40, .code = (const uint32_t []) {
> +		0x80040061, 0x1e054220, 0x00000000, 0x00000000,
> +		0x80000061, 0x1e254220, 0x00000000, 0xc0ded000,
> +		0x80000061, 0x1e454220, 0x00000000, 0x00000003,
> +		0x80000061, 0x1e850220, 0x000000a4, 0x00000000,
> +		0x80001901, 0x00010000, 0x00000000, 0x00000000,
> +		0x80044031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
> +		0x80000061, 0x30014220, 0x00000000, 0x00000000,
> +		0x80002070, 0x00018220, 0x22001f04, 0xc0ded001,
> +		0x81000020, 0x00004000, 0x00000000, 0xffffff80,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 1260, .size = 36, .code = (const uint32_t []) {
> +		0x80100061, 0x1e054220, 0x00000000, 0x00000000,
> +		0x80000061, 0x1e154220, 0x00000000, 0xc0ded000,
> +		0x80000061, 0x1e254220, 0x00000000, 0x00000003,
> +		0x80000061, 0x1e450220, 0x00000054, 0x00000000,
> +		0x80132031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
> +		0x80000061, 0x30014220, 0x00000000, 0x00000000,
> +		0x80008070, 0x00018220, 0x22001f04, 0xc0ded001,
> +		0x84000020, 0x00004000, 0x00000000, 0xffffff90,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 1250, .size = 40, .code = (const uint32_t []) {
> +		0x80040061, 0x1e054220, 0x00000000, 0x00000000,
> +		0x80000061, 0x1e254220, 0x00000000, 0xc0ded000,
> +		0x80000061, 0x1e454220, 0x00000000, 0x00000003,
> +		0x80000061, 0x1e850220, 0x000000a4, 0x00000000,
> +		0x80001901, 0x00010000, 0x00000000, 0x00000000,
> +		0x80044031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
> +		0x80000061, 0x30014220, 0x00000000, 0x00000000,
> +		0x80002070, 0x00018220, 0x22001f04, 0xc0ded001,
> +		0x81000020, 0x00004000, 0x00000000, 0xffffff80,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 0, .size = 36, .code = (const uint32_t []) {
> +		0x80040061, 0x1e054220, 0x00000000, 0x00000000,
> +		0x80000061, 0x1e254220, 0x00000000, 0xc0ded000,
> +		0x80000061, 0x1e454220, 0x00000000, 0x00000003,
> +		0x80000061, 0x1e850220, 0x000000a4, 0x00000000,
> +		0x80049031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
> +		0x80000061, 0x30014220, 0x00000000, 0x00000000,
> +		0x80002070, 0x00018220, 0x22001f04, 0xc0ded001,
> +		0x81000020, 0x00004000, 0x00000000, 0xffffff90,
> +		0x80000101, 0x00010000, 0x00000000, 0x00000000,
> +	}}
> +};
> +
> +struct iga64_template const iga64_code_jump[] = {
> +	{ .gen_ver = 1250, .size = 8, .code = (const uint32_t []) {
> +		0x80000020, 0x00004000, 0x00000000, 0x00000000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 0, .size = 8, .code = (const uint32_t []) {
> +		0x80000020, 0x00004000, 0x00000000, 0x00000000,
> +		0x80000101, 0x00010000, 0x00000000, 0x00000000,
> +	}}
> +};
> +
>  struct iga64_template const iga64_code_eot[] = {
>  	{ .gen_ver = 2000, .size = 8, .code = (const uint32_t []) {
>  		0x800c0061, 0x70050220, 0x00460005, 0x00000000,
> @@ -114,3 +491,25 @@ struct iga64_template const iga64_code_eot[] = {
>  		0x80049031, 0x00000004, 0x7020700c, 0x10000000,
>  	}}
>  };
> +
> +struct iga64_template const iga64_code_nop[] = {
> +	{ .gen_ver = 1250, .size = 8, .code = (const uint32_t []) {
> +		0x00000060, 0x00000000, 0x00000000, 0x00000000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 0, .size = 8, .code = (const uint32_t []) {
> +		0x00000060, 0x00000000, 0x00000000, 0x00000000,
> +		0x80000101, 0x00010000, 0x00000000, 0x00000000,
> +	}}
> +};
> +
> +struct iga64_template const iga64_code_sync_host[] = {
> +	{ .gen_ver = 1250, .size = 8, .code = (const uint32_t []) {
> +		0x80000001, 0x00010000, 0xf0000000, 0x00000000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 0, .size = 8, .code = (const uint32_t []) {
> +		0x80000001, 0x00010000, 0xf0000000, 0x00000000,
> +		0x80000101, 0x00010000, 0x00000000, 0x00000000,
> +	}}
> +};
> -- 
> 2.34.1
> 
