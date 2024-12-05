Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C78E0E7716C
	for <igt-dev@archiver.kernel.org>; Thu,  5 Dec 2024 08:15:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B2B410EDE1;
	Thu,  5 Dec 2024 08:15:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DNyTrmHM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD1210EDDA;
 Thu,  5 Dec 2024 08:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733386521; x=1764922521;
 h=message-id:date:mime-version:subject:to:references:cc:
 from:in-reply-to:content-transfer-encoding;
 bh=MQ+0DwPOPys02Wmk4W3IvKwIpwk6Hd1hFA+s1IKE5PA=;
 b=DNyTrmHMpLj21GVgFIXTOiQYyLfDGFGR1GPOKXayedA4WrqA+gSEpp/G
 S0EvscX3Bp7SeQ3EvidTzSO6fIPiKJ6NkPyztKWfON3tsgj+Hh9gpxMo/
 50VlNlr0OpM3ulWNSWZdFMMbIhahBPut3asFrQTDlSW8PrsOQRvRApBGT
 3lmQS4qGEj9uGgQD+oX2X2ozvi2qc0Z7IF/E+gE7+vEZZb5SxNPR+S7ry
 81s8wuaxZXdPDNCo6TfAefnchxyfLXemeRPzUMvM4yd0p5cspzGgG2pZ1
 MGl+Mqryf+PEGduLh93PLYYZR8RYDm/pLUOcXGgF+WNohMLCuJPDtVKRA Q==;
X-CSE-ConnectionGUID: KJSjdE49RUK3iD2IwoNAEQ==
X-CSE-MsgGUID: kejmpyauSMGnXHflNwCXdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="37619594"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; d="scan'208";a="37619594"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 00:15:20 -0800
X-CSE-ConnectionGUID: QediQBMbQtSoe6vO9ymOTA==
X-CSE-MsgGUID: lM/LF8u+RF6h2JJuiOc/WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; d="scan'208";a="93705706"
Received: from jankamin-mobl2.ger.corp.intel.com (HELO [10.213.200.46])
 ([10.213.200.46])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 00:15:19 -0800
Message-ID: <5cda0f86-f498-4828-83bd-8899cffdb74c@linux.intel.com>
Date: Thu, 5 Dec 2024 09:15:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_igt-runne?=
 =?UTF-8?Q?r_fact_checking_=28rev10=29?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
 <173338191997.2861566.1498806692876857674@b555e5b46a47>
Content-Language: en-US
Cc: dominik.karol.piatkowski@intel.com
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <173338191997.2861566.1498806692876857674@b555e5b46a47>
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

Dear I915,

On 05.12.2024 07:58, Patchwork wrote:
> == Series Details ==
> 
> Series: igt-runner fact checking (rev10)
> URL   : https://patchwork.freedesktop.org/series/140841/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_15791_full -> IGTPW_12248_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12248_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12248_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/index.html
> 
> Participating hosts (10 -> 9)
> ------------------------------
> 
>   Missing    (1): shard-glk-0 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12248_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_mmap_offset@clear-via-pagefault:
>     - shard-mtlp:         NOTRUN -> [ABORT][1] +1 other test abort
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-mtlp-6/igt@gem_mmap_offset@clear-via-pagefault.html
> 
>   * igt@i915_pm_rps@reset:
>     - shard-snb:          NOTRUN -> [DMESG-FAIL][2]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-snb7/igt@i915_pm_rps@reset.html
> 
>   * igt@i915_suspend@basic-s3-without-i915:
>     - shard-snb:          NOTRUN -> [ABORT][3] +1 other test abort
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-snb1/igt@i915_suspend@basic-s3-without-i915.html
> 
>   * igt@kms_async_flips@crc-atomic@pipe-c-dp-4 (NEW):
>     - {shard-dg2-9}:      NOTRUN -> [FAIL][4] +3 other tests fail
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-dg2-9/igt@kms_async_flips@crc-atomic@pipe-c-dp-4.html
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][5]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-glk4/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1:
>     - shard-rkl:          NOTRUN -> [FAIL][6] +1 other test fail
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12248/shard-rkl-4/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html

These are unrelated to my change. Please fix and re-run.

Thank you,

Peter
