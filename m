Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F737CA1007
	for <igt-dev@archiver.kernel.org>; Wed,  3 Sep 2025 06:45:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5B8610E182;
	Wed,  3 Sep 2025 06:45:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EYCuqP7c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 605F610E190
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Sep 2025 06:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756881943; x=1788417943;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ItzI8B2/c0SyfFAX3EF9FqsviU6tKR3zGd6FvhdVCWA=;
 b=EYCuqP7cXdJb9l0vnMzaM3H4DtIdQOvQQETE0tiuN5G3SoDznhu+3aEz
 ILmQWFtg9rJBMAR/iFrJbTtD8J3JA9MZTk9dTbHfcAIsEdPW6XjvyGo+v
 XZBiIBX5EfBO1uH79gRofN7yfovbaDXglh4pmTT+1g+99V4Vgaz+9mYVX
 dFdWef9ntAgG1RV11YB02O6TyPCQ9pVGSZj7T120gDyfaXie/EMWP2q7o
 xEmCcUlWx94HB6IAJygOpfFkTgwLmKeHml0WnrakUbac8BODz0M8AT2nS
 YTY/4bbl7ME2qVYNMdPk7BN+wuz0E7/wPcuGEo+GsOokE64JmTBkVHq/q g==;
X-CSE-ConnectionGUID: QD9PHSeNRoOgJ/pPyKr9mQ==
X-CSE-MsgGUID: r6R4pNd7QLa/F/Bjvug21A==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="58882966"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="58882966"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 23:45:42 -0700
X-CSE-ConnectionGUID: 3p82B+pbRBiNFpugdl/c7g==
X-CSE-MsgGUID: 9EPOTz84ScGgDNDm7/C3ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="195140872"
Received: from inaky-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.245.245.167])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 23:45:40 -0700
Date: Wed, 3 Sep 2025 08:45:37 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: Re: [PATCH i-g-t 1/7] lib/intel_allocator_simple: Introduce
 alloc_debug and alloc_info
Message-ID: <c4w6gdp5dd5q6pxphhbl3puslywkzj6jfglqwcxjztrk7yksja@4llucukcq7wo>
References: <20250902123203.4907-1-dominik.karol.piatkowski@intel.com>
 <20250902123203.4907-2-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250902123203.4907-2-dominik.karol.piatkowski@intel.com>
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

On Tue, Sep 02, 2025 at 02:31:57PM +0200, Dominik Karol Piątkowski wrote:
> Introduce alloc_debug and alloc_info from intel_allocator.c and use it
> in intel_allocator_simple_is_empty. This allows for deadlock avoidance
> in xe_eudebug_online@set-breakpoint-sigint-debugger caused by sporadic
> timing of SIGINT during igt_vlog.

What about other places where igt_info/debug are in use? According to
above we decrease probability of deadlock, but not eliminating it.

--
Zbigniew

> 
> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> ---
>  lib/intel_allocator_simple.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/intel_allocator_simple.c b/lib/intel_allocator_simple.c
> index 25b92db11..820ce042a 100644
> --- a/lib/intel_allocator_simple.c
> +++ b/lib/intel_allocator_simple.c
> @@ -11,6 +11,13 @@
>  #include "intel_bufops.h"
>  #include "igt_map.h"
>  
> +#ifdef ALLOCDBG
> +#define alloc_info igt_info
> +#define alloc_debug igt_debug
> +#else
> +#define alloc_info(...) {}
> +#define alloc_debug(...) {}
> +#endif
>  
>  /* Avoid compilation warning */
>  struct intel_allocator *
> @@ -610,10 +617,10 @@ static bool intel_allocator_simple_is_empty(struct intel_allocator *ial)
>  {
>  	struct intel_allocator_simple *ials = ial->priv;
>  
> -	igt_debug("<ial: %p, fd: %d> objects: %" PRId64
> -		  ", reserved_areas: %" PRId64 "\n",
> -		  ial, ial->fd,
> -		  ials->allocated_objects, ials->reserved_areas);
> +	alloc_debug("<ial: %p, fd: %d> objects: %" PRId64
> +		    ", reserved_areas: %" PRId64 "\n",
> +		    ial, ial->fd,
> +		    ials->allocated_objects, ials->reserved_areas);
>  
>  	return !ials->allocated_objects && !ials->reserved_areas;
>  }
> -- 
> 2.34.1
> 
