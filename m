Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75BE6D3B7F3
	for <igt-dev@archiver.kernel.org>; Mon,  8 Dec 2025 14:13:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 118C910E453;
	Mon,  8 Dec 2025 14:13:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kYULGAFs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 846E310E452;
 Mon,  8 Dec 2025 14:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765203211; x=1796739211;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Tqcf9Kf7Rx3VkZprlzQ4VtRuskXc+7t+XSY75UXNX9A=;
 b=kYULGAFss+WLtBQECDWbiDNt5lJMQZMMw8nRbFAOtY1sL6c8U1i+vLX3
 NzkR37GHzFLiLBN0qKlbFVB1dMj7agRBpE2F0XlNcU3tJztki8Z41OHUQ
 3xPaa1ZTevq3tjHI/27/cDZska5vAWzIVS6ikOHLFNob9RCIxfHblUo3q
 8pPObdazMfD8nbzyLvK+e6H22zb4IwcdV75JjzZTm+KvLwdM9fzEZaVxn
 0r4w0MiYYN/2p32iXvmHzBkSVdw6gIJiu8PIgcDdzmf51A7QEDedHRyVS
 U0uvm4XjimiheltVPRhYQWpvQgv2GULuxthNEP60dGuPQvrENiU4YVQd5 Q==;
X-CSE-ConnectionGUID: FuBdP5GRTompebDjD7TCog==
X-CSE-MsgGUID: a0g7Sx4XSIm6jdP138oceQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67190980"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="67190980"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 06:13:31 -0800
X-CSE-ConnectionGUID: d/076QyZTSmPhIARn8IrxA==
X-CSE-MsgGUID: qOH5NFJLQLWM64/wz5nJzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="200113489"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 06:13:30 -0800
Date: Mon, 8 Dec 2025 15:13:26 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cg==?= =?utf-8?Q?e?= for
 intel-ci: unify Xe and i915 block/test/lists (rev2)
Message-ID: <20251208141326.4m63nwqdhlftd7g2@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20251204213632.155894-1-kamil.konieczny@linux.intel.com>
 <176498569736.62152.1266796935436537454@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <176498569736.62152.1266796935436537454@a3b018990fe9>
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
On 2025-12-06 at 01:48:17 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: intel-ci: unify Xe and i915 block/test/lists (rev2)
> URL   : https://patchwork.freedesktop.org/series/158391/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8657_FULL -> XEIGTPW_14161_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_14161_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_14161_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_14161_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_cursor_edge_walk@256x256-top-edge@pipe-a-dp-2:
>     - shard-bmg:          [PASS][1] -> [FAIL][2] +1 other test fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8657/shard-bmg-8/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-a-dp-2.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14161/shard-bmg-2/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-a-dp-2.html
> 

Unrelated,

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_14161_FULL that come from known issues:
> 
> ### IGT changes ###
...cut...
