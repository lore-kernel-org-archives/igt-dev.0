Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04CEAD44D57
	for <igt-dev@archiver.kernel.org>; Wed,  6 Nov 2024 12:54:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B622D10E1D8;
	Wed,  6 Nov 2024 12:54:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NGUpf1Gl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 653AF10E1D8;
 Wed,  6 Nov 2024 12:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730897686; x=1762433686;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0Eh8pmg4O62a0Ts44cI/VHy4ksQDWOK6JcUlDFMDPr8=;
 b=NGUpf1GlvUYSn3NbepEOzsuYX/WgpFJHcbPbGFqj4vVcWN9Vr2mLAQ/G
 9wanzVB7M79ojLQ/6RT6p5OocUOuSpgfC2xDgX7t8g7jlUBvc100UEi5t
 ZZdyROj4ef1kitjI7atl4ktTrw2n+Drc53bl3MRS+SmoGfTkBC1YDgVLX
 JhJSxEXM/zFpLSFwrWkO4JualE/8mYqomBUrD15nRvM7UIIEsZ7+Px6K/
 du92gSwGtj6jfSQSP20WC9Vv/8Kw7whvsJy6gqil7gOXHd1JkVZa6ZR7D
 OuxWfpBO1p822BuVtactFIcaFmuRdeBvh7a2v6J0YywVoYr4QTIEUCKoI g==;
X-CSE-ConnectionGUID: BgmMKFjqQtqSvQjW6UGYqQ==
X-CSE-MsgGUID: AXQ7kUlGSaW7/QoVTIEBNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="42092115"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; d="scan'208";a="42092115"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 04:54:46 -0800
X-CSE-ConnectionGUID: qFcr9pzBR4+4ku3kvTtZDg==
X-CSE-MsgGUID: lLL4sJMaQP+CaD93d/cKUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; d="scan'208";a="85361621"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 04:54:45 -0800
Date: Wed, 6 Nov 2024 13:54:42 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Petr =?utf-8?B?VmFuxJtr?= <arkamar@atlas.cz>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIENJLnhlRlVMTDogZmFpbHVy?= =?utf-8?Q?e?= for
 lib/igt_profiling: add include for PATH_MAX constant
Message-ID: <20241106125442.hjqgevz62orqosvz@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Petr =?utf-8?B?VmFuxJtr?= <arkamar@atlas.cz>,
 I915-ci-infra@lists.freedesktop.org
References: <20241103171806.10248-1-arkamar@atlas.cz>
 <173089514325.1416479.16463254780121807636@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173089514325.1416479.16463254780121807636@2413ebb6fbb6>
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
On 2024-11-06 at 12:12:23 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/igt_profiling: add include for PATH_MAX constant
> URL   : https://patchwork.freedesktop.org/series/140928/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8097_full -> XEIGTPW_12033_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12033_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12033_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_12033_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_content_protection@lic-type-0@pipe-a-dp-5:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12033/shard-dg2-466/igt@kms_content_protection@lic-type-0@pipe-a-dp-5.html
> 
>   * igt@kms_flip@modeset-vs-vblank-race@d-hdmi-a6:
>     - shard-dg2-set2:     [PASS][2] -> [FAIL][3]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-435/igt@kms_flip@modeset-vs-vblank-race@d-hdmi-a6.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12033/shard-dg2-432/igt@kms_flip@modeset-vs-vblank-race@d-hdmi-a6.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-lnl:          NOTRUN -> [SKIP][4]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12033/shard-lnl-5/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_pm_rpm@legacy-planes:
>     - shard-lnl:          [PASS][5] -> [DMESG-WARN][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-lnl-2/igt@kms_pm_rpm@legacy-planes.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12033/shard-lnl-8/igt@kms_pm_rpm@legacy-planes.html
> 
>   * igt@kms_vblank@wait-busy-hang:
>     - shard-bmg:          [PASS][7] -> [INCOMPLETE][8] +2 other tests incomplete
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-6/igt@kms_vblank@wait-busy-hang.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12033/shard-bmg-5/igt@kms_vblank@wait-busy-hang.html
> 
>   * igt@xe_drm_fdinfo@utilization-single-full-load:
>     - shard-lnl:          [PASS][9] -> [FAIL][10]
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-lnl-8/igt@xe_drm_fdinfo@utilization-single-full-load.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12033/shard-lnl-8/igt@xe_drm_fdinfo@utilization-single-full-load.html
> 

These are unrelated.

>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * {igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp5}:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][11] +5 other tests fail
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12033/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp5.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between XEIGT_8097_full and XEIGTPW_12033_full:
> 
> ### New IGT tests (4) ###
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@d-dp5:
>     - Statuses : 1 pass(s)
>     - Exec time: [4.32] s
> 
>   * igt@kms_flip@flip-vs-rmfb-interruptible@d-dp5:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.93] s
> 
>   * igt@kms_vblank@accuracy-idle@pipe-d-dp-5:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.23] s
> 
>   * igt@kms_vblank@wait-busy@pipe-d-dp-5:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.41] s
> 

These are not introduced by patch.

Regards,
Kamil

>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_12033_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 

...cut...

>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8097 -> IGTPW_12033
>   * Linux: xe-2160-a4532bcf5eea0cfdb56fbdc3195a2d15d193727b -> xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1
> 
>   IGTPW_12033: bf745ac441aa02615c2b7d3384f204b84786fbcc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8097: 2e7c8e4b88a50e33e10d6c13286818aa833bef9b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2160-a4532bcf5eea0cfdb56fbdc3195a2d15d193727b: a4532bcf5eea0cfdb56fbdc3195a2d15d193727b
>   xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1: caa2b9acb44792908e9418d1faf890d72fb327e1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12033/index.html
