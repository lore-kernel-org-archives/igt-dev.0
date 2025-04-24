Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2DF2C369AB
	for <igt-dev@archiver.kernel.org>; Thu, 24 Apr 2025 17:39:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93DC310E052;
	Thu, 24 Apr 2025 17:39:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FewBTbIL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1A9610E052
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Apr 2025 17:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745516389; x=1777052389;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=78MKpD/ijT+RAMw1Yt3W6C0t5PXj/1qZKe7zqlAv62k=;
 b=FewBTbILlOwWqyajxQX4vsZvFlmLE6KZKEU/E/D3dQ0kJQBoOS/ZoAjw
 zoHYPhURf/pzxNBIyhvRzoC9ZVnUiaqOP+p/XTXiTKoM3DZRoM92xD33f
 hH4/4exfTo7AT3YXAj9R9z5tSzH8fMCg7uiUHxU2bzwDhFWkNrAeJaGuR
 a/U00lhnu7FpgLwKnt/8q55SPWbmxqevw64LX16y/RZZYQS8IEWxu3K7q
 DdeskeZ3dlqlgMkaw8TqWwCYtQaejj9YsKjLAF7JWWsZ2AJ9nYyaTzAid
 AypfswIvH5zpDS1ZP94xyd2pFhdoUtsLpHTHplNi7/j+FSujfBXkgQqGH Q==;
X-CSE-ConnectionGUID: ZDyk03+MRAaoNANJ/Z9wiA==
X-CSE-MsgGUID: 7GVkHlJNT+CsedEBW6uRdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="64581989"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="64581989"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 10:39:49 -0700
X-CSE-ConnectionGUID: Y/SLNn4JRWyayzq/r30PEA==
X-CSE-MsgGUID: o1kRqRwEQrO/hnSdHUTF+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="137481648"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 10:39:47 -0700
Date: Thu, 24 Apr 2025 19:39:44 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: igt-dev@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH i-g-t 2/3] lib/xe: replace div64_u64_round_up() with
 DIV_ROUND_UP
Message-ID: <20250424173944.s35q2xkfk3ltik4d@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>,
 igt-dev@lists.freedesktop.org,
 Matt Roper <matthew.d.roper@intel.com>
References: <20250416163053.117425-1-shuicheng.lin@intel.com>
 <20250416163053.117425-3-shuicheng.lin@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250416163053.117425-3-shuicheng.lin@intel.com>
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
On 2025-04-16 at 16:30:52 +0000, Shuicheng Lin wrote:
> DIV_ROUND_UP is defined in igt_aux.h with the same function as
> div64_u64_round_up().

Version in igt_aux.h is different then one below.

> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  lib/xe/xe_util.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
> index 06b378ce0..9907c8b16 100644
> --- a/lib/xe/xe_util.c
> +++ b/lib/xe/xe_util.c
> @@ -253,14 +253,6 @@ static uint32_t reference_clock(int fd, int gt_id)
>  	return refclock;
>  }
>  
> -static uint64_t div64_u64_round_up(const uint64_t x, const uint64_t y)
> -{
> -	igt_assert(y > 0);
> -	igt_assert_lte_u64(x, UINT64_MAX - (y - 1));

I like those two asserts here, why not moving this function to
lib igt_aux.c and creating new macro for it?

#define DIV64_ROUND_UP(n, d) div64_u64_round_up((uint64_t)(n), (uint64_t)(d))

or make it a multi-line macro with do { ... } while(0)

Regards,
Kamil

> -
> -	return (x + y - 1) / y;
> -}
> -
>  /**
>   * xe_nsec_to_ticks: convert time in nanoseconds to timestamp ticks
>   * @fd: opened device
> @@ -273,5 +265,5 @@ uint32_t xe_nsec_to_ticks(int fd, int gt_id, uint64_t nsec)
>  {
>  	uint32_t refclock = reference_clock(fd, gt_id);
>  
> -	return div64_u64_round_up(nsec * refclock, NSEC_PER_SEC);
> +	return DIV_ROUND_UP(nsec * refclock, NSEC_PER_SEC);
>  }
> -- 
> 2.25.1
> 
