Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F41CA101F
	for <igt-dev@archiver.kernel.org>; Wed, 10 Sep 2025 07:45:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5890610E86A;
	Wed, 10 Sep 2025 07:45:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V6y9axkE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC29D10E86A
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Sep 2025 07:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757490346; x=1789026346;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=k4qNsC3zgNupXznwu/7FUMH7deK5y/uZJZaw30eddFE=;
 b=V6y9axkEV66aGBDS4jdqvd1o1zCFklmKWEGV0W7mt+0ntNg//L35/gZs
 kKxPwlyznR/0COiL7pGBCHHQyCbOszK7Q0aRv2n1yM145fX5GMMXEuYsM
 UD8LYxBCr+CUvwyuG0EEIun3zZ8P76RHYCSznZtjZAw0t/D7nRGrNCHSm
 sPsRGc7Q4x/MnI2rP1uBvgQtntZ/moMBApNjmQ8P0HL20MBQ7pZQlAagd
 Nasuz6hThntDUZWu1B2FwLhqeimLBa9bNDWpdaXKzweqU+ij084Pvd1Fr
 pLyWVUDVdosf0H7pmxbB0px1ch71UmO2/E4IsC60ysn/+Qv0qIaDzp7Xa Q==;
X-CSE-ConnectionGUID: 8imn/btRT7a2yCPoDpuJiw==
X-CSE-MsgGUID: mEg2oiWXSYq8KEFvZNMAQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="59485459"
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; d="scan'208";a="59485459"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 00:45:46 -0700
X-CSE-ConnectionGUID: ZoREVgBCTHCTbjhK4FgMew==
X-CSE-MsgGUID: K1Z9IclVThC+5us7YC7s3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; d="scan'208";a="173768958"
Received: from unknown (HELO [172.28.180.91]) ([172.28.180.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 00:45:42 -0700
Message-ID: <1e64fd05-d8d5-4508-a704-64c37aa046fc@linux.intel.com>
Date: Wed, 10 Sep 2025 09:45:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBpOTE1LkNJLkZ1bGw6IGZhaWx1cmUgZm9yIERvbuKAmXQg?=
 =?UTF-8?Q?assume_sequential_GT_IDs?=
To: igt-dev@lists.freedesktop.org, lgci.bug.filing@intel.com
References: <20250908160723.1723178-1-marcin.bernatowicz@linux.intel.com>
 <175744162004.318924.17551724671218664680@1538d3639d33>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <175744162004.318924.17551724671218664680@1538d3639d33>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



On 9/9/2025 8:13 PM, Patchwork wrote:
> == Series Details ==
> 
> Series: Don’t assume sequential GT IDs
> URL   : https://patchwork.freedesktop.org/series/154199/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8526_full -> IGTPW_13705_full
> ====================================================
> 
> Summary
> -------
> 
>    **FAILURE**
> 
>    Serious unknown changes coming with IGTPW_13705_full absolutely need to be
>    verified manually.
>    
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_13705_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in CI.
> 
>    External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13705/index.html
> 
> Participating hosts (11 -> 11)
> ------------------------------
> 
>    No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>    Here are the unknown changes that may have been introduced in IGTPW_13705_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>    * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
>      - shard-tglu:         [PASS][1] -> [FAIL][2] +1 other test fail
>     [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8526/shard-tglu-2/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
>     [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13705/shard-tglu-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
> 

Not related to the change.
--
marcin

>    
> New tests
> ---------
> 
>    New tests have been introduced between IGT_8526_full and IGTPW_13705_full:
> 
> ### New IGT tests (9) ###
> 
>    * igt@kms_cursor_crc@cursor-sliding-256x256@pipe-a-hdmi-a-2:
>      - Statuses : 1 pass(s)
>      - Exec time: [4.38] s
> 
>    * igt@kms_cursor_crc@cursor-sliding-256x256@pipe-d-hdmi-a-2:
>      - Statuses : 1 pass(s)
>      - Exec time: [4.35] s
> 
>    * igt@kms_cursor_crc@cursor-sliding-64x64@pipe-d-hdmi-a-2:
>      - Statuses : 1 pass(s)
>      - Exec time: [4.40] s
> 
>    * igt@kms_plane_multiple@tiling-yf@pipe-a-hdmi-a-1:
>      - Statuses : 1 pass(s)
>      - Exec time: [1.92] s
> 
>    * igt@kms_plane_multiple@tiling-yf@pipe-a-hdmi-a-2:
>      - Statuses : 1 pass(s)
>      - Exec time: [1.87] s
> 
>    * igt@kms_plane_multiple@tiling-yf@pipe-b-hdmi-a-1:
>      - Statuses : 1 pass(s)
>      - Exec time: [1.76] s
> 
>    * igt@kms_plane_multiple@tiling-yf@pipe-b-hdmi-a-2:
>      - Statuses : 1 pass(s)
>      - Exec time: [1.77] s
> 
>    * igt@kms_plane_multiple@tiling-yf@pipe-c-hdmi-a-1:
>      - Statuses : 1 pass(s)
>      - Exec time: [1.75] s
> 
>    * igt@kms_plane_multiple@tiling-yf@pipe-c-hdmi-a-2:
>      - Statuses : 1 pass(s)
>      - Exec time: [1.79] s
> 
>    
> 
> Known issues
> ------------

[...]
