Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1504CC3600C
	for <igt-dev@archiver.kernel.org>; Mon, 31 Mar 2025 08:43:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1EA810E084;
	Mon, 31 Mar 2025 08:43:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RY12p912";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA9B10E084;
 Mon, 31 Mar 2025 08:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743410637; x=1774946637;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=uY5IJX4Es7ES4N6dztHXy7gP1eZN6aYuE5Tmk2rwrps=;
 b=RY12p912uX98g1kPFbnKDiG0lhZdzITJbQ2pKqEZoD5wzsYdD1wULA5o
 ba/zg2hSgUkkf2MIRDES9GKe6t6p1BStHaAh088tfWWUpyDmcqLHfu2eL
 qe97WFtVBG+FhLufmBtji5OtVaUsp2+PjxaleDWvZgkFo50p3vXo5KjDb
 e6Tvk9BNw4RgW1QDemWO6L95HbyTvl8ytTpsnNzAYjTO8/6QNWh7ooIr1
 qtMoPrZAxEwlBjWggzKNQeQEhxFScJsLqbSjkbdaULtU+4FaesByVdOKE
 JmbohKhchMT9FRmzE7TW1p85StvpsoSdOhpQ9PHATuQHXKkVZ1zk+Vspp A==;
X-CSE-ConnectionGUID: fhW17px3RNqFe7yu5n5GQw==
X-CSE-MsgGUID: 81mjO4jLT3SPt+SpG4RqDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="70050845"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="70050845"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 01:43:52 -0700
X-CSE-ConnectionGUID: GQFyrUbCQl2nPbQ2BnwDjg==
X-CSE-MsgGUID: 4ye0n6t+RCewY17tBhcg1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="126262035"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO [10.245.118.0])
 ([10.245.118.0])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 01:43:51 -0700
Message-ID: <36cb6a97-d985-48df-9140-0a5f2d67fb88@linux.intel.com>
Date: Mon, 31 Mar 2025 10:43:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBtYW4vbHNncHU6?=
 =?UTF-8?Q?_Add_man_page_for_lsgpu_=28rev2=29?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250329143607.33723-1-peter.senna@linux.intel.com>
 <174329656986.18497.6873104803547611447@e6b6f09ec485>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <174329656986.18497.6873104803547611447@e6b6f09ec485>
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

On 3/30/2025 3:02 AM, Patchwork wrote:
> == Series Details ==
> 
> Series: man/lsgpu: Add man page for lsgpu (rev2)
> URL   : https://patchwork.freedesktop.org/series/146860/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8292_FULL -> XEIGTPW_12885_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12885_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12885_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_12885_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc:
>     - shard-bmg:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-7/igt@kms_pipe_crc_basic@suspend-read-crc.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12885/shard-bmg-7/igt@kms_pipe_crc_basic@suspend-read-crc.html
> 
>   * igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:
>     - shard-lnl:          [PASS][3] -> [ABORT][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-lnl-8/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12885/shard-lnl-7/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_content_protection@srm:
>     - shard-bmg:          [FAIL][5] ([Intel XE#1178]) -> [INCOMPLETE][6] +1 other test incomplete
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-3/igt@kms_content_protection@srm.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12885/shard-bmg-2/igt@kms_content_protection@srm.html
> 
>   * igt@kms_plane_multiple@2x-tiling-yf:
>     - shard-bmg:          [SKIP][7] ([Intel XE#4596]) -> [SKIP][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8292/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12885/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html
> 


These are unrelated to my change.

[...]

Thank you!
