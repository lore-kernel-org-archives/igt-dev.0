Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97DB3E6BF17
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 14:15:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D45A10E11C;
	Fri, 30 Jan 2026 14:15:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kos6hlFb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA0810E09F
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 14:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769782515; x=1801318515;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=eCWdHQd//jsC+cD/jg0fYTbpeI3UUhKapGG2xL7QPkw=;
 b=kos6hlFbxRe+7b406oRtQv/qqJP49rkWNtdcGhDBXUdSmkrFSBjqMmpg
 u94suVnvB4P+rJNHCH3Ruf3TRdrMu1tT9nDAsSuVzE5tmAWnBM9xFQpH+
 /1jVuhifeo9KJyGU9nWkiyBSHpeHRVaK5QAAht8aRv9dHf6CuUCGOSkk9
 effHlhaEEdY3Yi/aTqnDgE4S+y+Eh/4f5imA5jrb0WZ4ytAJqDPtYBHOV
 6g/FF9E4vtf7UYVy0d2glGLZKwxeBe4Q6myb0ZZ6/qBbVY0OKUi5Eo5FP
 c8xqG4hLYszkO7Otgv9tgdi6JxMrkGqFE88INajbKQlamntGMi4REJJMa g==;
X-CSE-ConnectionGUID: g1usEKhIRV6E5ygS95w1Dw==
X-CSE-MsgGUID: B/CNfWZ5THC9UYx57m5g/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="71087071"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="71087071"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 06:15:15 -0800
X-CSE-ConnectionGUID: ABF5JO5LQE6kv/W5SteZ/Q==
X-CSE-MsgGUID: lykVy94cQEavBuW9mKIROQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="246483842"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.77])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 06:15:13 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 07/15] lib/kms: Use
 for_each_crtc_with_single_output() and for_each_crtc()
In-Reply-To: <20260130105237.14481-8-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260130105237.14481-1-ville.syrjala@linux.intel.com>
 <20260130105237.14481-8-ville.syrjala@linux.intel.com>
Date: Fri, 30 Jan 2026 16:15:10 +0200
Message-ID: <23f9d2e8a3477feee638f14a37d801a044134d0f@intel.com>
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
> Convert some uses of for_each_pipe*() to for_each_crtc*().
> Take care of the cases where the test using the same iterator
> for both for_each_crtc_with_single_output() and for_each_crtc().
>
> Mostly done with cocci, though in a rather ugly way. Either
> it tried to convert too much unrelate junk or it flat our refused

*unrelated

