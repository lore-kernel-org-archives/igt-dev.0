Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C70606A331
	for <igt-dev@archiver.kernel.org>; Thu, 19 Nov 2026 14:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R71hkaNF
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B765A1124C4;
	Thu, 19 Nov 2026 14:40:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 681C31124C5
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Nov 2026 14:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795099097; x=1826635097;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zQY+bON5RbJbGzgc0bEeXQxCUOHXziTyN/FJjp+hA0E=;
 b=R71hkaNFvWcxLH3PZnTxTgxeI1+27DkrklPka/8TWgmJl+U/0u+bMFNo
 h0BSKNxxT+c2sqIvMu7m/dr9q72pgl/xU6IWLhv0EOOuAqSVcd64/KBrt
 apETJ0olTW4r5uL8DlfRuyQjgJyz/ygI0uj2ICaqf+O/aXv0HTf3OjRRs
 c05xung1NwMF38a3Qkh6jj2g2kusBRO8iQZ2lQlEjs2/VDFKBcCbjphfg
 4Jh4X9u6lLmZjPIb+Awcmv4d6IS1HPE8r9I7uya5c++UNCxZ3h2yOnnX1
 hUNbnoxLS5PzTLQu75GKJWAFUDUf6aYL4+lJYQxsq8yaVLwYF5eYiCzGG w==;
X-CSE-ConnectionGUID: hgkx3sQUTqKw9hPhhajA0g==
X-CSE-MsgGUID: HWWL0Bx/S5e5nZSVGDzPNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3985086"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3985086"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 06:38:17 -0800
X-CSE-ConnectionGUID: 78J321VUTBqhsERwKlwe2Q==
X-CSE-MsgGUID: IX/jiIg3RfSBV71tqTdD2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; d="scan'208";a="10435493"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 06:38:16 -0800
Date: Thu, 19 Nov 2026 15:37:59 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH] tests/intel/xe_exec_system_allocator: Limit driver debug
 logs in CI runs
Message-ID: <5vwmys2x7xmwvdrelminxjig4od56cksqifyqcn3abndpbxtv3@r2srqizldoiq>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 nishit.sharma@intel.com, igt-dev@lists.freedesktop.org
References: <20261119131556.199707-1-nishit.sharma@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261119131556.199707-1-nishit.sharma@intel.com>
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
On 2026-11-19 at 13:15:56 +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 
> The subtests involved migration generates a DRM_UT_DRIVER debug
> message for each migrated chunk, exceeding the CI runner's log-size
> limit on large-VRAM devices.
> 
> Call xe_drop_driver_debug_if_ci() from the test fixture so that, under
> CI, DRM_UT_DRIVER is cleared from the DRM debug mask for the duration of
> the test. The other debug categories are preserved and the original mask
> is restored on exit.

Please drop 2nd paragraph from above, basically, do not write
C-code-into-english. imho better:

Under CI run clear DRM_UT_DRIVER bit from the DRM debug mask for
the duration of the test.

> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  tests/intel/xe_exec_system_allocator.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index e3e8339c4..fb0c0af16 100644
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
> @@ -2668,6 +2669,7 @@ int igt_main()
>  
>  	igt_fixture() {
>  		struct xe_device *xe;
> +		int dir;
>  
>  		fd = drm_open_driver(DRIVER_XE);
>  		igt_require(!xe_supports_faults(fd));
> @@ -2689,6 +2691,18 @@ int igt_main()
>  				  num_pat_entries);
>  			num_pat_entries = 0;
>  		}
> +
> +		dir = igt_sysfs_drm_module_params_open();
> +		if (dir >= 0) {
> +			int debug_mask = igt_drm_debug_mask_get(dir);
> +			unsigned int mask_to_set = DRM_UT_DRIVER;

s/mask_to_set/bit_to_clear/

With that it looks good.

Regards,
Kamil

> +
> +			close(dir);
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
