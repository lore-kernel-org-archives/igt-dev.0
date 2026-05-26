Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2008ECD5BC8
	for <igt-dev@archiver.kernel.org>; Tue, 26 May 2026 10:39:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB2A410E498;
	Tue, 26 May 2026 10:38:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UqtkkgPo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D982B10E498
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 10:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779791918; x=1811327918;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JAXfbxss5bO3NSS8dOFTdn5mtGVdULEhuxTyMNsqlbE=;
 b=UqtkkgPoZouSfObB3cwLGsOp/6CZ5cuW5LgNjGCAcIxyDAxx/zauqnkU
 0en9HcCP2J+76ESUE8/csUYHdekT3hWkFNX9AsheKvrvKQ6BWu+M7mrdx
 Ur3N9MQDerCafUdlz1XxdN1OAL75C4GI6F3QkI62WeWRWKbjQK81NFYkV
 0yR3f+yQsU+tKJWRH0yTLCYZ5PwAMwTK7DluFJA76BeVPs+V8tW8iFlKl
 6r6SWZXnnYyyaZ2Jm+0eof84Vt+QDaergCxocyFuk3w6FSs+Js2spn4Tf
 MvA++mn/Dvzgotos/7/qaiY3maasJfh9V/IC/9QqFbeY7FaIbemkKtt86 A==;
X-CSE-ConnectionGUID: XKjagDgDTTi8oFtpGt17/w==
X-CSE-MsgGUID: 2k6gb40XQi2ljXvl08QrcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80715840"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="80715840"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 03:38:37 -0700
X-CSE-ConnectionGUID: VJeZy6sKRKWit5grx3SAdw==
X-CSE-MsgGUID: jXwnYP/kQp++6RLRiFsmvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="241037705"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 03:38:35 -0700
Date: Tue, 26 May 2026 12:38:33 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Cc: igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com,
 zbigniew.kempczynski@intel.com, x.wang@intel.com
Subject: Re: [PATCH v3] tools/igt_power: Fix crash on Xe devices by
 initializing xe_device cache
Message-ID: <20260526103833.6plpyf5ksb3krhue@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com,
 zbigniew.kempczynski@intel.com, x.wang@intel.com
References: <2f9a0aa5284bc6fb8275842ea8abd522a982e4ef.1779701555.git.sebastian.brzezinka@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2f9a0aa5284bc6fb8275842ea8abd522a982e4ef.1779701555.git.sebastian.brzezinka@intel.com>
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
On 2026-05-25 at 11:33:09 +0200, Sebastian Brzezinka wrote:
> Opening a DRM device with plain open() does not initialize the Xe device
> cache. When igt_power_open() calls is_intel_dgfx() -> xe_has_vram(),
> it uses find_in_cache() which asserts the cache entry exists, causing
> a crash on Xe devices with: xe_query-CRITICAL: Failed assertion: xe_dev
> 
> Fix this by opening the device with O_RDWR and routing path-based DRM
> opens through drmtest helpers that pair Xe cache setup and teardown with
> the fd lifecycle, keeping igt_power free of Xe-specific handling.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Reviewed-by: Xin Wang <x.wang@intel.com>
> ---
> v2 ->v3:
> - The if (fd >= 0) guards on both call sites are redundant, remove them.
> v1 -> v2:
> - move Xe cache setup/teardown out of igt_power code
> - add drm_open_driver_path() and use __drm_close_driver()
> - drop the direct xe/xe_query dependency from igt_power
> ---
>  lib/drmtest.c     | 24 ++++++++++++++++++++++++
>  lib/drmtest.h     |  1 +

Please split this change into separete patch.

>  tools/igt_power.c |  6 +++---
>  3 files changed, 28 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index 4a788ea7a..9bec3673a 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -379,6 +379,30 @@ err:
>  	return -1;
>  }
>  
> +/**
> + * drm_open_driver_path:
> + * @path: DRM device node path
> + *
> + * Opens @path with O_RDWR and populates the xe_device cache for Xe fds.
> + *
> + * Returns: DRM file descriptor or -1 on error
> + */
> +int drm_open_driver_path(const char *path)

Could you rename it into __drm_open_driver_path?
The idea is that all __functions should not throw asserts nor
require.

> +{
> +	int fd;
> +
> +	fd = open(path, O_RDWR);
> +	if (fd < 0)
> +		return -1;
> +

Before that please add a check that opened device is drm,
one possible way would be to check get version ioctl.

> +	log_opened_device_path(path);

That call is not ideal for a tool but let it be.

Regards,
Kamil

> +
> +	if (is_xe_device(fd))
> +		xe_device_get(fd);
> +
> +	return fd;
> +}
> +
>  static struct {
>  	int fd;
>  	struct stat stat;
> diff --git a/lib/drmtest.h b/lib/drmtest.h
> index 37874d729..19d3d1e76 100644
> --- a/lib/drmtest.h
> +++ b/lib/drmtest.h
> @@ -123,6 +123,7 @@ int drm_open_driver_another(int idx, int chipset);
>  int drm_open_driver(int chipset);
>  int drm_open_driver_master(int chipset);
>  int drm_open_driver_render(int chipset);
> +int drm_open_driver_path(const char *path);
>  int __drm_open_driver_another(int idx, int chipset);
>  int __drm_open_driver(int chipset);
>  int __drm_open_driver_render(int chipset);
> diff --git a/tools/igt_power.c b/tools/igt_power.c
> index 6dd180d34..9458315a3 100644
> --- a/tools/igt_power.c
> +++ b/tools/igt_power.c
> @@ -38,7 +38,7 @@ static bool prepare(struct measurement *m)
>  		int ret, fd = -1;
>  
>  		if (m->drm_device) {
> -			fd = open(m->drm_device, O_RDONLY);
> +			fd = drm_open_driver_path(m->drm_device);
>  			if (fd < 0) {
>  				fprintf(stderr, "Unable to open drm device %s (%d)\n",
>  					m->drm_device, -errno);
> @@ -54,12 +54,12 @@ static bool prepare(struct measurement *m)
>  			else
>  				fprintf(stderr, "Unable to open rapl domain %s (%d)\n",
>  					m->rapl_domain, ret);
> -			close(fd);
>  
> +			__drm_close_driver(fd);
>  			return false;
>  		}
>  
> -		close(fd);
> +		__drm_close_driver(fd);
>  	}
>  
>  	return true;
> -- 
> 2.53.0
> 
