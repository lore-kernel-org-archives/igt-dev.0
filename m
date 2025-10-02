Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA70CAC5B0
	for <igt-dev@archiver.kernel.org>; Thu,  2 Oct 2025 13:03:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1806810E19F;
	Thu,  2 Oct 2025 13:03:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HPyIiqHQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCB2110E19F
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Oct 2025 13:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759410213; x=1790946213;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mIdDsiO3bTY5RtVUGYgtkULIHr5ooTiwVpIEDXP68WA=;
 b=HPyIiqHQVqdnaUzwzfnq7jtN2zaDmUB9U/O9zsuo+A75JcJt11jInwuF
 uYLvjzufi92hMtTja7HFdjZBmq/vqubU3hr3IIo5Oygc5FRMfsRugrO28
 TdKfvEp+ctNyf3FX2jWfUbnQeA69+rhI/UF5x6tancp+xhUfHcXRpTnHb
 glRe3K4MNKkzLtHrTr4XqmnBWnFS3kGAUHiukRIOmQa7zY74OX/FMW3Dk
 olQiSKk06zAROto2t65wZCOS0hCiVeNzQ7EaEi8rxJyOouz/thvp3k/P/
 n4yylo+7018TS8Hcxe4PsS1ay+dOKewyfG1dnLcdenII6gAMqi46xvgdU Q==;
X-CSE-ConnectionGUID: 6K/tp0JES8aqvw6lx7oAQQ==
X-CSE-MsgGUID: 0ySSWz2GQ/62MVoecGFGzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65515834"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65515834"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 06:03:33 -0700
X-CSE-ConnectionGUID: fTuaz2NlQU6BGLp7ugBYeA==
X-CSE-MsgGUID: Y7OenO6aSR+u2AdV8jiSuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="209989238"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 06:03:32 -0700
Date: Thu, 2 Oct 2025 15:03:14 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mark Yacoub <markyacoub@google.com>
Cc: igt-dev@lists.freedesktop.org, louis.chauvet@bootlin.com,
 Karthik B S <karthik.b.s@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: Re: [PATCH i-g-t v2] lib/drmtest: Allow DRIVER_ANY tests to run on
 VKMS when supported.
Message-ID: <20251002130314.yspo5xmgpc7tie6f@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mark Yacoub <markyacoub@google.com>, igt-dev@lists.freedesktop.org,
 louis.chauvet@bootlin.com, Karthik B S <karthik.b.s@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
References: <20251001185039.3386207-1-markyacoub@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251001185039.3386207-1-markyacoub@google.com>
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
On 2025-10-01 at 14:50:38 -0400, Mark Yacoub wrote:

please remove dot from end of subject, also imho this should
be splitted into two commits, one for adding VIRTIO to
drivers in lib/drmtest, second for your workaround to DRIVER_ANY

> [Why]
> Android's VM use virtio-gpu as its default driver, but VKMS can be
> enabled on top it.
> VKMS is the preferred driver to run IGT.
> 
> [How]
> To maintain the current way to preferring hardware drivers, introduce a
> "PREFER_VKMS" flag which does not remove DRIVER_VKMS from the list of
> drivers to be opened. Android will keep this as always true.
> 
> Also, added explicit support for virtio-gpu to be explictly filtered
> out, making room for VKMS to be the primary driver in use.
> 
> Test: kms_bw on AVD
> Signed-off-by: Mark Yacoub <markyacoub@google.com>
> ---
>  lib/drmtest.c |  1 +
>  lib/drmtest.h | 20 +++++++++++++-------
>  2 files changed, 14 insertions(+), 7 deletions(-)
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
> index a9542dde2..29356041b 100644
> --- a/lib/drmtest.h
> +++ b/lib/drmtest.h
> @@ -37,6 +37,7 @@
>  #include <xf86drm.h>
>  
>  #include "igt_core.h"
> +#include "config.h"

This should be before igt_core.h (alphabetical order), also add
some comment why you need it, like

+#include "config.h" /* for ....reason... */
 #include "igt_core.h"

Is it needed for a workaround? (see below)

>  
>  int __get_drm_device_name(int fd, char *name, int name_size);
>  
> @@ -56,16 +57,21 @@ int __get_drm_device_name(int fd, char *name, int name_size);
>  #define DRIVER_XE	(1 << 7)
>  #define DRIVER_VMWGFX   (1 << 8)
>  #define DRIVER_VKMS	(1 << 9)
> +#define DRIVER_VIRTIO	(1 << 10)
>  
>  /*
> - * Exclude DRVER_VGEM from DRIVER_ANY since if you run on a system
> - * with vgem as well as a supported driver, you can end up with a
> - * near-100% skip rate if you don't explicitly specify the device,
> - * depending on device-load ordering.
> - *
> - * Exclude VKMS to prefer hardware drivers.
> + * Exclude DRIVER_VGEM and DRIVER_VIRTIO from DRIVER_ANY since if
> + * you run on a system with vgem or virtio-gpu as well as a supported driver,
> + * you can end up with a near-100% skip rate if you don't explicitly specify
> + * the device, depending on device-load ordering.
>   */
> -#define DRIVER_ANY	~(DRIVER_VGEM | DRIVER_VKMS)
> +/* Exclude VKMS to prefer hardware drivers if VKMS is not the preferred driver. */
> +#define DRIVER_ANY	~(DRIVER_VGEM | DRIVER_VKMS | DRIVER_VIRTIO)

Above (adding DRIVER_VIRTIO) should be in separate commit, with
subject like:

lib/drmtest: Add VIRTIO support

and with proper description.

> +
> +#ifdef PREFER_VKMS
> +#undef DRIVER_ANY
> +#define DRIVER_ANY	~(DRIVER_VGEM  | DRIVER_VIRTIO)
> +#endif

This looks like workaround, did you try running your test(s)
with IGT_FORCE_DRIVER? Where is a problem? Do you need two
drivers loaded, not just one? imho this should work:

sudo IGT_FORCE_DRIVER=vkms build/tests/kms_content_protection --r subtest

or try simple test:

sudo IGT_FORCE_DRIVER=vkms build/tests/core_getversion --r basic

If this do not work drmlib should be fixed, as imho IGT_FORCE_DRIVER
should override DRIVER_ANY? +cc Karthik and J-P

Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

Regards,
Kamil

>  
>  /*
>   * Compile friendly enum for i915/xe.
> -- 
> 2.51.0.618.g983fd99d29-goog
> 
