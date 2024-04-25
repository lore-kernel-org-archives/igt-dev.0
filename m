Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F158C4345F
	for <igt-dev@archiver.kernel.org>; Thu, 25 Apr 2024 17:15:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 192C411A688;
	Thu, 25 Apr 2024 17:15:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DCtP5vYk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1511E11A688
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2024 17:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714065347; x=1745601347;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KpxHUPtWF+u5bRA2/9rsZZ64sateJL39TBTn3L20tTQ=;
 b=DCtP5vYk7g76OWxNYkat/Nz1/sO90CxVIWOxRjCfbsRwu50mOt6uxvKz
 hYrDVCA5Nfk2HKrZiUSe9g5Lxv+a80a/LVsxVwbvE/A1J27/6UqeRTMfe
 oe4xBTg4gLTb4kAyEYkhTrQ+Cg5NUDQO6F4OBVksE2ylZn+EhhpkEhICl
 alAIX05PV3KHuiSgT3Dx/xHirW6W3wVnJHlBCQbwh4l5m/Did6QzzyBvP
 FxslpSKjuD2/gVn5VN/iS2yTEbObZsxJmrWKcbwvpJXnIZRo8I0eJHi4p
 D4rOu4Bhv+IGCf48CZPvmE5CHZJE+SdjXkq/A1foe0nKc+MaO/ZU08fh7 g==;
X-CSE-ConnectionGUID: OXWunHzHTvmGeuNEycbOQg==
X-CSE-MsgGUID: QBQjVGFiQpeOgo9LvB+yJQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="13555492"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; d="scan'208";a="13555492"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 10:15:46 -0700
X-CSE-ConnectionGUID: rEerW3TuS2qjz/OwZpNlhQ==
X-CSE-MsgGUID: EOiiFmZHSUShSwGwwFEHlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; d="scan'208";a="48385131"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 10:15:43 -0700
Date: Thu, 25 Apr 2024 19:15:41 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>,
 Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
Subject: Re: [PATCH i-g-t v2 08/16] tests/intel: Introduce SysMan Mega feature
Message-ID: <20240425171541.dlf3rtaqbtfu5bru@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>,
 Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
References: <20240423104913.3559587-1-katarzyna.piecielska@intel.com>
 <20240423104913.3559587-9-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240423104913.3559587-9-katarzyna.piecielska@intel.com>
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

Hi Katarzyna,
On 2024-04-23 at 10:49:05 +0000, Katarzyna Piecielska wrote:
> Add tests to SysMan mega feature.
> Group:
> 	SUBTEST
> 	Description
> 	Category
> 	Mega feature
> 	Sub-category
> 	Functionality
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Aditya Chauhan <aditya.chauhan@intel.com>
> Cc: Girotra Himanshu <himanshu.girotra@intel.com>
> CC: Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
> ---
>  tests/device_reset.c                   | 3 ++-

'reset' is both in Functionality and Sub-Category:

grep -E -i ':.*reset' n.*
n.Functionality:../tests/device_reset.c: * Functionality: sysfs reset
n.Functionality:../tests/intel/gem_eio.c: * Functionality: reset
n.Functionality:../tests/intel/gem_reset_stats.c: * Functionality: reset
n.Functionality:../tests/intel/i915_selftest.c: * Functionality: engine/GT reset
n.Functionality:../tests/intel/xe_exec_reset.c: * Functionality: reset

n.Sub-category:../tests/device_reset.c: * Sub-category: Reset
n.Sub-category:../tests/intel/i915_selftest.c: * Sub-category: Reset

Regards,
Kamil

