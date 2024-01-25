Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B158C47258
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jan 2024 13:41:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60ABA10F8CC;
	Thu, 25 Jan 2024 13:41:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3523D10F308
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jan 2024 13:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706190093; x=1737726093;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=We+oKGBud8oSzSw/a0GTgzvZdnfUBFCINKx5nTe60MI=;
 b=XzmCfmKqFqBcGEj3/GzC1pTUA1dEcejHqpkUOstdurl918fwvwpnAmN2
 U+xHK34zORUdSJ0VgCjEJbt5OpWANRj5vjfcCoGwQqPvhqjMVWpfovybw
 yMXM5jIGfRzJE1HsGHtyVfijX5aqrob1wh1Vqea2nnpgzwaj6geRx3GY8
 zYUbMWHGIbSuQ2ySTM/IR3vkk6V0wX6lpFvO2xAU8auRC0989cK6vDqeg
 8uEcRoi8luwUY5L6BSyrPzXONPzBu+wrs/FbDf65dTkkhYuNK6UUty+V+
 UVp4nPjY+MKFx2lx+EGT/orL3o+rSEOsrdg1TqmnlH7a516kRC119KdJw g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="401014237"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="401014237"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 05:41:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2249035"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 05:41:30 -0800
Date: Thu, 25 Jan 2024 14:41:05 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v6 4/4] HAX: Add d3-mmap to xe-fast-feedback
Message-ID: <20240125134105.3utfigq6lquhajj2@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Gupta, Anshuman" <anshuman.gupta@intel.com>
References: <20240124115019.2067089-1-anshuman.gupta@intel.com>
 <20240124115019.2067089-5-anshuman.gupta@intel.com>
 <20240124133936.uffdw655o6ggywhl@kamilkon-desk.igk.intel.com>
 <CY5PR11MB62112F26089660F586DDC3CD957A2@CY5PR11MB6211.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CY5PR11MB62112F26089660F586DDC3CD957A2@CY5PR11MB6211.namprd11.prod.outlook.com>
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

Hi iAnshuman,

On 2024-01-25 at 09:32:43 +0000, Gupta, Anshuman wrote:
> 
> 
> > -----Original Message-----
> > From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Sent: Wednesday, January 24, 2024 7:10 PM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Gupta, Anshuman <anshuman.gupta@intel.com>
> > Subject: Re: [PATCH i-g-t v6 4/4] HAX: Add d3-mmap to xe-fast-feedback
> > 
> > Hi Anshuman,
> > On 2024-01-24 at 17:20:19 +0530, Anshuman Gupta wrote:
> > > Adding d3-mmap to xe-fast-feedback.
> > 
> > How long did this test last? If few seconds you can add it to fast-feedback (e.g.
> > to BAT tests).
> > 
> > CI now no longer manages separate f-f lists, we can add them if needed so if
> > tests takes < 10seconds, please change subject
> > into:
> > 
> > [PATCH i-g-t v6 4/4] intel-ci/xe-fast-feedback: Add d3-mmap to BAT
> > 
> > >
> > > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > > ---
> > >  tests/intel-ci/xe-fast-feedback.testlist | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/tests/intel-ci/xe-fast-feedback.testlist
> > > b/tests/intel-ci/xe-fast-feedback.testlist
> > > index f297fe965..1d5ecb19d 100644
> > > --- a/tests/intel-ci/xe-fast-feedback.testlist
> > > +++ b/tests/intel-ci/xe-fast-feedback.testlist
> > > @@ -115,6 +115,8 @@ igt@xe_mmap@system  igt@xe_mmap@vram
> > > igt@xe_mmap@vram-system  igt@xe_pm_residency@gt-c6-on-idle
> > > +igt@xe_pm@d3-mmap-system
> > > +igt@xe_pm@d3-mmap-vram
> > 
> > This should be before
> > 
> > igt@xe_pm_residency@gt-c6-on-idle
> > 
> > with that fixed:
> > Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Hi Kamil thanks for comment, this is the Hack patch, not for merge.
> Currently not planning to have these test in BAT.
> This patch is added to get the test coverage results from CI. 
> 
> Thanks,
> Anshuman Gupta.

I see, if that is the case it is better to add DO_NOT_MERGE like:

[PATCH i-g-t v6 4/4] HAX/DO_NOT_MERGE: intel-ci/xe-f-f: test d3-mmap

Regards,
Kamil

> > 
> > >  igt@xe_prime_self_import@basic-with_one_bo
> > >  igt@xe_prime_self_import@basic-with_fd_dup
> > >  #igt@xe_prime_self_import@basic-llseek-size
> > > --
> > > 2.25.1
> > >
