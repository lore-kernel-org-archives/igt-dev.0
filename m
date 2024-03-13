Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D0AAC54791
	for <igt-dev@archiver.kernel.org>; Wed, 13 Mar 2024 14:06:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 288A210F7D8;
	Wed, 13 Mar 2024 14:06:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A92v3GZB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4B2E10F7D8
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Mar 2024 14:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710338768; x=1741874768;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5oZm1fCwVSakGXEQDUuselg//0WAjZgJEl5vyRx08Kw=;
 b=A92v3GZBN/7z5pkcb0aRVKxHJWKrJ2eqZNlmSXB1Kdv5MP7fDU9eeWJu
 1ENhiExKmNut95lIPNQ5cXzKmAWIZONk4HmV3J7FzRxnU647GvhZFNqqL
 ZkEIyiwtpHOZTC4ifkAuFoCwDI/Jx7YhpKVFFZTkq/R4X02LD7Ekhlhkj
 w+XzYl/tK2nWaIn3cNdRk9/4ex19VAxXbCEo2QBwAgS99du+QHvBtFOCm
 51+sKoSfBruct7/yQvEfGcuinXxzTkmy7GGj6vdkrWk+hVFAReXxMsfle
 aMlXsE1Cx+iqBeNKFqIh16lrDKIb9CEqtNps8B6gXrfi4Y9g9msScCPNp w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="4956219"
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="4956219"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 07:06:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; d="scan'208";a="49358305"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 07:06:04 -0700
Date: Wed, 13 Mar 2024 15:06:01 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Simon Ser <contact@emersion.fr>, quic_abhinavk@quicinc.com,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: Re: [PATCH i-g-t v3 3/5] lib: Add support for solid_fill and
 pixel_source plane properties
Message-ID: <20240313140601.732oweyvohkv66wi@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Simon Ser <contact@emersion.fr>, quic_abhinavk@quicinc.com,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
References: <20240301-solid-fill-v3-0-8dff68a8a566@quicinc.com>
 <20240301-solid-fill-v3-3-8dff68a8a566@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240301-solid-fill-v3-3-8dff68a8a566@quicinc.com>
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

