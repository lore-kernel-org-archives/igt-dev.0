Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 703B7EFB818
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 09:09:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16B4510E529;
	Tue, 24 Feb 2026 09:09:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l/7ni/jp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A254D10E528
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 09:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771924188; x=1803460188;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=84Vhl3ztNLOPBYFu6o6DEUZ8SPClPMAw0k6eDU7JC9Y=;
 b=l/7ni/jp5cSe41k+nKz1o0ImRG08D3BeeFuWDk+cQdIzoyEI3LpgT19S
 Blq9qgW49MwfyHQ51kKVfUv6mMZz273q20ZTR24yUEWsAu1yofELQGtJs
 o0q69T9nQ+LBmYqluamrcVvfzUqn8+dbL0H5z/EGIeEnAmxdOWiPHCW5b
 tLqB6c6vZPW84/aHKI4jsti0SD7A+q/DU86c7QCefs+cUmRtZ0t1k9FMD
 +4dbw33QDfPQGtydFNNXYTxtQXVsmF/Bls674AuSAXk4gSNUGBU7BCks6
 IiBMp37CnEpgyVx/f5J0n8gmVJWtbS7gE3dhNSFtEQfTEQcV7LDUsj8xf A==;
X-CSE-ConnectionGUID: cvbo3PZBRTCiSkgO1AuAZA==
X-CSE-MsgGUID: rEwtSrf5R06C+mQwnXXd+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="90342025"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="90342025"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 01:09:47 -0800
X-CSE-ConnectionGUID: Q9ZXocSASl2ueJngZch17g==
X-CSE-MsgGUID: ly/9taHNSjuXWCsBGtKKvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="253574535"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.20])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 01:09:46 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 13/23] tests/intel/kms_psr2_sf: Convert pipes[]
 to crtcs[]
In-Reply-To: <20260221032003.30936-14-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260221032003.30936-1-ville.syrjala@linux.intel.com>
 <20260221032003.30936-14-ville.syrjala@linux.intel.com>
Date: Tue, 24 Feb 2026 11:09:43 +0200
Message-ID: <d379053c2f71247fbc67c777ffd0b515b490bf8c@intel.com>
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
> Convert the pipes[] array to crtcs[] in kms_psr2_sf. The
> remainder of the pipe->crtc conversions will be handled
> with cocci.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tests/intel/kms_psr2_sf.c | 66 +++++++++++++++++++--------------------
>  1 file changed, 33 insertions(+), 33 deletions(-)
>
> diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
> index f79d9b0b751e..ff63a3c84f10 100644
> --- a/tests/intel/kms_psr2_sf.c
> +++ b/tests/intel/kms_psr2_sf.c
> @@ -1157,8 +1157,8 @@ int igt_main()
>  	data_t data =3D {};
>  	igt_output_t *outputs[IGT_MAX_PIPES * IGT_MAX_PIPES];
>  	int i, y, z;
> -	int pipes[IGT_MAX_PIPES * IGT_MAX_PIPES];
> -	int n_pipes =3D 0;
> +	igt_crtc_t *crtcs[IGT_MAX_PIPES * IGT_MAX_PIPES];
> +	int n_crtcs =3D 0;
>  	int coexist_features[IGT_MAX_PIPES * IGT_MAX_PIPES];

I wonder what the deal with the IGT_MAX_PIPES^2 is. It's completely
unnecessary. But not part of this patch, so *shrug*.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

