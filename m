Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43AF9C44501
	for <igt-dev@archiver.kernel.org>; Wed, 21 Jan 2026 09:45:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3B8310E22C;
	Wed, 21 Jan 2026 09:45:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="karxDDeU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C49B10E22C
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 09:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768988706; x=1800524706;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=gCr8oYsQE2iUnpG4SBF1xHnPnT0l6Y1m4CNrDXedTpU=;
 b=karxDDeUpvBMAvxSwy02UtN1g/LGDNI7/4ZIC6n6myAgjNrxv5O1LDG6
 bnI2WX849unfFeGDm5aOT2dqm+HpE8NP5y7Z+0rD0ht9GtRkO9mTVauts
 3P9i+f0JC+ghVf4+HvCw/SyvNaV3VJwTHSpDvKS7oCHY58pjvIiAxjNHt
 wiVP4X4t8L152YcPEtst/5sSuoPAkuDXvyj4dHKUatOcksSdCLTs36dqv
 +XcSVcDJI2dG3nW1sL8mu5eq+Tqql259QmAOZ1a8zuXme0/i/XxTp/rY4
 RaiSSfhw3fXVTI32xVdituSBMhC7ABbSYcx58Epf0kZsow3l8Vw9f5W1f w==;
X-CSE-ConnectionGUID: cpNDMZ0kQO2zaBE6/rIjig==
X-CSE-MsgGUID: 1ldQsVxsQhayygEagD+eig==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="69409902"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="69409902"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 01:45:06 -0800
X-CSE-ConnectionGUID: 9Quvfuw8S/STSCIsDuZ1cw==
X-CSE-MsgGUID: 0rJ48f2fSIyQlVsuKToEgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="206316749"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.119])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 01:45:04 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 06/12] lib/kms: Eliminate some redundant
 igt_crtc_for_pipe()s
In-Reply-To: <20260120171656.15840-7-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260120171656.15840-1-ville.syrjala@linux.intel.com>
 <20260120171656.15840-7-ville.syrjala@linux.intel.com>
