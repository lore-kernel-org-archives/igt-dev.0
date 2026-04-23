Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB3CF99368
	for <igt-dev@archiver.kernel.org>; Thu, 23 Apr 2026 10:27:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ED6910F084;
	Thu, 23 Apr 2026 10:27:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G/GUv9PX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ACA110E312
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Apr 2026 10:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776940063; x=1808476063;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=fE1vVhEvI59WdlS5SrNW+5exbyt4pfTxGuPKk7eCGU0=;
 b=G/GUv9PXH2fDCKleBbMQrzrU5hOj8hevQc7rgWKM0ceUOfQTMe/pp8U7
 LhNG4ITNhGr99ZA0U7CgdG8ouUlVw8JbEycFEMQZ98XkWsluf4tA+hNCL
 qUp3PVYCgJ5fSwZi0JT6H5D5Wlv7/Ovqq2LqcZ4UvixNfeIsw380E1Kbf
 QtMwces/epNf3zuekrJqGoLE9eJzksyl1HKqxYPmZ9GTUuNYVDQSsVUph
 823tJbnr6kEFJR/BZhiqw6y45pdGynNVEM2ZJoextm2dmBJZZmSO2jY51
 uC6sIx6y/CqdTMXszxze5LPMjy//uEOWjKBGsmN+P7ic3qQR7g2pTelaI w==;
X-CSE-ConnectionGUID: as9yLlTRRTmFHSwzbZ3enQ==
X-CSE-MsgGUID: O0BZjijdSpurZoIuCuT9+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="100557506"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="100557506"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 03:27:43 -0700
X-CSE-ConnectionGUID: y9CwP6WsT/ST7+M6isLFDg==
X-CSE-MsgGUID: ShFygwtASB6Jbhsq2jk+fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="237614193"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 03:27:41 -0700
Date: Thu, 23 Apr 2026 12:27:24 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jing-Ping Jan <jingpingjan@google.com>
Cc: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2] tests/kms: correct index validation logic
Message-ID: <20260423102724.cn775vsx2ynekmxe@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jing-Ping Jan <jingpingjan@google.com>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org
References: <b4757a01-6cff-4c92-b7ba-5a6578c7c06a@intel.com>
 <20260421064342.2851479-2-jingpingjan@google.com>
 <eb51511e2445b2cd19dda662bf1f402ed92887e1@intel.com>
 <20260422170557.434ohgvhvjzqmrws@kamilkon-DESK.igk.intel.com>
 <aekEACGEcS2QGQgV@intel.com>
 <CAMYCwo5YH+WBOGbDu4uVPgRkQ_N1T3bTZ2fdUSMa7dr+Jvzjqw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMYCwo5YH+WBOGbDu4uVPgRkQ_N1T3bTZ2fdUSMa7dr+Jvzjqw@mail.gmail.com>
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

Hi Jing-Ping,
On 2026-04-23 at 17:21:02 +0800, Jing-Ping Jan wrote:
> On Thu, Apr 23, 2026 at 1:23 AM Ville Syrjälä
> <ville.syrjala@linux.intel.com> wrote:
> >
> > On Wed, Apr 22, 2026 at 07:05:57PM +0200, Kamil Konieczny wrote:
> > > Hi Jani,
> > > On 2026-04-21 at 15:02:01 +0300, Jani Nikula wrote:
> > > > On Tue, 21 Apr 2026, Jing-Ping Jan <jingpingjan@google.com> wrote:
> > > > > Based on the original implementation and the comment above the function,
> > > > > it appears the expected behavior is for the plane indices to remain
> > > > > consistent with those in crtc->planes. Therefore, after swapping the old
> > > > > and new primary planes, we must update the index in igt_plane_t to
> > > > > ensure it matches the corresponding index in crtc->planes.
> > > > >
> > > > > Therefore, we should expect the indices of the old and new primary
> > > > > planes to remain unchanged after swapping them.
> > > > >
> > > > > Fixes: ac37e1174cc4 ("lib/kms: Pimp the primary plane swapping")
> > > >
> > > > With Fixes: it's customary to Cc the author and reviewer(s).
> > > >
> > > > Cc: Jani Nikula <jani.nikula@intel.com>
> > > > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>

