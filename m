Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F8B606A320
	for <igt-dev@archiver.kernel.org>; Thu, 19 Nov 2026 12:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nl4EOXKK
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B1F811233E;
	Thu, 19 Nov 2026 12:19:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF96011233E
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Nov 2026 12:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795090707; x=1826626707;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=eEhNyy1oFAfwAdc4OQjnjVLqdpvpn+luDaxtiGxDeeM=;
 b=nl4EOXKK1kBaP5JSs+iaCkB5JuRPer7iwWIQASEG6xchepvOscR2zvw0
 omoKPHc1+DJ3faL0c/r/5BikdN30C+YTywgkJfjUGoo+JpSi2xFbR4EPc
 jeWyYq8hf2QOGJG1q54+4rCT+8UKi9DdJ865tBQi8bF7bZlA+XomD5ReP
 1rcFL1Ov6Yqsrtqdf1VyyP5zFwWImQ3yx8iE99ubVikrC8/1VszxX7Dam
 z+ohBdPdFRrPGzoJQqHCyZ8Vt+gqRiHJIuNvvFUOsr/WvQFEclgudjria
 vUZVkgViwfH5Oz/1VCPq5iaIvRTHg41v+b/sg6t2YHoMRMKgfC6r9mbyr g==;
X-CSE-ConnectionGUID: OxPqwE+WRjanr8S2THDPjA==
X-CSE-MsgGUID: sM5IDxNySAKMqAGSJaYmCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3928945"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3928945"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 04:18:26 -0800
X-CSE-ConnectionGUID: Y7Y6g/3oQrKip/WZz+sY/w==
X-CSE-MsgGUID: GsFTS2zPSVKeObzB9n8H+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="10693293"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 04:18:25 -0800
Date: Thu, 19 Nov 2026 13:18:22 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH] tests/intel/xe_exec_system_allocator: suppress driver
 debug logs in CI
Message-ID: <wosfphs5fhnrpjljoy3xwg5wc5g7ffhtcnif2774bzva25ylxz@wq4dggnf5syu>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 nishit.sharma@intel.com, igt-dev@lists.freedesktop.org
References: <20261119104811.190039-1-nishit.sharma@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261119104811.190039-1-nishit.sharma@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi nishit.sharma,
On 2026-11-19 at 10:48:11 +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 

You patch do not apply, please rebase on current top and resend.
See also few nits below.

> migration subtests can generate a DRM_UT_DRIVER debug

Start from upper case, also write up to 65 column.

> message for each migrated chunk, exceeding the CI runner's log-size limit
> on large-VRAM devices.
>
 
Migration subtests can generate a DRM_UT_DRIVER debug message for
each migrated chunk, exceeding the CI runner's log-size limit on
large-VRAM devices.

> 
> Call xe_drop_driver_debug_if_ci() from the test fixture so that, under

Please do not write C code in english, jus say that on CI run
you clear that bit. Also no need for writin about restore, lib
will take care of this.

> CI, DRM_UT_DRIVER is cleared from the DRM debug mask for the duration of
> the test. The other debug categories are preserved and the original mask
> is restored on exit.
> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  tests/intel/xe_exec_system_allocator.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index da939c37d..c927229f7 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -17,6 +17,7 @@
>  #include <time.h>
>  
>  #include "igt.h"
> +#include "igt_sysfs.h"
>  #include "intel_pat.h"
>  #include "lib/igt_syncobj.h"
>  #include "lib/intel_compute.h"
> @@ -2669,6 +2670,8 @@ int igt_main()
>  
>  	igt_fixture() {
>  		struct xe_device *xe;
> +		int dir;
> +		unsigned int mask_to_set;

Move this var to place where is used.

>  
>  		fd = drm_open_driver(DRIVER_XE);
>  		igt_require(!xe_supports_faults(fd));
> @@ -2691,7 +2694,17 @@ int igt_main()
>  			num_pat_entries = 0;
>  		}
>  
> -		xe_drop_driver_debug_if_ci();
> +		dir = igt_sysfs_drm_module_params_open();
> +		if (dir >= 0) {
> +			int debug_mask = igt_drm_debug_mask_get(dir);
> +
> +			close(dir);
> +			mask_to_set = DRM_UT_DRIVER;

			bits_to_clear = DRM_UT_DRIVER;
			mask_to_set = debug_mask & ~bits_to_clear;
			if (debug_mask > 0 && (debug_mask & bits_to_clear)) {
				igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
				update_debug_mask_if_ci(mask_to_set);
			}

Btw it seems lib needs an update, imho that exit handler should
be installed by lib itself, not by tests.

Regards,
Kamil

> +			if (debug_mask > 0 && (debug_mask & mask_to_set)) {
> +				igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
> +				update_debug_mask_if_ci(debug_mask & ~mask_to_set);
> +			}
> +		}
>  	}
>  
>  	for (const struct section *s = sections; s->name; s++) {
> -- 
> 2.43.0
> 
