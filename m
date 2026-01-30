Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB3EAE6BF17
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 14:20:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B4A110E256;
	Fri, 30 Jan 2026 14:20:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c49ZA0Js";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5D6C10E256
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 14:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769782803; x=1801318803;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=qwU4z6/Hbg2+pf7A616TlsBbohXi6SMpHG14gkmXPh8=;
 b=c49ZA0Jsuva36hfrP8ipwCtOqc8hqtYLN9vTCYYdsRY3aN/C9U7fTsXd
 Zvev8O2eKH7KbTfNOwChtK6+SowrjUlPUzn2eHieL1oKR/pUSF8ceRMlH
 xDQFeDoV7pRm3ea+8/VFxr6qKxzZOq+QOfI6kUqvSvDftnoKXSiXmsJA8
 vRGvh+LiavpG44YXnnkzKdKYa9C32Cr+7OPRVZGINFqSA9kEpVK3aJlgO
 MhSJ3+BGVzljkDRXZL3JW9NGZhDnpnX3oD62wAVaJErz+JLam/hxB3+EB
 UUPtOWHiZ8iqaOBjdxs677/3sfr6nar4rT3/yeIv9Ffnl8M/WhPoJEr9A w==;
X-CSE-ConnectionGUID: nT1bf0+8QJChXHLKOntxMw==
X-CSE-MsgGUID: J2ibPOHXTmGUVbEZUQDpOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="81666219"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="81666219"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 06:20:03 -0800
X-CSE-ConnectionGUID: GESsFOVVQE28aN+GPCCRMA==
X-CSE-MsgGUID: W+TPaxaNS0aZoLtyVp5Spg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="208863405"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.77])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 06:20:01 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 09/15] lib/kms: Use
 for_each_crtc_with_single_output(), part 2
In-Reply-To: <20260130105237.14481-10-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260130105237.14481-1-ville.syrjala@linux.intel.com>
 <20260130105237.14481-10-ville.syrjala@linux.intel.com>
Date: Fri, 30 Jan 2026 16:19:57 +0200
Message-ID: <db585e231f9d445c7589a478c05f6b9f0057b7e3@intel.com>
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

On Fri, 30 Jan 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Convert more of the for_each_pipe_with_single_output() uses
> over to for_each_crtc_with_single_output(). This covers the
> simple use cases.

Here and in a handful of previous patches the subject prefix should
probably be "tests/kms:".

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

