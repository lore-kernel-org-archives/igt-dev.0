Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 156E0F9D0CA
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 12:22:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACAC310E5D7;
	Tue, 14 Apr 2026 12:22:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EOr+rzPI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F9C610E4B8
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 12:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776169338; x=1807705338;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HKoDMHJcYptTHoVG1hQtahUuEigZY+4ZYUBnlfiKOgw=;
 b=EOr+rzPId7S6fIQIVAhEgI2QC8FZNzFwphl9tIP4eIwJYvRaRMTgEYZJ
 9uNOxO4h4k+MAZAkwDkOeY1oXNrkzmimINMNQzW3e+m5trzXC7/rOZrPw
 4uy7MHJerM3CzCznIwazl1oVLM3ZB9BCm97R3v884fw4TSJbdKUIx4iUn
 DSXxYSDxUeTNIMN1+ygbyeQheuKxWSoQWuZBNlpfN07w7VedEIKDTgYBl
 Uwqwpg+GbLfMxTWfqDSpzaloNpk4ZHERdoyv7pugniHUxA0HcMOcZfEN4
 6LPAm2mQwRzFGcjrUEXVqko1X4UoIngOKjZN1WgQtUaBQZGuYMq1zQvnP Q==;
X-CSE-ConnectionGUID: /JiplNDdQdSoBc4mLdSuNA==
X-CSE-MsgGUID: /7Ea6yVnSFuNN/R3wgRzgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77234920"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="77234920"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 05:22:17 -0700
X-CSE-ConnectionGUID: VvpKr2lcT7emwemKhhD23A==
X-CSE-MsgGUID: 2OMWWMJES6CmEuU1FI5rgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="253301365"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 05:22:03 -0700
Date: Tue, 14 Apr 2026 14:21:44 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 matthew.auld@intel.com
Subject: Re: [PATCH 1/3] igt/xe: Add temporary helpers for VM_Bind neg test
Message-ID: <20260414122144.34kapvreg26guimp@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>,
 igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 matthew.auld@intel.com
References: <20260309060901.642399-1-smitha.balasubramanyam@intel.com>
 <20260309060901.642399-2-smitha.balasubramanyam@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260309060901.642399-2-smitha.balasubramanyam@intel.com>
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

Hi Smitha,
On 2026-03-09 at 11:38:59 +0530, Smitha Balasubramanyam wrote:
> Signed-off-by: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
> 
> Added helper functions and UAPI macro definition required for
> VM_BIND Decomp negative tests.
> These helpers and definitions duplicate functionality introduced in
> VLK-79231, positive test series, which is yet to be merged.
> They are included here so that the negative
> tests can be developed and executed independently.
> 
> Once the positive test series lands upstream, this patch can be dropped
> and the tests can reuse the shared helpers and UAPI definitions.
> Also, includes a few formatting changes suggested by checkpatch.pl.
> ---
>  include/drm-uapi/xe_drm.h |   1 +
>  tests/intel/xe_ccs.c      | 331 +++++++++++++++++++++++++-------------
>  2 files changed, 220 insertions(+), 112 deletions(-)
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index 077e66a68..44355f6b5 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -1160,6 +1160,7 @@ struct drm_xe_vm_bind_op {
>  #define DRM_XE_VM_BIND_FLAG_CHECK_PXP	(1 << 4)
>  #define DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR	(1 << 5)
>  #define DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET	(1 << 6)
> +#define DRM_XE_VM_BIND_FLAG_DECOMPRESS		(1 << 7)
>  	/** @flags: Bind flags */
>  	__u32 flags;

Drop this change, it is already there, also the format for
changing uapi is different, it should be in separate commit.

grep DRM_XE_VM_BIND_FLAG_DECOMPRESS  include/drm-uapi/xe_drm.h
 *  - %DRM_XE_VM_BIND_FLAG_DECOMPRESS - Request on-device decompression for a MAP.
#define DRM_XE_VM_BIND_FLAG_DECOMPRESS (1 << 7)

>  
> diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
> index a21922ee5..4424f6f9b 100644
> --- a/tests/intel/xe_ccs.c
> +++ b/tests/intel/xe_ccs.c
> @@ -11,6 +11,8 @@
>  #endif
>  #include <sys/ioctl.h>
>  #include <sys/time.h>
> +#include <sys/mman.h>
> +#include <unistd.h>
>  #include <malloc.h>

While at this, could you move <malloc.h> to proper place?

Regards,
Kamil


>  #include "drm.h"
>  #include "igt.h"
> @@ -97,20 +99,125 @@ struct test_config {
>  };
>  
[cut]
