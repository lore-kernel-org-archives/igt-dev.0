Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E3DECD98E2
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jun 2026 09:48:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A5E510ED2F;
	Thu, 18 Jun 2026 09:48:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FXhkXSPf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D42D610F21E
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2026 09:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781776063; x=1813312063;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=YLrZ52RxFlonjgwDNCpcIvQiDKKcvwwGv2aXq17lTpM=;
 b=FXhkXSPfkaTJFgfncr2Ht5lwip3R3lO1+1q/DMQSOtZelh2GyGYVfoY/
 SJk4Sk9WFB2Xkl4yDZInxR1qBgN5uE5E/sZ1S7uMnQV6X1RCv0sTiwmGL
 umjNj1ahTgKNWDpuyyQs85dwaWXe9lfwO8vTIRoCkvm8SjmJTacb4zGK5
 LwJ9X/mseZY2NbbDeLkT1sn/t21Gfx1nNJ5FaKyZYlOJ9YfsccNvIoP81
 WFrKQewTLB+JkPgx0QM4iGbKkWjPkubx5vTcWswwohgSm/2ANFunmzQ16
 OVCcqagJWORwM3rQuXcrWhRBUjTaZBWVQz5oWyGuSVszzk0rGWH2eQo6Q Q==;
X-CSE-ConnectionGUID: XmZBiXDlSuq3PV1Fnu6R+w==
X-CSE-MsgGUID: Kez2sQ/mSQaWFpShhlN6jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="82699659"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="82699659"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 02:47:42 -0700
X-CSE-ConnectionGUID: Qbzl92KyRBucP1ABKUWtSQ==
X-CSE-MsgGUID: mZSME9zsStqzI9w+FHw5Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="252640808"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.80])
 ([172.28.182.80])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 02:47:42 -0700
Message-ID: <143c7c44-4843-42d0-9391-ede219ed65a8@linux.intel.com>
Date: Thu, 18 Jun 2026 11:47:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_Add_SR-IOV_?=
 =?UTF-8?Q?exit-handler-based_cleanup_=28rev2=29?=
To: igt-dev@lists.freedesktop.org, lgci.bug.filing@intel.com
References: <20260615103220.281656-1-marcin.bernatowicz@linux.intel.com>
 <178154908153.79279.5564650644079467526@6beec6c84f66>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <178154908153.79279.5564650644079467526@6beec6c84f66>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 6/15/2026 8:44 PM, Patchwork wrote:
> == Series Details ==
>
> Series: Add SR-IOV exit-handler-based cleanup (rev2)
> URL   : https://patchwork.freedesktop.org/series/167745/
> State : failure
>
> == Summary ==
>
> CI Bug Log - changes from XEIGT_8964_FULL -> XEIGTPW_15367_FULL
> ====================================================
>
> Summary
> -------
>
>    **FAILURE**
>
>    Serious unknown changes coming with XEIGTPW_15367_FULL absolutely need to be
>    verified manually.
>    
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_15367_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in CI.
>
>    
>
> Participating hosts (2 -> 2)
> ------------------------------
>
>    No changes in participating hosts
>
> Possible new issues
> -------------------
>
>    Here are the unknown changes that may have been introduced in XEIGTPW_15367_FULL:
>
> ### IGT changes ###
>
> #### Possible regressions ####
>
>    * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>      - shard-lnl:          [PASS][1] -> [SKIP][2] +1 other test skip
>     [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8964/shard-lnl-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
>     [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15367/shard-lnl-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
>
>    * igt@xe_exec_reset@long-spin-many-preempt-threads:
>      - shard-lnl:          [PASS][3] -> [FAIL][4]
>     [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8964/shard-lnl-7/igt@xe_exec_reset@long-spin-many-preempt-threads.html
>     [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15367/shard-lnl-4/igt@xe_exec_reset@long-spin-many-preempt-threads.html

Not related to the change.

---

marcin

>    
> Known issues
> ------------
[...]
