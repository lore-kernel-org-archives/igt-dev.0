Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02154E77199
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jan 2025 17:05:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4B4410EE95;
	Thu,  9 Jan 2025 17:05:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nk7bqdL3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B06CC10EE95
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jan 2025 17:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736442352; x=1767978352;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/Df1tGxacvhT/5lDE2EkS7YJ9VvYtgh0telZUr4qqzw=;
 b=Nk7bqdL3tLsNJjYS8ODDC9cGQLpshSL3csHBhZ9yfNY4PWYP57f4kHsE
 034qcfJY6M2MmfZIRJnEzJPq2MO2DYuWmVyoF6/eCB5tujnjkL3gHkIgt
 TpX9XyhzbF/t2hIEXCx9cu4nSQYZFf6FRKtPlZR7TJffj00C+sew8VgEa
 L29u1k+dL269xRFcyhZiMW9TaxzaQlTolhWY6wu7Sr6M5hNBMB1ohVYvm
 0lSP0kO44lcoRYq7rAkCkEerWqTocE+FI4P6087VO2pie151b7cAaXfZ4
 gkPuyBANG+HX/I8iG/n/AkBsL6D15PewAVQ8uCTEoh1YlvbzLt6tq/QEX g==;
X-CSE-ConnectionGUID: O29n05gPRwmaPMthkCKekA==
X-CSE-MsgGUID: /BvOP0gITDWREWyQIT2tSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36612918"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; d="scan'208";a="36612918"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 09:05:51 -0800
X-CSE-ConnectionGUID: NWUpPCV2Tk6QyRRV8hFoOQ==
X-CSE-MsgGUID: t+SlLKa5ST2M3okt+cdO2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; d="scan'208";a="134299024"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 09:05:50 -0800
Date: Thu, 9 Jan 2025 18:05:36 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH v2] lib/meson.build: allow build IGT with link time
 optimization
Message-ID: <20250109170536.ze5mia3thuop4ios@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 igt-dev@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
References: <20250109-fix-lto-v2-1-3dc74d60a124@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250109-fix-lto-v2-1-3dc74d60a124@intel.com>
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
On 2025-01-09 at 17:26:30 +0100, Andrzej Hajda wrote:
> Some distributions use -flto gcc flag to build IGT. With this flag
> enabled variables declared with section attribute do not appear in
> correct section in .o files. Since iga64 assembly helper script relies
> on it we need to use -ffat-lto-objects in case of files containing
> iga64 assembly. According to documentation this option is effective
> only in case lto is in use, so it should not affect non-lto builds.
> 
> Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/165
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
> This patch 'fixes' building IGT with link-time-optimization. I am not
> sure it is or should be supported by IGT, but build scripts can be
> modified to allow it for testing.
> Grepping internet shows at least Gentoo and Arch Linux builds IGT with
> LTO, so I guess it is working for them.
> ---
> Changes in v2:
>  - added Closes tag
> - Link to v1: https://lore.kernel.org/r/20241216-fix-lto-v1-1-1280b17dc70f@intel.com
> ---
>  lib/meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/meson.build b/lib/meson.build
> index 1704ed1e1c17..9fffdd3c6218 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -240,7 +240,7 @@ foreach f: lib_sources
>  	    '-DIGT_DATADIR="@0@"'.format(join_paths(prefix, datadir)),
>  	    '-DIGT_SRCDIR="@0@"'.format(srcdir),
>  	    '-DIGT_LOG_DOMAIN="@0@"'.format(f.split('.')[0]),
> -	])
> +	] + (iga64_assembly_sources.contains(f) ? [ '-ffat-lto-objects' ] : []))
>  
>      lib_intermediates += lib
>      if iga64_assembly_sources.contains(f)
> 
> ---
> base-commit: ee7a3ac616f55f6ed1b959ff951237099bda86d8
> change-id: 20241216-fix-lto-8d3bc1488c6a
> 
> Best regards,
> -- 
> Andrzej Hajda <andrzej.hajda@intel.com>
> 
