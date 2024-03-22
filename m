Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4391AC47DD9
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 11:07:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD59410F543;
	Fri, 22 Mar 2024 11:07:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WrdOM4WF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C93E10F543;
 Fri, 22 Mar 2024 11:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711105624; x=1742641624;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=i4Ab64bMyQRUWKX6BUfj4EZrzlWAx54/XuZi0gUHMDs=;
 b=WrdOM4WFjduaL2HsOJoANfXxpvjDPLwoEENKQ2YtgVYfQicbe2N18yqH
 DqzSRR19Q3EfuzQVqSXhosLdTXfu+wEaPNm/vsJ+X1wURrqc1gVVgQjue
 +Tx/g6nGFjTVXhSCw4aWrNnnhTfhrGb0KW7PelhqbwUYbhOLwuHqgso2R
 fF7WEG3v0NF6bSAEcd82pjfgJK4KTUG5sng5pD12NoowM+4C6gPi5OfX8
 YSWLFu6TBwq86UjIlDLk6OtvSmaVBDtI0z3KOuPPVYdpmY+zxQfqeGMfD
 ZnUj2MmlTAO67Y+gcAw47lM8AKpzSQwkGW9jMMKGqMpyq5SVhcdQ6Rtt1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6042504"
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; 
   d="scan'208";a="6042504"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 04:07:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; d="scan'208";a="14968745"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 04:07:02 -0700
Date: Fri, 22 Mar 2024 12:07:00 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVA==?= =?utf-8?Q?=3A?= failure for
 Update test documentation for i915 tests (rev5)
Message-ID: <20240322110700.a66d6byrmmaqurg3@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
References: <20240321153847.1787625-1-katarzyna.piecielska@intel.com>
 <171109892389.960365.1614357944542697464@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171109892389.960365.1614357944542697464@8e613ede5ea5>
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
On 2024-03-22 at 09:15:23 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Update test documentation for i915 tests (rev5)
> URL   : https://patchwork.freedesktop.org/series/130665/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14463_full -> IGTPW_10874_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10874_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10874_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10874/index.html
> 
> Participating hosts (9 -> 10)
> ------------------------------
> 
>   Additional (1): shard-snb-0 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10874_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
>     - shard-snb:          [PASS][1] -> [ABORT][2] +1 other test abort
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14463/shard-snb1/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10874/shard-snb6/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html
> 
>   * igt@i915_selftest@live@perf:
>     - shard-dg2:          NOTRUN -> [INCOMPLETE][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10874/shard-dg2-8/igt@i915_selftest@live@perf.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-1:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][4]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10874/shard-glk5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a1:
>     - shard-rkl:          NOTRUN -> [FAIL][5]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10874/shard-rkl-5/igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a1.html
> 

These are unralated to changes in comments (test documentation in C comments),
no need for respin (already merged).

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10874_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@object-reloc-keep-cache:
>     - shard-rkl:          NOTRUN -> [SKIP][6] ([i915#8411]) +1 other test skip
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10874/shard-rkl-5/igt@api_intel_bb@object-reloc-keep-cache.html
>     - shard-dg1:          NOTRUN -> [SKIP][7] ([i915#8411])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10874/shard-dg1-15/igt@api_intel_bb@object-reloc-keep-cache.html
> 

...cut...

> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7774 -> IGTPW_10874
> 
>   CI-20190529: 20190529
>   CI_DRM_14463: 0cd99ca612f004f19c35f4966a584f0a729bbc31 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10874: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10874/index.html
>   IGT_7774: 7774
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10874/index.html
