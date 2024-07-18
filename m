Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5947CC3DA60
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jul 2024 11:47:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D7510E5C1;
	Thu, 18 Jul 2024 11:47:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NlenqGTQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E644810E1CF;
 Thu, 18 Jul 2024 11:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721303221; x=1752839221;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xD/70M3MYXHktIJ9nRmEtc3ESoLHcUBwM/ODu2WCoYQ=;
 b=NlenqGTQ22J5WWKV/R8EDOvDDIttPe1+kUjMWT9aD8cmXZsiiec5ydK2
 UaqZGLNDCnM9qqBCPbMhYHdXpzAiybUrYj/rNU25cadcaLFupE7sSqYe4
 A15KWKnCEzjltA4NgZ/3C6hmaJodHBYVgI7DkwW0ZfMgybbBIkgXrol8Z
 Ko34+FHycnagT7iiwKy45DrRISlOBjGe25/20VHucS6pUC3OBRWj1ioeN
 Pp9/ykztJTgZhRU8vzpzjSAPAyuH8DIRyXA27luu7QP9t947X3C87VJqz
 A7zETIeWNtZxup2+e8cOWr9REwFw9qFbe63bA4h/QRRS6oft4wHDkK1OW Q==;
X-CSE-ConnectionGUID: naMEZVtlQoyh4tOXRVFSiw==
X-CSE-MsgGUID: RwzeMcwJQE6b6he+i6TktQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="19041684"
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="19041684"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 04:47:00 -0700
X-CSE-ConnectionGUID: hzvJbWk/Q42CEdGySNyY/w==
X-CSE-MsgGUID: bzj9IwSdQSykWq/TyeWmwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="50460216"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.26.184])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 04:46:59 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: I915-ci-infra@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: =?UTF-8?B?4pyX?= Fi.CI.BAT: failure for tests/gem_ctx_exec: Fix
 failing preempt timeout updates
Date: Thu, 18 Jul 2024 13:46:57 +0200
Message-ID: <1891243.tdWV9SEqCh@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <172129657548.272469.2481043233133080953@2413ebb6fbb6>
References: <20240718085912.15434-7-janusz.krzysztofik@linux.intel.com>
 <172129657548.272469.2481043233133080953@2413ebb6fbb6>
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

On Thursday, 18 July 2024 11:56:15 GMT+2 Patchwork wrote:
> == Series Details ==
> 
> Series: tests/gem_ctx_exec: Fix failing preempt timeout updates
> URL   : https://patchwork.freedesktop.org/series/136228/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_15090 -> IGTPW_11425
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11425 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11425, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11425/index.html
> 
> Participating hosts (37 -> 35)
> ------------------------------
> 
>   Missing    (2): fi-snb-2520m fi-bsw-n3050 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11425:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@active:
>     - bat-apl-1:          [PASS][1] -> [DMESG-FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15090/bat-apl-1/igt@i915_selftest@live@active.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11425/bat-apl-1/igt@i915_selftest@live@active.html

Hi I915-ci-infra@lists.freedesktop.org,

This failure, in a selftest, has nothing to do with my changes to IGT.  
For your convenience, I think that's the same as:
https://gfx-ci.igk.intel.com/cibuglog-ng/issue/12801

Please update filters and re-report.

Thanks,
Janusz

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11425 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@i915_selftest@live@hangcheck:
>     - bat-mtlp-8:         [PASS][3] -> [DMESG-FAIL][4] ([i915#9500])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15090/bat-mtlp-8/igt@i915_selftest@live@hangcheck.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11425/bat-mtlp-8/igt@i915_selftest@live@hangcheck.html
> 
>   * igt@kms_frontbuffer_tracking@basic:
>     - bat-arls-2:         [PASS][5] -> [DMESG-WARN][6] ([i915#7507])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15090/bat-arls-2/igt@kms_frontbuffer_tracking@basic.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11425/bat-arls-2/igt@kms_frontbuffer_tracking@basic.html
> 
>   
>   [i915#7507]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7507
>   [i915#9500]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9500
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7929 -> IGTPW_11425
> 
>   CI-20190529: 20190529
>   CI_DRM_15090: 66d3fbb024886f8fbbc15fe79222f046cccd18c7 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11425: eac9ea37cf3260872513fc310dde1efb3c2fdd0f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7929: 7929
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11425/index.html
> 




