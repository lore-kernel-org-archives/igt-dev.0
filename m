Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44501C36010
	for <igt-dev@archiver.kernel.org>; Tue,  1 Apr 2025 15:17:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8A1A10E5D6;
	Tue,  1 Apr 2025 15:17:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qt/1pVC+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D82410E5D6
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Apr 2025 15:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743520662; x=1775056662;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=t2LvG0Imp/LCtE01HbqZ/9wdNdvqD22AZ1eYNKxI73w=;
 b=Qt/1pVC+c3tjjLxKim5+a9Gx7olAqWPsy1Hom7PwixHy+F8Jix9ml3Vj
 d8LyI9yZkjXryezUiHZKRKC8QV/OuivdRrwRGEqaGLVTswf1t2i3bGVsT
 JRmauiFdwtHbXLifdMupddLyWiRSTjxDzQXXJpsd0RN4T1AK2si8/5Fek
 D1x7CCOxCE2uOwCyQxf83O5AodHm41tUYxrlkwExheP+XwzfL9yh4ZNuX
 bsWQHnJWlYrVFf44Hhrx0+cyy4NL5lmheYBaAQW2cZO0Wht3Ikm3/nE2H
 cuXx8/7ILbczFipDjZk5MmGiT1cl90G+jabAqBpssfWT9BFdDV0q5xtjD g==;
X-CSE-ConnectionGUID: kCONL6zoRVq7bJgKxTrhVw==
X-CSE-MsgGUID: JKM+YEiZTTea6PPUC6FhUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="67321898"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="67321898"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 08:17:42 -0700
X-CSE-ConnectionGUID: eE+rAFdpSGOQe7nmUZJdpA==
X-CSE-MsgGUID: h0jiYazOTcWZfA8lVY/0Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="131616112"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 08:17:41 -0700
Date: Tue, 1 Apr 2025 17:17:38 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/intel/perf_pmu: Remove invalid_init test for
 cpu
Message-ID: <20250401151738.zt2336jng5rsujkv@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250325135906.755368-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250325135906.755368-1-lucas.demarchi@intel.com>
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

Hi Lucas,
On 2025-03-25 at 06:59:06 -0700, Lucas De Marchi wrote:
> Passing a CPU other than the cpumask should not be considered invalid.
> Since our perf-pmu has a system-wide event, it can actually be read from
> any CPU in the system, not only the one advertised in the cpumask.
> 
> See https://lore.kernel.org/all/25bc2cb3-f0ab-4e64-b331-98f52cce9a99@linux.intel.com/
> and https://lore.kernel.org/all/20240802151643.1691631-3-kan.liang@linux.intel.com/.

Remove dot from end of www address, with this
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13663
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  tests/intel/perf_pmu.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
> index a5e67ce73..bf43da8db 100644
> --- a/tests/intel/perf_pmu.c
> +++ b/tests/intel/perf_pmu.c
> @@ -1313,10 +1313,6 @@ do { \
>  	ATTR_INIT();
>  	igt_assert_eq(perf_event_open(&attr, 0, 0, -1, 0), -1);
>  	igt_assert_eq(errno, EINVAL);
> -
> -	ATTR_INIT();
> -	igt_assert_eq(perf_event_open(&attr, -1, 1, -1, 0), -1);
> -	igt_assert_eq(errno, EINVAL);
>  }
>  
>  static void open_invalid(int i915)
> -- 
> 2.49.0
> 
