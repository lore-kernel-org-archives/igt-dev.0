Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60DEDC282D1
	for <igt-dev@archiver.kernel.org>; Thu,  6 Mar 2025 12:46:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6F6D10E960;
	Thu,  6 Mar 2025 12:46:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eq/Y8L0T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8DD710E195;
 Thu,  6 Mar 2025 12:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741265208; x=1772801208;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HxuMgljKh2kcNk1QyqYLFGfbbV1FS95zahqhI+dkb5Q=;
 b=eq/Y8L0T3M0j9Ux/6oJu4DVDaZH6o5GFXfrIbR0w+lyENjnRXxqnhTdu
 xeUK5R7oBu/R7pkstZbxxLDgB+wsHCWl7vlO7swTEt5BUH65tpTiaAdgx
 61VkFDEVYKhIOl8uzSRFgTsGq20+p+JyUG+3JDHVIfYJQh0DIoXhHrXlq
 Z40Ju9SHOo1AzLuv366nmC2HM4CXR9NuKrGmxPCUS2dgaV+6Z2Db7cVWL
 fxQtaquV4nh2bJczpxhv2fvbXrrNovyPit4Gwrgt3pM33To3gMiY8ZFRU
 qI/r6JR9dbDjguHQiDWT64wKC+0295w6I8uBESOIu2zoiyEQ8Sj0AAUbT g==;
X-CSE-ConnectionGUID: uYXkJ2grTnKQtnuCLurt9w==
X-CSE-MsgGUID: T4m4hUndTy+v0HvO0tcO0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="46196022"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="46196022"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 04:46:46 -0800
X-CSE-ConnectionGUID: zLT+EtLRTM6jbALPV4uIeA==
X-CSE-MsgGUID: zYJJaT47RaimJ5DxP0nT4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="119020386"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 04:46:44 -0800
Date: Thu, 6 Mar 2025 13:46:42 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests=2Fint?=
 =?utf-8?B?ZWwva21zX2RyYXdfY3Jj?= =?utf-8?Q?=3A?= Skip formats not supported
 by the plane (rev2)
Message-ID: <20250306124642.56w4n7qprftsehqp@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20250303110235.15976-1-ville.syrjala@linux.intel.com>
 <174124640088.66194.17505003073098760028@64e06c682a23>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <174124640088.66194.17505003073098760028@64e06c682a23>
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
On 2025-03-06 at 07:33:20 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/kms_draw_crc: Skip formats not supported by the plane (rev2)
> URL   : https://patchwork.freedesktop.org/series/145712/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8262_full -> XEIGTPW_12705_full
> ====================================================
> 
> Summary
> -------
> 
>   **WARNING**
> 
>   Minor unknown changes coming with XEIGTPW_12705_full need to be verified
>   manually.

Unrelated.

Regards,
Kamil

>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12705_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_12705_full:
> 
> ### IGT changes ###
> 
> #### Warnings ####
> 
>   * igt@xe_eudebug_sriov@deny-eudebug:
>     - shard-dg2-set2:     [SKIP][1] ([Intel XE#4208]) -> [SKIP][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@xe_eudebug_sriov@deny-eudebug.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12705/shard-dg2-463/igt@xe_eudebug_sriov@deny-eudebug.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between XEIGT_8262_full and XEIGTPW_12705_full:
> 
> ### New IGT tests (1) ###
> 
>   * igt@xe_oa@buffer-size@ccs-0-128m:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.83] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_12705_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@core_getversion@all-cards:
>     - shard-dg2-set2:     [PASS][3] -> [FAIL][4] ([Intel XE#4284])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-464/igt@core_getversion@all-cards.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12705/shard-dg2-433/igt@core_getversion@all-cards.html
> 

...cut...

>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>   [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8262 -> IGTPW_12705
> 
>   IGTPW_12705: 12705
>   IGT_8262: 8262
>   xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c: 3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12705/index.html
