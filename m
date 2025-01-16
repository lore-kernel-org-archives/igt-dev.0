Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA400C02180
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jan 2025 09:14:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DC2D10E908;
	Thu, 16 Jan 2025 09:14:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AAIDKhLp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0405210E90A;
 Thu, 16 Jan 2025 09:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737018853; x=1768554853;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RNP122IOeWm7+c6NPdvz1QlyaDwMkoQ5zA4IUIsNfPU=;
 b=AAIDKhLp3Ui0glBmbrtAM3MkrXkkvIkEpOn6Ejv95kPV4uSUVUjtfo23
 SeoJC6KlqidcdIxBds/jXLFO4p5ocMwWjGDMK+4otKpHG6KHQ+uWl25B7
 SCCqVW6IZD/cHw9YyzHt8hPzqAQnMJPmXHuH3PGqmDWA9bN3gpLbFOtKk
 hGcu7KvAUkHCW25PzCLuTEn4mzfKs/HNUdXG/UrZDW11xHRaJ+BzBC1Jg
 1dP4uohmlZW+AkST4YguMEuyCvDUMF+PjJ5z2fxxMPIBlInlvZ9jBlJx7
 gsu5zXlXnwko05icauht2P+a5E+Ckpg4e7wJtKsoAXpwkgXd/sEG/iVGp g==;
X-CSE-ConnectionGUID: YAdl2AiSRMapxm7YkNLCyg==
X-CSE-MsgGUID: nA99P9AETL+nbsiOtqInkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="48051326"
X-IronPort-AV: E=Sophos;i="6.13,208,1732608000"; d="scan'208";a="48051326"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 01:14:05 -0800
X-CSE-ConnectionGUID: 51Kr1j2/TwC05qb73hSgVg==
X-CSE-MsgGUID: OXq8Ybw7Qt+2nZPeP0ednA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="128680485"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 01:14:04 -0800
Date: Thu, 16 Jan 2025 10:13:49 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests=2Fint?=
 =?utf-8?Q?el=2Fxe=5Fpm=5Fresidency?= =?utf-8?Q?=3A?= Skip on igt_power_open
 failure (rev6)
Message-ID: <20250116091349.6ounyoplgxsfgtno@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20250110212237.4052-1-jonathan.cavitt@intel.com>
 <173701756780.202820.14978393074699290892@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173701756780.202820.14978393074699290892@b555e5b46a47>
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
On 2025-01-16 at 08:52:47 -0000, Patchwork wrote:

below failures are unrelated,

Regards,
Kamil

> == Series Details ==
> 
> Series: tests/intel/xe_pm_residency: Skip on igt_power_open failure (rev6)
> URL   : https://patchwork.freedesktop.org/series/139352/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8193_full -> XEIGTPW_12443_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12443_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12443_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_12443_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3:
>     - shard-bmg:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12443/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:
>     - shard-dg2-set2:     [PASS][3] -> [INCOMPLETE][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12443/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html
> 
>   * igt@kms_sequence@get-busy:
>     - shard-bmg:          [PASS][5] -> [INCOMPLETE][6] +1 other test incomplete
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-4/igt@kms_sequence@get-busy.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12443/shard-bmg-4/igt@kms_sequence@get-busy.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_flip@flip-vs-expired-vblank:
>     - shard-bmg:          [FAIL][7] ([Intel XE#2882]) -> [FAIL][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12443/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_12443_full that come from known issues:
> 
...cut...

>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8193 -> IGTPW_12443
> 
>   IGTPW_12443: 04c5fd7cf2157d2ace31eae2ea3ee2420bddd284 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8193: 84511e278c1c6e598ccc21287a733cfc83d13e8a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2495-4cea1f90028925afcf1a0f8a0ef301f90349688c: 4cea1f90028925afcf1a0f8a0ef301f90349688c
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12443/index.html