cocci also wants to add a few too many newlines, but it's probably not
worth fighting at this point.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> to convert the stuff I wanted. In the end I had to leave out
> the iterator variable declaration changes from the semantic patch
> and instead I fixed those up manually:
>  #include "scripts/iterators.cocci"
>
> @find1@
> typedef igt_crtc_t;
> iterator name for_each_pipe_with_single_output;
> iterator name for_each_crtc_with_single_output;
> iterator name for_each_pipe;
> iterator name for_each_crtc;
> expression DISPLAY, OUTPUT;
> identifier PIPE;
> type T;
> @@
> T PIPE;
> ...
> igt_fixture() {
> ...
> for_each_pipe(DISPLAY, PIPE) { ... }
> ...
> }
> <+...
> for_each_pipe_with_single_output(DISPLAY, PIPE, OUTPUT) { ... }
> ...+>
>
> @depends on find1@
> expression DISPLAY, OUTPUT;
> identifier find1.PIPE;
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
> @depends on find1@
> expression DISPLAY;
> identifier find1.PIPE;
> @@
> igt_fixture() { ...
> - for_each_pipe(DISPLAY, PIPE)
> + for_each_crtc(DISPLAY, crtc)
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
> ...}
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tests/intel/kms_busy.c     | 59 +++++++++++++++---------------
>  tests/kms_pipe_crc_basic.c | 74 ++++++++++++++++++++++++--------------
>  2 files changed, 78 insertions(+), 55 deletions(-)
>
> diff --git a/tests/intel/kms_busy.c b/tests/intel/kms_busy.c
> index f78a40891539..e3c2be0b4e41 100644
> --- a/tests/intel/kms_busy.c
> +++ b/tests/intel/kms_busy.c
> @@ -413,10 +413,10 @@ const char *help_str =3D
>  int igt_main_args("e", NULL, help_str, opt_handler, NULL)
>  {
>  	igt_display_t display =3D { .drm_fd =3D -1, .n_crtcs =3D IGT_MAX_PIPES =
};
> -
> -	enum pipe pipe, active_pipes[IGT_MAX_PIPES];
> +	enum pipe active_pipes[IGT_MAX_PIPES];
>  	igt_output_t *output;
>  	uint32_t last_pipe =3D 0;
> +	igt_crtc_t *crtc;
>  	int i;
>  	struct {
>  		const char *name;
> @@ -445,8 +445,8 @@ int igt_main_args("e", NULL, help_str, opt_handler, N=
ULL)
>  		igt_display_require_output(&display);
>=20=20
>  		/* Get active pipes. */
> -		for_each_pipe(&display, pipe)
> -			active_pipes[last_pipe++] =3D pipe;
> +		for_each_crtc(&display, crtc)
> +			active_pipes[last_pipe++] =3D crtc->pipe;
>  		last_pipe--;
>  	}
>=20=20
> @@ -454,14 +454,14 @@ int igt_main_args("e", NULL, help_str, opt_handler,=
 NULL)
>=20=20
>  	igt_describe("Test for basic check of KMS ABI with busy framebuffers.");
>  	igt_subtest_with_dynamic("basic") { /* just run on the first pipe */
> -		for_each_pipe_with_single_output(&display, pipe, output) {
> -			if (!pipe_output_combo_valid(&display, output, pipe))
> +		for_each_crtc_with_single_output(&display, crtc, output) {
> +			if (!pipe_output_combo_valid(&display, output, crtc->pipe))
>  				continue;
>=20=20
>  			igt_dynamic("flip")
> -				test_flip(&display, pipe, output, false);
> +				test_flip(&display, crtc->pipe, output, false);
>  			igt_dynamic("modeset")
> -				test_flip(&display, pipe, output, true);
> +				test_flip(&display, crtc->pipe, output, true);
>  			break;
>  		}
>  	}
> @@ -470,18 +470,18 @@ int igt_main_args("e", NULL, help_str, opt_handler,=
 NULL)
>  		igt_hang_t hang =3D igt_allow_hang(display.drm_fd, 0, 0);
>  		errno =3D 0;
>=20=20
> -		for_each_pipe_with_single_output(&display, pipe, output) {
> -			if (!pipe_output_combo_valid(&display, output, pipe))
> +		for_each_crtc_with_single_output(&display, crtc, output) {
> +			if (!pipe_output_combo_valid(&display, output, crtc->pipe))
>  				continue;
>=20=20
> -			if (!all_pipes && pipe !=3D active_pipes[0] &&
> -					  pipe !=3D active_pipes[last_pipe])
> +			if (!all_pipes && crtc->pipe !=3D active_pipes[0] &&
> +					  crtc->pipe !=3D active_pipes[last_pipe])
>  				continue;
>=20=20
> -			igt_dynamic_f("flip-pipe-%s", kmstest_pipe_name(pipe))
> -				test_flip(&display, pipe, output, false);
> -			igt_dynamic_f("modeset-pipe-%s", kmstest_pipe_name(pipe))
> -				test_flip(&display, pipe, output, true);
> +			igt_dynamic_f("flip-pipe-%s", igt_crtc_name(crtc))
> +				test_flip(&display, crtc->pipe, output, false);
> +			igt_dynamic_f("modeset-pipe-%s", igt_crtc_name(crtc))
> +				test_flip(&display, crtc->pipe, output, true);
>  		}
>=20=20
>  		igt_disallow_hang(display.drm_fd, hang);
> @@ -491,16 +491,17 @@ int igt_main_args("e", NULL, help_str, opt_handler,=
 NULL)
>  		igt_hang_t hang =3D igt_allow_hang(display.drm_fd, 0, 0);
>  		errno =3D 0;
>=20=20
> -		for_each_pipe_with_single_output(&display, pipe, output) {
> -			if (!pipe_output_combo_valid(&display, output, pipe))
> +		for_each_crtc_with_single_output(&display, crtc, output) {
> +			if (!pipe_output_combo_valid(&display, output, crtc->pipe))
>  				continue;
>=20=20
> -			if (!all_pipes && pipe !=3D active_pipes[0] &&
> -					  pipe !=3D active_pipes[last_pipe])
> +			if (!all_pipes && crtc->pipe !=3D active_pipes[0] &&
> +					  crtc->pipe !=3D active_pipes[last_pipe])
>  				continue;
>=20=20
> -			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
> -				test_pageflip_modeset_hang(&display, output, pipe);
> +			igt_dynamic_f("pipe-%s", igt_crtc_name(crtc))
> +				test_pageflip_modeset_hang(&display, output,
> +							   crtc->pipe);
>  		}
>=20=20
>  		igt_disallow_hang(display.drm_fd, hang);
> @@ -524,19 +525,21 @@ int igt_main_args("e", NULL, help_str, opt_handler,=
 NULL)
>=20=20
>  			hang =3D igt_allow_hang(display.drm_fd, 0, 0);
>=20=20
> -			for_each_pipe_with_single_output(&display, pipe, output) {
> -				if (!pipe_output_combo_valid(&display, output, pipe))
> +			for_each_crtc_with_single_output(&display, crtc,
> +							 output) {
> +				if (!pipe_output_combo_valid(&display, output, crtc->pipe))
>  					continue;
>=20=20
> -				if (!all_pipes && pipe !=3D active_pipes[0] &&
> -						  pipe !=3D active_pipes[last_pipe])
> +				if (!all_pipes && crtc->pipe !=3D active_pipes[0] &&
> +						  crtc->pipe !=3D active_pipes[last_pipe])
>  					continue;
>=20=20
> -				igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
> +				igt_dynamic_f("pipe-%s", igt_crtc_name(crtc)) {
>  					if (tests[i].reset)
>  						igt_set_module_param_int(display.drm_fd, "force_reset_modeset_test=
", 1);
>=20=20
> -					test_hang(&display, pipe, output,
> +					test_hang(&display, crtc->pipe,
> +						  output,
>  						  tests[i].modeset, tests[i].hang_newfb);
>=20=20
>  					if (tests[i].reset)
> diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
> index fb2f5f8ebe96..8cca7e9e40a7 100644
> --- a/tests/kms_pipe_crc_basic.c
> +++ b/tests/kms_pipe_crc_basic.c
> @@ -370,8 +370,8 @@ const char *help_str =3D
>=20=20
>  int igt_main_args("e", NULL, help_str, opt_handler, NULL)
>  {
> -	enum pipe pipe;
>  	igt_output_t *output;
> +	igt_crtc_t *crtc;
>  	struct {
>  		const char *name;
>  		unsigned flags;
> @@ -407,8 +407,8 @@ int igt_main_args("e", NULL, help_str, opt_handler, N=
ULL)
>  		data.debugfs =3D igt_debugfs_dir(data.drm_fd);
>=20=20
>  		/* Get active pipes. */
> -		for_each_pipe(&data.display, pipe)
> -			active_pipes[last_pipe++] =3D pipe;
> +		for_each_crtc(&data.display, crtc)
> +			active_pipes[last_pipe++] =3D crtc->pipe;
>  		last_pipe--;
>  	}
>=20=20
> @@ -419,18 +419,23 @@ int igt_main_args("e", NULL, help_str, opt_handler,=
 NULL)
>  	for (i =3D 0; i < ARRAY_SIZE(tests); i++) {
>  		igt_describe(tests[i].desc);
>  		igt_subtest_with_dynamic(tests[i].name) {
> -			for_each_pipe_with_single_output(&data.display, pipe, output) {
> -				if (simulation_constraint(pipe))
> +			for_each_crtc_with_single_output(&data.display, crtc,
> +							 output) {
> +				if (simulation_constraint(crtc->pipe))
>  					continue;
>=20=20
> -				if(!pipe_output_combo_valid(&data.display, pipe, output))
> +				if(!pipe_output_combo_valid(&data.display, crtc->pipe, output))
>  					continue;
>=20=20
> -				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
> +				igt_dynamic_f("pipe-%s-%s",
> +					      igt_crtc_name(crtc),
> +					      output->name) {
>  					if (tests[i].flags & TEST_SUSPEND) {
>  						enum igt_suspend_test test =3D SUSPEND_TEST_NONE;
>=20=20
> -						test_read_crc(&data, pipe, output, 0);
> +						test_read_crc(&data,
> +							      crtc->pipe,
> +							      output, 0);
>=20=20
>  						/* rtcwake cmd is not supported on MTK devices */
>  						if (is_mtk_device(data.drm_fd))
> @@ -439,17 +444,26 @@ int igt_main_args("e", NULL, help_str, opt_handler,=
 NULL)
>  						igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
>  									      test);
>=20=20
> -						test_read_crc(&data, pipe, output, 0);
> +						test_read_crc(&data,
> +							      crtc->pipe,
> +							      output, 0);
>  					} else if (tests[i].flags & TEST_HANG) {
>  						igt_hang_t hang =3D igt_allow_hang(data.drm_fd, 0, 0);
>=20=20
> -						test_read_crc(&data, pipe, output, 0);
> +						test_read_crc(&data,
> +							      crtc->pipe,
> +							      output, 0);
>  						igt_force_gpu_reset(data.drm_fd);
> -						test_read_crc(&data, pipe, output, 0);
> +						test_read_crc(&data,
> +							      crtc->pipe,
> +							      output, 0);
>=20=20
>  						igt_disallow_hang(data.drm_fd, hang);
>  					} else {
> -						test_read_crc(&data, pipe, output, tests[i].flags);
> +						test_read_crc(&data,
> +							      crtc->pipe,
> +							      output,
> +							      tests[i].flags);
>  					}
>  				}
>  			}
> @@ -459,43 +473,49 @@ int igt_main_args("e", NULL, help_str, opt_handler,=
 NULL)
>  	igt_describe("Check that disabling CRCs on a CRTC after having disabled=
 the CRTC "
>  		     "does not cause issues.");
>  	igt_subtest_with_dynamic("disable-crc-after-crtc") {
> -		for_each_pipe_with_single_output(&data.display, pipe, output) {
> -			if (simulation_constraint(pipe))
> +		for_each_crtc_with_single_output(&data.display, crtc, output) {
> +			if (simulation_constraint(crtc->pipe))
>  				continue;
>=20=20
> -			if(!pipe_output_combo_valid(&data.display, pipe, output))
> +			if(!pipe_output_combo_valid(&data.display, crtc->pipe, output))
>  				continue;
>=20=20
> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
> -				test_disable_crc_after_crtc(&data, pipe, output);
> +			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
> +				      output->name)
> +				test_disable_crc_after_crtc(&data, crtc->pipe,
> +							    output);
>  		}
>  	}
>=20=20
>  	igt_describe("Basic sanity check for CRC mismatches with XR24 format");
>  	igt_subtest_with_dynamic("compare-crc-sanitycheck-xr24") {
> -		for_each_pipe_with_single_output(&data.display, pipe, output) {
> -			if (simulation_constraint(pipe))
> +		for_each_crtc_with_single_output(&data.display, crtc, output) {
> +			if (simulation_constraint(crtc->pipe))
>  				continue;
>=20=20
> -			if(!pipe_output_combo_valid(&data.display, pipe, output))
> +			if(!pipe_output_combo_valid(&data.display, crtc->pipe, output))
>  				continue;
>=20=20
> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
> -				test_compare_crc(&data, pipe, output, DRM_FORMAT_XRGB8888);
> +			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
> +				      output->name)
> +				test_compare_crc(&data, crtc->pipe, output,
> +						 DRM_FORMAT_XRGB8888);
>  		}
>  	}
>=20=20
>  	igt_describe("Basic sanity check for CRC mismatches with NV12 format");
>  	igt_subtest_with_dynamic("compare-crc-sanitycheck-nv12") {
> -		for_each_pipe_with_single_output(&data.display, pipe, output) {
> -			if (simulation_constraint(pipe))
> +		for_each_crtc_with_single_output(&data.display, crtc, output) {
> +			if (simulation_constraint(crtc->pipe))
>  				continue;
>=20=20
> -			if(!pipe_output_combo_valid(&data.display, pipe, output))
> +			if(!pipe_output_combo_valid(&data.display, crtc->pipe, output))
>  				continue;
>=20=20
> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
> -				test_compare_crc(&data, pipe, output, DRM_FORMAT_NV12);
> +			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
> +				      output->name)
> +				test_compare_crc(&data, crtc->pipe, output,
> +						 DRM_FORMAT_NV12);
>  		}
>  	}

--=20
Jani Nikula, Intel
