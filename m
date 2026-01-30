Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC99E6BF17
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 14:30:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A88A10E11C;
	Fri, 30 Jan 2026 14:30:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LuVDfKcn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53A5D10E11C
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 14:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769783422; x=1801319422;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=A6eOc8AYK14DVwqEomxnKo58eyDRSMMEfNaE3rtjVcM=;
 b=LuVDfKcnTii2dwpTuZnhzKCBUpjKGv0ET+MnrQGAUf0fKN3iyn4JI4Tj
 Ze/i1yFrWYhceraUR6T4qAPGwhcJWoV0GGdvgVWNbzyJJrRelrPEO7DJA
 CjwiBTQU36CLpSlAPbkW+WHfH+izgAr/NPd35Ri3N1syqd3/tHLg0F1Bl
 02sb5c7c9ckBMRGoNQOXFeQDWFhMBUqmUb5azfgleavunm1dgwkEnxt9C
 7LL7soLyGCMGmjGmkn8eesQkTTF3eiKmn70gu3uDVMKNrNX/z2JurbE84
 J15cXeCD5sEm2NEDMYj8TkD73ZdezRev/tkK2t9rPjT0kROSBdAMizHjK A==;
X-CSE-ConnectionGUID: 8+mB2JNjRFWPeEKCoZ1BlA==
X-CSE-MsgGUID: mRwOdY5aRfy0ssoV5B8asw==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="88449129"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="88449129"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 06:30:22 -0800
X-CSE-ConnectionGUID: vqUu2n89TqWj4BRSEgmLVw==
X-CSE-MsgGUID: I9HtGQDvRzKDDYJeasZ2Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="240133417"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.77])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 06:30:20 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 14/15] lib/kms: Use
 for_each_crtc_with_valid_output(), part 4
In-Reply-To: <20260130105237.14481-15-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260130105237.14481-1-ville.syrjala@linux.intel.com>
 <20260130105237.14481-15-ville.syrjala@linux.intel.com>
Date: Fri, 30 Jan 2026 16:30:17 +0200
Message-ID: <5034eb78bb4e06c091feac69025efcf919321a9b@intel.com>
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
> Convert the remaining uses of for_each_pipe_with_valid_output()
> to for_each_crtc_with_valid_output(). These should all be
> straiggtforward cases.

*straightforward

*tests/kms

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

