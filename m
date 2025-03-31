Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A453C3600C
	for <igt-dev@archiver.kernel.org>; Mon, 31 Mar 2025 08:44:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FC2210E0EB;
	Mon, 31 Mar 2025 08:44:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W+bTTJie";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B509510E084;
 Mon, 31 Mar 2025 08:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743410697; x=1774946697;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=wUuRn81ZSAKatyKI1G7w3Fd/tSQFkKbU70/OdBJu9jM=;
 b=W+bTTJieJAIxjF9V72iUQZZDnlvvF5KVNrrsw8nKtsMZOLKsCnH5tGnW
 xTqcPabTod24gpkKhWKNejO7lC47yKGD1UzqjYvJMfqStOTkC4XzXRU78
 WhMf+ODz+qsMjadC0iwq7QOP3lADOqGQcx8Lqng/jgwIim9IGO9THdeb+
 vRefqQ3GPk8s5IudvzdVLaY700aXPRX6aCGJ1IjqhVDK/remSsKf9SEBS
 HVTkIKUZkSnPlhUyLu19czZJgX+CzMSARlOUgVDmAiv9c9TF/vFnNvAbY
 8LG7j9vy50Xx7aILgoyLZLLgd8pvD9zKbcRhXosGYkfOvd/XiZC2OK5Ua g==;
X-CSE-ConnectionGUID: usy4xvP+RX2PS4WMoXUN3A==
X-CSE-MsgGUID: M+575eshREeA0Na7O06Fow==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="44849049"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="44849049"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 01:44:57 -0700
X-CSE-ConnectionGUID: yIQapAIcSV2NkkJLweEjQQ==
X-CSE-MsgGUID: bDUvwVVzQmCCIdyveHHwkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="130149973"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO [10.245.118.0])
 ([10.245.118.0])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 01:44:56 -0700
Message-ID: <42222756-d960-45ac-8378-e2129e09c668@linux.intel.com>
Date: Mon, 31 Mar 2025 10:44:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_man/lsgpu?=
 =?UTF-8?Q?=3A_Add_man_page_for_lsgpu_=28rev2=29?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250329143607.33723-1-peter.senna@linux.intel.com>
 <174326815482.18044.1216601178469823757@e6b6f09ec485>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <174326815482.18044.1216601178469823757@e6b6f09ec485>
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

On 3/29/2025 6:09 PM, Patchwork wrote:
> == Series Details ==
> 
> Series: man/lsgpu: Add man page for lsgpu (rev2)
> URL   : https://patchwork.freedesktop.org/series/146860/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_16343_full -> IGTPW_12885_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12885_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12885_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12885/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12885_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_pm_rpm@system-suspend-execbuf:
>     - shard-rkl:          NOTRUN -> [INCOMPLETE][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12885/shard-rkl-3/igt@i915_pm_rpm@system-suspend-execbuf.html
> 
>   * igt@perf_pmu@interrupts:
>     - shard-rkl:          NOTRUN -> [FAIL][2]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12885/shard-rkl-7/igt@perf_pmu@interrupts.html
> 
>   

These are unrelated to my change. Please fix and re-run.

Thank you,

Peter
