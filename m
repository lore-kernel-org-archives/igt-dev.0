Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA50E7719E
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jan 2025 08:00:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46D5510E411;
	Mon, 13 Jan 2025 08:00:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ETzFjZRd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B7B210E40E;
 Mon, 13 Jan 2025 08:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736755230; x=1768291230;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=sq3HPDRFjLam3rqiUsv6CbSawTuEdmo42pBtsjG5Ypo=;
 b=ETzFjZRdHofmAja7jtWuIykDzJ5DXGtWznwD32naAoa5eXpJs/BtOfBw
 vANQJnl+Bh/GX7yshNnepPvgbjJHPfkxh75dV2+hP6KEwgQxNgns69hC5
 CISLOzfTCygJhojNqG6vMYziiTMZDjSgokq//dszbsLfKD0dmhoFE/bjn
 j/gSbs176+Clddf0JQ9rhVtSTJsw9RfVVIs5Xj6zk7y0ANmmNCnMIU9/l
 ely7ePahntjFzVkQ3TTFhmZCoVbs3gQjttwGI8NZ2B2iRJ8KQxZy9KA0s
 ds4uBMM6ESdi7Rh09eP1vdBKl0vNihQ9POSFpF9ZX7crh7uuLoTcBjf1s Q==;
X-CSE-ConnectionGUID: lHXyLzduRCWD9oEPUiNZuw==
X-CSE-MsgGUID: sfcnjgdUQXK9jkgOWW6OWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="39815962"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="39815962"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 00:00:30 -0800
X-CSE-ConnectionGUID: ACPJXni5QUiaZwQ54H678A==
X-CSE-MsgGUID: tSBolibYRha3w/Tetxuo9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="104351466"
Received: from nwochtma-mobl.ger.corp.intel.com (HELO [10.245.83.54])
 ([10.245.83.54])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 00:00:28 -0800
Message-ID: <70130f72-1bb6-492b-8760-e5a523109e4f@linux.intel.com>
Date: Mon, 13 Jan 2025 09:00:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBsaWIvaWd0X2tt?=
 =?UTF-8?Q?emleak=3A_library_to_interact_with_kmemleak_=28rev2=29?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250109181027.90402-1-peter.senna@linux.intel.com>
 <173667139526.2829460.13324038630832694591@b555e5b46a47>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <173667139526.2829460.13324038630832694591@b555e5b46a47>
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


On 12.01.2025 09:43, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/igt_kmemleak: library to interact with kmemleak (rev2)
> URL   : https://patchwork.freedesktop.org/series/142673/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8184_full -> XEIGTPW_12421_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12421_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12421_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_12421_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_pm_residency@cpg-basic:
>     - shard-dg2-set2:     [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8184/shard-dg2-433/igt@xe_pm_residency@cpg-basic.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12421/shard-dg2-432/igt@xe_pm_residency@cpg-basic.html
> 
>   
> #### Warnings ####
> 
>   * igt@xe_evict@evict-mixed-threads-large:
>     - shard-bmg:          [INCOMPLETE][3] ([Intel XE#1473]) -> [DMESG-FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8184/shard-bmg-2/igt@xe_evict@evict-mixed-threads-large.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12421/shard-bmg-1/igt@xe_evict@evict-mixed-threads-large.html
> 
>   * igt@xe_mmap@pci-membarrier-bad-object:
>     - shard-bmg:          [SKIP][5] ([Intel XE#1130]) -> [SKIP][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8184/shard-bmg-4/igt@xe_mmap@pci-membarrier-bad-object.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12421/shard-bmg-8/igt@xe_mmap@pci-membarrier-bad-object.html

These warnings and regression are unrelated. Please fix and re-run.

Thank you!

[...]
