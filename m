Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB95BC5321D
	for <igt-dev@archiver.kernel.org>; Mon, 26 Aug 2024 11:01:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8E2D10E199;
	Mon, 26 Aug 2024 11:01:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gHB5OlRV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1C9310E191;
 Mon, 26 Aug 2024 11:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724670090; x=1756206090;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uanjV+dhYVY+r45+E4X/KLRkeCagUz7ZnUw/+ev2VSE=;
 b=gHB5OlRVtlnxtbKlgF3FlmWATUOYo6fVRT8PdL1GKdtiROSbzokfDNRj
 gFrtV770oVjS29S+ZHI+7RsjNl6IB5DeQeHAY01z6g5HGI/CL2OkxVRTH
 J99Xw6o66uL8DeK3hf1Da5sepeP5/lKpYcdqqpXBgT4ThjDbtun3BIDKC
 5lfZoAyfKecuF/54oaJP1wmjg4gNJkM8E7GGyif8P0tTC7BKptz3/Uo+o
 q74QIi9OqJxKNtBtnmEdeIq+6N5Olm0aZ9ojX/u4wKYR14E36z9Eoo0D9
 7Pvlb7eVFjChaK0B67G9TErL+M069po/mxeJQk38jAYdpa8NuvASzzOAT g==;
X-CSE-ConnectionGUID: iPEv2aEkTZmC841Sg1FMRg==
X-CSE-MsgGUID: DjoN+Tn5QdCedBWnRmrElA==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="26962494"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="26962494"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 04:01:30 -0700
X-CSE-ConnectionGUID: sbGGORcaSRWEiRcu0wTGyQ==
X-CSE-MsgGUID: gjZAPlYPSdi64v9MPL3ZvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="62447966"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 04:01:29 -0700
Date: Mon, 26 Aug 2024 13:01:26 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIENJLnhlRlVMTDogZmFpbHVy?= =?utf-8?Q?e?= for
 runner/settings: set PRUNE_KEEP_ALL as default (rev2)
Message-ID: <20240826110126.fqkgf243cdqk6kno@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20240823161409.79198-1-kamil.konieczny@linux.intel.com>
 <172446882996.748004.8831865152568300020@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <172446882996.748004.8831865152568300020@2413ebb6fbb6>
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
On 2024-08-24 at 03:07:09 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: runner/settings: set PRUNE_KEEP_ALL as default (rev2)
> URL   : https://patchwork.freedesktop.org/series/135116/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7989_full -> XEIGTPW_11625_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11625_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11625_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_11625_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_gt_freq@freq_reset_multiple:
>     - shard-lnl:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7989/shard-lnl-3/igt@xe_gt_freq@freq_reset_multiple.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11625/shard-lnl-6/igt@xe_gt_freq@freq_reset_multiple.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
>     - shard-dg2-set2:     [SKIP][3] ([Intel XE#1201]) -> [SKIP][4] +1 other test skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7989/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11625/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
> 

Unrelated to change in igt_runner,

Regards,
Kamil

>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2:
>     - {shard-bmg}:        [PASS][5] -> [FAIL][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7989/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11625/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2.html
> 
>   * igt@xe_evict@evict-beng-small-cm:
>     - {shard-bmg}:        [PASS][7] -> [DMESG-WARN][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7989/shard-bmg-3/igt@xe_evict@evict-beng-small-cm.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11625/shard-bmg-2/igt@xe_evict@evict-beng-small-cm.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11625_full that come from known issues:
> 
...cut...
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7989 -> IGTPW_11625
> 
>   IGTPW_11625: 11625
>   IGT_7989: 7989
>   xe-1821-96041621daaf71059d790a2ddbaa60114371eada: 96041621daaf71059d790a2ddbaa60114371eada
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11625/index.html
