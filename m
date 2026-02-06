Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A30EB28FA
	for <igt-dev@archiver.kernel.org>; Fri,  6 Feb 2026 09:33:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00EB110E65A;
	Fri,  6 Feb 2026 09:33:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DKbrMf9v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B103F10E65A
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Feb 2026 09:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770370411; x=1801906411;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=KAXsZPBQVoftAoeI5zb52Y17xJzMmYuVf+Q2zmkcFQ8=;
 b=DKbrMf9vCqWzxxm+WPvcSSDytxDBpIPDjG4zXvu7qXkLDDTgO2Rt3kuL
 J5c3xYKhDeZGDRXKbGs1121r/SAMF53Ohl/EXUAy16hASnAlFM2nHlThb
 0lymC6l1TIP34hv90IcD0xjkL94SVPIGyZCwc20w6AX1hKEheBIdUY+xp
 Eoz/b3c9b7WpXEoD0gJNumGC0wXuDJVlQzHjuM9PSEFUm3z/514ZrenJC
 S8Lsdtf6btm8Qjv1WHchEWHvMAsA5IKLiVfBkV2Kzn6GkgAVQQ5gQbLQ+
 60yzlaenIojbhekCjrlrbbYLcd+vlt6T/Q5NLGJBEEmawPjGiLxuL3TmV w==;
X-CSE-ConnectionGUID: Tuv/Ix4FQqqE2wL7Z54bkg==
X-CSE-MsgGUID: VNQsr8WkTv+oOANjdpyxKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="97031686"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="97031686"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 01:33:30 -0800
X-CSE-ConnectionGUID: yB+/5+JuQz6tTf+RPQ7Q0w==
X-CSE-MsgGUID: vw18NKxZQWm6ba9U3BpZ5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="209915774"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.129])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 01:33:29 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 04/12] tests/kms: Use for_each_crtc() for inner loops
In-Reply-To: <20260205133019.9161-5-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260205133019.9161-1-ville.syrjala@linux.intel.com>
 <20260205133019.9161-5-ville.syrjala@linux.intel.com>
Date: Fri, 06 Feb 2026 11:33:25 +0200
Message-ID: <cd691ad87b72843484c9a3c2aee118b051a84390@intel.com>
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

On Thu, 05 Feb 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> A few test cases use nested for_each_pipe() loops. Convert
> the inner of the loops to use for_each_crtc() instead. The
> outer loop will be converted later.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