I am sorry, I went ahead and didn't noticed this thread and
I did a merge of v2. So now, based on discussion below,
if a fix should be

	igt_swap(old_primary, new_primary);

or rename of vars and(or not?) the swap, first it needs a revert,
then a proper fix.

Regards,
Kamil

> > > >
> > > > > Signed-off-by: Jing-Ping Jan <jingpingjan@google.com>
> > > > > ---
> > > > > v2:
> > > > >   - Add Fixes tag to the commit message.
> > > > >  lib/igt_kms.c | 4 ++--
> > > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> > > > > index bec96f267..405a04640 100644
> > > > > --- a/lib/igt_kms.c
> > > > > +++ b/lib/igt_kms.c
> > > > > @@ -2982,8 +2982,8 @@ void igt_display_reset_outputs(igt_display_t *display)
> > > >
> > >
> > > Lets have for simplicity simple struct { char name; int index; }
> > > and old -> { A, 0 }, new -> { F, 7 }
> > >
> > > > The whole context here is:
> > > >
> > > >                     if (new_primary->index != 0) {
> > > >                             igt_assert(old_primary != new_primary);
> > > >
> > > >                             igt_assert_eq(old_primary->index, 0);
> > > >                             igt_assert_neq(new_primary->index, 0);
> > > >
> > > > >                           igt_swap(*old_primary, *new_primary);
> > >
> > > Now old -> { F, 7 }, new -> { A, 0 }
> > >
> > > > >                           igt_swap(old_primary->index, new_primary->index);
> > >
> > > Now old -> { F, 0 }, new -> { A, 7 }
> > >
> > > Or do I miss something?
> >
> > The problem is the pointers weren't swapped.
> >
> > [0] = { 0, A } <- old
> > [1] = { 1, B } <- new
> >
> > step1: full swap
> > [0] = { 1, B } <- old
> > [1] = { 0, A } <- new
> >
> > step2: index swap
> > [0] = { 0, B } <- old
> > [1] = { 1, A } <- new
> >
> > So after this I think the proper fix is to also swap the pointers.
> > Then the asserts after the swap start to make actual sense.
> >
> > step3: pointer swap
> > [0] = { 0, B } <- new
> > [1] = { 1, A } <- old
> >
> > >
> > > > >
> > > > > -                         igt_assert_neq(old_primary->index, 0);
> > > > > -                         igt_assert_eq(new_primary->index, 0);
> > > > > +                         igt_assert_eq(old_primary->index, 0);
> > > > > +                         igt_assert_neq(new_primary->index, 0);
> > > >
> > > > Why do you expect these to remain the same as before the swapping?
> > > > That's why we are swapping.
> > > >
> > > > >                   } else {
> > > > >                           igt_assert(old_primary == new_primary);
> > > >
> > > > --
> > > > Jani Nikula, Intel
> >
> > --
> > Ville Syrjälä
> > Intel
> 
> I don’t believe swapping the pointers is the right approach.
> Currently, old_primary and new_primary point to the first element and
> the original primary plane in crtc->planes, respectively. Swapping the
> pointers merely redirects them without addressing the underlying data
> structure.
> 
> According to the original design(Commit 58a5a2d5), the logic should
> swap the plane indices first and then swap the entire plane objects
> between the two pointers. This ensures that the first element in the
> pipe->planes array remains the primary plane. Therefore, it makes more
> sense to validate that the index of the first element is 0 while the
> other index is non-zero.
> 
> Alternatively, we could rename old_primary to first_plane and
> new_primary to primary_plane to make the logic more transparent.
> 
> Regards,
> Jing-Ping Jan
