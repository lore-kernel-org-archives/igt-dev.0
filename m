Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37AC1C43458
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jun 2026 10:08:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3D3910E049;
	Mon, 29 Jun 2026 10:08:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bX+2nxLY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EA3D10E049
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jun 2026 10:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782727654; x=1814263654;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=LAjqb4c9Q+SinSFZQVruYrFe0cmet3h3d/5N8jv6vhw=;
 b=bX+2nxLYCXo2oYc36WaSr1DHb95qVoO8/ctvGVHXW7mEuzFPIwZ77YV+
 cTV9q1S2Iq1t4sydFnZ9SyAyY37S9fDF+3ycaURhJPROPEVRGLBu6qANB
 TWaSUBIuwMS85dQp6fYXS12fKNbwx6Uy9kPiZCtXVb8h1W+1p+8Yw14mL
 GnMpVZWejjwLf1Lp15NartOxFoeXQmYKqDVgF61LGKH7f8hY0jd7Q0fjI
 ZTUFo8lelhOmpfIkfB/M3yVWgYybzFbpXLVxaBhPzcYmHBjWZjLecyG8u
 LBleo7hsPL26nn+TtKsRR8+m3XipV2FOR5Kvy4Yqsya6OeouggB9z1/Wn A==;
X-CSE-ConnectionGUID: bcw7KK8ES1udWSX1rx9NKg==
X-CSE-MsgGUID: dkP34n1USBKDN3hrxnyD0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="85959508"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="85959508"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 03:07:34 -0700
X-CSE-ConnectionGUID: uRbYyU7yS9mfmw609ZTECQ==
X-CSE-MsgGUID: vag1xmytR9CKbLRtbk2UUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="282000403"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.253])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 03:07:32 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: juhapekka.heikkila@gmail.com, =?utf-8?Q?Micha=C5=82?= Grzelak
 <michal.grzelak@intel.com>
Subject: Re: [PATCH i-g-t v1 2/3] tests/sharpness_filter: limit #outputs
 used during suspend
In-Reply-To: <20260629090740.2706320-3-michal.grzelak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260629090740.2706320-1-michal.grzelak@intel.com>
 <20260629090740.2706320-3-michal.grzelak@intel.com>
Date: Mon, 29 Jun 2026 13:07:09 +0300
Message-ID: <ee1e281f1e2d4b509cb831f77e24f301c99e4ef2@intel.com>
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
> We are iterating through each connected output while testing suspend.
> This results in extended execution time, in turn leading to hitting CI
> enforced timeout. Limit number of used outputs by default to 3. Test
> each connected output when passing dedicated commandline parameter.
>
> Cc: Juha-Pekka Heikkil=C3=A4 <juhapekka.heikkila@gmail.com>
> Signed-off-by: Micha=C5=82 Grzelak <michal.grzelak@intel.com>
> ---
>  tests/intel/kms_sharpness_filter.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpne=
ss_filter.c
> index 1575cde6f7..fc7074b1c7 100644
> --- a/tests/intel/kms_sharpness_filter.c
> +++ b/tests/intel/kms_sharpness_filter.c
> @@ -231,6 +231,7 @@ static const struct subtest_entry {
>  typedef struct {
>  	int drm_fd;
>  	bool limited;
> +	bool all_outps;

Useless abbreviation.

>  	struct igt_fb fb[4];
>  	igt_crtc_t *crtc;
>  	igt_display_t display;
> @@ -599,9 +600,15 @@ run_sharpness_filter_test(data_t *data, enum test_ty=
pe type)
>  	igt_display_t *display =3D &data->display;
>  	igt_output_t *output;
>  	igt_crtc_t *crtc;
> +	int outp_cntr =3D 0;

Ditto.

>  	char name[40];
>=20=20
>  	for_each_connected_output(display, output) {
> +		if (type =3D=3D TEST_FILTER_SUSPEND && !data->all_outps && outp_cntr >=
 3)
> +			continue;
> +
> +		outp_cntr++;
> +
>  		for_each_crtc(display, crtc) {
>  			igt_display_reset(display);
>=20=20
> @@ -744,6 +751,9 @@ static int opt_handler(int opt, int opt_index, void *=
_data)
>  	case 'l':
>  		data->limited =3D true;
>  		break;
> +	case 'o':
> +		data->all_outps =3D true;
> +		break;
>  	default:
>  		return IGT_OPT_HANDLER_ERROR;
>  	}
> @@ -752,11 +762,12 @@ static int opt_handler(int opt, int opt_index, void=
 *_data)
>  }
>=20=20
>  static const char help_str[] =3D
> -	"  --limited|-l\t\tLimit execution to 1 valid pipe-output combo\n";
> +	"  --limited|-l\t\tLimit execution to 1 valid pipe-output combo\n"
> +	"  --all-outputs|-o\t\tExtend suspend tests for all outputs\n";
>=20=20
>  data_t data =3D {};
>=20=20
> -int igt_main_args("l", NULL, help_str, opt_handler, &data)
> +int igt_main_args("lo", NULL, help_str, opt_handler, &data)
>  {
>  	igt_fixture() {
>  		data.drm_fd =3D drm_open_driver_master(DRIVER_ANY);

--=20
Jani Nikula, Intel
