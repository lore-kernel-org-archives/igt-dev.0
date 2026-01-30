Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B4FAE6BF16
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 14:08:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC56010E11C;
	Fri, 30 Jan 2026 14:08:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H34BwZWj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D087910E11C
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 14:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769782106; x=1801318106;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=dvn/lhrX6gIOTLnXb1pqrAumXjvASlvXX+08UAm2FPs=;
 b=H34BwZWjzRySoyQJnhBKHCbCnr0TKSzoO1r5vc+ElK0fYcII2DpHYlqy
 4cENP2zK7NPeddLJHQVSZb0S68bjul7ppjtqjpV+OWjzcrDBhUosdbA1p
 Wi0p/3UuiusjXPmydPDles6lk9Vafkpu4x6AOQmIffy9BnUnQtWF/WkgW
 FUZKSdZpoQbRTEphmHCE5ftlDsoA9tfSvEmOhCVBROeEuIrUehEdAGWBI
 G52oGp2iNoMsOY7z7DHTbMre4HVBKtO3kTm1cy1piHgJOu4FmEvGz/BoP
 zx42ka3GRyZLhecTSxtl9NLtzF9aZYBtMLIsA91OxBMu96h0pWLlmcOOT A==;
X-CSE-ConnectionGUID: UfopBKIaRr6xBGt0IDuXgg==
X-CSE-MsgGUID: f4db+TdWR7OHms3mHzBBmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="70935566"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="70935566"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 06:08:26 -0800
X-CSE-ConnectionGUID: TtSFDOvvQ9C+gXsvcsqodg==
X-CSE-MsgGUID: XMYa67g4TjCZBrj8HPAswQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="213354946"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.77])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 06:08:24 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 04/15] tests/kms_color: Convert to for_each_crtc*()
In-Reply-To: <20260130105237.14481-5-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260130105237.14481-1-ville.syrjala@linux.intel.com>
 <20260130105237.14481-5-ville.syrjala@linux.intel.com>
Date: Fri, 30 Jan 2026 16:08:22 +0200
Message-ID: <5d5cc137d983c52b8d4210881458c010d3843479@intel.com>
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
> Convert tests/kms_color to use the new crtc based iterators
> (over the old pipe based ones).
>
> This is another test cased that proved too much for coccinelle
> for whatever reason, so the conversion was done manually.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  tests/kms_color.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index b2ca6975d6a5..a50793651c11 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -955,7 +955,7 @@ run_deep_color_tests_for_pipe(data_t *data, enum pipe=
 p)
>  static void
>  run_invalid_tests_for_pipe(data_t *data)
>  {
> -	enum pipe pipe;
> +	igt_crtc_t *crtc;
>  	struct {
>  		const char *name;
>  		void (*test_t) (data_t *data, enum pipe pipe);
> @@ -975,10 +975,10 @@ run_invalid_tests_for_pipe(data_t *data)
>  	for (i =3D 0; i < ARRAY_SIZE(tests); i++) {
>  		igt_describe_f("%s", tests[i].desc);
>  		igt_subtest_with_dynamic_f("%s", tests[i].name) {
> -			for_each_pipe(&data->display, pipe) {
> -				igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
> -					prep_pipe(data, pipe);
> -					tests[i].test_t(data, pipe);
> +			for_each_crtc(&data->display, crtc) {
> +				igt_dynamic_f("pipe-%s", igt_crtc_name(crtc)) {
> +					prep_pipe(data, crtc->pipe);
> +					tests[i].test_t(data, crtc->pipe);
>  				}
>  			}
>  		}
> @@ -988,7 +988,7 @@ run_invalid_tests_for_pipe(data_t *data)
>  static void
>  run_tests_for_pipe(data_t *data)
>  {
> -	enum pipe pipe;
> +	igt_crtc_t *crtc;
>  	static const struct {
>  		const char *name;
>  		bool (*test_t)(data_t*, igt_plane_t*);
> @@ -1118,10 +1118,10 @@ run_tests_for_pipe(data_t *data)
>  	for (i =3D 0; i < ARRAY_SIZE(gamma_degamma_tests); i++) {
>  		igt_describe_f("%s", gamma_degamma_tests[i].desc);
>  		igt_subtest_with_dynamic_f("%s", gamma_degamma_tests[i].name) {
> -			for_each_pipe_with_valid_output(&data->display, pipe, data->output) {
> -				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
> +			for_each_crtc_with_valid_output(&data->display, crtc, data->output) {
> +				igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
>  					      igt_output_name(data->output))
> -					run_gamma_degamma_tests_for_pipe(data, pipe,
> +					run_gamma_degamma_tests_for_pipe(data, crtc->pipe,
>  									 gamma_degamma_tests[i].test_t);
>  			}
>  		}
> @@ -1130,10 +1130,10 @@ run_tests_for_pipe(data_t *data)
>  	for (i =3D 0; i < ARRAY_SIZE(ctm_tests); i++) {
>  		igt_describe_f("%s", ctm_tests[i].desc);
>  		igt_subtest_with_dynamic_f("%s", ctm_tests[i].name) {
> -			for_each_pipe_with_valid_output(&data->display, pipe, data->output) {
> -				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
> +			for_each_crtc_with_valid_output(&data->display, crtc, data->output) {
> +				igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
>  					      igt_output_name(data->output))
> -					run_ctm_tests_for_pipe(data, pipe,
> +					run_ctm_tests_for_pipe(data, crtc->pipe,
>  							       ctm_tests[i].fb_colors,
>  							       ctm_tests[i].ctm,
>  							       ctm_tests[i].iter);
> @@ -1148,8 +1148,8 @@ run_tests_for_pipe(data_t *data)
>=20=20
>  	igt_describe("Verify that deep color works correctly");
>  	igt_subtest_with_dynamic("deep-color") {
> -		for_each_pipe(&data->display, pipe) {
> -			run_deep_color_tests_for_pipe(data, pipe);
> +		for_each_crtc(&data->display, crtc) {
> +			run_deep_color_tests_for_pipe(data, crtc->pipe);
>=20=20
>  			if (igt_run_in_simulation())
>  				break;

--=20
Jani Nikula, Intel
