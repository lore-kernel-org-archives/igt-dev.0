Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44862C25B75
	for <igt-dev@archiver.kernel.org>; Fri, 31 May 2024 14:48:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 598FD10E1F8;
	Fri, 31 May 2024 14:48:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b+yyit6o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7107110E1F8
 for <igt-dev@lists.freedesktop.org>; Fri, 31 May 2024 14:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717166908; x=1748702908;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=p8BTCbmuXXokfcxImt/gWx9blLvqi4WLa6bR/sCPspU=;
 b=b+yyit6op6H8OZ37GDu8HR2TJJLrubVdm5TP5p1gdha5nadmLmcyszqY
 PPA9tFktLejKD4I6kRSRxtMcUkHvnhVM4X8juWGF7wdro9+cTxq1s+Cs7
 w89BYLi9E3RCwGY4hN7GMUtw78siQyGo2FaW8l8YGFGAw9AXKuB25cuo/
 bl2j6rOm6VlFeAEwrxgnG1WhuitxJDf/qm0eXoaXVuxz65gvwcrA0/joB
 mcLVpGTN87oTNZSbqila1dZCWKdqrX2c6ppoDjRq56KA3byFiZTGGK43u
 uaiqDLzI85RcIFhcogJ+HlCazB0Do+6s3hTC5oSzCoaJwq3wgUBJl2J6j Q==;
X-CSE-ConnectionGUID: S5s16YtmR/684tgz2i8xrw==
X-CSE-MsgGUID: wV510uMsROiMmh/KWySTdA==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="25114980"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="25114980"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 07:48:27 -0700
X-CSE-ConnectionGUID: McJxAIv5SzGO2LVd8jNUoA==
X-CSE-MsgGUID: 2ljSxvs3QXa2BOd8wx+HXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="40631313"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.190])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 07:48:26 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 09/20] tools/intel_vbt_decode: Extract dump_pnp_id()
In-Reply-To: <20240531142354.16528-10-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240531142354.16528-1-ville.syrjala@linux.intel.com>
 <20240531142354.16528-10-ville.syrjala@linux.intel.com>
Date: Fri, 31 May 2024 17:48:21 +0300
Message-ID: <87jzjadolm.fsf@intel.com>
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

On Fri, 31 May 2024, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Several different VBT blocks contain PnP IDs. Extract the
> helper to dump them out.

Just nitpicking inline, can be fixed in follow-up. The patch is an
improvement as-is.

>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tools/intel_vbt_decode.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
>
> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> index 6cf6d471b5e2..2a11490eed22 100644
> --- a/tools/intel_vbt_decode.c
> +++ b/tools/intel_vbt_decode.c
> @@ -1394,6 +1394,18 @@ static char *decode_pnp_id(u16 mfg_name, char str[=
4])
>  	return str;
>  }
>=20=20
> +static void dump_pnp_id(const struct bdb_edid_pnp_id *pnp_id)

Maybe pass prefix or indent level?

> +{
> +	char mfg[4];
> +
> +	printf("\t\t  Mfg name: %s (0x%x)\n",
> +	       decode_pnp_id(pnp_id->mfg_name, mfg), pnp_id->mfg_name);
> +	printf("\t\t  Product code: %u\n", pnp_id->product_code);
> +	printf("\t\t  Serial: %u\n", pnp_id->serial);
> +	printf("\t\t  Mfg week: %d\n", pnp_id->mfg_week);
> +	printf("\t\t  Mfg year: %d\n", 1990 + pnp_id->mfg_year);

These could be improved to match spec (see decode_date() in kernel
drm_edid.c).

> +}
> +
>  static void dump_lfp_data(struct context *context,
>  			  const struct bdb_block *block)
>  {
> @@ -1419,7 +1431,6 @@ static void dump_lfp_data(struct context *context,
>  			block_data(block) + ptrs->ptr[i].panel_pnp_id.offset;
>  		const struct bdb_lfp_data_tail *tail =3D
>  			block_data(block) + ptrs->panel_name.offset;
> -		char mfg[4];
>=20=20
>  		if (!dump_panel(context, i))
>  			continue;
> @@ -1457,12 +1468,7 @@ static void dump_lfp_data(struct context *context,
>  		       "BAD!" : "good");
>=20=20
>  		printf("\t\tPnP ID:\n");

I'd do this in dump_pnp_id() too.

> -		printf("\t\t  Mfg name: %s (0x%x)\n",
> -		       decode_pnp_id(pnp_id->mfg_name, mfg), pnp_id->mfg_name);
> -		printf("\t\t  Product code: %u\n", pnp_id->product_code);
> -		printf("\t\t  Serial: %u\n", pnp_id->serial);
> -		printf("\t\t  Mfg week: %d\n", pnp_id->mfg_week);
> -		printf("\t\t  Mfg year: %d\n", 1990 + pnp_id->mfg_year);
> +		dump_pnp_id(pnp_id);
>=20=20
>  		if (!ptrs->panel_name.table_size)
>  			continue;

--=20
Jani Nikula, Intel
