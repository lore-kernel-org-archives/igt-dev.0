Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BDD4C982F1
	for <igt-dev@archiver.kernel.org>; Tue, 22 Sep 2026 09:52:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2727910E46A;
	Tue, 22 Sep 2026 09:52:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lSj0kgLW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A61E10E476
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Sep 2026 09:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790070692; x=1821606692;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=93eoTZ3lMdK4xaNsxmrH4lEjN7G2gdZzSZ0DPaRIOfQ=;
 b=lSj0kgLWx3ct7n2nvzNkmy0bffZw4NPDrhby65rloj9glFmRYLSyHB9B
 6R3XqMeRA3J84YpCKeQSVyjSlPoyifKEURMwyeG4ZOxQOryhWJVDZQ+A7
 xSdeQFNch4ChHNe+KZRIAlQNBXweoXOXxKc1qng0Ei3t1cfFpFdcUVwMY
 yxNrJQ0z5HlvyJ3pR0hOD+Y54ap1KjxJte8Zcx7YU80FCdejSSdAs5zhB
 DDWQotd9iVTE3j4VWnOurP/52w81j/h6LavPnkOVl9b1feQRxK6hYrt6Q
 TRkpb+ndSjInTgq1UMW+odLjqGl99JloYNuART8q7FfAJUarS7LroOQZl A==;
X-CSE-ConnectionGUID: 8h098/KKSQyNTC6Ykf7f6g==
X-CSE-MsgGUID: hk2S+Q6SRaCfK1riSwFUbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="90774685"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="90774685"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 02:51:32 -0700
X-CSE-ConnectionGUID: +FD8uk6jSQyp2wQnFZGN4w==
X-CSE-MsgGUID: obws2x9YTOSensrp5Tb+6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="4046246"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 02:51:30 -0700
Date: Tue, 22 Sep 2026 11:51:12 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: shivtej.eknath.patil@intel.com
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 nishit.sharma@intel.com, smitha.balasubramanyam@intel.com,
 ramadevi.gandi@intel.com
Subject: Re: [PATCH v2] intel-ci: blocklist multi-queue tests on BMG, LNL,
 PTL and WCL
Message-ID: <20260922095112.zx5r53n6iv746mjf@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 shivtej.eknath.patil@intel.com, igt-dev@lists.freedesktop.org,
 kamil.konieczny@intel.com, nishit.sharma@intel.com,
 smitha.balasubramanyam@intel.com, ramadevi.gandi@intel.com
References: <20260922051921.24701-1-shivtej.eknath.patil@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260922051921.24701-1-shivtej.eknath.patil@intel.com>
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

Hi Shivtej,
On 2026-09-22 at 05:19:21 +0000, shivtej.eknath.patil@intel.com wrote:
> From: Shivtej Patil <shivtej.eknath.patil@intel.com>
> 
> The multi-queue subtests require xe_has_multi_queue_engine(fd).
> On BMG, LNL, PTL and WCL platforms these tests are expected to skip because
> multi-queue engine support is not available.
> 
> Add blocklist entries to suppress expected CI failures.
> 

These are non-NVL so should be ok but please wait for ack from Rama

LGTM
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

+cc Ramadevi Gandi <ramadevi.gandi@intel.com>

> Signed-off-by: Shivtej Patil <shivtej.eknath.patil@intel.com>
> ---
>  tests/intel-ci/xe.bmg.core.blocklist.txt |  8 +++++---
>  tests/intel-ci/xe.lnl.core.blocklist.txt |  8 +++++---
>  tests/intel-ci/xe.ptl.core.blocklist.txt | 10 +++++-----
>  3 files changed, 15 insertions(+), 11 deletions(-)
> 
> diff --git a/tests/intel-ci/xe.bmg.core.blocklist.txt b/tests/intel-ci/xe.bmg.core.blocklist.txt
> index cd38d16f8..84f401570 100644
> --- a/tests/intel-ci/xe.bmg.core.blocklist.txt
> +++ b/tests/intel-ci/xe.bmg.core.blocklist.txt
> @@ -41,10 +41,7 @@ igt@xe_vm@.*export.*
>  ##################################################################
>  # Tests not applicable for the platform
>  ##################################################################
> -igt@xe_exec_multi_queue@.*
>  igt@xe_evict@.*multi(-)?queue.*
> -igt@.*@.*-multi_queue
> -igt@.*@.*multi-queue.*
>  ##################################################################
>  # Expected skips, Kernel support not available
>  ##################################################################
> @@ -80,3 +77,8 @@ igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add
>  ##################################################################
>  igt@xe_pm@d3hot-i2c
>  ##################################################################
> +# Expected skip on BMG due to unsupported multi-queue capability
> +# Multi-queue is not supported on platforms older than xe3p
> +##################################################################
> +igt@.*multi.queue.*
> +##################################################################
> diff --git a/tests/intel-ci/xe.lnl.core.blocklist.txt b/tests/intel-ci/xe.lnl.core.blocklist.txt
> index c830ac3c8..67f8ad8df 100644
> --- a/tests/intel-ci/xe.lnl.core.blocklist.txt
> +++ b/tests/intel-ci/xe.lnl.core.blocklist.txt
> @@ -84,9 +84,6 @@ igt@xe_vm@.*export.*
>  # Tests not applicable for the platform
>  ##################################################################
>  igt@xe_evict@.*multiqueue.*
> -igt@xe_exec_multi_queue@.*
> -igt@.*@.*-multi_queue
> -igt@.*@.*multi-queue.*
>  ##################################################################
>  # Kernel support not available
>  ##################################################################
> @@ -108,3 +105,8 @@ igt@xe_module_load@force-load
>  #################################################################
>  igt@xe_pm@d3hot-i2c
>  ##################################################################
> +# Expected skip on LNL due to unsupported multi-queue capability
> +# Multi-queue is not supported on platforms older than xe3p
> +##################################################################
> +igt@.*multi.queue.*
> +##################################################################
> diff --git a/tests/intel-ci/xe.ptl.core.blocklist.txt b/tests/intel-ci/xe.ptl.core.blocklist.txt
> index 362711406..35def6ffe 100644
> --- a/tests/intel-ci/xe.ptl.core.blocklist.txt
> +++ b/tests/intel-ci/xe.ptl.core.blocklist.txt
> @@ -65,11 +65,6 @@ igt@xe_pm@d3hot-i2c
>  igt@xe_compute@ccs-mode-basic
>  igt@xe_compute@ccs-mode-compute-kernel
>  #################################################################
> -# Tests not applicable for the platform
> -##################################################################
> -igt@xe_exec_multi_queue@.*
> -igt@.*@.*multi-queue.*
> -##################################################################
>  # Expected skips as the tests are not supported on PTL
>  ##################################################################
>  igt@xe_access_counter@.*
> @@ -91,3 +86,8 @@ igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add
>  ##################################################################
>  igt@.*survivability.*
>  #################################################################
> +# Expected skip on PTL/WCL due to unsupported multi-queue capability
> +# Multi-queue is not supported on platforms older than xe3p
> +##################################################################
> +igt@.*multi.queue.*
> +##################################################################
> -- 
> 2.43.0
> 
