Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB6DE7716D
	for <igt-dev@archiver.kernel.org>; Wed,  4 Dec 2024 07:30:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C6810EC1B;
	Wed,  4 Dec 2024 07:30:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VfYcIqju";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C509210EC0D;
 Wed,  4 Dec 2024 07:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733297415; x=1764833415;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XEjmeVEs4f0GJpIY1vqcsKAh9fT31CGGgvuTaCN67JM=;
 b=VfYcIqju7VL/Rf+KwDpoFrkLbtZSBxsk89p+EBZo2x5eaiU+41r81kUP
 lJNCuFGHFa4zme/HXHeFD/e1dQ1+5axWqoiyiXhIgxezV5nY4jPD7KX+h
 4RdbDtqGHxunp47x+BAuhDTA8z4/1+8IFgGKPbfc6srPcNS7PdQFkYKgv
 FUR1e3fe5X2/D3X9LjdpG9YNtxYzkEtkpM85sR47Z1FYdoDbbMYfYptAc
 5qqY5fSO/VBfNMnXMu6g64pTAMwVyyed2wprOYDmFMzUW8YUPKp5gXBTq
 AfXgsgRQJ7ZZoftI8zjd9eZ8TMhqv7HeparLNfDQYOAXOUWc5FlYj9n7Q A==;
