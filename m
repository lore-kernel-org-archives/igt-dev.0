Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D0AFC3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 18:20:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB0B310E18B;
	Mon, 19 Aug 2024 18:20:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J89FTaCN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3577D10E18B
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 18:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724091656; x=1755627656;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Jwf3hELm9lw3yPN7kWOUvmX6UYeGj4D3IfTWTA/78nw=;
 b=J89FTaCNsSBhyumT4v5JVtq+3EnNhfB96UEq7RuA1i/6PI54zcoUcKBS
 VyqIPEjt3N37fI5kUjf4zCz6V2PVtB0S8IcG7knLJAqwfFWUczUDmft8p
 M4pq88yQK9SuO2ivz3zhQQemqsXes39vFvPs175nPgOCLhcj9Flevs86X
 sXwVbh+3MQlIwroUPElhUP7n7z5xpAe/rM6kdyvEjv8E1SHBiCyrE7E9i
 GAaaF0lr0jMwDvoUhxxbBKadZNRoem8LzrveulEFcPpHYut94zCFYR6+Q
 Au09NOTCypzvx1sMVJpREk00vpEc/uhXvVuKycs0WmvfDBGCA3clD52KK A==;
X-CSE-ConnectionGUID: 17bnCikqRTOhxOzEs7C/gg==
X-CSE-MsgGUID: GGJtBNI3SuePf0hvfhEzbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22328001"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="22328001"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 11:20:56 -0700
X-CSE-ConnectionGUID: m2CR1S+3R+qsm1f/DMICQQ==
X-CSE-MsgGUID: fMKu6yoRQECKqWhyYm1img==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="65342447"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 11:20:54 -0700
Date: Mon, 19 Aug 2024 20:20:50 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Rob Clark <robdclark@gmail.com>, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH 1/2] tests/kms_plane_scaling: Pass display to
 get_num_scalers()
Message-ID: <20240819182050.we4u4fdo32d34vvg@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Rob Clark <robdclark@chromium.org>
References: <20240814185339.70097-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240814185339.70097-1-robdclark@gmail.com>
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

