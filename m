Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386CEC54E64
	for <igt-dev@archiver.kernel.org>; Mon, 25 Mar 2024 14:56:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E609D10E965;
	Mon, 25 Mar 2024 14:56:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cF/wooLs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A14BA10E965
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2024 14:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711378591; x=1742914591;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=zScV8yN76YGJv35X06kRrQpfJNlUE0eFRo9+Nqc2r+c=;
 b=cF/wooLsj3cwvtD3dXhlcNfu2KYovB/qQmYjOUuUPS2DnmlOcn9AMp/K
 OVvmtPPrOeOxr5Oa1o4QmGiiqMK++9jgMbJCqIjPsq0QIHMEsCeteMNvM
 0j8ITxIZpwFcyy/bhXoPBL5mv6iBr5Jh24tSGn1DxbYHnE2QTY6tpJbir
 Al34fG5aNT3FS6OGblYy/ZrTozuDEwZxrLV5Nb89DJyY5o8XlGoym0OTs
 Je95oSU/7obM6yzZJAMboK47LijdcWbE2MYl0Xjj3YawlMGS8KH3ckmQm
 p4+8cmkVQZZ+pP64hJ0VNlxiTffhy3gEh2tkqO3P1/KeK0hNwHwaRW8u0 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="6281787"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="6281787"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 07:56:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="15669677"
Received: from idirlea-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.171])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 07:56:29 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/5] tools/intel_vbt_decode: Extract dump_panel()
In-Reply-To: <20240322163251.11102-2-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240322163251.11102-1-ville.syrjala@linux.intel.com>
 <20240322163251.11102-2-ville.syrjala@linux.intel.com>
Date: Mon, 25 Mar 2024 16:56:27 +0200
Message-ID: <87sf0eicmc.fsf@intel.com>
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
> Pull the repeated "dump this panel?" expression
> into a small helper.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  tools/intel_vbt_decode.c | 26 ++++++++++++++++----------
>  1 file changed, 16 insertions(+), 10 deletions(-)
>
> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> index fd8118772845..9a65a67b42bf 100644
> --- a/tools/intel_vbt_decode.c
> +++ b/tools/intel_vbt_decode.c
> @@ -84,6 +84,12 @@ struct context {
>  	bool hexdump;
>  };
>=20=20
> +static bool dump_panel(const struct context *context, int panel_type)
> +{
> +	return panel_type =3D=3D context->panel_type ||
> +		context->dump_all_panel_types;
> +}
> +
>  /* Get BDB block size given a pointer to Block ID. */
>  static uint32_t _get_blocksize(const uint8_t *block_base)
>  {
> @@ -607,7 +613,7 @@ static void dump_backlight_info(struct context *conte=
xt,
>  	}
>=20=20
>  	for (i =3D 0; i < ARRAY_SIZE(backlight->data); i++) {
> -		if (i !=3D context->panel_type && !context->dump_all_panel_types)
> +		if (!dump_panel(context, i))
>  			continue;
>=20=20
>  		printf("\tPanel %d%s\n", i,
> @@ -1222,7 +1228,7 @@ static void dump_lvds_options(struct context *conte=
xt,
>  	for (int i =3D 0; i < 16; i++) {
>  		unsigned int val;
>=20=20
> -		if (i !=3D context->panel_type && !context->dump_all_panel_types)
> +		if (!dump_panel(context, i))
>  			continue;
>=20=20
>  		printf("\tPanel %d%s\n", i, context->panel_type =3D=3D i ? " *" : "");
> @@ -1289,7 +1295,7 @@ static void dump_lvds_ptr_data(struct context *cont=
ext,
>  	printf("\tNumber of entries: %d\n", ptrs->lvds_entries);
>=20=20
>  	for (int i =3D 0; i < 16; i++) {
> -		if (i !=3D context->panel_type && !context->dump_all_panel_types)
> +		if (!dump_panel(context, i))
>  			continue;
>=20=20
>  		printf("\tPanel %d%s\n", i, context->panel_type =3D=3D i ? " *" : "");
> @@ -1361,7 +1367,7 @@ static void dump_lvds_data(struct context *context,
>  			block_data(block) + ptrs->panel_name.offset;
>  		char mfg[4];
>=20=20
> -		if (i !=3D context->panel_type && !context->dump_all_panel_types)
> +		if (!dump_panel(context, i))
>  			continue;
>=20=20
>  		hdisplay =3D _H_ACTIVE(timing_data);
> @@ -1571,7 +1577,7 @@ static void dump_edp(struct context *context,
>  	int i;
>=20=20
>  	for (i =3D 0; i < 16; i++) {
> -		if (i !=3D context->panel_type && !context->dump_all_panel_types)
> +		if (!dump_panel(context, i))
>  			continue;
>=20=20
>  		printf("\tPanel %d%s\n", i, context->panel_type =3D=3D i ? " *" : "");
> @@ -1714,7 +1720,7 @@ static void dump_psr(struct context *context,
>  	for (i =3D 0; i < 16; i++) {
>  		const struct psr_table *psr =3D &psr_block->psr_table[i];
>=20=20
> -		if (i !=3D context->panel_type && !context->dump_all_panel_types)
> +		if (!dump_panel(context, i))
>  			continue;
>=20=20
>  		printf("\tPanel %d%s\n", i, context->panel_type =3D=3D i ? " *" : "");
> @@ -1791,7 +1797,7 @@ static void dump_lfp_power(struct context *context,
>  		return;
>=20=20
>  	for (i =3D 0; i < 16; i++) {
> -		if (i !=3D context->panel_type && !context->dump_all_panel_types)
> +		if (!dump_panel(context, i))
>  			continue;
>=20=20
>  		printf("\tPanel %d%s\n", i, context->panel_type =3D=3D i ? " *" : "");
> @@ -1923,7 +1929,7 @@ static void dump_mipi_config(struct context *contex=
t,
>  		const struct edp_pwm_delays *pwm_delays =3D
>  			&start->pwm_delays[context->panel_type];
>=20=20
> -		if (i !=3D context->panel_type && !context->dump_all_panel_types)
> +		if (!dump_panel(context, i))
>  			continue;
>=20=20
>  		printf("\tPanel %d%s\n", i,
> @@ -2372,7 +2378,7 @@ static void dump_mipi_sequence(struct context *cont=
ext,
>  		uint32_t seq_size;
>  		int index =3D 0;
>=20=20
> -		if (i !=3D context->panel_type && !context->dump_all_panel_types)
> +		if (!dump_panel(context, i))
>  			continue;
>=20=20
>  		data =3D find_panel_sequence_block(sequence, i,
> @@ -2467,7 +2473,7 @@ static void dump_compression_parameters(struct cont=
ext *context,
>  		/* FIXME: need to handle sizeof(*data) !=3D dsc->entry_size */
>  		data =3D &dsc->data[i];
>=20=20
> -		if (i !=3D context->panel_type && !context->dump_all_panel_types)
> +		if (!dump_panel(context, i))
>  			continue;
>=20=20
>  		printf("\tDSC block %d%s\n", i,

--=20
Jani Nikula, Intel
