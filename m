Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8DCEC8302F
	for <igt-dev@archiver.kernel.org>; Tue,  1 Jul 2025 10:59:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80B1A10E588;
	Tue,  1 Jul 2025 10:59:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VbDo0zTj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F43D10E588
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Jul 2025 10:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751367548; x=1782903548;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=YIBomvYCDEUtWgRCRnW2aektcSPcK8RnEP/cE8HcNqM=;
 b=VbDo0zTjmKKbUOz3IQwo43oei/ur81xu+pKIid3l6P5K4YrQV1x9aUVx
 nKduuaTN/maq/Z6YJYrJyKArms/Y+RfZ/l1pzA71UD3bK95WWNIUrgeRE
 FsqLiGZ6qwf0zAg3uaYhKdqiqshQxpeMf5lk0PUjWdkz6/yuVySK+l/xX
 x51zvebsAPfEEYqlYm47/l8YnWdUy8WsPl5PtejMeFe+gcdkL44hGKfAv
 xqQ65OtuRXJwFiTa8qnNLpPN/Eb4zyQsIAmWuKCENPGvL+y0YyQmcclfH
 N/vQ992NDb0JLsu2R5Iy5WeEtEDOO0BNweox6xH5MN0KrxX2lxxig1dBg g==;
X-CSE-ConnectionGUID: tdPNJu0WSq+/s+qDTh5jXw==
X-CSE-MsgGUID: M2mBVh+wT/uPs9h9uouQSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="53750495"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="53750495"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 03:59:08 -0700
X-CSE-ConnectionGUID: 2ymB+KL3RHqcbFnLcrfjVg==
X-CSE-MsgGUID: PJ3N2ch0T2KEMdVZP+gzCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="190909306"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 03:59:07 -0700
Date: Tue, 1 Jul 2025 12:58:48 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "david.e.box@linux.intel.com" <david.e.box@linux.intel.com>
Subject: Re: [PATCH] test/intel/xe_pmt: Add testing for BMG crashlog
Message-ID: <20250701105848.z6bjfe7dm7xhvoir@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "david.e.box@linux.intel.com" <david.e.box@linux.intel.com>
References: <20250627204846.521691-1-michael.j.ruhl@intel.com>
 <20250630101234.uysofyqjy2mjecmm@kamilkon-DESK.igk.intel.com>
 <IA1PR11MB6418ECB2BB6BB82F586824B2C146A@IA1PR11MB6418.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <IA1PR11MB6418ECB2BB6BB82F586824B2C146A@IA1PR11MB6418.namprd11.prod.outlook.com>
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

