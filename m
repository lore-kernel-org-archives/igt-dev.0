Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC38CFD3760
	for <igt-dev@archiver.kernel.org>; Wed, 25 Feb 2026 14:00:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 459EC10E78C;
	Wed, 25 Feb 2026 14:00:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h2XTKTms";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C20E710E78C
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Feb 2026 14:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772028057; x=1803564057;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=VNX8i/fRzLFiGe6I+ZIlnPzxEC3xkjS2RYd+HJO5d1Q=;
 b=h2XTKTmsyQizhQAvgx0k2JAqnnVUHcsnkeBbwOh4AFcPi0EIbmOSbzMl
 01hicKVYL1ZZ6/fURweX5nEB0IZDfVcRcpufuua7Ryws2TJRGWlAUUFpW
 xKKc31f7DWfFvlqYcgH5c3mPsOzDjXMzorHEd3CxCRv+73bGAvt2u57/u
 P7DjvOjaXwZgpoc1CmSnXuMDvmwb9Gv2Q26S17uQx+cu5ZYs191Skv+3Q
 rl8drLjP7kDTzaLhbZUCELW8dWUZUk2HHUvlgOBX3baR8nb7X3imle0od
 v/9gQFHuPYHh5jqbc0PkHoY8/oFa6KOAomaABjPMAohK2T/3RroeJb065 w==;
X-CSE-ConnectionGUID: hu7iYEA4QwaUbIeKwfacBg==
X-CSE-MsgGUID: d962xOvFSWKEBkQ7l3mnpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="72763791"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="72763791"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 06:00:57 -0800
X-CSE-ConnectionGUID: b5DX+NzNTaSAwWqISkAETA==
X-CSE-MsgGUID: 6b6MskrASsWNf/yU+lym/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="220846855"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.68])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 06:00:54 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 07/19] lib/kms: Introduce and use igt_first_crtc()
In-Reply-To: <20260225125108.31119-8-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260225125108.31119-1-ville.syrjala@linux.intel.com>
 <20260225125108.31119-8-ville.syrjala@linux.intel.com>
Date: Wed, 25 Feb 2026 16:00:52 +0200
Message-ID: <3e83cddc76a2192435209fb65f91b8c728669c94@intel.com>
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

