Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE10ECD997
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 19:46:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E08810E030;
	Thu,  5 Feb 2026 19:46:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Iu7QLRAT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E8B10E030
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 19:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770320758; x=1801856758;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Um0C5f3QlW6WJekzoB9pfhkKW629oOtygUd+kTP9gJ8=;
 b=Iu7QLRAT55eUTQQdl+/YLMH98NZKA8RMYzAsSjiJpANrK4vjmZgJSZyN
 g15DLaSzgi9WQjBrmpeuvezE+lfY3dJeCq9YxnKTP0u00a0N9x9ADDagJ
 8BAK134BI7iU0QdW40Es8pezPa7kQah9DEzXqD3J6kTjeM1kzLdw0bb9I
 D3oCNwEFLYpsLhTvCgN590Bepxzt/tPpQbZ1hYLYvldCmtZjA/zdfNaDH
 lOrGxQhY+Ea/TxY+jM6bXAYCfMr0sR54BgMIsDy2r06KCnuxAySBXWoiA
 ED2va/Pa9iXxbr7wrFGOic4aifmISGo4GntYmeQOG+KkOVf9RhMB/tTDG g==;
X-CSE-ConnectionGUID: Vz5aO9ieSn2ggSVpN3pdxA==
X-CSE-MsgGUID: R5GIRs3dTASWKNlye02jXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="94174740"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="94174740"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 11:45:58 -0800
X-CSE-ConnectionGUID: 8SJR12UGSbqg7+mMOZKmGg==
X-CSE-MsgGUID: orrIaCBHRmSM5HEX+e7g1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="248259090"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.188])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 11:45:57 -0800
Date: Thu, 5 Feb 2026 20:45:55 +0100
From: Pawel Sikora <pawel.sikora@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v1 4/4] Dockerfile.build: Replace json-c with jansson
Message-ID: <20260205194555.7s6rp3exvihytprw@pawelsik-desk>
References: <20260115175811.179898-1-kamil.konieczny@linux.intel.com>
 <20260115175811.179898-5-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115175811.179898-5-kamil.konieczny@linux.intel.com>
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

On Thu, Jan 15, 2026 at 06:58:10PM +0100, Kamil Konieczny wrote:
> After replacing json-c with Jansson library in igt runner, the
> dokerfiles needs similar update.

Hi,

LGTM.

Reviewed-by: Pawel Sikora <pawel.sikora@intel.com>

KR,
Pawel Sikora

> 
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  Dockerfile.build-debian       | 2 +-
>  Dockerfile.build-debian-arm64 | 2 +-
>  Dockerfile.build-debian-armhf | 2 +-
>  Dockerfile.build-fedora       | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Dockerfile.build-debian b/Dockerfile.build-debian
> index 52d7c42d1..cbc12875d 100644
> --- a/Dockerfile.build-debian
> +++ b/Dockerfile.build-debian
> @@ -13,7 +13,7 @@ RUN apt-get install -y \
>  			libgsl-dev \
>  			libasound2-dev \
>  			libxmlrpc-core-c3-dev \
> -			libjson-c-dev \
> +			libjansson-dev \
>  			libcurl4-openssl-dev \
>  			python3-docutils \
>  			valgrind \
> diff --git a/Dockerfile.build-debian-arm64 b/Dockerfile.build-debian-arm64
> index cf0625ac7..9bbcdde92 100644
> --- a/Dockerfile.build-debian-arm64
> +++ b/Dockerfile.build-debian-arm64
> @@ -27,7 +27,7 @@ RUN apt-get install -y \
>  			libudev-dev:arm64 \
>  			libgsl-dev:arm64 \
>  			libasound2-dev:arm64 \
> -			libjson-c-dev:arm64 \
> +			libjansson-dev:arm64 \
>  			libcurl4-openssl-dev:arm64 \
>  			libxrandr-dev:arm64 \
>  			libxv-dev:arm64 \
> diff --git a/Dockerfile.build-debian-armhf b/Dockerfile.build-debian-armhf
> index 58b5be82a..e307fbedb 100644
> --- a/Dockerfile.build-debian-armhf
> +++ b/Dockerfile.build-debian-armhf
> @@ -27,7 +27,7 @@ RUN apt-get install -y \
>  			libudev-dev:armhf \
>  			libgsl-dev:armhf \
>  			libasound2-dev:armhf \
> -			libjson-c-dev:armhf \
> +			libjansson-dev:armhf \
>  			libcurl4-openssl-dev:armhf \
>  			libxrandr-dev:armhf \
>  			libxv-dev:armhf \
> diff --git a/Dockerfile.build-fedora b/Dockerfile.build-fedora
> index 9399c0a7d..4c3bdbbd0 100644
> --- a/Dockerfile.build-fedora
> +++ b/Dockerfile.build-fedora
> @@ -19,7 +19,7 @@ RUN dnf install -y \
>  	'pkgconfig(xmlrpc)' \
>  	'pkgconfig(xmlrpc_util)' \
>  	'pkgconfig(xmlrpc_client)' \
> -	'pkgconfig(json-c)' \
> +	'pkgconfig(jansson)' \
>  	'pkgconfig(gtk-doc)' \
>  	'pkgconfig(xv)' \
>  	'pkgconfig(xrandr)' \
> -- 
> 2.52.0
> 
