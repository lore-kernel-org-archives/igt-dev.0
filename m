Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE65E9B262
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 13:43:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A65910E151;
	Tue, 24 Feb 2026 13:43:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kpDghI8L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB9A310E151
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 13:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771940601; x=1803476601;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=2AXfMDLaiz/Fiq9abslq5AAJApITGta4BaKvtuI3ELg=;
 b=kpDghI8L+pQ1pCcTnbNk99NXBgOWLq3aTHRsdV04WGGy9XBsVNDkjbij
 3SQoyJ7d11Q7hMPKbv5f83IlN20T8XBcyR4NqrWvG00j0r/uBk7JKFTzn
 T9pqtZdXF34RjmsmOfM0UlytMY85wS2QfQlFETQmZYSh6fqya6xy50iLS
 dryLS/RMlfnGpMSdnDKiYt51HV9JPsN2h7VpdsEgMwMi/9QlMWAs+2dWm
 BbYVOObKJZj2lt4eLGGRwYO10rNKU9hr2XPakyml0JAoDeHqg5M7J69sU
 PfJUdWl8cwTU6tcY5WSQsVtEYpyl0Z5slrQpewObx3EtjXzMi1D80DeEe Q==;
X-CSE-ConnectionGUID: ZvD8Nek4TZ+N/XYxZpQpVg==
X-CSE-MsgGUID: RYt+xLFBTZCed5dXZlsNcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="84315122"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="84315122"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 05:43:20 -0800
X-CSE-ConnectionGUID: IJWnmuzPSwuScTXHfqHi9g==
X-CSE-MsgGUID: M4UVkD0sRVejBUyE47182g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="213715239"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.20])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 05:43:19 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 14/23] tests/kms_vblank: Use igt_crtc_t instead
 of enum pipe
In-Reply-To: <20260221032003.30936-15-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260221032003.30936-1-ville.syrjala@linux.intel.com>
 <20260221032003.30936-15-ville.syrjala@linux.intel.com>
Date: Tue, 24 Feb 2026 15:43:16 +0200
Message-ID: <5e05bde0a1c2a8afed25ce9ac179affb24a7d58c@intel.com>
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
> Convert kms_vblank from 'enum pipe' to 'igt_crtc_t'.
>
> The data.pipe member gets directly replaced with data.crtc.
>
> Also note that the local 'enum pipe p' in crtc_id_subtest()
> needs a bit of extra cleanup.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


