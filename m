Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D0EE7718A
	for <igt-dev@archiver.kernel.org>; Thu, 19 Dec 2024 20:35:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFE6510E2AC;
	Thu, 19 Dec 2024 20:35:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GcoilenQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00F8610E2AC
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Dec 2024 20:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734640534; x=1766176534;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=y3wJUS37dgj+8sxEzvv6DBhWk/exS9t7tyA/O4e/FxY=;
 b=GcoilenQRHs1CEtiLlryL3/NsxD1/lvB//ze4otTVATex1s1b7bDnv+1
 Fzf/3TCpK0uW49o9bckCeC3pxbdpvdPdE+8VgvB8T8F6b5kEl81g9TsQy
 7QmGI0QvGx36Z31xdGmO6mrvUViXFJ60V+BBK8P/IQBGUBtK11hKHFBYv
 NzSfQPis7bqFqPdhQvOZZITL4Idrhf43Ecv36DwieLr2EKpV5T/gzI2Qd
 Dq5+JjX4lwsduqnqUtAj1cBWmPRdyUU4dviVqgV/6TASbu1bC2UutbOuF
 VkroqnlL8d2Nu73IsM97qatIK/Dp428TTSimwpw2V7B4+2PPWzHLQNBJI Q==;
X-CSE-ConnectionGUID: fLh0QXYGRS6RT0PeTvZY8g==
X-CSE-MsgGUID: ZoLGGrqTSRuCp5gGkY5Dug==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="38958577"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="38958577"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 12:35:34 -0800
X-CSE-ConnectionGUID: VR8Ev7CqQ4icrGlSx79Ldg==
X-CSE-MsgGUID: +atPkFr1TYyX692Itf7sWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="98702182"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 12:35:32 -0800
Date: Thu, 19 Dec 2024 21:35:30 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 2/2] tests/core_getversion: Added raw-cards subtest
Message-ID: <20241219203530.7ctzgjggmf7ykrrx@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20241218190418.126565-1-kamil.konieczny@linux.intel.com>
 <20241218190418.126565-3-kamil.konieczny@linux.intel.com>
 <CH0PR11MB544413277C824C3B1CAF3DC6E5052@CH0PR11MB5444.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CH0PR11MB544413277C824C3B1CAF3DC6E5052@CH0PR11MB5444.namprd11.prod.outlook.com>
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

Hi Jonathan,
On 2024-12-18 at 20:37:06 +0000, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kamil Konieczny
> Sent: Wednesday, December 18, 2024 11:04 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Subject: [PATCH i-g-t 2/2] tests/core_getversion: Added raw-cards subtest
> > 
> > Created new subtest raw-card for checking all cards without
> > loading any driver, so it could show what is loaded on a system
> > after booting.
> > 
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
> Minor nits below, but nothing blocking:
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> 
> > ---
> >  tests/core_getversion.c | 39 ++++++++++++++++++++++++++++++++-------
> >  1 file changed, 32 insertions(+), 7 deletions(-)
> > 
> > diff --git a/tests/core_getversion.c b/tests/core_getversion.c
> > index 0842b7db6..989ed2aba 100644
> > --- a/tests/core_getversion.c
> > +++ b/tests/core_getversion.c
> > @@ -25,6 +25,7 @@
> >   *
> >   */
> >  
> > +#include <fcntl.h>
> >  #include <string.h>
> >  #include <sys/ioctl.h>
> >  
> > @@ -45,6 +46,9 @@
> >   *
> >   * SUBTEST: all-cards
> >   * Description: Tests GET_VERSION ioctl for all drm devices.
> > + *
> > + * SUBTEST: raw-cards
> > + * Description: Test GET_VERSION ioctl for all present drm devices without loading any driver.
> >   */
> >  
> >  IGT_TEST_DESCRIPTION("Tests the DRM_IOCTL_GET_VERSION ioctl and libdrm's "
> > @@ -83,26 +87,47 @@ static void check_all_drm(void)
> >  	}
> >  }
> >  
> > -igt_main
> > +static void check_raw_drm_cards(void)
> >  {
> > +	char fname[32];
> >  	char info[256];
> > -	int fd;
> > +	int fd2, count;
> >  
> > -	igt_fixture {
> > -		fd = __drm_open_driver(DRIVER_ANY);
> > -		igt_assert_fd(fd);
> > +	count = 0;
> > +	for (int i = 0; i < 128; i++) {
> 
> Nit:
> 128 seems a bit arbitrary.  Is there a max card count macro we could be referencing?
> Or perhaps we can create that macro locally as a part of this new test?
> 

It is Linux kernel and/or DRM constant (as for now),
look into lib/drmtest.c

I could make it into a lib function like:

bool __drm_get_dri_card_path(path, size, idx);
bool __drm_get_dri_render_path(path, size, idx);

/* fill in system specific path to card, return false
 * in case of path too small or idx out of bound
 */

> > +		snprintf(fname, ARRAY_SIZE(fname), "/dev/dri/card%d", i);
> > +		fd2 = open(fname, O_RDWR);
> > +		if (fd2 == -1)
> > +			continue;
> > +
> > +		++count;
> > +		check(fd2, info, sizeof(info));
> > +		igt_info("%d: %s\n", i, info);
> > +		close(fd2);
> >  	}
> >  
> > +	igt_info("Tested %d drm devices\n", count);
> > +}
> > +
> > +igt_main
> > +{
> > +	char info[256];
> > +	int fd;
> > +
> >  	igt_describe("Check GET_VERSION ioctl of the first drm device.");
> >  	igt_subtest("basic") {
> > +		fd = __drm_open_driver(DRIVER_ANY);
> > +		igt_assert_fd(fd);
> >  		check(fd, info, sizeof(info));
> >  		igt_info("0: %s\n", info);
> > +		__drm_close_driver(fd);
> 
> Nit:
> I see we're moving the drm open and close calls out of the fixtures and
> into the basic subtest.  Perhaps it would be better to do this as a part of
> the previous patch, rather than here.
> -Jonathan Cavitt
> 

Hmm, right, I will respin new version.

Regards,
Kamil

> >  	}
> >  
> >  	igt_describe("Check GET_VERSION ioctl for all drm devices.");
> >  	igt_subtest("all-cards")
> >  		check_all_drm();
> >  
> > -	igt_fixture
> > -		__drm_close_driver(fd);
> > +	igt_describe("Check GET_VERSION ioctl for all present drm devices without loading any driver.");
> > +	igt_subtest("raw-cards")
> > +		check_raw_drm_cards();
> >  }
> > -- 
> > 2.47.1
> > 
> > 
