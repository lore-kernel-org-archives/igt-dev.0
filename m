Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FCEECCD184
	for <igt-dev@archiver.kernel.org>; Thu,  9 Oct 2025 12:55:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FDA810EA33;
	Thu,  9 Oct 2025 12:55:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cAm5hnLb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E95A310EA33
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Oct 2025 12:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760014518; x=1791550518;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=BPxlrd+22UadcMj67kcl7Dw5R+MDyaI1eMiytLJUXP0=;
 b=cAm5hnLb7A8NX83zK1raEQ5Ze4wEOODSpN0Xoraa8zaCGJpxrLlWWLlA
 sEj58oPQcq0Vm9Rxr+O7sScojyYM/N0V/Wl5O6/Vi8zGQFOTDObABrPO4
 H21wT+SLKMy8phiHRt0Mecn4UuZGITDnIB+C/8/9aIJsuhIS9fAymH8Gh
 lPeW+ymQHMgj5q2FFZW2FljFosDwsiae4AlDZyVOiDSUciDX7QdoZIMwt
 ajJy7iYzH6KX0+Qg92sNUHM571DrrvZu32956FbI0hYmZYJCjIyez6Paz
 zgqjponI39wqUtZAN1/ipVn4Ml9JDzwF1yjvXR0X1szmaLaWfnPqTCHiy Q==;
X-CSE-ConnectionGUID: +/vAyI1dQAiah0Env7Ubug==
X-CSE-MsgGUID: bagxR9knQeWKVeJN//dEvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="62383436"
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="62383436"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 05:55:17 -0700
X-CSE-ConnectionGUID: vd6j7VKJQ1ye5qpW450acg==
X-CSE-MsgGUID: CVh00p0uSECgeLPcviDsdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="184737230"
Received: from unknown (HELO [172.28.180.172]) ([172.28.180.172])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 05:55:17 -0700
Message-ID: <8fc87cb8-1ecd-4da1-ac9e-14bd3afad5cf@linux.intel.com>
Date: Thu, 9 Oct 2025 14:55:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_lib/xe/xe?=
 =?UTF-8?Q?=5Fsriov=5Fdebugfs=3A_Adapt_SR-IOV_debugfs_helpers_to_new_layout?=
To: igt-dev@lists.freedesktop.org, lgci.bug.filing@intel.com
References: <20251008150939.670778-1-marcin.bernatowicz@linux.intel.com>
 <175994765366.19641.3352421000403517227@6aec98b87f92>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <175994765366.19641.3352421000403517227@6aec98b87f92>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 10/8/2025 8:20 PM, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/xe/xe_sriov_debugfs: Adapt SR-IOV debugfs helpers to new layout
> URL   : https://patchwork.freedesktop.org/series/155618/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8578 -> IGTPW_13874
> ====================================================
> 
> Summary
> -------
> 
>    **FAILURE**
> 
>    Serious unknown changes coming with IGTPW_13874 absolutely need to be
>    verified manually.
>    
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_13874, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in CI.
> 
>    External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13874/index.html
> 
> Participating hosts (43 -> 42)
> ------------------------------
> 
>    Missing    (1): fi-snb-2520m
> 
> Possible new issues
> -------------------
> 
>    Here are the unknown changes that may have been introduced in IGTPW_13874:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>    * igt@kms_pm_rpm@basic-rte:
>      - fi-cfl-8700k:       [PASS][1] -> [FAIL][2]
>     [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8578/fi-cfl-8700k/igt@kms_pm_rpm@basic-rte.html
>     [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13874/fi-cfl-8700k/igt@kms_pm_rpm@basic-rte.html

Not related to the change.

> 
>    
> Known issues
> ------------
> 
[...]
