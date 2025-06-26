Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D432BC77B7F
	for <igt-dev@archiver.kernel.org>; Thu, 26 Jun 2025 08:27:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B0C410E881;
	Thu, 26 Jun 2025 08:27:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VcXNSTPW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB0510E881;
 Thu, 26 Jun 2025 08:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750926449; x=1782462449;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZPzdfglnFIITXmfvzPBCD46y9ANXZ6YOgauPN+R3LvI=;
 b=VcXNSTPWzyu9dCoKw0EAhsI65kHztTxr6+O3kp5gn1VRRWMflq9Kwu+J
 /BY9/jlCqsWfiJO+Vwz0oJjfumcrPqAuNlYmMe46F1B2HZCD6+wDhR1ug
 oPaExVX0lf4Weqradzgng+asGwh/eCKRECZB5LFkpgMwjY+RyC8jLJ0ip
 8xZnSq2PAMXcQwYUCbe0uIN4A5r1WTF5G2rpdxW70ydi5saWSwBvZxLn1
 rA1eaNj/JDTeWHE95DHeop9MiuB0EgWeOsVPy9YZaJfMOuv29pkYH1Gxt
 km1mqxoetpsd3hYngzKKVkzrslH0ugBh95ONzz1e+f6BM1yMIg2/Jp7Ku w==;
X-CSE-ConnectionGUID: dKqjGzBDQuaec9+VNGbL8Q==
X-CSE-MsgGUID: ZlyyNbqMTkSxxC9+f2E0jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="52329704"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="52329704"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 01:27:24 -0700
X-CSE-ConnectionGUID: /GUdbCyhQwaOvd8kQ+oYpg==
X-CSE-MsgGUID: I0cyMHZVRNCHidiyoZmfPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="152955778"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 01:27:22 -0700
Date: Thu, 26 Jun 2025 10:27:20 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Alex Hung <alex.hung@amd.com>, I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cmUgZm8=?= =?utf-8?Q?r?=
 lib/igt_kms: Move get_writeback_formats_blob to lib (rev3)
Message-ID: <20250626082720.levblywkig57jk33@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Alex Hung <alex.hung@amd.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20250624221712.1786983-1-alex.hung@amd.com>
 <175088935819.110302.3920484363168097640@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <175088935819.110302.3920484363168097640@1538d3639d33>
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
On 2025-06-25 at 22:09:18 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/igt_kms: Move get_writeback_formats_blob to lib (rev3)
> URL   : https://patchwork.freedesktop.org/series/150486/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8424_FULL -> XEIGTPW_13346_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_13346_FULL absolutely need to be
>   verified manually.

Unrelated to kms_writeback change.

Regards,
Kamil

>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_13346_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_13346_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_psr@psr2-no-drrs@edp-1:
>     - shard-lnl:          [PASS][1] -> [FAIL][2] +1 other test fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8424/shard-lnl-5/igt@kms_psr@psr2-no-drrs@edp-1.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13346/shard-lnl-3/igt@kms_psr@psr2-no-drrs@edp-1.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_13346_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
>     - shard-lnl:          [PASS][3] -> [FAIL][4] ([Intel XE#911]) +3 other tests fail
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8424/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13346/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html

...cut...

