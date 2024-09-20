Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7080CF9C5F
	for <igt-dev@archiver.kernel.org>; Fri, 20 Sep 2024 18:31:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9087B10E010;
	Fri, 20 Sep 2024 18:31:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="arBtPa8W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C14210E010
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Sep 2024 18:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726857065; x=1758393065;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=FZuATgWFfqLXQPThdWUuBs+/CXNM7paF/Z8zYwePTmg=;
 b=arBtPa8WVNjnsLbv8V/KMK4SEZCemAAcRLWdbUBnmwubl8uwHnAQAfmH
 /H1cy9QRoQ1z8MA/HlBeDdY3eRI7vOGczu+k9wF9RrN0+rhCwSGxjO8x6
 uyLrdjYDjfCnyyCOnsZudgOpNnQkVhjrLXCRxHJ0QRvii3zkiWLVD6B9t
 FLX/5s8LCEQ75EMQUFC1NnWEhKM95FbKSs/68OfzNndQrVTGYCB2zIn5S
 XU+Zwb7Y3L22/eoAQ4LG2DdTO3NYVKP07w8d6ci54O1ZtuRB3iCMB8nMi
 XC9VKvMlNjS6+nlNWPj0bdASfhlCDp7Wq4bRFqXPKjmD8kahrQ29srKJG g==;
X-CSE-ConnectionGUID: w/c+mkAhRn+v6m4oMkh87A==
X-CSE-MsgGUID: 1eJ17ufpQjyBeGPAzdDawQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="37247253"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="37247253"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 11:30:32 -0700
X-CSE-ConnectionGUID: iLyYA0KqQFWjTQnIrBbLNQ==
X-CSE-MsgGUID: 8P2aSIkQTWGcCGoT65QNAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="70536615"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 20 Sep 2024 11:30:28 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 20 Sep 2024 21:30:28 +0300
Date: Fri, 20 Sep 2024 21:30:28 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 6/6] tools/intel_reg: Add forcewake support to xe
Message-ID: <Zu2_REdBq8HzQrk0@intel.com>
References: <20240918163629.1186314-1-lucas.demarchi@intel.com>
 <20240918163629.1186314-7-lucas.demarchi@intel.com>
 <20240920180135.GR5774@mdroper-desk1.amr.corp.intel.com>
 <20240920180420.GS5774@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240920180420.GS5774@mdroper-desk1.amr.corp.intel.com>
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

On Fri, Sep 20, 2024 at 11:04:20AM -0700, Matt Roper wrote:
> On Fri, Sep 20, 2024 at 11:01:37AM -0700, Matt Roper wrote:
> > On Wed, Sep 18, 2024 at 09:36:29AM -0700, Lucas De Marchi wrote:
> > > Now that the igt lib is prepared, start passing the open driver fd so
> > > the correct forcewake is taken.
> > > 
> > > Before:
> > > $ sudo ./build/tools/intel_reg read 0x2358
> > >                                     (0x00002358): 0xffffffff
> > 
> > Hmm, this example makes me wonder if we actually should have called this
> > top-level "forcewake_all" debugfs node something else.  This example
> > shows that we're not relying on this interface solely for forcewake
> > purposes, but as a wider "wake everything up and make sure it's
> > accessible" interface.  At the hardware level, forcewake deals only with
> > the GT-specific ability to exit+suppress RC6; if we read GT registers
> > while in RC6, we'll get back 0x0 as a result (which isn't what we see
> > here).
> > 
> > The failures we had here were because the device itself had gone into
> > runtime D3 (so register reads come back as ~0); using forcewake
> > indirectly suppresses runtime D3 as a side effect.  But if you'd wanted
> > to read a non-GT register (sgunit, display, etc.), those register reads
> > also would have failed before this change due to D3, even though the
> > registers themselves don't need forcewake.  So we're in a situation
> > where we also rely on the "forcewake" interface for reading/writing
> > non-GT registers that don't care about forcewake.
> > 
> > If a future platform adds, for example, a new sleep + wakelock system to
> > part of the sgunit, do we want to make this debugfs automatically wake
> > the sgunit too in case we want to read its registers?  For that matter,
> > should this device-level "wake up everything so we can read registers"
> > interface also be grabbing all of our display power wells by default?
> > 
> > Anyway, I'm probably overthinking this; we don't need to worry about it
> > for this patch series.
> > 
> > > 
> > > After:
> > > $ sudo ./build/tools/intel_reg read 0x2358
> > > Opened device: /dev/dri/card0
> > >                                     (0x00002358): 0x91e59eeb
> > > 
> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > ---
> > >  tools/intel_reg.c | 13 ++++++++++++-
> > >  1 file changed, 12 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/tools/intel_reg.c b/tools/intel_reg.c
> > > index 906ae9b84..b650c3697 100644
> > > --- a/tools/intel_reg.c
> > > +++ b/tools/intel_reg.c
> > > @@ -802,7 +802,18 @@ static int parse_reg(struct config *config, struct reg *reg, const char *s)
> > >  
> > >  static int register_access_init(struct config *config)
> > >  {
> > > -	return intel_register_access_init(&config->mmio_data, config->pci_dev, 0, -1);
> > > +	int drm_fd = __drm_open_driver(DRIVER_INTEL | DRIVER_XE);
> > > +	int ret;
> > > +
> > > +	if (drm_fd < 0) {
> > > +		fprintf(stderr, "could not open i915 or xe device\n");
> > > +		return EXIT_FAILURE;
> > > +	}
> > > +
> > > +	ret = intel_register_access_init(&config->mmio_data, config->pci_dev, 0, drm_fd);
> > > +	close(drm_fd);
> > > +
> > > +	return ret;
> > 
> > As noted on the previous patch, if we get here, it's always a 'return 0'
> > since intel_register_access_init() can't fail (and should probably have
> > just been a void function).  But not a blocker.
> > 
> > Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> 
> Actually I just saw Ville's reply and it's a good point that this tool
> did used to be able to run before/without the driver loaded.  So we
> should just skip the "wake stuff up" part and proceed without failing
> for that case.

I've also been mildly tempted to make IGT_NO_FORCEWAKE=1
the default because it's annoying when I sometimes forget
to set it and then I might no longer be doing just the
register access I though I was doing. But that might
be a bit surprising to folks wanting to read GT
registers/etc. I suppose a sensible middle ground would
be to disable the forcewake stuff by defaut only in
the display specific tools, leaving it on for the likes
of intel_reg and anything gt specific.

-- 
Ville Syrjälä
Intel
