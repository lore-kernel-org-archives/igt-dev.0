Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840BB606A31A
	for <igt-dev@archiver.kernel.org>; Thu, 22 Oct 2026 12:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=juHHRTVh
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 382161125D4;
	Thu, 22 Oct 2026 12:50:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 952BB1125D4
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Oct 2026 12:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792673396; x=1824209396;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1b5ABMVsDM4dnug8doORpkXZODRmE0CMK7SH5qX2OAQ=;
 b=juHHRTVhs9N337Qo68V9vtRbSwOuYJZgiaydm1x71iZwiD38W/sU4+C1
 u6dZQCKD88aYuemBOJQMc8xzZlATsoNL9CV7Lc/QX2ADMTK1D0BCpszOs
 7KUbdBlTfETw9QCZM8HHsK3rnW73mWKgypNwKQ0ZTnbCSDhgseYXUvYCq
 ly8UNLAje4xDBvYtYZ68xHKAPSMj4uEX0Tlu6LQ2t+4IjyIdh8fWRRX7J
 IcQiEvspjvf+F6TfTpI/g1FVnrEpDN424URO9AQ8kWt6eKjVG82cLflPg
 0vmGpta1owtEEHDjCwMYElzpDngTy8AZREh71YkHDMcsR66BJ1gJ+3xoQ w==;
X-CSE-ConnectionGUID: KKN7OyjNRNa1Jg07+Dz1hQ==
X-CSE-MsgGUID: Huqnkt+STY2lRbgjQyS9lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1318841"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1318841"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 05:49:56 -0700
X-CSE-ConnectionGUID: CIdzqcorR3GRXGmN9TnMhg==
X-CSE-MsgGUID: 0ymkUI/CT5+oE+N+wytIzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3404485"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 05:49:53 -0700
Date: Thu, 22 Oct 2026 14:49:50 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: vitaly.prosyak@amd.com
Cc: igt-dev@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH] tests/amdgpu: remove the x86 pause hint from value polling
Message-ID: <20261022124950.ysunrqufdbpq3327@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 vitaly.prosyak@amd.com, igt-dev@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20261021150044.52953-1-vitaly.prosyak@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261021150044.52953-1-vitaly.prosyak@amd.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Vitaly,
On 2026-10-21 at 11:00:27 -0400, vitaly.prosyak@amd.com wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> 
> wait_for_value64() uses nanosleep() when a polling interval is requested
> and otherwise polls until the expected value is observed or the timeout
> expires. The pause instruction is an optional x86 spin-wait hint, not a
> requirement for detecting completion or enforcing the timeout.
> 
> The original unguarded assembly was rejected by ARM/AArch64 assemblers
> in debug builds. Commit 125c0289617f guarded it, but used x86_64 and i386
> instead of the compiler predefined __x86_64__ and __i386__ macros. That
> silently excludes the hint on normal GCC x86 builds as well.
> 
> Rather than correct the guard and retain architecture-specific assembly
> for this polling helper, remove the optional hint and its guard entirely.
> Keep the nanosleep path, volatile value reads, and timeout handling
> unchanged. With no interval requested, the helper continues tight polling
> without an architecture-specific instruction.
> 
> This deliberately gives up the x86 pause optimization, which can reduce
> spin-loop power consumption and contention with an SMT sibling. It is not
> a power or performance improvement; it trades that optimization for a
> simpler polling implementation with no x86 assembly dependency. Relative
> to the existing incorrect GCC guard, the hint was already omitted.
> 
> The removed memory clobber is a compiler barrier, not a hardware memory
> fence. This change does not add or claim cross-architecture memory-ordering
> guarantees; it retains the existing volatile polling accesses.
> 
> This is an alternative to correcting the architecture macro names, not an
> additional fix to apply on top of that alternative.
> 
> ARM/AArch64 cross-compilation and GPU runtime testing were not performed.
> 
LGTM
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

PS. someone from AMD GPU devs could give r-b here.

> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> ---
>  tests/amdgpu/amd_basic.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
> index 494934c1c..590163b7b 100644
> --- a/tests/amdgpu/amd_basic.c
> +++ b/tests/amdgpu/amd_basic.c
> @@ -705,10 +705,6 @@ static int wait_for_value64(volatile uint64_t *ptr, uint64_t expected,
>  		/* Sleep if interval specified, otherwise tight loop */
>  		if (check_interval_ns > 0)
>  			nanosleep(&sleep_time, NULL);
> -#if defined(x86_64) || defined(i386)
> -		else
> -			__asm__ __volatile__("pause" ::: "memory"); /* CPU hint for spin-wait */
> -#endif
>  	}
>  }
>  
> -- 
> 2.55.0
> 
