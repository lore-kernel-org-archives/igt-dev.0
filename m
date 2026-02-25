Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED86FFD3774
	for <igt-dev@archiver.kernel.org>; Wed, 25 Feb 2026 16:38:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9601710E7F4;
	Wed, 25 Feb 2026 16:38:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TMDg0s5J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B9E10E7F4
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Feb 2026 16:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772037514; x=1803573514;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rklTs1xT70W0gScnDkx27+hGkUMd5NOdavC9Qd27vYU=;
 b=TMDg0s5J8QG64B9Ji54ugjQnDneJO4E1FangusTY0FsknVo1nPdptca0
 apxVn59uCMVyBd6K+AhVqhoSgaUD6+jvrzgZJy5BMnl7GtRuEe86RRxkr
 cWAfFn/ic8nPvZdgtB4XeSJ95Oo2xrUNAjA5c6Ysm2xSdB+VQB9U6Tr89
 ftMtImb4bSR2NlENMjCD6nr+PmYEmvNFTbpp+2yu3m4c/lDQsxkLriDmR
 WnZsC3ReRPRK0nNMv60sc1EBACHGlUcwqSzF+PcET6nT0NJ+LMTzhwvos
 K4pfzpqmuQ/RZaM0A7Qy+IDDo6zgBzKr65YwBguTqRwksIxtK0r6VwUFH A==;
X-CSE-ConnectionGUID: TJ1LN1BoRhqOix1WLg3S/g==
X-CSE-MsgGUID: y2et4TOrTaiXYPqRjPx89A==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73258475"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="73258475"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 08:38:33 -0800
X-CSE-ConnectionGUID: 7JNn4O7tTiGdoMjCyl/YuQ==
X-CSE-MsgGUID: qb9r8kq1Q6O/wNWDFAXJ2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="216430348"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 08:38:32 -0800
Date: Wed, 25 Feb 2026 17:38:09 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sobin Thomas <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org, nishit.sharma@intel.com
Subject: Re: [PATCH i-g-t 1/1] tests/xe_vm: Add oversubscribe concurrent bind
 stress test
Message-ID: <20260225163809.enazrtckjtn6rkhn@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sobin Thomas <sobin.thomas@intel.com>,
 igt-dev@lists.freedesktop.org, nishit.sharma@intel.com
References: <20260218164417.856114-1-sobin.thomas@intel.com>
 <20260218164417.856114-2-sobin.thomas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260218164417.856114-2-sobin.thomas@intel.com>
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

Hi Sobin,
On 2026-02-18 at 16:44:17 +0000, Sobin Thomas wrote:

small nit about subject, please use prefix tests/intel/xe_vm: , also it
is a 'subtest'. After that it will be:

[PATCH i-g-t 1/1] tests/intel/xe_vm: Add oversubscribe concurrent bind stress subtest

Btw should there also be a benchmark?

Regards,
Kamil

> Add an xe_vm subtest that oversubscribes VRAM and issues
> concurrent binds into a single VM (scratch-page mode) to
> reproduce the dma-resv/bind race found under memory pressure.
> Prior coverage lacked any case that combined multi-process bind
> pressure with VRAM oversubscription, so bind/submit could
> panic (NULL deref in xe_pt_stage_bind) instead of failing cleanly.
> The new test expects successful completion or ENOMEM/EDEADLK.
> 
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>  tests/intel/xe_vm.c | 421 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 421 insertions(+)
> 
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index ccff8f804..5c9d5ff0f 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -21,6 +21,176 @@
>  #include "xe/xe_spin.h"
>  #include <string.h>
>  
> +#define MI_BB_END		(0 << 29 | 0x0A << 23 |  0)
> +#define MI_LOAD_REG_MEM		(0 << 29 | 0x29 << 23 | 0 << 22 | 0 << 21 | 1 << 19 | 2)
> +#define MI_STORE_REG_MEM	(0 << 29 | 0x24 << 23 | 0 << 22 | 0 << 21 | 1 << 19 | 2)
> +#define MI_MATH_R(length)		(0 << 29 | 0x1A << 23 | ((length) & 0xFF))
> +#define GPR_RX_ADDR(x)		(0x600 + (x) * 8)
> +#define ALU_LOAD(dst, src)	(0x080 << 20 | ((dst) << 10) | (src))
> +#define ALU_STORE(dst, src)	(0x180 << 20 | (dst) << 10 | (src))
> +#define ALU_ADD			(0x100 << 20)
> +#define ALU_RX(x)		(x)
> +#define ALU_SRCA		0x20
> +#define ALU_SRCB		0x21
> +#define ALU_ACCU		0x31
> +#define GB(x) (1024ULL * 1024ULL * 1024ULL * (x))

[cut]
