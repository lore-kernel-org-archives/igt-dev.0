Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11805C44501
	for <igt-dev@archiver.kernel.org>; Wed, 21 Jan 2026 09:36:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B765910E22C;
	Wed, 21 Jan 2026 09:36:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iDsoNSzP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8F8F10E22C
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 09:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768988166; x=1800524166;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=a580IGtTWhZoRXJkwmUiG7V+C5M0+WmAfNL/6/Szq4c=;
 b=iDsoNSzPYbWxgcfkIL+rHuUuQSKm1gaPKN/A1StzuAHsQWS6JkpPp1zV
 Tg37ZrhwgZ1G3aGWdhA6Q8a2Fo227IY1RmU5VeINRill9l5pr1850YCMI
 AjkGjaDIPV/Tib9awYiJgSdii+aAAqlz3P3iD0es7CyVMDSreahlejgou
 ydNc0v1HLY4zKKVgGMnu0DDFDZm0h/SWTRAz/SyAoa22oaN5/gZ/Lti/S
 mDdTC8yLSCOoXwQmnTjjDDykOQq28WUjuO6Cf6K2WJjq5lr06m1ZNMPT9
 vlUWgB487GKxn6STnyHpDU6sXIpBkqxXWNBRcJBaJP4xufWSj14VcLg3S A==;
X-CSE-ConnectionGUID: HQL6LvxtTuiCr/mdJ6TAyA==
X-CSE-MsgGUID: mGwSDNmfQ3+Ply2ENIqrHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70112006"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="70112006"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 01:36:05 -0800
X-CSE-ConnectionGUID: 0qcatecyTj2Bl6gFPgJI/g==
X-CSE-MsgGUID: 6edXN+uNQKqyynjuz+y2Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="211254026"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.119])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 01:36:04 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 09/12] lib/kms: Use igt_crtc_crc_new()
In-Reply-To: <20260120171656.15840-10-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260120171656.15840-1-ville.syrjala@linux.intel.com>
 <20260120171656.15840-10-ville.syrjala@linux.intel.com>
