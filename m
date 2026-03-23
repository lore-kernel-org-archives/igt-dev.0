Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF0F0F483D7
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 19:21:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8923910E475;
	Mon, 23 Mar 2026 19:21:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IpHt75ah";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD15310E475;
 Mon, 23 Mar 2026 19:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774293710; x=1805829710;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WiNicx90NzimiGjqOd9J1HQXr3rw2OUkSpNkZdBbA3U=;
 b=IpHt75ah7j9fTtR+O3Mq2claovMM0HkBA5KN4Snc263xXfWjVYRDam+x
 Re3BZrDANh7lkve/cAfiUkw6MjH/2tVrU52LkXTsCoGv7+X0zyTdLsRM+
 6/bqJxNyt1TBuA2OdErhLaMnw6t7XyzbirWPt2pX2LLZmLUWwrcuGgP0X
 VVFzrxCdtTTLxczGUGlhh+K0lWC9xNioxDgM+lZx3Z4NY9Sf1A3QAJCE7
 D37b3RDZBhqb6IRxu0cge6VPUyBmqUaur1UtYCS36g23qwf8KFRQapOvQ
 QmVZ+pupPxdAQi6yKl+XUkyR8hfBrUMuI3VycwbKEQyTzKKLx9YBzUSv3 A==;
X-CSE-ConnectionGUID: x+m96PfZTbyy9+pB1/E4Cw==
X-CSE-MsgGUID: BgB6hqm+QWagJK5kISJIiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75421089"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="75421089"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 12:21:50 -0700
X-CSE-ConnectionGUID: ywvCzJHqS5CCa2kJbi9qaQ==
X-CSE-MsgGUID: 7brg54DCSq2mYYCuUZoC0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="223186375"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 12:21:49 -0700
Date: Mon, 23 Mar 2026 20:21:46 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Renjun Wang <renjunw0@foxmail.com>, I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests=2Fk?=
 =?utf-8?Q?ms=5Fplane?= =?utf-8?Q?=3A?= Allow planar-pixel-format-settings to
 pass on VKMS (rev3)
Message-ID: <20260323192146.3had762s5qgt4jdq@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Renjun Wang <renjunw0@foxmail.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20260320101606.22163-1-kamil.konieczny@linux.intel.com>
 <177406781294.383016.7338929155033493841@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <177406781294.383016.7338929155033493841@a3b018990fe9>
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
On 2026-03-21 at 04:36:52 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/kms_plane: Allow planar-pixel-format-settings to pass on VKMS (rev3)
> URL   : https://patchwork.freedesktop.org/series/161064/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_18181_full -> IGTPW_14821_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_14821_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_14821_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14821/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_14821_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1:
>     - shard-snb:          NOTRUN -> [ABORT][1] +1 other test abort
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14821/shard-snb6/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html
> 
>   * igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-2-size-64:
>     - shard-rkl:          NOTRUN -> [FAIL][2] +3 other tests fail
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14821/shard-rkl-7/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-2-size-64.html
> 

Unrelated.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_14821_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@object-reloc-keep-cache:
>     - shard-dg2:          NOTRUN -> [SKIP][3] ([i915#8411])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14821/shard-dg2-8/igt@api_intel_bb@object-reloc-keep-cache.html
> 
...cut...
