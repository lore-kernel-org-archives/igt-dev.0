Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C28D5C4828F
	for <igt-dev@archiver.kernel.org>; Thu,  8 Feb 2024 17:13:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFCE010E0D7;
	Thu,  8 Feb 2024 17:12:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gh0Glpqa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA67D10E0E2
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Feb 2024 17:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707412373; x=1738948373;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=PvOVPyA/bM2AMo+Hg0mkCK2uFPhb+K6wpIz+4lF0aHo=;
 b=gh0GlpqaR8dXmfbCmMFiS63C7XB5LG1vJjnTgvQ/iugwQJw4WPWJbQu8
 zte+2feYSy7DoWu6RfM5k4oqA87V+XFUwKFuSCZyGFbgirjFyMaQCzKSb
 REQEeES8O7DcJfHL5SEHuATmqxSEpHt0IFLOKhdE9XxEb4AI0RAT56FLU
 Uc7XjZP3mWB1wjW/wmLFhqJE/p5rVYosL35EtXAeTvBQTo3IU0sMr08S9
 dgsWW7OW7BIyXjAIohZ8p9FRZ6j8d9Fegpjos6c0Uu0SHlEnZ98hBKRK1
 r3n//5At/ce0SRGWTdR0r/vSazh1S6nP2AIo6FDLUIQtpKzfbUaAiKDm0 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="436403109"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; d="scan'208";a="436403109"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 09:12:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="824891734"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; d="scan'208";a="824891734"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 08 Feb 2024 09:12:50 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 08 Feb 2024 19:12:49 +0200
Date: Thu, 8 Feb 2024 19:12:49 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Kulkarni, Vandita" <vandita.kulkarni@intel.com>
Cc: "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "B S, Karthik" <karthik.b.s@intel.com>
Subject: Re: [PATCH i-g-t] tests/kms_async_flip: Reduce the clobbering area
 used for CRC test
Message-ID: <ZcULkcsD6d4LgRn8@intel.com>
References: <20240208121039.13701-1-vandita.kulkarni@intel.com>
 <84ddef1c-d502-470d-8b05-2432416b8f9a@gmail.com>
 <SJ0PR11MB67899FCB90CF101777DDA1C98D442@SJ0PR11MB6789.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SJ0PR11MB67899FCB90CF101777DDA1C98D442@SJ0PR11MB6789.namprd11.prod.outlook.com>
X-Patchwork-Hint: comment
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

On Thu, Feb 08, 2024 at 04:03:49PM +0000, Kulkarni, Vandita wrote:
> > -----Original Message-----
> > From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> > Sent: Thursday, February 8, 2024 7:39 PM
> > To: Kulkarni, Vandita <vandita.kulkarni@intel.com>; igt-
> > dev@lists.freedesktop.org
> > Cc: ville.syrjala@linux.intel.com; B S, Karthik <karthik.b.s@intel.com>
> > Subject: Re: [PATCH i-g-t] tests/kms_async_flip: Reduce the clobbering area
> > used for CRC test
> > 
> > Hi Vandita,
> > 
> > On 8.2.2024 14.10, Vandita Kulkarni wrote:
> > > On some platforms wc_mmap write takes longer to paint the fb, which we
> > > are using to clobber the already scanned buffer for CRC. Hence
> > > reducing the clobbered area.
> > >
> > > Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
> > > ---
> > >   tests/kms_async_flips.c | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c index
> > > a0349fa03..2e5960943 100644
> > > --- a/tests/kms_async_flips.c
> > > +++ b/tests/kms_async_flips.c
> > > @@ -589,7 +589,7 @@ static void test_crc(data_t *data)
> > >
> > >   	while (clock_ms() - start < 2000) {
> > >   		/* fill the next fb with the expected color */
> > > -		paint_fb(data, &data->bufs[frame], 1, height, 0xff0000ff);
> > > +		paint_fb(data, &data->bufs[frame], 10, 10, 0xff0000ff);
> > 
> > Here really is needed to be painted full height of the framebuffer and that
> > width can be kept at 1 as any number higher will just increase the work.
> > 
> > For async flip part of fb which will become visible is not known here so the
> > full height of the fb need to be painted on to catch if there was something
> > going wrong.
> Thanks JP for the feedback, you are right, for async flip we might not know if
> the previous fb is still being scanned until we check the last line.
> This might not be the solution then.
> 
> Other option(on non fixed panels) where we can optimize is by selecting the
> smallest mode, where as  now mode[0] is being picked.

I already did that once, but it broke something, and was reverted.
See commit 79483e9ae4fe ("Revert "tests/kms_async_flips: Make the crc test faster"")

Hmm. Looking at that revert maybe the problem was that I just used that
hardcoded 1024x768 mode, which perhaps didn't work due to i915 still
missing the PLL algorithm for the newer platforms. Picking a smallish
mode from the connector's mode list might work better.

> Incase we pick the smallest mode we might have to write a new case to test
> async flips with bigjoiner.
> Also it is really not clear on which platforms and drivers, how much time it would take to
> paint 1xh fb. I will try to check further on this.
> 
> Thanks,
> Vandita
> > 
> > >
> > >   		data->flip_pending = true;
> > >   		ret = drmModePageFlip(data->drm_fd, data->crtc_id,
> > > data->bufs[frame].fb_id, @@ -600,7 +600,7 @@ static void
> > > test_crc(data_t *data)
> > >
> > >   		/* clobber the previous fb which should no longer be
> > scanned out */
> > >   		frame = !frame;
> > > -		paint_fb(data, &data->bufs[frame], 1, height, rand());
> > > +		paint_fb(data, &data->bufs[frame], 10, 10, rand());
> > >   	}
> > >
> > >   	igt_pipe_crc_stop(data->pipe_crc);
> 

-- 
Ville Syrjälä
Intel