>  tests/intel/sysfs_heartbeat_interval.c | 7 ++++---
>  tests/intel/sysfs_preempt_timeout.c    | 7 ++++---
>  tests/intel/sysfs_timeslice_duration.c | 7 ++++---
>  tests/intel/xe_sysfs_defaults.c        | 6 ++++--
>  tests/intel/xe_sysfs_scheduler.c       | 3 ++-
>  6 files changed, 20 insertions(+), 13 deletions(-)
> 
> diff --git a/tests/device_reset.c b/tests/device_reset.c
> index de1a8a87b..9f77d0fce 100644
> --- a/tests/device_reset.c
> +++ b/tests/device_reset.c
> @@ -38,7 +38,8 @@
>   *   Unbinds driver from device, initiates reset then rebinds driver to device
>   *   validating device resets
>   * Category: Infrastructure
> - * Sub-category: SysMan
> + * Mega feature: SysMan
> + * Sub-category: SysMan tests
>   * Feature: reset, sriov-reset
>   */
>  
> diff --git a/tests/intel/sysfs_heartbeat_interval.c b/tests/intel/sysfs_heartbeat_interval.c
> index 5f82185bc..0af8879f6 100644
> --- a/tests/intel/sysfs_heartbeat_interval.c
> +++ b/tests/intel/sysfs_heartbeat_interval.c
> @@ -43,11 +43,12 @@
>  #include "sw_sync.h"
>  /**
>   * TEST: sysfs heartbeat interval
> - * Feature: SMI, cmd_submission
> - * Test category: SysMan
> - * Sub-category: SysMan
>   * Category: Desktop \ Server
> + * Mega feature: SysMan
> + * Sub-category: SysMan tests
>   * Functionality: sysfs heartbeat
> + * Feature: SMI, cmd_submission
> + * Test category: SysMan
>   *
>   * SUBTEST: idempotent
>   * Description: Test to check whether the heartbeat parameter reports the values set.
> diff --git a/tests/intel/sysfs_preempt_timeout.c b/tests/intel/sysfs_preempt_timeout.c
> index 84f8ba7d3..88f2cdfcd 100644
> --- a/tests/intel/sysfs_preempt_timeout.c
> +++ b/tests/intel/sysfs_preempt_timeout.c
> @@ -42,11 +42,12 @@
>  #include "sw_sync.h"
>  /**
>   * TEST: sysfs preempt timeout
> - * Feature: SMI, context
> - * Test category: SysMan
> - * Sub-category: SysMan
>   * Category: Desktop \ Server
> + * Mega feature: SysMan
> + * Sub-category: SysMan tests
>   * Functionality: sysfs preempt timeout
> + * Feature: SMI, context
> + * Test category: SysMan
>   *
>   * SUBTEST: idempotent
>   * Description: Test to check whether the preempt_timeout parameter reports the
> diff --git a/tests/intel/sysfs_timeslice_duration.c b/tests/intel/sysfs_timeslice_duration.c
> index b48152ecc..6baa000df 100644
> --- a/tests/intel/sysfs_timeslice_duration.c
> +++ b/tests/intel/sysfs_timeslice_duration.c
> @@ -45,11 +45,12 @@
>  #include "sw_sync.h"
>  /**
>   * TEST: sysfs timeslice duration
> + * Category: Desktop \ Server
> + * Mega feature: SysMan
> + * Sub-category: SysMan tests
> + * Functionality: timeslise sysfs
>   * Feature: SMI, cmd_submission
>   * Test category: SysMan
> - * Functionality: timeslise sysfs
> - * Sub-category: SysMan
> - * Category: Desktop \ Server
>   *
>   * SUBTEST: duration
>   * Description: Test to measure the timeslice duration by watching the
> diff --git a/tests/intel/xe_sysfs_defaults.c b/tests/intel/xe_sysfs_defaults.c
> index fd7dea77b..5c5db71a4 100644
> --- a/tests/intel/xe_sysfs_defaults.c
> +++ b/tests/intel/xe_sysfs_defaults.c
> @@ -5,12 +5,14 @@
>  
>  /**
>   * TEST: xe sysfs defaults
> + * Description: check if the sysfs engine .defaults node has all values.
>   * Category: Infrastructure
> + * Mega feature: SysMan
> + * Sub-category: SysMan tests
>   * Functionality: sysman defaults
> - * Sub-category: SysMan
>   * Test category: functionality test
> + *
>   * SUBTEST: engine-defaults
> - * Description: check if the sysfs engine .defaults node has all values.
>   */
>  
>  #include <dirent.h>
> diff --git a/tests/intel/xe_sysfs_scheduler.c b/tests/intel/xe_sysfs_scheduler.c
> index d1ef422f4..5c4fb1114 100644
> --- a/tests/intel/xe_sysfs_scheduler.c
> +++ b/tests/intel/xe_sysfs_scheduler.c
> @@ -6,7 +6,8 @@
>  /**
>   * TEST: xe sysfs scheduler
>   * Category: Infrastructure
> - * Sub-category: SysMan
> + * Mega feature: SysMan
> + * Sub-category: SysMan tests
>   * Functionality: scheduler control interface
>   *
>   * SUBTEST: %s-invalid
> -- 
> 2.34.1
> 
