Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F25FE77188
	for <igt-dev@archiver.kernel.org>; Tue, 14 Jan 2025 14:31:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E053C10E362;
	Tue, 14 Jan 2025 14:31:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gv7+Ooqg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3B3910E35D;
 Tue, 14 Jan 2025 14:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736865087; x=1768401087;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=sI76Qzat3MdKZgK/Owicb6OwPZbTZVhGCWD+QkvN8Y0=;
 b=Gv7+OoqgiutOQTfUHsfDhizmmGUZi3oVXj8atNuVnIoougEi5O0qWz5e
 R3TTOFjILO3fm0IHm4VfqZRxOo/0guvgQ0WK154QgW6zaptBF0xC7WHP1
 rb6GTA8cBCWR/Vzz+5uv+barrCX4VgRs03VyJ0pcUXQT7S5LJv4angc8w
 7nYTaPBL4vIAshZJWhIYG2R8WhNlFU9ZeIsFpX9pkFG6qpHybqvLalkTm
 rT7GgFVI1ptGn8uMr30kqFrcs/8aSkuzehf/WJV8i4ChR5by+QzFpc2Kx
 oqlUq/KkBMhtXY79SLSKRgjZyucXsLBE3vRVcetc5y37hwFOcqvyC7chD g==;
X-CSE-ConnectionGUID: hWHJDYXTQNuTbVegOVRD6A==
X-CSE-MsgGUID: TQgBMGE5Q9i8D2+leSq3TA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="37274911"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="37274911"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 06:31:26 -0800
X-CSE-ConnectionGUID: FZsqICU7S9ihhgsL9TXvDQ==
X-CSE-MsgGUID: aIS+Xo5SRGCYS2fzKQEJPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="128067733"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 06:31:25 -0800
Date: Tue, 14 Jan 2025 15:31:23 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: "Hajda, Andrzej" <andrzej.hajda@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_lib=2Fmeson?=
 =?utf-8?Q?=2Ebuild=3A?= allow build IGT with link time optimization (rev2)
Message-ID: <20250114143123.q5ybcgznq5wy67vo@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 "Hajda, Andrzej" <andrzej.hajda@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20250109-fix-lto-v2-1-3dc74d60a124@intel.com>
 <173664957296.2741499.5425200845106404861@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173664957296.2741499.5425200845106404861@b555e5b46a47>
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
On 2025-01-12 at 02:39:32 -0000, Patchwork wrote:

below are unrelated to this change,

Regards,
Kamil

> == Series Details ==
> 
> Series: lib/meson.build: allow build IGT with link time optimization (rev2)
> URL   : https://patchwork.freedesktop.org/series/142655/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8184_full -> XEIGTPW_12419_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12419_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12419_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_12419_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@core_setmaster@master-drop-set-user:
>     - shard-bmg:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8184/shard-bmg-4/igt@core_setmaster@master-drop-set-user.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12419/shard-bmg-1/igt@core_setmaster@master-drop-set-user.html
> 
>   * igt@kms_atomic_transition@plane-all-transition-nonblocking:
>     - shard-dg2-set2:     [PASS][3] -> [INCOMPLETE][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8184/shard-dg2-432/igt@kms_atomic_transition@plane-all-transition-nonblocking.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12419/shard-dg2-463/igt@kms_atomic_transition@plane-all-transition-nonblocking.html
> 
>   * igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][5]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12419/shard-dg2-463/igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>     - shard-bmg:          [PASS][6] -> [INCOMPLETE][7]
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8184/shard-bmg-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12419/shard-bmg-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
>     - shard-dg2-set2:     [PASS][8] -> [ABORT][9]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8184/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12419/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-2:
>     - shard-dg2-set2:     NOTRUN -> [ABORT][10] +3 other tests abort
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12419/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-2.html
> 
>   * igt@kms_flip@wf_vblank-ts-check@b-edp1:
>     - shard-lnl:          [PASS][11] -> [INCOMPLETE][12]
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8184/shard-lnl-1/igt@kms_flip@wf_vblank-ts-check@b-edp1.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12419/shard-lnl-1/igt@kms_flip@wf_vblank-ts-check@b-edp1.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][13]
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12419/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html
> 
>   
> #### Warnings ####
> 
>   * igt@xe_evict@evict-beng-mixed-threads-large:
>     - shard-bmg:          [INCOMPLETE][14] ([Intel XE#1473]) -> [DMESG-FAIL][15]
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8184/shard-bmg-2/igt@xe_evict@evict-beng-mixed-threads-large.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12419/shard-bmg-4/igt@xe_evict@evict-beng-mixed-threads-large.html
> 
>   * igt@xe_mmap@pci-membarrier-bad-object:
>     - shard-bmg:          [SKIP][16] ([Intel XE#1130]) -> [SKIP][17]
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8184/shard-bmg-4/igt@xe_mmap@pci-membarrier-bad-object.html
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12419/shard-bmg-2/igt@xe_mmap@pci-membarrier-bad-object.html
>     - shard-dg2-set2:     [SKIP][18] ([Intel XE#1130]) -> [SKIP][19]
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8184/shard-dg2-436/igt@xe_mmap@pci-membarrier-bad-object.html
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12419/shard-dg2-436/igt@xe_mmap@pci-membarrier-bad-object.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_12419_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@alternate-sync-async-flip:
>     - shard-bmg:          [PASS][20] -> [FAIL][21] ([Intel XE#827]) +1 other test fail
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8184/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip.html
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12419/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip.html

...cut...

>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>   [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8184 -> IGTPW_12419
>   * Linux: xe-2462-c9da975358cd0763449f08b7063ee935eace4f8c -> xe-2463-424f495e9572bf87a42e3be0aa02ac4777541033
> 
>   IGTPW_12419: 0f0904e71a31e60759ac032b5c424588e435a746 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8184: ee7a3ac616f55f6ed1b959ff951237099bda86d8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2462-c9da975358cd0763449f08b7063ee935eace4f8c: c9da975358cd0763449f08b7063ee935eace4f8c
>   xe-2463-424f495e9572bf87a42e3be0aa02ac4777541033: 424f495e9572bf87a42e3be0aa02ac4777541033
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12419/index.html
