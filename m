Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF6D606A31C
	for <igt-dev@archiver.kernel.org>; Mon,  9 Nov 2026 15:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CyQnnh9k
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB38510E387;
	Mon,  9 Nov 2026 15:39:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED8C10E387
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Nov 2026 15:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794238729; x=1825774729;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=atPtoJneQ3kbkEyQnpEqnPcI3HIHejAlkBmgaO9GsyM=;
 b=CyQnnh9kfCOZfeE3gJIWIZbTRcSZXbiY5mFe37oy9uZvMRnLHWpZso/r
 gl2V45VQ/Tdou+imD0sZX3YciiAEfVHrDToibINpHoybB4mNP4i3yx3LA
 lx/2l3CwsE6xSc1yioiXjaoZqrFDoyG4ULWPd4p/rd+XFtNGqruJj0bIY
 +Z8EEUqYX9SwpzxV/DigjuNmY5Y/mmsbXnw6q0iWrjrzoOhUALv3TqRqh
 XUuPhY0Kq9mc1x56sTfnG8KPdgsU80/p5p9qynSh2NV/J1FsJVZwtQVKY
 Nd9ayIof9vNOXqez0S5BgepEEfW1oq9JXhA4nY0YkfRyNbXIsebA0kQpC Q==;
X-CSE-ConnectionGUID: vpfZ8AUJT3+rbTG467lQXg==
X-CSE-MsgGUID: 14SsYhsBTGe8KbuuyLXglQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2861014"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="2861014"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 07:38:49 -0800
X-CSE-ConnectionGUID: Bmr4a6P5T926+4j/5Y8qRw==
X-CSE-MsgGUID: YrrMc+UGSUm2KNleZwuiEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="8332371"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.65])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 07:38:45 -0800
Date: Mon, 9 Nov 2026 16:38:42 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
Subject: Re: [PATCH v3 1/2] lib/shaders: remove explicit regioning and
 channel offsets
Message-ID: <3tkingsudo5qx62asb2pbh7s4yjd7rorrvqufzoy5gjvztuwh7@l5oiyx2wcffw>
References: <20261106-remove_gpu_asm_annotations-v3-0-f3c1e3cb71d7@intel.com>
 <20261106-remove_gpu_asm_annotations-v3-1-f3c1e3cb71d7@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261106-remove_gpu_asm_annotations-v3-1-f3c1e3cb71d7@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 03:07:54PM +0100, Andrzej Hajda wrote:
> There is no need to specify regioning and channel offset in
> most cases. Default genisa values are:
> - <0;1,0> for source region,
> - <1> for destination region,
> - M0 for channel offset.
> The patch also enforces common formating for all asms:
> - preprocessor instructions and predicates start from beginning of the line,
> - instruction mnemonic starts from 1st tab,
> - mnemonic is followed by exec size without space,
> - flag modifiers, if any, are placed after exec size,
> - arguments starts from 3rd tab,
> - args are tab aligned per shader - argN should be place at the same column
> 
> The changes do not affect produced binary code.

