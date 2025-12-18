Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9F9D6ACFB
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 13:16:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 343A610E404;
	Thu, 18 Dec 2025 13:16:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CHCEobQ/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B990410E108;
 Thu, 18 Dec 2025 13:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766063806; x=1797599806;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QB0U6Y2y98pXWOupKRUrIDOaYN0SuswuJQLfZWWEXIw=;
 b=CHCEobQ/mA2uBA6jw7gvfzT/QBpUlfWuLsaBaxfGJznUF8vnMJkjXIlM
 NtYhA+154r8kxO6yLZfNY+eo1YtzHUiNxdNYGSshyxj6nlrkNlbloax/5
 8rzh7xcNE13vUOuUr2GjRMMtOid1YmLn1uFjZflmCUPBz+h3GpIEPGd17
 7T3rWNkhDAR+gzMeB6ohtZlCCdtx02WPG6TE8SJm+ESAGdXk1Gp/6wyBf
 bFkk2Ia+lHo6Zf1Kc6ZBVQTQLE5+NAvjzL4rb7Mqq9puW0Qb+csbHjF5D
 Xl5Y+n46N9x9qKUGrNShJjL5AfK4WmjgAMrp2wq9v+MEwGwBFQZ0xiBw6 g==;
X-CSE-ConnectionGUID: x4svGcCeS0i5vvaqIMqVhg==
X-CSE-MsgGUID: BHCK7YFTQNqgcJ7PB0ZmtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="78331383"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="78331383"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 05:16:45 -0800
X-CSE-ConnectionGUID: U0S4wP/mSr+iuyavo/Hrxg==
X-CSE-MsgGUID: pcY+gnZcR/GNWmQjchj25g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="198481888"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 05:16:44 -0800
Date: Thu, 18 Dec 2025 14:16:41 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 Panthor tests for huge partial unmaps (rev3)
Message-ID: <20251218131641.c2korjvhkwixnwnl@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20251217215909.710730-1-adrian.larumbe@collabora.com>
 <176602982520.98733.18404471541099896986@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <176602982520.98733.18404471541099896986@a3b018990fe9>
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
On 2025-12-18 at 03:50:25 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Panthor tests for huge partial unmaps (rev3)
> URL   : https://patchwork.freedesktop.org/series/158975/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_17699_full -> IGTPW_14232_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_14232_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_14232_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_14232_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@dpms-off-confusion-interruptible@a-hdmi-a1:
>     - shard-tglu:         [PASS][1] -> [DMESG-FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-tglu-7/igt@kms_flip@dpms-off-confusion-interruptible@a-hdmi-a1.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-5/igt@kms_flip@dpms-off-confusion-interruptible@a-hdmi-a1.html
> 
>   * igt@kms_flip@dpms-off-confusion-interruptible@b-hdmi-a1:
>     - shard-tglu:         [PASS][3] -> [ABORT][4] +1 other test abort
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-tglu-7/igt@kms_flip@dpms-off-confusion-interruptible@b-hdmi-a1.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-5/igt@kms_flip@dpms-off-confusion-interruptible@b-hdmi-a1.html
> 
>   * igt@kms_joiner@basic-big-joiner:
>     - shard-tglu:         NOTRUN -> [SKIP][5]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-tglu-2/igt@kms_joiner@basic-big-joiner.html
> 
>   * igt@sysfs_timeslice_duration@timeout@vecs0:
>     - shard-mtlp:         [PASS][6] -> [ABORT][7]
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17699/shard-mtlp-2/igt@sysfs_timeslice_duration@timeout@vecs0.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14232/shard-mtlp-3/igt@sysfs_timeslice_duration@timeout@vecs0.html

Unrelated, changes were in non-Intel Panthor tests.

Regards,
Kamil

> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_17699_full and IGTPW_14232_full:
> 
> ### New IGT tests (35) ###
> 
>   * igt@kms_flip@basic-write-read-noreloc:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_flip@busy-check-all:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_flip@display-4x:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_flip@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_flip@lease-uevent:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_flip@multi-wait-submitted:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_flip@plane-panning-bottom-right-suspend:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_flip@preservation:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_flip@psr-1p-primscrn-pri-shrfb-draw-pwrite:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_flip@stress-xrgb8888-xtiled:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_flip@stress-xrgb8888-xtiled@b-hdmi-a1:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_flip@yf-tiled-max-hw-stride-32bpp-rotate-180:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@sysfs_timeslice_duration@atomic-fastset:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@sysfs_timeslice_duration@basic-blt:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@sysfs_timeslice_duration@basic-crc-vgem:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@sysfs_timeslice_duration@cursor-alpha-transparent:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@sysfs_timeslice_duration@cursor-rapid-movement-128x128:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@sysfs_timeslice_duration@destroy-bb:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@sysfs_timeslice_duration@double-destroy:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@sysfs_timeslice_duration@fbc-1p-indfb-fliptrack-mmap-gtt:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@sysfs_timeslice_duration@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@sysfs_timeslice_duration@invalid-set-prop:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@sysfs_timeslice_duration@invalid-transfer-non-existent-point:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@sysfs_timeslice_duration@plane-position-covered:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@sysfs_timeslice_duration@pr-cursor-mmap-cpu:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@sysfs_timeslice_duration@psr-2p-scndscrn-pri-shrfb-draw-blt:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@sysfs_timeslice_duration@psr-cursor-render:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@sysfs_timeslice_duration@psr-rgb101010-draw-render:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@sysfs_timeslice_duration@secure-non-master:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@sysfs_timeslice_duration@single-wait-all-for-submit-signaled:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@sysfs_timeslice_duration@single-wait-for-submit-submitted:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@sysfs_timeslice_duration@sync_merge_invalid:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@sysfs_timeslice_duration@system-suspend-execbuf:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@sysfs_timeslice_duration@unprivileged-single-ctx-counters:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@sysfs_timeslice_duration@x-tiled-addfb:
>     - Statuses :
>     - Exec time: [None] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_14232_full that come from known issues:
> 
...cut...
