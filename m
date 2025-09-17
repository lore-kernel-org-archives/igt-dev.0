Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AFFBCAC599
	for <igt-dev@archiver.kernel.org>; Wed, 17 Sep 2025 14:40:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B12C89FEA;
	Wed, 17 Sep 2025 14:40:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KrFn+NH7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A91989FEA
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Sep 2025 14:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758120010; x=1789656010;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=o/3Rh1cMSKZ9pi0Y/7rHo+o25dy/9PAzR4GODReY1Tk=;
 b=KrFn+NH7et+UWC/pbsPkl1h6TcKRUzHSCfP2DQe50gkmkppoV9zDumcS
 lwv6r2Of6NvquEL1O1hvyJ7q5l7dihECMmbeYQa7HZW+M1yV0VliF9fHZ
 zSh9IrspiQgupJRpfQ0ALhzavh0aGhZAw/93mUmyN32yeeSuvjza/1Od5
 mjDiw+OSbTn7jqUEEYq3sWNean/D939RnfXfkVGA2xqAxHJI2Fz6tVYUv
 JP3AYejjMw3afRmpLjfGByFWkX3HkDcAtsc3RRF3Iugmz+z6XEotqfkBG
 fBkWGOO2oPfXkRIdyXL2YdKL0lNOc9Z5yK1vWWTaln0GFpXyXsG6SuyP7 Q==;
X-CSE-ConnectionGUID: zswKD1gQScOVUyfqQGKtqQ==
X-CSE-MsgGUID: R8JfB8qYQmSkpbrVwYbi6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="78034422"
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="78034422"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 07:40:10 -0700
X-CSE-ConnectionGUID: kwNCR3O7Spa05XhTVaKicw==
X-CSE-MsgGUID: +P59VP7xQCmGgatuKIPQJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="206196116"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 07:40:08 -0700
Date: Wed, 17 Sep 2025 16:39:48 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: himanshu.girotra@intel.com
Cc: aditya.chauhan@intel.com, ramadevi.gandi@intel.com,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] Update Platform wise Blocklist file
Message-ID: <20250917143948.le5pyjntk75o3rtz@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 himanshu.girotra@intel.com, aditya.chauhan@intel.com,
 ramadevi.gandi@intel.com, igt-dev@lists.freedesktop.org
References: <20250917115859.14876-1-himanshu.girotra@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250917115859.14876-1-himanshu.girotra@intel.com>
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

Hi Himanshu,
On 2025-09-17 at 17:28:59 +0530, himanshu.girotra@intel.com wrote:
> From: Himanshu Girotra <himanshu.girotra@intel.com>

please use 'intel-ci:' prefix, also note which lists you changes,
so better subject:

[PATCH i-g-t] intel-ci: Update BMG and LNL core blocklists

No need for resend, it could be done at merge.

> 
> Update expected skips as per the current kernel behaviour for LNL & BMG
> 
> Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel-ci/xe.bmg.core.blocklist.txt | 15 +++++++++++++++
>  tests/intel-ci/xe.lnl.core.blocklist.txt | 14 ++++++++++++++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/tests/intel-ci/xe.bmg.core.blocklist.txt b/tests/intel-ci/xe.bmg.core.blocklist.txt
> index 6207d6af6..25da760aa 100644
> --- a/tests/intel-ci/xe.bmg.core.blocklist.txt
> +++ b/tests/intel-ci/xe.bmg.core.blocklist.txt
> @@ -56,6 +56,8 @@ igt@xe_eudebug_online@.*
>  igt@xe_exec_sip@.*
>  igt@xe_exec_sip_eudebug@.*
>  igt@xe_live_ktest@xe_eudebug
> +igt@xe_eudebug_sriov@deny-sriov
> +igt@xe_eudebug_sriov@deny-eudebug
>  ##################################################################
>  # Expected Skip as per the current behaviour
>  ##################################################################
> @@ -72,3 +74,16 @@ igt@xe_evict@evict-(beng-)?mixed-threads-large$
>  igt@xe_evict@evict-(beng-)?threads-large$
>  igt@xe_evict@evict-(beng-)?large-multi-vm-cm$
>  ##################################################################
> +# pxp support not available for BMG
> +##################################################################
> +igt@xe_pxp@(?!pxp-bo-alloc$|pxp-queue-alloc$).*
> +##################################################################
> +# I2c tests needs AMC capable BMG in CI
> +##################################################################
> +igt@xe_pm@d3hot-i2c
> +##################################################################
> +# Hugepages tests needs extra setting in CI
> +# echo 128 >  /proc/sys/vm/nr_hugepages
> +##################################################################
> +igt@xe_exec_system_allocator@.*huge.*
> +##################################################################
> diff --git a/tests/intel-ci/xe.lnl.core.blocklist.txt b/tests/intel-ci/xe.lnl.core.blocklist.txt
> index 1e69170d8..a3cd52935 100644
> --- a/tests/intel-ci/xe.lnl.core.blocklist.txt
> +++ b/tests/intel-ci/xe.lnl.core.blocklist.txt
> @@ -22,6 +22,8 @@ igt@xe_noexec_ping_pong
>  igt@xe_pm@d3-mmap-vram
>  igt@xe_pm@d3hot-mmap-vram
>  igt@xe_sysfs_tile@physical_vram_size_bytes
> +igt@xe_vm@out-of-memory
> +igt@xe_compute_preempt@compute-preempt-many-vram.*
>  ##################################################################
>  # No d3cold support for LNL
>  ##################################################################
> @@ -82,4 +84,16 @@ igt@xe_live_ktest@xe_eudebug
>  ##################################################################
>  igt@xe_oa@oa-tlb-invalidate
>  igt@xe_oa@unprivileged-single-ctx-counters
> +igt@xe_pmu@.*fn.*
> +igt@xe_mmap@pci-membarrier.*
> +igt@xe_module_load@force-load
> +##################################################################
> +# I2c tests needs AMC capable machines in CI
> +#################################################################
> +igt@xe_pm@d3hot-i2c
> +##################################################################
> +# Hugepages tests needs extra setting in CI
> +# echo 128 >  /proc/sys/vm/nr_hugepages
> +##################################################################
> +igt@xe_exec_system_allocator@.*huge.*
>  ##################################################################
> -- 
> 2.40.0
> 
