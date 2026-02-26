Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF1E3FC5910
	for <igt-dev@archiver.kernel.org>; Thu, 26 Feb 2026 09:05:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80EE010E075;
	Thu, 26 Feb 2026 09:05:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nmndX3o0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B84B10E075
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Feb 2026 09:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772096713; x=1803632713;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=zwl38osgYSk8ova/wZn7TQsQFVMQyFAZnbtREZ1/olI=;
 b=nmndX3o09Y7bNaROm8uCD8jZPO8V6u+PG8SvyILX+/5sJS2IhLXRD7Uc
 98+VZ7L8sqSJC8ftxEsS8rL5/8J3xLHXxQFTh7lbgmbUTnTuMJLooOtwK
 iE/k+tQnlbLA0JFViOBeXnzJDGS6FQBYxKJD1hkhFEnrIKWHI7ph5oLPx
 cydJtwj0YtviS+36jf/Pu3mmss8HPFG7BGdPw1RIpRLXF+R21Ngio2rzd
 PvVxksqbD+fZLKHzU29w01wFdn0EOqg39P38nmRX0xslDIC5+m++ssUlT
 Hw5vYZEqNSDPtGpa1ujlZeXVNfWoajeKB27UKkFMzCBZC+XLw1IVO+LqI g==;
X-CSE-ConnectionGUID: qYqieZ6zQFKk0Btpi4FtYQ==
X-CSE-MsgGUID: Ljk7JOgjTvy9Pkk0kAoqpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73024853"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="73024853"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 01:05:12 -0800
X-CSE-ConnectionGUID: ccr5YZCDROWbTGQzomCEsA==
X-CSE-MsgGUID: IjJIFBmrRdaHMyQ0E8y+AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="239500244"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 01:05:10 -0800
Date: Thu, 26 Feb 2026 10:05:08 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 4/4] tests/xe_compute: Use appropriate feature in
 compute-square tests
Message-ID: <20260226090508.i5y6qyprdusareza@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260225194421.2544088-6-zbigniew.kempczynski@intel.com>
 <20260225194421.2544088-10-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260225194421.2544088-10-zbigniew.kempczynski@intel.com>
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

Hi Zbigniew,
On 2026-02-25 at 20:44:26 +0100, Zbigniew Kempczyński wrote:
> Test is doing compute-square calculation so pick 'Compute' instead
> of 'WMTP' is better choice.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/intel/xe_compute.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
> index d7e3c59084..45c9c1b536 100644
> --- a/tests/intel/xe_compute.c
> +++ b/tests/intel/xe_compute.c
> @@ -495,8 +495,8 @@ test_eu_busy(uint64_t duration_sec)
>  
>  /**
>   * SUBTEST: compute-square
> - * Mega feature: WMTP
> - * Sub-category: wmtp tests
> + * Mega feature: Compute
> + * Sub-category: compute tests
>   * Functionality: OpenCL kernel
>   * GPU requirement: TGL, PVC, LNL, PTL
>   * Description:
> -- 
> 2.43.0
> 
