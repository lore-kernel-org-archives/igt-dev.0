Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1440CCD183
	for <igt-dev@archiver.kernel.org>; Thu,  9 Oct 2025 08:52:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7460110E977;
	Thu,  9 Oct 2025 08:52:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YEawOnyA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A3B910E977
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Oct 2025 08:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759999926; x=1791535926;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=nA8F8BM6ktvqia/ghbiU0q7W+gcQeMInipH0cnCA664=;
 b=YEawOnyAYH4ucFb7/X2BIp9dcmkoqmdosBFmWTlppgEM5EiCrLHNeH07
 McjgRRADl7vXKnkRxWUGhZyYgGOYrFcPtahEz1WMH3hGS1XDY3tO/oyEi
 EZEO0uo96sapcLHgH7YusfFptyKXRzEfXBocxFPL/cHOe6U73Gu8lxkJf
 9rK7JRJG9rd4eV8QBpoXR+k2vYqlSqdHuc/i4YyfFTrMb710cwJYiPxci
 DjaKLVzyzhdZbcPin7+YuUOMNDjXVyJeZusg/05E+pjM4Hb5z0ZiyTXV0
 Ao56YJbV1zGR9foWyTH/FA7gOllalbTGWFBJMt/4sn3CCQa5tQ1ob52Js g==;
X-CSE-ConnectionGUID: MAA7Ui6AQhaPhAScQ1IqnQ==
X-CSE-MsgGUID: 58A1sUNJTo+Xra25nSQSew==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="65853504"
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; d="scan'208";a="65853504"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 01:52:06 -0700
X-CSE-ConnectionGUID: VNGkPbDbSZKVbZqzRGYJUw==
X-CSE-MsgGUID: NhvSZeW9RI+4noaigYhSug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; d="scan'208";a="180479191"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.221])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 01:52:02 -0700
Date: Thu, 9 Oct 2025 10:51:59 +0200
From: Pawel Sikora <pawel.sikora@linux.intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>, Pawel Sikora <pawel.sikora@intel.com>,
 igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Karthik B S <karthik.b.s@intel.com>
Subject: Re: [PATCH i-g-t v10 0/5] Establish MkDocs Documentation Framework
 for IGT GPU Tools
Message-ID: <20251009085159.6lsth6l7273rmylw@pawelsik-desk>
References: <20250909112741.185825-1-pawel.sikora@intel.com>
 <865f580c0697ef1df5c364841a561475d46aa9ba@intel.com>
 <87ldlme8oc.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87ldlme8oc.wl-ashutosh.dixit@intel.com>
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

Hi Ashutosh,

On Tue, Oct 07, 2025 at 01:52:35PM -0700, Dixit, Ashutosh wrote:
> On Wed, 10 Sep 2025 01:26:23 -0700, Jani Nikula wrote:
> >
> > On Tue, 09 Sep 2025, Pawel Sikora <pawel.sikora@intel.com> wrote:
> > > Dear Maintainers,
> > >
> > > I am submitting a series of patches to introduce a comprehensive
> > > documentation framework for the IGT GPU Tools project using MkDocs.
> >
> > There's been a lot of iterations in fairly quick succession, and I have
> > yet to see any comment from maintainers wrt my feedback [1].
> >
> > I'd rather see a clear statement "yeah let's go with MkDocs" than just
> > having this gradually happen without a conscious decision.
> 
> I will take a slightly different approach to this. I think Jani has a valid
> point and if this effort were starting today, I'd say go with
> sphinx/rst. But as far as I see, this series has required significant
> effort to get to this point and is almost ready to merge.
> 
> I don't know how much time/effort it will take for a similar sphinx based
> solution (Pawel would you know?), but given where we are, it seems we
> should just merge this (since this would provide some missing documentation
> immediately). And then if we think we need a sphinx based solution and
> someone can be found to do that, they can switch the documentation to the
> sphinx based solution later.

tl;dr;

The only thing I can answer here is: it will take time, but am not able to tell how much.

So, let me propose a plan that I will include in my backlog and future documentation tasks.
When I finish this, I will start conducting documentation audits in different parts
of the project soon, which will give me a better understanding of whether to stick
with or change the decision I made here:

1. Merge this
2. Port API documentation from GtkDoc to MkDocs/Sphinx
3. Unify documentation generation to one or at most two tools,
   and decide whether we want to port to Sphinx or stay with MkDocs
   at that time (there will be time to see how it works
   and potentially gather more feedback)

Longer explanation:

So, it will take time to port it to Sphinx and adjust everything, and I would like
to emphasize that my task was to:
 
* Create an upstream general documentation for the IGT GPU Tools Project, 
  which addresses a major problem: 

 GitLab Pages currently points to API documentation
 instead of general project documentation, and it should be the
 other way around. There is no general project documentation
 besides a few markdown files that are only accessible through
 the GitLab web interface.

With this effort, I am:
1) Fixing the above-mentioned problem
2) Creating something new and not changing/disrupting the existing way of
   documenting things (rst markup in test modules, API documentation, etc.)

I do care about unifying—please don't misunderstand me. 

I want it to be unified, just step-by-step, without disrupting several parts
of the project. I chose MkDocs because I know it and I am confident with it.
It is a *mature*(as Sphinx), *native tool for markdown files*(unlike Sphinx),
which are the main source for general-purpose documentation that other people use
and understand better than .rst files. I would like people to use it
(both read and write) and we can have *something* instead of *nothing* now.

KR,
Pawel

> 
> I want to elicit Pawel's feedback in particular, since he is the one doing
> this work.
> 
> Thanks.
> --
> Ashutosh
> 
> 
> >
> > Cc: Everyone from MAINTAINERS.
> >
> >
> > BR,
> > Jani.
> >
> >
> > [1] https://lore.kernel.org/r/3d83d59669d62f004a507a25510b21f9bd273410@intel.com
> >
> >
> > --
> > Jani Nikula, Intel
