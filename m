Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73252C3ABDD
	for <igt-dev@archiver.kernel.org>; Mon, 19 May 2025 18:18:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCF0810E126;
	Mon, 19 May 2025 18:18:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K5QfBj8Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2039210E126
 for <igt-dev@lists.freedesktop.org>; Mon, 19 May 2025 18:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747678737; x=1779214737;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=41atagogpOkodvO5bQFiVv+pgIfb53KFQfsU7sU/s7U=;
 b=K5QfBj8Q8Q7jYpfquLu++C0VW3Z+/lunN3RvVEFHOfdvIdjZQP0TEVAu
 6c/yxDL09VJDPPsW26khcNfbueekO6v0+cP/brRHehrFtLHO+mIZC6K1i
 BfI4961zgKunCSSE5x0fboHm4bQ20CnXIXUyUzIPF94hTVMihbVPh2+kr
 mgcb13neG+OIZz+1IViT1PkC6j6PHrVgJ4A8rEvJEZx392i2J4wdEgYHP
 iO3dqfdU2WcgFxUsTajA3jkIWy3DIcvtnBS2UVhn7Wi0A8jwjgid67MCr
 BniH7ucfWbLu84ZzEk4RtHLxyiGNAgU9WquJcCZduh1RMoV3eQ1te3WTB w==;
X-CSE-ConnectionGUID: toExVj4ySO+o3HSEJ/+lyA==
X-CSE-MsgGUID: 9yAC63KBSLOAObwEZAz4gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="67003490"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; d="scan'208";a="67003490"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 11:18:57 -0700
X-CSE-ConnectionGUID: 3SeZJSmmTyOqKwtrP1LMlQ==
X-CSE-MsgGUID: 4Sf6byV1QNKd+D2CzCkZWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; d="scan'208";a="144443108"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 11:18:56 -0700
Date: Mon, 19 May 2025 20:18:30 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mohammed Thasleem <mohammed.thasleem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH v2 1/2] lib/igt_debugfs: Add specific checks for WA in GTs
Message-ID: <20250519181830.j3yzmvuoobsm7nye@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250519123135.1307174-1-mohammed.thasleem@intel.com>
 <20250519123135.1307174-2-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250519123135.1307174-2-mohammed.thasleem@intel.com>
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
On 2025-05-19 at 18:01:34 +0530, Mohammed Thasleem wrote:
> This function check the given workaround on available GTs
> 
> v2: Add discription for return. (Kamil)
>     Rename function to igt_has_intel_wa. (Kamil)
>     Move lib changes to lib/igt_debugfs. (Kamil)
>     Dump the whole wa sysfs file and then search for the wa. (Vinod)
>     Use return true/false directly instead assigning value. (Vinod)
> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>  lib/igt_debugfs.c | 31 +++++++++++++++++++++++++++++++
>  lib/igt_debugfs.h |  1 +
>  2 files changed, 32 insertions(+)
> 
> diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
> index 8ac215a76..ec3e33854 100644
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
> @@ -770,3 +771,33 @@ void __igt_debugfs_dump(int device, const char *filename, int level)
>  	igt_log(IGT_LOG_DOMAIN, level, "%s:\n%s\n", filename, contents);
>  	free(contents);
>  }
> +
> +/**
> + * igt_has_intel_wa:
> + * @drm_fd:	A drm file descriptor
> + * @check_wa:	Workaround to be checked

Add one line here before 'Returns:', so
 *
 * Returns: 0 if no WA, 1 if WA present, -1 on error
 */

> + * @return:	It will return true if WA found otherwise false
> + */
> +int igt_has_intel_wa(int drm_fd, const char *check_wa)
> +{
> +	char name[PATH_MAX];
> +	char *debugfs_dump;
> +	unsigned int xe, debugfs_fd;
> +
> +	debugfs_fd = igt_debugfs_dir(drm_fd);

Check for error here:
	if (debugfs_fd == -1)
		return -1;

> +
> +	xe_for_each_gt(drm_fd, xe) {
> +		sprintf(name, "gt%d/workarounds", xe);
> +		if (!igt_debugfs_exists(drm_fd, name, O_RDONLY))
> +			return -1;
> +
> +		debugfs_dump = igt_sysfs_get(debugfs_fd, name);
> +
> +		if (debugfs_dump != NULL) {
> +			if (strstr(debugfs_dump, check_wa))

Free debugfs_dump before return or remember strstr result, eg.

has_wa = strstr(debugfs_dump, check_wa);
free(debugfs_dump);
...rest of actions...

> +				return true;

Should be:
				return 1;

> +		}
> +	}
> +

Should be:
	return 0;

> +	return false;

Regards,
Kamil

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
