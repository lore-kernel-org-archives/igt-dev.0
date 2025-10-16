Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94386CCD19E
	for <igt-dev@archiver.kernel.org>; Thu, 16 Oct 2025 10:08:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37DAD10E9A1;
	Thu, 16 Oct 2025 10:08:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hQ77/EOJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E4D210E9A1
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Oct 2025 10:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760609292; x=1792145292;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Dw6tI/jCglOZu/yWs5KKHb3Drw8dcYFRdWqXHzNRFtI=;
 b=hQ77/EOJkqTsLz2oYlgMGMo4yo5SRaa/PQbBDo2Bw1pNrmgFI2pPRorV
 nLHTTDYq9ZFS0EyDqxzq4gTQRMuAUrYpQxsXgKf6idx4Eu6XepPCu6/BM
 GOYbJUWq2J2fl/OtgD+na69DW4ghUxP9CUNzUfk+6lZmmUwAQdGaBc2tu
 Tz8gIqRl+PPMcAdYXH+OOXNw6slGrhLcOgGr7K2TT1NmKFyAzh4+KdxVA
 y4u3nkTbl1Hir0Ibg8TWKbumK4aZIEXxHjg8pjDlpdRZ+FD3j4Rse3JdY
 5Aop36X+HFw1g7QL7JfitZhKAk8EBRwsvK1ePzW3lrdv+++1DAeF4bZvV g==;
X-CSE-ConnectionGUID: tMEhmxCCQSKjnYmt2a/aoQ==
X-CSE-MsgGUID: Et9AVxQETXyJcaGS5ucnIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62840871"
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; d="scan'208";a="62840871"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 03:08:12 -0700
X-CSE-ConnectionGUID: tfman/KfTFGeF8XesH+1Og==
X-CSE-MsgGUID: /sMfoZIGScW7uCw/KK40Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; d="scan'208";a="186428886"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 03:08:10 -0700
Date: Thu, 16 Oct 2025 12:07:55 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Girotra, Himanshu" <himanshu.girotra@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Gandi, Ramadevi" <ramadevi.gandi@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel-ci : Add Xe Multigpu blocklist file
Message-ID: <20251016100755.us62dum4mrwfxiyt@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Girotra, Himanshu" <himanshu.girotra@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Gandi, Ramadevi" <ramadevi.gandi@intel.com>
References: <20251015064406.4076-1-himanshu.girotra@intel.com>
 <20251015160356.gfqnwn5qd7jw66f6@kamilkon-DESK.igk.intel.com>
 <CH0PR11MB556496F4845560515BF52CF298E9A@CH0PR11MB5564.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CH0PR11MB556496F4845560515BF52CF298E9A@CH0PR11MB5564.namprd11.prod.outlook.com>
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

Hi Girotra,,
On 2025-10-16 at 05:48:15 +0000, Girotra, Himanshu wrote:
> Hi Kamil , 
> 
> > -----Original Message-----
> > From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Sent: Wednesday, October 15, 2025 9:34 PM
> > To: Girotra, Himanshu <himanshu.girotra@intel.com>
> > Cc: igt-dev@lists.freedesktop.org; Gandi, Ramadevi
> > <ramadevi.gandi@intel.com>
> > Subject: Re: [PATCH i-g-t] tests/intel-ci : Add Xe Multigpu blocklist file
> > 
> > Hi himanshu.girotra,
> > On 2025-10-15 at 12:14:06 +0530, himanshu.girotra@intel.com wrote:
> > > From: Himanshu Girotra <himanshu.girotra@intel.com>
> > 
> > please remove space in subject before ':' so it will be:
> > 
> > [PATCH i-g-t] tests/intel-ci: Add Xe Multigpu blocklist file
> > 
> > >
> > > Add Xe Multigpu Blocklist and unblock multigpu tests from core
> > > specific Blocklist to display the metrics on Grafana.
> > >
> > > Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
> > > ---
> > >  tests/intel-ci/meson.build               | 1 +
> > >  tests/intel-ci/xe.bmg.core.blocklist.txt | 7 -------
> > > tests/intel-ci/xe.multigpu.blocklist.txt | 5 +++++
> > >  3 files changed, 6 insertions(+), 7 deletions(-)  create mode 100644
> > > tests/intel-ci/xe.multigpu.blocklist.txt
> > >
> > > diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
> > > index ca50e93aa..0c3b79d51 100644
> > > --- a/tests/intel-ci/meson.build
> > > +++ b/tests/intel-ci/meson.build
> > > @@ -21,6 +21,7 @@ intelci_files = [
> > >    'xe.lnl.core.blocklist.txt',
> > >    'xe.lnl.display.blocklist.txt',
> > >    'xe.lnl.eudebug.blocklist.txt',
> > > +  'xe.multigpu.blocklist.txt',
> > >    'xe.ptl.core.blocklist.txt',
> > >    'xe.ptl.display.blocklist.txt',
> > >    'xe-fast-feedback.testlist',
> > > diff --git a/tests/intel-ci/xe.bmg.core.blocklist.txt
> > > b/tests/intel-ci/xe.bmg.core.blocklist.txt
> > > index 25da760aa..15dbbf2b8 100644
> > > --- a/tests/intel-ci/xe.bmg.core.blocklist.txt
> > > +++ b/tests/intel-ci/xe.bmg.core.blocklist.txt
> > > @@ -18,13 +18,6 @@ igt@xe_media_fill@media-fill
> > >
> > ##################################################################
> > >  igt@xe_pat@pat-index-xe3p-xpc
> > >
> > ##################################################################
> > > -# Expected skip on single card machines
> > > -
> > ##################################################################
> > > -igt@xe_peer2peer@.*
> > > -igt@xe_query@multigpu-query-.*
> > > -igt@xe_create@multigpu-create-massive-size
> > > -igt@xe_exec_basic@.*multigpu.*
> > > -
> > ##################################################################
> > >  # Expected skip - small bar not supported
> > >
> > ##################################################################
> > >  igt@xe_mmap@small-bar
> > > diff --git a/tests/intel-ci/xe.multigpu.blocklist.txt
> > > b/tests/intel-ci/xe.multigpu.blocklist.txt
> > > new file mode 100644
> > > index 000000000..387c3413e
> > > --- /dev/null
> > > +++ b/tests/intel-ci/xe.multigpu.blocklist.txt
> > > @@ -0,0 +1,5 @@
> > > +#####################################################
> > > +# Blocklist for Xe MuitiGPU tests
> > > +#####################################################
> > > +igt@(?!.*xe.*multigpu.*|xe_peer2peer.*).*
> > 
> 
> The main purpose of adding ( +igt@(?!.*xe.*multigpu.*|xe_peer2peer.*).* )
> is to ignore everything apart from the multigpu tests , if we go ahead
> with below regex suggestion this would ignore multigpu tests as well.

Sorry, I missed that, so with corrected subject it is ok,
I will merge it after Xe Full results will be available
for verification.

Regards,
Kamil

> > Please make it more readable, like:
> >
> > igt@xe_.*@.*multigpu.*
> > igt@xe_peer2peer@.*
> > 
> > Regards,
> > Kamil
> > 
> > > +#####################################################
> > > --
> > > 2.40.0
> > >
