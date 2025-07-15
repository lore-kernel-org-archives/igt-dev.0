Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B9AC83F17
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 10:29:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA0BE10E588;
	Tue, 15 Jul 2025 10:29:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AvChsLmU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE58B10E588;
 Tue, 15 Jul 2025 10:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752575383; x=1784111383;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PenQ7euEICmUEfqMiEZvDB2gwIuYHIE1XjWDi1kaWo4=;
 b=AvChsLmUxzRyUn/3ZvQuHQw1cbHMAYSP/E7XNKt11go6F9nY1pEI0yLq
 U6dVlnWQrN2M2Fu+cH73aZaePL8128m3niUTCIvu5kinAszryJkqgTxrZ
 Hxp+T9ahuE9Hs0mTw3rDKRgw5p/KBe+rCddwLK23fboGCjcL09oPRQHjD
 bgWDA9kicEOvSfkxy5qVaHZ+HebuTgn88AkxIRdppoNj/zCXiGPtDvKu4
 N5j4yE2DjNXXpdpmWjd+MbPscERJIECkmK7/+h6Um1+cNtG9XvpKPVxzn
 vn6lE7DrXAWblpSbdQm7igK29Mx+BkLUMrcpqQdN347t6IIOdrU4f3deo g==;
X-CSE-ConnectionGUID: VVhECAIMQyioAT8tKPbPoQ==
X-CSE-MsgGUID: 6I/W6PBSRVmayX8XMOtalQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="58444250"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="58444250"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 03:29:42 -0700
X-CSE-ConnectionGUID: VnE10kbZRmmITdzXrNYsRA==
X-CSE-MsgGUID: yB1sv18NRBeAifCSU2bJeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="157727928"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 03:29:40 -0700
Date: Tue, 15 Jul 2025 12:29:38 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVy?= =?utf-8?Q?e?= for
 intel-ci: Rename i915 blocklist and testlists (rev6)
Message-ID: <20250715102938.ogq46hunlvhbsxib@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250714162435.112599-1-kamil.konieczny@linux.intel.com>
 <175255353399.160915.10242353281335371554@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <175255353399.160915.10242353281335371554@1538d3639d33>
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
On 2025-07-15 at 04:25:33 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: intel-ci: Rename i915 blocklist and testlists (rev6)
> URL   : https://patchwork.freedesktop.org/series/151121/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_16864_full -> IGTPW_13465_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_13465_full absolutely need to be
>   verified manually.
>   

Unrelated, no test was touched, also no need for re-run as I will
merge it soon.

Regards,
Kamil

>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_13465_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13465/index.html
> 
> Participating hosts (11 -> 11)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_13465_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@wf_vblank-ts-check-interruptible@a-vga1:
>     - shard-snb:          [PASS][1] -> [FAIL][2] +1 other test fail
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16864/shard-snb2/igt@kms_flip@wf_vblank-ts-check-interruptible@a-vga1.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13465/shard-snb2/igt@kms_flip@wf_vblank-ts-check-interruptible@a-vga1.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_13465_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@device_reset@unbind-cold-reset-rebind:
>     - shard-tglu:         NOTRUN -> [SKIP][3] ([i915#11078])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13465/shard-tglu-10/igt@device_reset@unbind-cold-reset-rebind.html
>     - shard-dg2-9:        NOTRUN -> [SKIP][4] ([i915#11078])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13465/shard-dg2-9/igt@device_reset@unbind-cold-reset-rebind.html
> 

...cut...
