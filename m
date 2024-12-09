Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3341E7717D
	for <igt-dev@archiver.kernel.org>; Mon,  9 Dec 2024 17:52:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9029710E4E8;
	Mon,  9 Dec 2024 17:52:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WitRGHRd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D92D10E4E8
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Dec 2024 17:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733766754; x=1765302754;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=P8nVWCMyetNTYH23SQiieYvGPV4qLQvr9LpcZeFGlMs=;
 b=WitRGHRdu8xu2x/L5+ygFfKphruoUA9FV8Vs/VGZEtZa1c7qtMEyexKj
 oNaa0lbD74WxJDzoRh7a6CPh1orP/WhUdtEagMmEXNFgyv0ndtNXQ06rq
 O293BIfe++uXsH7cdiWCsLYqcM9HarM7TtD8XC2u0fdsl4i2AeHhyJryk
 6tbCi++8ibS1yqigsB6k4CKCyWXY487iotTcw0+cR+Mh7wUlft+96B8pq
 +1vPwc2pn/d4dpJhQ+LTfTEXPj2rSVhfkZIjbsVVbPwhliIfZKuPrOe35
 VqnCLr2WEQsE9E2OPQuuEmnGEiA06sYoVgJJJUtctQGFKYToOwjCmhG45 Q==;
X-CSE-ConnectionGUID: zsEbJO2+RNCdT/3iNt4iog==
X-CSE-MsgGUID: 3MP+JGkdTB2J4HKfk4YAZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="33991923"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; d="scan'208";a="33991923"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 09:52:33 -0800
X-CSE-ConnectionGUID: Vs2KlyvXTH28Y8L4z5EZAg==
X-CSE-MsgGUID: JwDvHkuGRh+FDvDRZl/aSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; d="scan'208";a="95216874"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 09:52:31 -0800
Date: Mon, 9 Dec 2024 18:52:28 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/1] tests/intel: Adjust test documentation to
 given standard
Message-ID: <20241209175228.hk63z7vtjdehmpas@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20241209080546.557032-1-katarzyna.piecielska@intel.com>
 <20241209080546.557032-2-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241209080546.557032-2-katarzyna.piecielska@intel.com>
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

Hi Katarzyna,
On 2024-12-09 at 08:05:46 +0000, Katarzyna Piecielska wrote:
> Change Category for:
>  * tests/intel/xe_exec_sip.c
>  * tests/intel/xe_tlb.c
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/xe_exec_sip.c | 8 ++++----
>  tests/intel/xe_tlb.c      | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_sip.c b/tests/intel/xe_exec_sip.c
> index 91c8df161..062b80a08 100644
> --- a/tests/intel/xe_exec_sip.c
> +++ b/tests/intel/xe_exec_sip.c
> @@ -5,12 +5,12 @@
>  
>  /**
>   * TEST: Tests for GPGPU shader and system routine (SIP) execution
> - * Category: Software building block
> - * Description: Exercise interaction between GPGPU shader and system routine
> - *              (SIP), which should handle exceptions raised on Execution Unit.
> - * Functionality: system routine
> + * Category: Core
>   * Mega feature: Compute
>   * Sub-category: GPGPU tests
> + * Functionality: system routine
> + * Description: Exercise interaction between GPGPU shader and system routine
> + *              (SIP), which should handle exceptions raised on Execution Unit.
>   * Test category: functionality test
>   */
>  
> diff --git a/tests/intel/xe_tlb.c b/tests/intel/xe_tlb.c
> index 8104e45d8..9b920fe8a 100644
> --- a/tests/intel/xe_tlb.c
> +++ b/tests/intel/xe_tlb.c
> @@ -15,7 +15,7 @@
>  
>  /**
>   * TEST: Check Translation Lookaside Buffer Invalidation.
> - * Category: Software building block
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: TLB invalidate
> -- 
> 2.34.1
> 
