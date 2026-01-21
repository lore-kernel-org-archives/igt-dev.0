Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A54C44501
	for <igt-dev@archiver.kernel.org>; Wed, 21 Jan 2026 09:38:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E01E610E72F;
	Wed, 21 Jan 2026 09:38:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MlPHc+3V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F0A510E72F
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 09:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768988298; x=1800524298;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=lK1sdY5/dTDEKywAIM2HPLkavCC4osht28C5xGo44l0=;
 b=MlPHc+3VkjXpIM5gJR4bb6p4t+JzEvjfDAFV/GdZ8rlQs3Ge+NFy7qgM
 4BsGyLOKWlZ/q5L5/20cGPqU5PHGCIBAA+XJK4Y+zV+qO2IPEaQv8Em/x
 LXh2Y3TPrvG448V31lAXkyGa+e9Rbj1ztPzWdWf515S/KkIP05iIshWWK
 tftmNneGQzPbCBHemHvQJbuCQEOjf8Ob1zc0yDZF6QhZig+Z+dwRyuT3D
 yknDutSgFtV/cwOpXC30T+Wh92ijkVxgaSs7gK3rJnwsSoPjT4OJDqboq
 sxLUp/hiRomRfYDGn722O3w501Ox82jZJGIHHgUT07vy2vMbjIzY8iDzC g==;
X-CSE-ConnectionGUID: /m1LmYpPSLSr6vgzskbPdw==
X-CSE-MsgGUID: tgpbzj4HTMWMCrQq5Wg9MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="73840389"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="73840389"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 01:38:17 -0800
X-CSE-ConnectionGUID: CWA2k+dlToOHgRRLDsJ1+Q==
X-CSE-MsgGUID: YKFLnOIpTlWoKENiquwapw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="206218136"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.119])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 01:38:15 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 10/12] lib/kms: Use igt_crtc_crc_new() more
In-Reply-To: <20260120171656.15840-11-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260120171656.15840-1-ville.syrjala@linux.intel.com>
 <20260120171656.15840-11-ville.syrjala@linux.intel.com>
