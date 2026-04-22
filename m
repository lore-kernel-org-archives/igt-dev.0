Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE34FA1FD6
	for <igt-dev@archiver.kernel.org>; Wed, 22 Apr 2026 17:23:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74DCD10E093;
	Wed, 22 Apr 2026 17:23:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IEny9QvE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7447310E090
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Apr 2026 17:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776878597; x=1808414597;
 h=date:from:to:subject:message-id:references:mime-version:
 content-transfer-encoding:in-reply-to;
 bh=T9p8c88KMyU2hfazIyaq6FATcPge6s/Hy6Mx0gwkGXA=;
 b=IEny9QvEiBP/rZvqzGW7CQGvDj3NF4K+da+sSA60/et/8jXCEVj7DbF5
 Yd9z/T7a0vU6MWFbMqU22WNEbZFeQhnsVpiwQ7onynawlg+ilo0uinOku
 1lA+fCzEQF3u3XdeM7sbVVGl3GbPtDy3j63chCaoHpc+sFHxNWArBrKvA
 gFs+8ciXvCBO5NpPczvEG+3lAppUNeen12Bd6vTpwf3Vc4K+PnjFF1h3J
 Q1LbMQNbkmhw4/wzsDpx/DlEZ8KgZ5hxk3hZzSgaR7W4pQxWT8yQZStA0
 m9+xoFm4zT8fJVDPiSe68EqbNEbPdBlzlSsAKYnqSR3JzcT5R0UsVTnMi Q==;
X-CSE-ConnectionGUID: uT9E1gqSS1KGM9eoAzPGsQ==
X-CSE-MsgGUID: wmNCnbKYR6aSfvx9ITa7Vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="100493779"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="100493779"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 10:23:17 -0700
X-CSE-ConnectionGUID: 9T3IgK00QeS24iRFuwgiuQ==
X-CSE-MsgGUID: MHMVGDzUTVGWT2UVGuOELg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="255890689"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.10])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 10:23:15 -0700
Date: Wed, 22 Apr 2026 20:23:12 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Jing-Ping Jan <jingpingjan@google.com>, igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2] tests/kms: correct index validation logic
Message-ID: <aekEACGEcS2QGQgV@intel.com>
References: <b4757a01-6cff-4c92-b7ba-5a6578c7c06a@intel.com>
 <20260421064342.2851479-2-jingpingjan@google.com>
 <eb51511e2445b2cd19dda662bf1f402ed92887e1@intel.com>
 <20260422170557.434ohgvhvjzqmrws@kamilkon-DESK.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260422170557.434ohgvhvjzqmrws@kamilkon-DESK.igk.intel.com>
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

On Wed, Apr 22, 2026 at 07:05:57PM +0200, Kamil Konieczny wrote:
> Hi Jani,
> On 2026-04-21 at 15:02:01 +0300, Jani Nikula wrote:
> > On Tue, 21 Apr 2026, Jing-Ping Jan <jingpingjan@google.com> wrote:
> > > Based on the original implementation and the comment above the function,
> > > it appears the expected behavior is for the plane indices to remain
> > > consistent with those in crtc->planes. Therefore, after swapping the old
> > > and new primary planes, we must update the index in igt_plane_t to
> > > ensure it matches the corresponding index in crtc->planes.
> > >
> > > Therefore, we should expect the indices of the old and new primary
> > > planes to remain unchanged after swapping them.
> > >
> > > Fixes: ac37e1174cc4 ("lib/kms: Pimp the primary plane swapping")
> > 
> > With Fixes: it's customary to Cc the author and reviewer(s).
> > 
> > Cc: Jani Nikula <jani.nikula@intel.com>
> > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > 
> > > Signed-off-by: Jing-Ping Jan <jingpingjan@google.com>
> > > ---
> > > v2:
> > >   - Add Fixes tag to the commit message.
> > >  lib/igt_kms.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> > > index bec96f267..405a04640 100644
> > > --- a/lib/igt_kms.c
> > > +++ b/lib/igt_kms.c
> > > @@ -2982,8 +2982,8 @@ void igt_display_reset_outputs(igt_display_t *display)
> > 
> 
> Lets have for simplicity simple struct { char name; int index; }
> and old -> { A, 0 }, new -> { F, 7 }
> 
> > The whole context here is:
> > 
> > 			if (new_primary->index != 0) {
> > 				igt_assert(old_primary != new_primary);
> > 
> > 				igt_assert_eq(old_primary->index, 0);
> > 				igt_assert_neq(new_primary->index, 0);
> > 
> > >  				igt_swap(*old_primary, *new_primary);
> 
> Now old -> { F, 7 }, new -> { A, 0 }
> 
> > >  				igt_swap(old_primary->index, new_primary->index);
> 
> Now old -> { F, 0 }, new -> { A, 7 }
> 
> Or do I miss something?

The problem is the pointers weren't swapped.

[0] = { 0, A } <- old
[1] = { 1, B } <- new

step1: full swap
[0] = { 1, B } <- old
[1] = { 0, A } <- new

step2: index swap
[0] = { 0, B } <- old
[1] = { 1, A } <- new

So after this I think the proper fix is to also swap the pointers.
Then the asserts after the swap start to make actual sense.

step3: pointer swap
[0] = { 0, B } <- new
[1] = { 1, A } <- old

> 
> > >  
> > > -				igt_assert_neq(old_primary->index, 0);
> > > -				igt_assert_eq(new_primary->index, 0);
> > > +				igt_assert_eq(old_primary->index, 0);
> > > +				igt_assert_neq(new_primary->index, 0);
> > 
> > Why do you expect these to remain the same as before the swapping?
> > That's why we are swapping.
> > 
> > >  			} else {
> > >  				igt_assert(old_primary == new_primary);
> > 
> > -- 
> > Jani Nikula, Intel

-- 
Ville Syrjälä
Intel
