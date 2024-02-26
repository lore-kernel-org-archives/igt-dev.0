Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED45C48BF6
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 11:09:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45FA610F08E;
	Mon, 26 Feb 2024 11:09:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d/vMx0kT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 381BC10F089;
 Mon, 26 Feb 2024 11:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708945795; x=1740481795;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lyXnux8cMbLgBApr7za1DESLy4knJURg3CMWDUCKUu4=;
 b=d/vMx0kTp4j6TwIZ2jA6nUGqSyTrIgXs3rn/0+Owm4dhKrC+UKe7r+eg
 mPD//3WBWX1OoacW3vWFW4QpHrMH63zNLcRp+I3HWhgTAJcuJiEYbQdMF
 ut7ZpEdYRv1vfIz9KpyZ7pahUiB6JbqaaZKs/FglJLtevp5bZGv9NqoFR
 ktuBPTeYUWM1/sCx1RFWwl++8OonFdFVf0C7PF+nylHHPpn/f0BafWYdC
 S5w5sDIf7YuIur0REvvNJJUryxllH542euIYNUqX7E9TlbRUhUsINhGBV
 cGWGZ3X194NaNGHRGZf0TCE14WHixUDyCWoddCHNtJSa44dySgcibIe2x Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="14657592"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; d="scan'208";a="14657592"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 03:09:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; d="scan'208";a="29813482"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 03:09:52 -0800
Date: Mon, 26 Feb 2024 12:09:49 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJBVDogZmFpbHVy?= =?utf-8?Q?e?= for
 Additional fixes for IntelCI testlist generation (rev2)
Message-ID: <20240226110949.o3utlue4xh7qcdm5@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
References: <20240222114741.196042-1-mauro.chehab@linux.intel.com>
 <170860787853.216641.10773422745482929340@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170860787853.216641.10773422745482929340@8e613ede5ea5>
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
On 2024-02-22 at 13:17:58 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Additional fixes for IntelCI testlist generation (rev2)
> URL   : https://patchwork.freedesktop.org/series/130240/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14315 -> IGTPW_10719
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10719 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10719, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10719/index.html
> 
> Participating hosts (37 -> 36)
> ------------------------------
> 
>   Additional (1): bat-mtlp-8 
>   Missing    (2): bat-arls-2 fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10719:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@hangcheck:
>     - bat-rplp-1:         [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14315/bat-rplp-1/igt@i915_selftest@live@hangcheck.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10719/bat-rplp-1/igt@i915_selftest@live@hangcheck.html
> 

Unrelated to change in scripts/igt_doc.py
no need for respin.

Regards,
Kamil

...cut...

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7722 -> IGTPW_10719
> 
>   CI-20190529: 20190529
>   CI_DRM_14315: 661a9b14c215bc3ba24badcac80ce4eb3f57d3ff @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10719: 10719
>   IGT_7722: 48196ef379a77675ea6af82a82da62b2ad2d9ded @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10719/index.html
