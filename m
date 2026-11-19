Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C1F606A324
	for <igt-dev@archiver.kernel.org>; Thu, 19 Nov 2026 15:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lzbEzUwB
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBEB710E83A;
	Thu, 19 Nov 2026 15:28:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C35C10F00B
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Nov 2026 15:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795102023; x=1826638023;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6bOk7PSqH386qXaEXHpxxYRRMp9Ptag9JM6XwQoZ1JM=;
 b=lzbEzUwBgeeZcEC6tEJdFQPcUXybc3xPjV3OrQ3o5LOAdY1MOFzWTzaZ
 uHfH2yXeOnimrdhKI/Dkmlh4RRKHK6jJC8wo7eCra/1oH1EJrKbqM2vCB
 lTBDDRjDGJ4qjE/875tbnnEK/2XMGoQxg0fOvgLIe1nYAlXelHbb5dBvP
 nqI6oo8dR3QvPlsLxSBY3hUSRGVXVZsulN5K5h/auOA/IzYHBvOiGSNyu
 JmpxOkq/ivxgIl+G/jhfnAsO+fP8Cl5jby9fNuBqZbatvFzJ392vej821
 9NZWw2CghFnj6LhCRqzVbYxWQ6ge8w8CPl1WpuPr8mtstQ12DX9oG4Sij g==;
X-CSE-ConnectionGUID: HjqKLid0Q0ezEGIF+t490A==
X-CSE-MsgGUID: /yIeGyjWQROQmpi7su4ThA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3804423"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3804423"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 07:27:03 -0800
X-CSE-ConnectionGUID: WYrnSSsWRzqKvDByX1iOTQ==
X-CSE-MsgGUID: Ru53OcgqR86Fso3ngEiKrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; d="scan'208";a="12192116"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 07:27:02 -0800
Date: Thu, 19 Nov 2026 16:26:59 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH] tests/intel/xe_exec_system_allocator: Limit driver debug
 logs in CI runs
Message-ID: <p3yttx7byki7u3byyjjxl736wo2trfreoeaha3vh6zfl4sbu3i@viwh3njfkvs3>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 nishit.sharma@intel.com, igt-dev@lists.freedesktop.org
References: <20261119144249.200617-1-nishit.sharma@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261119144249.200617-1-nishit.sharma@intel.com>
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
On 2026-11-19 at 14:42:48 +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 
> The subtests involved migration generates a DRM_UT_DRIVER debug
> message for each migrated chunk, exceeding the CI runner's log-size
> limit on large-VRAM devices.
> 
> Call xe_drop_driver_debug_if_ci() from the test fixture. The other debug
> categories are preserved and the original mask is restored on exit.

Please drop 2nd paragraph. What you nead in patch description is
to write _why_ it is needed. Details are in a patch itself.
As I wrote before, try to not translate C code in english.

With this dropped,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  tests/intel/xe_exec_system_allocator.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index e3e8339c4..55e06aa2a 100644
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
> +			unsigned int bit_to_clear = DRM_UT_DRIVER;
> +
> +			close(dir);
> +			if (debug_mask > 0 && (debug_mask & bit_to_clear)) {
> +				igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
> +				update_debug_mask_if_ci(debug_mask & ~bit_to_clear);
> +			}
> +		}
>  	}
>  
>  	for (const struct section *s = sections; s->name; s++) {
> -- 
> 2.43.0
> 
