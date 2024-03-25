Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A37CC54E58
	for <igt-dev@archiver.kernel.org>; Mon, 25 Mar 2024 14:44:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCD6E10E93E;
	Mon, 25 Mar 2024 14:44:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KDmPZ+Dx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D10010E93A;
 Mon, 25 Mar 2024 14:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711377863; x=1742913863;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MozBBeofAwG7Kl3rKWhW/8IJA69L/XcsAMA6RVrhAZk=;
 b=KDmPZ+DxKlBO5REyOFZqfu+mN9lnJKa8KyNcIEz1BQJY3LgMNssPc6AU
 mLOtqszBKTsPe1FbcIGZ9ocnFMN0mlCksgP1GLWo0ktpNerQ0w0Ucmy9K
 UPkC/N+Ngk2D9UoABumXEk/UQK7+KsjnRkaO9nKX9bijMS4C8hlJ76SjW
 M/rXMYJjD3QOEhbXc/fJnR4peDfB789UlSLfUjJFTTn7omNG14FB06oOq
 1IfICR874/ZVo2XrXY/N95B9wJw1eHjluemnazQ4KPZH6BLOBE4mMVmbB
 2L747KshObL7qdE1yPGwP/Guel++y+XLxqrETUngUvibGJJ/Iuc2Ghzwq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="10177593"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="10177593"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 07:44:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="16309363"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 07:44:21 -0700
Date: Mon, 25 Mar 2024 15:44:02 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVy?= =?utf-8?Q?e?= for Align
 Xe test documentation to recent i915 changes
Message-ID: <20240325144402.oyuvbro7uv7bf6mj@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
References: <20240322124108.1825345-1-katarzyna.piecielska@intel.com>
 <171118303653.1017268.10788856667177000245@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171118303653.1017268.10788856667177000245@8e613ede5ea5>
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
On 2024-03-23 at 08:37:16 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Align Xe test documentation to recent i915 changes
> URL   : https://patchwork.freedesktop.org/series/131492/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14468_full -> IGTPW_10885_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10885_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10885_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10885/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10885_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_exec_suspend@basic-s3@smem:
>     - shard-dg2:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14468/shard-dg2-3/igt@gem_exec_suspend@basic-s3@smem.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10885/shard-dg2-11/igt@gem_exec_suspend@basic-s3@smem.html
> 
>   * igt@kms_plane_lowres@tiling-none@pipe-a-hdmi-a-1:
>     - shard-snb:          [PASS][3] -> [ABORT][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14468/shard-snb7/igt@kms_plane_lowres@tiling-none@pipe-a-hdmi-a-1.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10885/shard-snb7/igt@kms_plane_lowres@tiling-none@pipe-a-hdmi-a-1.html
> 

This is unrelated to changes in C comments (test docs),

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10885_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 

...cut...

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7777 -> IGTPW_10885
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_14468: a19e6423c2c21b8dc7ad79ca95cc24637b248bd0 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10885: 10885
>   IGT_7777: 7777
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10885/index.html
