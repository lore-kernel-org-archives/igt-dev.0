Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E9B606A31D
	for <igt-dev@archiver.kernel.org>; Fri, 30 Oct 2026 11:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Koa/g5sU
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6C2B11276D;
	Fri, 30 Oct 2026 11:52:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA8CD112771
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Oct 2026 11:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793361097; x=1824897097;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4wxrOgdNkJXLs+FRDcX0Mq63X/UsKhI9+ZKYos0LOvk=;
 b=Koa/g5sU33ZgfoH7Mz1ZoRfRdORDdbsjc2hU1wFB5rnWIMbu+Hh7VzzX
 FM2JS2V4On0BYxODcvEJLU5qnSmoeivVzckTXyFD/VqYnw0uIM0bGRDv0
 /MPBy2GOiidUpNtvARWzQzo1KsvNAFi/oyZIHYjiM4RAy6fdcnf1GiBNP
 qaev10ZtYNQHQVLfO/4MmYdx2ChISQ7Wrc/c9OzVftYaB2Mv5YI/gXwsj
 qyHOMjMoiY1WGWMPe5MZKT2AzmVCeTuAQSoUvScbr2yNvmGgQLAv7y/z8
 EtO+gL/kW84hOR+j29TDlzgAYbypTHEN41ktmS2udf7vPWn+l7XCpcnJx Q==;
X-CSE-ConnectionGUID: yCIOt3R2TIWzvEnNiESU1Q==
X-CSE-MsgGUID: /oVjlz4OQwyaeuWQfm+mNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2135487"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2135487"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 04:51:36 -0700
X-CSE-ConnectionGUID: UNtNMiT9ScmarGyuh2FSUw==
X-CSE-MsgGUID: vPOnf0PNQledUinCLRdPHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5948792"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 04:51:36 -0700
Date: Fri, 30 Oct 2026 12:51:33 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org, himanshu.girotra@intel.com
Subject: Re: [PATCH] tests/intel/xe_evict: reduce migration log volume in
 large threaded tests
Message-ID: <20261030115133.4dpm7rmswtwsmb7n@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 nishit.sharma@intel.com, igt-dev@lists.freedesktop.org,
 himanshu.girotra@intel.com
