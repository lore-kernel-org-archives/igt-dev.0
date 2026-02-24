Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7BC8E9B264
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 13:51:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E3A510E034;
	Tue, 24 Feb 2026 13:51:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ko4RvZAI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39BE810E034
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 13:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771941114; x=1803477114;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=7+0qgEK/yDH0TADeTW2vg7gfwh8ZpNQ0+pT3QBzr7Cc=;
 b=ko4RvZAIGqliM9f5lgbogbpYv9t4ew3LvScydpBAnt6JyujmS5Rnp6mG
 wfE0PpPpO/3geJCCHzvbP6uPNtemlT93IJvePZaqweg8ZLB6fEjagrUk5
 KqdL2yhwLN23hW+4fF0iDuLHZ/7uGg4zBCMD7ZRz+ollx+Q/pC22Fy6/6
 KCdPHPnzp00BE7/n19PdOzCeIcykPHfI6I796vb091XdD7GWTPUSmSR8V
 bJFuDkKjfcGv2rmmKiFrF8N+lJIlhST6/4hOFlQljbH/my6ZRBieegy0K
 ZNNwfTvZAxfifLXW1HSN7eaCrCYmwa0Vo0qrsBGVeCaB1FFDqioNkSf5z w==;
X-CSE-ConnectionGUID: j102aXH7TJC4e17ZpN2eig==
X-CSE-MsgGUID: cC8K5ZE+Qc6jwlfA0kIo2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="90366864"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="90366864"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 05:51:54 -0800
X-CSE-ConnectionGUID: 0gWM22WqR2mllNbGl4X/QQ==
X-CSE-MsgGUID: x6Q74OjURJOptKaityPBbw==
X-ExtLoop1: 1
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.20])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 05:51:52 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 19/23] tests/chamelium: Use igt_crtc_t instead
 of enum pipe
In-Reply-To: <20260221032003.30936-20-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260221032003.30936-1-ville.syrjala@linux.intel.com>
 <20260221032003.30936-20-ville.syrjala@linux.intel.com>
