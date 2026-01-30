Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C882E6BF18
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 14:26:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41CF210EA03;
	Fri, 30 Jan 2026 14:26:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AZGl5co6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9953810EA03
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 14:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769783200; x=1801319200;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=6NoYMJ4VB8fRASASbg3UEvbBLrmgAyD3PjFlu7KT1zc=;
 b=AZGl5co6Ppi8gg9BtaYHM+sje9FloA+0PqA0lw/YQhoLDgcNt7PIVE/q
 C6btDb9BfbL3lEwnIUVfCXpObkHIoqNsZ2H58cRn2kZMMRNdq/SHPrBEW
 h4zeBOKwQetTvSbW+NPhVDoDuEuBBwO3Ulmaz4mA81K3rjlUzo0npmiWA
 gW0FpzB4fJZhE50Qelfz2x1Tsdg9eLuEYu4HQ5Rc0nceGEfEWc86KtUqe
 /PsIoDkOy89go2q9I/wpffYFInBix+jzwvjtBNCsHFoWrJvaw78oUwefR
 sCjKqqHsaQv4QPaTAXMqmw7ojdjGbnIR8GG19RBYeE+bQQpRfwG/Fvyct A==;
X-CSE-ConnectionGUID: yxk/RF0KSvSHcD28QvUh6A==
X-CSE-MsgGUID: rOhwfPNrSyq3IDMbA3U01g==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="82458482"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="82458482"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 06:26:40 -0800
X-CSE-ConnectionGUID: CvavGHZ/RQWjrzcmCu1wQw==
X-CSE-MsgGUID: KPgg6My+RrOIL6qzS7ZHqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="239589137"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.77])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 06:26:41 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 12/15] lib/kms: Use
 for_each_crtc_with_valid_output(), part 2
In-Reply-To: <20260130105237.14481-13-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260130105237.14481-1-ville.syrjala@linux.intel.com>
 <20260130105237.14481-13-ville.syrjala@linux.intel.com>
Date: Fri, 30 Jan 2026 16:26:37 +0200
Message-ID: <1e2764d3af174b9ff51410cf31bcd0a6500d757e@intel.com>
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
> Convert some uses of for_each_pipe_with_valid_output()
> to for_each_crtc_with_valid_output(). Take care of the
> cases where we (presumably) still have to keep some
> kind of 'data->pipe' thingy still up to date.

*tests/kms

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

