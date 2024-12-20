Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33BFAE77188
	for <igt-dev@archiver.kernel.org>; Fri, 20 Dec 2024 18:21:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C891210E0C3;
	Fri, 20 Dec 2024 18:21:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XG3ZPDzV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F413210E0C3
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Dec 2024 18:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734718882; x=1766254882;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=81bhvrbw2XnlQw03lpvvl/Z5kZuA0o0uDJFNa3mhDok=;
 b=XG3ZPDzVQhGYDK0MustvmZQACFHpKRxZ7QTcZp7u1N9UaMAngtWs9HmW
 8lsIDEUTmz0+rUrMUz5XcV1JHvdMWTg9jesw1Iu/fyKJgvUt4QywNnBT2
 mRUz8MA6WrxIKst9/wCuALIgdIbBgY4EAkwfKrC9MBV6BEW9fJp0gmTmO
 KJDmR35kTmH8h3gEdUGPWBHFHDDtySzRSZICzf6l7g7OpbO33SsaHBT8L
 +IcOzrsQ94V+Pk8u15DRF1K1HBqSMnGxr3VYP3yPLk3aOxYNAZTF5upw0
 dWqYmzIzmuTm6LqGPYWsO+GFNpc14mx3CM5DlWG1eFswt1RlBNQLOLSAr A==;
X-CSE-ConnectionGUID: XlE4bKYWR7axizX77YDJVg==
X-CSE-MsgGUID: 39ysqfIQSPCZZzQwoei/mA==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="46283840"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="46283840"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 10:21:22 -0800
X-CSE-ConnectionGUID: dZ9lwgIvSq2KvNUI8hY51A==
X-CSE-MsgGUID: 379ODSUbRAeocn6LpZmcEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="129390336"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 10:21:21 -0800
Date: Fri, 20 Dec 2024 19:21:18 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 2/2] tests/core_getversion: Added raw-cards subtest
Message-ID: <20241220182118.lssgnlwfpgw2vzku@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20241218190418.126565-1-kamil.konieczny@linux.intel.com>
 <20241218190418.126565-3-kamil.konieczny@linux.intel.com>
 <CH0PR11MB544413277C824C3B1CAF3DC6E5052@CH0PR11MB5444.namprd11.prod.outlook.com>
 <20241219203530.7ctzgjggmf7ykrrx@kamilkon-desk.igk.intel.com>
 <CH0PR11MB544477AFD76E8330DDA16227E5062@CH0PR11MB5444.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CH0PR11MB544477AFD76E8330DDA16227E5062@CH0PR11MB5444.namprd11.prod.outlook.com>
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

