Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C247CAC597
	for <igt-dev@archiver.kernel.org>; Mon, 15 Sep 2025 12:29:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C45EF10E47B;
	Mon, 15 Sep 2025 12:28:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d9iafeK5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E71BC10E47B
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Sep 2025 12:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757939339; x=1789475339;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9TWDsa0ZypDjMi8U9AFjVxvu6FK2m7KpCKx61wUAeo0=;
 b=d9iafeK5+D1/b5gVrMVhjV4rQP4a0fHn68PPK0POGRSeC9Bz7Sa19ruK
 YFySZKfPofSKgDNhuJZa1R0CjavtX1sC0FXlTA3GBVpoC1OZNVVpWX53s
 Lrvaf4wsuCw9AYHtyyKvnSemJv7kCN3EfzUq722ObFIJk9ppIg7jvHGbQ
 2sdtBSGnk0glXEv/WH2/IEb4in44n7/u3YP/Ihdu/Iv+CVtNpTExzKGaP
 pF5WQ41tMTw9zqdlyJnILOrrVFsHJ0JcV7j80NmBfQrpdjyb02PXKRvud
 IJyKq2PRk0z8MGuFYvtp2mAEAJXKb3tMF4ua0H1f8gjrnGY2QUt7SAh+I A==;
X-CSE-ConnectionGUID: BYMxDV/NTZmspKXGQ/vaGg==
X-CSE-MsgGUID: O/1VfrGNSF2FebmDffCqFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="71286799"
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; d="scan'208";a="71286799"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 05:28:59 -0700
X-CSE-ConnectionGUID: GXq0sbmNTJO95n9ARdQu4Q==
X-CSE-MsgGUID: DoNSd27USQGICPnWVWhtVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; d="scan'208";a="174237546"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 05:28:57 -0700
Date: Mon, 15 Sep 2025 14:28:54 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Michal Winiarski <michal.winiarski@intel.com>
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_compute: check root-only write
 permission for ccs_mode
Message-ID: <20250915122854.4wixiotol5ay6slw@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Michal Winiarski <michal.winiarski@intel.com>
References: <20250909130808.54117-1-peter.senna@linux.intel.com>
 <20250909130808.54117-3-peter.senna@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250909130808.54117-3-peter.senna@linux.intel.com>
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

Hi Peter,
On 2025-09-09 at 15:08:08 +0200, Peter Senna Tschudin wrote:
> Add a call to igt_fs_check_root_perm() in test_ccs_mode() to verify that
> the "ccs_mode" sysfs attribute is writable only by root. This enforces a
> security requirement that only root can modify "ccs_mode", preventing
> unintended or unauthorized writes by other users.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Michal Winiarski <michal.winiarski@intel.com>
> Cc: Kamil Konieczny  <kamil.konieczny@linux.intel.com>
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> ---
>  tests/intel/xe_compute.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
> index 5e9140902..cedcb23d9 100644
> --- a/tests/intel/xe_compute.c
> +++ b/tests/intel/xe_compute.c
> @@ -15,6 +15,7 @@
>  
>  #include "igt.h"
>  #include "igt_sysfs.h"
> +#include "igt_fs.h"

Move this before igt_sysfs.h

>  #include "intel_compute.h"
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
> @@ -80,6 +81,12 @@ test_ccs_mode(void)
>  
>  		num_gt_with_ccs_mode++;
>  		gt_fd = gt_sysfs_open(gt);
> +
> +		/* Check if ccs_mode is writeble only by root. Having root only
> +		 * write permission is a security requirement.
> +		 */

imho add here a skip if ccs_mode file do not exists.

Regards,
Kamil

> +		igt_assert(igt_fs_check_root_perm(gt_fd, "ccs_mode"));
> +
>  		igt_assert(igt_sysfs_printf(gt_fd, "ccs_mode", "%u", 0) < 0);
>  		for (m = 1; m <= num_slices; m++) {
>  			/* compute slices are to be equally distributed among enabled engines */
> -- 
> 2.43.0
> 
