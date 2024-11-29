Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A9AD729E9
	for <igt-dev@archiver.kernel.org>; Fri, 29 Nov 2024 16:36:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D812C10E53B;
	Fri, 29 Nov 2024 16:36:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IROdT8ej";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56E8610E539;
 Fri, 29 Nov 2024 16:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732898174; x=1764434174;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Y8BTCA8mdHdVU+ahHTrDn2SK6e+wGviNzEcFR3KKXlA=;
 b=IROdT8ejyzBTXd8/r06B36GqRlwSzJgklQR2sXxxU+b2w8NjpBsoNmSZ
 ZNzbTWysPk8+Rk6MPC+fd/QyN5PDTGHvgBeXMJpgwt4vdjh4HBaTr1WeQ
 VhCF5uE42DLvX2mgx8Vx5FMNhB8jF1osT09AZ4Vi6/9/+hqCjjh2WJAB/
 +o9fDsf6Yu9qM5/L2j/kqronsnsqPNWDJWnEOUwbaoHJAALV1QKOVuv8D
 S7cfq2pTnMCY7QdJDO3ctVdBPzUkBZS483HBzlboXa4Mxg5TLpJFOPe0U
 mkVLEgF+1eNPIVhJfnQObhKtGC1LRFCtosDf5Sl+XwiVs/WG54E2evtIe A==;
X-CSE-ConnectionGUID: RfYeSRjMTC+OpDQrJHDeJA==
X-CSE-MsgGUID: 5lViZ+aeTtaa1LhqbGskMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="36921346"
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; d="scan'208";a="36921346"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2024 08:36:13 -0800
X-CSE-ConnectionGUID: j3TTeMgbQR2cHw+eWUQ2sg==
X-CSE-MsgGUID: ufzRRTVwSBW/HCACvfsgVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; d="scan'208";a="97298705"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 08:36:11 -0800
Date: Fri, 29 Nov 2024 17:36:09 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>, I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests=2Fint?=
 =?utf-8?Q?el=2Fxe=5Ffault=5Finjection?= =?utf-8?Q?=3A?= Pick a valid PAT
 index for vm_bind
Message-ID: <20241129163609.yz7qxurijduu5dzd@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Matt Roper <matthew.d.roper@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20241125185432.1187252-1-matthew.d.roper@intel.com>
 <173259619737.3174115.4367677473893726584@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173259619737.3174115.4367677473893726584@b555e5b46a47>
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
On 2024-11-26 at 04:43:17 -0000, Patchwork wrote:
> == Series Details ==

Tests other than xe_fault_injection are unrelated, for this
particular one see comments below.

