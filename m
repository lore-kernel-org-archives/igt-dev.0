Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C44D41177
	for <igt-dev@archiver.kernel.org>; Thu, 15 Jan 2026 11:47:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50E3E10E745;
	Thu, 15 Jan 2026 11:47:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YSPEmC0R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E09F410E74A
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jan 2026 11:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768477638; x=1800013638;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=Odj8IzMugdgR9u0dxo2NLLSWsaSkaaJ+Tk65/BD0wws=;
 b=YSPEmC0RbcXJYFZhbEUtQqM5up8mpXlze6GI11zOzltSeB0fhlH8GaGV
 cJjSP/9IRdbtZ3RsIB1gC60UAuISkE7TNXCVR7kcc6cX6ltNjNjCL1guC
 oMQwDQjg4DGOzIGtdgHxm5lGPSmZqZgu56ol9ZLQ2I+Q5iBgKBRsLeozt
 F34jq/ckxmMBdab3+E2Koea9eN+J/BKJgtjdT0PyEOJYksMlgaBxYuw1b
 9HyM+SMBjxB53JCtI24a+IEy+osSzIImAnkdoArR0vrSAn7d2jRn4cPRN
 NZTs4gQ/K1ql6nLmyd4jbggNA9Pn3x8X0WXN0j2neZSgeQPJ49IH4EZpg w==;
X-CSE-ConnectionGUID: G0wCGEWzT5O36bUCurp3GQ==
X-CSE-MsgGUID: mJbTNSktSGW6Hi0EKlIWvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69689162"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="69689162"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 03:47:17 -0800
X-CSE-ConnectionGUID: wXP16jbCRv2YJU1BqejJTA==
X-CSE-MsgGUID: 7ISwRF17TdKu0tf3ACIqdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="209080455"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 03:47:16 -0800
Date: Thu, 15 Jan 2026 12:47:14 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 RFC: cut successful dmesg logs
Message-ID: <20260115114714.hfb33qyg34osylti@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260112165006.237964-1-kamil.konieczny@linux.intel.com>
 <176826918485.148085.5541140116345209941@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <176826918485.148085.5541140116345209941@a3b018990fe9>
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
On 2026-01-13 at 01:53:04 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: RFC: cut successful dmesg logs
> URL   : https://patchwork.freedesktop.org/series/159973/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8697_FULL -> XEIGTPW_14325_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_14325_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_14325_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_14325_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-dp-2:
>     - shard-bmg:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8697/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-dp-2.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14325/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-dp-2.html
> 

Unrelated to igt_runner change.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_14325_FULL that come from known issues:
> 
> ### IGT changes ###
...cut...
