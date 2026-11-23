Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2315606A321
	for <igt-dev@archiver.kernel.org>; Mon, 23 Nov 2026 12:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ME4jzRaK
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77CDB10E4A9;
	Mon, 23 Nov 2026 12:53:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1FCB10E0FD
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Nov 2026 12:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795438317; x=1826974317;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=D+lYmY9GRKQT617rcxmdW9Sie5x6gIaebyOg7RztHj0=;
 b=ME4jzRaKBol3ufiFGpLZUETlNd87ic3kTNAATjzkcFp6PbhNXsL4uMaP
 zNnl+RyJmLK9hoUwJcMpOoqRyYcWaApQf2X/+hc5uREEZGONXHfx7k/0J
 KFAa7Px/jziqhak/bzFMPj7mSTUSsScgssI81POCOrzwYwRwpYuI6E9k1
 u5KFAch6wXzFdhWhmFY0c3imME7KJzmImqlHKqLii/Boq67KMKNhZ1pPf
 hkno4w/ngjTw1orTSNS2ZLSp3H0tbw6yq+dH52OjmrLEfna9VLVGd/4Nf
 itQ4ChcP/k8mMIhTjXVued9CSKItYS5sENFIFsZoZy3rG645P+CbAPlX2 w==;
X-CSE-ConnectionGUID: /izXg1KfTKKxyW+zLhqvng==
X-CSE-MsgGUID: f+yLCO/0QoGTkl2q2gHK4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4348455"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4348455"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 04:51:57 -0800
X-CSE-ConnectionGUID: YE0dhTrBQMOSXOIFVeEoEw==
X-CSE-MsgGUID: 9J4q8gVhSralTQFZSArxXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11309746"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 04:51:55 -0800
Date: Mon, 23 Nov 2026 13:51:33 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Simon Ser <contact@emersion.fr>
Cc: igt-dev@lists.freedesktop.org, Gil Dekel <gildekel@google.com>, 
 Jani Nikula <jani.nikula@intel.com>, Swati Sharma <swati2.sharma@intel.com>, 
 Karthik B S <karthik.b.s@intel.com>, Mark Yacoub <markyacoub@google.com>, 
 Ryszard Knop <ryszard.knop@intel.com>
Subject: Re: [PATCH] lib/igt_hdr: switch to libdisplay-info for EDID parsing
Message-ID: <no3gurwcnsisfnjvfezh4xub7a6b3jw4wyxjyl4h5wr5rraq6p@gfmxhhez5xm2>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Simon Ser <contact@emersion.fr>, igt-dev@lists.freedesktop.org,
 Gil Dekel <gildekel@google.com>, 
 Jani Nikula <jani.nikula@intel.com>, Swati Sharma <swati2.sharma@intel.com>, 
 Karthik B S <karthik.b.s@intel.com>, Mark Yacoub <markyacoub@google.com>, 
 Ryszard Knop <ryszard.knop@intel.com>
References: <20261121115236.124211-1-contact@emersion.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261121115236.124211-1-contact@emersion.fr>
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Simon,
On 2026-11-21 at 11:52:49 +0000, Simon Ser wrote:
> Replace manual EDID/CTA parsing with libdisplay-info [1].
> 
> libdisplay-info is an EDID and DisplayID library. It's widely used
> across Wayland compositors. It exposes both a high-level API
> (with information collected across EDID/DisplayID/CTA blocks) and
> a low-level API (exposing individual parsed fields from the
> specifications).
> 
> Using libdisplay-info will allow IGT to drop all of its custom
> parsing code. libdisplay-info takes care of the bitshifting and
> value decoding. libdisplay-info has documentation, a test suite,
> fuzzing, and a clone of edid-decode which can serve as an example
> to figure out how to use the low-level API.
> 
> IGT has already quite a bit of hand-rolled parsing code, and we
> need to start somewhere, so here is a patch leveraging
> libdisplay-info for igt_hdr.
> 
> As a bonus, igt_hdr now extracts HDR static metadata from CTA
> DisplayID blocks for free, because the high-level libdisplay-info
> helper does this already.
> 
> [1]: https://gitlab.freedesktop.org/emersion/libdisplay-info
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Gil Dekel <gildekel@google.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Mark Yacoub <markyacoub@google.com>
> ---
>  Dockerfile.build-debian-arm64   |  1 +
>  Dockerfile.build-debian-armhf   |  1 +
>  Dockerfile.build-debian-minimal |  1 +
>  Dockerfile.build-fedora         |  1 +
>  lib/igt_hdr.c                   | 63 +++++----------------------------
>  lib/meson.build                 |  1 +
>  meson.build                     |  1 +
>  7 files changed, 15 insertions(+), 54 deletions(-)
> 

