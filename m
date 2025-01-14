Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20807E77188
	for <igt-dev@archiver.kernel.org>; Tue, 14 Jan 2025 08:16:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFABF10E360;
	Tue, 14 Jan 2025 08:16:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OaR18EwE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2696610E360;
 Tue, 14 Jan 2025 08:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736842574; x=1768378574;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=fugp3FlAR+ABEIgFs0ic7RrzfmZtULkjsZ82gL0quQc=;
 b=OaR18EwEdu8U1N+5IYf2wUGrsbddurOam8bG3GNzAOSEDE64/GM7GI10
 MrwAuWHWSURZKtQBkARs2EPK/ee6DDLFz/HK1MeAuUNOLRffDIFEVeOfX
 YdkHOx/Bsoa5HoUNVs9Z0m2tJrhiuCTUhcJFvQ4AN1Wg0DdH1dLuV1qOs
 PgJYTV0z2oM+ipZPm7y4czvlGj5ell1iFFovZ0A1wDP/uiiXzzUtPW7oG
 9NBewvYb8FbbT4cgla/zX/qJaphMuDFcTstKdNWji8UE+wEuWb9M8l332
 J6O6g3XeZ75uiDk/r9DjEI/jjL+25T2nkV3IDspFd5c7QU+3VjqhFr7WR Q==;
X-CSE-ConnectionGUID: 4U+HG5qNQJaitLZCVT4fAA==
X-CSE-MsgGUID: CVJstk6QQD6faZFBSxM0fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="37015163"
X-IronPort-AV: E=Sophos;i="6.12,313,1728975600"; d="scan'208";a="37015163"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 00:16:13 -0800
X-CSE-ConnectionGUID: JtP6CsznQuWJ2WwYP//y0w==
X-CSE-MsgGUID: 3o+GFu/QRm61uzSLng3qvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="104600794"
Received: from zhenyiz1-mobl.ccr.corp.intel.com (HELO [10.245.113.241])
 ([10.245.113.241])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 00:16:13 -0800
Message-ID: <480075f3-8914-47b4-afd7-4b73658996d4@linux.intel.com>
Date: Tue, 14 Jan 2025 09:16:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBpOTE1LkNJLkZ1bGw6IGZhaWx1cmUgZm9yIGxpYi9pZ3Rf?=
 =?UTF-8?Q?kmemleak=3A_library_to_interact_with_kmemleak_=28rev2=29?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250109181027.90402-1-peter.senna@linux.intel.com>
 <173677284723.3237056.1486075895877836651@b555e5b46a47>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <173677284723.3237056.1486075895877836651@b555e5b46a47>
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



On 13.01.2025 13:54, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/igt_kmemleak: library to interact with kmemleak (rev2)
> URL   : https://patchwork.freedesktop.org/series/142673/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_15934_full -> IGTPW_12421_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12421_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12421_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12421/index.html
> 
> Participating hosts (12 -> 11)
> ------------------------------
> 
>   Missing    (1): shard-glk-0 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12421_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_exec_suspend@basic-s3-devices@smem:
>     - shard-mtlp:         [PASS][1] -> [ABORT][2] +1 other test abort
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15934/shard-mtlp-5/igt@gem_exec_suspend@basic-s3-devices@smem.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12421/shard-mtlp-4/igt@gem_exec_suspend@basic-s3-devices@smem.html
> 
>   * igt@gem_exec_whisper@basic-contexts-priority:
>     - shard-mtlp:         [PASS][3] -> [INCOMPLETE][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15934/shard-mtlp-1/igt@gem_exec_whisper@basic-contexts-priority.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12421/shard-mtlp-6/igt@gem_exec_whisper@basic-contexts-priority.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][5]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12421/shard-glk1/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_exec_big@single:
>     - shard-tglu:         [ABORT][6] ([i915#11713]) -> [ABORT][7]
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15934/shard-tglu-10/igt@gem_exec_big@single.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12421/shard-tglu-10/igt@gem_exec_big@single.html

These possible regressions and warnings are unrelated to my change. Please fix and re-run.

Thank you!

[...]
