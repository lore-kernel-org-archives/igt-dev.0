Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F34CD1284
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 12:44:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6671010EFBC;
	Thu, 11 Apr 2024 12:44:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NyG/vWFZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F41B610F080
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 12:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712839455; x=1744375455;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=lPeEEJhS1C33AIbyUcUFp/Rj4b6j8qv7a3BbCHxqi2k=;
 b=NyG/vWFZNGuBsmXSC9WPnyRMzzTiIeDeZZk7nSomZ0DVlRZYetfKqAH+
 E/oTrSbXjE4OjBMNF9YS3tqmG5g09Wgk9rRiSkjWuA3MeT6kHWuH/Iq6G
 xQgn5gfJTViRNFnUc14EcH29Nwb0mLeROguQXtKuxO3CvHOY2GNq5GPXf
 5d2Oqa79tXVfGs7lSjAwrlCC3XhUZWZ2RO81gd9pegeghzHTGFaFBX/xP
 o2pEKd2Ssct/Dc0ZSNsuDJhqeIPaPKHBLpdbksMx1qhtr3SaeupozxK8b
 NEy0vx7PPwM3VqavtYGsBXgnG9vtNoKjj/s6lotY5fb3RO+8v8EsNxKyO g==;
X-CSE-ConnectionGUID: f+xoS1jGRIWDUkUs1OWc9A==
X-CSE-MsgGUID: TNgd+E/rQbmo9XojgQLvsQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19637077"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="19637077"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 05:44:14 -0700
X-CSE-ConnectionGUID: hnySsx0zTjyjUOzorkHBMw==
X-CSE-MsgGUID: disWy1TyTSqzPpCN/0zFzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="21475053"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 05:44:13 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 06/13] tools/intel_vbt_decode: Decode the
 backlight i2c stuff
In-Reply-To: <20240322204125.17212-7-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240322204125.17212-1-ville.syrjala@linux.intel.com>
 <20240322204125.17212-7-ville.syrjala@linux.intel.com>
Date: Thu, 11 Apr 2024 15:44:09 +0300
Message-ID: <8734rs6pd2.fsf@intel.com>
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

On Fri, 22 Mar 2024, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Decode the (obsolete) backlight i2c stuff for completeness.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tools/intel_vbt_decode.c | 45 ++++++++++++++++++++++++++++------------
>  1 file changed, 32 insertions(+), 13 deletions(-)
>
> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> index 9c0774248e56..fa7bbc345eec 100644
> --- a/tools/intel_vbt_decode.c
> +++ b/tools/intel_vbt_decode.c
> @@ -592,6 +592,27 @@ static void dump_general_features(struct context *co=
ntext,
>  	printf("\tDP SSC dongle supported: %s\n", YESNO(features->dp_ssc_dongle=
_supported));
>  }
>=20=20
> +static const char *inverter_type(u8 type)
> +{
> +	switch (type) {
> +	case 0: return "none/external";
> +	case 1: return "I2C";
> +	case 2: return "PWM";
> +	default: return "reserved>";

< missing, can be fixed while applying,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> +	}
> +}
> +
> +static const char *i2c_speed(u8 i2c_speed)
> +{
> +	switch (i2c_speed) {
> +	case 0: return "100 kHz";
> +	case 1: return "50 kHz";
> +	case 2: return "400 kHz";
> +	case 3: return "1 MHz";
> +	default: return "<unknown>";
> +	}
> +}
> +
>  static void dump_backlight_info(struct context *context,
>  				const struct bdb_block *block)
>  {
> @@ -615,11 +636,20 @@ static void dump_backlight_info(struct context *con=
text,
>=20=20
>  		blc =3D &backlight->data[i];
>=20=20
> -		printf("\t\tInverter type: %u\n", blc->type);
> -		printf("\t\tActive low: %u\n", blc->active_low_pwm);
> +		printf("\t\tInverter type: %s (%u)\n",
> +		       inverter_type(blc->type), blc->type);
> +		printf("\t\tActive low: %s\n", YESNO(blc->active_low_pwm));
>  		printf("\t\tPWM freq: %u\n", blc->pwm_freq_hz);
>  		printf("\t\tMinimum brightness: %u\n", blc->min_brightness);
>=20=20
> +		if (blc->type =3D=3D 1) {
> +			printf("\t\tI2C pin: 0x%02x\n", blc->i2c_pin);
> +			printf("\t\tI2C speed: %s (0x%02x)\n",
> +			       i2c_speed(blc->i2c_speed), blc->i2c_speed);
> +			printf("\t\tI2C address: 0x%02x\n", blc->i2c_address);
> +			printf("\t\tI2C command: 0x%02x\n", blc->i2c_command);
> +		}
> +
>  		printf("\t\tLevel: %u\n", backlight->level[i]);
>=20=20
>  		control =3D &backlight->backlight_control[i];
> @@ -933,17 +963,6 @@ static const char *hdmi_frl_rate(u8 frl_rate)
>  	}
>  }
>=20=20
> -static const char *i2c_speed(u8 i2c_speed)
> -{
> -	switch (i2c_speed) {
> -	case 0: return "100 kHz";
> -	case 1: return "50 kHz";
> -	case 2: return "400 kHz";
> -	case 3: return "1 MHz";
> -	default: return "<unknown>";
> -	}
> -}
> -
>  static void dump_child_device(struct context *context,
>  			      const struct child_device_config *child)
>  {

--=20
Jani Nikula, Intel
