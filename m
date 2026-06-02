Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E46C5DF71
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jun 2026 06:30:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CAA410EC25;
	Tue,  2 Jun 2026 06:30:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EnMLwPHJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0107810EC24
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jun 2026 06:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780381782; x=1811917782;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=4+fNop7yn6TnUfbj9r+1nPMjX0QLCV0vx8aIeXn1xEM=;
 b=EnMLwPHJQZ88hyJnKK0YY5O9Y+lSgJTxNgm5gfa9yxWJaKbKl7L69onH
 UnnBLgv6yeXnARsQO7RE3Yx54Q8VoOvufRoiotrjFao0FBm9vTHB1PLtS
 ofrLEgBRA4MrzB1iqQMJJ1kwgm+7636abe1s7o9G2MUFgc5ggIK5Vr9vN
 JGHg2MghGR4exp6LjNaXzFyH1iggv7UgDhuMovxZUaVDK5IMffqkz4RTj
 NE783PxzGOzYplJSXTbX17yt6ySex5QILQcCz1VPZDvYxG0/SWLpYfBey
 7u2eGKeTc5FYsivm/nVpLIkaxU10fGJlgT9XFuAY9dcG41zrYu5baqn0V A==;
X-CSE-ConnectionGUID: 1i0cWh70TpSoy1mKwJQTMQ==
X-CSE-MsgGUID: HgEq8/czRjejX/ghKgcvIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="85014594"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; d="scan'208";a="85014594"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 23:29:41 -0700
X-CSE-ConnectionGUID: t9//s3s0TQe0DocIeBEDaw==
X-CSE-MsgGUID: TM5Y9crYTbiV2vSRGaL0CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; d="scan'208";a="242994372"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.207])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 23:29:41 -0700
Date: Tue, 2 Jun 2026 08:29:38 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 Add attachments support (rev3)
Message-ID: <abzrvinxuyva7mlw7554typmz2glvbqocojqjr62zui3npr7gs@2md6jmtezydl>
References: <20260601075143.187633-6-zbigniew.kempczynski@intel.com>
 <178034404922.32261.1135372036896901118@6beec6c84f66>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178034404922.32261.1135372036896901118@6beec6c84f66>
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

On Mon, Jun 01, 2026 at 08:00:49PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Add attachments support (rev3)                                  
>    URL:     https://patchwork.freedesktop.org/series/165230/                
>    State:   failure                                                         
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15276/index.html 
> 
>         CI Bug Log - changes from CI_DRM_18595_full -> IGTPW_15276_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_15276_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_15276_full, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15276/index.html
> 
> Participating hosts (11 -> 10)
> 
>    Missing (1): pig-kbl-iris
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_15276_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@dumb_buffer@create-clear:
> 
>           * shard-glk10: NOTRUN -> FAIL
>      * igt@kms_cursor_crc@cursor-sliding-64x64@pipe-d-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> ABORT
>      * igt@kms_draw_crc@draw-method-blt:
> 
>           * shard-glk: PASS -> DMESG-WARN +1 other test dmesg-warn

Above failures and dmesg warn are not related to the series.

--
Zbigniew

