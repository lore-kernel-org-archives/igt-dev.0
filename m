Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB8AC46CD2
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jan 2024 12:58:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFB3810F700;
	Wed, 24 Jan 2024 12:58:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98AE510F751
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jan 2024 12:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706101137; x=1737637137;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=YdDvr+3YBwLu1WsjSlf6qdwCzvOcrmgUs5JhhIqpAww=;
 b=F3GbhXRBwsnVMiQOsqLx+oK5hp1rsvoasCwktg2XIzkYISh4F/c32a6A
 wk9nimsE3Afd02jWS2dAmCAhNlTlVnXcubIb1sKJE7IYr3DVTESYEGhdk
 pRHgv9mhA/HRct8F1OKwgBn8CfCOnpLkzpdwHoQSIiYGQ2Uy+d19oG7Z0
 KN3eGqlGtqtrU5RBfikySeuS1rokXO4eZ6JL6HgrY2O6iC2TvBnSfuL1f
 Rjwsst/dqyc7RcSXUSyAOFcy64a++8CQ9onQddrr7oEzMt91LA7+Tv3hN
 h590HFeeuic/MLGquED6Pr1Pk6/6uNAc6emAHhmptMwKlAFIiHjb0f+6g Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="466110834"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="466110834"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 04:58:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="735924183"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="735924183"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orsmga003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 04:58:56 -0800
Date: Wed, 24 Jan 2024 13:58:53 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v1 5/8] lib/intel_multigpu: Introduced
 gem_multigpu_count_class and igt_multi_fork_foreach_gpu
Message-ID: <20240124125853.a7jnie3xnhic3to2@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
References: <20240123201535.108793-1-kamil.konieczny@linux.intel.com>
 <20240123201535.108793-6-kamil.konieczny@linux.intel.com>
 <DS0PR11MB7264DE64F120B53DFAD5467AD97B2@DS0PR11MB7264.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DS0PR11MB7264DE64F120B53DFAD5467AD97B2@DS0PR11MB7264.namprd11.prod.outlook.com>
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
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Dominik,
On 2024-01-24 at 07:19:02 +0000, Piatkowski, Dominik Karol wrote:
> Small nitpick: igt_multi_fork_foreach_gpu macro is said to be introduced
> in this patch, but in reality it is introduced in 4/8. Originally it was
> in one patch, so that's a small issue with patch splitting.
> 
> Dominik Karol
> 

Thank you for spotting this, I was doing some rebases and experiments
and I got it mixed up. I will send v2 with corrected ones soon.

Regards,
Kamil

> > -----Original Message-----
> > From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Sent: Tuesday, January 23, 2024 9:16 PM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Piatkowski, Dominik Karol <dominik.karol.piatkowski@intel.com>; Chris
> > Wilson <chris.p.wilson@linux.intel.com>; Kamil Konieczny
> > <kamil.konieczny@linux.intel.com>
> > Subject: [PATCH i-g-t v1 5/8] lib/intel_multigpu: Introduced
> > gem_multigpu_count_class and igt_multi_fork_foreach_gpu
> > 
> > From: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> > 
> > Introduced gem_multigpu_count_class function that returns an actual
> > number of GPUs present in system, which allows for writing multi-GPU test
> > scenarios that does not require --device
> > pci:vendor=intel,device=discrete,card=all
> > to run as intended. Based on patch by Chris Wilson.
> > 
> > Introduced igt_multi_fork_foreach_gpu macro that helps with writing multi-
> > GPU test scenarios in idiomatic form:
> > 
> > igt_multi_fork_foreach_gpu(i915, DRIVER_INTEL)
> > 	test_function(i915);
> > igt_waitchildren();
> > 
> > Signed-off-by: Dominik Karol Piątkowski
> > <dominik.karol.piatkowski@intel.com>
> > Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  lib/intel_multigpu.c | 10 ++++++++++
> >  lib/intel_multigpu.h |  2 +-
> >  2 files changed, 11 insertions(+), 1 deletion(-)
> > 
> > diff --git a/lib/intel_multigpu.c b/lib/intel_multigpu.c index
> > 446e3ff5f..0e76d8aa3 100644
> > --- a/lib/intel_multigpu.c
> > +++ b/lib/intel_multigpu.c
> > @@ -8,6 +8,16 @@
> >  #include "igt_device_scan.h"
> >  #include "intel_multigpu.h"
> > 
> > +int gem_multigpu_count_class(int class) {
> > +	int count = 0;
> > +
> > +	igt_foreach_gpu(fd, class)
> > +		count++;
> > +
> > +	return count;
> > +}
> > +
> >  void gem_require_multigpu(int count)
> >  {
> >  	struct igt_devices_print_format fmt = { diff --git a/lib/intel_multigpu.h
> > b/lib/intel_multigpu.h index 5f98307fd..ad1e5cf07 100644
> > --- a/lib/intel_multigpu.h
> > +++ b/lib/intel_multigpu.h
> > @@ -9,8 +9,8 @@
> >  #include "igt_core.h"
> >  #include "igt_device_scan.h"
> > 
> > -void gem_require_multigpu(int count);
> >  int gem_multigpu_count_class(int class);
> > +void gem_require_multigpu(int count);
> > 
> >  #define igt_foreach_gpu(fd__, id__) \
> >  	for (int igt_unique(i) = 0, fd__; \
> > --
> > 2.42.0
> 
