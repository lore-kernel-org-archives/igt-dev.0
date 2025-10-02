Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE887CAC5B0
	for <igt-dev@archiver.kernel.org>; Thu,  2 Oct 2025 19:07:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 856D110E043;
	Thu,  2 Oct 2025 19:07:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TGlil24o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3685D10E043
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Oct 2025 19:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759432037; x=1790968037;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qoTnhasbukQrjjqk4DUcsER3BE8+vxK+tQwYeL40jyE=;
 b=TGlil24o9PisZRNi39q0jrCVH8gC+er4iT/l1LDHaUbIF6fm2rCKMret
 gftzwkFzS2CeAKogZVKWVjkKCc3OM67dC6dLEG05tyvsopISkT1kkzuYm
 ZLGRR2oEtJYLzFiPMwiq+Wkt/NdFK7E4rIwM21ZKPI5K7HBaBsN0DKBJQ
 4vTNwcbDmGBILZiOD6h0rrZ3TDZWX0YmcdFRbgMdNoPEEHi0qAsCme8yj
 H13FeLhwiDeMitG3pWnoAw3SrjNQ8IvMUCncZzrgR9UyxQL+KTtmGNl/U
 YyfhxWo9i9h+ZBJoqKlBhrnSKuUOAk+YimGMfZTVXolwo2FloavrWKYUi Q==;
X-CSE-ConnectionGUID: P7As1nQETXW6yrWf50mXDA==
X-CSE-MsgGUID: x6GbbMUNT8+JSMFJJE8zuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61640162"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61640162"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 12:07:16 -0700
X-CSE-ConnectionGUID: ow7qAkeVSc+UiLynj1b38w==
X-CSE-MsgGUID: nn7Yeo05QMWRRwvdiPmoWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="210089834"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 12:07:14 -0700
Date: Thu, 2 Oct 2025 21:06:59 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mark Yacoub <markyacoub@google.com>
Cc: igt-dev@lists.freedesktop.org,
	Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH i-g-t] lib/drmtest: Add Support for Virtio-GPU
Message-ID: <20251002190659.ssmba4pobyp7jmw5@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mark Yacoub <markyacoub@google.com>, igt-dev@lists.freedesktop.org,
 Louis Chauvet <louis.chauvet@bootlin.com>
References: <20251002151714.595492-1-markyacoub@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251002151714.595492-1-markyacoub@google.com>
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

Hi Mark,
On 2025-10-02 at 11:17:14 -0400, Mark Yacoub wrote:
> [Why]
> Android's Virtual Device (AVD) has virtio-gpu has its primary driver. We
> want to be to detect it so we can filter out it through DRIVER_ANY.
> 
> [How]
> Add DRIVER_VIRTIO to the exclusion list of DRIVER_ANY

s/to the/to known drivers and to/

> 
> Test: ran kms_bw on AVD.

Tested with kms_bw on AVD.

> 
> Change-Id: Ie7987c706546bc0fbd437e221f7ecd4c7bc759a9
> Signed-off-by: Mark Yacoub <markyacoub@google.com?

s/?/>/

No need for resend, it could be fixed at merge.

> cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> cc: Louis Chauvet <louis.chauvet@bootlin.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/drmtest.c | 1 +
>  lib/drmtest.h | 9 +++++----
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index 551385867..a1fb0b5ba 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -223,6 +223,7 @@ static const struct module {
>  	{ DRIVER_V3D, "v3d" },
>  	{ DRIVER_VC4, "vc4" },
>  	{ DRIVER_VGEM, "vgem" },
> +	{ DRIVER_VIRTIO, "virtio_gpu" },
>  	{ DRIVER_VKMS, "vkms" },
>  	{ DRIVER_VMWGFX, "vmwgfx" },
>  	{ DRIVER_XE, "xe" },
> diff --git a/lib/drmtest.h b/lib/drmtest.h
> index a9542dde2..8416aa491 100644
> --- a/lib/drmtest.h
> +++ b/lib/drmtest.h
> @@ -56,16 +56,17 @@ int __get_drm_device_name(int fd, char *name, int name_size);
>  #define DRIVER_XE	(1 << 7)
>  #define DRIVER_VMWGFX   (1 << 8)
>  #define DRIVER_VKMS	(1 << 9)
> +#define DRIVER_VIRTIO	(1 << 10)
>  
>  /*
> - * Exclude DRVER_VGEM from DRIVER_ANY since if you run on a system
> - * with vgem as well as a supported driver, you can end up with a
> - * near-100% skip rate if you don't explicitly specify the device,
> + * Exclude DRIVER_VGEM and DRIVER_VIRTIO from DRIVER_ANY since if you run
> + * on a system with them as well as a supported driver, you can end up
> + * with a near-100% skip rate if you don't explicitly specify the device,
>   * depending on device-load ordering.
>   *
>   * Exclude VKMS to prefer hardware drivers.
>   */
> -#define DRIVER_ANY	~(DRIVER_VGEM | DRIVER_VKMS)
> +#define DRIVER_ANY	~(DRIVER_VGEM | DRIVER_VKMS | DRIVER_VIRTIO)
>  
>  /*
>   * Compile friendly enum for i915/xe.
> -- 
> 2.51.0.618.g983fd99d29-goog
> 
