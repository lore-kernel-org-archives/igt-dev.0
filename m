Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1B3CAC5B8
	for <igt-dev@archiver.kernel.org>; Thu,  2 Oct 2025 21:22:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E53CB10E853;
	Thu,  2 Oct 2025 21:22:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="deOyDVrz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C70E10E853
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Oct 2025 21:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759440155; x=1790976155;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=0FdLPl02SSINNXQx1ivZd2Pw3/LT3+eg+3xWAnaswIA=;
 b=deOyDVrzyQL0gsFUPOHBmUgQG3D0pDzBw0o7Bk/B7gtyqQOfiltn1GWW
 kkMaYOjoUZiBJri5quRN27b4sIwJu5BV15rmUr1zGQ2UeGNQx0uYErZbf
 n9Uyg0eBuxjqdPxfdY3qzt5tuDCvYlHGxBgTGkhM+FMtUXcu+VHJXbXoC
 YCFQneXMfowgdGSAPyx3eQ8LUciClttI1GHOONwc5/NBETsovh0V69bZg
 K1RJCOC/KiZBgTJ5BDAM/73GJnUL0PYFGmWq76i5Jk9Tnq+1q/W1dMeDj
 BxP2SVliiFRLWPUGf+ZoHvT40eLEqFuIvzG1K1vQksdDQoMBvx+oNaHTz w==;
X-CSE-ConnectionGUID: eHb7/M25RkmOD8RnP91fSA==
X-CSE-MsgGUID: dQQzSa23QVeSCu6nooMEoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="79158858"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="79158858"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 14:22:35 -0700
X-CSE-ConnectionGUID: lUksrmEPSSaCMMozQnx5sw==
X-CSE-MsgGUID: J9irZMkeRXSde11+kbvzeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="183434384"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.228])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 14:22:34 -0700
Date: Fri, 3 Oct 2025 00:22:31 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/7] tools/intel_display_poller: Fix long opts
Message-ID: <aN7tFzkOavE9bLOF@intel.com>
References: <20250922160950.27250-1-ville.syrjala@linux.intel.com>
 <20250922160950.27250-3-ville.syrjala@linux.intel.com>
 <254536f4-6be1-80ff-d87d-b8671f2d7bd1@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <254536f4-6be1-80ff-d87d-b8671f2d7bd1@intel.com>
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

On Thu, Oct 02, 2025 at 09:54:07PM +0200, Michał Grzelak wrote:
> On Mon, 22 Sep 2025, Ville Syrjala wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > Fix the long option handling by providing a .val for each that
> > matches the short option.
> >
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> > tools/intel_display_poller.c | 16 ++++++++--------
> > 1 file changed, 8 insertions(+), 8 deletions(-)
> >
> > diff --git a/tools/intel_display_poller.c b/tools/intel_display_poller.c
> > index 6089be3f1ffa..69906d557a37 100644
> > --- a/tools/intel_display_poller.c
> > +++ b/tools/intel_display_poller.c
> > @@ -1352,14 +1352,14 @@ int main(int argc, char *argv[])
> >
> > 	for (;;) {
> > 		static const struct option long_options[] = {
> > -			{ .name = "test", .has_arg = required_argument, },
> > -			{ .name = "pipe", .has_arg = required_argument, },
> > -			{ .name = "bit", .has_arg = required_argument, },
> > -			{ .name = "line", .has_arg = required_argument, },
> > -			{ .name = "fuzz", .has_arg = required_argument, },
> > -			{ .name = "pixel", .has_arg = no_argument, },
> > -			{ .name = "async", .has_arg = no_argument, },
> > -			{ .name = "vrr-push", .has_arg = required_argument, },
> > +			{ .name = "test", .has_arg = required_argument, .val = 't', },
> > +			{ .name = "pipe", .has_arg = required_argument, .val = 'b', },
> 
> I'm unsure about this since I can't find the definition for struct
> option,

"man getopt_long" is probably the fastest way to find it.

> but shouldn't be here a .val = 'p'? Seems like it will clash
> with --bit option. Otherwise,

Aye, good catch. I must have still been using the short option to
specify the pipe when testing this.

> 
> Reviewed-by: Michał Grzelak <michal.grzelak@intel.com>

Thanks.

Fixed the 'd' vs. 'p' fumble while pushing. And I also noticed
that a few hunks from the --dsb-id patch ended up in the 
previous patch, so I moved those over as well.

> 
> > +			{ .name = "bit", .has_arg = required_argument, .val = 'b', },
> > +			{ .name = "line", .has_arg = required_argument, .val = 'l', },
> > +			{ .name = "fuzz", .has_arg = required_argument, .val = 'f', },
> > +			{ .name = "pixel", .has_arg = no_argument, .val = 'x', },
> > +			{ .name = "async", .has_arg = no_argument, .val = 'a', },
> > +			{ .name = "vrr-push", .has_arg = required_argument, .val = 'v', },
> > 			{ },
> > 		};
> >
> > -- 
> > 2.49.1
> >
> >
> 
> BR,
> Michał


-- 
Ville Syrjälä
Intel
