Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78428C25B74
	for <igt-dev@archiver.kernel.org>; Thu, 16 May 2024 09:25:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 052A410E49E;
	Thu, 16 May 2024 09:25:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nSojCw3E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B00C810E1A4;
 Thu, 16 May 2024 09:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715851538; x=1747387538;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=BZurPf4h10aBr7HYISyArNUXNwlS1MhNQr7nzfcARa4=;
 b=nSojCw3Ew55YE1nTOJ+3u8niLmmNvnAVUcqYX7BxPm+bYXoSlFuQehbn
 lSixS9HT33ve50dT3zkHwgV7eJcwRhg+mtm0qTmOx4SYGobL5fJ5NiUsH
 /XxfXT77QlVAVP1yDtFoA9kPwEAxqBrfsF1d65Uv68c8sXDDpdsBRRGjs
 E63K1ZR/9zFSukR0surY8/eULJLkqHrqNVmhQT6drUK6ltJ0eAoH7om/I
 PqeSOj8yE0UNuvFo6FXQu2EqTEEIOK9ONn2UrCbO6UBsxZ8bMVpNSbPWO
 6NbXyh6Usv11QbNt52VhgqTF+PhWVDf6DD0ofcjQZs50LlfPlsaelHoRy A==;
X-CSE-ConnectionGUID: XyTYXwm4Qke5iH8oU9MsZg==
X-CSE-MsgGUID: pE7Hp5y5SSS3f9TYm2fFfQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="12061247"
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; d="scan'208";a="12061247"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 02:25:37 -0700
X-CSE-ConnectionGUID: YFxRD6QjSA2H2Qz8ocCtHg==
X-CSE-MsgGUID: BEZ4v08jRsC6MRjdECwUgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; d="scan'208";a="36149685"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 02:25:36 -0700
Date: Thu, 16 May 2024 11:25:33 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_series_start?=
 =?utf-8?Q?ing_wit?= =?utf-8?Q?h?= [i-g-t,1/5] tests/intel/xe_pm: Update
 runtime pm conditions
Message-ID: <20240516092533.ukshymx4ycew3qex@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20240515171317.84811-1-rodrigo.vivi@intel.com>
 <171583883134.2120091.18437100090578620962@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171583883134.2120091.18437100090578620962@8e613ede5ea5>
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
On 2024-05-16 at 05:53:51 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [i-g-t,1/5] tests/intel/xe_pm: Update runtime pm conditions
> URL   : https://patchwork.freedesktop.org/series/133665/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7856_full -> IGTPW_11148_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11148_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11148_full, please notify your bug team (&#x27;I915-ci-infra@lists.freedesktop.org&#x27;) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11148/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11148_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [FAIL][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11148/shard-rkl-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1.html
> 

This is unrelated to Xe test changes,

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11148_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@object-reloc-purge-cache:
>     - shard-mtlp:         NOTRUN -> [SKIP][2] ([i915#8411])
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11148/shard-mtlp-1/igt@api_intel_bb@object-reloc-purge-cache.html
> 

...cut...

> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7856 -> IGTPW_11148
> 
>   CI-20190529: 20190529
>   CI_DRM_14768: 26a52a7b24c1f334d92f5deac9f3eaf3224f3864 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11148: 11148
>   IGT_7856: 280f66b4d83048ea76bea6fd31af648c51996486 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11148/index.html
