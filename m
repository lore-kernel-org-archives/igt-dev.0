Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B7B6D1039A
	for <igt-dev@archiver.kernel.org>; Wed, 26 Nov 2025 09:13:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B97910E57F;
	Wed, 26 Nov 2025 09:13:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L286+mx3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 486EF10E57F;
 Wed, 26 Nov 2025 09:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764148415; x=1795684415;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2OWgAlNcRRknj4YvVsc4aMefKRVMB1zcOgI7YTb8GMk=;
 b=L286+mx3KZ++TUjyVnQ5SdYbj/nnW3XYElWNNnP50QaZKBlM1GDlC61N
 1aW3G+7WQWGXk0sLzDeL2UJ8dQo8RgHVNAx44etmD1zTUq4LdL4C+cf+/
 rzDuPlqbr9YgwEiyXFbj2XOyy28mCYfxlDFOPq37N6i5SkVUcOGD2uK6c
 jhBPCMuOT/kHFHESRuY309H+0QtDDsRlAjIUrbMNPPqwAp79iGrPPbtUK
 FRy9UuHKk0D/5yiuzKDl422cxFhRjCrF9mbsoOmSpK47o0BHGeHsVeiOd
 cepCk2sM2CHDx5a63m9QNQPplXjT+QMZFND7xKbx2sUCcFTy5JSmoebOU Q==;
X-CSE-ConnectionGUID: 6M7si/r9SKWsudyxdMw8vQ==
X-CSE-MsgGUID: 7f6U0RURRmGKokip0SJxaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="66137211"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="66137211"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 01:13:33 -0800
X-CSE-ConnectionGUID: RaJy1iQ2T6SXtvo/0qka0Q==
X-CSE-MsgGUID: i9QjHEwMTRWpJ4kRWpPcGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="216246285"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 01:13:29 -0800
Date: Wed, 26 Nov 2025 10:13:11 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 lib/igt_dir: Fix fdopendir usage (rev2)
Message-ID: <20251126091311.7ln67rdy3pbbqwg7@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20251124172534.61724-1-kamil.konieczny@linux.intel.com>
 <176414584600.29053.4187967965831859773@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <176414584600.29053.4187967965831859773@a3b018990fe9>
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
On 2025-11-26 at 08:30:46 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/igt_dir: Fix fdopendir usage (rev2)
> URL   : https://patchwork.freedesktop.org/series/157981/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8638_FULL -> XEIGTPW_14115_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_14115_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_14115_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 3)
> ------------------------------
> 
>   Missing    (1): shard-adlp 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_14115_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>     - shard-bmg:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8638/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14115/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
> 
>   * igt@kms_content_protection@dp-mst-suspend-resume:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][3]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14115/shard-dg2-466/igt@kms_content_protection@dp-mst-suspend-resume.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][4] +1 other test fail
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14115/shard-dg2-435/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
>     - shard-lnl:          NOTRUN -> [SKIP][5] +1 other test skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14115/shard-lnl-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
>     - shard-bmg:          NOTRUN -> [SKIP][6] +3 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14115/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
> 

Unrelated.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_14115_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> 
...cut...
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8638 -> IGTPW_14115
>   * Linux: xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362 -> xe-4149-8052b0ba2e97387477c22ba816fabca9a4728aae
> 
>   IGTPW_14115: 98c6008440bbd41f4b17c0dce8a1ffe8b561716d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8638: 72d5c74eb3cf46af2f46daba8109d84c3dd19363 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362: 0a21e96e0b6840d2a4e0b45a957679eeddeb4362
>   xe-4149-8052b0ba2e97387477c22ba816fabca9a4728aae: 8052b0ba2e97387477c22ba816fabca9a4728aae
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14115/index.html
