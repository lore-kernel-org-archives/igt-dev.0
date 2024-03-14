Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED740C54E60
	for <igt-dev@archiver.kernel.org>; Thu, 14 Mar 2024 16:45:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75ACE10F97B;
	Thu, 14 Mar 2024 16:45:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZKUKeRNI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C540D10F97B
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2024 16:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710434747; x=1741970747;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JNWFaPB/sVjY9A0vd2RGwfHy0uIEfu4IpjC3VrPEjo8=;
 b=ZKUKeRNIP37Wv6D0L627Al6S3IjpvPXgEuBfEGs5g4qn2X4nMKpDPN2W
 PsgpJnxyPhqcOtlXzuf62OogjuYEMmjZrAvGYoFgvWiz4N7AO1eF2quKS
 7KtA9qeCMA4lm/FSC7gndnx47ulGCQxpvPLl6MB2xy2vnDp5jQAuymak9
 G38O9KUtu65IK1oFKDpRy/Ghu+KpwZaevbOHsY833UhJJaq9TWTQ9Nhx6
 YJAVMNuzptw1xviuydAxox4W+eYp0HZVPCfSFNyGthRuZ+VIIN3+uM8pB
 7tVC4Vp8PfsFZiF3geJpd1eTfbIkn8IMu2/luaswztsNmoVKBKv+DyR6t A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="9080816"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="9080816"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 09:45:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="49785054"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 09:45:45 -0700
Date: Thu, 14 Mar 2024 17:45:42 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Helen Koike <helen.koike@collabora.com>
Subject: Re: [PATCH i-g-t v2 3/3] tests/core_getversion: test all drm devices
Message-ID: <20240314164542.7pefksrqi5wb265t@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Helen Koike <helen.koike@collabora.com>
References: <20240221102930.21473-1-kamil.konieczny@linux.intel.com>
 <20240221102930.21473-4-kamil.konieczny@linux.intel.com>
 <20240313150050.40a683bb@maurocar-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240313150050.40a683bb@maurocar-mobl2>
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

Hi Mauro,
On 2024-03-13 at 15:00:50 +0100, Mauro Carvalho Chehab wrote:
> On Wed, 21 Feb 2024 11:29:29 +0100
> Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:
> 
> > Create multigpu subtest and check all drm devices.
> > 
> > v2: add define for number of max tested cards (Helen)
> > 
> > Cc: Helen Koike <helen.koike@collabora.com>
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  tests/core_getversion.c | 21 +++++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> > 
> > diff --git a/tests/core_getversion.c b/tests/core_getversion.c
> > index 8b95e2ce4..1311e8dc5 100644
> > --- a/tests/core_getversion.c
> > +++ b/tests/core_getversion.c
> > @@ -40,11 +40,17 @@
> >   *
> >   * SUBTEST: basic
> >   * Description: Tests GET_VERSION ioctl of the first device.
> > + *
> > + * SUBTEST: multigpu
> > + * Description: Tests GET_VERSION ioctl for all drm devices.
> >   */
> >  
> >  IGT_TEST_DESCRIPTION("Tests the DRM_IOCTL_GET_VERSION ioctl and libdrm's "
> >  		     "drmGetVersion() interface to it.");
> >  
> > +/* constant same as in drmtest.c */
> > +#define MAX_DRM_CARDS 16
> > +
> 
> I would prefer to have MAX_DRM_CARDS defined into a header file
> probably at lib/drmtest.h, where __drm_open_driver_another() is
> declared.
> 
> Either way,
> 
> Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> 

Good point, I will merge first two patches and prepare
change for drmtest.h/c

Regards,
Kamil

> >  static void check(int fd, char *dst, int len)
> >  {
> >  	drmVersionPtr v;
> > @@ -78,6 +84,21 @@ igt_main
> >  		igt_info("0: %s\n", info);
> >  	}
> >  
> > +	igt_describe("Check GET_VERSION ioctl for all drm devices.");
> > +	igt_subtest("multigpu") {
> > +		int fd2;
> > +
> > +		for (int i = 0; i < MAX_DRM_CARDS; ++i) {
> > +			fd2 = __drm_open_driver_another(i, DRIVER_ANY);
> > +			if (fd2 == -1)
> > +				break;
> > +
> > +			check(fd2, info, sizeof(info));
> > +			igt_info("%d: %s\n", i, info);
> > +			drm_close_driver(fd2);
> > +		}
> > +	}
> > +
> >  	igt_fixture
> >  		drm_close_driver(fd);
> >  }
