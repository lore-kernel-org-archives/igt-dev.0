Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23932CD4851
	for <igt-dev@archiver.kernel.org>; Tue, 19 May 2026 09:55:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDB6B10E103;
	Tue, 19 May 2026 09:55:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kPnfMhE5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78C0010E103
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2026 09:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779184491; x=1810720491;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QaMGQ3CsHKYBrwHP6OisT3ydOe48t0zKBUyhB/X9kYM=;
 b=kPnfMhE51NPtf7rLMRIRCs5mf7cL3un21+y85UiKZ0BaU6wUNE2jq6+V
 2/9egoBaktVQwMLkHAbi6s3M898QwkUhZ6j5+MHY0sQ6mQGMLYERWHkaE
 8YbjiYd8bCW9f2h633XZ9bLv6OJu1i059s59M/Dr0lWV1+Ml3Fl+ftCZP
 9ZGAS6JKkha53w7+EwfVSpSd/FXz+ssQ7uaf50NKbpUG7m2RCS3acyia+
 qdu6qt2w9B1H04RNrJS0h7PwapRzieAEEM39jJf7RXr8+YeOMVWCxxUep
 m9ptEAj4bruHpgmigd4oNzTVn8qHaxpCwq5lypcQ/eWTSHJa7bm+UAKI9 A==;
X-CSE-ConnectionGUID: 27eglkKFT5eeKbvDYM3zPg==
X-CSE-MsgGUID: XDmvuhqvQR+PMrsiTrWP+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="90636129"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="90636129"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 02:54:50 -0700
X-CSE-ConnectionGUID: Kiwlua+5Q3+6WVzE6a78JA==
X-CSE-MsgGUID: y9ypP7Z2ST23fxHaN4a+Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="243708103"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 02:54:48 -0700
Date: Tue, 19 May 2026 11:54:46 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Shekhar Chauhan <shekhar.chauhan@intel.com>
Cc: igt-dev@lists.freedesktop.org, ashutosh.dixit@intel.com
Subject: Re: [PATCH v2] lib/intel_wa: Assert on error instead of returning -1
Message-ID: <20260519095446.xhkp2ti2ud5ftzm2@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 igt-dev@lists.freedesktop.org, ashutosh.dixit@intel.com
References: <20260514063655.1683322-1-shekhar.chauhan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260514063655.1683322-1-shekhar.chauhan@intel.com>
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

Hi Shekhar,
On 2026-05-14 at 12:06:55 +0530, Shekhar Chauhan wrote:
> igt_has_intel_wa() returns 0, 1, or -1, but there is no point
> distinguishing the error and no-workaround cases for callers. Replace
> the error return with igt_assert() and simplify debugfs_file_has_wa() by
> dropping the igt_debugfs_exists() check, since igt_sysfs_get() returns
> NULL for missing files anyway.
> 
> v2: Make the func as bool instead of int.
> 
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>

Before merge, please reply to CI error reports with cc to CI-bug
filing team. Also, please cut your replay after 'Known errors',
so its size will be small.

Regards,
Kamil

> ---
>  lib/intel_wa.c | 19 +++++++++----------
>  lib/intel_wa.h |  2 +-
>  2 files changed, 10 insertions(+), 11 deletions(-)
> 
> diff --git a/lib/intel_wa.c b/lib/intel_wa.c
> index 727dd6c98..e4fe7b0ee 100644
> --- a/lib/intel_wa.c
> +++ b/lib/intel_wa.c
> @@ -7,18 +7,18 @@
>  #include <stdint.h>
>  #include <stdio.h>
>  
> +#include "igt_core.h"
>  #include "igt_debugfs.h"
>  #include "igt_sysfs.h"
>  #include "intel_wa.h"
>  #include "xe/xe_query.h"
>  
> -static int debugfs_file_has_wa(int drm_fd, int debugfs_fd,
> +static bool debugfs_file_has_wa(int drm_fd, int debugfs_fd,
>  			       const char *debugfs_name, const char *wa)
>  {
>  	char *debugfs_dump;
>  
> -	if (!igt_debugfs_exists(drm_fd, debugfs_name, O_RDONLY))
> -		return -1;
> +	igt_assert(igt_debugfs_exists(drm_fd, debugfs_name, O_RDONLY));
>  
>  	debugfs_dump = igt_sysfs_get(debugfs_fd, debugfs_name);
>  	if (debugfs_dump) {
> @@ -27,10 +27,10 @@ static int debugfs_file_has_wa(int drm_fd, int debugfs_fd,
>  		free(debugfs_dump);
>  
>  		if (has_wa)
> -			return 1;
> +			return true;
>  	}
>  
> -	return 0;
> +	return false;
>  }
>  
>  /**
> @@ -38,18 +38,17 @@ static int debugfs_file_has_wa(int drm_fd, int debugfs_fd,
>   * @drm_fd:	A drm file descriptor
>   * @check_wa:	Workaround to be checked
>   *
> - * Returns:	0 if no WA, 1 if WA present, -1 on error
> + * Returns:	true if WA present, false otherwise
>   */
> -int igt_has_intel_wa(int drm_fd, const char *check_wa)
> +bool igt_has_intel_wa(int drm_fd, const char *check_wa)
>  {
> -	int ret = 0;
> +	bool ret = 0;
>  	int debugfs_fd;
>  	unsigned int xe;
>  	char name[256];
>  
>  	debugfs_fd = igt_debugfs_dir(drm_fd);
> -	if (debugfs_fd == -1)
> -		return -1;
> +	igt_assert(debugfs_fd >= 0);
>  
>  	xe_for_each_gt(drm_fd, xe) {
>  		sprintf(name, "gt%d/workarounds", xe);
> diff --git a/lib/intel_wa.h b/lib/intel_wa.h
> index 765a5948e..34cafecc4 100644
> --- a/lib/intel_wa.h
> +++ b/lib/intel_wa.h
> @@ -6,6 +6,6 @@
>  #ifndef __INTEL_WA_H__
>  #define __INTEL_WA_H__
>  
> -int igt_has_intel_wa(int drm_fd, const char *check_wa);
> +bool igt_has_intel_wa(int drm_fd, const char *check_wa);
>  
>  #endif /* __INTEL_WA_H__ */
> -- 
> 2.53.0
> 
