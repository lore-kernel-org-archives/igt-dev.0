Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B9D1C54E58
	for <igt-dev@archiver.kernel.org>; Mon, 25 Mar 2024 15:16:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAB7510E965;
	Mon, 25 Mar 2024 15:16:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GucS+piL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71AA210E986
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2024 15:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711379798; x=1742915798;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=QLNeFakCv6uDqhZiWr56ECo85RbdcLsjb+u5CamOG1c=;
 b=GucS+piLElYkff3W8PXCEw+8Jy7x/g7Z5kQg8MpOfglhk5rnuLrwcW4K
 1h0koUmrZyhMs/hLGP+/25Xdv4gFXDTZRNZQao4WZkHV+A/nmSuG6zFk0
 vbbhUOuePalUul4yEifIZMTRYACSDVFayyhBuAOBLS+eN7on0IMCI17NZ
 HC6W8CrZHlR2U3Syta4GZaRy8E1hxRGz/u1VcviA/MV+HGwg43mL8tNnG
 OO3Lw19yr388Vdd8nzRBeczjYPsxvTE3kzm4YrqW4nlrwNxXLArHZvcwg
 fnq4bipH/U/kk+DSeci/bOQFH+NCFcJnYJKfXfgddzyce0YXzfOeTUrIK A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="6247135"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="6247135"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 08:16:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="827784728"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="827784728"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 25 Mar 2024 08:16:34 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 25 Mar 2024 17:16:34 +0200
Date: Mon, 25 Mar 2024 17:16:34 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 5/5] tools/intel_vbt_decode: Optionally determine
 panel type from EDID
Message-ID: <ZgGVUrMulNbRRIYA@intel.com>
References: <20240322163251.11102-1-ville.syrjala@linux.intel.com>
 <20240322163251.11102-6-ville.syrjala@linux.intel.com>
 <87h6guic1i.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87h6guic1i.fsf@intel.com>
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

