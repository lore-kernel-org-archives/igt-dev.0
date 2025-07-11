Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A08CFC83F1A
	for <igt-dev@archiver.kernel.org>; Fri, 11 Jul 2025 07:37:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E41C10E9BC;
	Fri, 11 Jul 2025 07:37:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fgzMvIDn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ABDF10E9BA;
 Fri, 11 Jul 2025 07:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752219426; x=1783755426;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=wRgNgfinngGPlkIphzhGPx00VU54sttb8aOR6eqdR3s=;
 b=fgzMvIDnc/Oc+59YU4XisXJalsOZ+1Ros1Z7WIpP+AzeCG/IqzzTT8VP
 FUKOJiSDtdOndNwz1HUguWWhfNgV28LAxaiY3VmHVVq2wCN0yF3oXJ/+J
 vDBGLWfsAu5v9vkCoCBjbA4mTSh3GX+QmA38S0QoLhvyxtNU+wibhKkiU
 RxoFGEe7Y9g0wcAQb5SN8PBLxYKm9LXpFcP3f8UUJGIyzbh/7z7LTI/tj
 /2dJx0Poeuutyp1i/7wiRVgm51f+lWfesrJMfWEipiejvjacI3s18DQ/I
 0WwMdYvjco7KzcR6lXa+WTM6h5hcn4uP2GQ9DUykD80rSIZ2QRzsNP00v A==;
X-CSE-ConnectionGUID: o/fDnj5PSmC6vIJiEoUNMA==
X-CSE-MsgGUID: c7X17hQVThmPHk9HnGsfVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="64771868"
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; d="scan'208";a="64771868"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 00:37:06 -0700
X-CSE-ConnectionGUID: TDReu6tNQTOf16sXa12osA==
X-CSE-MsgGUID: rxhRGoPoSHGLT5fYxXOqyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; d="scan'208";a="161996621"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO [10.245.118.0])
 ([10.245.118.0])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 00:37:05 -0700
Message-ID: <a5a81160-4767-4451-a089-91d29de0f2c0@linux.intel.com>
Date: Fri, 11 Jul 2025 09:37:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciAuY2hlY2twYXRj?=
 =?UTF-8?Q?h=2Econf=3A_Add_checkpatch=2Epl_defaults_for_IGT?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250710181613.62487-1-peter.senna@linux.intel.com>
 <175219495879.152706.5204698568983173180@1538d3639d33>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <175219495879.152706.5204698568983173180@1538d3639d33>
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

[...]

On 7/11/2025 2:49 AM, Patchwork wrote:
> == Series Details ==
> 
> Series: .checkpatch.conf: Add checkpatch.pl defaults for IGT
> URL   : https://patchwork.freedesktop.org/series/151458/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8451_FULL -> XEIGTPW_13446_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_13446_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_13446_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_13446_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_oa@mmio-triggered-reports-read:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13446/shard-dg2-432/igt@xe_oa@mmio-triggered-reports-read.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * {igt@xe_copy_basic@mem-set-linear-0x8fffe}:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][2]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13446/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0x8fffe.html

These are unrelated to my change.

Thank you!