>
>  #include "scripts/iterators.cocci"
>
> @find_data@
> typedef igt_crtc_t;
> identifier DISPLAY, PIPE;
> type T;
> @@
> T {
>   ...
>   igt_display_t DISPLAY;
>   ...
> -  enum pipe PIPE;
> +  igt_crtc_t *crtc;
>   ...
> };
>
> @depends on find_data@
> find_data.T S;
> find_data.T *P;
> expression E;
> @@
> (
> - S.pipe =3D E
> + S.crtc =3D igt_crtc_for_pipe(&S.display, E)
> |
> - P->pipe =3D E
> + P->crtc =3D igt_crtc_for_pipe(&P->display, E)
> |
> - igt_crtc_for_pipe(..., S.pipe)
> + S.crtc
> |
> - igt_crtc_for_pipe(..., P->pipe)
> + P->crtc
> |
> - kmstest_pipe_name(S.pipe)
> + igt_crtc_name(S.crtc)
> |
> - kmstest_pipe_name(P->pipe)
> + igt_crtc_name(P->crtc)
> )
>
> @depends on find_data@
> find_data.T S;
> find_data.T *P;
> @@
> (
> - S.pipe
> + S.crtc->pipe
> |
> - P->pipe
> + P->crtc->pipe
> )
>
> @func2@
> typedef igt_crtc_t;
> identifier FUNC, PIPE;
> parameter list[N] P;
> @@
> FUNC(P
> -	,enum pipe PIPE
> +	,igt_crtc_t *crtc
> 	,...)
> {
> <+... when !=3D PIPE =3D ...
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
> ...+>
> }
>
> @depends on func2@
> identifier func2.FUNC;
> expression list[func2.N] EP;
> expression PIPE;
> @@
> FUNC(EP
> -	,PIPE
> +	,igt_crtc_for_pipe(display, PIPE)
> 	,...)
>
> @@
> igt_crtc_t *CRTC;
> @@
> - igt_crtc_for_pipe(..., CRTC->pipe)
> + CRTC
>
> @depends on find_data@
> find_data.T S;
> find_data.T *P;
> @@
> (
> - igt_crtc_for_pipe(..., S.crtc->pipe)
> + S.crtc
> |
> - igt_crtc_for_pipe(..., P->crtc->pipe)
> + P->crtc
> )
>
> @@
> typedef igt_display_t;
> identifier DISPLAY;
> @@
> - igt_display_t *DISPLAY =3D ...;
> ... when !=3D DISPLAY
>
> @clean_pipe@
> identifier PIPE;
> expression CRTC;
> @@
> - enum pipe PIPE =3D CRTC->pipe;
> <+...
> (
> - igt_crtc_for_pipe(..., PIPE)
> + CRTC
> |
> - PIPE
> + CRTC->pipe
> )
> ...+>
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tests/kms_vblank.c | 55 +++++++++++++++++++++++-----------------------
>  1 file changed, 27 insertions(+), 28 deletions(-)
>
> diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
> index add8b7ec3cbf..970eb4d9a6a7 100644
> --- a/tests/kms_vblank.c
> +++ b/tests/kms_vblank.c
> @@ -97,7 +97,7 @@ typedef struct {
>  	igt_display_t display;
>  	struct igt_fb primary_fb;
>  	igt_output_t *output;
> -	enum pipe pipe;
> +	igt_crtc_t *crtc;
>  	unsigned int flags;
>  #define IDLE	0x1
>  #define BUSY	0x2
> @@ -130,7 +130,7 @@ static void prepare_crtc(data_t *data, int fd, igt_ou=
tput_t *output)
>=20=20
>  	/* select the pipe we want to use */
>  	igt_output_set_crtc(output,
> -			    igt_crtc_for_pipe(display, data->pipe));
> +			    data->crtc);
>=20=20
>  	/* create and set the primary plane fb */
>  	mode =3D igt_output_get_mode(output);
> @@ -144,7 +144,7 @@ static void prepare_crtc(data_t *data, int fd, igt_ou=
tput_t *output)
>=20=20
>  	igt_display_commit(display);
>=20=20
> -	igt_wait_for_vblank(igt_crtc_for_pipe(display, data->pipe));
> +	igt_wait_for_vblank(data->crtc);
>  }
>=20=20
>  static void cleanup_crtc(data_t *data, int fd, igt_output_t *output)
> @@ -192,7 +192,7 @@ static void run_test(data_t *data, void (*testfunc)(d=
ata_t *, int, int))
>  		memset(&vbl, 0, sizeof(vbl));
>  		vbl.request.type =3D
>  			DRM_VBLANK_RELATIVE | DRM_VBLANK_EVENT;
> -		vbl.request.type |=3D kmstest_get_vbl_flag(data->pipe);
> +		vbl.request.type |=3D kmstest_get_vbl_flag(data->crtc->pipe);
>  		vbl.request.sequence =3D 120 + 12;
>  		igt_assert_eq(wait_vblank(fd, &vbl), 0);
>  	}
> @@ -225,14 +225,14 @@ static void run_test(data_t *data, void (*testfunc)=
(data_t *, int, int))
>  }
>=20=20
>  static bool
> -pipe_output_combo_valid(igt_display_t *display,
> -			enum pipe pipe, igt_output_t *output)
> +pipe_output_combo_valid(igt_display_t *display, igt_crtc_t *crtc,
> +			igt_output_t *output)
>  {
>  	bool ret =3D true;
>=20=20
>  	igt_display_reset(display);
>=20=20
> -	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
> +	igt_output_set_crtc(output, crtc);
>  	if (!intel_pipe_output_combo_valid(display))
>  		ret =3D false;
>  	igt_output_set_crtc(output, NULL);
> @@ -243,15 +243,14 @@ pipe_output_combo_valid(igt_display_t *display,
>  static void crtc_id_subtest(data_t *data, int fd)
>  {
>  	igt_display_t *display =3D &data->display;
> -	enum pipe p =3D data->pipe;
>  	igt_output_t *output =3D data->output;
>  	struct drm_event_vblank buf;
> -	const uint32_t pipe_id_flag =3D kmstest_get_vbl_flag(p);
> +	const uint32_t pipe_id_flag =3D kmstest_get_vbl_flag(data->crtc->pipe);
>  	unsigned crtc_id, expected_crtc_id;
>  	uint64_t val;
>  	union drm_wait_vblank vbl;
>=20=20
> -	crtc_id =3D igt_crtc_for_pipe(display, p)->crtc_id;
> +	crtc_id =3D data->crtc->crtc_id;
>  	if (drmGetCap(display->drm_fd, DRM_CAP_CRTC_IN_VBLANK_EVENT, &val) =3D=
=3D 0)
>  		expected_crtc_id =3D crtc_id;
>  	else
> @@ -291,7 +290,7 @@ static void crtc_id_subtest(data_t *data, int fd)
>=20=20
>  static void accuracy(data_t *data, int fd, int nchildren)
>  {
> -	const uint32_t pipe_id_flag =3D kmstest_get_vbl_flag(data->pipe);
> +	const uint32_t pipe_id_flag =3D kmstest_get_vbl_flag(data->crtc->pipe);
>  	union drm_wait_vblank vbl;
>  	unsigned long target;
>  	int total =3D 120 / nchildren;
> @@ -330,7 +329,7 @@ static void accuracy(data_t *data, int fd, int nchild=
ren)
>=20=20
>  static void vblank_query(data_t *data, int fd, int nchildren)
>  {
> -	const uint32_t pipe_id_flag =3D kmstest_get_vbl_flag(data->pipe);
> +	const uint32_t pipe_id_flag =3D kmstest_get_vbl_flag(data->crtc->pipe);
>  	union drm_wait_vblank vbl;
>  	struct timespec start, end;
>  	unsigned long sq, count =3D 0;
> @@ -359,7 +358,7 @@ static void vblank_query(data_t *data, int fd, int nc=
hildren)
>=20=20
>  static void vblank_wait(data_t *data, int fd, int nchildren)
>  {
> -	const uint32_t pipe_id_flag =3D kmstest_get_vbl_flag(data->pipe);
> +	const uint32_t pipe_id_flag =3D kmstest_get_vbl_flag(data->crtc->pipe);
>  	union drm_wait_vblank vbl;
>  	struct timespec start, end;
>  	unsigned long sq, count =3D 0;
> @@ -388,12 +387,12 @@ static void vblank_wait(data_t *data, int fd, int n=
children)
>  		 elapsed(&start, &end, count));
>  }
>=20=20
> -static int get_vblank(int fd, enum pipe pipe, unsigned flags)
> +static int get_vblank(int fd, igt_crtc_t *crtc, unsigned flags)
>  {
>  	union drm_wait_vblank vbl;
>=20=20
>  	memset(&vbl, 0, sizeof(vbl));
> -	vbl.request.type =3D DRM_VBLANK_RELATIVE | kmstest_get_vbl_flag(pipe) |=
 flags;
> +	vbl.request.type =3D DRM_VBLANK_RELATIVE | kmstest_get_vbl_flag(crtc->p=
ipe) | flags;
>  	do_or_die(igt_ioctl(fd, DRM_IOCTL_WAIT_VBLANK, &vbl));
>=20=20
>  	return vbl.reply.sequence;
> @@ -412,7 +411,7 @@ static void vblank_ts_cont(data_t *data, int fd, int =
nchildren)
>  	int vrefresh =3D igt_output_get_mode(output)->vrefresh;
>  	double time_elapsed;
>=20=20
> -	seq1 =3D get_vblank(fd, data->pipe, 0);
> +	seq1 =3D get_vblank(fd, data->crtc, 0);
>  	clock_gettime(CLOCK_MONOTONIC, &start);
>=20=20
>  	if (data->flags & DPMS) {
> @@ -436,7 +435,7 @@ static void vblank_ts_cont(data_t *data, int fd, int =
nchildren)
>  		/* Attempting to do a vblank while disabled should return -EINVAL */
>  		memset(&vbl, 0, sizeof(vbl));
>  		vbl.request.type =3D _DRM_VBLANK_RELATIVE;
> -		vbl.request.type |=3D kmstest_get_vbl_flag(data->pipe);
> +		vbl.request.type |=3D kmstest_get_vbl_flag(data->crtc->pipe);
>  		igt_assert_eq(wait_vblank(fd, &vbl), -EINVAL);
>  	}
>=20=20
> @@ -447,11 +446,11 @@ static void vblank_ts_cont(data_t *data, int fd, in=
t nchildren)
>=20=20
>  	if (data->flags & MODESET) {
>  		igt_output_set_crtc(output,
> -				    igt_crtc_for_pipe(display, data->pipe));
> +				    data->crtc);
>  		igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMM=
IT_LEGACY);
>  	}
>=20=20
> -	seq2 =3D get_vblank(fd, data->pipe, 0);
> +	seq2 =3D get_vblank(fd, data->crtc, 0);
>  	clock_gettime(CLOCK_MONOTONIC, &end);
>=20=20
>  	time_elapsed =3D igt_time_elapsed(&start, &end);
> @@ -519,8 +518,8 @@ static void run_subtests(data_t *data)
>  				for_each_crtc_with_valid_output(&data->display,
>  								crtc,
>  								data->output) {
> -					data->pipe =3D crtc->pipe;
> -					if (!pipe_output_combo_valid(&data->display, crtc->pipe, data->outp=
ut))
> +					data->crtc =3D crtc;
> +					if (!pipe_output_combo_valid(&data->display, crtc, data->output))
>  						continue;
>=20=20
>  					if (!all_pipes && crtc->pipe !=3D active_pipes[0] &&
> @@ -551,8 +550,8 @@ static void run_subtests(data_t *data)
>  				for_each_crtc_with_valid_output(&data->display,
>  								crtc,
>  								data->output) {
> -					data->pipe =3D crtc->pipe;
> -					if (!pipe_output_combo_valid(&data->display, crtc->pipe, data->outp=
ut))
> +					data->crtc =3D crtc;
> +					if (!pipe_output_combo_valid(&data->display, crtc, data->output))
>  						continue;
>=20=20
>  					if (!all_pipes && crtc->pipe !=3D active_pipes[0] &&
> @@ -650,7 +649,7 @@ int igt_main_args("e", NULL, help_str, opt_handler, N=
ULL)
>=20=20
>  		/* Get active pipes. */
>  		for_each_crtc(&data.display, crtc) {
> -			data.pipe =3D crtc->pipe;
> +			data.crtc =3D crtc;
>  			active_pipes[last_pipe++] =3D crtc->pipe;
>  		}
>  		last_pipe--;
> @@ -660,8 +659,8 @@ int igt_main_args("e", NULL, help_str, opt_handler, N=
ULL)
>  	igt_subtest_with_dynamic("invalid") {
>  		for_each_crtc_with_valid_output(&data.display, crtc,
>  						data.output) {
> -			data.pipe =3D crtc->pipe;
> -			if (!pipe_output_combo_valid(&data.display, crtc->pipe, data.output))
> +			data.crtc =3D crtc;
> +			if (!pipe_output_combo_valid(&data.display, crtc, data.output))
>  				continue;
>=20=20
>  			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
> @@ -676,8 +675,8 @@ int igt_main_args("e", NULL, help_str, opt_handler, N=
ULL)
>  	igt_subtest_with_dynamic("crtc-id") {
>  		for_each_crtc_with_valid_output(&data.display, crtc,
>  						data.output) {
> -			data.pipe =3D crtc->pipe;
> -			if (!pipe_output_combo_valid(&data.display, crtc->pipe, data.output))
> +			data.crtc =3D crtc;
> +			if (!pipe_output_combo_valid(&data.display, crtc, data.output))
>  				continue;
>=20=20
>  			if (!all_pipes && crtc->pipe !=3D active_pipes[0] &&

--=20
Jani Nikula, Intel