>
> Done with cocci:
>  #include "scripts/iterators.cocci"
>
> @find@
> typedef igt_crtc_t;
> iterator name for_each_pipe_with_valid_output;
> iterator name for_each_crtc_with_valid_output;
> expression DISPLAY, OUTPUT;
> identifier PIPE;
> type T;
> @@
> {
> ...
> (
> - T PIPE;
> + igt_crtc_t *crtc;
> |
> - T PIPE =3D PIPE_NONE;
> + igt_crtc_t *crtc;
> )
> <+...
> for_each_pipe_with_valid_output(DISPLAY, PIPE, OUTPUT) { ... }
> ...+>
> }
>
> @change depends on find@
> expression DISPLAY, OUTPUT;
> identifier find.PIPE;
> @@
> - for_each_pipe_with_valid_output(DISPLAY, PIPE, OUTPUT)
> + for_each_crtc_with_valid_output(DISPLAY, crtc, OUTPUT)
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
>  lib/igt_kms.c                          |  4 +-
>  tests/intel/kms_cdclk.c                | 12 ++--
>  tests/intel/kms_draw_crc.c             |  8 +--
>  tests/intel/kms_dsc.c                  |  6 +-
>  tests/intel/kms_fence_pin_leak.c       |  8 +--
>  tests/intel/kms_flip_tiling.c          | 15 +++--
>  tests/intel/kms_frontbuffer_tracking.c | 14 ++---
>  tests/intel/kms_mmap_write_crc.c       | 10 ++--
>  tests/intel/kms_pipe_b_c_ivb.c         |  8 +--
>  tests/intel/kms_pm_rpm.c               |  8 +--
>  tests/intel/kms_psr2_su.c              | 15 ++---
>  tests/intel/kms_psr_stress_test.c      |  6 +-
>  tests/intel/perf_pmu.c                 |  8 +--
>  tests/intel/prime_mmap_kms.c           |  6 +-
>  tests/intel/xe_pat.c                   |  8 +--
>  tests/kms_atomic_interruptible.c       | 79 ++++++++++++++++----------
>  tests/kms_atomic_transition.c          | 25 ++++----
>  tests/kms_flip_event_leak.c            | 11 ++--
>  tests/kms_invalid_mode.c               | 13 +++--
>  tests/kms_panel_fitting.c              | 12 ++--
>  tests/kms_plane_multiple.c             | 11 ++--
>  tests/kms_scaling_modes.c              | 12 ++--
>  tests/kms_sequence.c                   | 13 +++--
>  tests/prime_vgem.c                     |  4 +-
>  tests/vmwgfx/vmw_prime.c               | 16 +++---
>  25 files changed, 186 insertions(+), 146 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index a94c4820bd87..97b41778a52a 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -3274,10 +3274,10 @@ int igt_display_n_crtcs(igt_display_t *display)
>   */
>  void igt_display_require_output(igt_display_t *display)
>  {
> -	enum pipe pipe;
> +	igt_crtc_t *crtc;
>  	igt_output_t *output;
>=20=20
> -	for_each_pipe_with_valid_output(display, pipe, output)
> +	for_each_crtc_with_valid_output(display, crtc, output)
>  		return;
>=20=20
>  	igt_skip("No valid crtc/connector combinations found.\n");
> diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
> index 3ed6e88852e3..bb7c5922b643 100644
> --- a/tests/intel/kms_cdclk.c
> +++ b/tests/intel/kms_cdclk.c
> @@ -324,21 +324,21 @@ static void run_cdclk_test(data_t *data, uint32_t f=
lags)
>  {
>  	igt_display_t *display =3D &data->display;
>  	igt_output_t *output;
> -	enum pipe pipe;
> +	igt_crtc_t *crtc;
>=20=20
> -	for_each_pipe_with_valid_output(display, pipe, output) {
> +	for_each_crtc_with_valid_output(display, crtc, output) {
>  		igt_output_set_crtc(output,
> -				    igt_crtc_for_pipe(output->display, pipe));
> +				    crtc);
>  		if (!intel_pipe_output_combo_valid(display)) {
>  			igt_output_set_crtc(output, NULL);
>  			continue;
>  		}
>=20=20
> -		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
> +		igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc), output->name) {
>  			if (flags & TEST_PLANESCALING)
> -				test_plane_scaling(data, pipe, output);
> +				test_plane_scaling(data, crtc->pipe, output);
>  			if (flags & TEST_MODETRANSITION)
> -				test_mode_transition(data, pipe, output);
> +				test_mode_transition(data, crtc->pipe, output);
>  		}
>  	}
>  }
> diff --git a/tests/intel/kms_draw_crc.c b/tests/intel/kms_draw_crc.c
> index 26bd1fbb1961..9f7f213877b0 100644
> --- a/tests/intel/kms_draw_crc.c
> +++ b/tests/intel/kms_draw_crc.c
> @@ -93,18 +93,18 @@ struct base_crc base_crcs[ARRAY_SIZE(formats)];
>=20=20
>  static void find_modeset_params(void)
>  {
> -	enum pipe pipe;
> +	igt_crtc_t *crtc;
>=20=20
> -	for_each_pipe_with_valid_output(&display, pipe, output) {
> +	for_each_crtc_with_valid_output(&display, crtc, output) {
>  		igt_display_reset(&display);
>=20=20
>  		igt_output_set_crtc(output,
> -				    igt_crtc_for_pipe(output->display, pipe));
> +				    crtc);
>  		if (!intel_pipe_output_combo_valid(&display))
>  			continue;
>=20=20
>  		mode =3D igt_output_get_mode(output);
> -		pipe_crc =3D igt_crtc_crc_new(igt_crtc_for_pipe(&display, pipe),
> +		pipe_crc =3D igt_crtc_crc_new(crtc,
>  					    IGT_PIPE_CRC_SOURCE_AUTO);
>  		/*Only one pipe/output is enough*/
>  		break;
> diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
> index e70cae2524a8..e70e0d202628 100644
> --- a/tests/intel/kms_dsc.c
> +++ b/tests/intel/kms_dsc.c
> @@ -251,7 +251,7 @@ static void test_dsc(data_t *data, uint32_t test_type=
, int bpc,
>  {
>  	igt_display_t *display =3D &data->display;
>  	igt_output_t *output;
> -	enum pipe pipe;
> +	igt_crtc_t *crtc;
>  	char name[3][LEN] =3D {
>  				{0},
>  				{0},
> @@ -260,12 +260,12 @@ static void test_dsc(data_t *data, uint32_t test_ty=
pe, int bpc,
>=20=20
>  	igt_require(check_gen11_bpc_constraint(data->drm_fd, data->input_bpc));
>=20=20
> -	for_each_pipe_with_valid_output(display, pipe, output) {
> +	for_each_crtc_with_valid_output(display, crtc, output) {
>  		data->output_format =3D output_format;
>  		data->plane_format =3D plane_format;
>  		data->input_bpc =3D bpc;
>  		data->output =3D output;
> -		data->pipe =3D pipe;
> +		data->pipe =3D crtc->pipe;
>=20=20
>  		if (!is_dsc_supported_by_sink(data->drm_fd, data->output) ||
>  		    !check_gen11_dp_constraint(data->drm_fd, data->output, data->pipe))
> diff --git a/tests/intel/kms_fence_pin_leak.c b/tests/intel/kms_fence_pin=
_leak.c
> index 15ae038d8b08..8dd39e157a95 100644
> --- a/tests/intel/kms_fence_pin_leak.c
> +++ b/tests/intel/kms_fence_pin_leak.c
> @@ -210,17 +210,17 @@ static void run_test(data_t *data)
>  {
>  	igt_display_t *display =3D &data->display;
>  	igt_output_t *output;
> -	enum pipe p;
> +	igt_crtc_t *crtc;
>=20=20
> -	for_each_pipe_with_valid_output(display, p, output) {
> +	for_each_crtc_with_valid_output(display, crtc, output) {
>  		igt_display_reset(display);
>=20=20
>  		igt_output_set_crtc(output,
> -				    igt_crtc_for_pipe(output->display, p));
> +				    crtc);
>  		if (!intel_pipe_output_combo_valid(display))
>  			continue;
>=20=20
> -		run_single_test(data, p, output);
> +		run_single_test(data, crtc->pipe, output);
>=20=20
>  		return; /* one time ought to be enough */
>  	}
> diff --git a/tests/intel/kms_flip_tiling.c b/tests/intel/kms_flip_tiling.c
> index 269bb0e24d0a..c063a60c8423 100644
> --- a/tests/intel/kms_flip_tiling.c
> +++ b/tests/intel/kms_flip_tiling.c
> @@ -225,17 +225,17 @@ int igt_main()
>=20=20
>  	igt_describe("Check pageflip between modifiers");
>  	igt_subtest_with_dynamic("flip-change-tiling") {
> -		enum pipe pipe;
> +		igt_crtc_t *crtc;
>  		bool run_in_simulation =3D igt_run_in_simulation();
>=20=20
> -		for_each_pipe_with_valid_output(&data.display, pipe, output) {
> +		for_each_crtc_with_valid_output(&data.display, crtc, output) {
>  			igt_plane_t *plane;
>=20=20
>  			igt_display_reset(&data.display);
>  			pipe_crc_free(&data);
>=20=20
>  			igt_output_set_crtc(output,
> -					    igt_crtc_for_pipe(output->display, pipe));
> +					    crtc);
>  			if (!intel_pipe_output_combo_valid(&data.display))
>  				continue;
>=20=20
> @@ -260,17 +260,20 @@ int igt_main()
>  						continue;
>=20=20
>  					igt_dynamic_f("pipe-%s-%s-%s-to-%s",
> -						      kmstest_pipe_name(pipe),
> +						      igt_crtc_name(crtc),
>  						      igt_output_name(output),
>  						      igt_fb_modifier_name(modifier[0]),
>  						      igt_fb_modifier_name(modifier[1]))
> -						test_flip_tiling(&data, pipe, output, modifier);
> +						test_flip_tiling(&data,
> +								 crtc->pipe,
> +								 output,
> +								 modifier);
>=20=20
>  					if (data.flipevent_in_queue)
>  						handle_lost_event(&data);
>  				}
>  			}
> -			test_cleanup(&data, pipe, output);
> +			test_cleanup(&data, crtc->pipe, output);
>  		}
>  	}
>=20=20
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_fro=
ntbuffer_tracking.c
> index cd80ba444cf5..b60874db000a 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -1163,20 +1163,20 @@ static bool find_connector(bool edp_only, bool pi=
pe_a,
>  			   enum pipe *ret_pipe)
>  {
>  	igt_output_t *output;
> -	enum pipe pipe;
> +	igt_crtc_t *crtc;
>=20=20
> -	for_each_pipe_with_valid_output(&drm.display, pipe, output) {
> +	for_each_crtc_with_valid_output(&drm.display, crtc, output) {
>  		drmModeConnectorPtr c =3D output->config.connector;
>=20=20
>  		if (edp_only && c->connector_type !=3D DRM_MODE_CONNECTOR_eDP)
>  			continue;
>=20=20
> -		if (pipe_a && pipe !=3D PIPE_A)
> +		if (pipe_a && crtc->pipe !=3D PIPE_A)
>  			continue;
>=20=20
> -		if (output =3D=3D forbidden_output || pipe =3D=3D forbidden_pipe) {
> +		if (output =3D=3D forbidden_output || crtc->pipe =3D=3D forbidden_pipe=
) {
>  			igt_output_set_crtc(output,
> -					    igt_crtc_for_pipe(output->display, pipe));
> +					    crtc);
>  			igt_output_override_mode(output, connector_get_mode(output));
>=20=20
>  			continue;
> @@ -1186,11 +1186,11 @@ static bool find_connector(bool edp_only, bool pi=
pe_a,
>  			continue;
>=20=20
>  		igt_output_set_crtc(output,
> -				    igt_crtc_for_pipe(output->display, pipe));
> +				    crtc);
>  		igt_output_override_mode(output, connector_get_mode(output));
>  		if (intel_pipe_output_combo_valid(&drm.display)) {
>  			*ret_output =3D output;
> -			*ret_pipe =3D pipe;
> +			*ret_pipe =3D crtc->pipe;
>  			return true;
>  		}
>  	}
> diff --git a/tests/intel/kms_mmap_write_crc.c b/tests/intel/kms_mmap_writ=
e_crc.c
> index 453bcd0198a7..c68fd69c402d 100644
> --- a/tests/intel/kms_mmap_write_crc.c
> +++ b/tests/intel/kms_mmap_write_crc.c
> @@ -269,7 +269,7 @@ int igt_main_args("n", NULL, NULL, opt_handler, NULL)
>  {
>  	int i;
>  	igt_output_t *output;
> -	enum pipe pipe;
> +	igt_crtc_t *crtc;
>=20=20
>  	igt_fixture() {
>  		data.drm_fd =3D drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
> @@ -289,18 +289,18 @@ int igt_main_args("n", NULL, NULL, opt_handler, NUL=
L)
>  	igt_describe("Tests that caching mode has become UC/WT and flushed usin=
g mmap write");
>=20=20
>  	igt_subtest_with_dynamic("main") {
> -		for_each_pipe_with_valid_output(&data.display, pipe, output) {
> +		for_each_crtc_with_valid_output(&data.display, crtc, output) {
>  			igt_display_reset(&data.display);
>=20=20
>  			igt_output_set_crtc(output,
> -					    igt_crtc_for_pipe(output->display, pipe));
> +					    crtc);
>  			if (!intel_pipe_output_combo_valid(&data.display))
>  				continue;
>=20=20
> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
> +			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
>  				      igt_output_name(output)) {
>  				data.output =3D output;
> -				data.pipe =3D pipe;
> +				data.pipe =3D crtc->pipe;
>=20=20
>  				igt_info("Using %d rounds for each pipe in the test\n", ROUNDS);
>  				prepare_crtc(&data);
> diff --git a/tests/intel/kms_pipe_b_c_ivb.c b/tests/intel/kms_pipe_b_c_iv=
b.c
> index 4559c8b9e951..f6261cb885b9 100644
> --- a/tests/intel/kms_pipe_b_c_ivb.c
> +++ b/tests/intel/kms_pipe_b_c_ivb.c
> @@ -150,16 +150,16 @@ static void
>  find_outputs(data_t *data, igt_output_t **output1, igt_output_t **output=
2)
>  {
>  	igt_output_t *output;
> -	enum pipe pipe;
> +	igt_crtc_t *crtc;
>=20=20
>  	*output1 =3D NULL;
>  	*output2 =3D NULL;
>=20=20
> -	for_each_pipe_with_valid_output(&data->display, pipe, output) {
> -		if (pipe =3D=3D PIPE_B && !*output1 && output !=3D *output2)
> +	for_each_crtc_with_valid_output(&data->display, crtc, output) {
> +		if (crtc->pipe =3D=3D PIPE_B && !*output1 && output !=3D *output2)
>  			*output1 =3D output;
>=20=20
> -		if (pipe =3D=3D PIPE_C && output !=3D *output1 && !*output2)
> +		if (crtc->pipe =3D=3D PIPE_C && output !=3D *output1 && !*output2)
>  			*output2 =3D output;
>=20=20
>  		igt_output_set_crtc(output, NULL);
> diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c
> index d7d0989b9a67..31f596413f9f 100644
> --- a/tests/intel/kms_pm_rpm.c
> +++ b/tests/intel/kms_pm_rpm.c
> @@ -1620,22 +1620,22 @@ static bool is_preferred_mode_present(igt_output_=
t *output, enum pipe pipe,
>=20=20
>  static void set_prefered_mode(void)
>  {
> -	enum pipe pipe;
> +	igt_crtc_t *crtc;
>  	igt_output_t *output;
>  	bool mode_found =3D false;
>  	igt_display_t *display =3D &ms_data.display;
>=20=20
>  	igt_display_reset(display);
>=20=20
> -	for_each_pipe_with_valid_output(display, pipe, output) {
> +	for_each_crtc_with_valid_output(display, crtc, output) {
>=20=20
>  		igt_output_set_crtc(output,
> -				    igt_crtc_for_pipe(output->display, pipe));
> +				    crtc);
>=20=20
>  		if (!intel_pipe_output_combo_valid(display))
>  			continue;
>=20=20
> -		if (is_preferred_mode_present(output, pipe, display)) {
> +		if (is_preferred_mode_present(output, crtc->pipe, display)) {
>  			mode_found =3D true;
>  			break;
>  		}
> diff --git a/tests/intel/kms_psr2_su.c b/tests/intel/kms_psr2_su.c
> index 24318037ea44..39ee3ee17e54 100644
> --- a/tests/intel/kms_psr2_su.c
> +++ b/tests/intel/kms_psr2_su.c
> @@ -118,9 +118,9 @@ static void setup_output(data_t *data)
>  {
>  	igt_display_t *display =3D &data->display;
>  	igt_output_t *output;
> -	enum pipe pipe;
> +	igt_crtc_t *crtc;
>=20=20
> -	for_each_pipe_with_valid_output(display, pipe, output) {
> +	for_each_crtc_with_valid_output(display, crtc, output) {
>  		drmModeConnectorPtr c =3D output->config.connector;
>=20=20
>  		if (c->connector_type !=3D DRM_MODE_CONNECTOR_eDP)
> @@ -128,7 +128,7 @@ static void setup_output(data_t *data)
>=20=20
>  		igt_display_reset(display);
>  		igt_output_set_crtc(output,
> -				    igt_crtc_for_pipe(output->display, pipe));
> +				    crtc);
>  		if (!intel_pipe_output_combo_valid(display))
>  			continue;
>=20=20
> @@ -313,7 +313,7 @@ static int check_psr2_support(data_t *data, enum pipe=
 pipe)
>  int igt_main()
>  {
>  	data_t data =3D {};
> -	enum pipe pipe;
> +	igt_crtc_t *crtc;
>  	int r, i;
>  	igt_output_t *outputs[IGT_MAX_PIPES * IGT_MAX_PIPES];
>  	int pipes[IGT_MAX_PIPES * IGT_MAX_PIPES];
> @@ -354,9 +354,10 @@ int igt_main()
>  		r =3D timerfd_settime(data.change_screen_timerfd, 0, &interval, NULL);
>  		igt_require_f(r !=3D -1, "Error setting timerfd\n");
>=20=20
> -		for_each_pipe_with_valid_output(&data.display, pipe, data.output) {
> -			if (check_psr2_support(&data, pipe)) {
> -				pipes[n_pipes] =3D pipe;
> +		for_each_crtc_with_valid_output(&data.display, crtc,
> +						data.output) {
> +			if (check_psr2_support(&data, crtc->pipe)) {
> +				pipes[n_pipes] =3D crtc->pipe;
>  				outputs[n_pipes] =3D data.output;
>  				n_pipes++;
>  			}
> diff --git a/tests/intel/kms_psr_stress_test.c b/tests/intel/kms_psr_stre=
ss_test.c
> index 87016eb94f4f..09e73bd49bb3 100644
> --- a/tests/intel/kms_psr_stress_test.c
> +++ b/tests/intel/kms_psr_stress_test.c
> @@ -83,11 +83,11 @@ static void setup_output(data_t *data)
>  {
>  	igt_display_t *display =3D &data->display;
>  	igt_output_t *output;
> -	enum pipe pipe;
> +	igt_crtc_t *crtc;
>=20=20
>  	igt_display_require(&data->display, data->drm_fd);
>=20=20
> -	for_each_pipe_with_valid_output(display, pipe, output) {
> +	for_each_crtc_with_valid_output(display, crtc, output) {
>  		drmModeConnectorPtr c =3D output->config.connector;
>=20=20
>  		if (c->connector_type !=3D DRM_MODE_CONNECTOR_eDP)
> @@ -95,7 +95,7 @@ static void setup_output(data_t *data)
>=20=20
>  		igt_display_reset(display);
>  		igt_output_set_crtc(output,
> -				    igt_crtc_for_pipe(output->display, pipe));
> +				    crtc);
>  		if (!intel_pipe_output_combo_valid(display)) {
>  			igt_output_set_crtc(output, NULL);
>  			continue;
> diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
> index 57113981d70a..f87674f74e8f 100644
> --- a/tests/intel/perf_pmu.c
> +++ b/tests/intel/perf_pmu.c
> @@ -1120,7 +1120,7 @@ event_wait(int gem_fd, const intel_ctx_t *ctx,
>  	uint16_t devid;
>  	igt_output_t *output;
>  	data_t data;
> -	enum pipe p;
> +	igt_crtc_t *crtc;
>  	int fd;
>=20=20
>  	devid =3D intel_get_drm_devid(gem_fd);
> @@ -1167,13 +1167,13 @@ event_wait(int gem_fd, const intel_ctx_t *ctx,
>  	eb.flags =3D e->flags | I915_EXEC_SECURE;
>  	eb.rsvd1 =3D ctx->id;
>=20=20
> -	for_each_pipe_with_valid_output(&data.display, p, output) {
> +	for_each_crtc_with_valid_output(&data.display, crtc, output) {
>  		struct igt_helper_process waiter =3D { };
>  		const unsigned int frames =3D 3;
>  		uint64_t val[2];
>=20=20
>  		batch[6] =3D MI_WAIT_FOR_EVENT;
> -		switch (p) {
> +		switch (crtc->pipe) {
>  		case PIPE_A:
>  			batch[6] |=3D MI_WAIT_FOR_PIPE_A_VBLANK;
>  			batch[5] =3D ~(1 << 3);
> @@ -1192,7 +1192,7 @@ event_wait(int gem_fd, const intel_ctx_t *ctx,
>=20=20
>  		gem_write(gem_fd, obj.handle, 0, batch, sizeof(batch));
>=20=20
> -		data.pipe =3D p;
> +		data.pipe =3D crtc->pipe;
>  		prepare_crtc(&data, gem_fd, output);
>=20=20
>  		fd =3D open_pmu(gem_fd,
> diff --git a/tests/intel/prime_mmap_kms.c b/tests/intel/prime_mmap_kms.c
> index c19c3763fc04..b263a5822063 100644
> --- a/tests/intel/prime_mmap_kms.c
> +++ b/tests/intel/prime_mmap_kms.c
> @@ -201,13 +201,13 @@ static void run_test(gpu_process_t *gpu)
>  {
>  	igt_display_t *display =3D &gpu->display;
>  	igt_output_t *output;
> -	enum pipe pipe;
> +	igt_crtc_t *crtc;
>=20=20
> -	for_each_pipe_with_valid_output(display, pipe, output) {
> +	for_each_crtc_with_valid_output(display, crtc, output) {
>  		int prime_fd;
>=20=20
>  		gpu->output =3D output;
> -		gpu->pipe =3D pipe;
> +		gpu->pipe =3D crtc->pipe;
>=20=20
>  		prepare_crtc(gpu);
>=20=20
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> index 24339f688ce6..21547c84e7f9 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -910,7 +910,7 @@ static void display_vs_wb_transient(int fd)
>  	struct buf_ops *bops;
>  	struct igt_fb src_fb, dst_fb;
>  	struct intel_buf src, dst;
> -	enum pipe pipe;
> +	igt_crtc_t *crtc;
>  	int bpp =3D 32;
>  	int i;
>=20=20
> @@ -927,16 +927,16 @@ static void display_vs_wb_transient(int fd)
>  	bops =3D buf_ops_create(fd);
>  	ibb =3D intel_bb_create(fd, SZ_4K);
>=20=20
> -	for_each_pipe_with_valid_output(&display, pipe, output) {
> +	for_each_crtc_with_valid_output(&display, crtc, output) {
>  		igt_display_reset(&display);
>=20=20
>  		igt_output_set_crtc(output,
> -				    igt_crtc_for_pipe(output->display, pipe));
> +				    crtc);
>  		if (!intel_pipe_output_combo_valid(&display))
>  			continue;
>=20=20
>  		mode =3D igt_output_get_mode(output);
> -		pipe_crc =3D igt_crtc_crc_new(igt_crtc_for_pipe(&display, pipe),
> +		pipe_crc =3D igt_crtc_crc_new(crtc,
>  					    IGT_PIPE_CRC_SOURCE_AUTO);
>  		break;
>  	}
> diff --git a/tests/kms_atomic_interruptible.c b/tests/kms_atomic_interrup=
tible.c
> index 05cf3f956e1f..8565fc501dc7 100644
> --- a/tests/kms_atomic_interruptible.c
> +++ b/tests/kms_atomic_interruptible.c
> @@ -325,7 +325,7 @@ int igt_main()
>  {
>  	igt_display_t display;
>  	igt_output_t *output;
> -	enum pipe pipe;
> +	igt_crtc_t *crtc;
>=20=20
>  	igt_fixture() {
>  		display.drm_fd =3D drm_open_driver_master(DRIVER_ANY);
> @@ -341,84 +341,105 @@ int igt_main()
>=20=20
>  	igt_describe("Tests the interrupt properties of legacy modeset");
>  	igt_subtest_with_dynamic("legacy-setmode") {
> -		for_each_pipe_with_valid_output(&display, pipe, output) {
> -			if (!pipe_output_combo_valid(&display, pipe, output))
> +		for_each_crtc_with_valid_output(&display, crtc, output) {
> +			if (!pipe_output_combo_valid(&display, crtc->pipe, output))
>  				continue;
>=20=20
> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(=
output))
> -				run_plane_test(&display, pipe, output, test_legacy_modeset, DRM_PLAN=
E_TYPE_PRIMARY);
> +			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
> +				      igt_output_name(output))
> +				run_plane_test(&display, crtc->pipe, output,
> +					       test_legacy_modeset,
> +					       DRM_PLANE_TYPE_PRIMARY);
>  			break;
>  		}
>  	}
>=20=20
>  	igt_describe("Tests the interrupt properties of atomic modeset");
>  	igt_subtest_with_dynamic("atomic-setmode") {
> -		for_each_pipe_with_valid_output(&display, pipe, output) {
> -			if (!pipe_output_combo_valid(&display, pipe, output))
> +		for_each_crtc_with_valid_output(&display, crtc, output) {
> +			if (!pipe_output_combo_valid(&display, crtc->pipe, output))
>  				continue;
>=20=20
> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(=
output))
> -				run_plane_test(&display, pipe, output, test_atomic_modeset, DRM_PLAN=
E_TYPE_PRIMARY);
> +			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
> +				      igt_output_name(output))
> +				run_plane_test(&display, crtc->pipe, output,
> +					       test_atomic_modeset,
> +					       DRM_PLANE_TYPE_PRIMARY);
>  			break;
>  		}
>  	}
>=20=20
>  	igt_describe("Tests the interrupt properties for DPMS");
>  	igt_subtest_with_dynamic("legacy-dpms") {
> -		for_each_pipe_with_valid_output(&display, pipe, output) {
> -			if (!pipe_output_combo_valid(&display, pipe, output))
> +		for_each_crtc_with_valid_output(&display, crtc, output) {
> +			if (!pipe_output_combo_valid(&display, crtc->pipe, output))
>  				continue;
>=20=20
> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(=
output))
> -				run_plane_test(&display, pipe, output, test_legacy_dpms, DRM_PLANE_T=
YPE_PRIMARY);
> +			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
> +				      igt_output_name(output))
> +				run_plane_test(&display, crtc->pipe, output,
> +					       test_legacy_dpms,
> +					       DRM_PLANE_TYPE_PRIMARY);
>  			break;
>  		}
>  	}
>=20=20
>  	igt_describe("Tests the interrupt properties for pageflip");
>  	igt_subtest_with_dynamic("legacy-pageflip") {
> -		for_each_pipe_with_valid_output(&display, pipe, output) {
> -			if (!pipe_output_combo_valid(&display, pipe, output))
> +		for_each_crtc_with_valid_output(&display, crtc, output) {
> +			if (!pipe_output_combo_valid(&display, crtc->pipe, output))
>  				continue;
>=20=20
> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(=
output))
> -				run_plane_test(&display, pipe, output, test_pageflip, DRM_PLANE_TYPE=
_PRIMARY);
> +			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
> +				      igt_output_name(output))
> +				run_plane_test(&display, crtc->pipe, output,
> +					       test_pageflip,
> +					       DRM_PLANE_TYPE_PRIMARY);
>  			break;
>  		}
>  	}
>=20=20
>  	igt_describe("Tests the interrupt properties for cursor");
>  	igt_subtest_with_dynamic("legacy-cursor") {
> -		for_each_pipe_with_valid_output(&display, pipe, output) {
> -			if (!pipe_output_combo_valid(&display, pipe, output))
> +		for_each_crtc_with_valid_output(&display, crtc, output) {
> +			if (!pipe_output_combo_valid(&display, crtc->pipe, output))
>  				continue;
>=20=20
> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(=
output))
> -				run_plane_test(&display, pipe, output, test_setcursor, DRM_PLANE_TYP=
E_CURSOR);
> +			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
> +				      igt_output_name(output))
> +				run_plane_test(&display, crtc->pipe, output,
> +					       test_setcursor,
> +					       DRM_PLANE_TYPE_CURSOR);
>  			break;
>  		}
>  	}
>=20=20
>  	igt_describe("Tests the interrupt properties for primary plane");
>  	igt_subtest_with_dynamic("universal-setplane-primary") {
> -		for_each_pipe_with_valid_output(&display, pipe, output) {
> -			if (!pipe_output_combo_valid(&display, pipe, output))
> +		for_each_crtc_with_valid_output(&display, crtc, output) {
> +			if (!pipe_output_combo_valid(&display, crtc->pipe, output))
>  				continue;
>=20=20
> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(=
output))
> -				run_plane_test(&display, pipe, output, test_setplane, DRM_PLANE_TYPE=
_PRIMARY);
> +			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
> +				      igt_output_name(output))
> +				run_plane_test(&display, crtc->pipe, output,
> +					       test_setplane,
> +					       DRM_PLANE_TYPE_PRIMARY);
>  			break;
>  		}
>  	}
>=20=20
>  	igt_describe("Tests the interrupt properties for cursor plane");
>  	igt_subtest_with_dynamic("universal-setplane-cursor") {
> -		for_each_pipe_with_valid_output(&display, pipe, output) {
> -			if (!pipe_output_combo_valid(&display, pipe, output))
> +		for_each_crtc_with_valid_output(&display, crtc, output) {
> +			if (!pipe_output_combo_valid(&display, crtc->pipe, output))
>  				continue;
>=20=20
> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(=
output))
> -				run_plane_test(&display, pipe, output, test_setplane, DRM_PLANE_TYPE=
_CURSOR);
> +			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
> +				      igt_output_name(output))
> +				run_plane_test(&display, crtc->pipe, output,
> +					       test_setplane,
> +					       DRM_PLANE_TYPE_CURSOR);
>  			break;
>  		}
>  	}
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index f0598e486111..ece95961cdf2 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -1128,7 +1128,7 @@ static data_t data;
>  int igt_main_args("", long_opts, help_str, opt_handler, &data)
>  {
>  	igt_output_t *output;
> -	enum pipe pipe;
> +	igt_crtc_t *crtc;
>  	struct {
>  		const char *name;
>  		enum transition_type type;
> @@ -1201,17 +1201,18 @@ int igt_main_args("", long_opts, help_str, opt_ha=
ndler, &data)
>  	igt_subtest_with_dynamic("plane-primary-toggle-with-vblank-wait") {
>  		pipe_count =3D 0;
>=20=20
> -		for_each_pipe_with_valid_output(&data.display, pipe, output) {
> +		for_each_crtc_with_valid_output(&data.display, crtc, output) {
>  			if (pipe_count =3D=3D 2 * count && !data.extended)
>  				break;
>=20=20
> -			if (!pipe_output_combo_valid(&data.display, pipe, output))
> +			if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
>  				continue;
>=20=20
>  			pipe_count++;
> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(=
output))
> -				run_primary_test(&data, pipe, output);
> -			test_cleanup(&data, pipe, output, false);
> +			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
> +				      igt_output_name(output))
> +				run_primary_test(&data, crtc->pipe, output);
> +			test_cleanup(&data, crtc->pipe, output, false);
>  		}
>  	}
>=20=20
> @@ -1223,7 +1224,8 @@ int igt_main_args("", long_opts, help_str, opt_hand=
ler, &data)
>  		igt_subtest_with_dynamic_f("%s", transition_tests[i].name) {
>  			pipe_count =3D 0;
>=20=20
> -			for_each_pipe_with_valid_output(&data.display, pipe, output) {
> +			for_each_crtc_with_valid_output(&data.display, crtc,
> +							output) {
>  				/*
>  				 * Test modeset cases on internal panels separately with a reduced
>  				 * number of combinations, to avoid long runtimes due to modesets on
> @@ -1240,19 +1242,20 @@ int igt_main_args("", long_opts, help_str, opt_ha=
ndler, &data)
>  				if (pipe_count =3D=3D 2 * count && !data.extended)
>  					break;
>=20=20
> -				if (!pipe_output_combo_valid(&data.display, pipe, output))
> +				if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
>  					continue;
>=20=20
>  				pipe_count++;
>  				igt_dynamic_f("pipe-%s-%s",
> -					      kmstest_pipe_name(pipe),
> +					      igt_crtc_name(crtc),
>  					      igt_output_name(output))
> -					run_transition_test(&data, pipe, output,
> +					run_transition_test(&data, crtc->pipe,
> +							    output,
>  							    transition_tests[i].type,
>  							    transition_tests[i].nonblocking,
>  							    transition_tests[i].fencing);
>=20=20
> -				test_cleanup(&data, pipe, output,
> +				test_cleanup(&data, crtc->pipe, output,
>  					     transition_tests[i].fencing);
>  			}
>  		}
> diff --git a/tests/kms_flip_event_leak.c b/tests/kms_flip_event_leak.c
> index ce8993ccb681..545719638898 100644
> --- a/tests/kms_flip_event_leak.c
> +++ b/tests/kms_flip_event_leak.c
> @@ -107,7 +107,7 @@ int igt_main()
>  {
>  	data_t data =3D {};
>  	igt_output_t *output;
> -	enum pipe pipe;
> +	igt_crtc_t *crtc;
>=20=20
>  	igt_fixture() {
>  		data.drm_fd =3D drm_open_driver_master(DRIVER_ANY);
> @@ -118,16 +118,17 @@ int igt_main()
>  	}
>=20=20
>  	igt_subtest_with_dynamic("basic") {
> -		for_each_pipe_with_valid_output(&data.display, pipe, output) {
> +		for_each_crtc_with_valid_output(&data.display, crtc, output) {
>  			igt_display_reset(&data.display);
>=20=20
>  			igt_output_set_crtc(output,
> -					    igt_crtc_for_pipe(output->display, pipe));
> +					    crtc);
>  			if (!intel_pipe_output_combo_valid(&data.display))
>  				continue;
>=20=20
> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(=
output)) {
> -				test(&data, pipe, output);
> +			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
> +				      igt_output_name(output)) {
> +				test(&data, crtc->pipe, output);
>  			}
>  		}
>  	}
> diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
> index a3d52deafd7f..163bdb96bc3a 100644
> --- a/tests/kms_invalid_mode.c
> +++ b/tests/kms_invalid_mode.c
> @@ -337,7 +337,7 @@ static data_t data;
>  int igt_main()
>  {
>=20=20
> -	enum pipe pipe;
> +	igt_crtc_t *crtc;
>  	igt_output_t *output;
>=20=20
>  	igt_fixture() {
> @@ -356,17 +356,20 @@ int igt_main()
>  	igt_describe("Make sure all modesets are rejected when the requested mo=
de is invalid");
>  	for (int i =3D 0; i < ARRAY_SIZE(subtests); i++) {
>  		igt_subtest_with_dynamic(subtests[i].name) {
> -			for_each_pipe_with_valid_output(&data.display, pipe, output) {
> +			for_each_crtc_with_valid_output(&data.display, crtc,
> +							output) {
>  				igt_display_reset(&data.display);
>=20=20
>  				igt_output_set_crtc(output,
> -						    igt_crtc_for_pipe(output->display, pipe));
> +						    crtc);
>  				if (!intel_pipe_output_combo_valid(&data.display))
>  					continue;
>=20=20
> -				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name=
(output)) {
> +				igt_dynamic_f("pipe-%s-%s",
> +					      igt_crtc_name(crtc),
> +					      igt_output_name(output)) {
>  					data.output =3D output;
> -					data.pipe =3D pipe;
> +					data.pipe =3D crtc->pipe;
>  					data.adjust_mode =3D subtests[i].adjust_mode;
>  					test_output(&data);
>  				}
> diff --git a/tests/kms_panel_fitting.c b/tests/kms_panel_fitting.c
> index 9bfb7d3f1356..f4c2d0697539 100644
> --- a/tests/kms_panel_fitting.c
> +++ b/tests/kms_panel_fitting.c
> @@ -246,7 +246,7 @@ static void test_panel_fitting(data_t *data, enum tes=
t_type type)
>  {
>  	igt_display_t *display =3D &data->display;
>  	igt_output_t *output;
> -	enum pipe pipe;
> +	igt_crtc_t *crtc;
>  	struct stat sb;
>=20=20
>  	if (type =3D=3D TEST_ATOMIC) {
> @@ -265,18 +265,20 @@ static void test_panel_fitting(data_t *data, enum t=
est_type type)
>=20=20
>  	}
>=20=20
> -	for_each_pipe_with_valid_output(display, pipe, output) {
> +	for_each_crtc_with_valid_output(display, crtc, output) {
>  		/* Check that the "scaling mode" property has been set. */
>  		if (!igt_output_has_prop(output, IGT_CONNECTOR_SCALING_MODE))
>  			continue;
>=20=20
>  		cleanup_crtc(data);
>=20=20
> -		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
> +		igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc), output->name) {
>  			if (type =3D=3D TEST_ATOMIC)
> -				test_panel_fitting_fastset(display, pipe, output);
> +				test_panel_fitting_fastset(display,
> +							   crtc->pipe, output);
>  			if (type =3D=3D TEST_LEGACY)
> -				test_panel_fitting_legacy(data, display, pipe, output);
> +				test_panel_fitting_legacy(data, display,
> +							  crtc->pipe, output);
>  		}
>  	}
>  }
> diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
> index fd2293a6c742..e399f3ee270d 100644
> --- a/tests/kms_plane_multiple.c
> +++ b/tests/kms_plane_multiple.c
> @@ -556,23 +556,24 @@ static void run_2_display_test(data_t *data, uint64=
_t modifier, const char *name
>=20=20
>  static void run_test(data_t *data, uint64_t modifier, const char *name)
>  {
> -	enum pipe pipe;
> +	igt_crtc_t *crtc;
>  	igt_output_t *output;
>  	igt_display_t *display =3D &data->display;
>=20=20
>  	igt_skip_on_f(!igt_display_has_format_mod(display, DRM_FORMAT_XRGB8888,=
 modifier),
>  		      "%s modifier is not supported\n", name);
>=20=20
> -	for_each_pipe_with_valid_output(display, pipe, output) {
> +	for_each_crtc_with_valid_output(display, crtc, output) {
>  		igt_display_reset(display);
>=20=20
>  		igt_output_set_crtc(output,
> -				    igt_crtc_for_pipe(output->display, pipe));
> +				    crtc);
>  		if (!intel_pipe_output_combo_valid(display))
>  			continue;
>=20=20
> -		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
> -			test_plane_position(data, pipe, output, modifier);
> +		igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc), output->name)
> +			test_plane_position(data, crtc->pipe, output,
> +					    modifier);
>  	}
>  }
>=20=20
> diff --git a/tests/kms_scaling_modes.c b/tests/kms_scaling_modes.c
> index 588513750257..f74db2912561 100644
> --- a/tests/kms_scaling_modes.c
> +++ b/tests/kms_scaling_modes.c
> @@ -110,9 +110,9 @@ static void test_scaling_mode(data_t *data, uint32_t =
flags)
>  {
>  	igt_display_t *display =3D &data->display;
>  	igt_output_t *output;
> -	enum pipe pipe;
> +	igt_crtc_t *crtc;
>=20=20
> -	for_each_pipe_with_valid_output(display, pipe, output) {
> +	for_each_crtc_with_valid_output(display, crtc, output) {
>  		igt_display_reset(display);
>=20=20
>  		if (!has_scaling_mode(output)) {
> @@ -122,12 +122,14 @@ static void test_scaling_mode(data_t *data, uint32_=
t flags)
>  		}
>=20=20
>  		igt_output_set_crtc(output,
> -				    igt_crtc_for_pipe(output->display, pipe));
> +				    crtc);
>  		if (!intel_pipe_output_combo_valid(display))
>  			continue;
>=20=20
> -		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(o=
utput))
> -			test_scaling_mode_on_output(display, pipe, output, flags);
> +		igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
> +			      igt_output_name(output))
> +			test_scaling_mode_on_output(display, crtc->pipe,
> +						    output, flags);
>  	}
>  }
>=20=20
> diff --git a/tests/kms_sequence.c b/tests/kms_sequence.c
> index 9eea70cf7a88..7fe314afaf7f 100644
> --- a/tests/kms_sequence.c
> +++ b/tests/kms_sequence.c
> @@ -272,7 +272,7 @@ int igt_main()
>  {
>  	int fd;
>  	igt_output_t *output;
> -	enum pipe p;
> +	igt_crtc_t *crtc;
>  	data_t data;
>  	const struct {
>  		const char *name;
> @@ -309,16 +309,19 @@ int igt_main()
>  			igt_describe("This is a test of drmCrtcGetSequence and "
>  				     "drmCrtcQueueSequence");
>  			igt_subtest_with_dynamic_f("%s-%s", f->name, m->name) {
> -				for_each_pipe_with_valid_output(&data.display, p, output) {
> +				for_each_crtc_with_valid_output(&data.display,
> +								crtc, output) {
>  					igt_display_reset(&data.display);
>=20=20
>  					igt_output_set_crtc(output,
> -							    igt_crtc_for_pipe(output->display, p));
> +							    crtc);
>  					if (!intel_pipe_output_combo_valid(&data.display))
>  						continue;
>=20=20
> -					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p), igt_output_name(o=
utput)) {
> -						data.pipe =3D p;
> +					igt_dynamic_f("pipe-%s-%s",
> +						      igt_crtc_name(crtc),
> +						      igt_output_name(output)) {
> +						data.pipe =3D crtc->pipe;
>  						data.output =3D output;
>  						data.flags =3D m->flags;
>  						run_test(&data, fd, f->func);
> diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
> index 79963648f132..bbf5ab97f459 100644
> --- a/tests/prime_vgem.c
> +++ b/tests/prime_vgem.c
> @@ -1053,12 +1053,12 @@ static void test_flip(int i915, int vgem, unsigne=
d hang)
>  	igt_display_t display;
>  	igt_output_t *output;
>  	struct vgem_bo bo[2];
> -	enum pipe pipe;
> +	igt_crtc_t *crtc;
>=20=20
>  	igt_display_require(&display, i915);
>  	igt_display_require_output(&display);
>=20=20
> -	for_each_pipe_with_valid_output(&display, pipe, output) {
> +	for_each_crtc_with_valid_output(&display, crtc, output) {
>  		mode =3D igt_output_get_mode(output);
>  		break;
>  	}
> diff --git a/tests/vmwgfx/vmw_prime.c b/tests/vmwgfx/vmw_prime.c
> index 5f704089b146..e5aca6169e3b 100644
> --- a/tests/vmwgfx/vmw_prime.c
> +++ b/tests/vmwgfx/vmw_prime.c
> @@ -287,20 +287,20 @@ static void draw_triangle_3d(struct gpu_process_t *=
gpu, uint32_t draw_flags)
>  {
>  	igt_display_t *display =3D &gpu->display;
>  	igt_output_t *output;
> -	enum pipe pipe;
> +	igt_crtc_t *crtc;
>  	igt_pipe_crc_t *pipe_crc;
>  	igt_crc_t blank_crc, tri_crc;
>  	char *blank_crc_str, *tri_crc_str;
>  	bool crc_equal;
>=20=20
> -	for_each_pipe_with_valid_output(display, pipe, output) {
> +	for_each_crtc_with_valid_output(display, crtc, output) {
>  		int prime_fd;
>=20=20
>  		gpu->output =3D output;
> -		gpu->pipe =3D pipe;
> +		gpu->pipe =3D crtc->pipe;
>=20=20
>  		prepare_crtc(gpu);
> -		pipe_crc =3D igt_pipe_crc_new(gpu->mdevice.drm_fd, pipe,
> +		pipe_crc =3D igt_pipe_crc_new(gpu->mdevice.drm_fd, crtc->pipe,
>  					    IGT_PIPE_CRC_SOURCE_AUTO);
>  		igt_pipe_crc_collect_crc(pipe_crc, &blank_crc);
>=20=20
> @@ -352,7 +352,7 @@ static void draw_dumb_buffer(struct gpu_process_t *gp=
u)
>  {
>  	igt_display_t *display =3D &gpu->display;
>  	igt_output_t *output;
> -	enum pipe pipe;
> +	igt_crtc_t *crtc;
>  	igt_pipe_crc_t *pipe_crc;
>  	igt_crc_t blank_crc, red_crc, blue_crc, tri_crc, red2_crc;
>  	char *blank_crc_str, *red_crc_str, *red2_crc_str, *blue_crc_str,
> @@ -362,12 +362,12 @@ static void draw_dumb_buffer(struct gpu_process_t *=
gpu)
>  	struct vmw_default_objects objects =3D { 0 };
>  	int32_t cid =3D vmw_ioctl_context_create(gpu->mdevice.drm_fd);
>=20=20
> -	for_each_pipe_with_valid_output(display, pipe, output) {
> +	for_each_crtc_with_valid_output(display, crtc, output) {
>  		gpu->output =3D output;
> -		gpu->pipe =3D pipe;
> +		gpu->pipe =3D crtc->pipe;
>=20=20
>  		prepare_crtc_surface(gpu);
> -		pipe_crc =3D igt_pipe_crc_new(gpu->mdevice.drm_fd, pipe,
> +		pipe_crc =3D igt_pipe_crc_new(gpu->mdevice.drm_fd, crtc->pipe,
>  					    IGT_PIPE_CRC_SOURCE_AUTO);
>  		igt_pipe_crc_collect_crc(pipe_crc, &blank_crc);

--=20
Jani Nikula, Intel
