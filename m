Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF6FCF9C5B
	for <igt-dev@archiver.kernel.org>; Mon, 23 Sep 2024 07:58:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF6C10E101;
	Mon, 23 Sep 2024 07:58:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VuFBSluE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C205D10E101
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 07:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727078279; x=1758614279;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jl7NPEoANO7vWENDPbsIb83etUK+bBUdIz/akxKwzAw=;
 b=VuFBSluEngzV9hFWGdEyiDCw2tVfW1YcB1FK1cEws/KDF7wtEdtCrIcZ
 bepQuO/QNtgxhJFypA4yQiKWQjHptHbw5Xx0n3Lf9t2MgkX/SL9RW78D9
 uIkKNTJGCGhPkCftvy60mjTwMHiMPpIPCysACPABArrhq8EE1FJ8SQ1e6
 L43Dd+CHc0aOrf+1shlX0/1gAnPyiRElh6wKg5PP0jx88MZ253kTaHsLY
 u7IfWkbW6o5/dfXOLIKTozKRTgiTnN6rbc+CBMaB5bDWvv3EI3pzEiVD/
 9MCK9JBBNOpVCIEWroeCbYQZJ7T3O9JT1URza2FC8dXZPhIPqWBH66oZR Q==;
X-CSE-ConnectionGUID: dV25V/C+RAOdjQNzxmpzWA==
X-CSE-MsgGUID: RcQJznPDSuqNqRoVZqPkRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="48535172"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="48535172"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 00:57:59 -0700
X-CSE-ConnectionGUID: H455QdnbQrqiVPvN/pw/gA==
X-CSE-MsgGUID: k8k/2GshTWGUDUio7+ja4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="101835464"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.58])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 00:57:54 -0700
Date: Mon, 23 Sep 2024 09:57:51 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>,
 "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>
Subject: Re: [PATCH i-g-t v7 00/16] Test coverage for GPU debug support
Message-ID: <20240923075751.cswjxy7oo2e57djs@zkempczy-mobl2>
References: <20240918113017.144687-1-christoph.manszewski@intel.com>
 <857cb77c9n.wl-ashutosh.dixit@intel.com>
 <9dc49f36-4a59-4503-83e7-aed67a305017@intel.com>
 <854j6a71fp.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <854j6a71fp.wl-ashutosh.dixit@intel.com>
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

On Fri, Sep 20, 2024 at 09:08:26AM -0700, Dixit, Ashutosh wrote:
> On Fri, 20 Sep 2024 05:57:14 -0700, Manszewski, Christoph wrote:
> >
> 
> Hi Christoph,
> 
> > Hi Ashutosh,
> >
> > On 19.09.2024 20:02, Dixit, Ashutosh wrote:
> > > On Wed, 18 Sep 2024 04:30:01 -0700, Christoph Manszewski wrote:
> > >>
> > >> Hi,
> > >>
> > >> In this series the eudebug kernel and validation team would like to
> > >> add test coverage for GPU debug support recently proposed as an RFC.
> > >> (https://patchwork.freedesktop.org/series/136572/)
> > >>
> > >
> > > Something got merged from this series but seems there are a bunch of
> > > warnings. Please fix.
> > >
> > > $ ninja -C build
> > > ninja: Entering directory `build'
> > > [427/1905] Generating lib/iga64_generated_codes.c with a custom command
> > > iga64 assemblies not changed, reusing pre-compiled file ../lib/iga64_generated_codes.c.
> > > [1899/1905] Generating docs/testplan/xe_tests.rst with a custom command
> > > xe_exec_sip_eudebug.testlist: Testlist file not found.
> > > xe_eudebug_online.testlist: Testlist file not found.
> > > xe_eudebug.testlist: Testlist file not found.
> >
> > These were removed by 'scripts/test_list: Don't log missing testlist' (for
> > not compiled tests).
> 
> OK, these seem to be gone now.
> 
> >
> > > INFO: Found documentation for 'xe_eudebug_online' but no binary
> > > INFO: Found documentation for 'xe_eudebug' but no binary
> > > INFO: Found documentation for 'xe_exec_sip_eudebug' but no binary
> >
> > This is an info log, that was added by Kamil's patch (which I slightly
> > modified).
> 
> I am still seeing these because I don't have build_xe_eudebug enabled it
> seems. I think if someone doesn't enable a component, they shouldn't be
> treated to a bunch of warnings. Maybe we'll bring it up with Kamil.

Right. I'm going to rid of those infos. We're mostly interested of
missing documentation, not the opposite.

--
Zbigniew

> 
> Thanks.
> --
> Ashutosh
