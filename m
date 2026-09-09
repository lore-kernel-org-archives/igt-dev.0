Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A90FBC79FB7
	for <igt-dev@archiver.kernel.org>; Wed,  9 Sep 2026 16:32:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E23010E559;
	Wed,  9 Sep 2026 16:32:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Up/pSSLd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E79210E559
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Sep 2026 16:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788971488; x=1820507488;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0J4oT1RluqBgSxi7twoxtfI4K0+ol7fo9J0nJsBotzc=;
 b=Up/pSSLdn+PLVDyICeD8I5AKE8Z7MCjDrxeXdSwy++myajEpraj9/qwJ
 QVjIjLLILGpgcL7wg6yokJ3RGnvHKbzNDS62u5PCGJ8jbijFTHKgfZNeU
 egrxWyyXQ7krwZfS1n+W9GsL9ywRduJG/AzFrvjs2v9u2lnYAG5nQfwYJ
 9P1fFHTESAWYX3kHpDnKIlc/0YnHRKyICorn/co/Qvn6uOl3cPKZfM8RR
 A0/IMAFGAozPZkhFi83FFIiAfo3x6YcU5w8W0TluWglRG1FrR8jB7gU1D
 B+4Vsris0Jj0zn9YUebKBWiAqixQpf9lTxVPmD8a0ZjSMOTkY+pXA11we A==;
X-CSE-ConnectionGUID: D3/8VhMmQqeahsmGQw3obQ==
X-CSE-MsgGUID: EFF/nYujQoaA1J3xpzGJ4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="91922059"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="91922059"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 09:31:27 -0700
X-CSE-ConnectionGUID: Z1g6eVhiSyO38bbyab59wQ==
X-CSE-MsgGUID: e+ln+j7pRdWSDGbf19Sygw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="269615571"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 09:31:26 -0700
Date: Wed, 9 Sep 2026 18:31:24 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: igt-dev@lists.freedesktop.org, Julia Filipchuk <julia.filipchuk@intel.com>
Subject: Re: [PATCH i-g-t v2 2/3] tests/intel-ci: Add a subset of pxp tests
 into xe-fast-feedback
Message-ID: <20260909163124.ili4eenkyva7wuae@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 igt-dev@lists.freedesktop.org,
 Julia Filipchuk <julia.filipchuk@intel.com>
References: <20260909002705.431136-5-alan.previn.teres.alexis@intel.com>
 <20260909002705.431136-7-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260909002705.431136-7-alan.previn.teres.alexis@intel.com>
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

Hi Alan,
On 2026-09-08 at 17:27:05 -0700, Alan Previn wrote:
> Add only bo/queue allocation pxp subtests into BAT coverage
> since this subtests cover both positive and negative testing
> depending on the platform's support.
> 
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>

Same here, short prefix 'intel-ci:' is enough.

With above fixed this is
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

PS. please wait for all tests and check and reply to failures.

> ---
>  tests/intel-ci/xe.fast-feedback.testlist | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/intel-ci/xe.fast-feedback.testlist b/tests/intel-ci/xe.fast-feedback.testlist
> index ecd2c568f..59d1cff2e 100644
> --- a/tests/intel-ci/xe.fast-feedback.testlist
> +++ b/tests/intel-ci/xe.fast-feedback.testlist
> @@ -203,6 +203,8 @@ igt@xe_pm_residency@gt-c6-on-idle
>  igt@xe_prime_self_import@basic-with_one_bo
>  igt@xe_prime_self_import@basic-with_fd_dup
>  #igt@xe_prime_self_import@basic-llseek-size
> +igt@xe_pxp@pxp-bo-alloc
> +igt@xe_pxp@pxp-queue-alloc
>  igt@xe_query@query-engines
>  igt@xe_query@query-mem-usage
>  igt@xe_query@query-gt-list
> -- 
> 2.43.0
> 
