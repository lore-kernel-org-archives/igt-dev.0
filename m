Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF43C04FFE
	for <igt-dev@archiver.kernel.org>; Mon, 20 May 2024 07:23:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2714510E02E;
	Mon, 20 May 2024 07:23:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gOGaZcGX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DA8910E02E
 for <igt-dev@lists.freedesktop.org>; Mon, 20 May 2024 07:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716189802; x=1747725802;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=swlVyCpYWgzSL0UZdFFid4860hluAKwL9gxBB5rNwnU=;
 b=gOGaZcGXrixPTRNt3knGyfBfYiHKhs4CHC6YF7/YFnH94rOUW0Wtxu7Y
 hnHoyXwByR1W4w/4wj9ZQRLKbsK0qVr9FXBjG8AxOuztEFXB1FFNL9r8F
 M3gESrgvkSn+5qZyA3YabgwHGqAjD/sHoAoiDB6ffVL+E0Hl7capWZ2Wo
 2gS/9LV5BgWMywzkXiG1Z7TotuxPIdAY94WWF18McH8Z2UPNCXutiv6nX
 2Q8RJgX6uBojqSXYvBUxYwKpdG4lzRn9f+SzI0x+uzkpGtaSAcPChGs67
 IX/PRWd6DjKoWazFHtA9Tr2DH7Mzt64oIM1NKLD0QDHVb9uFCeev+1Ghc Q==;
X-CSE-ConnectionGUID: 75/oFkSaQPieqJ5Uebj4dQ==
X-CSE-MsgGUID: 7YXnGpXeTSunnQqDN3OZzQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11077"; a="12520689"
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; d="scan'208";a="12520689"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 00:23:16 -0700
X-CSE-ConnectionGUID: bD6t/VxmTv6mRuXF9i373Q==
X-CSE-MsgGUID: 4SwFpzQmRa2h6AwnDD7Y9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; d="scan'208";a="32597903"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 localhost) ([10.245.246.76])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 00:23:13 -0700
Date: Mon, 20 May 2024 09:23:10 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
Cc: tvrtko.ursulin@intel.com, robdclark@chromium.org,
 kamil.konieczny@linux.intel.com, lucas.demarchi@intel.com,
 igt-dev@lists.freedesktop.org, healych@amazon.com,
 kernel@collabora.com, Tvrtko Ursulin <tursulin@ursulin.net>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v3 1/2] lib: Add DRM driver sysfs profiling knob toggling
 functions
Message-ID: <20240520072310.autdpkwwvknftu2e@zkempczy-mobl2>
References: <20240510191716.282644-1-adrian.larumbe@collabora.com>
 <20240510191716.282644-2-adrian.larumbe@collabora.com>
 <20240513071233.lhefjndjurne2pt7@zkempczy-mobl2>
 <lgboobv5bugrlbxlkhm5juyvxayfcyknlm4alqmojkjx2eskku@wdq34qhymnbx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <lgboobv5bugrlbxlkhm5juyvxayfcyknlm4alqmojkjx2eskku@wdq34qhymnbx>
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

