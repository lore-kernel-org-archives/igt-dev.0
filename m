Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5522BC369D9
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 08:44:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF1810E70B;
	Wed, 30 Apr 2025 08:44:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IC/vfHxn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 465FF10E0D7;
 Wed, 30 Apr 2025 08:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746002679; x=1777538679;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Xht7XnKtYYiprhUsnAUTBt7IKU69+8DnqaqzaMEVfEI=;
 b=IC/vfHxn7Ov3Sqna54mN3/Pmvtxo1isFCaFbQ4r9KjHzucNxE3sne+Yy
 vGGRMvqX6xz/BN3w0iWrPLI60ciInq/D4YCXzNIa+o+m410iF30ix5oxM
 8zFl61KamrK8HxP5CGr038JYE3Wo1fqbp0pRH8K4UCokplvT4oapwdR+8
 dZCs50HxkP2Eql1G3BeeyfogqKaJzaPx46KsG3wH2WNEQEiAtB5ipkVvq
 twUSNga57DUjDf5gQSu4oEDoBkSjgumfJjBu8JrVazxcvghNjIydOIetS
 9DUX4H7zdHoXyTw49V4m1opCt42FrGa7PrFJGHW2sW5NtSW3jj70hSe3d g==;
X-CSE-ConnectionGUID: RfhRsuXGQKyM9JLZdiDSgA==
X-CSE-MsgGUID: Be2ezKk9QKidQ9zMsZWb8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="59015697"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="59015697"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 01:44:39 -0700
X-CSE-ConnectionGUID: 0bBuv1VfT0a4ybbN/aFtVA==
X-CSE-MsgGUID: 45TfThiWT8Cij9jNmIplkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="135002793"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 01:44:37 -0700
Date: Wed, 30 Apr 2025 10:44:35 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cmUgZm8=?= =?utf-8?Q?r?=
 tests/intel/xe_exec_system_allocator: Fix 32-bit compilation
Message-ID: <20250430084435.tzfjxx6wus462uw3@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20250429143051.36969-1-kamil.konieczny@linux.intel.com>
 <174599592368.28402.15470434404419774677@c664b1dc75d1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <174599592368.28402.15470434404419774677@c664b1dc75d1>
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

Hi,
On 2025-04-30 at 06:52:03 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_exec_system_allocator: Fix 32-bit compilation
> URL   : https://patchwork.freedesktop.org/series/148419/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8344_FULL -> XEIGTPW_13060_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_13060_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_13060_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 3)
> ------------------------------
> 
>   Missing    (1): shard-adlp 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_13060_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_invalid_mode@overflow-vrefresh:
>     - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-dg2-466/igt@kms_invalid_mode@overflow-vrefresh.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13060/shard-dg2-434/igt@kms_invalid_mode@overflow-vrefresh.html
> 
>   * igt@kms_pm_rpm@i2c:
>     - shard-bmg:          [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-6/igt@kms_pm_rpm@i2c.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13060/shard-bmg-1/igt@kms_pm_rpm@i2c.html
>     - shard-dg2-set2:     [PASS][5] -> [FAIL][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-dg2-436/igt@kms_pm_rpm@i2c.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13060/shard-dg2-433/igt@kms_pm_rpm@i2c.html

Above are unrelated.

> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
>     - shard-lnl:          [PASS][7] -> [FAIL][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13060/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
> 


Matthew or Francois, could you help and look into a bug reported in
this test? imho this is not introduced by this change so I will merge
patch now.


>   * igt@xe_pm@s2idle-d3hot-basic-exec:
>     - shard-bmg:          [PASS][9] -> [WARN][10]
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8344/shard-bmg-1/igt@xe_pm@s2idle-d3hot-basic-exec.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13060/shard-bmg-6/igt@xe_pm@s2idle-d3hot-basic-exec.html
> 

Also unrelated.

>   
> New tests
> ---------
> 
>   New tests have been introduced between XEIGT_8344_FULL and XEIGTPW_13060_FULL:
> 
> ### New IGT tests (1) ###
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
>     - Statuses : 1 dmesg-warn(s)
>     - Exec time: [0.34] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_13060_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@intel_hwmon@hwmon-write:
>     - shard-bmg:          NOTRUN -> [FAIL][11] ([Intel XE#4665])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13060/shard-bmg-5/igt@intel_hwmon@hwmon-write.html

...cut...

> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8344 -> IGTPW_13060
>   * Linux: xe-3009-f13165b51331915eb63fdb160331e035ecae35c7 -> xe-3010-11bac2f4b353b42599a9b028f48261d32b94fe34
> 
>   IGTPW_13060: af7fb58db5e270cc4a52628047dc7cf78f62372c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8344: 00f143c5f06f7d5936aacb70dad22be371570d38 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-3009-f13165b51331915eb63fdb160331e035ecae35c7: f13165b51331915eb63fdb160331e035ecae35c7
>   xe-3010-11bac2f4b353b42599a9b028f48261d32b94fe34: 11bac2f4b353b42599a9b028f48261d32b94fe34
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13060/index.html
