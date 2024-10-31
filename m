Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF6EE68972
	for <igt-dev@archiver.kernel.org>; Thu, 31 Oct 2024 10:28:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D71D110E85B;
	Thu, 31 Oct 2024 10:28:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oxpkwo3C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E34CE10E856
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Oct 2024 10:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730370511; x=1761906511;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+dvue7gunrRDyffSx1qm5hMxQhugvHAwBevFh1ZCHpw=;
 b=Oxpkwo3CXXbLSC7TSMWErJzjMlTZ5mg05xv2a9Bl9etJSuN5OcMXk0kN
 qlx3SOOIX1sHfBVtcHwYFCeHwHJ79Ym8/68I1FsKs9QxCHX0TuPtDSBK6
 3LKq7imhUIigP9OxYQ4g0819ZfSbOqmW/c0QnPF/DRH6cSMDbUuMl/Mnu
 cW6dCSr26uWEtY873kOCiYUj4sx9Yt0lF8ZFueuGy6o1lGL+dU3PPrEN6
 IiZZPNF/USTWxxh2FfQUAD/sjahVlPunHnYLu8jQXDvdy/nziOXx144sD
 YgqzkFxfbcNCts2cxpiMKpYfDksSub77zAvUSHTw64d6PhVAQIQX+FI+G Q==;
X-CSE-ConnectionGUID: er3V75XQRjK4P0qgmyipHQ==
X-CSE-MsgGUID: cbiEX9GSQ5+rcGPNPy/8Fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29958230"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29958230"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 03:28:30 -0700
X-CSE-ConnectionGUID: XLOSRFAdRuWsFA0xFmb3jg==
X-CSE-MsgGUID: Osr56oZMTde6ZKHkQkG9JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="82510584"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 03:28:28 -0700
Date: Thu, 31 Oct 2024 11:28:25 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com, michal.wajdeczko@intel.com,
 michal.winiarski@intel.com, narasimha.c.v@intel.com,
 piotr.piorkowski@intel.com, satyanarayana.k.v.p@intel.com,
 tomasz.lis@intel.com
Subject: Re: [PATCH i-g-t 1/5] lib/xe_sriov_debugfs: add helper for opening
 attributes
Message-ID: <20241031102825.jdqn46cb2jxranr4@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com, michal.wajdeczko@intel.com,
 michal.winiarski@intel.com, narasimha.c.v@intel.com,
 piotr.piorkowski@intel.com, satyanarayana.k.v.p@intel.com,
 tomasz.lis@intel.com
References: <20241030193629.1238637-1-marcin.bernatowicz@linux.intel.com>
 <20241030193629.1238637-2-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241030193629.1238637-2-marcin.bernatowicz@linux.intel.com>
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

Hi Marcin,
On 2024-10-30 at 20:36:25 +0100, Marcin Bernatowicz wrote:
> From: Lukasz Laguna <lukasz.laguna@intel.com>
> 
> Helper allows to open SR-IOV debugfs attributes corresponding to
> specified PF device, VF number and GT number.
> 
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Narasimha C V <narasimha.c.v@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> ---
>  lib/meson.build           |  1 +
>  lib/xe/xe_sriov_debugfs.c | 69 +++++++++++++++++++++++++++++++++++++++
>  lib/xe/xe_sriov_debugfs.h | 14 ++++++++
>  3 files changed, 84 insertions(+)
>  create mode 100644 lib/xe/xe_sriov_debugfs.c
>  create mode 100644 lib/xe/xe_sriov_debugfs.h
> 
> diff --git a/lib/meson.build b/lib/meson.build
> index c3556a921..3d5d68b75 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -116,6 +116,7 @@ lib_sources = [
>  	'xe/xe_mmio.c',
>  	'xe/xe_query.c',
>  	'xe/xe_spin.c',
> +	'xe/xe_sriov_debugfs.c',
>  	'xe/xe_util.c',
>  ]
>  
> diff --git a/lib/xe/xe_sriov_debugfs.c b/lib/xe/xe_sriov_debugfs.c
> new file mode 100644
> index 000000000..dc6ef9da3
> --- /dev/null
> +++ b/lib/xe/xe_sriov_debugfs.c
> @@ -0,0 +1,69 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright(c) 2024 Intel Corporation. All rights reserved.
> + */
> +
> +#include <dirent.h>
> +#include <fcntl.h>
> +
> +#include "drmtest.h"
> +#include "igt_debugfs.h"
> +#include "igt_sriov_device.h"
> +#include "xe/xe_sriov_debugfs.h"
> +#include "xe/xe_query.h"
> +
> +#define SRIOV_DEBUGFS_PATH_MAX 96
> +
> +static char *xe_sriov_pf_debugfs_path(int pf, unsigned int vf_num, unsigned int gt_num, char *path,
> +				      int pathlen)
> +{
> +	char sriov_path[SRIOV_DEBUGFS_PATH_MAX];
> +
> +	if (!igt_debugfs_path(pf, path, pathlen))
> +		return NULL;
> +
> +	if (vf_num)
> +		snprintf(sriov_path, SRIOV_DEBUGFS_PATH_MAX, "/gt%u/vf%u/", gt_num, vf_num);
> +	else
> +		snprintf(sriov_path, SRIOV_DEBUGFS_PATH_MAX, "/gt%u/pf/", gt_num);
> +
> +	strncat(path, sriov_path, pathlen - strlen(path));
> +
> +	if (access(path, F_OK))
> +		return NULL;
> +
> +	return path;
> +}
> +
> +/**
> + * xe_sriov_pf_debugfs_attr_open:
> + * @pf: PF device file descriptor
> + * @vf_num: VF number (1-based) or 0 for PF
> + * @gt_num: GT number
> + * @attr: debugfs attribute name
> + * @mode: mode bits as used by open()
> + *
> + * Opens SR-IOV debugfs attribute @attr for given PF device @pf, VF number @vf_num on GT @gt_num.
> + *
> + * Returns:
> + * File descriptor or -1 on failure.
> + */
> +int xe_sriov_pf_debugfs_attr_open(int pf, unsigned int vf_num, unsigned int gt_num,
> +				  const char *attr, int mode)
> +{
> +	char path[PATH_MAX];
> +	int debugfs;
> +
> +	igt_assert(igt_sriov_is_pf(pf) && is_xe_device(pf));
> +	igt_assert(gt_num < xe_number_gt(pf));
> +
> +	if (!xe_sriov_pf_debugfs_path(pf, vf_num, gt_num, path, sizeof(path)))
> +		return -1;
> +
> +	strncat(path, attr, sizeof(path) - strlen(path));
> +
> +	debugfs = open(path, mode);
> +	igt_debug_on(debugfs < 0);
> +
> +	return debugfs;
> +}
> diff --git a/lib/xe/xe_sriov_debugfs.h b/lib/xe/xe_sriov_debugfs.h
> new file mode 100644
> index 000000000..e859ff5b2
> --- /dev/null
> +++ b/lib/xe/xe_sriov_debugfs.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright(c) 2024 Intel Corporation. All rights reserved.
> + */
> +
> +#ifndef __XE_SRIOV_DEBUGFS_H__
> +#define __XE_SRIOV_DEBUGFS_H__
> +
> +#include <stdint.h>

You do not need this include here, please remove it.

Regards,
Kamil

> +
> +int xe_sriov_pf_debugfs_attr_open(int pf, unsigned int vf_num, unsigned int gt_num,
> +				  const char *attr, int mode);
> +
> +#endif /* __XE_SRIOV_DEBUGFS_H__ */
> -- 
> 2.31.1
> 
