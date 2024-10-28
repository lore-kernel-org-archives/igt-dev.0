Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2094D33996
	for <igt-dev@archiver.kernel.org>; Mon, 28 Oct 2024 15:19:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB6AB10E4EC;
	Mon, 28 Oct 2024 15:19:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SYLuouaI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CDBA10E4EC;
 Mon, 28 Oct 2024 15:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730128742; x=1761664742;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qMLjXiZfoXKOwKV1S/X36ZIVmI48i+knmLmHrZ9pBa4=;
 b=SYLuouaIcLKBB7/SGuM4XJsJEFh1jmwRezF8KAW8ynYHG7UmWIg7KuOA
 x5QkFsrroLaSNCd2tKPPHQjHr1oXHSjAx6VY+PrVOfBLHPdPOQDdeRGAU
 LAWSJ4Ost3TJEXaQrd94gpCZbWba31uiORd9q/iKnKAjJwOr2t4HDuAHH
 Cb1re0h2cK/sXNHH/EQiEE4AoC76U9qlU1Dys2u1gInVimgoHkHG9RVb/
 rqXIiAAXWZOyQ/rOmYMNCHhRMOwOS6R+xvzsNhgQKBC4PatxXtpNPSf8S
 pP2s7TytW3BUjbKB71yzdv6fRCwbY+SJu/SLqtJUahcmQvEmEXBdm1BhC Q==;
X-CSE-ConnectionGUID: 2JUTl6/2QT+fHSeV0aOFDg==
X-CSE-MsgGUID: 1reTVdjgSpelmuZuepbunw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40267897"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="40267897"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 08:19:01 -0700
X-CSE-ConnectionGUID: OoLDE7yKSrK4A36ptP0GnQ==
X-CSE-MsgGUID: afw3YHJWQTasNAgTNuXzHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; d="scan'208";a="81542048"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 08:19:00 -0700
Date: Mon, 28 Oct 2024 16:18:57 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: george.zhang@amd.com, I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVy?= =?utf-8?Q?e?= for
 scripts/run-test: Keep original prune behaviour (rev3)
Message-ID: <20241028151857.i7ggxn24prr4cswm@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, george.zhang@amd.com,
 I915-ci-infra@lists.freedesktop.org
References: <20241025182944.866-1-george.zhang@amd.com>
 <172991424622.1334319.3934835645584655934@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <172991424622.1334319.3934835645584655934@2413ebb6fbb6>
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
On 2024-10-26 at 03:44:06 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: scripts/run-test: Keep original prune behaviour (rev3)
> URL   : https://patchwork.freedesktop.org/series/140446/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8086_full -> IGTPW_11986_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11986_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11986_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11986/index.html
> 
> Participating hosts (8 -> 8)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11986_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_module_load@resize-bar:
>     - shard-dg2:          [PASS][1] -> [SKIP][2] +2 other tests skip
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8086/shard-dg2-6/igt@i915_module_load@resize-bar.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11986/shard-dg2-4/igt@i915_module_load@resize-bar.html
> 

This is unrelated to change in scripts/

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11986_full that come from known issues:
> 
...cut...

> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11986/index.html
