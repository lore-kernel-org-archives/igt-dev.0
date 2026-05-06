Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC96CD342C
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 10:26:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1697310E1AC;
	Wed,  6 May 2026 10:26:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Eq2hGrs2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5726910ED58
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2026 10:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778063186; x=1809599186;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=o3sHKmQuiX057zzLoTXpaWAwcA/5jhOMp8ykJWJoDCE=;
 b=Eq2hGrs264YfRENrcuar4eVdeiSAq048TpOS0adHZx0agrFR401HN4WK
 zgmBWgHh3HmqU5h6ytwX/9D/I3D/u7DqAMhhnW6KWGAySia3NgnaspcLj
 /nk/9hYufHbP975oygNWHRl8WWXbvfp1/8PfhZOSghB/HbC8DmxOOsrKS
 NzfQDQ1sxkLTOVQOtO4yeTKplc8Xo6A13xFcyRusuW4ovks3TkPKsIzda
 25aj82n+KwOSbx6Zt3CSYZx7QuO3PRrLXKIm8aZDaoT2JCFWQ9Q/UkCJc
 LDE+A433WPIVHQY9oy2K/CQOQXLGJBjJalpGJ9BmExJHRezXKwSMomrpy g==;
X-CSE-ConnectionGUID: bxPcnvTVTxqrdeWlM/v5lg==
X-CSE-MsgGUID: 5Esxr+JYTk6cURje1GpM0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="96558755"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="96558755"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 03:26:26 -0700
X-CSE-ConnectionGUID: Ok9rX0iJT8SNtfqRDusU/w==
X-CSE-MsgGUID: tR1wCPtATrGjqib26fKh5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="235095037"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 03:26:24 -0700
Date: Wed, 6 May 2026 12:26:21 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: S Sebinraj <s.sebinraj@intel.com>
Cc: igt-dev@lists.freedesktop.org, carlos.santa@intel.com,
 matthew.brost@intel.com, jeevaka.badrappan@intel.com,
 karthik.b.s@intel.com, krzysztof.karas@intel.com,
 kamil.konieczny@intel.com, zbigniew.kempczynski@intel.com
Subject: Re: [PATCH i-g-t v3] tests/intel/xe_exec: Add VM rebind stress test
 with cpumask cycling
Message-ID: <20260506102621.3rntdkl7w3fmvy62@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 S Sebinraj <s.sebinraj@intel.com>, igt-dev@lists.freedesktop.org,
 carlos.santa@intel.com, matthew.brost@intel.com,
 jeevaka.badrappan@intel.com, karthik.b.s@intel.com,
 krzysztof.karas@intel.com, kamil.konieczny@intel.com,
 zbigniew.kempczynski@intel.com
References: <20260424042457.2178562-1-s.sebinraj@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260424042457.2178562-1-s.sebinraj@intel.com>
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

Hi S,
On 2026-04-24 at 09:54:57 +0530, S Sebinraj wrote:

I forgot one more nit, see below.

> Add a new subtest threads-wq-stress-rebind-bindexecqueue that stresses
> the VM rebind path under workqueue CPU pool migration pressure.
> 
> The test spawns per-engine threads that continuously perform VM unbind/
> rebind cycles using per-slot bind exec queues, while a helper child
> process rapidly cycles the global unbound workqueue cpumask through
> progressively wider CPU sets (f -> ff -> fff -> ffff) at 100ms intervals.
> 
> A new WQ_STRESS flag enables timed fence waits in test_legacy_mode at
> three syncobj_wait() checkpoints (per-exec-queue, bind-chain, and unbind/
> TLB-invalidation fences) using a 5-second deadline. If any fence misses
> the deadline, a shared atomic is set and all threads bail out immediately
> rather than running for the full 30-second window.
> 
> All GPU work runs in a forked child that writes its result via a pipe,
> the parent polls with a 60-second timeout and restores the original
> cpumask regardless of outcome.
> 
> When a hang is detected the child drops the kernel page cache
> and issues xe_force_gt_reset_all() to unblock any DMA fences still
> pending from the stress run, then writes the hang result and calls
> _exit() immediately without closing the DRM fd. Closing the fd while GPU
> work is stuck would block indefinitely in dma_resv_wait_timeout(intr=false,
> TASK_UNINTERRUPTIBLE). For the same reason, GPU resource teardown
> (exec queues, BOs, VMs) is skipped in test_legacy_mode when a hang
> is detected.
> 
> On the failure path the test is aborted, as the process (child) gets into
> a D+ state (hung) and may affect other tests if marked as fail alone. So
> aborting would mean forcing a reboot in testing environment.
> 
> A bug of same signature regressed in Xe driver, where the whole system
> hung due to a fencing signal not completing, which was finaly
> traced to an issue in the kernel workqueue scheduling.
> Hard reboot was the only way to bring the system back to work.
> https://patchwork.freedesktop.org/patch/715805/
> 
> v2:
> - Abort the hung test instead of marking as fail alone
> - Code Comment corrections
> - Fix type casting
> - Write check for cpumask
> 
> v3:
> - Rename title of commit
> - Correct commenting style
> 
> Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
> Cc: Santa Carlos <carlos.santa@intel.com>

This should be:

Cc: Carlos Santa <carlos.santa@intel.com>

Regards,
Kamil

> Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
> ---
>  tests/intel/xe_exec_threads.c | 334 +++++++++++++++++++++++++++++++++-
>  1 file changed, 327 insertions(+), 7 deletions(-)

[cut]
