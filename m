Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55CF8C3DA64
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jul 2024 15:24:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCBC210E657;
	Wed, 31 Jul 2024 15:24:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h+a578Y5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D76110E657
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jul 2024 15:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722439481; x=1753975481;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+Br8kiJf0tsa57DQ8d/G9x/8ICNgn8mAy2PBIafk9kI=;
 b=h+a578Y5U6MxdtwqP0VtOfPKFou1wKpDR0KwWr5POy5AztugteirqFUp
 7NYXP32EnHHYqR4jtSuVHj8uc+FajmaGDQKBeo7a1GUoenzolrp4U0Fxk
 MscTksxccbZHkxpJuOaZ/+V4yZ/+Co7AYoEnDnR3sRrhDnOV82tLmgIM7
 tTWU0VNe+L6YYQEL2kJAHH9zjWy6FwbIXTk1h24fepLL34Ra/4eqU9mxW
 flHKHZq5Fi7lN3EYMM72xBp+wsu14TfWHBTt0EUfMNKCifgqbVCzNX8Hx
 Xh80oZuwDlpb2R52ncyE8XO+pU9p8KrexLVe8EF6v0H65mYZFtXAUQiCD w==;
X-CSE-ConnectionGUID: sVgGZIqBT7++dqb7c8qpFg==
X-CSE-MsgGUID: ps15pZKIQZaRovQXwkotvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20485463"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="20485463"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 08:24:40 -0700
X-CSE-ConnectionGUID: aUKVXo+yQdCHtwitVx3Qqg==
X-CSE-MsgGUID: 1KCDNRsBTPqZ3nGbd6MY7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="54695349"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 08:24:39 -0700
Date: Wed, 31 Jul 2024 17:24:36 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v4] lib/xe/xe_query: Do not require QUERY_OA_UNITS
 for all Xe tests
Message-ID: <20240731152436.o2r6avdnazrdk26l@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <78c5f531-f482-49c7-8290-38710698e4a7@linux.intel.com>
 <355010f7-e6f4-4d01-a8dd-3be387b57dcf@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <355010f7-e6f4-4d01-a8dd-3be387b57dcf@linux.intel.com>
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
On 2024-07-31 at 13:17:54 +0200, Peter Senna Tschudin wrote:
> The code currently requires the driver to support DRM_XE_DEVICE_QUERY_OA_UNITS
> to run all tests while the only test that needs it is xe_oa. Removes the
> requirement so that all other Xe tests can run when this single requirement is
> not met.
> 
> I found it when trying to run IGT Xe tests on a recent kernel
> 6.9.9-200.fc40.x86_64 from Fedora 40.

Looks much better, I spotted few nits, see below.

> 
> V4:
>  - Shorten the commit message
>  - Adds back the the path prefix to the subject
> 
> V3:
>  - Update comment syntax and shorten comments
>  - Update comment content to describe from kernel version perspective only
>  - Update test to make '!= 0' implicit
> 
> V2:
>  - Cleanup headers from message body
>  - Add 'lib/xe/xe_query:' to subject line
> 

Please add here Cc to developer(s) who responded to your mail,
adding to Cc 

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>

> Signed-off-by: Peter Senna Tschudin <peter.senna@intel.com>

Also you should add Reviewed-by here. You could not add it if
you make a change to code in new version.

Btw please also look into reports from CI, check its results and
respond to CI team to help them in filing bugs. I just responed
to one such e-mail so you could have an example.

Regards,
Kamil

> ---
>  lib/xe/xe_query.c   | 4 +++-
>  tests/intel/xe_oa.c | 6 +++++-
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index 84eaaac96..8694fa3f9 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -124,7 +124,9 @@ static struct drm_xe_query_oa_units *xe_query_oa_units_new(int fd)
>  		.data = 0,
>  	};
>  
> -	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> +	/* Support older kernels where this uapi is not yet available */
> +	if (igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query))
> +		return NULL;
>  
>  	oa_units = malloc(query.size);
>  	igt_assert(oa_units);
> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
> index ff2218300..1f82dce06 100644
> --- a/tests/intel/xe_oa.c
> +++ b/tests/intel/xe_oa.c
> @@ -4503,6 +4503,7 @@ static const char *xe_engine_class_name(uint32_t engine_class)
>  igt_main
>  {
>  	struct drm_xe_engine_class_instance *hwe = NULL;
> +	struct xe_device *xe_dev;
>  
>  	igt_fixture {
>  		struct stat sb;
> @@ -4527,7 +4528,10 @@ igt_main
>  		igt_assert_eq(drm_fd, -1);
>  
>  		drm_fd = drm_open_driver(DRIVER_XE);
> -		xe_device_get(drm_fd);
> +		xe_dev = xe_device_get(drm_fd);
> +
> +		/* See xe_query_oa_units_new() */
> +		igt_require(xe_dev->oa_units);
>  
>  		devid = intel_get_drm_devid(drm_fd);
>  		sysfs = igt_sysfs_open(drm_fd);
> -- 
> 2.34.1
> 
