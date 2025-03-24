Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 760E7C3600D
	for <igt-dev@archiver.kernel.org>; Mon, 24 Mar 2025 10:42:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C39D10E041;
	Mon, 24 Mar 2025 10:42:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MnNpZFYj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F68A10E041;
 Mon, 24 Mar 2025 10:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742812948; x=1774348948;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=uOSf60grp/AuScslkfVZr4ITk7xcmBzlJTcPkoi7ktw=;
 b=MnNpZFYjYfic2O5V2nK3J7F7AuaEnfnQfVBNOantUU/uM0DUMRlrfYve
 8DRckJS09mfJmIR7Zd47WHJcKafgxp/dy/oGMbCi7kzYZckYSg7wCO5fa
 NPK6xge0IwjgS2zBm8k967liCL3zgzfQDgqoNCQXGsN796ItZe+YkP7Lb
 h/5/Q2VtRfSBBXWEds/LSVHNq75vQPLL0+yKrECrtLsdIFu3sMA3uG5B7
 2EjRjMb232sUwkQOnOTpNtMtI+Vitj3w8SOKfEKJgvzqU3frp9TdbtnGt
 H3Q4Tc1KaK+oS2QX+0kJbpkG2dWCzQT/ACVEiQYQYBpDB9riX5pguzBm3 g==;
X-CSE-ConnectionGUID: WItHVQfMQc+/kS2dq81BFQ==
X-CSE-MsgGUID: +oNnzGcCTwW8aQUhAohUJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11382"; a="61406520"
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; d="scan'208";a="61406520"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 03:42:27 -0700
X-CSE-ConnectionGUID: jZmfe3FCQKmX7CuP5y/HOQ==
X-CSE-MsgGUID: HZZdzvwfSP6tkAqy6Xl/ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; d="scan'208";a="128175877"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.228])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 03:42:25 -0700
Date: Mon, 24 Mar 2025 11:42:22 +0100
From: Pawel Sikora <pawel.sikora@linux.intel.com>
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVy?= =?utf-8?Q?e?= for
 lib/igt_core: capture logs for child processes (rev2)
Message-ID: <20250324104222.7acaisv2gbkf2ikl@pawelsik-desk>
References: <20250313125004.3881354-1-pawel.sikora@linux.intel.com>
 <174203989476.39656.13577505206600951745@18a75f3d1eae>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174203989476.39656.13577505206600951745@18a75f3d1eae>
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

Hi I915,

On Sat, Mar 15, 2025 at 11:58:14AM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/igt_core: capture logs for child processes (rev2)
> URL   : https://patchwork.freedesktop.org/series/146262/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8275_full -> IGTPW_12779_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12779_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12779_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12779/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12779_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1:
>     - shard-snb:          [PASS][1] -> [FAIL][2] +1 other test fail
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8275/shard-snb2/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12779/shard-snb4/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html
> 
>   * igt@kms_flip@wf_vblank-ts-check@a-hdmi-a4:
>     - shard-dg1:          [PASS][3] -> [FAIL][4] +1 other test fail
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8275/shard-dg1-15/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a4.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12779/shard-dg1-14/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a4.html
> 
>   * igt@perf_pmu@module-unload:
>     - shard-dg1:          [PASS][5] -> [ABORT][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8275/shard-dg1-16/igt@perf_pmu@module-unload.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12779/shard-dg1-19/igt@perf_pmu@module-unload.html
> 

Unrelated to my change.

Regards,
Pawel
