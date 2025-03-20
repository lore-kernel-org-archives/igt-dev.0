Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D6CC28B30
	for <igt-dev@archiver.kernel.org>; Thu, 20 Mar 2025 17:00:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90A0710E3AD;
	Thu, 20 Mar 2025 17:00:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aGs/ND+y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D2AD10E3AD
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Mar 2025 17:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742490055; x=1774026055;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=deRvP96RDNmqS7VdWNma/W6p98gHq+wj1nvzV3Eb+wE=;
 b=aGs/ND+yrGklV3Ksmlc/So8Om7mYtgBupvUUMAU9FqyuGSnJiMCt7yJy
 vCXncoeVeMbgp+sb2nRbN9ZtEdx974NAmfCNX9fla2GEXimKc44yDAikt
 FWHB4UtXLN2l71vQ9ZoNh21zmTcKmt7wAPcfNcBBTdNNUk8LY13v2VJom
 IFwgLRlgVGB+qdT72OofCmnl2iaOp49p1evzLAegSYzH22nES8ObZ4F7N
 2WxF5usg8ujAxMOgBJ3ULw2YBfUTsgYhclAVnGv9By+bkWA3eQbtzRpjv
 b9Gt9V/8TOtzmus4biB925yGnLNXoWarYV5Drr8RyLpZuF9EM+CpArHs4 g==;
X-CSE-ConnectionGUID: dPb5uAM8Toa/Y31OA+4ZTQ==
X-CSE-MsgGUID: 61YKUeJNRaG8wLLJBH3FLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="47616110"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="47616110"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 10:00:55 -0700
X-CSE-ConnectionGUID: YndxV+ojQLyAiY+Y5K9SGQ==
X-CSE-MsgGUID: Q2jKe6u4TEKwtd92eOXCbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="123167757"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 10:00:54 -0700
Date: Thu, 20 Mar 2025 18:00:38 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH 2/4] scripts/generate_iga64_codes: make script less chatty
Message-ID: <20250320170038.er276mpma6caar3o@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20250314-iga64_misc-v1-0-b2d1337b808d@intel.com>
 <20250314-iga64_misc-v1-2-b2d1337b808d@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250314-iga64_misc-v1-2-b2d1337b808d@intel.com>
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

Hi Andrzej,
On 2025-03-14 at 15:59:09 +0100, Andrzej Hajda wrote:
> Script generated three redundant lines per compilation.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/generate_iga64_codes | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/generate_iga64_codes b/scripts/generate_iga64_codes
> index 3f207e9ff1a8..16bdc6fd6d0f 100755
> --- a/scripts/generate_iga64_codes
> +++ b/scripts/generate_iga64_codes
> @@ -96,7 +96,7 @@ compile_iga64() {
>      eval "$cmd" <<<"$asm_body" || die "cpp error for $asm_name.$gen_name\ncmd: $cmd"
>      cmd="iga64 -Xauto-deps -Wall -p=$gen_name"
>      cmd+=" $WD/$asm_name.$gen_name.asm"
> -    warn "$cmd"
> +    [ -n "$SHOW_CMD" ] && warn "$cmd"
>      eval "$cmd" || die "iga64 error for $asm_name.$gen_name\ncmd: $cmd"
>  }
>  
> @@ -110,13 +110,12 @@ for asm in "${ASMS[@]}"; do
>      for gen in $GEN_VERSIONS; do
>          gen_ver="${gen%%:*}"
>          gen_name="${gen#*:}"
> -        warn "Generating $asm_code for platform $gen_name"
>          # Verify generated code will not contain IGA64_ARGs.
>          for d in $(IGA64_ARG0=0 compile_iga64 | hexdump -v -e '1/4 "0x%08x\n"'); do
>              (( (d & IGA64_ARG_MASK) == IGA64_ARG0 )) || continue
>              die "Assembly for $asm_name.$gen_name contains instruction which compiles to $d, conflicts with IGA64_ARG0/mask $IGA64_ARG0/$IGA64_ARG_MASK\ncmd: $cmd"
>          done
> -        compile_iga64 > "$WD/$asm_name.$gen_name.bin" || die "Cannot write to $WD/$asm_name.$gen_name.bin"
> +        SHOW_CMD=1 compile_iga64 > "$WD/$asm_name.$gen_name.bin" || die "Cannot write to $WD/$asm_name.$gen_name.bin"
>          code="$(hexdump -v -e '"\t\t" 4/4 "0x%08x, " "\n"' $WD/$asm_name.$gen_name.bin)"
>          [ -z "$cur_code" ] && cur_code="$code"
>          [ "$cur_code" != "$code" ] && {
> 
> -- 
> 2.34.1
> 
