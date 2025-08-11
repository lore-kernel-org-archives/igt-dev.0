Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6EE5C87FDB
	for <igt-dev@archiver.kernel.org>; Mon, 11 Aug 2025 10:31:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7675D10E422;
	Mon, 11 Aug 2025 10:31:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N9MzJ8ur";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABBE810E422
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Aug 2025 10:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754908299; x=1786444299;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=8uo/NEB26MrICCphebGY5VVr1YmDOF0AuqMcuMgM9Xg=;
 b=N9MzJ8urFrrclsmvH4qa7XI7uM2Q3VWNo+WuQMeKD3YrFFShFkPVRWNt
 VkUVNG8yY9t3/0GD/mMZs32UtHDL2fuzn5b3yNsUDsNVmZ6T8KmcOZ650
 75gSwigLR6+Ll61ZhpIpm6eBtGOR95bPfq5WxbK8upnDYb2dK4eBFkPl8
 lLBydcdOzlE91/XiccAmNkno//NO1pYb0Ki9WRn+4gBzSnXeX49TNVMe9
 tYxj44BVki79Khx2uMcNjLQ/sCb0Vpx0IowK87NX9U+HualkPeZcNDNNJ
 FDgJY20ICxnN3AS8Wn2MaNDltTOO4T+BIOibfTT1qVA/RXRog89KSOvCk g==;
X-CSE-ConnectionGUID: pue/DaNpTAShs7Un50nk/Q==
X-CSE-MsgGUID: t030uUs/TnqDmodAJ5H4GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="60959681"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="60959681"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 03:31:39 -0700
X-CSE-ConnectionGUID: KPPkiVs6RvewOij2NBDZxQ==
X-CSE-MsgGUID: MFUfL4bKQ8+E3oASs4mDgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="166677695"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 03:31:38 -0700
Date: Mon, 11 Aug 2025 12:31:36 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org,
	Daniel Charles <daniel.charles@intel.com>
Subject: Re: [PATCH i-g-t] tests/xe_compute_preempt: remove WMTP check in
 multiprocess tests
Message-ID: <20250811103136.cmmcleqlqdduutaj@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org,
 Daniel Charles <daniel.charles@intel.com>
References: <20250811054650.37114-2-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250811054650.37114-2-zbigniew.kempczynski@intel.com>
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

Hi Zbigniew,
On 2025-08-11 at 07:46:51 +0200, Zbigniew Kempczyński wrote:
> Before forking we test WMTP preemption in test_compute_preempt()
> which is synchronous. Remove this check as it is redundant, there's
> dedicated 'compute-preempt' subtest which does it.

I do not see a dedicated VRAM test, only SYSTEM_RAM?
Something like: compute-preempt-vram?
I do not think it is a blocker so
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Daniel Charles <daniel.charles@intel.com>
> ---
>  tests/intel/xe_compute_preempt.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/tests/intel/xe_compute_preempt.c b/tests/intel/xe_compute_preempt.c
> index 7a468e7426..c9b194869c 100644
> --- a/tests/intel/xe_compute_preempt.c
> +++ b/tests/intel/xe_compute_preempt.c
> @@ -102,7 +102,6 @@ igt_main
>  				igt_debug("RAM: %" PRIu64 ", child count: %d\n",
>  					  ram_mb, child_count);
>  
> -				test_compute_preempt(xe, hwe, false, EXECENV_PREF_SYSTEM);
>  				igt_fork(child, child_count)
>  					test_compute_preempt(xe, hwe, false, EXECENV_PREF_SYSTEM);
>  				igt_waitchildren();
> @@ -129,7 +128,6 @@ igt_main
>  				igt_debug("RAM: %" PRIu64 ", child count: %d\n",
>  					  ram_mb, child_count);
>  
> -				test_compute_preempt(xe, hwe, false, EXECENV_PREF_SYSTEM);
>  				igt_fork(child, child_count)
>  					test_compute_preempt(xe, hwe, false, EXECENV_PREF_SYSTEM);
>  				igt_waitchildren();
> @@ -156,7 +154,6 @@ igt_main
>  				igt_debug("VRAM: %" PRIu64 ", child count: %d\n",
>  					  vram_mb, child_count);
>  
> -				test_compute_preempt(xe, hwe, false, EXECENV_PREF_VRAM);
>  				igt_fork(child, child_count)
>  					test_compute_preempt(xe, hwe, false, EXECENV_PREF_VRAM);
>  				igt_waitchildren();
> @@ -183,7 +180,6 @@ igt_main
>  				igt_debug("VRAM: %" PRIu64 ", child count: %d\n",
>  					  vram_mb, child_count);
>  
> -				test_compute_preempt(xe, hwe, false, EXECENV_PREF_VRAM);
>  				igt_fork(child, child_count)
>  					test_compute_preempt(xe, hwe, false, EXECENV_PREF_VRAM);
>  				igt_waitchildren();
> -- 
> 2.43.0
> 
