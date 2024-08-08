Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 566C3C52D6F
	for <igt-dev@archiver.kernel.org>; Thu,  8 Aug 2024 13:25:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E2F10E72A;
	Thu,  8 Aug 2024 13:25:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d9WXoqbK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B4D210E729;
 Thu,  8 Aug 2024 13:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723123549; x=1754659549;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hHtYIa+P8L0LRxkGy5QE3P9w3RSp+i0FokwwIQPX6v4=;
 b=d9WXoqbKA5O3P6ZN5J1vWETi78on2Z3s4NzThf/aIQJfIEH87LmAeUfq
 Y3RqImusN96MBmFFZpSVpZ+NEyJA/+2Z4ZtrufFDBuQ50Rq2ONsWAQqWO
 9ctvUtEE8oXoxZgQQKmA+mYA2cs+wLWRS2OEyfhPqnlu9L2/EsPbJ2BQl
 c2AcTC8u3DvWBRyHGgpfvPhhV5+9To1AyX+kwQZrzNeHZJvEWcugDJuso
 iCziUGUllwmvNbLEq1FQwTm1lB6OIiTF7E4KbQvoA1zBY2IZ5b1uk12EI
 hdz57nFL8ZVyP2jLOThVbv740KfCQnbD+PoV30ekF7NVAJb4rGWPqbMTU g==;
X-CSE-ConnectionGUID: TYl8+bF4RvmKD/M4JAgfBw==
X-CSE-MsgGUID: WHmZakx6QBeE0eu0EF4VSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="31916411"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="31916411"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 06:25:48 -0700
X-CSE-ConnectionGUID: dAAd8a7kRYGXRji5qAvXig==
X-CSE-MsgGUID: Hx0HGF1XS7m1j6BmIGNLAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="61313265"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 06:25:46 -0700
Date: Thu, 8 Aug 2024 15:25:44 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_runner?=
 =?utf-8?Q?=3A?= Allow dynamically ignore dmesg errors or warnings (rev3)
Message-ID: <20240808132544.qxkf5bbk35m6dfma@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20240806144332.80609-1-kamil.konieczny@linux.intel.com>
 <172310517364.549129.1681628799968686003@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <172310517364.549129.1681628799968686003@2413ebb6fbb6>
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
On 2024-08-08 at 08:19:33 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: runner: Allow dynamically ignore dmesg errors or warnings (rev3)
> URL   : https://patchwork.freedesktop.org/series/136494/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7962_BAT -> XEIGTPW_11543_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11543_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11543_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (7 -> 6)
> ------------------------------
> 
>   Missing    (1): bat-lnl-1 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_11543_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
>     - bat-adlp-7:         [PASS][1] -> [INCOMPLETE][2] +5 other tests incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7962/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11543/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
> 
>   * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1:
>     - bat-adlp-7:         [PASS][3] -> [DMESG-WARN][4] +2 other tests dmesg-warn
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7962/bat-adlp-7/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11543/bat-adlp-7/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html
> 
>   * igt@xe_live_ktest@xe_migrate:
>     - bat-pvc-2:          [PASS][5] -> [SKIP][6] +2 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7962/bat-pvc-2/igt@xe_live_ktest@xe_migrate.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11543/bat-pvc-2/igt@xe_live_ktest@xe_migrate.html
>     - bat-atsm-2:         [PASS][7] -> [SKIP][8] +2 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7962/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11543/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html
> 
>   * igt@xe_module_load@load:
>     - bat-dg2-oem2:       [PASS][9] -> [FAIL][10]
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7962/bat-dg2-oem2/igt@xe_module_load@load.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11543/bat-dg2-oem2/igt@xe_module_load@load.html
> 

Above are unrelated.

>   * igt@xe_wedged@basic-wedged:
>     - bat-atsm-2:         NOTRUN -> [DMESG-WARN][11] +1 other test dmesg-warn
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11543/bat-atsm-2/igt@xe_wedged@basic-wedged.html


This looks like a bug in rc2 or in driver:

<3> [765.287417] xe 0000:4d:00.0: [drm] *ERROR* GT0: reset failed (-ECANCELED)
<4> [765.294872] ------------[ cut here ]------------
<4> [765.294881] xe 0000:4d:00.0: [drm] Missing outer runtime PM protection
<4> [765.294945] WARNING: CPU: 18 PID: 11 at drivers/gpu/drm/xe/xe_pm.c:559 xe_pm_runtime_get_noresume+0x48/0x60 [xe]

> 
>   * igt@xe_wedged@wedged-at-any-timeout:
>     - bat-adlp-vf:        NOTRUN -> [ABORT][12]
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11543/bat-adlp-vf/igt@xe_wedged@wedged-at-any-timeout.html
> 

This also looks like a bug in
xe_guc_ads_scheduler_policy_toggle_reset()

<1> [810.005232] BUG: kernel NULL pointer dereference, address: 00000000000003c0
<1> [810.005236] #PF: supervisor read access in kernel mode
<1> [810.005239] #PF: error_code(0x0000) - not-present page
<6> [810.005241] PGD 0 P4D 0 
<4> [810.005243] Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
<4> [810.005246] CPU: 0 UID: 0 PID: 1739 Comm: xe_wedged Tainted: G     U  W          6.11.0-rc2-xe #1
<4> [810.005250] Tainted: [U]=USER, [W]=WARN
<4> [810.005251] Hardware name: Intel Corporation Alder Lake Client Platform/AlderLake-P DDR5 RVP, BIOS RPLPFWI1.R00.4035.A00.2301200723 01/20/2023
<4> [810.005254] RIP: 0010:xe_guc_ads_scheduler_policy_toggle_reset+0x67/0x1f0 [xe]

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11543_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@core_hotunplug@unbind-rebind:
>     - bat-dg2-oem2:       [PASS][13] -> [SKIP][14] ([Intel XE#1885])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7962/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11543/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
> 
>   * igt@fbdev@eof:
>     - bat-dg2-oem2:       [PASS][15] -> [SKIP][16] ([Intel XE#2134]) +4 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7962/bat-dg2-oem2/igt@fbdev@eof.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11543/bat-dg2-oem2/igt@fbdev@eof.html

...cut...

>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>   [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
>   [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7962 -> IGTPW_11543
> 
>   IGTPW_11543: 7cdda8ee1d271299366792ab59a3dc72e436fe27 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7962: 7962
>   xe-1731-4f5d551409fb5562ab0d732120e7ac9b698b5864: 4f5d551409fb5562ab0d732120e7ac9b698b5864
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11543/index.html
