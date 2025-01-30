Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F17C0218A
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jan 2025 12:26:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 159D710E19E;
	Thu, 30 Jan 2025 12:26:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WkiAPryb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40F5610E19E
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2025 12:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738240010; x=1769776010;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fvZU83nl5M+X2C3WEOXYJBCLYk9E4GV9UkVXa34Z0Uk=;
 b=WkiAPrybKJqq4rBLEwMxoAfV2ubi4YelLZmn7NWLwClT+wT9SK8lrdSS
 7Fdt5rAR4DH7+/DeZ5N8wgQ9JB5IbI5oKLWbqO7vcFAyTR8oK/5k+ARBw
 UOwsyaBTZLJyIxvlvuorA0AE7z6YHNsHSIOqyUQo7SrExGCI/6/sxLeBo
 qvziR+YjDJSEL6fBOYX83NZZlBe1y4nDYwT81h64xX4+had62hJOOg6Xf
 4XIeQV9pYOw6z2yAp1uF/ZlZZQhVrfndaCJd5dmHMU2/892wut2Q5sTs1
 yHMlkKilust2rMFCQp79GGBjrDn+S0iGtJKMESx3qtLUKbM6rLr8z4i02 g==;
X-CSE-ConnectionGUID: qV4j+cQKTqqmEUyhIENSHw==
X-CSE-MsgGUID: eUnGCOTrSz2KQmO5SPpm7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="50164601"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="50164601"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 04:26:50 -0800
X-CSE-ConnectionGUID: nqtI6pZ7RvaYsjm3hmXM9A==
X-CSE-MsgGUID: 0S98HurJRNOXk1fdutnA3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="109220465"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 04:26:48 -0800
Date: Thu, 30 Jan 2025 13:26:46 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: igt-dev@lists.freedesktop.org, Matt Atwood <matthew.s.atwood@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>
Subject: Re: [PATCH i-g-t] lib/pciids: sync with kernel
Message-ID: <20250130122646.u5fnrtbonqngcfcb@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 igt-dev@lists.freedesktop.org,
 Matt Atwood <matthew.s.atwood@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>
References: <20250129105902.120630-1-kamil.konieczny@linux.intel.com>
 <Z5o6pf5VPssrPQPV@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z5o6pf5VPssrPQPV@intel.com>
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

Hi Rodrigo,
On 2025-01-29 at 09:26:45 -0500, Rodrigo Vivi wrote:
> On Wed, Jan 29, 2025 at 11:59:02AM +0100, Kamil Konieczny wrote:
> > Align with kernel commit 16016ade13f6 ("drm/xe/ptl: Update the PTL pci id table").
> > 
> > It adds PTL pci ids and also brings few BMG from previous commit.
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 

Applied, thanks, with improved title and description.

Regards,
Kamil

> > 
> > Cc: Matt Atwood <matthew.s.atwood@intel.com>
> > Cc: Shekhar Chauhan <shekhar.chauhan@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Link: https://lore.kernel.org/intel-xe/20250128175102.45797-1-matthew.s.atwood@intel.com/
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  lib/pciids.h | 11 ++++++-----
> >  1 file changed, 6 insertions(+), 5 deletions(-)
> > 
> > diff --git a/lib/pciids.h b/lib/pciids.h
> > index 7883384ac..23f349f65 100644
> > --- a/lib/pciids.h
> > +++ b/lib/pciids.h
> > @@ -817,19 +817,20 @@
> >  	MACRO__(0xE20B, ## __VA_ARGS__), \
> >  	MACRO__(0xE20C, ## __VA_ARGS__), \
> >  	MACRO__(0xE20D, ## __VA_ARGS__), \
> > -	MACRO__(0xE212, ## __VA_ARGS__)
> > +	MACRO__(0xE210, ## __VA_ARGS__), \
> > +	MACRO__(0xE212, ## __VA_ARGS__), \
> > +	MACRO__(0xE215, ## __VA_ARGS__), \
> > +	MACRO__(0xE216, ## __VA_ARGS__)
> >  
> >  /* PTL */
> >  #define INTEL_PTL_IDS(MACRO__, ...) \
> >  	MACRO__(0xB080, ## __VA_ARGS__), \
> >  	MACRO__(0xB081, ## __VA_ARGS__), \
> >  	MACRO__(0xB082, ## __VA_ARGS__), \
> > +	MACRO__(0xB083, ## __VA_ARGS__), \
> > +	MACRO__(0xB08F, ## __VA_ARGS__), \
> >  	MACRO__(0xB090, ## __VA_ARGS__), \
> > -	MACRO__(0xB091, ## __VA_ARGS__), \
> > -	MACRO__(0xB092, ## __VA_ARGS__), \
> >  	MACRO__(0xB0A0, ## __VA_ARGS__), \
> > -	MACRO__(0xB0A1, ## __VA_ARGS__), \
> > -	MACRO__(0xB0A2, ## __VA_ARGS__), \
> >  	MACRO__(0xB0B0, ## __VA_ARGS__)
> >  
> >  #endif /* __PCIIDS_H__ */
> > -- 
> > 2.48.1
> > 
