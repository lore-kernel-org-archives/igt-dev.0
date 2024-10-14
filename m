Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAEDBD16240
	for <igt-dev@archiver.kernel.org>; Mon, 14 Oct 2024 11:13:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8341110E429;
	Mon, 14 Oct 2024 11:13:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CHHpSPCs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9833610E429
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Oct 2024 11:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728904426; x=1760440426;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MjGWe52LOQ3GYnQ/4+Ma+kcgk1tJFT3L0nlq+npYZu4=;
 b=CHHpSPCs6JarLBaRxqxkIMdihOUvkkBfoFhVOtXdwlkQOBcVlgDzuoH/
 C03WpZqkDoOhYrppXYMS4BCEoo91CFbqmv21Bid4N5NcCYpjCo6BGSw1r
 PKTh0opgOpAgjVb7AY7RLUEh+6wW0i6QWtAmT1dQTxZIghpj5R3BopvdZ
 UJH2NO9plj4eITzwdd73g6fBhM97kz5fHhnwLb4EfxgjRw3KkH6djavV3
 RVN30TPiifBO9r9wMQBA8KI0dqT0k46R635X0XljwoGTZKOeUw0yxlVCW
 LySDNXPiNHXVHoVnIY2ldE2g5ckJOS6v9jnDNOYcBZ4y2VdzvzRlOV7g3 Q==;
X-CSE-ConnectionGUID: g203DsWSTFqyHGfAmVkUyA==
X-CSE-MsgGUID: PiUX9WMiTWGlmt3IIrZHrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="27735074"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="27735074"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 04:13:45 -0700
X-CSE-ConnectionGUID: x6gmepEvQDebudXWSw02uA==
X-CSE-MsgGUID: WGpZwTw5SP6BqPAJhiYkEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="77553934"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 04:13:43 -0700
Date: Mon, 14 Oct 2024 13:13:23 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "Poosa, Karthik" <karthik.poosa@intel.com>,
 "Nilawar, Badal" <badal.nilawar@intel.com>,
 "Tauro, Riana" <riana.tauro@intel.com>
Subject: Re: [PATCH i-g-t v3] tests/intel/xe_pm_residency: Print execution
 and sleep times
Message-ID: <20241014111323.z32fbiax5zwzd32v@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "Poosa, Karthik" <karthik.poosa@intel.com>,
 "Nilawar, Badal" <badal.nilawar@intel.com>,
 "Tauro, Riana" <riana.tauro@intel.com>
References: <20240920083315.1763178-1-karthik.poosa@intel.com>
 <CY5PR11MB6211A751A26CA560A3575536956C2@CY5PR11MB6211.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CY5PR11MB6211A751A26CA560A3575536956C2@CY5PR11MB6211.namprd11.prod.outlook.com>
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

On 2024-09-20 at 08:31:37 +0000, Gupta, Anshuman wrote:
> 
> 
> > -----Original Message-----
> > From: Poosa, Karthik <karthik.poosa@intel.com>
> > Sent: Friday, September 20, 2024 2:03 PM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Nilawar, Badal
> > <badal.nilawar@intel.com>; Tauro, Riana <riana.tauro@intel.com>; Poosa,
> > Karthik <karthik.poosa@intel.com>
> > Subject: [PATCH i-g-t v3] tests/intel/xe_pm_residency: Print execution and sleep
> > times
> > 
> > Print the workload execution and sleep times of the test to help diagnose
> > timeouts.
> > 
> > v2: Patchwork test re-run.
> > 
> > v3:
> >  - Assert if syncobj_wait took more than 1.2 seconds, as it causes the test
> >    to timeout because test would sleep for more than 120 seconds which
> >    triggers per task timeout.
> > 
> > Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> > Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> > ---
> >  tests/intel/xe_pm_residency.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c index
> > 0e687558b..343fdd694 100644
> > --- a/tests/intel/xe_pm_residency.c
> > +++ b/tests/intel/xe_pm_residency.c
> > @@ -139,11 +139,14 @@ static void exec_load(int fd, struct
> > drm_xe_engine_class_instance *hwe, unsigned
> >  		elapsed = igt_nsec_elapsed(&tv);
> >  		igt_assert_eq(data->data, done[1]);
> > 
> > -		igt_debug("Execution took %.3fms (submit %.1fus, wait
> > %.1fus)\n",
> > +		igt_info("Execution took %.3fms (submit %.1fus, wait
> > %.1fus)\n",
> >  			  1e-6 * elapsed,
> >  			  1e-3 * submit,
> >  			  1e-3 * (elapsed - submit));
> We don't need to change to igt_info upon igt_assert it will dump each igt_debug log.
> > 
> > +		/* Assert if syncobj_wait took more than 1.2 seconds */
> Explain by comment why 1.2 seconds  ?
> > +		igt_assert((uint64_t)(elapsed - submit) < (uint64_t)(1.2 *
> > +NSEC_PER_SEC));

Btw is this (elapsed - submit) correct? In line above it was scaled with two
different factors, first with 1e-6 second with 1e-3.

> Your calculation is based upon the igt runner per test timeout which can change.
> So better to stick with 1 second. Or better to get per test timeout via igt environment 
> variable.
> Cc: Kamil
> Is it possible to get the per test igt timeout value in igt test ?

What you mean 'per test'? For BAT it is fixed and should not exceed 10s (or 20, I do
not remember exact number here).

As for enviroment, you could add it for this specfic test.
It could also take into account simulation.

As for not printing debugfs imho best way (untill it will debugged and fixed)
would be to use igt_assert_f and print what you want there, for example:

	f_elapsed = 1e-6 * elapsed;
	f_submit = 1e-3 * submit;
	igt_assert_f(f_elapsed < 1.2, "Execution too slow, elapsed=%.3fms submit=%.3fms\n",
		     f_elapsed, f_submit);

Regards,
Kamil

> 
> Thanks,
> Anshuman 
> > +
> >  		syncobj_reset(fd, &syncobj, 1);
> > 
> >  		/*
> > --
> > 2.25.1
> 
