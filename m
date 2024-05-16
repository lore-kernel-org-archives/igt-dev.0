Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 930F4C25B79
	for <igt-dev@archiver.kernel.org>; Thu, 16 May 2024 07:54:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B2210E2DA;
	Thu, 16 May 2024 07:54:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YCzc3PYS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B38F10E1D1;
 Thu, 16 May 2024 07:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715846041; x=1747382041;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PwRCmqOYLr/J7QVaI1gwqOEkfF6Y2vg2yNSq1vWSucg=;
 b=YCzc3PYSgo8VGXNAv+TUTVneqFnov5Pc9etvYxWdAm2zyA/ShUXvpLP/
 vMUHvwC9H7IkiX3XZ/TZo/09EsSVBKg987YgiGOGYL59mQiB/GKnambvS
 l6Qfyk+uCD0ha3X6B33XhKAjq+sdCacdcDFx/5EuWvdoDUwuf9SGbZZly
 eCfxya0w8TMFxb0zmPn2hqYLFp+tayf2HBmJ2QyzWNJfiSLUbTPhuQoj3
 nrmUhRvQLFfo31tDTafiG+JvpFUf27UZzxTDXeu2/zedfFX2RCGEhNXlP
 wXpn+HP0WklkboX8igNkxXKLbONzR6/yAFMLeskM92rq4GWwXtq+w5Cwd Q==;
X-CSE-ConnectionGUID: b/kUyqwbSMyMwGajAeddFg==
X-CSE-MsgGUID: USkaGO4lTzyGfobfa9R69A==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11553380"
X-IronPort-AV: E=Sophos;i="6.08,163,1712646000"; d="scan'208";a="11553380"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 00:54:01 -0700
X-CSE-ConnectionGUID: 9kkHaxsvQJS2WKBtv0dVHg==
X-CSE-MsgGUID: TYPeu++ERy2+gzYRHpBjiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,163,1712646000"; d="scan'208";a="36070861"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 00:53:59 -0700
Date: Thu, 16 May 2024 09:53:42 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVy?= =?utf-8?Q?e?= for
 tests/intel/xe_wedged: Force a rebind before exit
Message-ID: <20240516075342.g2ss233epeeue5ez@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20240515151555.70885-1-rodrigo.vivi@intel.com>
 <171583430283.2118035.11387849499798116686@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171583430283.2118035.11387849499798116686@8e613ede5ea5>
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
On 2024-05-16 at 04:38:22 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_wedged: Force a rebind before exit
> URL   : https://patchwork.freedesktop.org/series/133659/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7855_full -> IGTPW_11147_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11147_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11147_full, please notify your bug team (&#x27;I915-ci-infra@lists.freedesktop.org&#x27;) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11147/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11147_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@fbdev@write:
>     - shard-dg2:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7855/shard-dg2-8/igt@fbdev@write.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11147/shard-dg2-5/igt@fbdev@write.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@c-edp1:
>     - shard-mtlp:         [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7855/shard-mtlp-3/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11147/shard-mtlp-8/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html
> 
>   * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-b-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [INCOMPLETE][5]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11147/shard-dg2-7/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-b-hdmi-a-3.html
> 

Unrelated to Xe test.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11147_full that come from known issues:
> 
> 

...cut...

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7855 -> IGTPW_11147
> 
>   CI-20190529: 20190529
>   CI_DRM_14767: d98c9eae84056cb2d86293c145234017681f09f4 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11147: 11147
>   IGT_7855: 7855
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11147/index.html
