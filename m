Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D00DED68B34
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 16:12:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AA7910E81E;
	Thu, 14 Nov 2024 16:12:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LR9FTaKp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE5E10E81E;
 Thu, 14 Nov 2024 16:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731600764; x=1763136764;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YHT0o+NuVQbxp8lQMd87I3BrhKG94DI4vayRmaTBe48=;
 b=LR9FTaKpp3JWF/rzBiPK1m9Gn/szCVPrpRw2W0np6M6qwyphLmFXcvca
 1X3MrcrD6vAjlLde/FFgB+rGdxEDEUbtITCYFTdP0W9IBCT/gzoBOSczi
 UescXdLycnzpy7pLqm0d7iR30CiktruYzaGfDgHeCUJdeaEr28GTgbKT4
 Q9pvb3mtWtcgsozOZySAVzjxDB7bD2dr85O/027oc+WjA7Rkc9scQ3tZU
 +hEPpmeu6aWgGd85qD4Gcd0Y+ssN9V2+YftlRbhRcJUXjNrJTeMtgkZTx
 JioxWegJAmqjiD+7azyKBsDhatThwIfcHuDU0e/YXj3JwY+RLVYnWQK9w g==;
X-CSE-ConnectionGUID: A8FQdkwQS4aNC2t9LWZ+Rg==
X-CSE-MsgGUID: zjRxidajQ0uLQ98/0bDxHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="34413458"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="34413458"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 08:12:42 -0800
X-CSE-ConnectionGUID: 767u37zyTd+0r4O2I62YlQ==
X-CSE-MsgGUID: VVKEA/SQRFaTdvbg4hiRqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="93209321"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.12])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 08:12:41 -0800
Date: Thu, 14 Nov 2024 17:12:37 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyX?= Fi.CI.BAT: failure for GPGPU fill improvements
Message-ID: <20241114161237.kbim6hm5fu4asusf@zkempczy-mobl2>
References: <20241114120616.70229-1-zbigniew.kempczynski@intel.com>
 <173159311219.4035500.15704660267442937805@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <173159311219.4035500.15704660267442937805@2413ebb6fbb6>
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

On Thu, Nov 14, 2024 at 02:05:12PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  GPGPU fill improvements                                         
>    URL:     https://patchwork.freedesktop.org/series/141352/                
>    State:   failure                                                         
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12106/index.html 
> 
>                CI Bug Log - changes from IGT_8110 -> IGTPW_12106
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_12106 absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_12106, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12106/index.html
> 
> Participating hosts (45 -> 45)
> 
>    Additional (1): bat-mtlp-9
>    Missing (1): fi-snb-2520m
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in IGTPW_12106:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@i915_selftest@live:
>           * bat-mtlp-8: PASS -> INCOMPLETE +1 other test incomplete

Not related to the series. May I ask for resume run?

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_12106 that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@kms_chamelium_edid@hdmi-edid-read:
> 
>           * bat-dg2-13: PASS -> DMESG-WARN (i915#12253)
>      * igt@kms_chamelium_frames@dp-crc-fast:
> 
>           * bat-dg2-13: PASS -> FAIL (i915#12440)
> 
>     Possible fixes
> 
>      * igt@i915_selftest@live:
> 
>           * bat-arlh-3: ABORT (i915#10341 / i915#12061) -> PASS
>           * bat-arlh-2: ABORT (i915#10341) -> PASS
>           * {bat-arls-6}: ABORT (i915#10341) -> PASS
>      * igt@i915_selftest@live@workarounds:
> 
>           * bat-arlh-3: ABORT (i915#12061) -> PASS
>           * bat-arlh-2: ABORT (i915#12061) -> PASS
>           * bat-mtlp-6: ABORT (i915#12061) -> PASS +1 other test pass
>           * {bat-arls-6}: ABORT (i915#12061) -> PASS
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_8110 -> IGTPW_12106
>      * Linux: CI_DRM_15694 -> CI_DRM_15695
> 
>    CI-20190529: 20190529
>    CI_DRM_15694: a03ca0a62967eea85aedea158db9dc5078496d4d @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    CI_DRM_15695: 1e3f4084e4e1fba8d172be0c2b964ab5c816394d @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_12106: bb09a56410fa397363225a8fc4e1cb2dc8b232a1 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    IGT_8110: 868b25a05a9492a99228d798c6f71bea5ceaa6e1 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
