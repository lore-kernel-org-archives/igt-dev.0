Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D0B0C61CE8
	for <igt-dev@archiver.kernel.org>; Thu, 12 Jun 2025 09:15:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20DFE10E7C0;
	Thu, 12 Jun 2025 09:15:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xitw+NJN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1320C10E7BE
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jun 2025 09:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749719734; x=1781255734;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YOzt7plZLKL4Kr1xDINi3dMQKKzMXykpHAlydY1jFK0=;
 b=Xitw+NJND6Gk1el1IUXMJ2gneSuOBSm1ULGiiFxLP6YXepnnRJNW76as
 ln09Q2q0ROuc+pLldC/A8oD+d+9Q+Wr3DCH7KDBI7KTNnzdbu214ztmMB
 HoqxLMuT1k0Ey756uhUtuLyeigskMeZBfJSyrBEqzlSWzlXEewIz/nw+N
 lW6GEoF19POl1DeT62smBpmyy3A8Gtj9UMPSWjDbyIiry7ZcSYfvZx8im
 xeb3R0sSW2N7WEbPSbyXmvFx0lzoWePInOagjuusSmHbEAYcKF3a6sCkr
 scxBs5JU+JK9kAG7YSlhTyBmqeFYjXMnPEvviAX0FumChj7hLpUqGRH1t A==;
X-CSE-ConnectionGUID: oXeJ1YOISZGKPu+jXqHTrg==
X-CSE-MsgGUID: 0MOS6bEpQMm/woS5SEHL+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="69327292"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="69327292"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 02:15:34 -0700
X-CSE-ConnectionGUID: 7Fmk+mMWSgCB3DhUPxrUYA==
X-CSE-MsgGUID: rKvCZS6QRHm1p5nbx58IuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="147369008"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 02:15:33 -0700
Date: Thu, 12 Jun 2025 11:15:30 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH v3] tests/intel/xe_exec_compute_mode: Fix assertion of
 batch buffer size
Message-ID: <20250612091530.s5vq7joo2xquitak@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250612081430.3697406-1-shuicheng.lin@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250612081430.3697406-1-shuicheng.lin@intel.com>
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

Hi Shuicheng,
On 2025-06-12 at 08:14:30 +0000, Shuicheng Lin wrote:
> The batch buffer pointer is data[EXEC_DATA] not data. Correct it in the assertion.
> Fix 2 other issues reported by checkpatch.pl:
> "
> WARNING: please, no space before tabs
> FILE: tests/intel/xe_exec_compute_mode.c:27:
> 
> ERROR: code indent should use tabs where possible
> FILE: tests/intel/xe_exec_compute_mode.c:275:
> "

Please do not add checkpatch messages to commit,
rather just write for example: Fix whitespaces.

> 
> v2: fix issues reported by checkpatch.pl
> v3: add back the missed checkpatch message
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  tests/intel/xe_exec_compute_mode.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
> index 8fba9daef..a7ea56327 100644
> --- a/tests/intel/xe_exec_compute_mode.c
> +++ b/tests/intel/xe_exec_compute_mode.c
> @@ -24,7 +24,7 @@
>  #include "xe/xe_spin.h"
>  #include <string.h>
>  
> -#define MAX_N_EXECQUEUES 	16
> +#define MAX_N_EXECQUEUES		16
>  #define USERPTR				(0x1 << 0)
>  #define REBIND				(0x1 << 1)
>  #define INVALIDATE			(0x1 << 2)
> @@ -272,7 +272,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  				map_fd = open("/tmp", O_TMPFILE | O_RDWR,
>  					      0x666);
>  				igt_assert_eq(write(map_fd, data, bo_size),
> -				              bo_size);
> +					      bo_size);

Both those whitespace fixes are far from a hunk with fix,
imho this should be in another patch, not mixed here.

>  				data = mmap((void *)MAP_ADDRESS, bo_size,
>  					    PROT_READ | PROT_WRITE, MAP_SHARED |
>  					    MAP_FIXED, map_fd, 0);
> @@ -393,7 +393,7 @@ static void non_block(int fd, int expect)
>  	data[EXEC_DATA].batch[b++] = sdi_addr >> 32;
>  	data[EXEC_DATA].batch[b++] = value;
>  	data[EXEC_DATA].batch[b++] = MI_BATCH_BUFFER_END;
> -	igt_assert(b <= ARRAY_SIZE(data->batch));
> +	igt_assert(b <= ARRAY_SIZE(data[EXEC_DATA].batch));

I will take v1 for a merge after all tests will run and after
you will reply to failures from CI (if any).

Please respond to tests results with cc to CI (e-mail is given
in failure report). Also cut reply after 'Known issues' as it
should be small (under few kilobytes).

Regards,
Kamil

>  
>  	sync[0].addr = addr + (char *)&data[EXEC_DATA].exec_sync - (char *)data;
>  	exec.num_syncs = 0;
> -- 
> 2.25.1
> 
