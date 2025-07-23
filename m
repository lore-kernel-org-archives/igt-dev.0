Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 156B8C83F17
	for <igt-dev@archiver.kernel.org>; Wed, 23 Jul 2025 15:14:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA70010E0FA;
	Wed, 23 Jul 2025 15:14:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kybrNCcN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E992210E0FA;
 Wed, 23 Jul 2025 15:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753283649; x=1784819649;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UlGl/K4PnYG8qFyXxbaLuZxoe2UqVKhv81vLnYChoAs=;
 b=kybrNCcNV0T7BUrQz6ghrDg68e3c1LXfZi1wusM2xuDZY7Qk51go2bZQ
 U8nUsgnrs2rejKw0uJH6hgMG0rDR6XhSag26Zz+i0n1JrQEB9MX/ki6QT
 3JXuoORWxzxGeITB+RtBw+wO0dKy6qVLVM8JDchmij22baRhYyAyE00UU
 8/DDhuD9nEkH3cg5SP5nczBlyAlD0xIs1J/pFqalOEIqRa59pkRfWsFiE
 MYttn4yGVuNKq6BD9oogHwqcYA7ZV3XxUJlorLYPocYBuXdTBdpkva/CS
 Q1PBwUSEThlA60OaVvkjD2sm2RaqTXlqq6wdxbCSIJSdI8Iqez9907NmH Q==;
X-CSE-ConnectionGUID: NRkDSimlRGuupbDiZS9Ntw==
X-CSE-MsgGUID: +ydcb8a3T3+eUpa0My8WMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="59374242"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="59374242"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 08:14:06 -0700
X-CSE-ConnectionGUID: Bmvj7C47TemomtTvZRyssw==
X-CSE-MsgGUID: e2IySJzmTiSIE6FwEnWm9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="164030509"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 08:14:04 -0700
Date: Wed, 23 Jul 2025 17:13:48 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cg==?= =?utf-8?Q?e?= for
 tests/intel/i915_test_config: Add all core tests
Message-ID: <20250723151348.lqeqg4egqjhfy3do@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250723083150.29838-1-kamil.konieczny@linux.intel.com>
 <175328081077.183837.11478930543685921338@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <175328081077.183837.11478930543685921338@1538d3639d33>
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
On 2025-07-23 at 14:26:50 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/i915_test_config: Add all core tests
> URL   : https://patchwork.freedesktop.org/series/151985/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8474_FULL -> XEIGTPW_13512_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_13512_FULL absolutely need to be
>   verified manually.

Unrelated to change.

Regards,
Kamil

>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_13512_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 3)
> ------------------------------
> 
>   Missing    (1): shard-adlp 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_13512_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>     - shard-lnl:          NOTRUN -> [SKIP][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13512/shard-lnl-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-userptr-rebind:
>     - shard-bmg:          NOTRUN -> [FAIL][2]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13512/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_13512_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@intel_hwmon@hwmon-write:
>     - shard-bmg:          [PASS][3] -> [FAIL][4] ([Intel XE#4665])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8474/shard-bmg-4/igt@intel_hwmon@hwmon-write.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13512/shard-bmg-7/igt@intel_hwmon@hwmon-write.html

...cut...