>
> Eventually we should probably replace 'data->pipe' with
> 'data->crtc' but I didn't want to go that far here.
>
> Done with cocci:
>  #include "scripts/iterators.cocci"
>
> @change@
> iterator name for_each_pipe_with_valid_output;
> iterator name for_each_crtc_with_valid_output;
> typedef igt_crtc_t;
> identifier PIPE;
> expression DISPLAY, OUTPUT, X;
> @@
> - for_each_pipe_with_valid_output(DISPLAY, X->PIPE, OUTPUT)
> + for_each_crtc_with_valid_output(DISPLAY, crtc, OUTPUT)
> {
> + X->PIPE =3D crtc->pipe;
> <...
> (
> - igt_crtc_for_pipe(..., X->PIPE)
> + crtc
> |
> - kmstest_pipe_name(X->PIPE)
> + igt_crtc_name(crtc)
> |
> - X->PIPE
> + crtc->pipe
> )
> ...>
> }
>
> @depends on change@
> identifier FUNC;
> @@
> FUNC(...)
> {
> + igt_crtc_t *crtc;
> <+...
> for_each_crtc_with_valid_output(...) { ... }
> ...+>
> }
>
> @@
> identifier CRTC;
> @@
> igt_crtc_t *CRTC;
> ...
> - igt_crtc_t *CRTC;
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tests/intel/kms_big_fb.c       |  6 ++++--
>  tests/intel/kms_ccs.c          | 19 +++++++++++------
>  tests/intel/kms_fb_coherency.c |  6 ++++--
>  tests/intel/kms_pwrite_crc.c   |  6 ++++--
>  tests/kms_async_flips.c        | 23 +++++++++++++--------
>  tests/kms_vblank.c             | 37 +++++++++++++++++++++++-----------
>  6 files changed, 65 insertions(+), 32 deletions(-)
>
> diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
> index 415508213e55..3946c7c00dfd 100644
> --- a/tests/intel/kms_big_fb.c
> +++ b/tests/intel/kms_big_fb.c
> @@ -685,6 +685,7 @@ max_hw_stride_async_flip_test(data_t *data)
>=20=20
>  static void test_scanout(data_t *data)
>  {
> +	igt_crtc_t *crtc;
>  	igt_output_t *output;
>=20=20
>  	igt_require(data->format =3D=3D DRM_FORMAT_C8 ||
> @@ -708,11 +709,12 @@ static void test_scanout(data_t *data)
>  	max_fb_size(data, &data->big_fb_width, &data->big_fb_height,
>  		    data->format, data->modifier);
>=20=20
> -	for_each_pipe_with_valid_output(&data->display, data->pipe, data->outpu=
t) {
> +	for_each_crtc_with_valid_output(&data->display, crtc, data->output) {
> +		data->pipe =3D crtc->pipe;
>  		igt_display_reset(&data->display);
>=20=20
>  		igt_output_set_crtc(data->output,
> -				    igt_crtc_for_pipe(data->output->display, data->pipe));
> +				    crtc);
>  		if (!intel_pipe_output_combo_valid(&data->display))
>  			continue;
>=20=20
> diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
> index ea23b6581b06..85d1e16cafe3 100644
> --- a/tests/intel/kms_ccs.c
> +++ b/tests/intel/kms_ccs.c
> @@ -1125,6 +1125,7 @@ static bool valid_modifier_test(u64 modifier, const=
 enum test_flags flags)
>=20=20
>  static void test_output(data_t *data, const int testnum)
>  {
> +	igt_crtc_t *crtc;
>  	uint16_t dev_id;
>=20=20
>  	igt_fixture()
> @@ -1150,15 +1151,18 @@ static void test_output(data_t *data, const int t=
estnum)
>  					      "Older than Xe2 platform needed.\n");
>  			}
>=20=20
> -			for_each_pipe_with_valid_output(&data->display, data->pipe, data->out=
put) {
> +			for_each_crtc_with_valid_output(&data->display, crtc,
> +							data->output) {
> +				data->pipe =3D crtc->pipe;
>  				igt_display_reset(&data->display);
>=20=20
>  				igt_output_set_crtc(data->output,
> -						    igt_crtc_for_pipe(data->output->display, data->pipe));
> +						    crtc);
>  				if (!intel_pipe_output_combo_valid(&data->display))
>  					continue;
>=20=20
> -				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data->pipe),
> +				igt_dynamic_f("pipe-%s-%s",
> +							    igt_crtc_name(crtc),
>  							    data->output->name) {
>  					int valid_tests =3D 0;
>=20=20
> @@ -1166,9 +1170,12 @@ static void test_output(data_t *data, const int te=
stnum)
>  						igt_info("Testing with seed %d\n", data->seed);
>=20=20
>  					if (data->flags & TEST_ALL_PLANES) {
> -						igt_display_require_output_on_pipe(&data->display, data->pipe);
> +						igt_display_require_output_on_pipe(&data->display,
> +										   crtc->pipe);
>=20=20
> -						for_each_plane_on_pipe(&data->display, data->pipe, data->plane) {
> +						for_each_plane_on_pipe(&data->display,
> +								       crtc->pipe,
> +								       data->plane) {
>  							if (skip_plane(data, data->plane))
>  								continue;
>=20=20
> @@ -1186,7 +1193,7 @@ static void test_output(data_t *data, const int tes=
tnum)
>  					igt_require_f(valid_tests > 0,
>  						      "no valid tests for %s on pipe %s\n",
>  						      ccs_modifiers[i].str,
> -						      kmstest_pipe_name(data->pipe));
> +						      igt_crtc_name(crtc));
>  				}
>  			}
>  		}
> diff --git a/tests/intel/kms_fb_coherency.c b/tests/intel/kms_fb_coherenc=
y.c
> index e6d043c114d5..2f917e97b792 100644
> --- a/tests/intel/kms_fb_coherency.c
> +++ b/tests/intel/kms_fb_coherency.c
> @@ -222,13 +222,15 @@ static void test_legacy_mmap_wc(data_t *data)
>=20=20
>  static void select_valid_pipe_output_combo(data_t *data)
>  {
> +	igt_crtc_t *crtc;
>  	igt_display_t *display =3D &data->display;
>=20=20
> -	for_each_pipe_with_valid_output(display, data->pipe, data->output) {
> +	for_each_crtc_with_valid_output(display, crtc, data->output) {
> +		data->pipe =3D crtc->pipe;
>  		igt_display_reset(display);
>=20=20
>  		igt_output_set_crtc(data->output,
> -				    igt_crtc_for_pipe(data->output->display, data->pipe));
> +				    crtc);
>  		if (intel_pipe_output_combo_valid(display))
>  			return;
>  	}
> diff --git a/tests/intel/kms_pwrite_crc.c b/tests/intel/kms_pwrite_crc.c
> index 64c167ad3f44..4a214d34e53b 100644
> --- a/tests/intel/kms_pwrite_crc.c
> +++ b/tests/intel/kms_pwrite_crc.c
> @@ -169,13 +169,15 @@ static void cleanup_crtc(data_t *data)
>=20=20
>  static void run_test(data_t *data)
>  {
> +	igt_crtc_t *crtc;
>  	igt_display_t *display =3D &data->display;
>=20=20
> -	for_each_pipe_with_valid_output(display, data->pipe, data->output) {
> +	for_each_crtc_with_valid_output(display, crtc, data->output) {
> +		data->pipe =3D crtc->pipe;
>  		igt_display_reset(display);
>=20=20
>  		igt_output_set_crtc(data->output,
> -				    igt_crtc_for_pipe(data->output->display, data->pipe));
> +				    crtc);
>  		if (!intel_pipe_output_combo_valid(display))
>  			continue;
>=20=20
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 993ad37530b0..8539d31efded 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -903,16 +903,18 @@ static void require_linear_modifier(data_t *data)
>=20=20
>  static void run_test(data_t *data, void (*test)(data_t *))
>  {
> +	igt_crtc_t *crtc;
>  	igt_display_t *display =3D &data->display;
>=20=20
>  	if (data->atomic_path)
>  		require_atomic_async_cap(data);
>=20=20
> -	for_each_pipe_with_valid_output(display, data->pipe, data->output) {
> +	for_each_crtc_with_valid_output(display, crtc, data->output) {
> +		data->pipe =3D crtc->pipe;
>  		igt_display_reset(display);
>=20=20
>  		igt_output_set_crtc(data->output,
> -				    igt_crtc_for_pipe(data->output->display, data->pipe));
> +				    crtc);
>  		if (!intel_pipe_output_combo_valid(display))
>  			continue;
>=20=20
> @@ -923,7 +925,8 @@ static void run_test(data_t *data, void (*test)(data_=
t *))
>  		else
>  			data->modifier =3D default_modifier(data);
>=20=20
> -		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data->pipe), data->outpu=
t->name) {
> +		igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
> +			      data->output->name) {
>  			/*
>  			 * FIXME: joiner+async flip is busted currently in KMD.
>  			 * Remove this check once the issues are fixed in KMD.
> @@ -969,11 +972,13 @@ static bool skip_async_format_mod(data_t *data,
>=20=20
>  static void run_test_with_async_format_modifiers(data_t *data, void (*te=
st)(data_t *))
>  {
> +	igt_crtc_t *crtc;
>  	struct igt_vec tested_formats;
>=20=20
>  	igt_vec_init(&tested_formats, sizeof(struct format_mod));
>=20=20
> -	for_each_pipe_with_valid_output(&data->display, data->pipe, data->outpu=
t) {
> +	for_each_crtc_with_valid_output(&data->display, crtc, data->output) {
> +		data->pipe =3D crtc->pipe;
>  		test_init(data);
>=20=20
>  		igt_assert_f(data->plane->async_format_mod_count > 0,
> @@ -990,7 +995,7 @@ static void run_test_with_async_format_modifiers(data=
_t *data, void (*test)(data
>  					   IGT_MODIFIER_FMT " on %s.%u\n",
>  					   IGT_FORMAT_ARGS(f.format),
>  					   IGT_MODIFIER_ARGS(f.modifier),
> -					   kmstest_pipe_name(data->pipe),
> +					   igt_crtc_name(crtc),
>  					   data->plane->index);
>  				continue;
>  			}
> @@ -999,7 +1004,7 @@ static void run_test_with_async_format_modifiers(dat=
a_t *data, void (*test)(data
>  			data->plane_format =3D f.format;
>  			data->async_mod_formats =3D true;
>=20=20
> -			igt_dynamic_f("pipe-%s-%s-%s-%s", kmstest_pipe_name(data->pipe),
> +			igt_dynamic_f("pipe-%s-%s-%s-%s", igt_crtc_name(crtc),
>  				      data->output->name,
>  				      igt_fb_modifier_name(data->modifier),
>  				      igt_format_str(data->plane_format)) {
> @@ -1022,10 +1027,12 @@ static void run_test_with_async_format_modifiers(=
data_t *data, void (*test)(data
>=20=20
>  static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
>  {
> +	igt_crtc_t *crtc;
>  	if (data->atomic_path)
>  		require_atomic_async_cap(data);
>=20=20
> -	for_each_pipe_with_valid_output(&data->display, data->pipe, data->outpu=
t) {
> +	for_each_crtc_with_valid_output(&data->display, crtc, data->output) {
> +		data->pipe =3D crtc->pipe;
>  		test_init(data);
>=20=20
>  		igt_require_f(data->plane->async_format_mod_count > 0,
> @@ -1042,7 +1049,7 @@ static void run_test_with_modifiers(data_t *data, v=
oid (*test)(data_t *))
>=20=20
>  			data->modifier =3D modifier;
>=20=20
> -			igt_dynamic_f("pipe-%s-%s-%s", kmstest_pipe_name(data->pipe),
> +			igt_dynamic_f("pipe-%s-%s-%s", igt_crtc_name(crtc),
>  				      data->output->name,
>  				      igt_fb_modifier_name(modifier)) {
>  				      /*
> diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
> index 1e4ccd83b554..ecbd85d031a6 100644
> --- a/tests/kms_vblank.c
> +++ b/tests/kms_vblank.c
> @@ -476,6 +476,7 @@ static void vblank_ts_cont(data_t *data, int fd, int =
nchildren)
>=20=20
>  static void run_subtests(data_t *data)
>  {
> +	igt_crtc_t *crtc;
>  	const struct {
>  		const char *name;
>  		void (*func)(data_t *, int, int);
> @@ -515,17 +516,23 @@ static void run_subtests(data_t *data)
>=20=20
>  			igt_describe("Check if test run while hanging by introducing NOHANG f=
lag.");
>  			igt_subtest_with_dynamic_f("%s-%s", f->name, m->name) {
> -				for_each_pipe_with_valid_output(&data->display, data->pipe, data->ou=
tput) {
> -					if (!pipe_output_combo_valid(&data->display, data->pipe, data->outp=
ut))
> +				for_each_crtc_with_valid_output(&data->display,
> +								crtc,
> +								data->output) {
> +					data->pipe =3D crtc->pipe;
> +					if (!pipe_output_combo_valid(&data->display, crtc->pipe, data->outp=
ut))
>  						continue;
>=20=20
> -					if (!all_pipes && data->pipe !=3D active_pipes[0] &&
> -					    data->pipe !=3D active_pipes[last_pipe]) {
> -						igt_info("Skipping pipe %s\n", kmstest_pipe_name(data->pipe));
> +					if (!all_pipes && crtc->pipe !=3D active_pipes[0] &&
> +					    crtc->pipe !=3D active_pipes[last_pipe]) {
> +						igt_info("Skipping pipe %s\n",
> +							 igt_crtc_name(crtc));
>  						continue;
>  					}
>=20=20
> -					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data->pipe), data->ou=
tput->name) {
> +					igt_dynamic_f("pipe-%s-%s",
> +						      igt_crtc_name(crtc),
> +						      data->output->name) {
>  						data->flags =3D m->flags | NOHANG;
>  						run_test(data, f->func);
>  					}
> @@ -541,17 +548,23 @@ static void run_subtests(data_t *data)
>  				igt_hang_t hang;
>=20=20
>  				hang =3D igt_allow_hang(data->display.drm_fd, 0, 0);
> -				for_each_pipe_with_valid_output(&data->display, data->pipe, data->ou=
tput) {
> -					if (!pipe_output_combo_valid(&data->display, data->pipe, data->outp=
ut))
> +				for_each_crtc_with_valid_output(&data->display,
> +								crtc,
> +								data->output) {
> +					data->pipe =3D crtc->pipe;
> +					if (!pipe_output_combo_valid(&data->display, crtc->pipe, data->outp=
ut))
>  						continue;
>=20=20
> -					if (!all_pipes && data->pipe !=3D active_pipes[0] &&
> -					    data->pipe !=3D active_pipes[last_pipe]) {
> -						igt_info("Skipping pipe %s\n", kmstest_pipe_name(data->pipe));
> +					if (!all_pipes && crtc->pipe !=3D active_pipes[0] &&
> +					    crtc->pipe !=3D active_pipes[last_pipe]) {
> +						igt_info("Skipping pipe %s\n",
> +							 igt_crtc_name(crtc));
>  						continue;
>  					}
>=20=20
> -					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data->pipe), data->ou=
tput->name) {
> +					igt_dynamic_f("pipe-%s-%s",
> +						      igt_crtc_name(crtc),
> +						      data->output->name) {
>  						data->flags =3D m->flags;
>  						run_test(data, f->func);
>  					}

--=20
Jani Nikula, Intel
