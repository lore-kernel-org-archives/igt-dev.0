Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70BF4C77B7F
	for <igt-dev@archiver.kernel.org>; Fri, 27 Jun 2025 16:25:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEFE310E27A;
	Fri, 27 Jun 2025 16:25:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V4sZ38Qk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D749310E27A
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Jun 2025 16:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751041556; x=1782577556;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=iiLDoiQ0L5Rs6iVwFqJIoQpr1PgmH9kkI+JdFqjli2M=;
 b=V4sZ38Qk5caoqnqAC7VM5nzztF3wnTuIvuM9MtXU9uZFTfLXPjB8V9xR
 liI7mSVTWoEw82wSTUDInKQRz4fouA1nLTdQqZoL55NVqRWxgbsrR3xez
 aW4p2+0rQtKPpYuS7+el/mF5yG6hlsFLhFwfLGfLLa2OEym+WyNfmglkG
 Y4gCAZcF+xDFtWO5LD7gyQmVS3qm5IyFWTWFZjqlCk/mLa0ktjIp04XOB
 zzzsxOakO/W2BMlnfY+jrH+M/XaLFtMPyEWwGHUY0ZrCb9doWaHwNfjSN
 XAvMvYvg6kIQtbyu4vDlbP+4IDbuEqfbLLHizgyAIeU4H07/jL2QwexaP g==;
X-CSE-ConnectionGUID: 7hz58qUpSKC2LT5hkCUFcw==
X-CSE-MsgGUID: Efr7Co10QVmm9LJ4p/q4dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="57036403"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="57036403"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 09:25:56 -0700
X-CSE-ConnectionGUID: uRikhYQCR86sRG6FmzYbKw==
X-CSE-MsgGUID: P350wC+TRaerGtX0TA72bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="152368829"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.97])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 09:25:54 -0700
Date: Fri, 27 Jun 2025 18:25:53 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mohammed Thasleem <mohammed.thasleem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [v7,1/7] lib/intel_wa: Add check for workaround in GTs
Message-ID: <aF7GEUAxNgPbbfNM@kamilkon-DESK1>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250627060446.29615-2-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250627060446.29615-2-mohammed.thasleem@intel.com>
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

On 2025-06-27 at 11:34:40 +0530, Mohammed Thasleem wrote:
> This function check the given workaround on available GTs.
> 
> v2: Add discription for return. (Kamil)
>     Rename function to igt_has_intel_wa. (Kamil)
>     Move lib changes to lib/igt_debugfs. (Kamil)
>     Dump the whole wa sysfs file and then search for the wa. (Vinod)
>     Use return true/false directly instead assigning value. (Vinod)
> v3: Updated return type discription and debugfs_fd failure check. (Kamil)
>     Return 0 or 1 instead of true or false. (Kamil)
> v4: Add check for xe device before execution. (Vinod)
> v5: Move igt_has_intel_wa to lib/intel_wa. (Kamil)
> v6: Remove unused header and move xe check to intel_is_fbc_supported. (Kamil)
> v7: Update the title and move header from .h to .c file. (Kamil)

Looks good, two small nits, see below.

> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>  lib/intel_wa.c  | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/intel_wa.h  | 11 +++++++++++
>  lib/meson.build |  1 +
>  3 files changed, 60 insertions(+)
>  create mode 100644 lib/intel_wa.c
>  create mode 100644 lib/intel_wa.h
> 
> diff --git a/lib/intel_wa.c b/lib/intel_wa.c
> new file mode 100644
> index 000000000..6abeee308
> --- /dev/null
> +++ b/lib/intel_wa.c
> @@ -0,0 +1,48 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <fcntl.h>
> +#include <stdint.h>
> +#include <stdio.h>
> +
> +#include "igt_debugfs.h"
> +#include "igt_sysfs.h"
> +#include "intel_wa.h"
> +#include "xe/xe_query.h"
> +
> +/**
> + * igt_has_intel_wa:
> + * @drm_fd:	A drm file descriptor
> + * @check_wa:	Workaround to be checked
> + *
> + * Returns:	0 if no WA, 1 if WA present, -1 on error
> + */
> +int igt_has_intel_wa(int drm_fd, const char *check_wa)
> +{
> +	int debugfs_fd;
> +	unsigned int xe;
> +	char name[256];
> +	char *debugfs_dump, *has_wa;
> +
> +	debugfs_fd = igt_debugfs_dir(drm_fd);
> +	if (debugfs_fd == -1)
> +		return -1;
> +
> +	xe_for_each_gt(drm_fd, xe) {
> +		sprintf(name, "gt%d/workarounds", xe);
> +		if (!igt_debugfs_exists(drm_fd, name, O_RDONLY))
> +			return -1;

You should close debugfs_fd before exit. Or remember ret and
break loop.

> +
> +		debugfs_dump = igt_sysfs_get(debugfs_fd, name);
> +		if (debugfs_dump != NULL) {
> +			has_wa = strstr(debugfs_dump, check_wa);
> +			free(debugfs_dump);
> +			if (has_wa)
> +				return 1;

Same here.

> +		}
> +	}
> +

Same here, close debugfs_fd.

> +	return 0;
> +}
> diff --git a/lib/intel_wa.h b/lib/intel_wa.h
> new file mode 100644
> index 000000000..765a5948e
> --- /dev/null
> +++ b/lib/intel_wa.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef __INTEL_WA_H__
> +#define __INTEL_WA_H__
> +
> +int igt_has_intel_wa(int drm_fd, const char *check_wa);
> +
> +#endif /* __INTEL_WA_H__ */
> diff --git a/lib/meson.build b/lib/meson.build
> index 5e4247aad..ef397fe45 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -88,6 +88,7 @@ lib_sources = [
>  	'intel_aux_pgtable.c',
>  	'intel_reg_map.c',
>  	'intel_iosf.c',
> +        'intel_wa.c',

Please do not use spaces, this should be one tab.

Regards,
Kamil

>  	'igt_kms.c',
>  	'igt_fb.c',
>  	'igt_core.c',