Hi Cavitt,,
On 2024-12-19 at 21:03:29 +0000, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Kamil Konieczny <kamil.konieczny@linux.intel.com> 
> Sent: Thursday, December 19, 2024 12:36 PM
> To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> Cc: igt-dev@lists.freedesktop.org
> Subject: Re: [PATCH i-g-t 2/2] tests/core_getversion: Added raw-cards subtest
> > 
> > Hi Jonathan,
> > On 2024-12-18 at 20:37:06 +0000, Cavitt, Jonathan wrote:
> > > -----Original Message-----
> > > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kamil Konieczny
> > > Sent: Wednesday, December 18, 2024 11:04 AM
> > > To: igt-dev@lists.freedesktop.org
> > > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > > Subject: [PATCH i-g-t 2/2] tests/core_getversion: Added raw-cards subtest
> > > > 
> > > > Created new subtest raw-card for checking all cards without
> > > > loading any driver, so it could show what is loaded on a system
> > > > after booting.
> > > > 
> > > > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > > 
> > > Minor nits below, but nothing blocking:
> > > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > 
> > > > ---
> > > >  tests/core_getversion.c | 39 ++++++++++++++++++++++++++++++++-------
> > > >  1 file changed, 32 insertions(+), 7 deletions(-)
> > > > 
> > > > diff --git a/tests/core_getversion.c b/tests/core_getversion.c
> > > > index 0842b7db6..989ed2aba 100644
> > > > --- a/tests/core_getversion.c
> > > > +++ b/tests/core_getversion.c
> > > > @@ -25,6 +25,7 @@
> > > >   *
> > > >   */
> > > >  
> > > > +#include <fcntl.h>
> > > >  #include <string.h>
> > > >  #include <sys/ioctl.h>
> > > >  
> > > > @@ -45,6 +46,9 @@
> > > >   *
> > > >   * SUBTEST: all-cards
> > > >   * Description: Tests GET_VERSION ioctl for all drm devices.
> > > > + *
> > > > + * SUBTEST: raw-cards
> > > > + * Description: Test GET_VERSION ioctl for all present drm devices without loading any driver.
> > > >   */
> > > >  
> > > >  IGT_TEST_DESCRIPTION("Tests the DRM_IOCTL_GET_VERSION ioctl and libdrm's "
> > > > @@ -83,26 +87,47 @@ static void check_all_drm(void)
> > > >  	}
> > > >  }
> > > >  
> > > > -igt_main
> > > > +static void check_raw_drm_cards(void)
> > > >  {
> > > > +	char fname[32];
> > > >  	char info[256];
> > > > -	int fd;
> > > > +	int fd2, count;
> > > >  
> > > > -	igt_fixture {
> > > > -		fd = __drm_open_driver(DRIVER_ANY);
> > > > -		igt_assert_fd(fd);
> > > > +	count = 0;
> > > > +	for (int i = 0; i < 128; i++) {
> > > 
> > > Nit:
> > > 128 seems a bit arbitrary.  Is there a max card count macro we could be referencing?
> > > Or perhaps we can create that macro locally as a part of this new test?
> > > 
> > 
> > It is Linux kernel and/or DRM constant (as for now),
> > look into lib/drmtest.c
> > 
> > I could make it into a lib function like:
> > 
> > bool __drm_get_dri_card_path(path, size, idx);
> > bool __drm_get_dri_render_path(path, size, idx);
> > 
> > /* fill in system specific path to card, return false
> >  * in case of path too small or idx out of bound
> >  */
> 
> That sounds good, though we'd probably want some way to pass
> back the opened file descriptor.  I guess the prototype for the
> dri card path function might look like:
> 
> """
> bool __drm_get_dri_card_path(int id, int *fd)
> {
> 	char fname[32];
> 
> 	snprintf(fname, ARRAY_SIZE(fname), "/dev/dri/card%d", id);
> 	*fd = open(fname, O_RDWR);
> 	return *fd != -1;
> }
> """
> And, of course, there'd be a mirror for __drm_get_render_card_path.
> 

Yes, something like that but avoiding to open an actual file,
leave that decision to caller.

Regards,
Kamil

> > 
> > > > +		snprintf(fname, ARRAY_SIZE(fname), "/dev/dri/card%d", i);
> > > > +		fd2 = open(fname, O_RDWR);
> > > > +		if (fd2 == -1)
> > > > +			continue;
> > > > +
> > > > +		++count;
> > > > +		check(fd2, info, sizeof(info));
> > > > +		igt_info("%d: %s\n", i, info);
> > > > +		close(fd2);
> > > >  	}
> > > >  
> > > > +	igt_info("Tested %d drm devices\n", count);
> > > > +}
> > > > +
> > > > +igt_main
> > > > +{
> > > > +	char info[256];
> > > > +	int fd;
> > > > +
> > > >  	igt_describe("Check GET_VERSION ioctl of the first drm device.");
> > > >  	igt_subtest("basic") {
> > > > +		fd = __drm_open_driver(DRIVER_ANY);
> > > > +		igt_assert_fd(fd);
> > > >  		check(fd, info, sizeof(info));
> > > >  		igt_info("0: %s\n", info);
> > > > +		__drm_close_driver(fd);
> > > 
> > > Nit:
> > > I see we're moving the drm open and close calls out of the fixtures and
> > > into the basic subtest.  Perhaps it would be better to do this as a part of
> > > the previous patch, rather than here.
> > > -Jonathan Cavitt
> > > 
> > 
> > Hmm, right, I will respin new version.
> 
> Understood.  Thanks much!
> -Jonathan Cavitt
> 
> > 
> > Regards,
> > Kamil
> > 
> > > >  	}
> > > >  
> > > >  	igt_describe("Check GET_VERSION ioctl for all drm devices.");
> > > >  	igt_subtest("all-cards")
> > > >  		check_all_drm();
> > > >  
> > > > -	igt_fixture
> > > > -		__drm_close_driver(fd);
> > > > +	igt_describe("Check GET_VERSION ioctl for all present drm devices without loading any driver.");
> > > > +	igt_subtest("raw-cards")
> > > > +		check_raw_drm_cards();
> > > >  }
> > > > -- 
> > > > 2.47.1
> > > > 
> > > > 
> > 
