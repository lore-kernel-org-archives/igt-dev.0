Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA2FCD98CE
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jun 2026 15:31:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E509210EEEA;
	Thu, 11 Jun 2026 15:31:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ELt/+Cnm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D279710E839
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jun 2026 15:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781191894; x=1812727894;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=pY2UNZQzv0o1vYtP1eUvVeP2hhjMh85Em/2cxhB0lDQ=;
 b=ELt/+Cnms2kI6DYW6vQmc3I4BDerMr5Af10UjYszkXMfSPU0Ar+soGrT
 rjF+KPbGzuSfejPI5tDmemmrj+AHUMQ9Zz9NoI/hR58IuVOxHF+yBQj8f
 PtwREhSjMh2tDjsmgpbEV/V7/Q+MGjG0uD1/Wh9/DhzuiXXwku0RDw0EJ
 ijE0u3rgPFLITfW0PjEp6I6ooYrIDnmwDdtoq/HHriCRjWFMMEz2CJPHz
 ibpmJCtOveOzSNfGyhWbFVPQZHcTnqBW4GbsMEjYqog31Jdp56Pc9Hmlu
 6L2unfRKvZtb9tAZ9t7wrANlsLk+a4R+74LQZ3Daharn7qsJvQeuoJxmN Q==;
X-CSE-ConnectionGUID: bUBBvssHTVSTPGo7G6CpPQ==
X-CSE-MsgGUID: It/hojyUTOeZ5OSGmb+ABQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="93494075"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="93494075"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 08:31:33 -0700
X-CSE-ConnectionGUID: hU9ycf40RJ++HRHqK0DVtA==
X-CSE-MsgGUID: SQvrNz+xSOWecbM6gF9kvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="251452997"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 08:31:32 -0700
Date: Thu, 11 Jun 2026 17:31:29 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: vitaly.prosyak@amd.com
Cc: igt-dev@lists.freedesktop.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: Re: [PATCH] tests/amdgpu: amd_lockdep: fix include order, copyright
 year and meson.build
Message-ID: <20260611153129.c6xxsnau5bza2ioh@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 vitaly.prosyak@amd.com, igt-dev@lists.freedesktop.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jesse Zhang <jesse.zhang@amd.com>
References: <20260610180545.71343-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260610180545.71343-1-vitaly.prosyak@amd.com>
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

Hi Vitaly,
On 2026-06-10 at 14:05:35 -0400, vitaly.prosyak@amd.com wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> 
> Address review feedback from Kamil Konieczny:
> - Reorder includes: system headers first (alphabetical), then
>   amdgpu headers, then IGT headers (alphabetical)
> - Fix copyright year to 2026
> - Fix meson.build alphabetical ordering (amd_lockdep after amd_dmabuf_unload)

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Jesse Zhang <jesse.zhang@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> ---
>  tests/amdgpu/amd_lockdep.c | 21 +++++++++++----------
>  tests/amdgpu/meson.build   |  2 +-
>  2 files changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/tests/amdgpu/amd_lockdep.c b/tests/amdgpu/amd_lockdep.c
> index d97c0747f..48d7ccafa 100644
> --- a/tests/amdgpu/amd_lockdep.c
> +++ b/tests/amdgpu/amd_lockdep.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: MIT
>  /*
> - * Copyright 2024 Advanced Micro Devices, Inc.
> + * Copyright 2026 Advanced Micro Devices, Inc.
>   *
>   * Test: amd_lockdep - Exercise lock-heavy GPU paths for lockdep validation
>   *
> @@ -22,19 +22,20 @@
>   *   stress-all-paths             - Combined stress of all paths
>   */
>  
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <pthread.h>
> +#include <signal.h>
> +#include <sys/mman.h>
> +
> +#include <amdgpu.h>
> +#include <amdgpu_drm.h>
> +
>  #include "igt.h"
>  #include "igt_amd.h"
>  #include "igt_taints.h"
> -#include "lib/amdgpu/amd_memory.h"
>  #include "lib/amdgpu/amd_command_submission.h"
> -
> -#include <amdgpu.h>
> -#include <amdgpu_drm.h>
> -#include <pthread.h>
> -#include <sys/mman.h>
> -#include <signal.h>
> -#include <fcntl.h>
> -#include <errno.h>
> +#include "lib/amdgpu/amd_memory.h"
>  
>  #define BO_SIZE (4 * 1024 * 1024)  /* 4MB */
>  #define NUM_BOS 16
> diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
> index d7482318a..08206f8c8 100644
> --- a/tests/amdgpu/meson.build
> +++ b/tests/amdgpu/meson.build
> @@ -15,7 +15,6 @@ if libdrm_amdgpu.found()
>  			  'amd_cs_nop',
>  			  'amd_cursor_overlay',
>  			  'amd_deadlock',
> -			  'amd_lockdep',
>  			  'amd_dmabuf_unload',
>  			  'amd_dp_dsc',
>  			  'amd_freesync_video_mode',
> @@ -29,6 +28,7 @@ if libdrm_amdgpu.found()
>  			  'amd_jpeg_dec',
>  			  'amd_jpeg_queue',
>  			  'amd_link_settings',
> +			  'amd_lockdep',
>  			  'amd_max_bpc',
>  			  'amd_mem_leak',
>  			  'amd_mode_switch',
> -- 
> 2.54.0
> 
