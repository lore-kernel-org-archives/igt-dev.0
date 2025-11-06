Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D65E3CCFA03
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 11:00:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AF7F10E899;
	Thu,  6 Nov 2025 11:00:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vl+IgMC2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12E8310E899;
 Thu,  6 Nov 2025 11:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762426859; x=1793962859;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7T3oFbQF5I4l8OZ96K6lD2o1Pn+nvZkwrkm80JgYnl0=;
 b=Vl+IgMC2JbfP5DDRzSWZOjP/z7gTYcntzMDfoMKGKVr29zoq5o+zeGuf
 1T2k1FRV/CDDqMM0T3uiQxkh0kf1kHD6A17hkZxbL1P78Y1BhJWrmUF0i
 BgGh84JJ6UNzCOpKrFa89KzpCFg+ufWWXbVYMPRTya6f3gIoTR3Yzkfhh
 OlqpupccPp1EEO7iRSksd650e324mEsqarwFkp9atLM6wy6blRYKsR8Ws
 88BbuEo98yMDgvA9rveOa3S88jEMY8zQrKs/W7Mz+nDkPHnuxe/HuNdT5
 EAaEtT78x5qAe5EI7vFAlzcQW+0KPm5C0iPUmNjqQfWmORxCaYu03gwDm A==;
X-CSE-ConnectionGUID: ODXGPPTFQeumToW2cQ7L/w==
X-CSE-MsgGUID: ZB0wHZD8TcG1T2+UF5tGYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="64656137"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="64656137"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 03:00:59 -0800
X-CSE-ConnectionGUID: dVQI/A31Rl6gMFwuxWBnpw==
X-CSE-MsgGUID: lJXd/g3fQxqqll2n+Vf+xg==
X-ExtLoop1: 1
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.73])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 03:00:58 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: I915-ci-infra@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Subject: Re: =?UTF-8?B?4pyX?= i915.CI.BAT: failure for tests/dmabuf: Avoid soft
 lockups on slow platforms
Date: Thu, 06 Nov 2025 12:00:55 +0100
Message-ID: <2751395.Isy0gbHreE@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <176233530617.19585.1715196185756608873@10055242dc62>
References: <20251104112116.432508-2-janusz.krzysztofik@linux.intel.com>
 <176233530617.19585.1715196185756608873@10055242dc62>
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

Hi I915-ci-infra@lists.freedesktop.org,

On Wednesday, 5 November 2025 10:35:06 CET Patchwork wrote:
> == Series Details ==
> 
> Series: tests/dmabuf: Avoid soft lockups on slow platforms
> URL   : https://patchwork.freedesktop.org/series/156999/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8607 -> IGTPW_13989
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_13989 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_13989, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13989/index.html
> 
> Participating hosts (46 -> 44)
> ------------------------------
> 
>   Missing    (2): fi-snb-2520m bat-adls-6 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_13989:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@dmabuf@all-tests@dma_fence_chain:
>     - bat-twl-2:          [PASS][1] -> [SKIP][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8607/bat-twl-2/igt@dmabuf@all-tests@dma_fence_chain.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13989/bat-twl-2/igt@dmabuf@all-tests@dma_fence_chain.html
>     - bat-jsl-1:          [PASS][3] -> [SKIP][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8607/bat-jsl-1/igt@dmabuf@all-tests@dma_fence_chain.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13989/bat-jsl-1/igt@dmabuf@all-tests@dma_fence_chain.html
>     - bat-twl-1:          [PASS][5] -> [SKIP][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8607/bat-twl-1/igt@dmabuf@all-tests@dma_fence_chain.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13989/bat-twl-1/igt@dmabuf@all-tests@dma_fence_chain.html
>     - bat-jsl-5:          [PASS][7] -> [SKIP][8]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8607/bat-jsl-5/igt@dmabuf@all-tests@dma_fence_chain.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13989/bat-jsl-5/igt@dmabuf@all-tests@dma_fence_chain.html
>     - fi-tgl-1115g4:      [PASS][9] -> [SKIP][10]
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8607/fi-tgl-1115g4/igt@dmabuf@all-tests@dma_fence_chain.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13989/fi-tgl-1115g4/igt@dmabuf@all-tests@dma_fence_chain.html

That selftest is hardware agnostic, but can trigger soft lockups on slow 
machines, see https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904.  
To avoid resulting aborts that reduce coverage, this patch intentionally 
introduces skips on machines that can occur too slow.  Those skips are 
intended to be handled in CI Bug Log as expected skips.  Please open a new 
issue for those skips detected in pre-merge and re-report.  In the worst case, 
if this solution is not accepted, we'll just close that issue.

Thanks,
Janusz

> Known issues
> ------------
...
> #### Possible fixes ####
> 
>   * igt@dmabuf@all-tests:
>     - fi-pnv-d510:        [ABORT][32] ([i915#12904]) -> [PASS][33]
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8607/fi-pnv-d510/igt@dmabuf@all-tests.html
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13989/fi-pnv-d510/igt@dmabuf@all-tests.html
> 
...   
> #### Warnings ####
> 
>   * igt@dmabuf@all-tests@dma_fence_chain:
>     - fi-pnv-d510:        [ABORT][38] ([i915#12904]) -> [SKIP][39]
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8607/fi-pnv-d510/igt@dmabuf@all-tests@dma_fence_chain.html
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13989/fi-pnv-d510/igt@dmabuf@all-tests@dma_fence_chain.html
> 
>   
>   [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
>   [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
>   [i915#15198]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15198
>   [i915#15233]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15233
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8607 -> IGTPW_13989
>   * Linux: CI_DRM_17483 -> CI_DRM_17486
> 
>   CI-20190529: 20190529
>   CI_DRM_17483: 23a9835dc75d0a8ce54cce440a3e0b36c4cec6af @ git://anongit.freedesktop.org/gfx-ci/linux
>   CI_DRM_17486: 957ab9ac657700dee50f42438ed79652dad939a0 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_13989: 13989
>   IGT_8607: 8607
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13989/index.html
> 




