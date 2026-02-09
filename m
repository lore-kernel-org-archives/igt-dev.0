Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F84E81BD8
	for <igt-dev@archiver.kernel.org>; Mon,  9 Feb 2026 15:15:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C12510E414;
	Mon,  9 Feb 2026 15:15:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b3Yszivo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E2A110E414
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Feb 2026 15:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770650146; x=1802186146;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Lp2i52pHGOCmmR56EqXKIpx/8bhH7FOah48H1FjI0+s=;
 b=b3YszivoRj5JXquhAJLAr4uII0T2fq0fU2Z1kzPi/1tAYSFLzXG0AEwF
 oRHw1kiAHzWMjjG4iD0JBi5k45f5tHX5vRN/tcySaU9l4FKgopyLEd+eZ
 N44l938ltZhGmHlxqJB9CqmKh8IzxG22bl5h+qaWuv0NhJm04BuVTuhCX
 4yadvC0ltsre3BaOYNcaQr3haDor2OU38gwOOG9moox+So52YLOEgCTDh
 m3HQO2KgwugjcjsnIXZ5WEXVB7pjIUHvE1xgAyqwjALP/UBiFQahuGnes
 evd0bnxH/zXBUw38tqtD9J4qy+72YZ26rn3izq1l2Xj9OJbOdvD2+lQLk g==;
X-CSE-ConnectionGUID: MIXF0vMeSAK2tbSLZ1nkKA==
X-CSE-MsgGUID: JTCLYKnERkuqQOJrn5cQ0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="82869889"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="82869889"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 07:15:45 -0800
X-CSE-ConnectionGUID: QNMdMpn9QOathr1gUwHdfg==
X-CSE-MsgGUID: CfeguUCWR4ybDbFQOJSRYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="216582445"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 07:15:44 -0800
Date: Mon, 9 Feb 2026 16:15:41 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Tvrtko Ursulin <tursulin@igalia.com>,
 Rob Clark <robdclark@gmail.com>, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH i-g-t v1 4/4] Dockerfile.build: Replace json-c with jansson
Message-ID: <20260209151541.zi2jkdiixpstoqch@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Tvrtko Ursulin <tursulin@igalia.com>,
 Rob Clark <robdclark@gmail.com>, Rob Clark <robdclark@chromium.org>
References: <20260115175811.179898-1-kamil.konieczny@linux.intel.com>
 <20260115175811.179898-5-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Hi all,
On 2026-01-15 at 18:58:10 +0100, Kamil Konieczny wrote:
> After replacing json-c with Jansson library in igt runner, the
> dokerfiles needs similar update.
> 
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Please forward this to you CI teams, I plan to merge this soon.
There is also one more change waiting, tools/lsgpu will have
libpci-dev dependancy.

Regards,
Kamil 

+cc
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Tvrtko Ursulin <tursulin@igalia.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>

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
