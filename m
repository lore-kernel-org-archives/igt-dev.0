Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC4D3E7717F
	for <igt-dev@archiver.kernel.org>; Tue, 17 Dec 2024 19:13:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C6A110E641;
	Tue, 17 Dec 2024 19:13:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PszCbdX6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A46A110E3E3;
 Tue, 17 Dec 2024 19:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734462822; x=1765998822;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GzVTqPvClBchZIEMiBCXMSLtK7D6DQDkxwjVmLdXuIU=;
 b=PszCbdX6VrKjblH4JoSXgxiX7XVNRRuWemWS7gipVS1lEhbSV7D7UIc+
 eASRDnHRdAw06gqomjFaCk8VphB5pDpP03esWfdpuKv9YFVKw7KhJf8F0
 PtWPTG2++m2kbPToo8purNqEe+VmHtgwiRAU/UCuPiWKxavw9PY2DKRTP
 QgxOCPVchkFym1WelNWXC1x9y8kU5t5qri0EfGlo9Ir2/0Rlokc0iZ7cz
 2xfHo59Tq3w1FVsE6ffzbkuOPgjcLOcNtjzsfQUsGr0rPvdCWOl8rlmjX
 8YN8tyII+dLY3IlA44ybK5kDTAhfQFmTNDNiqCULYORw9OyWH1mkQiTIm g==;
X-CSE-ConnectionGUID: C6yPx2awRzi0fYw7tieb4w==
X-CSE-MsgGUID: 0WO4KiKGTuyR1VtsDIDBlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="22494116"
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; d="scan'208";a="22494116"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 11:13:41 -0800
X-CSE-ConnectionGUID: Vvo7IUZUQdSYsXfux43m8Q==
X-CSE-MsgGUID: NAorijCRRKeC6ujOnGVsjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; d="scan'208";a="97660427"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 11:13:41 -0800
Date: Tue, 17 Dec 2024 20:13:37 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFU?= =?utf-8?Q?=3A?= failure for
 tests/intel/gem_pxp: Fix requirements
Message-ID: <20241217191337.vaylwpewjisy3rs3@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20241216153129.50964-1-kamil.konieczny@linux.intel.com>
 <173438992968.3469166.7237217777999239782@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173438992968.3469166.7237217777999239782@b555e5b46a47>
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
On 2024-12-16 at 22:58:49 -0000, Patchwork wrote:

unrelated to change in gem_pxp test, please respin.

Regards,
Kamil

> == Series Details ==
> 
> Series: tests/intel/gem_pxp: Fix requirements
> URL   : https://patchwork.freedesktop.org/series/142659/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8157 -> IGTPW_12326
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12326 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12326, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/index.html
> 
> Participating hosts (45 -> 44)
> ------------------------------
> 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12326:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@runner@aborted:
>     - fi-pnv-d510:        NOTRUN -> [FAIL][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/fi-pnv-d510/igt@runner@aborted.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_12326 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@i915_selftest@live@workarounds:
>     - bat-arlh-3:         [PASS][2] -> [ABORT][3] ([i915#12061]) +1 other test abort
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8157/bat-arlh-3/igt@i915_selftest@live@workarounds.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/bat-arlh-3/igt@i915_selftest@live@workarounds.html
>     - bat-arlh-2:         [PASS][4] -> [ABORT][5] ([i915#12061]) +1 other test abort
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8157/bat-arlh-2/igt@i915_selftest@live@workarounds.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/bat-arlh-2/igt@i915_selftest@live@workarounds.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_selftest@live@workarounds:
>     - {bat-arls-6}:       [ABORT][6] ([i915#12061]) -> [PASS][7] +1 other test pass
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8157/bat-arls-6/igt@i915_selftest@live@workarounds.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/bat-arls-6/igt@i915_selftest@live@workarounds.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8157 -> IGTPW_12326
>   * Linux: CI_DRM_15848 -> CI_DRM_15855
> 
>   CI-20190529: 20190529
>   CI_DRM_15848: 63be16e210b1c3e43b43d8ca9b7e17f15142d2c3 @ git://anongit.freedesktop.org/gfx-ci/linux
>   CI_DRM_15855: 8bfb48c045396305771aaea35f06d5ef3bf3a191 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_12326: 2db9f685a997db9f93d6e0c034b3a2b48cd3ef92 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8157: 48a70f6795e6d68b9fae275261ae3b09d3401fe1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/index.html
