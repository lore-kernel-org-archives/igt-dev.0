Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D25D6C43458
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jun 2026 10:09:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7771F10E049;
	Mon, 29 Jun 2026 10:09:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YJKqWXNc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3438410E049
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jun 2026 10:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782727717; x=1814263717;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=6r2c2IjuxUBVWHzM2cWkfMf4oZjFJ9tZlR1UtkZJv5E=;
 b=YJKqWXNcePtSrmkKzK+T2hADvUB8Tjyydmxbna/LQuHQinagWpMAneia
 QAFi9Gj9a+ToZ/lc3vwKHbymv87uFK9A6qL+KPRDRfgsKKmzUZXxukOzs
 Gs9xcesANE9m6BPU4JmSEhjNmVS65j6F6owN5ea3Z2vxu7welZVOInoco
 owUKQcsAL/z1V1RsICdup27t8r+xXVV4g2Xym2dmYZbAR15NPEEQtfp8d
 IgFTaqsyhgHaEIAcm7QR29WnthOqEYM6cgXpT38fzU08y/djIhIAFVJXf
 Q8uXhTHl1MaI1qQ9n9jwPGI2W/QrBdljfW1KT+17NBkf2VjXx4dqfHBHD w==;
X-CSE-ConnectionGUID: wAaYOax2TaeT3HlA03mALA==
X-CSE-MsgGUID: lRpAf88DQlafGa3ufPbDDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="85959629"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="85959629"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 03:08:36 -0700
X-CSE-ConnectionGUID: 515Ou/IXRBimMalKOitDYw==
X-CSE-MsgGUID: wthDmImaT7+AVHJ+VbZ4xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="256325237"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.253])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 03:08:34 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: juhapekka.heikkila@gmail.com, =?utf-8?Q?Micha=C5=82?= Grzelak
 <michal.grzelak@intel.com>
Subject: Re: [PATCH i-g-t v1 3/3] tests/sharpness_filter: limit #crtcs
 tested during suspend
In-Reply-To: <20260629090740.2706320-4-michal.grzelak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260629090740.2706320-1-michal.grzelak@intel.com>
 <20260629090740.2706320-4-michal.grzelak@intel.com>
Date: Mon, 29 Jun 2026 13:08:32 +0300
Message-ID: <f428213a23c641180ee796e5591f2c54f43ce2a5@intel.com>
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

On Mon, 29 Jun 2026, Micha=C5=82 Grzelak <michal.grzelak@intel.com> wrote:
> We are iterating through each crtc while testing suspend. This results
> in extended execution time, in turn leading to hitting CI enforced
> timeout. Limit number of tested crtcs to first and last. Test each
> crtc when passing dedicated commandline parameter.
>
> Cc: Juha-Pekka Heikkil=C3=A4 <juhapekka.heikkila@gmail.com>
> Signed-off-by: Micha=C5=82 Grzelak <michal.grzelak@intel.com>
> ---
>  tests/intel/kms_sharpness_filter.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpne=
ss_filter.c
> index fc7074b1c7..ae700cb5b3 100644
> --- a/tests/intel/kms_sharpness_filter.c
> +++ b/tests/intel/kms_sharpness_filter.c
> @@ -231,6 +231,7 @@ static const struct subtest_entry {
>  typedef struct {
>  	int drm_fd;
>  	bool limited;
> +	bool all_crtcs;
>  	bool all_outps;
>  	struct igt_fb fb[4];
>  	igt_crtc_t *crtc;
> @@ -601,6 +602,7 @@ run_sharpness_filter_test(data_t *data, enum test_typ=
e type)
>  	igt_output_t *output;
>  	igt_crtc_t *crtc;
>  	int outp_cntr =3D 0;
> +	int crtc_cntr =3D 0;
>  	char name[40];
>=20=20
>  	for_each_connected_output(display, output) {
> @@ -617,6 +619,12 @@ run_sharpness_filter_test(data_t *data, enum test_ty=
pe type)
>=20=20
>  			igt_output_set_crtc(data->output, data->crtc);
>=20=20
> +			if (type =3D=3D TEST_FILTER_SUSPEND && !data->all_crtcs && crtc->crtc=
_index !=3D 0 &&
> +						crtc->crtc_index !=3D display->n_crtcs-1)
> +					continue;
> +
> +			crtc_cntr++;

You're not using the value for anything.

> +
>  			/*
>  			 * FIXME: Joiner + CASF currently unsupported.
>  			 * Remove this check once support is implemented.
> @@ -751,6 +759,9 @@ static int opt_handler(int opt, int opt_index, void *=
_data)
>  	case 'l':
>  		data->limited =3D true;
>  		break;
> +	case 'c':
> +		data->all_crtcs =3D true;
> +		break;
>  	case 'o':
>  		data->all_outps =3D true;
>  		break;
> @@ -763,11 +774,12 @@ static int opt_handler(int opt, int opt_index, void=
 *_data)
>=20=20
>  static const char help_str[] =3D
>  	"  --limited|-l\t\tLimit execution to 1 valid pipe-output combo\n"
> -	"  --all-outputs|-o\t\tExtend suspend tests for all outputs\n";
> +	"  --all-outputs|-o\t\tExtend suspend tests for all outputs\n"
> +	"  --all-crtcs|-c\t\tExtend suspend tests for all crtcs\n";
>=20=20
>  data_t data =3D {};
>=20=20
> -int igt_main_args("lo", NULL, help_str, opt_handler, &data)
> +int igt_main_args("loc", NULL, help_str, opt_handler, &data)
>  {
>  	igt_fixture() {
>  		data.drm_fd =3D drm_open_driver_master(DRIVER_ANY);

--=20
Jani Nikula, Intel
