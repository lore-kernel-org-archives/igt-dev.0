Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A35EDC5475B
	for <igt-dev@archiver.kernel.org>; Tue, 20 Feb 2024 18:33:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F37D10E201;
	Tue, 20 Feb 2024 18:33:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WJHX2Uk3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBD5C10E201
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Feb 2024 18:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708454029; x=1739990029;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Mbz4AcFMyqR6LhdrU2YdURLlF+eyZ891fimal+zL5Ow=;
 b=WJHX2Uk3KGzUt4s3eFP+DWzUQfeqadAvld5goH0JI13Qw+OqSZECJom6
 t0tjrhCoGJHclBitrEUx/szpoh9PgGnEZSnpKvs5yQjo1POGyF68GWSDl
 /MOoqHlU2cO/reSYz4o2j2EexeSEsZSybSyOmmTxcHpb8JpkBZ75dDHb6
 3DNEpVWotrmGKuGpBBa4JUOf19HGKKIZqKRcbXRM/YKDHNdeWMI+rumz0
 2i9Eck08MqVyJkx9FWbs6E2sNRVBrQA96eNIgXZqZzdOKV/wgAuYPERqB
 55HykjT2H2D2GBh8euyUwWCulyUjDJpYK89yIKtTsHegcS0I2lJJHfDZq g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="6403232"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="6403232"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 10:33:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="4750143"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 10:33:47 -0800
Date: Tue, 20 Feb 2024 19:33:44 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v9 2/7] lib/drmtest: Introduced
 drm_open_driver_another
Message-ID: <20240220183344.x4lkuflz5ackohcc@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20240215161014.60304-1-kamil.konieczny@linux.intel.com>
 <2552026.vzjCzTo3RI@jkrzyszt-mobl2.ger.corp.intel.com>
 <20240219174232.63q3nuu4mc5o566q@kamilkon-desk.igk.intel.com>
 <10419859.qUNvkh4Gvn@jkrzyszt-mobl2.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <10419859.qUNvkh4Gvn@jkrzyszt-mobl2.ger.corp.intel.com>
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

Hi Janusz,
On 2024-02-20 at 10:32:58 +0100, Janusz Krzysztofik wrote:
> Hi Kamil,
> 
> On Monday, 19 February 2024 18:42:32 CET Kamil Konieczny wrote:
> > Hi Janusz,
> > On 2024-02-16 at 11:23:58 +0100, Janusz Krzysztofik wrote:
> > > Hi Kamil, Dominik,
> > > 
> > > On Thursday, 15 February 2024 17:10:09 CET Kamil Konieczny wrote:
> > > > From: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> > > > 
> > > > For user convenience, introduce drm_open_driver_another as
> > > > a wrapper for __drm_open_driver_another with successful open
> > > > assert.
> > > 
> > > Out of several existing variants of *drm_open_driver* functions, those which 
> > > names start with "drm_", wrapped around their counterparts which names start 
> > > with double underscores, used to set up an exit handler that performs 
> > > necessary cleanups before exit, freeing users from taking care of that.  Don't 
> > > we want to keep that convention also for drm_open_driver_another() and set up 
> > > the exit handler from inside that wrapper on success?
> > > 
> > > Thanks,
> > > Janusz
> > > 
> > 
> > How and what should we unwind here? There is only fd, I do not see
> > any other var or state to unwind? Am I missing something?
> 
> Have you had a look at drm_open()?
> 
>         /* For i915, at least, we ensure that the driver is idle before
>          * starting a test and we install an exit handler to wait until
>          * idle before quitting.
>          */
>         if (is_i915_device(fd)) {
>                 if (__sync_fetch_and_add(&open_count, 1) == 0) {
>                         __cancel_work_at_exit(fd);
>                         at_exit_drm_fd = drm_reopen_driver(fd);
>                         igt_install_exit_handler(cancel_work_at_exit);
>                 }
>         }
> 
> From that point of view, how does multi-gpu testing differ from single-gpu?
> 
> And yes, that can be not trivial to extend the existing exit handlers solution 
> over multiple device file descriptor handling.
> 

This is another problem, I try to solve one, not all at once.
I could add a helper to stop resets from children as it can be
helpfull not only in multi-gpu scenarios.

> Also ...
> 
> > 
> > Regards,
> > Kamil
> > 
> > > > 
> > > > v2: rebased (Kamil)
> > > > v6: reword description (Janusz)
> > > > 
> > > > Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > > > Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> > > > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > > > Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > > > ---
> > > >  lib/drmtest.c | 19 +++++++++++++++++++
> > > >  lib/drmtest.h |  1 +
> > > >  2 files changed, 20 insertions(+)
> > > > 
> > > > diff --git a/lib/drmtest.c b/lib/drmtest.c
> > > > index 52b5a2020..73d9159af 100644
> > > > --- a/lib/drmtest.c
> > > > +++ b/lib/drmtest.c
> > > > @@ -563,6 +563,25 @@ int __drm_open_driver_another(int idx, int chipset)
> > > >  	return fd;
> > > >  }
> > > >  
> > > > +/*
> > > > + * drm_open_driver_another
> > > > + * @idx: index of the device you are opening
> > > > + * @chipset: OR'd flags for each chipset to search, eg. #DRIVER_INTEL
> > > > + *
> > > > + * A wrapper for __drm_open_driver with successful open assert.
> > > > + *
> > > > + * Returns:
> > > > + * An open DRM fd
> > > > + */
> > > > +int drm_open_driver_another(int idx, int chipset)
> > > > +{
> > > > +	int fd = __drm_open_driver_another(idx, chipset);
> > > > +
> > > > +	igt_assert_fd(fd);
> 
> drm_open_driver() skips in that case.  Shouldn't drm_open_driver_another() 
> also skip for consistency?

Good point, I will re-read this,

Regards,
Kamil

> 
> Thanks,
> Janusz
> 
> > > > +
> > > > +	return fd;
> > > > +}
> > > > +
> > > >  /**
> > > >   * __drm_open_driver:
> > > >   * @chipset: OR'd flags for each chipset to search, eg. #DRIVER_INTEL
> > > > diff --git a/lib/drmtest.h b/lib/drmtest.h
> > > > index 6bc819734..856208c48 100644
> > > > --- a/lib/drmtest.h
> > > > +++ b/lib/drmtest.h
> > > > @@ -101,6 +101,7 @@ void __set_forced_driver(const char *name);
> > > >  
> > > >  int __drm_open_device(const char *name, unsigned int chipset);
> > > >  void drm_load_module(unsigned int chipset);
> > > > +int drm_open_driver_another(int idx, int chipset);
> > > >  int drm_open_driver(int chipset);
> > > >  int drm_open_driver_master(int chipset);
> > > >  int drm_open_driver_render(int chipset);
> > > > 
> > > 
> > > 
> > > 
> > > 
> > 
> 
> 
> 
> 
