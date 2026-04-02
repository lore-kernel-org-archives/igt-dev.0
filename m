Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB29D39427
	for <igt-dev@archiver.kernel.org>; Thu,  2 Apr 2026 13:45:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D750E10EE33;
	Thu,  2 Apr 2026 13:45:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EbEKM3U5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F87810EE33
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Apr 2026 13:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775137527; x=1806673527;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=vB5SbpF94uUo+lGUyKc4lNjU8Y6PWhpbsASwRuwhoJc=;
 b=EbEKM3U5Iqtqp3FKa8vwxT1XY51zfBCa8fxGOrcakd89UsjtKNh6x2YP
 RBNaMkDArmQ3uJxKxIGMA5EMgYLyM3ipW64N8M6zY552sNUvbmXvNvpsB
 GVWELY+S9OgV3MR227//bZwcKG1Z1oCjBRGt0AdAv3ulZsUlyjuISqFOU
 aAJS30dfhrkagl1uY/GPVhcM0xNx8EPhTA9sUKxDRdEqNr//TV2VA0o2/
 zf6vDm0TkSGdo5vJ2j10lTmEAfaHWdKLJievfYJXqK0BT8T8sqvdTBdnN
 z4rPze4z1uT4T4G69f4fasYvqD/5EtaO7f7rmIFRPbOgm8EqzV5yQzANt Q==;
X-CSE-ConnectionGUID: JsmARfLVSuuxPFyzYh/Rbw==
X-CSE-MsgGUID: v0mAdflQQraUpmL5uszaqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="101648448"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="101648448"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 06:45:26 -0700
X-CSE-ConnectionGUID: Ibg22fg3RcS1DscqflLkDA==
X-CSE-MsgGUID: NcauGH/oSVeidpOvD2P1jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="264914487"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.1])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 06:45:25 -0700
Date: Thu, 2 Apr 2026 15:45:23 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw=?= =?utf-8?Q?=3A?= failure for
 Exercise large buffer in compute-square
Message-ID: <srjaelq2njj37fzrszwl4jqi4acf3wsn4jjvnkaeu5c3wasbkh@kzipefrkmpll>
References: <20260401091017.2772519-5-zbigniew.kempczynski@intel.com>
 <177507578263.425443.15852831806090820389@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177507578263.425443.15852831806090820389@a3b018990fe9>
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

On Wed, Apr 01, 2026 at 08:36:22PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Exercise large buffer in compute-square                          
>    URL:     https://patchwork.freedesktop.org/series/164228/                 
>    State:   failure                                                          
>    Details: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14904/index.html 
> 
>         CI Bug Log - changes from XEIGT_8840_FULL -> XEIGTPW_14904_FULL
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with XEIGTPW_14904_FULL absolutely need to
>    be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_14904_FULL, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
> Participating hosts (2 -> 2)
> 
>    No changes in participating hosts
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    XEIGTPW_14904_FULL:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>           * shard-lnl: PASS -> INCOMPLETE +1 other test incomplete

Unrelated to above failure.

> 
> New tests
> 
>    New tests have been introduced between XEIGT_8840_FULL and
>    XEIGTPW_14904_FULL:
> 
>   New IGT tests (1)
> 
>      * igt@xe_compute@compute-square-userenv-large-buffer:
>           * Statuses : 1 pass(s)
>           * Exec time: [0.04] s

This is subtest added in the series. No other changes were
introduced.

--
Zbigniew


> 
> Known issues
> 
>    Here are the changes found in XEIGTPW_14904_FULL that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1407)
>      * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2887)
>      * igt@kms_chamelium_hpd@dp-hpd-after-hibernate:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#373)
>      * igt@kms_content_protection@atomic:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#7642)
>      * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#309 / Intel XE#7343)
>      * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#301)
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1397 / Intel XE#1745 / Intel
>             XE#7385)
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1397 / Intel XE#7385)
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#7178 / Intel XE#7351)
>      * igt@kms_frontbuffer_tracking@drrs-1p-rte:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6312 / Intel XE#651)
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#656)
>      * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#7283)
>      * igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#599 / Intel XE#7382) +3 other
>             tests skip
>      * igt@kms_setmode@basic@pipe-a-edp-1:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#6361) +2 other tests fail
>      * igt@xe_eudebug@vm-bind-clear-faultable:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#7636) +1 other test skip
>      * igt@xe_evict@evict-small-external-multi-queue-cm:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6540 / Intel XE#688)
>      * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1392)
>      * igt@xe_exec_fault_mode@twice-multi-queue-rebind-imm:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#7136) +2 other tests skip
>      * igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-basic-smem:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6874) +2 other tests skip
>      * igt@xe_exec_threads@threads-multi-queue-fd-userptr-rebind:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#7138)
>      * igt@xe_multigpu_svm@mgpu-latency-basic:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6964)
>      * igt@xe_pm@d3cold-basic:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2284 / Intel XE#366 / Intel
>             XE#7370)
>      * igt@xe_query@multigpu-query-topology:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#944) +1 other test skip
> 
>     Possible fixes
> 
>      * igt@kms_pm_dc@dc5-dpms:
> 
>           * shard-lnl: FAIL (Intel XE#7340 / Intel XE#7504) -> PASS
>      * igt@kms_vrr@cmrr@pipe-a-edp-1:
> 
>           * shard-lnl: FAIL (Intel XE#4459) -> PASS +1 other test pass
> 
> Build changes
> 
>      * IGT: IGT_8840 -> IGTPW_14904
> 
>    IGTPW_14904: 14904
>    IGT_8840: 8840
>    xe-4833-5d36e6d54e963f0c1137aaf2249d2baa781f08c2:
>    5d36e6d54e963f0c1137aaf2249d2baa781f08c2
