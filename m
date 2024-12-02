Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E675D4979C
	for <igt-dev@archiver.kernel.org>; Mon,  2 Dec 2024 05:07:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29B4A10E03C;
	Mon,  2 Dec 2024 05:07:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DPkvLwZY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3833710E03C;
 Mon,  2 Dec 2024 05:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733116040; x=1764652040;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=SA+tTIbULaqYcEugnZLADjDD7s5aogYZm3K2iZ6dbTg=;
 b=DPkvLwZYZkJ8XTNc5Fa+ixaQHAVRubMmvczLkjsLGfiBxBdxN/sq/GzQ
 p0fhkR9VhWtBcOxnC3vc2G6npLZWiWKQdxQUf7V0gnX1Zg9ey4TkWPkhK
 K7YVJMH7yz4sYg1oOAie+lCclHUFRqiAI0Tbb8y/pXL5RdaWzxqWav5E/
 mmh4ySr116Oa0zY7fC1qYMivk94N1E9GklqKIe7HXUM+qSLRZnf9atIik
 oETVYUh8U+tRDT81aRdl9+UsLwscG31C1S5ZyFLLMlj5NiUwfcFNWefEW
 Lx5xChcxuT2+fjF1pnlIcgfatg4JvNGkUnH3LfktFQbMd3l0aQpIo3xn7 A==;
X-CSE-ConnectionGUID: o9CXOK61SwW8QcpRCQhBDg==
X-CSE-MsgGUID: eWFAveAFTwy6YcF0SJ3Kgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="33189374"
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; d="scan'208";a="33189374"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2024 21:07:19 -0800
X-CSE-ConnectionGUID: X9ZJOHMtT22HSrQikQCq6w==
X-CSE-MsgGUID: rxb5iP6KTiC6n5GW8jx+Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; d="scan'208";a="97767564"
Received: from cjones-mobl.ger.corp.intel.com (HELO [10.213.199.113])
 ([10.213.199.113])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2024 21:07:18 -0800
Message-ID: <330c7c7c-553a-4c86-b44e-61651a67f3df@linux.intel.com>
Date: Mon, 2 Dec 2024 06:07:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_igt-runne?=
 =?UTF-8?Q?r_fact_checking_=28rev9=29?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
 <173290129168.355976.8281068319435410321@b555e5b46a47>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <173290129168.355976.8281068319435410321@b555e5b46a47>
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

On 29.11.2024 18:28, Patchwork wrote:
> == Series Details ==
> 
> Series: igt-runner fact checking (rev9)
> URL   : https://patchwork.freedesktop.org/series/140841/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_15761_full -> IGTPW_12219_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12219_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12219_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12219_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_exec_suspend@basic-s3:
>     - shard-dg2:          NOTRUN -> [INCOMPLETE][1] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-dg2-11/igt@gem_exec_suspend@basic-s3.html
> 
>   * igt@gem_tiled_swapping@non-threaded:
>     - shard-tglu:         [PASS][2] -> [FAIL][3]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-tglu-3/igt@gem_tiled_swapping@non-threaded.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-tglu-5/igt@gem_tiled_swapping@non-threaded.html
> 
>   * igt@kms_cursor_legacy@torture-move@pipe-a:
>     - shard-glk:          [PASS][4] -> [DMESG-WARN][5] +1 other test dmesg-warn
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-glk8/igt@kms_cursor_legacy@torture-move@pipe-a.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-glk8/igt@kms_cursor_legacy@torture-move@pipe-a.html
> 
>   * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][6] +1 other test incomplete
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-glk3/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
> 
>   * igt@kms_pm_rpm@pm-tiling:
>     - shard-rkl:          [PASS][7] -> [SKIP][8] +1 other test skip
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15761/shard-rkl-4/igt@kms_pm_rpm@pm-tiling.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12219/shard-rkl-4/igt@kms_pm_rpm@pm-tiling.html
> 

These are unrelated to my change. Please fix and run again.

[...]

Thank you,

Peter
