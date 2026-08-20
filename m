Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FCE2C5DF87
	for <igt-dev@archiver.kernel.org>; Thu, 20 Aug 2026 11:06:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C5C10EFF0;
	Thu, 20 Aug 2026 11:06:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vwq6rzUw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C5FD10EFEB;
 Thu, 20 Aug 2026 11:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787223974; x=1818759974;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0LqR73BpAgOYooS2CainJzaxxHCgEQELTpP80kUUDc4=;
 b=Vwq6rzUwBi9z0sxLRDtEk6MzMJgIjQKeYQo1+B/CPyJrGBKIwPJ2H/Kl
 P58/CwG2yMEe7QzTetaoGPbpyzQbcS9jmwWlmE6UUVhNy6r5ZxwDAzPBT
 MYssuNC017ciVBN6PJoyw7o0VKV+HYGAHyrVXXxrZQHF8Geo/sdhjnZrQ
 iNGBbDnYCkvWQuU5wPLkRzjyDXgPAxPv8EAa93ipHpKce7qPIrEtUd+T0
 ahOc2BYfs0iaZrgndjfma2ERWAsLRW4AOUT7F4KJyFj6cASOvtAiZOLu7
 YanxwsMlwuqqzQAaKufuIxX1beQFCKm5Bk10K/V+ZOI6GALGwNMEvwag4 w==;
X-CSE-ConnectionGUID: GNXyIWXtQbWv8lNy52yu5Q==
X-CSE-MsgGUID: YelGGpviTpCpq7AB+WSKAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="90272613"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="90272613"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 04:06:14 -0700
X-CSE-ConnectionGUID: ZNYKIhT4RWmTo1glVFjbPw==
X-CSE-MsgGUID: FQ+4aFExSMWeBRoZraOenQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="295898656"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 04:06:12 -0700
Date: Thu, 20 Aug 2026 13:06:10 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: nishit.sharma@intel.com, I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_fix_prefetc?=
 =?utf-8?Q?h=2Fatomic-attribute?= flow and use internal DONTNEED skip flag
Message-ID: <20260820110610.bozjznllurxnzuj2@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, nishit.sharma@intel.com,
 I915-ci-infra@lists.freedesktop.org
References: <20260819145302.18068-1-nishit.sharma@intel.com>
 <178718243728.69066.17692670728778171368@61270ab9df2a>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <178718243728.69066.17692670728778171368@61270ab9df2a>
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
On 2026-08-19 at 23:33:57 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: fix prefetch/atomic-attribute flow and use internal DONTNEED skip flag
> URL   : https://patchwork.freedesktop.org/series/172461/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_9063_FULL -> XEIGTPW_15707_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_15707_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_15707_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_15707_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@runner@aborted:
>     - shard-lnl:          NOTRUN -> [FAIL][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15707/shard-lnl-2/igt@runner@aborted.html
> 
>   * igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads:
>     - shard-lnl:          [PASS][2] -> [FAIL][3]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9063/shard-lnl-1/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15707/shard-lnl-3/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * {igt@xe_prefetch_fault@l2-prefetch-fault}:
>     - shard-bmg:          NOTRUN -> [SKIP][4]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15707/shard-bmg-2/igt@xe_prefetch_fault@l2-prefetch-fault.html
> 

Unrelated, the same change had no fails: https://patchwork.freedesktop.org/series/172403/



Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_15707_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
...cut...
