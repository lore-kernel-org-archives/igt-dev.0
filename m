Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F29C02182
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jan 2025 14:02:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EDE410E596;
	Tue, 21 Jan 2025 14:02:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YF4kEO6T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F6210E596
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jan 2025 14:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737468170; x=1769004170;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8In7NKZBx+IoEqm2RNJYPGoxVG0XzJE9YWcKtepHJBc=;
 b=YF4kEO6TgfiK9jbOCJPqTLDrN0q6HlouJg4tC+4WuYRLuiN7Wtf/nsWJ
 aEnGMx9dBn4oOy7OiUwauOz9327AYNPWo215wzM6cOCxn4/oi0X5lEunH
 avfMGkKcbYF+dY10GMCktOXhpCTmpmQAqyuh+yXStUyWAdRpvF4WxZnpJ
 iQOLPjl09oV4B2l/80EIUe3IEGwS3dymO0gIwk+2XRS+toOdVj/9NhN92
 XAu4Y7NUm/rii+jcIdKFzPNB4nxjFtYgEiyG8c05iMNnf1YwgrJ0k9+bx
 JBMjXoObU3of9NHuCUEFfLanMkjVIn1X2gn0X/lCCtGC0XBIUe8PsT11W A==;
X-CSE-ConnectionGUID: 9zNWFKjQQlmY9O0mWWL6Qg==
X-CSE-MsgGUID: iDZkcU+DQXGXw/2+MWJ+Hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="25482075"
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; d="scan'208";a="25482075"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 06:02:50 -0800
X-CSE-ConnectionGUID: pf1UXpSwRvqFo92DgKecng==
X-CSE-MsgGUID: BUyk1aJfROiNojAu4eXh2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; d="scan'208";a="106739400"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 06:02:49 -0800
Date: Tue, 21 Jan 2025 15:02:46 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Pravalika Gurram <pravalika.gurram@intel.com>
Cc: igt-dev@lists.freedesktop.org, peter.senna@linux.intel.com
Subject: Re: [PATCH 1/2] lib/igt_facts: Make igt_facts_test noreturn
Message-ID: <20250121140246.4bsxhscnpwrsskoq@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Pravalika Gurram <pravalika.gurram@intel.com>,
 igt-dev@lists.freedesktop.org, peter.senna@linux.intel.com
References: <20250121063207.71737-1-pravalika.gurram@intel.com>
 <20250121063207.71737-2-pravalika.gurram@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250121063207.71737-2-pravalika.gurram@intel.com>
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

Hi Pravalika,
On 2025-01-21 at 12:02:06 +0530, Pravalika Gurram wrote:
> noreturn attribute is used to improve the optimization by informing to
> the compiler that function does not return .
> 
> Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
> ---
>  lib/igt_facts.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/igt_facts.c b/lib/igt_facts.c
> index 2e04a7c86..bd6742065 100644
> --- a/lib/igt_facts.c
> +++ b/lib/igt_facts.c
> @@ -748,7 +748,7 @@ static void igt_facts_test_mark_and_sweep(struct igt_list_head *head)
>   *
>   * Returns: bool indicating if the tests passed
>   */
> -void igt_facts_test(void)
> +__noreturn void igt_facts_test(void)

This makes our CI pieline fails, see:

https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1349299

https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/69671923

 9/443 lib igt_exit_handler                    OK       2.14 s 
10/443 lib igt_facts                           FAIL     0.33 s (exit status 98)
11/443 lib igt_fork                            OK       6.65 s 

Imho it is better to test it first on your machine locally with:

meson test -C build --num-processes 4

then send it as a separate patch.

Regards,
Kamil

>  {
>  	const char *last_test = "Unit Testing";
>  
> @@ -776,4 +776,6 @@ void igt_facts_test(void)
>  	/* Clean up the list and call igt_facts(). This should not crash */
>  	igt_facts_list_mark_and_sweep(&igt_facts_list_pci_gpu_head);
>  	igt_facts(last_test);
> +
> +	igt_exit();
>  }
> -- 
> 2.34.1
> 
