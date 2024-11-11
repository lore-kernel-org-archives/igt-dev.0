Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6316D12D71
	for <igt-dev@archiver.kernel.org>; Mon, 11 Nov 2024 05:53:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45E5E10E41F;
	Mon, 11 Nov 2024 05:53:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O/cs+7hi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4210E10E116;
 Mon, 11 Nov 2024 05:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731304396; x=1762840396;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=CIobbMxNoAqSwosdD8HykqJC6F9mizy/FZ0y881aeuU=;
 b=O/cs+7hic05oYY4dNxrLBLRaKqdowOtmj76GqltuY6I0qQhLoc0WUEz1
 kR1+ny6V8X4cZ+7cAUXgIvwLpYJ72dMBtU05Yuhj57psFmkWAdVceLqKi
 P6tHx8MajIx5+HTFXrv+nQQm/ifIpIr2ieeyJFvTYvSifcNrFaIKvqXWC
 eZZyzdYpr2YBB0WwCUGOz2Nq2OtV2OPgPex04P6gM0tPnmgJX24uVJ2E/
 h8CpyoyK+VC3exxmjuLlz8nGm2BclVlNhyTh8N8WvTUOuBU2KvEM5a9Pw
 opHsQDr6t5F9PtUKX5fYk2zDKFSeVaWUg/2BI8r+JBGsfqxxw8vZf9wi/ Q==;
X-CSE-ConnectionGUID: OdDnq1tkSryfIHYNEoHliw==
X-CSE-MsgGUID: Dx37yzfLQd6h9BB6SCIHcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11252"; a="31199808"
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; d="scan'208";a="31199808"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2024 21:53:15 -0800
X-CSE-ConnectionGUID: 7S5ac8d+TwGAzRHETqbVWQ==
X-CSE-MsgGUID: /F+QQAJqQs+GMN4SbWUcmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; d="scan'208";a="91480108"
Received: from amajstox-mobl1.ger.corp.intel.com (HELO [10.213.195.228])
 ([10.213.195.228])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2024 21:53:14 -0800
Message-ID: <56faf3bc-b98c-4bfc-a674-361083e76b03@linux.intel.com>
Date: Mon, 11 Nov 2024 06:53:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2ExeFULL=3A_failure_for_igt-runner_fac?=
 =?UTF-8?Q?t_checking_=28rev5=29?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
 <173121537470.1946529.16725047746575182345@2413ebb6fbb6>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <173121537470.1946529.16725047746575182345@2413ebb6fbb6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Dear I915,

On 10.11.2024 06:09, Patchwork wrote:
> == Series Details ==
> 
> Series: igt-runner fact checking (rev5)
> URL   : https://patchwork.freedesktop.org/series/140841/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8101_full -> XEIGTPW_12073_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12073_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12073_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_12073_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@dpms-off-confusion@b-edp1:
>     - shard-lnl:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8101/shard-lnl-5/igt@kms_flip@dpms-off-confusion@b-edp1.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12073/shard-lnl-4/igt@kms_flip@dpms-off-confusion@b-edp1.html
> 
>   * igt@kms_plane_lowres@tiling-x:
>     - shard-dg2-set2:     [PASS][3] -> [DMESG-WARN][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8101/shard-dg2-464/igt@kms_plane_lowres@tiling-x.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12073/shard-dg2-466/igt@kms_plane_lowres@tiling-x.html
> 
>   * igt@kms_plane_lowres@tiling-x@pipe-a-dp-5:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][5]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12073/shard-dg2-466/igt@kms_plane_lowres@tiling-x@pipe-a-dp-5.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90:
>     - shard-bmg:          NOTRUN -> [SKIP][6]
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12073/shard-bmg-2/igt@kms_rotation_crc@sprite-rotation-90.html
> 
>   * igt@xe_ccs@suspend-resume:
>     - shard-lnl:          [PASS][7] -> [DMESG-WARN][8] +1 other test dmesg-warn
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8101/shard-lnl-7/igt@xe_ccs@suspend-resume.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12073/shard-lnl-5/igt@xe_ccs@suspend-resume.html

These are unrelated to my change.

> 
>   
> #### Warnings ####
> 
>   * igt@kms_rotation_crc@sprite-rotation-270:
>     - shard-dg2-set2:     [SKIP][9] ([Intel XE#2423] / [i915#2575]) -> [SKIP][10]
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8101/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-270.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12073/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-270.html
> 

These are unrelated to my change.

[...]

Thank you!