X-CSE-ConnectionGUID: L/ZPVoTgRYCgBjrLOoeiCA==
X-CSE-MsgGUID: pVtHEFO/QDi9TtI5Xq3FzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="37327413"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="37327413"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 23:30:13 -0800
X-CSE-ConnectionGUID: jkzWNpbCQK2+dMe5F8VUYg==
X-CSE-MsgGUID: Ey6ShlneQvqn37tHxwBQqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="94513293"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 23:30:12 -0800
Date: Wed, 4 Dec 2024 08:30:09 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 tests/vkms: Delete VKMS test list
Message-ID: <20241204073009.mtzvhgzdnywg7vjf@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20241201114506.19947-1-mcanal@igalia.com>
 <173306572004.1292197.7802778642493683151@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173306572004.1292197.7802778642493683151@b555e5b46a47>
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
On 2024-12-01 at 15:08:40 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/vkms: Delete VKMS test list
> URL   : https://patchwork.freedesktop.org/series/141962/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8132_full -> XEIGTPW_12225_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12225_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12225_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_12225_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>     - shard-bmg:          [PASS][1] -> [DMESG-WARN][2] +6 other tests dmesg-warn
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12225/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
> 
>   * igt@kms_lease@atomic-implicit-crtc:
>     - shard-bmg:          [PASS][3] -> [INCOMPLETE][4] +2 other tests incomplete
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-2/igt@kms_lease@atomic-implicit-crtc.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12225/shard-bmg-3/igt@kms_lease@atomic-implicit-crtc.html
> 
>   * igt@kms_plane_lowres@tiling-none@pipe-a-dp-2:
>     - shard-bmg:          [PASS][5] -> [FAIL][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-2/igt@kms_plane_lowres@tiling-none@pipe-a-dp-2.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12225/shard-bmg-3/igt@kms_plane_lowres@tiling-none@pipe-a-dp-2.html
> 
>   * igt@kms_psr@psr2-basic:
>     - shard-lnl:          [PASS][7] -> [FAIL][8] +1 other test fail
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-lnl-7/igt@kms_psr@psr2-basic.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12225/shard-lnl-3/igt@kms_psr@psr2-basic.html
> 
>   * igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:
>     - shard-lnl:          [PASS][9] -> [ABORT][10]
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-lnl-8/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12225/shard-lnl-3/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html
> 

Above are unrelated.

>   
> New tests
> ---------
> 
>   New tests have been introduced between XEIGT_8132_full and XEIGTPW_12225_full:

This definitly do not come from this patch.

Regards,
Kamil

> 
> ### New IGT tests (72) ###
> 
>   * igt@kms_color@deep-color@pipe-a-dp-2-ctm:
>     - Statuses : 1 pass(s)
>     - Exec time: [5.31] s
> 
>   * igt@kms_color@deep-color@pipe-a-dp-2-degamma:
>     - Statuses : 1 pass(s)
>     - Exec time: [5.30] s
> 
>   * igt@kms_color@deep-color@pipe-a-dp-2-gamma:
>     - Statuses : 1 pass(s)
>     - Exec time: [5.30] s
> 
>   * igt@kms_color@deep-color@pipe-b-dp-2-ctm:
>     - Statuses : 1 pass(s)
>     - Exec time: [5.32] s
> 
>   * igt@kms_color@deep-color@pipe-b-dp-2-degamma:
>     - Statuses : 1 pass(s)
>     - Exec time: [5.30] s
> 
>   * igt@kms_color@deep-color@pipe-b-dp-2-gamma:
>     - Statuses : 1 pass(s)
>     - Exec time: [5.31] s
> 
>   * igt@kms_color@deep-color@pipe-c-dp-2-ctm:
>     - Statuses : 1 pass(s)
>     - Exec time: [5.32] s
> 
>   * igt@kms_color@deep-color@pipe-c-dp-2-degamma:
>     - Statuses : 1 pass(s)
>     - Exec time: [5.30] s
> 
>   * igt@kms_color@deep-color@pipe-c-dp-2-gamma:
>     - Statuses : 1 pass(s)
>     - Exec time: [5.30] s
> 
>   * igt@kms_color@deep-color@pipe-d-dp-2-ctm:
>     - Statuses : 1 pass(s)
>     - Exec time: [5.33] s
> 
>   * igt@kms_color@deep-color@pipe-d-dp-2-degamma:
>     - Statuses : 1 pass(s)
>     - Exec time: [5.28] s
> 
>   * igt@kms_color@deep-color@pipe-d-dp-2-gamma:
>     - Statuses : 1 pass(s)
>     - Exec time: [5.31] s
> 
>   * igt@kms_cursor_crc@cursor-offscreen-256x256@pipe-a-dp-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.65] s
> 
>   * igt@kms_cursor_crc@cursor-offscreen-256x256@pipe-d-dp-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.51] s
> 
>   * igt@kms_cursor_crc@cursor-offscreen-64x64@pipe-a-dp-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.68] s
> 
>   * igt@kms_cursor_crc@cursor-offscreen-64x64@pipe-d-dp-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.49] s
> 
>   * igt@kms_cursor_crc@cursor-onscreen-128x128@pipe-a-dp-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.95] s
> 
>   * igt@kms_cursor_crc@cursor-onscreen-128x128@pipe-d-dp-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.76] s
> 
>   * igt@kms_cursor_crc@cursor-onscreen-256x256@pipe-a-dp-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.88] s
> 
>   * igt@kms_cursor_crc@cursor-onscreen-256x256@pipe-d-dp-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.74] s
> 
>   * igt@kms_cursor_crc@cursor-onscreen-64x64@pipe-a-dp-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.94] s
> 
>   * igt@kms_cursor_crc@cursor-onscreen-64x64@pipe-d-dp-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.73] s
> 
>   * igt@kms_cursor_crc@cursor-random-128x128@pipe-a-dp-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [4.80] s
> 
>   * igt@kms_cursor_crc@cursor-random-128x128@pipe-d-dp-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [4.57] s
> 
>   * igt@kms_cursor_crc@cursor-random-256x256@pipe-a-dp-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [4.79] s
> 
>   * igt@kms_cursor_crc@cursor-random-256x256@pipe-d-dp-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [4.58] s
> 
>   * igt@kms_cursor_crc@cursor-random-64x64@pipe-a-dp-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [4.57] s
> 
>   * igt@kms_cursor_crc@cursor-random-64x64@pipe-d-dp-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [4.58] s
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-a-dp-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.61] s
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-dp-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.40] s
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-64x64@pipe-a-dp-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.54] s
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-64x64@pipe-d-dp-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.39] s
> 
>   * igt@kms_cursor_crc@cursor-sliding-128x128@pipe-a-dp-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [4.54] s
> 
>   * igt@kms_cursor_crc@cursor-sliding-128x128@pipe-d-dp-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [4.39] s
> 
>   * igt@kms_cursor_crc@cursor-sliding-256x256@pipe-a-dp-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [4.60] s
> 
>   * igt@kms_cursor_crc@cursor-sliding-256x256@pipe-d-dp-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [4.47] s
> 
>   * igt@kms_cursor_crc@cursor-sliding-64x64@pipe-a-dp-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [4.63] s
> 
>   * igt@kms_cursor_crc@cursor-sliding-64x64@pipe-d-dp-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [4.31] s
> 
>   * igt@kms_plane_alpha_blend@alpha-7efc@pipe-a-dp-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.50] s
> 
>   * igt@kms_plane_alpha_blend@alpha-7efc@pipe-d-dp-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.52] s
> 
>   * igt@kms_plane_alpha_blend@alpha-basic@pipe-a-dp-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.61] s
> 
>   * igt@kms_plane_alpha_blend@alpha-basic@pipe-d-dp-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.66] s
> 
>   * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-dp-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.52] s
> 
>   * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-d-dp-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.55] s
> 
>   * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-dp-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.52] s
> 
>   * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-d-dp-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.53] s
> 
>   * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-a-dp-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.97] s
> 
>   * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-d-dp-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.93] s
> 
>   * igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-a-dp-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.73] s
> 
>   * igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-d-dp-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.77] s
> 
>   * igt@kms_plane_alpha_blend@constant-alpha-min@pipe-a-dp-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.71] s
> 
>   * igt@kms_plane_alpha_blend@constant-alpha-min@pipe-d-dp-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.72] s
> 
>   * igt@kms_plane_alpha_blend@coverage-7efc@pipe-a-dp-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.49] s
> 
>   * igt@kms_plane_alpha_blend@coverage-7efc@pipe-d-dp-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.54] s
> 
>   * igt@kms_plane_cursor@overlay@pipe-a-dp-2-size-128:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.18] s
> 
>   * igt@kms_plane_cursor@overlay@pipe-a-dp-2-size-256:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.18] s
> 
>   * igt@kms_plane_cursor@overlay@pipe-a-dp-2-size-64:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.38] s
> 
>   * igt@kms_plane_cursor@overlay@pipe-d-dp-2-size-128:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.25] s
> 
>   * igt@kms_plane_cursor@overlay@pipe-d-dp-2-size-256:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.21] s
> 
>   * igt@kms_plane_cursor@overlay@pipe-d-dp-2-size-64:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.35] s
> 
>   * igt@kms_plane_cursor@primary@pipe-a-dp-2-size-128:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.95] s
> 
>   * igt@kms_plane_cursor@primary@pipe-a-dp-2-size-256:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.96] s
> 
>   * igt@kms_plane_cursor@primary@pipe-a-dp-2-size-64:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.98] s
> 
>   * igt@kms_plane_cursor@primary@pipe-d-dp-2-size-128:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.95] s
> 
>   * igt@kms_plane_cursor@primary@pipe-d-dp-2-size-256:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.98] s
> 
>   * igt@kms_plane_cursor@primary@pipe-d-dp-2-size-64:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.07] s
> 
>   * igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-128:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.23] s
> 
>   * igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-256:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.18] s
> 
>   * igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.34] s
> 
>   * igt@kms_plane_cursor@viewport@pipe-d-dp-2-size-128:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.23] s
> 
>   * igt@kms_plane_cursor@viewport@pipe-d-dp-2-size-256:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.17] s
> 
>   * igt@kms_plane_cursor@viewport@pipe-d-dp-2-size-64:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.31] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_12225_full that come from known issues:
> 

...cut...

> 
> Build changes
> -------------
> 
>   * IGT: IGT_8132 -> IGTPW_12225
> 
>   IGTPW_12225: 61c3fe7f34c7aa79951575c5668fd63e58d0fa30 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8132: 7675e070cb74c6808050764367f978f6b74ebc36 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2295-108f610005f88de624c1a8c4f85d5cab9f530ddb: 108f610005f88de624c1a8c4f85d5cab9f530ddb
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12225/index.html
