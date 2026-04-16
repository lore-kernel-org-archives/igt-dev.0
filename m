Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B956FF8D761
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 16:07:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64B0310E8D9;
	Thu, 16 Apr 2026 16:07:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O4dIJkZO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D2D010E8D9
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 16:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776355625; x=1807891625;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=8AS7NwX9fPu77VYFQctcCYqAO0cuaYDwh334admR66s=;
 b=O4dIJkZO7rqWlaMq6ONtxmK+yZ07zILwW2Om9xmHd65kYkNglFwfARp6
 qR5JCM9X+OI56JVOKGi6+2LZ+Nmks5nqVQE6BA1UKNAehGzHKjsSQvFae
 bJRemow4Oe4v2pRfo5o5YTWmW4IOD67+8OH/R8xpdWwPH74rjbFXmAGhd
 szNSJX8U7u38kIL+9HTEEBDxlzjx5MR42L1fRARSvpQ/sjErnDiDkUx9m
 0QimFvZxqFzU3WJf8+5AL8pqhL1ipWTEUBq73pUP1CGnL+ZpzVTUYrpMp
 WhWgE0jmBEB4leU9IAZQ/QXsm1Qct8n8U6UkErJ+rjIldnkVvMBvaomPz g==;
X-CSE-ConnectionGUID: N85zaJiuTCWcRYB1VUsEPg==
X-CSE-MsgGUID: NV3YrODHSoKRyfEhr4SO/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="87981606"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="87981606"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 09:07:05 -0700
X-CSE-ConnectionGUID: 19mAMq1VRfuRvcqKQ9Bs0A==
X-CSE-MsgGUID: RZVoRKtVT9qr4G0rV+YVsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="228109779"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.241])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 09:07:04 -0700
Date: Thu, 16 Apr 2026 19:07:00 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/3] lib/kms: Introduce for_each_plane_format()
Message-ID: <aeEJJNU-c1_pWjH8@intel.com>
References: <20260416141334.20086-1-ville.syrjala@linux.intel.com>
 <0883b9b3996df973ab8856363c77281ea51a079c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0883b9b3996df973ab8856363c77281ea51a079c@intel.com>
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

On Thu, Apr 16, 2026 at 06:44:05PM +0300, Jani Nikula wrote:
> On Thu, 16 Apr 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > A few places want to iterate just the formats supported by a plane,
> > ignoring the modifier aspect entirely. Add a new iterator for this
> > (for_each_plane_format()) to avoid everyone just open coding it.
> >
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  lib/igt_kms.h | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> > index fcbb6a5ade3a..a58cb5cd3430 100644
> > --- a/lib/igt_kms.h
> > +++ b/lib/igt_kms.h
> > @@ -816,6 +816,18 @@ igt_output_crtc_t *__igt_output_crtc_populate(igt_display_t *display,
> >  	     (mode) < &(output)->config.connector->modes[(output)->config.connector->count_modes]; \
> >  	     (mode)++)
> >  
> > +/**
> > + * for_each_plane_format:
> > + * @plane: a pointer to an #igt_plane_t structure
> > + * @format: format iterator
> > + *
> > + * This for loop iterates over all formats supported by @plane.
> > + */
> > +#define for_each_plane_format(plane, format) \
> > +	for (int __i = 0; __i < (plane)->drm_plane->count_formats; __i++) \
> > +		for_each_if (((format) = (plane)->drm_plane->formats[__i], \
> > +			      1))
> 
> Using kernel-style __UNIQUE_ID() for __i would be nice to have, but I
> guess we don't have that facility in IGT.

We do (igt_unique()), but I didn't actually need it here so
didn't bother with it. I do have some other iterators lined
up where I did need nested use, and so used it there. I suppose
using it here too might make sense, just in case someone does
come up with some nested use case.

> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> 
> > +
> >  #define IGT_FIXED(i,f)	((i) << 16 | (f))
> >  
> >  /**
> 
> -- 
> Jani Nikula, Intel

-- 
Ville Syrjälä
Intel