Date: Wed, 21 Jan 2026 11:45:01 +0200
Message-ID: <e324527fde2a1e972f215261be897a7a4b014846@intel.com>
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
> A bunch of places already have the igt_crtc_t around
> in some variable. Use it instead of repeating the
> igt_crtc_for_pipe().
>
> Done with cocci:
>  #include "scripts/iterators.cocci"
>
> @@
> expression CRTC, DISPLAY, DISPLAY2, PIPE;
> @@
> {
> ...
> CRTC =3D igt_crtc_for_pipe(DISPLAY, PIPE)
> <+...
> - igt_crtc_for_pipe(DISPLAY2, PIPE)
> + CRTC
> ...+>
> }
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  tests/amdgpu/amd_abm.c                  | 2 +-
>  tests/amdgpu/amd_bypass.c               | 2 +-
>  tests/amdgpu/amd_color.c                | 2 +-
>  tests/amdgpu/amd_ilr.c                  | 2 +-
>  tests/amdgpu/amd_link_settings.c        | 2 +-
>  tests/amdgpu/amd_mall.c                 | 2 +-
>  tests/amdgpu/amd_max_bpc.c              | 2 +-
>  tests/amdgpu/amd_mem_leak.c             | 2 +-
>  tests/amdgpu/amd_multidisplay_modeset.c | 2 +-
>  tests/amdgpu/amd_odm.c                  | 2 +-
>  tests/amdgpu/amd_psr.c                  | 2 +-
>  tests/amdgpu/amd_replay.c               | 2 +-
>  tests/intel/gem_pxp.c                   | 2 +-
>  tests/intel/kms_sharpness_filter.c      | 2 +-
>  tests/intel/xe_pxp.c                    | 4 ++--
>  tests/kms_atomic_transition.c           | 4 ++--
>  tests/kms_hdr.c                         | 2 +-
>  tests/kms_multipipe_modeset.c           | 4 ++--
>  tools/amd_hdmi_compliance.c             | 2 +-
>  19 files changed, 22 insertions(+), 22 deletions(-)
>
> diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
> index 0048304baf9c..ab52c83e8f9c 100644
> --- a/tests/amdgpu/amd_abm.c
> +++ b/tests/amdgpu/amd_abm.c
> @@ -147,7 +147,7 @@ static void test_init(data_t *data)
>  		 igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
>=20=20
>  	igt_output_set_crtc(data->output,
> -			    igt_crtc_for_pipe(data->output->display, data->pipe_id));
> +			    data->pipe);
>=20=20
>  	data->w =3D data->mode->hdisplay;
>  	data->h =3D data->mode->vdisplay;
> diff --git a/tests/amdgpu/amd_bypass.c b/tests/amdgpu/amd_bypass.c
> index 359387859d08..626c4bf36c13 100644
> --- a/tests/amdgpu/amd_bypass.c
> +++ b/tests/amdgpu/amd_bypass.c
> @@ -93,7 +93,7 @@ static void test_init(data_t *data)
>  					  AMDGPU_PIPE_CRC_SOURCE_DPRX);
>=20=20
>  	igt_output_set_crtc(data->output,
> -			    igt_crtc_for_pipe(data->output->display, data->pipe_id));
> +			    data->pipe);
>=20=20
>  	data->width =3D data->mode->hdisplay;
>  	data->height =3D data->mode->vdisplay;
> diff --git a/tests/amdgpu/amd_color.c b/tests/amdgpu/amd_color.c
> index d1e164673560..28622d8e16ed 100644
> --- a/tests/amdgpu/amd_color.c
> +++ b/tests/amdgpu/amd_color.c
> @@ -197,7 +197,7 @@ static void test_init(data_t *data)
>  					  IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
>  	igt_output_set_crtc(data->output,
> -			    igt_crtc_for_pipe(data->output->display, data->pipe_id));
> +			    data->pipe);
>=20=20
>  	data->w =3D data->mode->hdisplay;
>  	data->h =3D data->mode->vdisplay;
> diff --git a/tests/amdgpu/amd_ilr.c b/tests/amdgpu/amd_ilr.c
> index f1db9649c4e8..70254bdc1288 100644
> --- a/tests/amdgpu/amd_ilr.c
> +++ b/tests/amdgpu/amd_ilr.c
> @@ -104,7 +104,7 @@ static void test_init(data_t *data, igt_output_t *out=
put)
>  					  AMDGPU_PIPE_CRC_SOURCE_DPRX);
>=20=20
>  	igt_output_set_crtc(output,
> -			    igt_crtc_for_pipe(output->display, data->pipe_id));
> +			    data->pipe);
>=20=20
>  	data->primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIM=
ARY);
>  }
> diff --git a/tests/amdgpu/amd_link_settings.c b/tests/amdgpu/amd_link_set=
tings.c
> index d042eb58d656..83d53ee54250 100644
> --- a/tests/amdgpu/amd_link_settings.c
> +++ b/tests/amdgpu/amd_link_settings.c
> @@ -103,7 +103,7 @@ static void test_init(data_t *data, igt_output_t *out=
put)
>  	data->pipe =3D igt_crtc_for_pipe(&data->display, data->pipe_id);
>=20=20
>  	igt_output_set_crtc(output,
> -			    igt_crtc_for_pipe(output->display, data->pipe_id));
> +			    data->pipe);
>=20=20
>  	data->primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIM=
ARY);
>  }
> diff --git a/tests/amdgpu/amd_mall.c b/tests/amdgpu/amd_mall.c
> index 1673bfd8531f..baa475ed0fbf 100644
> --- a/tests/amdgpu/amd_mall.c
> +++ b/tests/amdgpu/amd_mall.c
> @@ -89,7 +89,7 @@ static void test_init(data_t *data)
>  					  IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
>  	igt_output_set_crtc(data->output,
> -			    igt_crtc_for_pipe(data->output->display, data->pipe_id));
> +			    data->pipe);
>=20=20
>  	data->w =3D data->mode->hdisplay;
>  	data->h =3D data->mode->vdisplay;
> diff --git a/tests/amdgpu/amd_max_bpc.c b/tests/amdgpu/amd_max_bpc.c
> index b5e3f7aa40cf..b25cc80f3817 100644
> --- a/tests/amdgpu/amd_max_bpc.c
> +++ b/tests/amdgpu/amd_max_bpc.c
> @@ -86,7 +86,7 @@ static void test_init(data_t *data)
>  					  IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
>  	igt_output_set_crtc(data->output,
> -			    igt_crtc_for_pipe(data->output->display, data->pipe_id));
> +			    data->pipe);
>=20=20
>  	data->w =3D data->mode->hdisplay;
>  	data->h =3D data->mode->vdisplay;
> diff --git a/tests/amdgpu/amd_mem_leak.c b/tests/amdgpu/amd_mem_leak.c
> index e6321c215d4e..2897e6d82b12 100644
> --- a/tests/amdgpu/amd_mem_leak.c
> +++ b/tests/amdgpu/amd_mem_leak.c
> @@ -68,7 +68,7 @@ static void test_init(data_t *data)
>  		igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
>=20=20
>  	igt_output_set_crtc(data->output,
> -			    igt_crtc_for_pipe(data->output->display, data->pipe_id));
> +			    data->pipe);
>=20=20
>  	data->w =3D data->mode->hdisplay;
>  	data->h =3D data->mode->vdisplay;
> diff --git a/tests/amdgpu/amd_multidisplay_modeset.c b/tests/amdgpu/amd_m=
ultidisplay_modeset.c
> index e2200be2dbb3..2af063a9937b 100644
> --- a/tests/amdgpu/amd_multidisplay_modeset.c
> +++ b/tests/amdgpu/amd_multidisplay_modeset.c
> @@ -161,7 +161,7 @@ static void test_init(struct data_t *data)
>  		 */
>  		output =3D igt_get_single_output_for_pipe(display, i);
>  		pipes =3D igt_crtc_for_pipe(display, i);
> -		data->primary[i] =3D igt_crtc_get_plane_type(igt_crtc_for_pipe(&data->=
display, i),
> +		data->primary[i] =3D igt_crtc_get_plane_type(pipes,
>  							   DRM_PLANE_TYPE_PRIMARY);
>  		data->output[i] =3D output;
>=20=20
> diff --git a/tests/amdgpu/amd_odm.c b/tests/amdgpu/amd_odm.c
> index c8c268b982e5..b6a09b65f14b 100644
> --- a/tests/amdgpu/amd_odm.c
> +++ b/tests/amdgpu/amd_odm.c
> @@ -78,7 +78,7 @@ static void test_init(struct data *data)
>=20=20
>  	data->primary =3D igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_PR=
IMARY);
>  	igt_output_set_crtc(data->output,
> -			    igt_crtc_for_pipe(data->output->display, data->pipe_id));
> +			    data->pipe);
>=20=20
>  	igt_display_reset(display);
>  }
> diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
> index b98d43718251..af52f0e4ed54 100644
> --- a/tests/amdgpu/amd_psr.c
> +++ b/tests/amdgpu/amd_psr.c
> @@ -197,7 +197,7 @@ static void test_init(data_t *data)
>  					  IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
>  	igt_output_set_crtc(data->output,
> -			    igt_crtc_for_pipe(data->output->display, data->pipe_id));
> +			    data->pipe);
>=20=20
>  	data->w =3D data->mode->hdisplay;
>  	data->h =3D data->mode->vdisplay;
> diff --git a/tests/amdgpu/amd_replay.c b/tests/amdgpu/amd_replay.c
> index 65707a3c384e..cd340fabc3a3 100644
> --- a/tests/amdgpu/amd_replay.c
> +++ b/tests/amdgpu/amd_replay.c
> @@ -78,7 +78,7 @@ static void test_init(struct test_data *data)
>  		 igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
>=20=20
>  	igt_output_set_crtc(data->output,
> -			    igt_crtc_for_pipe(data->output->display, data->pipe_id));
> +			    data->pipe);
>=20=20
>  	data->w =3D data->mode->hdisplay;
>  	data->h =3D data->mode->vdisplay;
> diff --git a/tests/intel/gem_pxp.c b/tests/intel/gem_pxp.c
> index 9015397c8a91..b45cfde0c1ac 100644
> --- a/tests/intel/gem_pxp.c
> +++ b/tests/intel/gem_pxp.c
> @@ -1230,7 +1230,7 @@ static void test_display_protected_crc(int i915, ig=
t_display_t *display)
>  		plane =3D igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>  		igt_require(igt_pipe_connector_valid(i, output));
>  		igt_output_set_crtc(output,
> -				    igt_crtc_for_pipe(output->display, i));
> +				    pipe);
>=20=20
>  		igt_plane_set_fb(plane, &ref_fb);
>  		igt_fb_set_size(&ref_fb, plane, mode->hdisplay, mode->vdisplay);
> diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpne=
ss_filter.c
> index 2f3044c7a9c7..45285818c895 100644
> --- a/tests/intel/kms_sharpness_filter.c
> +++ b/tests/intel/kms_sharpness_filter.c
> @@ -446,7 +446,7 @@ run_sharpness_filter_test(data_t *data, enum test_typ=
e type)
>  			}
>=20=20
>  			igt_output_set_crtc(data->output,
> -					    igt_crtc_for_pipe(data->output->display, data->pipe_id));
> +					    data->pipe);
>=20=20
>  			if (!intel_pipe_output_combo_valid(display)) {
>  				igt_output_set_crtc(data->output, NULL);
> diff --git a/tests/intel/xe_pxp.c b/tests/intel/xe_pxp.c
> index 87c2c67394dd..2642109693d3 100644
> --- a/tests/intel/xe_pxp.c
> +++ b/tests/intel/xe_pxp.c
> @@ -906,7 +906,7 @@ static void test_display_pxp_fb(int fd, igt_display_t=
 *display)
>  		plane =3D igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>  		igt_require(igt_pipe_connector_valid(i, output));
>  		igt_output_set_crtc(output,
> -				    igt_crtc_for_pipe(output->display, i));
> +				    pipe);
>=20=20
>  		commit_fb(display, plane, &ref_fb, mode);
>=20=20
> @@ -964,7 +964,7 @@ static void test_display_black_pxp_fb(int fd, igt_dis=
play_t *display)
>  		plane =3D igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>  		igt_require(igt_pipe_connector_valid(i, output));
>  		igt_output_set_crtc(output,
> -				    igt_crtc_for_pipe(output->display, i));
> +				    pipe);
>=20=20
>  		igt_plane_set_fb(plane, &ref_fb);
>  		igt_fb_set_size(&ref_fb, plane, mode->hdisplay, mode->vdisplay);
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index 883a90e04a1a..ca97edbc73e0 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -937,7 +937,7 @@ retry:
>  				continue;
>=20=20
>  			igt_output_set_crtc(output,
> -					    igt_crtc_for_pipe(output->display, i));
> +					    pipe);
>  			if (intel_pipe_output_combo_valid(&data->display)) {
>  				mode =3D igt_output_get_mode(output);
>=20=20
> @@ -957,7 +957,7 @@ retry:
>  			igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
>=20=20
>  			if (fencing)
> -				igt_crtc_request_out_fence(igt_crtc_for_pipe(&data->display, i));
> +				igt_crtc_request_out_fence(pipe);
>  		} else {
>  			igt_plane_set_fb(plane, NULL);
>  		}
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index 8f05a4f40e64..6fb936955d62 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -226,7 +226,7 @@ static void prepare_test(data_t *data, igt_output_t *=
output, enum pipe pipe)
>  					  IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
>  	igt_output_set_crtc(data->output,
> -			    igt_crtc_for_pipe(data->output->display, data->pipe_id));
> +			    data->pipe);
>  	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
>=20=20
>  	data->w =3D data->mode->hdisplay;
> diff --git a/tests/kms_multipipe_modeset.c b/tests/kms_multipipe_modeset.c
> index cfab18cc65c5..27df48899d71 100644
> --- a/tests/kms_multipipe_modeset.c
> +++ b/tests/kms_multipipe_modeset.c
> @@ -84,7 +84,7 @@ static void run_test(data_t *data, int valid_outputs)
>  						IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
>  		igt_output_set_crtc(output,
> -				    igt_crtc_for_pipe(output->display, i));
> +				    pipe);
>  		mode =3D igt_output_get_mode(output);
>  		igt_assert(mode);
>=20=20
> @@ -107,7 +107,7 @@ static void run_test(data_t *data, int valid_outputs)
>  		mode =3D NULL;
>=20=20
>  		igt_output_set_crtc(output,
> -				    igt_crtc_for_pipe(output->display, i));
> +				    pipe);
>  		mode =3D igt_output_get_mode(output);
>  		igt_assert(mode);
>=20=20
> diff --git a/tools/amd_hdmi_compliance.c b/tools/amd_hdmi_compliance.c
> index e8eeaf95c64c..6f6f6979ad6b 100644
> --- a/tools/amd_hdmi_compliance.c
> +++ b/tools/amd_hdmi_compliance.c
> @@ -410,7 +410,7 @@ static void test_init(data_t *data, int conn_id)
>  		igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
>=20=20
>  	igt_output_set_crtc(data->output,
> -			    igt_crtc_for_pipe(data->output->display, data->pipe_id));
> +			    data->pipe);
>=20=20
>  	if (data->timeout_seconds > 0) {
>  		struct sigaction sa;

--=20
Jani Nikula, Intel
