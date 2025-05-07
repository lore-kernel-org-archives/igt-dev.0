Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 333DCC3ABC0
	for <igt-dev@archiver.kernel.org>; Wed,  7 May 2025 16:10:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C889E10E856;
	Wed,  7 May 2025 16:10:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PmaYY1qF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37DF910E856
 for <igt-dev@lists.freedesktop.org>; Wed,  7 May 2025 16:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746634200; x=1778170200;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=W+5i7FA5qKz9e+Lkunlw2SRvFGAFPsVqIiHmbk6ZYhs=;
 b=PmaYY1qF0lSktfj4IvHnZAn9ywmieZ2c7rSxz1kMO9rU6XBJ+tjsnNF0
 Q/XQDSQqOOv9gh1TnJll3U6u5h3agHB7epDkQfDwJucNMnNlOY2r1Waz7
 ZtH2zx1OilsSYqpTnGl+5x43tALSiikwHWflbFJFh3yeFsAKtSqoYIDxu
 aWFLEeY0/hsHfAAfqdA/nNUGLjNPDAXAclOtzfJtNAC5SmxFyVUJL/MPu
 Inwt3CcH9O+wQ3Q4N1Z6SOa193HbDnrZiXS0ZzfAx13uo5ze4toEA5eOB
 GtJ37ZcYkHQoAlFOjdYZ4a+BbEfxwYTtPX9cYuk5/TUsyNmWvzadX4Mi8 A==;
X-CSE-ConnectionGUID: d6LxTcgwQMaLxMccaFFzUQ==
X-CSE-MsgGUID: k/Ic3BhgTqK89ljaZ+ahqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="47635494"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="47635494"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 09:09:59 -0700
X-CSE-ConnectionGUID: k0kqacihRm2qGUzappusKg==
X-CSE-MsgGUID: zyMA6lNbTv2pIgP0glFxzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="137005360"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 09:09:57 -0700
Date: Wed, 7 May 2025 18:09:55 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mohammed Thasleem <mohammed.thasleem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking: Refine FBC
 test conditions for BMG variants
Message-ID: <20250507160955.vkzyaooy6g2kyebi@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250507073015.1006511-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250507073015.1006511-1-mohammed.thasleem@intel.com>
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
On 2025-05-07 at 13:00:15 +0530, Mohammed Thasleem wrote:
> This update stops skipping fbc-* tests based on the BMG platform.
> Instead, tests are excluded only for specific unsupported BMG variants.
> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>  lib/igt_kms.c                          | 30 ++++++++++++++++++++++++++
>  lib/igt_kms.h                          |  1 +
>  tests/intel/kms_frontbuffer_tracking.c |  7 +++---
>  3 files changed, 35 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index f3bc481f2..668da5915 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -61,6 +61,7 @@
>  #include "igt_device.h"
>  #include "igt_sysfs.h"
>  #include "sw_sync.h"
> +#include "xe/xe_query.h"
>  #ifdef HAVE_CHAMELIUM
>  #include "igt_chamelium.h"
>  #endif
> @@ -7442,3 +7443,32 @@ int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *c
>  
>  	return 0;
>  }
> +
> +/**
> + * igt_read_debugfs_wa:
> + * @drm_fd:	A drm file descriptor
> + * @check_wa:	Wa to be checked

Add here description when true will be returned, from implementation
I see it will return true if WA is present in one of GTs.

> + */
> +bool igt_read_debugfs_wa(int drm_fd, const char *check_wa)

As name of this function suggest it should be placed in lib/igt_debugfs.h

Also, as this is intel specific, imho it's name should be

bool igt_has_intel_wa(int drm_fd, const char *check_wa)

> +{
> +	char buf[4096];
> +	bool found = false;
> +	char name[PATH_MAX];
> +	unsigned int xe, debugfs_fd;
> +

Add here check that drm_fd is for intel driver, i915 or xe.

> +	debugfs_fd = igt_debugfs_dir(drm_fd);
> +
> +	xe_for_each_gt(drm_fd, xe) {
> +		sprintf(name, "gt%d/workarounds", xe);
> +		igt_require(igt_debugfs_exists(drm_fd, name, O_RDONLY));

Hmmm, please avoid igt_require, if you really need it add gt as param
and just return false if no 'workarounds' file present.

Or add second function for all GTs checks, not one of them, but then
why true when wa is present on one GT? Why not on all of them?

Regards,
Kamil

> +
> +		if (igt_debugfs_simple_read(debugfs_fd, name, buf, sizeof(buf)) > 0) {
> +			if (strstr(buf, check_wa)) {
> +				found = true;
> +				break;
> +			}
> +		}
> +	}
> +
> +	return found;
> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 0381c82ad..cd83a56e7 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1279,5 +1279,6 @@ void igt_set_link_params(int drm_fd, igt_output_t *output,
>  			   char *link_rate, char *lane_count);
>  int igt_backlight_read(int *result, const char *fname, igt_backlight_context_t *context);
>  int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *context);
> +bool igt_read_debugfs_wa(int drm_fd, const char *check_wa);
>  
>  #endif /* __IGT_KMS_H__ */
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> index 0809352cb..56d6c6f74 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -781,6 +781,7 @@
>   */
>  
>  #define TIME SLOW_QUICK(1000, 10000)
> +#define CHECK_WA "16023588340"
>  
>  IGT_TEST_DESCRIPTION("Test the Kernel's frontbuffer tracking mechanism and "
>  		     "its related features: FBC, PSR and DRRS");
> @@ -2610,7 +2611,7 @@ static void prepare_subtest_data(const struct test_mode *t,
>  static void prepare_subtest_screens(const struct test_mode *t)
>  {
>  	/* FBC disabled: Wa_16023588340 */
> -	igt_skip_on_f((IS_BATTLEMAGE(drm.devid) && t->feature == FEATURE_FBC),
> +	igt_skip_on_f((igt_read_debugfs_wa(drm.fd, CHECK_WA) && t->feature == FEATURE_FBC),
>  		      "FBC isn't supported on BMG\n");
>  
>  	if (t->pipes == PIPE_DUAL)
> @@ -2658,7 +2659,7 @@ static void prepare_subtest(const struct test_mode *t,
>  static void rte_subtest(const struct test_mode *t)
>  {
>  	/* FBC disabled: Wa_16023588340 */
> -	igt_skip_on_f((IS_BATTLEMAGE(drm.devid) && t->feature == FEATURE_FBC),
> +	igt_skip_on_f((igt_read_debugfs_wa(drm.fd, CHECK_WA) && t->feature == FEATURE_FBC),
>  		      "FBC isn't supported on BMG\n");
>  
>  	prepare_subtest_data(t, NULL);
> @@ -4157,7 +4158,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>  			t.tiling = opt.tiling;
>  
>  			/* FBC disabled: Wa_16023588340 */
> -			igt_skip_on_f((IS_BATTLEMAGE(drm.devid) && t.feature == FEATURE_FBC),
> +			igt_skip_on_f((igt_read_debugfs_wa(drm.fd, CHECK_WA) && t.feature == FEATURE_FBC),
>  				      "FBC isn't supported on BMG\n");
>  
>  			for_each_pipe(&drm.display, pipe) {
> -- 
> 2.34.1
> 
