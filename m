Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E6F6E77180
	for <igt-dev@archiver.kernel.org>; Thu, 12 Dec 2024 19:19:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCF7910E656;
	Thu, 12 Dec 2024 19:19:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nxPJCnWH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8643A10E301;
 Thu, 12 Dec 2024 19:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734031154; x=1765567154;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=V10RzgreobjMSNFx/Dgrd/Ukgo/wN5lNxb4F9fAzU2o=;
 b=nxPJCnWHYw/PSpzuiY28RwcycQhQ9lIsdzZ6aU/eoilxGA1pP/jagmjG
 pWC0c77xsTDpKdE2xIixgwfwjeyBDAi0i15dNEL08PC3HJIypMJ3yFzUw
 iyoGIVd1yKA9Ip8C3mDvJy+24yfpza3YGCpIMhdBB36C3x17Oh3IpSLNh
 ukmmyRpFjT9CnqmCkYjp9xim1/ACfCKHeGrMmTyv7IHf1H0OPZfvg7KTH
 QfiRB8cARo1yXF7MAbRxrgCn9Q/I3NVIKapHCQnYiZ6ZkoRbXaDqogZr5
 JbgmXBtgLCQmmBxMyGY/mFtfHOttWpXUka4M/JUbbrUTKgS2QaeKGtqWC g==;
X-CSE-ConnectionGUID: zTxRSSUFSHy8ObLlNPbArQ==
X-CSE-MsgGUID: EKXHI6KaRXm1XRL1LZvbcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="59867285"
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; d="scan'208";a="59867285"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 11:19:13 -0800
X-CSE-ConnectionGUID: k6w/c/G/Q6S5AWC7DIDBsQ==
X-CSE-MsgGUID: qgLOVUhgQuyj3kVJD9rLdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="97131698"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 11:19:13 -0800
Date: Thu, 12 Dec 2024 20:19:09 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 Fix dist building with iga64 codes script
Message-ID: <20241212191909.bo5takijstlhd52l@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20241212105231.49481-1-kamil.konieczny@linux.intel.com>
 <173402392733.1666436.10629882087228347120@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173402392733.1666436.10629882087228347120@b555e5b46a47>
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
On 2024-12-12 at 17:18:47 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Fix dist building with iga64 codes script
> URL   : https://patchwork.freedesktop.org/series/142473/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_15830_full -> IGTPW_12305_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12305_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12305_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/index.html
> 
> Participating hosts (11 -> 11)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12305_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_eio@in-flight-suspend:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-glk4/igt@gem_eio@in-flight-suspend.html
> 
>   * igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [INCOMPLETE][2] +1 other test incomplete
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-7/igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-1.html
>     - shard-tglu-1:       NOTRUN -> [INCOMPLETE][3] +1 other test incomplete
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-1/igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-3:
>     - shard-dg1:          NOTRUN -> [CRASH][4] +3 other tests crash
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-13/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-3.html
> 
>   * igt@kms_async_flips@invalid-async-flip-atomic:
>     - shard-dg2:          NOTRUN -> [SKIP][5]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-4/igt@kms_async_flips@invalid-async-flip-atomic.html
> 
>   * igt@kms_pm_rpm@cursor:
>     - shard-rkl:          [PASS][6] -> [SKIP][7]
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-rkl-1/igt@kms_pm_rpm@cursor.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-7/igt@kms_pm_rpm@cursor.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_workarounds@suspend-resume-context:
>     - shard-glk:          [INCOMPLETE][8] ([i915#13273]) -> [INCOMPLETE][9]
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-glk2/igt@gem_workarounds@suspend-resume-context.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-glk4/igt@gem_workarounds@suspend-resume-context.html
> 
>   * igt@perf_pmu@rc6@runtime-pm-long-gt0:
>     - shard-rkl:          [DMESG-WARN][10] ([i915#12964]) -> [SKIP][11]
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-rkl-4/igt@perf_pmu@rc6@runtime-pm-long-gt0.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-7/igt@perf_pmu@rc6@runtime-pm-long-gt0.html
> 

Unrelated, no need for respin as this patch was dropped.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_12305_full that come from known issues:
> 
> ### IGT changes ###

...cut...

> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/index.html
