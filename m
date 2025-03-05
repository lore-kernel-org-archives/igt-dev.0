Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07FF6C19F32
	for <igt-dev@archiver.kernel.org>; Wed,  5 Mar 2025 12:02:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C69D10E741;
	Wed,  5 Mar 2025 12:02:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AdBP+Xoc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EAFE10E741
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Mar 2025 12:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741176142; x=1772712142;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1nA227KRQfxpHS3pqovlkcSi3K01ji3HKYzPRPXAt8Y=;
 b=AdBP+XocPKm7DKbL7EMXBwcpllfv8JOmv2OSCGxscwHPPj0cSBb+zYSa
 1x7P8pN+zA996gdLaofUDmzLoO+zzG24BQ44Ckz2Ia0kBPj+nhmSyW55J
 Ew07iTaDOo6FW89/Kl2BAOypPh9H8i8iWfOgykj4Bx943Hd4ew+HOnzhH
 Vat3Lkp9yMIq7FLx3SvLMvhFYJOJ6Q84zlPJjPhUJiKPHSp12h4FjJgMw
 Lde+MPzhWi+j+A7QMA7NU0tbrDa3HcjW10s9AwST8++x57pMQ4YjRN4/C
 gIt54w0I0/MZcw0bQoUZ2flHLZ0pHU8rcNz8KUIVpQWcnRBoPz2WDq4Nu w==;
X-CSE-ConnectionGUID: PayzEtYyQsiuWeainxha1w==
X-CSE-MsgGUID: +yd+E+g9Ssi4wqbUh/mvCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="41998060"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="41998060"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 04:02:22 -0800
X-CSE-ConnectionGUID: IihOjJ+mQvGaLq5n3hbKkw==
X-CSE-MsgGUID: XTmGS74gRIWJaFs9BYookw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="118384947"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 04:02:21 -0800
Date: Wed, 5 Mar 2025 13:02:01 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Chauhan, Aditya" <aditya.chauhan@intel.com>
Cc: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/2] tests: xe_compute* Update test documentation
Message-ID: <20250305120201.fi5dhstwp57s57k5@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Chauhan, Aditya" <aditya.chauhan@intel.com>,
 "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20250227130354.1169897-1-katarzyna.piecielska@intel.com>
 <20250227130354.1169897-2-katarzyna.piecielska@intel.com>
 <BN9PR11MB527371D6F6BCE7A47A406BA399CB2@BN9PR11MB5273.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <BN9PR11MB527371D6F6BCE7A47A406BA399CB2@BN9PR11MB5273.namprd11.prod.outlook.com>
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

Hi Chauhan,,
On 2025-03-05 at 07:41:06 +0000, Chauhan, Aditya wrote:
> LGTM 
> Reviewed-by: Aditya Chauhan <aditya.chauhan@intel.com>
> 
> 

Thank you, I modified subject into tests/intel/xe_compute*: and
tests/intel/xe_*: and applied both patches with your r-b.

Regards,
Kamil

> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Katarzyna
> > Piecielska
> > Sent: Thursday, February 27, 2025 6:34 PM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Piecielska, Katarzyna <katarzyna.piecielska@intel.com>
> > Subject: [PATCH i-g-t 1/2] tests: xe_compute* Update test documentation
> > 
> > Our documentation scripts need to have unique pairs 'Mega feature - Sub-
> > category', e.g. example below is causing warnings:
> > 
> > Mega feature: WMTP
> > Sub-category: CMD submission
> > &&
> > Mega feature: General Core features
> > Sub-category: CMD submission
> > 
> > There is a need to make sure that pairs are unique, so let's make change in
> > xe_compute* tests.
> > 
> > Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> > ---
> >  tests/intel/xe_compute.c         | 4 +++-
> >  tests/intel/xe_compute_preempt.c | 2 +-
> >  2 files changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c index
> > 558b46eba..7daf6209d 100644
> > --- a/tests/intel/xe_compute.c
> > +++ b/tests/intel/xe_compute.c
> > @@ -163,7 +163,9 @@ test_compute_kernel_with_ccs_mode(int num_gt)
> > 
> >  /**
> >   * SUBTEST: compute-square
> > - * Sub-category: Compute square tests
> > + * Mega feature: WMTP
> > + * Sub-category: wmtp tests
> > + * Functionality: OpenCL kernel
> >   * GPU requirement: TGL, PVC, LNL, PTL
> >   * Description:
> >   *	Run an openCL Kernel that returns output[i] = input[i] * input[i],
> > diff --git a/tests/intel/xe_compute_preempt.c
> > b/tests/intel/xe_compute_preempt.c
> > index d4c243c16..876e53823 100644
> > --- a/tests/intel/xe_compute_preempt.c
> > +++ b/tests/intel/xe_compute_preempt.c
> > @@ -7,7 +7,7 @@
> >   * TEST: Check compute-related preemption functionality
> >   * Category: Core
> >   * Mega feature: WMTP
> > - * Sub-category: Compute tests
> > + * Sub-category: wmtp tests
> >   * Functionality: OpenCL kernel
> >   * Test category: functionality test
> >   */
> > --
> > 2.34.1
> 
