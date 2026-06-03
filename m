Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC11CD6E57
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jun 2026 18:04:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FEB811220C;
	Wed,  3 Jun 2026 18:04:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XPjG3wgZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DB7911220A
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jun 2026 18:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780509852; x=1812045852;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3Ua0VRgIbtXjT2IX5rLp1wmw4dI14RekWvrWcK9qHUY=;
 b=XPjG3wgZgJdlE4mgtywCQBMT0Y7/H0Gde0iYzVRw1xDc4t6d15xerkjG
 Lq+TJFPJy/d8z3yccfA1kcWceVrSt+Zb8fnnTI45jgF2+kSnLAS/j2pFX
 fZsZKfeRqGPHZKKuZN8QcpN/SCaBR2/KSfadeMaIRSZQQH0OfFLh2Pce9
 OYtIMGG5fEEUYUmG2OI8lJItf0ZUfspLrbvUkbYCN+mUSErCRMtDhcM9z
 y6PG+9xIwGqBz4kHYXsGUhcx/lemhfSaFk/a26yRWInG4aeM2yxGpv3Kw
 1itS1DK+QwliX5x8d0TyJYL27OUyGTK3HoUd17u3PFX8lRXIfZ2OoO0Pv Q==;
X-CSE-ConnectionGUID: e3NHQ4rfSIuSH2zfbfq5Ww==
X-CSE-MsgGUID: /YCPxZBwRvelKF1VbgFzUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="80365034"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="80365034"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 11:04:12 -0700
X-CSE-ConnectionGUID: gw1kETi9RHehuYqXdojxlw==
X-CSE-MsgGUID: fUmsUx1TSnu5pKiFdrRX9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="237976551"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 11:04:10 -0700
Date: Wed, 3 Jun 2026 20:03:51 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sobin Thomas <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org, thomas.hellstrom@intel.com,
 nishit.sharma@intel.com
Subject: Re: [PATCH i-g-t v7] test/intel/xe_vm:Add oversubscribe concurrent
 bind stress subtest
Message-ID: <20260603180351.hd7gzwno65cdlbqx@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sobin Thomas <sobin.thomas@intel.com>,
 igt-dev@lists.freedesktop.org, thomas.hellstrom@intel.com,
 nishit.sharma@intel.com
References: <20260601171848.10873-1-sobin.thomas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260601171848.10873-1-sobin.thomas@intel.com>
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
On 2026-06-01 at 17:18:48 +0000, Sobin Thomas wrote:

small nit about subject, please add space after ':' so it
will read:

[PATCH i-g-t v7] test/intel/xe_vm: Add oversubscribe concurrent bind stress subtest

Regards,
Kamil

> Add test for oversubscribing VRAM in multi process environment that
> creates VM, bind large BOs and submit workloads nearly simultaneously.
> 
> Previous coverage lacked a scenario combining multi-process bind
> with VRAM oversubscription. This generates memory pressure with
> multi-process VM Bind activity and concurrent submission, exercising
> the bind pipeline under eviction pressure.
> 
> v2: Removed helper APIs usage clock_nanosleep and commented
> code.(Nishit)
> 
> v3: Refactored code to smaller functions.
>     Added check for available SRAM usage and keep the max process to 20.
> 
> v4: Remove explicit macros definition
>     Replace Bind ioctl with library calls.(Thomas)
> v5: Remove unused query_mem_info
>     Fix xe_exec_with_retry (Thomas)
>     Rename align_to_page_size with ALIGN macro (kamil/Thomas)
> v6: Fix vm_bind_bo_batch: move igt_assert(ufence) before first dereference
>     Fix create_test_bos: check errno instead of ret for ENOMEM/ENOSPC
>     detection, since igt_ioctl returns -1 on failure. (Thomas)
> v7:  Save errno immediately in create_test_bos before it can be clobbered.
>      Handle non-ENOMEM/ENOSPC failures in create_test_bos.
>      Remove dead code (retries == 0 check) in xe_exec_with_retry.
>      Add igt_skip when both vram and sram n_bufs are 0.
>      Add MAP_FAILED check on result_bo.ptr after xe_bo_map. (Nishit)
> 
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>  tests/intel/xe_vm.c | 423 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 423 insertions(+)
[cut]
