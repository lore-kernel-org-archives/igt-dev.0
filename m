Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20B3BC4707B
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jan 2024 09:47:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1CF210E777;
	Thu, 18 Jan 2024 09:47:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 924F110E770;
 Thu, 18 Jan 2024 09:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705571231; x=1737107231;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xLelL1tMu4LRgcDCFlZC9P2bUUDsNdExC3E3NXnFm0o=;
 b=VoiHvkF8vPRElf3VQsDoUx/k6uJVH9YKKwa0Qg8p3hbGq7zQzRznMYOQ
 ux/GKEjlztEu/up+0rvFdB7LSw4DQDz/nVPGd8XBBJtGGDSY4XyN7crQS
 sUxnQIFJPfgwmmzRTkhtpLjjf7Uh/QRE1iiOUneSmqE/znniNOEhjMfJN
 a4WRrMOQ28u0MaV/kTSHpG/cZHo9r27bK0eWpk9CpsQFp0EjrXkoypn7M
 5IRlPbPqwwyN4bIzJovc/9bDkyaGLWKnaAXGPrBFgg7E6kjQgvEU1wna0
 nqG7dgcKU3/HBAbh8sOuDUkHGaVIw8CXBKQgV8c2NzH4zHvrAFMEfbYy4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7098187"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="7098187"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 01:47:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="957771008"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="957771008"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orsmga005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 01:47:08 -0800
Date: Thu, 18 Jan 2024 10:47:06 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVA==?= =?utf-8?Q?=3A?= failure for
 tests/kms: fix pixel format functionality
Message-ID: <20240118094706.hfml2n4scwtju3qd@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 "Sharma, Swati2" <swati2.sharma@intel.com>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
References: <20240117081416.234172-1-swati2.sharma@intel.com>
 <170549024593.520770.1242418493532134542@5338d5abeb45>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170549024593.520770.1242418493532134542@5338d5abeb45>
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
Cc: lgci.bug.filing@intel.com, I915-ci-infra@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi igt-dev,
On 2024-01-17 at 11:17:25 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/kms: fix pixel format functionality
> URL   : https://patchwork.freedesktop.org/series/128866/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7676_full -> IGTPW_10540_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10540_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10540_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10540/index.html
> 
> Participating hosts (8 -> 8)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10540_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@gt_pm:
>     - shard-rkl:          [PASS][1] -> [DMESG-FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7676/shard-rkl-1/igt@i915_selftest@live@gt_pm.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10540/shard-rkl-4/igt@i915_selftest@live@gt_pm.html
> 
>   * igt@kms_flip@flip-vs-rmfb-interruptible@d-hdmi-a1:
>     - shard-tglu:         [PASS][3] -> [INCOMPLETE][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7676/shard-tglu-4/igt@kms_flip@flip-vs-rmfb-interruptible@d-hdmi-a1.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10540/shard-tglu-8/igt@kms_flip@flip-vs-rmfb-interruptible@d-hdmi-a1.html
> 

Unrelated to documentation (comments) introduced in a patch, no need for respin.

Regrads,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10540_full that come from known issues:
> 
> ### IGT changes ###
> 

...cut...

> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7676 -> IGTPW_10540
> 
>   CI-20190529: 20190529
>   CI_DRM_14129: b6b50ad4c8d61b14de0ffcf0d52ae2adc0ef39cf @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10540: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10540/index.html
>   IGT_7676: 7676
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10540/index.html