On Mon, Mar 25, 2024 at 05:08:57PM +0200, Jani Nikula wrote:
> On Fri, 22 Mar 2024, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > VBT may declare panel type as 255, which means we should match the
> > EDID PnP ID against the panel entries in the VBT to determine the
> > correct panel type. Implemnt support for this by allowing the user
> > to optionally provide the EDID via a command like parameter.
> >
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  tools/intel_vbt_decode.c | 96 ++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 96 insertions(+)
> >
> > diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> > index f223ce2bf5a1..9aeb8ea04d06 100644
> > --- a/tools/intel_vbt_decode.c
> > +++ b/tools/intel_vbt_decode.c
> > @@ -84,6 +84,12 @@ struct context {
> >  	bool hexdump;
> >  };
> >  
> > +struct edid {
> > +	uint8_t header[8];
> > +	struct lvds_pnp_id pnpid;
> > +	/* ... */
> > +} __packed;
> > +
> >  static bool dump_panel(const struct context *context, int panel_type)
> >  {
> >  	return panel_type == context->panel_type ||
> > @@ -2506,6 +2512,70 @@ static void dump_compression_parameters(struct context *context,
> >  	}
> >  }
> >  
> > +static int get_panel_type_pnpid(const struct context *context,
> > +				const char *edid_file)
> > +{
> > +	struct bdb_block *ptrs_block, *data_block;
> > +	const struct bdb_lvds_lfp_data *data;
> > +	const struct bdb_lvds_lfp_data_ptrs *ptrs;
> > +	struct lvds_pnp_id edid_id, edid_id_nodate;
> > +	const struct edid *edid;
> > +	int fd, best = -1;
> > +
> > +	fd =  open(edid_file, O_RDONLY);
>             ^
> 
> superfluous space.

ack

> 
> > +	if (fd < 0) {
> > +		fprintf(stderr, "Unable to open EDID file %s\n", edid_file);
> > +		return -1;
> > +	}
> > +
> > +	edid = mmap(0, sizeof(*edid), PROT_READ, MAP_SHARED, fd, 0);
> > +	close(fd);
> > +	if (edid == MAP_FAILED) {
> > +		fprintf(stderr, "Unable to read EDID file %s\n", edid_file);
> > +		return -1;
> > +	}
> > +	edid_id = edid->pnpid;
> > +	munmap((void*)edid, sizeof(*edid));
> > +
> > +	edid_id_nodate = edid_id;
> > +	edid_id_nodate.mfg_week = 0;
> > +	edid_id_nodate.mfg_year = 0;
> > +
> > +	ptrs_block = find_section(context, BDB_LVDS_LFP_DATA_PTRS);
> > +	if (!ptrs_block)
> > +		return -1;
> > +
> > +	data_block = find_section(context, BDB_LVDS_LFP_DATA);
> > +	if (!data_block)
> > +		return -1;
> > +
> > +	ptrs = block_data(ptrs_block);
> > +	data = block_data(data_block);
> > +
> > +	for (int i = 0; i < 16; i++) {
> > +		const struct lvds_pnp_id *vbt_id =
> > +			(const void*)data + ptrs->ptr[i].panel_pnp_id.offset;
> > +
> > +		/* full match? */
> > +		if (!memcmp(vbt_id, &edid_id, sizeof(*vbt_id)))
> > +			return i;
> > +
> > +		/*
> > +		 * Accept a match w/o date if no full match is found,
> > +		 * and the VBT entry does not specify a date.
> > +		 */
> > +		if (best < 0 &&
> > +		    !memcmp(vbt_id, &edid_id_nodate, sizeof(*vbt_id)))
> > +			best = i;
> > +	}
> > +
> > +	if (best >= 0) {
> > +		// ... dump
> > +	}
> 
> Maybe drop this?

Yeah, I had some stuff to dump the pnpids here while
debugging, and looks like this piece ended up in the
wrong patch.

> 
> Other than that,
> 
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>

Thanks.

> 
> 
> > +
> > +	return best;
> > +}
> > +
> >  /* get panel type from lvds options block, or -1 if block not found */
> >  static int get_panel_type(struct context *context, bool is_panel_type2)
> >  {
> > @@ -2784,6 +2854,8 @@ enum opt {
> >  	OPT_DEVID,
> >  	OPT_PANEL_TYPE,
> >  	OPT_PANEL_TYPE2,
> > +	OPT_PANEL_EDID,
> > +	OPT_PANEL_EDID2,
> >  	OPT_ALL_PANELS,
> >  	OPT_HEXDUMP,
> >  	OPT_BLOCK,
> > @@ -2798,6 +2870,9 @@ static void usage(const char *toolname)
> >  	fprintf(stderr, " --file=<rom_file>"
> >  			" [--devid=<device_id>]"
> >  			" [--panel-type=<panel_type>]"
> > +			" [--panel-type2=<panel_type>]"
> > +			" [--panel-edid=<edid file>]"
> > +			" [--panel-edid2=<edid file>]"
> >  			" [--all-panels]"
> >  			" [--hexdump]"
> >  			" [--block=<block_no>]"
> > @@ -2822,6 +2897,7 @@ int main(int argc, char **argv)
> >  		.panel_type = -1,
> >  		.panel_type2 = -1,
> >  	};
> > +	const char *panel_edid = NULL, *panel_edid2 = NULL;
> >  	char *endp;
> >  	int block_number = -1;
> >  	bool header_only = false, describe = false;
> > @@ -2830,7 +2906,9 @@ int main(int argc, char **argv)
> >  		{ "file",	required_argument,	NULL,	OPT_FILE },
> >  		{ "devid",	required_argument,	NULL,	OPT_DEVID },
> >  		{ "panel-type",	required_argument,	NULL,	OPT_PANEL_TYPE },
> > +		{ "panel-edid",	required_argument,	NULL,	OPT_PANEL_EDID },
> >  		{ "panel-type2",	required_argument,	NULL,	OPT_PANEL_TYPE2 },
> > +		{ "panel-edid2",	required_argument,	NULL,	OPT_PANEL_EDID2 },
> >  		{ "all-panels",	no_argument,		NULL,	OPT_ALL_PANELS },
> >  		{ "hexdump",	no_argument,		NULL,	OPT_HEXDUMP },
> >  		{ "block",	required_argument,	NULL,	OPT_BLOCK },
> > @@ -2870,6 +2948,12 @@ int main(int argc, char **argv)
> >  				return EXIT_FAILURE;
> >  			}
> >  			break;
> > +		case OPT_PANEL_EDID:
> > +			panel_edid = optarg;
> > +			break;
> > +		case OPT_PANEL_EDID2:
> > +			panel_edid2 = optarg;
> > +			break;
> >  		case OPT_ALL_PANELS:
> >  			context.dump_all_panel_types = true;
> >  			break;
> > @@ -2988,6 +3072,12 @@ int main(int argc, char **argv)
> >  
> >  	if (context.panel_type == -1)
> >  		context.panel_type = get_panel_type(&context, false);
> > +	if (context.panel_type == 255 && !panel_edid) {
> > +		fprintf(stderr, "Warning: panel type depends on EDID (use --panel-edid), ignoring\n");
> > +		context.panel_type = -1;
> > +	} else if (context.panel_type == 255) {
> > +		context.panel_type = get_panel_type_pnpid(&context, panel_edid);
> > +	}
> >  	if (context.panel_type == -1) {
> >  		fprintf(stderr, "Warning: panel type not set, using 0\n");
> >  		context.panel_type = 0;
> > @@ -2995,6 +3085,12 @@ int main(int argc, char **argv)
> >  
> >  	if (context.panel_type2 == -1)
> >  		context.panel_type2 = get_panel_type(&context, true);
> > +	if (context.panel_type2 == 255 && !panel_edid2) {
> > +		fprintf(stderr, "Warning: panel type2 depends on EDID (use --panel-edid2), ignoring\n");
> > +		context.panel_type2 = -1;
> > +	} else if (context.panel_type2 == 255) {
> > +		context.panel_type2 = get_panel_type_pnpid(&context, panel_edid2);
> > +	}
> >  	if (context.panel_type2 != -1 && context.bdb->version < 212) {
> >  		fprintf(stderr, "Warning: panel type2 not valid for BDB version %d\n",
> >  			context.bdb->version);
> 
> -- 
> Jani Nikula, Intel

-- 
Ville Syrjälä
Intel
