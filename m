Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E39C982EA
	for <igt-dev@archiver.kernel.org>; Wed, 23 Sep 2026 08:08:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A5189D8E;
	Wed, 23 Sep 2026 08:08:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DXUy1fbV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D7D289D5C;
 Wed, 23 Sep 2026 08:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790150862; x=1821686862;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=r7ITaGoZwB+HQwLwpJut3ifOYbgGh5YJAdN//yg7rQw=;
 b=DXUy1fbVFQQ9nV2iJX1I6AX33mjKkI3p8clbd+iyrbzTQ/iqv+LfVQlM
 95eafsnmG6EBuuZI8ocUH2fZ/6Dt8ujAn57IztJuvVHv8Wc/FhEMIpdbp
 KoaQFC9mdsEXRL5BG9ZgDW2KlXwx+/5asdMpdCOodKn49Iu7YJAkXN52w
 yu7tkBEvG78Le8UBtEWKxlE3oI3dRIHLNuaqI2lMz2dFBtpv+fxElHFRD
 dPsbWWCfXCA7mVjMMT3fVHtdjLHWICrF/3eyLaFj98bcIroaKYqtMPKgP
 cZXzooKXKdMb6D3m4Ti8WdTP4gFDX9URrEk+PIXf+g+viP9Tt1aG3izHv Q==;
X-CSE-ConnectionGUID: 7KJ7KHB4QouiWu4T0P40TQ==
X-CSE-MsgGUID: t2gziFASREW3YB6wnRV3eQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="90933437"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="90933437"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 01:07:41 -0700
X-CSE-ConnectionGUID: 8TFq3ngjQiue3tdNlWf0KA==
X-CSE-MsgGUID: 4dPC22HJT7Cu1dmhnuPe6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="272987111"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 01:07:40 -0700
Date: Wed, 23 Sep 2026 10:07:19 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 lib/igt_core: Make build reproducible (rev5)
Message-ID: <20260923080719.t3evlzmjc3vspasq@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20260921135515.137949-1-kamil.konieczny@linux.intel.com>
 <179010977112.194524.6153308166306758017@61270ab9df2a>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <179010977112.194524.6153308166306758017@61270ab9df2a>
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
On 2026-09-22 at 20:42:51 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/igt_core: Make build reproducible (rev5)
> URL   : https://patchwork.freedesktop.org/series/173723/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_19195_full -> IGTPW_15874_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_15874_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_15874_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15874/index.html
> 
> Participating hosts (11 -> 10)
> ------------------------------
> 
>   Missing    (1): pig-kbl-iris 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_15874_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live:
>     - shard-tglu:         [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19195/shard-tglu-4/igt@i915_selftest@live.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15874/shard-tglu-3/igt@i915_selftest@live.html
> 
>   * igt@kms_force_connector_basic@force-edid:
>     - shard-glk10:        NOTRUN -> [FAIL][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15874/shard-glk10/igt@kms_force_connector_basic@force-edid.html
>     - shard-rkl:          [PASS][4] -> [FAIL][5]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19195/shard-rkl-7/igt@kms_force_connector_basic@force-edid.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15874/shard-rkl-2/igt@kms_force_connector_basic@force-edid.html
> 
>   * igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:
>     - shard-dg1:          NOTRUN -> [ABORT][6]
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15874/shard-dg1-19/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html
> 
>   * igt@perf_pmu@gt-awake:
>     - shard-snb:          [PASS][7] -> [FAIL][8]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19195/shard-snb7/igt@perf_pmu@gt-awake.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15874/shard-snb4/igt@perf_pmu@gt-awake.html
> 

Unrelated,



Regards,
Kamil

>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_19195_full and IGTPW_15874_full:
> 
> ### New IGT tests (14) ###
> 
>   * igt@gem_render_copy@dc6-dpms:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_render_copy@dsc-fractional-bpp-with-bpc:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_render_copy@fbchdr-2p-primscrn-pri-indfb-draw-pwrite:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_render_copy@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-gtt:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_render_copy@fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-blt:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_render_copy@gem-execbuf-stress:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_render_copy@hdr-rgb101010-draw-mmap-cpu:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_render_copy@heartbeat-close:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_render_copy@load:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_render_copy@map-fixed-invalidate-overlap:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_render_copy@pixel-format-yf-tiled-modifier:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_render_copy@psrhdr-rgb565-draw-render:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_render_copy@rc6-suspend:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_render_copy@set-priority-range:
>     - Statuses :
>     - Exec time: [None] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_15874_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@blit-reloc-purge-cache:
>     - shard-dg2:          NOTRUN -> [SKIP][9] ([i915#8411])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15874/shard-dg2-3/igt@api_intel_bb@blit-reloc-purge-cache.html
>     - shard-rkl:          NOTRUN -> [SKIP][10] ([i915#8411]) +2 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15874/shard-rkl-7/igt@api_intel_bb@blit-reloc-purge-cache.html
> 
...cut...
