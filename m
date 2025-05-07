Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2ED6C3ABBF
	for <igt-dev@archiver.kernel.org>; Wed,  7 May 2025 15:57:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3C1F10E84D;
	Wed,  7 May 2025 15:57:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H/f1YCuC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F24B10E84D
 for <igt-dev@lists.freedesktop.org>; Wed,  7 May 2025 15:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746633444; x=1778169444;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=7FFpALJKKQP+E9OiBDkvJV4KF9w7oLlW+p1/AXRiva4=;
 b=H/f1YCuC1pX40qV6+XOKXt5rAnH8aDgyEy5BE/Xu2kfWrwmKKKah+nHw
 J+PShBBhJ1o/FzYenM/KEBmKhAsbcrRMgbPkJ+g+ITz19/gXCReN9ydJd
 /NZRjWEFTf0n5GO6tAiEQUOyr0rnY7lPHLcTpaIKm1H4bSgvhb0lGFX3x
 z9wDcxrVntHHyU1wHeUO6eMgKiGMkRYThexnpAziOCaKlYJEhIJCfr0iA
 sun/KTScohXjvo2k7KzFk3Tpxx5SQVe4Al3cll+qnqIxNPfq/T2TXixBu
 exLp4tzENrlQ/exMrXEwsrciuo/Jc12efA8FQC0AWr/C4nTsLLlILGSUb Q==;
X-CSE-ConnectionGUID: KVNEerfjTHq15kMmj82K1w==
X-CSE-MsgGUID: 3njJ7TQAQLSo5grYDJNCMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="70875902"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="70875902"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 08:57:24 -0700
X-CSE-ConnectionGUID: khVK/j0WQ8amWEheAHLrPA==
X-CSE-MsgGUID: Ev+RPrwtT1+fxMmjjzgBhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="166927244"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 08:57:21 -0700
Date: Wed, 7 May 2025 17:57:18 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, louis.chauvet@bootlin.com,
 =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 Jim Shargo <jshargo@chromium.org>, Marius Vlad <marius.vlad@collabora.com>
Subject: Re: [PATCH i-g-t 2/5] lib/igt_configfs: Add helper to mount configfs
Message-ID: <20250507155718.iko4yxxo6osj3a2m@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Riana Tauro <riana.tauro@intel.com>, igt-dev@lists.freedesktop.org,
 anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 louis.chauvet@bootlin.com,
 =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 Jim Shargo <jshargo@chromium.org>,
 Marius Vlad <marius.vlad@collabora.com>
References: <20250422095602.55041-1-riana.tauro@intel.com>
 <20250422095602.55041-3-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250422095602.55041-3-riana.tauro@intel.com>
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

Hi Riana,
On 2025-04-22 at 15:25:58 +0530, Riana Tauro wrote:
> From: José Expósito <jose.exposito89@gmail.com>
> 
> Add a new helper function to mount and open configfs
> 
> Co-developed-by: Jim Shargo <jshargo@chromium.org>
> Signed-off-by: Jim Shargo <jshargo@chromium.org>
> Co-developed-by: Marius Vlad <marius.vlad@collabora.com>
> Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> Co-developed-by: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> ---
>  lib/igt.h          |  1 +
>  lib/igt_configfs.c | 82 ++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_configfs.h | 15 +++++++++
>  lib/meson.build    |  1 +
>  4 files changed, 99 insertions(+)
>  create mode 100644 lib/igt_configfs.c
>  create mode 100644 lib/igt_configfs.h
> 
> diff --git a/lib/igt.h b/lib/igt.h
> index 58c39e098..173ca70bf 100644
> --- a/lib/igt.h
> +++ b/lib/igt.h
> @@ -27,6 +27,7 @@
>  #include "drmtest.h"
>  #include "i915_3d.h"
>  #include "igt_aux.h"
> +#include "igt_configfs.h"
>  #include "igt_core.h"
>  #include "igt_debugfs.h"
>  #include "igt_draw.h"
> diff --git a/lib/igt_configfs.c b/lib/igt_configfs.c
> new file mode 100644
> index 000000000..6b202b76f
> --- /dev/null
> +++ b/lib/igt_configfs.c
> @@ -0,0 +1,82 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Google LLC.
> + * Copyright © 2023 Collabora, Ltd.
> + * Copyright © 2024 Red Hat, Inc.
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <sys/mount.h>

sys/mount.h should be after limits.h

> +#include <fcntl.h>
> +#include <limits.h>
> +
> +#include "igt_aux.h"
> +#include "igt_configfs.h"
> +
> +/**
> + * SECTION:igt_configfs
> + * @short_description: Support code for configfs features
> + * @title: configfs
> + * @include: igt_configfs.h
> + *
> + * This library provides helpers to access configfs features.
> + */
> +
> +/*
> + * General configfs helpers
> + */
> +
> +static const char *__igt_configfs_mount(void)
> +{
> +	if (igt_is_mountpoint("/sys/kernel/config"))
> +		return "/sys/kernel/config";
> +
> +	if (igt_is_mountpoint("/config"))
> +		return "/config";
> +
> +	if (mount("config", "/sys/kernel/config", "configfs", 0, 0))
> +		return NULL;
> +
> +	return "/sys/kernel/config";
> +}
> +
> +/**
> + * igt_configfs_mount:
> + *
> + * This attempts to locate where configfs is mounted on the filesystem,
> + * and if not found, will then try to mount configfs at /sys/kernel/config.
> + *
> + * Returns:
> + * The path to the configfs mount point (e.g. /sys/kernel/config)
> + */
> +const char *igt_configfs_mount(void)
> +{
> +	static const char *path;
> +
> +	if (!path)
> +		path = __igt_configfs_mount();
> +
> +	return path;
> +}
> +
> +/**
> + * igt_configfs_open: open configfs path
> + * @name: name of the configfs directory
> + *
> + * Opens the configfs directory corresponding to the name
> + *
> + * Returns:
> + * The directory fd, or -1 on failure.
> + */
> +int igt_configfs_open(const char *name)
> +{
> +	char path[PATH_MAX];
> +	const char *configfs_path;
> +
> +	configfs_path = igt_configfs_mount();
> +	igt_assert(configfs_path);

Try to not using asserts in libs, rather return -1 here,
you could add igt_debug if you think it will help here, so

	if (!configfs_path) {
		igt_debug("configfs not mounted, errno=%d\n", errno);

		return -1;
	}

Regards,
Kamil

> +
> +	snprintf(path, sizeof(path), "%s/%s", configfs_path, name);
> +
> +	return open(path, O_RDONLY);
> +}
> diff --git a/lib/igt_configfs.h b/lib/igt_configfs.h
> new file mode 100644
> index 000000000..91f95659b
> --- /dev/null
> +++ b/lib/igt_configfs.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Google LLC.
> + * Copyright © 2023 Collabora, Ltd.
> + * Copyright © 2024 Red Hat, Inc.
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef __IGT_CONFIGFS_H__
> +#define __IGT_CONFIGFS_H__
> +
> +const char *igt_configfs_mount(void);
> +int igt_configfs_open(const char *name);
> +
> +#endif /* __IGT_CONFIGFS_H__ */
> diff --git a/lib/meson.build b/lib/meson.build
> index 8517cd540..59072d8ce 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -18,6 +18,7 @@ lib_sources = [
>  	'i915/i915_crc.c',
>  	'igt_collection.c',
>  	'igt_color_encoding.c',
> +	'igt_configfs.c',
>  	'igt_facts.c',
>  	'igt_crc.c',
>  	'igt_debugfs.c',
> -- 
> 2.47.1
> 
