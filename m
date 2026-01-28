Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA01D35691
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 08:23:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC0D910E629;
	Wed, 28 Jan 2026 08:23:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zks46noV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C35110E62E;
 Wed, 28 Jan 2026 08:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769588583; x=1801124583;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=w5lVJEn6Qyxm+DT60VK6wgtdQG6MB2Mv21Kqzq4igPM=;
 b=Zks46noV3lhIAVuXkhAYzaySwrVWJS5Gb11jHcrS7Z8CK/7hlh52xFKB
 vO3ptx072iCBVPvkRoRnkC7Yx7SMVK9qNhOFkvykMM0dxBihYwZ6ZGVnS
 NWUdcnuPqcQU7F2XlpnsV4pPZGFYviRs3UZ7kBQEd02nuNoxv2CrOUmIK
 GQJZ6aXc5khxHn8W6ix+sLbuR/+boXIVytZ6Qfs+bXWk7ii0wVQk7FQ2B
 iVPfoDqNzPcEd/wK5o6sTQYUTM2e+XXBTkINv6F8JtMNDxqK5op5FkdNB
 5Ono6sbKZ2b5gTc7KSfZ7CAvl23FZ2HOw9agIsoFHQtoyGXtQGHFZKZJ+ Q==;
X-CSE-ConnectionGUID: bYc/kyqnRAWH+DY2LlBhMA==
X-CSE-MsgGUID: 2hI6kTfiRYSREuH0t/jVAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="74645170"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="74645170"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 00:23:03 -0800
X-CSE-ConnectionGUID: gIXtSKdhTjmz0VQGFgEAyw==
X-CSE-MsgGUID: ZHTza/N1TEC7whI4LUk7SQ==
X-ExtLoop1: 1
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 00:23:01 -0800
Date: Wed, 28 Jan 2026 09:22:46 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Karthik B S <karthik.b.s@intel.com>,
	I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 tests/intel/kms_joiner: Fix var usage
Message-ID: <20260128082246.pxymodug3rxfkach@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20260127164018.63157-1-kamil.konieczny@linux.intel.com>
 <176955857176.197950.802660982423343943@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <176955857176.197950.802660982423343943@a3b018990fe9>
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
On 2026-01-28 at 00:02:51 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/kms_joiner: Fix var usage
> URL   : https://patchwork.freedesktop.org/series/160713/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8720_FULL -> XEIGTPW_14429_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_14429_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_14429_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_14429_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2:
>     - shard-bmg:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8720/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14429/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html
> 
>   * igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-madvise:
>     - shard-bmg:          [PASS][3] -> [ABORT][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8720/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-madvise.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14429/shard-bmg-4/igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-madvise.html
> 

These are unrelated.

>   
> #### Warnings ####
> 
>   * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
>     - shard-lnl:          [SKIP][5] ([Intel XE#2925]) -> [SKIP][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8720/shard-lnl-2/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14429/shard-lnl-1/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
> 

This seems consistent but I cannot comment that,
Karthik please look into this and comment.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_14429_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
...cut...
