Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84883C61CE8
	for <igt-dev@archiver.kernel.org>; Thu, 12 Jun 2025 18:33:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3467610E095;
	Thu, 12 Jun 2025 18:33:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iQZ0wF4l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94CEF10E10D
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jun 2025 18:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749753232; x=1781289232;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CkUCCvbBnz0zkWyahrRMIxngfEznoVLWCzEfn/tErYk=;
 b=iQZ0wF4lBnciS/NNDcZjQ95KSA+2I2vMZaaEoqXctdbJPKLks4N/vSo8
 kxu+xW8U2nqZg5GyB58rpadwNX/CETKh98HErIAvHIyFN7zobiMuWTrjy
 ifr9r29mJpSWBP0lBO8gkaJTZmMLSjeYMmjCxkuxY8pXZKlLCe2CI5Pmn
 04782yfCp2BuZBf3KMgznYujgyWiqDBPxKyVb0tCfkWIVli8wEQoJNGiF
 5/dUR+kQG/zy0ovvetLCrjXWYPdr4w2vOTrS+7Nyr8DMqY/O4OeD2oj0p
 k6AVM0pw8WPsKtncr4zlyJxMpJKy1di8U42YMeEgh16uxB6dxe9LnTQdt Q==;
X-CSE-ConnectionGUID: V4noO0qkSSaIr8VPg/AVWw==
X-CSE-MsgGUID: izceY/JcRbmWZyIbHPlaHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="69391712"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="69391712"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 11:33:51 -0700
X-CSE-ConnectionGUID: IUPO/UWtRQq52B0tHxIyRg==
X-CSE-MsgGUID: 4WR3/6PHQ7Sv6xPhIXGjBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="178570337"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 11:33:50 -0700
Date: Thu, 12 Jun 2025 20:33:47 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mohammed Thasleem <mohammed.thasleem@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Vinod Govindapillai <vinod.govindapillai@intel.com>
Subject: Re: [PATCH v5 1/7] lib/igt_debugfs: Add specific checks for WA in GTs
Message-ID: <20250612183347.6adlrhsthbdbc4yx@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>,
 igt-dev@lists.freedesktop.org,
 Vinod Govindapillai <vinod.govindapillai@intel.com>
References: <20250610174244.1292-1-mohammed.thasleem@intel.com>
 <20250610174244.1292-2-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250610174244.1292-2-mohammed.thasleem@intel.com>
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
On 2025-06-10 at 23:12:38 +0530, Mohammed Thasleem wrote:
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
> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Reviewed-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> ---
>  lib/igt_debugfs.c | 39 +++++++++++++++++++++++++++++++++++++++
>  lib/igt_debugfs.h |  1 +
>  2 files changed, 40 insertions(+)
> 
> diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
> index 210a9cea0..f2621a84c 100644
> --- a/lib/igt_debugfs.c
> +++ b/lib/igt_debugfs.c
> @@ -44,6 +44,7 @@
>  #include "igt_kms.h"
>  #include "igt_debugfs.h"
>  #include "igt_sysfs.h"
> +#include "xe/xe_query.h"

I am sorry but after another reading this include looks bad,
please add a new lib/intel_wa.c and move this there.

Or change function into:

int igt_has_intel_wa(int drm_fd, int gt, const char *check_wa)

and remove this include.

Regards,
Kamil

>  
>  /**
>   * SECTION:igt_debugfs
> @@ -745,3 +746,41 @@ void __igt_debugfs_dump(int device, const char *filename, int level)
>  	igt_log(IGT_LOG_DOMAIN, level, "%s:\n%s\n", filename, contents);
>  	free(contents);
>  }
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
> +	char name[PATH_MAX];
> +	char *debugfs_dump, *has_wa;
> +
> +	if (!is_xe_device(drm_fd))
> +		return 0;
> +
> +	debugfs_fd = igt_debugfs_dir(drm_fd);
> +	if (debugfs_fd == -1)
> +		return -1;
> +
> +	xe_for_each_gt(drm_fd, xe) {
> +		sprintf(name, "gt%d/workarounds", xe);
> +		if (!igt_debugfs_exists(drm_fd, name, O_RDONLY))
> +			return -1;
> +
> +		debugfs_dump = igt_sysfs_get(debugfs_fd, name);
> +		if (debugfs_dump != NULL) {
> +			has_wa = strstr(debugfs_dump, check_wa);
> +			free(debugfs_dump);
> +			if (has_wa)
> +				return 1;
> +		}
> +	}
> +
> +	return 0;
> +}
> diff --git a/lib/igt_debugfs.h b/lib/igt_debugfs.h
> index f4044d545..6d4c09d2f 100644
> --- a/lib/igt_debugfs.h
> +++ b/lib/igt_debugfs.h
> @@ -49,6 +49,7 @@ bool igt_debugfs_search(int fd, const char *filename, const char *substring);
>  int igt_debugfs_gt_dir(int device, unsigned int gt);
>  int igt_debugfs_gt_open(int device, unsigned int gt, const char *filename,
>  			int mode);
> +int igt_has_intel_wa(int drm_fd, const char *check_wa);
>  
>  /**
>   * igt_debugfs_read:
> -- 
> 2.34.1
> 
