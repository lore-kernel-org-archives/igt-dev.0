Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97BB3CD8CB2
	for <igt-dev@archiver.kernel.org>; Wed, 10 Jun 2026 14:43:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46B7010E9FD;
	Wed, 10 Jun 2026 14:43:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V/gGMmWP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10B2E10E9F1
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jun 2026 14:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781102584; x=1812638584;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=avbfwUrXp4QRnoXWBpLlzIUQvgkn5bibNn+eCr0YLd8=;
 b=V/gGMmWPdnjQTNHmLhTPZJB3XO3ocRxMcBe46M2W4L2xvtnFg3p6egQC
 KSf51kiYf3O0LmGBfh5BF56CduIoFBqiUrSAUdK6fojPl6hHpPRzHc3WK
 K9SfL2MTLd2M7Oc0XtncwpmZAbtRQcvi9JJEOoL/cLMyM8U9ZQpAhBXTM
 PmsWjAenMXeDZMj39dHF/LSPWZQqUAFmzhzbiy0sCf4hF/5RqHCFaEk+C
 YMuhS0guL1qddyCiibx8ihdPwuj6rU8RJd+20p4IFRN9laeI5JlL189VS
 2f1pW1m62JwIn/n24LTHAcDKD8RL+67TFmvdK3+llOF3rQDem8s5xFpJx Q==;
X-CSE-ConnectionGUID: WoS0YmBeS8uIV4vBJmARLA==
X-CSE-MsgGUID: guQdUBFrTjS5DrPuV4i/8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="85788475"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="85788475"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 07:43:04 -0700
X-CSE-ConnectionGUID: gKp96C+pTOqMnTOWjbKnrg==
X-CSE-MsgGUID: 7NsfFCZpS0Kp1HXXxgRJKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="246277125"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.244.3])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 07:43:02 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, =?utf-8?Q?Micha=C5=82?= Grzelak
 <michal.grzelak@intel.com>, ville.syrjala@linux.intel.com
Subject: Re: [PATCH i-g-t v2 5/8] tools/vbt_decode: guess devid from VBT
 signature
In-Reply-To: <20260608124121.3131410-6-michal.grzelak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260608124121.3131410-1-michal.grzelak@intel.com>
 <20260608124121.3131410-6-michal.grzelak@intel.com>
Date: Wed, 10 Jun 2026 17:42:58 +0300
Message-ID: <0996de35feb92695fa211aafb9adcdce7e770f50@intel.com>
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