Hi Jessica,
On 2024-03-01 at 12:47:32 -0800, Jessica Zhang wrote:
> Add corresponding IGT macros for solid_fill and pixel_source DRM
> properties, and change IGT commit behavior to allow for NULL FB commits.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  lib/igt_kms.c | 48 +++++++++++++++++++++++++++++++++++++++++++++---
>  lib/igt_kms.h |  4 ++++
>  2 files changed, 49 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 1b4d0d7612a2..8e965a3798b6 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -669,6 +669,8 @@ const char * const igt_plane_prop_names[IGT_NUM_PLANE_PROPS] = {
>  	[IGT_PLANE_HOTSPOT_X] = "HOTSPOT_X",
>  	[IGT_PLANE_HOTSPOT_Y] = "HOTSPOT_Y",
>  	[IGT_PLANE_FB_ID] = "FB_ID",
> +	[IGT_PLANE_SOLID_FILL] = "solid_fill",
> +	[IGT_PLANE_PIXEL_SOURCE] = "pixel_source",
>  	[IGT_PLANE_CRTC_ID] = "CRTC_ID",
>  	[IGT_PLANE_IN_FENCE_FD] = "IN_FENCE_FD",
>  	[IGT_PLANE_TYPE] = "type",
> @@ -2379,6 +2381,8 @@ static void igt_plane_reset(igt_plane_t *plane)
>  	igt_plane_set_prop_value(plane, IGT_PLANE_CRTC_H, 0);
>  
>  	/* Reset binding to fb and crtc. */
> +	igt_plane_set_prop_value(plane, IGT_PLANE_SOLID_FILL, 0);
> +	igt_plane_set_prop_enum(plane, IGT_PLANE_PIXEL_SOURCE, "FB");
>  	igt_plane_set_prop_value(plane, IGT_PLANE_FB_ID, 0);
>  	igt_plane_set_prop_value(plane, IGT_PLANE_CRTC_ID, 0);
>  
> @@ -3417,6 +3421,11 @@ static igt_output_t *igt_pipe_get_output(igt_pipe_t *pipe)
>  	return NULL;
>  }
>  
> +static uint32_t igt_plane_get_solid_fill_id(igt_plane_t *plane)
> +{
> +	return plane->values[IGT_PLANE_SOLID_FILL];
> +}
> +
>  static uint32_t igt_plane_get_fb_id(igt_plane_t *plane)
>  {
>  	return plane->values[IGT_PLANE_FB_ID];
> @@ -3648,7 +3657,7 @@ static int igt_primary_plane_commit_legacy(igt_plane_t *primary,
>  	struct igt_display *display = primary->pipe->display;
>  	igt_output_t *output = igt_pipe_get_output(pipe);
>  	drmModeModeInfo *mode;
> -	uint32_t fb_id, crtc_id;
> +	uint32_t fb_id, solid_fill_id, crtc_id;
>  	int ret;
>  
>  	/* Primary planes can't be windowed when using a legacy commit */
> @@ -3665,12 +3674,14 @@ static int igt_primary_plane_commit_legacy(igt_plane_t *primary,
>  
>  	crtc_id = pipe->crtc_id;
>  	fb_id = output ? igt_plane_get_fb_id(primary) : 0;
> -	if (fb_id)
> +	solid_fill_id = output ? igt_plane_get_solid_fill_id(primary) : 0;
> +
> +	if (fb_id || solid_fill_id)
>  		mode = igt_output_get_mode(output);
>  	else
>  		mode = NULL;
>  
> -	if (fb_id) {
> +	if (fb_id || solid_fill_id) {
>  		uint32_t src_x = primary->values[IGT_PLANE_SRC_X] >> 16;
>  		uint32_t src_y = primary->values[IGT_PLANE_SRC_Y] >> 16;
>  
> @@ -4935,6 +4946,37 @@ igt_plane_t *igt_output_get_plane_type_index(igt_output_t *output,
>  	return igt_pipe_get_plane_type_index(pipe, plane_type, index);
>  }
>  
> +/**
> + * igt_plane_set_solid_fill:
> + * @plane: Plane
> + * @rect: Rect for size and position of @plane
> + * @solid_fill_id: Solid fill property blob ID
> + *
> + * Pairs the solid_fill blob (identified by @solid_fill_id) to a @plane
> + *
> + * The size and position of the solid fill plane will be specified by @rect
> + */
> +void igt_plane_set_solid_fill(igt_plane_t *plane, struct drm_mode_rect *rect,
> +		int solid_fill_id)
> +{
> +	igt_pipe_t *pipe = plane->pipe;
> +	igt_display_t *display = pipe->display;
> +	int width = rect->x2 - rect->x1;
> +	int height = rect->y2 - rect->y1;
> +
> +	igt_plane_set_prop_value(plane, IGT_PLANE_CRTC_ID,
> +			solid_fill_id ? pipe->crtc_id : 0);
> +	igt_plane_set_prop_value(plane, IGT_PLANE_SOLID_FILL, solid_fill_id);
> +
> +	plane->gem_handle = 0;
> +
> +	LOG(display, "%s.%d: plane_set_solid_fill(%d)\n", kmstest_pipe_name(pipe->pipe),
> +	    plane->index, solid_fill_id);
> +
> +	igt_plane_set_position(plane, rect->x1, rect->y1);
> +	igt_plane_set_size(plane, width, height);
> +}
> +
>  /**
>   * igt_plane_set_fb:
>   * @plane: Plane
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index b3882808b42f..9c05272abe1e 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -330,6 +330,8 @@ enum igt_atomic_plane_properties {
>  #define IGT_PLANE_COORD_CHANGED_MASK 0xff
>  
>         IGT_PLANE_FB_ID,
> +       IGT_PLANE_SOLID_FILL,
---^
> +       IGT_PLANE_PIXEL_SOURCE,
---^
Whitespace errors, please use tabs. Also use checkpatch.pl script
from Linux kernel to check for similar errors.

Regards,
Kamil

>         IGT_PLANE_CRTC_ID,
>         IGT_PLANE_IN_FENCE_FD,
>         IGT_PLANE_TYPE,
> @@ -537,6 +539,8 @@ igt_output_t *igt_get_single_output_for_pipe(igt_display_t *display, enum pipe p
>  
>  void igt_pipe_request_out_fence(igt_pipe_t *pipe);
>  
> +void igt_plane_set_solid_fill(igt_plane_t *plane, struct drm_mode_rect *rect,
> +		int solid_fill_id);
>  void igt_plane_set_fb(igt_plane_t *plane, struct igt_fb *fb);
>  void igt_plane_set_fence_fd(igt_plane_t *plane, int fence_fd);
>  void igt_plane_set_pipe(igt_plane_t *plane, igt_pipe_t *pipe);
> 
> -- 
> 2.43.2
> 
