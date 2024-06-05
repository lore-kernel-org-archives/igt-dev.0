Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB018C27C5E
	for <igt-dev@archiver.kernel.org>; Wed,  5 Jun 2024 11:41:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6A9710E53B;
	Wed,  5 Jun 2024 11:41:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V8rhFTaZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB76610E26A
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jun 2024 11:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717587702; x=1749123702;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=wUCfGHr1Ok/ckFN1vWkkC8eGvu0yDGYb/ZTv2CL1r24=;
 b=V8rhFTaZzrrO8jx/kTxdl6N5EvX/N9gr35ijJMaiFgTCk/d1B54XZGra
 85PXQmzvsPn6PM3XX+oDhlEPh1TujJQu+AHsPHYRQYqto51MhPBR2YkqS
 h4puaulOedzLJnYfZJzpJWjQfGOTUn4DZ+wOdR9Xhs7M6s7yjIQDLawxg
 s4lP0gg+2LFiSENsxi0kSRmcJ3fz4Ddjk/K1YSWlp8WLuBZXWTih57UxV
 wBOICL1kEwiaru/DjyLDxSkZwK/UwV1YjzHVyLPLldkfjZNVLwr6kE5F+
 e6oy8BgAfMzf/tlWRwUMWFJUaJj6e+W5AwNSEfxgGdhRn0mVS+MM3f5Qn w==;
X-CSE-ConnectionGUID: J544B2P/ToSzkqNGr1vcOQ==
X-CSE-MsgGUID: rbzsjtiVRSasC4xiCm51rQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="36722560"
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="36722560"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 04:41:41 -0700
X-CSE-ConnectionGUID: yMa7MHOkTaO+DL/neZKlqQ==
X-CSE-MsgGUID: AQOBslKjR1yodlpaH8UbIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="37570074"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 05 Jun 2024 04:41:39 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 05 Jun 2024 14:41:38 +0300
Date: Wed, 5 Jun 2024 14:41:38 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 09/20] tools/intel_vbt_decode: Extract dump_pnp_id()
Message-ID: <ZmBO8suQoD3RsJ6S@intel.com>
References: <20240531142354.16528-1-ville.syrjala@linux.intel.com>
 <20240531142354.16528-10-ville.syrjala@linux.intel.com>
 <87jzjadolm.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87jzjadolm.fsf@intel.com>
X-Patchwork-Hint: comment
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

On Fri, May 31, 2024 at 05:48:21PM +0300, Jani Nikula wrote:
> On Fri, 31 May 2024, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > Several different VBT blocks contain PnP IDs. Extract the
> > helper to dump them out.
> 
> Just nitpicking inline, can be fixed in follow-up. The patch is an
> improvement as-is.
> 
> >
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  tools/intel_vbt_decode.c | 20 +++++++++++++-------
> >  1 file changed, 13 insertions(+), 7 deletions(-)
> >
> > diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> > index 6cf6d471b5e2..2a11490eed22 100644
> > --- a/tools/intel_vbt_decode.c
> > +++ b/tools/intel_vbt_decode.c
> > @@ -1394,6 +1394,18 @@ static char *decode_pnp_id(u16 mfg_name, char str[4])
> >  	return str;
> >  }
> >  
> > +static void dump_pnp_id(const struct bdb_edid_pnp_id *pnp_id)
> 
> Maybe pass prefix or indent level?

Yeah, thought about doing something like that, but decided
to leave it out for now as the series was ballooning out
of control already.

> 
> > +{
> > +	char mfg[4];
> > +
> > +	printf("\t\t  Mfg name: %s (0x%x)\n",
> > +	       decode_pnp_id(pnp_id->mfg_name, mfg), pnp_id->mfg_name);
> > +	printf("\t\t  Product code: %u\n", pnp_id->product_code);
> > +	printf("\t\t  Serial: %u\n", pnp_id->serial);
> > +	printf("\t\t  Mfg week: %d\n", pnp_id->mfg_week);
> > +	printf("\t\t  Mfg year: %d\n", 1990 + pnp_id->mfg_year);
> 
> These could be improved to match spec (see decode_date() in kernel
> drm_edid.c).
> 
> > +}
> > +
> >  static void dump_lfp_data(struct context *context,
> >  			  const struct bdb_block *block)
> >  {
> > @@ -1419,7 +1431,6 @@ static void dump_lfp_data(struct context *context,
> >  			block_data(block) + ptrs->ptr[i].panel_pnp_id.offset;
> >  		const struct bdb_lfp_data_tail *tail =
> >  			block_data(block) + ptrs->panel_name.offset;
> > -		char mfg[4];
> >  
> >  		if (!dump_panel(context, i))
> >  			continue;
> > @@ -1457,12 +1468,7 @@ static void dump_lfp_data(struct context *context,
> >  		       "BAD!" : "good");
> >  
> >  		printf("\t\tPnP ID:\n");
> 
> I'd do this in dump_pnp_id() too.

That's more of a sub-heading for this block type. For other
block types it would probably be a bit redundant.

> 
> > -		printf("\t\t  Mfg name: %s (0x%x)\n",
> > -		       decode_pnp_id(pnp_id->mfg_name, mfg), pnp_id->mfg_name);
> > -		printf("\t\t  Product code: %u\n", pnp_id->product_code);
> > -		printf("\t\t  Serial: %u\n", pnp_id->serial);
> > -		printf("\t\t  Mfg week: %d\n", pnp_id->mfg_week);
> > -		printf("\t\t  Mfg year: %d\n", 1990 + pnp_id->mfg_year);
> > +		dump_pnp_id(pnp_id);
> >  
> >  		if (!ptrs->panel_name.table_size)
> >  			continue;
> 
> -- 
> Jani Nikula, Intel

-- 
Ville Syrjälä
Intel
