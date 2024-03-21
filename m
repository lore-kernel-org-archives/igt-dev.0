Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB97C54E58
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 18:27:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F144110F8C3;
	Thu, 21 Mar 2024 18:27:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nhKNZ+WM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 105EE10F8C1;
 Thu, 21 Mar 2024 18:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711045629; x=1742581629;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jQogO+IIyKf5Lr/kw/rj2n9oNVvfawZt1rfY9hoPdUo=;
 b=nhKNZ+WMLlGok3gr03afaJXUxkORG0MQFXGrLtjWTrecQDV8udpw6qwd
 USg0HA763b8k6Z7ZtMaxH60Z6d4iMH+yWIbpH5It5+uBtPBlTmkhVyt8K
 5xsTbVodVk4gAGAmx0Q+7L4lkgGWPZvMNwSoRhTSifVqYo8Y5jm1sAgue
 GvJOAMHGj15n9wK0Xo9twpwti5dPoWS6Qao8eihUmwnQDgTOby4Y2o7P4
 JQGSdUNVgY9HzuE5/F7Qe+Q/R92OF9sWllZHI2/C/y0uk5dhRTY6Nx0i5
 bxUnsxt+anKqXWPbkWjb1YUdyvpdlZLgx0BAUwJjul9L1bV15tO71RAFV w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="9822154"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; 
   d="scan'208";a="9822154"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 11:26:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="14649344"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2024 11:26:34 -0700
Date: Thu, 21 Mar 2024 19:26:31 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: janga.rahul.kumar@intel.com, I915-ci-infra@lists.freedesktop.org,
 lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmbw==?= =?utf-8?Q?r?=
 lib/intel_compute: Add documentation of global workgroup size
Message-ID: <20240321182631.oznqoukv44d2ofjc@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, janga.rahul.kumar@intel.com,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
References: <20240318085227.2624098-1-janga.rahul.kumar@intel.com>
 <171079936309.900325.3881333328289551675@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171079936309.900325.3881333328289551675@8e613ede5ea5>
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
On 2024-03-18 at 22:02:43 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/intel_compute: Add documentation of global workgroup size
> URL   : https://patchwork.freedesktop.org/series/131245/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14443_full -> IGTPW_10853_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10853_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10853_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10853/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10853_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_eio@kms:
>     - shard-dg2:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14443/shard-dg2-11/igt@gem_eio@kms.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10853/shard-dg2-10/igt@gem_eio@kms.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-2:
>     - shard-glk:          [PASS][3] -> [INCOMPLETE][4] +1 other test incomplete
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14443/shard-glk9/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-2.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10853/shard-glk8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-hdmi-a4:
>     - shard-dg1:          [PASS][5] -> [INCOMPLETE][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14443/shard-dg1-15/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-hdmi-a4.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10853/shard-dg1-15/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-hdmi-a4.html
> 
>   * igt@runner@aborted:
>     - shard-glk:          NOTRUN -> [FAIL][7]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10853/shard-glk3/igt@runner@aborted.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_psr@psr2-sprite-mmap-gtt@edp-1:
>     - shard-mtlp:         [SKIP][8] ([i915#4077] / [i915#9688]) -> [FAIL][9]
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14443/shard-mtlp-6/igt@kms_psr@psr2-sprite-mmap-gtt@edp-1.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10853/shard-mtlp-4/igt@kms_psr@psr2-sprite-mmap-gtt@edp-1.html
> 

These are unrelated to adding comments into code. No need for
respin as this is already merged,

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10853_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@blit-reloc-keep-cache:
>     - shard-dg1:          NOTRUN -> [SKIP][10] ([i915#8411])
> 

...cut...

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7769 -> IGTPW_10853
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_14443: ce8cc731d53f9197a853b0d00386d7835f2b80e6 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10853: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10853/index.html
>   IGT_7769: 7769
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10853/index.html
