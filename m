Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 260D0FA1FD7
	for <igt-dev@archiver.kernel.org>; Wed, 22 Apr 2026 17:06:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B077410EA5E;
	Wed, 22 Apr 2026 17:06:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="deayP70A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CC6F10EA5E
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Apr 2026 17:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776877562; x=1808413562;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=umGsQaz/dQYbokLa0nr4ODuKv/gjs4neymXwDPsjoBQ=;
 b=deayP70AvACDyLu+ybq2GG4PLVslsVXSi3a7FjNk6TWy8m+lL5yhhUm5
 NR5mxBkAf3zZ62zGtUJJMxTc/WwTnbmEYeNCXUNdlLl4fsnuzbpqJGylE
 qdN2IpQjBmJpBVk1GWEzEOF+2Z4kvkkVXyqa752X0FwMl37BGy7FZNMV9
 +iVgr/KVHFwT/Uj/0ua3CljMahdQO620Q/UldiaeNiF+q5kS6It58z76O
 0kCmx4BUtlgOX/O010kkzhCYcfkKkPKiy4JKopSCdzC8QkUMNZMl5CKdD
 yJBU605zil1SPNKu47ShlQdcCD9dgUhtJRdw5W/bScHKQli5X5cgbuDlK g==;
X-CSE-ConnectionGUID: 06uVIVBcQJi1mgvPOoTR2Q==
X-CSE-MsgGUID: 0GdGxRmMSJK01X+rpM+IrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="77718298"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="77718298"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 10:06:01 -0700
X-CSE-ConnectionGUID: pScr0MkEScWrV8zl9jOupg==
X-CSE-MsgGUID: z4917JcYR3uGdDzueWc3SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="270522620"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 10:06:00 -0700
Date: Wed, 22 Apr 2026 19:05:57 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Jing-Ping Jan <jingpingjan@google.com>, igt-dev@lists.freedesktop.org,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH i-g-t v2] tests/kms: correct index validation logic
Message-ID: <20260422170557.434ohgvhvjzqmrws@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Jing-Ping Jan <jingpingjan@google.com>,
 igt-dev@lists.freedesktop.org,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <b4757a01-6cff-4c92-b7ba-5a6578c7c06a@intel.com>
 <20260421064342.2851479-2-jingpingjan@google.com>
 <eb51511e2445b2cd19dda662bf1f402ed92887e1@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eb51511e2445b2cd19dda662bf1f402ed92887e1@intel.com>
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

Hi Jani,
On 2026-04-21 at 15:02:01 +0300, Jani Nikula wrote:
> On Tue, 21 Apr 2026, Jing-Ping Jan <jingpingjan@google.com> wrote:
> > Based on the original implementation and the comment above the function,
> > it appears the expected behavior is for the plane indices to remain
> > consistent with those in crtc->planes. Therefore, after swapping the old
> > and new primary planes, we must update the index in igt_plane_t to
> > ensure it matches the corresponding index in crtc->planes.
> >
> > Therefore, we should expect the indices of the old and new primary
> > planes to remain unchanged after swapping them.
> >
> > Fixes: ac37e1174cc4 ("lib/kms: Pimp the primary plane swapping")
> 
> With Fixes: it's customary to Cc the author and reviewer(s).
> 
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> > Signed-off-by: Jing-Ping Jan <jingpingjan@google.com>
> > ---
> > v2:
> >   - Add Fixes tag to the commit message.
> >  lib/igt_kms.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> > index bec96f267..405a04640 100644
> > --- a/lib/igt_kms.c
> > +++ b/lib/igt_kms.c
> > @@ -2982,8 +2982,8 @@ void igt_display_reset_outputs(igt_display_t *display)
> 

Lets have for simplicity simple struct { char name; int index; }
and old -> { A, 0 }, new -> { F, 7 }

> The whole context here is:
> 
> 			if (new_primary->index != 0) {
> 				igt_assert(old_primary != new_primary);
> 
> 				igt_assert_eq(old_primary->index, 0);
> 				igt_assert_neq(new_primary->index, 0);
> 
> >  				igt_swap(*old_primary, *new_primary);

Now old -> { F, 7 }, new -> { A, 0 }

> >  				igt_swap(old_primary->index, new_primary->index);

Now old -> { F, 0 }, new -> { A, 7 }

Or do I miss something?

Regards,
Kamil

> >  
> > -				igt_assert_neq(old_primary->index, 0);
> > -				igt_assert_eq(new_primary->index, 0);
> > +				igt_assert_eq(old_primary->index, 0);
> > +				igt_assert_neq(new_primary->index, 0);
> 
> Why do you expect these to remain the same as before the swapping?
> That's why we are swapping.
> 
> >  			} else {
> >  				igt_assert(old_primary == new_primary);
> 
> -- 
> Jani Nikula, Intel
