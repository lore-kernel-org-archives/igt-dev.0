Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 839F0FD5F99
	for <igt-dev@archiver.kernel.org>; Wed,  8 Apr 2026 09:17:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A4E210E4EF;
	Wed,  8 Apr 2026 09:17:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZiMXe43J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A75410E4EF
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Apr 2026 09:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775639844; x=1807175844;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=OX+CS8a8Fl0+7S/pFyRX/vAkQLyXBZwtmNCVnY1FN0s=;
 b=ZiMXe43J/QpqfZxGFBCfTWVdyeSt7qzc1taZjZYBwo84pju2HRrRdSzH
 +HCATPRIPAJ16FPoNZJJAB4RMdlyVmseYaGFZ7MbrFk5m2zVRTQHSNUCN
 AbJVd1Uv1a56Ov1c0gO5AQlU0wAu6fGp8diz9ZW79nnhCFmFR+ATxnbaL
 CVCl8A9hN/7IBUFG6U557SuOpzGg6PNVGTx0DoXTQpBbD1GYzeNn0oQTl
 3nXFWV4pCPqMvifNT4x1Ku7Y06S76/+g22hjAyUpY9MRdwF23XE6cRmuC
 HgXlmacGbwbpfAjgqR7Y3/pXSV+cJkrQrEHNo2x2vYQYvoruiBxavDdgH w==;
X-CSE-ConnectionGUID: 48SU8tAwTga46r4tESDv9g==
X-CSE-MsgGUID: KbI6de9ZRkOBFbvvBaR34Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="94006033"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="94006033"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 02:17:24 -0700
X-CSE-ConnectionGUID: ktBJrkczTF+9ZrMmfjYvHQ==
X-CSE-MsgGUID: pmVhAfPhT36Z1Me9RgYcUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="230088410"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.32])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 02:17:21 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Harshdeep Dhatt <harshdeepdhatt@gmail.com>, igt-dev@lists.freedesktop.org
Cc: rob.clark@oss.qualcomm.com, Harshdeep Dhatt <harshdeepdhatt@gmail.com>
Subject: Re: [PATCH i-g-t] lib/igt_kms: Identify writeback connectors in msm
 driver on android
In-Reply-To: <20260407202953.3871752-1-harshdeepdhatt@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260407202953.3871752-1-harshdeepdhatt@gmail.com>
Date: Wed, 08 Apr 2026 12:17:18 +0300
Message-ID: <9019ee70c852a5dd27bad9877d8fefca656b50c6@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 07 Apr 2026, Harshdeep Dhatt <harshdeepdhatt@gmail.com> wrote:
> The msm drm driver that runs on android platforms sets up its writeback
> connectors as DRM_MODE_CONNECTOR_VIRTUAL instead of DRM_MODE_CONNECTOR_WRITEBACK.
> This means when setting up the drm resources, these connectors get exposed
> to userspace even though userspace has not explicitly asked for writeback
> connectors. These connectors are by default in the connected state. When we
> try to configure one of the crtc's for this output (to get the primary plane),
> the msm driver bails because this connector (being a writeback connector)
> doesn't have an output framebuffer assigned to it. To avoid this failure, get the
> correct property id for setting up the output framebuffer id for writeback connectors
> as defined by the msm driver on android. Allocate and bind a dummy output fb for
> these connectors.

Is this msm android driver in upstream linux kernel?

If not, why should we add this in upstream IGT?

BR,
Jani.