Date: Tue, 24 Feb 2026 15:51:50 +0200
Message-ID: <f7513b21f0ae1e192e863cd2c6f73b3fdcba0ade@intel.com>
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
> Convert the remaining chamelium tests to use igt_crtc_t
> instead of enum pipe. Here we specifically deal with changing
> the return type of chamelium_get_pipe_for_output().
>
> The mess inside test_hotplug() proved difficult for cocci,
> so there is some special sauce for that in the semantic
> patch.

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
> if (...) {
> ...
> - PIPE =3D CRTC->pipe;
> ...
> }
> <+... when !=3D PIPE =3D ...
> - PIPE
> + CRTC->pipe
> ...+>
> }
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
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tests/chamelium/kms_chamelium_edid.c   | 13 +++++++------
>  tests/chamelium/kms_chamelium_helper.c | 10 +++++-----
>  tests/chamelium/kms_chamelium_helper.h |  2 +-
>  tests/chamelium/kms_chamelium_hpd.c    |  8 ++++----
>  4 files changed, 17 insertions(+), 16 deletions(-)
>
> diff --git a/tests/chamelium/kms_chamelium_edid.c b/tests/chamelium/kms_c=
hamelium_edid.c
> index f5647dde0d9d..e014ba3aa873 100644
> --- a/tests/chamelium/kms_chamelium_edid.c
> +++ b/tests/chamelium/kms_chamelium_edid.c
> @@ -287,7 +287,7 @@ static void edid_stress_resolution(chamelium_data_t *=
data,
>  		drmModeModeInfo mode;
>  		struct igt_fb fb =3D { 0 };
>  		igt_output_t *output;
> -		enum pipe pipe;
> +		igt_crtc_t *crtc;
>  		bool is_video_stable;
>  		int screen_res_w, screen_res_h;
>=20=20
> @@ -311,9 +311,9 @@ static void edid_stress_resolution(chamelium_data_t *=
data,
>  		mode =3D chamelium_get_mode_for_port(chamelium, port);
>  		chamelium_create_fb_for_mode(data, &fb, &mode);
>  		output =3D chamelium_get_output_for_port(data, port);
> -		pipe =3D chamelium_get_pipe_for_output(&data->display, output);
> +		crtc =3D chamelium_get_pipe_for_output(&data->display, output);
>  		igt_output_set_crtc(output,
> -				    igt_crtc_for_pipe(output->display, pipe));
> +				    crtc);
>  		chamelium_enable_output(data, port, output, &mode, &fb);
>=20=20
>  		/* Capture the screen resolution and verify. */
> @@ -350,7 +350,7 @@ static void edid_resolution_list(chamelium_data_t *da=
ta,
>  	int count_modes;
>  	int i;
>  	igt_output_t *output;
> -	enum pipe pipe;
> +	igt_crtc_t *crtc;
>=20=20
>  	chamelium_unplug(chamelium, port);
>  	chamelium_set_edid(data, port, IGT_CUSTOM_EDID_FULL);
> @@ -366,8 +366,9 @@ static void edid_resolution_list(chamelium_data_t *da=
ta,
>  	count_modes =3D connector->count_modes;
>=20=20
>  	output =3D chamelium_get_output_for_port(data, port);
> -	pipe =3D chamelium_get_pipe_for_output(&data->display, output);
> -	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
> +	crtc =3D chamelium_get_pipe_for_output(&data->display, output);
> +	igt_output_set_crtc(output,
> +			    crtc);
>=20=20
>  	for (i =3D 0; i < count_modes; ++i)
>  		igt_debug("#%d %s %uHz\n", i, modes[i].name, modes[i].vrefresh);
> diff --git a/tests/chamelium/kms_chamelium_helper.c b/tests/chamelium/kms=
_chamelium_helper.c
> index c15a3096c5fe..ea30ff42d9a9 100644
> --- a/tests/chamelium/kms_chamelium_helper.c
> +++ b/tests/chamelium/kms_chamelium_helper.c
> @@ -133,7 +133,7 @@ igt_output_t *chamelium_prepare_output(chamelium_data=
_t *data,
>  {
>  	igt_display_t *display =3D &data->display;
>  	igt_output_t *output;
> -	enum pipe pipe;
> +	igt_crtc_t *crtc;
>=20=20
>  	/* The chamelium's default EDID has a lot of resolutions, way more then
>  	 * we need to test. Additionally the default EDID doesn't support HDMI
> @@ -152,8 +152,8 @@ igt_output_t *chamelium_prepare_output(chamelium_data=
_t *data,
>  	/* Refresh pipe to update connected status */
>  	igt_output_set_crtc(output, NULL);
>=20=20
> -	pipe =3D chamelium_get_pipe_for_output(display, output);
> -	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
> +	crtc =3D chamelium_get_pipe_for_output(display, output);
> +	igt_output_set_crtc(output, crtc);
>=20=20
>  	return output;
>  }
> @@ -201,7 +201,7 @@ void chamelium_enable_output(chamelium_data_t *data,
>  }
>=20=20
>  /* Return pipe attached to @outpu.t */
> -enum pipe chamelium_get_pipe_for_output(igt_display_t *display,
> +igt_crtc_t * chamelium_get_pipe_for_output(igt_display_t *display,
>  					igt_output_t *output)
>  {
>  	igt_crtc_t *crtc;
> @@ -216,7 +216,7 @@ enum pipe chamelium_get_pipe_for_output(igt_display_t=
 *display,
>  		}
>=20=20
>  		igt_output_set_crtc(output, NULL);
> -		return crtc->pipe;
> +		return crtc;
>  	}
>=20=20
>  	igt_assert_f(false, "No pipe found for output %s\n",
> diff --git a/tests/chamelium/kms_chamelium_helper.h b/tests/chamelium/kms=
_chamelium_helper.h
> index 7941ca9d3139..6060796661c4 100644
> --- a/tests/chamelium/kms_chamelium_helper.h
> +++ b/tests/chamelium/kms_chamelium_helper.h
> @@ -97,7 +97,7 @@ igt_output_t *chamelium_prepare_output(chamelium_data_t=
 *data,
>  void chamelium_enable_output(chamelium_data_t *data,
>  			     struct chamelium_port *port, igt_output_t *output,
>  			     drmModeModeInfo *mode, struct igt_fb *fb);
> -enum pipe chamelium_get_pipe_for_output(igt_display_t *display,
> +igt_crtc_t * chamelium_get_pipe_for_output(igt_display_t *display,
>  					igt_output_t *output);
>=20=20
>  int chamelium_get_pattern_fb(chamelium_data_t *data, size_t width,
> diff --git a/tests/chamelium/kms_chamelium_hpd.c b/tests/chamelium/kms_ch=
amelium_hpd.c
> index 29028ce6f7da..bd8731c0216b 100644
> --- a/tests/chamelium/kms_chamelium_hpd.c
> +++ b/tests/chamelium/kms_chamelium_hpd.c
> @@ -230,7 +230,7 @@ static void test_hotplug(chamelium_data_t *data, stru=
ct chamelium_port *port,
>  			 int toggle_count, enum test_modeset_mode modeset_mode)
>  {
>  	int i;
> -	enum pipe pipe;
> +	igt_crtc_t *crtc;
>  	struct igt_fb fb =3D { 0 };
>  	drmModeModeInfo mode;
>  	struct udev_monitor *mon =3D igt_watch_uevents();
> @@ -259,15 +259,15 @@ static void test_hotplug(chamelium_data_t *data, st=
ruct chamelium_port *port,
>  				 * connected */
>  				output =3D chamelium_get_output_for_port(data,
>  								       port);
> -				pipe =3D chamelium_get_pipe_for_output(
> -					&data->display, output);
> +				crtc =3D chamelium_get_pipe_for_output(&data->display,
> +								     output);
>  				mode =3D chamelium_get_mode_for_port(
>  					data->chamelium, port);
>  				chamelium_create_fb_for_mode(data, &fb, &mode);
>  			}
>=20=20
>  			igt_output_set_crtc(output,
> -					    igt_crtc_for_pipe(output->display, pipe));
> +					    crtc);
>  			chamelium_enable_output(data, port, output, &mode, &fb);
>  		}

--=20
Jani Nikula, Intel
