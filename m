Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD693D767D8
	for <igt-dev@archiver.kernel.org>; Thu, 31 Oct 2024 15:48:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A42410E8D4;
	Thu, 31 Oct 2024 15:48:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jjIw0kQZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78F5510E8D9
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Oct 2024 15:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730389721; x=1761925721;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zb7ra9bfs1WT1sXFRoGBwRsBwLhMp0JdYp607lmoqpQ=;
 b=jjIw0kQZCbRieLSfSQbn7sykWHzQsuDzTeLkBEnnrcPN4ct1PuoEKYSa
 mmVAya8bm5hFsHz2icum2wGalm0putlQknGM/C2nmBNTlHr00gBk7S+vu
 GpNe0t8HSwW05zLjg83GBCBhhiN4SeFlN8UZPqpi/zuY9OnGdKDvRpSZ9
 00IvUa1TFmuf/S2DyVDMDDe7KSyZXMzlPIy0/LkqnOxnNrhXw5Hu9S94q
 Rz8GkD1blews/EPmk2odNPA19ORZIPRcEVf6oyEUmmnfGcRckUxbTRudj
 lhKgbS5fp4NaXtkjFeKPdc7KbO3rKwxWaITysWtxrXHxrskNODtGdzelW Q==;
X-CSE-ConnectionGUID: 8Z7tjBfbQGi7QWsbDcbc3A==
X-CSE-MsgGUID: 4oDxj0A6QISs7cylDmFEUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30090825"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30090825"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 08:48:41 -0700
X-CSE-ConnectionGUID: COQAkYHtTEmSRsQDO+XEhw==
X-CSE-MsgGUID: 9scXPBgbSP+rCalBxQOMzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="87447220"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 08:48:40 -0700
Date: Thu, 31 Oct 2024 16:48:37 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "Gupta, saurabhg" <saurabhg.gupta@intel.com>,
 "Zuo, Alex" <alex.zuo@intel.com>,
 "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH] tests/intel/xe_sysfs_timeslice_duration: Restore preempt
 timeout
Message-ID: <20241031154837.y6htrdunacvtpiyp@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "Gupta, saurabhg" <saurabhg.gupta@intel.com>,
 "Zuo, Alex" <alex.zuo@intel.com>,
 "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
References: <20241029213621.170938-1-jonathan.cavitt@intel.com>
 <20241030125124.234xdbbvwqfirvl7@kamilkon-desk.igk.intel.com>
 <CH0PR11MB54440F024F3F7B381DEA6569E5552@CH0PR11MB5444.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CH0PR11MB54440F024F3F7B381DEA6569E5552@CH0PR11MB5444.namprd11.prod.outlook.com>
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

On 2024-10-31 at 14:29:43 +0000, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Kamil Konieczny <kamil.konieczny@linux.intel.com> 
> Sent: Wednesday, October 30, 2024 5:51 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Gupta, saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.com>; Belgaumkar, Vinay <vinay.belgaumkar@intel.com>
> Subject: Re: [PATCH] tests/intel/xe_sysfs_timeslice_duration: Restore preempt timeout
> > 
> > Hi Jonathan,
> > On 2024-10-29 at 21:36:21 +0000, Jonathan Cavitt wrote:
> > > The subtests of sysfs_timeslice_duration modify the preempt_timeout_us
> > > and timeslice_duration_us values.  However, while the test does restore
> > > the timeslice_duration_us value at the end of execution, it does not do
> > > the same for preempt_timeout_us.  Because the value is not properly
> > > restored, future tests can end up using the unexpected preempt timeout
> > > value and thus have unexpected behavior.
> > > 
> > > Save and restore the preempt_timeout_us value during the test.
> > > 
> > > This fix does not apply to xe_sysfs_preempt_timeout because only the
> > > preempt_timeout_us is modified during those tests, and the value is
> > > correcty restored before the tests end.
> > > 
> > > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2976
> > > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > CC: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> > > ---
> > >  tests/intel/xe_sysfs_timeslice_duration.c | 6 +++++-
> > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/tests/intel/xe_sysfs_timeslice_duration.c b/tests/intel/xe_sysfs_timeslice_duration.c
> > > index cf95a3ac1c..6912f166b4 100644
> > > --- a/tests/intel/xe_sysfs_timeslice_duration.c
> > > +++ b/tests/intel/xe_sysfs_timeslice_duration.c
> > > @@ -115,10 +115,11 @@ static uint64_t __test_timeout(int fd, int engine, unsigned int timeout, uint16_
> > >  static void test_timeout(int fd, int engine, const char **property, uint16_t class, int gt)
> > >  {
> > >  	uint64_t delays[] = { 1000, 50000, 100000, 500000 };
> > > -	unsigned int saved;
> > > +	unsigned int saved, old_pt;
> > >  	uint64_t elapsed;
> > >  	uint64_t epsilon;
> > >  
> > > +	igt_assert(igt_sysfs_scanf(engine, "preempt_timeout_us", "%u", &old_pt) == 1);
> > >  	igt_require(igt_sysfs_printf(engine, "preempt_timeout_us", "%u", 1) == 1);
> > >  	igt_assert(igt_sysfs_scanf(engine, property[0], "%u", &saved) == 1);
> > >  	igt_debug("Initial %s:%u\n", property[0], saved);
> > > @@ -140,6 +141,9 @@ static void test_timeout(int fd, int engine, const char **property, uint16_t cla
> > >  	}
> > >  
> > >  	set_timeslice_duration(engine, saved);
> > > +	igt_assert_lte(0, igt_sysfs_printf(engine, "preempt_timeout_us", "%u", old_pt));
> > 
> > Looks good but it will not reach this line if any
> > igt_assert/require triggers before.
> 
> Out of fairness, timeslice_duration_us also has this problem in this test,
> and preempt_timeout_us also has this problem in xe_sysfs_preempt_timeout.c.
> -Jonathan Cavitt
> 

Right, so there is still risk it will end up not restored.
What we need is restoration of sysfs values to changed attributes
when test fail due to some assert/require _after_ a modification
was done. Could you add a /* TODO */ note in source?

With or without this,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> > 
> > Regards,
> > Kamil
> > 
> > > +	igt_sysfs_scanf(engine, "preempt_timeout_us", "%u", &saved);
> > > +	igt_assert_eq(saved, old_pt);
> > >  }
> > >  
> > >  igt_main
> > > -- 
> > > 2.43.0
> > > 
> > 
