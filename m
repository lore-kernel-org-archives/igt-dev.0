Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51730C25B76
	for <igt-dev@archiver.kernel.org>; Mon,  3 Jun 2024 07:50:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBCCD10E234;
	Mon,  3 Jun 2024 07:50:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tmcum2zC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2902410E234
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Jun 2024 07:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717401031; x=1748937031;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=GsIC5q5Xac4jx87NQLbjKAroyNkK4MfPI1g1NsEajEQ=;
 b=Tmcum2zCWR0XSCBCYwbcn9NACXrlt3kw226PtjgQfYv5stptu8TIZRcF
 S31zsZmrQ8MH49TM51GKTVwMV+lpsdXWDjEMT7BEDx8amKR3bEvpykd/D
 U647uxTX9eEacQE79J53H2uU2O5cTyhAWQ6QaATthvkz8fBC9ZFJLU3EY
 kE5rjUafeYdiCpp1ZsO26oZWhmxMK/IKm6HNO1ZFIjn+UllpvhsQzwhvk
 omMBlfzMGc+OXJOB99kB3OPFTBYScNc1gUHH89nc+HNGbMThEK/smwNeK
 a0Zc4kNXBlpb41pJ75SHlGq9w4Xdh/5Y+gOP10/xhWipx4uj/6iZ4dC6N A==;
X-CSE-ConnectionGUID: Y/7fxnAmSCyNhB5hiDB2wg==
X-CSE-MsgGUID: eklR+2OiQMe293LdNYUIIg==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="13748717"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="13748717"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 00:50:31 -0700
X-CSE-ConnectionGUID: 2mRRr8mLQQmW1FIAocqn8w==
X-CSE-MsgGUID: KgrlpwxITwSedBXalviuEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="37424162"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.24])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 00:50:28 -0700
Date: Mon, 3 Jun 2024 09:50:25 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
Cc: tursulin@ursulin.net, robdclark@chromium.org,
 kamil.konieczny@linux.intel.com, lucas.demarchi@intel.com,
 igt-dev@lists.freedesktop.org, healych@amazon.com,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v4 1/2] lib: Add DRM driver sysfs profiling knob toggling
 functions
Message-ID: <20240603075025.qyxaxg4ynne7rqjh@zkempczy-mobl2>
References: <20240523114549.447126-1-adrian.larumbe@collabora.com>
 <20240523114549.447126-2-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240523114549.447126-2-adrian.larumbe@collabora.com>
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

On Thu, May 23, 2024 at 12:45:43PM +0100, Adrián Larumbe wrote:
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
> 
> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> ---
>  lib/igt_profiling.c | 190 ++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_profiling.h |  22 +++++
>  lib/meson.build     |   8 ++
>  3 files changed, 220 insertions(+)
>  create mode 100644 lib/igt_profiling.c
>  create mode 100644 lib/igt_profiling.h
> 
> diff --git a/lib/igt_profiling.c b/lib/igt_profiling.c
> new file mode 100644
> index 000000000000..0a21c1fa0672
> --- /dev/null
> +++ b/lib/igt_profiling.c
> @@ -0,0 +1,190 @@
> +// SPDX-License-Identifier: MIT
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
> +

Unnecessary blank line.

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

Above code doesn't support dynamically loaded driver for another
device but I assume your intention is to work over established
set of devices.

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
> index e2f740c116f8..6f61ed5c558b 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -291,6 +291,14 @@ lib_igt_drm_fdinfo_build = static_library('igt_drm_fdinfo',
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

With blank line nit fixed:

Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
