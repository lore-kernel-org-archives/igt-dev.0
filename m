Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A67C83F1D
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 10:27:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 633F110E59A;
	Tue, 15 Jul 2025 10:27:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RxZPuWRu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE8810E596;
 Tue, 15 Jul 2025 10:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752575277; x=1784111277;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6TPEWJkYuu6M3mkP1lmUjcsiIFWx9ZJN77cs6fGM02s=;
 b=RxZPuWRulx+XWnE1+gQMIAI8HMW0NbdeJacFpB0WEl0CCOeMVyOz4SZg
 VarVP0scw79gDXY74rDPB8+y1cFm6V7bC6a/nwXupr4zjcvu44DIIc05D
 h6RNGIFpR8pQMy0na/pFkgqBqfT+UEKWYPeSdI1Ni2uSKRG6LK0TRQ49r
 TSR//42o5oT1+9FFKmO8kd6l5l9BlW1Z/jXhNuPzNB1c7vnvhHdVNnck5
 Wpt1zV4FRl5JlsZNC2xtpjPyI2V3qwFlEViuH1lt7c8QMYgy/UwPhmNAs
 I2ytirxVfcKpjYazJTrk8f7rGFjmjpvHH2dzaEf4rENUKB8xNPrvEAVi3 w==;
X-CSE-ConnectionGUID: l8+wAAKQRMWPTTpR+wJpXA==
X-CSE-MsgGUID: CSG7JGEBRlGWvCJfHK6ffQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54726256"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="54726256"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 03:27:57 -0700
X-CSE-ConnectionGUID: UTmjtSayRXKw/66o69q8jQ==
X-CSE-MsgGUID: b8odTMYoQTGfQar1QfSwpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="157278133"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 03:27:56 -0700
Date: Tue, 15 Jul 2025 12:27:37 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cg==?= =?utf-8?Q?e?= for
 intel-ci: Rename i915 blocklist and testlists (rev6)
Message-ID: <20250715102737.czbyna4pjd3kabto@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250714162435.112599-1-kamil.konieczny@linux.intel.com>
 <175255296673.160915.12323974376111292546@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <175255296673.160915.12323974376111292546@1538d3639d33>
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
On 2025-07-15 at 04:16:06 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: intel-ci: Rename i915 blocklist and testlists (rev6)
> URL   : https://patchwork.freedesktop.org/series/151121/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8457_FULL -> XEIGTPW_13465_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_13465_FULL absolutely need to be
>   verified manually.
>   

Unrelated, changes are only renaming ci block/test lists,
no test was touched.

Regards,
Kamil

>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_13465_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_13465_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_psr@psr2-suspend@edp-1:
>     - shard-lnl:          [PASS][1] -> [FAIL][2] +1 other test fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8457/shard-lnl-1/igt@kms_psr@psr2-suspend@edp-1.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13465/shard-lnl-6/igt@kms_psr@psr2-suspend@edp-1.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between XEIGT_8457_FULL and XEIGTPW_13465_FULL:
> 
> ### New IGT tests (1) ###
> 
>   * igt@kms_flip@bo-too-big@d-hdmi-a2:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.20] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_13465_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:
>     - shard-lnl:          [PASS][3] -> [FAIL][4] ([Intel XE#911]) +5 other tests fail
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8457/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13465/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html

...cut...
