Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F385BC5AD49
	for <igt-dev@archiver.kernel.org>; Fri, 30 May 2025 14:30:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F33CA10E128;
	Fri, 30 May 2025 14:30:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PcZEBWPu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B4DE10E128
 for <igt-dev@lists.freedesktop.org>; Fri, 30 May 2025 14:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748615418; x=1780151418;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=JigFEbRkhbPnWfiCBsNIriVxv3AcSymCY1Arme9mDqQ=;
 b=PcZEBWPuJk20+qoKgPoGvtw9MZHjTlp7Nz2bQf0N7+BdWWnX/l6rLNpW
 lFUegOLlO3OIaKbCbnAYPQ3WKXpO3z9knJ/3sgnaZcfB8aZQDSAC+NMJy
 V96xC+/EWXqc6vjy/FCrqXuT7HhBQv/AgtV+xtzFCgfDVU5u6b76ES4oM
 h13OV4mTgXDkfkkGmWRsEwTqpvAUdGth8DBMsNfJ9l/bnwev0UVedagEp
 2Br5mVKns4Mu/q+I8Wk/poPAF855Y4ZUH+pMdyPqtkvX4bRWHUu8CuB2a
 Yp8ACrPiGJKqxVJYkc8TQXFoFuh74NofFl/+Z63wg5G5QbRGwKpKYxUbO w==;
X-CSE-ConnectionGUID: OjxkMhiSSSOQwhKM+oydjw==
X-CSE-MsgGUID: Ixh6kLGkTBq9MfyRZspuzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="62111040"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="62111040"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 07:30:07 -0700
X-CSE-ConnectionGUID: fac84iUlTAyFw15ZPa6PXg==
X-CSE-MsgGUID: mTCnZUwnSW67zBROHsSGhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="144361271"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa010.fm.intel.com with ESMTP; 30 May 2025 07:30:06 -0700
Received: from [10.245.84.121] (unknown [10.245.84.121])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id B44CD340D0
 for <igt-dev@lists.freedesktop.org>; Fri, 30 May 2025 15:30:05 +0100 (IST)
Message-ID: <870db824-04d1-4246-bcab-dfe2bbd023ee@intel.com>
Date: Fri, 30 May 2025 16:30:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBpOTE1LkNJLkZ1bGw6IGZhaWx1cmUgZm9yIFVwZGF0ZSAi?=
 =?UTF-8?Q?force=5Freset=22_code_=28rev3=29?=
To: igt-dev@lists.freedesktop.org
References: <20250528212618.373-1-michal.wajdeczko@intel.com>
 <174855411222.33088.7864017408099328550@1538d3639d33>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <174855411222.33088.7864017408099328550@1538d3639d33>
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



On 29.05.2025 23:28, Patchwork wrote:
> == Series Details ==
> 
> Series: Update "force_reset" code (rev3)
> URL   : https://patchwork.freedesktop.org/series/149607/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8384_full -> IGTPW_13211_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_13211_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_13211_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13211/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_13211_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####

must be unrelated since the change was in the xe specific lib/xe_gt

> 
>   * igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a:
>     - shard-snb:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8384/shard-snb5/igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13211/shard-snb2/igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a.html
> 
>   * igt@perf_pmu@interrupts:
>     - shard-rkl:          [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8384/shard-rkl-8/igt@perf_pmu@interrupts.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13211/shard-rkl-5/igt@perf_pmu@interrupts.html
> 
>   * igt@perf_pmu@rc6-suspend:
>     - shard-rkl:          [PASS][5] -> [SKIP][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8384/shard-rkl-8/igt@perf_pmu@rc6-suspend.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13211/shard-rkl-4/igt@perf_pmu@rc6-suspend.html
