Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38FCFCFA451
	for <igt-dev@archiver.kernel.org>; Thu, 24 Oct 2024 10:29:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E221D10E004;
	Thu, 24 Oct 2024 10:29:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GWjhEiis";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D07DB10E004
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Oct 2024 10:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729765768; x=1761301768;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=Lryvf5a/161QdgTzllL88weEB2breGp464xef9UOfVc=;
 b=GWjhEiis1KuSLxDsZtO9zvJdC55Yvo7O7slBPV7/DLK3w2znT1PJpQ40
 J31BX28rgTDbCbwm25A/ocSU73ec5UIsltbxFE7goJgaI0nxG9OIGOWRj
 PMmFmzN3qHvlH9Xqwn4wH04IJRcMOfhr7Dqp1W+ysumzq5ahHaHHts5Mw
 GJWeHzsiZyToKfsXp85+0d84Z+W/sHmZYP4/C1K+c7OhqD7DVM/lnajqx
 ks/Sq2Y428jv6h0XuhIM2xgxHiajpqWQiL58C/wVjk2fipKfBin9IiyrC
 kLZfMsi/uE56FURbeiZBlw42Q9LoHcXrMOKHTG7Hfvn3oJFczOW3TC6DF g==;
X-CSE-ConnectionGUID: EZFg2SW5T/2DA5Gh7GiPbA==
X-CSE-MsgGUID: hsq7daWUQUCF8o6SuF8t5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="39974559"
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="39974559"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 03:29:27 -0700
X-CSE-ConnectionGUID: /pOfAH8mR2OtgnULcDRL5Q==
X-CSE-MsgGUID: 25b11w9QR4OhaoAnnO1lFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="118020849"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 03:29:26 -0700
Date: Thu, 24 Oct 2024 13:29:57 +0300
From: Imre Deak <imre.deak@intel.com>
To: "Srikanth V, NagaVenkata" <nagavenkata.srikanth.v@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 2/3] lib/igt_kms: Add
 kmstest_wait_for_pageflip_timeout()
Message-ID: <ZxohpYbRXMBNLIZK@ideak-desk.fi.intel.com>
References: <20241022155311.2797257-1-imre.deak@intel.com>
 <20241022155311.2797257-3-imre.deak@intel.com>
 <CH0PR11MB55080151951EF2E65DDB12ACC24E2@CH0PR11MB5508.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CH0PR11MB55080151951EF2E65DDB12ACC24E2@CH0PR11MB5508.namprd11.prod.outlook.com>
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
Reply-To: imre.deak@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Thu, Oct 24, 2024 at 08:45:53AM +0300, Srikanth V, NagaVenkata wrote:
> 
> 
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Imre
> > Deak
> > Sent: Tuesday, October 22, 2024 9:23 PM
> > To: igt-dev@lists.freedesktop.org
> > Subject: [PATCH i-g-t 2/3] lib/igt_kms: Add
> > kmstest_wait_for_pageflip_timeout()
> >
> > Add a function to wait for a page flip completion providing the timeout
> > duration. This is required by the next patch, using an Intel HW specific
> > pageflip timeout.
> >
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > ---
> >  lib/igt_kms.c | 21 +++++++++++++++++----  lib/igt_kms.h |  1 +
> >  2 files changed, 18 insertions(+), 4 deletions(-)
> >
> > diff --git a/lib/igt_kms.c b/lib/igt_kms.c index 99231d6e7..81a9930a2 100644
> > --- a/lib/igt_kms.c
> > +++ b/lib/igt_kms.c
> > @@ -2377,15 +2377,16 @@ unsigned int kmstest_get_vblank(int fd, int pipe,
> > unsigned int flags)  }
> >
> >  /**
> > - * kmstest_wait_for_pageflip:
> > + * kmstest_wait_for_pageflip_timeout:
> >   * @fd: Opened drm file descriptor
> > + * @timeout_us: timeout used for waiting
> >   *
> >   * Blocks until pageflip is completed
> >   */
> > -void kmstest_wait_for_pageflip(int fd)
> > +void kmstest_wait_for_pageflip_timeout(int fd, uint64_t timeout_us)
> >  {
> >       drmEventContext evctx = { .version = 2 };
> > -     struct timeval timeout = { .tv_sec = 0, .tv_usec = 50000 };
> > +     struct timeval timeout = { .tv_sec = 0, .tv_usec = timeout_us };
> >       fd_set fds;
> >       int ret;
> >
> > @@ -2398,7 +2399,8 @@ void kmstest_wait_for_pageflip(int fd)
> >       } while (ret < 0 && errno == EINTR);
> >
> >       igt_fail_on_f(ret == 0,
> > -                  "Exceeded timeout (50ms) while waiting for a pageflip\n");
> > +                  "Exceeded timeout (%" PRIu64 " us) while waiting for a
> > pageflip\n",
> > +                  timeout_us);
> >
> >       igt_assert_f(ret == 1,
> >                    "Waiting for pageflip failed with %d from
> > select(drmfd)\n", @@ -2407,6 +2409,17 @@ void
> > kmstest_wait_for_pageflip(int fd)
> >       igt_assert(drmHandleEvent(fd, &evctx) == 0);  }
> >
> > +/**
> > + * kmstest_wait_for_pageflip:
> > + * @fd: Opened drm file descriptor
> > + *
> > + * Blocks until pageflip is completed using a 50 ms timeout.
> > + */
> > +void kmstest_wait_for_pageflip(int fd)
> > +{
> > +     kmstest_wait_for_pageflip_timeout(fd, 50000); }
> > +
> 
> Do we still need this definition of this function ?

kmstest_wait_for_pageflip() is used in many places.

> >  /**
> >   * kms_has_vblank:
> >   * @fd: DRM fd
> > diff --git a/lib/igt_kms.h b/lib/igt_kms.h index fc7e4cda1..57e62d86c 100644
> > --- a/lib/igt_kms.h
> > +++ b/lib/igt_kms.h
> > @@ -310,6 +310,7 @@ void *kmstest_dumb_map_buffer(int fd, uint32_t
> > handle, uint64_t size,
> >                             unsigned prot);
> >  void kmstest_dumb_destroy(int fd, uint32_t handle);  void
> > kmstest_wait_for_pageflip(int fd);
> > +void kmstest_wait_for_pageflip_timeout(int fd, uint64_t timeout_us);
> >  unsigned int kmstest_get_vblank(int fd, int pipe, unsigned int flags);
> >
> >  bool kms_has_vblank(int fd);
> > --
> > 2.44.2
> 
