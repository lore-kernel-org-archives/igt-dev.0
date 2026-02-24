Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F27FE9B262
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 13:49:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3575110E034;
	Tue, 24 Feb 2026 13:49:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BDATRyim";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50BC110E034
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 13:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771940987; x=1803476987;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=Q6el5Ke5H8eAUba2sI57iaRxMoOflLrDlhETUumswPc=;
 b=BDATRyimRwTasT5u55GN7lZ4sxMDh4bhA4ckAePPraMhJlH/w6lrAS+o
 YJLCOdld7Pp52+g+0nmC/juO96t9lDb68T1MIRTwm6KSIo5jZc3fTkOg9
 9A9jeQSfV23u+aL+uC44seUzFRlkgnhV7E2hnhmBPVxcTVvFkj3Z+hrf7
 0cOJKh2/BsxhPGkY8eCx0bJB4gwkx7me07BhY8h53gVqL6SQv3h6WV+J0
 sLImTcy/KVNvhskLFzOFlisP5RGKEXeF2hYSiQujwVgBSrzj1xYlv9HMo
 WZfZebeGAQF7fHQmYZweg+scy2PaZH4xWE74JMT9J6m/s1K05Fetff4+M Q==;
X-CSE-ConnectionGUID: gidqrWuDR6+gjKpaVw7P2A==
X-CSE-MsgGUID: A6MKPz0nS0yqAIbTC3fmFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="90366615"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="90366615"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 05:49:47 -0800
X-CSE-ConnectionGUID: kOf96HbtSWW2hhv62u3OKg==
X-CSE-MsgGUID: dcQsmvUsRviiPnXJGS8p7g==
X-ExtLoop1: 1
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.20])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 05:49:45 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 17/23] tests/intel/kms_psr: Use igt_crtc_t
 instead of enum pipe
In-Reply-To: <20260221032003.30936-18-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260221032003.30936-1-ville.syrjala@linux.intel.com>
 <20260221032003.30936-18-ville.syrjala@linux.intel.com>
Date: Tue, 24 Feb 2026 15:49:43 +0200
Message-ID: <7bcdac38fee8ce389f1d6262cb22cce72dbf2351@intel.com>
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
> Convert kms_psr to use igt_crtc_t instead of enum pipe.
>
> The entire thing is about changing the return type of
> get_pipe_for_output().

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

>
>  #include "scripts/iterators.cocci"
>
> @ret_pipe@
> typedef igt_output_t;
> typedef igt_crtc_t;
> identifier FUNC;
> igt_crtc_t *CRTC;
> parameter list[N] P;
> @@
> - enum pipe
> + igt_crtc_t *
> FUNC(P)
> {
> <...
> - return CRTC->pipe;
> + return CRTC;
> ...>
> }
>
> @depends on ret_pipe@
> identifier ret_pipe.FUNC;
> @@
> - enum pipe
> + igt_crtc_t *
> FUNC(...);
>
> @depends on ret_pipe@
> identifier ret_pipe.FUNC;
> @@
> FUNC(...)
> + ->pipe
>
> @depends on ret_pipe@
> identifier ret_pipe.FUNC, PIPE;
> expression list[ret_pipe.N] EP;
> @@
> { ...
>   enum pipe PIPE;
> + igt_crtc_t *crtc;
> <+... when !=3D PIPE =3D ...
> - PIPE =3D FUNC(EP)->pipe;
> + crtc =3D FUNC(EP);
> + PIPE =3D crtc->pipe;
> ...+>
> }
>
> @depends on ret_pipe@
> identifier ret_pipe.FUNC;
> expression list[ret_pipe.N] EP;
> @@
> - igt_crtc_for_pipe(..., FUNC(EP)->pipe)
> + FUNC(EP)
>
> @@
> identifier PIPE;
> igt_crtc_t *CRTC;
> @@
> {...
> - PIPE =3D CRTC->pipe;
> <+... when !=3D PIPE =3D ...
> - PIPE
> + CRTC->pipe
> ...+>
> }
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
> v2: The last 'enum pipe' is now gone due to an earlier fix
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tests/intel/kms_psr.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
> index c730a6f23944..0475e68d6bf5 100644
> --- a/tests/intel/kms_psr.c
> +++ b/tests/intel/kms_psr.c
> @@ -691,7 +691,7 @@ static void setup_test_plane(data_t *data, int test_p=
lane)
>  	igt_display_commit(&data->display);
>  }
>=20=20
> -static enum pipe get_pipe_for_output(igt_display_t *display,
> +static igt_crtc_t * get_pipe_for_output(igt_display_t *display,
>  				     igt_output_t *output)
>  {
>  	igt_crtc_t *crtc;
> @@ -705,7 +705,7 @@ static enum pipe get_pipe_for_output(igt_display_t *d=
isplay,
>  			continue;
>  		}
>=20=20
> -		return crtc->pipe;
> +		return crtc;
>  	}
>=20=20
>  	igt_assert_f(false, "No pipe found for output %s\n",
> @@ -714,7 +714,7 @@ static enum pipe get_pipe_for_output(igt_display_t *d=
isplay,
>=20=20
>  static void test_setup(data_t *data)
>  {
> -	enum pipe pipe;
> +	igt_crtc_t *crtc;
>  	drmModeConnectorPtr connector;
>  	bool psr_entered =3D false;
>=20=20
> @@ -729,7 +729,7 @@ static void test_setup(data_t *data)
>  		igt_require_f(data->fbc_flag,
>  			      "Can't test FBC with PSR\n");
>=20=20
> -	pipe =3D get_pipe_for_output(&data->display, data->output);
> +	crtc =3D get_pipe_for_output(&data->display, data->output);
>  	data->crtc_id =3D data->output->config.crtc->crtc_id;
>  	connector =3D data->output->config.connector;
>=20=20
> @@ -750,7 +750,7 @@ static void test_setup(data_t *data)
>  		if (psr_wait_entry_if_enabled(data)) {
>  			if (data->fbc_flag =3D=3D true && data->op_fbc_mode =3D=3D FBC_ENABLE=
D)
>  				igt_assert_f(intel_fbc_wait_until_enabled(data->drm_fd,
> -									  pipe),
> +									  crtc->pipe),
>  									  "FBC still disabled\n");
>  			psr_entered =3D true;
>  			break;

--=20
Jani Nikula, Intel
