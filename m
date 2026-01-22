Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11119D3EE66
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 14:41:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCD1110E9C8;
	Thu, 22 Jan 2026 14:41:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c85r/mH9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DD6710E9C9
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 14:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769092875; x=1800628875;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=InmYCzbUrh0Mqs9SncXrhCAlgNyaKaLeWLTjAXDgMdE=;
 b=c85r/mH9rKylzmmU2gsghOrxmcIAVcLYhdv5MMVPgJGchXk1ivFbtKj9
 xwSomUEfC4B0hEfR5hO303pDJ3hkf+3qGXn3dvN54dBXAE9xeR/OgyJ2d
 y4ZKSsNXzbwZp4fSTtqTQcInYTNFIjizSpSFvFIwhXtovHQW69tchL3n1
 WiIU15t8v/XWlUognQLampK5G9QJ9cp6A3Ngqk+ScHYL62s/KBUGtDg8o
 Wxq/JuD/X9L1fy2fNkXRcDQdA0Td/x41RbK1EF2U9X5x9mO1zy3te7kdy
 ldYMfvjzcHz2UBhzCc5JizI9tWQK3hioVndlHTVrZidB7PtzSC0945x0j Q==;
X-CSE-ConnectionGUID: PqLDykB9TAutQp7niUZhaQ==
X-CSE-MsgGUID: QyRaZO+hSxmwBllQVEOS2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="87750109"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="87750109"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 06:41:15 -0800
X-CSE-ConnectionGUID: esiVPKvmQFG7I1q/E0kj+g==
X-CSE-MsgGUID: 7+IT381RQYC+dHiQBVep5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="205999467"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.192])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 06:41:13 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 02/10] lib/kms: Hide output->pending_pipe from tests
In-Reply-To: <20260122125937.10807-3-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260122125937.10807-1-ville.syrjala@linux.intel.com>
 <20260122125937.10807-3-ville.syrjala@linux.intel.com>
Date: Thu, 22 Jan 2026 16:41:10 +0200
Message-ID: <54544e82d850c75d8b5a43839927a556f2f90411@intel.com>
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

