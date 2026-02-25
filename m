Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386CFFD374E
	for <igt-dev@archiver.kernel.org>; Wed, 25 Feb 2026 13:23:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE76610E79A;
	Wed, 25 Feb 2026 13:23:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aCdNuxmY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2625010E79A
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Feb 2026 13:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772025805; x=1803561805;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pQZjzYXT9cwVSEmw3cAXr0HTntOqd0CqcDD6H/aJwpw=;
 b=aCdNuxmYArcr0byeEFxUp7c442nLnmB/pzac0l4gzR/3s/hq1hzJAPnb
 zEC5l/Pufqp8GGIQx5glYl4pP5KH1mC2ARBgxfiHoRt/Kb+/1hiNX6KSr
 jX0/zzBHJQt4bfwqCkluYX6UGC/drAsOX8oR2obM1i9gYQGATGr5lywOZ
 nEAdVNJdYXSDjdBt3KIRkecUctiNyWLMEYOzLwDdf457cxKd5IRksDTtl
 9AlZNBiTq+XQrSTz+4RYgUX+voi79cGFe0EkWZfhf8jw7VGgEoR44L+ol
 QyBEG3xctxSYsk7UgYcFQ3nOpHzwg1gwZD1VnzOx/tJ7rOHAZZR4ea+LH g==;
X-CSE-ConnectionGUID: 0jV/LTqBSCW/wbLIb4jLUw==
X-CSE-MsgGUID: YXIcumFQTgyhd+gwVMV3KA==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="84155057"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="84155057"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 05:23:25 -0800
X-CSE-ConnectionGUID: W7klhmYkS5Guvbo8b58SEQ==
X-CSE-MsgGUID: yR8PTFYQRreMdHNrEsdzbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="213351856"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 05:23:23 -0800
Date: Wed, 25 Feb 2026 14:22:56 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Pawel Sikora <pawel.sikora@intel.com>
Cc: igt-dev@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH i-g-t v1 3/6] dockerfiles: update debian and fedora
 dockerfiles
Message-ID: <20260225132256.kl44v4le66uajsax@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 igt-dev@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>
References: <20260220150202.1013804-1-pawel.sikora@intel.com>
 <20260220150202.1013804-4-pawel.sikora@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260220150202.1013804-4-pawel.sikora@intel.com>
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

Hi Pawel,
On 2026-02-20 at 16:01:57 +0100, Pawel Sikora wrote:
> Add clang python3 bindings and clang dev libraries
> to image installation process for mkdocs(cdoc).
> 
> Signed-off-by: Pawel Sikora <pawel.sikora@intel.com>
> ---
>  Dockerfile.build-debian         | 4 +++-
>  Dockerfile.build-debian-minimal | 4 +++-

Can it be only for fedora? So no changes in debian images?

Regrads,
Kamil

>  Dockerfile.build-fedora         | 1 +
>  3 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/Dockerfile.build-debian b/Dockerfile.build-debian
> index cbc12875d..8d251598c 100644
> --- a/Dockerfile.build-debian
> +++ b/Dockerfile.build-debian
> @@ -18,6 +18,8 @@ RUN apt-get install -y \
>  			python3-docutils \
>  			valgrind \
>  			peg \
> -			libdrm-intel1
> +			libdrm-intel1 \
> +			python3-clang \
> +			libclang-dev
>  
>  RUN apt-get clean
> diff --git a/Dockerfile.build-debian-minimal b/Dockerfile.build-debian-minimal
> index 808d2e32e..f481c83df 100644
> --- a/Dockerfile.build-debian-minimal
> +++ b/Dockerfile.build-debian-minimal
> @@ -21,6 +21,8 @@ RUN apt-get install -y \
>  			libxv-dev \
>  			x11proto-dri2-dev \
>  			meson \
> -			libdrm-dev
> +			libdrm-dev \
> +			python3-clang \
> +			libclang-dev
>  
>  RUN apt-get clean
> diff --git a/Dockerfile.build-fedora b/Dockerfile.build-fedora
> index bae85a584..4e618fda7 100644
> --- a/Dockerfile.build-fedora
> +++ b/Dockerfile.build-fedora
> @@ -38,6 +38,7 @@ RUN rm -fr /tmp/peg
>  
>  # For compile-testing on clang
>  RUN dnf install -y clang
> +RUN dnf install -y python3-clang clang-devel
>  
>  # For test list comparison
>  RUN dnf install -y diffutils
> -- 
> 2.51.0
> 
