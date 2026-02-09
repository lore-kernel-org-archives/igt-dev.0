Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15AA4E81BD3
	for <igt-dev@archiver.kernel.org>; Mon,  9 Feb 2026 16:38:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B54E010E434;
	Mon,  9 Feb 2026 16:38:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NiH/3dc6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C2310E366;
 Mon,  9 Feb 2026 16:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770655124; x=1802191124;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HGVJ1zdzTUPoO5FMR85VEkL5gizxjo4rLFbIsQrLER0=;
 b=NiH/3dc60ErQUeBkbSZp2MejQyzPifkiJJTeMv1BSR1SCGzITr0PnCWx
 8EJc6AX47BdF6lhAx4d9BUEUPnC7RceVBal54NCz9a0H9eodYnex6s2QO
 c5LSRPw4FrrHexMgxF2X1prT7ldhHvMqXsBmtEQrjDvGA8e4TzX/YRoiO
 H0nJkSYj1gqckY+V/SaiDzspp01XtICr9e4Alve+jcfdDugl/Z63hpmrm
 XZYjD4vwueYmFoMn+HS0rjD0RDJxMaCuAciLhKXb4Fy7sy06ukevocsit
 54RWGJlpGzLKaSSPY+f/Vs97pacjF2exJzADPM5NXTouUUD4DHAoZyvrv Q==;
X-CSE-ConnectionGUID: 5DtLFhLNQEi/Nnbelax5uw==
X-CSE-MsgGUID: xfWLIeSNRNSWIL1Kb9GwJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="82409252"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="82409252"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 08:38:43 -0800
X-CSE-ConnectionGUID: jfGfZn2VS2+PXsM1rbUw0A==
X-CSE-MsgGUID: OIPH/7VkSyCpQgy4xdYozQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="242251767"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 08:38:42 -0800
Date: Mon, 9 Feb 2026 17:38:40 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Xiandong Wang <xiandong.wang@mediatek.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVy?= =?utf-8?Q?e?= for
 series starting with [i-g-t,1/1] Skip kms_flip for mtk
Message-ID: <20260209163840.tg5hzt4vt3svvgag@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Xiandong Wang <xiandong.wang@mediatek.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20260209020357.32744-1-xiandong.wang@mediatek.com>
 <177061510429.236635.13924494008802712305@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <177061510429.236635.13924494008802712305@a3b018990fe9>
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
On 2026-02-09 at 05:31:44 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [i-g-t,1/1] Skip kms_flip for mtk
> URL   : https://patchwork.freedesktop.org/series/161324/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_17956_full -> IGTPW_14511_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_14511_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_14511_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14511/index.html
> 
> Participating hosts (10 -> 11)
> ------------------------------
> 
>   Additional (1): shard-dg2-set2 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_14511_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_exec_gttfill@engines:
>     - shard-snb:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17956/shard-snb4/igt@gem_exec_gttfill@engines.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14511/shard-snb6/igt@gem_exec_gttfill@engines.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-c-edp-1-4:
>     - shard-mtlp:         [PASS][3] -> [ABORT][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17956/shard-mtlp-2/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-c-edp-1-4.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14511/shard-mtlp-5/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-c-edp-1-4.html
> 
>   * igt@perf_pmu@all-busy-idle-check-all:
>     - shard-dg1:          [PASS][5] -> [FAIL][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17956/shard-dg1-14/igt@perf_pmu@all-busy-idle-check-all.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14511/shard-dg1-12/igt@perf_pmu@all-busy-idle-check-all.html
> 

Unrelated to kms_flip change for MTK (non-Intel) platform.

Regards,
Kamil

>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_17956_full and IGTPW_14511_full:
> 
> ### New IGT tests (33) ###
> 
>   * igt@kms_async_flips@2x-flip-vs-expired-vblank:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_async_flips@bad-handle:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_async_flips@bad-handle-to-fd:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_async_flips@bad-handle@pipe-b-edp-1-4:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_async_flips@bad-handle@pipe-b-edp-1-x:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_async_flips@bad-handle@pipe-c-edp-1-4:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_async_flips@bad-handle@pipe-c-edp-1-4-rc-ccs:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_async_flips@bad-handle@pipe-c-edp-1-x:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_async_flips@blocking-parameterized:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_async_flips@crc-sprite-planes-basic-yf-tiled-ccs:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_async_flips@ctm-blue-to-red:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_async_flips@cursor-sliding-64x64:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_async_flips@dp-mst-lic-type-1:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_async_flips@fbc-1p-primscrn-indfb-plflip-blt:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_async_flips@fbc-2p-primscrn-indfb-msflip-blt:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_async_flips@fbc-2p-primscrn-shrfb-msflip-blt:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_async_flips@fbc-2p-primscrn-spr-indfb-draw-mmap-gtt:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_async_flips@fbc-2p-primscrn-spr-indfb-draw-mmap-gtt@pipe-a-edp-1-4:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_async_flips@fbc-2p-primscrn-spr-indfb-draw-mmap-gtt@pipe-a-edp-1-x:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_async_flips@fbc-2p-primscrn-spr-indfb-draw-mmap-gtt@pipe-b-edp-1-4-rc-ccs:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_async_flips@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_async_flips@getfb2-into-addfb2:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_async_flips@linear-8bpp-rotate-270:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_async_flips@pi-ringfull:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_async_flips@pixel-format-4-tiled-modifier:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_async_flips@pr-primary-plane-update-sf-dmg-area:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_async_flips@psr-slowdraw:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_async_flips@rc6-suspend:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_async_flips@stress-xrgb8888-yftiled:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_async_flips@system-suspend-execbuf:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_async_flips@wait-immediate:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_async_flips@waits:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_async_flips@y-tiled-8bpp-rotate-90:
>     - Statuses :
>     - Exec time: [None] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_14511_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@device_reset@cold-reset-bound:
>     - shard-mtlp:         NOTRUN -> [SKIP][7] ([i915#11078])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14511/shard-mtlp-4/igt@device_reset@cold-reset-bound.html
> 
...cut...