On Thu, 22 Jan 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> We already igt_output_get_driving_pipe() that converts
> output->pending_pipe to the igt_crtc_t. Make use of it
> so that we can hide the implementation details from the
> tests and reduce the amount of code that operates
> on pipes (as opposed to crtcs).
>
> Done with cocci:
>  #include "scripts/iterators.cocci"
>
> @@
> typedef igt_crtc_t;
> @@
> - static
> igt_crtc_t *igt_output_get_driving_pipe(...) {...}
>
> @@
> typedef igt_output_t;
> @@
> + igt_crtc_t *igt_output_get_driving_pipe(igt_output_t *output);
>   const char *igt_output_name(...);
>
> @in_lib_kms depends on file in "lib/igt_kms.c"@
> igt_output_t *output;
> @@
> output->pending_pipe
>
> @depends on !in_lib_kms@
> expression DISPLAY;
> igt_output_t *output;
> @@
> (
> - igt_crtc_for_pipe(DISPLAY, output->pending_pipe)
> + igt_output_get_driving_pipe(output)
> |
> - output->pending_pipe =3D=3D PIPE_NONE
> + igt_output_get_driving_pipe(output) =3D=3D NULL
> |
> - output->pending_pipe !=3D PIPE_NONE
> + igt_output_get_driving_pipe(output) !=3D NULL
> )
>
> @depends on !in_lib_kms@
> expression output;
> igt_crtc_t *crtc;
> @@
> - output.pending_pipe =3D=3D crtc->pipe
> + igt_output_get_driving_pipe(&output) =3D=3D crtc
>
> @@
> expression E;
> @@
> - igt_output_get_driving_pipe((E))
> + igt_output_get_driving_pipe(E)
>
> @@
> expression E,E2;
> @@
> - if(igt_output_get_driving_pipe(E) !=3D E2)
> + if (igt_output_get_driving_pipe(E) !=3D E2)
> { ... }
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Could've done the rename from patch 3 first, but no big deal.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> ---
>  lib/igt_kms.c                  | 2 +-
>  lib/igt_kms.h                  | 1 +
>  tests/intel/gem_pxp.c          | 2 +-
>  tests/intel/kms_pm_lpsp.c      | 2 +-
>  tests/intel/xe_pxp.c           | 2 +-
>  tests/kms_atomic_transition.c  | 4 ++--
>  tests/kms_content_protection.c | 2 +-
>  tests/kms_cursor_legacy.c      | 2 +-
>  tests/kms_debugfs.c            | 2 +-
>  tests/kms_feature_discovery.c  | 2 +-
>  tests/kms_plane_scaling.c      | 2 +-
>  11 files changed, 12 insertions(+), 11 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 7b6102cb7319..ec6a71f9da2a 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -3529,7 +3529,7 @@ report_dup:
>  	}
>  }
>=20=20
> -static igt_crtc_t *igt_output_get_driving_pipe(igt_output_t *output)
> +igt_crtc_t *igt_output_get_driving_pipe(igt_output_t *output)
>  {
>  	igt_display_t *display =3D output->display;
>  	enum pipe pipe;
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index b291673c2f7f..ef2654dd3948 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -588,6 +588,7 @@ typedef struct _igt_pipe_crc igt_pipe_crc_t;
>  igt_pipe_crc_t *igt_crtc_crc_new(igt_crtc_t *crtc, const char *source);
>  igt_pipe_crc_t *igt_crtc_crc_new_nonblock(igt_crtc_t *crtc, const char *=
source);
>=20=20
> +igt_crtc_t *igt_output_get_driving_pipe(igt_output_t *output);
>  const char *igt_output_name(igt_output_t *output);
>  bool kmstest_mode_is_valid(const drmModeModeInfo *mode);
>  drmModeModeInfo *igt_output_get_mode(igt_output_t *output);
> diff --git a/tests/intel/gem_pxp.c b/tests/intel/gem_pxp.c
> index d41a07b4c012..b1bd094798b7 100644
> --- a/tests/intel/gem_pxp.c
> +++ b/tests/intel/gem_pxp.c
> @@ -1244,7 +1244,7 @@ static void test_display_protected_crc(int i915, ig=
t_display_t *display)
>=20=20
>  	for_each_connected_output(display, output) {
>  		mode =3D igt_output_get_mode(output);
> -		pipe =3D igt_crtc_for_pipe(display, output->pending_pipe);
> +		pipe =3D igt_output_get_driving_pipe(output);
>  		pipe_crc =3D igt_crtc_crc_new(pipe,
>  					    IGT_PIPE_CRC_SOURCE_AUTO);
>  		plane =3D igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> diff --git a/tests/intel/kms_pm_lpsp.c b/tests/intel/kms_pm_lpsp.c
> index a8801261dafa..e65597b9fded 100644
> --- a/tests/intel/kms_pm_lpsp.c
> +++ b/tests/intel/kms_pm_lpsp.c
> @@ -139,7 +139,7 @@ static void test_cleanup(data_t *data)
>  {
>  	igt_plane_t *primary;
>=20=20
> -	if (!data->output || data->output->pending_pipe =3D=3D PIPE_NONE)
> +	if (!data->output || igt_output_get_driving_pipe(data->output) =3D=3D N=
ULL)
>  		return;
>=20=20
>  	primary =3D igt_output_get_plane_type(data->output,
> diff --git a/tests/intel/xe_pxp.c b/tests/intel/xe_pxp.c
> index 6aadf691a3ae..3aee74b849a0 100644
> --- a/tests/intel/xe_pxp.c
> +++ b/tests/intel/xe_pxp.c
> @@ -845,7 +845,7 @@ static void compare_crcs(int fd, igt_display_t *displ=
ay, igt_fb_t *ref_fb, igt_f
>=20=20
>  	for_each_connected_output(display, output) {
>  		mode =3D igt_output_get_mode(output);
> -		pipe =3D igt_crtc_for_pipe(display, output->pending_pipe);
> +		pipe =3D igt_output_get_driving_pipe(output);
>  		pipe_crc =3D igt_crtc_crc_new(pipe,
>  					    IGT_PIPE_CRC_SOURCE_AUTO);
>  		plane =3D igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index 60f743c6c614..07889fe87caa 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -840,7 +840,7 @@ static unsigned set_combinations(data_t *data, unsign=
ed mask, struct igt_fb *fb)
>  		event_mask |=3D 1 << pipe;
>=20=20
>  		for_each_valid_output_on_pipe(&data->display, pipe, output) {
> -			if (output->pending_pipe !=3D PIPE_NONE)
> +			if (igt_output_get_driving_pipe(output) !=3D NULL)
>  				continue;
>=20=20
>  			igt_output_set_crtc(output,
> @@ -933,7 +933,7 @@ retry:
>  							      IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
>  		for_each_valid_output_on_pipe(&data->display, i, output) {
> -			if (output->pending_pipe !=3D PIPE_NONE)
> +			if (igt_output_get_driving_pipe(output) !=3D NULL)
>  				continue;
>=20=20
>  			igt_output_set_crtc(output,
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protectio=
n.c
> index f324bc6de65f..16b174266a33 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -397,7 +397,7 @@ static bool igt_crtc_is_free(igt_crtc_t *crtc)
>  	int i;
>=20=20
>  	for (i =3D 0; i < display->n_outputs; i++)
> -		if (display->outputs[i].pending_pipe =3D=3D crtc->pipe)
> +		if (igt_output_get_driving_pipe(&display->outputs[i]) =3D=3D crtc)
>  			return false;
>=20=20
>  	return true;
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index 667fc0344c9a..dbcb4bbf243c 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -439,7 +439,7 @@ find_connected_pipe(igt_display_t *display, bool seco=
nd, igt_output_t **output)
>=20=20
>  	for_each_pipe(display, pipe) {
>  		for_each_valid_output_on_pipe(display, pipe, *output) {
> -			if((*output)->pending_pipe !=3D PIPE_NONE)
> +			if (igt_output_get_driving_pipe(*output) !=3D NULL)
>  				continue;
>=20=20
>  			igt_output_set_crtc(*output,
> diff --git a/tests/kms_debugfs.c b/tests/kms_debugfs.c
> index 8cdb020fe482..e2e7daf44e24 100644
> --- a/tests/kms_debugfs.c
> +++ b/tests/kms_debugfs.c
> @@ -45,7 +45,7 @@ static void igt_display_all_on(igt_display_t *display)
>  			igt_plane_t *primary;
>  			drmModeModeInfo *mode;
>=20=20
> -			if (output->pending_pipe !=3D PIPE_NONE)
> +			if (igt_output_get_driving_pipe(output) !=3D NULL)
>  				continue;
>=20=20
>  			igt_output_set_crtc(output,
> diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.c
> index da80ecf66855..b63af75cdac3 100644
> --- a/tests/kms_feature_discovery.c
> +++ b/tests/kms_feature_discovery.c
> @@ -99,7 +99,7 @@ int igt_main() {
>  				/* this is what most of the 2x tests are doing */
>  				for_each_pipe(&display, pipe) {
>  					for_each_valid_output_on_pipe(&display, pipe, output) {
> -						if (output->pending_pipe =3D=3D PIPE_NONE) {
> +						if (igt_output_get_driving_pipe(output) =3D=3D NULL) {
>  							igt_output_set_crtc(output,
>  									    igt_crtc_for_pipe(output->display, pipe));
>  							output_count++;
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 32bb120cdfdd..eea557e7a0c2 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -851,7 +851,7 @@ find_connected_pipe(igt_display_t *display, bool seco=
nd, igt_output_t **output)
>=20=20
>  	for_each_pipe(display, pipe) {
>  		for_each_valid_output_on_pipe(display, pipe, *output) {
> -			if((*output)->pending_pipe !=3D PIPE_NONE)
> +			if (igt_output_get_driving_pipe(*output) !=3D NULL)
>  				continue;
>=20=20
>  			igt_output_set_crtc(*output,

--=20
Jani Nikula, Intel
