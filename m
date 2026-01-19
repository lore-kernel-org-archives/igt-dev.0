Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D1BCCF2D5
	for <igt-dev@archiver.kernel.org>; Mon, 19 Jan 2026 10:14:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5966410E2A4;
	Mon, 19 Jan 2026 10:14:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eaZ4wG38";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7C3510E2A4
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jan 2026 10:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768817665; x=1800353665;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=sNHqL9R4c7Q8rVGY8Yjt37h34M/grax9V2VHSil1ZN4=;
 b=eaZ4wG38TeNGVevZbj8zaejKwtOQvbN9MjgOmLMk7BYxFT9UMyijkBoZ
 SDGXfbz+PpyIwEVEZcBfjdhLRx/EQH77WUXJpkMih2boA1OPpOji1IOGs
 XRF3vyUl4XrBAl3X+NZv7ipvgj0X1cRQXBJnL/FKa/OMoC++1f9FlHXxD
 SukQEt2jQv7s1DOhDgQwORvIxdLVnjXK2CBEBgxAftToTW2hwFSEYY+z1
 dJ9A1vDUkIsFDr3avnnGxFN7s6Ik/o2wc5mlejjPbcsLpKntZqMcWbjwy
 swo/srn81REqTU7kVcZjatbVlpFyo6D9WF2axKjetz25K+rYJNYPXs3ru g==;
X-CSE-ConnectionGUID: rLx3oZTYTIyeUKxeSuWCkg==
X-CSE-MsgGUID: ll9s6zlWRXSxQxmSUDzRxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="73656601"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="73656601"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 02:14:24 -0800
X-CSE-ConnectionGUID: S/LAQcrxTjWh7+U9XqJ6+w==
X-CSE-MsgGUID: oT13ybhsQLuc9Ea7jUhm+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="205861842"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 02:14:23 -0800
Date: Mon, 19 Jan 2026 11:14:20 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: igt-dev@lists.freedesktop.org, marcin.bernatowicz@linux.intel.com,
 jakub1.kolakowski@intel.com
Subject: Re: [PATCH i-g-t] tests/intel-ci/xe.sriov-vf.blocklist: add
 xe_live_ktest
Message-ID: <20260119101420.ohuwjlqtmzv66ubm@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 igt-dev@lists.freedesktop.org, marcin.bernatowicz@linux.intel.com,
 jakub1.kolakowski@intel.com
References: <20260119092600.21586-1-lukasz.laguna@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260119092600.21586-1-lukasz.laguna@intel.com>
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

Hi Lukasz,
On 2026-01-19 at 10:26:00 +0100, Lukasz Laguna wrote:
> KUnit executes tests for every device instance bound to the driver and
> doesn't provide a way to select a specific device on which the test
> should be executed. In SR-IOV VF runs this causes KUnit tests to be
> executed on both PF and VF devices.
> 
> Block xe_live_ktest in VF runs. It should instead be executed only in VM
> runs, where only a VF device instance is present.
> 
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>

LGTM
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/intel-ci/xe.sriov-vf.blocklist.txt | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel-ci/xe.sriov-vf.blocklist.txt b/tests/intel-ci/xe.sriov-vf.blocklist.txt
> index 69d647ef08..4a19aa943d 100644
> --- a/tests/intel-ci/xe.sriov-vf.blocklist.txt
> +++ b/tests/intel-ci/xe.sriov-vf.blocklist.txt
> @@ -56,4 +56,8 @@ igt@xe_pmu@gt-frequency
>  #
>  # The feature query_cs_cycles is not supported on VF
>  #
> -igt@xe_query@.*cs-cycles
> \ No newline at end of file
> +igt@xe_query@.*cs-cycles
> +#
> +# Tests that need to be executed in VM instead.
> +#
> +igt@xe_live_ktest.*
> \ No newline at end of file
> -- 
> 2.40.0
> 
