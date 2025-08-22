Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A67E3CA0EEB
	for <igt-dev@archiver.kernel.org>; Fri, 22 Aug 2025 13:14:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E56C10EB0E;
	Fri, 22 Aug 2025 13:14:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J4tiSsyn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B70B410EB0E;
 Fri, 22 Aug 2025 13:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755868492; x=1787404492;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hWSnmjlYJrVn6iyIHI6od7y8D08FhKQUCjTtv1e/sQY=;
 b=J4tiSsynbyKsm6kkSUxJJGJIWCcAyfuMex0axJJdHOt647ym2rTwgrO/
 GvaXqetAiQWvG8B02vb7cv5g2NrN3D/EbcdFHe2zJ7TcNpQRGMXa5MJ98
 YOlcC4pjUrByPfcshTIH1+oNZb9zZKkEsDnLocAPZXf7e00LSOtUYC7UE
 Q7jnWbemWVGkDrBeF764kpJsvnxKS0vIX+HKgE01mFG5enXJqBLQX3M1m
 Lm1UDXX898NWvCdnuqSO1P3WzkWlT/nIaFV3ncguJsx30SLGC19I4DERA
 yYIi2g4UunmpqXnfHrbEgi1MGitOPHJkKNP1Z+ILGufFs43kcVcB3NI/n g==;
X-CSE-ConnectionGUID: /ijURUGXTbmvRYh8j8EBlw==
X-CSE-MsgGUID: Hc2WKHKdTpKUE1ufmSJDYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="75630832"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="75630832"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 06:14:51 -0700
X-CSE-ConnectionGUID: VvCaIFmITDGJfsenyO6gbQ==
X-CSE-MsgGUID: /5yhmyfDQmKBhcuwOnRJyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="172966853"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 06:14:50 -0700
Date: Fri, 22 Aug 2025 15:14:47 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests=2Fint?=
 =?utf-8?B?ZWwveGVfc3lzZnNfZmlsZV9wZXJt?= =?utf-8?Q?=3A?= Verify sysfs file
 permissions for security
Message-ID: <20250822131447.qjhtcwsftotkgo7t@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20250813131948.573785-1-peter.senna@linux.intel.com>
 <175510600771.234050.17665444740202199680@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <175510600771.234050.17665444740202199680@1538d3639d33>
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
On 2025-08-13 at 17:26:47 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_sysfs_file_perm: Verify sysfs file permissions for security
> URL   : https://patchwork.freedesktop.org/series/152889/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8493_FULL -> XEIGTPW_13578_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_13578_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_13578_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 3)
> ------------------------------
> 
>   Missing    (1): shard-adlp 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_13578_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_hdr@bpc-switch-suspend:
>     - shard-dg2-set2:     [PASS][1] -> [TIMEOUT][2] +1 other test timeout
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8493/shard-dg2-466/igt@kms_hdr@bpc-switch-suspend.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13578/shard-dg2-466/igt@kms_hdr@bpc-switch-suspend.html
> 

This is unrelated.

>   * {igt@xe_sysfs_file_perm@check-file-permissions} (NEW):
>     - shard-dg2-set2:     NOTRUN -> [FAIL][3]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13578/shard-dg2-432/igt@xe_sysfs_file_perm@check-file-permissions.html
>     - shard-lnl:          NOTRUN -> [SKIP][4]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13578/shard-lnl-2/igt@xe_sysfs_file_perm@check-file-permissions.html
> 

This is unexpectedm this new test should not skip on LNL.

Regards,
Kamil

>   
> New tests
> ---------
> 
>   New tests have been introduced between XEIGT_8493_FULL and XEIGTPW_13578_FULL:
> 
> ### New IGT tests (1) ###
> 
>   * igt@xe_sysfs_file_perm@check-file-permissions:
>     - Statuses : 1 fail(s) 1 pass(s) 1 skip(s)
>     - Exec time: [0.0, 0.09] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_13578_FULL that come from known issues:
> 

...cut...

