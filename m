Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED19D1AD30
	for <igt-dev@archiver.kernel.org>; Wed, 16 Oct 2024 09:18:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E171A10E6DA;
	Wed, 16 Oct 2024 09:17:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aO5FHlsP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3002D10E6D7;
 Wed, 16 Oct 2024 09:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729070279; x=1760606279;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Zw4rGdMXOb+TFpGVEEObFmiwVzgZxUqYdqHQDSA/DM0=;
 b=aO5FHlsP8KlPsfE56xDHSs4JgT/pMaeHAMqj13vwuDwG1vVN/j1oWvcX
 NxhGpuuEvmPkVVlKgV+dFvpZnjp3uPYu88VTgJPKGVklhWB5H89C37XEZ
 qQDvcRtWYPjv1GibDxmajehO4QLsDD5KPufyF515ur9iq3oMGW7nkylP9
 Z2MocPhFu6IEZ0Ud7SyJlEVPJfEbnPNixHFVSN/NrNEDUn9KzufLiny3U
 AORN/c+jZ0mEWaAXr55BgCY5PwzYSy1nuzPzU/gzkanGy0tqD+PDVVtks
 mM7nVcthp+SJAIs6OQu4Rw+YK52x6F+KN6fz0o5SWwMlbq8oykzV99bsU w==;
X-CSE-ConnectionGUID: iOZWaIfQQwmEZFpDECuakg==
X-CSE-MsgGUID: eEgWadNQScyEoElaSwFY+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39056114"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="39056114"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 02:17:59 -0700
X-CSE-ConnectionGUID: Dx+wArkhTFWTTChh/BUfUw==
X-CSE-MsgGUID: NmuFX6o6RfS+QuuFU6g3jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="78231411"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 02:17:56 -0700
Date: Wed, 16 Oct 2024 11:17:54 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIENJLnhlRlVMTDogZmFpbHVy?= =?utf-8?Q?e?= for
 tests/intel/xe_exec_reset: Explicitly declare exec (rev3)
Message-ID: <20241016091754.nyrobvtsp5665f2v@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20241014220011.264642-1-jonathan.cavitt@intel.com>
 <172901092649.1269939.17544648778101959350@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <172901092649.1269939.17544648778101959350@2413ebb6fbb6>
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
On 2024-10-15 at 16:48:46 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_exec_reset: Explicitly declare exec (rev3)
> URL   : https://patchwork.freedesktop.org/series/139968/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8072_full -> XEIGTPW_11907_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11907_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11907_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_11907_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
>     - shard-dg2-set2:     [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8072/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11907/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][3] +1 other test fail
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11907/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
> 
>   * igt@kms_flip@2x-wf_vblank-ts-check@ac-hdmi-a6-dp4:
>     - shard-dg2-set2:     [PASS][4] -> [FAIL][5] +5 other tests fail
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8072/shard-dg2-432/igt@kms_flip@2x-wf_vblank-ts-check@ac-hdmi-a6-dp4.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11907/shard-dg2-435/igt@kms_flip@2x-wf_vblank-ts-check@ac-hdmi-a6-dp4.html
> 
>   * igt@kms_rmfb@rmfb-ioctl:
>     - shard-lnl:          [PASS][6] -> [INCOMPLETE][7] +1 other test incomplete
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8072/shard-lnl-3/igt@kms_rmfb@rmfb-ioctl.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11907/shard-lnl-7/igt@kms_rmfb@rmfb-ioctl.html
> 

These are unrelated to xe_exec_reset change.

>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@core_setmaster@master-drop-set-user:
>     - {shard-bmg}:        [PASS][8] -> [FAIL][9]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8072/shard-bmg-2/igt@core_setmaster@master-drop-set-user.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11907/shard-bmg-7/igt@core_setmaster@master-drop-set-user.html
> 

btw this looks like BMG card was not detected/dropped by Xe driver?

Regards,
Kamil

>   * igt@kms_chamelium_color@ctm-green-to-red:
>     - {shard-bmg}:        [SKIP][10] ([Intel XE#2325]) -> [SKIP][11]
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8072/shard-bmg-1/igt@kms_chamelium_color@ctm-green-to-red.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11907/shard-bmg-7/igt@kms_chamelium_color@ctm-green-to-red.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
>     - {shard-bmg}:        [SKIP][12] ([Intel XE#2252]) -> [SKIP][13]
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8072/shard-bmg-8/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11907/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html
> 
>   * igt@kms_cursor_crc@cursor-random-32x10:
>     - {shard-bmg}:        [SKIP][14] ([Intel XE#2320]) -> [SKIP][15]
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8072/shard-bmg-7/igt@kms_cursor_crc@cursor-random-32x10.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11907/shard-bmg-7/igt@kms_cursor_crc@cursor-random-32x10.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
>     - {shard-bmg}:        NOTRUN -> [SKIP][16]
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11907/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
> 
>   * igt@kms_feature_discovery@display-4x:
>     - {shard-bmg}:        [SKIP][17] ([Intel XE#1138]) -> [SKIP][18]
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8072/shard-bmg-1/igt@kms_feature_discovery@display-4x.html
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11907/shard-bmg-7/igt@kms_feature_discovery@display-4x.html
> 
>   * igt@kms_pipe_crc_basic@nonblocking-crc:
>     - {shard-bmg}:        [PASS][19] -> [SKIP][20] +13 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8072/shard-bmg-8/igt@kms_pipe_crc_basic@nonblocking-crc.html
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11907/shard-bmg-7/igt@kms_pipe_crc_basic@nonblocking-crc.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-d:
>     - {shard-bmg}:        [PASS][21] -> [INCOMPLETE][22]
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8072/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-d.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11907/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-d.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
>     - {shard-bmg}:        [SKIP][23] ([Intel XE#2763]) -> [SKIP][24]
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8072/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11907/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
> 
>   * igt@kms_rotation_crc@bad-pixel-format:
>     - {shard-bmg}:        [SKIP][25] ([Intel XE#2329]) -> [SKIP][26] +1 other test skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8072/shard-bmg-4/igt@kms_rotation_crc@bad-pixel-format.html
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11907/shard-bmg-7/igt@kms_rotation_crc@bad-pixel-format.html
> 
>   * igt@kms_scaling_modes@scaling-mode-full-aspect:
>     - {shard-bmg}:        [SKIP][27] ([Intel XE#2413]) -> [SKIP][28]
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8072/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-full-aspect.html
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11907/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-full-aspect.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11907_full that come from known issues:
> 
...cut...
>   [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
>   [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8072 -> IGTPW_11907
> 
>   IGTPW_11907: 11907
>   IGT_8072: 8072
>   xe-2069-f98f4e573392b882c0ca5aa1c025e20dbe4aa7e8: f98f4e573392b882c0ca5aa1c025e20dbe4aa7e8
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11907/index.html