> 
> Series: tests/intel/xe_fault_injection: Pick a valid PAT index for vm_bind
> URL   : https://patchwork.freedesktop.org/series/141767/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8125_full -> XEIGTPW_12196_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12196_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12196_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_12196_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
>     - shard-lnl:          [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-lnl-7/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12196/shard-lnl-6/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [ABORT][3] +1 other test abort
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12196/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_vblank@wait-forked-busy-hang:
>     - shard-bmg:          [PASS][4] -> [INCOMPLETE][5] +2 other tests incomplete
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-1/igt@kms_vblank@wait-forked-busy-hang.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12196/shard-bmg-5/igt@kms_vblank@wait-forked-busy-hang.html
> 
>   * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race:
>     - shard-lnl:          [PASS][6] -> [FAIL][7]
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-lnl-3/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12196/shard-lnl-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race.html
> 
>   * igt@xe_wedged@wedged-at-any-timeout:
>     - shard-bmg:          NOTRUN -> [ABORT][8]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12196/shard-bmg-6/igt@xe_wedged@wedged-at-any-timeout.html
> 
>   
> #### Warnings ####
> 
>   * igt@xe_eudebug_online@pagefault-read:
>     - shard-dg2-set2:     [SKIP][9] ([Intel XE#1130]) -> [SKIP][10]
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@xe_eudebug_online@pagefault-read.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12196/shard-dg2-435/igt@xe_eudebug_online@pagefault-read.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_12196_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
...cut...

>   * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][147] ([Intel XE#3343])
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12196/shard-dg2-463/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
>     - shard-bmg:          [PASS][148] -> [DMESG-WARN][149] ([Intel XE#3343] / [Intel XE#3468])
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12196/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
> 
>   * igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:
>     - shard-bmg:          [PASS][150] -> [DMESG-WARN][151] ([Intel XE#3467] / [Intel XE#3468])
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12196/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html
> 

These are imho some valid bugs with pm audio.

>   * igt@xe_live_ktest@xe_migrate:

...cut...

>   
> #### Possible fixes ####
> 
>   * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
>     - shard-bmg:          [DMESG-WARN][244] ([Intel XE#3467] / [Intel XE#3468]) -> [PASS][245] +1 other test pass
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12196/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
> 

XE#3468 is audio power refcount bug.
WARNING:.* at drivers/gpu/drm/i915/display/intel_display_power.c.* __intel_display_power_put_domain

>   * igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:
>     - shard-bmg:          [DMESG-WARN][246] ([Intel XE#3467]) -> [PASS][247] +3 other tests pass
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12196/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html
> 

XE#3467 is audio power refcount bug.
*ERROR* audio power refcount 1 after unbind

>   * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
>     - shard-bmg:          [DMESG-WARN][248] ([Intel XE#3343] / [Intel XE#3468]) -> [PASS][249]
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12196/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

XE#3343 was fixed by other patch.

> 
>   * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
>     - shard-lnl:          [FAIL][250] ([Intel XE#3499]) -> [PASS][251] +4 other tests pass
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-lnl-6/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12196/shard-lnl-6/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html

XE#3399 was fixed by this patch.

> 
>   * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:
>     - shard-bmg:          [FAIL][252] ([Intel XE#3499]) -> [PASS][253]
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12196/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html
> 

Same here.

>   * igt@xe_gt_freq@freq_suspend:

>   
> #### Warnings ####
> 
...cut...


>   * igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:
>     - shard-bmg:          [DMESG-WARN][538] ([Intel XE#3343] / [Intel XE#3468]) -> [DMESG-WARN][539] ([Intel XE#3343])
>    [538]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html
>    [539]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12196/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html
>     - shard-dg2-set2:     [SKIP][540] ([Intel XE#1130]) -> [DMESG-WARN][541] ([Intel XE#3343])
>    [540]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html
>    [541]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12196/shard-dg2-432/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html
> 
>   * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
>     - shard-dg2-set2:     [DMESG-WARN][542] ([Intel XE#3343]) -> [SKIP][543] ([Intel XE#1130])
>    [542]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-463/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
>    [543]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12196/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
> 
>   * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:
>     - shard-bmg:          [FAIL][544] ([Intel XE#3499]) -> [DMESG-WARN][545] ([Intel XE#3467] / [Intel XE#3468])
>    [544]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
>    [545]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12196/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
> 
>   * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
>     - shard-bmg:          [DMESG-FAIL][546] ([Intel XE#3467]) -> [DMESG-WARN][547] ([Intel XE#3467] / [Intel XE#3468])
>    [546]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-bmg-7/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
>    [547]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12196/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
> 
>   * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:
>     - shard-dg2-set2:     [DMESG-WARN][548] ([Intel XE#3467]) -> [SKIP][549] ([Intel XE#1130]) +3 other tests skip
>    [548]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8125/shard-dg2-435/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html
>    [549]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12196/shard-dg2-434/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html
> 
>   * igt@xe_huc_copy@huc_copy:
...cut...
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8125 -> IGTPW_12196
>   * Linux: xe-2275-6510562075d8541c218e72188f9ef339f8ba371f -> xe-2276-ae312905c5a9fc7ce599a74422f068725101c475
> 
>   IGTPW_12196: 12196
>   IGT_8125: fbfda23ba003aab3454436d95c233dcf5e3bee54 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2275-6510562075d8541c218e72188f9ef339f8ba371f: 6510562075d8541c218e72188f9ef339f8ba371f
>   xe-2276-ae312905c5a9fc7ce599a74422f068725101c475: ae312905c5a9fc7ce599a74422f068725101c475
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12196/index.html