On Thu, May 16, 2024 at 08:28:07PM +0100, Adrián Larumbe wrote:
> Hi, Zbigniew
> 
> On 13.05.2024 09:12, Zbigniew Kempczyński wrote:
> > On Fri, May 10, 2024 at 08:15:20PM +0100, Adrián Larumbe wrote:
> > > Some DRM drivers need to have their accounting HW toggled on demand from
> > > user space so that fdinfo's drm-engine and drm-cycles tags can be updated
> > > upon job completion.
> > > 
> > > A profiler such as gputop should be able to check which DRM devices have
> > > such a sysfs knob, record its original state, toggle-enable it and revert
> > > this operation right before exiting.
> > > 
> > > Also create a new static library dependency for this family of functions so
> > > that it can later be linked against gputop.
> > > 
> > > Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> > > ---
> > >  lib/igt_profiling.c | 141 ++++++++++++++++++++++++++++++++++++++++++++
> > >  lib/igt_profiling.h |  21 +++++++
> > >  lib/meson.build     |   8 +++
> > >  3 files changed, 170 insertions(+)
> > >  create mode 100644 lib/igt_profiling.c
> > >  create mode 100644 lib/igt_profiling.h
> > > 
> > > diff --git a/lib/igt_profiling.c b/lib/igt_profiling.c
> > > new file mode 100644
> > > index 000000000000..f5ac40d072ac
> > > --- /dev/null
> > > +++ b/lib/igt_profiling.c
> > > @@ -0,0 +1,141 @@
> > > +// SPDX-License-Identifier: MIT
> > > +/*
> > > + * Copyright © 2024 Collabora Ltd.
> > > + * Copyright © 2024 Adrian Larumbe <adrian.larumbe@collabora.com>
> > > + * Copyright © 2024 Amazon.com, Inc. or its affiliates.
> > > + *
> > > + */
> > > +
> > > +#include <fcntl.h>
> > > +#include <unistd.h>
> > > +#include <dirent.h>
> > > +#include <stdio.h>
> > > +#include <stdlib.h>
> > > +#include <string.h>
> > > +#include <assert.h>
> > > +#include <stdbool.h>
> > > +
> > > +#include "igt_profiling.h"
> > > +
> > > +#define SYSFS_DRM	"/sys/class/drm"
> > > +#define NUM_DEVICES	10
> > > +
> > > +struct igt_profiled_device *igt_devices_profiled(void)
> > > +{
> > > +	struct igt_profiled_device *profiled_devices;
> > > +	unsigned int devlist_len = NUM_DEVICES;
> > > +	unsigned int i = 0;
> > > +	struct dirent *entry;
> > > +	DIR *dev_dir;
> > > +
> > > +	/* The return array will be resized in case there are too many devices */
> > > +	profiled_devices = malloc(devlist_len * sizeof(struct igt_profiled_device));
> > > +	if (!profiled_devices)
> > > +		return NULL;
> > > +
> > > +	dev_dir = opendir(SYSFS_DRM);
> > > +	if (!dev_dir) {
> > 
> > 		goto end;
> 
> I'll also change the other functions to do the error handling after a goto label.
> 
> > > +		free(profiled_devices);
> > > +		return NULL;
> > > +	}
> > > +
> > > +	while ((entry = readdir(dev_dir)) != NULL) {
> > > +		char path[PATH_MAX];
> > > +		char orig_state;
> > > +		int sysfs_fd;
> > > +
> > > +		/* All DRM device entries are symlinks to other paths within sysfs */
> > > +		if (entry->d_type != DT_LNK)
> > > +			continue;
> > > +
> > > +		/* We're only interested in render nodes */
> > > +		if (strstr(entry->d_name, "render") != entry->d_name)
> > > +			continue;
> > > +
> > > +		snprintf(path, sizeof(path), "%s/%s/device/%s",
> > > +			 SYSFS_DRM, entry->d_name, "profiling");
> > > +
> > > +		if (access(path, F_OK))
> > > +			continue;
> > > +
> > > +		sysfs_fd = open(path, O_RDONLY);
> > > +		if (sysfs_fd == -1)
> > > +			continue;
> > > +
> > > +		if (read(sysfs_fd, &orig_state, 1) <= 0) {
> > > +			close(sysfs_fd);
> > > +			continue;
> > > +		}
> > > +
> > > +		if (i == (devlist_len - 1)) {
> > > +			devlist_len += NUM_DEVICES;
> > > +			profiled_devices = realloc(profiled_devices, devlist_len);
> > > +		}
> > > +
> > > +		profiled_devices[i].syspath = strdup(path);
> > 
> > According to realloc above - if it will fail we'll get segfault here.
> 
> Sorry, completely forgot to do the due error checking here, will go into the next version.  
> 
> > > +		profiled_devices[i++].original_state = orig_state;
> > > +
> > > +		close(sysfs_fd);
> > > +	}
> > > +
> > 
> > end:
> > 
> > > +	if (i == 0) {
> > > +		free(profiled_devices);
> > > +		profiled_devices = NULL;
> > > +	} else
> > > +		profiled_devices[i].syspath = NULL; /* Array terminator */
> > > +
> > > +	return profiled_devices;
> > > +}
> > > +
> > > +
> > > +void igt_devices_toggle_profiling(struct igt_profiled_device *devices, bool enable)
> > 
> > I think you should document this. Function sets profiling if enable == 1,
> > for enable == 0 it restores original state. For me 'toggle' is a little
> > bit confusing - I would rather expect 0 -> 1 and 1 -> 0 state change but
> > you're restoring original state. Maybe 'set_profiling' would be better?
> 
> You're right about this, the naming might be a bit confusing. Maybe rename it to
> igt_devices_enable_restore_profiling?

Maybe igt_devices_configure_profiling()? I'm still not happy with the
name so pick one you think matches the code and document it, that's
enough for me.

