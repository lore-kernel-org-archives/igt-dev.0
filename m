Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E101EC83F25
	for <igt-dev@archiver.kernel.org>; Mon, 21 Jul 2025 10:26:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88ABE10E4D1;
	Mon, 21 Jul 2025 10:26:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aqY2Xvu9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7159610E4D1
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Jul 2025 10:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753093559; x=1784629559;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=iVM8RmLuRyUo12g9sX9gDl+jGaXv5jyS82rY8TlxjJk=;
 b=aqY2Xvu98SZisTzo+mmz9uSdwYIJPQ80Ry0ODG15tmDYs7pWwgSBLmXw
 iID7OryK7RlTkwaIdBKVt5qROEYpbNlYSyvIP3PvixflL5kszhNBwcvkk
 CDnCfIRWjhk2JmuSrJ+9IFgUJy3dvPyF06l9h0VkmG5QbziDZQmgZpaHO
 7gFxuC8+5R3yA7m/ntjkYw+l7iObt3Z4B3OCmGe9Up5Oe+92+WiAKa5Fa
 HcrRKTRBvARMGYlv/0KC6rvLFipokapdIAVuuvrEvRWwGjtRqrOtmE6pp
 L2gjOyBhRHo32s7WxsXBCzlF+MMBpLHsDHP2JusVAB5+dfLMmV4NYu/gt w==;
X-CSE-ConnectionGUID: Z8Sj465dQS2OATEqFdo9JQ==
X-CSE-MsgGUID: ZHYewF4mTnW1m+YK6KmKBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11498"; a="59096601"
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; d="scan'208";a="59096601"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 03:25:59 -0700
X-CSE-ConnectionGUID: r5EqrUFtSryZQSqfscxl0w==
X-CSE-MsgGUID: P5Wtw5EbQYuGyAbjrL+X9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; d="scan'208";a="163350352"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 03:25:57 -0700
Date: Mon, 21 Jul 2025 12:25:40 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVy?= =?utf-8?Q?e?= for
 Fix follow_symlinks meson error and few other warns
Message-ID: <20250721102540.vnrmggueqjaqxy2b@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250718151521.105886-1-kamil.konieczny@linux.intel.com>
 <175291438321.174783.14100225060688215652@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <175291438321.174783.14100225060688215652@1538d3639d33>
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
On 2025-07-19 at 08:39:43 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Fix follow_symlinks meson error and few other warns
> URL   : https://patchwork.freedesktop.org/series/151819/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_16893_full -> IGTPW_13496_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_13496_full absolutely need to be
>   verified manually.

Unrelated, these are only touching meson.build files.

Regards,
Kamil

>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_13496_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13496/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_13496_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_eio@kms:
>     - shard-dg2:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16893/shard-dg2-5/igt@gem_eio@kms.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13496/shard-dg2-4/igt@gem_eio@kms.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * {igt@kms_pipe_stress@stress-xrgb8888-4tiled}:
>     - shard-rkl:          [SKIP][3] ([i915#14544]) -> [SKIP][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16893/shard-rkl-6/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13496/shard-rkl-4/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html
> 
>   * {igt@kms_pipe_stress@stress-xrgb8888-yftiled}:
>     - shard-dg2-9:        NOTRUN -> [SKIP][5]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13496/shard-dg2-9/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
>     - shard-rkl:          NOTRUN -> [SKIP][6]
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13496/shard-rkl-8/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_16893_full and IGTPW_13496_full:
> 
> ### New IGT tests (78) ###
> 
>   * igt@kms_big_fb@128x128-right-edge:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@2x-absolute-wf_vblank:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@2x-dpms-vs-vblank-race:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@2x-nonblocking-modeset-vs-cursor-atomic:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@2x-nonexisting-fb:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@add-remove-objects:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@addfb25-y-tiled-small-legacy:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@atomic-fastset:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@bad-destroy:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@bad-rotation-90-4-tiled-lnl-ccs:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@basic-each:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@basic-flip-before-cursor-legacy:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@basic-write:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@basics:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@blt-vs-render-ctx0:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@busy:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@busy-fence:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@crc-primary-suspend-4-tiled-mtl-rc-ccs:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@create-invalid-size:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@ctrl-surf-copy:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@cursor-offscreen-128x42:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@cursor-onscreen-max-size:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@cursor-sliding-128x42:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@debugfs-read:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@drm_format_helper:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@etime-multi-wait-available-unsubmitted:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@etime-multi-wait-for-submit-unsubmitted:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@fbc-2p-primscrn-pri-shrfb-draw-pwrite:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@fbc-psr2-cursor-plane-move:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@fbcpsr-1p-primscrn-indfb-msflip-blt:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@fbcpsr-2p-pri-indfb-multidraw:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@fbcpsr-2p-scndscrn-spr-indfb-move:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@flip-vs-cursor-toggle:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@hog:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@hostile:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@invalid-oa-format-id:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@invalid-properties-atomic:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@larger-than-life-batch:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@lease-invalid-connector:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@memory-info-resident:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@modeset-transition-fencing:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@modeset-vs-vblank-race-interruptible:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@module-unload:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@multi-wait-all-available-submitted:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@multi-wait-for-submit-unsubmitted-submitted:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@none:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@offset-control:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@plane-scaler-with-clipping-clamping-pixel-formats:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@pr-cursor-plane-move-continuous-sf:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@pr-cursor-plane-onoff:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@pr-overlay-plane-move-continuous-exceed-sf:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@pr-sprite-mmap-gtt:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@primary-y-tiled-reflect-x-0:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@psr-1p-offscren-pri-shrfb-draw-mmap-cpu:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@psr-2p-primscrn-cur-indfb-draw-mmap-gtt:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@psr-2p-primscrn-spr-indfb-onoff:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@psr-2p-scndscrn-indfb-plflip-blt:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@random-ccs-data-4-tiled-mtl-rc-ccs:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@saturated-hostile-nopreempt:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@short-buffer-wakeup:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@signal-array:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@single-buffer-flip-vs-dpms-off-vs-modeset:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@small-bo:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@static-toggle:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@sync_multi_timeline_wait:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@syncobj-backward-timeline-chain-engines:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@syncobj-import:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@test-cursor:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@test_refcounting:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@tiling-x:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@wait-all-for-submit-delayed-submit:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@wait-for-submit-snapshot:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@wf_vblank-ts-check:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@y-tiled-mc-ccs-to-y-tiled-ccs:
>     - Statuses :
>     - Exec time: [None] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_13496_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@blit-reloc-purge-cache:
>     - shard-dg2-9:        NOTRUN -> [SKIP][7] ([i915#8411])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13496/shard-dg2-9/igt@api_intel_bb@blit-reloc-purge-cache.html
> 

...cut...

