Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E42E65D2C
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 07:06:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA9310EADE;
	Fri, 22 Nov 2024 07:06:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DqWIxOq7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D9A10EADD;
 Fri, 22 Nov 2024 07:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732259185; x=1763795185;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zhKYoE5ABLpZIwDZIef3ZTkNWYsBhUom92M9mG69B8o=;
 b=DqWIxOq7iBCOZS6bldil17NR/EF2AavmaAKCUFc6Y5wW+CunaHYKk35V
 WNeekmRWe+qDYJV5DTL+DTSN848SlPodyelbMvyQYQXXImnJk4hXQyk/w
 duraYzG7veGVmkOQEOREpEAsQsC8zijifx9Y64+/ipgDXgHsjlmXuQuVB
 L7mNFzZWkQ/U1LzHOR8n2w9mgXHQq46TJn/Ljd+VrPLMoHGJRWYkyeZUF
 u8bNnfIZxyWBB2cOOoRnZ2qmJ+59wCOwkPgdCoK9V0AvF9B08TAG824Bk
 bQ9ZreZdGpIlvjTMXMTTMfC6W4j2YmeAya+J3PrdofX2uIJUml/FzEMw1 w==;
X-CSE-ConnectionGUID: cA1x2NKJQiKhbS44g0JF8A==
X-CSE-MsgGUID: H4kopPTaS5OHzbCdgCnz9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="31794704"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="31794704"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 23:06:24 -0800
X-CSE-ConnectionGUID: vF8vrBuSRyydkY12aqGG7g==
X-CSE-MsgGUID: 4Ch0IBmtQKa8YPkhYZbd3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="90655218"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.134])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 23:06:22 -0800
Date: Fri, 22 Nov 2024 08:06:19 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFU?= =?utf-8?Q?=3A?= failure for
 GPGPU fill improvements (rev5)
Message-ID: <20241122070619.whjtsyr6li3awbdz@zkempczy-mobl2>
References: <20241121123308.98158-1-zbigniew.kempczynski@intel.com>
 <173222480150.1361745.14564056448440395740@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <173222480150.1361745.14564056448440395740@b555e5b46a47>
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

On Thu, Nov 21, 2024 at 09:33:21PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: GPGPU fill improvements (rev5)
> URL   : https://patchwork.freedesktop.org/series/141352/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8121 -> IGTPW_12164
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12164 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12164, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12164/index.html
> 
> Participating hosts (45 -> 43)
> ------------------------------
> 
>   Missing    (2): fi-snb-2520m fi-elk-e7500 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12164:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live:
>     - bat-arls-5:         [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8121/bat-arls-5/igt@i915_selftest@live.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12164/bat-arls-5/igt@i915_selftest@live.html

Unrelated to the series. May I ask for continuing execution (I need
to check results from full run).

--
Zbigniew

> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@i915_selftest@live:
>     - {bat-mtlp-9}:       NOTRUN -> [ABORT][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12164/bat-mtlp-9/igt@i915_selftest@live.html
>     - {bat-arls-6}:       [PASS][4] -> [ABORT][5]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8121/bat-arls-6/igt@i915_selftest@live.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12164/bat-arls-6/igt@i915_selftest@live.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_12164 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@i915_selftest@live@workarounds:
>     - bat-arls-5:         [PASS][6] -> [ABORT][7] ([i915#12061])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8121/bat-arls-5/igt@i915_selftest@live@workarounds.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12164/bat-arls-5/igt@i915_selftest@live@workarounds.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_module_load@load:
>     - {bat-mtlp-9}:       [INCOMPLETE][8] -> [PASS][9]
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8121/bat-mtlp-9/igt@i915_module_load@load.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12164/bat-mtlp-9/igt@i915_module_load@load.html
> 
>   * igt@i915_pm_rpm@module-reload:
>     - bat-dg2-11:         [FAIL][10] ([i915#12903]) -> [PASS][11]
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8121/bat-dg2-11/igt@i915_pm_rpm@module-reload.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12164/bat-dg2-11/igt@i915_pm_rpm@module-reload.html
> 
>   * igt@i915_selftest@live:
>     - bat-arlh-3:         [ABORT][12] -> [PASS][13]
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8121/bat-arlh-3/igt@i915_selftest@live.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12164/bat-arlh-3/igt@i915_selftest@live.html
> 
>   * igt@i915_selftest@live@workarounds:
>     - bat-arlh-3:         [ABORT][14] ([i915#12061]) -> [PASS][15]
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8121/bat-arlh-3/igt@i915_selftest@live@workarounds.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12164/bat-arlh-3/igt@i915_selftest@live@workarounds.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-read:
>     - bat-dg2-13:         [DMESG-WARN][16] ([i915#12253]) -> [PASS][17]
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8121/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12164/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html
> 
>   * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-1:
>     - bat-apl-1:          [DMESG-WARN][18] -> [PASS][19] +1 other test pass
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8121/bat-apl-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-1.html
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12164/bat-apl-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-1.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [i915#10216]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216
>   [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
>   [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
>   [i915#12253]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12253
>   [i915#12903]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12903
>   [i915#12915]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12915
>   [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
>   [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
>   [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
>   [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
>   [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
>   [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
>   [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
>   [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
>   [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
>   [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
>   [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
>   [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
>   [i915#9159]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9159
>   [i915#9318]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318
>   [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8121 -> IGTPW_12164
>   * Linux: CI_DRM_15725 -> CI_DRM_15726
> 
>   CI-20190529: 20190529
>   CI_DRM_15725: e46649e7764a9f6868ccbcba7b8b23b413303380 @ git://anongit.freedesktop.org/gfx-ci/linux
>   CI_DRM_15726: 3304ae3acb744c6ea5e8cef09b01d2d527d38715 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_12164: 12164
>   IGT_8121: 8121
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12164/index.html
