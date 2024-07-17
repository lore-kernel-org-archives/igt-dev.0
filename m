Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1CD2C3DA42
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jul 2024 13:52:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 043FD10E192;
	Wed, 17 Jul 2024 13:52:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FchXuqVd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96FC410E0CB
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jul 2024 13:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721224352; x=1752760352;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=VDljv5oNyt+Q6jNO+Aw3IUg3AsmEBguFIqM8+44FGfg=;
 b=FchXuqVdECrGPXhDfSEXh5R8Gxli/AYX3Bk5Xdwgu2HN/3DHaN84ziUO
 Re9eG/RH/ddbaSkS46ejLJT6H15xkV4NUeTAC9Y/a2xfE1HBObMqCg/C6
 Q/Dye5VhM3pARbHABirfeOagJmo3MkgBVIlv9xjY2Pun8lUY0uXO80rcP
 zS4lrVoPSlvzVA529K8L0iU7P/2aApZWCYV7Ec+DnSruOEFzPql1tx/vV
 y/Au1T7u7+EZ4Dyvlvlx6y4rqC+JYY9Hu48BlrhIxuE5E2o1nd6+mwUeq
 XbZtQsbnSgDAhQ/hE2K4Ilf+NLGiUXy5nJMKQq+nLckjMDMqdDIj07GV6 Q==;
X-CSE-ConnectionGUID: sc01fRwzTKaIdSMslgGkhw==
X-CSE-MsgGUID: iMWquVW6T8+tHECWdQ28SA==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="36268273"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="36268273"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 06:52:32 -0700
X-CSE-ConnectionGUID: SrrxJ0rWRtOgw3dB37nsQQ==
X-CSE-MsgGUID: mvqIErcQTQS821wtrfdBIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="51130638"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2024 06:52:30 -0700
Date: Wed, 17 Jul 2024 15:52:00 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 tursulin@ursulin.net, robdclark@chromium.org,
 lucas.demarchi@intel.com, healych@amazon.com,
 Daniel Vetter <daniel@ffwll.ch>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH v5 1/2] lib: Add DRM driver sysfs profiling knob toggling
 functions
Message-ID: <20240717135200.v3rxecsvgye32ouh@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 tursulin@ursulin.net, robdclark@chromium.org,
 lucas.demarchi@intel.com, healych@amazon.com,
 Daniel Vetter <daniel@ffwll.ch>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20240716205756.2973341-1-adrian.larumbe@collabora.com>
 <20240716205756.2973341-2-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240716205756.2973341-2-adrian.larumbe@collabora.com>
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

Hi Adrián,
On 2024-07-16 at 21:57:23 +0100, Adrián Larumbe wrote:
> Some DRM drivers need to have their accounting HW toggled on demand from
> user space so that fdinfo's drm-engine and drm-cycles tags can be updated
> upon job completion.
> 
> A profiler such as gputop should be able to check which DRM devices have
> such a sysfs knob, record its original state, toggle-enable it and revert
> this operation right before exiting.
> 
> Also create a new static library dependency for this family of functions so
> that it can later be linked against gputop.

Thank you for splitting this code into separate lib,
now ldd shows only 3 libs (as it was in previous):

ldd gputop
    linux-vdso.so.1 (0x000073d22da9f000)
    libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x000073d22d800000)
    /lib64/ld-linux-x86-64.so.2 (0x000073d22daa1000)

> 
> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  lib/igt_profiling.c | 189 ++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_profiling.h |  22 ++++++
>  lib/meson.build     |   8 ++
>  3 files changed, 219 insertions(+)
>  create mode 100644 lib/igt_profiling.c
>  create mode 100644 lib/igt_profiling.h
> 
> diff --git a/lib/igt_profiling.c b/lib/igt_profiling.c
> new file mode 100644
> index 000000000000..b615067422e7
> --- /dev/null
> +++ b/lib/igt_profiling.c
> @@ -0,0 +1,189 @@
> +// SPDX-License-Identifier: MIT

