Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF5E0CCF2D6
	for <igt-dev@archiver.kernel.org>; Mon, 19 Oct 2026 12:41:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BB2F10EB25;
	Mon, 19 Oct 2026 12:41:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0765810EB25
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Oct 2026 12:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792413625; x=1823949625;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=j1DjobeeSkBUVDb71C1FU0SF0ufK6ljkbMFyibfSncU=;
 b=n2bNu7bPFd3+F4pWZ9UK+mcWghVJmYI4GjFsSbuIjYgHRZaw7SJTSwCc
 suImqhJrtYzdUXXOKGkO9Jko/Djm42dori4Jeq1a4INZEPIrpiaL4QzZG
 DVYZo8kebV9lxh5PqcVK+B2btrUOrc9y8xwe/BuPggwY8rEAoDbT/YlJt
 uS0mu0yjfLxNN79fAjO2y5/sIxm6bsfBF+ANLKU3KAPOgKJ6e2X0GneUn
 wDkJUvlmf51NSPULMmbe/u/l/A/qohxCNem0Fk3ES26EoC8U+lQ1irE+o
 CuoI7JQYSPYgUjGhrOQdOpKx7ZPuJGHL5zrWS3NRG7XBsGY5T4UsSz5RQ Q==;
X-CSE-ConnectionGUID: qiuBcPt9SqCtbB7MDkSd3w==
X-CSE-MsgGUID: 4cz907aERD+HnCav8UuF7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1118142"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1118142"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 05:40:25 -0700
X-CSE-ConnectionGUID: Ysoi1AjwTVGUDvwbHrmPXw==
X-CSE-MsgGUID: 0p0EOV8TSA+UF/fLCXEjyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2588995"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 05:40:24 -0700
Date: Mon, 19 Oct 2026 14:40:21 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Swati Sharma <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/kms_color_pipeline: Test only first/last
 plane in simulation
Message-ID: <20261019124021.ld6ewcsokznkwcik@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20261016080500.1378982-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261016080500.1378982-1-swati2.sharma@intel.com>
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

Hi Swati,
On 2026-10-16 at 13:35:00 +0530, Swati Sharma wrote:
> The plane-fixed-matrix-* subtests run a dynamic subtest for every plane
> that supports a color pipeline, on every pipe. On simulation this takes
> long enough that the subtests time out.
> 
> When running in simulation, test only the first and last planes that
> support a color pipeline, as other tests (e.g. kms_plane_alpha_blend)
> already do. Non-simulation runs still cover all planes.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/kms_color_pipeline.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
> index bf4781796..9a5c44e41 100644
> --- a/tests/kms_color_pipeline.c
> +++ b/tests/kms_color_pipeline.c
> @@ -407,6 +407,8 @@ static void test_plane_fixed_matrix_colorops(data_t *data, igt_crtc_t *crtc,
>  					     kms_colorop_t *colorops[])
>  {
>  	int n_planes = crtc->n_planes;
> +	int first_plane = -1, last_plane = -1;
> +	bool in_simulation = igt_run_in_simulation();
>  	igt_output_t *output = data->output;
>  	drmModeModeInfo *mode = data->mode;
>  	igt_plane_t *plane;
> @@ -433,12 +435,29 @@ static void test_plane_fixed_matrix_colorops(data_t *data, igt_crtc_t *crtc,
>  	capture_sw_converted_ref_crc(data, output, &yuv_fb, &ref_crc);
>  	igt_remove_fb(data->drm_fd, &yuv_fb);
>  
> +	/* Get first & last planes supporting color pipeline. */
>  	for (int plane_id = 0; plane_id < n_planes; plane_id++) {
>  		plane = igt_output_get_plane(output, plane_id);
>  
>  		if (!igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE))
>  			continue;
>  
> +		if (first_plane < 0)
> +			first_plane = plane_id;
> +
> +		last_plane = plane_id;
> +	}
> +
> +	for (int plane_id = 0; plane_id < n_planes; plane_id++) {
> +		plane = igt_output_get_plane(output, plane_id);
> +
> +		if (!igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE))
> +			continue;
> +
> +		if (in_simulation &&
> +		    plane_id != first_plane && plane_id != last_plane)
> +			continue;
> +
>  		igt_dynamic_f("pipe-%s-plane-%u", igt_crtc_name(crtc), plane_id)
>  			_test_plane_colorops(data, plane, fb_colors,
>  					     &ref_crc, colorops,
> -- 
> 2.25.1
> 
