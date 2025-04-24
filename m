Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D44E4C369AB
	for <igt-dev@archiver.kernel.org>; Thu, 24 Apr 2025 17:43:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21FF710E047;
	Thu, 24 Apr 2025 17:43:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aT499GSo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DDDF10E047
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Apr 2025 17:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745516632; x=1777052632;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nCH5Tn1U/A4jA85sewxH59rTJjYnYejhHysjLDxZCe8=;
 b=aT499GSoezFycw52d8VWNrzz5XV7/nGT/MfoE96R+4u2EEmttVJegOsb
 SA0UBv+wdaBBa+a4cqIOz47wM6NHmSteOjuzeZVXLKuRmNSEyavcAqgs0
 pL9aKnOc+lrddS5q2jegpZk/44KvKQetgbml6sCs+rKvs3qb3x03uQ6Ng
 43RPBTmZSOTCVg6+AqLDyiB6gssyAzmtZ0dz6d2b+SXeHjXKdgBGVsrpS
 spyBmGGh5BRNnOgSA52MnfBhIcXYaaKFheDqwUn9WZQbu32yaqFHvVHKy
 gvj3DzOX0mRh9daZiBwx8udOUUkub8WzRqXNoItW8iWL5ERVeL4BLEJ/k A==;
X-CSE-ConnectionGUID: ghsv3IHxTTKEDAZ+VDTyZw==
X-CSE-MsgGUID: 15hnZN3wRTytv+oQtDfEgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="69656787"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="69656787"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 10:43:52 -0700
X-CSE-ConnectionGUID: jkoeNHzOTiyGiH+vPQNgkw==
X-CSE-MsgGUID: CZPWL6SeRaKZdkN9yi1sgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="169899959"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 10:43:51 -0700
Date: Thu, 24 Apr 2025 19:43:48 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: igt-dev@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH i-g-t 1/3] tests/intel: replace div64_u64_round_up() with
 DIV_ROUND_UP
Message-ID: <20250424174348.fn2leeoegkpr75pf@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>,
 igt-dev@lists.freedesktop.org,
 Matt Roper <matthew.d.roper@intel.com>
References: <20250416163053.117425-1-shuicheng.lin@intel.com>
 <20250416163053.117425-2-shuicheng.lin@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250416163053.117425-2-shuicheng.lin@intel.com>
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

Hi Shuicheng,
On 2025-04-16 at 16:30:51 +0000, Shuicheng Lin wrote:
> DIV_ROUND_UP is defined in igt_aux.h with the same function as
> div64_u64_round_up().
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  tests/intel/gem_exec_balancer.c |  9 ++-------
>  tests/intel/gem_exec_fair.c     | 11 +++--------
>  tests/intel/gem_exec_schedule.c |  9 ++-------
>  tests/intel/gem_watchdog.c      |  9 ++-------
>  4 files changed, 9 insertions(+), 29 deletions(-)
> 
> diff --git a/tests/intel/gem_exec_balancer.c b/tests/intel/gem_exec_balancer.c
> index 46ea19a2a..1ad87036b 100644
> --- a/tests/intel/gem_exec_balancer.c
> +++ b/tests/intel/gem_exec_balancer.c
> @@ -2636,15 +2636,10 @@ static int read_ctx_timestamp_frequency(int i915)
>  	return value;
>  }
>  
> -static uint64_t div64_u64_round_up(uint64_t x, uint64_t y)
> -{
> -	return (x + y - 1) / y;
> -}
> -
>  static uint64_t ticks_to_ns(int i915, uint64_t ticks)
>  {
> -	return div64_u64_round_up(ticks * NSEC_PER_SEC,
> -				  read_ctx_timestamp_frequency(i915));
> +	int f = read_ctx_timestamp_frequency(i915);

s/int/unsigned int/

Add also an empty line here. Please use checkpatch.pl script
from Linux kernel to spot such and other issues, you could also
look into CONTRIBUTING.md for script options.

Apply same in other places.

Regards,
Kamil

> +	return DIV_ROUND_UP(ticks * NSEC_PER_SEC, f);
>  }
>  
>  static void __fairslice(int i915,
> diff --git a/tests/intel/gem_exec_fair.c b/tests/intel/gem_exec_fair.c
> index 19df66921..cdceb8927 100644
> --- a/tests/intel/gem_exec_fair.c
> +++ b/tests/intel/gem_exec_fair.c
> @@ -187,23 +187,18 @@ static int read_timestamp_frequency(int i915)
>  	return value;
>  }
>  
> -static uint64_t div64_u64_round_up(uint64_t x, uint64_t y)
> -{
> -	return (x + y - 1) / y;
> -}
> -
>  static uint64_t ns_to_ctx_ticks(int i915, uint64_t ns)
>  {
>  	int f = read_timestamp_frequency(i915);
>  	if (intel_gen(intel_get_drm_devid(i915)) == 11)
>  		f = 12500000; /* gen11!!! are you feeling alright? CTX vs CS */
> -	return div64_u64_round_up(ns * f, NSEC64);
> +	return DIV_ROUND_UP(ns * f, NSEC64);
>  }
>  
>  static uint64_t ticks_to_ns(int i915, uint64_t ticks)
>  {
> -	return div64_u64_round_up(ticks * NSEC64,
> -				  read_timestamp_frequency(i915));
> +	int f = read_timestamp_frequency(i915);
> +	return DIV_ROUND_UP(ticks * NSEC64, f);
>  }
>  
>  static void delay(int i915,
> diff --git a/tests/intel/gem_exec_schedule.c b/tests/intel/gem_exec_schedule.c
> index 84219b4cf..1055e8501 100644
> --- a/tests/intel/gem_exec_schedule.c
> +++ b/tests/intel/gem_exec_schedule.c
> @@ -3031,15 +3031,10 @@ static int read_timestamp_frequency(int i915)
>  	return value;
>  }
>  
> -static uint64_t div64_u64_round_up(uint64_t x, uint64_t y)
> -{
> -	return (x + y - 1) / y;
> -}
> -
>  static uint64_t ticks_to_ns(int i915, uint64_t ticks)
>  {
> -	return div64_u64_round_up(ticks * NSEC_PER_SEC,
> -				  read_timestamp_frequency(i915));
> +	int f = read_timestamp_frequency(i915);
> +	return DIV_ROUND_UP(ticks * NSEC_PER_SEC, f);
>  }
>  
>  static int cmp_u32(const void *A, const void *B)
> diff --git a/tests/intel/gem_watchdog.c b/tests/intel/gem_watchdog.c
> index 1edde8b3c..4cb92c68e 100644
> --- a/tests/intel/gem_watchdog.c
> +++ b/tests/intel/gem_watchdog.c
> @@ -289,11 +289,6 @@ static unsigned int offset_in_page(void *addr)
>  	return (uintptr_t)addr & 4095;
>  }
>  
> -static uint64_t div64_u64_round_up(uint64_t x, uint64_t y)
> -{
> -	return (x + y - 1) / y;
> -}
> -
>  static int read_timestamp_frequency(int i915)
>  {
>  	int value = 0;
> @@ -307,8 +302,8 @@ static int read_timestamp_frequency(int i915)
>  
>  static uint64_t ns_to_ticks(int i915, uint64_t ns)
>  {
> -	return div64_u64_round_up(ns * read_timestamp_frequency(i915),
> -				  NSEC_PER_SEC);
> +	int f = read_timestamp_frequency(i915);
> +	return DIV_ROUND_UP(ns * f, NSEC_PER_SEC);
>  }
>  
>  static uint32_t __batch_create(int i915, uint32_t offset)
> -- 
> 2.25.1
> 
