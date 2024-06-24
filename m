Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23037C2BD05
	for <igt-dev@archiver.kernel.org>; Mon, 24 Jun 2024 11:32:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C9C810E119;
	Mon, 24 Jun 2024 11:32:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Vxb1a0o6";
	dkim-atps=neutral
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6FDB10E119
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Jun 2024 11:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1719228725;
 bh=KAje2BRIrHzXRE0MKBA+pj5tJd5aid/OTez7twvyHJ0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vxb1a0o6jfCoUExcGD0UiivAWNhkPceEjJ5eDlWVS1K4BOTimRxSNZKw8vLApK4Fq
 Qp2639iAe1m1Y7DSMZXv3ZRDZt+pbtVx8zDASDEqJPsoe54NlPx09Yn5/EaHMHK0jo
 Nk75bQXKsXhgd8FkAVckf35prjMo5DtBljw52v1GOItYbxizqILYe2sABQVYJ8i6W4
 1Sx15AUIaPYVSHIKTYh5ZoOVG2pL7QqXmY4+lOHoyEov8kJJQ0PiliUkARo9p3Z0ll
 Sp39Phhg/TJYPTydgk1fdlv/xaGTB+z+BXGMs/eIZ0fG/3oIUQ8nhy1PUAv3Cw6Fyx
 twip3/mLYENng==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: alarumbe)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id E7D0A37804C6;
 Mon, 24 Jun 2024 11:32:04 +0000 (UTC)
Date: Mon, 24 Jun 2024 12:32:04 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: tursulin@ursulin.net, robdclark@chromium.org, 
 kamil.konieczny@linux.intel.com, lucas.demarchi@intel.com,
 igt-dev@lists.freedesktop.org, 
 healych@amazon.com, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v4 1/2] lib: Add DRM driver sysfs profiling knob toggling
 functions
Message-ID: <q3cdndihzspdlx5dlu2de435pekzgnn5ymo2g5shpnyvzuaukq@rypwmlh4sdhj>
References: <20240523114549.447126-1-adrian.larumbe@collabora.com>
 <20240523114549.447126-2-adrian.larumbe@collabora.com>
 <20240603075025.qyxaxg4ynne7rqjh@zkempczy-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240603075025.qyxaxg4ynne7rqjh@zkempczy-mobl2>
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

