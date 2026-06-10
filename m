Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E51C0CD8CB2
	for <igt-dev@archiver.kernel.org>; Wed, 10 Jun 2026 15:14:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DFD010E4AF;
	Wed, 10 Jun 2026 15:14:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wl51y7qD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EF3F10E4D4
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jun 2026 15:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781104429; x=1812640429;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=KuMWY3WzrEenlVomSbILEAewRwj73+zsC0gN6pfeJUU=;
 b=Wl51y7qDDXTBEXL2LYg9VzJi01cA6LZUahTR/sxAli0/7ZgDIPmzxn8o
 1yQ3acOWL73RnunkRg0Lpg/9yEB/FCHjJ88YHqj1Lhjb92JFclBzLMhZ6
 pI8rfkJr5r/395hxj10cobVkXmH9xciKc2zD2l0X8TWmAe4mHsUaVJp2l
 OXbq3X086CNv0WuCConQJZ2hDBuTYICQf4XdLtpgSWlz3rYCGSUbczG0X
 +bHPd2MkgIUXrINUH/ruZRYI9yadnssez2pPNXzj27Xa1nqHU4CZeMoTx
 4YTarEATm/ren3wV8Dg9+5bQgyW0cUQbDuwmkDk6t2XXUI3rdSI+zP5Qz A==;
X-CSE-ConnectionGUID: q5hpSw4kTQGzu5LGxzZjiQ==
X-CSE-MsgGUID: xViEQoipTSGz864xeNI4TA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="93007521"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="93007521"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 08:13:48 -0700
X-CSE-ConnectionGUID: 7i6g3al2SLehyqNZwBNyVA==
X-CSE-MsgGUID: fYQ2m3LaSgytgLS6x96skw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="270202947"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.62])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 08:13:47 -0700
Date: Wed, 10 Jun 2026 18:13:43 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>,
 igt-dev@lists.freedesktop.org, suraj.kandpal@intel.com
Subject: Re: [PATCH i-g-t v2 5/8] tools/vbt_decode: guess devid from VBT
 signature
Message-ID: <ail_J2_jB238ws74@intel.com>
References: <20260608124121.3131410-1-michal.grzelak@intel.com>
 <20260608124121.3131410-6-michal.grzelak@intel.com>
 <0996de35feb92695fa211aafb9adcdce7e770f50@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0996de35feb92695fa211aafb9adcdce7e770f50@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Wed, Jun 10, 2026 at 05:42:58PM +0300, Jani Nikula wrote:
