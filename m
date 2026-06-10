Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA9C5CD8CB9
	for <igt-dev@archiver.kernel.org>; Wed, 10 Jun 2026 13:49:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 626C810E987;
	Wed, 10 Jun 2026 13:49:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MkS14td+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A7010E998
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jun 2026 13:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781099351; x=1812635351;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=1ddRTBTOTd/TSmJSisiYIy5zqyvbXRByqCd/V1TXd+M=;
 b=MkS14td+efEuEiHr6wcagI4emNkbuj46SgRHlrK1hdPUcF6T7llcULme
 0kVDX6+EOVmQ3djTTci2252s2x3LsvNUihyKQtavmqs03n0t/f9tZTOhq
 XmOjlJkMGmFXXhzKQ7jGNT6N8nzCTA1HZ6MiYfzopqM7hv5GZ2dME6id1
 R2/DrRDDKJ3re6HCofxFX+e9/FqwrbtdQonGNPgOxgsF8pg13JIgISSsV
 5OLNWvk26lz4uDahh2+NZ1XAxWy4PHK/EZQFSKRmBNAXCwXtMaPKM/NJf
 e23hTHoKaLDMMstj+g9OFjvJVejn83cMDO5YLVfNO8J17yHwx4lyNDv15 Q==;
X-CSE-ConnectionGUID: 4ILdLERDSPmFwE1ZphWeGw==
X-CSE-MsgGUID: exctB8kcTjiX7Qt14Oakrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="69432029"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="69432029"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 06:49:10 -0700
X-CSE-ConnectionGUID: 4BVbKKw4QoKishvPlx6r2A==
X-CSE-MsgGUID: dSt75MExSBSPsWZEfHjrZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="251260105"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 06:49:09 -0700
Date: Wed, 10 Jun 2026 15:48:55 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: vitaly.prosyak@amd.com
Cc: igt-dev@lists.freedesktop.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: Re: [PATCH] tests/amdgpu: Add amd_lockdep test for lock ordering
 validation
Message-ID: <20260610134855.ucil2te4c5hlqti3@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 vitaly.prosyak@amd.com, igt-dev@lists.freedesktop.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jesse Zhang <jesse.zhang@amd.com>
References: <20260604005925.127581-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260604005925.127581-1-vitaly.prosyak@amd.com>
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

Hi vitaly.prosyak,
On 2026-06-03 at 20:58:53 -0400, vitaly.prosyak@amd.com wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> 
> Exercise lock-heavy GPU code paths concurrently to trigger lockdep
> warnings when lock ordering is violated. Requires kernel built with
> CONFIG_PROVE_LOCKING=y and amdgpu lockdep annotation patch.
> 
> Subtests:
> - concurrent-reset-and-submit: GPU reset vs VRAM allocation
> - concurrent-mmap-and-evict: mmap/munmap vs VRAM pressure
> - concurrent-userptr-and-reset: USERPTR invalidation vs GPU reset
> - stress-all-paths: All the above simultaneously
> 
> After running, check dmesg for circular locking dependency warnings.

I only glanced over beginning of this patch, also
it was already merged so no need for any action,
just few nits for future.

> 
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Jesse Zhang <jesse.zhang@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> ---
>  tests/amdgpu/amd_lockdep.c | 528 +++++++++++++++++++++++++++++++++++++
>  tests/amdgpu/meson.build   |   1 +
>  2 files changed, 529 insertions(+)
>  create mode 100644 tests/amdgpu/amd_lockdep.c
> 
> diff --git a/tests/amdgpu/amd_lockdep.c b/tests/amdgpu/amd_lockdep.c
> new file mode 100644
> index 000000000..d97c0747f
> --- /dev/null
> +++ b/tests/amdgpu/amd_lockdep.c
> @@ -0,0 +1,528 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2024 Advanced Micro Devices, Inc.

Generally a year should be same as a first year when you send
a patch to upstream, so 2026. It could be 2024 if you sent it
in 2024 and now resending with/or without/ any changes.

> + *
> + * Test: amd_lockdep - Exercise lock-heavy GPU paths for lockdep validation
> + *
> + * This IGT test exercises code paths that involve multiple kernel locks
> + * simultaneously. When run on a kernel with CONFIG_LOCKDEP=y and the
> + * amdgpu lockdep annotations patch, lockdep will warn if any code path
> + * violates the lock ordering hierarchy.
> + *
> + * The test checks dmesg for lockdep violations and fails if any are found.
> + * It also checks the kernel taint flags for TAINT_WARN.
> + *
> + * Usage:
> + *   sudo ./build/tests/amdgpu/amd_lockdep --run-subtest <subtest>
> + *
> + * Subtests:
> + *   concurrent-reset-and-submit  - Submit work while triggering reset
> + *   concurrent-mmap-and-evict    - mmap/munmap while VRAM eviction runs
> + *   concurrent-userptr-and-reset - USERPTR invalidation during reset
> + *   stress-all-paths             - Combined stress of all paths
> + */
> +
> +#include "igt.h"
> +#include "igt_amd.h"
> +#include "igt_taints.h"
> +#include "lib/amdgpu/amd_memory.h"
> +#include "lib/amdgpu/amd_command_submission.h"
> +
> +#include <amdgpu.h>
> +#include <amdgpu_drm.h>
> +#include <pthread.h>
> +#include <sys/mman.h>
> +#include <signal.h>
> +#include <fcntl.h>
> +#include <errno.h>

Please keep include headers in alphabetical order,
first system ones, one empty line, then igt headers.

[cut]
> diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
> index d6fe7e909..87cc9c3ee 100644
> --- a/tests/amdgpu/meson.build
> +++ b/tests/amdgpu/meson.build
> @@ -15,6 +15,7 @@ if libdrm_amdgpu.found()
>  			  'amd_cs_nop',
>  			  'amd_cursor_overlay',
>  			  'amd_deadlock',
> +                          'amd_lockdep',

Here also I would suggest to keep alphabetical order.
Also looks like some spaces where used, instead of tabs
+ two spaces?

Regards,
Kamil

>                            'amd_dmabuf_unload',
>  			  'amd_dp_dsc',
>  			  'amd_freesync_video_mode',
> -- 
> 2.54.0
> 
