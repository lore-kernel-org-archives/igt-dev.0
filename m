Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA54C54E5D
	for <igt-dev@archiver.kernel.org>; Tue, 12 Mar 2024 16:07:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F1AA112EB6;
	Tue, 12 Mar 2024 16:07:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="am6Zicw9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05E4910FE2A;
 Tue, 12 Mar 2024 16:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710259618; x=1741795618;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TB/XNFBSTYR7SdEq6BR3m7/IeFo0R9E/cIUTyOvE6CE=;
 b=am6Zicw9qVS0O4QnqDewKZkZGP3Pm3ULCoG0UyvS785CD/Mb79zWlGtp
 WL3P+uoTX7RoeY55qAcIKy4z4gc1A+08IYIiOCTwHo7E/wV9Y3s50Bgg3
 Ie92QqD3jeS1LDiOAjVY0t/gm53Q1StBlC/7JDpQElz4KVfnGubP3arTp
 hQXEnReWXgAV+YIDgynfxcwOfqBiuDVsvdPOZgvkP1qqxi3w/hkfTjYqi
 i7bkTTGUXwcWKymea55sykYCixyPkg5k134CTViUascO7cjJBpyORc3dO
 NuD0e4IksTpM/H8nAg8fe9DZUZcSwQt+pAPpEaqqVND0P1TcfyMBoK4xx w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="15617430"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="15617430"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 09:06:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="16074748"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 09:06:32 -0700
Date: Tue, 12 Mar 2024 17:06:29 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmbw==?= =?utf-8?Q?r?=
 tests/intel/xe_exec_queue_property: fix documentation output
Message-ID: <20240312160629.hgwpxy6on7ed6tif@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
References: <20240311130212.982578-1-mauro.chehab@linux.intel.com>
 <171021459181.681939.12053028630542311739@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171021459181.681939.12053028630542311739@8e613ede5ea5>
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
On 2024-03-12 at 03:36:31 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_exec_queue_property: fix documentation output
> URL   : https://patchwork.freedesktop.org/series/130980/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14420_full -> IGTPW_10803_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10803_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10803_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10803/index.html
> 
> Participating hosts (8 -> 8)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10803_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_eio@in-flight-contexts-10ms:
>     - shard-dg2:          NOTRUN -> [INCOMPLETE][1] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10803/shard-dg2-6/igt@gem_eio@in-flight-contexts-10ms.html
> 
>   * igt@gem_workarounds@suspend-resume-fd:
>     - shard-tglu:         [PASS][2] -> [INCOMPLETE][3]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14420/shard-tglu-8/igt@gem_workarounds@suspend-resume-fd.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10803/shard-tglu-10/igt@gem_workarounds@suspend-resume-fd.html
> 
>   * igt@i915_pm_rpm@gem-mmap-type@fixed-lmem0:
>     - shard-dg2:          [PASS][4] -> [ABORT][5]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14420/shard-dg2-10/igt@i915_pm_rpm@gem-mmap-type@fixed-lmem0.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10803/shard-dg2-2/igt@i915_pm_rpm@gem-mmap-type@fixed-lmem0.html
> 
>   * igt@kms_flip@dpms-vs-vblank-race@a-hdmi-a1:
>     - shard-snb:          [PASS][6] -> [FAIL][7]
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14420/shard-snb7/igt@kms_flip@dpms-vs-vblank-race@a-hdmi-a1.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10803/shard-snb7/igt@kms_flip@dpms-vs-vblank-race@a-hdmi-a1.html
> 
>   * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a4:
>     - shard-dg1:          [PASS][8] -> [FAIL][9]
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14420/shard-dg1-17/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a4.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10803/shard-dg1-18/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a4.html
> 
>   * igt@kms_vblank@query-busy-hang@pipe-a-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [INCOMPLETE][10]
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10803/shard-dg1-15/igt@kms_vblank@query-busy-hang@pipe-a-hdmi-a-4.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-2:
>     - shard-dg2:          NOTRUN -> [ABORT][11]
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10803/shard-dg2-2/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-2.html
> 
>   * igt@perf@gen12-group-concurrent-oa-buffer-read:
>     - shard-rkl:          [PASS][12] -> [FAIL][13] +1 other test fail
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14420/shard-rkl-4/igt@perf@gen12-group-concurrent-oa-buffer-read.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10803/shard-rkl-5/igt@perf@gen12-group-concurrent-oa-buffer-read.html
> 

These are unrelated to change in scripts,

Regards,
Kamil

>   
> #### Warnings ####
> 
>   * igt@gem_eio@reset-stress:
>     - shard-dg1:          [FAIL][14] ([i915#5784]) -> [ABORT][15]
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14420/shard-dg1-18/igt@gem_eio@reset-stress.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10803/shard-dg1-12/igt@gem_eio@reset-stress.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10803_full that come from known issues:
> 
> ### IGT changes ###

...cut...

> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7754 -> IGTPW_10803
> 
>   CI-20190529: 20190529
>   CI_DRM_14420: 61fa386186cb302cf26e29aef76d5b1a6ffe57ad @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10803: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10803/index.html
>   IGT_7754: 5fb3239299b5be2c110aafa483c9e197c53f8bb8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10803/index.html
