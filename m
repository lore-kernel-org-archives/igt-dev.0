Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 729BEE7717F
	for <igt-dev@archiver.kernel.org>; Tue, 17 Dec 2024 05:14:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E450210E15D;
	Tue, 17 Dec 2024 05:14:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M9VcDEQE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2792410E15D;
 Tue, 17 Dec 2024 05:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734412470; x=1765948470;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=KbOQTuejE/qP1tqrR7vDgxn4Xqbd8MEMsDvgUvgLUa8=;
 b=M9VcDEQE5nHzEfpDmJWdu80NK2ZrmN5DYOnBrbXUOMCVyKCP7TX9uJKv
 gpRcCM52yrF86plR3alOCZn0ohGU6Edw2CPTAwuXcCf3CEhEcP5Fyv9yM
 gQ9MeK3aRBhiuIo8jfdcvHUlW2C+6B+X9qqgh5+vRdo9f63X8TJIlwmb/
 rQEG2hDJ5AH1hVuUh9YG8RBqChB3MDNqQFVlBO5NW3x+lBIlnYIOL9Of1
 nr5HORkwuS1C01vnKlHqCgAB7P9lXEuX4jBzcX/oK1DS5qELQVDnePypA
 QORBEEk3ga4W4KHulbVV7p0+QsO0TsecyLGe9Rp6mCAM9ZpNvBDY9kInP w==;
X-CSE-ConnectionGUID: WVDOfNGyQ3ePcS4mqTt/lw==
X-CSE-MsgGUID: 6vJc88NvQPeIXTHZbyDkJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38748496"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="38748496"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 21:14:29 -0800
X-CSE-ConnectionGUID: XpwWLhEPQEa7XJ0V0lL/tw==
X-CSE-MsgGUID: TDacPtHRQjyX7eZpAXD4qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,240,1728975600"; d="scan'208";a="97199836"
Received: from scoltan-mobl.ger.corp.intel.com (HELO [10.213.202.25])
 ([10.213.202.25])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 21:14:29 -0800
Message-ID: <b94c44a9-fb30-494c-bb94-f9dd4dd51cdf@linux.intel.com>
Date: Tue, 17 Dec 2024 06:14:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBpZ3RfZmFjdHMg?=
 =?UTF-8?Q?for_fact_tracking_=28rev2=29?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20241216151420.43042-1-peter.senna@linux.intel.com>
 <173440905071.3597928.14164347048680210557@b555e5b46a47>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <173440905071.3597928.14164347048680210557@b555e5b46a47>
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

On 17.12.2024 05:17, Patchwork wrote:
> == Series Details ==
> 
> Series: igt_facts for fact tracking (rev2)
> URL   : https://patchwork.freedesktop.org/series/142628/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8157_full -> XEIGTPW_12325_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12325_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12325_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_12325_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][1] +3 other tests incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12325/shard-dg2-463/igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3:
>     - shard-bmg:          NOTRUN -> [FAIL][2]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12325/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-hdmi-a6-dp4:
>     - shard-dg2-set2:     [PASS][3] -> [FAIL][4] +2 other tests fail
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-dg2-463/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-hdmi-a6-dp4.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12325/shard-dg2-464/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-hdmi-a6-dp4.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][5]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12325/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@d-dp2:
>     - shard-bmg:          [PASS][6] -> [FAIL][7] +1 other test fail
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-bmg-4/igt@kms_flip@flip-vs-suspend-interruptible@d-dp2.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12325/shard-bmg-4/igt@kms_flip@flip-vs-suspend-interruptible@d-dp2.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4:
>     - shard-dg2-set2:     [PASS][8] -> [INCOMPLETE][9] +1 other test incomplete
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12325/shard-dg2-436/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html
> 
>   * igt@kms_vblank@ts-continuation-suspend:
>     - shard-bmg:          [PASS][10] -> [INCOMPLETE][11] +9 other tests incomplete
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-bmg-8/igt@kms_vblank@ts-continuation-suspend.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12325/shard-bmg-7/igt@kms_vblank@ts-continuation-suspend.html
> 
>   * igt@xe_wedged@basic-wedged:
>     - shard-bmg:          [PASS][12] -> [ABORT][13]
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-bmg-2/igt@xe_wedged@basic-wedged.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12325/shard-bmg-5/igt@xe_wedged@basic-wedged.html
> 
>   
> #### Warnings ####
> 
>   * igt@xe_live_ktest@xe_bo:
>     - shard-dg2-set2:     [TIMEOUT][14] ([Intel XE#2961] / [Intel XE#2998]) -> [INCOMPLETE][15] +1 other test incomplete
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-dg2-436/igt@xe_live_ktest@xe_bo.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12325/shard-dg2-464/igt@xe_live_ktest@xe_bo.html
> 

Possible regressions and warnings are not related to my change. Please fix and re-run.

[...]

Thank you!
