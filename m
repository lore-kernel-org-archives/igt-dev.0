Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47160C25B75
	for <igt-dev@archiver.kernel.org>; Wed, 15 May 2024 17:50:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBE8410EB48;
	Wed, 15 May 2024 17:50:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K48eUKrh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6985410EB48
 for <igt-dev@lists.freedesktop.org>; Wed, 15 May 2024 17:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715795410; x=1747331410;
 h=date:from:cc:subject:message-id:references:mime-version:
 content-transfer-encoding:in-reply-to;
 bh=GWLtj1JYysd/Cm9KjX6mStrN/5HEpnyNHsxdUWqGGHI=;
 b=K48eUKrh9BcS4MvdQtqWUZXvZLnUSykqqSa42rZgEymVx+pA/glRH7SA
 nF8Rv1a/ewevaL7SAf/7YNpAd98NsOlesKPcaIOP1XP2+80yGxhC1AxHY
 TMwOFxa1+UxKFJ2jf0znCPHX1FrB5WFvMz1ZWm9PeKzCGqbPzNWQQFP+t
 UTm30Pl/UsEOcIXzUwocpu6vofkm1bU5KJ3nO8GkdPSd5LrJbdR+vdRmn
 L2u/fkLfzANPMLoUZncqsbW0hcOK8l4J6OEx6YBD8K2soMfTCyL0+ZcCa
 om4QU/uweJCIEfnYPDHsrl/lEnTteM4FhjzUlvxi0JJWiYkO83/TryW70 A==;
X-CSE-ConnectionGUID: yOnWkfTnTgCF5jem4b+u4Q==
X-CSE-MsgGUID: 3n20mVUmQomZm2M/MuHJ+g==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="34374005"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="34374005"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 10:50:09 -0700
X-CSE-ConnectionGUID: h8Gw1aVwQXqeDlyFcI5gcQ==
X-CSE-MsgGUID: 8VEb9I6qQOO8SS9sxYrDoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="31720447"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2024 10:50:06 -0700
Date: Wed, 15 May 2024 19:50:02 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 tursulin@ursulin.net, robdclark@chromium.org,
 lucas.demarchi@intel.com, healych@amazon.com, kernel@collabora.com,
 Daniel Vetter <daniel@ffwll.ch>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Petri Latvala <adrinael@adrinael.net>
Subject: Re: [PATCH v3 1/2] lib: Add DRM driver sysfs profiling knob toggling
 functions
Message-ID: <20240515175002.kc3rvrol3yod6xss@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 tursulin@ursulin.net, robdclark@chromium.org,
 lucas.demarchi@intel.com, healych@amazon.com, kernel@collabora.com,
 Daniel Vetter <daniel@ffwll.ch>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Petri Latvala <adrinael@adrinael.net>
References: <20240510192243.285457-1-adrian.larumbe@collabora.com>
 <20240510192243.285457-2-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240510192243.285457-2-adrian.larumbe@collabora.com>
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
On 2024-05-10 at 20:22:37 +0100, Adrián Larumbe wrote:
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
>  lib/igt_profiling.c | 141 ++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_profiling.h |  21 +++++++
>  lib/meson.build     |   8 +++
>  3 files changed, 170 insertions(+)
>  create mode 100644 lib/igt_profiling.c
>  create mode 100644 lib/igt_profiling.h
> 
> diff --git a/lib/igt_profiling.c b/lib/igt_profiling.c
> new file mode 100644
> index 000000000000..f5ac40d072ac
> --- /dev/null
> +++ b/lib/igt_profiling.c
> @@ -0,0 +1,141 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Collabora Ltd.
> + * Copyright © 2024 Adrian Larumbe <adrian.larumbe@collabora.com>
> + * Copyright © 2024 Amazon.com, Inc. or its affiliates.

This is unexpected, why not:

 * Copyright © 2024 Collabora Ltd.
 *
 * Author: Adrian Larumbe <adrian.larumbe@collabora.com>

Or:

 * Copyright © 2024 Collabora Ltd.
 * Copyright © 2024 Amazon.com, Inc. or its affiliates.
 *
 * Author: Adrian Larumbe <adrian.larumbe@collabora.com>

Amazon would be ok but I am not so sure about 'affiliates'.
Did you recive some funds from Amazon? Or reused its code?

Adding Petri to cc.

> + *
> + */
> +
> +#include <fcntl.h>
> +#include <unistd.h>
-------------^
Move this to begin, rest system header after it and sort them.

> +#include <dirent.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <assert.h>
> +#include <stdbool.h>
> +
> +#include "igt_profiling.h"
> +
> +#define SYSFS_DRM	"/sys/class/drm"
> +#define NUM_DEVICES	10
> +

Add description to each new public function.

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
> +	if (!dev_dir) {
> +		free(profiled_devices);
> +		return NULL;
> +	}
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
> +			devlist_len += NUM_DEVICES;
> +			profiled_devices = realloc(profiled_devices, devlist_len);
> +		}
> +
> +		profiled_devices[i].syspath = strdup(path);
> +		profiled_devices[i++].original_state = orig_state;
> +
> +		close(sysfs_fd);
> +	}
> +
> +	if (i == 0) {
> +		free(profiled_devices);
> +		profiled_devices = NULL;
> +	} else
> +		profiled_devices[i].syspath = NULL; /* Array terminator */
> +
> +	return profiled_devices;
> +}
> +
> +

Add description.

> +void igt_devices_toggle_profiling(struct igt_profiled_device *devices, bool enable)
> +{
> +	assert(devices);
> +
> +	for (unsigned int i = 0; devices[i].syspath; i++) {
> +
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

Add description.

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

Add description.

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
> index 000000000000..fd0835d9a699
> --- /dev/null
> +++ b/lib/igt_profiling.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Collabora Ltd.
> + * Copyright © 2024 Adrian Larumbe <adrian.larumbe@collabora.com>
------^
> + * Copyright © 2024 Amazon.com, Inc. or its affiliates.
------^
Same here.

Regards,
Kamil

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
> +void igt_devices_toggle_profiling(struct igt_profiled_device *devices, bool enable);
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
> 2.44.0
> 
