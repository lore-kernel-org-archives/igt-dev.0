Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10518C54E64
	for <igt-dev@archiver.kernel.org>; Mon, 25 Mar 2024 14:56:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C488210E96B;
	Mon, 25 Mar 2024 14:56:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SnR0W6Nq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B53B610E98C
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2024 14:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711378613; x=1742914613;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=l0vJe07O+1MEdJCRTPcuX7RstkL6vSh6FQIPrGazsh4=;
 b=SnR0W6NqSDqIdoBbk4ZTXEwcaoPwJHET4H9cUzKKhzC7Jd2I3MJxSSf0
 2pncSkrmF7xc5lxzt2UDRZ/HUq7dl/uv7p31CZ0uUOiSzQTY7aVtJJ0J5
 XTs31/RvNV3Wd3G5ld+dfAIiuaWj4obLS8E3tcg7zYbbAzidX7tnU9SrR
 ZnLhVvo7SWrs1Gi3rAD209BnHyV17QCnUOKq8Th6jNJ5hcLYkOdEWjlxM
 nwOECTsVyUtuLVZ2f3hYBkvg8iYnHal0O+FLqu5X0EQk5g5eO9UoquioB
 ob3dPBYZxK90hz64HnkfcnLRu1wQ2fC/S77Qakwg4aMmDYZHEuXxZJtHn Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="17820484"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="17820484"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 07:56:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="20330216"
Received: from idirlea-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.171])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 07:56:51 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/5] tools/intel_vbt_decode: Extract panel_str()
In-Reply-To: <20240322163251.11102-3-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240322163251.11102-1-ville.syrjala@linux.intel.com>
 <20240322163251.11102-3-ville.syrjala@linux.intel.com>
