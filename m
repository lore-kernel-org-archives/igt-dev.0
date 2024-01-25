Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC1EC48260
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jan 2024 13:44:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A17A10E29E;
	Thu, 25 Jan 2024 13:44:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B0C610E29E
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jan 2024 13:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706190268; x=1737726268;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=S1P0LN1x3TQpoIkvStvHzQ4PPdajPh2eXDxPExwU0gs=;
 b=MmsbB9hkIh7OIk1y+IXoSGUmkrvSAm+APkttoC/yKa+Ar6BvFSUvzSlo
 VQPqfnkchxIg09zWwPGLM2FMxrDog2X+k9LZ5OjeX36YpT+Vp2OQILeho
 KIFeDR/I0HZKUpNJy2b5xV2eRzOyrgHjy6zwB5yC5rB1PdiWPrbEyAg1z
 bIrD2LAvbxm16QG31fJqWjMfqmdgmR+VCnmMe8Wt24l882h+jGsxM2gx3
 2tdo2070u4bzdiDVdQi+3kfI9dz3uF8slm3D1cPfvtQweWUlpaYh+63cz
 56x+asjD03Gq8m+DdgwloLG5XPs8LtiaK9z29LC0Hs33eF+WAXoNJUmuK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="23624920"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="23624920"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 05:44:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="857067045"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="857067045"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmsmga004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 05:44:26 -0800
Date: Thu, 25 Jan 2024 14:44:23 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v2 7/8] tests/intel/xe_exec_basic: add multigpu
 subtests
Message-ID: <20240125134423.v4hshoo4rtbh4zvk@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
References: <20240124204134.71451-1-kamil.konieczny@linux.intel.com>
 <20240124204134.71451-8-kamil.konieczny@linux.intel.com>
 <DS0PR11MB7264D6CB83ED0B4ACD836998D97A2@DS0PR11MB7264.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DS0PR11MB7264D6CB83ED0B4ACD836998D97A2@DS0PR11MB7264.namprd11.prod.outlook.com>
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

Hi Dominik,

On 2024-01-25 at 07:51:56 +0000, Piatkowski, Dominik Karol wrote:
> Hi Kamil,
> 
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kamil
> > Konieczny
> > Sent: Wednesday, January 24, 2024 9:42 PM
> > To: igt-dev@lists.freedesktop.org
> > Subject: [PATCH i-g-t v2 7/8] tests/intel/xe_exec_basic: add multigpu subtests
> > 
> > Add a few multi-gpu subtests:
> > 
> > multigpu-once-*
> > multigpu-many-execqueues-many-vm-*
> > multigpu-no-exec-*
> > 
> > run on two or more GPUs. Many variant was limited to take at most few
> > seconds.
> > 
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  tests/intel/xe_exec_basic.c | 36
> > ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 36 insertions(+)
> > 
> > diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c index
> > 8994859fa..debffaaf3 100644
> > --- a/tests/intel/xe_exec_basic.c
> > +++ b/tests/intel/xe_exec_basic.c
> > @@ -11,6 +11,7 @@
> >   */
> > 
> >  #include "igt.h"
> > +#include "intel_multigpu.h"
> >  #include "lib/igt_syncobj.h"
> >  #include "lib/intel_reg.h"
> >  #include "xe_drm.h"
> > @@ -54,6 +55,18 @@
> >   * Description: Run no-exec %arg[1] test
> >   * Test category: functionality test
> >   *
> > + * SUBTEST: multigpu-once-%s
> > + * Description: Run %arg[1] test only once on multiGPU
> > + * Test category: functionality test
> > + *
> > + * SUBTEST: multigpu-many-execqueues-many-vm-%s
> > + * Description: Run %arg[1] test on many exec_queues and many VMs on
> > + multiGPU
> > + * Test category: stress test
> > + *
> > + * SUBTEST: multigpu-no-exec-%s
> > + * Description: Run no-exec %arg[1] test on multiGPU
> > + * Test category: functionality test
> > + *
> >   * arg[1]:
> >   *
> >   * @basic:				basic
> > @@ -369,4 +382,27 @@ igt_main
> > 
> >  	igt_fixture
> >  		drm_close_driver(fd);
> > +
> > +	for (const struct section *s = sections; s->name; s++) {
> > +		igt_subtest_f("multigpu-once-%s", s->name) {
> > +			xe_multi_fork_foreach_gpu(xe, gpu_idx)
> > +				xe_for_each_engine(xe, hwe)
> > +					test_exec(xe, hwe, 1, 1, 1, s->flags);
> 
> Nitpick: consider using fd instead of xe for consistency

Macro defines a var with that name so it rather should be different,
for example could be gpu_fd.

Regards,
Kamil

> Otherwise, LGTM
> Reviewed-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> 
> > +			igt_waitchildren();
> > +		}
> > +
> > +		igt_subtest_f("multigpu-many-execqueues-many-vm-%s", s-
> > >name) {
> > +			xe_multi_fork_foreach_gpu(xe, gpu_idx)
> > +				xe_for_each_engine(fd, hwe)
> > +					test_exec(fd, hwe, 16, 32, 16, s-
> > >flags);
> > +			igt_waitchildren();
> > +		}
> > +
> > +		igt_subtest_f("multigpu-no-exec-%s", s->name) {
> > +			xe_multi_fork_foreach_gpu(xe, gpu_idx)
> > +				xe_for_each_engine(fd, hwe)
> > +					test_exec(fd, hwe, 1, 0, 1, s->flags);
> > +			igt_waitchildren();
> > +		}
> > +	}
> >  }
> > --
> > 2.42.0
> 
