Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71BD3C54E58
	for <igt-dev@archiver.kernel.org>; Mon, 25 Mar 2024 15:05:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B46310E948;
	Mon, 25 Mar 2024 15:05:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="abXVuzkw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A65510E948
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2024 15:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711379102; x=1742915102;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=36cQz5Lh8ucYjY46xfUvMTYGhwghNlbVvhUOJoFM22M=;
 b=abXVuzkwDY8PkTDNh2fhf2kGj1W2sOOx1EPlAgX31pOMHTlBPhxcHQBH
 uzb5mrcuyQUEyFDktJP0QlKvwMedMmOF9179kXNmcDuFuO4OO6G7gxNrG
 Rp31uc0iAJRueDzvMQcmfx6F02daSMB/xYXdhlHRkes2jjcZ+QK04Hrl9
 VEgc6LsIiJGP7cuLoxuPlDCMPxGl0l6+9Kgh1harBFRh+iwLsgkp7hZo8
 +xR5UDRjOxELtRVS0kykBtD9nixmood+YebRaKp19mn3Nuebbidodl8t9
 wxen5kqEwYokk5JSDCmdMvJUhWjGevB0mbnVHtQvtIni+UBMp5c/7SRHL w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="6598003"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="6598003"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 08:04:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="15511396"
Received: from idirlea-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.171])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 08:04:44 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 4/5] tools/intel_vbt_decode: Also dump the second
 panel (panel_type2)
In-Reply-To: <20240322163251.11102-5-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240322163251.11102-1-ville.syrjala@linux.intel.com>
 <20240322163251.11102-5-ville.syrjala@linux.intel.com>
Date: Mon, 25 Mar 2024 17:04:40 +0200
Message-ID: <87jzlqic8n.fsf@intel.com>
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
> Modern VBTs can declare two panel types in order to support
> dual panel systems. Dump the panel information for the second
> panel as well. Since panel_type2 could also be declared as 255
> (=3D=3D match pnpid to EDID) we also add a new command line knob
> to select panel_type2 by hand.
>
> Data for the second panel will be indicated by "(2)", as opposed
> to "(1)" for the first panel.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tools/intel_vbt_decode.c | 38 ++++++++++++++++++++++++++++++++------
>  1 file changed, 32 insertions(+), 6 deletions(-)
>
> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> index 98f64d0822c6..f223ce2bf5a1 100644
> --- a/tools/intel_vbt_decode.c
> +++ b/tools/intel_vbt_decode.c
> @@ -79,7 +79,7 @@ struct context {
>  	int size;
>=20=20
>  	uint32_t devid;
> -	int panel_type;
> +	int panel_type, panel_type2;
>  	bool dump_all_panel_types;
>  	bool hexdump;
>  };
> @@ -87,12 +87,16 @@ struct context {
>  static bool dump_panel(const struct context *context, int panel_type)
>  {
>  	return panel_type =3D=3D context->panel_type ||
> +		panel_type =3D=3D context->panel_type2 ||
>  		context->dump_all_panel_types;
>  }
>=20=20
>  static const char *panel_str(const struct context *context, int panel_ty=
pe)
>  {
> -	return panel_type =3D=3D context->panel_type ? " (1)" : "";
> +	return panel_type =3D=3D context->panel_type &&
> +		panel_type =3D=3D context->panel_type2 ? " (1)(2)" :
> +		panel_type =3D=3D context->panel_type ? " (1)" :
> +		panel_type =3D=3D context->panel_type2 ? " (2)" : "";

This might be better broken down to regular if statements for clarity.

Please clue me in, when is it possible for both panel types to match?


Other than that,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


>  }
>=20=20
>  /* Get BDB block size given a pointer to Block ID. */
> @@ -2503,18 +2507,21 @@ static void dump_compression_parameters(struct co=
ntext *context,
>  }
>=20=20
>  /* get panel type from lvds options block, or -1 if block not found */
> -static int get_panel_type(struct context *context)
> +static int get_panel_type(struct context *context, bool is_panel_type2)
>  {
>  	struct bdb_block *block;
>  	const struct bdb_lvds_options *options;
> -	int panel_type;
> +	int panel_type =3D -1;
>=20=20
>  	block =3D find_section(context, BDB_LVDS_OPTIONS);
>  	if (!block)
>  		return -1;
>=20=20
>  	options =3D block_data(block);
> -	panel_type =3D options->panel_type;
> +	if (!is_panel_type2)
> +		panel_type =3D options->panel_type;
> +	else if (context->bdb->version >=3D 212)
> +		panel_type =3D options->panel_type2;
>=20=20
>  	free(block);
>=20=20
> @@ -2776,6 +2783,7 @@ enum opt {
>  	OPT_FILE,
>  	OPT_DEVID,
>  	OPT_PANEL_TYPE,
> +	OPT_PANEL_TYPE2,
>  	OPT_ALL_PANELS,
>  	OPT_HEXDUMP,
>  	OPT_BLOCK,
> @@ -2812,6 +2820,7 @@ int main(int argc, char **argv)
>  	int size;
>  	struct context context =3D {
>  		.panel_type =3D -1,
> +		.panel_type2 =3D -1,
>  	};
>  	char *endp;
>  	int block_number =3D -1;
> @@ -2821,6 +2830,7 @@ int main(int argc, char **argv)
>  		{ "file",	required_argument,	NULL,	OPT_FILE },
>  		{ "devid",	required_argument,	NULL,	OPT_DEVID },
>  		{ "panel-type",	required_argument,	NULL,	OPT_PANEL_TYPE },
> +		{ "panel-type2",	required_argument,	NULL,	OPT_PANEL_TYPE2 },
>  		{ "all-panels",	no_argument,		NULL,	OPT_ALL_PANELS },
>  		{ "hexdump",	no_argument,		NULL,	OPT_HEXDUMP },
>  		{ "block",	required_argument,	NULL,	OPT_BLOCK },
> @@ -2852,6 +2862,14 @@ int main(int argc, char **argv)
>  				return EXIT_FAILURE;
>  			}
>  			break;
> +		case OPT_PANEL_TYPE2:
> +			context.panel_type2 =3D strtoul(optarg, &endp, 0);
> +			if (*endp || context.panel_type2 > 15) {
> +				fprintf(stderr, "invalid panel type2 '%s'\n",
> +					optarg);
> +				return EXIT_FAILURE;
> +			}
> +			break;
>  		case OPT_ALL_PANELS:
>  			context.dump_all_panel_types =3D true;
>  			break;
> @@ -2969,12 +2987,20 @@ int main(int argc, char **argv)
>  		fprintf(stderr, "Warning: could not find PCI device ID!\n");
>=20=20
>  	if (context.panel_type =3D=3D -1)
> -		context.panel_type =3D get_panel_type(&context);
> +		context.panel_type =3D get_panel_type(&context, false);
>  	if (context.panel_type =3D=3D -1) {
>  		fprintf(stderr, "Warning: panel type not set, using 0\n");
>  		context.panel_type =3D 0;
>  	}
>=20=20
> +	if (context.panel_type2 =3D=3D -1)
> +		context.panel_type2 =3D get_panel_type(&context, true);
> +	if (context.panel_type2 !=3D -1 && context.bdb->version < 212) {
> +		fprintf(stderr, "Warning: panel type2 not valid for BDB version %d\n",
> +			context.bdb->version);
> +		context.panel_type2 =3D -1;
> +	}
> +
>  	if (describe) {
>  		print_description(&context);
>  	} else if (header_only) {

--=20
Jani Nikula, Intel
