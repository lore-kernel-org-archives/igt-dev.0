Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD42D2ECF7
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 15:38:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 861CB10E61F;
	Tue, 20 Jan 2026 15:38:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HNhNglk8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4CC510E61F;
 Tue, 20 Jan 2026 15:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768923481; x=1800459481;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IIdINVbdbIFVA/bEGKSmOG8duFNBaPcuIlql5PC1rS4=;
 b=HNhNglk8iBRsekQpw65WwTN56U5DngpDU2yN/Ut6w+jeokMw5dpqpm0L
 Gt1eJrUYZ+CbcLr8amWlDgtFGu32sgjmFTq3ZBo9qg0cSySgeia7nMyKi
 bnMdb2/pvI1tZfJeIe84NsM/yRZ594EZJyIcF3iHkeXr8smu2Cu8TMw9g
 rPgecn8LdCUlXe0oJv/mCPGth/tbfaLgjuEFYDr8Zd812RDhKEl8ii5JZ
 72hsQtNGEE3DM2uFH38tkaEzsyXM5RGJegX1xd9/gEcbyYDwCF5Q1QSt3
 4ks4/4hb4rp6vKDn7+XoV6xk6nM2Qj7ttsvFVk5Fth1JGE687DbTdXjxv A==;
X-CSE-ConnectionGUID: NwLvH3NtRaeRuI9dM6UDbA==
X-CSE-MsgGUID: tgYXx8bEQ2WAUOMXu8hTMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70039843"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="70039843"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 07:38:00 -0800
X-CSE-ConnectionGUID: imWZLEWIRYWKMvT1WWvQFA==
X-CSE-MsgGUID: X/9rkXm9QrKXJgx07ItKDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="211003338"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 07:37:59 -0800
Date: Tue, 20 Jan 2026 16:37:43 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 Runner: Use Jansson instead of json-c (rev2)
Message-ID: <20260120153743.imy5eaexvar2rphx@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20260115175811.179898-1-kamil.konieczny@linux.intel.com>
 <176886335995.169327.4655502308633559777@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <176886335995.169327.4655502308633559777@a3b018990fe9>
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
On 2026-01-19 at 22:55:59 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Runner: Use Jansson instead of json-c (rev2)
> URL   : https://patchwork.freedesktop.org/series/160154/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8705_FULL -> XEIGTPW_14368_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_14368_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_14368_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_14368_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_color_pipeline@plane-ctm3x4:
>     - shard-bmg:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8705/shard-bmg-1/igt@kms_color_pipeline@plane-ctm3x4.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14368/shard-bmg-3/igt@kms_color_pipeline@plane-ctm3x4.html
> 
>   * igt@kms_color_pipeline@plane-ctm3x4@pipe-a-dp-2:
>     - shard-bmg:          [PASS][3] -> [DMESG-WARN][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8705/shard-bmg-1/igt@kms_color_pipeline@plane-ctm3x4@pipe-a-dp-2.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14368/shard-bmg-3/igt@kms_color_pipeline@plane-ctm3x4@pipe-a-dp-2.html

Unrelated, this series changes only tools/*, no tests.

Regards,
Kamil

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_14368_FULL that come from known issues:
> 
...cut...
