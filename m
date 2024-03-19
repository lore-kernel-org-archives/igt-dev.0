Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 121D1C54E60
	for <igt-dev@archiver.kernel.org>; Tue, 19 Mar 2024 13:46:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A3ED10FAD9;
	Tue, 19 Mar 2024 13:46:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="yTjr4jSU";
	dkim-atps=neutral
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B6F010FAD9
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Mar 2024 13:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1710856000;
 bh=M/3XHCZgcHzmz4oW6UT18Xh9a0JWBT2+sbUzIvm5UUQ=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=yTjr4jSUWM2AdUqgMbT8a9sXGkKTw1FGKrW6yVdT0v6ZboGjuX1ovLfkUQDpI858Q
 1JKqC2q0okcijZcwFTbyjJDRh0wgNv5/oJUaLo2TyhrovYCEj1haoTfNICq0eMiPAI
 bzh/QIFIoGrjen0ZiVP8gudjS2RaP0AaAr8Vo5IfHh7gSBwxM5/fVVPlT0tp5Apd2n
 2ExXWMXC0xvLooSwwWNxQ/16qvp6CU09BiG7IgrvnbqmfTMcA9kDpihziXye3TA2K4
 Tf7v9AqgiTBTz6kJa0tgeOwLOnO+znvRfcAcc+29IfokQTMjVN2j8F/5JTGeGd4duN
 S1xiopehYcNyQ==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: alarumbe)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id C396637813EA;
 Tue, 19 Mar 2024 13:46:39 +0000 (UTC)
Date: Tue, 19 Mar 2024 13:46:39 +0000
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 igt-dev@lists.freedesktop.org, tvrtko.ursulin@intel.com, daniel@ffwll.ch, 
 boris.brezillon@collabora.com, 
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH 1/2] lib: Add DRM driver sysfs profiling knob toggling
 functions
Message-ID: <47nkmtwfrq5sbrnuyjuic3gn6alughyew4n7aa3g66xwnwb5qh@qmtbmugutqco>
References: <20240316220229.249119-1-adrian.larumbe@collabora.com>
 <20240318123237.7qjhwob4dhigia3v@kamilkon-desk.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240318123237.7qjhwob4dhigia3v@kamilkon-desk.igk.intel.com>
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

