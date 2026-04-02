Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B3DCD39425
	for <igt-dev@archiver.kernel.org>; Thu,  2 Apr 2026 13:43:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BC0410F276;
	Thu,  2 Apr 2026 13:43:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fclYDvtz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C59910F276
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Apr 2026 13:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775137410; x=1806673410;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=3GuFj/hdEj5YS5xl68XkbNw2GqsrV1ZjK38aJOmJbTQ=;
 b=fclYDvtz2UvELJssUqbvl5ySY4h2YVQoFTf2gkOi/047BJrQ5BZZRaOJ
 AzATKJGGEEecLEhdlLPDgxX12NP6Ce2Cf6O8r/Z/fA88JmxpADe6qx/Hy
 vs+Zu9IWHA1Mt7lhh3RxZ2ZyViOpSN2a1G2xx38FiHXUpaerJJWD33WM7
 rfL3ZyB3JGtiZOhr+oIVW/MdulsXxtr4ZrIUzAouJBloCSebk8sAi47vu
 djII2IAFt9rFnoNv6KEKbrIbQP2FSSk7spSWFxf1AjqMrQ+roChrERLdX
 fNKyKiHADClsmmiR1phfHxUgvTao8IZHdhEnXiJu9guYaSyYMf4dxfhbO g==;
X-CSE-ConnectionGUID: o2oulyQPRPOH/yYAhsRSAA==
X-CSE-MsgGUID: 6KnxexEoQZWnpekzg0vj4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="93778989"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="93778989"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 06:43:30 -0700
X-CSE-ConnectionGUID: HAr6yCrtRIOUwlgWYtbcVQ==
X-CSE-MsgGUID: 2d+jTuaGRNSr/gzSndyO5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="223706766"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.1])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 06:43:29 -0700
Date: Thu, 2 Apr 2026 15:43:27 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFU?= =?utf-8?Q?=3A?= failure for
 Exercise large buffer in compute-square
Message-ID: <cumc2j2hjcznwprouo4wnm7n35sxq3xxtzrbz2pjdpoax62rfv@dcffoqr5axij>
References: <20260401091017.2772519-5-zbigniew.kempczynski@intel.com>
 <177506038841.424347.4515221020058606650@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177506038841.424347.4515221020058606650@a3b018990fe9>
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

On Wed, Apr 01, 2026 at 04:19:48PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Exercise large buffer in compute-square                         
>    URL:     https://patchwork.freedesktop.org/series/164228/                
>    State:   failure                                                         
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14904/index.html 
> 
>                CI Bug Log - changes from IGT_8840 -> IGTPW_14904
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_14904 absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_14904, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14904/index.html
> 
> Participating hosts (42 -> 40)
> 
>    Missing (2): bat-dg2-13 fi-snb-2520m
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in IGTPW_14904:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@i915_selftest@live@hangcheck:
>           * fi-skl-6600u: PASS -> INCOMPLETE

Unrelated to the series. Series touches xe_compute test only.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_14904 that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@i915_selftest@live:
> 
>           * bat-mtlp-8: PASS -> DMESG-FAIL (i915#12061) +1 other test
>             dmesg-fail
>           * fi-skl-6600u: PASS -> INCOMPLETE (i915#15859)
>      * igt@i915_selftest@live@workarounds:
> 
>           * bat-dg2-14: PASS -> DMESG-FAIL (i915#12061) +1 other test
>             dmesg-fail
>      * igt@kms_pm_rpm@basic-rte:
> 
>           * bat-rpls-4: PASS -> DMESG-WARN (i915#13400)
> 
>     Possible fixes
> 
>      * igt@i915_selftest@live:
> 
>           * bat-dg2-8: DMESG-FAIL (i915#12061) -> PASS +1 other test pass
>      * igt@i915_selftest@live@workarounds:
> 
>           * bat-arlh-3: DMESG-FAIL (i915#12061) -> PASS +1 other test pass
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_8840 -> IGTPW_14904
> 
>    CI-20190529: 20190529
>    CI_DRM_18262: 5d36e6d54e963f0c1137aaf2249d2baa781f08c2 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_14904: 14904
>    IGT_8840: 8840
