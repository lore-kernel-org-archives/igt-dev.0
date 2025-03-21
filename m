Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53174C36000
	for <igt-dev@archiver.kernel.org>; Fri, 21 Mar 2025 12:58:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00C3A10E7C0;
	Fri, 21 Mar 2025 12:58:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wvut7YYW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C11B410E7C0
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Mar 2025 12:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742561898; x=1774097898;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=l2X098xP9oykqSYmVAM3M6Ja0ehmERFneChQG1s0p48=;
 b=Wvut7YYWOLUaQ1C82wSE2pkR2oelvGHH2aOm1rXCvo/fOMfrnRRu7z00
 QIzk0cRZnKB3donUaWvQWNKXMOiyYqsl3N6DlZ+bs35hbGC5ZIgh/K9lT
 O69u1ZtQfeGWYaQHuQBhDc4N1crsrnd1j6N5Jw6GD9hGvyU7+LmR7bTU1
 N8wD/nBu/alhVZVTEN/sOhpKVtB646+j7M5f5bkH4wXItI7Ie/bjr3VeX
 ybpbGtWICETvXEvVV1S89upqxhonm+wgqRLa+Cjd9GM7HBmRn6eMdDqPg
 VhbIfhF7CVUNj5+hS7ZLfRjd9PhNn2kOEADIDxF+JyYCZ3665f3Qsxx5h Q==;
X-CSE-ConnectionGUID: +BxAlONmTOS6vFThqNpZYg==
X-CSE-MsgGUID: rZDEMsLrRM+OgJorZcv6nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="31417873"
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="31417873"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 05:58:17 -0700
X-CSE-ConnectionGUID: mYDzC/zISF+KXWvXsuen2g==
X-CSE-MsgGUID: CPNYInIpTAS6jhB0gyQPoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="123098414"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.154])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 05:58:16 -0700
Date: Fri, 21 Mar 2025 13:58:12 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH 1/4] lib/iga64: fix send macro for DG2 platforms
Message-ID: <20250321125812.q33xgboxerstkpu5@zkempczy-mobl2>
References: <20250314-iga64_misc-v1-0-b2d1337b808d@intel.com>
 <20250314-iga64_misc-v1-1-b2d1337b808d@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250314-iga64_misc-v1-1-b2d1337b808d@intel.com>
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

On Fri, Mar 14, 2025 at 03:59:08PM +0100, Andrzej Hajda wrote:
> src1 argument should be in form of null:0 for some platforms,
> use special macro src1_null for it.
> 
> iga64 -Xauto-deps -Wall -p=12p71 lib/iga64_generated_codes.c.d/iga64_assembly_media_block_write_aip.12p71.asm
> line 3.31: warning: Src1.Length should suffix src1 register (e.g. r10:4)
> (W) send.dc1 (1) null r4 null 0x0 0x40A8000

LGTM:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>  lib/iga64_generated_codes.c | 2 +-
>  lib/iga64_macros.h          | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/iga64_generated_codes.c b/lib/iga64_generated_codes.c
> index a74a8864e5ca..551dead2be17 100644
> --- a/lib/iga64_generated_codes.c
> +++ b/lib/iga64_generated_codes.c
> @@ -3,7 +3,7 @@
>  
>  #include "gpgpu_shader.h"
>  
> -#define MD5_SUM_IGA64_ASMS 80bb609ce27131259d19629dc74e349f
> +#define MD5_SUM_IGA64_ASMS 22a5a4671242c3257209f4051f1c0c7e
>  
>  struct iga64_template const iga64_code_gpgpu_fill[] = {
>  	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
> diff --git a/lib/iga64_macros.h b/lib/iga64_macros.h
> index ac482e47c05e..8e452cf634f9 100644
> --- a/lib/iga64_macros.h
> +++ b/lib/iga64_macros.h
> @@ -70,7 +70,7 @@
>  #define SET_SHARED_SPACE_ADDR(dst, y, width) SET_SHARED_MEDIA_BLOCK_MSG_HDR(dst, y, width)
>  #define SET_THREAD_SPACE_ADDR(dst, x, y, width) SET_THREAD_MEDIA_BLOCK_MSG_HDR(dst, x, y, width)
>  #define LOAD_SPACE_DW(dst, src) send.dc1 (1)	dst	src	src1_null 0x0	0x2190000
> -#define STORE_SPACE_DW(dst, src) send.dc1 (1)	null	dst	null	0x0	0x40A8000
> +#define STORE_SPACE_DW(dst, src) send.dc1 (1)	null	dst	src1_null 0x0	0x40A8000
>  #else
>  #define SET_SHARED_SPACE_ADDR(dst, y, width) SET_SHARED_MEDIA_A2DBLOCK_PAYLOAD(dst, y, width)
>  #define SET_THREAD_SPACE_ADDR(dst, x, y, width) SET_THREAD_MEDIA_A2DBLOCK_PAYLOAD(dst, x, y, width)
> 
> -- 
> 2.34.1
> 