Hi Rob,
On 2024-08-14 at 11:53:38 -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Prep for next patch.  The next commit will need the display to figure
> out the # of scalers.  This commit has no functional change, just
-------- ^
Please use word 'number' here. With this
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> plumbing the extra parameter everywhere.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  lib/igt_kms.c             |  5 +++--
>  lib/igt_kms.h             |  2 +-
>  tests/kms_plane_scaling.c | 24 ++++++++++++------------
>  3 files changed, 16 insertions(+), 15 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index e030b35a6051..99cdeeb76033 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6650,17 +6650,18 @@ int igt_get_dp_mst_connector_id(igt_output_t *output)
>  
>  /**
>   * get_num_scalers:
> - * @drm_fd: drm file descriptor
> + * @display: the display
>   * @pipe: display pipe
>   *
>   * Returns: Number of scalers supported per pipe.
>   */
> -int get_num_scalers(int drm_fd, enum pipe pipe)
> +int get_num_scalers(igt_display_t *display, enum pipe pipe)
>  {
>  	char buf[8120];
>  	char *start_loc1, *start_loc2;
>  	int dir, res;
>  	int num_scalers = 0;
> +	int drm_fd = display->drm_fd;
>  	char dest[20] = ":pipe ";
>  
>  	strcat(dest, kmstest_pipe_name(pipe));
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index e8582a45b53e..25ba509164e3 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1223,6 +1223,6 @@ bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
>  bool intel_pipe_output_combo_valid(igt_display_t *display);
>  bool igt_check_output_is_dp_mst(igt_output_t *output);
>  int igt_get_dp_mst_connector_id(igt_output_t *output);
> -int get_num_scalers(int drm_fd, enum pipe pipe);
> +int get_num_scalers(igt_display_t *display, enum pipe pipe);
>  
>  #endif /* __IGT_KMS_H__ */
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 90bfb004773b..42eb67409899 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -1080,8 +1080,8 @@ static void test_scaler_with_multi_pipe_plane(data_t *d)
>  	igt_output_set_pipe(output1, pipe1);
>  	igt_output_set_pipe(output2, pipe2);
>  
> -	igt_require(get_num_scalers(d->drm_fd, pipe1) >= 2);
> -	igt_require(get_num_scalers(d->drm_fd, pipe2) >= 2);
> +	igt_require(get_num_scalers(display, pipe1) >= 2);
> +	igt_require(get_num_scalers(display, pipe2) >= 2);
>  
>  	plane[0] = igt_output_get_plane(output1, 0);
>  	igt_require(plane[0]);
> @@ -1169,7 +1169,7 @@ static void invalid_parameter_tests(data_t *d)
>  		igt_output_set_pipe(output, pipe);
>  		plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>  
> -		igt_require(get_num_scalers(d->drm_fd, pipe) >= 1);
> +		igt_require(get_num_scalers(&d->display, pipe) >= 1);
>  
>  		igt_create_fb(d->drm_fd, 256, 256,
>  			      DRM_FORMAT_XRGB8888,
> @@ -1346,7 +1346,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  					for_each_valid_output_on_pipe(&data.display, pipe, output) {
>  						if (!pipe_output_combo_valid(&data.display, pipe, output))
>  							continue;
> -						if (get_num_scalers(data.drm_fd, pipe) < 1)
> +						if (get_num_scalers(&data.display, pipe) < 1)
>  							continue;
>  
>  						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
> @@ -1370,7 +1370,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  					for_each_valid_output_on_pipe(&data.display, pipe, output) {
>  						if (!pipe_output_combo_valid(&data.display, pipe, output))
>  							continue;
> -						if (get_num_scalers(data.drm_fd, pipe) < 1)
> +						if (get_num_scalers(&data.display, pipe) < 1)
>  							continue;
>  
>  						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
> @@ -1394,7 +1394,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  					for_each_valid_output_on_pipe(&data.display, pipe, output) {
>  						if (!pipe_output_combo_valid(&data.display, pipe, output))
>  							continue;
> -						if (get_num_scalers(data.drm_fd, pipe) < 1)
> +						if (get_num_scalers(&data.display, pipe) < 1)
>  							continue;
>  
>  						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
> @@ -1417,7 +1417,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  				for_each_valid_output_on_pipe(&data.display, pipe, output) {
>  					if (!pipe_output_combo_valid(&data.display, pipe, output))
>  						continue;
> -					if (get_num_scalers(data.drm_fd, pipe) < 1)
> +					if (get_num_scalers(&data.display, pipe) < 1)
>  						continue;
>  
>  					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
> @@ -1437,7 +1437,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  				for_each_valid_output_on_pipe(&data.display, pipe, output) {
>  					if (!pipe_output_combo_valid(&data.display, pipe, output))
>  						continue;
> -					if (get_num_scalers(data.drm_fd, pipe) < 1)
> +					if (get_num_scalers(&data.display, pipe) < 1)
>  						continue;
>  
>  					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
> @@ -1457,7 +1457,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  				for_each_valid_output_on_pipe(&data.display, pipe, output) {
>  					if (!pipe_output_combo_valid(&data.display, pipe, output))
>  						continue;
> -					if (get_num_scalers(data.drm_fd, pipe) < 1)
> +					if (get_num_scalers(&data.display, pipe) < 1)
>  						continue;
>  
>  					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
> @@ -1477,7 +1477,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  				for_each_valid_output_on_pipe(&data.display, pipe, output) {
>  					if (!pipe_output_combo_valid(&data.display, pipe, output))
>  						continue;
> -					if (get_num_scalers(data.drm_fd, pipe) < 2)
> +					if (get_num_scalers(&data.display, pipe) < 2)
>  						continue;
>  
>  					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
> @@ -1502,7 +1502,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  					for_each_valid_output_on_pipe(&data.display, pipe, output) {
>  						drmModeModeInfo *mode = NULL;
>  
> -						if (get_num_scalers(data.drm_fd, pipe) < 1)
> +						if (get_num_scalers(&data.display, pipe) < 1)
>  							continue;
>  						/*
>  						 * Need to find mode with lowest vrefresh else
> @@ -1527,7 +1527,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  			for_each_pipe_with_valid_output(&data.display, pipe, output) {
>  				if (!pipe_output_combo_valid(&data.display, pipe, output))
>  					continue;
> -				if (get_num_scalers(data.drm_fd, pipe) < 1)
> +				if (get_num_scalers(&data.display, pipe) < 1)
>  						continue;
>  
>  				igt_dynamic_f("pipe-%s-%s-invalid-num-scalers",
> -- 
> 2.46.0
> 
