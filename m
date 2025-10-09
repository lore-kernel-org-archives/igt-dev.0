Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D08CCD184
	for <igt-dev@archiver.kernel.org>; Thu,  9 Oct 2025 15:08:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B1310EA89;
	Thu,  9 Oct 2025 15:08:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K6OalV58";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C745810EA89
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Oct 2025 15:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760022490; x=1791558490;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=eP/qVGqzctmGXsK3urJOX4vI4A1/b8VHyD81w/ZEK+c=;
 b=K6OalV58URpcLlKPq+N9teuRThIBXgAOb8ZXS/QOohc4N2ivKEtfRsMj
 ZZ8xNb3n3htk8K1g4k5zBID3/RbciG2pQyC21Lco1YRlI/am4eYnlqqUh
 LW6zrFpRNI8m4inrYrjYxzI53cLEi2e5am75K8XFwwLqvNkzlxVoGJNX/
 iI2n/guzs7GKbTZTqvumoDYPgnleUw8GVsN3Q+PTURZ5ZJqR0EuZiW0MJ
 Zf6fvPiVYf96OjrF6pxPukvLBlxZxgo6Zg6EKSdXTRVestU+wo0AhDE/I
 1DX1VwPO45o+MSro9PP9nrQN15cQJfypLMfV5l0Nm+wzWJFNbvR7xvbUb Q==;
X-CSE-ConnectionGUID: RmOndRR8ToyRC3o1nsJ1wA==
X-CSE-MsgGUID: QpPxnxB0Q0uZEgtJgos1IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="62331005"
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="62331005"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 08:08:10 -0700
X-CSE-ConnectionGUID: h560dG3gSz2BWPgPpxqdNg==
X-CSE-MsgGUID: zxHb1h/2Q3iRBIsZFEEt4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="180681740"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 08:08:07 -0700
Date: Thu, 9 Oct 2025 17:08:05 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>, igt-dev@lists.freedesktop.org,
 Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Karthik B S <karthik.b.s@intel.com>
Subject: Re: [PATCH i-g-t v10 0/5] Establish MkDocs Documentation Framework
 for IGT GPU Tools
Message-ID: <20251009150805.6mt2bqzdogaezq4t@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 igt-dev@lists.freedesktop.org,
 Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Karthik B S <karthik.b.s@intel.com>
References: <20250909112741.185825-1-pawel.sikora@intel.com>
 <865f580c0697ef1df5c364841a561475d46aa9ba@intel.com>
 <87ldlme8oc.wl-ashutosh.dixit@intel.com>
 <4bf159d87af719a5c820f32e5430ea252ff06e3a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4bf159d87af719a5c820f32e5430ea252ff06e3a@intel.com>
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
On 2025-10-08 at 11:07:00 +0300, Jani Nikula wrote:
> On Tue, 07 Oct 2025, "Dixit, Ashutosh" <ashutosh.dixit@intel.com> wrote:
> > On Wed, 10 Sep 2025 01:26:23 -0700, Jani Nikula wrote:
> >>
> >> On Tue, 09 Sep 2025, Pawel Sikora <pawel.sikora@intel.com> wrote:
> >> > Dear Maintainers,
> >> >
> >> > I am submitting a series of patches to introduce a comprehensive
> >> > documentation framework for the IGT GPU Tools project using MkDocs.
> >>
> >> There's been a lot of iterations in fairly quick succession, and I have
> >> yet to see any comment from maintainers wrt my feedback [1].
> >>
> >> I'd rather see a clear statement "yeah let's go with MkDocs" than just
> >> having this gradually happen without a conscious decision.
> >
> > I will take a slightly different approach to this. I think Jani has a valid
> > point and if this effort were starting today, I'd say go with
> > sphinx/rst. But as far as I see, this series has required significant
> > effort to get to this point and is almost ready to merge.
> 
> I don't think it had taken a significant effort by the time I first
> brought this up, and I kind of expected to get feedback from the
> maintainers *before* a lot more effort had been put into it.
> 
> And now it looks like what I feared, it just gradually happened and
> nobody stood up and made a decision.
> 
> 
> BR,
> Jani.
> 

Imho this is not touching documentation for API, which uses gtkdoc,
only general info spreaded in few IGT text files, so using mkdoc is
fine by me. Also, there are converters in both ways to/from rst and
mkdocs, if anyone in future wants to do it. This also touches only
one link on gitlab: https://drm.pages.freedesktop.org/igt-gpu-tools
and also make our IGT page more attractive and more accesible for
colorblind people.
Moving from mkdoc to sphinx also seems possible with more html/ccs
effort needed.

If anything, we could think of replacing gtkdoc with sphinx.

In conclusion, lets stay with mkdocs for now.

Regards,
Kamil

> 
> >
> > I don't know how much time/effort it will take for a similar sphinx based
> > solution (Pawel would you know?), but given where we are, it seems we
> > should just merge this (since this would provide some missing documentation
> > immediately). And then if we think we need a sphinx based solution and
> > someone can be found to do that, they can switch the documentation to the
> > sphinx based solution later.
> >
> > I want to elicit Pawel's feedback in particular, since he is the one doing
> > this work.
> >
> > Thanks.
> > --
> > Ashutosh
> >
> >
> >>
> >> Cc: Everyone from MAINTAINERS.
> >>
> >>
> >> BR,
> >> Jani.
> >>
> >>
> >> [1] https://lore.kernel.org/r/3d83d59669d62f004a507a25510b21f9bd273410@intel.com
> >>
> >>
> >> --
> >> Jani Nikula, Intel
> 
> -- 
> Jani Nikula, Intel
