Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61335C61CE8
	for <igt-dev@archiver.kernel.org>; Thu, 12 Jun 2025 13:20:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F2B910E06B;
	Thu, 12 Jun 2025 13:20:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AJr3EJhZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3ED510E06B
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jun 2025 13:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749734410; x=1781270410;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=G8TrJtAuFJSx/nR3tphzk54c+a6Ijf+u/0IsAskMRZ4=;
 b=AJr3EJhZ5n02WMMp1B4pSbgATQmp+9BUcJhSmazZHBf0XhgRcbHDAMCW
 4dWy0SHD9vCYYQNC/ahYC0mF/se8jtiZAQaHotVCRsB76OuwfQs0ecF5B
 wItnapJdhr6WbnrnKa0D25c03Rc//9Z46UI0BVzDLJOAwleniuk5KldOi
 qm7W/KTww12b4/wuVrreT09gdZK0w9zqpmz/Cg7jctUFvE0sCJXVHZ9bz
 E1AkkDfJtE3TL2VWUoYGatqcyUxtFHimqwcerv9HQilZI2akl/dZQvOsh
 RpTgtSDv1s3RNBW0ZzMSTOZjCGdrM9Er+mpVDWXPY2vMUDQNd1gQz66+/ A==;
X-CSE-ConnectionGUID: XLOuK6QYQduYnHlvctxIyw==
X-CSE-MsgGUID: QEufAmfCSp23PUrYfvhsyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="55714941"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="55714941"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 06:20:06 -0700
X-CSE-ConnectionGUID: plXtPTksRsa8Z0/0b9mp4A==
X-CSE-MsgGUID: v9X0ULt4Rl+TMX5kQhQCXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="147873046"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 06:20:03 -0700
Date: Thu, 12 Jun 2025 15:19:46 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org, Ryszard Knop <ryszard.knop@intel.com>,
 Ryszard Knop <rk@dragonic.eu>, Petri Latvala <adrinael@adrinael.net>
Subject: Re: [PATCH v4 2/6] Dockerfile: remove MIPS architecture
Message-ID: <20250612131946.zpj2vqq6na2sg7yd@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 igt-dev@lists.freedesktop.org,
 Ryszard Knop <ryszard.knop@intel.com>,
 Ryszard Knop <rk@dragonic.eu>,
 Petri Latvala <adrinael@adrinael.net>
References: <20250612-bump_docker_distros-v4-0-10d18745c7d4@intel.com>
 <20250612-bump_docker_distros-v4-2-10d18745c7d4@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250612-bump_docker_distros-v4-2-10d18745c7d4@intel.com>
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
On 2025-06-12 at 14:30:13 +0200, Andrzej Hajda wrote:
> MIPS is no longer supported by gitlab-ci.

Should this be 'MIPSel is no longer supported by Debian'?

Building was working but image and packages were very old.
See for example one month old cross-compilation:
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/jobs/75865259
build:tests-debian-meson-mips

> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  Dockerfile.build-debian-mips | 39 ---------------------------------------
>  1 file changed, 39 deletions(-)
> 
> diff --git a/Dockerfile.build-debian-mips b/Dockerfile.build-debian-mips
> deleted file mode 100644
> index 9b7c0a5b4703e8dd9461406731af248b050a0a2b..0000000000000000000000000000000000000000
> --- a/Dockerfile.build-debian-mips
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -FROM debian:buster
> -
> -RUN apt-get update
> -RUN apt-get install -y \
> -			flex \
> -			bison \
> -			pkg-config \
> -			x11proto-dri2-dev \
> -			python-docutils \
> -			valgrind \
> -			peg
> -
> -RUN dpkg --add-architecture mips
> -RUN apt-get update
> -RUN apt-get install -y \
> -			gcc-mips-linux-gnu \
> -			libatomic1:mips \
> -			libpciaccess-dev:mips \
> -			libkmod-dev:mips \
> -			libprocps-dev:mips \
> -			libunwind-dev:mips \
> -			libdw-dev:mips \
> -			zlib1g-dev:mips \
> -			liblzma-dev:mips \
> -			libcairo-dev:mips \
> -			libpixman-1-dev:mips \
> -			libudev-dev:mips \
> -			libgsl-dev:mips \
> -			libasound2-dev:mips \
> -			libjson-c-dev:mips \
> -			libcurl4-openssl-dev:mips \
> -			libxrandr-dev:mips \
> -			libxv-dev:mips \
> -			meson \
> -			libdrm-dev:mips \
> -			qemu-user \
> -			qemu-user-static
> -
> -RUN apt-get clean
> 
> -- 
> 2.43.0
> 
