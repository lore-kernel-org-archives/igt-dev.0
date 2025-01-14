Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26348E77188
	for <igt-dev@archiver.kernel.org>; Tue, 14 Jan 2025 14:42:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA6F510E362;
	Tue, 14 Jan 2025 14:42:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TLrXwJVX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A2B10E362
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jan 2025 14:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736865745; x=1768401745;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+s25Sc3PuSBhUO2INFn7W4yOK/22waF/cRwjagDOqW8=;
 b=TLrXwJVX+taKgbGDbZFHi8kD/MMBaE3WUbh9ByWEkoYetztGXud9xiEw
 QM8nC5XPhRRhrpSdc/9nhnyXZliwOPXpAA0FgQzhJaR4npyjjTZuFGPAo
 IyYG7oV05KKSFwUzst+91wfYRIJfdCDcYTrXWx+bCZ0as4bpQL74wtSpc
 JawkKonWKuYZeB/9Gqp9BlWJIDULXj54u/kCXHcHDIJBOZT6p9P4+s3wd
 SoilJ4nErU7yC2rpaqFgk2QAwEHZsH+lhJ+TvqpjnevIc04rMTj6U5lXO
 4sJBU5EB7+/FNdrAnjJzfeBrr+Bxw9KpxosQNdgRoU/nwtGitYWelZTg0 A==;
X-CSE-ConnectionGUID: NPQeIN2kSBWbOpkieoagMQ==
X-CSE-MsgGUID: SJlEizIxQs+VEpjfHecBww==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="36857333"
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; d="scan'208";a="36857333"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 06:42:24 -0800
X-CSE-ConnectionGUID: oH7jfa5oSHyRc3TBiKOOXg==
X-CSE-MsgGUID: XNoi+RKLR7KV/8y5G3t+VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="104682906"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 06:42:24 -0800
Date: Tue, 14 Jan 2025 15:42:20 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH v2] lib/meson.build: allow build IGT with link time
 optimization
Message-ID: <20250114144220.rrvfaaqqfvyomhvn@kamilkon-desk.igk.intel.com>
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
> ---
> This patch 'fixes' building IGT with link-time-optimization. I am not
> sure it is or should be supported by IGT, but build scripts can be
> modified to allow it for testing.
> Grepping internet shows at least Gentoo and Arch Linux builds IGT with
> LTO, so I guess it is working for them.

Applied, thanks!

Regards,
Kamil

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