On Wed, 25 Feb 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Several tests just want to pick the first CRTC they
> can. Currently they just ask for the CRTC for PIPE_A
> which might not even be present on the hardware.
> Introduce a new igt_first_crtc() that just hands
> you the first available CRTC, whatever pipe that is.
>
>  #include "scripts/iterators.cocci"
>
> @@
> expression DISPLAY;
> @@
> (
> - igt_crtc_for_pipe(DISPLAY, PIPE_A)
> + igt_first_crtc(DISPLAY)
> |
> - igt_crtc_for_pipe(DISPLAY, 0)
> + igt_first_crtc(DISPLAY)
> )
>
> @@
> type T;
> @@
> T igt_crtc_for_crtc_id(...);
> +igt_crtc_t *igt_first_crtc(igt_display_t *display);
>
> @@
> iterator name for_each_crtc;
> @@
> igt_crtc_for_crtc_id(...) { ... }
> +/*
> + * igt_first_crtc:
> + * @display: pointer to igt_display_t
> + *
> + * Returns: The first CRTC on the device
> + */
> +igt_crtc_t *igt_first_crtc(igt_display_t *display)
> +{
> +       igt_crtc_t *crtc;
> +
> +       for_each_crtc(display, crtc)
> +               return crtc;
> +
> +       return NULL;
> +}
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  lib/igt_kms.c                           | 16 ++++++++++++++++
>  lib/igt_kms.h                           |  1 +
>  tests/amdgpu/amd_abm.c                  |  2 +-
>  tests/amdgpu/amd_assr.c                 |  2 +-
>  tests/amdgpu/amd_bypass.c               |  2 +-
>  tests/amdgpu/amd_color.c                |  2 +-
>  tests/amdgpu/amd_mall.c                 |  2 +-
>  tests/amdgpu/amd_max_bpc.c              |  2 +-
>  tests/amdgpu/amd_mem_leak.c             |  2 +-
>  tests/amdgpu/amd_odm.c                  |  2 +-
>  tests/amdgpu/amd_psr.c                  |  2 +-
>  tests/amdgpu/amd_replay.c               |  2 +-
>  tests/intel/kms_dp_linktrain_fallback.c |  2 +-
>  tests/kms_lease.c                       |  6 +++---
>  tests/kms_rotation_crc.c                |  6 +++---
>  tools/amd_hdmi_compliance.c             |  2 +-
>  16 files changed, 35 insertions(+), 18 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index ee95afc49aa7..94fa0680653b 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -7965,6 +7965,22 @@ igt_crtc_t *igt_crtc_for_crtc_id(igt_display_t *di=
splay, uint32_t crtc_id)
>  	return NULL;
>  }
>=20=20
> +/*
> + * igt_first_crtc:
> + * @display: pointer to igt_display_t
> + *
> + * Returns: The first CRTC on the device
> + */
> +igt_crtc_t *igt_first_crtc(igt_display_t *display)
> +{
> +	igt_crtc_t *crtc;
> +
> +	for_each_crtc (display, crtc)

Cocci apparently insists on adding that superfluous space before ( there.

> +		return crtc;
> +
> +	return NULL;
> +}
> +
>  igt_crtc_t *igt_first_crtc_with_single_output(igt_display_t *display, ig=
t_output_t **ret_output)
>  {
>  	igt_output_t *output;
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index ae488bbf4806..d6ebd40dd7be 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -585,6 +585,7 @@ static inline igt_crtc_t *igt_crtc_for_pipe(igt_displ=
ay_t *display, enum pipe pi
>  	return &display->crtcs[pipe];
>  }
>  igt_crtc_t *igt_crtc_for_crtc_id(igt_display_t *display, uint32_t crtc_i=
d);
> +igt_crtc_t *igt_first_crtc(igt_display_t *display);
>=20=20
>  typedef struct _igt_pipe_crc igt_pipe_crc_t;
>  igt_pipe_crc_t *igt_crtc_crc_new(igt_crtc_t *crtc, const char *source);
> diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
> index ffa73bb46865..5cd40cfb91df 100644
> --- a/tests/amdgpu/amd_abm.c
> +++ b/tests/amdgpu/amd_abm.c
> @@ -129,7 +129,7 @@ static void test_init(data_t *data)
>  		igt_skip("No eDP connector found\n");
>=20=20
>  	/* It doesn't matter which pipe we choose on amdpgu. */
> -	data->crtc =3D igt_crtc_for_pipe(&data->display, PIPE_A);
> +	data->crtc =3D igt_first_crtc(&data->display);
>=20=20
>  	igt_display_reset(display);
>=20=20
> diff --git a/tests/amdgpu/amd_assr.c b/tests/amdgpu/amd_assr.c
> index f02a30e8fea3..b07f3fb15a1f 100644
> --- a/tests/amdgpu/amd_assr.c
> +++ b/tests/amdgpu/amd_assr.c
> @@ -161,7 +161,7 @@ static void present_visual_pattern(data_t *data, igt_=
output_t *output)
>  {
>  	igt_display_t *display =3D &data->display;
>  	igt_plane_t *primary;
> -	igt_crtc_t *crtc =3D igt_crtc_for_pipe(display, PIPE_A);
> +	igt_crtc_t *crtc =3D igt_first_crtc(display);
>  	drmModeModeInfo *mode;
>  	igt_fb_t fb;
>=20=20
> diff --git a/tests/amdgpu/amd_bypass.c b/tests/amdgpu/amd_bypass.c
> index 6ff36ce09d3e..25136e83e6ad 100644
> --- a/tests/amdgpu/amd_bypass.c
> +++ b/tests/amdgpu/amd_bypass.c
> @@ -63,7 +63,7 @@ static void test_init(data_t *data)
>  	igt_display_t *display =3D &data->display;
>=20=20
>  	/* It doesn't matter which pipe we choose on amdpgu. */
> -	data->crtc =3D igt_crtc_for_pipe(&data->display, PIPE_A);
> +	data->crtc =3D igt_first_crtc(&data->display);
>=20=20
>  	igt_display_reset(display);
>=20=20
> diff --git a/tests/amdgpu/amd_color.c b/tests/amdgpu/amd_color.c
> index dc2a10817105..cdc6f3e6abd8 100644
> --- a/tests/amdgpu/amd_color.c
> +++ b/tests/amdgpu/amd_color.c
> @@ -178,7 +178,7 @@ static void test_init(data_t *data)
>  	igt_display_t *display =3D &data->display;
>=20=20
>  	/* It doesn't matter which pipe we choose on amdpgu. */
> -	data->crtc =3D igt_crtc_for_pipe(&data->display, PIPE_A);
> +	data->crtc =3D igt_first_crtc(&data->display);
>=20=20
>  	igt_display_reset(display);
>=20=20
> diff --git a/tests/amdgpu/amd_mall.c b/tests/amdgpu/amd_mall.c
> index b83e3b864ee4..a068154656e7 100644
> --- a/tests/amdgpu/amd_mall.c
> +++ b/tests/amdgpu/amd_mall.c
> @@ -60,7 +60,7 @@ static void test_init(data_t *data)
>  	bool mall_en =3D false;
>=20=20
>  	/* It doesn't matter which pipe we choose on amdpgu. */
> -	data->crtc =3D igt_crtc_for_pipe(&data->display, PIPE_A);
> +	data->crtc =3D igt_first_crtc(&data->display);
>=20=20
>  	igt_display_reset(display);
>=20=20
> diff --git a/tests/amdgpu/amd_max_bpc.c b/tests/amdgpu/amd_max_bpc.c
> index cf4de724c12c..eb76762fa954 100644
> --- a/tests/amdgpu/amd_max_bpc.c
> +++ b/tests/amdgpu/amd_max_bpc.c
> @@ -54,7 +54,7 @@ static void test_init(data_t *data)
>  	igt_display_t *display =3D &data->display;
>=20=20
>  	/* It doesn't matter which pipe we choose on amdpgu. */
> -	data->crtc =3D igt_crtc_for_pipe(&data->display, PIPE_A);
> +	data->crtc =3D igt_first_crtc(&data->display);
>=20=20
>  	igt_display_reset(display);
>=20=20
> diff --git a/tests/amdgpu/amd_mem_leak.c b/tests/amdgpu/amd_mem_leak.c
> index 9e8e61aa7847..1e55fe785c5f 100644
> --- a/tests/amdgpu/amd_mem_leak.c
> +++ b/tests/amdgpu/amd_mem_leak.c
> @@ -46,7 +46,7 @@ static void test_init(data_t *data)
>  	igt_display_t *display =3D &data->display;
>=20=20
>  	/* It doesn't matter which pipe we choose on amdpgu. */
> -	data->crtc =3D igt_crtc_for_pipe(&data->display, PIPE_A);
> +	data->crtc =3D igt_first_crtc(&data->display);
>=20=20
>  	igt_display_reset(display);
>=20=20
> diff --git a/tests/amdgpu/amd_odm.c b/tests/amdgpu/amd_odm.c
> index ac6b839847a2..1feee8d9badb 100644
> --- a/tests/amdgpu/amd_odm.c
> +++ b/tests/amdgpu/amd_odm.c
> @@ -47,7 +47,7 @@ static void test_init(struct data *data)
>  	igt_display_t *display =3D &data->display;
>=20=20
>  	/* It doesn't matter which pipe we choose on amdpgu. */
> -	data->crtc =3D igt_crtc_for_pipe(&data->display, PIPE_A);
> +	data->crtc =3D igt_first_crtc(&data->display);
>=20=20
>  	igt_display_reset(display);
>=20=20
> diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
> index 548e21810fb9..b1d6d1631e26 100644
> --- a/tests/amdgpu/amd_psr.c
> +++ b/tests/amdgpu/amd_psr.c
> @@ -170,7 +170,7 @@ static void test_init(data_t *data)
>  	igt_display_t *display =3D &data->display;
>=20=20
>  	/* It doesn't matter which pipe we choose on amdpgu. */
> -	data->crtc =3D igt_crtc_for_pipe(&data->display, PIPE_A);
> +	data->crtc =3D igt_first_crtc(&data->display);
>=20=20
>  	igt_display_reset(display);
>=20=20
> diff --git a/tests/amdgpu/amd_replay.c b/tests/amdgpu/amd_replay.c
> index 010b3a97e775..5f62465d6b72 100644
> --- a/tests/amdgpu/amd_replay.c
> +++ b/tests/amdgpu/amd_replay.c
> @@ -60,7 +60,7 @@ static void test_init(struct test_data *data)
>  	igt_display_t *display =3D &data->display;
>=20=20
>  	/* It doesn't matter which pipe we choose on amdpgu. */
> -	data->crtc =3D igt_crtc_for_pipe(&data->display, PIPE_A);
> +	data->crtc =3D igt_first_crtc(&data->display);
>=20=20
>  	igt_display_reset(display);
>=20=20
> diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp=
_linktrain_fallback.c
> index b7e02be2d8aa..91dde2a7dcee 100644
> --- a/tests/intel/kms_dp_linktrain_fallback.c
> +++ b/tests/intel/kms_dp_linktrain_fallback.c
> @@ -468,7 +468,7 @@ static void test_dsc_sst_fallback(data_t *data)
>  	int output_count =3D 0;
>=20=20
>  	igt_info("Checking DSC fallback on %s\n", igt_output_name(data->output)=
);
> -	data->crtc =3D igt_crtc_for_pipe(&data->display, PIPE_A);
> +	data->crtc =3D igt_first_crtc(&data->display);
>=20=20
>  	igt_display_reset(&data->display);
>  	igt_reset_link_params(data->drm_fd, data->output);
> diff --git a/tests/kms_lease.c b/tests/kms_lease.c
> index 7531f9acf810..4e9a69da5d9d 100644
> --- a/tests/kms_lease.c
> +++ b/tests/kms_lease.c
> @@ -872,7 +872,7 @@ static void invalid_create_leases(data_t *data)
>  	igt_crtc_t *crtc;
>  	int tmp_fd, ret;
>=20=20
> -	crtc =3D igt_crtc_for_pipe(&data->master.display, 0);
> +	crtc =3D igt_first_crtc(&data->master.display);
>=20=20
>  	/* NULL array pointer */
>  	mcl.object_count =3D 1;
> @@ -1070,7 +1070,7 @@ static int _create_simple_lease(int master_fd, data=
_t *data, int expected_ret)
>  	struct drm_mode_create_lease mcl;
>  	igt_crtc_t *crtc;
>=20=20
> -	crtc =3D igt_crtc_for_pipe(&data->master.display, 0);
> +	crtc =3D igt_first_crtc(&data->master.display);
>=20=20
>  	object_ids[0] =3D crtc->crtc_id;
>  	object_ids[1] =3D data->master.display.outputs[0].id;
> @@ -1164,7 +1164,7 @@ static void implicit_plane_lease(data_t *data)
>  	uint32_t cursor_id;
>  	igt_crtc_t *crtc;
>=20=20
> -	crtc =3D igt_crtc_for_pipe(&data->master.display, 0);
> +	crtc =3D igt_first_crtc(&data->master.display);
>=20=20
>  	cursor_id =3D igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_CURSOR)->drm=
_plane->plane_id;
>=20=20
> diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
> index 6240e112cb29..9b087bbaa6dc 100644
> --- a/tests/kms_rotation_crc.c
> +++ b/tests/kms_rotation_crc.c
> @@ -1314,7 +1314,7 @@ int igt_main_args("", long_opts, help_str, opt_hand=
ler, &data)
>=20=20
>  	igt_describe("Rotation test on both planes by making them fully visible=
");
>  	igt_subtest_f("multiplane-rotation") {
> -		igt_crtc_t *crtc =3D igt_crtc_for_pipe(&data.display, PIPE_A);
> +		igt_crtc_t *crtc =3D igt_first_crtc(&data.display);
>=20=20
>  		igt_require(gen >=3D 9);
>  		cleanup_crtc(&data);
> @@ -1330,7 +1330,7 @@ int igt_main_args("", long_opts, help_str, opt_hand=
ler, &data)
>  	igt_describe("Rotation test on both planes by cropping left/top corner =
of primary plane and"
>  			"right/top corner of sprite plane");
>  	igt_subtest_f("multiplane-rotation-cropping-top") {
> -		igt_crtc_t *crtc =3D igt_crtc_for_pipe(&data.display, PIPE_A);
> +		igt_crtc_t *crtc =3D igt_first_crtc(&data.display);
>=20=20
>  		igt_require(gen >=3D 9);
>  		cleanup_crtc(&data);
> @@ -1346,7 +1346,7 @@ int igt_main_args("", long_opts, help_str, opt_hand=
ler, &data)
>  	igt_describe("Rotation test on both planes by cropping left/bottom corn=
er of primary plane"
>  			"and right/bottom corner of sprite plane");
>  	igt_subtest_f("multiplane-rotation-cropping-bottom") {
> -		igt_crtc_t *crtc =3D igt_crtc_for_pipe(&data.display, PIPE_A);
> +		igt_crtc_t *crtc =3D igt_first_crtc(&data.display);
>=20=20
>  		igt_require(gen >=3D 9);
>  		cleanup_crtc(&data);
> diff --git a/tools/amd_hdmi_compliance.c b/tools/amd_hdmi_compliance.c
> index 94025547f01c..e0ef78d8191d 100644
> --- a/tools/amd_hdmi_compliance.c
> +++ b/tools/amd_hdmi_compliance.c
> @@ -383,7 +383,7 @@ static void test_init(data_t *data, int conn_id)
>  {
>  	igt_display_t *display =3D &data->display;
>=20=20
> -	data->crtc =3D igt_crtc_for_pipe(&data->display, PIPE_A);
> +	data->crtc =3D igt_first_crtc(&data->display);
>=20=20
>  	igt_display_reset(display);

--=20
Jani Nikula, Intel