This should use /* SPDX... */ - I will fix it at merge.
Please use checkpatch.pl script from Linux kernel for checks,
look into CONTRIBUTE.md for few useful options.

With that:
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> +/*
> + * Copyright © 2024 Collabora Ltd.
> + *
> + * Author: Adrian Larumbe <adrian.larumbe@collabora.com>
> + *
> + */
> +
> +#include <unistd.h>
> +#include <assert.h>
> +#include <dirent.h>
> +#include <fcntl.h>
> +#include <stdbool.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +
> +#include "igt_profiling.h"
> +
> +#define SYSFS_DRM	"/sys/class/drm"
> +#define NUM_DEVICES	10
> +
> +/**
> + * igt_devices_profiled
> + *
> + * Gives us an array of igt_profiled_device structures, each of which contains
> + * the full path of the DRM device's sysfs profiling knob and its original
> + * state, so that it can be restored later on.
> + *
> + * Returns: NULL-terminated array of struct igt_profiled_device pointers, or
> + * NULL on failure.
> + */
> +struct igt_profiled_device *igt_devices_profiled(void)
> +{
> +	struct igt_profiled_device *profiled_devices;
> +	unsigned int devlist_len = NUM_DEVICES;
> +	unsigned int i = 0;
> +	struct dirent *entry;
> +	DIR *dev_dir;
> +
> +	/* The return array will be resized in case there are too many devices */
> +	profiled_devices = malloc(devlist_len * sizeof(struct igt_profiled_device));
> +	if (!profiled_devices)
> +		return NULL;
> +
> +	dev_dir = opendir(SYSFS_DRM);
> +	if (!dev_dir)
> +		goto end;
> +
> +	while ((entry = readdir(dev_dir)) != NULL) {
> +		char path[PATH_MAX];
> +		char orig_state;
> +		int sysfs_fd;
> +
> +		/* All DRM device entries are symlinks to other paths within sysfs */
> +		if (entry->d_type != DT_LNK)
> +			continue;
> +
> +		/* We're only interested in render nodes */
> +		if (strstr(entry->d_name, "render") != entry->d_name)
> +			continue;
> +
> +		snprintf(path, sizeof(path), "%s/%s/device/%s",
> +			 SYSFS_DRM, entry->d_name, "profiling");
> +
> +		if (access(path, F_OK))
> +			continue;
> +
> +		sysfs_fd = open(path, O_RDONLY);
> +		if (sysfs_fd == -1)
> +			continue;
> +
> +		if (read(sysfs_fd, &orig_state, 1) <= 0) {
> +			close(sysfs_fd);
> +			continue;
> +		}
> +
> +		if (i == (devlist_len - 1)) {
> +			struct igt_profiled_device *new_profiled_devices;
> +
> +			devlist_len += NUM_DEVICES;
> +			new_profiled_devices = realloc(profiled_devices, devlist_len);
> +			if (!new_profiled_devices)
> +				goto end;
> +			profiled_devices = new_profiled_devices;
> +		}
> +
> +		profiled_devices[i].syspath = strdup(path);
> +		profiled_devices[i++].original_state = orig_state;
> +
> +		close(sysfs_fd);
> +	}
> +
> +	if (i == 0)
> +		goto end;
> +	else
> +		profiled_devices[i].syspath = NULL; /* Array terminator */
> +
> +	return profiled_devices;
> +
> +end:
> +	free(profiled_devices);
> +	return NULL;
> +}
> +
> +/**
> + * igt_devices_configure_profiling
> + * @devices: NULL-terminated array of igt_profiled_device structures.
> + * @enable: If True, then enable profiling, otherwise restore to original state
> + *
> + * For every single device's profiling knob sysfs path in the NULL-terminated
> + * 'devices' array, set it to '1' if bool equals true. Otherwise set it to
> + * its original state at the time it was first probed in igt_devices_profiled
> + *
> + */
> +void igt_devices_configure_profiling(struct igt_profiled_device *devices, bool enable)
> +{
> +	assert(devices);
> +
> +	for (unsigned int i = 0; devices[i].syspath; i++) {
> +		int sysfs_fd = open(devices[i].syspath, O_WRONLY);
> +
> +		if (sysfs_fd < 0)
> +			continue;
> +
> +		write(sysfs_fd, enable ? "1" : &devices[i].original_state, 1);
> +		close(sysfs_fd);
> +	}
> +}
> +
> +/**
> + * igt_devices_configure_profiling
> + * @devices: NULL-terminated array of igt_profiled_device structures.
> + *
> + * For every single struct igt_profiled_device in the 'devices' array,
> + * free its duplicated syspath string, and then free the array itself.
> + *
> + */
> +void igt_devices_free_profiling(struct igt_profiled_device *devices)
> +{
> +	assert(devices);
> +
> +	for (unsigned int i = 0; devices[i].syspath; i++)
> +		free(devices[i].syspath);
> +
> +	free(devices);
> +}
> +
> +/**
> + * igt_devices_configure_profiling
> + * @devices: NULL-terminated array of igt_profiled_device structures.
> + *
> + * For every single struct igt_profiled_device in the 'devices' array,
> + * check whether the sysfs profiling knob has changed its state since
> + * the last time its original state was registered, and then update it
> + * accordingly. This is usually a symptom that there are other profilers
> + * currently trying to toggle the sysfs knob, or perhaps more than one
> + * instance of the same profiler.
> + * The goal of this function is ensuring the sysfs knob is eventually
> + * restored to a coherent state, even though a small race window is
> + * possible. There's nothing we can do about this, so this function
> + * tries to mitigate that situation in a best-effort fashion.
> + *
> + */
> +void igt_devices_update_original_profiling_state(struct igt_profiled_device *devices)
> +{
> +	assert(devices);
> +
> +	for (unsigned int i = 0; devices[i].syspath; i++) {
> +		char new_state;
> +		int sysfs_fd;
> +
> +		sysfs_fd = open(devices[i].syspath, O_RDWR);
> +		if (sysfs_fd == -1)
> +			continue;
> +
> +		if (!read(sysfs_fd, &new_state, 1)) {
> +			close(sysfs_fd);
> +			continue;
> +		}
> +
> +		if (new_state == '0') {
> +			write(sysfs_fd, "1", 1);
> +			devices[i].original_state = new_state;
> +		}
> +
> +		close(sysfs_fd);
> +	}
> +}
> diff --git a/lib/igt_profiling.h b/lib/igt_profiling.h
> new file mode 100644
> index 000000000000..b711d2cd2d19
> --- /dev/null
> +++ b/lib/igt_profiling.h
> @@ -0,0 +1,22 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Collabora Ltd.
> + *
> + * Author: Adrian Larumbe <adrian.larumbe@collabora.com>
> + *
> + */
> +
> +#ifndef IGT_PROFILING_H
> +#define IGT_PROFILING_H
> +
> +struct igt_profiled_device {
> +	char *syspath;
> +	char original_state;
> +};
> +
> +void igt_devices_configure_profiling(struct igt_profiled_device *devices, bool enable);
> +struct igt_profiled_device *igt_devices_profiled(void);
> +void igt_devices_free_profiling(struct igt_profiled_device *devices);
> +void igt_devices_update_original_profiling_state(struct igt_profiled_device *devices);
> +
> +#endif /* IGT_PROFILING_H */
> diff --git a/lib/meson.build b/lib/meson.build
> index 7577bee9d35e..f711e60a736a 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -309,6 +309,14 @@ lib_igt_drm_fdinfo_build = static_library('igt_drm_fdinfo',
>  
>  lib_igt_drm_fdinfo = declare_dependency(link_with : lib_igt_drm_fdinfo_build,
>  				  include_directories : inc)
> +
> +lib_igt_profiling_build = static_library('igt_profiling',
> +	['igt_profiling.c'],
> +	include_directories : inc)
> +
> +lib_igt_profiling = declare_dependency(link_with : lib_igt_profiling_build,
> +				        include_directories : inc)
> +
>  i915_perf_files = [
>    'igt_list.c',
>    'i915/perf.c',
> -- 
> 2.45.1
> 
