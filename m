Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30196C28B30
	for <igt-dev@archiver.kernel.org>; Thu, 20 Mar 2025 13:30:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD09E10E3A2;
	Thu, 20 Mar 2025 13:30:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JalXlSUx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 786B010E3A2
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Mar 2025 13:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742477410; x=1774013410;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9Rji4qox+f+CjW1IRE4YElnA/IlWZPc4LbxtMeBKbQw=;
 b=JalXlSUxEOdJGfW9UiHVfxYpWimy27z1yOGKt3AY80ym8twDiC6jDR3O
 VYoGVfoJ5pr3w6q+uQkCEgA84ocOuZCjOrhVSeIfbU10+Q9aHfcy2EdsP
 3yklOHw9+AU2cWpYg4CO1UGc/hzFsa0THcoDbilxGZeZW24RuGy93UhXl
 Z8l+PlK7BBcAU6buHkN3VpNy1Tb6JX4crCkq1uB+yqucZi5fDODIWv1i1
 EQZMp6DXpnJjQ2B+QqaPg7+Yl3sy50x42JJEm6VPLVjLTabZYSmZn7728
 Gef8O0Y1CmKZhXfKKAZFn8TLCYD4J22xJnO2Ua+MIo2iFYoxKXUR5Ofqu Q==;
X-CSE-ConnectionGUID: LZ7yj5tETX2gW5g7kdVd3A==
X-CSE-MsgGUID: vQgmyu5qSLSKfIAflmS+pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="46463093"
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="46463093"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 06:30:10 -0700
X-CSE-ConnectionGUID: 9J56kesVRp+hom35LwCPKg==
X-CSE-MsgGUID: SioxmlNzTWCnESZIKrUu6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="123553131"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 06:30:09 -0700
Date: Thu, 20 Mar 2025 14:30:06 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org, pranay.samala@intel.com
Subject: Re: [PATCH i-g-t] tests/kms_addfb_basic: Split tests into subtest
 groups
Message-ID: <20250320133006.doxlplrllaxld7f3@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>, igt-dev@lists.freedesktop.org,
 pranay.samala@intel.com
References: <20250312103008.613087-1-karthik.b.s@intel.com>
 <20250312204328.mvo7qdvryx77vp72@kamilkon-desk.igk.intel.com>
 <17c91321-4885-4649-a8dc-4438b782ae26@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <17c91321-4885-4649-a8dc-4438b782ae26@intel.com>
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

Hi Karthik,
On 2025-03-14 at 15:13:57 +0530, Karthik B S wrote:
> Hi Kamil,
> 
> On 3/13/2025 2:13 AM, Kamil Konieczny wrote:
> > Hi Karthik,
> > On 2025-03-12 at 16:00:08 +0530, Karthik B S wrote:
> > > Multiple subtest groups exist in kms_addfb_basic with individual
> > > igt_fixutre calls. Split these using igt_subtest_group so that any
> > > failure in the fixture of one of the individual subtest groups don't
> > > affect the results of subtests in other groups.
> > > 
> > > Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> > > ---
> > >   tests/kms_addfb_basic.c | 15 ++++++++++-----
> > >   1 file changed, 10 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
> > > index e5ff9ea32..268e4e0e4 100644
> > > --- a/tests/kms_addfb_basic.c
> > > +++ b/tests/kms_addfb_basic.c
> > > @@ -989,15 +989,20 @@ igt_main
> > >   		igt_require(has_addfb2_iface(fd));
> > >   	}
> > > -	invalid_tests(fd);
> > > +	igt_subtest_group
> > > +		invalid_tests(fd);
> > > -	pitch_tests(fd);
> > > +	igt_subtest_group
> > > +		pitch_tests(fd);
> > > -	prop_tests(fd);
> > > +	igt_subtest_group
> > > +		prop_tests(fd);
> > > -	master_tests(fd);
> > > +	igt_subtest_group
> > > +		master_tests(fd);
> > > -	tiling_tests(fd);
> > > +	igt_subtest_group
> > > +		tiling_tests(fd);
> > I looked into those tests and imho this needs a major refactor,
> > for example there should not be any igt_assert() in a fixture.
> > Generally igt tests works ok for one fixture in begin, last one
> > at igt_main() end. When used in-between it becomes more
> > complicated to handle cleanup.
> 
> Thank you for the review.
> 
> I tried out by inducing an error using an igt_assert(0) within the
> igt_fixture of a subtest group and verified that the this change handles the
> issue by not failing the subtests in other subtest groups. As agreed
> offline, will use this as a quick fix to handle failures in the current
> design and for the long run will check if there is a way these fb
> tests(kms_addfb_basic, kms_getfb) can be redesigned to be more robust.
> 
> Thanks,
> Karthik.B.S

Yes, after a second reading this could be a first step
followed by refactoring later, so as this could improve
testing a little this is

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> > 
> > Regards,
> > Kamil
> > 
> > >   	igt_subtest_group {
> > >   		igt_fixture
> > > -- 
> > > 2.43.0
> > > 