>
> Done with cocci:
>  #include "scripts/iterators.cocci"
>
> @find@
> iterator name for_each_pipe;
> identifier PIPE1, PIPE2;
> @@
>  for_each_pipe(..., PIPE1) {
> <+...
> 	for_each_pipe(..., PIPE2) {
> 		...
> 	}
> ...+>
> }
>
> @change depends on find@
> iterator name for_each_pipe;
> iterator name for_each_crtc;
> identifier PIPE1, PIPE2;
> expression DISPLAY;
> @@
>  for_each_pipe(..., PIPE1) {
> <+...
> -	for_each_pipe(DISPLAY, PIPE2) {
> +	for_each_crtc(DISPLAY, crtc2) {
> <...
> (
> - igt_crtc_for_pipe(..., PIPE2)
> + crtc2
> |
> - kmstest_pipe_name(PIPE2)
> + igt_crtc_name(crtc2)
> |
> - PIPE2
> + crtc2->pipe
> )
> ...>
> 	}
> ...+>
> }
>
> @@
> typedef igt_crtc_t;
> identifier PIPE;
> @@
> {
> ...
> (
> + igt_crtc_t *crtc2;
> - enum pipe PIPE;
> |
> + igt_crtc_t *crtc2;
> - enum pipe PIPE =3D ...;
> )
> ... when !=3D PIPE
> }
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tests/kms_display_modes.c  | 18 +++++++++++-------
>  tests/kms_plane_multiple.c | 19 ++++++++++++-------
>  2 files changed, 23 insertions(+), 14 deletions(-)
>
> diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
> index 317bc57f21a5..1bb4b483aafd 100644
> --- a/tests/kms_display_modes.c
> +++ b/tests/kms_display_modes.c
> @@ -187,7 +187,8 @@ static void run_extendedmode_basic(data_t *data,
>  		for_each_if (igt_pipe_connector_valid((pipe), (output)))
>=20=20
>  static void run_extendedmode_test(data_t *data) {
> -	enum pipe pipe1, pipe2;
> +	igt_crtc_t *crtc2;
> +	enum pipe pipe1;
>  	bool sim_flag =3D igt_run_in_simulation();
>  	igt_output_t *output1, *output2;
>  	igt_display_t *display =3D &data->display;
> @@ -197,11 +198,13 @@ static void run_extendedmode_test(data_t *data) {
>  	for_each_pipe(display, pipe1) {
>  		for_each_valid_output_on_pipe(display, pipe1, output1) {
>=20=20
> -			for_each_pipe(display, pipe2) {
> -				if (pipe1 =3D=3D pipe2)
> +			for_each_crtc(display, crtc2) {
> +				if (pipe1 =3D=3D crtc2->pipe)
>  					continue;
>=20=20
> -				for_each_valid_output_on_pipe_local(display, pipe2, output2) {
> +				for_each_valid_output_on_pipe_local(display,
> +								    crtc2->pipe,
> +								    output2) {
>  					if (output1 =3D=3D output2)
>  						continue;
>=20=20
> @@ -210,7 +213,7 @@ static void run_extendedmode_test(data_t *data) {
>  					igt_output_set_crtc(output1,
>  							    igt_crtc_for_pipe(output1->display, pipe1));
>  					igt_output_set_crtc(output2,
> -							    igt_crtc_for_pipe(output2->display, pipe2));
> +							    crtc2);
>=20=20
>  					if (!intel_pipe_output_combo_valid(display))
>  						continue;
> @@ -218,11 +221,12 @@ static void run_extendedmode_test(data_t *data) {
>  					igt_dynamic_f("pipe-%s-%s-pipe-%s-%s",
>  						      kmstest_pipe_name(pipe1),
>  						      igt_output_name(output1),
> -						      kmstest_pipe_name(pipe2),
> +						      igt_crtc_name(crtc2),
>  						      igt_output_name(output2))
>  						run_extendedmode_basic(data,
>  								pipe1, output1,
> -								pipe2, output2);
> +								crtc2->pipe,
> +								output2);
>  				}
>  			}
>  			/*
> diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
> index e399f3ee270d..aeaf6bf514a9 100644
> --- a/tests/kms_plane_multiple.c
> +++ b/tests/kms_plane_multiple.c
> @@ -511,7 +511,8 @@ static void test_plane_position_2_display(data_t *dat=
a, enum pipe pipe1, enum pi
>=20=20
>  static void run_2_display_test(data_t *data, uint64_t modifier, const ch=
ar *name)
>  {
> -	enum pipe pipe1, pipe2;
> +	igt_crtc_t *crtc2;
> +	enum pipe pipe1;
>  	igt_output_t *output1, *output2;
>  	igt_display_t *display =3D &data->display;
>=20=20
> @@ -522,11 +523,13 @@ static void run_2_display_test(data_t *data, uint64=
_t modifier, const char *name
>=20=20
>  	for_each_pipe(display, pipe1) {
>  		for_each_valid_output_on_pipe(display, pipe1, output1) {
> -			for_each_pipe(display, pipe2) {
> -				if (pipe1 =3D=3D pipe2)
> +			for_each_crtc(display, crtc2) {
> +				if (pipe1 =3D=3D crtc2->pipe)
>  					continue;
>=20=20
> -				for_each_valid_output_on_pipe_local(display, pipe2, output2) {
> +				for_each_valid_output_on_pipe_local(display,
> +								    crtc2->pipe,
> +								    output2) {
>  					if (output1 =3D=3D output2)
>  						continue;
>=20=20
> @@ -535,15 +538,17 @@ static void run_2_display_test(data_t *data, uint64=
_t modifier, const char *name
>  					igt_output_set_crtc(output1,
>  							    igt_crtc_for_pipe(output1->display, pipe1));
>  					igt_output_set_crtc(output2,
> -							    igt_crtc_for_pipe(output2->display, pipe2));
> +							    crtc2);
>=20=20
>  					if (!intel_pipe_output_combo_valid(display))
>  						continue;
>=20=20
>  					igt_dynamic_f("pipe-%s-%s-pipe-%s-%s",
>  						       kmstest_pipe_name(pipe1), output1->name,
> -						       kmstest_pipe_name(pipe2), output2->name)
> -						test_plane_position_2_display(data, pipe1, pipe2,
> +						       igt_crtc_name(crtc2),
> +						       output2->name)
> +						test_plane_position_2_display(data, pipe1,
> +									      crtc2->pipe,
>  									      output1, output2,
>  									      modifier);

--=20
Jani Nikula, Intel