Date: Mon, 25 Mar 2024 16:56:48 +0200
Message-ID: <87plviiclr.fsf@intel.com>
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
> Extract the code to generate the palen=3D=3Dpanel_type indicator
> string to a small helper.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  tools/intel_vbt_decode.c | 29 +++++++++++++++--------------
>  1 file changed, 15 insertions(+), 14 deletions(-)
>
> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> index 9a65a67b42bf..2473812cca6d 100644
> --- a/tools/intel_vbt_decode.c
> +++ b/tools/intel_vbt_decode.c
> @@ -90,6 +90,11 @@ static bool dump_panel(const struct context *context, =
int panel_type)
>  		context->dump_all_panel_types;
>  }
>=20=20
> +static const char *panel_str(const struct context *context, int panel_ty=
pe)
> +{
> +	return panel_type =3D=3D context->panel_type ? " *" : "";
> +}
> +
>  /* Get BDB block size given a pointer to Block ID. */
>  static uint32_t _get_blocksize(const uint8_t *block_base)
>  {
> @@ -616,8 +621,7 @@ static void dump_backlight_info(struct context *conte=
xt,
>  		if (!dump_panel(context, i))
>  			continue;
>=20=20
> -		printf("\tPanel %d%s\n", i,
> -		       context->panel_type =3D=3D i ? " *" : "");
> +		printf("\tPanel %d%s\n", i, panel_str(context, i));
>=20=20
>  		blc =3D &backlight->data[i];
>=20=20
> @@ -1231,7 +1235,7 @@ static void dump_lvds_options(struct context *conte=
xt,
>  		if (!dump_panel(context, i))
>  			continue;
>=20=20
> -		printf("\tPanel %d%s\n", i, context->panel_type =3D=3D i ? " *" : "");
> +		printf("\tPanel %d%s\n", i, panel_str(context, i));
>=20=20
>  		val =3D panel_bits(options->lvds_panel_channel_bits, i, 2);
>  		printf("\t\tChannel type: %s (0x%x)\n",
> @@ -1298,7 +1302,7 @@ static void dump_lvds_ptr_data(struct context *cont=
ext,
>  		if (!dump_panel(context, i))
>  			continue;
>=20=20
> -		printf("\tPanel %d%s\n", i, context->panel_type =3D=3D i ? " *" : "");
> +		printf("\tPanel %d%s\n", i, panel_str(context, i));
>=20=20
>  		if (ptrs->lvds_entries >=3D 1) {
>  			printf("\t\tFP timing offset: %d\n",
> @@ -1381,7 +1385,7 @@ static void dump_lvds_data(struct context *context,
>  		vtotal =3D vdisplay + _V_BLANK(timing_data);
>  		clock =3D _PIXEL_CLOCK(timing_data) / 1000;
>=20=20
> -		printf("\tPanel %d%s\n", i, context->panel_type =3D=3D i ? " *" : "");
> +		printf("\tPanel %d%s\n", i, panel_str(context, i));
>  		printf("\t\t%dx%d clock %d\n",
>  		       fp_timing->x_res, fp_timing->y_res,
>  		       _PIXEL_CLOCK(timing_data));
> @@ -1580,7 +1584,7 @@ static void dump_edp(struct context *context,
>  		if (!dump_panel(context, i))
>  			continue;
>=20=20
> -		printf("\tPanel %d%s\n", i, context->panel_type =3D=3D i ? " *" : "");
> +		printf("\tPanel %d%s\n", i, panel_str(context, i));
>=20=20
>  		printf("\t\tPower Sequence: T3 %d T7 %d T9 %d T10 %d T12 %d\n",
>  		       edp->power_seqs[i].t3,
> @@ -1723,7 +1727,7 @@ static void dump_psr(struct context *context,
>  		if (!dump_panel(context, i))
>  			continue;
>=20=20
> -		printf("\tPanel %d%s\n", i, context->panel_type =3D=3D i ? " *" : "");
> +		printf("\tPanel %d%s\n", i, panel_str(context, i));
>=20=20
>  		printf("\t\tFull link: %s\n", YESNO(psr->full_link));
>  		printf("\t\tRequire AUX to wakeup: %s\n", YESNO(psr->require_aux_to_wa=
keup));
> @@ -1800,7 +1804,7 @@ static void dump_lfp_power(struct context *context,
>  		if (!dump_panel(context, i))
>  			continue;
>=20=20
> -		printf("\tPanel %d%s\n", i, context->panel_type =3D=3D i ? " *" : "");
> +		printf("\tPanel %d%s\n", i, panel_str(context, i));
>=20=20
>  		printf("\t\tDisplay Power Saving Technology (DPST): %s\n",
>  		       YESNO(panel_bool(lfp_block->dpst, i)));
> @@ -1932,8 +1936,7 @@ static void dump_mipi_config(struct context *contex=
t,
>  		if (!dump_panel(context, i))
>  			continue;
>=20=20
> -		printf("\tPanel %d%s\n", i,
> -		       context->panel_type =3D=3D i ? " *" : "");
> +		printf("\tPanel %d%s\n", i, panel_str(context, i));
>=20=20
>  		printf("\t\tGeneral Param\n");
>  		printf("\t\t\t BTA disable: %s\n", config->bta ? "Disabled" : "Enabled=
");
> @@ -2386,8 +2389,7 @@ static void dump_mipi_sequence(struct context *cont=
ext,
>  		if (!data)
>  			return;
>=20=20
> -		printf("\tPanel %d%s\n", i,
> -		       context->panel_type =3D=3D i ? " *" : "");
> +		printf("\tPanel %d%s\n", i, panel_str(context, i));
>=20=20
>  		/* Parse the sequences. Corresponds to VBT parsing in the kernel. */
>  		for (;;) {
> @@ -2476,8 +2478,7 @@ static void dump_compression_parameters(struct cont=
ext *context,
>  		if (!dump_panel(context, i))
>  			continue;
>=20=20
> -		printf("\tDSC block %d%s\n", i,
> -		       i =3D=3D context->panel_type ? " *" : "");
> +		printf("\tDSC block %d%s\n", i, panel_str(context, i));
>  		printf("\t\tDSC version: %u.%u\n", data->version_major,
>  		       data->version_minor);
>  		printf("\t\tActual buffer size: %d\n",

--=20
Jani Nikula, Intel
