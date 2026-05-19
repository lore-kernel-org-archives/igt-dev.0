Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6EF3CD4F5E
	for <igt-dev@archiver.kernel.org>; Tue, 19 May 2026 16:01:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 620E910EDBD;
	Tue, 19 May 2026 16:01:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UdFew26j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E78210E3D6
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2026 16:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779206473; x=1810742473;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ziUOA4rdbseLpYknt2DpSLC3EOkJufaQc15Rxmr9Oao=;
 b=UdFew26jdabd3UvjzDkZbYF2mkiDiw3o9iFU1POTiM9aVkOT28or2o5S
 fa0uWNTUi1a3azgNXQCKPj8YlBBtNqPcEyFxeuq3GYcG2nGhwuPh5MwSY
 CK+J6+XbBBocFRO2ZVHNAkf5ufakf/DVCjaeZRu2RXMvpT4WKwu8mFmWh
 vHDA0UW4ct0U2RiOkeMBc+YF70MtpH0b9I6h5jXDFA3Tpty0RtaOzhrWf
 VtYCbHppmTMA/jnTNw+UTRioprO9htH+Qw5X76Ta3Sf+NDAyE0jkQPWA7
 i7ikDc3OWr/uoWBoIQzlDxmzvterpQ1ZBjj0b789Weg8zLj2KRFkX61sP Q==;
X-CSE-ConnectionGUID: yv3IgAeHSdSwPoYjOmrRdw==
X-CSE-MsgGUID: o2g25Td4RBqmSZR1byB6YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="83968214"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="83968214"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 09:00:49 -0700
X-CSE-ConnectionGUID: eZlgWW7LRemswOfWKdwERQ==
X-CSE-MsgGUID: bAAjY6+SQN6JmVafgpx0EA==
X-ExtLoop1: 1
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 09:00:47 -0700
Date: Tue, 19 May 2026 18:00:45 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/4] lib/igt_kms: Add support for the
 BACKGROUND_COLOR property.
Message-ID: <20260519160045.t5d35zsxm3qoaugj@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Samala, Pranay" <pranay.samala@intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20260505194419.500600-5-dev@lankhorst.se>
 <PH7PR11MB60537336D612475147EEC667E7002@PH7PR11MB6053.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <PH7PR11MB60537336D612475147EEC667E7002@PH7PR11MB6053.namprd11.prod.outlook.com>
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

Hi Samala,,
On 2026-05-19 at 12:07:02 +0000, Samala, Pranay wrote:
> Hi Maarten,
> 
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > Maarten Lankhorst
> > Sent: Wednesday, May 6, 2026 1:14 AM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Maarten Lankhorst <dev@lankhorst.se>
> > Subject: [PATCH i-g-t 1/4] lib/igt_kms: Add support for the
> > BACKGROUND_COLOR property.
> > 
> > The background color is a 64-bits property that contains the ARGB values of
> > the background with 16 bits for each component.
> > 
> > Add support for the BACKGROUND_COLOR property, and set to pitch black as
> > the default.
> > 
> > Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> > ---
> >  lib/igt_kms.c | 4 ++++
> >  lib/igt_kms.h | 1 +
> >  2 files changed, 5 insertions(+)
> > 
> > diff --git a/lib/igt_kms.c b/lib/igt_kms.c index 99fc9fa05c..b70aefe697 100644
> > --- a/lib/igt_kms.c
> > +++ b/lib/igt_kms.c
> > @@ -731,6 +731,7 @@ const char * const
> > igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
> >  	[IGT_CRTC_VRR_ENABLED] = "VRR_ENABLED",
> >  	[IGT_CRTC_SCALING_FILTER] = "SCALING_FILTER",
> >  	[IGT_CRTC_SHARPNESS_STRENGTH] = "SHARPNESS_STRENGTH",
> > +	[IGT_CRTC_BACKGROUND_COLOR] = "BACKGROUND_COLOR",
> >  };
> > 
> >  const char * const
> > igt_connector_prop_names[IGT_NUM_CONNECTOR_PROPS] = { @@ -2737,6
> > +2738,9 @@ static void igt_crtc_reset(igt_crtc_t *crtc)
> >  	if (igt_crtc_has_prop(crtc, IGT_CRTC_SHARPNESS_STRENGTH))
> >  		igt_crtc_set_prop_value(crtc,
> > IGT_CRTC_SHARPNESS_STRENGTH, 0);
> > 
> > +	if (igt_crtc_has_prop(crtc, IGT_CRTC_BACKGROUND_COLOR))
> > +		igt_crtc_set_prop_value(crtc,
> > IGT_CRTC_BACKGROUND_COLOR,
> > +0xffff000000000000ULL);
> 
> Imho, add a short inline comment to clarify the channel packing.
> /* BACKGROUND_COLOR is ARGB16161616; set opaque black (A=0xffff, RGB=0) */
> 
> > +
> >  	crtc->out_fence_fd = -1;
> >  }
> > 
> > diff --git a/lib/igt_kms.h b/lib/igt_kms.h index a58cb5cd34..71f908d4f5
> > 100644
> > --- a/lib/igt_kms.h
> > +++ b/lib/igt_kms.h
> > @@ -165,6 +165,7 @@ enum igt_atomic_crtc_properties {
> >         IGT_CRTC_VRR_ENABLED,
> >         IGT_CRTC_SCALING_FILTER,
> >         IGT_CRTC_SHARPNESS_STRENGTH,
> > +       IGT_CRTC_BACKGROUND_COLOR,
> 
> Please use tab for indentation.

This enum needs a cleanup, it already uses spaces...
We could go with spaces for now and a cleanup in a future?

Regards,
Kamil

> Along with Kamil's suggestion, changes LGTM.
> 
> Reviewed-by: Pranay Samala <pranay.samala@intel.com>
> 
> >         IGT_NUM_CRTC_PROPS
> >  };
> > 
> > --
> > 2.53.0
> 
