Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE1AE6896A
	for <igt-dev@archiver.kernel.org>; Thu, 31 Oct 2024 09:58:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F15C210E856;
	Thu, 31 Oct 2024 09:58:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OqmTDdzZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F28CC10E856;
 Thu, 31 Oct 2024 09:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730368697; x=1761904697;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=88xemjQFUsdzNjIwtfhqOPOxBz4oyDaxyAp6gqL8nkA=;
 b=OqmTDdzZViz3KSsPzPGsqXmVZL1iwZxEJ+uew8Z6auPhWNUmClfw0L5J
 uKtWW2cSawmj1Fn9+cEZpoN1tSwjvA6TfGaGozmVa6dpOA1tVXpdAz2kq
 xuLnam3M58q70lQxGlKZGigEr0gttti+HQhq1xTIDHb/idruvGTkW/GSl
 V2VI/5gp+E5ZCvwf28vWXLlTzq2dL2wPetC0WzkiYfeUAKqTcWisIWzYw
 yDLnOM6lSF0qKhAGCxdiqegZXX2lfHi/xt9st1uW6PUH7CHNIk7nOdSva
 6Hj9Mg/KztssZxfgq3BWLz5ELoOfE3JYpZaDFWFrOw1okbPgBEmozGjJg g==;
X-CSE-ConnectionGUID: klLIu8NmSCuaSAwoKdkYGA==
X-CSE-MsgGUID: DdThIHBESk+mnvb0h+ZARg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40645796"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="40645796"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 02:58:17 -0700
X-CSE-ConnectionGUID: T+9xqGgiTUCo4l1FzAF+Rw==
X-CSE-MsgGUID: 5L2bbIPJTWW2Ms8shUOwTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="83384929"
Received: from ksztyber-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.165])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 02:58:15 -0700
Date: Thu, 31 Oct 2024 10:58:12 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJBVDogZmFpbHVy?= =?utf-8?Q?e?= for
 tests/xe_exec_comput_mode: Use valid exec queue for bind
Message-ID: <20241031095812.fg4zp3bur325bcs4@zkempczy-mobl2>
References: <20241031073604.35976-1-zbigniew.kempczynski@intel.com>
 <173036681772.1365305.11372994320704010202@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <173036681772.1365305.11372994320704010202@2413ebb6fbb6>
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

On Thu, Oct 31, 2024 at 09:26:57AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  tests/xe_exec_comput_mode: Use valid exec queue for bind        
>    URL:     https://patchwork.freedesktop.org/series/140752/                
>    State:   failure                                                         
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12012/index.html 
> 
>                CI Bug Log - changes from IGT_8090 -> IGTPW_12012
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_12012 absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_12012, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12012/index.html
> 
> Participating hosts (46 -> 46)
> 
>    Additional (1): bat-dg2-13
>    Missing (1): fi-snb-2520m
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in IGTPW_12012:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@kms_flip@basic-flip-vs-dpms@a-dp1:
> 
>           * fi-cfl-8109u: PASS -> DMESG-WARN +3 other tests dmesg-warn
>      * igt@kms_flip@basic-flip-vs-dpms@b-dp1:
> 
>           * fi-cfl-8109u: PASS -> INCOMPLETE +1 other test incomplete

Unrelated to the change.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_12012 that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@i915_selftest@live:
> 
>           * bat-mtlp-6: PASS -> ABORT (i915#12133 / i915#12216)
>      * igt@i915_selftest@live@workarounds:
> 
>           * bat-mtlp-6: PASS -> ABORT (i915#12216)
>      * igt@kms_chamelium_edid@hdmi-edid-read:
> 
>           * bat-dg2-13: NOTRUN -> DMESG-WARN (i915#12253)
>      * igt@kms_chamelium_edid@vga-edid-read:
> 
>           * bat-dg2-13: NOTRUN -> SKIP (Intel XE#484 / i915#4550) +1 other
>             test skip
> 
>     Warnings
> 
>      * igt@i915_selftest@live:
>           * bat-arlh-3: ABORT (i915#12061 / i915#12133) -> ABORT (i915#12133)
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_8090 -> IGTPW_12012
>      * Linux: CI_DRM_15615 -> CI_DRM_15616
> 
>    CI-20190529: 20190529
>    CI_DRM_15615: c245557007af0a1c23da00c47732ae1dadda7dd3 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    CI_DRM_15616: baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_12012: 12012
>    IGT_8090: ef818fb3a73d6d69d09d573c2a6d071b2c7dc84a @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
