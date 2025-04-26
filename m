Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F30DBC369D3
	for <igt-dev@archiver.kernel.org>; Sat, 26 Apr 2025 08:06:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD5D910E210;
	Sat, 26 Apr 2025 08:06:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UZ3tU97Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 584A210E045;
 Sat, 26 Apr 2025 08:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745654795; x=1777190795;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=gCtaZyl4SiCDUTP0q8L5BvxI5m0ix2ZlTBvq2K/ER5k=;
 b=UZ3tU97QGNd9CAmtbkEJcNUMHEEwyfVp3JS/SqseCdg0fuv9vxEflE9f
 DbQL7NrSwiZ1XTAxmVTBq1om/V+S4zn8ndgBU3rzXzeijSkTiMIBr/ean
 bzvqm1kTySR+fcUyW1KL+GyIvk1OAJMTaF5UvNy+6XLU0agInGpghIhXR
 bieDrdB/tco98gz+5uMWTh58ylsKF7P8jV0f6sx06zEUQ3S7O6R01l8bJ
 qBQG04Mgwj7X1Z7rrV5P1BFTwazHrJTHP99mQCBZoe27ysiHe8kMSYqKN
 2ZeKsK1JD3phEltgqQ+O6BFjqqR94WHACS26tG/08SE7YObmf8lKxgK+U Q==;
X-CSE-ConnectionGUID: /Fqu9KyQS9SZRr2sKyHtWw==
X-CSE-MsgGUID: 1aUz93h9RZyic4sYnwHlvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="64728862"
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; d="scan'208";a="64728862"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2025 01:06:35 -0700
X-CSE-ConnectionGUID: oR8NyIK7T0uG2kdwce5h2A==
X-CSE-MsgGUID: rtvlrD7ORNClrR/pHQPsGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; d="scan'208";a="134066063"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO [10.245.118.0])
 ([10.245.118.0])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2025 01:06:33 -0700
Message-ID: <818b7456-25b1-4174-923f-ac951ff1b47a@linux.intel.com>
Date: Sat, 26 Apr 2025 10:06:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_lib/xe/xe?=
 =?UTF-8?Q?=5Flegacy=3A_Move_test=5Flegacy=5Fmode_to_lib/_=28rev2=29?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250417193032.329-1-peter.senna@linux.intel.com>
 <174552105062.7653.13336796574984671266@c664b1dc75d1>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <174552105062.7653.13336796574984671266@c664b1dc75d1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Dear I915,

On 4/24/2025 8:57 PM, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/xe/xe_legacy: Move test_legacy_mode to lib/ (rev2)
> URL   : https://patchwork.freedesktop.org/series/147939/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8336 -> IGTPW_13039
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_13039 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_13039, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13039/index.html
> 
> Participating hosts (42 -> 41)
> ------------------------------
> 
>   Missing    (1): bat-arlh-2 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_13039:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live:
>     - bat-adlp-9:         [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8336/bat-adlp-9/igt@i915_selftest@live.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13039/bat-adlp-9/igt@i915_selftest@live.html

These are unrelated to my change.

Thank you,

Peter
