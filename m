Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB5A7E7716A
	for <igt-dev@archiver.kernel.org>; Tue, 17 Dec 2024 05:12:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2357F10E161;
	Tue, 17 Dec 2024 05:12:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QqzqPQ0D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D188F10E15D;
 Tue, 17 Dec 2024 05:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734412372; x=1765948372;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=JNU01l/Nn3V88jDOEG27lshoCzFYYoSHZ3+jujK61Mg=;
 b=QqzqPQ0DAIFK428TL8+eTJjp9lecLnHTjJZ32AzaXEYdEfR0wj46e0Ue
 P3/L88NuhRME5O2CmfMt9PzKQHtLEoIEIIOsGvueWGIVMzhlp80UGYEEg
 eb3GrFgNFaa7p7qxNxXje5DRhkUAWAT26HCiVrAk0h6wH3Awg0Rt8JpQP
 CZfshRk38C3oWgL7jRe4FpG51s5lkHEUzklZQx5LBIPZ0NKg5DHXGoHmL
 nKMMDcqzKlkGMteOanhKu0oW2Mr0iT6XTq4uofyWacfLJeIdW88OTLDIJ
 XPd6POStcmPjFZ3n2H7UYzE7Z6i/fkGBbUW1u4WQsSbezmt5V6XdyU1Dw Q==;
X-CSE-ConnectionGUID: zTO1bWFqQ4i+KMNTs0PtnA==
X-CSE-MsgGUID: sLRaFsRUQSylbMYdp3GjWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="57301643"
X-IronPort-AV: E=Sophos;i="6.12,240,1728975600"; d="scan'208";a="57301643"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 21:12:52 -0800
X-CSE-ConnectionGUID: Dur+Qa5LTqiCcks1KfaoSQ==
X-CSE-MsgGUID: 3F4IWwVYT4uDyvh3OU7P7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102025796"
Received: from scoltan-mobl.ger.corp.intel.com (HELO [10.213.202.25])
 ([10.213.202.25])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 21:12:50 -0800
Message-ID: <d48d2b4a-c16d-4cbe-b5ec-7d8cc03e167d@linux.intel.com>
Date: Tue, 17 Dec 2024 06:12:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBpOTE1LkNJLkJBVDogZmFpbHVyZSBmb3IgaWd0X2ZhY3Rz?=
 =?UTF-8?Q?_for_fact_tracking_=28rev2=29?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20241216151420.43042-1-peter.senna@linux.intel.com>
 <173438521433.3440302.591192445303267909@b555e5b46a47>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <173438521433.3440302.591192445303267909@b555e5b46a47>
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

On 16.12.2024 22:40, Patchwork wrote:
> == Series Details ==
> 
> Series: igt_facts for fact tracking (rev2)
> URL   : https://patchwork.freedesktop.org/series/142628/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8157 -> IGTPW_12325
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12325 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12325, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12325/index.html
> 
> Participating hosts (45 -> 44)
> ------------------------------
> 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12325:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_pm_rpm@module-reload:
>     - bat-arlh-3:         [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8157/bat-arlh-3/igt@i915_pm_rpm@module-reload.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12325/bat-arlh-3/igt@i915_pm_rpm@module-reload.html

Not related to change. Please fix and re-run.

Thank you!

[...]
