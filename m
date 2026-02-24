Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F68E9B262
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 13:50:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8A5E10E585;
	Tue, 24 Feb 2026 13:50:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UmlU0yY1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AAA910E034
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 13:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771941025; x=1803477025;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=Urm/a1aDTECkcUlM2ZvSBeK5Oxz8mjz+O+KLMS62FeM=;
 b=UmlU0yY1nbhfvkX1Bb9mpqKsnoqI4r4WoVsMHsIWYftsCORjuisHTCqB
 V0qjqZqzoGK5G6W4Dfp2NOnmX77zlr9d85emhwE3sdXI/eeW6ztWhyRR+
 uTYxB2g5fK3RyyHGv9hkpDSCE2ji1N3EI4J1KSuP0HNZx0eUMHeKPIrNS
 cOxAy8BSw8nlsio++bIyhRmpmNlyk7xWLTwSwaCg62nXSP22eDF3eq/RI
 rxsNsYpU1NXrksRVlMoEDcI51FPnmXiyMCItQcPmrM9utoaBCAupy8lnv
 dsYqgDbv8DybxMjvfwNI6Lrakski60vujlVPzXhhNVTbZqZi7IQb6aXnV A==;
X-CSE-ConnectionGUID: OvMqB5ZhSXeM3NnRj7pkGg==
X-CSE-MsgGUID: MPbzzGHoQSGhUdtuMXw20g==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="76785365"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="76785365"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 05:50:25 -0800
X-CSE-ConnectionGUID: odzZV0IOQKuZwE/R+twsNg==
X-CSE-MsgGUID: 2s8IUjr0S6CG8epzzrM2Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="213149986"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.20])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 05:50:23 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 18/23] tests/kms_prime: Use igt_crtc_t instead
 of enum pipe
In-Reply-To: <20260221032003.30936-19-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260221032003.30936-1-ville.syrjala@linux.intel.com>
 <20260221032003.30936-19-ville.syrjala@linux.intel.com>
Date: Tue, 24 Feb 2026 15:50:21 +0200
Message-ID: <d86ec05acdcee151f62c2f5ba7ea3bbd82c3d290@intel.com>
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

On Sat, 21 Feb 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Convert kms_prime to use igt_crtc_t instead of enum pioe .
>
> The complication here is that setup_display() returns
> the pipe/crtc via a pointer passed as a function argument.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

>
>  #include "scripts/iterators.cocci"
>
> @ret_pipe@
> typedef igt_output_t;
> typedef igt_crtc_t;
> identifier FUNC, PIPE;
> expression CRTC;
> parameter list[N] P;
> @@
> FUNC(P
> - ,enum pipe *PIPE
> + ,igt_crtc_t **ret_crtc
>    ,...)
> {
> <...
> - *PIPE =3D CRTC->pipe;
> + *ret_crtc =3D CRTC;
> ...>
> }
>
> @depends on ret_pipe@
> identifier ret_pipe.FUNC, PIPE;
> expression list[ret_pipe.N] EP;
> expression E;
> @@
>   enum pipe PIPE;
> + igt_crtc_t *crtc;
> ...
> FUNC(EP,
> - &PIPE
> + &crtc
>   ,...)
> <...
> - PIPE
> + crtc->pipe
> ...>
>
> @@
> igt_crtc_t *CRTC;
> @@
> - igt_crtc_for_pipe(..., CRTC->pipe)
> + CRTC
>
> @@
> identifier PIPE;
> @@
> {...
> - enum pipe PIPE;
> ... when !=3D PIPE
> }
>
> @@
> typedef igt_display_t;
> identifier DISPLAY;
> @@
> - igt_display_t *DISPLAY =3D ...;
> ... when !=3D DISPLAY
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tests/kms_prime.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/tests/kms_prime.c b/tests/kms_prime.c
> index 7b13e9f538e1..bb85b2e2e0da 100644
> --- a/tests/kms_prime.c
> +++ b/tests/kms_prime.c
> @@ -116,14 +116,14 @@ static bool has_prime_export(int fd)
>  }
>=20=20
>  static igt_output_t *setup_display(int importer_fd, igt_display_t *displ=
ay,
> -				   enum pipe *pipe)
> +				   igt_crtc_t **ret_crtc)
>  {
>  	igt_crtc_t *crtc;
>  	igt_output_t *output;
>  	bool found =3D false;
>=20=20
>  	for_each_crtc_with_valid_output(display, crtc, output) {
> -		*pipe =3D crtc->pipe;
> +		*ret_crtc =3D crtc;
>  		igt_display_reset(display);
>=20=20
>  		igt_output_set_crtc(output,
> @@ -388,7 +388,7 @@ static void test_crc(int exporter_fd, int importer_fd)
>  	igt_display_t display;
>  	igt_output_t *output;
>  	igt_pipe_crc_t *pipe_crc;
> -	enum pipe pipe;
> +	igt_crtc_t *crtc;
>  	struct igt_fb fb;
>  	int dmabuf_fd;
>  	struct dumb_bo scratch =3D {};
> @@ -400,10 +400,10 @@ static void test_crc(int exporter_fd, int importer_=
fd)
>  	igt_require_pipe_crc(importer_fd);
>  	igt_display_require(&display, importer_fd);
>=20=20
> -	output =3D setup_display(importer_fd, &display, &pipe);
> +	output =3D setup_display(importer_fd, &display, &crtc);
>=20=20
>  	mode =3D igt_output_get_mode(output);
> -	pipe_crc =3D igt_crtc_crc_new(igt_crtc_for_pipe(&display, pipe),
> +	pipe_crc =3D igt_crtc_crc_new(crtc,
>  				    IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
>  	for (i =3D 0; i < ARRAY_SIZE(colors); i++) {
> @@ -458,7 +458,7 @@ static void test_basic_modeset(int drm_fd)
>  {
>  	igt_display_t display;
>  	igt_output_t *output;
> -	enum pipe pipe;
> +	igt_crtc_t *crtc;
>  	drmModeModeInfo *mode;
>  	struct igt_fb fb;
>  	uint32_t bo;
> @@ -468,7 +468,7 @@ static void test_basic_modeset(int drm_fd)
>  	igt_device_set_master(drm_fd);
>  	igt_display_require(&display, drm_fd);
>=20=20
> -	output =3D setup_display(drm_fd, &display, &pipe);
> +	output =3D setup_display(drm_fd, &display, &crtc);
>  	mode =3D igt_output_get_mode(output);
>  	igt_assert(mode);

--=20
Jani Nikula, Intel
