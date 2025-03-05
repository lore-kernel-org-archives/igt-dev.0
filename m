Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA4AEC282D3
	for <igt-dev@archiver.kernel.org>; Wed,  5 Mar 2025 07:46:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ECE710E6FE;
	Wed,  5 Mar 2025 07:46:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cZj2RxPh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7371710E6FE;
 Wed,  5 Mar 2025 07:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741160761; x=1772696761;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=3c1LdWmRs01cHZ5CO6hwdmpe3akTyqqlvqks32+STOA=;
 b=cZj2RxPhriw9p6IjCcvm3VP0IM1pZoDe3tkNgtE8NwhiNNWyrbCPaAAi
 gNTsMpXJPzkW+2aPEtgRcDFULCHz8/avwFbooxC95owGfB4net6lUeuyJ
 YzsWgbDMtfZE2rWJDNQs3QYp/MB38jvtPDEsRdmdmx2+YJectx1dNN6V+
 R1Ye8+e8EhKDAlXJe1hDoEDO8VmFu7NTd03UEWVURM6SiImKY+JVtG04j
 KczQ6Ha6nGGLmWS63iLTXB6ngeRpuatHaxPCvCD3evI0cIkVoOUk1kq5h
 ziYn4rjKIhBshgEBAe4TX/2UTVZQ9kaT3AqJZ8e95IImNsoLcb3nysbtL Q==;
X-CSE-ConnectionGUID: otG2+hzvQvyUr5ui3OBWIQ==
X-CSE-MsgGUID: i15aTnkOTFKGZvU9p8T5Yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42355680"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; d="scan'208";a="42355680"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 23:46:00 -0800
X-CSE-ConnectionGUID: SuNZA3H5T3uFJLrFVYi3Tw==
X-CSE-MsgGUID: LfKl/SnqRw+HQ+EvwmmOJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; d="scan'208";a="149387513"
Received: from jledworo-mobl.ger.corp.intel.com (HELO [10.245.114.21])
 ([10.245.114.21])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 23:45:59 -0800
Message-ID: <3a204d60-598f-4c2f-95f0-85dea8ef2e08@linux.intel.com>
Date: Wed, 5 Mar 2025 08:44:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_Integrate?=
 =?UTF-8?Q?_kmemleak_scans_in_igt=5Frunner_=28rev5=29?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250227101853.361504-1-peter.senna@linux.intel.com>
 <174115973234.43.3968612023355278653@d1c082ef0712>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <174115973234.43.3968612023355278653@d1c082ef0712>
Content-Type: text/plain; charset=UTF-8
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

Dear i915,

On 05.03.2025 08:28, Patchwork wrote:
> == Series Details ==
> 
> Series: Integrate kmemleak scans in igt_runner (rev5)
> URL   : https://patchwork.freedesktop.org/series/143996/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_16199_full -> IGTPW_12677_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12677_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12677_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12677/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12677_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_exec_big@single:
>     - shard-tglu:         NOTRUN -> [ABORT][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12677/shard-tglu-2/igt@gem_exec_big@single.html

This is unrelated. Please fix and re-run.

[...]

Thank you,

Peter
