Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D00CAC592
	for <igt-dev@archiver.kernel.org>; Mon, 22 Sep 2025 10:28:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 610D510E40F;
	Mon, 22 Sep 2025 10:28:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KQxuZF5L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0DBC10E40F
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Sep 2025 10:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758536939; x=1790072939;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5TVSwCvRzPr2VMVIMHD+02U0xApXZmunTYqdezHOO/8=;
 b=KQxuZF5LjGWghyCGmqIVAov4ZY19TjKSVraQ9uykJTf4BuFLCXTc3218
 QlmiHP7P+lhGlv7fjZi92FKc31xEkEwKajpmTF/byqJ51SVhT32C87jb3
 PQO593UIhUIHIdEFbxi05nMrgJKAYSTJYUja/dVmtXY59jCa5JWVAQDOK
 rAYpSNePPqC3MzeIasS2bEUrnk3RIUrhFLt7jC+RVK9ToWTZtUCvEwb67
 wxSKbguWGhMkDo7ArCWFvLRSykk/1OOQQauN5I2CpSxqyn0/l1nth3xgY
 GUJ9NR0gDEGk8T1yRI7rNT3KYb4oV0rc7cGGHDctoR2A8y45fSHHtO/Mr A==;
X-CSE-ConnectionGUID: RJxuhZyPQguEuK1ToxVjmw==
X-CSE-MsgGUID: WgGaY3rUSMyyTqspB4BlEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60709797"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60709797"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 03:28:58 -0700
X-CSE-ConnectionGUID: v1mgqSslSAGU9/O4mieeSw==
X-CSE-MsgGUID: vp44G5hcTk6ecmzF+G2wYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="207399063"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 03:28:57 -0700
Date: Mon, 22 Sep 2025 12:28:34 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com
Subject: Re: [PATCH i-g-t] lib/compute: choose BO alignment based on driver
 type
Message-ID: <20250922102834.fjimemjxp4x2gaz7@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>,
 igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com
References: <20250922061621.509408-1-smitha.balasubramanyam@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250922061621.509408-1-smitha.balasubramanyam@intel.com>
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

Hi Smitha,
On 2025-09-22 at 11:46:21 +0530, Smitha Balasubramanyam wrote:

small nit about subject, please add 'intel_' before 'compute'
in subject, so:

[PATCH i-g-t] lib/intel_compute: choose BO alignment based on driver type

It could be done at merge, no need for resend. Also please reply
to CI failure reports (if any). Also adding Priyanka on cc

+cc Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Regards,
Kamil

> Previously, BO size alignment behavior was inconsistent:
>  - For XeHP compute, xe_get_default_alignment() was used.
>  - For XeLP compute, a fixed alignment value was used.
> 
> This patch updates the logic to select alignment dynamically
> based on the driver type:
> 
>  - For Xe: use xe_get_default_alignment()
>  - For i915: use gem_detect_safe_alignment()
> 
> Signed-off-by: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
> ---
>  lib/intel_compute.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 147dd2916..8011e8360 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -1133,8 +1133,11 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
>  
>  	bo_execenv_create(fd, &execenv, eci, user);
>  
> -	/* Set dynamic sizes */
> -	bo_dict[0].size = ALIGN(size, xe_get_default_alignment(fd));
> +	/* Set dynamic sizes depending on the driver type(xe vs i915) */
> +	bo_dict[0].size = ALIGN(size,
> +				(execenv.driver == INTEL_DRIVER_XE) ?
> +				xe_get_default_alignment(fd) :
> +				gem_detect_safe_alignment(fd));
>  	bo_dict[4].size = size_input(execenv.array_size);
>  	bo_dict[5].size = size_output(execenv.array_size);
>  
> @@ -1733,8 +1736,11 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
>  
>  	bo_execenv_create(fd, &execenv, eci, user);
>  
> -	/* Set dynamic sizes */
> -	bo_dict[0].size = ALIGN(size, 0x10000);
> +	/* Set dynamic sizes depending upon the driver type (xe vs i915)*/
> +	bo_dict[0].size = ALIGN(size,
> +				(execenv.driver == INTEL_DRIVER_XE) ?
> +				xe_get_default_alignment(fd) :
> +				gem_detect_safe_alignment(fd));
>  	bo_dict[4].size = size_input(execenv.array_size);
>  	bo_dict[5].size = size_output(execenv.array_size);
>  
> -- 
> 2.43.0
> 