Hi Ruhl,,
On 2025-06-30 at 17:32:37 +0000, Ruhl, Michael J wrote:
> 
> >-----Original Message-----
> >From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> >Sent: Monday, June 30, 2025 6:13 AM
> >To: Ruhl, Michael J <michael.j.ruhl@intel.com>
> >Cc: igt-dev@lists.freedesktop.org; De Marchi, Lucas
> ><lucas.demarchi@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
> >david.e.box@linux.intel.com
> >Subject: Re: [PATCH] test/intel/xe_pmt: Add testing for BMG crashlog
> >
> >Hi Michael,
> >On 2025-06-27 at 16:48:42 -0400, Michael J. Ruhl wrote:
> >> The BMG devices has the PMT crashlog feature. If the devices present
> >> is a BMG, test PMT api.
> >>
> >> NOTE: the testing order is not flexible and must be done in
> >> the currently specified order.
> >>
> >> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> >> ---
> >>  tests/intel/xe_pmt.c | 561
> >+++++++++++++++++++++++++++++++++++++++++++
> >>  tests/meson.build    |   1 +
> >>  2 files changed, 562 insertions(+)
> >>  create mode 100644 tests/intel/xe_pmt.c
> >>
> >> diff --git a/tests/intel/xe_pmt.c b/tests/intel/xe_pmt.c
> >> new file mode 100644
> >> index 000000000..21a2e74e7
> >> --- /dev/null
> >> +++ b/tests/intel/xe_pmt.c
> >> @@ -0,0 +1,561 @@
> >> +// SPDX-License-Identifier: MIT
> >> +/*
> >> + * Copyright © 2025 Intel Corporation
> >> + */
> >> +
> >> +/**
> >> + * TEST: Verify BMG PMT files operations
> >
> >Please remove 'BMG' from test description here, as this could be
> >used for future GPUs. Also write full name for 'PMT', my guess
> >it is "Power Menagement Telemetry" but I could be wrong here.
> >
> >Second note - this is for crash logs, what about PM telemetry
> >for GPU? Could it also be tested?
> >
> >> + * Category: Core
> >> + * Mega feature: General Core features
> >> + * Sub-category: uapi
> >> + * Functionality: sysfs
> >> + * Description: Verify BMG PMT files are created and are accessable
> >
> >Same here, remove 'BMG'
> >
> >> + */
> >> +
> >> +#include <dirent.h>
> >> +#include <limits.h>
> >> +#include <string.h>
> >> +#include <fcntl.h>
> >
> >Move 'fcntl.h' to proper place.
> >
> >> +#include <unistd.h>
> >
> >You could place it as first one (this is an exception), up to
> >you.
> >
> >> +
> >> +#include "igt.h"
> >> +#include "igt_sysfs.h"
> >> +#include "linux_scaffold.h"
> >> +#include "xe_drm.h"
> >> +#include "xe/xe_ioctl.h"
> >> +#include "xe/xe_query.h"
> >> +
> >> +/* base directory names */
> >> +#define VSEC_CRASHLOG_DIR "intel_vsec.crashlog."
> >> +#define VSEC_TELEMETRY_DIR "intel_vsec.telemetry."
> >> +#define CRASHLOG_DIR "crashlog"
> >> +#define TELEMETRY_DIR "telem"
> >> +#define BMG_CRASHLOG_CNT 2
> >> +#define BMG_TELEMETRY_CNT 2
> >
> >Why 'BMG_' prefix here?
> >
> >> +
> >> +enum bmg_crashlog_instances {
> >> +	bmg_crashlog_punit = 0,
> >> +	bmg_crashlog_oobmsm,
> >> +	bmg_crashlog_max
> >> +};
> >
> >What is "oobmsm" shortcut?
> >
> >> +
> >> +enum bmg_telemety_instances {
> >> +	bmg_telemetry_punit = 0,
> >> +	bmg_telemetry_oobmsm,
> >> +	bmg_telemetry_max
> >> +};
> >> +
> >> +static char dev_path[PATH_MAX];
> >> +static char work_path[PATH_MAX * 2];
> >> +
> >> +/*
> >> + * In most case there should be a single instance of crashlog an telemetry
> >directories.
> >
> >'an'? Did you mean 'in'?
> >
> >> + * If DVSEC entries are separate the structure will be different.
> >> + */
> >> +static char crashlog_vsec_dir[32];
> >> +static char telemetry_vsec_dir[32];
> >> +
> >> +/* This needs to be specific for each supported device */
> >> +static char crashlog_dir[bmg_crashlog_max][32];
> >> +static char telemetry_dir[bmg_telemetry_max][32];
> >> +
> >> +/* telemetry file names */
> >> +static const char *telem = "telem";
> >> +
> >> +/* crashlog filenames and descriptors */
> >> +static const char *clear = "clear";
> >> +static const char *consumed = "consumed";
> >> +static const char *crashlog = "crashlog";
> >> +static const char *enable = "enable";
> >> +static const char *error = "error";
> >> +static const char *dev_guid = "guid";
> >> +static const char *rearm = "rearm";
> >> +static const char *trigger = "trigger";
> >> +
> >> +struct crashlog_v2_info {
> >> +	int clear_fd;
> >> +	int consumed_fd;
> >> +	int crashlog_fd;
> >> +	int enable_fd;
> >> +	int error_fd;
> >> +	int guid_fd;
> >> +	int rearm_fd;
> >> +	int trigger_fd;
> >> +	u_int32_t guid;
> >> +} bmg_info[bmg_crashlog_max];
> >> +
> >> +#define DEV_PATH_LEN 80
> >> +
> >> +/**
> >> + * device_sysfs_path:
> >> + * @fd: opened device file descriptor
> >> + * @path: buffer to store sysfs path to device directory
> >> + *
> >> + * Returns:
> >> + * On successfull path resolution sysfs path to device directory,
> >> + * NULL otherwise
> >> + */
> >> +static char *device_sysfs_path(int fd, char *path)
> >> +{
> >> +        char sysfs[DEV_PATH_LEN];
> >> +
> >> +        if (!igt_sysfs_path(fd, sysfs, sizeof(sysfs)))
> >> +                return NULL;
> >> +
> >> +        if (DEV_PATH_LEN <= (strlen(sysfs) + strlen("/device")))
> >> +                return NULL;
> >> +
> >> +        strcat(sysfs, "/device");
> >> +
> >> +        return realpath(sysfs, path);
> >> +}
> >> +
> >> +/**
> >> + * SUBTEST: test_pmt_directories
> >> + * BMG PMT directory structure:
> >> + * device/intel_vsec.crashlog.x/intel_pmt/crashlog<a,b>
> >> + * device/intel_vsec.telemetry.x/intel_pmt/telemetry<c,d>
> >> + *
> >> + * If this is done for a different platform, this could be
> >> + * different.
> >> + *
> >> + */
> >> +static void test_pmt_directories(int dev_fd)
> >> +{
> >> +	struct dirent *ent;
> >> +	int index;
> >> +	DIR *dir;
> >> +
> >> +        igt_assert(device_sysfs_path(dev_fd, dev_path));
> >> +
> >> +	/* verify top level PMT directories */
> >> +	dir = opendir(dev_path);
> >> +	igt_assert_f(dir, "no directories found\n");
> >
> >Why not igt_require_f()?
> 
> Hi Kamil,
> 
> Looking at the documentation for igt_require_f() I see:
> 
> "Should be used everywhere where a test checks results to decide about skipping."
> 
> I do not want to skip this test.  If the directory is not there, there is something wrong, and the test
> should fail.
> 
> Am I mis-understanding the usage here?
> 
> Thanks,
> 
> Mike

This is up to you, if these will be present in Xe driver
then yes, you could have igt_assert_f.

Regards,
Kamil

[...cut...]

