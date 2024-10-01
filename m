Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD93CE7D0D
	for <igt-dev@archiver.kernel.org>; Tue,  1 Oct 2024 11:43:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5354110E154;
	Tue,  1 Oct 2024 11:43:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cYMM8Ijp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA6410E154
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Oct 2024 11:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727783011; x=1759319011;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UyAGjck8DbumzQztFa5NEx8QUk5rDyQC22EClGCwpps=;
 b=cYMM8Ijp9i5Wa+JD109YQuVx/4TitzRdcWI5bqb364puZCLjzFIzKF2D
 iI/b+nJgB11LSN1jygKZ6vIrO5aOnR71Tu5AP67/ZK9BGTbz+PBeiFbYg
 4XSghci4Qg7nhNPMXG9Hxey7hQiLrQtTrYohpnShIIT2JtuR24pfzrJZB
 TLgXPe5x1PFP0BAEMYPZtdOF9Iv7vFzaSr6ecyT33Bh3w9A1Z0uwOCQ+v
 uBTCVyP2w3MeunERqbKnrFhv7MVl5ytUX3vKh1IbUKjv48IV+szdoKbq3
 GSVFKFOGUrey/HT2gRe4/C5RJGWP+qKWEVEqCztiHDRROiGoR8+obxXtT g==;
X-CSE-ConnectionGUID: lftYiH1qTjuxFnEAVPADQA==
X-CSE-MsgGUID: xkI5U6ywTaywpvcWNw8LLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="38049095"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="38049095"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 04:43:31 -0700
X-CSE-ConnectionGUID: L4NDU661Q7iWVD5mAtWVkQ==
X-CSE-MsgGUID: FgzlmuOMTe2BNs4UpyLQ2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="78380467"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 04:43:29 -0700
Date: Tue, 1 Oct 2024 13:43:26 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jonathan-Cavitt <jonathan.cavitt@intel.com>, saurabhg.gupta@intel.com,
 alex.zuo@intel.com
Subject: Re: [PATCH i-g-t] tests/intel/xe_pm_residency: Skip on
 igt_power_open failure
Message-ID: <20241001114326.bsx5dcmqzbgsx4ky@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Jonathan-Cavitt <jonathan.cavitt@intel.com>,
 saurabhg.gupta@intel.com, alex.zuo@intel.com
References: <20240930232720.1496539-1-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240930232720.1496539-1-jonathan.cavitt@intel.com>
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

Hi Jonathan-Cavitt,
On 2024-09-30 at 16:27:20 -0700, Jonathan-Cavitt wrote:
> The xe_pm_residency@toggle-gt-c6 test fails when
> gt_c6_power >= gt_c0_power.  These values are reported by
> igt_power_get_mW, which will always report 0 in the case that
> igt_power_open fails to open either the hwmon_fd or rapl.fd.  Since the
> expected result will always be a failure in this case, skip the test to
> end execution early.
> 
> Signed-off-by: Jonathan-Cavitt <jonathan.cavitt@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>


> ---
>  tests/intel/xe_pm_residency.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
> index 0e687558b1..36ed46cfc5 100644
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -276,7 +276,11 @@ static void toggle_gt_c6(int fd, int n)
>  	int gt;
>  	struct igt_power gpu;
>  
> -	igt_power_open(fd, &gpu, "gpu");
> +	/*
> +	 * igt_power_get_mW will always return 0 if igt_power_open fails,
> +	 * so skip the test in this case.
> +	 */
> +	igt_skip_on(igt_power_open(fd, &gpu, "gpu"));
>  
>  	do {
>  		fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
> -- 
> 2.25.1
> 
