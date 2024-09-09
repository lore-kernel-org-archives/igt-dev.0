Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A3EFECE579
	for <igt-dev@archiver.kernel.org>; Mon,  9 Sep 2024 15:21:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE3C810E5AF;
	Mon,  9 Sep 2024 15:21:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e9e+LbDu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A110B10E5AD;
 Mon,  9 Sep 2024 15:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725895300; x=1757431300;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XkLWjfwLVQkLurJ/7kg5/9+Q41s8e4X93QhCP0QCAAU=;
 b=e9e+LbDuH3JDtg7rGqkV9DtgC4xFFad9TsNS0BY1OphXu07uMFztaSb3
 66ovw5MlF4UNC9S6HTVlNxMYS6gpM0RKkF3UOEHOJrAxLJzaRNkZ3Uudw
 lKYH8wdmVkpCOLZ5JUwbJBGA2aQoxs1UN3fBZdpyGa8tXNt6dTZZWjqah
 eEI1dWrn3ytHaj82VGYdoC3nkBRclf2/jGdIOd0siukH9t7ZEoWIF+liQ
 Cu8IksazXspr+uigBuEvaL0Mkf0wmopDTsH766JZZetgaJBx9PrbOxD7C
 J9oKWEMekCvXUcdxWuIw82sRNxLVSOk/QdAUnzVAtVHDtwqoU0QZg7+3x A==;
X-CSE-ConnectionGUID: Pbnw7POkSquyfz3vjHj4Gw==
X-CSE-MsgGUID: jrwocgo6TwSlA7rnP+C4Jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24098355"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; d="scan'208";a="24098355"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 08:21:40 -0700
X-CSE-ConnectionGUID: 2cyeqEwTQ7G2OJ8BvId7kw==
X-CSE-MsgGUID: RsqXiCtPSh+ywTR7ByctiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; d="scan'208";a="67442941"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 08:21:38 -0700
Date: Mon, 9 Sep 2024 17:21:21 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Alyssa Ross <hi@alyssa.is>, I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIENJLnhlRlVMTDogZmFpbHVy?= =?utf-8?Q?e?= for
 tests/intel/kms_pm_rpm: use basename from libgen.h
Message-ID: <20240909152121.s3r4nowaglmyf2tf@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Alyssa Ross <hi@alyssa.is>,
 I915-ci-infra@lists.freedesktop.org
References: <20240904134948.1337335-1-hi@alyssa.is>
 <172574444562.971860.15713752684341198258@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <172574444562.971860.15713752684341198258@2413ebb6fbb6>
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
On 2024-09-07 at 21:27:25 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/kms_pm_rpm: use basename from libgen.h
> URL   : https://patchwork.freedesktop.org/series/138243/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8006_full -> XEIGTPW_11701_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11701_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11701_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_11701_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_wedged@wedged-at-any-timeout:
>     - shard-lnl:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-lnl-6/igt@xe_wedged@wedged-at-any-timeout.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11701/shard-lnl-6/igt@xe_wedged@wedged-at-any-timeout.html
> 
>   
> #### Warnings ####
> 
>   * igt@xe_wedged@wedged-at-any-timeout:
>     - shard-dg2-set2:     [SKIP][3] ([Intel XE#1130]) -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@xe_wedged@wedged-at-any-timeout.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11701/shard-dg2-435/igt@xe_wedged@wedged-at-any-timeout.html
> 

Unrelated to change in kms_pm_rpm

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11701_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@core_hotunplug@hotreplug-lateclose:
>     - shard-dg2-set2:     [PASS][5] -> [DMESG-WARN][6] ([Intel XE#2317])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-434/igt@core_hotunplug@hotreplug-lateclose.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11701/shard-dg2-436/igt@core_hotunplug@hotreplug-lateclose.html
> 
...cut...
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8006 -> IGTPW_11701
>   * Linux: xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581 -> xe-1899-4384ecebb83afae5e51ab90ff1fc9dc1f7c048a8
> 
>   IGTPW_11701: 11701
>   IGT_8006: ae7f2bc0b99801a7ae369d4b5fda5c6b1c386eb1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581: 883d811c2bfc8544bc5b00bbee84e6b83e20a581
>   xe-1899-4384ecebb83afae5e51ab90ff1fc9dc1f7c048a8: 4384ecebb83afae5e51ab90ff1fc9dc1f7c048a8
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11701/index.html