> On Mon, 08 Jun 2026, Michał Grzelak <michal.grzelak@intel.com> wrote:
> > Nowadays Device ID needs to be passed to decode VBT precisely. VBT lacks
> > it since VBT has been moved from PCI ROM into opregion.
> >
> > However we can narrow from which platform VBT originated basing on VBT
> > signature.
> >
> > Add a command-line option to guess devid using VBT signature. Create an
> > array of signatures and check if any of those is a substring of
> > signature extracted from given VBT. Map each signature into first Device
> > ID of a platform picked from include/drm/intel/pciids.h. Log that devid
> > has not been matched if signature is not found.
> >
> > Note that the platform-specific name should appear after "$VBT ", hence
> > the match.
> >
> > Suggested-by: Jani Nikula <jani.nikula@intel.com>
> > Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
> > ---
> >  tools/intel_vbt_decode.c | 36 +++++++++++++++++++++++++++++++++++-
> >  1 file changed, 35 insertions(+), 1 deletion(-)
> >
> > diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> > index 5681643f4b..ec82b00939 100644
> > --- a/tools/intel_vbt_decode.c
> > +++ b/tools/intel_vbt_decode.c
> > @@ -77,6 +77,7 @@ struct context {
> >  	uint32_t devid;
> >  	int panel_type, panel_type2;
> >  	int sdvo_panel_type;
> > +	bool devid_from_signature;
> >  	bool dump_all_panel_types;
> >  	bool hexdump;
> >  };
> > @@ -3693,6 +3694,31 @@ static int get_sdvo_panel_type(struct context *context)
> >  	return panel_type;
> >  }
> >  
> > +static int
> > +get_devid_from_signature(const char *vbt_signature)
> > +{
> > +	int i;
> > +
> > +	const char *signature[] = {"PANTHERLAKE",
> > +				   "LUNARLAKE",
> > +				   "METEORLAKE",
> > +				   "JASPERLAKE",

That's a somewhat weird selection of platforms.

> > +				   NULL};
> > +
> > +	int devid[] = {0xB080, /* PTL */
> > +		       0x6420, /* LNL */
> > +		       0x7D40, /* MTL */
> > +		       0x4E51, /* JSL */
> > +		       0x0};
> 
> Please use a struct, something along the lines of:
> 
> 	static const struct {
> 		const char *signature;
> 		uint16_t devid;
> 	} devids[] = {
> 		{ .signature = "PANTHERLAKE", .devid = 0xb080, },
> 		...
> 	};
> 
> Then you can also ditch the /* PTL */ etc. comments.
> 
> > +
> > +	for (i = 0; signature[i]; i++)
> > +		if (strstr(vbt_signature, signature[i]))
> > +			return devid[i];
> > +
> > +	fprintf(stderr, "Warning: cannot find devid for signature %s\n", vbt_signature);
> 
> This should be a fallback, please don't warn anything here. Only one
> warning for the whole devid thing.
> 
> > +	return 0;
> > +}
> > +
> >  static int
> >  get_device_id(unsigned char *bios, int size)
> >  {
> > @@ -4108,6 +4134,7 @@ enum opt {
> >  	OPT_PANEL_TYPE2,
> >  	OPT_PANEL_EDID,
> >  	OPT_PANEL_EDID2,
> > +	OPT_VBT_DEVID,
> >  	OPT_ALL_PANELS,
> >  	OPT_HEXDUMP,
> >  	OPT_BLOCK,
> > @@ -4162,6 +4189,8 @@ int main(int argc, char **argv)
> >  		{ "panel-edid",	required_argument,	NULL,	OPT_PANEL_EDID },
> >  		{ "panel-type2",	required_argument,	NULL,	OPT_PANEL_TYPE2 },
> >  		{ "panel-edid2",	required_argument,	NULL,	OPT_PANEL_EDID2 },
> > +		{ "devid-from-signature",
> > +				no_argument,		NULL,	OPT_VBT_DEVID },
> >  		{ "all-panels",	no_argument,		NULL,	OPT_ALL_PANELS },
> >  		{ "hexdump",	no_argument,		NULL,	OPT_HEXDUMP },
> >  		{ "block",	required_argument,	NULL,	OPT_BLOCK },
> > @@ -4207,6 +4236,9 @@ int main(int argc, char **argv)
> >  		case OPT_PANEL_EDID2:
> >  			panel_edid2 = optarg;
> >  			break;
> > +		case OPT_VBT_DEVID:
> > +			context.devid_from_signature = true;
> > +			break;
> >  		case OPT_ALL_PANELS:
> >  			context.dump_all_panel_types = true;
> >  			break;
> > @@ -4313,6 +4345,8 @@ int main(int argc, char **argv)
> >  	context.bdb = (const struct bdb_header *)(VBIOS + bdb_off);
> >  	context.size = size;
> >  
> > +	if (!context.devid && context.devid_from_signature)
> > +		context.devid = get_devid_from_signature((char *) vbt->signature);
> 
> This should be last. The priority should be:
> 
> 	1. command-line, if set
> 	2. environment variable, if set
> 	3. VBIOS, if available
> 	4. deduce from signature, if requested
> 
> Come to think of it, not sure about the "if requested". Maybe just use
> it if not otherwise specified. This is userspace decoding, not kernel,
> after all.
> 
> Ville, thoughts?

Yeah, could probably just take the fallback when we don't know
any better.

But I'm thinking we should just add the devid to the VBT dump produced
by the kernel. Would avoid having to guess, especially since vendors
have been known to sometime reuse older VBTs across platforms. Perhaps
just prepend the VBT image with a PCIR structure which can then be
parsed by the code in get_device_id().

> 
> >  	if (!context.devid) {
> >  		const char *devid_string = getenv("DEVICE");
> >  		if (devid_string) {
> > @@ -4326,7 +4360,7 @@ int main(int argc, char **argv)
> >  	if (!context.devid)
> >  		context.devid = get_device_id(VBIOS, size);
> >  	if (!context.devid)
> > -		fprintf(stderr, "Warning: could not find PCI device ID!\n");
> > +		fprintf(stderr, "Warning: could not find PCI device ID! Use --devid or --devid-from-signature\n");
> >  
> >  	if (context.panel_type == -1)
> >  		context.panel_type = get_panel_type(&context, false);
> 
> -- 
> Jani Nikula, Intel

-- 
Ville Syrjälä
Intel
