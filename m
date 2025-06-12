Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FCA3C61CE8
	for <igt-dev@archiver.kernel.org>; Thu, 12 Jun 2025 09:02:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC95210E793;
	Thu, 12 Jun 2025 09:02:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TAUCKtO4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D684210E1ED;
 Thu, 12 Jun 2025 09:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749718939; x=1781254939;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hVMd3Pb6QHnDft1Pff5lO05sIurBlcJNZy7Snu1Gjh8=;
 b=TAUCKtO4dco7yzbN1e0MUSfvHrsT/+gHs1I3chgwL4dCGedpmU/ij2lR
 LX9nUdyx7NGrUWfY4FRhzFHOu2xunHxPNs0L9MKBpSR0UytlaYSTTYnQ8
 wVgk0+JUhJWLXXjbwu2BvWSN3B93SPFbQ1cdO/DifUQyFYS+Iw2ijXAcv
 /MgqwR9RHxeTW8Q75Sg6dAgDdoOEhldxZTi1XdA3ZyRR9N4mPsOBiJRIS
 Dh52wDR+WC06CSZdyVyt7sN7bBvVr/MbTyZv8l9ldilG2P09GBbxIcEvh
 tLKmStKaQHrxactG5OMoFe1g2GyfD9po9bOdB7EJsQV2j09uN7T0gggs2 A==;
X-CSE-ConnectionGUID: YRAE9MVBTzuMxO301XdXmw==
X-CSE-MsgGUID: 5enQcgMLQqme6K783ml7/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="54516781"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="54516781"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 02:02:15 -0700
X-CSE-ConnectionGUID: RcLpiD6oR0iCPxvWC4eozw==
X-CSE-MsgGUID: DwWBzNg4RPGoDKuQk9FWig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="152448026"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 02:02:13 -0700
Date: Thu, 12 Jun 2025 11:02:10 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Melissa Wen <mwen@igalia.com>, I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVy?= =?utf-8?Q?e?= for
 improvements for AMD color and async flip tests (rev2)
Message-ID: <20250612090210.vl5euq2qpjtarxbs@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20250601191459.46759-1-mwen@igalia.com>
 <174968264849.69517.2162850858821355412@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <174968264849.69517.2162850858821355412@1538d3639d33>
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
On 2025-06-11 at 22:57:28 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: improvements for AMD color and async flip tests (rev2)
> URL   : https://patchwork.freedesktop.org/series/149722/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_16685_full -> IGTPW_13273_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_13273_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_13273_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13273/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_13273_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_exec_whisper@basic-contexts-all:
>     - shard-dg2:          [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg2-11/igt@gem_exec_whisper@basic-contexts-all.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13273/shard-dg2-7/igt@gem_exec_whisper@basic-contexts-all.html
> 
>   * igt@runner@aborted:
>     - shard-mtlp:         NOTRUN -> [FAIL][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13273/shard-mtlp-7/igt@runner@aborted.html
> 

Unrelated to change in kms test.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_13273_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@blit-reloc-keep-cache:
>     - shard-dg2-9:        NOTRUN -> [SKIP][4] ([i915#8411])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13273/shard-dg2-9/igt@api_intel_bb@blit-reloc-keep-cache.html
> 
...cut...
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8404 -> IGTPW_13273
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_16685: aafbd01c99cde1b0b8a117e0ae1b77e87554c7b6 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_13273: 516b93210d865b02860d740d081fd15be4e09d32 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8404: dad4b2bb9e5a2c87ae0275efbf9f0df00a67ef46 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13273/index.html
