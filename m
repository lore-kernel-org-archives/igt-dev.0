Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C81C369C2
	for <igt-dev@archiver.kernel.org>; Mon,  5 May 2025 05:35:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E87810E268;
	Mon,  5 May 2025 05:35:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b5eaSsVt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED0FF10E268
 for <igt-dev@lists.freedesktop.org>; Mon,  5 May 2025 05:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746423312; x=1777959312;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=FCXJWZIBhBKZzVcDGGZW15BdM7W3cA3GzCd7+wII6xc=;
 b=b5eaSsVt+pqDKzhr90Uj+1IrpsjHuAFqnHxsx94//65JYxO7QEFjJ26D
 KGhoI4oSiPMn8PWGWCX+aX/x9CVclnCWevxiZ+jQqtGu7g+hDaijxrliH
 GXbAR06dNDYIULtV/yoZgL6Rh09b6uxPj336U/OizJPaexjLtn4qd5n15
 /5j/zvLLgQEvSPqiKNXngb7inJbvjVJiTR5pcNu8TzIQXy9TvKWbX737h
 sHPneWvqS6kN7N+8mwbqXE5D5AbTm/69F9y70t6bNElM2Q6tbCK48l5sX
 Q7RT60MSq8qD4XkXvxJtlDSEwEUOqng5A3A9QPb8xiph5OlibDSwSi5Mb w==;
X-CSE-ConnectionGUID: Z9IxhAPDQrySXfExXO6DSQ==
X-CSE-MsgGUID: xLs477qxSuqm0nJcqBsHcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="58676015"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; d="scan'208";a="58676015"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2025 22:35:09 -0700
X-CSE-ConnectionGUID: MuDazZitRliWSLOTf2tJ4w==
X-CSE-MsgGUID: YwT0iGlgRICdigfcmsUzHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; d="scan'208";a="135483108"
Received: from aiddamse-mobl3.gar.corp.intel.com (HELO [10.247.235.34])
 ([10.247.235.34])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2025 22:35:06 -0700
Message-ID: <b5836a88-e575-483f-ac4b-68a509b85820@linux.intel.com>
Date: Mon, 5 May 2025 11:05:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/5] lib/igt_configfs: Add helper to mount configfs
To: Riana Tauro <riana.tauro@intel.com>, igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, kamil.konieczny@linux.intel.com,
 louis.chauvet@bootlin.com, =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?=
 <jose.exposito89@gmail.com>, Jim Shargo <jshargo@chromium.org>,
 Marius Vlad <marius.vlad@collabora.com>
References: <20250422095602.55041-1-riana.tauro@intel.com>
 <20250422095602.55041-3-riana.tauro@intel.com>
Content-Language: en-US
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20250422095602.55041-3-riana.tauro@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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


On 22-04-2025 15:25, Riana Tauro wrote:
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
> +
> +	snprintf(path, sizeof(path), "%s/%s", configfs_path, name);
> +
> +	return open(path, O_RDONLY);

to be safe better to use O_DIRECTORY flag as well.

Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>

Thanks,
Aravind.
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