On 03.06.2024 09:50, Zbigniew Kempczyński wrote:
> On Thu, May 23, 2024 at 12:45:43PM +0100, Adrián Larumbe wrote:
> > Some DRM drivers need to have their accounting HW toggled on demand from
> > user space so that fdinfo's drm-engine and drm-cycles tags can be updated
> > upon job completion.
> > 
> > A profiler such as gputop should be able to check which DRM devices have
> > such a sysfs knob, record its original state, toggle-enable it and revert
> > this operation right before exiting.
> > 
> > Also create a new static library dependency for this family of functions so
> > that it can later be linked against gputop.
> > 
> > Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> > ---
> >  lib/igt_profiling.c | 190 ++++++++++++++++++++++++++++++++++++++++++++
> >  lib/igt_profiling.h |  22 +++++
> >  lib/meson.build     |   8 ++
> >  3 files changed, 220 insertions(+)
> >  create mode 100644 lib/igt_profiling.c
> >  create mode 100644 lib/igt_profiling.h
> > 
> > diff --git a/lib/igt_profiling.c b/lib/igt_profiling.c
> > new file mode 100644
> > index 000000000000..0a21c1fa0672
> > --- /dev/null
> > +++ b/lib/igt_profiling.c
> > @@ -0,0 +1,190 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2024 Collabora Ltd.
> > + *
> > + * Author: Adrian Larumbe <adrian.larumbe@collabora.com>
> > + *
> > + */
> > +
> > +#include <unistd.h>
> > +#include <assert.h>
> > +#include <dirent.h>
> > +#include <fcntl.h>
> > +#include <stdbool.h>
> > +#include <stdio.h>
> > +#include <stdlib.h>
> > +#include <string.h>
> > +
> > +#include "igt_profiling.h"
> > +
> > +#define SYSFS_DRM	"/sys/class/drm"
> > +#define NUM_DEVICES	10
> > +
> > +/**
> > + * igt_devices_profiled
> > + *
> > + * Gives us an array of igt_profiled_device structures, each of which contains
> > + * the full path of the DRM device's sysfs profiling knob and its original
> > + * state, so that it can be restored later on.
> > + *
> > + * Returns: NULL-terminated array of struct igt_profiled_device pointers, or
> > + * NULL on failure.
> > + */
> > +struct igt_profiled_device *igt_devices_profiled(void)
> > +{
> > +	struct igt_profiled_device *profiled_devices;
> > +	unsigned int devlist_len = NUM_DEVICES;
> > +	unsigned int i = 0;
> > +	struct dirent *entry;
> > +	DIR *dev_dir;
> > +
> > +	/* The return array will be resized in case there are too many devices */
> > +	profiled_devices = malloc(devlist_len * sizeof(struct igt_profiled_device));
> > +	if (!profiled_devices)
> > +		return NULL;
> > +
> > +	dev_dir = opendir(SYSFS_DRM);
> > +	if (!dev_dir)
> > +		goto end;
> > +
> > +	while ((entry = readdir(dev_dir)) != NULL) {
> > +		char path[PATH_MAX];
> > +		char orig_state;
> > +		int sysfs_fd;
> > +
> > +		/* All DRM device entries are symlinks to other paths within sysfs */
> > +		if (entry->d_type != DT_LNK)
> > +			continue;
> > +
> > +		/* We're only interested in render nodes */
> > +		if (strstr(entry->d_name, "render") != entry->d_name)
> > +			continue;
> > +
> > +		snprintf(path, sizeof(path), "%s/%s/device/%s",
> > +			 SYSFS_DRM, entry->d_name, "profiling");
> > +
> > +		if (access(path, F_OK))
> > +			continue;
> > +
> > +		sysfs_fd = open(path, O_RDONLY);
> > +		if (sysfs_fd == -1)
> > +			continue;
> > +
> > +		if (read(sysfs_fd, &orig_state, 1) <= 0) {
> > +			close(sysfs_fd);
> > +			continue;
> > +		}
> > +
> > +		if (i == (devlist_len - 1)) {
> > +			struct igt_profiled_device *new_profiled_devices;
> > +
> > +			devlist_len += NUM_DEVICES;
> > +			new_profiled_devices = realloc(profiled_devices, devlist_len);
> > +			if (!new_profiled_devices)
> > +				goto end;
> > +			profiled_devices = new_profiled_devices;
> > +		}
> > +
> > +		profiled_devices[i].syspath = strdup(path);
> > +		profiled_devices[i++].original_state = orig_state;
> > +
> > +		close(sysfs_fd);
> > +	}
> > +
> > +	if (i == 0)
> > +		goto end;
> > +	else
> > +		profiled_devices[i].syspath = NULL; /* Array terminator */
> > +
> > +	return profiled_devices;
> > +
> > +end:
> > +	free(profiled_devices);
> > +	return NULL;
> > +}
> > +
> > +/**
> > + * igt_devices_configure_profiling
> > + * @devices: NULL-terminated array of igt_profiled_device structures.
> > + * @enable: If True, then enable profiling, otherwise restore to original state
> > + *
> > + * For every single device's profiling knob sysfs path in the NULL-terminated
> > + * 'devices' array, set it to '1' if bool equals true. Otherwise set it to
> > + * its original state at the time it was first probed in igt_devices_profiled
> > + *
> > + */
> > +void igt_devices_configure_profiling(struct igt_profiled_device *devices, bool enable)
> > +{
> > +	assert(devices);
> > +
> > +	for (unsigned int i = 0; devices[i].syspath; i++) {
> > +
> 
> Unnecessary blank line.
> 
> > +		int sysfs_fd = open(devices[i].syspath, O_WRONLY);
> > +
> > +		if (sysfs_fd < 0)
> > +			continue;
> > +
> > +		write(sysfs_fd, enable ? "1" : &devices[i].original_state, 1);
> > +		close(sysfs_fd);
> > +	}
> > +}
> > +
> > +/**
> > + * igt_devices_configure_profiling
> > + * @devices: NULL-terminated array of igt_profiled_device structures.
> > + *
> > + * For every single struct igt_profiled_device in the 'devices' array,
> > + * free its duplicated syspath string, and then free the array itself.
> > + *
> > + */
> > +void igt_devices_free_profiling(struct igt_profiled_device *devices)
> > +{
> > +	assert(devices);
> > +
> > +	for (unsigned int i = 0; devices[i].syspath; i++)
> > +		free(devices[i].syspath);
> > +
> > +	free(devices);
> > +}
> > +
> > +/**
> > + * igt_devices_configure_profiling
> > + * @devices: NULL-terminated array of igt_profiled_device structures.
> > + *
> > + * For every single struct igt_profiled_device in the 'devices' array,
> > + * check whether the sysfs profiling knob has changed its state since
> > + * the last time its original state was registered, and then update it
> > + * accordingly. This is usually a symptom that there are other profilers
> > + * currently trying to toggle the sysfs knob, or perhaps more than one
> > + * instance of the same profiler.
> > + * The goal of this function is ensuring the sysfs knob is eventually
> > + * restored to a coherent state, even though a small race window is
> > + * possible. There's nothing we can do about this, so this function
> > + * tries to mitigate that situation in a best-effort fashion.
> > + *
> > + */
> > +void igt_devices_update_original_profiling_state(struct igt_profiled_device *devices)
> > +{
> > +	assert(devices);
> > +
> > +	for (unsigned int i = 0; devices[i].syspath; i++) {
> > +		char new_state;
> > +		int sysfs_fd;
> > +
> > +		sysfs_fd = open(devices[i].syspath, O_RDWR);
> > +		if (sysfs_fd == -1)
> > +			continue;
> > +
> > +		if (!read(sysfs_fd, &new_state, 1)) {
> > +			close(sysfs_fd);
> > +			continue;
> > +		}
> > +
> > +		if (new_state == '0') {
> > +			write(sysfs_fd, "1", 1);
> > +			devices[i].original_state = new_state;
> > +		}
> > +
> > +		close(sysfs_fd);
> > +	}
> > +}
> 
> Above code doesn't support dynamically loaded driver for another
> device but I assume your intention is to work over established
> set of devices.

