Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AEE606A32A
	for <igt-dev@archiver.kernel.org>; Mon,  9 Nov 2026 15:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F6MOEV/Y
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F315E10E5AD;
	Mon,  9 Nov 2026 15:40:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E4D610E387
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Nov 2026 15:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794238771; x=1825774771;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=21EKwon7WUOsMXWSTEmm3Kut76UAvOyY3qDQWP1Kj8U=;
 b=F6MOEV/YMk67bjbVDYB2SjUOidTjzNEXzKXDVQdNa+fslJAQXR80GEqz
 +jqHsMxLOZl9b62wgqnywUXuOx2gMlsNKYi1EQ1llw2hw8IUSzrADfwtY
 HNfGTAHUn8FpRS3SZC7+osyesNagDiAdYVBSfqyCLRnM3IVTFNHrX63cT
 7mvL27NJQNC7WWTH0V7QUQWFLzcDk5ZjFYuFs0wFDjv9wp3imxKiaZaC/
 iSfZ6dCOsq2wWfu3yPSemR4jL5mZglVWjxrQ78R4VeaUtnNQwlY7AaT2g
 C4Z1Q0Sj260pgobo4/NCOLFh/6Yzz+cUHvpJrYB4V+bgo7hosNxFFN3bL w==;
X-CSE-ConnectionGUID: EU6gF2hPR6ag+p+PnhKPrQ==
X-CSE-MsgGUID: it5YVdMTS7WPgOWw8UjfhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2862503"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="2862503"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 07:39:31 -0800
X-CSE-ConnectionGUID: WJGZnlANQViC5Ec6NF/2rQ==
X-CSE-MsgGUID: 4DhpqEOXSfW2gEqLijl1uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="7744090"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.65])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 07:39:30 -0800
Date: Mon, 9 Nov 2026 16:39:27 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
Subject: Re: [PATCH v3 2/2] tests/intel/xe_prefetch_fault: remove explicit
 regioning and channel offsets
Message-ID: <pghx5ceo5s5mhuyt5qck55s37utbihmrbsc2jy3tnatfduzn4m@fo5wfvvvnxue>
References: <20261106-remove_gpu_asm_annotations-v3-0-f3c1e3cb71d7@intel.com>
 <20261106-remove_gpu_asm_annotations-v3-2-f3c1e3cb71d7@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261106-remove_gpu_asm_annotations-v3-2-f3c1e3cb71d7@intel.com>
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

On Fri, Nov 06, 2026 at 03:07:55PM +0100, Andrzej Hajda wrote:
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
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>

Same comment as for 1/2 with auto-deps, but below code lgtm:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> ---
>  tests/intel/xe_prefetch_fault.c                   | 16 ++++++++--------
>  tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c |  2 +-
>  2 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/tests/intel/xe_prefetch_fault.c b/tests/intel/xe_prefetch_fault.c
> index ce741d5b229b..9864b3f9b519 100644
> --- a/tests/intel/xe_prefetch_fault.c
> +++ b/tests/intel/xe_prefetch_fault.c
> @@ -54,11 +54,11 @@ static void gpgpu_shader__prefetch_fault(struct gpgpu_shader *shdr,
>  #if GFX_VER >= 3500
>  L0:
>  // Set base address with scalar register
> -(W)	mov (1)		s0.0<1>:ud		ARG(0):ud
> -(W)	mov (1)		s0.1<1>:ud		ARG(1):ud
> +(W)	mov(1)		s0.0:ud		ARG(0):ud
> +(W)	mov(1)		s0.1:ud		ARG(1):ud
>  
>  // A64 offset
> -(W)	mov (8)		r30.0<1>:uq		0x0:uq
> +(W)	mov(8)		r30.0:uq	0x0:uq
>  
>  // efficient 64bit Read with cached L1, cached L2 and cached L3
>  // sendg ugm load with SBID 3
> @@ -75,7 +75,7 @@ L0:
>  //      [9:7] Vector Size: 0 (Vector length 1)
>  //      [5:0] Opcode: 0 (Load)
>  // Prefetch operations are implemented using a NULL destination register.
> -(W)	sendg.ugm (1|M0)	null	r30:1	null:0	s0.0	0x99C00	{A@1,$5}
> +(W)	sendg.ugm(1)	null		r30:1	null:0	s0.0	0x99C00		{A@1,$5}
>  
>  #endif
>  	)", lower_32_bits(addr), upper_32_bits(addr));
> @@ -149,16 +149,16 @@ static struct gpgpu_shader *get_l2_prefetch_shader(int fd)
>  #if GFX_VER >= 3500
>  L0:
>  // Set base address with scalar register
> -(W)   mov (1)                s0.0<1>:ud                         ARG(0):ud
> -(W)   mov (1)                s0.1<1>:ud                         ARG(1):ud
> +(W)	mov(1)		s0.0:ud		ARG(0):ud
> +(W)	mov(1)		s0.1:ud		ARG(1):ud
>  
>  // A64 offset
> -(W)   mov (8)                r30.0<1>:uq                       0x0:uq
> +(W)	mov(8)		r30.0:uq	0x0:uq
>  
>  // Prefetch operations are implemented using a NULL destination register.
>  // L1 uncached forces the prefetch to bypass LSC, making L2 the fault source.
>  // load.ugm.d64t.a64.uc.ca.uc [src0]
> -(W)   sendg.ugm (1)          null         r30:1      null:0     s0.0        0x49C00
> +(W)	sendg.ugm(1)	null		r30:1	null:0	s0.0	0x49C00
>  #endif
>  	)", lower_32_bits(addr), upper_32_bits(addr));
>  
> diff --git a/tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c b/tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c
> index 5d387aa08f1b..b5fdec567089 100644
> --- a/tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c
> +++ b/tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c
> @@ -3,7 +3,7 @@
>  
>  #include "gpgpu_shader.h"
>  
> -#define MD5_SUM_IGA64_ASMS 712da12709dd4ebfeffc82119c37c556
> +#define MD5_SUM_IGA64_ASMS 546bddbd13ed40a4cc520c886248c178
>  
>  struct iga64_template const iga64_code_xe_l2_prefetch_fault_prefetch[] = {
>  	{ .gfx_ver = 3500, .size = 28, .code = (const uint32_t []) {
> 
> -- 
> 2.55.0
> 