On Mon, 08 Jun 2026, Micha=C5=82 Grzelak <michal.grzelak@intel.com> wrote:
> Nowadays Device ID needs to be passed to decode VBT precisely. VBT lacks
> it since VBT has been moved from PCI ROM into opregion.
>
> However we can narrow from which platform VBT originated basing on VBT
> signature.
>
> Add a command-line option to guess devid using VBT signature. Create an
> array of signatures and check if any of those is a substring of
> signature extracted from given VBT. Map each signature into first Device
> ID of a platform picked from include/drm/intel/pciids.h. Log that devid
> has not been matched if signature is not found.
>
> Note that the platform-specific name should appear after "$VBT ", hence
> the match.
>
> Suggested-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Micha=C5=82 Grzelak <michal.grzelak@intel.com>
> ---
>  tools/intel_vbt_decode.c | 36 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 35 insertions(+), 1 deletion(-)
>
> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> index 5681643f4b..ec82b00939 100644
> --- a/tools/intel_vbt_decode.c
> +++ b/tools/intel_vbt_decode.c
> @@ -77,6 +77,7 @@ struct context {
>  	uint32_t devid;
>  	int panel_type, panel_type2;
>  	int sdvo_panel_type;
> +	bool devid_from_signature;
>  	bool dump_all_panel_types;
>  	bool hexdump;
>  };
> @@ -3693,6 +3694,31 @@ static int get_sdvo_panel_type(struct context *con=
text)
>  	return panel_type;
>  }
>=20=20
> +static int
> +get_devid_from_signature(const char *vbt_signature)
> +{
> +	int i;
> +
> +	const char *signature[] =3D {"PANTHERLAKE",
> +				   "LUNARLAKE",
> +				   "METEORLAKE",
> +				   "JASPERLAKE",
> +				   NULL};
> +
> +	int devid[] =3D {0xB080, /* PTL */
> +		       0x6420, /* LNL */
> +		       0x7D40, /* MTL */
> +		       0x4E51, /* JSL */
> +		       0x0};

Please use a struct, something along the lines of:

	static const struct {
		const char *signature;
		uint16_t devid;
	} devids[] =3D {
		{ .signature =3D "PANTHERLAKE", .devid =3D 0xb080, },
		...
	};

Then you can also ditch the /* PTL */ etc. comments.

> +
> +	for (i =3D 0; signature[i]; i++)
> +		if (strstr(vbt_signature, signature[i]))
> +			return devid[i];
> +
> +	fprintf(stderr, "Warning: cannot find devid for signature %s\n", vbt_si=
gnature);

This should be a fallback, please don't warn anything here. Only one
warning for the whole devid thing.

> +	return 0;
> +}
> +
>  static int
>  get_device_id(unsigned char *bios, int size)
>  {
> @@ -4108,6 +4134,7 @@ enum opt {
>  	OPT_PANEL_TYPE2,
>  	OPT_PANEL_EDID,
>  	OPT_PANEL_EDID2,
> +	OPT_VBT_DEVID,
>  	OPT_ALL_PANELS,
>  	OPT_HEXDUMP,
>  	OPT_BLOCK,
> @@ -4162,6 +4189,8 @@ int main(int argc, char **argv)
>  		{ "panel-edid",	required_argument,	NULL,	OPT_PANEL_EDID },
>  		{ "panel-type2",	required_argument,	NULL,	OPT_PANEL_TYPE2 },
>  		{ "panel-edid2",	required_argument,	NULL,	OPT_PANEL_EDID2 },
> +		{ "devid-from-signature",
> +				no_argument,		NULL,	OPT_VBT_DEVID },
>  		{ "all-panels",	no_argument,		NULL,	OPT_ALL_PANELS },
>  		{ "hexdump",	no_argument,		NULL,	OPT_HEXDUMP },
>  		{ "block",	required_argument,	NULL,	OPT_BLOCK },
> @@ -4207,6 +4236,9 @@ int main(int argc, char **argv)
>  		case OPT_PANEL_EDID2:
>  			panel_edid2 =3D optarg;
>  			break;
> +		case OPT_VBT_DEVID:
> +			context.devid_from_signature =3D true;
> +			break;
>  		case OPT_ALL_PANELS:
>  			context.dump_all_panel_types =3D true;
>  			break;
> @@ -4313,6 +4345,8 @@ int main(int argc, char **argv)
>  	context.bdb =3D (const struct bdb_header *)(VBIOS + bdb_off);
>  	context.size =3D size;
>=20=20
> +	if (!context.devid && context.devid_from_signature)
> +		context.devid =3D get_devid_from_signature((char *) vbt->signature);

This should be last. The priority should be:

	1. command-line, if set
	2. environment variable, if set
	3. VBIOS, if available
	4. deduce from signature, if requested

Come to think of it, not sure about the "if requested". Maybe just use
it if not otherwise specified. This is userspace decoding, not kernel,
after all.

Ville, thoughts?

>  	if (!context.devid) {
>  		const char *devid_string =3D getenv("DEVICE");
>  		if (devid_string) {
> @@ -4326,7 +4360,7 @@ int main(int argc, char **argv)
>  	if (!context.devid)
>  		context.devid =3D get_device_id(VBIOS, size);
>  	if (!context.devid)
> -		fprintf(stderr, "Warning: could not find PCI device ID!\n");
> +		fprintf(stderr, "Warning: could not find PCI device ID! Use --devid or=
 --devid-from-signature\n");
>=20=20
>  	if (context.panel_type =3D=3D -1)
>  		context.panel_type =3D get_panel_type(&context, false);

--=20
Jani Nikula, Intel
