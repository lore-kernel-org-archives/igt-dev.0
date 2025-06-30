Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 166D8C83029
	for <igt-dev@archiver.kernel.org>; Mon, 30 Jun 2025 16:38:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C2D010E057;
	Mon, 30 Jun 2025 16:38:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cOLWQIY+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DF8D10E057
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 16:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751301484; x=1782837484;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=LmDNyui4IzfXxCnGsA6SesTloFiKY7qHh5yhj1khuEw=;
 b=cOLWQIY+Dir7vGqPR2sadpChn/alEpTJCVCHt4GVKkegJzpp6gvAR5N7
 u14XbVMDH8N8DJCrgc4/FlxPV3IUwVeVJ5mBKLOS4HxzoIxfyns0ZkMp9
 xJa8ej8BcILW77E3jxEcxX6f0HOi1xF3mm06/u0xBX4D7NdgniwGcC18T
 DVyFKlke9+o/J0TCmtj6jVPwOqXe7yBFYiTWhH1lWHuhCVdRSyWtbb/F3
 Se49o/jP4coilG4yZHcocueHnGJ54Ko3PUU/hE15km+kY4Wd9abYw3vHg
 k1RgiHBRyEAe9cqalJz0PnLOYWqdjDZ3hz+SDWR3H8pojgtKKXbq7c0ev g==;
X-CSE-ConnectionGUID: jOQT7VpCRmmmm+JFOMLqxg==
X-CSE-MsgGUID: IqUltlzvR2CXrWlWQH/AOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="53472493"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="53472493"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 09:38:03 -0700
X-CSE-ConnectionGUID: ZVLst5MeSVaQW0FgBOcWKg==
X-CSE-MsgGUID: k/6M2mLASvm64FDokjWsyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="153143387"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 09:38:02 -0700
Date: Mon, 30 Jun 2025 18:37:47 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mohammed Thasleem <mohammed.thasleem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH v9 1/7] lib/intel_wa: Add check for workaround in GTs
Message-ID: <20250630163747.mve22irvr3pgvvjo@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250630134145.836-2-mohammed.thasleem@intel.com>
 <20250630151950.330502-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250630151950.330502-1-mohammed.thasleem@intel.com>
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

Hi Mohammed,
On 2025-06-30 at 20:49:50 +0530, Mohammed Thasleem wrote:
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
> v8: Close debugfs_fd before exit. (Kamil)
> v9: Remove null ckeck and single line coment for SPDX license. (Kamil)

imho 'fix SPDX line'
This could be fixed at merge, no need for resend,

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>  lib/intel_wa.c  | 54 +++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/intel_wa.h  | 11 ++++++++++
>  lib/meson.build |  1 +
>  3 files changed, 66 insertions(+)
>  create mode 100644 lib/intel_wa.c
>  create mode 100644 lib/intel_wa.h
> 
> diff --git a/lib/intel_wa.c b/lib/intel_wa.c
> new file mode 100644
> index 000000000..685df106f
> --- /dev/null
> +++ b/lib/intel_wa.c
> @@ -0,0 +1,54 @@
> +// SPDX-License-Identifier: MIT
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
> +	int ret = 0;
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
> +		if (!igt_debugfs_exists(drm_fd, name, O_RDONLY)) {
> +			ret = -1;
> +			break;
> +		}
> +
> +		debugfs_dump = igt_sysfs_get(debugfs_fd, name);
> +		if (debugfs_dump) {
> +			has_wa = strstr(debugfs_dump, check_wa);
> +			free(debugfs_dump);
> +			if (has_wa) {
> +				ret = 1;
> +				break;
> +			}
> +		}
> +	}
> +
> +	close(debugfs_fd);
> +	return ret;
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
>  	'igt_kms.c',
>  	'igt_fb.c',
>  	'igt_core.c',
> -- 
> 2.25.1
> 
