Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE19E9B262
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 13:49:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B775910E034;
	Tue, 24 Feb 2026 13:49:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n2vX14T5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 615A210E034
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 13:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771940943; x=1803476943;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=K6X/AjkduClpVPZLrLijsMVFubTOwkWf5uuXEO7Q5ec=;
 b=n2vX14T56U70dq6R+ZwsxYBMHTgElMuGT0/SfFkwk94d8Xbvaxksv+oF
 MDZaf40QMYX4GqhlJwkdFVPzQUl6QgMrclHNbXPvxHDfh6fHp3JHnGVJm
 DFMvNzb/e+h+tU0lD+eyFVDn8bNiU7Ttu45RTUcD6te4WF2ViX9QT/VqK
 ZH6QO2bq2HBLtQJP4yEbSrzkxIXuXcW7mYLvk6ZLN7fCNwBtC49y2vokE
 hza5PXcvIkUjS5MobSOiwsGdLjq96+x6QxZ0WyPBpzovtIwPYgXaetESV
 MiY7h1YOzch771ThmPSH6ZqS6tJ44TiPnSex828LhwfgknmUmh1pvUyOu Q==;
X-CSE-ConnectionGUID: bASTbQ5aTHq727s9qvbuKw==
X-CSE-MsgGUID: lJMi61BaTCi6GD8T/doOdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="76563225"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="76563225"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 05:49:03 -0800
X-CSE-ConnectionGUID: /lfOZVleT46b3V5T20MaWw==
X-CSE-MsgGUID: icFKxKQJSNeW8FdIWv8q8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="214998689"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.20])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 05:49:01 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 16/23] tests/kms_tiled_display: Use igt_crtc_t
 instead of enum pipe
In-Reply-To: <20260221032003.30936-17-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260221032003.30936-1-ville.syrjala@linux.intel.com>
 <20260221032003.30936-17-ville.syrjala@linux.intel.com>
Date: Tue, 24 Feb 2026 15:48:58 +0200
Message-ID: <7a1d05a59def000ed81b3afbee68c1ff8fae1ef9@intel.com>
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
> Convert kms_tiled_display from 'enum pipe' to 'igt_crtc_t'.
>
> The data.pipe member gets directly replaced with data.crtc.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


