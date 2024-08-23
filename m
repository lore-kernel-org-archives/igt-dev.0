Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F1C7C531DC
	for <igt-dev@archiver.kernel.org>; Fri, 23 Aug 2024 10:24:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC57510E488;
	Fri, 23 Aug 2024 10:24:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jOURCdEv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A06110E485;
 Fri, 23 Aug 2024 10:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724408695; x=1755944695;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PVc2O//owzd0fzd7UPhklkWkqdGXaaZp3Sev2N+hp9U=;
 b=jOURCdEvpeiLsoQ7bqnRV0nnSMImM5ldjYtMT7vO9Af39wqVrypnzDYK
 hIkaQkwriSouIs/OHnq/+Ud9K3HPIs774FHCR2hFB2TYSVQK2j8oEZgAp
 KZ5YpeQ6fakvfU8AvD3iSq4NTSewqFgtI5PnzaAzd5n5FLww5yfb5LB4h
 s3MrZaNkSyU1DgRk+GcogOliO4LPU5E9Ja/KDOLeHrWN/M1rIEwKGYndI
 BYoEmhaHdgJsFhl0YBgBWpdgscX8ul+Mt4uTsF/e20Yw8JaP5H0Bix3G2
 fCmloju8qz4VQc6yl7GueKiXeMXEYSdvMYSqjWEnsR8ELzm1EFOVAEU37 g==;
X-CSE-ConnectionGUID: 51ivgILqRR2juTi6yuqR3Q==
X-CSE-MsgGUID: O8klHSftRnGw7oTSDsKskQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="26626698"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="26626698"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 03:24:55 -0700
X-CSE-ConnectionGUID: mrqVzcLMT4+IHZKSHOqeEA==
X-CSE-MsgGUID: BhUwNWq5Q7GRjVOAUvX88w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="61731471"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 03:24:54 -0700
Date: Fri, 23 Aug 2024 12:24:51 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgcnVubmVy?=
 =?utf-8?Q?=3A?= Allow dynamically ignore dmesg errors or warnings (rev6)
Message-ID: <20240823102451.6uxjjphh5bfk336r@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20240819103242.26527-1-kamil.konieczny@linux.intel.com>
 <172406767860.678771.10113030628887685428@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <172406767860.678771.10113030628887685428@2413ebb6fbb6>
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
On 2024-08-19 at 11:41:18 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: runner: Allow dynamically ignore dmesg errors or warnings (rev6)
> URL   : https://patchwork.freedesktop.org/series/136494/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_15255 -> IGTPW_11595
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11595 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11595, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11595/index.html
> 
> Participating hosts (41 -> 40)
> ------------------------------
> 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11595:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@slpc:
>     - bat-arlh-2:         [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15255/bat-arlh-2/igt@i915_selftest@live@slpc.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11595/bat-arlh-2/igt@i915_selftest@live@slpc.html
> 

This is unrelated to change.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11595 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@i915_selftest@live@hangcheck:
>     - bat-arls-2:         [PASS][3] -> [DMESG-WARN][4] ([i915#11349] / [i915#11378])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15255/bat-arls-2/igt@i915_selftest@live@hangcheck.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11595/bat-arls-2/igt@i915_selftest@live@hangcheck.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_selftest@live@ring_submission:
>     - fi-cfl-8109u:       [DMESG-WARN][5] ([i915#11621]) -> [PASS][6] +81 other tests pass
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15255/fi-cfl-8109u/igt@i915_selftest@live@ring_submission.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11595/fi-cfl-8109u/igt@i915_selftest@live@ring_submission.html
> 
>   * igt@kms_flip@basic-flip-vs-wf_vblank@c-dp2:
>     - fi-cfl-8109u:       [DMESG-WARN][7] ([i915#11621] / [i915#9925]) -> [PASS][8] +37 other tests pass
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15255/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp2.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11595/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp2.html
> 
>   
>   [i915#11349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349
>   [i915#11378]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11378
>   [i915#11621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621
>   [i915#9925]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9925
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7975 -> IGTPW_11595
> 
>   CI-20190529: 20190529
>   CI_DRM_15255: 02f693a1a747b2784cedbbd7f6cf35be9a652d94 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11595: 11595
>   IGT_7975: 7975
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11595/index.html
