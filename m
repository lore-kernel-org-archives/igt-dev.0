Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3785C282C6
	for <igt-dev@archiver.kernel.org>; Fri, 28 Feb 2025 15:52:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B053E10ECE5;
	Fri, 28 Feb 2025 15:52:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="igdBfWrY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7344710ECE0;
 Fri, 28 Feb 2025 15:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740757961; x=1772293961;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ro6pRZIJ1rKqIRQpCKiCafiCxds2xXgEXeA3v6k/300=;
 b=igdBfWrY9haFgeoL6v5+ZTSWAVVbmMj+2IGuwry5bAAIiKdBat29u8qz
 p3pHiba4bbwgNRovCIdYW88GuJFXnoWkkd5LyLRZ9RDMCW1yfTUlDTMUS
 Xy9vYSzqA0/PfspxyfwZG7Ddcd+/J9dCleEFyO/8GmhfNx2SMy0yif+8T
 ZJWKekg85w9ZiGWZ8Kjna1HaSC++GZYCrZT3vdmn5+/kD5WngP6cTjNOW
 3edeHgEV4T3aPrGL5L+QIr+XPKhQhVV5GaRuOce6lAhQInnYwR5+g8ceB
 2dhQHDWpoOjXlh+4aCNPJMLdIyWClAnvYE68gey1Dajo378ReBWWF88T0 Q==;
X-CSE-ConnectionGUID: 8gyJGCxCTBKCAxqvrfnSFQ==
X-CSE-MsgGUID: IXi6sJucQBuiU1osMRpVLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="45470572"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="45470572"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 07:52:41 -0800
X-CSE-ConnectionGUID: FjTVydUmR6GK7nGEnB85Yw==
X-CSE-MsgGUID: aHPOW0F4RzONm4IaI0VNnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="122506185"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 07:52:39 -0800
Date: Fri, 28 Feb 2025 16:52:36 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 runner: Parse results harder
Message-ID: <20250228155236.2q3s2yqza5gdilml@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250226193328.132817-1-kamil.konieczny@linux.intel.com>
 <174072007130.3059894.6239757602478443620@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <174072007130.3059894.6239757602478443620@b555e5b46a47>
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
On 2025-02-28 at 05:21:11 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: runner: Parse results harder
> URL   : https://patchwork.freedesktop.org/series/145520/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8251_full -> XEIGTPW_12673_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12673_full absolutely need to be
>   verified manually.

Unrelated to change in igt_runner.

Regards,
Kamil

>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12673_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_12673_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@2x-plain-flip-ts-check-interruptible@ac-hdmi-a2-dp2:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][1] +1 other test fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12673/shard-dg2-432/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ac-hdmi-a2-dp2.html
> 
>   * igt@kms_pm_rpm@modeset-stress-extra-wait:
>     - shard-bmg:          [PASS][2] -> [DMESG-WARN][3]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8251/shard-bmg-4/igt@kms_pm_rpm@modeset-stress-extra-wait.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12673/shard-bmg-2/igt@kms_pm_rpm@modeset-stress-extra-wait.html
>     - shard-dg2-set2:     [PASS][4] -> [DMESG-WARN][5]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8251/shard-dg2-436/igt@kms_pm_rpm@modeset-stress-extra-wait.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12673/shard-dg2-463/igt@kms_pm_rpm@modeset-stress-extra-wait.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_12673_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@intel_hwmon@hwmon-read:
>     - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#1125])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12673/shard-lnl-7/igt@intel_hwmon@hwmon-read.html
> 

...cut...

>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8251 -> IGTPW_12673
>   * Linux: xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176 -> xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4
> 
>   IGTPW_12673: 12673
>   IGT_8251: f0b66883398b4a07bb8fcaa3663a2140129d9a58 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176: 2a3ff290a74cd6294c39faafae2f6033694f1176
>   xe-2729-e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4: e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12673/index.html
