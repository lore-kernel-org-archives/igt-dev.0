Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8370DC35FFF
	for <igt-dev@archiver.kernel.org>; Thu, 20 Mar 2025 17:02:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4482310E3AD;
	Thu, 20 Mar 2025 17:02:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bcxqvjfm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 623ED10E3AD
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Mar 2025 17:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742490163; x=1774026163;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CSZK3Ha2OEz71H3Yd5h7vCIpY5r1gjWOFLmrKOcrVRo=;
 b=BcxqvjfmpB84dbOdC8jXYzpijqWwzO1AwrLGNBmor1zVJ5UVoKptSMnn
 YIzqATITD4aXhdbD/1US5bvmuKn3CKpkUZ4HxGU0qH+j/LtZZ+Mdo49cV
 qlOTk1tqAOv0H1P7+XdG20pII0aOkW+DhIlzcxqJe80beGxvNUeBDSFSx
 x8xkdNZhlBued3zz5VDe3r13TrJLQGLfOdJPRY9IPJKrEjmqEeCB1ZhDp
 mhd3LBxNhU7Rvysf2pZhQW5/NqTjrctqWTb8El8SQialyGizI3F/oM/+g
 MqM23HDhMRFnjsA71jbEDXIGmy89qCc0qcThAxlQTVrVeisJ65Zpa1cv6 A==;
X-CSE-ConnectionGUID: O05/WSMuSj2ELuye9FJ3XA==
X-CSE-MsgGUID: Wk07bKSvRwurYn04nMuO6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43925174"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="43925174"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 10:02:43 -0700
X-CSE-ConnectionGUID: r87LLmn4TRKybFUbpGZ3lg==
X-CSE-MsgGUID: 0GFcQ3yeQYKGCyG3WtJwuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="127315392"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 10:02:41 -0700
Date: Thu, 20 Mar 2025 18:02:38 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH 4/4] scripts/generate_iga64_codes: remove parenthesis
 around ARG macro body
Message-ID: <20250320170238.3klytxm573wnra2i@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20250314-iga64_misc-v1-0-b2d1337b808d@intel.com>
 <20250314-iga64_misc-v1-4-b2d1337b808d@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250314-iga64_misc-v1-4-b2d1337b808d@intel.com>
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
On 2025-03-14 at 15:59:11 +0100, Andrzej Hajda wrote:
> Parenthesis around macro body were added to follow C conventions.
> For newer platforms they are not allowed in such context.
> For iga64 they do not change anything and can be omited.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/generate_iga64_codes | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/generate_iga64_codes b/scripts/generate_iga64_codes
> index bfef0e5c2853..1675ffe639b3 100755
> --- a/scripts/generate_iga64_codes
> +++ b/scripts/generate_iga64_codes
> @@ -92,7 +92,7 @@ EOF
>  # Compiles assembly to binary representation sent to stdout.
>  compile_iga64() {
>      cmd="cpp -P - -o $WD/$asm_name.$gen_name.asm"
> -    cmd+=" -DGEN_VER=$gen_ver -D'ARG(n)=($IGA64_ARG0 + (n))' -imacros $IGT_SRCDIR/lib/iga64_macros.h"
> +    cmd+=" -DGEN_VER=$gen_ver -D'ARG(n)=$IGA64_ARG0 + n' -imacros $IGT_SRCDIR/lib/iga64_macros.h"
>      eval "$cmd" <<<"$asm_body" || die "cpp error for $asm_name.$gen_name\ncmd: $cmd"
>      cmd="iga64 -Xauto-deps -Wall -p=$gen_name"
>      cmd+=" $WD/$asm_name.$gen_name.asm"
> 
> -- 
> 2.34.1
> 
