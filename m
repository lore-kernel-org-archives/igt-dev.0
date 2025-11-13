Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED3BCD5BC2
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 10:54:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 683E010E632;
	Thu, 13 Nov 2025 10:54:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XzU26tDY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C235110E0DB;
 Thu, 13 Nov 2025 10:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763031290; x=1794567290;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NLGKjCkjs80QQRDWQCYn4fu1CceljbotsEGACBjs04w=;
 b=XzU26tDY1LSIrhKcVxmog3lCDDYfAtvS6iycCkk3dXpcA2iUnwlgkX1i
 6QzuxeOfJ4JBi8lHFRJ3/ESKvQmFW1T1rS0zRpn6hPjIKQ7CZ0Olvztoz
 EVHftMt/7YN3K8vA0P3EdpX/sLVWPVaB0ozhNOFaA5svtpSo6bz3DPOFG
 81hQdMrGYMYwcdUhRlZnG8k1bKaibgW59Qr5RXPOwnwDAWZB/BboR8myv
 ZdkpvutMMREZG5ew71/oXa1qMIFy1R73g8gNHXrnYpglSmZnGfayU1ka5
 tb9ij6SFPVic0/3uiOWQWymLbHFo+QGLuh4+m1IVpxY7dwBFzJ0RJGgc1 g==;
X-CSE-ConnectionGUID: TGO3BueqS7WL5Iw5UgCBXw==
X-CSE-MsgGUID: ibVEvHcRQmqfZCPElq+aLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="65266030"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="65266030"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 02:54:49 -0800
X-CSE-ConnectionGUID: C8LZJCEYTHKfR18gHdBj4A==
X-CSE-MsgGUID: cUM9Xz1RQeKbZ0AqONf5iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="194641480"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 02:54:49 -0800
Date: Thu, 13 Nov 2025 11:54:33 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 intel-ci: Block Panthor testing
Message-ID: <20251113105433.zzheskuu4kqyxk6r@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20251112162834.12305-1-kamil.konieczny@linux.intel.com>
 <176301567207.48346.15483692506560070019@10055242dc62>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <176301567207.48346.15483692506560070019@10055242dc62>
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
On 2025-11-13 at 06:34:32 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: intel-ci: Block Panthor testing
> URL   : https://patchwork.freedesktop.org/series/157442/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8622_full -> IGTPW_14045_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_14045_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_14045_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14045/index.html
> 
> Participating hosts (11 -> 11)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_14045_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:
>     - shard-dg2:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8622/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14045/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html
> 
>   * igt@perf_pmu@idle@rcs0:
>     - shard-mtlp:         [PASS][3] -> [ABORT][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8622/shard-mtlp-6/igt@perf_pmu@idle@rcs0.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14045/shard-mtlp-6/igt@perf_pmu@idle@rcs0.html
> 

Unrelated, no need for retest.

>   
> New tests
> ---------
> 
>   New tests have been introduced between IGT_8622_full and IGTPW_14045_full:
> 
> ### New IGT tests (23) ###
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [8.07] s
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [6.99] s
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [7.23] s
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [7.27] s
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.00] s
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-2:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.00] s
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.00] s
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.86] s
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.65] s
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.56] s
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.57] s
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [16.64] s
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [16.95] s
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [17.00] s
> 
>   * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-2:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-b-hdmi-a-2:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@perf_pmu@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@perf_pmu@fbc-2p-scndscrn-cur-indfb-draw-blt:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@perf_pmu@plane-primary-toggle-with-vblank-wait:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@perf_pmu@single-bo:
>     - Statuses :
>     - Exec time: [None] s
> 

Above was not introduced by this patch.

Regards,
Kamil

>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_14045_full that come from known issues:
> 
