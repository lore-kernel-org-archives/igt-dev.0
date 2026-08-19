Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E01C5DF85
	for <igt-dev@archiver.kernel.org>; Wed, 19 Aug 2026 16:07:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE6A710E173;
	Wed, 19 Aug 2026 16:07:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PKzDJPLI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C1F310EE53
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Aug 2026 16:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787155604; x=1818691604;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/q9mUPyHAk6biyCckLjipdgZcyb6CHFYRhYBlEPXq5U=;
 b=PKzDJPLIOTwf/K62CCVyxGWL6BNGjtOdKzMGc3+exJp7fqWhlXYKup8+
 IorNS0w7NjyWAZxgWHlrliQnyLb/mX0BsyRXPmsJZKmXEbueP6mmmuWXl
 4NZkAit+FbQZu5EkFhUdQyPgMkwZ/IzZ1A1+e8nLp2w8niWetXCpYZua5
 o+3E6mbgCCLSqXqK2vwH5Zp2Uw9hXGZ9fb1CUSp3WOLkgdOLu9nvdvQ+t
 8Tvg2lU0XaPqRWqEwgzDyqFwiZa+22/cW6IJG4CfKvIKOOdz0Zub3a23R
 8lBj+pXnQPXygqfM3FbARFhsw8JpN0OMeqB0zDK30l1Awq5yRvOD49h06 Q==;
X-CSE-ConnectionGUID: jCLi0HM7SXKHHUK8xvcZdw==
X-CSE-MsgGUID: cfrA0//aSjuCPu2IXLl0pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="87694838"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="87694838"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 09:03:19 -0700
X-CSE-ConnectionGUID: +K+RtYNYTNeX1d/gd8T1jA==
X-CSE-MsgGUID: JSnbbxx0Rw2SiskkgL4AXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="265142296"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 09:03:17 -0700
Date: Wed, 19 Aug 2026 18:03:14 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com
Subject: Re: [PATCH v1 2/2] tests/intel/xe_exec_system_allocator: use correct
 DONTNEED test flag
Message-ID: <20260819160314.7njaihohsu55lbvv@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 nishit.sharma@intel.com, igt-dev@lists.freedesktop.org,
 kamil.konieczny@intel.com
References: <20260819145302.18068-1-nishit.sharma@intel.com>
 <20260819145302.18068-3-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260819145302.18068-3-nishit.sharma@intel.com>
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

Hi Nishit,
On 2026-08-19 at 14:53:01 +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 
> Test now using correct flag (USE_MADV_DONTNEED) instead of the libc
> MADV_DONTNEED constant. Both USE_MADV_DONTNEED and MADV_DONTNEED have
> value 4 and went unnoticable.
> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  tests/intel/xe_exec_system_allocator.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index 476470be7..305512dfd 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -2337,7 +2337,7 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size,
>  	xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, 0, FIVE_SEC);
>  
>  	env.loop_count = (flags & TOUCH_ONCE) ? 1 : env.array_size;
> -	env.skip_results_check = !(flags & ACCESS_DEVICE_HOST) || (flags & MADV_DONTNEED);
> +	env.skip_results_check = !(flags & ACCESS_DEVICE_HOST) || (flags & USE_MADV_DONTNEED);

Good catch, maybe flags should have TEST_FLAG_ prefix?
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

>  	env.vm = vm;
>  
>  	read_gt_stats_snapshot(fd, eci, &stats_before);
> -- 
> 2.43.0
> 
