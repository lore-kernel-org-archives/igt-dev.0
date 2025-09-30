Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 246F6CAC5BE
	for <igt-dev@archiver.kernel.org>; Tue, 30 Sep 2025 08:27:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B62710E53A;
	Tue, 30 Sep 2025 08:27:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WMcdnHzh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D83B10E529
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Sep 2025 08:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759220827; x=1790756827;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=oMU2rCM66ViQ7Sx4oZ2t37Ccvbrb/8zfdAKEtE6k/8g=;
 b=WMcdnHzhufuTF5wNtuDExwx31Nh1O7Ix46ouqWu87HzDcL+6aVMt4CS0
 faUisWAbVpWKAygs/Vi47BtmaPXD9jIo+hTXtiaTQthYxNPVHnz3qyrd0
 q2ADxfy0yg5Mvttx+02odq9SQ3IAq0SBgaOgBHO1RcLwJ8dPBHq8ww2gV
 gDcZmXJB0ZbNhNOEZigO9iBoDBeXiwtu5rMXBaO4KZckT26udrubbZwTs
 SMGo51WTXK4Eu909rpIjVcXLUDKxMXtk6tPCVqAZ79K0M/ooSypU0c62G
 E/HyEIGknS7HtZY/liH8xhYip+8g/nLTx8BPV933oE9VNw3Ape0j9i/+D Q==;
X-CSE-ConnectionGUID: 4kjSoTGEQ3ytP6SnpNFTCQ==
X-CSE-MsgGUID: p8sZdmv4RWanWn0EOoQoBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="72089597"
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; d="scan'208";a="72089597"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 01:27:07 -0700
X-CSE-ConnectionGUID: eXk7CG4ETai2wG3ukg9uwg==
X-CSE-MsgGUID: pPvMs/43QH+r2VOesX6Emg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; d="scan'208";a="215616250"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.152])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 01:27:06 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 6/6] tools/intel_vbt_decode: Decode the backlight
 control method type
In-Reply-To: <20250929192127.5865-7-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250929192127.5865-1-ville.syrjala@linux.intel.com>
 <20250929192127.5865-7-ville.syrjala@linux.intel.com>
Date: Tue, 30 Sep 2025 11:27:02 +0300
Message-ID: <9dd263be40ecff813e24240cfe166473c90fac0e@intel.com>
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

On Mon, 29 Sep 2025, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Decode the backlight control method type to a human readable form.
>
> TODO: looks like the we might not be handling some of this
>       correctly on the kernel side...
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tools/intel_vbt_decode.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> index 68d02aee9f5a..e42aed542612 100644
> --- a/tools/intel_vbt_decode.c
> +++ b/tools/intel_vbt_decode.c
> @@ -734,6 +734,17 @@ static const char * const i2c_speed_str[] =3D {
>  	[3] =3D "1 MHz",
>  };
>=20=20
> +static const char * const control_type_str[] =3D {
> +	[0] =3D "PMIC pin",
> +	[1] =3D "LPSS PWM",
> +	[2] =3D "PWM from Display Engine/Aux Default",
> +	[3] =3D "CABC/PWM From LCD Panel",

The spec says, "CABC method to control brightness/PWM From LCD Panel",
but feels like it's been butchered at some point. It's DSI DCS, right?
And it might or might not have CABC.

*shrug*

> +	[4] =3D "Panel driver interface",
> +	[5] =3D "Legacy VESA eDP AUX Interface",
> +	[6] =3D "PWM from Display Engine/VESA eDP1.5 SCR AUX Interface",
> +	[7] =3D "PWM from Display Engine/Custom eDP AUX Interface",
> +};
> +
>  static void dump_backlight_info(struct context *context,
>  				const struct bdb_block *block)
>  {
> @@ -782,7 +793,8 @@ static void dump_backlight_info(struct context *conte=
xt,
>=20=20
>  		control =3D &backlight->backlight_control[i];
>=20=20
> -		printf("\t\tControl type: %u\n", control->type);
> +		printf("\t\tControl type: %s (%u)\n",
> +		       to_str(control_type_str, control->type), control->type);
>  		printf("\t\tController: %u\n", control->controller);
>=20=20
>  		if (context->bdb->version < 234)

--=20
Jani Nikula, Intel
