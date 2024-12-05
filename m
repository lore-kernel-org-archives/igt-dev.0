Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B3B7E7716C
	for <igt-dev@archiver.kernel.org>; Thu,  5 Dec 2024 08:35:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BFD910E5CB;
	Thu,  5 Dec 2024 08:35:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z1Mc9Go/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 467F010E5CB;
 Thu,  5 Dec 2024 08:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733387754; x=1764923754;
 h=message-id:date:mime-version:subject:to:references:cc:
 from:in-reply-to:content-transfer-encoding;
 bh=Wv/o1ZD5fhHX52e47zDvEEBgyuEhJDyQKVHUJaUeqxc=;
 b=Z1Mc9Go/E9zGNFFom1t6A9cRAko8uqdGeAcqAXfkd+Df9iPA35Kw56II
 fC8HVeuq11LnZf2fM65KTRA2wW8kb8aWlNvVqAHJBL89+4XxoCR4x3ERl
 kmKvL7mDsHBtxVnh/GNunb8Sbz8Eyx3Q0WXRthYUwvKtLOFPXu94PWgpR
 Oht/DIM7YS2MtpW+TM6iLGysSED5a9Yg2nZrspdXJUHemu9H98+enY8dy
 B7Tq3fXe7GGQfgLM59AyXGmDE1f9/7xn/kWpY+Tkkt8dEU7hNQBEu8/OB
 pM+HuhJoWlZp8WMOqC3O/AC7dq0fvqXrBLOYxUHe8+nv5khTV5CxtfbrG g==;
X-CSE-ConnectionGUID: QVlAV7LXQlq9wOrTMr5Gjw==
X-CSE-MsgGUID: eCX7+km+R1ib0jwx8VC03A==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33817226"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; d="scan'208";a="33817226"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 00:35:45 -0800
X-CSE-ConnectionGUID: IbJibRtSQ0OM0lPZn6NBKw==
X-CSE-MsgGUID: AWByLVelQiWEYixNyWSf/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; d="scan'208";a="98096715"
Received: from jankamin-mobl2.ger.corp.intel.com (HELO [10.213.200.46])
 ([10.213.200.46])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 00:35:43 -0800
Message-ID: <5ba5bd3d-e425-4398-83cd-98be8f841f75@linux.intel.com>
Date: Thu, 5 Dec 2024 09:35:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_igt-runner_?=
 =?UTF-8?Q?fact_checking_=28rev10=29?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
 <173338573899.2890568.7911154781826354209@b555e5b46a47>
Content-Language: en-US
Cc: dominik.karol.piatkowski@intel.com
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <173338573899.2890568.7911154781826354209@b555e5b46a47>
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

