Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24CF8CD5BD0
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 14:33:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90BE510E0E5;
	Wed, 27 May 2026 14:33:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OkMcqdJ3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8D0510E7C1
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 14:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779892367; x=1811428367;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=OLxPeSIcFMiFwhZUQlVQJjtfmo7nQkxOJn6l/E+orEE=;
 b=OkMcqdJ3AoaLSNPr1gYOnNcEyuyc0lwKPnxQhgOakRR+1Hgy6/ZTTh0v
 EAUvnKjJhALitq1UEVCLnstSIYXaG80zkUDPSpXAY8zxSVa60F5E4vkcr
 oDJO19O36TuSKvvjJVjN5vXmHPMYuxspBrfxd6w7LhJlPC0j6+fX+bWMz
 EILZy2dNK1N/f9L0jzA/9pdUEJvcV0XJoTiRgd3bY4AGeGbSRu3qdl1G/
 CAA4l4XHSlCmP1OzRjvgrbOiy/lZlQL+eh0EE5JpP3b+EtDv5leyu7Z7K
 n95MZWX4t8Fr1FIIbBfetjAgt5yzRvVQkIJq7755D1mkVw2cLFY9d2EVG g==;
X-CSE-ConnectionGUID: U5+kcb/ARa6kOQXmutUUvg==
X-CSE-MsgGUID: YAWsd2dLQBGVswJ6F8VGSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="91028735"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="91028735"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 07:32:47 -0700
X-CSE-ConnectionGUID: Ox+kZqG0SMe/LRyF96TN2A==
X-CSE-MsgGUID: k3V8JFgjRvmU0OFPpV950w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="239663724"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 07:32:43 -0700
Date: Wed, 27 May 2026 16:32:41 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Cc: igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com,
 zbigniew.kempczynski@intel.com, x.wang@intel.com
Subject: Re: [PATCH v4 0/2] tools/igt_power: fix Xe crash via drmtest path
 helpers
Message-ID: <20260527143241.ovibtxe7ofss6j6v@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com,
 zbigniew.kempczynski@intel.com, x.wang@intel.com
References: <cover.1779793438.git.sebastian.brzezinka@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1779793438.git.sebastian.brzezinka@intel.com>
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

Hi Sebastian,
On 2026-05-26 at 13:39:52 +0200, Sebastian Brzezinka wrote:

Please keep i-g-t string after PATCH, so it will look like:

[PATCH i-g-t v4 0/2] tools/igt_power: fix Xe crash via drmtest path

Maybe that is a reason why it is not on igt patchwork?

Regards,
Kamil

> igt_power opened its DRM device fd with a raw open() call, which skips
> the Xe device cache initialisation performed by the drmtest open
> helpers. This caused an assertion failure in xe_query the moment
> igt_power_open() called into is_intel_dgfx() on a Xe device.
> 
> The fix is split into two patches. The first adds __drm_open_driver_path()
> to lib/drmtest, a non-asserting helper that validates the fd is a real DRM
> device (DRM_IOCTL_VERSION) before initialising the Xe cache. The second
> switches igt_power to that helper and its matching __drm_close_driver(),
> completely removing the direct Xe dependency from the tool.
> 
> v4:
> - rename drm_open_driver_path to __drm_open_driver_path (no asserts/requires)
> - add DRM_IOCTL_VERSION check to verify fd is a DRM device before proceeding
> - split the single patch into two: lib helper addition and igt_power
> 
> v3:
> - remove redundant if (fd >= 0) guards on both close call sites
> 
> v2:
> - move Xe cache setup/teardown out of igt_power
> - add drm_open_driver_path() and use __drm_close_driver()
> - drop the direct xe/xe_query dependency from igt_power
>    
> Sebastian Brzezinka (2):
>   lib/drmtest: add __drm_open_driver_path()
>   tools/igt_power: fix crash on Xe devices by initializing xe_device
>     cache
> 
>  lib/drmtest.c     | 30 ++++++++++++++++++++++++++++++
>  lib/drmtest.h     |  1 +
>  tools/igt_power.c |  6 +++---
>  3 files changed, 34 insertions(+), 3 deletions(-)
> 
> -- 
> 2.53.0
> 