> 
> > > +{
> > > +	assert(devices);
> > > +
> > > +	for (unsigned int i = 0; devices[i].syspath; i++) {
> > > +
> > > +		int sysfs_fd = open(devices[i].syspath, O_WRONLY);
> > > +
> > > +		if (sysfs_fd < 0)
> > > +			continue;
> > > +
> > > +		write(sysfs_fd, enable ? "1" : &devices[i].original_state, 1);
> > > +		close(sysfs_fd);
> > > +	}
> > > +}
> > > +
> > > +void igt_devices_free_profiling(struct igt_profiled_device *devices)
> > > +{
> > > +	assert(devices);
> > > +
> > > +	for (unsigned int i = 0; devices[i].syspath; i++)
> > > +		free(devices[i].syspath);
> > > +
> > > +	free(devices);
> > > +}
> > > +
> > > +void igt_devices_update_original_profiling_state(struct igt_profiled_device *devices)
> > 
> > You may use igt_devices_toggle_profiling(devices, true); to achieve
> > the same effect (adding read() which checks on which devices profiling
> > is still set to 0). I assume igt_devices_profiled() collects original
> > state which should be restored so it's state should be const.
> 
> I think besides the iteration of the device list and opening the sysfs file, there isn't much
> else that I can refactor between both functions. Maybe turning the actual loop and opening
> the file into a macro? But even like this, I don't see much of a point in trying to save some
> lines for the sake of only two functions.

Ok, keep it as it is.

> 
> > > +{
> > > +	assert(devices);
> > > +
> > > +	for (unsigned int i = 0; devices[i].syspath; i++) {
> > > +		char new_state;
> > > +		int sysfs_fd;
> > > +
> > > +		sysfs_fd = open(devices[i].syspath, O_RDWR);
> > > +		if (sysfs_fd == -1)
> > > +			continue;
> > > +
> > > +		if (!read(sysfs_fd, &new_state, 1)) {
> > > +			close(sysfs_fd);
> > > +			continue;
> > > +		}
> > 
> > Only reason I see new_state could be changed if external process
> > would change it. Otherwise it is same to state from igt_devices_profiled().
> 
> That's indeed the case, and it was discussed in v2 of the patch series. Now I realised
> I forgot to include patchwork links in the cover letter, but some people were afraid
> the sysfs knob might be left in an inconsistent state if more tha once instance of
> gputop was run at the same time. Tvrtko suggested checking the sysfs knob state at the
> end of every gputop client display iteration to check for potential changes.

That means race window is very small (it is very unlikely external
process will touch sysfs entry between read() and write() here).

--
Zbigniew

> 
> > --
> > Zbigniew
> > 
> > > +
> > > +		if (new_state == '0') {
> > > +			write(sysfs_fd, "1", 1);
> > > +			devices[i].original_state = new_state;
> > > +		}
> > > +
> > > +		close(sysfs_fd);
> > > +	}
> > > +}
> > > diff --git a/lib/igt_profiling.h b/lib/igt_profiling.h
> > > new file mode 100644
> > > index 000000000000..fd0835d9a699
> > > --- /dev/null
> > > +++ b/lib/igt_profiling.h
> > > @@ -0,0 +1,21 @@
> > > +/* SPDX-License-Identifier: MIT */
> > > +/*
> > > + * Copyright © 2024 Collabora Ltd.
> > > + * Copyright © 2024 Adrian Larumbe <adrian.larumbe@collabora.com>
> > > + * Copyright © 2024 Amazon.com, Inc. or its affiliates.
> > > + */
> > > +
> > > +#ifndef IGT_PROFILING_H
> > > +#define IGT_PROFILING_H
> > > +
> > > +struct igt_profiled_device {
> > > +	char *syspath;
> > > +	char original_state;
> > > +};
> > > +
> > > +void igt_devices_toggle_profiling(struct igt_profiled_device *devices, bool enable);
> > > +struct igt_profiled_device *igt_devices_profiled(void);
> > > +void igt_devices_free_profiling(struct igt_profiled_device *devices);
> > > +void igt_devices_update_original_profiling_state(struct igt_profiled_device *devices);
> > > +
> > > +#endif /* IGT_PROFILING_H */
> > > diff --git a/lib/meson.build b/lib/meson.build
> > > index e2f740c116f8..6f61ed5c558b 100644
> > > --- a/lib/meson.build
> > > +++ b/lib/meson.build
> > > @@ -291,6 +291,14 @@ lib_igt_drm_fdinfo_build = static_library('igt_drm_fdinfo',
> > >  
> > >  lib_igt_drm_fdinfo = declare_dependency(link_with : lib_igt_drm_fdinfo_build,
> > >  				  include_directories : inc)
> > > +
> > > +lib_igt_profiling_build = static_library('igt_profiling',
> > > +	['igt_profiling.c'],
> > > +	include_directories : inc)
> > > +
> > > +lib_igt_profiling = declare_dependency(link_with : lib_igt_profiling_build,
> > > +				        include_directories : inc)
> > > +
> > >  i915_perf_files = [
> > >    'igt_list.c',
> > >    'i915/perf.c',
> > > -- 
> > > 2.44.0
> > > 
