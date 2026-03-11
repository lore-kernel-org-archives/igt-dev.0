Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E6D11125856
	for <igt-dev@archiver.kernel.org>; Wed, 11 Mar 2026 17:34:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4D8910E133;
	Wed, 11 Mar 2026 17:34:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DS3p87ws";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B98310E133
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2026 17:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773250460; x=1804786460;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UVMaVL6mSHLq3FvB6yOCP+Kpr2rL5eP/3KDlA2a6rtg=;
 b=DS3p87wszHR7Ht8ZuQnBfrNEwdLOW1U3SqolVGAS9MpROlq/ci3qYE4m
 3vH3EQ4Uq1ljxJTJ+kt3/+S9xx6h0DK/YgEI+7ImHHFmouluPtjhnduKd
 ysvxKBmPSlfBTg0U956rRrwnfT41tQrR6Gzo8E+QbEWTCHDQ1pYf4gVNw
 mwuohELORrfAHZuXwMWWYRqbfkHf51zNszogiIoCuBLoPmUOe0n0dK3QC
 ODfW/fu91CPOa3nWkXt9DI18D5KW99dPtFlBR80nozdi9RVtzPCSixHyV
 Suu78qUuSgE0q11wLucdkrPecRi+Mdily8NgM6nDdoLtauyHCXfuPFwPo A==;
X-CSE-ConnectionGUID: MMs3LsiXSGKjRfp1fwRNrw==
X-CSE-MsgGUID: k7fBiC1ZTvidrOPgXNao9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74027190"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="74027190"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 10:34:20 -0700
X-CSE-ConnectionGUID: HMYedpQxRDKJRwpUU41UaQ==
X-CSE-MsgGUID: jsDNfe8oSI28VhjHM5aSsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="220590526"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 10:34:18 -0700
Date: Wed, 11 Mar 2026 18:34:15 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org, swati2.sharma@intel.com,
 arun.r.murthy@intel.com
Subject: Re: [PATCH i-g-t] intel-ci : Add async-flip with linear modifier
 subtest to Xe blocklist
Message-ID: <20260311173415.pyk5oe47dulmh3cb@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>, igt-dev@lists.freedesktop.org,
 swati2.sharma@intel.com, arun.r.murthy@intel.com
References: <20260311054747.1230383-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260311054747.1230383-1-karthik.b.s@intel.com>
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

Hi Karthik,
On 2026-03-11 at 11:17:47 +0530, Karthik B S wrote:

small nit about subject, please remove space before ':', also add
that it is for Xe, so instead of:

[PATCH i-g-t] intel-ci : Add async-flip with linear modifier

it will be:

[PATCH i-g-t] intel-ci/xe: Block async-flip with linear modifier

May be done at merge time.
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil 

> Async flips are slower with linear modifier on Xe and so does not meet
> the required FPS criterion. This is not an issue as there is no real
> world use case which requires this combination.
> 
> Blocklist this test to avoid expected failures.
> 
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>  tests/intel-ci/xe.blocklist.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index bd08aa594..edc5039a9 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -123,3 +123,8 @@ igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k
>  # Exclude one compute mode test
>  ##################################################################
>  igt@xe_exec_compute_mode@non-blocking
> +##################################################################
> +# Async flips with linear modifier are slower
> +##################################################################
> +igt@kms_async_flips@async-flip-with-page-flip-events-linear.*
> +##################################################################
> -- 
> 2.43.0
> 
