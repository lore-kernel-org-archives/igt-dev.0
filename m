Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63FC7CCA470
	for <igt-dev@archiver.kernel.org>; Tue, 30 Sep 2025 11:56:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D92F10E2AE;
	Tue, 30 Sep 2025 11:56:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZxXVeYgY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B700D10E2AE
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Sep 2025 11:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759233413; x=1790769413;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=dP9ifYJZh0DnhyK90FsVQo39guJ+C+Des+0lJKRioRI=;
 b=ZxXVeYgYWFEObcC+ZFvUgSy/KwadC5wu+lM3JURWmXnQGuzABawpbwYD
 hPZGrCFDPbE1rjcfz22EP3tGQuomWb/NfmCP0Kx5YIeih5OyHD05Zbd6E
 398OAeKBsw17zuc9mk0uM0oxkRJZ2epnXBB3j9u5NPMmu0Oni2gq1kAVU
 wFJYp/Dc4cdL2Q4YvkmiKGqrhRIOQqEFKfqB1Y/wHaHissAe6N2GaiN+r
 r4feVQZLMIhEWcEdq1+XJlz6UyZmKpPSQ8Qdnl3J5WrYYNc23KHwIlZp5
 K7WtHVuiEnqIE5MK1VKVeeIBBxyAh+kt1va+iuwzNmCDIJtwNpaYh44Wk w==;
X-CSE-ConnectionGUID: ykNBWjPITZiF6F+/X35Rhw==
X-CSE-MsgGUID: kKdtYyhEQb+gXjhQg6qMQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61531417"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61531417"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 04:56:52 -0700
X-CSE-ConnectionGUID: vUziheBSQRe6oYUdbmdb0Q==
X-CSE-MsgGUID: F/uubPbTQK+27jc9Izh+eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="178079657"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.177])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 04:56:51 -0700
Date: Tue, 30 Sep 2025 14:56:47 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 6/6] tools/intel_vbt_decode: Decode the backlight
 control method type
Message-ID: <aNvFf5fbIvPUwxqq@intel.com>
References: <20250929192127.5865-1-ville.syrjala@linux.intel.com>
 <20250929192127.5865-7-ville.syrjala@linux.intel.com>
 <9dd263be40ecff813e24240cfe166473c90fac0e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9dd263be40ecff813e24240cfe166473c90fac0e@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Tue, Sep 30, 2025 at 11:27:02AM +0300, Jani Nikula wrote:
> On Mon, 29 Sep 2025, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > Decode the backlight control method type to a human readable form.
> >
> > TODO: looks like the we might not be handling some of this
> >       correctly on the kernel side...
> >
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  tools/intel_vbt_decode.c | 14 +++++++++++++-
> >  1 file changed, 13 insertions(+), 1 deletion(-)
> >
> > diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> > index 68d02aee9f5a..e42aed542612 100644
> > --- a/tools/intel_vbt_decode.c
> > +++ b/tools/intel_vbt_decode.c
> > @@ -734,6 +734,17 @@ static const char * const i2c_speed_str[] = {
> >  	[3] = "1 MHz",
> >  };
> >  
> > +static const char * const control_type_str[] = {
> > +	[0] = "PMIC pin",
> > +	[1] = "LPSS PWM",
> > +	[2] = "PWM from Display Engine/Aux Default",
> > +	[3] = "CABC/PWM From LCD Panel",
> 
> The spec says, "CABC method to control brightness/PWM From LCD Panel",
> but feels like it's been butchered at some point. It's DSI DCS, right?
> And it might or might not have CABC.

A quick look at Windows stuff says this value leads to a function
that can handle DSI/DCS or eDP/DPCD based backlight control. Whether
that eDP stuff is ever used I can't tell. It looks it only really
considers value 3 (pane pwm), and values 2,6 (source pwm), and the
other values are not used (at least for current platforms).

Those values 2,6 are handled elsewhere from what I can see. Although
there are also funny things where it even configures the source PWM
duty cycle and then just skips the PWM enable entirely. So who knows
what it actually ends up doing.

> 
> *shrug*
> 
> > +	[4] = "Panel driver interface",
> > +	[5] = "Legacy VESA eDP AUX Interface",
> > +	[6] = "PWM from Display Engine/VESA eDP1.5 SCR AUX Interface",
> > +	[7] = "PWM from Display Engine/Custom eDP AUX Interface",
> > +};
> > +
> >  static void dump_backlight_info(struct context *context,
> >  				const struct bdb_block *block)
> >  {
> > @@ -782,7 +793,8 @@ static void dump_backlight_info(struct context *context,
> >  
> >  		control = &backlight->backlight_control[i];
> >  
> > -		printf("\t\tControl type: %u\n", control->type);
> > +		printf("\t\tControl type: %s (%u)\n",
> > +		       to_str(control_type_str, control->type), control->type);
> >  		printf("\t\tController: %u\n", control->controller);
> >  
> >  		if (context->bdb->version < 234)
> 
> -- 
> Jani Nikula, Intel

-- 
Ville Syrjälä
Intel
