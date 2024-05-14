Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F13C04FFE
	for <igt-dev@archiver.kernel.org>; Tue, 14 May 2024 13:27:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E81B10E298;
	Tue, 14 May 2024 13:27:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="luDCvov9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C72B510E110;
 Tue, 14 May 2024 13:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715693250; x=1747229250;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QeGpQPTU4b5qc1TUlpKBWURrVe/5nd/e39AArwDfqiY=;
 b=luDCvov9xwdIyN0kP/x8EPRSiXzJV3Fh3urGigND3lqcjm7Cnc3R9Wtn
 Z1Ag6gcTwv8vepybzI9riyyJMNRoczTbA2pLonC6xyS4S5AAXf/257sGY
 hxs56fhBz4NzN7Ldw1SPEg0113cJhPZEuw5xRSfOQIvNsT8gKttIU/Fqw
 uOPgdCW4qNQx9i8PxDndzgf6Ctm4GOm21etYUMziF2sbeb1qxn7jsEuM5
 /IWlXtS92oa2zz1sWqwQ5uDthUAR0jJr/n9f2aou7RHf8kTbrzjI2P2/v
 iQYUf0S6Zmu9ZnzNPDizQNlC6dHiO2bD2kW/B+X0v889acAOlYNVSLUek w==;
X-CSE-ConnectionGUID: Sv9yg/HnStG28fA7wvzVEg==
X-CSE-MsgGUID: mru20o13SAKaCGmTaLDt0w==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="29192883"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="29192883"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 06:27:29 -0700
X-CSE-ConnectionGUID: B6q5mEbBR0uXXUnUDlavSQ==
X-CSE-MsgGUID: WGvVCiN7QnabwWHjJwk4Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="35147508"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 06:27:28 -0700
Date: Tue, 14 May 2024 15:27:11 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Alex Hung <alex.hung@amd.com>, I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmbw==?= =?utf-8?Q?r?=
 tests/kms_writeback: Set atomic and writeback_connector early
Message-ID: <20240514132711.pbb4sepfa63iq2hp@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Alex Hung <alex.hung@amd.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20240513230356.695515-1-alex.hung@amd.com>
 <171568493096.2114579.13556114969574503739@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171568493096.2114579.13556114969574503739@8e613ede5ea5>
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
On 2024-05-14 at 11:08:50 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/kms_writeback: Set atomic and writeback_connector early
> URL   : https://patchwork.freedesktop.org/series/133574/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14757_full -> IGTPW_11138_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11138_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11138_full, please notify your bug team (&#x27;I915-ci-infra@lists.freedesktop.org&#x27;) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11138/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11138_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_create@create-clear:
>     - shard-tglu:         NOTRUN -> [TIMEOUT][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11138/shard-tglu-8/igt@gem_create@create-clear.html
> 
>   * igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:
>     - shard-tglu:         [PASS][2] -> [TIMEOUT][3]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14757/shard-tglu-6/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11138/shard-tglu-8/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html
> 
>   * igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a1:
>     - shard-snb:          [PASS][4] -> [FAIL][5]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14757/shard-snb7/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a1.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11138/shard-snb7/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a1.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [FAIL][6] +1 other test fail
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11138/shard-rkl-5/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_vblank@wait-idle-hang@pipe-a-hdmi-a-4:
>     - shard-dg1:          [PASS][7] -> [INCOMPLETE][8]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14757/shard-dg1-15/igt@kms_vblank@wait-idle-hang@pipe-a-hdmi-a-4.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11138/shard-dg1-18/igt@kms_vblank@wait-idle-hang@pipe-a-hdmi-a-4.html
> 

These are unrelated to kms_writeback, no need for respin
as path is already merged.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11138_full that come from known issues:
> 

...cut...

> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7850 -> IGTPW_11138
> 
>   CI-20190529: 20190529
>   CI_DRM_14757: 5f823e6608065c42909c6a41adc7ff448cbfbfc5 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11138: 11138
>   IGT_7850: 7850
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11138/index.html