I just realised I didn't even prepare for this event. I suppose I could add a
device scan and check for new profile devices at the end of every display loop,
but at the same time it seems like such an unusual situation that perhaps
there's no need to worry about it.

> > diff --git a/lib/igt_profiling.h b/lib/igt_profiling.h
> > new file mode 100644
> > index 000000000000..b711d2cd2d19
> > --- /dev/null
> > +++ b/lib/igt_profiling.h
> > @@ -0,0 +1,22 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2024 Collabora Ltd.
> > + *
> > + * Author: Adrian Larumbe <adrian.larumbe@collabora.com>
> > + *
> > + */
> > +
> > +#ifndef IGT_PROFILING_H
> > +#define IGT_PROFILING_H
> > +
> > +struct igt_profiled_device {
> > +	char *syspath;
> > +	char original_state;
> > +};
> > +
> > +void igt_devices_configure_profiling(struct igt_profiled_device *devices, bool enable);
> > +struct igt_profiled_device *igt_devices_profiled(void);
> > +void igt_devices_free_profiling(struct igt_profiled_device *devices);
> > +void igt_devices_update_original_profiling_state(struct igt_profiled_device *devices);
> > +
> > +#endif /* IGT_PROFILING_H */
> > diff --git a/lib/meson.build b/lib/meson.build
> > index e2f740c116f8..6f61ed5c558b 100644
> > --- a/lib/meson.build
> > +++ b/lib/meson.build
> > @@ -291,6 +291,14 @@ lib_igt_drm_fdinfo_build = static_library('igt_drm_fdinfo',
> >  
> >  lib_igt_drm_fdinfo = declare_dependency(link_with : lib_igt_drm_fdinfo_build,
> >  				  include_directories : inc)
> > +
> > +lib_igt_profiling_build = static_library('igt_profiling',
> > +	['igt_profiling.c'],
> > +	include_directories : inc)
> > +
> > +lib_igt_profiling = declare_dependency(link_with : lib_igt_profiling_build,
> > +				        include_directories : inc)
> > +
> >  i915_perf_files = [
> >    'igt_list.c',
> >    'i915/perf.c',
> > -- 
> > 2.45.1
> > 
> 
> With blank line nit fixed:
> 
> Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> 
> --
> Zbigniew

Adrian Larumbe
