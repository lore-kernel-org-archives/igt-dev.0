Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF629C83F17
	for <igt-dev@archiver.kernel.org>; Fri, 18 Jul 2025 15:34:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 775FD10E9EC;
	Fri, 18 Jul 2025 15:34:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TIRga12E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 685A710E9EC
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Jul 2025 15:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752852881; x=1784388881;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IyACmIkcYsDA6dWbjJtD7RONeI3x1tOYTSt+OpMPooE=;
 b=TIRga12EygUAi6KKc0kNJzl5qm08oA7ZLi9JcU4kOq6s3ZBQCMu250/j
 tmQjCj1m+VqiFjuCrRTewAyiI7pwVAGQF6uOHiAv3gNRfECPGHMomh23Q
 bIWEIHJO0USGO2sMC6vBpEA8txRLVnQz5ZhQHvvZ1NiyJaewV80qM6xd2
 VJLSQntDc8ZOhtp0WR31ONs3hOZarV68TveSr0zXzBo6qCBF2K+rYHnIy
 o3T2ryRPf1JsGsPtLbP7zCPdaefPOiwvjfCazbxCBHd/yl9Qnfr7bHDH0
 4JasF7c3I7wOVdI1YwwV+Dlf5y5ViWnlf8jg8EKA4H3cePtSOZz3zUS9P g==;
X-CSE-ConnectionGUID: A07YXHENR8qIOePKHqLXYw==
X-CSE-MsgGUID: WSPdoEY/SBe7oHvyndKEGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="65409328"
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="65409328"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 08:34:41 -0700
X-CSE-ConnectionGUID: fbY/EvXTSTSyJGlMGtIRXA==
X-CSE-MsgGUID: iaeHPBVASfqOWltEMDHl3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="189038344"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 08:34:39 -0700
Date: Fri, 18 Jul 2025 17:34:25 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [PATCH v3 i-g-t 1/2] igt_core_get_igt_hook: igt_hook pointer for
 other libs
Message-ID: <20250718153425.drlbh7gwl26gp5al@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Gustavo Sousa <gustavo.sousa@intel.com>
References: <20250715133722.32559-1-peter.senna@linux.intel.com>
 <20250715133722.32559-2-peter.senna@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250715133722.32559-2-peter.senna@linux.intel.com>
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

Hi Peter,
On 2025-07-15 at 15:37:21 +0200, Peter Senna Tschudin wrote:

please change subject from

[PATCH v3 i-g-t 1/2] igt_core_get_igt_hook: igt_hook pointer for other libs

to something like:

[PATCH v3 i-g-t 1/2] lib/igt_core: Expose igt_hook pointer for other libs

This could be done at merge time, no need for resend.

Regards,
Kamil

> Previously, all igt_hooks were defined, initialized, and freed within
> lib/igt_core.c, limiting hook creation to this file. To enable other
> libraries to add hooks, introduce a function that returns a pointer to
> the main hook structure.
> 
> This change allows hooks to be created from external libraries without
> requiring separate initialization or teardown of the hook
> infrastructure.
> 
> Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> ---
> v3:
>  - unchanged
> 
> v2:
>  - change function name to igt_core_get_igt_hook()
>  - remove duplicated documentation from header 
> 
>  lib/igt_core.c | 12 ++++++++++++
>  lib/igt_core.h |  2 ++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index c2674a272..4bfffc3a8 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -3604,3 +3604,15 @@ unsigned int igt_measured_usleep(unsigned int usec)
>  
>  	return igt_nsec_elapsed(&ts) / NSEC_PER_USEC;
>  }
> +
> +/**
> + * igt_core_get_igt_hook: To allow for using hooks from other libraries, this
> + * function returns the pointer to the struct that is likely already
> + * initialized.
> + *
> + * Returns: Pointer to the igt_hook structure.
> + */
> +struct igt_hook *igt_core_get_igt_hook(void)
> +{
> +	return igt_hook;
> +}
> diff --git a/lib/igt_core.h b/lib/igt_core.h
> index 2db579423..e658737b0 100644
> --- a/lib/igt_core.h
> +++ b/lib/igt_core.h
> @@ -1601,4 +1601,6 @@ void igt_pci_system_cleanup(void);
>  void igt_emit_ignore_dmesg_regex(const char *ignore_dmesg_regex);
>  
>  unsigned int igt_measured_usleep(unsigned int usec);
> +
> +struct igt_hook *igt_core_get_igt_hook(void);
>  #endif /* IGT_CORE_H */
> -- 
> 2.43.0
> 
