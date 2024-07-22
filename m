Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A18C3DA64
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jul 2024 12:45:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1AC210E509;
	Mon, 22 Jul 2024 12:45:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TmYgE3bf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1691910E506;
 Mon, 22 Jul 2024 12:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721652298; x=1753188298;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2NG5odmSsnjO0issZPW58d2Vb1FZBvjsxhgsLJbOglU=;
 b=TmYgE3bf6hR8vfwd4YBoia4cz+iIUmXBUySXu8oQThXwm6hyCaaJ+rGT
 4/TijiOHJETK5im1x2fv5Ut9JE/WU03CWrM+gQYARiLu9S52GLkD/a3Z5
 Vb+gTFtCEDmLPObYYUZ+nLdOfx5vt0eeEOSSTAo7krcZiQT+PYuas5zIk
 cjHfrt+NzHg9JsYDz6VFIKRKFOKeG6WxVXTZiK9dVxwCZIDBw84cOKbu7
 w99cVyBNRkppogaXfbhPtYR3Cdbx/pv1a2SyCGSPCvLWYdWngyJqPApdb
 Zr/7lH5bqp6YAbTRI7kkOsG6flbpSKoQRjj/KRKAB1PawxFygb7a5aE0z Q==;
X-CSE-ConnectionGUID: khOhx97oSI6SuOwyiujC6g==
X-CSE-MsgGUID: 7ZZgQaOWQVqevfEfXnhg7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="23083000"
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; d="scan'208";a="23083000"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 05:44:58 -0700
X-CSE-ConnectionGUID: 9vnYq5yuQUGWAHJ3qVklEQ==
X-CSE-MsgGUID: 3yKmHQhsQCqWz8Xx6EYLgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; d="scan'208";a="51940336"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.233])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 05:44:57 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: I915-ci-infra@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Subject: Re: =?UTF-8?B?4pyX?= CI.xeBAT: failure for lib/kunit: Fixes and
 enhancements
Date: Mon, 22 Jul 2024 13:56:29 +0200
Message-ID: <12477460.O9o76ZdvQC@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <172164396585.327121.2949508267655182525@2413ebb6fbb6>
References: <20240722080913.74333-5-janusz.krzysztofik@linux.intel.com>
 <172164396585.327121.2949508267655182525@2413ebb6fbb6>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

On Monday, 22 July 2024 12:26:05 GMT+2 Patchwork wrote:
> == Series Details ==
> 
> Series: lib/kunit: Fixes and enhancements
> URL   : https://patchwork.freedesktop.org/series/136329/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7933_BAT -> XEIGTPW_11440_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11440_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11440_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (7 -> 7)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_11440_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind:
>     - bat-pvc-2:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/bat-pvc-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/bat-pvc-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html

Hi I915-ci-infra@lists.freedesktop.org,

My series touches kunit selftests only, and that's not a test like that, then 
the failure is for sure not related to my changes.  Please update your 
filters.

Thanks,
Janusz


> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@xe_waitfence@engine:
>     - {bat-bmg-1}:        [PASS][3] -> [DMESG-WARN][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/bat-bmg-1/igt@xe_waitfence@engine.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/bat-bmg-1/igt@xe_waitfence@engine.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11440_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_flip@basic-flip-vs-wf_vblank:
>     - bat-lnl-1:          [PASS][5] -> [FAIL][6] ([Intel XE#886]) +1 other test fail
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@xe_gt_freq@freq_fixed_idle:
>     - bat-adlp-7:         [FAIL][7] ([Intel XE#2262]) -> [PASS][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/bat-adlp-7/igt@xe_gt_freq@freq_fixed_idle.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/bat-adlp-7/igt@xe_gt_freq@freq_fixed_idle.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#2262]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2262
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7933 -> IGTPW_11440
>   * Linux: xe-1633-25cbb0b9828d08006be65c72f2ad5e85766d1941 -> xe-1641-867eb2599d00e03d12a2a49b223cf37280d7ee2e
> 
>   IGTPW_11440: 11440
>   IGT_7933: 7933
>   xe-1633-25cbb0b9828d08006be65c72f2ad5e85766d1941: 25cbb0b9828d08006be65c72f2ad5e85766d1941
>   xe-1641-867eb2599d00e03d12a2a49b223cf37280d7ee2e: 867eb2599d00e03d12a2a49b223cf37280d7ee2e
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/index.html
> 




