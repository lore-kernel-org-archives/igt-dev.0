Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC91C3ABCC
	for <igt-dev@archiver.kernel.org>; Wed, 14 May 2025 11:19:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CB3810E3B9;
	Wed, 14 May 2025 11:19:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nhPSdhSE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D68710E3B9
 for <igt-dev@lists.freedesktop.org>; Wed, 14 May 2025 11:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747221588; x=1778757588;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+dao0NL3+P/5dmaBpKwprNuFXwXWnE5jzOKPmjFkVE4=;
 b=nhPSdhSEzAoPZKoop9PUWF5y1Zc3Y8q4BKjKzU3W1CaFG0j3zbVoreCp
 gxngwzdbaSqWCjCWgWCfCxV139Ud+NyyqQl9QogOODS8S5xvhM/WDnN2I
 Upl/OllVEqHA0vMG88zuk4cIzSCJfdH2z1B/2FhLIjbWOH/rwtWKNo6ug
 F26MvggJAC8S4EEqjvz2T89W8CGSAUDmC6xBaHKJLq4N4xOmU4XCEswFm
 4pbsM0XAc8H06FYVRGEJKSkXEHAG0rXVgsD0nNRm+bJxIFkP39IHlN1FT
 +lzvDYX7DKYNfMu1jdulfBssKvv6j81JdgoV94fcuFiZjSsASmWuED784 g==;
X-CSE-ConnectionGUID: qaZbm+ZbRYiB9+1+Lx2IMw==
X-CSE-MsgGUID: 8s3T7r12SpSSWGuPy6Qe7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48222011"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="48222011"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 04:19:47 -0700
X-CSE-ConnectionGUID: ySLPxfNSTfC9wB2L+Bqaaw==
X-CSE-MsgGUID: e6IRVyNvSaeVQC+n7/aL3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="138535793"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 04:19:47 -0700
Date: Wed, 14 May 2025 13:19:28 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jan Sokolowski <jan.sokolowski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v1 1/1] tests/intel/xe_render_copy: Skip tests on PVC
Message-ID: <20250514111928.sgoophi57zlk4bje@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250513115252.9095-1-jan.sokolowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250513115252.9095-1-jan.sokolowski@intel.com>
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

Hi Jan,
On 2025-05-13 at 11:52:52 +0000, Jan Sokolowski wrote:
> As PVC doesn't have render, these tests will fail by definition.
> 
> Skip render tests on PVC.

There is already igt_require later on, why not moving
it into fixture?

> 
> Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
> ---
>  tests/intel/xe_render_copy.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tests/intel/xe_render_copy.c b/tests/intel/xe_render_copy.c
> index fadfd162c..c36520c92 100644
> --- a/tests/intel/xe_render_copy.c
> +++ b/tests/intel/xe_render_copy.c
> @@ -697,6 +697,10 @@ igt_main_args("dpiW:H:", NULL, help_str, opt_handler, NULL)
>  
>  	igt_fixture {
>  		xe = drm_open_driver(DRIVER_XE);
> +
> +		/* As PVC doesn't have render, we should skip here */
> +		igt_require(!IS_PONTEVECCHIO(xe_dev_id(xe)));
> +
>  		bops = buf_ops_create(xe);

Put it here after bops create, see closing fixture.
To be sure you could also add a require with igt_get_render_copyfunc()

Regards,
Kamil

>  		srand(time(NULL));
>  		set = xe_get_memory_region_set(xe, DRM_XE_MEM_REGION_CLASS_SYSMEM);
> -- 
> 2.34.1
> 
