Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F4BACFA745
	for <igt-dev@archiver.kernel.org>; Fri,  4 Oct 2024 05:30:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A300B10E0DD;
	Fri,  4 Oct 2024 05:30:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ff7qLGbN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 717CA10E0DD;
 Fri,  4 Oct 2024 05:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728019845; x=1759555845;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=BDQFQBA6lu9F23RdUAlJ3ML1gE8d39/jLu2Hp+qeeJM=;
 b=Ff7qLGbNh1/DmMjLtsihF+iHkYYzxpP98M6CCbRl0m6NbzTF8xtGSEF2
 cYC6sZA42JdkTg6UQtyXnk1O03HbyOV5GKndyN3BLOCE+VGu5S0RwP1PT
 RU7bwaVb/3xOb5uWugUbOwdClwZScNur9xDqTYiPmlpF4NsE/mjzsWp5d
 b9FsMjybKvasvMkVVobBX/Zkyi1Jy/JQyyew+4h1EEzH1cEIvz0ShNP1h
 rvjxdIcaqCHvsAOmXxvNDERq/tRd2KjJM+Ijq4u9Ewo3L5kd0un4wo1Gc
 I6jeFomNzeXy+sJ/CyP/nocxDePIdbJ0ZoK6WJhONA08VHl1jShhNzVXi A==;
X-CSE-ConnectionGUID: gzaC5r5jTRqPOAGkq7gDJw==
X-CSE-MsgGUID: FozfJZfqTF6w958GyIs/3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27178838"
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; d="scan'208";a="27178838"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 22:30:45 -0700
X-CSE-ConnectionGUID: it8bbLyRTdq+hDO25kI0Ew==
X-CSE-MsgGUID: Kl/28NY7TnKfeCqwBr6ilg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; d="scan'208";a="74427989"
Received: from elisabal-mobl.ger.corp.intel.com (HELO [10.213.199.182])
 ([10.213.199.182])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 22:30:45 -0700
Message-ID: <3d020bc9-fe0f-4fa3-98ef-995cb5061ff5@linux.intel.com>
Date: Fri, 4 Oct 2024 07:30:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2ExeFULL=3A_failure_for_runner/executo?=
 =?UTF-8?Q?r=2Ec=3A_Detect_tests_killed_by_a_signal_=28rev6=29?=
To: I915-ci-infra@lists.freedesktop.org,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <f7319a46-d6d4-4ea5-9863-99ccd7cea3a5@linux.intel.com>
 <172797844004.1169872.3510633666920658161@2413ebb6fbb6>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <172797844004.1169872.3510633666920658161@2413ebb6fbb6>
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

On 03.10.2024 20:00, Patchwork wrote:
> == Series Details ==
> 
> Series: runner/executor.c: Detect tests killed by a signal (rev6)
> URL   : https://patchwork.freedesktop.org/series/137879/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8051_full -> XEIGTPW_11864_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11864_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11864_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_11864_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11864/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x170:
>     - shard-lnl:          NOTRUN -> [SKIP][2]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11864/shard-lnl-3/igt@kms_cursor_crc@cursor-random-512x170.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][3]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11864/shard-dg2-466/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-system:
>     - shard-lnl:          [PASS][4] -> [DMESG-WARN][5]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8051/shard-lnl-3/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-system.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11864/shard-lnl-8/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-system.html
> 
>   * igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute:
>     - shard-lnl:          [PASS][6] -> [FAIL][7] +2 other tests fail
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8051/shard-lnl-2/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11864/shard-lnl-5/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html
> 
>   * igt@xe_oa@oa-exponents:
>     - shard-lnl:          [PASS][8] -> [ABORT][9]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8051/shard-lnl-7/igt@xe_oa@oa-exponents.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11864/shard-lnl-3/igt@xe_oa@oa-exponents.html
> 
>   * igt@xe_oa@oa-exponents@ccs-0:
>     - shard-lnl:          NOTRUN -> [ABORT][10]
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11864/shard-lnl-3/igt@xe_oa@oa-exponents@ccs-0.html
> 

These are unrelated to my change. Thank you!
