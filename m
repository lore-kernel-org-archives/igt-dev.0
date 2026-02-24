Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1DF6E9B269
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 14:08:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A7D810E0AC;
	Tue, 24 Feb 2026 14:08:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RacWsNCT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3863D10E0AC
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 14:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771942100; x=1803478100;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=i4U6GyVRKI3roBKx3fRT/tvE7DvhvDjEfWcZ0NSm2Oo=;
 b=RacWsNCTsAHrgaUKmLbYVlDxDuUmlSO1Y2JXImEio0cqFZFbhSi9dmfl
 qsJ1vJ59CsitdiSOyLczJAyqQGqtQwr+Y54dSipJfUL/Dq1IB7w3tr6f3
 MePeDuyEj4sL0+9LdiHcHv1CvBhEmhN+S59VFgWHATMJCeT7i+cyggT62
 X2XPNdjJrSDLXVoEB9LL1melXXIeBOhEAhyDEubeBYuF8eiWzzj/GizCh
 3RYd5klUrjANlHa8Vfjg6b5/Bs9KacCSO+0mX4CzKKcEKanKKu2I8bpHD
 pp0jpuq2cXZxQFwNRVp5oGBt1FXeefW5X2Sy3Ku92Lt5wmGqBGqu6jiHE A==;
X-CSE-ConnectionGUID: DDOiHQ3WTeuChNW993E5hA==
X-CSE-MsgGUID: bAe893qHSG+E3weNI2PYSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="76817346"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="76817346"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 06:08:20 -0800
X-CSE-ConnectionGUID: qfOnNNgmRAuTjjmZTjFCnw==
X-CSE-MsgGUID: 6iI1Oyh/RDmJtI3A9K02OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="213153056"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.20])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 06:08:18 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: George Zhang <george.zhang@amd.com>, Tom Chung <chiahsuan.chung@amd.com>
Subject: Re: [PATCH i-g-t v2 05/23] tests/amdgpu/amd_abm: Don't use
 uninitialized 'pipe'
In-Reply-To: <20260221032003.30936-6-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260221032003.30936-1-ville.syrjala@linux.intel.com>
 <20260221032003.30936-6-ville.syrjala@linux.intel.com>
Date: Tue, 24 Feb 2026 16:08:16 +0200
Message-ID: <f8bade0a295263013a0cf7f7dc6b399be3bd0040@intel.com>
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
> The for_each_valid_output_on_pipe() loops in amd_abm use an
> uninitialized 'pipe' variable. Not entirely sure what the intention
> was with the change to for_each_valid_output_on_pipe(), but eg.
> set_abm_level() gets called from those loops and it operates on
> data->pipe_id instead of whatever stack garbage pipe the loop
> happens to use. So let's assume the intention was to use the same
> fixed pipe for everything and just pass data->pipe_id to
> for_each_valid_output_on_pipe().

Would be great to get input from the authors, but in any case

Acked-by: Jani Nikula <jani.nikula@intel.com>

>
>  #include "scripts/iterators.cocci"
>
> @@
> iterator name for_each_valid_output_on_pipe;
> expression DISPLAY, OUTPUT;
> identifier PIPE;
> type T;
> @@
> - T PIPE;
> <+... when !=3D PIPE =3D ...
>   for_each_valid_output_on_pipe(DISPLAY,
> -	PIPE,
> +	data->pipe_id,
> 	OUTPUT)
> 	{...}
> ...+>
>
> Cc: George Zhang <george.zhang@amd.com>
> Cc: Tom Chung <chiahsuan.chung@amd.com>
> Fixes: 1235576931b5 ("tests/amdgpu/amd_abm: Fixed tests to only run on on=
e output per pipe")
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tests/amdgpu/amd_abm.c | 18 ++++++------------
>  1 file changed, 6 insertions(+), 12 deletions(-)
>
> diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
> index 110dd89e3ac2..159f6c7c69e9 100644
> --- a/tests/amdgpu/amd_abm.c
> +++ b/tests/amdgpu/amd_abm.c
> @@ -170,10 +170,9 @@ static void test_fini(data_t *data)
>  {
>  	igt_display_t *display =3D &data->display;
>  	igt_output_t *output;
> -	enum pipe pipe;
>=20=20
>  	/* Disable ABM before exit test */
> -	for_each_valid_output_on_pipe(&data->display, pipe, output) {
> +	for_each_valid_output_on_pipe(&data->display, data->pipe_id, output) {
>  		if (output->config.connector->connector_type !=3D DRM_MODE_CONNECTOR_e=
DP)
>  			continue;
>  		set_abm_level(data, output, 0);
> @@ -328,9 +327,8 @@ static void backlight_dpms_cycle(data_t *data)
>  	int max_brightness;
>  	int pwm_1, pwm_2;
>  	igt_output_t *output;
> -	enum pipe pipe;
>=20=20
> -	for_each_valid_output_on_pipe(&data->display, pipe, output) {
> +	for_each_valid_output_on_pipe(&data->display, data->pipe_id, output) {
>  		if (output->config.connector->connector_type !=3D DRM_MODE_CONNECTOR_e=
DP)
>  			continue;
>=20=20
> @@ -359,10 +357,9 @@ static void backlight_monotonic_basic(data_t *data)
>  	int prev_pwm, pwm;
>  	int brightness_step;
>  	int brightness;
> -	enum pipe pipe;
>  	igt_output_t *output;
>=20=20
> -	for_each_valid_output_on_pipe(&data->display, pipe, output) {
> +	for_each_valid_output_on_pipe(&data->display, data->pipe_id, output) {
>  		if (output->config.connector->connector_type !=3D DRM_MODE_CONNECTOR_e=
DP)
>  			continue;
>  		ret =3D backlight_read_max_brightness(&max_brightness);
> @@ -393,10 +390,9 @@ static void backlight_monotonic_abm(data_t *data)
>  	int prev_pwm, pwm;
>  	int brightness_step;
>  	int brightness;
> -	enum pipe pipe;
>  	igt_output_t *output;
>=20=20
> -	for_each_valid_output_on_pipe(&data->display, pipe, output) {
> +	for_each_valid_output_on_pipe(&data->display, data->pipe_id, output) {
>  		if (output->config.connector->connector_type !=3D DRM_MODE_CONNECTOR_e=
DP)
>  			continue;
>  		ret =3D backlight_read_max_brightness(&max_brightness);
> @@ -426,10 +422,9 @@ static void abm_enabled(data_t *data)
>  	int ret, i;
>  	int max_brightness;
>  	int pwm, prev_pwm, pwm_without_abm;
> -	enum pipe pipe;
>  	igt_output_t *output;
>=20=20
> -	for_each_valid_output_on_pipe(&data->display, pipe, output) {
> +	for_each_valid_output_on_pipe(&data->display, data->pipe_id, output) {
>  		if (output->config.connector->connector_type !=3D DRM_MODE_CONNECTOR_e=
DP)
>  			continue;
>=20=20
> @@ -460,10 +455,9 @@ static void abm_gradual(data_t *data)
>  	int convergence_delay =3D 10;
>  	int prev_pwm, pwm, curr;
>  	int max_brightness;
> -	enum pipe pipe;
>  	igt_output_t *output;
>=20=20
> -	for_each_valid_output_on_pipe(&data->display, pipe, output) {
> +	for_each_valid_output_on_pipe(&data->display, data->pipe_id, output) {
>  		if (output->config.connector->connector_type !=3D DRM_MODE_CONNECTOR_e=
DP)
>  			continue;

--=20
Jani Nikula, Intel
