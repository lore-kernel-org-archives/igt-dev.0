Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E8E4C27C75
	for <igt-dev@archiver.kernel.org>; Thu, 13 Jun 2024 09:13:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D18A10E04C;
	Thu, 13 Jun 2024 09:13:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DVAVeFor";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAF0E10E04C
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jun 2024 09:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718270021; x=1749806021;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=c+P7QgwQbPRZDJ2W06gTO0Tu+Mbqb8qMoke9bLba2OY=;
 b=DVAVeForwPE9upkyfSH1C+Pgy73n+jWU2GNh5B4HLieUZ130Z8j9pMMp
 ATTOLh7fWkQ2lPl+UjjgdGAt2U1zEX2uT7vrt9dn8Ydhg6V5lnrdv7QQs
 R4/+TKGCDsqEaB2VokW/6cQ5n20WkT/IjR/VMI+KvhpnHqkVTqeJi8RSu
 LkNYQkqCVHUoOlYrEvk/GGKCOza0QZcw9rs+ueDAY1F/r6MUPwSpRSEF7
 X8QKQ1FvQdpSOWga4775CAyFHoV4+aGg3Qui253iezQB3XzTnfy8e5AXq
 gEdHuoVIdiwSuDl4jm4+6EMNEZn8jfjJ8lHXPvfm5MZelKRWt/+Q+opDN A==;
X-CSE-ConnectionGUID: LxcyydqWRAmp46qIZLwlLw==
X-CSE-MsgGUID: AWLGltLFQQiHxdEfUa+6Ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="18901722"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="18901722"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 02:13:41 -0700
X-CSE-ConnectionGUID: BnZ0KQvjTDysgw/ZaPGMOg==
X-CSE-MsgGUID: Zxzt3eDmRg2jEVie5FXrxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="44614768"
Received: from iklimasz-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.112])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 02:13:40 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 03/27] tools/intel_vbt_decode: Dump MIPI config
 for the correct panel
In-Reply-To: <20240607135758.31421-4-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240607135758.31421-1-ville.syrjala@linux.intel.com>
 <20240607135758.31421-4-ville.syrjala@linux.intel.com>
Date: Thu, 13 Jun 2024 12:13:36 +0300
Message-ID: <87r0d1i4sf.fsf@intel.com>
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

On Fri, 07 Jun 2024, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Currently dump_mipi_config() just dumps the data for the same
> panel index six times. Actually dump the data for each of the
> six possible panels as intended.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Whoops,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> ---
>  tools/intel_vbt_decode.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> index 40c05fbadacb..cee1d5196a9a 100644
> --- a/tools/intel_vbt_decode.c
> +++ b/tools/intel_vbt_decode.c
> @@ -2016,12 +2016,9 @@ static void dump_mipi_config(struct context *conte=
xt,
>  	const struct bdb_mipi_config *start =3D block_data(block);
>=20=20
>  	for (int i =3D 0; i < ARRAY_SIZE(start->config); i++) {
> -		const struct mipi_config *config =3D
> -			&start->config[context->panel_type];
> -		const struct mipi_pps_data *pps =3D
> -			&start->pps[context->panel_type];
> -		const struct edp_pwm_delays *pwm_delays =3D
> -			&start->pwm_delays[context->panel_type];
> +		const struct mipi_config *config =3D &start->config[i];
> +		const struct mipi_pps_data *pps =3D &start->pps[i];
> +		const struct edp_pwm_delays *pwm_delays =3D &start->pwm_delays[i];
>=20=20
>  		if (!dump_panel(context, i))
>  			continue;

--=20
Jani Nikula, Intel
