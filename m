Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75041C27C4F
	for <igt-dev@archiver.kernel.org>; Tue, 18 Jun 2024 11:48:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0464810E64C;
	Tue, 18 Jun 2024 11:48:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mdh/sx87";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66CE510E64C
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jun 2024 11:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718711331; x=1750247331;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hrskek8bBFU5a9dFI8Bgi+kyEtdafD7uyZPNXiEP1lU=;
 b=mdh/sx87I5BzBCOs0/8ZMpEeBexpCt1/P11qQa/brGds2sY+X0iWmnth
 TQnQhCl4uQ7cfNXQqax9sf2N2O83nrD1FJfX7f26aIjTJUfDb1M6hbeH5
 2UW0Y4hmNS5Lh1gT4vSdNuPVBcfH+39EgS4/x0SO/MuumcDG6MJ80AWcS
 nayhGrN+dSlDqjOPXCI0Rh03dJCChGXOyoQ7z5+DkQUqiQ2jS6uxJGUHo
 Xm6QDzaM+2szLY6vI1HO6Aax0WSzj+8DEn7YpMnH2lTJK++MH/MwijLIJ
 P7pssaH1x+2cGrYIytj9zqspkOY3jppcglshkVsXSQINPDbPPYG7ykjGf Q==;
X-CSE-ConnectionGUID: o7zyLc8hSbqNyFiHIiINwQ==
X-CSE-MsgGUID: vbnJY3eTSiuDdwQqQUPe4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="19444063"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="19444063"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 04:48:50 -0700
X-CSE-ConnectionGUID: DBiLzNgGSD6r0l0EoBckGA==
X-CSE-MsgGUID: bGrzOB5kS22zdZy+kdF1wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="41623300"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 04:48:49 -0700
Date: Tue, 18 Jun 2024 13:48:33 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Badal Nilawar <badal.nilawar@intel.com>, vinay.belgaumkar@intel.com
Subject: Re: [PATCH i-g-t v2] tests/intel/xe_gt_freq: Resolve freq_low_max test
Message-ID: <20240618114833.zpfs2vds24kqdfds@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Badal Nilawar <badal.nilawar@intel.com>, vinay.belgaumkar@intel.com
References: <20240614173520.51631-1-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240614173520.51631-1-badal.nilawar@intel.com>
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

Hi Badal,
On 2024-06-14 at 23:05:20 +0530, Badal Nilawar wrote:
> In GUCPC flow when max freq is less than min freq and min freq is greater
> than rpe then cur will be set to min.
> 
> By nature rpe is variable as pcode changes it as per its calculations.
> So for above scenario when rpe is greater than min then GUCPC will set cur
> to rpe.
> 
> To validate GUCPC behaving as expected it is enough to check cur freq.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1045
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1829
> Fixes: 1a1e668e774e ("tests/intel/xe_gt_freq: Fix freq_low_max test")
> Fixes: adcc68266b8e ("tests/intel/xe_gt_freq: Check for RPe freq updates")
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  tests/intel/xe_gt_freq.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
> index d2e4d1a09..664ea3f79 100644
> --- a/tests/intel/xe_gt_freq.c
> +++ b/tests/intel/xe_gt_freq.c
> @@ -264,6 +264,7 @@ static void test_freq_low_max(int fd, int gt_id)
>  {
>  	uint32_t rpn = get_freq(fd, gt_id, "rpn");
>  	uint32_t rpe = get_freq(fd, gt_id, "rpe");
> +	uint32_t min;
>  
>  	/*
>  	 *  When max request < min request, max is ignored and min works like
> @@ -276,10 +277,16 @@ static void test_freq_low_max(int fd, int gt_id)
>  	/* Refresh value of rpe, pcode could have adjusted it */
>  	rpe = get_freq(fd, gt_id, "rpe");
>  
> -	igt_assert(get_freq(fd, gt_id, "cur") == rpe);
> +	min = get_freq(fd, gt_id, "min");
>  
> -	if (!xe_is_gt_in_c6(fd, gt_id))

Why did you dropped this check? Please write about this
in description,

Regards,
Kamil

> -		igt_assert(get_freq(fd, gt_id, "act") == rpe);
> +	/*
> +	 * Refreshed value of rpe can be lesser or greater than min (previous rpe).
> +	 * So when rpe < min then cur = min else cur = rpe
> +	 */
> +	if (rpe < min)
> +		igt_assert(get_freq(fd, gt_id, "cur") == min);
> +	else
> +		igt_assert(get_freq(fd, gt_id, "cur") == rpe);
>  }
>  
>  /**
> -- 
> 2.34.1
> 
