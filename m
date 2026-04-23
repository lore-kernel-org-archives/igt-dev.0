Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7225FF99368
	for <igt-dev@archiver.kernel.org>; Thu, 23 Apr 2026 10:40:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2264010E323;
	Thu, 23 Apr 2026 10:40:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZBgvaWTb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC3FC10E323
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Apr 2026 10:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776940812; x=1808476812;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=9zZ1UbrvwXwxjf14nI5t/+13omFrDm8QMD179qWegCU=;
 b=ZBgvaWTbstWAyQPz0ztxW4ftpaYpG5ZjgwN6TvncX8Rr9+QJysypQB23
 JVN/GmH1YVMet2xYPihHLpGTcqpyF0B/NKz198Bh7DIDuPp07xTJnzM26
 CsytWbuSsuCr6LjvzberT4CzZH1tTk9e0fqL2isUvyNkO6FblxUNKWIGF
 IqFLD87RJ2w7HHR4xmtRT2iK+FXAlVb9UajzhxrMKbjrHBx2daqziASG1
 vCWw0vRW+sGyTSm7VRz2cg2sc4m8tpEFap+ZoyKghENN6WvNPDnXbVuxr
 6mh4eZ3XcvTdwJuClvu5WTzX5EUS3Glu6iLv/DGqegSJKnNJdVocfeSui g==;
X-CSE-ConnectionGUID: Wng82BQ/QUCu4ziuu84lCA==
X-CSE-MsgGUID: tGPuFRU/RZ+rUsOUWDPluQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="81513472"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="81513472"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 03:40:12 -0700
X-CSE-ConnectionGUID: GJdPt6MYR4u19mcs4sIZUQ==
X-CSE-MsgGUID: 3VX/LcL/QjayyOsd3G90OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="232530704"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.188])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 03:40:09 -0700
Date: Thu, 23 Apr 2026 13:40:06 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jing-Ping Jan <jingpingjan@google.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2] tests/kms: correct index validation logic
Message-ID: <aen3BgaPDWCUe-sH@intel.com>
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

On Thu, Apr 23, 2026 at 05:21:02PM +0800, Jing-Ping Jan wrote:
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

We already swap the data. Just need to *also* swap the pointers
so that they track their data correctly. Then the asserts will
make sense.

-- 
Ville Syrjälä
Intel