Please wait with merging as now it will not build in CI
on Ubuntu 20.04 and 22.04.

+cc Ryszard Knop <ryszard.knop@intel.com>


Regards,
Kamil


> diff --git a/Dockerfile.build-debian-arm64 b/Dockerfile.build-debian-arm64
> index 114b9760d1f6..7a9cd1915825 100644
> --- a/Dockerfile.build-debian-arm64
> +++ b/Dockerfile.build-debian-arm64
> @@ -26,6 +26,7 @@ RUN apt-get install -y \
>  			libpci-dev:arm64 \
>  			libpixman-1-dev:arm64 \
>  			libudev-dev:arm64 \
> +			libdisplay-info-dev:arm64 \
>  			libgsl-dev:arm64 \
>  			libasound2-dev:arm64 \
>  			libjansson-dev:arm64 \
> diff --git a/Dockerfile.build-debian-armhf b/Dockerfile.build-debian-armhf
> index c6527ea1eb2f..375f3e185bba 100644
> --- a/Dockerfile.build-debian-armhf
> +++ b/Dockerfile.build-debian-armhf
> @@ -26,6 +26,7 @@ RUN apt-get install -y \
>  			libpci-dev:armhf \
>  			libpixman-1-dev:armhf \
>  			libudev-dev:armhf \
> +			libdisplay-info-dev:armhf \
>  			libgsl-dev:armhf \
>  			libasound2-dev:armhf \
>  			libjansson-dev:armhf \
> diff --git a/Dockerfile.build-debian-minimal b/Dockerfile.build-debian-minimal
> index 573bb5139ceb..1d326250eef9 100644
> --- a/Dockerfile.build-debian-minimal
> +++ b/Dockerfile.build-debian-minimal
> @@ -17,6 +17,7 @@ RUN apt-get install -y \
>  			libpci-dev \
>  			libpixman-1-dev \
>  			libudev-dev \
> +			libdisplay-info-dev \
>  			libxrandr-dev \
>  			libxv-dev \
>  			x11proto-dri2-dev \
> diff --git a/Dockerfile.build-fedora b/Dockerfile.build-fedora
> index aacc6a87c844..db7618325a67 100644
> --- a/Dockerfile.build-fedora
> +++ b/Dockerfile.build-fedora
> @@ -14,6 +14,7 @@ RUN dnf install -y \
>  	'pkgconfig(cairo)' \
>  	'pkgconfig(libpci)' \
>  	'pkgconfig(libudev)' \
> +	'pkgconfig(libdisplay-info)' \
>  	'pkgconfig(glib-2.0)' \
>  	'pkgconfig(gsl)' \
>  	'pkgconfig(alsa)' \
> diff --git a/lib/igt_hdr.c b/lib/igt_hdr.c
> index c0ed9e843163..b8175ceef1f7 100644
> --- a/lib/igt_hdr.c
> +++ b/lib/igt_hdr.c
> @@ -11,6 +11,8 @@
>  #include <termios.h>
>  #include <unistd.h>
>  
> +#include <libdisplay-info/info.h>
> +
[cut]
