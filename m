Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE20DCCD184
	for <igt-dev@archiver.kernel.org>; Thu,  9 Oct 2025 12:54:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB7B10EA37;
	Thu,  9 Oct 2025 12:54:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dMgFEE/s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9192610EA3D
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Oct 2025 12:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760014450; x=1791550450;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=hopC1dxlBP+6PguBP416dEgLEI/CfU7zhVeDw+MGRxA=;
 b=dMgFEE/sLg6K02ZUsFKYT/n3m8xSjo+laQbUTozg2IXWux0M1CXdzXFj
 h3wDEB0goF1DyqbQ9Z3C3kROpeWMAOprn8w5wPJLPjlFo/kEcgD3AxvBX
 jHtivyISald9ySzbZxpbifv1UUtlpM+vozVp+WUo6RSYHhXqD/UV3f301
 pIkpyxUnxciTh7XHzZexK8P4v4GbARd5C3y5MfndL2KAKjQcxyi79xTkv
 fbqwN80V3uWhJ69F40iX3k9GXgOtIiFSvL1bi7djzLoXarnitd4EDSN9U
 jZ6Vz5KPaIeqcm6R2+BzrecaVLc2FlJ2OcyK4gUA/JfdEAoXT7i5bykPJ Q==;
X-CSE-ConnectionGUID: bdlkvXbzQEqjhIo4+xAT3w==
X-CSE-MsgGUID: 6sPvqeA8QgOkOr7ojHiUiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="66074283"
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="66074283"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 05:54:10 -0700
X-CSE-ConnectionGUID: gDGO0qUZSyKberLGBVTrdg==
X-CSE-MsgGUID: UlcLd0XJTvW9F/TQ2po3Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="184737045"
Received: from unknown (HELO [172.28.180.172]) ([172.28.180.172])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 05:54:10 -0700
Message-ID: <168aa0a8-4e2f-47af-9a5f-d98319b1be39@linux.intel.com>
Date: Thu, 9 Oct 2025 14:54:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBsaWIveGUveGVf?=
 =?UTF-8?Q?sriov=5Fdebugfs=3A_Adapt_SR-IOV_debugfs_helpers_to_new_layout?=
To: igt-dev@lists.freedesktop.org, lgci.bug.filing@intel.com
References: <20251008150939.670778-1-marcin.bernatowicz@linux.intel.com>
 <175995131239.19641.2597296005454556250@6aec98b87f92>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <175995131239.19641.2597296005454556250@6aec98b87f92>
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



On 10/8/2025 9:21 PM, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/xe/xe_sriov_debugfs: Adapt SR-IOV debugfs helpers to new layout
> URL   : https://patchwork.freedesktop.org/series/155618/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8578_FULL -> XEIGTPW_13874_FULL
> ====================================================
> 
> Summary
> -------
> 
>    **FAILURE**
> 
>    Serious unknown changes coming with XEIGTPW_13874_FULL absolutely need to be
>    verified manually.
>    
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_13874_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in CI.
> 
>    
> 
> Participating hosts (4 -> 3)
> ------------------------------
> 
>    Missing    (1): shard-adlp
> 
> Possible new issues
> -------------------
> 
>    Here are the unknown changes that may have been introduced in XEIGTPW_13874_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>    * igt@xe_pm@s4-mocs:
>      - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2]
>     [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8578/shard-dg2-436/igt@xe_pm@s4-mocs.html
>     [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13874/shard-dg2-464/igt@xe_pm@s4-mocs.html
> 

Not related to the change.

>    
> #### Suppressed ####
> 
>    The following results come from untrusted machines, tests, or statuses.
>    They do not affect the overall result.
> 
>    * {igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-blt}:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][3] +3 other tests skip
>     [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13874/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-blt.html
> 
>    * {igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma}:
>      - shard-lnl:          [PASS][4] -> [FAIL][5]
>     [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8578/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
>     [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13874/shard-lnl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
> 
>    
> Known issues
> ------------
> 

[...]