LGTM, maybe in followup you can try removing @1, imo with auto-deps
result should be same.

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>  lib/gpgpu_fill.c                     | 100 +++++++++++++-------------
>  lib/gpgpu_fill.c.gen.iga64_codes.c   |   2 +-
>  lib/gpgpu_shader.c                   | 132 +++++++++++++++++------------------
>  lib/gpgpu_shader.c.gen.iga64_codes.c |   2 +-
>  lib/iga64_macros.h                   |  58 +++++++--------
>  5 files changed, 147 insertions(+), 147 deletions(-)
> 
> diff --git a/lib/gpgpu_fill.c b/lib/gpgpu_fill.c
> index b351a14cd6b5..2d66dd9eb177 100644
> --- a/lib/gpgpu_fill.c
> +++ b/lib/gpgpu_fill.c
> @@ -294,22 +294,22 @@ static struct gpgpu_shader *__xehp_gpgpu_kernel(int fd, struct intel_buf *buf)
>  
>  	emit_iga64_code(kernel, gpgpu_fill, R"(
>  // fill up r1 with target colour
> -mov (4|M0)		r1.0<1>:ub	r1.0<0;1,0>:ub
> +	mov(4)		r1.0:ub		r1.0:ub
>  // prepare block x offset (Thread Group Id X * 16)
> -shl (1|M0)		r2.0<1>:ud	r0.1<0;1,0>:ud	0x4:ud
> +	shl(1)		r2.0:ud		r0.1:ud		0x4:ud
>  // prepare block y offset (Thread Group Id Y)
> -mov (1|M0)		r2.1<1>:ud	r0.6<0;1,0>:ud
> +	mov(1)		r2.1:ud		r0.6:ud
>  // zero message header payload
> -mov (8|M0)		r4.0<1>:ud	0x0:ud
> +	mov(8)		r4.0:ud		0x0:ud
>  // fill up message payload with target colour
> -mov (16|M0)		r5.0<1>:ud	r1.0<0;1,0>:ud
> +	mov(16)		r5.0:ud		r1.0:ud
>  #if GFX_VER < 2000
>  // load block offsets into message header payload
> -mov (2|M0)		r4.0<1>:ud	r2.0<2;2,1>:ud
> +	mov(2)		r4.0:ud		r2.0<2;2,1>:ud
>  // load block width
> -mov (1|M0)		r4.2<1>:ud	0xF:ud
> +	mov(1)		r4.2:ud		0xF:ud
>  // load FFTID from R0 header
> -mov (1|M0)		r4.4<1>:ud	r0.5<0;1,0>:ud
> +	mov(1)		r4.4:ud		r0.5:ud
>  // Media block write to bti[0] surface
>  // Message Descriptor
>  //	0x40A8000:
> @@ -318,12 +318,12 @@ mov (1|M0)		r4.4<1>:ud	r0.5<0;1,0>:ud
>  //	[19]		Header: 1 (included)
>  //	[18:14]		MessageType: 0xA (media block write)
>  //	[7:0]		BTI: 0
> -send.dc1 (16|M0)	null	r4	src1_null	0x0	0x40A8000
> +	send.dc1(16)	null		r4		src1_null	0x0	0x40A8000
>  #elif GFX_VER < 3000
>  // load block offsets into message header payload
> -mov (2|M0)		r4.5<1>:ud	r2.0<2;2,1>:ud
> +	mov(2)		r4.5:ud		r2.0<2;2,1>:ud
>  // load block width
> -mov (1|M0)		 r4.14<1>:w	0xF:w
> +	mov(1)		r4.14:w		0xF:w
>  // Typed 2D block store to bti[0] surface
>  // Message Descriptor
>  //	0x6400007:
> @@ -332,21 +332,21 @@ mov (1|M0)		 r4.14<1>:w	0xF:w
>  //	[24:20]		Rlen: 0
>  //	[19:17]		Caching: 0  (use state settings for both L1 and L3)
>  //	[5:0]		Opcode: 0x07  (store_block2d)
> -send.tgm (16|M0)	null	r4	null	0x0	0x64000007
> +	send.tgm(16)	null		r4		null		0x0	0x64000007
>  #else
>  // load A64 base surface state offset into address payload
> -mov (1|M0)		r4.0<1>:ud	ARG(0):ud
> -mov (1|M0)		r4.1<1>:ud	ARG(1):ud
> +	mov(1)		r4.0:ud		ARG(0):ud
> +	mov(1)		r4.1:ud		ARG(1):ud
>  // load surface width
> -mov (1|M0)		r4.2<1>:ud	ARG(2):ud
> +	mov(1)		r4.2:ud		ARG(2):ud
>  // load surface height
> -mov (1|M0)		r4.3<1>:ud	ARG(3):ud
> +	mov(1)		r4.3:ud		ARG(3):ud
>  // load surface pitch
> -mov (1|M0)		r4.4<1>:ud	ARG(4):ud
> +	mov(1)		r4.4:ud		ARG(4):ud
>  // load block offsets
> -mov (2|M0)		r4.5<1>:ud	r2.0<2;2,1>:ud
> +	mov(2)		r4.5:ud		r2.0<2;2,1>:ud
>  // load block width
> -mov (1|M0)		r4.14<1>:w	0xF:w
> +	mov(1)		r4.14:w		0xF:w
>  // Untyped 2D block store
>  // Message Descriptor
>  //	bspec:63981
> @@ -358,7 +358,7 @@ mov (1|M0)		r4.14<1>:w	0xF:w
>  //	[15]		DataOrder: 0  non-transposed
>  //	[11:9]		DataSize: 0  (8b per data element)
>  //	[5:0]		Opcode: 0x07  (store_block2d)
> -send.ugm (1|M0)		null	r4	r5:1	0x0	0x2020007
> +	send.ugm(1)	null		r4		r5:1		0x0	0x2020007
>  #endif
>  	)", offset & 0xffffffff, offset >> 32,
>  	intel_buf_width(buf) * buf->bpp/8 - 1, intel_buf_height(buf) - 1,
> @@ -392,49 +392,49 @@ static struct gpgpu_shader *__xe3p_gpgpu_kernel(int xe)
>  #define TMP		r3.7
>  #define ADDR_LO		r4.0
>  #if GFX_VER >= 3500
> -(W)	add (1)		XEND<1>:ud	XPOS:ud		WIDTH:ud
> -(W)	mov (1)		OFFSET<1>:ud	0x0:ud
> +(W)	add(1)		XEND:ud		XPOS:ud		WIDTH:ud
> +(W)	mov(1)		OFFSET:ud	0x0:ud
>  
> -(W)	shl (1)		XOFFSET<1>:ud	RX:ud		0x4:ud
> -(W)	add (1)		XOFFSET<1>:ud	XOFFSET:ud	XPOS:ud
> -(W)	mov (1)		XCURRENT<1>:ud	XOFFSET:ud
> +(W)	shl(1)		XOFFSET:ud	RX:ud		0x4:ud
> +(W)	add(1)		XOFFSET:ud	XOFFSET:ud	XPOS:ud
> +(W)	mov(1)		XCURRENT:ud	XOFFSET:ud
>  
> -(W)	add (1)		TMP<1>:ud	RY:ud		YPOS:ud
> -(W)	mul (1)		YOFFSET<1>:ud	TMP:ud		SURFWIDTH:ud
> -(W)	add (1)		OFFSET<1>:ud	XOFFSET:ud	YOFFSET:ud
> +(W)	add(1)		TMP:ud		RY:ud		YPOS:ud
> +(W)	mul(1)		YOFFSET:ud	TMP:ud		SURFWIDTH:ud
> +(W)	add(1)		OFFSET:ud	XOFFSET:ud	YOFFSET:ud
>  
>  // Set base address with scalar register
> -(W)	add (1)		ADDR_LO<1>:ud	OFFSET:ud	ADDR_BO_LOW:ud
> -(W)	mov (1)		s0.0<1>:ud	ADDR_LO:ud
> -(W)	mov (1)		s0.1<1>:ud	ADDR_BO_HIGH:ud
> +(W)	add(1)		ADDR_LO:ud	OFFSET:ud	ADDR_BO_LOW:ud
> +(W)	mov(1)		s0.0:ud		ADDR_LO:ud
> +(W)	mov(1)		s0.1:ud		ADDR_BO_HIGH:ud
>  
>  // color
> -(W)	mov (4)		r20.0<1>:ub		COLOR:ub
> +(W)	mov(4)		r20.0:ub	COLOR:ub
>  
>  // A64 offset
> -(W)	mov (8)		r30.0<1>:uq		0x0:uq
> +(W)	mov(8)		r30.0:uq	0x0:uq
>  
>  //dword: 0
> -(W)	cmp (1)		(lt)f0.0 null:ud        XCURRENT:ud	XEND:ud
> -(W&f0.0)sendg.ugm (1)	null	r30:1	r20:1	s0.0	0x29404
> +(W)	cmp(1)(lt)f0.0	null:ud		XCURRENT:ud	XEND:ud
> +(W&f0.0)sendg.ugm(1)	null		r30:1		r20:1	s0.0	0x29404
>  //dword: 1
> -(W)	add (1)		XCURRENT<1>:ud		XCURRENT:ud	4:ud
> -(W)	add (1)		ADDR_LO<1>:ud		ADDR_LO:ud	0x4:ud
> -(W)	mov (1)		s0.0<1>:ud		ADDR_LO:ud
> -(W)	cmp (1)		(lt)f0.0 null:ud        XCURRENT:ud	XEND:ud
> -(W&f0.0)sendg.ugm (1)	null	r30:1	r20:1	s0.0	0x29404
> +(W)	add(1)		XCURRENT:ud	XCURRENT:ud	4:ud
> +(W)	add(1)		ADDR_LO:ud	ADDR_LO:ud	0x4:ud
> +(W)	mov(1)		s0.0:ud		ADDR_LO:ud
> +(W)	cmp(1)(lt)f0.0	null:ud		XCURRENT:ud	XEND:ud
> +(W&f0.0)sendg.ugm(1)	null		r30:1		r20:1	s0.0	0x29404
>  //dword: 2
> -(W)	add (1)		XCURRENT<1>:ud		XCURRENT:ud	4:ud
> -(W)	add (1)		ADDR_LO<1>:ud		ADDR_LO:ud	0x4:ud
> -(W)	mov (1)		s0.0<1>:ud		ADDR_LO:ud
> -(W)	cmp (1)		(lt)f0.0 null:ud        XCURRENT:ud	XEND:ud
> -(W&f0.0)sendg.ugm (1)	null	r30:1	r20:1	s0.0	0x29404
> +(W)	add(1)		XCURRENT:ud	XCURRENT:ud	4:ud
> +(W)	add(1)		ADDR_LO:ud	ADDR_LO:ud	0x4:ud
> +(W)	mov(1)		s0.0:ud		ADDR_LO:ud
> +(W)	cmp(1)(lt)f0.0	null:ud		XCURRENT:ud	XEND:ud
> +(W&f0.0)sendg.ugm(1)	null		r30:1		r20:1	s0.0	0x29404
>  //dword: 3
> -(W)	add (1)		XCURRENT<1>:ud		XCURRENT:ud	4:ud
> -(W)	add (1)		ADDR_LO<1>:ud		ADDR_LO:ud	0x4:ud
> -(W)	mov (1)		s0.0<1>:ud		ADDR_LO:ud
> -(W)	cmp (1)		(lt)f0.0 null:ud        XCURRENT:ud	XEND:ud
> -(W&f0.0)sendg.ugm (1)	null	r30:1	r20:1	s0.0	0x29404
> +(W)	add(1)		XCURRENT:ud	XCURRENT:ud	4:ud
> +(W)	add(1)		ADDR_LO:ud	ADDR_LO:ud	0x4:ud
> +(W)	mov(1)		s0.0:ud		ADDR_LO:ud
> +(W)	cmp(1)(lt)f0.0	null:ud		XCURRENT:ud	XEND:ud
> +(W&f0.0)sendg.ugm(1)	null		r30:1		r20:1	s0.0	0x29404
>  #endif
>  )");
>  
> diff --git a/lib/gpgpu_fill.c.gen.iga64_codes.c b/lib/gpgpu_fill.c.gen.iga64_codes.c
> index 19905659e9b4..467a2686f86c 100644
> --- a/lib/gpgpu_fill.c.gen.iga64_codes.c
> +++ b/lib/gpgpu_fill.c.gen.iga64_codes.c
> @@ -3,7 +3,7 @@
>  
>  #include "gpgpu_shader.h"
>  
> -#define MD5_SUM_IGA64_ASMS 50a6ea7d435db3bab74c742ce25265c0
> +#define MD5_SUM_IGA64_ASMS 0a2221edb21775cf2319cd7240765ec4
>  
>  struct iga64_template const iga64_code_xe3p_gpgpu_fill[] = {
>  	{ .gfx_ver = 3500, .size = 144, .code = (const uint32_t []) {
> diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
> index ea13fd3c7de8..32a777c519da 100644
> --- a/lib/gpgpu_shader.c
> +++ b/lib/gpgpu_shader.c
> @@ -553,7 +553,7 @@ void gpgpu_shader__breakpoint(struct gpgpu_shader *shdr)
>  void gpgpu_shader__wait(struct gpgpu_shader *shdr)
>  {
>  	emit_iga64_code(shdr, sync_host, R"(
> -(W)	sync.host	        null
> +(W)	sync.host	null
>  	)");
>  }
>  
> @@ -580,20 +580,20 @@ void gpgpu_shader__eot(struct gpgpu_shader *shdr)
>  {
>  	if (shdr->vrt == VRT_96)
>  		emit_iga64_code(shdr, eot_vrt, R"(
> -(W)	mov (8|M0)               r80.0<1>:ud  r0.0<8;8,1>:ud
> -(W)	send.gtwy (8|M0)         null r80 src1_null     0 0x02000000 {EOT}
> +(W)	mov(8)		r80.0:ud	r0.0<8;8,1>:ud
> +(W)	send.gtwy(8)	null		r80	src1_null	0	0x02000000	{EOT}
>  		)");
>  	else
>  		emit_iga64_code(shdr, eot, R"(
> -(W)	mov (8|M0)               r112.0<1>:ud  r0.0<8;8,1>:ud
> +(W)	mov(8)		r112.0:ud	r0.0<8;8,1>:ud
>  #if GFX_VER < 1250
> -(W)	send.ts (16|M0)          null r112 null 0x10000000 0x02000010 {EOT,@1}
> +(W)	send.ts(16)	null		r112	null		0x10000000	0x02000010	{EOT,@1}
>  
>  #elif GFX_VER <= 3000
> -(W)	send.gtwy (8|M0)         null r112 src1_null     0 0x02000000 {EOT}
> +(W)	send.gtwy(8)	null		r112	src1_null	0		0x02000000	{EOT}
>  
>  #else
> -(W)	sendg.gtwy (1|M0)        null     r0:1  null:0  0x0 {EOT}
> +(W)	sendg.gtwy(1)	null		r0:1	null:0		0x0		{EOT}
>  #endif
>  		)");
>  }
> @@ -653,7 +653,7 @@ void gpgpu_shader__jump(struct gpgpu_shader *shdr, int label_id)
>  
>  	shader_size = emit_iga64_code(shdr, jump, R"(
>  L0:
> -(W)	jmpi        L0
> +(W)	jmpi		L0
>  	)");
>  
>  	__patch_indexed_jump(shdr, label_id, shader_size);
> @@ -676,12 +676,12 @@ void gpgpu_shader__jump_neq(struct gpgpu_shader *shdr, int label_id,
>  
>  	size = emit_iga64_code(shdr, jump_dw_neq, R"(
>  L0:
> -		SET_SHARED_SPACE_ADDR(r30, ARG(0):ud, 4)
> -(W)		LOAD_SPACE_DW(r31, r30)
> -	// clear the flag register
> -(W)		mov (1|M0)               f0.0<1>:ud    0x0:ud
> -(W)		cmp (1|M0)    (ne)f0.0   null<1>:ud     r31.0<0;1,0>:ud   ARG(1):ud
> -(W&f0.0)	jmpi                     L0
> +	SET_SHARED_SPACE_ADDR(r30, ARG(0):ud, 4)
> +(W)	LOAD_SPACE_DW(r31, r30)
> +// clear the flag register
> +(W)	mov(1)		f0.0:ud		0x0:ud
> +(W)	cmp(1)(ne)f0.0	null:ud		r31.0:ud	ARG(1):ud
> +(W&f0.0)jmpi		L0
>  	)", y_offset, value);
>  
>  	__patch_indexed_jump(shdr, label_id, size);
> @@ -701,7 +701,7 @@ void gpgpu_shader__loop_begin(struct gpgpu_shader *shdr, int label_id)
>  {
>  	emit_iga64_code(shdr, clear_r40, R"(
>  L0:
> -(W)	mov (1|M0)               r40:ud    0x0:ud
> +(W)	mov(1)		r40:ud	0x0:ud
>  	)");
>  
>  	gpgpu_shader__label(shdr, label_id);
> @@ -721,10 +721,10 @@ void gpgpu_shader__loop_end(struct gpgpu_shader *shdr, int label_id, uint32_t it
>  
>  	size = emit_iga64_code(shdr, inc_r40_jump_neq, R"(
>  L0:
> -(W)		add (1|M0)              r40:ud          r40.0<0;1,0>:ud 0x1:ud
> -(W)		mov (1|M0)              f0.0<1>:ud      0x0:ud
> -(W)		cmp (1|M0)    (ne)f0.0   null<1>:ud     r40.0<0;1,0>:ud   ARG(0):ud
> -(W&f0.0)	jmpi                     L0
> +(W)	add(1)		r40:ud		r40.0:ud	0x1:ud
> +(W)	mov(1)		f0.0:ud		0x0:ud
> +(W)	cmp(1)(ne)f0.0	null:ud		r40.0:ud	ARG(0):ud
> +(W&f0.0)jmpi		L0
>  	)", iter);
>  
>  	__patch_indexed_jump(shdr, label_id, size);
> @@ -742,11 +742,11 @@ void gpgpu_shader__common_target_write(struct gpgpu_shader *shdr,
>  				       uint32_t y_offset, const uint32_t value[4])
>  {
>  	emit_iga64_code(shdr, common_target_write, R"(
> -(W)	mov (16|M0)		r31.0<1>:ud	0x0:ud
> -(W)	mov (1|M0)		r31.0<1>:ud	ARG(1):ud
> -(W)	mov (1|M0)		r31.1<1>:ud	ARG(2):ud
> -(W)	mov (1|M0)		r31.2<1>:ud	ARG(3):ud
> -(W)	mov (1|M0)		r31.3<1>:ud	ARG(4):ud
> +(W)	mov(16)		r31.0:ud	0x0:ud
> +(W)	mov(1)		r31.0:ud	ARG(1):ud
> +(W)	mov(1)		r31.1:ud	ARG(2):ud
> +(W)	mov(1)		r31.2:ud	ARG(3):ud
> +(W)	mov(1)		r31.3:ud	ARG(4):ud
>  	SET_SHARED_SPACE_ADDR(r30, ARG(0):ud, 16)
>  (W)	STORE_SPACE_DW(r30, r31)
>  	)", y_offset, value[0], value[1], value[2], value[3]);
> @@ -779,8 +779,8 @@ void gpgpu_shader__common_target_write_u32(struct gpgpu_shader *shdr,
>  void gpgpu_shader__write_aip(struct gpgpu_shader *shdr, uint32_t y_offset)
>  {
>  	emit_iga64_code(shdr, media_block_write_aip, R"(
> -	// Payload
> -(W)	mov (1|M0)               r5.0<1>:ud    cr0.2:ud
> +// Payload
> +(W)	mov(1)		r5.0:ud		cr0.2:ud
>  	SET_THREAD_SPACE_ADDR(r4, 0, ARG(0):ud, 4)
>  (W)	STORE_SPACE_DW(r4, r5)
>  	)", y_offset);
> @@ -796,7 +796,7 @@ void gpgpu_shader__write_aip(struct gpgpu_shader *shdr, uint32_t y_offset)
>  void gpgpu_shader__increase_aip(struct gpgpu_shader *shdr, uint32_t value)
>  {
>  	emit_iga64_code(shdr, write_aip, R"(
> -(W)	add (1|M0)		cr0.2:ud	cr0.2:ud	ARG(0):ud
> +(W)	add(1)		cr0.2:ud	cr0.2:ud	ARG(0):ud
>  	)", value);
>  }
>  
> @@ -812,7 +812,7 @@ void gpgpu_shader__write_dword(struct gpgpu_shader *shdr, uint32_t value,
>  			       uint32_t y_offset)
>  {
>  	emit_iga64_code(shdr, media_block_write, R"(
> -(W)	mov (1)		r5.0<1>:ud    ARG(1):ud
> +(W)	mov(1)		r5.0:ud		ARG(1):ud
>  	SET_THREAD_SPACE_ADDR(r4, 0, ARG(0):ud, 4)
>  (W)	STORE_SPACE_DW(r4, r5)
>  	)", y_offset, value);
> @@ -828,7 +828,7 @@ void gpgpu_shader__write_dword(struct gpgpu_shader *shdr, uint32_t value,
>  void gpgpu_shader__clear_exception(struct gpgpu_shader *shdr, uint32_t value)
>  {
>  	emit_iga64_code(shdr, clear_exception, R"(
> -(W)	and (1|M0) cr0.1<1>:ud cr0.1<0;1,0>:ud ARG(0):ud
> +(W)	and(1)		cr0.1:ud	cr0.1:ud	ARG(0):ud
>  	)", ~value);
>  }
>  
> @@ -842,7 +842,7 @@ void gpgpu_shader__clear_exception(struct gpgpu_shader *shdr, uint32_t value)
>  void gpgpu_shader__set_exception(struct gpgpu_shader *shdr, uint32_t value)
>  {
>  	emit_iga64_code(shdr, set_exception, R"(
> -(W)	or (1|M0) cr0.1<1>:ud cr0.1<0;1,0>:ud ARG(0):ud
> +(W)	or(1)		cr0.1:ud	cr0.1:ud	ARG(0):ud
>  	)", value);
>  }
>  
> @@ -863,13 +863,13 @@ void gpgpu_shader__write_on_exception(struct gpgpu_shader *shdr, uint32_t value,
>  				      uint32_t y_offset, uint32_t mask, uint32_t expected)
>  {
>  	emit_iga64_code(shdr, write_on_exception, R"(
> -(W)	mov (1|M0)		r5.0<1>:ud	ARG(2):ud
> +(W)	mov(1)		r5.0:ud		ARG(2):ud
>  	SET_THREAD_SPACE_ADDR(r4, ARG(0), ARG(1):ud, 4)
> -	// Check if masked exception is equal to provided value and write conditionally
> -(W)     and (1|M0)		r3.0<1>:ud     cr0.1<0;1,0>:ud ARG(3):ud
> -(W)     mov (1|M0)		f0.0<1>:ud     0x0:ud
> -(W)     cmp (1|M0) (eq)f0.0	null:ud        r3.0<0;1,0>:ud  ARG(4):ud
> -(W&f0.0) STORE_SPACE_DW(r4, r5)
> +// Check if masked exception is equal to provided value and write conditionally
> +(W)	and(1)		r3.0:ud		cr0.1:ud	ARG(3):ud
> +(W)	mov(1)		f0.0:ud		0x0:ud
> +(W)	cmp(1)(eq)f0.0	null:ud		r3.0:ud		ARG(4):ud
> +(W&f0.0)STORE_SPACE_DW(r4, r5)
>  	)", 4 * x_offset, y_offset, value, mask, expected);
>  }
>  
> @@ -890,13 +890,13 @@ void gpgpu_shader__end_system_routine(struct gpgpu_shader *shdr,
>  	 */
>  	if (breakpoint_suppress)
>  		emit_iga64_code(shdr, breakpoint_suppress, R"(
> -(W)	or  (1|M0)               cr0.0<1>:ud   cr0.0<0;1,0>:ud   0x8000:ud
> +(W)	or(1)		cr0.0:ud	cr0.0:ud	0x8000:ud
>  		)");
>  
>  	emit_iga64_code(shdr, end_system_routine, R"(
> -(W)	and (1|M0)               cr0.1<1>:ud   cr0.1<0;1,0>:ud   ARG(0):ud
> -	// return to an application
> -(W)	and (1|M0)               cr0.0<1>:ud   cr0.0<0;1,0>:ud   0x7FFFFFFD:ud
> +(W)	and(1)		cr0.1:ud	cr0.1:ud	ARG(0):ud
> +// return to an application
> +(W)	and(1)		cr0.0:ud	cr0.0:ud	0x7FFFFFFD:ud
>  	)", 0x7fffff | (1 << 26)); /* clear all exceptions, except read only bit */
>  }
>  
> @@ -915,16 +915,16 @@ void gpgpu_shader__end_system_routine_step_if_eq(struct gpgpu_shader *shdr,
>  						 uint32_t value)
>  {
>  	emit_iga64_code(shdr, end_system_routine_step_if_eq, R"(
> -(W)		or  (1|M0)               cr0.0<1>:ud   cr0.0<0;1,0>:ud   0x8000:ud
> -(W)		and (1|M0)               cr0.1<1>:ud   cr0.1<0;1,0>:ud   ARG(0):ud
> -		SET_SHARED_SPACE_ADDR(r30, ARG(0):ud, 4)
> -(W)		LOAD_SPACE_DW(r31, r30)
> -		// clear the flag register
> -(W)		mov (1|M0)               f0.0<1>:ud    0x0:ud
> -(W)		cmp (1|M0)    (ne)f0.0   null<1>:ud     r31.0<0;1,0>:ud   ARG(2):ud
> -(W&f0.0)	and (1|M0)              cr0.1<1>:ud     cr0.1<0;1,0>:ud   ARG(3):ud
> -		// return to an application
> -(W)		and (1|M0)               cr0.0<1>:ud   cr0.0<0;1,0>:ud   0x7FFFFFFD:ud
> +(W)	or(1)		cr0.0:ud	cr0.0:ud	0x8000:ud
> +(W)	and(1)		cr0.1:ud	cr0.1:ud	ARG(0):ud
> +	SET_SHARED_SPACE_ADDR(r30, ARG(0):ud, 4)
> +(W)	LOAD_SPACE_DW(r31, r30)
> +// clear the flag register
> +(W)	mov(1)		f0.0:ud		0x0:ud
> +(W)	cmp(1)(ne)f0.0	null:ud		r31.0:ud	ARG(2):ud
> +(W&f0.0)and(1)		cr0.1:ud	cr0.1:ud	ARG(3):ud
> +// return to an application
> +(W)	and(1)		cr0.0:ud	cr0.0:ud	0x7FFFFFFD:ud
>  	)", 0x807fffff, /* leave breakpoint exception */
>  	y_offset, value, 0x7fffff /* clear all exceptions */ );
>  }
> @@ -967,17 +967,17 @@ void gpgpu_shader__write_a64_d32(struct gpgpu_shader *shdr, uint64_t ppgtt_addr,
>  // [95:64] Untyped 2D Surface Width: 0x3f (width is 64 bytes)
>  // [63:0] Untyped 2D Surface Base Address
>  // initialize register
> -(W)	mov (8)			r30.0<1>:uq	0x0:uq
> +(W)	mov(8)		r30.0:uq	0x0:uq
>  // [31:0] Untyped 2D Surface Base Address low
> -(W)	mov (1)			r30.0<1>:ud	ARG(0):ud
> +(W)	mov(1)		r30.0:ud	ARG(0):ud
>  // [63:32] Untyped 2D Surface Base Address high
> -(W)	mov (1)			r30.1<1>:ud ARG(1):ud
> +(W)	mov(1)		r30.1:ud	ARG(1):ud
>  // [95:64] Untyped 2D Surface Width: 0x3f
>  //	   (Width minus 1 (in bytes) of the 2D surface, it represents 64)
> -(W)	mov (1)			r30.2<1>:ud	0x3f:ud
> +(W)	mov(1)		r30.2:ud	0x3f:ud
>  // [159:128] Untyped 2D Surface Pitch: 0x3f
>  //	     (Pitch minus 1 (in bytes) of the 2D surface, it represents 64)
> -(W)	mov (1)			r30.4<1>:ud	0x3f:ud
> +(W)	mov(1)		r30.4:ud	0x3f:ud
>  // [231:224] Block Width: 0x3 (4 bytes)
>  //	     (Specifies the width minus 1 (in number of data elements) for this
>  //	     rectangular region, it represents 4)
> @@ -988,13 +988,13 @@ void gpgpu_shader__write_a64_d32(struct gpgpu_shader *shdr, uint64_t ppgtt_addr,
>  // [243:240] Array Length: 0
>  //	     (Specifies Array Length minus 1 for Load2DBlockArray messages,
>  //	     must be zero for 2D Block Store messages, it represents 1)
> -(W)	mov (1)			r30.7<1>:ud	0x3:ud
> +(W)	mov(1)		r30.7:ud	0x3:ud
>  // src1 data payload size
>  // Block Height x Block Width x Data size / GRF Register size
>  //	=> 1 x 16 x 32bit / 512bit = 1
>  // data payload size is 1
> -(W)	mov (8)			r31.0<1>:uq	0x0:uq
> -(W)	mov (1|M0)		r31.0<1>:ud	ARG(2):ud
> +(W)	mov(8)		r31.0:uq	0x0:uq
> +(W)	mov(1)		r31.0:ud	ARG(2):ud
>  // send.ugm Untyped 2D Block Array Store
>  // Format: send.ugm (1) dst src0 src1 ExtMsg MsgDesc
>  // Execution Mask restriction: SIMT1
> @@ -1014,7 +1014,7 @@ void gpgpu_shader__write_a64_d32(struct gpgpu_shader *shdr, uint64_t ppgtt_addr,
>  // [19:16] Cache : 2 (L1UC_L3UC)
>  // [11:9] Data Size: 2 (D32)
>  // [5:0] Store Operation: 7
> -(W)	send.ugm (1)		null	r30	r31:1	0x0	0x2020407
> +(W)	send.ugm(1)	null		r30	r31:1	0x0	0x2020407
>  #endif
>  	)", lower_32_bits(addr), upper_32_bits(addr), value);
>  }
> @@ -1055,17 +1055,17 @@ void gpgpu_shader__read_a64_d32(struct gpgpu_shader *shdr, uint64_t ppgtt_addr)
>  // [95:64] Untyped 2D Surface Width: 0x3f (width is 64 bytes)
>  // [63:0] Untyped 2D Surface Base Address
>  // initialize register
> -(W)	mov (8)			r30.0<1>:uq	0x0:uq
> +(W)	mov(8)		r30.0:uq	0x0:uq
>  // [31:0] Untyped 2D Surface Base Address low
> -(W)	mov (1)			r30.0<1>:ud	ARG(0):ud
> +(W)	mov(1)		r30.0:ud	ARG(0):ud
>  // [63:32] Untyped 2D Surface Base Address high
> -(W)	mov (1)			r30.1<1>:ud ARG(1):ud
> +(W)	mov(1)		r30.1:ud	ARG(1):ud
>  // [95:64] Untyped 2D Surface Width: 0x3f
>  //	   (Width minus 1 (in bytes) of the 2D surface, it represents 64)
> -(W)	mov (1)			r30.2<1>:ud	0x3f:ud
> +(W)	mov(1)		r30.2:ud	0x3f:ud
>  // [159:128] Untyped 2D Surface Pitch: 0x3f
>  //	     (Pitch minus 1 (in bytes) of the 2D surface, it represents 64)
> -(W)	mov (1)			r30.4<1>:ud	0x3f:ud
> +(W)	mov(1)		r30.4:ud	0x3f:ud
>  // [231:224] Block Width: 0x3 (4 bytes)
>  //	     (Specifies the width minus 1 (in number of data elements) for this
>  //	     rectangular region, it represents 4)
> @@ -1076,7 +1076,7 @@ void gpgpu_shader__read_a64_d32(struct gpgpu_shader *shdr, uint64_t ppgtt_addr)
>  // [243:240] Array Length: 0
>  //	     (Specifies Array Length minus 1 for Load2DBlockArray messages,
>  //	     must be zero for 2D Block Store messages, it represents 1)
> -(W)	mov (1)			r30.7<1>:ud	0x3:ud
> +(W)	mov(1)		r30.7:ud	0x3:ud
>  //
>  // dest data payload format is selected by Data Size.
>  // Block Height x Block Width x Data size / GRF Register size
> @@ -1104,7 +1104,7 @@ void gpgpu_shader__read_a64_d32(struct gpgpu_shader *shdr, uint64_t ppgtt_addr)
>  // [11:9] Data Size: 2 (D32) 10
>  // [7] VNNI Transform: 0
>  // [5:0] Load Operation: 3 (Load 2D Block) 11
> -(W)	send.ugm (1)		r31	r30	null	0x0	0x2128403
> +(W)	send.ugm(1)	r31		r30	null	0x0	0x2128403
>  #endif
>  	)", lower_32_bits(addr), upper_32_bits(addr));
>  }
> diff --git a/lib/gpgpu_shader.c.gen.iga64_codes.c b/lib/gpgpu_shader.c.gen.iga64_codes.c
> index a279f1dc7d71..c03914a69a7e 100644
> --- a/lib/gpgpu_shader.c.gen.iga64_codes.c
> +++ b/lib/gpgpu_shader.c.gen.iga64_codes.c
> @@ -3,7 +3,7 @@
>  
>  #include "gpgpu_shader.h"
>  
> -#define MD5_SUM_IGA64_ASMS 4068ae55c6aa50d845b74f5d61da4630
> +#define MD5_SUM_IGA64_ASMS a428d5bacd5eeee4ee187971ec476f48
>  
>  struct iga64_template const iga64_code_read_a64_d32[] = {
>  	{ .gfx_ver = 2000, .size = 40, .code = (const uint32_t []) {
> diff --git a/lib/iga64_macros.h b/lib/iga64_macros.h
> index 26d41387a1c5..17acac4d0ed8 100644
> --- a/lib/iga64_macros.h
> +++ b/lib/iga64_macros.h
> @@ -17,55 +17,55 @@
>  #endif
>  
>  /* GPGPU_R0Payload fields, Bspec: 55396, 56587 */
> -#define R0_TGIDX r0.1<0;1,0>:ud
> -#define R0_TGIDY r0.6<0;1,0>:ud
> -#define R0_FFTID r0.5<0;1,0>:ud
> +#define R0_TGIDX r0.1:ud
> +#define R0_TGIDY r0.6:ud
> +#define R0_FFTID r0.5:ud
>  
>  /* Inline data from COMPUTE_WALKER*, Bspec: 47203, 73584
>   * Filled by __xe*_gpgpu_execfunc.
>   */
> -#define R1_TGT_ADDRESS r1.0<0;1,0>:uq
> -#define R1_TGT_WIDTH r1.2<0;1,0>:ud
> -#define R1_TGT_HEIGHT r1.3<0;1,0>:ud
> -#define R1_DIM_X r1.4<0;1,0>:ud
> +#define R1_TGT_ADDRESS r1.0:uq
> +#define R1_TGT_WIDTH r1.2:ud
> +#define R1_TGT_HEIGHT r1.3:ud
> +#define R1_DIM_X r1.4:ud
>  
>  #define SET_SHARED_MEDIA_BLOCK_MSG_HDR(dst, y, width)	\
> -(W)	mov (8)		dst.0<1>:ud	0x0:ud		;\
> -(W)	mov (1)		dst.1<1>:ud	y		;\
> -(W)	mov (1)		dst.2<1>:ud	(width - 1):ud	;\
> -(W)	mov (1)		dst.4<1>:ud	R0_FFTID
> +(W)	mov (8)		dst.0:ud	0x0:ud		;\
> +(W)	mov (1)		dst.1:ud	y		;\
> +(W)	mov (1)		dst.2:ud	(width - 1):ud	;\
> +(W)	mov (1)		dst.4:ud	R0_FFTID
>  
>  #define SET_THREAD_MEDIA_BLOCK_MSG_HDR(dst, x, y, width)	\
> -(W)	mov (8)		dst.0<1>:ud	0x0:ud			;\
> -(W)	shl (1)		dst.0<1>:ud	R0_TGIDX	0x2:ud	;\
> -(W)	add (1)		dst.0<1>:ud	dst.0<0;1,0>:ud	x:ud	;\
> -(W)	add (1)		dst.1<1>:ud	R0_TGIDY	y	;\
> -(W)	mov (1)		dst.2<1>:ud	(width - 1):ud		;\
> -(W)	mov (1)		dst.4<1>:ud	R0_FFTID
> +(W)	mov (8)		dst.0:ud	0x0:ud			;\
> +(W)	shl (1)		dst.0:ud	R0_TGIDX	0x2:ud	;\
> +(W)	add (1)		dst.0:ud	dst.0:ud	x:ud	;\
> +(W)	add (1)		dst.1:ud	R0_TGIDY	y	;\
> +(W)	mov (1)		dst.2:ud	(width - 1):ud		;\
> +(W)	mov (1)		dst.4:ud	R0_FFTID
>  
>  #if GFX_VER < 3000
>  #define SET_SURFACE_DESC(dst)			\
> -(W)	mov (8)		dst.0<1>:ud	0x0:ud
> +(W)	mov (8)		dst.0:ud	0x0:ud
>  #else
>  #define SET_SURFACE_DESC(dst)					\
> -(W)	mov (1)		dst.0<1>:uq	R1_TGT_ADDRESS		;\
> -(W)	add (1)		dst.2<1>:ud	R1_TGT_WIDTH	-1:d	;\
> -(W)	add (1)		dst.3<1>:ud	R1_TGT_HEIGHT	-1:d	;\
> -(W)	add (1)		dst.4<1>:ud	R1_TGT_WIDTH	-1:d
> +(W)	mov (1)		dst.0:uq	R1_TGT_ADDRESS		;\
> +(W)	add (1)		dst.2:ud	R1_TGT_WIDTH	-1:d	;\
> +(W)	add (1)		dst.3:ud	R1_TGT_HEIGHT	-1:d	;\
> +(W)	add (1)		dst.4:ud	R1_TGT_WIDTH	-1:d
>  #endif
>  
>  #define SET_SHARED_MEDIA_A2DBLOCK_PAYLOAD(dst, y, width)	\
>  	SET_SURFACE_DESC(dst)					;\
> -(W)	mov (1)		dst.5<1>:ud	0x0:ud			;\
> -(W)	mov (1)		dst.6<1>:ud	y			;\
> -(W)	mov (1)		dst.7<1>:ud	(width - 1):ud
> +(W)	mov (1)		dst.5:ud	0x0:ud			;\
> +(W)	mov (1)		dst.6:ud	y			;\
> +(W)	mov (1)		dst.7:ud	(width - 1):ud
>  
>  #define SET_THREAD_MEDIA_A2DBLOCK_PAYLOAD(dst, x, y, width)	\
>  	SET_SURFACE_DESC(dst)					;\
> -(W)	shl (1)		dst.5<1>:ud	R0_TGIDX	0x2:ud	;\
> -(W)	add (1)		dst.5<1>:ud	dst.5<0;1,0>:ud	x:ud	;\
> -(W)	add (1)		dst.6<1>:ud	R0_TGIDY	y	;\
> -(W)	mov (1)		dst.7<1>:ud	(width - 1):ud		;\
> +(W)	shl (1)		dst.5:ud	R0_TGIDX	0x2:ud	;\
> +(W)	add (1)		dst.5:ud	dst.5:ud	x:ud	;\
> +(W)	add (1)		dst.6:ud	R0_TGIDY	y	;\
> +(W)	mov (1)		dst.7:ud	(width - 1):ud		;\
>  
>  #if GFX_VER < 2000
>  #define SET_SHARED_SPACE_ADDR(dst, y, width) SET_SHARED_MEDIA_BLOCK_MSG_HDR(dst, y, width)
> 
> -- 
> 2.55.0
> 