On 18.03.2024 13:32, Kamil Konieczny wrote:
> Hi Adrián,
> On 2024-03-16 at 22:00:37 +0000, Adrián Larumbe wrote:
> > Some DRM drivers need to have their accounting HW toggled on demand from
> > user space so that fdinfo's drm-engine and drm-cycles tags can be updated
> > upon job completion.
> > 
> > A profiler such as gputop should be able to check which DRM devices have
> > such a sysfs knob, record its original state, toggle-enable it and revert
> > this operation right before exiting.
> > 
> > A new igt library igt_profiling.c file was added because using igt lib's
> > sysfs access functions would've triggered a cascade of linking dependencies
> > in intel_gpu_top, which only statically links a very small subset of the
> > igt library.
> > 
> 
> Please add here Cc: 
> 
> Cc: tvrtko.ursulin@intel.com
> Cc: daniel@ffwll.ch
> Cc: boris.brezillon@collabora.com
> 
> You are also touching igt_device_scan, so +Cc Zbigniew.
> Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
> 
> > Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> > ---
> >  lib/igt_device_scan.c | 45 +++++++++++++++++++++++++++++++++++++++++
> >  lib/igt_device_scan.h |  7 +++++++
> >  lib/igt_profiling.c   | 47 +++++++++++++++++++++++++++++++++++++++++++
> >  lib/igt_profiling.h   | 31 ++++++++++++++++++++++++++++
> >  lib/meson.build       |  1 +
> >  5 files changed, 131 insertions(+)
> >  create mode 100644 lib/igt_profiling.c
> >  create mode 100644 lib/igt_profiling.h
> > 
> > diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> > index fbf3fa482e21..e5b126cc5448 100644
> > --- a/lib/igt_device_scan.c
> > +++ b/lib/igt_device_scan.c
> > @@ -1105,6 +1105,51 @@ void igt_devices_scan(bool force)
> >  	igt_devs.devs_scanned = true;
> >  }
> >  
> > +struct igt_profiled_device *igt_devices_profiled(void)
> > +{
> > +	struct igt_profiled_device *profiled_devices;
> > +	struct igt_device *dev;
> > +	unsigned int devlist_len;
> > +	unsigned int i = 0;
> > +
> > +	if (!igt_devs.devs_scanned)
> > +		return NULL;
> > +
> > +	devlist_len = igt_list_length(&igt_devs.all);
> > +	if (devlist_len == 0)
> > +		return NULL;
> > +
> > +	profiled_devices = malloc(devlist_len * sizeof(struct igt_profiled_device));
> > +	if (!profiled_devices)
> > +		return NULL;
> > +
> > +	memset(profiled_devices, 0, devlist_len * sizeof(struct igt_profiled_device));
> > +
> > +	igt_list_for_each_entry(dev, &igt_devs.all, link) {
> > +		char path[PATH_MAX];
> > +		int sysfs_fd;
> > +
> > +		if (!get_attr(dev, "profiling"))
> > +			continue;
> > +
> > +		snprintf(path, sizeof(path), "%s/%s", dev->syspath, "profiling");
> > +		sysfs_fd = open(path, O_RDONLY);
> > +		if (sysfs_fd < 0)
> > +			continue;
> > +
> > +		profiled_devices[i].syspath = dev->syspath;
> > +		profiled_devices[i++].original_state =
> > +			strtoul(get_attr(dev, "profiling"), NULL, 10);
> > +	}
> > +
> > +	if (i == 0) {
> > +		free(profiled_devices);
> > +		profiled_devices = NULL;
> > +	}
> > +
> > +	return profiled_devices;
> > +}
> > +
> >  static inline void _pr_simple(const char *k, const char *v)
> >  {
> >  	printf("    %-16s: %s\n", k, v);
> > diff --git a/lib/igt_device_scan.h b/lib/igt_device_scan.h
> > index 48690e236c01..6c725d9081b2 100644
> > --- a/lib/igt_device_scan.h
> > +++ b/lib/igt_device_scan.h
> > @@ -63,8 +63,15 @@ struct igt_device_card {
> >  	uint16_t pci_vendor, pci_device;
> >  };
> >  
> > +struct igt_profiled_device {
> > +	char *syspath;
> > +	bool original_state;
> > +};
> > +
> >  void igt_devices_scan(bool force);
> >  
> > +struct igt_profiled_device *igt_devices_profiled(void);
> > +
> >  void igt_devices_print(const struct igt_devices_print_format *fmt);
> >  void igt_devices_print_vendors(void);
> >  void igt_device_print_filter_types(void);
> > diff --git a/lib/igt_profiling.c b/lib/igt_profiling.c
> > new file mode 100644
> > index 000000000000..63a2dd949dbc
> > --- /dev/null
> > +++ b/lib/igt_profiling.c
> > @@ -0,0 +1,47 @@
> 
> Add here SPDX MIT licence, see other headers, for example
> lib/intel_blt.h, so Add at begin of .c file:
> 
> // SPDX-License-Identifier: MIT
> 
> > +/*
> > + * Copyright © 2024 Collabora Ltd.
> > + * Copyright 2024 Adrian Larumbe <adrian.larumbe@collabora.com>
> -------------- ^
> Be consistent in using '(c)', it is missing here.
> 
> > + * Copyright 2024 Amazon.com, Inc. or its affiliates.
> -------------- ^
> Same here.
> 
> > + *
> > + * Permission is hereby granted, free of charge, to any person obtaining a
> 
> Remove this, it is replaced by SPDX.
> 
> > + * copy of this software and associated documentation files (the "Software"),
> > + * to deal in the Software without restriction, including without limitation
> > + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> > + * and/or sell copies of the Software, and to permit persons to whom the
> > + * Software is furnished to do so, subject to the following conditions:
> > + *
> > + * The above copyright notice and this permission notice (including the next
> > + * paragraph) shall be included in all copies or substantial portions of the
> > + * Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> > + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> > + * IN THE SOFTWARE.
> > + *
> > + */
> > +
> > +#include "igt_core.h"
> > +#include "igt_sysfs.h"
> > +#include "igt_device_scan.h"
> ---------------- ^
> Keep it sorted alphabetically.
> 
> > +#include "igt_profiling.h"
> ---------------- ^
> Same here.
> 
> > +
> > +#include <fcntl.h>
> ----------- ^^
> 
> Move system includes before igt ones.
> 
> > +
> > +void igt_devices_toggle_profiling(struct igt_profiled_device *devices, bool enable)
> > +{
> > +	for (unsigned int i = 0; devices[i].syspath; i++) {
> > +		int sysfs_fd = open(devices[i].syspath, O_RDONLY);
> > +
> > +		if (sysfs_fd < 0)
> > +			continue;
> > +
> > +		igt_sysfs_set_boolean(sysfs_fd, "profiling",
> > +				      enable ? true : devices[i].original_state);
> > +
> > +		close(sysfs_fd);
> > +	}
> > +}
> > diff --git a/lib/igt_profiling.h b/lib/igt_profiling.h
> > new file mode 100644
> > index 000000000000..e00345b46e3f
> > --- /dev/null
> > +++ b/lib/igt_profiling.h
> > @@ -0,0 +1,31 @@
> 
> Use SPDX here, for example look into lib/intel_blt.h
> 
> /* SPDX-License-Identifier: MIT */
> 
> > +/*
> > + * Copyright (C) 2024 Adrian Larumbe <adrian.larumbe@collabora.com>
> > + * Copyright 2024 Collabora Ltd.
> -------------- ^
> Missed (c)
> 
> > + * Copyright 2024 Amazon.com, Inc. or its affiliates.
> -------------- ^
> Same here.
> 
> > + *
> > + * Permission is hereby granted, free of charge, to any person obtaining a
> ----- ^
> Remove this text, see example intel_blt.h
> 
> > + * copy of this software and associated documentation files (the "Software"),
> > + * to deal in the Software without restriction, including without limitation
> > + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> > + * and/or sell copies of the Software, and to permit persons to whom the
> > + * Software is furnished to do so, subject to the following conditions:
> > + *
> > + * The above copyright notice and this permission notice (including the next
> > + * paragraph) shall be included in all copies or substantial portions of the
> > + * Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> > + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> > + * IN THE SOFTWARE.
> > + *
> > + */
> 
> In C language headers we useally protect them with ifdef/define/endif, so add:
> 
> #ifndef IGT_PROFILING_H
> #define IGT_PROFILING_H
> 
> and undef at end of file.
> 
> > +
> > +#include <stdbool.h>
> > +
> > +struct igt_profiled_device;
> > +
> > +void igt_devices_toggle_profiling(struct igt_profiled_device *devices, bool enable);
> 
> Here add:
> 
> #undef IGT_PROFILING_H
> 
> > diff --git a/lib/meson.build b/lib/meson.build
> > index 6122861d8b7a..70a6fe4485a2 100644
> > --- a/lib/meson.build
> > +++ b/lib/meson.build
> > @@ -24,6 +24,7 @@ lib_sources = [
> >  	'igt_device_scan.c',
> >  	'igt_drm_clients.h',
> >  	'igt_drm_fdinfo.c',
> > +        'igt_profiling.c',
> --------------- ^
> Try to keep it sorted. Imho this is wrong as it adds to igt lib
> and you said you want to minimize gputop lib useage?
> Maybe you should create igt_profiling lib, like others used by
> gputop?

I tried this at first, creating a single-file static archive from
igt_profiling.c and adding it to gputop's dependency list. The problem is this
triggers a huge dependence cascade because of referencing igt_sysfs.c symbols
inside igt_profiling.c, so I thought I would avoid this headache by expanding
lib igt and linking gputop dynamically instead against it, which I did in the
second patch.

> Regards,
> Kamil
> 
> >  	'igt_aux.c',
> >  	'igt_gt.c',
> >  	'igt_halffloat.c',
> > -- 
> > 2.43.0
> > 
