Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C9BC5321E
	for <igt-dev@archiver.kernel.org>; Mon, 26 Aug 2024 10:58:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CE5210E18F;
	Mon, 26 Aug 2024 10:58:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i+QrZRDI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0DBC10E18F;
 Mon, 26 Aug 2024 10:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724669893; x=1756205893;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kcnfbp6rEwxAblPEC6UPon/565WdxTXlrDMo0YkKCIQ=;
 b=i+QrZRDIYNyjjbaOsZqQ2YcJ5pgVwWQj+mdkOPAts1lBeaIyZBQT5xvG
 EpZgAMDAlFWzOdW5Fs9yCyO7XdgPfXoD0mgQcx3WHWTIf7Ww8N2YCM9J7
 UwXlZpsOuXNLcZrAN+V4PVyrqeB1+Ai8jyGkJgezgnzzQPnpGoytAHOxh
 hjXZmRodDenu06kB5/yLQ3ne5kK0nwCafbC1mlqmY9IGXUU/Kh1BXkz4T
 +I82kcZQodVaY/tlKTe/ibGIqoRmCOqstibq/J9m06htl9UaXo91HZUAQ
 09QjD8xV5DgKvoJsIcPuLk6PfbJE35pC1siguBBbCjTEUmoGZKnVtYg58 g==;
X-CSE-ConnectionGUID: hzcMWwGpT8WxhKjyWz1m9A==
X-CSE-MsgGUID: 5s1WY1M7QxSetSxV2Cr/DQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="26848092"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="26848092"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 03:58:13 -0700
X-CSE-ConnectionGUID: TGOndTUcR9y+iTIEYfr3Fg==
X-CSE-MsgGUID: OXQ+oCJhQtOG6fjF8P+Mtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="99972804"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 03:58:12 -0700
Date: Mon, 26 Aug 2024 12:57:53 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIENJLnhlRlVMTDogZmFpbHVy?= =?utf-8?Q?e?= for Fix
 compilation for musl in intel/kms_pm_backlight (rev2)
Message-ID: <20240826105753.bd2o5alt5f4utlgi@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20240823155747.69745-1-kamil.konieczny@linux.intel.com>
 <172446591986.748054.8866386304534283688@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <172446591986.748054.8866386304534283688@2413ebb6fbb6>
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
On 2024-08-24 at 02:18:39 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Fix compilation for musl in intel/kms_pm_backlight (rev2)
> URL   : https://patchwork.freedesktop.org/series/137557/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7989_full -> XEIGTPW_11624_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11624_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11624_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_11624_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_compute_mode@many-userptr-invalidate:
>     - shard-lnl:          [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7989/shard-lnl-6/igt@xe_exec_compute_mode@many-userptr-invalidate.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11624/shard-lnl-3/igt@xe_exec_compute_mode@many-userptr-invalidate.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
>     - shard-dg2-set2:     [SKIP][3] ([Intel XE#1201]) -> [SKIP][4] +1 other test skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7989/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11624/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
> 

These are unrelated,

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
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11624/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11624_full that come from known issues:
> 
...cut...
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7989 -> IGTPW_11624
> 
>   IGTPW_11624: 11624
>   IGT_7989: 7989
>   xe-1821-96041621daaf71059d790a2ddbaa60114371eada: 96041621daaf71059d790a2ddbaa60114371eada
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11624/index.html
