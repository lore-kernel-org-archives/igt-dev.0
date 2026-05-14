Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 865CBCD4F25
	for <igt-dev@archiver.kernel.org>; Thu, 14 May 2026 11:26:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 375F510E3E5;
	Thu, 14 May 2026 11:26:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k6Rbm41L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC9B10E3A2;
 Thu, 14 May 2026 11:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778757951; x=1810293951;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JEqE32kh9R6Yxggt89KSnR6EYi0g+pALY85ELnNWj18=;
 b=k6Rbm41LnrG1et7ywen5eS8a91LI60PR4oZ5cXkn/NAK4yFEzYiZiMlE
 ZsrsfaKcxFpl2xuARDoO3lINu8bsQdpLKdPrID3Yhs/NiV5Hg7n6jkG5u
 ZIriowHMZ391xKGnWHEVtN9PaLFvdLVuBkzB+hm0TpOJmGr5UX3t0IXWV
 GWmxfSjuzNSzEYFX2Myp24msmYqOgTYYihapEy94kEACd0qpr2glucAvc
 4cuJaeEeKauDlYCWByIB8GOicOrhNwRvbFzdBvSnqXBUSMBoBU4kdX/NT
 j8EcoHUkhxivOWW82DTa/TbkSGUKMKQ7vxGvG7bejnS7R4OKkr1k8RQre Q==;
X-CSE-ConnectionGUID: QGWfQN4+R+qi3p6ImNf10g==
X-CSE-MsgGUID: DZ3uJTRyR3eiluzlc04RQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="90801383"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="90801383"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 04:25:51 -0700
X-CSE-ConnectionGUID: cFNViX4JQ82jHjuCoFZZSw==
X-CSE-MsgGUID: 9YRaoizjRrC8OiHEgyGNlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="238257388"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 04:25:49 -0700
Date: Thu, 14 May 2026 13:25:47 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Xiandong Wang <xiandong.wang@mediatek.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFU?= =?utf-8?Q?=3A?= failure for
 Improve kms_cursor_legacy robustness on MTK
Message-ID: <20260514112547.qv44hkojtuj3vsid@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Xiandong Wang <xiandong.wang@mediatek.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20260506100126.9827-1-xiandong.wang@mediatek.com>
 <177808146803.43382.3078731876658236040@5ab824fced77>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <177808146803.43382.3078731876658236040@5ab824fced77>
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
On 2026-05-06 at 15:31:08 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Improve kms_cursor_legacy robustness on MTK
> URL   : https://patchwork.freedesktop.org/series/166047/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8894 -> IGTPW_15111
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_15111 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_15111, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15111/index.html
> 
> Participating hosts (42 -> 40)
> ------------------------------
> 
>   Missing    (2): bat-dg2-13 fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_15111:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live:
>     - fi-glk-j4005:       [PASS][1] -> [ABORT][2] +1 other test abort
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8894/fi-glk-j4005/igt@i915_selftest@live.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15111/fi-glk-j4005/igt@i915_selftest@live.html
>     - bat-arls-5:         [PASS][3] -> [DMESG-FAIL][4] +1 other test dmesg-fail
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8894/bat-arls-5/igt@i915_selftest@live.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15111/bat-arls-5/igt@i915_selftest@live.html
> 

These are unrelated, please file bugs and run a full testing.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_15111 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@i915_selftest@live@workarounds:
>     - bat-dg2-14:         [PASS][5] -> [DMESG-FAIL][6] ([i915#12061]) +1 other test dmesg-fail
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8894/bat-dg2-14/igt@i915_selftest@live@workarounds.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15111/bat-dg2-14/igt@i915_selftest@live@workarounds.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_selftest@live@workarounds:
>     - bat-arls-6:         [DMESG-FAIL][7] ([i915#12061]) -> [PASS][8] +1 other test pass
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8894/bat-arls-6/igt@i915_selftest@live@workarounds.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15111/bat-arls-6/igt@i915_selftest@live@workarounds.html
> 
>   
>   [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8894 -> IGTPW_15111
> 
>   CI-20190529: 20190529
>   CI_DRM_18417: 835de80ce9b34b618442ba91483170201b50b553 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_15111: e20904c8028abe19ded2a5ce307a86335a74cce5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8894: 044f2c8744a52317c4651b4ca9d3b12f5be51575 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15111/index.html
