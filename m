Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73642CD343F
	for <igt-dev@archiver.kernel.org>; Wed, 12 Nov 2025 18:23:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2586710E799;
	Wed, 12 Nov 2025 18:23:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dTHwhhfF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A21710E799
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Nov 2025 18:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762971822; x=1794507822;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MOGTU2H7Ab7c8fPlZ3Oxh9rp6AzThu+65udupmPZW4w=;
 b=dTHwhhfFAbmrigEOtA9NhYBKEULrWsrVEEQ2uxf1NA2AlULKI6ZbCt+H
 E1jDkUW6ObORvQip7bpuUujqpb/qe3NKDWFsyrFJqsYubbRexi4VUPVZu
 yqR5Q/eAeX3YzidmkNQ5qxAU3qP4+XnMI7teGMyqt+FPYfklY0pC0OVCN
 V3Et47/xtQ+v7AbAnWPqn42bXXlqQ001Coymb354tnZV3EMg0Hz3eYFcy
 kbJMYALdHPay5MgV18R6P6fCQkMT998+V1lhPb+VFjHmTurFkq4InyeR1
 Zdb7F+aISnGMPHSKtSdgu/Aw2KK7h/BvRvHqkpq8ODhxNVNueFRsTwZFl A==;
X-CSE-ConnectionGUID: 6YtuBm+rRfeNvkyfHcTKxw==
X-CSE-MsgGUID: qgOweF2yR/eyCNWxx1lgrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="76502819"
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; d="scan'208";a="76502819"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 10:23:41 -0800
X-CSE-ConnectionGUID: 8fyn+wf9SYuaFJLBelVDxA==
X-CSE-MsgGUID: 7mS2KYt4TryhopB/u9L2ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; d="scan'208";a="189289238"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 10:23:40 -0800
Date: Wed, 12 Nov 2025 19:23:37 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org, thomas.hellstrom@intel.com
Subject: Re: [PATCH i-g-t v5 8/8] tests/intel/xe_multi-gpusvm.c: Add SVM
 multi-GPU migration test
Message-ID: <20251112182337.hubj4ak4chumurtx@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 nishit.sharma@intel.com, igt-dev@lists.freedesktop.org,
 thomas.hellstrom@intel.com
References: <20251111163456.496063-1-nishit.sharma@intel.com>
 <20251111163456.496063-9-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251111163456.496063-9-nishit.sharma@intel.com>
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

Hi nishit.sharma,
On 2025-11-11 at 16:34:56 +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>

in subject s/-/_/, s/.c:/c:/, also imho s/multi_gpusvm/multigpu_svm/
so it will be:

[PATCH i-g-t v5 8/8] tests/intel/xe_multigpu_svm: Add SVM multi-GPU migration test

Regards,
Kamil

> 
> This test allocates a buffer in SVM, accesses it from GPU 1, then GPU 2
> and then the CPU. It verifies that the buffer migrates correctly between
> devices and remains accessible across all agents in a multi-GPU environment.

This should also work for only one dGPU and CPU. One more argument
to place all multi-gpu subtests in one xe_svm.c? Unless cases for
two or more dGPU are all that complicated?

Regards,
Kamil

> ---
>  tests/intel/xe_multi_gpusvm.c | 231 ++++++++++++++++++++++++++++++++++
>  tests/intel/xe_multisvm.c     |   2 +
>  2 files changed, 233 insertions(+)
> 
> diff --git a/tests/intel/xe_multi_gpusvm.c b/tests/intel/xe_multi_gpusvm.c
> index bb287c1d3..3159a4180 100644
> --- a/tests/intel/xe_multi_gpusvm.c
> +++ b/tests/intel/xe_multi_gpusvm.c
> @@ -64,6 +64,11 @@
>   * Description:
>   * 	This test checks conflicting madvise by allocating shared buffer
>   * 	prefetches from both and checks for migration conflicts
> + *
> + * SUBTEST: migrate-test-multi-gpu
> + * Description:
> + * 	This test allocates an SVM buffer, accesses it from GPU 1, GPU 2, and CPU,
> + * 	and verifies migration and accessibility between devices
>   */

[cut]
