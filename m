Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DAF2C48BC3
	for <igt-dev@archiver.kernel.org>; Wed, 14 Feb 2024 13:48:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C978A10E260;
	Wed, 14 Feb 2024 13:48:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BXApqJkk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB4910E268;
 Wed, 14 Feb 2024 13:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707918503; x=1739454503;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wrVCc1rnwHbXSPO2HdV8RCv/W3b2nc03hO8INLVQKDo=;
 b=BXApqJkknwLrroh2BLWUcg3ScgSmWLUdz7F5OtjWUT49iJsM/CRH9ft7
 r4yazdslesVV9VZvmH58dahXlgenRrY+BjtGhY6wmNyVnZZm12i88/ATC
 jbvafqMpG8xjWHbIX5uAd54rJP5nNtwYFxUqLa1YKHTCrxMWIBKHE6tK+
 8cPygJfPZ6C1xKK8ooZ6nU+aT/7Tf/603NQY1P4jJSd7VS9vW5PUpl50H
 /PPnsvWoJ1ZJiNw38BmUfG91+PrMnsq4rMl74foxz3AP1SNaX/9ubN0SX
 UkprrgKzz5KlJzJbeFuIVzx5BixGca0r5c/MAip0jr8aPmbTKFfr23bRw w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1834935"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="1834935"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 05:48:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="3476892"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 05:48:19 -0800
Date: Wed, 14 Feb 2024 14:48:16 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bernd Kuhls <bernd@kuhls.net>, I915-ci-infra@lists.freedesktop.org,
 lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
Subject: Re: =?utf-8?Q?=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_series_start?=
 =?utf-8?Q?ing_wit?= =?utf-8?Q?h?= [v3,1/7] build: check that outb is present
 in io.h (rev2)
Message-ID: <20240214134816.jrqis4nn3gddg54n@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Bernd Kuhls <bernd@kuhls.net>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
References: <20231030195809.3527410-1-bernd@kuhls.net>
 <170785922380.1218995.12022790308398747921@5338d5abeb45>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170785922380.1218995.12022790308398747921@5338d5abeb45>
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
On 2024-02-13 at 21:20:23 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [v3,1/7] build: check that outb is present in io.h (rev2)
> URL   : https://patchwork.freedesktop.org/series/125776/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14264_full -> IGTPW_10666_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10666_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10666_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10666/index.html
> 
> Participating hosts (8 -> 8)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10666_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_pm_rpm@i2c:
>     - shard-glk:          NOTRUN -> [FAIL][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10666/shard-glk4/igt@kms_pm_rpm@i2c.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-glk:          [SKIP][2] ([fdo#109271]) -> [INCOMPLETE][3]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14264/shard-glk3/igt@kms_hdr@invalid-hdr.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10666/shard-glk6/igt@kms_hdr@invalid-hdr.html
> 

These are unrelated,

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10666_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@blit-reloc-purge-cache:
>     - shard-dg1:          NOTRUN -> [SKIP][4] ([i915#8411])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10666/shard-dg1-17/igt@api_intel_bb@blit-reloc-purge-cache.html
> 

...cut...

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7711 -> IGTPW_10666
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_14264: 65a621d44bec5a1ee7af20427215105e4c17e67f @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10666: 10666
>   IGT_7711: 7711
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10666/index.html
