Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADFCECCA470
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 11:55:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51ADC10E7D8;
	Wed,  8 Oct 2025 11:55:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SGSC4S/I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAA3910E11A;
 Wed,  8 Oct 2025 11:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759924548; x=1791460548;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1POar0Wj74f7qSmPXipPAz+RXKpJelMurFgI3HqQNVw=;
 b=SGSC4S/IfevVVP/4nZmp30f98wGf/f1VE4XdRSHzEu6qXEg286/HeB6q
 C92zj3h/uMXC7TLejDp0aEcHEDiHOOLBMG3fU0GpO4ptG7pK30CjPkcsl
 z425QOYJveYRIcL5AwmHi1rs9FHpLsA7NS/ax4n+yzpBm0hkTiluiNXyv
 NF+5uKrHHHeHV4hCAcutNmUYVpuF1ep+0Q7tqDygyPYgwf/V299YPsoDd
 kAN7InVwi1GkYpeLUIQZkLV8eCPRXjhe9dnoGHVGWGpwU7D5yGyLr8Mcp
 N3aeVmd9Q3ST4iowYCUy4ZkPI337rUOBcNwQDVwxqx2GH+WCswKhfkok8 g==;
X-CSE-ConnectionGUID: O/ULtpCRRniSCpf0jd6UEg==
X-CSE-MsgGUID: Bv5ZTD4YS2qoS52IKYZOBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="49671903"
X-IronPort-AV: E=Sophos;i="6.19,323,1754982000"; d="scan'208";a="49671903"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 04:55:47 -0700
X-CSE-ConnectionGUID: v3tOx+8aRGy/dGyxqGTEEw==
X-CSE-MsgGUID: iZnThIz8TiWwpXIUESrETg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,323,1754982000"; d="scan'208";a="180834216"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.244.124])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 04:55:46 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: I915-ci-infra@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Subject: Re: =?UTF-8?B?4pyX?= i915.CI.Full: failure for tests/syncobj_timeline:
 Exercise signaling of awaited points (rev3)
Date: Wed, 08 Oct 2025 13:55:44 +0200
Message-ID: <18925748.sWSEgdgrri@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <175991232048.16773.5200182812065395164@6aec98b87f92>
References: <20251007152315.3403250-2-janusz.krzysztofik@linux.intel.com>
 <175991232048.16773.5200182812065395164@6aec98b87f92>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

Hi I915-ci-infra@lists.freedesktop.org,

On Wednesday, 8 October 2025 10:32:00 CEST Patchwork wrote:
> == Series Details ==
> 
> Series: tests/syncobj_timeline: Exercise signaling of awaited points (rev3)
> URL   : https://patchwork.freedesktop.org/series/154590/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_17323_full -> IGTPW_13867_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_13867_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_13867_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13867/index.html
> 
> Participating hosts (12 -> 12)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_13867_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_workarounds@suspend-resume-context:
>     - shard-dg2:          [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17323/shard-dg2-4/igt@gem_workarounds@suspend-resume-context.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13867/shard-dg2-10/igt@gem_workarounds@suspend-resume-context.html
> 
>   * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-2-size-256:
>     - shard-rkl:          NOTRUN -> [FAIL][3] +3 other tests fail
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13867/shard-rkl-8/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-2-size-256.html

The above failures have nothing to do with new subtests introduced by the 
change in scope of this pre-merge testing.  Please update filters and re-
report.

Thanks,
Janusz

> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_17323_full and IGTPW_13867_full:
> 
> ### New IGT tests (14) ###
> 
>   * igt@gem_render_copy@y-tiled-to-vebox-x-tiled@smem:
>     - Statuses : 3 pass(s)
>     - Exec time: [0.08, 0.11] s
> 
>   * igt@gem_render_copy@y-tiled@smem:
>     - Statuses : 5 pass(s)
>     - Exec time: [0.07, 0.22] s
> 
>   * igt@syncobj_timeline@stress-enable-all-signal-all-backward:
>     - Statuses : 6 pass(s)
>     - Exec time: [10.86, 12.79] s
> 
>   * igt@syncobj_timeline@stress-enable-all-signal-all-forward:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@syncobj_timeline@stress-enable-all-signal-all-random:
>     - Statuses : 7 pass(s)
>     - Exec time: [10.15, 10.73] s
> 
>   * igt@syncobj_timeline@stress-enable-all-signal-backward:
>     - Statuses : 5 pass(s) 1 skip(s)
>     - Exec time: [3.73, 10.64] s
> 
>   * igt@syncobj_timeline@stress-enable-all-signal-forward:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.86, 3.79] s
> 
>   * igt@syncobj_timeline@stress-enable-all-signal-random:
>     - Statuses : 7 pass(s)
>     - Exec time: [1.00, 3.92] s
> 
>   * igt@syncobj_timeline@stress-wait-last-signal-all-backward:
>     - Statuses : 6 pass(s)
>     - Exec time: [10.22, 10.98] s
> 
>   * igt@syncobj_timeline@stress-wait-last-signal-all-forward:
>     - Statuses : 6 pass(s)
>     - Exec time: [10.18, 10.57] s
> 
>   * igt@syncobj_timeline@stress-wait-last-signal-all-random:
>     - Statuses : 6 pass(s)
>     - Exec time: [10.23, 10.65] s
> 
>   * igt@syncobj_timeline@stress-wait-last-signal-backward:
>     - Statuses : 5 pass(s)
>     - Exec time: [0.85, 1.83] s
> 
>   * igt@syncobj_timeline@stress-wait-last-signal-forward:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.81, 1.85] s
> 
>   * igt@syncobj_timeline@stress-wait-last-signal-random:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.90, 3.58] s
> 
>   
> 
> Known issues
> ------------
...