>
>  #include "scripts/iterators.cocci"
>
> @find_data@
> typedef igt_crtc_t;
> typedef igt_display_t;
> identifier PIPE;
> type T;
> @@
> T {
>   ...
> - enum pipe PIPE;
> + igt_crtc_t *crtc;
>   ...
> };
>
> @depends on find_data@
> identifier find_data.PIPE;
> identifier DISPLAY;
> find_data.T S;
> find_data.T *P;
> expression _PIPE;
> @@
> igt_display_t *DISPLAY =3D ...;
> <...
> (
> - S.PIPE =3D _PIPE;
> + S.crtc =3D igt_crtc_for_pipe(display, _PIPE);
> |
> - P->PIPE =3D _PIPE;
> + P->crtc =3D igt_crtc_for_pipe(display, _PIPE);
> )
> ...>
>
> @depends on find_data@
> identifier find_data.PIPE;
> identifier DISPLAY;
> find_data.T S;
> find_data.T *P;
> expression E;
> @@
> igt_display_t *DISPLAY =3D ...;
> <...
> (
> - S.PIPE =3D E
> + S.crtc =3D igt_crtc_for_pipe(DISPLAY, E)
> |
> - P->PIPE =3D E
> + P->crtc =3D igt_crtc_for_pipe(DISPLAY, E)
> )
> ...>
>
> @depends on find_data@
> identifier find_data.PIPE;
> find_data.T S;
> find_data.T *P;
> expression E;
> @@
> (
> - igt_crtc_for_pipe(..., S.PIPE)
> + S.crtc
> |
> - igt_crtc_for_pipe(..., P->PIPE)
> + P->crtc
> |
> - kmstest_pipe_name(S.PIPE)
> + igt_crtc_name(S.crtc)
> |
> - kmstest_pipe_name(P->PIPE)
> + igt_crtc_name(P->crtc)
> )
>
> @depends on find_data@
> find_data.T S;
> find_data.T *P;
> @@
> (
> - S.crtc =3D S.crtc;
> |
> - P->crtc =3D P->crtc;
> )
>
> @depends on find_data@
> identifier find_data.PIPE;
> find_data.T S;
> find_data.T *P;
> @@
> (
> - S.PIPE
> + S.crtc->pipe
> |
> - P->PIPE
> + P->crtc->pipe
> )
>
> @depends on find_data@
> find_data.T S;
> find_data.T *P;
> binary operator OP =3D { =3D=3D, !=3D };
> @@
> (
> - S.crtc->pipe OP PIPE_NONE
> + S.crtc OP NULL
> |
> - P->crtc->pipe OP PIPE_NONE
> + P->crtc OP NULL
> )
>
> @@
> igt_crtc_t *CRTC;
> @@
> - igt_crtc_for_pipe(..., CRTC->pipe)
> + CRTC
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
>  tests/kms_tiled_display.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
>
> diff --git a/tests/kms_tiled_display.c b/tests/kms_tiled_display.c
> index f587704eebe1..374ea0bf6a85 100644
> --- a/tests/kms_tiled_display.c
> +++ b/tests/kms_tiled_display.c
> @@ -65,7 +65,7 @@ IGT_TEST_DESCRIPTION("Test for genlocked CRTCs with til=
ed displays");
>  typedef struct {
>  	igt_output_t *output;
>  	igt_tile_info_t tile;
> -	enum pipe pipe;
> +	igt_crtc_t *crtc;
>  	drmModeConnectorPtr connector;
>  	bool got_page_flip;
>  } data_connector_t;
> @@ -213,7 +213,6 @@ static int mode_linetime_us(const drmModeModeInfo *mo=
de)
>=20=20
>  static void setup_mode(data_t *data)
>  {
> -	igt_display_t *display =3D &data->display;
>  	int count =3D 0, prev =3D 0, i =3D 0;
>  	bool pipe_in_use =3D false, found =3D false;
>  	igt_crtc_t *crtc;
> @@ -238,7 +237,7 @@ static void setup_mode(data_t *data)
>=20=20
>  			if (count > 0) {
>  				for (prev =3D count - 1; prev >=3D 0; prev--) {
> -					if (crtc->pipe =3D=3D conns[prev].pipe) {
> +					if (crtc->pipe =3D=3D conns[prev].crtc->pipe) {
>  						pipe_in_use =3D true;
>  						break;
>  					}
> @@ -248,15 +247,15 @@ static void setup_mode(data_t *data)
>  			}
>=20=20
>  			if (igt_pipe_connector_valid(crtc->pipe, output)) {
> -				conns[count].pipe =3D crtc->pipe;
> +				conns[count].crtc =3D crtc;
>  				conns[count].output =3D output;
>=20=20
>  				igt_output_set_crtc(conns[count].output,
> -						    igt_crtc_for_pipe(display, conns[count].pipe));
> +						    conns[count].crtc);
>  				break;
>  			}
>  		}
> -		igt_require(conns[count].pipe !=3D PIPE_NONE);
> +		igt_require(conns[count].crtc !=3D NULL);
>=20=20
>  		for (i =3D 0; i < conns[count].connector->count_modes; i++) {
>  			mode =3D &conns[count].connector->modes[i];
> @@ -326,11 +325,10 @@ static void setup_framebuffer(data_t *data)
>=20=20
>  static data_connector_t *conn_for_crtc(data_t *data, unsigned int crtc_i=
d)
>  {
> -	igt_display_t *display =3D &data->display;
>  	for (int i =3D 0; i < data->num_h_tiles; i++) {
>  		data_connector_t *conn =3D &data->conns[i];
>=20=20
> -		if (igt_crtc_for_pipe(display, conn->pipe)->crtc_id =3D=3D crtc_id)
> +		if (conn->crtc->crtc_id =3D=3D crtc_id)
>  			return conn;
>  	}

--=20
Jani Nikula, Intel
