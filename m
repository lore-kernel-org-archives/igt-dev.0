Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7658CC43602
	for <igt-dev@archiver.kernel.org>; Mon,  6 Jul 2026 10:07:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27FE310E325;
	Mon,  6 Jul 2026 10:07:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eA5zXM7B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3056910E325
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jul 2026 10:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783332437; x=1814868437;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=klLkgxkflPuVfFQtNqOpaR0/5NWc+96nzNvOMOlVVkA=;
 b=eA5zXM7BGDK3gAYtzTl3ffzE71XM1cIpm+rHmFcRfJ7DnHMFvc9rJkVM
 RDTVjJsbSHIo1vdynGysnEjSgStVwmOi5VVPeVn7sYY5Vm51WSdn5GPSP
 S7eG8KACqMsbZHjpJbmjnr3gYbguDBfuJKQsSsHCmwjAUzUhx2zs68Zup
 qwnoAVD8eCaAbecCPHgzNkt2gDnxuUMnDfSr2A4YJNQnu3odUIbbk2xsK
 TIvgilbZTNQcYY2sDJTl3meno4oZgyw1DbssQR0gyZmjJxHfkjeTsoJXn
 UfOGfWNLmOgbIEc1IVqcvYJyXVa4tkRBL/C1VdnXA93Ld4OFeVa0cUUe+ A==;
X-CSE-ConnectionGUID: a1eP9hxrTF+0y61k+S9Ojg==
X-CSE-MsgGUID: qyHdS7VhSlWYkMbdVHnA+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="95473065"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="95473065"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 03:07:16 -0700
X-CSE-ConnectionGUID: HGbrkGnxSxqyuFkmQ0Eyyg==
X-CSE-MsgGUID: v1+jzwZdQqqZZUJNaICPmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="255613745"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 03:07:15 -0700
Date: Mon, 6 Jul 2026 12:06:40 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Cc: igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com,
 krzysztof.niemiec@intel.com, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v2 06/31] lib/igt_drm_stub: introduce for tools
 needing driver detection
Message-ID: <20260706100640.3hci5jpjumjvc7r4@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com,
 krzysztof.niemiec@intel.com,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
