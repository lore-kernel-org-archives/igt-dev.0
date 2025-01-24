Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D107C02181
	for <igt-dev@archiver.kernel.org>; Fri, 24 Jan 2025 14:00:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB7D910E0DD;
	Fri, 24 Jan 2025 14:00:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oEQ1A8Bj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 136EE10E0DD
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jan 2025 14:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737727227; x=1769263227;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=eW8y0iqUEAE76W/LFv+vVeWa66IoB6faBr7jtX5Yh/k=;
 b=oEQ1A8BjC/Qw6iQm6dW1fiZjKDV3ojfEeyZOV6YyOfWbZ08NSxZaq1QD
 fEXMP74See2y6m1WYr9YAY44VqmSsbLf0aoAc1IW8toFuqq8Md6M7hDxq
 cz7tvB3uGFNdr23J2almII9GKxDRGkBy0V48qYX7GlYL7rMWmMYDU4xL7
 mE1LDPxu8W5Gcz0a1jAtJR68bRqYqKp4/KGYSUrtftALrmhHDR7NoN8ys
 RK++afEAzIHT5Vaada2KgaELVdGoNK65MAi/lySWVRCuEvFtA8l7xHOII
 pAsDYDeAk9zh9Aw3UWo4V51rtqHxOY4ZekQ1+j+k3XP7scDId5fMEYUab w==;
X-CSE-ConnectionGUID: Rg85N4uKTt2HQOTPFcrVnw==
X-CSE-MsgGUID: Vnpu2aIJRFu2FcLzi4ZzHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="38140771"
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; d="scan'208";a="38140771"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2025 06:00:27 -0800
X-CSE-ConnectionGUID: vVlfCWF8SHWkd0qzjyinCQ==
X-CSE-MsgGUID: fY2BCAiWTXK7xMFN4VDFOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="108204204"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 06:00:25 -0800
Date: Fri, 24 Jan 2025 15:00:13 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 jordan.l.justen@intel.com, christoph.manszewski@intel.com
Subject: Re: [PATCH i-g-t 2/3] tests/intel/xe_eudebug_online: Fix 32b
 compilation warnings
Message-ID: <20250124140013.cz2wt4mg3iz6dmdp@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 jordan.l.justen@intel.com, christoph.manszewski@intel.com
References: <20250122144419.327706-1-dominik.grzegorzek@intel.com>
 <20250122144419.327706-2-dominik.grzegorzek@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250122144419.327706-2-dominik.grzegorzek@intel.com>
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

Hi Dominik,
On 2025-01-22 at 15:44:18 +0100, Dominik Grzegorzek wrote:
> Fix all debug prints which were causing compilation warnings for 32b
> archs.
> 
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/xe_eudebug_online.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
> index f532387af..1a146d8c4 100644
> --- a/tests/intel/xe_eudebug_online.c
> +++ b/tests/intel/xe_eudebug_online.c
> @@ -569,7 +569,7 @@ static void get_aips_offset_table(struct online_debug_data *data, int threads)
>  
>  	igt_debug("AIPs offset table:\n");
>  	for (int i = 0; i < threads; i++)
> -		igt_debug("%lx\n", data->aips_offset_table[i]);
> +		igt_debug("%" PRIx64 "\n", data->aips_offset_table[i]);
>  }
>  
>  static int get_stepped_threads_count(struct online_debug_data *data, int threads)
> @@ -2328,11 +2328,11 @@ static void test_many_sessions_on_tiles(int fd, bool multi_tile)
>  
>  		if (multi_tile)
>  			igt_assert_f(diff < WORKLOAD_DELAY_US,
> -				     "Expected to execute workloads concurrently. Actual delay: %lu ms\n",
> +				     "Expected to execute workloads concurrently. Actual delay: %" PRIu64 " ms\n",
>  				     diff);
>  		else
>  			igt_assert_f(diff >= WORKLOAD_DELAY_US,
> -				     "Expected a serialization of workloads. Actual delay: %lu ms\n",
> +				     "Expected a serialization of workloads. Actual delay: %" PRIu64 " ms\n",
>  				     diff);
>  	}
>  
> -- 
> 2.34.1
> 
