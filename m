Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB27FD18130
	for <igt-dev@archiver.kernel.org>; Mon, 14 Oct 2024 16:57:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 740DD10E48E;
	Mon, 14 Oct 2024 16:57:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mo0qgGaK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CF1610E4A9
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Oct 2024 16:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728925034; x=1760461034;
 h=date:from:to:subject:message-id:references:mime-version:
 content-transfer-encoding:in-reply-to;
 bh=fVxMIR9qh2RzMr5EQJmv9I7yjMm7kNp5t3rAapn6/yc=;
 b=Mo0qgGaKtoC0Vs+/McLx7UzK4ey/DZVpunRQBtxSp00ZknvYxaYyirfD
 Vjp2IFpFCcxj+7tLdWpLjV5d5nal/VjDyO3Htx5u7i+5/LovrB2umtABt
 Al6hvR4LTgeDvZh38bXRg/K1C3tDQB72EgIuc5sq9IBz2+iv01+k1zl2Q
 7ecf6w38K5JrgidxWt0iOT7xXKwLKLhVMM3yvGlEQyIAljskZLdTja64F
 38SwyndZH6BvZyi0UZLepmrL80+nXuDV6ctaasBLf/cr7mjFDjwfJcu5j
 8Gubp1IS02ahkBwKBL5MA60LWTFADjCufhZguQ6Mz/ZOF++tQyeQBIRe3 g==;
X-CSE-ConnectionGUID: sEkxFYszSD6rQNZR6JRb0g==
X-CSE-MsgGUID: djRF4F6PTTifzQTNVUvf5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="39679973"
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; d="scan'208";a="39679973"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 09:57:13 -0700
X-CSE-ConnectionGUID: e9XFyI95R6i68aQSlR4Y4g==
X-CSE-MsgGUID: t7Twiu3hRrixG2W5kTJBFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; d="scan'208";a="77731224"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 14 Oct 2024 09:57:10 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 14 Oct 2024 19:57:10 +0300
Date: Mon, 14 Oct 2024 19:57:10 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/5] lib/power: Allow use of rapl by specifying fd=-1
Message-ID: <Zw1NZvHTFQdW7VZh@intel.com>
References: <20240916201841.29592-1-ville.syrjala@linux.intel.com>
 <20240916201841.29592-2-ville.syrjala@linux.intel.com>
 <20241011171702.cwhzh4wnwmh2i6oy@kamilkon-desk.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241011171702.cwhzh4wnwmh2i6oy@kamilkon-desk.igk.intel.com>
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

On Fri, Oct 11, 2024 at 07:17:02PM +0200, Kamil Konieczny wrote:
> Hi Ville,
> On 2024-09-16 at 23:18:37 +0300, Ville Syrjala wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > 
> > igt_power_open() is currently defunct when you don't have
> > the GPU driver loaded, or when you explicitly want to measure
> > via rapl even when using a DGPU. Allow those use cases by
> > accepting fd<0 to indicate that we explicitly want to use rapl.
> 
> 
> This is ok but imho you should document it in function description.

The whole thing is a complete mess already. There should
probably be a completely separate igt_power_gpu_open()
or at the very least  the "gpu" domain special casing
should be handled first, and then fall back to rapl for
everything else.

But I can try to add a small note about the current
behaviour.

> 
> With that
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
> > 
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  lib/igt_power.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/lib/igt_power.c b/lib/igt_power.c
> > index 810859b134dc..f4d3efcf0cec 100644
> > --- a/lib/igt_power.c
> > +++ b/lib/igt_power.c
> > @@ -106,7 +106,7 @@ int igt_power_open(int fd, struct igt_power *p, const char *domain)
> >  	p->hwmon_fd = -1;
> >  	p->rapl.fd = -1;
> >  
> > -	is_dgfx = is_xe_device(fd) ? xe_has_vram(fd) : gem_has_lmem(fd);
> > +	is_dgfx = fd >= 0 && (is_xe_device(fd) ? xe_has_vram(fd) : gem_has_lmem(fd));
> >  	if (is_dgfx) {
> >  		if (strncmp(domain, "gpu", strlen("gpu")) == 0) {
> >  			p->hwmon_fd = igt_hwmon_open(fd);
> > -- 
> > 2.44.2
> > 

-- 
Ville Syrjälä
Intel
