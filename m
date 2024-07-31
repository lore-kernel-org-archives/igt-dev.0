Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19089C3DA64
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jul 2024 18:08:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A52A510E6AA;
	Wed, 31 Jul 2024 18:08:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="drxyNmfB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D03410E64F;
 Wed, 31 Jul 2024 18:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722449289; x=1753985289;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+t1fmg2gHO4P8/D6ED58FVyaQq6TfOyIWi/ARuJkXHs=;
 b=drxyNmfBSmwRrb/sSjyu628Gbm53wfD5c/PDESWrss6ndrUbuNlriZO6
 8oxwxdqPS3xhLv7xQrDUr9keTpfEb/+/yjMa0hT2oc6Bn5qZGP0UyCU2D
 BsbvGLY+si+6BHNz9YKTnfn63zvlNhHgfjkrQkGpEZuadHiscOBnFfrnV
 33Arz8f8b+HW5NjzsKE6k4LF72PpvKBKaQnv9bIYFqpfVVQ+578eoCM/G
 CLzxpGnoYlHCT+VaOh/53RuBao9jt0KZPDQn7u5CfFSJoc/rBw8QrnloX
 KJjop9t7fILvguzibNG/h6OZSm0R9qvPTQMBYAMHXv+/V7T6DH4CucHO7 Q==;
X-CSE-ConnectionGUID: gOjVml1MSuq1Ql6wHNuwoQ==
X-CSE-MsgGUID: 6muZdr2nSaO4+ZVf8LH0hA==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="37865641"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="37865641"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 11:08:09 -0700
X-CSE-ConnectionGUID: o4Fvkx3LQfOLfCdZnAA5fA==
X-CSE-MsgGUID: HlEh4RHwQguoV41JMj1GSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="54448883"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 11:08:08 -0700
Date: Wed, 31 Jul 2024 20:08:05 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Zack Rusin <zack.rusin@broadcom.com>, I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVA==?= =?utf-8?Q?=3A?= failure for Add
 vmwgfx prime tests (rev5)
Message-ID: <20240731180805.kzyxzgke7yqyvsce@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Zack Rusin <zack.rusin@broadcom.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20240730190037.1134020-1-zack.rusin@broadcom.com>
 <172240177450.466475.6140917655471782919@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <172240177450.466475.6140917655471782919@2413ebb6fbb6>
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
On 2024-07-31 at 04:56:14 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Add vmwgfx prime tests (rev5)
> URL   : https://patchwork.freedesktop.org/series/133402/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_15156_full -> IGTPW_11499_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11499_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11499_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11499/index.html
> 
> Participating hosts (10 -> 8)
> ------------------------------
> 
>   Missing    (2): pig-kbl-iris shard-glk-0 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11499_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_exec_suspend@basic-s3@smem:
>     - shard-mtlp:         [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15156/shard-mtlp-3/igt@gem_exec_suspend@basic-s3@smem.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11499/shard-mtlp-8/igt@gem_exec_suspend@basic-s3@smem.html
> 
>   * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf@psr2-pipe-b-edp-1:
>     - shard-mtlp:         NOTRUN -> [ABORT][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11499/shard-mtlp-6/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf@psr2-pipe-b-edp-1.html
> 

Unrelated to vmwgfx changes.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11499_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@crc32:
>     - shard-rkl:          NOTRUN -> [SKIP][4] ([i915#6230])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11499/shard-rkl-6/igt@api_intel_bb@crc32.html
> 
...cut...
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7942 -> IGTPW_11499
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_15156: acd846e309e206a4dbc83e4b857b6604aa0741af @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11499: 11499
>   IGT_7942: 0f02dc176959e6296866b1bafd3982e277a5e44b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11499/index.html