Date: Wed, 21 Jan 2026 11:36:01 +0200
Message-ID: <496f9d1070abde4c609f7d556bc6ca9b35ef620f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Tue, 20 Jan 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Replace igt_pipe_crc_new*() with igt_crtc_crc_new*() in
> the places that already have the igt_crtc_t around.
>
> Done with cocci:
>  #include "scripts/iterators.cocci"
>
> @@
> typedef igt_crtc_t;
> igt_crtc_t *CRTC;
> expression FD;
> @@
> (
> - igt_pipe_crc_new(FD, CRTC->pipe
> + igt_crtc_crc_new(CRTC
> 	,...)
> |
> - igt_pipe_crc_new_nonblock(FD, CRTC->pipe
> + igt_crtc_crc_new_nonblock(CRTC
> 	,...)
> )
>
> @@
> typedef igt_plane_t;
> igt_plane_t *PLANE;
> expression FD;
> @@
> (
> - igt_pipe_crc_new(FD, PLANE->pipe->pipe
> + igt_crtc_crc_new(PLANE->pipe
> 	,...)
> |
> - igt_pipe_crc_new_nonblock(FD, PLANE->pipe->pipe
> + igt_crtc_crc_new_nonblock(PLANE->pipe
> 	,...)
> )
>
> @@
> expression FD, CRTC, DISPLAY, PIPE;
> @@
> {
> ...
>  CRTC =3D igt_crtc_for_pipe(DISPLAY, PIPE)
> <+...
> - igt_pipe_crc_new(FD, PIPE
> + igt_crtc_crc_new(CRTC
>   ,...)
> ...+>
> }
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  tests/amdgpu/amd_bypass.c               | 2 +-
>  tests/amdgpu/amd_color.c                | 2 +-
>  tests/amdgpu/amd_dp_dsc.c               | 2 +-
>  tests/amdgpu/amd_hotplug.c              | 2 +-
>  tests/amdgpu/amd_ilr.c                  | 2 +-
>  tests/amdgpu/amd_mall.c                 | 2 +-
>  tests/amdgpu/amd_max_bpc.c              | 2 +-
>  tests/amdgpu/amd_multidisplay_modeset.c | 9 ++++-----
>  tests/amdgpu/amd_plane.c                | 2 +-
>  tests/amdgpu/amd_psr.c                  | 2 +-
>  tests/amdgpu/amd_subvp.c                | 3 +--
>  tests/intel/gem_pxp.c                   | 2 +-
>  tests/intel/xe_pxp.c                    | 2 +-
>  tests/kms_atomic_transition.c           | 2 +-
>  tests/kms_bw.c                          | 2 +-
>  tests/kms_color.c                       | 3 +--
>  tests/kms_color_pipeline.c              | 3 +--
>  tests/kms_hdr.c                         | 2 +-
>  tests/kms_multipipe_modeset.c           | 2 +-
>  tests/kms_plane_cursor.c                | 2 +-
>  20 files changed, 23 insertions(+), 27 deletions(-)
>
> diff --git a/tests/amdgpu/amd_bypass.c b/tests/amdgpu/amd_bypass.c
> index 626c4bf36c13..3924b84da736 100644
> --- a/tests/amdgpu/amd_bypass.c
> +++ b/tests/amdgpu/amd_bypass.c
> @@ -89,7 +89,7 @@ static void test_init(data_t *data)
>  	data->primary =3D
>  		igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
>=20=20
> -	data->pipe_crc =3D igt_pipe_crc_new(data->drm_fd, data->pipe_id,
> +	data->pipe_crc =3D igt_crtc_crc_new(data->pipe,
>  					  AMDGPU_PIPE_CRC_SOURCE_DPRX);
>=20=20
>  	igt_output_set_crtc(data->output,
> diff --git a/tests/amdgpu/amd_color.c b/tests/amdgpu/amd_color.c
> index 28622d8e16ed..df418bfbe7c1 100644
> --- a/tests/amdgpu/amd_color.c
> +++ b/tests/amdgpu/amd_color.c
> @@ -193,7 +193,7 @@ static void test_init(data_t *data)
>  	data->primary =3D
>  		igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
>=20=20
> -	data->pipe_crc =3D igt_pipe_crc_new(data->fd, data->pipe_id,
> +	data->pipe_crc =3D igt_crtc_crc_new(data->pipe,
>  					  IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
>  	igt_output_set_crtc(data->output,
> diff --git a/tests/amdgpu/amd_dp_dsc.c b/tests/amdgpu/amd_dp_dsc.c
> index 91298ba20cde..25ea4660c821 100644
> --- a/tests/amdgpu/amd_dp_dsc.c
> +++ b/tests/amdgpu/amd_dp_dsc.c
> @@ -70,7 +70,7 @@ static void test_init(data_t *data)
>  		data->primary[i] =3D igt_crtc_get_plane_type(
>  				data->pipe[i], DRM_PLANE_TYPE_PRIMARY);
>  		data->pipe_crc[i] =3D
> -				igt_pipe_crc_new(data->fd, data->pipe_id[i],
> +				igt_crtc_crc_new(data->pipe[i],
>  						 IGT_PIPE_CRC_SOURCE_AUTO);
>  	}
>=20=20
> diff --git a/tests/amdgpu/amd_hotplug.c b/tests/amdgpu/amd_hotplug.c
> index 774630696a61..82de393b6d32 100644
> --- a/tests/amdgpu/amd_hotplug.c
> +++ b/tests/amdgpu/amd_hotplug.c
> @@ -64,7 +64,7 @@ static void test_init(data_t *data)
>  		data->cursor[i] =3D igt_crtc_get_plane_type(
>  			data->pipe[i], DRM_PLANE_TYPE_CURSOR);
>  		data->pipe_crc[i] =3D
> -			igt_pipe_crc_new(data->fd, data->pipe_id[i],
> +			igt_crtc_crc_new(data->pipe[i],
>  					 IGT_PIPE_CRC_SOURCE_AUTO);
>  	}
>=20=20
> diff --git a/tests/amdgpu/amd_ilr.c b/tests/amdgpu/amd_ilr.c
> index 70254bdc1288..861110bcc7c3 100644
> --- a/tests/amdgpu/amd_ilr.c
> +++ b/tests/amdgpu/amd_ilr.c
> @@ -100,7 +100,7 @@ static void test_init(data_t *data, igt_output_t *out=
put)
>=20=20
>  	data->pipe =3D igt_crtc_for_pipe(&data->display, data->pipe_id);
>=20=20
> -	data->pipe_crc =3D igt_pipe_crc_new(data->drm_fd, data->pipe_id,
> +	data->pipe_crc =3D igt_crtc_crc_new(data->pipe,
>  					  AMDGPU_PIPE_CRC_SOURCE_DPRX);
>=20=20
>  	igt_output_set_crtc(output,
> diff --git a/tests/amdgpu/amd_mall.c b/tests/amdgpu/amd_mall.c
> index baa475ed0fbf..2c5345907d24 100644
> --- a/tests/amdgpu/amd_mall.c
> +++ b/tests/amdgpu/amd_mall.c
> @@ -85,7 +85,7 @@ static void test_init(data_t *data)
>  	data->primary =3D
>  		igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
>=20=20
> -	data->pipe_crc =3D igt_pipe_crc_new(data->fd, data->pipe_id,
> +	data->pipe_crc =3D igt_crtc_crc_new(data->pipe,
>  					  IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
>  	igt_output_set_crtc(data->output,
> diff --git a/tests/amdgpu/amd_max_bpc.c b/tests/amdgpu/amd_max_bpc.c
> index b25cc80f3817..46be469d9e13 100644
> --- a/tests/amdgpu/amd_max_bpc.c
> +++ b/tests/amdgpu/amd_max_bpc.c
> @@ -82,7 +82,7 @@ static void test_init(data_t *data)
>  	data->primary =3D
>  		igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
>=20=20
> -	data->pipe_crc =3D igt_pipe_crc_new(data->fd, data->pipe_id,
> +	data->pipe_crc =3D igt_crtc_crc_new(data->pipe,
>  					  IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
>  	igt_output_set_crtc(data->output,
> diff --git a/tests/amdgpu/amd_multidisplay_modeset.c b/tests/amdgpu/amd_m=
ultidisplay_modeset.c
> index 2af063a9937b..0af235e77394 100644
> --- a/tests/amdgpu/amd_multidisplay_modeset.c
> +++ b/tests/amdgpu/amd_multidisplay_modeset.c
> @@ -174,13 +174,12 @@ static void test_init(struct data_t *data)
>  			ret =3D dpcd_read_byte(data->fd, output->config.connector,
>  				DPCD_TEST_SINK_MISC, &dpcd_246h);
>  			if (ret && ((dpcd_246h & 0x20) !=3D 0x0))
> -				data->pipe_crc_dprx[i] =3D igt_pipe_crc_new(
> -					data->fd, pipes->pipe,
> -					AMDGPU_PIPE_CRC_SOURCE_DPRX);
> +				data->pipe_crc_dprx[i] =3D igt_crtc_crc_new(pipes,
> +									  AMDGPU_PIPE_CRC_SOURCE_DPRX);
>  		}
>=20=20
> -		data->pipe_crc_otg[i] =3D igt_pipe_crc_new(data->fd, pipes->pipe,
> -						IGT_PIPE_CRC_SOURCE_AUTO);
> +		data->pipe_crc_otg[i] =3D igt_crtc_crc_new(pipes,
> +							 IGT_PIPE_CRC_SOURCE_AUTO);
>  		/* disable eDP PSR */
>  		if (data->output[i]->config.connector->connector_type =3D=3D
>  				DRM_MODE_CONNECTOR_eDP) {
> diff --git a/tests/amdgpu/amd_plane.c b/tests/amdgpu/amd_plane.c
> index f56723d74485..369bce509a87 100644
> --- a/tests/amdgpu/amd_plane.c
> +++ b/tests/amdgpu/amd_plane.c
> @@ -166,7 +166,7 @@ static void test_init(data_t *data)
>  		data->cursor[i] =3D igt_crtc_get_plane_type(
>  			data->pipe[i], DRM_PLANE_TYPE_CURSOR);
>  		data->pipe_crc[i] =3D
> -			igt_pipe_crc_new(data->fd, data->pipe_id[i],
> +			igt_crtc_crc_new(data->pipe[i],
>  					 IGT_PIPE_CRC_SOURCE_AUTO);
>  	}
>=20=20
> diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
> index af52f0e4ed54..9479e8cd3de4 100644
> --- a/tests/amdgpu/amd_psr.c
> +++ b/tests/amdgpu/amd_psr.c
> @@ -193,7 +193,7 @@ static void test_init(data_t *data)
>  	data->overlay =3D
>  		igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_OVERLAY);
>=20=20
> -	data->pipe_crc =3D igt_pipe_crc_new(data->fd, data->pipe_id,
> +	data->pipe_crc =3D igt_crtc_crc_new(data->pipe,
>  					  IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
>  	igt_output_set_crtc(data->output,
> diff --git a/tests/amdgpu/amd_subvp.c b/tests/amdgpu/amd_subvp.c
> index a4ee50a85f78..f6465ba35b50 100644
> --- a/tests/amdgpu/amd_subvp.c
> +++ b/tests/amdgpu/amd_subvp.c
> @@ -69,8 +69,7 @@ static void test_init(struct data *data)
>  						  data->pipe_id[i]);
>  		data->primary[i] =3D igt_crtc_get_plane_type(data->pipe[i],
>  							   DRM_PLANE_TYPE_PRIMARY);
> -		data->pipe_crc[i] =3D igt_pipe_crc_new(data->fd,
> -						     data->pipe_id[i],
> +		data->pipe_crc[i] =3D igt_crtc_crc_new(data->pipe[i],
>  						     IGT_PIPE_CRC_SOURCE_AUTO);
>  	}
>=20=20
> diff --git a/tests/intel/gem_pxp.c b/tests/intel/gem_pxp.c
> index b45cfde0c1ac..d41a07b4c012 100644
> --- a/tests/intel/gem_pxp.c
> +++ b/tests/intel/gem_pxp.c
> @@ -1245,7 +1245,7 @@ static void test_display_protected_crc(int i915, ig=
t_display_t *display)
>  	for_each_connected_output(display, output) {
>  		mode =3D igt_output_get_mode(output);
>  		pipe =3D igt_crtc_for_pipe(display, output->pending_pipe);
> -		pipe_crc =3D igt_pipe_crc_new(i915, pipe->pipe,
> +		pipe_crc =3D igt_crtc_crc_new(pipe,
>  					    IGT_PIPE_CRC_SOURCE_AUTO);
>  		plane =3D igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>  		igt_require(igt_pipe_connector_valid(pipe->pipe, output));
> diff --git a/tests/intel/xe_pxp.c b/tests/intel/xe_pxp.c
> index 2642109693d3..6aadf691a3ae 100644
> --- a/tests/intel/xe_pxp.c
> +++ b/tests/intel/xe_pxp.c
> @@ -846,7 +846,7 @@ static void compare_crcs(int fd, igt_display_t *displ=
ay, igt_fb_t *ref_fb, igt_f
>  	for_each_connected_output(display, output) {
>  		mode =3D igt_output_get_mode(output);
>  		pipe =3D igt_crtc_for_pipe(display, output->pending_pipe);
> -		pipe_crc =3D igt_pipe_crc_new(fd, pipe->pipe,
> +		pipe_crc =3D igt_crtc_crc_new(pipe,
>  					    IGT_PIPE_CRC_SOURCE_AUTO);
>  		plane =3D igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>  		igt_require(igt_pipe_connector_valid(pipe->pipe, output));
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index ca97edbc73e0..60f743c6c614 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -929,7 +929,7 @@ retry:
>  		j +=3D 1;
>=20=20
>  		if (is_intel_device(data->drm_fd))
> -			data->pipe_crcs[i] =3D igt_pipe_crc_new(data->drm_fd, i,
> +			data->pipe_crcs[i] =3D igt_crtc_crc_new(pipe,
>  							      IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
>  		for_each_valid_output_on_pipe(&data->display, i, output) {
> diff --git a/tests/kms_bw.c b/tests/kms_bw.c
> index 13c8e3bec2b9..13e2bdfba266 100644
> --- a/tests/kms_bw.c
> +++ b/tests/kms_bw.c
> @@ -130,7 +130,7 @@ static void test_init(data_t *data, bool physical)
>  		data->primary[i] =3D igt_crtc_get_plane_type(
>  			data->pipe[i], DRM_PLANE_TYPE_PRIMARY);
>  		data->pipe_crc[i] =3D
> -			igt_pipe_crc_new(data->fd, data->pipe_id[i],
> +			igt_crtc_crc_new(data->pipe[i],
>  					 IGT_PIPE_CRC_SOURCE_AUTO);
>  	}
>=20=20
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index 529fa33ab000..baa629a84b42 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -740,8 +740,7 @@ static void test_setup(data_t *data, enum pipe p)
>  	igt_require(pipe->n_planes >=3D 0);
>=20=20
>  	data->primary =3D igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> -	data->pipe_crc =3D igt_pipe_crc_new(data->drm_fd,
> -					  data->primary->pipe->pipe,
> +	data->pipe_crc =3D igt_crtc_crc_new(data->primary->pipe,
>  					  IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
>  	igt_display_reset(&data->display);
> diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
> index e1b7c50e6d5f..e360f77af45e 100644
> --- a/tests/kms_color_pipeline.c
> +++ b/tests/kms_color_pipeline.c
> @@ -62,8 +62,7 @@ static void test_setup(data_t *data, enum pipe p)
>  	data->mode =3D igt_output_get_mode(data->output);
>  	igt_require(data->mode);
>=20=20
> -	data->pipe_crc =3D igt_pipe_crc_new(data->drm_fd,
> -					  data->primary->pipe->pipe,
> +	data->pipe_crc =3D igt_crtc_crc_new(data->primary->pipe,
>  					  IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
>  	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index 6fb936955d62..f4c88bc04ab7 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -222,7 +222,7 @@ static void prepare_test(data_t *data, igt_output_t *=
output, enum pipe pipe)
>  	data->primary =3D
>  		igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
>=20=20
> -	data->pipe_crc =3D igt_pipe_crc_new(data->fd, data->pipe_id,
> +	data->pipe_crc =3D igt_crtc_crc_new(data->pipe,
>  					  IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
>  	igt_output_set_crtc(data->output,
> diff --git a/tests/kms_multipipe_modeset.c b/tests/kms_multipipe_modeset.c
> index 27df48899d71..8270f6e12ec5 100644
> --- a/tests/kms_multipipe_modeset.c
> +++ b/tests/kms_multipipe_modeset.c
> @@ -80,7 +80,7 @@ static void run_test(data_t *data, int valid_outputs)
>=20=20
>  		mode =3D NULL;
>=20=20
> -		pipe_crcs[i] =3D igt_pipe_crc_new(display->drm_fd, i,
> +		pipe_crcs[i] =3D igt_crtc_crc_new(pipe,
>  						IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
>  		igt_output_set_crtc(output,
> diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
> index 9e2d59b80765..23febe05a473 100644
> --- a/tests/kms_plane_cursor.c
> +++ b/tests/kms_plane_cursor.c
> @@ -108,7 +108,7 @@ static void test_init(data_t *data, enum pipe pipe_id=
, igt_output_t *output,
>  		 kmstest_pipe_name(data->pipe_id), igt_output_name(data->output));
>=20=20
>  	igt_require_pipe_crc(data->drm_fd);
> -	data->pipe_crc =3D igt_pipe_crc_new(data->drm_fd, data->pipe_id,
> +	data->pipe_crc =3D igt_crtc_crc_new(data->pipe,
>  					  IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
>  	/* Overlay rectangle for a rect in the center of the screen */

--=20
Jani Nikula, Intel
