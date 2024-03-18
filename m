Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AEBCC54E5D
	for <igt-dev@archiver.kernel.org>; Mon, 18 Mar 2024 11:44:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACDF210F2E3;
	Mon, 18 Mar 2024 11:44:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fNtdJE3K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFA6810E8D2;
 Mon, 18 Mar 2024 11:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710762279; x=1742298279;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ujLHVjcV3ZbRGoEme4B0dwBach+I+r/sFNsV65w8LF0=;
 b=fNtdJE3Kn9KfnL6BxusCLbZBBqG1zON0V+s9TrYCJdzhRlCZ/uQohvlW
 rkWudurHJft7PKTpKoSFFTIEp2rt3/BSvHQy1BaXWrBmZ2jKFTBZuRGD7
 1Vg4g29VzQ+KdAhCPJN/o8x/i7ESVAu1pG0rULypTATMrllvvsNT/QedZ
 mb9kQFSUohHoO/Vnx+Mf3L28S2HQlDl3rRMmOkjEb48aMo3WmI2uXW75x
 v8QF/uvkg4iVZqG5mG6+RCVMXWfh8RHSI+FwD3PsIpxiHcOwylJzr7ukC
 BhEPQSmBxZv0Cj7lIVgvyXy5bALtyZ2SHxBEBwnJknv6SRgEPm6NFsVQa A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="16116033"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="16116033"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 04:44:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="50875436"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 04:44:37 -0700
Date: Mon, 18 Mar 2024 12:44:34 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Louis Chauvet <louis.chauvet@bootlin.com>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJBVA==?= =?utf-8?Q?=3A?= failure for
 CONTRIBUTING: Add coding style guidelines
Message-ID: <20240318114434.zbqvi637ook5pv3o@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
References: <20240315-add_coding_style-v1-1-50ad93cfa250@bootlin.com>
 <171052169182.795787.252679567301376195@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171052169182.795787.252679567301376195@8e613ede5ea5>
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
On 2024-03-15 at 16:54:51 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: CONTRIBUTING: Add coding style guidelines
> URL   : https://patchwork.freedesktop.org/series/131192/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14440 -> IGTPW_10846
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10846 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10846, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10846/index.html
> 
> Participating hosts (35 -> 34)
> ------------------------------
> 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10846:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_module_load@load:
>     - bat-dg2-9:          [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14440/bat-dg2-9/igt@i915_module_load@load.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10846/bat-dg2-9/igt@i915_module_load@load.html
> 

This is unrelated to change in documentation,
no need for respin.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10846 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Possible fixes ####
> 
>   * igt@i915_pm_rpm@module-reload:
>     - {bat-mtlp-9}:       [CRASH][3] -> [PASS][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14440/bat-mtlp-9/igt@i915_pm_rpm@module-reload.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10846/bat-mtlp-9/igt@i915_pm_rpm@module-reload.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7768 -> IGTPW_10846
> 
>   CI-20190529: 20190529
>   CI_DRM_14440: 22ba12a6eded33d40fba58b4dac24a1e2bdc4b25 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10846: 10846
>   IGT_7768: 7768
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10846/index.html
