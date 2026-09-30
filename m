Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D57CA5FB1
	for <igt-dev@archiver.kernel.org>; Wed, 30 Sep 2026 09:26:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EA2610E6C8;
	Wed, 30 Sep 2026 09:26:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DMPIICI3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 875CC10E6C8
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Sep 2026 09:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790760326; x=1822296326;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=edQM+8CDTI2GBa4gMlraPzU/wpB+kHpA5iv4SSu8HX8=;
 b=DMPIICI3lX6S9p4koC3Wes7F7SiPtAO/4gTaNBCRXqXeJVEjtZWOdRSY
 S4bShmWHuPiICXW0bCM4xuN+eWapt2dXTV5Wx1gOVquu5hMAOcIgPObsJ
 Z+MW41zrXI/DVP8eLFUgYHgbMcdYqmFAA3gJkNfaIFKNqmZf/aWSPJM24
 oNSU4inZAmK8tmgBiNtoPRjKoJYxvdUbGYfdvcNVCqQ94ZZb/5glZkXDE
 z7MBwEeH0hK55BgUPt5ttgfNNrNGpBcjrUNr46Hcq+KthC75+CW+LO82i
 1kwYDW8VqqsP+tMuZjZoORs+zGQ9zHKIZT+430DdtTWEHxRpwKveYjyHr g==;
X-CSE-ConnectionGUID: bW1jON74SqWz7tFNcA9B/A==
X-CSE-MsgGUID: aV1clt1rR+CDov/8pfYubw==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90447490"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="90447490"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 02:25:26 -0700
X-CSE-ConnectionGUID: KTV9Uoz3QzCYmlvObInI7Q==
X-CSE-MsgGUID: wroDdKvSRx6sLMtjKLagAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="275675944"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 02:25:25 -0700
Date: Wed, 30 Sep 2026 11:25:06 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: igt-dev@lists.freedesktop.org, Julia Filipchuk <julia.filipchuk@intel.com>
Subject: Re: [PATCH i-g-t 1/1] intel-ci: remove pxp from NVL blocklist
Message-ID: <20260930092506.s63zyy7lvgq64o6f@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 igt-dev@lists.freedesktop.org,
 Julia Filipchuk <julia.filipchuk@intel.com>
References: <20260929184745.2208854-2-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260929184745.2208854-2-alan.previn.teres.alexis@intel.com>
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

Hi Alan,
On 2026-09-29 at 11:47:45 -0700, Alan Previn wrote:
> We plan to added GSC FW with PXP support for NVL-S now.
> However, it was still in the block list so let's remove this.
> 
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Before merge please wait for full Xe results and reply to CI fails,
if any.

Regards,
Kamil

> ---
>  tests/intel-ci/xe.nvl.core.blocklist.txt | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/tests/intel-ci/xe.nvl.core.blocklist.txt b/tests/intel-ci/xe.nvl.core.blocklist.txt
> index 7de332352..17d34b99b 100644
> --- a/tests/intel-ci/xe.nvl.core.blocklist.txt
> +++ b/tests/intel-ci/xe.nvl.core.blocklist.txt
> @@ -63,15 +63,10 @@ igt@xe_compute@eu-busy-10s
>  #     balancing, which NVL does not expose.
>  #   - xe_oa@oa-tlb-invalidate: OA TLB invalidation test relies
>  #     on a specific OA unit configuration not present on NVL.
> -#   - xe_pxp@.*: PXP (Protected Xe Path) content protection
> -#     requires a TEE (Trusted Execution Environment) and
> -#     associated firmware, which NVL does not support.
>  ##################################################################
>  igt@xe_exec_balancer@.*
> -igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add
>  igt@xe_huc_copy@huc_copy
>  igt@xe_oa@oa-tlb-invalidate
> -igt@xe_pxp@.*
>  ##################################################################
>  # Valid skip: test applicable only for i2c capable systems
>  ##################################################################
> 
> base-commit: 9d4b6ef512b4e2e4d05129c6519313fd13a306d2
> -- 
> 2.43.0
> 
