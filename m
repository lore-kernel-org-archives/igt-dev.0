Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B30E77188
	for <igt-dev@archiver.kernel.org>; Fri, 20 Dec 2024 16:21:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD39810E051;
	Fri, 20 Dec 2024 16:21:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YfbButes";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC59E10E051;
 Fri, 20 Dec 2024 16:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734711693; x=1766247693;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7qCXz3W7Ef3o114sXSmBo7NqRLIjiJRyE9mSh5ct64c=;
 b=YfbButesNZsylJR2EI159aO2fzT5rMZzCj7xZ7N3QVJeFcl4W6q5RUXC
 BNeOrmk/C26YIIU+YiPHO9QpFT2663we7kQcceraqvAzkM7250RgPf/gY
 v3CJm+//1Eo+OVETGWSars8nPL7px3fggRMkWSTtRqS1tegQIeqRzDPsz
 urrcbxdHAjUbOvIBt3BaXov168sHwrPMkxpm5x6FSTdJxyIT/N/05eqa5
 rzkEsmCoxAMekE+t5ddYPwa1+yHVZt6gpd0UU6C/5nXCjGyMhC/ho+IKO
 q6YNawc4lm9j5HxZTgvBjTbwKrpcbjG+lMk/NkL+OsplGL6Ww4bJelBIS w==;
X-CSE-ConnectionGUID: xAUewYoJQsGhMGxwr2EJJQ==
X-CSE-MsgGUID: K699XWhTT26BxL28HKVtUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="35386164"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="35386164"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 08:21:33 -0800
X-CSE-ConnectionGUID: ZQlAk+cFQdWZocV2NHNmPQ==
X-CSE-MsgGUID: s0FW37BGSBKihxPjNcWIWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="98328147"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 08:21:32 -0800
Date: Fri, 20 Dec 2024 17:21:11 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cg==?= =?utf-8?Q?e?= for
 tests/intel/xe_drm_fdinfo: Do not destroy NULL xe_cork
Message-ID: <20241220162111.nxklluf32mvz4p56@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20241218160808.65340-1-jonathan.cavitt@intel.com>
 <173463576731.514324.9364456352750038938@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173463576731.514324.9364456352750038938@b555e5b46a47>
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
On 2024-12-19 at 19:16:07 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_drm_fdinfo: Do not destroy NULL xe_cork
> URL   : https://patchwork.freedesktop.org/series/142799/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8164_full -> XEIGTPW_12346_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12346_full absolutely need to be
>   verified manually.

Not related to change in xe-drm_fdinfo,

Regards,
Kamil

>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12346_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_12346_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode:
>     - shard-bmg:          [PASS][1] -> [INCOMPLETE][2] +3 other tests incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12346/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_plane_lowres@tiling-x@pipe-a-dp-4:
>     - shard-dg2-set2:     [PASS][3] -> [INCOMPLETE][4] +2 other tests incomplete
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-dg2-435/igt@kms_plane_lowres@tiling-x@pipe-a-dp-4.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12346/shard-dg2-463/igt@kms_plane_lowres@tiling-x@pipe-a-dp-4.html
> 
>   * igt@kms_pm_rpm@system-suspend-modeset:
>     - shard-bmg:          [PASS][5] -> [DMESG-FAIL][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-1/igt@kms_pm_rpm@system-suspend-modeset.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12346/shard-bmg-2/igt@kms_pm_rpm@system-suspend-modeset.html
> 
>   * igt@kms_vblank@ts-continuation-suspend:
>     - shard-bmg:          [PASS][7] -> [FAIL][8] +2 other tests fail
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-6/igt@kms_vblank@ts-continuation-suspend.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12346/shard-bmg-5/igt@kms_vblank@ts-continuation-suspend.html
> 
>   * igt@xe_ccs@suspend-resume:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][9] +2 other tests incomplete
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12346/shard-bmg-3/igt@xe_ccs@suspend-resume.html
> 
>   * igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01:
>     - shard-bmg:          NOTRUN -> [FAIL][10]
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12346/shard-bmg-3/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01.html
> 
>   * igt@xe_pm@s4-basic:
>     - shard-bmg:          [PASS][11] -> [DMESG-WARN][12]
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-7/igt@xe_pm@s4-basic.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12346/shard-bmg-6/igt@xe_pm@s4-basic.html
> 
>   * igt@xe_pm@s4-vm-bind-unbind-all:
>     - shard-bmg:          [PASS][13] -> [TIMEOUT][14] +4 other tests timeout
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-6/igt@xe_pm@s4-vm-bind-unbind-all.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12346/shard-bmg-2/igt@xe_pm@s4-vm-bind-unbind-all.html
> 
>   
> #### Warnings ####
> 
>   * igt@xe_evict@evict-beng-mixed-threads-large:
>     - shard-bmg:          [INCOMPLETE][15] ([Intel XE#1473]) -> [DMESG-FAIL][16]
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8164/shard-bmg-7/igt@xe_evict@evict-beng-mixed-threads-large.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12346/shard-bmg-8/igt@xe_evict@evict-beng-mixed-threads-large.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_12346_full that come from known issues:
> 
> ### IGT changes ###
> 
...cut...

> 
> Build changes
> -------------
> 
>   * IGT: IGT_8164 -> IGTPW_12346
>   * Linux: xe-2396-e9a5d74b7f60fe6f7d55ebe636ff871214b6caec -> xe-2397-d8f0c44e2ed948dcc45d04a0dfa83612995a702b
> 
>   IGTPW_12346: e0bdee76b128153a559de450199ebd3fec2ac24c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8164: e9d9934c7c6dc6878792d82424fc928e7f6996cb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2396-e9a5d74b7f60fe6f7d55ebe636ff871214b6caec: e9a5d74b7f60fe6f7d55ebe636ff871214b6caec
>   xe-2397-d8f0c44e2ed948dcc45d04a0dfa83612995a702b: d8f0c44e2ed948dcc45d04a0dfa83612995a702b
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12346/index.html