>
> Signed-off-by: Harshdeep Dhatt <harshdeepdhatt@gmail.com>
> ---
>  lib/drmtest.c |  5 +++++
>  lib/drmtest.h |  1 +
>  lib/igt_kms.c | 28 ++++++++++++++++++++++++++++
>  3 files changed, 34 insertions(+)
>
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index 4a788ea7a..2e6895618 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -143,6 +143,11 @@ bool is_msm_device(int fd)
>  	return __is_device(fd, "msm");
>  }
>  
> +bool is_msm_android_device(int fd)
> +{
> +	return __is_device(fd, "msm_drm");
> +}
> +
>  bool is_nouveau_device(int fd)
>  {
>  	/* Currently all nouveau-specific codepaths require libdrm */
> diff --git a/lib/drmtest.h b/lib/drmtest.h
> index 37874d729..c042a2b20 100644
> --- a/lib/drmtest.h
> +++ b/lib/drmtest.h
> @@ -147,6 +147,7 @@ bool is_amdgpu_device(int fd);
>  bool is_i915_device(int fd);
>  bool is_mtk_device(int fd);
>  bool is_msm_device(int fd);
> +bool is_msm_android_device(int fd);
>  bool is_nouveau_device(int fd);
>  bool is_vc4_device(int fd);
>  bool is_xe_device(int fd);
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 04b1f3972..3948426bc 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -950,6 +950,14 @@ igt_atomic_fill_connector_props(igt_display_t *display, igt_output_t *output,
>  	for (i = 0; i < props->count_props; i++) {
>  		drmModePropertyPtr prop =
>  			drmModeGetProperty(fd, props->props[i]);
> +		/*
> +		 * msm android driver installs writeback fb id as a custom property which can be
> +		 * identified by "FB_ID" string
> +		 */
> +		if (is_msm_android_device(fd) && (!strcmp("FB_ID", prop->name))) {
> +			output->props[IGT_CONNECTOR_WRITEBACK_FB_ID] = props->props[i];
> +			continue;
> +		}
>  
>  		for (j = 0; j < num_connector_props; j++) {
>  			if (strcmp(prop->name, conn_prop_names[j]) != 0)
> @@ -1003,6 +1011,7 @@ static igt_plane_t *igt_get_assigned_primary(igt_output_t *output,
>  	int drm_fd = output->display->drm_fd;
>  	drmModeModeInfo *mode;
>  	struct igt_fb fb;
> +	struct igt_fb out_fb = {0};
>  	igt_plane_t *plane = NULL;
>  	uint32_t crtc_id;
>  	int i;
> @@ -1016,6 +1025,23 @@ static igt_plane_t *igt_get_assigned_primary(igt_output_t *output,
>  
>  	crtc_id = crtc->crtc_id;
>  
> +	/*
> +	 * msm android driver exposes writeback connectors as DRM_MODE_CONNECTOR_VIRTUAL and not
> +	 * DRM_MODE_CONNECTOR_WRITEBACK. The driver will bail if the output fb is not specified for
> +	 * this connector. Hence, allocate a dummy output fb here and assign it to the connector.
> +	 */
> +	if (is_msm_android_device(drm_fd) && igt_output_has_prop(output, IGT_CONNECTOR_WRITEBACK_FB_ID)) {
> +		igt_require(igt_create_fb(drm_fd, mode->hdisplay, mode->vdisplay,
> +			DRM_FORMAT_XRGB8888,
> +			DRM_FORMAT_MOD_NONE,
> +			&out_fb) == 0);
> +		igt_output_set_prop_value(output, IGT_CONNECTOR_WRITEBACK_FB_ID, out_fb.fb_id);
> +		igt_assert(drmModeConnectorSetProperty(drm_fd, output->id,
> +			output->props[IGT_CONNECTOR_WRITEBACK_FB_ID],
> +			output->values[IGT_CONNECTOR_WRITEBACK_FB_ID]) == 0);
> +	}
> +
> +
>  	/*
>  	 * Do a legacy SETCRTC to start things off, so that we know that
>  	 * the kernel will pick the correct primary plane and attach it
> @@ -1039,6 +1065,8 @@ static igt_plane_t *igt_get_assigned_primary(igt_output_t *output,
>  
>  	/* Removing the FB will also shut down the display for us: */
>  	igt_remove_fb(drm_fd, &fb);
> +	if (out_fb.fb_id != 0)
> +		igt_remove_fb(drm_fd, &out_fb);
>  	igt_assert_f(plane, "Valid assigned primary plane for CRTC_ID %d not found.\n", crtc_id);
>  
>  	return plane;

-- 
Jani Nikula, Intel