>
> Done with cocci:
>  #include "scripts/iterators.cocci"
>
> @find@
> typedef igt_crtc_t;
> iterator name for_each_pipe_with_single_output;
> iterator name for_each_crtc_with_single_output;
> expression DISPLAY, OUTPUT;
> identifier PIPE;
> type T;
> @@
> (
> - T PIPE;
> + igt_crtc_t *crtc;
> |
> - T PIPE =3D PIPE_NONE;
> + igt_crtc_t *crtc;
> )
> <+...
> for_each_pipe_with_single_output(DISPLAY, PIPE, OUTPUT) { ... }
> ...+>
>
> @change depends on find@
> expression DISPLAY, OUTPUT;
> identifier find.PIPE;
> @@
> - for_each_pipe_with_single_output(DISPLAY, PIPE, OUTPUT)
> + for_each_crtc_with_single_output(DISPLAY, crtc, OUTPUT)
> {
> <...
> (
> - igt_crtc_for_pipe(..., PIPE)
> + crtc
> |
> - kmstest_pipe_name(PIPE)
> + igt_crtc_name(crtc)
> |
> - PIPE
> + crtc->pipe
> )
> ...>
> }
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tests/amdgpu/amd_cursor_overlay.c | 16 ++++++----
>  tests/kms_color_pipeline.c        | 12 ++++----
>  tests/kms_plane.c                 |  8 ++---
>  tests/kms_plane_alpha_blend.c     | 24 +++++++++------
>  tests/kms_plane_cursor.c          | 14 +++++----
>  tests/kms_properties.c            | 22 +++++++-------
>  tests/kms_rmfb.c                  | 10 +++----
>  tests/kms_universal_plane.c       | 49 ++++++++++++++++++-------------
>  8 files changed, 89 insertions(+), 66 deletions(-)
>
> diff --git a/tests/amdgpu/amd_cursor_overlay.c b/tests/amdgpu/amd_cursor_=
overlay.c
> index 76c3003ca432..1d8ffcc86e1d 100644
> --- a/tests/amdgpu/amd_cursor_overlay.c
> +++ b/tests/amdgpu/amd_cursor_overlay.c
> @@ -400,7 +400,7 @@ int igt_main()
>  {
>  	static const int cursor_sizes[] =3D { 64, 128, 256 };
>  	data_t data =3D { .max_curw =3D 64, .max_curh =3D 64 };
> -	enum pipe pipe;
> +	igt_crtc_t *crtc;
>  	igt_output_t *output;
>  	igt_display_t *display;
>  	int i, j, available_overlay_planes;
> @@ -478,13 +478,15 @@ int igt_main()
>  							DRM_FORMAT_NV12,
>  							DRM_FORMAT_MOD_LINEAR));
>=20=20
> -			for_each_pipe_with_single_output(&data.display, pipe, output) {
> +			for_each_crtc_with_single_output(&data.display, crtc,
> +							 output) {
>=20=20
>  				igt_display_reset(display);
>  				igt_output_set_crtc(output,
> -					igt_crtc_for_pipe(output->display, pipe));
> +					crtc);
>=20=20
> -				available_overlay_planes =3D get_overlay_planes_count(display, pipe);
> +				available_overlay_planes =3D get_overlay_planes_count(display,
> +										    crtc->pipe);
>=20=20
>  				/* Require at least one overlay plane. */
>  				if (!available_overlay_planes)
> @@ -500,13 +502,15 @@ int igt_main()
>  					igt_skip("%s subtest requires 3 overlay planes with a supported DCN=
.\n",
>  						 tests[i].name);
>=20=20
> -				test_init(&data, pipe, output, tests[i].flags, available_overlay_pla=
nes);
> +				test_init(&data, crtc->pipe, output,
> +					  tests[i].flags,
> +					  available_overlay_planes);
>=20=20
>  				for (j =3D 0; j < ARRAY_SIZE(cursor_sizes); j++) {
>  					int size =3D cursor_sizes[j];
>=20=20
>  					igt_dynamic_f("pipe-%s-%s-size-%d",
> -						      kmstest_pipe_name(pipe),
> +						      igt_crtc_name(crtc),
>  						      igt_output_name(output),
>  						      size)
>  						test_cursor(&data, size, tests[i].flags, tests[i].scale_factor);
> diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
> index bf8c4734b5fd..1e272671f63d 100644
> --- a/tests/kms_color_pipeline.c
> +++ b/tests/kms_color_pipeline.c
> @@ -155,7 +155,7 @@ static bool test_plane_colorops(data_t *data,
>  static void
>  run_tests_for_plane(data_t *data)
>  {
> -	enum pipe pipe;
> +	igt_crtc_t *crtc;
>  	igt_output_t *output =3D NULL;
>  	static const color_t colors_rgb[] =3D {
>  	        { 1.0, 0.0, 0.0 },
> @@ -276,20 +276,22 @@ run_tests_for_plane(data_t *data)
>  	for (int i =3D 0; i < ARRAY_SIZE(plane_colorops_tests); i++) {
>  		igt_describe_f("Test plane color pipeline with colorops: %s", plane_co=
lorops_tests[i].name);
>  		igt_subtest_with_dynamic_f("plane-%s", plane_colorops_tests[i].name) {
> -			for_each_pipe_with_single_output(&data->display, pipe, output) {
> +			for_each_crtc_with_single_output(&data->display, crtc,
> +							 output) {
>  				data->output =3D output;
>=20=20
> -				if (!pipe_output_combo_valid(data, pipe))
> +				if (!pipe_output_combo_valid(data, crtc->pipe))
>  					continue;
>=20=20
> -				test_setup(data, pipe);
> +				test_setup(data, crtc->pipe);
>=20=20
>  				if (!igt_plane_has_prop(data->primary, IGT_PLANE_COLOR_PIPELINE)) {
>  					test_cleanup(data);
>  					continue;
>  				}
>=20=20
> -				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
> +				igt_dynamic_f("pipe-%s-%s",
> +					       igt_crtc_name(crtc),
>  					       igt_output_name(data->output)) {
>  					data->color_depth =3D 8;
>  					data->drm_format =3D DRM_FORMAT_XRGB8888;
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 21d80847cfd1..2be10f03280a 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -1467,19 +1467,19 @@ static bool is_pipe_limit_reached(int count)
>=20=20
>  static void run_test(data_t *data, void (*test)(data_t *, enum pipe))
>  {
> -	enum pipe pipe;
> +	igt_crtc_t *crtc;
>  	int count =3D 0;
>=20=20
> -	for_each_pipe_with_single_output(&data->display, pipe, data->output) {
> +	for_each_crtc_with_single_output(&data->display, crtc, data->output) {
>  		igt_display_reset(&data->display);
>=20=20
>  		igt_output_set_crtc(data->output,
> -				    igt_crtc_for_pipe(data->output->display, pipe));
> +				    crtc);
>  		if (!intel_pipe_output_combo_valid(&data->display))
>  			continue;
>=20=20
>  		igt_output_set_crtc(data->output, NULL);
> -		test(data, pipe);
> +		test(data, crtc->pipe);
>=20=20
>  		if (is_pipe_limit_reached(++count))
>  			break;
> diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
> index c3d53c66c02a..eaa4f8e2ef1b 100644
> --- a/tests/kms_plane_alpha_blend.c
> +++ b/tests/kms_plane_alpha_blend.c
> @@ -691,31 +691,37 @@ static bool pipe_check(data_t *data, enum pipe pipe,
>  static void run_subtests(data_t *data)
>  {
>  	igt_output_t *output;
> -	enum pipe pipe;
> +	igt_crtc_t *crtc;
>=20=20
>  	for (int i =3D 0; i < ARRAY_SIZE(subtests); i++) {
>  		igt_describe_f("%s\n", subtests[i].desc);
>=20=20
>  		igt_subtest_with_dynamic(subtests[i].name) {
> -			for_each_pipe_with_single_output(&data->display, pipe, output) {
> +			for_each_crtc_with_single_output(&data->display, crtc,
> +							 output) {
>  				if (!extended &&
> -				    pipe !=3D active_pipes[0] &&
> -				    pipe !=3D active_pipes[last_pipe])
> +				    crtc->pipe !=3D active_pipes[0] &&
> +				    crtc->pipe !=3D active_pipes[last_pipe])
>  					continue;
>=20=20
>  				igt_display_reset(&data->display);
>=20=20
>  				igt_output_set_crtc(output,
> -						    igt_crtc_for_pipe(output->display, pipe));
> +						    crtc);
>  				if (!intel_pipe_output_combo_valid(&data->display))
>  					continue;
>=20=20
> -				prepare_crtc(data, output, pipe);
> -				if (!pipe_check(data, pipe, subtests[i].blend, subtests[i].must_mult=
iply))
> +				prepare_crtc(data, output, crtc->pipe);
> +				if (!pipe_check(data, crtc->pipe, subtests[i].blend, subtests[i].mus=
t_multiply))
>  					continue;
>=20=20
> -				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
> -					run_test_on_pipe_planes(data, pipe, output, subtests[i].blend,
> +				igt_dynamic_f("pipe-%s-%s",
> +					      igt_crtc_name(crtc),
> +					      output->name)
> +					run_test_on_pipe_planes(data,
> +								crtc->pipe,
> +								output,
> +								subtests[i].blend,
>  								subtests[i].must_multiply, subtests[i].test);
>  			}
>  		}
> diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
> index 60e757fc701b..8095154718bc 100644
> --- a/tests/kms_plane_cursor.c
> +++ b/tests/kms_plane_cursor.c
> @@ -290,7 +290,7 @@ int igt_main()
>  {
>  	static const int cursor_sizes[] =3D { 64, 128, 256 };
>  	data_t data =3D { .max_curw =3D 64, .max_curh =3D 64 };
> -	enum pipe pipe;
> +	igt_crtc_t *crtc;
>  	igt_output_t *output;
>  	igt_display_t *display;
>  	int i, j;
> @@ -329,26 +329,28 @@ int igt_main()
>  	for (i =3D 0; i < ARRAY_SIZE(tests); i++) {
>  		igt_describe_f("%s", tests[i].desc);
>  		igt_subtest_with_dynamic_f("%s", tests[i].name) {
> -			for_each_pipe_with_single_output(&data.display, pipe, output) {
> +			for_each_crtc_with_single_output(&data.display, crtc,
> +							 output) {
>  				if ((tests[i].flags & TEST_OVERLAY) &&
> -				    !igt_crtc_get_plane_type(igt_crtc_for_pipe(&data.display, pipe),
> +				    !igt_crtc_get_plane_type(crtc,
>  							     DRM_PLANE_TYPE_OVERLAY))
>  					continue;
>=20=20
>  				igt_display_reset(display);
>=20=20
>  				igt_output_set_crtc(output,
> -						    igt_crtc_for_pipe(output->display, pipe));
> +						    crtc);
>  				if (!intel_pipe_output_combo_valid(display))
>  					continue;
>=20=20
> -				test_init(&data, pipe, output, tests[i].flags);
> +				test_init(&data, crtc->pipe, output,
> +					  tests[i].flags);
>=20=20
>  				for (j =3D 0; j < ARRAY_SIZE(cursor_sizes); j++) {
>  					int size =3D cursor_sizes[j];
>=20=20
>  					igt_dynamic_f("pipe-%s-%s-size-%d",
> -						      kmstest_pipe_name(pipe),
> +						      igt_crtc_name(crtc),
>  						      igt_output_name(output),
>  						      size)
>  						test_cursor(&data, size, tests[i].flags);
> diff --git a/tests/kms_properties.c b/tests/kms_properties.c
> index 62e936bc5e51..1d46bca52114 100644
> --- a/tests/kms_properties.c
> +++ b/tests/kms_properties.c
> @@ -348,39 +348,41 @@ static void colorop_properties(igt_display_t *displ=
ay, bool atomic)
>  static void plane_properties(igt_display_t *display, bool atomic)
>  {
>  	igt_output_t *output;
> -	enum pipe pipe;
> +	igt_crtc_t *crtc;
>=20=20
> -	for_each_pipe_with_single_output(display, pipe, output) {
> +	for_each_crtc_with_single_output(display, crtc, output) {
>  		igt_display_reset(display);
>=20=20
>  		igt_output_set_crtc(output,
> -				    igt_crtc_for_pipe(output->display, pipe));
> +				    crtc);
>  		if (!intel_pipe_output_combo_valid(display))
>  			continue;
>=20=20
> -		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
> +		igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
>  			      igt_output_name(output)) {
> -			run_plane_property_tests(display, pipe, output, atomic);
> +			run_plane_property_tests(display, crtc->pipe, output,
> +						 atomic);
>  		}
>  	}
>  }
>=20=20
>  static void crtc_properties(igt_display_t *display, bool atomic)
>  {
> -	enum pipe pipe;
> +	igt_crtc_t *crtc;
>  	igt_output_t *output;
>=20=20
> -	for_each_pipe_with_single_output(display, pipe, output) {
> +	for_each_crtc_with_single_output(display, crtc, output) {
>  		igt_display_reset(display);
>=20=20
>  		igt_output_set_crtc(output,
> -				    igt_crtc_for_pipe(output->display, pipe));
> +				    crtc);
>  		if (!intel_pipe_output_combo_valid(display))
>  			continue;
>=20=20
> -		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
> +		igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
>  			      igt_output_name(output)) {
> -			run_crtc_property_tests(display, pipe, output, atomic);
> +			run_crtc_property_tests(display, crtc->pipe, output,
> +						atomic);
>  		}
>  	}
>  }
> diff --git a/tests/kms_rmfb.c b/tests/kms_rmfb.c
> index d4e0b519bbc4..e71d1b9a6fc4 100644
> --- a/tests/kms_rmfb.c
> +++ b/tests/kms_rmfb.c
> @@ -175,20 +175,20 @@ static void
>  run_rmfb_test(struct rmfb_data *data, bool reopen)
>  {
>  	igt_output_t *output;
> -	enum pipe pipe;
> +	igt_crtc_t *crtc;
>  	igt_display_t *display =3D &data->display;
>=20=20
> -	for_each_pipe_with_single_output(display, pipe, output) {
> +	for_each_crtc_with_single_output(display, crtc, output) {
>  		igt_display_reset(display);
>=20=20
>  		igt_output_set_crtc(output,
> -				    igt_crtc_for_pipe(output->display, pipe));
> +				    crtc);
>  		if (!intel_pipe_output_combo_valid(display))
>  			continue;
>=20=20
> -		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
> +		igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
>  			      igt_output_name(output))
> -			test_rmfb(data, output, pipe, reopen);
> +			test_rmfb(data, output, crtc->pipe, reopen);
>  	}
>  }
>=20=20
> diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
> index 16409a4a55e0..33567597fa88 100644
> --- a/tests/kms_universal_plane.c
> +++ b/tests/kms_universal_plane.c
> @@ -833,62 +833,69 @@ static void
>  run_tests(data_t *data)
>  {
>  	igt_output_t *output;
> -	enum pipe pipe;
> +	igt_crtc_t *crtc;
>=20=20
>  	igt_describe("Check the switching between different primary plane fbs w=
ith CRTC off");
>  	igt_subtest_with_dynamic("universal-plane-functional") {
> -		for_each_pipe_with_single_output(&data->display, pipe, output) {
> -			if (!pipe_output_combo_valid(&data->display, pipe, output))
> +		for_each_crtc_with_single_output(&data->display, crtc, output) {
> +			if (!pipe_output_combo_valid(&data->display, crtc->pipe, output))
>  				continue;
>=20=20
> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(=
output))
> -				functional_test_pipe(data, pipe, output);
> +			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
> +				      igt_output_name(output))
> +				functional_test_pipe(data, crtc->pipe, output);
>  		}
>  	}
>=20=20
>  	igt_describe("Test for scale-up or scale-down using universal plane API=
 without covering CRTC");
>  	igt_subtest_with_dynamic("universal-plane-sanity") {
> -		for_each_pipe_with_single_output(&data->display, pipe, output) {
> -			if (!pipe_output_combo_valid(&data->display, pipe, output))
> +		for_each_crtc_with_single_output(&data->display, crtc, output) {
> +			if (!pipe_output_combo_valid(&data->display, crtc->pipe, output))
>  				continue;
>=20=20
> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(=
output))
> -				sanity_test_pipe(data, pipe, output);
> +			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
> +				      igt_output_name(output))
> +				sanity_test_pipe(data, crtc->pipe, output);
>  		}
>  	}
>=20=20
>  	igt_describe("Check pageflips while primary plane is disabled before IO=
CTL or between IOCTL"
>  		     " and pageflip execution");
>  	igt_subtest_with_dynamic("disable-primary-vs-flip") {
> -		for_each_pipe_with_single_output(&data->display, pipe, output) {
> -			if (!pipe_output_combo_valid(&data->display, pipe, output))
> +		for_each_crtc_with_single_output(&data->display, crtc, output) {
> +			if (!pipe_output_combo_valid(&data->display, crtc->pipe, output))
>  				continue;
>=20=20
> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(=
output))
> -				pageflip_test_pipe(data, pipe, output);
> +			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
> +				      igt_output_name(output))
> +				pageflip_test_pipe(data, crtc->pipe, output);
>  		}
>  	}
>=20=20
>  	igt_describe("Check for cursor leaks after performing cursor operations=
");
>  	igt_subtest_with_dynamic("cursor-fb-leak") {
> -		for_each_pipe_with_single_output(&data->display, pipe, output) {
> -			if (!pipe_output_combo_valid(&data->display, pipe, output))
> +		for_each_crtc_with_single_output(&data->display, crtc, output) {
> +			if (!pipe_output_combo_valid(&data->display, crtc->pipe, output))
>  				continue;
>=20=20
> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(=
output))
> -				cursor_leak_test_pipe(data, pipe, output);
> +			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
> +				      igt_output_name(output))
> +				cursor_leak_test_pipe(data, crtc->pipe,
> +						      output);
>  		}
>  	}
>=20=20
>  	igt_describe("Check if pageflip succeeds in windowed setting");
>  	igt_subtest_with_dynamic("universal-plane-pageflip-windowed") {
>  		igt_require(is_intel_device(data->drm_fd) && data->display_ver >=3D 9);
> -		for_each_pipe_with_single_output(&data->display, pipe, output) {
> -			if (!pipe_output_combo_valid(&data->display, pipe, output))
> +		for_each_crtc_with_single_output(&data->display, crtc, output) {
> +			if (!pipe_output_combo_valid(&data->display, crtc->pipe, output))
>  				continue;
>=20=20
> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(=
output))
> -				pageflip_win_test_pipe(data, pipe, output);
> +			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
> +				      igt_output_name(output))
> +				pageflip_win_test_pipe(data, crtc->pipe,
> +						       output);
>  		}
>  	}
>  }

--=20
Jani Nikula, Intel
