Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA54BCD1284
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 10:10:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B0C910EE7F;
	Thu, 11 Apr 2024 10:10:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f/B//gT5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B5510EE7F
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 10:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712830244; x=1744366244;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=uR8l2WTfc0I9kReyoVKdQgsf9yrKydClUQ16T81UsP0=;
 b=f/B//gT5jLRUGqTUnXp2e2kqkZDjJfPPgN4SK5xMD+0ttahDoIQLfvCl
 Us2CiH9k2U5X1W50QwfH9Cr7iGvPxpJmxm4lgx90A/fBXnpIIa++0idhN
 BBHjwUCiNmVYcv33RwcZyrPIwkKicP0ppyQDwMTGjZPEmZaRuLaRnjJKD
 iwdVCFYcjZj9aAQ+k3RIztuwsIPIPj6xF4Nj4+LX5N0kgQMzmyudpUBAY
 T4E7J0ToQBaKEIbakV9rVMGw5eCIpSOeHzB0XBuDWJ58yX16FoLIQVq+E
 Xo4+ll+OrMm2k6OJ0joF9gOunBwdJLvv/qdeWdEAcUC1g3dW+dlU1X4yX w==;
X-CSE-ConnectionGUID: 9uxfPW72Rh6yPyUIRqaOCA==
X-CSE-MsgGUID: BsmUdrBXSkuzGhZAZv7L2w==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="25686313"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="25686313"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 03:10:43 -0700
X-CSE-ConnectionGUID: qT219KWwQPK3pO06NOhNZA==
X-CSE-MsgGUID: +vd2DFa0Q1Cn60pxDYYDjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="44142315"
Received: from unknown (HELO localhost) ([10.245.246.155])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 03:10:42 -0700
Date: Thu, 11 Apr 2024 12:10:39 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH i-g-t] intel_reg: Stop warning if register spec is not
 there
Message-ID: <20240411101039.clpx7ykoqnpjvhck@zkempczy-mobl2>
References: <20240410231710.3113867-1-lucas.demarchi@intel.com>
 <20240411100620.gvl2h7o26r3xrzep@zkempczy-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240411100620.gvl2h7o26r3xrzep@zkempczy-mobl2>
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

On Thu, Apr 11, 2024 at 12:07:03PM +0200, Zbigniew Kempczyński wrote:
> On Wed, Apr 10, 2024 at 04:17:10PM -0700, Lucas De Marchi wrote:
> > Stop suffering when using igt from the git checkout, which is the case
> > for all/most developers.
> > 
> > 	$ sudo ./build/tools/intel_reg write 0x2358 0xdeadbeef
> > 	Warning: stat '/usr/local/share/igt-gpu-tools/registers' failed: No such file or directory. Using builtin register spec.
> > 
> > Pretty annoying when you have a bunch of commands to run and don't want
> > to simply ignore stderr.  Keep the other warnings as if the file is
> > there and can't be read for some reason, it's good to give a warning.
> > However if the file simply isn't there, let it pass.
> > 
> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > ---
> >  tools/intel_reg.c | 6 +-----
> >  1 file changed, 1 insertion(+), 5 deletions(-)
> > 
> > diff --git a/tools/intel_reg.c b/tools/intel_reg.c
> > index 6c37e14d1..ec311a05a 100644
> > --- a/tools/intel_reg.c
> > +++ b/tools/intel_reg.c
> > @@ -1114,12 +1114,8 @@ static int read_reg_spec(struct config *config)
> >  		path = IGT_DATADIR"/registers";
> >  
> >  	r = stat(path, &st);
> > -	if (r) {
> > -		fprintf(stderr, "Warning: stat '%s' failed: %s. "
> > -			"Using builtin register spec.\n",
> > -			path, strerror(errno));
> 
> Maybe this warning should stay when verbosity >= 0?

Eh, > 0.

--
Zbigniew

> 
> --
> Zbigniew
> 
> > +	if (r)
> >  		goto builtin;
> > -	}
> >  
> >  	if (S_ISDIR(st.st_mode)) {
> >  		r = get_reg_spec_file(buf, sizeof(buf), path, config->devid);
> > -- 
> > 2.43.0
> > 
