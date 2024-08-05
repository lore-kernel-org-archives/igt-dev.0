Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FDA9C3DA7F
	for <igt-dev@archiver.kernel.org>; Mon,  5 Aug 2024 11:24:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 260E610E1AB;
	Mon,  5 Aug 2024 11:24:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TGB6O71O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F47D10E149;
 Mon,  5 Aug 2024 11:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722857072; x=1754393072;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Oc8RGWVoRcO1wvhlFvDd6jMO0f0urfrUijecVtjTrmw=;
 b=TGB6O71OZuCarXkmfwlONtDDzGpZmxXdAMdFMJpKFLIUbYyX6x+s4epB
 hpmGH8l2rJ5Cym7KldzQYgAW/V11TnHfQtVMrMXic0Y7E04ft1pw4Wp0C
 DWj/cK48qz/BJdP1YdLKqsVhsHlDFoH9xWNoIcnZzIqHmPzpfQo0iK+Go
 gHD0gaZyivdUBx6HBSurhB5hWSgp1IM/3hNtspNnUL/a4odz98LTHztfX
 rSNd5Exeqn3YLgKwLqcR4eWLQr9NANLdt+6H91xdWA53kIkElfYbHg2t3
 jC5hxNd3xgcEVdQcqMLTImfb7AfgCxvItdpuu9OlBNkFXRLNknpNxDu3m g==;
X-CSE-ConnectionGUID: ONAwjXldToKPYaLmWBlGOg==
X-CSE-MsgGUID: a06JOYYCSAKC49QSSe9NzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="20393793"
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="20393793"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 04:24:29 -0700
X-CSE-ConnectionGUID: TfldJouxT4KNONN4WDZiMQ==
X-CSE-MsgGUID: fyH0efXaSbe1WgHFPS3DhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="56230539"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 04:24:27 -0700
Date: Mon, 5 Aug 2024 13:24:09 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: john.c.harrison@intel.com, I915-ci-infra@lists.freedesktop.org,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJBVA==?= =?utf-8?Q?=3A?= failure for
 Update hwconfig table tests
Message-ID: <20240805112409.b6uuxtl2vwx7gapy@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, john.c.harrison@intel.com,
 I915-ci-infra@lists.freedesktop.org,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
References: <20240801195129.3667206-1-John.C.Harrison@Intel.com>
 <172254541206.489091.720083550977019884@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <172254541206.489091.720083550977019884@2413ebb6fbb6>
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

Hi igt-dev,
On 2024-08-01 at 20:50:12 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Update hwconfig table tests
> URL   : https://patchwork.freedesktop.org/series/136812/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_15170 -> IGTPW_11519
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11519 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11519, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11519/index.html
> 
> Participating hosts (42 -> 42)
> ------------------------------
> 
>   Additional (1): fi-bsw-n3050 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11519:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@runner@aborted:
>     - fi-bsw-n3050:       NOTRUN -> [FAIL][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11519/fi-bsw-n3050/igt@runner@aborted.html
> 

This is unrelated, there was kernel lockdep found by
igt_runner before any test could start.

From https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11519/fi-bsw-n3050/boot0.txt

<4>[   25.121621] ======================================================
<4>[   25.122889] WARNING: possible circular locking dependency detected
<4>[   25.124157] 6.11.0-rc1-CI_DRM_15170-gd1ec20e149fc+ #1 Not tainted
<4>[   25.125425] ------------------------------------------------------
<4>[   25.126708] rc.local/608 is trying to acquire lock:
<4>[   25.127989] ffff8881025b8670 (&q->limits_lock){+.+.}-{3:3}, at: queue_max_discard_sectors_store+0x8e/0x110
<4>[   25.129338] 
                  but task is already holding lock:
<4>[   25.131965] ffff8881025b8550 (&q->sysfs_lock){+.+.}-{3:3}, at: queue_attr_store+0x45/0x90
<4>[   25.133332] 
		which lock already depends on the new lock.
<4>[   25.137379] 
		the existing dependency chain (in reverse order) is:
<4>[   25.140115] 
		-> #2 (&q->sysfs_lock){+.+.}-{3:3}:
<4>[   25.142862]        lock_acquire+0xd1/0x2f0
<4>[   25.144242]        __mutex_lock+0x98/0xd40

<4>[   25.225480] 
                   *** DEADLOCK ***

<4>[   25.228528] 4 locks held by rc.local/608:
<4>[   25.229552]  #0: ffff88810275c3f0 (sb_writers#5){.+.+}-{0:0}, at: ksys_write+0x64/0xe0
<4>[   25.230627]  #1: ffff88810f0b5c88 (&of->mutex#2){+.+.}-{3:3}, at: kernfs_fop_write_iter+0xf8/0x1d0
<4>[   25.231711]  #2: ffff8881026a1cd0 (kn->active#107){.+.+}-{0:0}, at: kernfs_fop_write_iter+0x100/0x1d0
<4>[   25.232812]  #3: ffff8881025b8550 (&q->sysfs_lock){+.+.}-{3:3}, at: queue_attr_store+0x45/0x90

<4>[   25.236067] CPU: 1 UID: 0 PID: 608 Comm: rc.local Not tainted 6.11.0-rc1-CI_DRM_15170-gd1ec20e149fc+ #1

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11519 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@i915_selftest@live@hangcheck:
>     - bat-arls-2:         [PASS][2] -> [DMESG-WARN][3] ([i915#11349] / [i915#11378])
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15170/bat-arls-2/igt@i915_selftest@live@hangcheck.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11519/bat-arls-2/igt@i915_selftest@live@hangcheck.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_lmem_swapping@basic@lmem0:
>     - bat-dg2-9:          [FAIL][4] ([i915#10378]) -> [PASS][5]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15170/bat-dg2-9/igt@gem_lmem_swapping@basic@lmem0.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11519/bat-dg2-9/igt@gem_lmem_swapping@basic@lmem0.html
> 
>   
>   [i915#10378]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378
>   [i915#11349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349
>   [i915#11378]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11378
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7951 -> IGTPW_11519
> 
>   CI-20190529: 20190529
>   CI_DRM_15170: d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11519: 11519
>   IGT_7951: 7951
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11519/index.html
