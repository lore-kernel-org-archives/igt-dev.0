Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88017E77188
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 05:18:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E1010E17D;
	Wed, 18 Dec 2024 05:18:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h1zZn4+k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E39110E17D;
 Wed, 18 Dec 2024 05:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734499127; x=1766035127;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=U+oxL7vGyFFkKhnlsKBNL0WIRCct3BB0hIstc965dZE=;
 b=h1zZn4+kKUkx1sXH9WWhrmPWby/MCLsUJAegu60HDEA0iP3Ol0x6R2BI
 OVX8cZH/e6dhY2hh1xPYPiuhVAngYgmoWrUHbjq1lJYX21GQHfDbZW/OR
 CtI4qtQ1eDN/6JpXJhHoDTJGlfqvgZcUsQmwI0LCZvM2LoxQMV6meFAOb
 VNcrC9glCjWf1tu1qybSSRZxeJlxVmZhjIMk8z9O0crOCBELnDzIiUzuY
 SQ15HWoukmt1fH7B8z0R8hJavkWdtvoH6BnmpvwIWGhj0rclaGYL+4fyW
 ifhta5Esktyl23pn/RKs6RXNOttNPmNPGGvToQuabydraUhIonrhAZKau w==;
X-CSE-ConnectionGUID: RjWvLgP5TFiwohHq1T2reQ==
X-CSE-MsgGUID: bWivTCLOShajh1fJhD5iVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="38895670"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="38895670"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 21:18:47 -0800
X-CSE-ConnectionGUID: VgosJne9Q8yOVJSOKSQNRg==
X-CSE-MsgGUID: JJpWKtqwRje5922HieEvpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="101886748"
Received: from sshkruni-mobl2.ger.corp.intel.com (HELO [10.213.202.48])
 ([10.213.202.48])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 21:18:47 -0800
Message-ID: <472d9a63-8ab9-435c-9a7b-48865ca617d0@linux.intel.com>
Date: Wed, 18 Dec 2024 06:18:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBpOTE1LkNJLkZ1bGw6IGZhaWx1cmUgZm9yIGlndF9mYWN0?=
 =?UTF-8?Q?s_for_fact_tracking_=28rev2=29?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20241216151420.43042-1-peter.senna@linux.intel.com>
 <173444554570.3847390.6842367390907416387@b555e5b46a47>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <173444554570.3847390.6842367390907416387@b555e5b46a47>
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


On 17.12.2024 15:25, Patchwork wrote:
> == Series Details ==
> 
> Series: igt_facts for fact tracking (rev2)
> URL   : https://patchwork.freedesktop.org/series/142628/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_15854_full -> IGTPW_12325_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12325_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12325_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12325/index.html
> 
> Participating hosts (11 -> 12)
> ------------------------------
> 
>   Additional (1): shard-dg2-set2 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12325_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_eio@in-flight-contexts-10ms:
>     - shard-snb:          NOTRUN -> [FAIL][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12325/shard-snb7/igt@gem_eio@in-flight-contexts-10ms.html
> 
>   * igt@gem_eio@in-flight-suspend:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][2]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12325/shard-glk7/igt@gem_eio@in-flight-suspend.html
> 
>   * igt@kms_color@invalid-degamma-lut-sizes:
>     - shard-snb:          NOTRUN -> [INCOMPLETE][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12325/shard-snb1/igt@kms_color@invalid-degamma-lut-sizes.html
> 
>   * igt@perf_pmu@busy-accuracy-98@vcs1:
>     - shard-mtlp:         [PASS][4] -> [FAIL][5]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15854/shard-mtlp-8/igt@perf_pmu@busy-accuracy-98@vcs1.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12325/shard-mtlp-5/igt@perf_pmu@busy-accuracy-98@vcs1.html
> 
>   * igt@perf_pmu@busy-accuracy-98@vecs1:
>     - shard-dg2:          [PASS][6] -> [FAIL][7] +1 other test fail
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15854/shard-dg2-7/igt@perf_pmu@busy-accuracy-98@vecs1.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12325/shard-dg2-10/igt@perf_pmu@busy-accuracy-98@vecs1.html

These are not related to my change.

> 
>   
> #### Warnings ####
> 
>   * igt@gem_tiled_swapping@non-threaded:
>     - shard-tglu:         [FAIL][8] ([i915#12941]) -> [FAIL][9]
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15854/shard-tglu-3/igt@gem_tiled_swapping@non-threaded.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12325/shard-tglu-6/igt@gem_tiled_swapping@non-threaded.html
> 
>   * igt@kms_async_flips@crc-atomic:
>     - shard-glk:          [INCOMPLETE][10] ([i915#13287]) -> [INCOMPLETE][11] +1 other test incomplete
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15854/shard-glk1/igt@kms_async_flips@crc-atomic.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12325/shard-glk6/igt@kms_async_flips@crc-atomic.html

These are not related to my change.

Please fix and re-run.

Thank you,

Peter

[...]
