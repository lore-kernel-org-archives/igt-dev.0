Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA5BC47258
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jan 2024 18:29:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A532B10E71A;
	Thu, 25 Jan 2024 18:29:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 250D310EB71
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jan 2024 18:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706207341; x=1737743341;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=lc/RPtAVE4Dca51kY+4wZ5j2yDz19pyCCweyaf1KQuI=;
 b=kDsbQbZwglBuLhoJpWt3MYOq4Ys2xAEh9VUBP1dueLlzNXbQD8AeD/AU
 8KprDVPy4IK9XIC3myklJT81x9YztzEDR/GWw4MwH+Ok85WAoKvuRhngD
 ZQWrPJv+Hgnz52Jjsg5qqeFW5F2spXa5zJDzi8k1+CbWxfBHv604aiW1Y
 FUMv4aeaCSl35tgbo8GsEBsH4AhYzt3WknaRN7wKu0k9o245J5Hx4rJ7X
 lvhw3wJAihbwyrOswU1wAdHRtRs8XIMd8OLoTkyYV4OquU01XTV0jmA2U
 rGeTIqc7stM5gPinYEtSqOjI+I1If7BfgzDwyhsd6+bRAmLEObva6swuV A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="15784045"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="15784045"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 10:29:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2515915"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 10:28:59 -0800
Date: Thu, 25 Jan 2024 19:28:55 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v2 7/8] tests/intel/xe_exec_basic: add multigpu
 subtests
Message-ID: <20240125182855.zu6jfbdeo4v6k6sl@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
References: <20240124204134.71451-1-kamil.konieczny@linux.intel.com>
 <20240124204134.71451-8-kamil.konieczny@linux.intel.com>
 <DS0PR11MB7264D6CB83ED0B4ACD836998D97A2@DS0PR11MB7264.namprd11.prod.outlook.com>
 <20240125134423.v4hshoo4rtbh4zvk@kamilkon-desk.igk.intel.com>
 <DS0PR11MB7264760DF1609A487245C762D97A2@DS0PR11MB7264.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DS0PR11MB7264760DF1609A487245C762D97A2@DS0PR11MB7264.namprd11.prod.outlook.com>
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

Hi,

On 2024-01-25 at 14:05:50 +0000, Piatkowski, Dominik Karol wrote:
> Hi Kamil,
> 
> > -----Original Message-----
> > From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Sent: Thursday, January 25, 2024 2:44 PM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Piatkowski, Dominik Karol <dominik.karol.piatkowski@intel.com>
> > Subject: Re: [PATCH i-g-t v2 7/8] tests/intel/xe_exec_basic: add multigpu
> > subtests
> > 
> > Hi Dominik,
> > 
> > On 2024-01-25 at 07:51:56 +0000, Piatkowski, Dominik Karol wrote:
> > > Hi Kamil,
> > >
> > > > -----Original Message-----
> > > > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > > > Kamil Konieczny
> > > > Sent: Wednesday, January 24, 2024 9:42 PM
> > > > To: igt-dev@lists.freedesktop.org
> > > > Subject: [PATCH i-g-t v2 7/8] tests/intel/xe_exec_basic: add
> > > > multigpu subtests
> > > >
> > > > Add a few multi-gpu subtests:
> > > >
> > > > multigpu-once-*
> > > > multigpu-many-execqueues-many-vm-*
> > > > multigpu-no-exec-*
> > > >
> > > > run on two or more GPUs. Many variant was limited to take at most
> > > > few seconds.
> > > >
> > > > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > > > ---
> > > >  tests/intel/xe_exec_basic.c | 36
> > > > ++++++++++++++++++++++++++++++++++++
> > > >  1 file changed, 36 insertions(+)
> > > >
> > > > diff --git a/tests/intel/xe_exec_basic.c
> > > > b/tests/intel/xe_exec_basic.c index
> > > > 8994859fa..debffaaf3 100644
> > > > --- a/tests/intel/xe_exec_basic.c
> > > > +++ b/tests/intel/xe_exec_basic.c
> > > > @@ -11,6 +11,7 @@
> > > >   */
> > > >
> > > >  #include "igt.h"
> > > > +#include "intel_multigpu.h"
> > > >  #include "lib/igt_syncobj.h"
> > > >  #include "lib/intel_reg.h"
> > > >  #include "xe_drm.h"
> > > > @@ -54,6 +55,18 @@
> > > >   * Description: Run no-exec %arg[1] test
> > > >   * Test category: functionality test
> > > >   *
> > > > + * SUBTEST: multigpu-once-%s
> > > > + * Description: Run %arg[1] test only once on multiGPU
> > > > + * Test category: functionality test
> > > > + *
> > > > + * SUBTEST: multigpu-many-execqueues-many-vm-%s
> > > > + * Description: Run %arg[1] test on many exec_queues and many VMs
> > > > + on multiGPU
> > > > + * Test category: stress test
> > > > + *
> > > > + * SUBTEST: multigpu-no-exec-%s
> > > > + * Description: Run no-exec %arg[1] test on multiGPU
> > > > + * Test category: functionality test
> > > > + *
> > > >   * arg[1]:
> > > >   *
> > > >   * @basic:				basic
> > > > @@ -369,4 +382,27 @@ igt_main
> > > >
> > > >  	igt_fixture
> > > >  		drm_close_driver(fd);
> > > > +
> > > > +	for (const struct section *s = sections; s->name; s++) {
> > > > +		igt_subtest_f("multigpu-once-%s", s->name) {
> > > > +			xe_multi_fork_foreach_gpu(xe, gpu_idx)
> > > > +				xe_for_each_engine(xe, hwe)
> > > > +					test_exec(xe, hwe, 1, 1, 1, s->flags);
> > >
> > > Nitpick: consider using fd instead of xe for consistency
> > 
> > Macro defines a var with that name so it rather should be different, for
> > example could be gpu_fd.
> 
> Okay. "fd" is used in other added testcases, please double check if
> it should be "fd" and not "xe" in multigpu-many-execqueues-many-vm-* 
> and multigpu-no-exec-*. R-b carries on. 

This is local var passed as param, there should be no problems.

Regards,
Kamil

> 
> Dominik Karol
> 
> > 
> > Regards,
> > Kamil
> > 
> > > Otherwise, LGTM
> > > Reviewed-by: Dominik Karol Piątkowski
> > > <dominik.karol.piatkowski@intel.com>
> > >
> > > > +			igt_waitchildren();
> > > > +		}
> > > > +
> > > > +		igt_subtest_f("multigpu-many-execqueues-many-vm-%s", s-
> > > > >name) {
> > > > +			xe_multi_fork_foreach_gpu(xe, gpu_idx)
> > > > +				xe_for_each_engine(fd, hwe)
> > > > +					test_exec(fd, hwe, 16, 32, 16, s-
> > > > >flags);
> > > > +			igt_waitchildren();
> > > > +		}
> > > > +
> > > > +		igt_subtest_f("multigpu-no-exec-%s", s->name) {
> > > > +			xe_multi_fork_foreach_gpu(xe, gpu_idx)
> > > > +				xe_for_each_engine(fd, hwe)
> > > > +					test_exec(fd, hwe, 1, 0, 1, s->flags);
> > > > +			igt_waitchildren();
> > > > +		}
> > > > +	}
> > > >  }
> > > > --
> > > > 2.42.0
> > >
