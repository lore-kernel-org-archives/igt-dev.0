Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62FDBC52D6F
	for <igt-dev@archiver.kernel.org>; Thu,  8 Aug 2024 13:27:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28F7710E72C;
	Thu,  8 Aug 2024 13:27:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ABdgeRYF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7A5B10E72C;
 Thu,  8 Aug 2024 13:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723123628; x=1754659628;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uBMT9xcom+ANzsmbR+HMvtCqZ5r8t1WeRP8T1kp5L/8=;
 b=ABdgeRYFZ+7A+5AYsfBSYGU/uzSaQ0HTCYmzfiwezL7c8t3c1jZ8QTY7
 gOu472h07STFxS/JcjSDWBVrtzUj5QqlJwnoLxtEAkCDRovgTyyCqU6HD
 gKYj7ti1ItZWeoMvW2cfsr/eZS/ahSdGQcgyl4WqIJOIIlZAxmWnZli1l
 HWh5gRgr0VT13V7e4QFrFtL1gOlzfiFDkCBt72EGzzF+49dFYYdYS48br
 juXwvEHo31FoyMF6yJn+qEtnqhYOrcxuoHURQ4r8jYUlDKHnmnCwO3W9R
 G5WhRopSwCg1x7Zpzfc2gz6tiUV8ezQpeJPL/CVexSZP7BvQMlwWfrLfp w==;
X-CSE-ConnectionGUID: 89xKhGu7TzCeylwqC7tUpw==
X-CSE-MsgGUID: U3BnNh6JTum0CWhFf9A+AA==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21368488"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="21368488"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 06:27:07 -0700
X-CSE-ConnectionGUID: 5+4kc3d4RNu77SNC1q8TKA==
X-CSE-MsgGUID: /IIO0PdaT1aAUBz4MteYwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="62067312"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 06:27:07 -0700
Date: Thu, 8 Aug 2024 15:27:03 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgcnVubmVy?=
 =?utf-8?Q?=3A?= Allow dynamically ignore dmesg errors or warnings (rev3)
Message-ID: <20240808132703.absam7oflzxpzm2w@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20240806144332.80609-1-kamil.konieczny@linux.intel.com>
 <172311087911.549353.2195605945023837013@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <172311087911.549353.2195605945023837013@2413ebb6fbb6>
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
On 2024-08-08 at 09:54:39 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: runner: Allow dynamically ignore dmesg errors or warnings (rev3)
> URL   : https://patchwork.freedesktop.org/series/136494/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7962_full -> IGTPW_11543_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11543_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11543_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11543/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11543_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_vrr@lobf:
>     - shard-dg1:          NOTRUN -> [SKIP][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11543/shard-dg1-14/igt@kms_vrr@lobf.html
> 
>   * igt@perf_pmu@all-busy-idle-check-all:
>     - shard-mtlp:         [PASS][2] -> [FAIL][3]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7962/shard-mtlp-1/igt@perf_pmu@all-busy-idle-check-all.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11543/shard-mtlp-7/igt@perf_pmu@all-busy-idle-check-all.html
> 
>   * igt@perf_pmu@most-busy-idle-check-all@rcs0:
>     - shard-dg1:          [PASS][4] -> [FAIL][5]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7962/shard-dg1-15/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11543/shard-dg1-18/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
> 

Not related to Xe test change.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11543_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@crc32:
>     - shard-tglu:         NOTRUN -> [SKIP][6] ([i915#6230])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11543/shard-tglu-3/igt@api_intel_bb@crc32.html
> 
...cut...
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7962 -> IGTPW_11543
> 
>   CI-20190529: 20190529
>   CI_DRM_15196: 4f5d551409fb5562ab0d732120e7ac9b698b5864 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11543: 7cdda8ee1d271299366792ab59a3dc72e436fe27 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7962: 7962
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11543/index.html
