Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE104FF885D
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 08:50:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65BF910E31F;
	Tue, 28 Apr 2026 08:50:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GT1FsbW4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFE8110E320
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 08:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777366234; x=1808902234;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0cpPWkfLSiqV7Cu7kwm6KyvmSeGj3J5D/nH1O03wtcw=;
 b=GT1FsbW4QtPQ74lz3Rga07aWQKdqOx6EYwfCZylWA7ssa+7onv1EDecE
 y2EcmpLi0QALzgzbsxf1bFjgVrVl7bn4+BDuSqBhvho5WCGIg10YuXags
 eNBEz+oCB3UY2ncx6Mu7kpZozxbT+6/4kNomfqcDCXqFncJxzEnfzN0nv
 0pIMwEWDMpiNtCvxHWMHwqgOKFYTlV1AZpG01lNRWuKAjHz9ji2wPNMFK
 vY025BTDlRkwaTe0VJxkjwFIDozKmhVUykofXuvEuD0JkYrBbODcGfvSt
 CcorxOzDgMWAYkcCtam5tKLkgmP4ws84T6ckoSRYOsz6otqdhZrnkde6r A==;
X-CSE-ConnectionGUID: 3emp3WbQSuumEpPGm1Jehg==
X-CSE-MsgGUID: YLZ0QYZ4T2aISFlg8dae4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="77973199"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="77973199"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 01:50:34 -0700
X-CSE-ConnectionGUID: fGCjQnleQNyTayNJi4Aq1g==
X-CSE-MsgGUID: UvcArYuQRvyNUvdz2OGCjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="233846046"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 01:50:32 -0700
Date: Tue, 28 Apr 2026 10:50:30 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: John Harrison <John.Harrison@Igalia.com>
Cc: igt-dev@lists.freedesktop.org, Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH i-g-t] lib/kms: Set display->has_plane_color_pipeline
 automatically
Message-ID: <20260428085030.vtylbhz4whtn7eor@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 John Harrison <John.Harrison@Igalia.com>,
 igt-dev@lists.freedesktop.org,
 Swati Sharma <swati2.sharma@intel.com>
References: <20260427141905.2535060-1-John.Harrison@Igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260427141905.2535060-1-John.Harrison@Igalia.com>
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

Hi John,
On 2026-04-27 at 07:19:05 -0700, John Harrison wrote:
> The pipeline presence flag was stored in the display object and used
> by multiple tests. However, each test would explicitly set the flag
> itself immediately after requiring the display. Except for
> the kms_properties test which used it but never actually set it (and
> therefore was not correctly testing color pipelines).
> 
> So instead, set it in the display require function next to other
> property flag detections.
> 

+cc Swati found with help of git blame

Cc: Swati Sharma <swati2.sharma@intel.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> Signed-off-by: John Harrison <John.Harrison@Igalia.com>
> ---
>  lib/igt_kms.c              | 2 ++
>  tests/kms_color_pipeline.c | 5 -----
>  tests/kms_colorop.c        | 4 ----
>  3 files changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 38c28f45f..d2e96d1ef 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -3194,6 +3194,8 @@ void igt_display_require(igt_display_t *display, int drm_fd)
>  
>  	if (drmSetClientCap(drm_fd, LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT, 1) == 0)
>  		display->has_virt_cursor_plane = 1;
> +	if (drmSetClientCap(drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
> +		display->has_plane_color_pipeline = 1;
>  
>  	plane_resources = drmModeGetPlaneResources(display->drm_fd);
>  	igt_assert(plane_resources);
> diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
> index 78860a845..6119a830f 100644
> --- a/tests/kms_color_pipeline.c
> +++ b/tests/kms_color_pipeline.c
> @@ -349,7 +349,6 @@ run_tests_for_plane(data_t *data)
>  
>  int igt_main()
>  {
> -	int has_plane_color_pipeline = 0;
>  	data_t data = {};
>  
>  	igt_fixture() {
> @@ -364,13 +363,9 @@ int igt_main()
>  		if (drmSetClientCap(data.drm_fd, DRM_CLIENT_CAP_ATOMIC, 1) == 0)
>  			data.display.is_atomic = 1;
>  
> -		if (drmSetClientCap(data.drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
> -			has_plane_color_pipeline = 1;
> -
>  		kmstest_set_vt_graphics_mode();
>  
>  		igt_display_require(&data.display, data.drm_fd);
> -		data.display.has_plane_color_pipeline = has_plane_color_pipeline;
>  		igt_require(data.display.is_atomic);
>  	}
>  
> diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
> index 16db0b8ad..4db83470d 100644
> --- a/tests/kms_colorop.c
> +++ b/tests/kms_colorop.c
> @@ -418,14 +418,10 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
>  		igt_require_f(!ret, "error setting DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");
>  
>  		igt_display_require(&display, display.drm_fd);
> -		if (drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
> -			display.has_plane_color_pipeline = 1;
>  
>  		kmstest_set_vt_graphics_mode();
>  
>  		igt_display_require(&display, display.drm_fd);
> -		if (drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
> -			display.has_plane_color_pipeline = 1;
>  
>  		igt_require(display.is_atomic);
>  	}
> -- 
> 2.43.0
> 
