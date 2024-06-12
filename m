Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9AADC27C53
	for <igt-dev@archiver.kernel.org>; Wed, 12 Jun 2024 12:59:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D31F10E0D0;
	Wed, 12 Jun 2024 12:59:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QhP4mcmp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AE3110E0D0
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jun 2024 12:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718197171; x=1749733171;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kq2M+V8+m9dGipUvF1GCkGaZIiDvtldC8Lqs99dSgg8=;
 b=QhP4mcmp+Wm01qXTaC2CT5+USFB6PXkEdxhH3QV/I0dyG7+Q8CX6sl/p
 /djPTYro/a0k4cyHFpeEAdq27CYGBpw5s+ppiQYxVh82KcpeLyw/OLNFU
 IzhLf44Mh9ncNzCPjAjLpqoUHgYhBDBMtXwlB/HWwejWsDEll/H3k8rIY
 wKLVy15IsbXNW9NDozO23D2FSJrIEUjd3TaeUanx4q/MXBvdSzEgTweS1
 hy2DWYawvB3YKZs1rr94QP4KjSHjvjMEK1CmmuWLuUX2d7AEBGNi+tp1+
 bIE2ci4zvDmloBAjvNyfi0QsPTE5v1v69w9QAw75EUQPTAdeUf1WsMUAF Q==;
X-CSE-ConnectionGUID: xZiqfCJ8QNar2f56btv37A==
X-CSE-MsgGUID: WqUcdpdbTo69mEdv6l5shA==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="17882066"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="17882066"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 05:59:30 -0700
X-CSE-ConnectionGUID: gYHleVo3Rh2vjBdZeIrsiA==
X-CSE-MsgGUID: cfU3g0iFRcS4oWpjUbEkBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="39894559"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 05:59:28 -0700
Date: Wed, 12 Jun 2024 14:59:25 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: Re: [PATCH v7 4/5] lib/igt_sysfs: add helpers to access engine sysfs
 directory
Message-ID: <20240612125925.vnz4gttwofdqqx4u@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
References: <20240612-iga64_inline_ups-v7-0-0d4b840498c7@intel.com>
 <20240612-iga64_inline_ups-v7-4-0d4b840498c7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240612-iga64_inline_ups-v7-4-0d4b840498c7@intel.com>
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
On 2024-06-12 at 11:39:02 +0200, Andrzej Hajda wrote:
> Helpers follow convention of xe_sysfs_gt_(path|open).
> 
> v7:
>   - staticize local const array
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>  lib/igt_sysfs.c | 71 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_sysfs.h |  3 +++
>  2 files changed, 74 insertions(+)
> 
> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> index 0c5817eb1580..90b923a99a26 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -40,7 +40,9 @@
>  #include <dirent.h>
>  #include <unistd.h>
>  #include <fcntl.h>
> +#include <xe_drm.h>
>  
> +#include "drmtest.h"
>  #include "igt_core.h"
>  #include "igt_sysfs.h"
>  #include "igt_device.h"
> @@ -263,6 +265,75 @@ int xe_sysfs_gt_open(int xe_device, int gt)
>  	return open(path, O_RDONLY);
>  }
>  
> +static const char *engine_class_to_str(__u16 class)

Consider changing this to xe_engine_class_to_str but as it
is static here it can stay as is.

With or without it,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> +{
> +	static const char * const str[] = {
> +		[DRM_XE_ENGINE_CLASS_RENDER] = "rcs",
> +		[DRM_XE_ENGINE_CLASS_COPY] = "bcs",
> +		[DRM_XE_ENGINE_CLASS_VIDEO_DECODE] = "vcs",
> +		[DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE] = "vecs",
> +		[DRM_XE_ENGINE_CLASS_COMPUTE] = "ccs",
> +	};
> +
> +	if (class < ARRAY_SIZE(str))
> +		return str[class];
> +
> +	return "unk";
> +}
> +
> +/**
> + * xe_sysfs_engine_path:
> + * @xe_device: fd of the device
> + * @gt: gt number
> + * @class: engine class
> + * @path: buffer to fill with the sysfs gt path to the device
> + * @pathlen: length of @path buffer
> + *
> + * Returns:
> + * The directory path, or NULL on failure.
> + */
> +char *
> +xe_sysfs_engine_path(int xe_device, int gt, int class, char *path, int pathlen)
> +{
> +	struct stat st;
> +	int tile = IS_PONTEVECCHIO(intel_get_drm_devid(xe_device)) ? gt : 0;
> +
> +	if (xe_device < 0)
> +		return NULL;
> +
> +	if (igt_debug_on(fstat(xe_device, &st)) || igt_debug_on(!S_ISCHR(st.st_mode)))
> +		return NULL;
> +
> +	snprintf(path, pathlen, "/sys/dev/char/%d:%d/device/tile%d/gt%d/engines/%s",
> +		 major(st.st_rdev), minor(st.st_rdev), tile, gt, engine_class_to_str(class));
> +
> +	if (!access(path, F_OK))
> +		return path;
> +
> +	return NULL;
> +}
> +
> +/**
> + * xe_sysfs_engine_open:
> + * @xe_device: fd of the device
> + * @gt: gt number
> + * @class: engine class
> + *
> + * This opens the sysfs gt directory corresponding to device and tile for use
> + *
> + * Returns:
> + * The directory fd, or -1 on failure.
> + */
> +int xe_sysfs_engine_open(int xe_device, int gt, int class)
> +{
> +	char path[96];
> +
> +	if (!xe_sysfs_engine_path(xe_device, gt, class, path, sizeof(path)))
> +		return -1;
> +
> +	return open(path, O_RDONLY);
> +}
> +
>  /**
>   * igt_sysfs_gt_path:
>   * @device: fd of the device
> diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
> index f37d80ec130e..6c604d939013 100644
> --- a/lib/igt_sysfs.h
> +++ b/lib/igt_sysfs.h
> @@ -166,4 +166,7 @@ int xe_sysfs_gt_open(int xe_device, int gt);
>  char *xe_sysfs_tile_path(int xe_device, int tile, char *path, int pathlen);
>  int xe_sysfs_tile_open(int xe_device, int tile);
>  int xe_sysfs_get_num_tiles(int xe_device);
> +char *xe_sysfs_engine_path(int xe_device, int gt, int class, char *path, int pathlen);
> +int xe_sysfs_engine_open(int xe_device, int gt, int class);
> +
>  #endif /* __IGT_SYSFS_H__ */
> 
> -- 
> 2.34.1
> 