>  	const char *append_fbc_subtest[2] =3D {
>  		"",
> @@ -1212,14 +1212,14 @@ int igt_main()
>  			if (!output_supports_pr_psr2_sel_fetch)
>  				continue;
>=20=20
> -			pipes[n_pipes] =3D data.pipe;
> -			outputs[n_pipes] =3D data.output;
> +			crtcs[n_crtcs] =3D crtc;
> +			outputs[n_crtcs] =3D data.output;
>=20=20
> -			coexist_features[n_pipes] =3D 0;
> +			coexist_features[n_crtcs] =3D 0;
>  			if (is_dsc_supported_by_sink(data.drm_fd, data.output))
> -				coexist_features[n_pipes] |=3D FEATURE_DSC;
> +				coexist_features[n_crtcs] |=3D FEATURE_DSC;
>=20=20
> -			n_pipes++;
> +			n_crtcs++;
>  			pr_psr2_sel_fetch_supported =3D true;
>  		}
>  		igt_require_f(pr_psr2_sel_fetch_supported,
> @@ -1244,8 +1244,8 @@ int igt_main()
>  						   append_fbc_subtest[y],
>  						   append_psr_subtest[z],
>  						   op_str(data.op)) {
> -				for (i =3D 0; i < n_pipes; i++) {
> -					data.pipe =3D pipes[i];
> +				for (i =3D 0; i < n_crtcs; i++) {
> +					data.pipe =3D crtcs[i]->pipe;
>  					data.output =3D outputs[i];
>=20=20
>  					if (!pipe_output_combo_valid(&data))
> @@ -1265,8 +1265,8 @@ int igt_main()
>  							   append_fbc_subtest[y],
>  							   append_psr_subtest[z],
>  							   op_str(data.op)) {
> -					for (i =3D 0; i < n_pipes; i++) {
> -						data.pipe =3D pipes[i];
> +					for (i =3D 0; i < n_crtcs; i++) {
> +						data.pipe =3D crtcs[i]->pipe;
>  						data.output =3D outputs[i];
>=20=20
>  						if (!pipe_output_combo_valid(&data))
> @@ -1286,8 +1286,8 @@ int igt_main()
>  						   append_fbc_subtest[y],
>  						   append_psr_subtest[z],
>  						   op_str(data.op)) {
> -				for (i =3D 0; i < n_pipes; i++) {
> -					data.pipe =3D pipes[i];
> +				for (i =3D 0; i < n_crtcs; i++) {
> +					data.pipe =3D crtcs[i]->pipe;
>  					data.output =3D outputs[i];
>=20=20
>  					if (!pipe_output_combo_valid(&data))
> @@ -1303,8 +1303,8 @@ int igt_main()
>  			igt_describe("Test that selective fetch works on cursor plane");
>  			igt_subtest_with_dynamic_f("%s%scursor-%s-sf", append_fbc_subtest[y],
>  						   append_psr_subtest[z], op_str(data.op)) {
> -				for (i =3D 0; i < n_pipes; i++) {
> -					data.pipe =3D pipes[i];
> +				for (i =3D 0; i < n_crtcs; i++) {
> +					data.pipe =3D crtcs[i]->pipe;
>  					data.output =3D outputs[i];
>=20=20
>  					if (!pipe_output_combo_valid(&data))
> @@ -1320,8 +1320,8 @@ int igt_main()
>  				     "moving cursor plane (no update)");
>  			igt_subtest_with_dynamic_f("%s%scursor-%s-sf", append_fbc_subtest[y],
>  						   append_psr_subtest[z], op_str(data.op)) {
> -				for (i =3D 0; i < n_pipes; i++) {
> -					data.pipe =3D pipes[i];
> +				for (i =3D 0; i < n_crtcs; i++) {
> +					data.pipe =3D crtcs[i]->pipe;
>  					data.output =3D outputs[i];
>=20=20
>  					if (!pipe_output_combo_valid(&data))
> @@ -1337,8 +1337,8 @@ int igt_main()
>  				     "plane exceeding partially visible area (no update)");
>  			igt_subtest_with_dynamic_f("%s%scursor-%s-sf", append_fbc_subtest[y],
>  						   append_psr_subtest[z], op_str(data.op)) {
> -				for (i =3D 0; i < n_pipes; i++) {
> -					data.pipe =3D pipes[i];
> +				for (i =3D 0; i < n_crtcs; i++) {
> +					data.pipe =3D crtcs[i]->pipe;
>  					data.output =3D outputs[i];
>=20=20
>  					if (!pipe_output_combo_valid(&data))
> @@ -1354,8 +1354,8 @@ int igt_main()
>  				     "exceeding fully visible area (no update)");
>  			igt_subtest_with_dynamic_f("%s%scursor-%s-sf", append_fbc_subtest[y],
>  						   append_psr_subtest[z], op_str(data.op)) {
> -				for (i =3D 0; i < n_pipes; i++) {
> -					data.pipe =3D pipes[i];
> +				for (i =3D 0; i < n_crtcs; i++) {
> +					data.pipe =3D crtcs[i]->pipe;
>  					data.output =3D outputs[i];
>=20=20
>  					if (!pipe_output_combo_valid(&data))
> @@ -1372,8 +1372,8 @@ int igt_main()
>  			igt_describe("Test that selective fetch works on moving overlay plane=
");
>  			igt_subtest_with_dynamic_f("%s%s%s-sf-dmg-area", append_fbc_subtest[y=
],
>  						   append_psr_subtest[z], op_str(data.op)) {
> -				for (i =3D 0; i < n_pipes; i++) {
> -					data.pipe =3D pipes[i];
> +				for (i =3D 0; i < n_crtcs; i++) {
> +					data.pipe =3D crtcs[i]->pipe;
>  					data.output =3D outputs[i];
>=20=20
>  					if (!pipe_output_combo_valid(&data))
> @@ -1388,8 +1388,8 @@ int igt_main()
>  				     "plane (no update)");
>  			igt_subtest_with_dynamic_f("%s%soverlay-%s-sf", append_fbc_subtest[y],
>  						   append_psr_subtest[z], op_str(data.op)) {
> -				for (i =3D 0; i < n_pipes; i++) {
> -					data.pipe =3D pipes[i];
> +				for (i =3D 0; i < n_crtcs; i++) {
> +					data.pipe =3D crtcs[i]->pipe;
>  					data.output =3D outputs[i];
>=20=20
>  					if (!pipe_output_combo_valid(&data))
> @@ -1405,8 +1405,8 @@ int igt_main()
>  				     "plane partially exceeding visible area (no update)");
>  			igt_subtest_with_dynamic_f("%s%soverlay-%s-sf", append_fbc_subtest[y],
>  						   append_psr_subtest[z], op_str(data.op)) {
> -				for (i =3D 0; i < n_pipes; i++) {
> -					data.pipe =3D pipes[i];
> +				for (i =3D 0; i < n_crtcs; i++) {
> +					data.pipe =3D crtcs[i]->pipe;
>  					data.output =3D outputs[i];
>=20=20
>  					if (!pipe_output_combo_valid(&data))
> @@ -1422,8 +1422,8 @@ int igt_main()
>  				     "fully exceeding visible area (no update)");
>  			igt_subtest_with_dynamic_f("%s%soverlay-%s-sf", append_fbc_subtest[y],
>  						   append_psr_subtest[z], op_str(data.op)) {
> -				for (i =3D 0; i < n_pipes; i++) {
> -					data.pipe =3D pipes[i];
> +				for (i =3D 0; i < n_crtcs; i++) {
> +					data.pipe =3D crtcs[i]->pipe;
>  					data.output =3D outputs[i];
>=20=20
>  					if (!pipe_output_combo_valid(&data))
> @@ -1440,8 +1440,8 @@ int igt_main()
>  				     "with blended overlay plane");
>  			igt_subtest_with_dynamic_f("%s%s%s-sf-dmg-area", append_fbc_subtest[y=
],
>  						   append_psr_subtest[z], op_str(data.op)) {
> -				for (i =3D 0; i < n_pipes; i++) {
> -					data.pipe =3D pipes[i];
> +				for (i =3D 0; i < n_crtcs; i++) {
> +					data.pipe =3D crtcs[i]->pipe;
>  					data.output =3D outputs[i];
>=20=20
>  					if (!pipe_output_combo_valid(&data))
> @@ -1460,8 +1460,8 @@ int igt_main()
>  			igt_describe("Test that selective fetch works on overlay plane");
>  			igt_subtest_with_dynamic_f("%s%soverlay-%s-sf", append_fbc_subtest[y],
>  						   append_psr_subtest[z], op_str(data.op)) {
> -				for (i =3D 0; i < n_pipes; i++) {
> -					data.pipe =3D pipes[i];
> +				for (i =3D 0; i < n_crtcs; i++) {
> +					data.pipe =3D crtcs[i]->pipe;
>  					data.output =3D outputs[i];
>=20=20
>  					if (!pipe_output_combo_valid(&data))

--=20
Jani Nikula, Intel
