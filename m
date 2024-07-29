Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 254E5C3DA61
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 17:41:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0CBD10E456;
	Mon, 29 Jul 2024 17:41:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JjwI46Zm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AA9A10E456
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 17:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722274916; x=1753810916;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6zFIq1AfxGZtyVyjzYCa/YEqAVatltbiK3wJu7LAKcw=;
 b=JjwI46Zmj+J6VfZL7NXOGBMmQLup5Q5QidKfaugYPsivVjRNb8FOeFne
 Rw6FVtkLFdxBIuBWkb3V4Io5dOUbCfWLipp0nM6ZW/z4k+tRpvznF+0Wl
 5oAcrTM5caF58U4d8bUDW+CZ4JHsGlVeTL6SUT3hV61+P/9j85NkcXpDf
 c32rW2GW697w7DRDKzRHQzy6qE54oo7nNpbqmOHg/e2NC3lvnTxRIRf4m
 E8CsZwxXthNIG1lljkf8mCX2FfC9+4G9NA0dELzMrhg5Rg8nlinALBQDh
 GWA+YwYTbvQJ2ub+c5ZG7F3X9k0An3uzqnRnuVPAFn5jkJQKAPuhDAzs9 A==;
X-CSE-ConnectionGUID: oBF0PszSQNWKzWQNrK8bow==
X-CSE-MsgGUID: ksiAZs6FRd2RGC71++JsyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="19750393"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="19750393"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 10:41:56 -0700
X-CSE-ConnectionGUID: 51c7ARRsTrmHWdLonMUWuQ==
X-CSE-MsgGUID: 0V7U0xKJTF+2+6uTpGyhTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="54023603"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 10:41:55 -0700
Date: Mon, 29 Jul 2024 19:41:34 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 ashutosh.dixit@intel.com
Subject: Re: [PATCH i-g-t v3] Do not require QUERY_OA_UNITS for all Xe tests
Message-ID: <20240729174134.o6b7eu5ni6ki6zex@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 ashutosh.dixit@intel.com
References: <78c5f531-f482-49c7-8290-38710698e4a7@linux.intel.com>
 <ecedfd14-32ac-4ad8-b336-46f98b02b1e3@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ecedfd14-32ac-4ad8-b336-46f98b02b1e3@linux.intel.com>
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
On 2024-07-29 at 07:25:39 +0200, Peter Senna Tschudin wrote:

in v3 you again dropped prefix from subject. Second nit is about
description, rather then describing word-for-word your C code
changes, describe why and what you do. Some hints on how to write
good description you can find in CONTRIBUTE.md

imho you could start that on current Fedora 40 with kernel
command line (cite here so one can reproduce it) all current Xe
tests are failing, and to enable almost all of them you changed
how xe lib is handling missing XE...OA and also added a skip to
xe_oa test in such scenario.

What you changed is already in a patch itself (in diff --git).

Regards,
Kamil

> Changes xe_query_oa_units_new() to return NULL instead of aborting
> due to assertion failure when querying for DRM_XE_DEVICE_QUERY_OA_UNITS.
> 
> It adds a skip to xe_oa.c to make sure it will not try to run the tests if the
> query has failed before.
> 
> The motivation is as follows:
>  - The only test that requires oa_units is tests/intel/xe_oa.c, however current
>    code will prevent all Xe tests from running if OA_UNITS is not supported
>  - Before this patch, trying to run IGT on the Xe module from Fedora 40
>    (6.9.9-200.fc40.x86_64) fails
>  - After this patch, we can run some tests, such as xe_exec_basic
>    successfully
> 
> Here is an example of the impact of this patch:
>  1. Use Fedora 40 with the following kernel command line arguments:
>     "xe.force_probe=* i915.force_probe=!* modprobe.blacklist=i915,ast,snd_hda_intel,xe"
> 
>  2. Running IGT without this patch will fail:
>      $ sudo ./build/tests/xe_exec_basic
>      $ echo $?
>      98
> 
>  3. Running after fix applied will succeed:
>     sudo ./build/tests/xe_exec_basic
>      $ sudo ./build/tests/xe_exec_basic
>      $ echo $?
>      0
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
> Signed-off-by: Peter Senna Tschudin <peter.senna@intel.com>
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
