Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B55E6D729E9
	for <igt-dev@archiver.kernel.org>; Fri, 29 Nov 2024 16:18:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65ADD10E1B2;
	Fri, 29 Nov 2024 16:18:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UbqAn9n7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D876610E1B2
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Nov 2024 16:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732897100; x=1764433100;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PJJ3G2odo1KDIBbeFAZLr42RmJivspwH82/8K3mwpl8=;
 b=UbqAn9n7C/o49xGqTmYLOGM/7RfciHUp4wXK5NYNL3pEp8dmUWDDffrj
 VXRgyGykAES459+6doefDeseL5giNIihyplePKgeQqCiHjQbJQJxK078I
 oNolM6IjPsEnjkfa6/V4NYCPnz5do5wyUQzyPRy+evbceTLTApSpKijBv
 A3CA6Tg/xcdtJ7TbllDYtkQD1ZjN9U2T1hXP2CJp1FaKEOlmYFiSvslaA
 UY5aeHF/anNUSqj/m/FeGP7nFEqEzXvrHGb9HAZZ+OirNOASDS1JgyfTK
 MM/c+9XpMnZ27livGh759YMZXRGL76TLn9QviNfbbWU36p9XsMEwTEvMV A==;
X-CSE-ConnectionGUID: yMNsRR3CTaaXK18rGUueeQ==
X-CSE-MsgGUID: vedDWmJ9TDauZrv5NgcBLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="33188509"
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; d="scan'208";a="33188509"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2024 08:18:19 -0800
X-CSE-ConnectionGUID: RafgMkkVSri4IaY2Wkf/aw==
X-CSE-MsgGUID: KJshvAQ3QtekCXnFpUFhlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; d="scan'208";a="92843036"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 08:18:18 -0800
Date: Fri, 29 Nov 2024 17:18:01 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_fault_injection: Pick a valid PAT
 index for vm_bind
Message-ID: <20241129161801.cxmkhqqikeuq642n@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Matt Roper <matthew.d.roper@intel.com>
References: <20241125185432.1187252-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241125185432.1187252-1-matthew.d.roper@intel.com>
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

Hi Matt,
On 2024-11-25 at 10:54:32 -0800, Matt Roper wrote:
> The vm_bind helper function in the fault injection test failed to
> specify a PAT index to use for the bind, effectively leaving the index
> as 0.  On Xe2 and Xe3 platforms, index 0 provides non-coherent behavior
> which is incompatible with vm_bind operations on userptr, resulting in a
> test failure before the test even got to the point of intentionally
> injecting errors.
> 
> Fixes: 13e3d5126 ("tests/intel/xe_fault_injection: Inject errors during vm bind IOCTL")
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3499
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

LGTM,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/xe_fault_injection.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index 7d6c90276..7ae941367 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -18,6 +18,7 @@
>  #include "igt_kmod.h"
>  #include "igt_sysfs.h"
>  #include "lib/igt_syncobj.h"
> +#include "lib/intel_pat.h"
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>  
> @@ -238,6 +239,7 @@ simple_vm_bind(int fd, uint32_t vm)
>  		.bind.range = BO_SIZE,
>  		.bind.addr = BO_ADDR,
>  		.bind.op = DRM_XE_VM_BIND_OP_MAP_USERPTR,
> +		.bind.pat_index = intel_get_pat_idx_wb(fd),
>  		.bind.flags = 0,
>  		.num_syncs = 1,
>  		.syncs = (uintptr_t)&syncobj,
> -- 
> 2.47.0
> 
