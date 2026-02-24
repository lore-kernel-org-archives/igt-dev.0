Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 423F8EFB810
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 07:37:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3AB310E4CC;
	Tue, 24 Feb 2026 07:37:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GX1NAMr1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6518510E4CC
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 07:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771918658; x=1803454658;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=Zzqfj3kAD3tdghCromiEOkj/v8MdkdsIfWZO3As3gYY=;
 b=GX1NAMr1q3LQLcf+zDs4xsdtOf7Z5O0FbceKJCSJdG3iTEbXhV1lbZfG
 E1YeD6iEY9IADgJzKCbmUQGLIDMhZjIJhTsn1yXlyQWmoWw7mDNT5mgNu
 lM1hEZ3SrmcVMEwTfatzrR5nGclCoUW2P3fkWW6vmlaDBhCvxAi5lmETJ
 nM/8sZXoPwqUaS92+2Df0+eqTbl4bYajmGcH086A6UkxT73f+snJWDvHu
 kp6SvD3u3Rsky7BYS47qbK5sixl+iJZxmA+4wZyws1IT+1PDbeUYks5gz
 8OANefaf+ORtY+MHG+r531F6U/YUK6omJzXZ8BR5WBEGvuk+ZadjlyeMx g==;
X-CSE-ConnectionGUID: I+wTqO57RuuQdFpQJ0WXKg==
X-CSE-MsgGUID: cJ0TlNTUT0ig9o9sQVH5Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72137931"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="72137931"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 23:37:38 -0800
X-CSE-ConnectionGUID: DIgjL4ogQq2xitlTYwunOg==
X-CSE-MsgGUID: Rw2Sc2zTR9OPuroZwFhsig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="215840968"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 23:37:37 -0800
Date: Tue, 24 Feb 2026 08:37:34 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFUOiBmYWlsdXI=?= =?utf-8?Q?e?= for
 lib/rendercopy: Alter pipeline and add shader for Xe3p
Message-ID: <jau2fuxqlvapszrsrbuqga4ucn4ok45ctezl3ri5nv5odldzqc@p62wkr2f2gcf>
References: <20260223163544.1519449-2-zbigniew.kempczynski@intel.com>
 <177188514499.277693.13301189144567946954@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177188514499.277693.13301189144567946954@a3b018990fe9>
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

On Mon, Feb 23, 2026 at 10:19:04PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  lib/rendercopy: Alter pipeline and add shader for Xe3p          
>    URL:     https://patchwork.freedesktop.org/series/161991/                
>    State:   failure                                                         
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14597/index.html 
> 
>                CI Bug Log - changes from IGT_8766 -> IGTPW_14597
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_14597 absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_14597, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14597/index.html
> 
> Participating hosts (43 -> 41)
> 
>    Missing (2): bat-dg2-13 fi-snb-2520m
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in IGTPW_14597:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@kms_pipe_crc_basic@read-crc:
>           * fi-cfl-8109u: PASS -> DMESG-WARN +48 other tests dmesg-warn

Change is unrelated to above dmesg warning.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_14597 that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@i915_selftest@live:
> 
>           * bat-dg2-8: PASS -> DMESG-FAIL (i915#12061) +1 other test
>             dmesg-fail
>      * igt@i915_selftest@live@workarounds:
> 
>           * bat-arls-6: PASS -> DMESG-FAIL (i915#12061) +1 other test
>             dmesg-fail
> 
>     Possible fixes
> 
>      * igt@i915_selftest@live:
>           * bat-jsl-1: DMESG-FAIL (i915#15394) -> PASS +1 other test pass
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_8766 -> IGTPW_14597
> 
>    CI-20190529: 20190529
>    CI_DRM_18022: 45a3045fc0dc46a893cb8bbe304afafd4120c904 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_14597: 6a89e69be222393d3dd2f894a914c79f78f612ca @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    IGT_8766: 8766
