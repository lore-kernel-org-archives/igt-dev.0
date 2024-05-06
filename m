Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E12AC25B4F
	for <igt-dev@archiver.kernel.org>; Mon,  6 May 2024 13:26:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF6CB10FA3E;
	Mon,  6 May 2024 13:26:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K7tGBaTH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEBA310F9E1;
 Mon,  6 May 2024 13:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715002010; x=1746538010;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ljAkWockZtndQgP0n4ICYNKZcdx+QXL9J3L1UzYYvAA=;
 b=K7tGBaTHFlhDGM0PZp0y/VLshjTwZaQ5Fh9moCKc7qBhHA4aZaa9HOif
 IcS0Y2i5LpmX7XaBmfsfqil6S9jCcjovmJ+NJAaRNAlsVg7iMc8hBUpVu
 6Hk0ztZ/bB8l7eITTVrjgrcwUtueVXVE1Zq1R+a6b+pXLHzTntTk/pB5E
 ju0ZUH6PL0u/pB4eQc/YEWXHxAuMMn+Yx3a/2giM95Z7yEwr47hQqPnKf
 /2PVhllXxPZofLeB+Bxm6dJvLLLnchly2Oa4lZj8wF6Qw648o7nnICS0Q
 9gndjBHVlySOcEDfWlMjQHLeuALtEnKlBOgnRY4ppEqEaWAV0OVR5cYWf g==;
X-CSE-ConnectionGUID: lEl+NikIS8+rLsja0SS63w==
X-CSE-MsgGUID: O790qQYWSC+q59eCLRx4dg==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="21901567"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="21901567"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 06:26:49 -0700
X-CSE-ConnectionGUID: V4L2pjZXTPusF6gZPnxuzQ==
X-CSE-MsgGUID: yCzIwTIwQ7qCnZXxdJTNiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="28257976"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 06:26:48 -0700
Date: Mon, 6 May 2024 15:26:45 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVA==?= =?utf-8?Q?=3A?= failure for
 igt_core: Update doc on generated test-list.txt
Message-ID: <20240506132645.lbqewrwbpq3xt6mf@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20240503115545.44784-2-gustavo.sousa@intel.com>
 <171479119203.1888398.15248082316786690302@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171479119203.1888398.15248082316786690302@8e613ede5ea5>
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
On 2024-05-04 at 02:53:12 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: igt_core: Update doc on generated test-list.txt
> URL   : https://patchwork.freedesktop.org/series/133168/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7832_full -> IGTPW_11094_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11094_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11094_full, please notify your bug team (&#x27;I915-ci-infra@lists.freedesktop.org&#x27;) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11094/index.html
> 
> Participating hosts (10 -> 9)
> ------------------------------
> 
>   Missing    (1): shard-snb-0 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11094_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@mman:
>     - shard-dg1:          NOTRUN -> [INCOMPLETE][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11094/shard-dg1-15/igt@i915_selftest@live@mman.html
> 
>   * igt@kms_vblank@query-idle-hang@pipe-d-hdmi-a-1:
>     - shard-dg2:          [PASS][2] -> [INCOMPLETE][3]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7832/shard-dg2-8/igt@kms_vblank@query-idle-hang@pipe-d-hdmi-a-1.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11094/shard-dg2-8/igt@kms_vblank@query-idle-hang@pipe-d-hdmi-a-1.html
> 

These are unrelated, none of above tests were touched.
No need for re-run,

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11094_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@blit-reloc-purge-cache:
>     - shard-dg2:          NOTRUN -> [SKIP][4] ([i915#8411]) +1 other test skip
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11094/shard-dg2-3/igt@api_intel_bb@blit-reloc-purge-cache.html

...cut...

>   [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
>   [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7832 -> IGTPW_11094
> 
>   CI-20190529: 20190529
>   CI_DRM_14707: 3bc655eb4a31c9a89cccac484e09112f73414b29 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11094: 5f6f9614e9708e913fcb57efe83f193bb7e3cc67 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7832: f4a19f8c3a506c6ef7241e80ed966230d18acb03 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11094/index.html