On 05.12.2024 09:02, Patchwork wrote:
> == Series Details ==
> 
> Series: igt-runner fact checking (rev10)
> URL   : https://patchwork.freedesktop.org/series/140841/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8138_full -> XEIGTPW_12248_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12248_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12248_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_12248_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-dp2-hdmi-a3:
>     - shard-bmg:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8138/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-dp2-hdmi-a3.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12248/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-dp2-hdmi-a3.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-3-4-rc-ccs-to-x:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][3]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12248/shard-bmg-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-3-4-rc-ccs-to-x.html
> 
>   * igt@kms_psr@psr2-suspend:
>     - shard-lnl:          NOTRUN -> [ABORT][4] +14 other tests abort
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12248/shard-lnl-4/igt@kms_psr@psr2-suspend.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-3:
>     - shard-bmg:          [FAIL][5] ([Intel XE#2141]) -> [INCOMPLETE][6] +1 other test incomplete
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8138/shard-bmg-2/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-3.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12248/shard-bmg-4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-3.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling:
>     - shard-bmg:          [INCOMPLETE][7] ([Intel XE#1727] / [Intel XE#3468]) -> [INCOMPLETE][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8138/shard-bmg-5/igt@kms_flip_tiling@flip-change-tiling.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12248/shard-bmg-1/igt@kms_flip_tiling@flip-change-tiling.html
> 
>   * igt@xe_module_load@load:
>     - shard-dg2-set2:     ([FAIL][9], [FAIL][10], [FAIL][11], [FAIL][12], [FAIL][13], [FAIL][14], [FAIL][15], [FAIL][16], [FAIL][17], [FAIL][18], [FAIL][19], [FAIL][20], [FAIL][21], [FAIL][22], [FAIL][23], [FAIL][24], [FAIL][25], [FAIL][26], [FAIL][27], [FAIL][28], [FAIL][29], [FAIL][30], [FAIL][31], [FAIL][32], [FAIL][33]) ([Intel XE#3691]) -> ([FAIL][34], [FAIL][35], [FAIL][36], [FAIL][37], [FAIL][38], [FAIL][39], [FAIL][40], [FAIL][41], [FAIL][42], [FAIL][43], [FAIL][44], [FAIL][45], [FAIL][46], [FAIL][47], [FAIL][48], [FAIL][49], [FAIL][50], [FAIL][51], [FAIL][52], [FAIL][53], [FAIL][54], [FAIL][55], [FAIL][56], [FAIL][57], [FAIL][58])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8138/shard-dg2-434/igt@xe_module_load@load.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8138/shard-dg2-436/igt@xe_module_load@load.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8138/shard-dg2-434/igt@xe_module_load@load.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8138/shard-dg2-434/igt@xe_module_load@load.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8138/shard-dg2-436/igt@xe_module_load@load.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8138/shard-dg2-436/igt@xe_module_load@load.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8138/shard-dg2-436/igt@xe_module_load@load.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8138/shard-dg2-436/igt@xe_module_load@load.html
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8138/shard-dg2-436/igt@xe_module_load@load.html
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8138/shard-dg2-436/igt@xe_module_load@load.html
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8138/shard-dg2-434/igt@xe_module_load@load.html
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8138/shard-dg2-434/igt@xe_module_load@load.html
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8138/shard-dg2-434/igt@xe_module_load@load.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8138/shard-dg2-435/igt@xe_module_load@load.html
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8138/shard-dg2-435/igt@xe_module_load@load.html
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8138/shard-dg2-435/igt@xe_module_load@load.html
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8138/shard-dg2-435/igt@xe_module_load@load.html
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8138/shard-dg2-435/igt@xe_module_load@load.html
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8138/shard-dg2-435/igt@xe_module_load@load.html
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8138/shard-dg2-466/igt@xe_module_load@load.html
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8138/shard-dg2-466/igt@xe_module_load@load.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8138/shard-dg2-466/igt@xe_module_load@load.html
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8138/shard-dg2-466/igt@xe_module_load@load.html
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8138/shard-dg2-466/igt@xe_module_load@load.html
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8138/shard-dg2-466/igt@xe_module_load@load.html
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12248/shard-dg2-435/igt@xe_module_load@load.html
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12248/shard-dg2-466/igt@xe_module_load@load.html
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12248/shard-dg2-435/igt@xe_module_load@load.html
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12248/shard-dg2-435/igt@xe_module_load@load.html
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12248/shard-dg2-466/igt@xe_module_load@load.html
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12248/shard-dg2-466/igt@xe_module_load@load.html
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12248/shard-dg2-436/igt@xe_module_load@load.html
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12248/shard-dg2-436/igt@xe_module_load@load.html
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12248/shard-dg2-436/igt@xe_module_load@load.html
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12248/shard-dg2-436/igt@xe_module_load@load.html
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12248/shard-dg2-436/igt@xe_module_load@load.html
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12248/shard-dg2-436/igt@xe_module_load@load.html
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12248/shard-dg2-434/igt@xe_module_load@load.html
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12248/shard-dg2-434/igt@xe_module_load@load.html
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12248/shard-dg2-434/igt@xe_module_load@load.html
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12248/shard-dg2-434/igt@xe_module_load@load.html
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12248/shard-dg2-434/igt@xe_module_load@load.html
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12248/shard-dg2-434/igt@xe_module_load@load.html
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12248/shard-dg2-466/igt@xe_module_load@load.html
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12248/shard-dg2-435/igt@xe_module_load@load.html
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12248/shard-dg2-466/igt@xe_module_load@load.html
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12248/shard-dg2-435/igt@xe_module_load@load.html
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12248/shard-dg2-466/igt@xe_module_load@load.html
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12248/shard-dg2-466/igt@xe_module_load@load.html
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12248/shard-dg2-435/igt@xe_module_load@load.html

These are unrelated to my change. Please fix and re-run.

Thank you,

Peter