References: <20261029135956.1552334-1-nishit.sharma@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261029135956.1552334-1-nishit.sharma@intel.com>
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
On 2026-10-29 at 13:59:56 +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 
> Large threaded eviction subtests can generate excessive kernel debug
> output on high-VRAM devices. The Xe migration path logs once per 8 MiB
> chunk, which can exceed the IGT runner's disk-usage limit and cause the
> runner to kill the test.
> 
> Reduce n_execs from 16 to 12 for all large threaded eviction variants.
> This lowers the working set and migration volume while retaining VRAM
> overcommit and the existing queue/VM pairing requirements.
> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/intel/xe_evict.c | 48 ++++++++++++++++++++++++++++++------------
>  1 file changed, 34 insertions(+), 14 deletions(-)
> 
> diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
> index 230357419..657b2328b 100644
> --- a/tests/intel/xe_evict.c
> +++ b/tests/intel/xe_evict.c
> @@ -13,6 +13,7 @@
>   */
>  
>  #include "igt.h"
> +#include "igt_sysfs.h"
>  #include "lib/igt_syncobj.h"
>  #include "lib/intel_reg.h"
>  #include "xe_drm.h"
> @@ -850,13 +851,13 @@ int igt_main()
>  			MIXED_THREADS | THREADED | MULTI_QUEUE },
>  		{ "mixed-many-threads-small", 3, 16, 128, 1, 128,
>  			THREADED },
> -		{ "threads-large", 2, 2, 16, 3, 32,
> +		{ "threads-large", 2, 2, 12, 3, 32,
>  			THREADED },
> -		{ "cm-threads-large", 2, 2, 16, 3, 32,
> +		{ "cm-threads-large", 2, 2, 12, 3, 32,
>  			COMPUTE_THREAD | THREADED },
> -		{ "mixed-threads-large", 2, 2, 16, 3, 32,
> +		{ "mixed-threads-large", 2, 2, 12, 3, 32,
>  			MIXED_THREADS | THREADED },
> -		{ "mixed-many-threads-large", 3, 2, 16, 3, 32,
> +		{ "mixed-many-threads-large", 3, 2, 12, 3, 32,
>  			THREADED },
>  		{ "threads-small-multi-vm", 2, 16, 128, 1, 128,
>  			MULTI_VM | THREADED },
> @@ -864,11 +865,11 @@ int igt_main()
>  			COMPUTE_THREAD | MULTI_VM | THREADED },
>  		{ "mixed-threads-small-multi-vm", 2, 16, 128, 1, 128,
>  			MIXED_THREADS | MULTI_VM | THREADED },
> -		{ "threads-large-multi-vm", 2, 2, 16, 3, 32,
> +		{ "threads-large-multi-vm", 2, 2, 12, 3, 32,
>  			MULTI_VM | THREADED },
> -		{ "cm-threads-large-multi-vm", 2, 2, 16, 3, 32,
> +		{ "cm-threads-large-multi-vm", 2, 2, 12, 3, 32,
>  			COMPUTE_THREAD | MULTI_VM | THREADED },
> -		{ "mixed-threads-large-multi-vm", 2, 2, 16, 3, 32,
> +		{ "mixed-threads-large-multi-vm", 2, 2, 12, 3, 32,
>  			MIXED_THREADS | MULTI_VM | THREADED },
>  		{ "beng-threads-small", 2, 16, 128, 1, 128,
>  			THREADED | BIND_EXEC_QUEUE },
> @@ -878,13 +879,13 @@ int igt_main()
>  			MIXED_THREADS | THREADED | BIND_EXEC_QUEUE },
>  		{ "beng-mixed-many-threads-small", 3, 16, 128, 1, 128,
>  			THREADED | BIND_EXEC_QUEUE },
> -		{ "beng-threads-large", 2, 2, 16, 3, 32,
> +		{ "beng-threads-large", 2, 2, 12, 3, 32,
>  			THREADED | BIND_EXEC_QUEUE },
> -		{ "beng-cm-threads-large", 2, 2, 16, 3, 32,
> +		{ "beng-cm-threads-large", 2, 2, 12, 3, 32,
>  			COMPUTE_THREAD | THREADED | BIND_EXEC_QUEUE },
> -		{ "beng-mixed-threads-large", 2, 2, 16, 3, 32,
> +		{ "beng-mixed-threads-large", 2, 2, 12, 3, 32,
>  			MIXED_THREADS | THREADED | BIND_EXEC_QUEUE },
> -		{ "beng-mixed-many-threads-large", 3, 2, 16, 3, 32,
> +		{ "beng-mixed-many-threads-large", 3, 2, 12, 3, 32,
>  			THREADED | BIND_EXEC_QUEUE },
>  		{ "beng-threads-small-multi-vm", 2, 16, 128, 1, 128,
>  			MULTI_VM | THREADED | BIND_EXEC_QUEUE },
> @@ -892,11 +893,11 @@ int igt_main()
>  			COMPUTE_THREAD | MULTI_VM | THREADED | BIND_EXEC_QUEUE },
>  		{ "beng-mixed-threads-small-multi-vm", 2, 16, 128, 1, 128,
>  			MIXED_THREADS | MULTI_VM | THREADED | BIND_EXEC_QUEUE },
> -		{ "beng-threads-large-multi-vm", 2, 2, 16, 3, 32,
> +		{ "beng-threads-large-multi-vm", 2, 2, 12, 3, 32,
>  			MULTI_VM | THREADED | BIND_EXEC_QUEUE },
> -		{ "beng-cm-threads-large-multi-vm", 2, 2, 16, 3, 32,
> +		{ "beng-cm-threads-large-multi-vm", 2, 2, 12, 3, 32,
>  			COMPUTE_THREAD | MULTI_VM | THREADED | BIND_EXEC_QUEUE },
> -		{ "beng-mixed-threads-large-multi-vm", 2, 2, 16, 3, 32,
> +		{ "beng-mixed-threads-large-multi-vm", 2, 2, 12, 3, 32,
>  			MIXED_THREADS | MULTI_VM | THREADED | BIND_EXEC_QUEUE },
>  		{ NULL },
>  	};
> @@ -905,12 +906,31 @@ int igt_main()
>  	int fd;
>  
>  	igt_fixture() {
> +		int dir;
> +
>  		fd = drm_open_driver(DRIVER_XE);
>  		igt_require(xe_has_vram(fd));
>  		vram_size = xe_visible_vram_size(fd, 0);
>  		igt_assert(vram_size);
>  		system_size = igt_get_avail_ram_mb() << 20;
>  
> +		/*
> +		 * The KMD emits a DRM_UT_DRIVER debug line for every 8 MiB chunk
> +		 * it migrates, so the large eviction subtests can flood the log
> +		 * on big-VRAM devices and exceed the runner's disk usage limit.
> +		 * Under CI, drop only that category and restore it on exit.
> +		 */
> +		dir = igt_sysfs_drm_module_params_open();
> +		if (dir >= 0) {
> +			int debug_mask = igt_drm_debug_mask_get(dir);
> +
> +			close(dir);
> +			if (debug_mask > 0 && (debug_mask & DRM_UT_DRIVER)) {
> +				igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
> +				update_debug_mask_if_ci(debug_mask & ~DRM_UT_DRIVER);
> +			}
> +		}
> +
>  		xe_for_each_engine(fd, hwe)
>  			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COPY)
>  				break;
> -- 
> 2.43.0
> 
