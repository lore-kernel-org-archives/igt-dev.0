Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E58BCD342C
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 11:53:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E03FE10E535;
	Wed,  6 May 2026 11:53:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dKcN+o/C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 811B710E535;
 Wed,  6 May 2026 11:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778068420; x=1809604420;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=sXsi+079pRj7UypwQ66BvCGT73FFmZCQoVTirsIPVSM=;
 b=dKcN+o/C1a0roG8uin200uRmW7e3Irtt9bF0dXy4UKXdokVGso0R26kJ
 WnUokGunUggTS12hqJGl5fVEfeeDwmSYbV96Y6icOe23dvJ5y03rvFhwq
 e0FVr+GtXgTcOymD6xCdPxn3/uPDqiiYye2EV4/MQ1No3wnmfT9R6/TM3
 YHZQLO5TGsLhAIUqZfSCeoJDL7U1p5O1x+YIqnurHIEyFPZIqUyftMyZX
 UobHv6gA0lRrDWQTPY4+KeUdlpHvfHD1MUEqKqe+xgCGuW/+SLN9/hGq5
 ku+LtYwM2g3+wMqRrd8P/7M0tcZNbByGwht5w0DOUhQm2emWoo2azNmRM A==;
X-CSE-ConnectionGUID: AfOjVMdMTZ6p/7fITVqPaw==
X-CSE-MsgGUID: iNZcubm8QFST2MPtO3dh9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78019713"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="78019713"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 04:53:40 -0700
X-CSE-ConnectionGUID: FSIqFnGRTaSJaV7Ch6hCtw==
X-CSE-MsgGUID: 5UYvFbIbRMORBlwiAndWNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="274255835"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 04:53:39 -0700
Date: Wed, 6 May 2026 13:53:36 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_lib=2Fdrm?=
 =?utf-8?Q?test?= =?utf-8?Q?=3A?= Create proper error report when open driver
 fails (rev3)
Message-ID: <20260506115336.63wqrga2hhhlq573@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20260428142629.78347-1-kamil.konieczny@linux.intel.com>
 <177744090290.23767.17628295069620355103@5ab824fced77>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <177744090290.23767.17628295069620355103@5ab824fced77>
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
On 2026-04-29 at 05:35:02 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/drmtest: Create proper error report when open driver fails (rev3)
> URL   : https://patchwork.freedesktop.org/series/163593/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8875_full -> IGTPW_15076_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_15076_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_15076_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15076/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_15076_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_eio@in-flight-suspend:
>     - shard-dg2:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8875/shard-dg2-4/igt@gem_eio@in-flight-suspend.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15076/shard-dg2-6/igt@gem_eio@in-flight-suspend.html
> 
>   * igt@gem_mmap_offset@clear-via-pagefault:
>     - shard-tglu:         [PASS][3] -> [INCOMPLETE][4] +1 other test incomplete
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8875/shard-tglu-5/igt@gem_mmap_offset@clear-via-pagefault.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15076/shard-tglu-8/igt@gem_mmap_offset@clear-via-pagefault.html
> 
>   * igt@i915_selftest@live:
>     - shard-dg1:          [PASS][5] -> [ABORT][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8875/shard-dg1-12/igt@i915_selftest@live.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15076/shard-dg1-12/igt@i915_selftest@live.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
>     - shard-dg1:          [PASS][7] -> [FAIL][8]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8875/shard-dg1-15/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15076/shard-dg1-13/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
> 

Unrelated.

>   
> New tests
> ---------
> 
>   New tests have been introduced between IGT_8875_full and IGTPW_15076_full:
> 
> ### New IGT tests (18) ###
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-a-hdmi-a-1-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [6.43] s
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-a-hdmi-a-2-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [6.42] s
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-a-hdmi-a-4-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.23] s
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-a-hdmi-a-4-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [4.21] s
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-a-hdmi-a-4-y-rc-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.29] s
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a-1-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [6.43] s
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a-2-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [6.43] s
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a-4-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.20] s
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a-4-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [4.19] s
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a-4-y-rc-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.25] s
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-c-hdmi-a-1-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.36] s
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-c-hdmi-a-2-yf:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.39] s
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-c-hdmi-a-4-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.22] s
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-c-hdmi-a-4-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [4.20] s
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-c-hdmi-a-4-y-rc-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.26] s
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-hdmi-a-4-x:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.21] s
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-hdmi-a-4-y:
>     - Statuses : 1 pass(s)
>     - Exec time: [4.20] s
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-hdmi-a-4-y-rc-ccs:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.26] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_15076_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_basic@multigpu-create-close:
>     - shard-tglu:         NOTRUN -> [SKIP][9] ([i915#7697])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15076/shard-tglu-5/igt@gem_basic@multigpu-create-close.html
> 
...cut...
