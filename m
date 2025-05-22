Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF55C54E65
	for <igt-dev@archiver.kernel.org>; Thu, 22 May 2025 09:50:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A5DE10EB5B;
	Thu, 22 May 2025 09:50:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W5S+zgAj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3F5010EB5B
 for <igt-dev@lists.freedesktop.org>; Thu, 22 May 2025 09:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747907435; x=1779443435;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ksSJpzsxtL21BQ7VaEDU+llM6btjkcfLFsgyr+3uDeY=;
 b=W5S+zgAjfL/5JUIVC+XOtBk6jSrmFX0DRTQeI+qdbT4oZH4MPnpHxrJu
 jFqAYm7niW10naNYe2J4pMK0MjvdHXHRp98d1LqO3sAqLBI1sjUXhZIOo
 YCjLM9AOVlCbfXz3Q8d5vocJobueqC47b/nxiD0beMFgJDjuwO6M60EfI
 Hhvs1Ti2AnWp6vvLYLX1E8ImRjChrLvNcaJInaudq+bOb0hq1Upx2b0r3
 20ednpbSwxuhFPfZXi2JE7NLviziNbJlxox2FlPNxsHAdPK38PNFgtsRQ
 KlX0yOCOnM4rRTRm2dzMNUAx8sSrj5/h6EKR75Jk/LC6yCzpMZoSQ7GkX g==;
X-CSE-ConnectionGUID: T1G8FRvRTEGnx/OY9voj7A==
X-CSE-MsgGUID: MIxUsdCNQdOcdaP9I1LBtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="60969647"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="60969647"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 02:50:34 -0700
X-CSE-ConnectionGUID: aI11CTDiRN22dqkMFU//Eg==
X-CSE-MsgGUID: lvHkD6CHTf67bI/aI3kpZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="140591239"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 02:50:33 -0700
Date: Thu, 22 May 2025 11:50:31 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mohammed Thasleem <mohammed.thasleem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH v3 1/2] lib/igt_debugfs: Add specific checks for WA in GTs
Message-ID: <20250522095031.27gw64f2ueqizdav@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250519123135.1307174-2-mohammed.thasleem@intel.com>
 <20250522071106.1340240-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250522071106.1340240-1-mohammed.thasleem@intel.com>
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
On 2025-05-22 at 12:41:06 +0530, Mohammed Thasleem wrote:
> This function check the given workaround on available GTs
> 
> v2: Add discription for return. (Kamil)
>     Rename function to igt_has_intel_wa. (Kamil)
>     Move lib changes to lib/igt_debugfs. (Kamil)
>     Dump the whole wa sysfs file and then search for the wa. (Vinod)
>     Use return true/false directly instead assigning value. (Vinod)
> v3: Updated return type discription and debugfs_fd failure check. (Kamil)
>     Return 0 or 1 instead of true or false. (Kamil)
> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_debugfs.c | 36 ++++++++++++++++++++++++++++++++++++
>  lib/igt_debugfs.h |  1 +
>  2 files changed, 37 insertions(+)
> 
> diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
> index 8ac215a76..e4babc37f 100644
> --- a/lib/igt_debugfs.c
> +++ b/lib/igt_debugfs.c
> @@ -44,6 +44,7 @@
>  #include "igt_kms.h"
>  #include "igt_debugfs.h"
>  #include "igt_sysfs.h"
> +#include "xe/xe_query.h"
>  
>  /**
>   * SECTION:igt_debugfs
> @@ -770,3 +771,38 @@ void __igt_debugfs_dump(int device, const char *filename, int level)
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
