Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9700CCF2E0
	for <igt-dev@archiver.kernel.org>; Mon, 19 Jan 2026 12:29:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B11810E423;
	Mon, 19 Jan 2026 12:29:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JurBQTzS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F2C610E423
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jan 2026 12:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768825798; x=1800361798;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=BKSWxGVuLU6GAfbVdM2mfqKpFHD8Wh4GJx0pWhDIlvI=;
 b=JurBQTzSgTjmjmDmWCEVmGJb0QHU7eDhylrhA6hGZCPv6H3nC996WOFQ
 B29Xr5JyF4wfbHzj+LGp67OhD8EXnhwx96bylFyxlvlm4XeyAqoXoxYpD
 4UhzSanCKK6Je8O4IXRArjJCZHBC5JzDPPIxnpoPqjLqUvl9XIhABwRuw
 oCq/n+WQWht4D/iXKc1m4jV9vMDRcJYGdtOLrWG9klzXXc6XU1BYBasVa
 7StnxMBSXmzFlQ+ZaP/HiCOfKcpvmVKfi1GNe2AKHcY52GVsdC+LDJaNr
 1uGc/skaHoe2nXSW/cmed9UAtKytcPWTHimkinaacUKmKb3+c7951My57 Q==;
X-CSE-ConnectionGUID: lKDE+/HzQCO/LlcXoCAe5A==
X-CSE-MsgGUID: +n5DAoQvTXaGvq+HKwLFHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="80335517"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="80335517"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 04:29:57 -0800
X-CSE-ConnectionGUID: sbt5qgmDT2KG4UfAMyFdJw==
X-CSE-MsgGUID: garGM+kZRAmOSs+cJMqL7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="210708022"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 04:29:55 -0800
Date: Mon, 19 Jan 2026 13:29:39 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH v2 i-g-t 2/2] tests/intel/xe_compute: check root-only
 write permission for ccs_mode
Message-ID: <20260119122939.eh5sxmh3n56l3qcd@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250909130808.54117-1-peter.senna@linux.intel.com>
 <20260118200010.18669-1-peter.senna@linux.intel.com>
 <20260118200010.18669-2-peter.senna@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260118200010.18669-2-peter.senna@linux.intel.com>
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
On 2026-01-18 at 21:00:10 +0100, Peter Senna Tschudin wrote:
> Add a call to igt_fs_check_root_perm() in test_ccs_mode() to verify that
> the "ccs_mode" sysfs attribute is writable only by root. This enforces a
> security requirement that only root can modify "ccs_mode", preventing
> unintended or unauthorized writes by other users.
> 
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> ---
> Changes from v1:
>  - Moved the test to after the existing test
>  - Check for file not found and skip when it is the case
> 
>  tests/intel/xe_compute.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
> index 310093fc5..eb2410a0a 100644
> --- a/tests/intel/xe_compute.c
> +++ b/tests/intel/xe_compute.c
> @@ -14,6 +14,7 @@
>  #include <string.h>
>  
>  #include "igt.h"
> +#include "igt_fs.h"
>  #include "igt_sysfs.h"
>  #include "intel_compute.h"
>  #include "xe/xe_ioctl.h"
> @@ -88,7 +89,7 @@ test_ccs_mode(void)
>  {
>  	struct drm_xe_engine_class_instance *hwe;
>  	u32 gt, m, ccs_mode, vm, q, num_slices;
> -	int fd, gt_fd, num_gt_with_ccs_mode = 0;
> +	int fd, file_perm_res, gt_fd, num_gt_with_ccs_mode = 0;
>  	uint64_t gt_mask = get_gt_mask();
>  
>  	/*
> @@ -102,6 +103,20 @@ test_ccs_mode(void)
>  		num_gt_with_ccs_mode++;
>  		gt_fd = gt_sysfs_open(gt);
>  		igt_assert(igt_sysfs_printf(gt_fd, "ccs_mode", "%u", 0) < 0);
> +
> +		/* Check if ccs_mode is writeble only by root. Having root only
> +		 * write permission is a security requirement.
> +		 */
> +		file_perm_res = igt_fs_check_root_perm(gt_fd, "ccs_mode");
> +		if (file_perm_res == -ENOENT) {

You need also fix lib function in first patch,
it currently returns bool.

> +			igt_skip("ccs_mode sysfs entry not found\n");
> +		} else if (file_perm_res < 0) {
> +			igt_skip("Cannot stat ccs_mode file\n");

Print errno here. Overall patch looks good.

Regards,
Kamil

> +		} else {
> +			igt_assert_f(file_perm_res == 0,
> +				     "ccs_mode sysfs entry has incorrect permissions\n");
> +		}
> +
>  		for (m = 1; m <= num_slices; m++) {
>  			/* compute slices are to be equally distributed among enabled engines */
>  			if (num_slices % m) {
> -- 
> 2.43.0
> 