References: <cover.1783088106.git.sebastian.brzezinka@intel.com>
 <a7b3a59cfb110b0d7f94552207b2d6b9faae02aa.1783088106.git.sebastian.brzezinka@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a7b3a59cfb110b0d7f94552207b2d6b9faae02aa.1783088106.git.sebastian.brzezinka@intel.com>
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
On 2026-07-03 at 16:28:40 +0200, Sebastian Brzezinka wrote:
> Add drm/pciaccess-dependent stubs into a new igt_drm_stub.c.  This avoids
> pulling libdrm into tools that only need dep-free logging and exit stubs.
> 
> The new lib_igt_drm_stub static sub-library provides: igt_pci_system_init,
> is_i915_device, is_intel_device, xe_dev_id and __drm_open_driver.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  lib/igt_drm_stub.c | 132 +++++++++++++++++++++++++++++++++++++++++++++
>  lib/meson.build    |   9 ++++
>  2 files changed, 141 insertions(+)
>  create mode 100644 lib/igt_drm_stub.c
> 
> diff --git a/lib/igt_drm_stub.c b/lib/igt_drm_stub.c
> new file mode 100644
> index 000000000..f8ac3a992
> --- /dev/null
> +++ b/lib/igt_drm_stub.c
> @@ -0,0 +1,132 @@
> +/*
> + * Copyright © 2026 Intel Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a

Please remove this long text and use SPDX instead.

> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the next
> + * paragraph) shall be included in all copies or substantial portions of the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> + * IN THE SOFTWARE.
> + */
> +
> +/*
> + * Minimal DRM/PCI stubs for tools that need driver detection and device
> + * opening but do not link the full libigt.so.  Requires libdrm and pciaccess.

Please also write that this is a reimplemntation, and write
down which libs it is reimplementing.

> + */
> +
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <limits.h>
> +#include <pciaccess.h>
> +#include <stdbool.h>
> +#include <stdint.h>
> +#include <stdio.h>
> +#include <string.h>
> +#include <sys/stat.h>
> +#include <sys/sysmacros.h>
> +#include <unistd.h>
> +#include <xf86drm.h>
> +
> +#include "drmtest.h"
> +
> +int igt_pci_system_init(void)
> +{
> +	return pci_system_init();
> +}
> +
> +static bool driver_name_matches(int fd, const char *name)
> +{
> +	drmVersionPtr version;
> +	bool match = false;
> +
> +	version = drmGetVersion(fd);
> +	if (!version)
> +		return false;
> +
> +	match = version->name_len > 0 && !strcmp(version->name, name);
> +	drmFreeVersion(version);
> +
> +	return match;
> +}
> +
> +bool is_i915_device(int fd)
> +{
> +	return driver_name_matches(fd, "i915");
> +}
> +
> +bool is_intel_device(int fd)
> +{
> +	return is_i915_device(fd) || driver_name_matches(fd, "xe");
> +}
> +
> +static uint16_t read_pci_device_id(int fd)
> +{
> +	char path[PATH_MAX], buf[32];
> +	struct stat st;
> +	int sysfs, len;
> +	unsigned int devid;
> +
> +	if (fstat(fd, &st) || !S_ISCHR(st.st_mode))
> +		return 0;
> +
> +	snprintf(path, sizeof(path), "/sys/dev/char/%d:%d/device/device",
> +		 major(st.st_rdev), minor(st.st_rdev));
> +	sysfs = open(path, O_RDONLY);
> +	if (sysfs < 0)
> +		return 0;
> +
> +	len = read(sysfs, buf, sizeof(buf) - 1);
> +	close(sysfs);
> +	if (len <= 0)
> +		return 0;
> +
> +	buf[len] = '\0';
> +	if (sscanf(buf, "0x%x", &devid) != 1)
> +		return 0;
> +
> +	return devid;
> +}
> +
> +/* Matches the declaration in lib/xe/xe_query.h declared here to satisfy
> + * -Wmissing-prototypes without pulling in the heavy xe_query.h header.
> + */
> +uint16_t xe_dev_id(int fd);

Why do you repeat it when it is just below?

> +uint16_t xe_dev_id(int fd)
> +{
> +	return read_pci_device_id(fd);
> +}
> +
> +int __drm_open_driver(int chipset)
> +{
> +	char path[PATH_MAX];
> +	int fd;
> +
> +	for (int i = 0; i < 16; i++) {

Looks like we need a separate header with few magic constants,
like 16 here.

Regards,
Kamil

> +		snprintf(path, sizeof(path), "/dev/dri/card%d", i);
> +		fd = open(path, O_RDWR | O_CLOEXEC);
> +		if (fd < 0)
> +			continue;
> +
> +		if ((chipset == DRIVER_INTEL && is_i915_device(fd)) ||
> +		    (chipset == DRIVER_XE && driver_name_matches(fd, "xe")) ||
> +		    (chipset == DRIVER_ANY && is_intel_device(fd)))
> +			return fd;
> +
> +		close(fd);
> +	}
> +
> +	errno = ENODEV;
> +	return -1;
> +}
> diff --git a/lib/meson.build b/lib/meson.build
> index a57c1eb8d..484a912d7 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -356,6 +356,15 @@ lib_igt_tools_stub_build = static_library('igt_tools_stub',
>  lib_igt_tools_stub = declare_dependency(link_with : lib_igt_tools_stub_build,
>  					include_directories : inc)
>  
> +lib_igt_drm_stub_build = static_library('igt_drm_stub',
> +	['igt_drm_stub.c'],
> +	dependencies : [libdrm, pciaccess],
> +	include_directories : inc)
> +
> +lib_igt_drm_stub = declare_dependency(link_with : lib_igt_drm_stub_build,
> +				      dependencies : [libdrm, pciaccess],
> +				      include_directories : inc)
> +
>  scan_dep = [
>  	glib,
>  	libpci,
> -- 
> 2.53.0
> 
