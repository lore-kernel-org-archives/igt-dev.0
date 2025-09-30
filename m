Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9C4CAC5B9
	for <igt-dev@archiver.kernel.org>; Tue, 30 Sep 2025 08:20:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CAE110E291;
	Tue, 30 Sep 2025 08:20:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bv5Pmdff";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B412310E521
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Sep 2025 08:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759220434; x=1790756434;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=zZHUFL0Gw/C12YpHM2ADvgJj+psIe+y2IKLBNQsRtc8=;
 b=bv5PmdffP/zj1rI1l8+NYrEBeeJmd/pJvgWmp2fK3IsYZ02un7QHMtxU
 HqYWpQDhAqexPfM19UAlqugQyaPwCtFKxc6fTxBuZP1MYCZh0Cse7nZ06
 AzuzOnOzGrJclyMH6BbaN0d7MWhkAxnXXitJLnqbz6ITSvHIEXWvTLDMW
 UB0DOQdsPJE0YSG6o/zWTZyz9Dvu+GN9wmY6RcNlxA5zIq1HWP0ESmaIB
 laOiGFtCES/m5Ws+ZRNfWv2DwbSewlzM7kpUaAhKzaHnrkYZqIP/91MSD
 2cwMwpoCw0O2rmLbqe1n8aXpwpDHHpmFoTwzVi3j98AxCvfQF+qtXktn2 w==;
X-CSE-ConnectionGUID: aq8Uf1UESIi8BFhLoGmGPA==
X-CSE-MsgGUID: 0JLoL675RTa7HQWcWuPvBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="61360093"
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; d="scan'208";a="61360093"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 01:20:33 -0700
X-CSE-ConnectionGUID: Gw73eb5bRK2AexcKXndzSw==
X-CSE-MsgGUID: 9LEa1YfIRtCxLWitQQ3cVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; d="scan'208";a="178031691"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.152])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 01:20:32 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 3/6] tools/intel_vbt_decode: Convert eDP deocding
 to use to_str()
In-Reply-To: <20250929192127.5865-4-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250929192127.5865-1-ville.syrjala@linux.intel.com>
 <20250929192127.5865-4-ville.syrjala@linux.intel.com>
Date: Tue, 30 Sep 2025 11:20:30 +0300
Message-ID: <69ea0c1ab807fd42dc3d64c3e84a955740328e72@intel.com>
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
> Use to_str() when decoding a bunch of eDP related fields.

In the subject, *decoding

>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tools/intel_vbt_decode.c | 68 +++++++++++++++-------------------------
>  1 file changed, 25 insertions(+), 43 deletions(-)
>
> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> index 2f228fcd14b7..9fece741840b 100644
> --- a/tools/intel_vbt_decode.c
> +++ b/tools/intel_vbt_decode.c
> @@ -2347,6 +2347,23 @@ static void dump_tv_options(struct context *contex=
t,
>  	       to_str(underscan_overscan_str, tv->underscan_overscan_hdtv_compo=
nent));
>  }
>=20=20
> +static const char * const edp_bpp_str[] =3D {
> +	[EDP_18BPP] =3D "18 bpp",
> +	[EDP_24BPP] =3D "24 bpp",
> +	[EDP_30BPP] =3D "30 bpp",
> +};
> +
> +static const char * const edp_rate_str[] =3D {
> +	[EDP_RATE_1_62] =3D "1.62Gbps",
> +	[EDP_RATE_2_7] =3D "2.7Gbps",
> +	[EDP_RATE_5_4] =3D "5.4Gbps",
> +};
> +
> +static const char * const edp_preemph_str[] =3D {
> +	[0] =3D "Low power (200 mV)",
> +	[1] =3D "Default (400 mV)",
> +};
> +
>  static void dump_edp(struct context *context,
>  		     const struct bdb_block *block)
>  {
> @@ -2369,42 +2386,17 @@ static void dump_edp(struct context *context,
>=20=20
>  		bpp =3D panel_bits(edp->color_depth, i, 2);
>=20=20
> -		printf("\t\tPanel color depth: ");
> -		switch (bpp) {
> -		case EDP_18BPP:
> -			printf("18 bpp\n");
> -			break;
> -		case EDP_24BPP:
> -			printf("24 bpp\n");
> -			break;
> -		case EDP_30BPP:
> -			printf("30 bpp\n");
> -			break;
> -		default:
> -			printf("(unknown value %d)\n", bpp);
> -			break;
> -		}
> +		printf("\t\tPanel color depth: %s (0x%x)\n",
> +		       to_str(edp_bpp_str, bpp), bpp);
>=20=20
>  		msa =3D panel_bits(edp->sdrrs_msa_timing_delay, i, 2);
>  		printf("\t\teDP sDRRS MSA Delay: Lane %d\n", msa + 1);
>=20=20
>  		printf("\t\tFast link params:\n");
> -		printf("\t\t\trate: ");
> -		switch (edp->fast_link_params[i].rate) {
> -		case EDP_RATE_1_62:
> -			printf("1.62Gbps\n");
> -			break;
> -		case EDP_RATE_2_7:
> -			printf("2.7Gbpc\n");
> -			break;
> -		case EDP_RATE_5_4:
> -			printf("5.4Gbps\n");
> -			break;
> -		default:
> -			printf("(unknonn value %d)\n",
> -			       edp->fast_link_params[i].rate);
> -			break;
> -		}
> +		printf("\t\t\trate: %s (0x%x)\n",
> +		       to_str(edp_rate_str, edp->fast_link_params[i].rate),
> +		       edp->fast_link_params[i].rate);
> +
>  		printf("\t\t\tlanes: X%d\n",
>  		       edp->fast_link_params[i].lanes + 1);
>  		printf("\t\t\tpre-emphasis: %s (0x%x)\n",
> @@ -2425,18 +2417,8 @@ static void dump_edp(struct context *context,
>  		if (context->bdb->version >=3D 173) {
>  			int val =3D (edp->edp_vswing_preemph >> (i * 4)) & 0xf;
>=20=20
> -			printf("\t\tVswing/preemphasis table selection: ");
> -			switch (val) {
> -			case 0:
> -				printf("Low power (200 mV)\n");
> -				break;
> -			case 1:
> -				printf("Default (400 mV)\n");
> -				break;
> -			default:
> -				printf("(unknown value %d)\n", val);
> -				break;
> -			}
> +			printf("\t\tVswing/preemphasis table selection: %s (0x%x)\n",
> +			       to_str(edp_preemph_str, val), val);
>  		}
>=20=20
>  		if (context->bdb->version >=3D 182)

--=20
Jani Nikula, Intel
