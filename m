Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D4BC44536
	for <igt-dev@archiver.kernel.org>; Wed, 21 Jan 2026 15:09:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDB2D10E0A3;
	Wed, 21 Jan 2026 15:09:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YAXyHXQG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26B2010E0A3
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 15:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769008191; x=1800544191;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=MBb23IwJCfictsuTLgS3tXW/Fi0npRSiJzh5BLiSRMw=;
 b=YAXyHXQGrjAZ/ownEC2y2/SkCvuHENQJMiEYX78PFQ6TCxnRx3V8v0e+
 6xxmEniEbmSVlP5Jnt82JmOwXi/Y/L6kQl+zagVrxVcgBX7ZEYLCWN2Db
 CRP+G0yzKzJqymoPn1tAqj5+h03cXsR+42+d5lPOUtP8Ib4+sDXTzrXzv
 c/dsvUFvlJ3hmxOBHUaAoOep45ok6MRwrmWBkivjrzZO9xPtFjTjF4RhC
 hQM/wAxj3cXnADWfHqbcpZtpWBMqV8YAeiXnIZmBMFc1AI2mlnvv7zK8B
 VGQqoW0ieIw/gepvDJryQH3xwuOMDo+OJwmwXBNvepBbTsYns8b3/6/wv g==;
X-CSE-ConnectionGUID: DIJ32U27SHe7pK4IcadwOQ==
X-CSE-MsgGUID: QmMTHCM1T52z12qae+7lCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="69962038"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="69962038"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 07:09:50 -0800
X-CSE-ConnectionGUID: 4b7+nbeJTCSI0nJi0pKdKw==
X-CSE-MsgGUID: oNjIL/VwS5eIsksY90qJoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="210908823"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.164])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 07:09:48 -0800
Date: Wed, 21 Jan 2026 17:09:46 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 08/12] lib/kms: Add igt_crtc_t based CRC wrappers
Message-ID: <aXDsOuJe7iOV9Cab@intel.com>
References: <20260120171656.15840-1-ville.syrjala@linux.intel.com>
 <20260120171656.15840-9-ville.syrjala@linux.intel.com>
 <533fc18053baa268f1188aa2dc589c51a522a703@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <533fc18053baa268f1188aa2dc589c51a522a703@intel.com>
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

On Wed, Jan 21, 2026 at 11:33:26AM +0200, Jani Nikula wrote:
> On Tue, 20 Jan 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > Add wrappers for igt_pipe_crc_new*() that take igt_crtc_t rather
> > than the bare crtc index. Should help eliminate the pipe usage
> > from tests.
> 
> I think the basic idea is good, but a couple of comments inline.
> 
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> 
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  lib/igt_kms.c | 14 ++++++++++++++
> >  lib/igt_kms.h |  4 ++++
> >  2 files changed, 18 insertions(+)
> >
> > diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> > index 74ad82d77dd3..901bbfab5934 100644
> > --- a/lib/igt_kms.c
> > +++ b/lib/igt_kms.c
> > @@ -59,6 +59,7 @@
> >  #include "intel_chipset.h"
> >  #include "igt_debugfs.h"
> >  #include "igt_device.h"
> > +#include "igt_pipe_crc.h"
> >  #include "igt_sysfs.h"
> >  #include "sw_sync.h"
> >  #ifdef HAVE_CHAMELIUM
> > @@ -5299,6 +5300,19 @@ int igt_output_preferred_vrefresh(igt_output_t *output)
> >  		return 60;
> >  }
> >  
> > +igt_pipe_crc_t *igt_crtc_crc_new(igt_crtc_t *crtc, const char *source)
> > +{
> > +	return igt_pipe_crc_new(crtc->display->drm_fd, crtc->crtc_offset,
> > +				source);
> > +}
> > +
> > +igt_pipe_crc_t *igt_crtc_crc_new_nonblock(igt_crtc_t *crtc, const char *source)
> > +{
> > +	return igt_pipe_crc_new_nonblock(crtc->display->drm_fd,
> > +					 crtc->crtc_offset,
> > +					 source);
> > +}
> > +
> >  static const char *igt_crtc_name(igt_crtc_t *crtc)
> >  {
> >  	if (crtc == NULL)
> > diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> > index 71a2f2c4d89c..b291673c2f7f 100644
> > --- a/lib/igt_kms.h
> > +++ b/lib/igt_kms.h
> > @@ -584,6 +584,10 @@ static inline igt_crtc_t *igt_crtc_for_pipe(igt_display_t *display, enum pipe pi
> >  	return &display->pipes[pipe];
> >  }
> >  
> > +typedef struct _igt_pipe_crc igt_pipe_crc_t;
> 
> So this is a dupe typedef, also defined in igt_pipe_crc.h. It works,
> it's probably better than including the other header here, but also a
> bit meh.

Yeah, forward declarations seem be to be painful with typedefs.

> 
> Another idea is naming this based on crtc instead of pipe, even if "crtc
> crc" is a mouthful:
> 
> typedef struct _igt_pipe_crc igt_crtc_crc_t;
> 
> I think it'll work, the types are compatible with the underlying struct
> being the same. So we could (gradually) convert from pipe_crc to
> crtc_crc.

Shrug.

> 
> With the wrappers being in igt_kms.[ch], is the idea that most tests
> could cease to include igt_pipe_crc.h after the conversions?

I expect the tests will need a bunch of other stuff from there
still.

Originally I put the crtc wrappers into igt_pipe_crc.[ch], but
then I needed to add forward declarations and includes for
igt_crtc_t which felt even worse.

-- 
Ville Syrjälä
Intel