> 
> New tests
> 
>    New tests have been introduced between CI_DRM_18595_full and
>    IGTPW_15276_full:
> 
>   New IGT tests (90)
> 
>      * igt@kms_cursor_crc@2x-absolute-wf_vblank-interruptible:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@2x-flip-vs-suspend:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@2x-flip-vs-wf_vblank-interruptible:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@2x-tiling-4:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@atomic-invalid-params:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@bad-hsync-end:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@bad-pitch-63:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@basic-process:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@basic-write:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@cachelines:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@ccs-on-another-bo-y-tiled-gen12-mc-ccs:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@clock-too-high:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@coherency-gtt:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@cursora-vs-flipa-atomic-transitions:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@dc3co-vpb-simulation:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@draw-method-mmap-cpu:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@engines-cleanup:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@etime-multi-wait-all-available-unsubmitted-submitted:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@evict-prime:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@evict-prime@pipe-d-hdmi-a-3:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@export-vs-gem_close-race:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@fbc-1p-offscreen-pri-indfb-draw-mmap-cpu:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@fbc-2p-primscrn-pri-indfb-draw-blt:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@fbc-indfb-scaledprimary:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@fbcpsr-2p-primscrn-spr-indfb-draw-pwrite:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@fbcpsrhdr-2p-pri-indfb-multidraw:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@fbcpsrhdr-2p-primscrn-spr-indfb-draw-mmap-gtt:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@fbcpsrhdr-2p-scndscrn-shrfb-msflip-blt:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@fbcpsrhdr-slowdraw:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@flip-dpms:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@fork-simple-once:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@gem-execbuf:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@hdr-1p-primscrn-spr-indfb-fullscreen:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@hdr-2p-primscrn-shrfb-plflip-blt:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@hdr-2p-scndscrn-cur-indfb-draw-pwrite:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@hdr-rgb101010-draw-mmap-cpu:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@heavy-verify-multi-ccs:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@hw-rejects-pxp-buffer:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@in-flight-internal-immediate:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@invalid-signal-one-illegal-handle:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@invalid-wait-bad-flags:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@linear-addfb:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@linear-max-hw-stride-32bpp-rotate-180:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@master-drop-set-user:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@mixed-tiled-to-y-tiled-ccs:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@mode-transition-all-outputs:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@none:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@nopreempt:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@parallel-keep-in-fence:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@plane-all-transition-nonblocking:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@plane-lut1d:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@plane-scaler-with-clipping-clamping-pixel-formats:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@psr-1p-primscrn-pri-indfb-draw-mmap-wc:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@psr-2p-primscrn-indfb-pgflip-blt:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@psrhdr-1p-primscrn-spr-indfb-draw-mmap-gtt:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@psrhdr-2p-primscrn-spr-indfb-draw-render:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@psrhdr-2p-scndscrn-pri-shrfb-draw-blt:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@psrhdr-2p-scndscrn-spr-indfb-draw-render:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@query-forked:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@rc6-disable:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@read-crc:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@render-ccs:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@seamless-rr-switch-drrs:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@semaphore-wait-idle:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@single-wait-for-submit-unsubmitted:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@suspend-resume:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@sync-overlap:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@syncobj-wait:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@thresholds-park:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@too-high:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@wait-wedge-1us:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@yf-tiled-16bpp-rotate-180:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_cursor_crc@yf-tiled-mc-ccs-to-vebox-yf-tiled:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-hdmi-a1-hdmi-a2:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [11.27] s
>      * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ac-hdmi-a1-hdmi-a2:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [11.28] s
>      * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@bc-hdmi-a1-hdmi-a2:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [11.19] s
>      * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset@ab-hdmi-a1-hdmi-a2:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [2.45] s
>      * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset@ac-hdmi-a1-hdmi-a2:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [2.21] s
>      * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset@bc-hdmi-a1-hdmi-a2:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [2.06] s
>      * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [10.79] s
>      * igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [10.78] s
>      * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [10.78] s
> 
> Known issues
> 
>    Here are the changes found in IGTPW_15276_full that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@api_intel_bb@crc32:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6230)
>           * shard-tglu: NOTRUN -> SKIP (i915#6230)
>      * igt@device_reset@unbind-reset-rebind:
> 
>           * shard-dg1: NOTRUN -> ABORT (i915#11814)
>      * igt@dmabuf@all-tests:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15931)
>      * igt@dumb_buffer@create-clear:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#16307)
>           * shard-rkl: NOTRUN -> FAIL (i915#16307)
>           * shard-dg1: NOTRUN -> FAIL (i915#16307)
>           * shard-snb: NOTRUN -> FAIL (i915#16307)
>           * shard-tglu: NOTRUN -> FAIL (i915#16307)
>           * shard-mtlp: NOTRUN -> FAIL (i915#16307)
>      * igt@gem_bad_reloc@negative-reloc-bltcopy:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3281) +2 other tests skip
>      * igt@gem_ccs@ctrl-surf-copy:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3555 / i915#9323)
>      * igt@gem_ccs@ctrl-surf-copy-new-ctx:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9323)
>           * shard-dg1: NOTRUN -> SKIP (i915#9323)
>           * shard-tglu: NOTRUN -> SKIP (i915#9323)
>           * shard-mtlp: NOTRUN -> SKIP (i915#9323)
>      * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:
> 
>           * shard-dg2: PASS -> INCOMPLETE (i915#13356)
>      * igt@gem_create@create-ext-cpu-access-sanity-check:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6335) +1 other test skip
>      * igt@gem_ctx_persistence@hostile:
> 
>           * shard-snb: NOTRUN -> SKIP (i915#1099) +2 other tests skip
>      * igt@gem_ctx_sseu@engines:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#280)
>      * igt@gem_ctx_sseu@invalid-sseu:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#280)
>      * igt@gem_eio@kms:
> 
>           * shard-rkl: NOTRUN -> DMESG-WARN (i915#13363)
>           * shard-tglu: PASS -> DMESG-WARN (i915#13363)
>      * igt@gem_eio@suspend:
> 
>           * shard-rkl: PASS -> ABORT (i915#15131)
>      * igt@gem_exec_balancer@parallel-bb-first:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4525) +1 other test skip
>      * igt@gem_exec_balancer@parallel-keep-in-fence:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#4525)
>      * igt@gem_exec_capture@capture-invisible:
> 
>           * shard-glk11: NOTRUN -> SKIP (i915#6334) +1 other test skip
>      * igt@gem_exec_reloc@basic-cpu:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#3281)
>      * igt@gem_exec_reloc@basic-gtt-wc-active:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3281) +8 other tests skip
>      * igt@gem_exec_reloc@basic-write-cpu-active:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3281) +2 other tests skip
>      * igt@gem_exec_reloc@basic-write-read-active:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3281) +7 other tests skip
>      * igt@gem_exec_schedule@preempt-queue-contexts:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4537 / i915#4812)
>      * igt@gem_exec_suspend@basic-s0:
> 
>           * shard-rkl: NOTRUN -> INCOMPLETE (i915#13356) +1 other test
>             incomplete
>      * igt@gem_fence_thrash@bo-write-verify-none:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4860)
>           * shard-mtlp: NOTRUN -> SKIP (i915#4860)
>      * igt@gem_fenced_exec_thrash@2-spare-fences:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4860) +2 other tests skip
>      * igt@gem_huc_copy@huc-copy:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2190)
>      * igt@gem_lmem_evict@dontneed-evict-race:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4613 / i915#7582)
>      * igt@gem_lmem_swapping@basic:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4613) +2 other tests skip
>      * igt@gem_lmem_swapping@random-engines:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#4613) +7 other tests skip
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#4613)
>      * igt@gem_lmem_swapping@smem-oom:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4613) +4 other tests skip
>      * igt@gem_lmem_swapping@verify-ccs:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#4613) +2 other tests skip
>      * igt@gem_lmem_swapping@verify-random:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4613) +4 other tests skip
>      * igt@gem_mmap_gtt@fault-concurrent-y:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4077) +8 other tests skip
>      * igt@gem_mmap_gtt@hang-user:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4077) +3 other tests skip
>      * igt@gem_mmap_wc@set-cache-level:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4083)
>           * shard-dg1: NOTRUN -> SKIP (i915#4083)
>      * igt@gem_mmap_wc@write-cpu-read-wc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4083) +2 other tests skip
>      * igt@gem_partial_pwrite_pread@writes-after-reads:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3282) +2 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#3282) +1 other test skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#3282) +1 other test skip
>      * igt@gem_pread@exhaustion:
> 
>           * shard-glk11: NOTRUN -> WARN (i915#2658)
>      * igt@gem_pwrite@basic-exhaustion:
> 
>           * shard-snb: NOTRUN -> WARN (i915#2658)
>           * shard-tglu: NOTRUN -> WARN (i915#2658)
>      * igt@gem_pwrite_snooped:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#3282)
>      * igt@gem_pxp@hw-rejects-pxp-buffer:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#13398)
>      * igt@gem_pxp@hw-rejects-pxp-context:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#13717)
>           * shard-tglu: NOTRUN -> SKIP (i915#13398)
>           * shard-mtlp: NOTRUN -> SKIP (i915#13398)
>      * igt@gem_pxp@protected-raw-src-copy-not-readible:
> 
>           * shard-rkl: PASS -> SKIP (i915#4270)
>      * igt@gem_pxp@regular-baseline-src-copy-readible:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4270) +3 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#4270) +1 other test skip
>      * igt@gem_readwrite@beyond-eob:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3282) +3 other tests skip
>      * igt@gem_render_copy@linear-to-vebox-y-tiled:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8428) +2 other tests skip
>      * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
> 
>           * shard-glk: NOTRUN -> SKIP +439 other tests skip
>      * igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5190 / i915#8428) +4 other tests
>             skip
>      * igt@gem_softpin@evict-snoop-interruptible:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4885)
>           * shard-dg1: NOTRUN -> SKIP (i915#4885)
>           * shard-mtlp: NOTRUN -> SKIP (i915#4885)
>      * igt@gem_tiling_max_stride:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4077) +3 other tests skip
>      * igt@gem_userptr_blits@coherency-unsync:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3297) +3 other tests skip
>           * shard-rkl: NOTRUN -> SKIP (i915#3297) +3 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#3297)
>           * shard-tglu: NOTRUN -> SKIP (i915#3297)
>           * shard-mtlp: NOTRUN -> SKIP (i915#3297)
>      * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3297 / i915#4880)
>      * igt@gem_userptr_blits@readonly-pwrite-unsync:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3297)
>      * igt@gen9_exec_parse@basic-rejected-ctx-param:
> 
>           * shard-snb: NOTRUN -> SKIP +186 other tests skip
>           * shard-tglu: NOTRUN -> SKIP (i915#2527 / i915#2856) +3 other tests
>             skip
>      * igt@gen9_exec_parse@batch-without-end:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2856) +4 other tests skip
>      * igt@gen9_exec_parse@bb-secure:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2527) +2 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#2527)
>           * shard-mtlp: NOTRUN -> SKIP (i915#2856) +1 other test skip
>      * igt@gen9_exec_parse@secure-batches:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#2527 / i915#2856) +1 other
>             test skip
>      * igt@i915_drm_fdinfo@busy-hang@ccs0:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#14073) +6 other tests skip
>      * igt@i915_drm_fdinfo@busy-hang@vcs0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#14073) +5 other tests skip
>      * igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#14073) +15 other tests skip
>      * igt@i915_drm_fdinfo@virtual-busy-all:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#14118)
>           * shard-dg2: NOTRUN -> SKIP (i915#14118)
>           * shard-dg1: NOTRUN -> SKIP (i915#14118)
>      * igt@i915_module_load@fault-injection@__uc_init:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15479) +4 other tests skip
>      * igt@i915_module_load@fault-injection@intel_connector_register:
> 
>           * shard-tglu-1: NOTRUN -> ABORT (i915#15342) +1 other test abort
>      * igt@i915_module_load@reload-no-display:
> 
>           * shard-dg2: NOTRUN -> DMESG-WARN (i915#13029 / i915#14545)
>      * igt@i915_pm_freq_api@freq-suspend:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8399)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#8399)
>      * igt@i915_pm_freq_mult@media-freq@gt0:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#6590) +1 other test skip
>      * igt@i915_pm_rc6_residency@media-rc6-accuracy:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#16080 / i915#16166)
>      * igt@i915_pm_rc6_residency@rc6-fence:
> 
>           * shard-tglu: NOTRUN -> WARN (i915#13790 / i915#2681) +1 other test
>             warn
>      * igt@i915_pm_rc6_residency@rc6-idle:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14498)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#14498)
>      * igt@i915_pm_rps@min-max-config-loaded:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11681 / i915#6621)
>           * shard-dg1: NOTRUN -> SKIP (i915#11681 / i915#6621)
>           * shard-mtlp: NOTRUN -> SKIP (i915#11681 / i915#6621)
>      * igt@i915_pm_rps@thresholds-idle-park:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11681) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP (i915#11681)
>           * shard-mtlp: NOTRUN -> SKIP (i915#11681)
>      * igt@i915_pm_sseu@full-enable:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4387)
>           * shard-rkl: NOTRUN -> SKIP (i915#4387)
>      * igt@i915_query@hwconfig_table:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6245)
>      * igt@i915_query@query-topology-known-pci-ids:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#16109)
>           * shard-dg2: NOTRUN -> SKIP (i915#16109)
>      * igt@i915_suspend@fence-restore-untiled:
> 
>           * shard-glk: PASS -> INCOMPLETE (i915#16182 / i915#4817)
>      * igt@i915_suspend@sysfs-reader:
> 
>           * shard-snb: PASS -> ABORT (i915#15840)
>           * shard-rkl: PASS -> INCOMPLETE (i915#4817)
>      * igt@kms_addfb_basic@basic-x-tiled-legacy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4212)
>      * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1:
> 
>           * shard-glk: PASS -> INCOMPLETE (i915#12761 / i915#16314)
>      * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9531)
>      * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
> 
>           * shard-glk10: NOTRUN -> SKIP (i915#1769)
>           * shard-tglu: NOTRUN -> SKIP (i915#1769 / i915#3555)
>      * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5286) +4 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#4538 / i915#5286)
>      * igt@kms_big_fb@4-tiled-32bpp-rotate-180:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5286) +1 other test skip
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#5286) +3 other tests skip
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>           * shard-mtlp: PASS -> FAIL (i915#15733 / i915#5138)
>      * igt@kms_big_fb@linear-16bpp-rotate-180:
> 
>           * shard-tglu: NOTRUN -> FAIL (i915#16308) +2 other tests fail
>      * igt@kms_big_fb@linear-32bpp-rotate-180:
> 
>           * shard-rkl: NOTRUN -> FAIL (i915#16308)
>      * igt@kms_big_fb@linear-64bpp-rotate-270:
> 
>           * shard-mtlp: NOTRUN -> SKIP +8 other tests skip
>      * igt@kms_big_fb@linear-8bpp-rotate-0:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#16308)
>           * shard-dg1: NOTRUN -> FAIL (i915#16308)
>           * shard-snb: NOTRUN -> FAIL (i915#16308)
>           * shard-mtlp: NOTRUN -> FAIL (i915#16308)
>      * igt@kms_big_fb@linear-8bpp-rotate-270:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#3638) +1 other test
>             skip
>      * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180:
> 
>           * shard-glk10: NOTRUN -> FAIL (i915#16308)
>           * shard-tglu-1: NOTRUN -> FAIL (i915#16308)
>      * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3828)
>      * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
> 
>           * shard-dg2: NOTRUN -> SKIP +8 other tests skip
>           * shard-rkl: NOTRUN -> SKIP (i915#3638) +3 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#3638) +2 other tests skip
>      * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4538 / i915#5190) +9 other tests
>             skip
>      * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4538)
>      * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
> 
>           * shard-glk10: NOTRUN -> SKIP +150 other tests skip
>      * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5190) +1 other test skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#6187)
>      * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#6095) +200 other tests skip
>      * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6095) +24 other tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#12313) +1 other test skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14098 / i915#14544 / i915#6095)
>             +1 other test skip
>      * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6095) +54 other tests skip
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#6095) +44 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12805)
>           * shard-rkl: NOTRUN -> SKIP (i915#12805) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP (i915#12805)
>           * shard-tglu: NOTRUN -> SKIP (i915#12805)
>           * shard-mtlp: NOTRUN -> SKIP (i915#12805)
>      * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6095) +21 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14098 / i915#6095) +50 other
>             tests skip
>      * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#15582 / i915#16205) +1
>             other test incomplete
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#6095) +102 other
>             tests skip
>      * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#6095) +3 other tests
>             skip
>      * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12313)
>           * shard-rkl: NOTRUN -> SKIP (i915#12313)
>      * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6095) +73 other tests skip
>      * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#10434 / i915#6095)
>             +2 other tests skip
>      * igt@kms_cdclk@mode-transition-all-outputs:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3742)
>      * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13781) +3 other tests skip
>      * igt@kms_cdclk@plane-scaling:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3742)
>           * shard-dg1: NOTRUN -> SKIP (i915#3742)
>           * shard-tglu: NOTRUN -> SKIP (i915#3742)
>      * igt@kms_cdclk@plane-scaling@pipe-c-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#13783) +4 other tests skip
>      * igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13783) +4 other tests skip
>      * igt@kms_chamelium_frames@dp-crc-fast:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11151 / i915#7828) +7 other tests
>             skip
>           * shard-dg1: NOTRUN -> SKIP (i915#11151 / i915#7828) +4 other tests
>             skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#11151 / i915#7828) +4 other
>             tests skip
>      * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#11151 / i915#14544 / i915#7828)
>      * igt@kms_chamelium_frames@hdmi-frame-dump:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#11151 / i915#7828) +5 other
>             tests skip
>      * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
> 
>           * shard-glk11: NOTRUN -> SKIP +170 other tests skip
>      * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#11151 / i915#7828) +10 other
>             tests skip
>      * igt@kms_chamelium_hpd@vga-hpd-fast:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#11151 / i915#7828) +9 other tests
>             skip
>      * igt@kms_color@deep-color:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#12655 / i915#3555)
>      * igt@kms_content_protection@atomic@pipe-a-dp-3:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#7173)
>      * igt@kms_content_protection@dp-mst-lic-type-0:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15330 / i915#3116 / i915#3299)
>      * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15330)
>      * igt@kms_content_protection@dp-mst-type-0:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15330 / i915#3116)
>      * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15330)
>      * igt@kms_content_protection@srm:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15865) +1 other test skip
>           * shard-rkl: NOTRUN -> SKIP (i915#15865) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP (i915#15865)
>           * shard-tglu: NOTRUN -> SKIP (i915#15865) +1 other test skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#15865)
>      * igt@kms_content_protection@suspend-resume:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15865)
>      * igt@kms_cursor_crc@cursor-offscreen-512x170:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#13049)
>      * igt@kms_cursor_crc@cursor-offscreen-max-size:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3555)
>           * shard-tglu: NOTRUN -> SKIP (i915#3555) +3 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8814)
>      * igt@kms_cursor_crc@cursor-onscreen-512x170:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#13049)
>      * igt@kms_cursor_crc@cursor-random-128x42:
> 
>           * shard-rkl: PASS -> FAIL (i915#13566) +1 other test fail
>      * igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:
> 
>           * shard-tglu: PASS -> FAIL (i915#13566) +3 other tests fail
>      * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8814)
>      * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555) +6 other tests skip
>      * igt@kms_cursor_crc@cursor-sliding-512x512:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#13049)
>      * igt@kms_cursor_crc@cursor-sliding-64x64:
> 
>           * shard-dg2: PASS -> ABORT (i915#13562)
>           * shard-dg1: PASS -> DMESG-WARN (i915#4423) +1 other test
>             dmesg-warn
>      * igt@kms_cursor_crc@cursor-sliding-64x64@pipe-a-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> DMESG-WARN (i915#13562)
>      * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9809) +1 other test skip
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4103) +1 other test skip
>      * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13046 / i915#5354) +3 other tests
>             skip
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4103)
>           * shard-mtlp: NOTRUN -> SKIP (i915#16119 / i915#4213)
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4103) +1 other test skip
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4103) +2 other tests skip
>      * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9723)
>      * igt@kms_display_modes@extended-mode-basic:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#13691)
>      * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555) +5 other tests skip
>      * igt@kms_dp_aux_dev@basic:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#1257)
>      * igt@kms_dp_link_training@non-uhbr-mst:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#13749)
>      * igt@kms_dp_linktrain_fallback@dp-fallback:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#13707)
>      * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3840)
>      * igt@kms_dsc@dsc-with-formats:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#3840)
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#3840)
>      * igt@kms_dsc@dsc-with-output-formats:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#3840)
>      * igt@kms_dsc@dsc-with-output-formats-with-bpc:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3840 / i915#9053)
>      * igt@kms_fbcon_fbt@fbc-suspend:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#9878)
>           * shard-rkl: NOTRUN -> INCOMPLETE (i915#9878)
>      * igt@kms_fbcon_fbt@psr:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3469)
>      * igt@kms_feature_discovery@chamelium:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#16084)
>      * igt@kms_feature_discovery@display-3x:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#16081)
>      * igt@kms_flip@2x-flip-vs-dpms:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3637 / i915#9934) +7 other
>             tests skip
>      * igt@kms_flip@2x-flip-vs-fences:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8381) +1 other test skip
>      * igt@kms_flip@2x-flip-vs-suspend:
> 
>           * shard-glk10: NOTRUN -> INCOMPLETE (i915#12745 / i915#4839)
>      * igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2:
> 
>           * shard-glk10: NOTRUN -> INCOMPLETE (i915#12745)
>      * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9934) +4 other tests skip
>      * igt@kms_flip@2x-nonexisting-fb:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3637 / i915#9934)
>           * shard-dg1: NOTRUN -> SKIP (i915#9934)
>      * igt@kms_flip@2x-plain-flip:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9934) +9 other tests skip
>      * igt@kms_flip@2x-plain-flip-fb-recreate:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3637 / i915#9934) +2 other tests
>             skip
>      * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:
> 
>           * shard-tglu: PASS -> FAIL (i915#13027) +1 other test fail
>      * igt@kms_flip@flip-vs-suspend:
> 
>           * shard-glk11: NOTRUN -> INCOMPLETE (i915#12745 / i915#4839)
>      * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
> 
>           * shard-glk11: NOTRUN -> INCOMPLETE (i915#12745)
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#15643) +2 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#15643) +1 other test skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15643) +4 other tests skip
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15643) +1 other test skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15643) +3 other tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8810 / i915#8813) +1
>             other test skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15643) +1 other test skip
>      * igt@kms_force_connector_basic@prune-stale-modes:
> 
>           * shard-mtlp: PASS -> SKIP (i915#15672)
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15991 / i915#5354) +25 other
>             tests skip
>           * shard-rkl: NOTRUN -> SKIP (i915#14544) +6 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:
> 
>           * shard-tglu-1: NOTRUN -> SKIP +65 other tests skip
>           * shard-dg1: NOTRUN -> SKIP +28 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#15991 / i915#1825) +12 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#1825)
>      * igt@kms_frontbuffer_tracking@fbc-suspend:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#10056)
>      * igt@kms_frontbuffer_tracking@fbchdr-1p-indfb-fliptrack-mmap-gtt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#15990) +2 other tests skip
>      * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15990) +16 other tests skip
>           * shard-rkl: PASS -> SKIP (i915#15989) +6 other tests skip
>      * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-pwrite:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15989) +15 other tests skip
>      * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-onoff:
> 
>           * shard-glk: PASS -> SKIP +10 other tests skip
>      * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-pwrite:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15991) +34 other tests skip
>      * igt@kms_frontbuffer_tracking@fbchdr-indfb-scaledprimary:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15989) +10 other tests skip
>      * igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15989) +13 other tests skip
>           * shard-rkl: NOTRUN -> SKIP (i915#15989) +21 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15990 / i915#8708) +9 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
> 
>           * shard-rkl: NOTRUN -> SKIP +100 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
> 
>           * shard-tglu: NOTRUN -> SKIP +102 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10433 / i915#15102)
>      * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-indfb-fliptrack-mmap-gtt:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15102) +43 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-cpu:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15102) +23 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-gtt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15102) +25 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsrhdr-indfb-scaledprimary:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#15989) +10 other tests skip
>      * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-gtt:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#15990) +5 other tests skip
>      * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-pwrite:
> 
>           * shard-dg2: PASS -> SKIP (i915#15989) +1 other test skip
>      * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-pwrite:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#15991) +15 other tests skip
>      * igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-cpu:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#15989) +4 other tests skip
>      * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9766)
>           * shard-tglu: NOTRUN -> SKIP (i915#9766)
>           * shard-dg2: NOTRUN -> SKIP (i915#9766)
>      * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15104 / i915#15990)
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15102 / i915#3023) +19 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1825) +7 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15102) +18 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#15990 / i915#8708) +1 other test
>             skip
>      * igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-render:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#15102) +9 other tests skip
>      * igt@kms_hdr@bpc-switch:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#16012 / i915#3555 / i915#8228)
>      * igt@kms_hdr@bpc-switch-suspend:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#16012 / i915#3555 / i915#8228)
>      * igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-1-xrgb2101010:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#16012) +1 other test skip
>      * igt@kms_hdr@bpc-switch@pipe-a-hdmi-a-2-xrgb16161616f:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#16012) +1 other test skip
>      * igt@kms_hdr@bpc-switch@pipe-a-hdmi-a-4-xrgb2101010:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#16012) +3 other tests skip
>      * igt@kms_hdr@invalid-metadata-sizes:
> 
>           * shard-dg2: PASS -> SKIP (i915#16011 / i915#3555 / i915#8228)
>           * shard-tglu: NOTRUN -> SKIP (i915#16011 / i915#3555 / i915#8228)
>      * igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-1-xrgb2101010:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#16011) +1 other test skip
>      * igt@kms_hdr@static-toggle-dpms:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#16011 / i915#3555 / i915#8228)
>      * igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-1-xrgb2101010:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#16011) +1 other test skip
>      * igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#16011) +3 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#16011) +5 other tests skip
>      * igt@kms_joiner@basic-force-ultra-joiner:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15458)
>           * shard-rkl: NOTRUN -> SKIP (i915#15458)
>           * shard-dg1: NOTRUN -> SKIP (i915#15458)
>           * shard-tglu: NOTRUN -> SKIP (i915#15458)
>           * shard-mtlp: NOTRUN -> SKIP (i915#15458)
>      * igt@kms_joiner@basic-max-non-joiner:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#13688)
>           * shard-mtlp: NOTRUN -> SKIP (i915#13688)
>           * shard-dg2: NOTRUN -> SKIP (i915#13688)
>           * shard-rkl: NOTRUN -> SKIP (i915#13688)
>           * shard-dg1: NOTRUN -> SKIP (i915#13688)
>      * igt@kms_joiner@invalid-modeset-big-joiner:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#15460)
>      * igt@kms_joiner@invalid-modeset-force-big-joiner:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15459)
>      * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#15815)
>           * shard-dg2: NOTRUN -> SKIP (i915#15815)
>           * shard-rkl: NOTRUN -> SKIP (i915#15815)
>           * shard-dg1: NOTRUN -> SKIP (i915#15815)
>      * igt@kms_panel_fitting@atomic-fastset:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6301)
>      * igt@kms_panel_fitting@legacy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6301)
>      * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#14712)
>      * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-5:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15608) +1 other test skip
>      * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15709) +1 other test skip
>      * igt@kms_plane@pixel-format-y-tiled-ccs-modifier:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15709) +4 other tests skip
>           * shard-rkl: NOTRUN -> SKIP (i915#15709) +2 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#15709) +1 other test skip
>      * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15709) +4 other tests skip
>      * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#15709) +1 other test skip
>      * igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#16112)
>      * igt@kms_plane@plane-panning-bottom-right-suspend:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#13026) +1 other test
>             incomplete
>      * igt@kms_plane_lowres@tiling-yf:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3555) +2 other tests skip
>      * igt@kms_plane_multiple@2x-tiling-4:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#13958)
>      * igt@kms_plane_multiple@2x-tiling-x:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#13958)
>      * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#15329) +4 other tests skip
>      * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15329) +7 other tests skip
>      * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15329) +4 other tests skip
>      * igt@kms_pm_backlight@bad-brightness:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12343 / i915#5354)
>      * igt@kms_pm_backlight@brightness-with-dpms:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#12343)
>      * igt@kms_pm_dc@dc5-psr:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15948)
>           * shard-rkl: NOTRUN -> SKIP (i915#15948)
>           * shard-dg1: NOTRUN -> SKIP (i915#15948)
>           * shard-tglu: NOTRUN -> SKIP (i915#15948)
>      * igt@kms_pm_dc@dc5-retention-flops:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3828)
>      * igt@kms_pm_dc@dc6-dpms:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15751)
>           * shard-rkl: NOTRUN -> FAIL (i915#15752)
>      * igt@kms_pm_dc@dc9-dpms:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15739)
>      * igt@kms_pm_lpsp@kms-lpsp:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9340)
>      * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15073)
>           * shard-tglu: NOTRUN -> SKIP (i915#15073)
>           * shard-mtlp: NOTRUN -> SKIP (i915#15073)
>      * igt@kms_pm_rpm@dpms-non-lpsp:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15073)
>      * igt@kms_pm_rpm@modeset-non-lpsp:
> 
>           * shard-dg1: PASS -> SKIP (i915#15073)
>      * igt@kms_pm_rpm@modeset-non-lpsp-stress:
> 
>           * shard-dg2: PASS -> SKIP (i915#15073)
>      * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
> 
>           * shard-rkl: PASS -> SKIP (i915#15073) +1 other test skip
>      * igt@kms_pm_rpm@system-suspend-modeset:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#10553)
>      * igt@kms_prime@basic-crc-hybrid:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6524) +1 other test skip
>      * igt@kms_prime@d3hot:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6524 / i915#6805)
>           * shard-rkl: NOTRUN -> SKIP (i915#6524)
>           * shard-dg1: NOTRUN -> SKIP (i915#6524)
>           * shard-mtlp: NOTRUN -> SKIP (i915#6524)
>      * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#11520) +2 other tests skip
>      * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
> 
>           * shard-glk11: NOTRUN -> SKIP (i915#11520) +3 other tests skip
>      * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#11520) +4 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#12316)
>      * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
> 
>           * shard-snb: NOTRUN -> SKIP (i915#11520) +3 other tests skip
>      * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#11520) +11 other tests skip
>      * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#11520) +10 other tests skip
>      * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#11520) +2 other tests skip
>      * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11520) +9 other tests skip
>      * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
> 
>           * shard-glk10: NOTRUN -> SKIP (i915#11520) +3 other tests skip
>      * igt@kms_psr2_su@frontbuffer-xrgb8888:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9683)
>      * igt@kms_psr2_su@page_flip-nv12:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9683)
>           * shard-tglu: NOTRUN -> SKIP (i915#9683)
>      * igt@kms_psr2_su@page_flip-p010:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#9683)
>      * igt@kms_psr@fbc-pr-sprite-plane-move:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1072 / i915#14544 / i915#9732)
>      * igt@kms_psr@fbc-pr-sprite-plane-onoff:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1072 / i915#9732) +19 other tests
>             skip
>      * igt@kms_psr@fbc-psr-no-drrs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9732) +15 other tests skip
>      * igt@kms_psr@fbc-psr2-cursor-blt:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#9732) +9 other tests skip
>      * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9688) +1 other test skip
>      * igt@kms_psr@psr2-cursor-plane-move:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1072 / i915#9732) +18 other tests
>             skip
>      * igt@kms_psr@psr2-sprite-mmap-gtt:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#1072 / i915#9732) +4 other tests
>             skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#4077 / i915#9688) +1 other test
>             skip
>      * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#15949)
>           * shard-tglu: NOTRUN -> SKIP (i915#15949)
>      * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#15500 / i915#16184)
>      * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#12755 / i915#15867) +1 other
>             test skip
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5289) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP (i915#5289)
>           * shard-tglu: NOTRUN -> SKIP (i915#5289) +1 other test skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#5289)
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12755 / i915#15867 / i915#5190)
>             +1 other test skip
>      * igt@kms_rotation_crc@sprite-rotation-270:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12755 / i915#15867) +1 other test
>             skip
>      * igt@kms_selftest@drm_framebuffer:
> 
>           * shard-glk10: NOTRUN -> ABORT (i915#13179) +1 other test abort
>      * igt@kms_vblank@ts-continuation-suspend:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#12276) +1 other test
>             incomplete
>      * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: PASS -> INCOMPLETE (i915#12276) +1 other test
>             incomplete
>      * igt@kms_vrr@flip-basic:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15243 / i915#3555)
>           * shard-rkl: NOTRUN -> SKIP (i915#15243 / i915#3555) +1 other test
>             skip
>      * igt@kms_vrr@seamless-rr-switch-virtual:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9906)
>      * igt@kms_vrr@seamless-rr-switch-vrr:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#9906) +1 other test skip
>      * igt@perf_pmu@busy-double-start@vcs1:
> 
>           * shard-dg1: PASS -> FAIL (i915#4349) +2 other tests fail
>           * shard-mtlp: PASS -> FAIL (i915#4349) +5 other tests fail
>      * igt@perf_pmu@module-unload:
> 
>           * shard-rkl: NOTRUN -> ABORT (i915#15778)
>      * igt@prime_vgem@coherency-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3708 / i915#4077) +1 other test
>             skip
>      * igt@prime_vgem@fence-flip-hang:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3708)
>      * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-7:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#16066) +9 other tests skip
>      * igt@sriov_basic@enable-vfs-bind-unbind-each:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9917)
>           * shard-dg1: NOTRUN -> SKIP (i915#9917)
>      * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-random:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#16066) +8 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#16066) +8 other tests skip
>      * igt@vgem_basic@create:
> 
>           * shard-glk11: NOTRUN -> FAIL (i915#16296)
> 
>     Possible fixes
> 
>      * igt@gem_exec_endless@dispatch:
> 
>           * shard-mtlp: TIMEOUT (i915#3778 / i915#7016) -> PASS +1 other test
>             pass
>      * igt@gem_exec_suspend@basic-s0:
> 
>           * shard-dg2: INCOMPLETE (i915#13356) -> PASS +1 other test pass
>      * igt@gem_workarounds@suspend-resume-context:
> 
>           * shard-glk: INCOMPLETE (i915#13356) -> PASS
>           * shard-rkl: INCOMPLETE (i915#13356) -> PASS
>      * igt@i915_pm_rps@reset:
> 
>           * shard-snb: TIMEOUT (i915#16162) -> PASS
>      * igt@i915_suspend@basic-s2idle-without-i915:
> 
>           * shard-dg2: DMESG-WARN (i915#14545) -> PASS +1 other test pass
>      * igt@i915_suspend@basic-s3-without-i915:
> 
>           * shard-rkl: ABORT (i915#15131) -> PASS
>      * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3:
> 
>           * shard-dg2: FAIL (i915#5956) -> PASS +1 other test pass
>      * igt@kms_cursor_crc@cursor-random-256x256:
> 
>           * shard-dg1: DMESG-WARN (i915#4423) -> PASS +3 other tests pass
>      * igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1:
> 
>           * shard-tglu: FAIL (i915#13566) -> PASS +1 other test pass
>      * igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: FAIL (i915#13566) -> PASS +3 other tests pass
>      * igt@kms_flip@flip-vs-suspend:
> 
>           * shard-rkl: INCOMPLETE (i915#16276 / i915#6113) -> PASS +1 other
>             test pass
>      * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-blt:
> 
>           * shard-rkl: SKIP (i915#15989) -> PASS +5 other tests pass
>      * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-render:
> 
>           * shard-dg2: SKIP (i915#15989) -> PASS +4 other tests pass
>      * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
> 
>           * shard-glk: SKIP -> PASS +4 other tests pass
>      * igt@kms_hdr@bpc-switch:
> 
>           * shard-dg2: SKIP (i915#16012 / i915#3555 / i915#8228) -> PASS
>      * igt@kms_pm_rpm@dpms-lpsp:
> 
>           * shard-dg1: SKIP (i915#15073) -> PASS +2 other tests pass
>      * igt@kms_pm_rpm@i2c:
> 
>           * shard-glk: FAIL (i915#8717) -> PASS
>      * igt@kms_pm_rpm@system-suspend-idle:
> 
>           * shard-dg2: INCOMPLETE (i915#14419) -> PASS
>      * igt@perf_pmu@busy-idle@bcs0:
> 
>           * shard-mtlp: FAIL (i915#4349) -> PASS +5 other tests pass
>      * igt@perf_pmu@busy-idle@vcs0:
> 
>           * shard-dg1: FAIL (i915#4349) -> PASS +3 other tests pass
> 
>     Warnings
> 
>      * igt@device_reset@cold-reset-bound:
> 
>           * shard-rkl: SKIP (i915#11078) -> SKIP (i915#11078 / i915#14544)
>      * igt@gem_ccs@suspend-resume:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#9323) -> SKIP (i915#9323)
>      * igt@gem_close_race@multigpu-basic-process:
> 
>           * shard-rkl: SKIP (i915#7697) -> SKIP (i915#14544 / i915#7697)
>      * igt@gem_exec_reloc@basic-gtt-cpu:
> 
>           * shard-rkl: SKIP (i915#3281) -> SKIP (i915#14544 / i915#3281) +4
>             other tests skip
>      * igt@gem_exec_reloc@basic-write-read:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3281) -> SKIP (i915#3281) +3
>             other tests skip
>      * igt@gem_lmem_swapping@smem-oom:
> 
>           * shard-rkl: SKIP (i915#4613) -> SKIP (i915#14544 / i915#4613)
>      * igt@gem_pwrite@basic-random:
> 
>           * shard-rkl: SKIP (i915#3282) -> SKIP (i915#14544 / i915#3282)
>      * igt@gem_readwrite@beyond-eob:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3282) -> SKIP (i915#3282)
>      * igt@gem_userptr_blits@dmabuf-sync:
> 
>           * shard-rkl: SKIP (i915#3297 / i915#3323) -> SKIP (i915#14544 /
>             i915#3297 / i915#3323)
>      * igt@gem_userptr_blits@unsync-overlap:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3297) -> SKIP (i915#3297)
>      * igt@gen9_exec_parse@batch-without-end:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#2527) -> SKIP (i915#2527) +2
>             other tests skip
>      * igt@gen9_exec_parse@valid-registers:
> 
>           * shard-rkl: SKIP (i915#2527) -> SKIP (i915#14544 / i915#2527) +2
>             other tests skip
>      * igt@i915_query@test-query-geometry-subslices:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#5723) -> SKIP (i915#5723)
>      * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
> 
>           * shard-rkl: SKIP (i915#5286) -> SKIP (i915#14544 / i915#5286)
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#5286) -> SKIP (i915#5286) +1
>             other test skip
>      * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
> 
>           * shard-rkl: SKIP (i915#3828) -> SKIP (i915#14544 / i915#3828)
>      * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3638) -> SKIP (i915#3638)
>      * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#6095) -> SKIP (i915#6095) +3
>             other tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:
> 
>           * shard-rkl: SKIP (i915#14098 / i915#14544 / i915#6095) -> SKIP
>             (i915#14098 / i915#6095) +5 other tests skip
>      * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:
> 
>           * shard-rkl: SKIP (i915#14098 / i915#6095) -> SKIP (i915#14098 /
>             i915#14544 / i915#6095) +3 other tests skip
>      * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: SKIP (i915#6095) -> SKIP (i915#14544 / i915#6095) +1
>             other test skip
>      * igt@kms_chamelium_frames@hdmi-aspect-ratio:
> 
>           * shard-rkl: SKIP (i915#11151 / i915#7828) -> SKIP (i915#11151 /
>             i915#14544 / i915#7828)
>      * igt@kms_content_protection@atomic:
> 
>           * shard-dg2: SKIP (i915#15865) -> FAIL (i915#7173)
>      * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#15330) -> SKIP (i915#15330)
>      * igt@kms_content_protection@legacy-hdcp14:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#15865) -> SKIP (i915#15865)
>      * igt@kms_content_protection@mei-interface:
> 
>           * shard-dg1: SKIP (i915#9433) -> SKIP (i915#15865)
>      * igt@kms_content_protection@type1:
> 
>           * shard-rkl: SKIP (i915#15865) -> SKIP (i915#14544 / i915#15865)
>      * igt@kms_cursor_crc@cursor-onscreen-32x10:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3555) -> SKIP (i915#3555)
>      * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
> 
>           * shard-rkl: SKIP (i915#13049) -> SKIP (i915#13049 / i915#14544)
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#4103) -> SKIP (i915#4103) +1
>             other test skip
>      * igt@kms_dsc@dsc-basic:
> 
>           * shard-rkl: SKIP (i915#3555 / i915#3840) -> SKIP (i915#14544 /
>             i915#3555 / i915#3840)
>      * igt@kms_flip@2x-plain-flip-ts-check:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#9934) -> SKIP (i915#9934)
>      * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
> 
>           * shard-rkl: SKIP (i915#9934) -> SKIP (i915#14544 / i915#9934) +1
>             other test skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#15643) -> SKIP (i915#15643) +1
>             other test skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-shrfb-fliptrack-mmap-gtt:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#15102 / i915#3023) -> SKIP
>             (i915#15102 / i915#3023) +4 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-blt:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#15102) -> SKIP (i915#15102) +4
>             other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-mmap-wc:
> 
>           * shard-rkl: SKIP (i915#15102) -> SKIP (i915#14544 / i915#15102) +4
>             other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-render:
> 
>           * shard-dg1: SKIP (i915#4423) -> SKIP
>      * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-wc:
> 
>           * shard-rkl: SKIP -> SKIP (i915#14544) +16 other tests skip
>      * igt@kms_frontbuffer_tracking@hdr-2p-rte:
> 
>           * shard-dg1: SKIP -> SKIP (i915#4423)
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
> 
>           * shard-dg2: SKIP (i915#10433 / i915#15102) -> SKIP (i915#15102) +2
>             other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:
> 
>           * shard-dg2: SKIP (i915#15102) -> SKIP (i915#10433 / i915#15102) +4
>             other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
> 
>           * shard-rkl: SKIP (i915#15102 / i915#3023) -> SKIP (i915#14544 /
>             i915#15102 / i915#3023) +6 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:
> 
>           * shard-rkl: SKIP (i915#14544) -> SKIP +13 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#1825) -> SKIP (i915#1825) +1
>             other test skip
>      * igt@kms_panel_fitting@legacy:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#6301) -> SKIP (i915#6301)
>      * igt@kms_plane@pixel-format-4-tiled-modifier:
> 
>           * shard-rkl: SKIP (i915#15709) -> SKIP (i915#14544 / i915#15709)
>      * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#15709) -> SKIP (i915#15709) +1
>             other test skip
>      * igt@kms_plane_multiple@tiling-yf:
> 
>           * shard-rkl: SKIP (i915#14259 / i915#14544) -> SKIP (i915#14259)
>      * igt@kms_pm_lpsp@screens-disabled:
> 
>           * shard-rkl: SKIP (i915#8430) -> SKIP (i915#14544 / i915#8430)
>      * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
> 
>           * shard-rkl: SKIP (i915#11520 / i915#14544) -> SKIP (i915#11520) +1
>             other test skip
>      * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
> 
>           * shard-rkl: SKIP (i915#11520) -> SKIP (i915#11520 / i915#14544) +1
>             other test skip
>      * igt@kms_psr@psr-primary-page-flip:
> 
>           * shard-rkl: SKIP (i915#1072 / i915#9732) -> SKIP (i915#1072 /
>             i915#14544 / i915#9732) +3 other tests skip
>      * igt@kms_psr@psr2-cursor-plane-move:
> 
>           * shard-rkl: SKIP (i915#1072 / i915#14544 / i915#9732) -> SKIP
>             (i915#1072 / i915#9732) +2 other tests skip
>      * igt@kms_vrr@seamless-rr-switch-vrr:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#9906) -> SKIP (i915#9906)
>      * igt@perf@per-context-mode-unprivileged:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#2435) -> SKIP (i915#2435)
>      * igt@perf_pmu@module-unload:
> 
>           * shard-dg2: ABORT (i915#13029 / i915#15778) -> ABORT (i915#15778)
>           * shard-dg1: ABORT (i915#13029 / i915#15778) -> ABORT (i915#15778)
>      * igt@prime_vgem@coherency-gtt:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3708) -> SKIP (i915#3708) +1
>             other test skip
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_8943 -> IGTPW_15276
>      * Piglit: piglit_4509 -> None
> 
>    CI-20190529: 20190529
>    CI_DRM_18595: 8133a9f4c4fd407e81df71530490836a1170bb2f @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_15276: ba33fc53234676e1dd0014d57095b0f052a53d9d @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    IGT_8943: 8943
>    piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
>    git://anongit.freedesktop.org/piglit