Date: Wed, 21 Jan 2026 11:38:11 +0200
Message-ID: <1cf7ebeaccb99d03de25598dc3ea9664f2ab09ac@intel.com>
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
> Switch over to igt_crtc_crc_new() from igt_pipe_crc_new()
> even for the places that don't have a igt_crtc_t around.
> This make it more obvious where we need to modify the
> tests when fully switching over from pipe to igt_crc_t.
>
> Done with cocci:
>  #include "scripts/iterators.cocci"
>
> @find_data@
> iterator name pipe_test;
> type T;
> T DATA;
> identifier FD;
> identifier DISPLAY;
> @@
> igt_display_require(&DATA.DISPLAY, DATA.FD);
>
> @depends on find_data@
> find_data.T *DATA;
> identifier find_data.FD;
> identifier find_data.DISPLAY;
> expression PIPE;
> @@
> - igt_pipe_crc_new(DATA->FD, PIPE
> + igt_crtc_crc_new(igt_crtc_for_pipe(&DATA->DISPLAY, PIPE)
> 	,...)
>
> @local_fd depends on find_data@
> find_data.T *DATA;
> identifier find_data.FD, FD2;
> identifier find_data.DISPLAY;
> expression PIPE;
> @@
> int FD2 =3D DATA->FD;
> <...
> - igt_pipe_crc_new(FD2, PIPE
> + igt_crtc_crc_new(igt_crtc_for_pipe(&DATA->DISPLAY, PIPE)
> 	,...)
> ...>
>
> @depends on local_fd@
> find_data.T *DATA;
> identifier find_data.FD;
> identifier FD2;
> @@
> - int FD2 =3D DATA->FD;
> ... when !=3D FD2
>
> @depends on find_data@
> typedef igt_display_t;
> identifier DISPLAY, find_data.FD;
> expression PIPE, E;
> find_data.T *DATA;
> @@
>  igt_display_t *DISPLAY =3D E;
> <...
> - igt_pipe_crc_new(DATA->FD, PIPE
> + igt_crtc_crc_new(igt_crtc_for_pipe(DISPLAY, PIPE)
> 	,...)
> ...>
>
> @depends on find_data@
> identifier find_data.DISPLAY, find_data.FD;
> expression PIPE;
> find_data.T find_data.DATA;
> @@
> - igt_pipe_crc_new(DATA.FD, PIPE
> + igt_crtc_crc_new(igt_crtc_for_pipe(&DATA.DISPLAY, PIPE)
> 	,...)
>
> @@
> igt_display_t *DISPLAY;
> expression PIPE;
> @@
> - igt_pipe_crc_new(DISPLAY->drm_fd, PIPE
> + igt_crtc_crc_new(igt_crtc_for_pipe(DISPLAY, PIPE)
> 	,...)
>
> @@
> expression DISPLAY, PIPE;
> @@
> igt_crtc_crc_new(...)
> {
> <...
> - igt_crtc_crc_new(igt_crtc_for_pipe(DISPLAY, PIPE)
> + igt_pipe_crc_new(DISPLAY->drm_fd, PIPE
> 	,...)
> ...>
> }
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  tests/amdgpu/amd_cursor_overlay.c      |  2 +-
>  tests/intel/kms_big_fb.c               |  4 ++--
>  tests/intel/kms_ccs.c                  |  2 +-
>  tests/intel/kms_dirtyfb.c              |  4 ++--
>  tests/intel/kms_fb_coherency.c         |  2 +-
>  tests/intel/kms_fbc_dirty_rect.c       |  2 +-
>  tests/intel/kms_flip_scaled_crc.c      |  2 +-
>  tests/intel/kms_flip_tiling.c          |  2 +-
>  tests/intel/kms_frontbuffer_tracking.c |  2 +-
>  tests/intel/kms_mmap_write_crc.c       |  2 +-
>  tests/intel/kms_pipe_stress.c          |  2 +-
>  tests/intel/kms_pwrite_crc.c           |  2 +-
>  tests/intel/kms_sharpness_filter.c     |  2 +-
>  tests/kms_async_flips.c                |  3 +--
>  tests/kms_atomic.c                     |  2 +-
>  tests/kms_cursor_crc.c                 |  2 +-
>  tests/kms_cursor_legacy.c              |  4 ++--
>  tests/kms_display_modes.c              |  6 ++++--
>  tests/kms_pipe_crc_basic.c             |  6 +++---
>  tests/kms_plane.c                      |  6 +++---
>  tests/kms_plane_alpha_blend.c          |  2 +-
>  tests/kms_plane_lowres.c               |  2 +-
>  tests/kms_plane_multiple.c             |  8 ++++----
>  tests/kms_rotation_crc.c               |  4 ++--
>  tests/kms_universal_plane.c            |  2 +-
>  tests/nouveau_crc.c                    | 16 +++++++++-------
>  26 files changed, 48 insertions(+), 45 deletions(-)
>
> diff --git a/tests/amdgpu/amd_cursor_overlay.c b/tests/amdgpu/amd_cursor_=
overlay.c
> index dff03cb9aa52..e500d9e34066 100644
> --- a/tests/amdgpu/amd_cursor_overlay.c
> +++ b/tests/amdgpu/amd_cursor_overlay.c
> @@ -157,7 +157,7 @@ static void test_init(data_t *data, enum pipe pipe_id=
, igt_output_t *output,
>  		 kmstest_pipe_name(data->pipe_id), igt_output_name(data->output));
>=20=20
>  	igt_require_pipe_crc(data->drm_fd);
> -	data->pipe_crc =3D igt_pipe_crc_new(data->drm_fd, data->pipe_id,
> +	data->pipe_crc =3D igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, d=
ata->pipe_id),
>  					  IGT_PIPE_CRC_SOURCE_AUTO);
>  }
>=20=20
> diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
> index 4c83398400ba..f6de287f57f2 100644
> --- a/tests/intel/kms_big_fb.c
> +++ b/tests/intel/kms_big_fb.c
> @@ -566,7 +566,7 @@ static bool test_pipe(data_t *data)
>  	igt_display_commit2(&data->display, data->display.is_atomic ?
>  			    COMMIT_ATOMIC : COMMIT_UNIVERSAL);
>=20=20
> -	data->pipe_crc =3D igt_pipe_crc_new(data->drm_fd, data->pipe,
> +	data->pipe_crc =3D igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, d=
ata->pipe),
>  					  IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
>  	for_each_plane_on_pipe(&data->display, data->pipe, data->plane) {
> @@ -632,7 +632,7 @@ max_hw_stride_async_flip_test(data_t *data)
>  		 data->hw_stride);
>  	generate_pattern(data, &data->big_fb_flip[1], 640, 480);
>=20=20
> -	data->pipe_crc =3D igt_pipe_crc_new(data->drm_fd, data->pipe,
> +	data->pipe_crc =3D igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, d=
ata->pipe),
>  					  IGT_PIPE_CRC_SOURCE_AUTO);
>  	igt_pipe_crc_start(data->pipe_crc);
>=20=20
> diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
> index 6512e206f047..ea23b6581b06 100644
> --- a/tests/intel/kms_ccs.c
> +++ b/tests/intel/kms_ccs.c
> @@ -1052,7 +1052,7 @@ static int test_ccs(data_t *data)
>  		 IGT_FORMAT_ARGS(data->format), IGT_MODIFIER_ARGS(data->ccs_modifier));
>=20=20
>  	if (data->flags & TEST_CRC) {
> -		data->pipe_crc =3D igt_pipe_crc_new(data->drm_fd, data->pipe,
> +		data->pipe_crc =3D igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, =
data->pipe),
>  						  IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
>  		if (try_config(data, fb_flags | FB_COMPRESSED, &ref_crc) &&
> diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
> index 5697afb2b3e1..407338affd6b 100644
> --- a/tests/intel/kms_dirtyfb.c
> +++ b/tests/intel/kms_dirtyfb.c
> @@ -232,8 +232,8 @@ static void prepare(data_t *data)
>  	igt_output_set_crtc(data->output,
>  			    igt_crtc_for_pipe(data->output->display, data->pipe));
>=20=20
> -	data->pipe_crc =3D igt_pipe_crc_new(data->drm_fd, data->pipe,
> -					 IGT_PIPE_CRC_SOURCE_AUTO);
> +	data->pipe_crc =3D igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, d=
ata->pipe),
> +					  IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
>  	igt_create_color_fb(data->drm_fd, data->mode->hdisplay,
>  			    data->mode->vdisplay, DRM_FORMAT_XRGB8888,
> diff --git a/tests/intel/kms_fb_coherency.c b/tests/intel/kms_fb_coherenc=
y.c
> index ca915bc16c4d..e6d043c114d5 100644
> --- a/tests/intel/kms_fb_coherency.c
> +++ b/tests/intel/kms_fb_coherency.c
> @@ -65,7 +65,7 @@ static void prepare_crtc(data_t *data)
>  	if (data->pipe_crc)
>  		igt_pipe_crc_free(data->pipe_crc);
>=20=20
> -	data->pipe_crc =3D igt_pipe_crc_new(data->drm_fd, data->pipe,
> +	data->pipe_crc =3D igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, d=
ata->pipe),
>  					  IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
>  	/* get reference crc for the white fb */
> diff --git a/tests/intel/kms_fbc_dirty_rect.c b/tests/intel/kms_fbc_dirty=
_rect.c
> index e063493ef4f4..c43acb7e9cb5 100644
> --- a/tests/intel/kms_fbc_dirty_rect.c
> +++ b/tests/intel/kms_fbc_dirty_rect.c
> @@ -409,7 +409,7 @@ static bool prepare_test(data_t *data)
>  	data->mode =3D igt_output_get_mode(data->output);
>  	igt_output_set_crtc(data->output,
>  			    igt_crtc_for_pipe(data->output->display, data->pipe));
> -	data->pipe_crc =3D igt_pipe_crc_new(data->drm_fd, data->pipe,
> +	data->pipe_crc =3D igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, d=
ata->pipe),
>  					  IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
>  	igt_require_f(intel_fbc_supported_on_chipset(data->drm_fd, data->pipe),
> diff --git a/tests/intel/kms_flip_scaled_crc.c b/tests/intel/kms_flip_sca=
led_crc.c
> index 3f8cd0bd642a..c2b1c0700499 100644
> --- a/tests/intel/kms_flip_scaled_crc.c
> +++ b/tests/intel/kms_flip_scaled_crc.c
> @@ -783,7 +783,7 @@ static void test_flip_to_scaled(data_t *data, uint32_=
t index,
>  		igt_pipe_crc_stop(data->pipe_crc);
>  		igt_pipe_crc_free(data->pipe_crc);
>  	}
> -	data->pipe_crc =3D igt_pipe_crc_new(data->drm_fd, pipe,
> +	data->pipe_crc =3D igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, p=
ipe),
>  					  IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
>  	igt_plane_set_position(primary, 0, 0);
> diff --git a/tests/intel/kms_flip_tiling.c b/tests/intel/kms_flip_tiling.c
> index e7ada7740cd2..269bb0e24d0a 100644
> --- a/tests/intel/kms_flip_tiling.c
> +++ b/tests/intel/kms_flip_tiling.c
> @@ -72,7 +72,7 @@ static void pipe_crc_new(data_t *data, int pipe)
>  	if (data->pipe_crc)
>  		return;
>=20=20
> -	data->pipe_crc =3D igt_pipe_crc_new(data->drm_fd, pipe,
> +	data->pipe_crc =3D igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, p=
ipe),
>  					  IGT_PIPE_CRC_SOURCE_AUTO);
>  	igt_assert(data->pipe_crc);
>  	igt_pipe_crc_start(data->pipe_crc);
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_fro=
ntbuffer_tracking.c
> index e8c8e342f5dc..7dd52f982d96 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -1987,7 +1987,7 @@ static void init_blue_crc(enum pixel_format format,=
 enum tiling_type tiling)
>  	igt_display_commit(&drm.display);
>=20=20
>  	if (!pipe_crc) {
> -		pipe_crc =3D igt_pipe_crc_new(drm.fd, prim_mode_params.pipe,
> +		pipe_crc =3D igt_crtc_crc_new(igt_crtc_for_pipe(&drm.display, prim_mod=
e_params.pipe),
>  					    IGT_PIPE_CRC_SOURCE_AUTO);
>  		igt_assert(pipe_crc);
>  	}
> diff --git a/tests/intel/kms_mmap_write_crc.c b/tests/intel/kms_mmap_writ=
e_crc.c
> index 587fe715bd47..453bcd0198a7 100644
> --- a/tests/intel/kms_mmap_write_crc.c
> +++ b/tests/intel/kms_mmap_write_crc.c
> @@ -206,7 +206,7 @@ static void prepare_crtc(data_t *data)
>  	if (data->pipe_crc)
>  		igt_pipe_crc_free(data->pipe_crc);
>=20=20
> -	data->pipe_crc =3D igt_pipe_crc_new(data->drm_fd, data->pipe,
> +	data->pipe_crc =3D igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, d=
ata->pipe),
>  					  IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
>  	/* get reference crc for the white fb */
> diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
> index 33ccac9fcee3..85bff58d6587 100644
> --- a/tests/intel/kms_pipe_stress.c
> +++ b/tests/intel/kms_pipe_stress.c
> @@ -807,7 +807,7 @@ static void prepare_test(struct data *data)
>  		if (data->highest_mode[i]) {
>  			igt_info("Using mode: \n");
>  			kmstest_dump_mode(data->highest_mode[i]);
> -			data->pipe_crc[i] =3D igt_pipe_crc_new(data->drm_fd, i,
> +			data->pipe_crc[i] =3D igt_crtc_crc_new(igt_crtc_for_pipe(&data->displ=
ay, i),
>  							     IGT_PIPE_CRC_SOURCE_AUTO);
>  		} else
>  			data->pipe_crc[i] =3D NULL;
> diff --git a/tests/intel/kms_pwrite_crc.c b/tests/intel/kms_pwrite_crc.c
> index d1cd9674381c..64c167ad3f44 100644
> --- a/tests/intel/kms_pwrite_crc.c
> +++ b/tests/intel/kms_pwrite_crc.c
> @@ -142,7 +142,7 @@ static void prepare_crtc(data_t *data)
>  	if (data->pipe_crc)
>  		igt_pipe_crc_free(data->pipe_crc);
>=20=20
> -	data->pipe_crc =3D igt_pipe_crc_new(data->drm_fd, data->pipe,
> +	data->pipe_crc =3D igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, d=
ata->pipe),
>  					  IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
>  	/* get reference crc for the white fb */
> diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpne=
ss_filter.c
> index 45285818c895..3bee950df95a 100644
> --- a/tests/intel/kms_sharpness_filter.c
> +++ b/tests/intel/kms_sharpness_filter.c
> @@ -369,7 +369,7 @@ static void test_sharpness_filter(data_t *data,  enum=
 test_type type)
>  		ret =3D igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
>=20=20
>  	if (type =3D=3D TEST_FILTER_DPMS || type =3D=3D TEST_FILTER_SUSPEND) {
> -		pipe_crc =3D igt_pipe_crc_new(data->drm_fd, data->pipe_id,
> +		pipe_crc =3D igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, data->=
pipe_id),
>  					    IGT_PIPE_CRC_SOURCE_AUTO);
>  		igt_pipe_crc_collect_crc(pipe_crc, &ref_crc);
>  	}
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 92246037ca87..c8586a5f947c 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -850,8 +850,7 @@ static void test_crc(data_t *data)
>  			     &data->output->config.connector->connector_id, 1, mode);
>  	igt_assert_eq(ret, 0);
>=20=20
> -	data->pipe_crc =3D igt_pipe_crc_new(data->drm_fd,
> -					  kmstest_get_pipe_from_crtc_id(data->drm_fd, data->crtc_id),
> +	data->pipe_crc =3D igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, k=
mstest_get_pipe_from_crtc_id(data->drm_fd, data->crtc_id)),
>  					  IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
>  	igt_pipe_crc_start(data->pipe_crc);
> diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
> index 8966637c450b..b0d920a54cba 100644
> --- a/tests/kms_atomic.c
> +++ b/tests/kms_atomic.c
> @@ -475,7 +475,7 @@ plane_immutable_zpos(data_t *data, igt_output_t *outp=
ut, enum pipe pipe, int n_p
>  	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>=20=20
>  	/* create the pipe_crc object for this pipe */
> -	pipe_crc =3D igt_pipe_crc_new(data->drm_fd, pipe,
> +	pipe_crc =3D igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, pipe),
>  				    IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
>  	/* get reference crc */
> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> index 24553e1bda09..4dcf63025687 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -605,7 +605,7 @@ static void prepare_crtc(data_t *data, int cursor_w, =
int cursor_h)
>  	/* create the pipe_crc object for this pipe */
>  	if (data->pipe_crc)
>  		igt_pipe_crc_free(data->pipe_crc);
> -	data->pipe_crc =3D igt_pipe_crc_new(data->drm_fd, data->pipe,
> +	data->pipe_crc =3D igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, d=
ata->pipe),
>  					  IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
>  	/* x/y position where the cursor is still fully visible */
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index d5a61e30e6a7..667fc0344c9a 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -1611,7 +1611,7 @@ static void flip_vs_cursor_crc(igt_display_t *displ=
ay, bool atomic)
>=20=20
>  	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMI=
T_LEGACY);
>=20=20
> -	pipe_crc =3D igt_pipe_crc_new(display->drm_fd, pipe,
> +	pipe_crc =3D igt_crtc_crc_new(igt_crtc_for_pipe(display, pipe),
>  				    IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
>  	cursor =3D set_cursor_on_pipe(display, pipe, &cursor_fb);
> @@ -1692,7 +1692,7 @@ static void flip_vs_cursor_busy_crc(igt_display_t *=
display, bool atomic)
>=20=20
>  	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMI=
T_LEGACY);
>=20=20
> -	pipe_crc =3D igt_pipe_crc_new(display->drm_fd, pipe,
> +	pipe_crc =3D igt_crtc_crc_new(igt_crtc_for_pipe(display, pipe),
>  				    IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
>  	cursor =3D set_cursor_on_pipe(display, pipe, &cursor_fb);
> diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
> index 77f5677fe69e..317bc57f21a5 100644
> --- a/tests/kms_display_modes.c
> +++ b/tests/kms_display_modes.c
> @@ -97,8 +97,10 @@ static void run_extendedmode_basic(data_t *data,
>=20=20
>  	igt_assert_f(igt_fit_modes_in_bw(display), "Unable to fit modes in bw\n=
");
>=20=20
> -	pipe_crc[0] =3D igt_pipe_crc_new(data->drm_fd, pipe1, IGT_PIPE_CRC_SOUR=
CE_AUTO);
> -	pipe_crc[1] =3D igt_pipe_crc_new(data->drm_fd, pipe2, IGT_PIPE_CRC_SOUR=
CE_AUTO);
> +	pipe_crc[0] =3D igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, pipe=
1),
> +				       IGT_PIPE_CRC_SOURCE_AUTO);
> +	pipe_crc[1] =3D igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, pipe=
2),
> +				       IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
>  	igt_create_color_fb(data->drm_fd, mode[0]->hdisplay, mode[0]->vdisplay,
>  			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, 1, 0, 0, &fbs[0]);
> diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
> index c74c0a02ae2f..8861dc7b26bd 100644
> --- a/tests/kms_pipe_crc_basic.c
> +++ b/tests/kms_pipe_crc_basic.c
> @@ -183,7 +183,7 @@ static void test_read_crc(data_t *data, enum pipe pip=
e,
>  		} else {
>  			igt_pipe_crc_t *pipe_crc;
>=20=20
> -			pipe_crc =3D igt_pipe_crc_new(data->drm_fd, pipe,
> +			pipe_crc =3D igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, pipe),
>  						    IGT_PIPE_CRC_SOURCE_AUTO);
>  			igt_pipe_crc_start(pipe_crc);
>=20=20
> @@ -268,7 +268,7 @@ static void test_compare_crc(data_t *data, enum pipe =
pipe, igt_output_t *output,
>  	igt_plane_set_fb(primary, &fb0);
>  	igt_display_commit(display);
>=20=20
> -	pipe_crc =3D igt_pipe_crc_new(data->drm_fd, pipe,
> +	pipe_crc =3D igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, pipe),
>  				    IGT_PIPE_CRC_SOURCE_AUTO);
>  	igt_pipe_crc_collect_crc(pipe_crc, &ref_crc);
>=20=20
> @@ -298,7 +298,7 @@ static void test_disable_crc_after_crtc(data_t *data,=
 enum pipe pipe,
>  	igt_crc_t crc[2];
>  	igt_plane_t *primary;
>=20=20
> -	pipe_crc =3D igt_pipe_crc_new(data->drm_fd, pipe,
> +	pipe_crc =3D igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, pipe),
>  				    IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
>  	igt_display_reset(display);
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index ec3245c9f2e0..d1c7b06fd4ee 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -130,7 +130,7 @@ static void test_init(data_t *data, enum pipe pipe)
>  	igt_require(igt_crtc_for_pipe(&data->display, pipe)->n_planes > 0);
>  	if (data->pipe_crc)
>  		igt_pipe_crc_free(data->pipe_crc);
> -	data->pipe_crc =3D igt_pipe_crc_new(data->drm_fd, pipe,
> +	data->pipe_crc =3D igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, p=
ipe),
>  					  IGT_PIPE_CRC_SOURCE_AUTO);
>  	igt_display_reset(&data->display);
>  }
> @@ -1364,8 +1364,8 @@ static void test_planar_settings(data_t *data)
>  		if (rval =3D=3D 0) {
>  			set_legacy_lut(data, pipe, LUT_MASK);
>  			igt_wait_for_vblank_count(igt_crtc_for_pipe(&data->display, pipe), 1);
> -			data->pipe_crc =3D igt_pipe_crc_new(data->drm_fd, pipe,
> -						IGT_PIPE_CRC_SOURCE_AUTO);
> +			data->pipe_crc =3D igt_crtc_crc_new(igt_crtc_for_pipe(&data->display,=
 pipe),
> +							  IGT_PIPE_CRC_SOURCE_AUTO);
>  			igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
>=20=20
>  			igt_create_color_fb(data->drm_fd, 256, 256,
> diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
> index a7070ac62169..c3d53c66c02a 100644
> --- a/tests/kms_plane_alpha_blend.c
> +++ b/tests/kms_plane_alpha_blend.c
> @@ -219,7 +219,7 @@ static void prepare_crtc(data_t *data, igt_output_t *=
output, enum pipe pipe)
>=20=20
>  	/* create the pipe_crc object for this pipe */
>  	igt_pipe_crc_free(data->pipe_crc);
> -	data->pipe_crc =3D igt_pipe_crc_new(data->gfx_fd, pipe,
> +	data->pipe_crc =3D igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, p=
ipe),
>  					  IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
>  	mode =3D igt_output_get_mode(output);
> diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
> index 4b4b4b4597f3..1b08685f2aac 100644
> --- a/tests/kms_plane_lowres.c
> +++ b/tests/kms_plane_lowres.c
> @@ -307,7 +307,7 @@ static void run_test(data_t *data, uint64_t modifier)
>  			if (!intel_pipe_output_combo_valid(&data->display))
>  				continue;
>=20=20
> -			data->pipe_crc =3D igt_pipe_crc_new(data->drm_fd, data->pipe,
> +			data->pipe_crc =3D igt_crtc_crc_new(igt_crtc_for_pipe(&data->display,=
 data->pipe),
>  							  IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
>  			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), data->output->na=
me)
> diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
> index 342eb7b293da..f0b9e2aba668 100644
> --- a/tests/kms_plane_multiple.c
> +++ b/tests/kms_plane_multiple.c
> @@ -107,8 +107,8 @@ struct {
>   */
>  static void test_init(data_t *data, enum pipe pipe, int n_planes)
>  {
> -	data->pipe_crc1 =3D igt_pipe_crc_new(data->drm_fd, pipe,
> -					  IGT_PIPE_CRC_SOURCE_AUTO);
> +	data->pipe_crc1 =3D igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, =
pipe),
> +					   IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
>  	data->plane1 =3D calloc(n_planes, sizeof(*data->plane1));
>  	igt_assert_f(data->plane1 !=3D NULL, "Failed to allocate memory for pla=
nes\n");
> @@ -417,9 +417,9 @@ test_plane_position(data_t *data, enum pipe pipe, igt=
_output_t *output, uint64_t
>=20=20
>  static void test_init_2_display(data_t *data, enum pipe pipe1, enum pipe=
 pipe2, int n_planes)
>  {
> -	data->pipe_crc1 =3D igt_pipe_crc_new(data->drm_fd, pipe1,
> +	data->pipe_crc1 =3D igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, =
pipe1),
>  					   IGT_PIPE_CRC_SOURCE_AUTO);
> -	data->pipe_crc2 =3D igt_pipe_crc_new(data->drm_fd, pipe2,
> +	data->pipe_crc2 =3D igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, =
pipe2),
>  					   IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
>  	data->plane1 =3D calloc(n_planes, sizeof(*data->plane1));
> diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
> index b1765b4c75e5..abd87508045e 100644
> --- a/tests/kms_rotation_crc.c
> +++ b/tests/kms_rotation_crc.c
> @@ -312,7 +312,7 @@ static void prepare_crtc(data_t *data, igt_output_t *=
output, enum pipe pipe,
>  	 */
>  	if (!is_amdgpu_device(data->gfx_fd))
>  		igt_display_commit2(display, COMMIT_ATOMIC);
> -	data->pipe_crc =3D igt_pipe_crc_new(data->gfx_fd, pipe,
> +	data->pipe_crc =3D igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, p=
ipe),
>  				          IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
>  	if (!is_amdgpu_device(data->gfx_fd) && start_crc)
> @@ -955,7 +955,7 @@ static void test_multi_plane_rotation(data_t *data, e=
num pipe pipe)
>  		p[0].plane =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMAR=
Y);
>  		p[1].plane =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_OVERLA=
Y);
>=20=20
> -		data->pipe_crc =3D igt_pipe_crc_new(data->gfx_fd, pipe,
> +		data->pipe_crc =3D igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, =
pipe),
>  						  IGT_PIPE_CRC_SOURCE_AUTO);
>  		igt_pipe_crc_start(data->pipe_crc);
>=20=20
> diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
> index 7b18f3ee8910..16409a4a55e0 100644
> --- a/tests/kms_universal_plane.c
> +++ b/tests/kms_universal_plane.c
> @@ -96,7 +96,7 @@ functional_test_init(functional_test_t *test, igt_outpu=
t_t *output, enum pipe pi
>  	data_t *data =3D test->data;
>  	drmModeModeInfo *mode;
>=20=20
> -	test->pipe_crc =3D igt_pipe_crc_new(data->drm_fd, pipe,
> +	test->pipe_crc =3D igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, p=
ipe),
>  					  IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
>  	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
> diff --git a/tests/nouveau_crc.c b/tests/nouveau_crc.c
> index 7887ff409e9e..6d61df006095 100644
> --- a/tests/nouveau_crc.c
> +++ b/tests/nouveau_crc.c
> @@ -122,7 +122,7 @@ static void test_ctx_flip_detection(data_t *data)
>  	int start =3D -1, frame, start_color =3D -1, i;
>  	bool found_skip =3D false;
>=20=20
> -	pipe_crc =3D igt_pipe_crc_new(data->drm_fd, data->pipe,
> +	pipe_crc =3D igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, data->p=
ipe),
>  				    IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
>  	create_crc_colors(data, colors, n_colors, pipe_crc);
> @@ -233,7 +233,8 @@ static void test_ctx_flip_skip_current_frame(data_t *=
data)
>  	const int n_colors =3D ARRAY_SIZE(colors);
>  	const int n_crcs =3D 30;
>=20=20
> -	pipe_crc =3D igt_pipe_crc_new(fd, data->pipe, IGT_PIPE_CRC_SOURCE_AUTO);
> +	pipe_crc =3D igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, data->p=
ipe),
> +				    IGT_PIPE_CRC_SOURCE_AUTO);
>  	create_crc_colors(data, colors, n_colors, pipe_crc);
>=20=20
>  	set_crc_flip_threshold(data, 5);
> @@ -263,10 +264,10 @@ static void test_ctx_flip_skip_current_frame(data_t=
 *data)
>  static void test_ctx_flip_threshold_reset_after_capture(data_t *data)
>  {
>  	igt_pipe_crc_t *pipe_crc;
> -	const int fd =3D data->drm_fd;
>  	uint32_t value =3D 0;
>=20=20
> -	pipe_crc =3D igt_pipe_crc_new(fd, data->pipe, IGT_PIPE_CRC_SOURCE_AUTO);
> +	pipe_crc =3D igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, data->p=
ipe),
> +				    IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
>  	set_crc_flip_threshold(data, 5);
>  	igt_pipe_crc_start(pipe_crc);
> @@ -281,7 +282,8 @@ static void test_ctx_flip_threshold_reset_after_captu=
re(data_t *data)
>=20=20
>  static void test_source(data_t *data, const char *source)
>  {
> -	igt_pipe_crc_t *pipe_crc =3D igt_pipe_crc_new(data->drm_fd, data->pipe,=
 source);
> +	igt_pipe_crc_t *pipe_crc =3D igt_crtc_crc_new(igt_crtc_for_pipe(&data->=
display, data->pipe),
> +						    source);
>  	igt_crc_t *crcs;
>=20=20
>  	igt_pipe_crc_start(pipe_crc);
> @@ -302,10 +304,10 @@ static void test_source_outp_inactive(data_t *data)
>  		{ .r =3D 0.0, .g =3D 1.0, .b =3D 0.0 },
>  	};
>  	igt_pipe_crc_t *pipe_crc;
> -	const int fd =3D data->drm_fd;
>  	const int n_colors =3D ARRAY_SIZE(colors);
>=20=20
> -	pipe_crc =3D igt_pipe_crc_new(fd, data->pipe, "outp-inactive");
> +	pipe_crc =3D igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, data->p=
ipe),
> +				    "outp-inactive");
>  	create_crc_colors(data, colors, n_colors, pipe_crc);
>=20=20
>  	/* Changing the color should not change what's outside the active raste=
r */

--=20
Jani Nikula, Intel
