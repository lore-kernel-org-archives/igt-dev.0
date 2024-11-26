Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED946D65520
	for <igt-dev@archiver.kernel.org>; Tue, 26 Nov 2024 16:36:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A771C10E411;
	Tue, 26 Nov 2024 16:36:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZF3tJwZX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A005A10E94D;
 Tue, 26 Nov 2024 16:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732638989; x=1764174989;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZnG0CgVVs8jCGvTWyuVyckqEFqXg/scrsmt8MatcR/M=;
 b=ZF3tJwZXkMYlxJCE74wtou3GbTrBXqmgAJcrff4PmjE+h5gzYHpJrDMU
 qiadSU+l/B6oWuJNsHJNzSlrvgTHaZdhz2y6NGnaWtCaWgWnQ/mTFQnfZ
 tFXoD+Exud82CI3zU9TCdB/4P8kewKvGT2ViiSmxCpWsGUUQpTJg0Ppvj
 66+7+Rk2OgYvFkQro1/m/wDbN+oJYROdqZCJx64dCEZ673CGT4RlUuGK0
 dSlANZ/j5ab0BAqmWsIxCkI10VWv76mHJuVnWVNew+D5YRY2sFmOMSAUq
 CGsErzG5eQC8yH/bjqvIuxUkdcn28sJBxTCGxlwh00PTaNiQ2gL4JQ6sA w==;
X-CSE-ConnectionGUID: XzE5ipnXQ8GX/D2XcOWm2Q==
X-CSE-MsgGUID: rrZDR0Q4T7es4zNLVf4oEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="32759174"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="32759174"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 08:36:29 -0800
X-CSE-ConnectionGUID: kzSoHIKzTquFMJwNAT1RcQ==
X-CSE-MsgGUID: igz5ysOaREWmquULLi/94Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="92468106"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 08:36:29 -0800
Date: Tue, 26 Nov 2024 17:36:25 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFU?= =?utf-8?Q?=3A?= failure for
 Ignore more warns in xe_wedged tests (rev4)
Message-ID: <20241126163625.exwuudqhogdz4qe5@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20241108201839.119079-1-kamil.konieczny@linux.intel.com>
 <173257053612.2994042.5685758336511599379@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173257053612.2994042.5685758336511599379@b555e5b46a47>
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
On 2024-11-25 at 21:35:36 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Ignore more warns in xe_wedged tests (rev4)
> URL   : https://patchwork.freedesktop.org/series/140511/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8125 -> IGTPW_12191
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12191 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12191, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12191/index.html
> 
> Participating hosts (45 -> 44)
> ------------------------------
> 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12191:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live:
>     - fi-pnv-d510:        NOTRUN -> [INCOMPLETE][1] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12191/fi-pnv-d510/igt@i915_selftest@live.html
> 

Unrelated to xe test change, no need for respin as I will send new one soon.

Regards,
Kamil

>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_flip@basic-flip-vs-wf_vblank:
>     - {bat-mtlp-9}:       [PASS][2] -> [FAIL][3] +1 other test fail
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8125/bat-mtlp-9/igt@kms_flip@basic-flip-vs-wf_vblank.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12191/bat-mtlp-9/igt@kms_flip@basic-flip-vs-wf_vblank.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between IGT_8125 and IGTPW_12191:
> 
> ### New IGT tests (1) ###
> 
>   * igt@i915_selftest:
>     - Statuses :
>     - Exec time: [None] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_12191 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@dmabuf@all-tests:
>     - bat-apl-1:          [PASS][4] -> [INCOMPLETE][5] ([i915#12904]) +1 other test incomplete
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8125/bat-apl-1/igt@dmabuf@all-tests.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12191/bat-apl-1/igt@dmabuf@all-tests.html
> 
>   * igt@dmabuf@all-tests@dma_fence_chain:
>     - fi-bsw-nick:        [PASS][6] -> [INCOMPLETE][7] ([i915#12904]) +1 other test incomplete
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8125/fi-bsw-nick/igt@dmabuf@all-tests@dma_fence_chain.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12191/fi-bsw-nick/igt@dmabuf@all-tests@dma_fence_chain.html
> 
>   * igt@i915_pm_rpm@module-reload:
>     - bat-rpls-4:         [PASS][8] -> [FAIL][9] ([i915#12903])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8125/bat-rpls-4/igt@i915_pm_rpm@module-reload.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12191/bat-rpls-4/igt@i915_pm_rpm@module-reload.html
> 
>   * igt@i915_selftest@live:
>     - bat-mtlp-8:         [PASS][10] -> [ABORT][11] ([i915#12061]) +1 other test abort
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8125/bat-mtlp-8/igt@i915_selftest@live.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12191/bat-mtlp-8/igt@i915_selftest@live.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_pm_rpm@module-reload:
>     - bat-dg1-7:          [FAIL][12] ([i915#12903]) -> [PASS][13]
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8125/bat-dg1-7/igt@i915_pm_rpm@module-reload.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12191/bat-dg1-7/igt@i915_pm_rpm@module-reload.html
> 
>   * igt@i915_selftest@live@workarounds:
>     - {bat-arls-6}:       [ABORT][14] ([i915#12061]) -> [PASS][15] +1 other test pass
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8125/bat-arls-6/igt@i915_selftest@live@workarounds.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12191/bat-arls-6/igt@i915_selftest@live@workarounds.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
>   [i915#12903]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12903
>   [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8125 -> IGTPW_12191
> 
>   CI-20190529: 20190529
>   CI_DRM_15743: 6510562075d8541c218e72188f9ef339f8ba371f @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_12191: ae4ed220a690ce77a7679ebfcfc5ae36c7cc9d3b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8125: fbfda23ba003aab3454436d95c233dcf5e3bee54 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12191/index.html
