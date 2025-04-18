Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0555C369AB
	for <igt-dev@archiver.kernel.org>; Fri, 18 Apr 2025 09:22:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA13410E44C;
	Fri, 18 Apr 2025 09:22:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kObBhXDB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC4BF10E0D4;
 Fri, 18 Apr 2025 09:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744968122; x=1776504122;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=FaYxyGnUQtfDbBLMHWSVX7IUtxJOmEAu4KVFNTCOhCA=;
 b=kObBhXDBvZhvjRu1AkdS2mk3KFBkUNnGvrN8ZrEXLKESJ2LgJI7yyOxS
 FtTiBdx3QJaLRkZL5xJyLt6/SU1n3e3mu03gjs0hfTywlAmDYpt2h2dLv
 iC/+pQ5OPpDZA1AM7qY5+bDVwcdG/H3uGcvRDnNhQ2M5MUuFiBUS4ak9d
 pEqFEkUp8kmC/SKW1kRDdcujBe1hcU2c9sSVagolIC4t3NmnOh8bW+fuU
 WJkaGj1dtqzTMvXTuuUAKVbmCcDx0fN8/dxrtyyh+aBlc8fNw4YMTPU7c
 i0c3yCxQPvThd0h3JkQaO7XKUFJfEnJ9rFrgpQkx+U1KG98SYs5941Z9M w==;
X-CSE-ConnectionGUID: SoWOASl0QQSedH5RUyWSSw==
X-CSE-MsgGUID: ZnOg6X3wTs+LrVPjWv2pow==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="50261118"
X-IronPort-AV: E=Sophos;i="6.15,221,1739865600"; d="scan'208";a="50261118"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2025 02:22:01 -0700
X-CSE-ConnectionGUID: tiUUkCzoQViyGgxhmDc4BQ==
X-CSE-MsgGUID: mgIsXlcKTmWGQJjJ5jmN+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,221,1739865600"; d="scan'208";a="162030042"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO [10.245.118.0])
 ([10.245.118.0])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2025 02:22:01 -0700
Message-ID: <e1f151be-b065-4a46-8631-a6b5ba113ec1@linux.intel.com>
Date: Fri, 18 Apr 2025 11:21:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_lib/xe/xe?=
 =?UTF-8?Q?=5Flegacy=3A_Move_test=5Flegacy=5Fmode_to_lib/?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250417193032.329-1-peter.senna@linux.intel.com>
 <174492616955.16326.17505699909884413079@b68e5b3b99e1>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <174492616955.16326.17505699909884413079@b68e5b3b99e1>
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

On 4/17/2025 11:42 PM, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/xe/xe_legacy: Move test_legacy_mode to lib/
> URL   : https://patchwork.freedesktop.org/series/147939/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8326 -> IGTPW_13004
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_13004 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_13004, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13004/index.html
> 
> Participating hosts (45 -> 44)
> ------------------------------
> 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_13004:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@workarounds:
>     - bat-rplp-1:         [PASS][1] -> [ABORT][2] +1 other test abort
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8326/bat-rplp-1/igt@i915_selftest@live@workarounds.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13004/bat-rplp-1/igt@i915_selftest@live@workarounds.html
> 

Unrelated to my change. Please fix and re-run.

Thank you,

Peter
