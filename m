Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 149F5C25B74
	for <igt-dev@archiver.kernel.org>; Tue, 21 May 2024 09:18:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DBE410E417;
	Tue, 21 May 2024 09:18:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CRNcVoo6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C83CB10E1D1;
 Tue, 21 May 2024 09:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716283113; x=1747819113;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=eg0P5mQHIWizNjU7/ZuTqZ/WQhZWF2SqfwjcA7Un/dE=;
 b=CRNcVoo6ySrGlbLNChXk8BcCL/mtiZIsojgafjfHceeBy/Hya1KNLfHE
 a5q/KEUbVotgd+DXX2LCvIfJUqWuTiKafzqmxemHei2pvoeByBth1IC2R
 z2a4j66UeExFbfwBsCJYoLAsgz19JRD8tkJOYrmE9MN9JW5Umoq4MKO6M
 fo8yJuNdAg5Iz/isjvBu3CIydF8XGOUFt205xws3iECx/g3lDL1IaAITJ
 C7qDcSEXgX/RD/Y134CddYby7eQEK0bfy7ckuTtVmoz+T93mhE/uPmvRM
 0EqccPdmXghd0AKPi1U7f5hyq2ZIcy/IwrnIq125MGNvA9VWk6z+9rPDF w==;
X-CSE-ConnectionGUID: FafEmL56SsK17V6xCNcdbA==
X-CSE-MsgGUID: 6eNzzl+5S/KyUihjSY78Bw==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12399708"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="12399708"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 02:18:32 -0700
X-CSE-ConnectionGUID: gR04gEERS0emFB+q9KtDyA==
X-CSE-MsgGUID: jbeY4LHxTr6QAnP1HpIX2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="32714261"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2024 02:18:29 -0700
Date: Tue, 21 May 2024 11:18:27 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Pranay Samala <pranay.samala@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_CI=2ExeFULL=3A_failure_fo?= =?utf-8?Q?r?=
 tests/intel/kms_big_fb: Restrict runs on simulation (rev2)
Message-ID: <20240521091827.eonadtpfouvmlyfb@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Pranay Samala <pranay.samala@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20240520172810.455947-1-pranay.samala@intel.com>
 <171623878180.2157358.15959207034711296257@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171623878180.2157358.15959207034711296257@8e613ede5ea5>
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
On 2024-05-20 at 20:59:41 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/kms_big_fb: Restrict runs on simulation (rev2)
> URL   : https://patchwork.freedesktop.org/series/133797/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7864_full -> XEIGTPW_11162_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11162_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11162_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (3 -> 2)
> ------------------------------
> 
>   Missing    (1): shard-adlp 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_11162_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_balancer@once-parallel-userptr-invalidate-race:
>     - shard-dg2-set2:     [PASS][1] -> [FAIL][2] +1 other test fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-464/igt@xe_exec_balancer@once-parallel-userptr-invalidate-race.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11162/shard-dg2-434/igt@xe_exec_balancer@once-parallel-userptr-invalidate-race.html
> 

This is unrelated,

Regard,
Kamil

>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_addfb_basic@invalid-set-prop-any:
>     - {shard-lnl}:        [PASS][3] -> [SKIP][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-lnl-1/igt@kms_addfb_basic@invalid-set-prop-any.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11162/shard-lnl-5/igt@kms_addfb_basic@invalid-set-prop-any.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
>     - {shard-lnl}:        [SKIP][5] ([Intel XE#1421]) -> [FAIL][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-lnl-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11162/shard-lnl-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
> 
>   * igt@kms_flip@plain-flip-ts-check-interruptible@a-edp1:
>     - {shard-lnl}:        [PASS][7] -> [ABORT][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-lnl-4/igt@kms_flip@plain-flip-ts-check-interruptible@a-edp1.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11162/shard-lnl-5/igt@kms_flip@plain-flip-ts-check-interruptible@a-edp1.html
> 
>   * igt@kms_lease@multimaster-lease:
>     - {shard-lnl}:        NOTRUN -> [FAIL][9]
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11162/shard-lnl-4/igt@kms_lease@multimaster-lease.html
> 
>   * igt@kms_pm_rpm@drm-resources-equal:
>     - {shard-lnl}:        NOTRUN -> [SKIP][10]
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11162/shard-lnl-4/igt@kms_pm_rpm@drm-resources-equal.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11162_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@core_hotunplug@hotrebind:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][11] ([Intel XE#1548])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11162/shard-dg2-464/igt@core_hotunplug@hotrebind.html
> 

...cut...

> 
> Build changes
> -------------
> 
>   * IGT: IGT_7864 -> IGTPW_11162
> 
>   IGTPW_11162: 11162
>   IGT_7864: 8eff53c9664fa0abaa55b403c9f10f96260e44b7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1310-1ba62f8cea9c797427d45108df1d453f4b343240: 1ba62f8cea9c797427d45108df1d453f4b343240
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11162/index.html
