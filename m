Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF15D68BCE
	for <igt-dev@archiver.kernel.org>; Fri, 15 Nov 2024 17:10:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63EC210E043;
	Fri, 15 Nov 2024 17:10:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nMErk+2h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C1D10E043
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Nov 2024 17:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731690649; x=1763226649;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=GyC4Qb5vKElKR6svEJsQePU3APbJKksBya9RFkT836U=;
 b=nMErk+2hx5In72nxm/y608+e/0YIrDDcW7GlHTXEn0DYLZIYhWye3CH1
 Qr8Nurr0ifYpr4LtJ2lD0VE7jmHBjJfXx+H1MN++mKvOzYzGrwZd7QG7g
 yqLRaq0Y4XflbbIfGzwqYGR+gYNFYiQ5uW4dzesYdU4EYL3AA13i8QuKT
 +9Rp6m5eCzfaXfLjL3IfsmHTTGiKAnxhd7mH4vEmV7cLbZtfvBia81TxR
 GKck/0M9MZMs0vwxsSViktgx9bO0Sroky/lhnONFT5eBGzneTqhphqL+A
 jBGlBig6IR1Fk8ME80hdJE6m28r3w+E6uIKMyQUvy5sjRCV05vMHWrh8/ A==;
X-CSE-ConnectionGUID: A8FoVGrmRG6s6xfKZljqJA==
X-CSE-MsgGUID: BrmOgmzlSBypG6/wJjep/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="31775678"
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="31775678"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 09:10:48 -0800
X-CSE-ConnectionGUID: rGpC0iHlQ32Q8hbqh1ilkQ==
X-CSE-MsgGUID: iB8M+Ks6TN2GalKV3GEFrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="89031829"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 09:10:47 -0800
Date: Fri, 15 Nov 2024 19:11:16 +0200
From: Imre Deak <imre.deak@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 3/3] tests/i915/kms_flip_tiling: Fix pageflip
 timeout for low vrefresh modes
Message-ID: <ZzeAtMTrx_24vFur@ideak-desk.fi.intel.com>
References: <20241022155311.2797257-1-imre.deak@intel.com>
 <20241022155311.2797257-4-imre.deak@intel.com>
 <ee9c4c59-3807-4712-bed8-30f09859a2ac@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee9c4c59-3807-4712-bed8-30f09859a2ac@intel.com>
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

On Fri, Nov 15, 2024 at 05:14:22PM +0530, Sharma, Swati2 wrote:
> Hi Imre,
> 
> Do we have some gitlab issue associated with this fix?

Not sure if there is, the problem needs a mode with a vrefresh rate <
60Hz (to be added to CI for an MST config at least).

> 
> On 22-10-2024 09:23 pm, Imre Deak wrote:
> > The current fixed 50 ms timeout for pageflip completion is not long
> > enough for low vrefresh modes. In general the timeout should account for
> > one frame for the flip itself + one frame for vblank waiting due to FBC
> > invalidation + a fixed amount for scheduling overhead delivering the
> > completion event to userspace. For the usual 60Hz modes the 50 ms
> > timeout worked ok based on the above (2 * 17 ms + 16 ms), but didn't
> > work for 30 Hz modes (the minimum timeout for those being ~67 ms).
> > 
> > Based on the above use a timeout length of 2 * mode specific frame
> > time + 20 ms fixed scheduling delay.
> > 
> > Testcase: igt@kms_flip_tiling
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > ---
> >   tests/intel/kms_flip_tiling.c | 14 +++++++++++++-
> >   1 file changed, 13 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tests/intel/kms_flip_tiling.c b/tests/intel/kms_flip_tiling.c
> > index 3bf02564e..e937c2171 100644
> > --- a/tests/intel/kms_flip_tiling.c
> > +++ b/tests/intel/kms_flip_tiling.c
> > @@ -86,6 +86,18 @@ static int try_commit(igt_display_t *display)
> >   				       COMMIT_ATOMIC : COMMIT_LEGACY);
> >   }
> > +static uint64_t pageflip_timeout_us(drmModeModeInfo *mode)
> > +{
> > +	uint64_t timeout_ns;
> > +
> > +	/* 1 frame for flip + 1 frame for vblank wait due to FBC. */
> > +	timeout_ns = igt_kms_frame_time_from_vrefresh(mode->vrefresh) * 2;
> > +	/* 20 msec scheduling overhead. */
> > +	timeout_ns += 20000000;
> > +
> > +	return DIV_ROUND_UP(timeout_ns, 1000);
> > +}
> > +
> >   static void
> >   test_flip_tiling(data_t *data, enum pipe pipe, igt_output_t *output, uint64_t modifier[2])
> >   {
> > @@ -137,7 +149,7 @@ test_flip_tiling(data_t *data, enum pipe pipe, igt_output_t *output, uint64_t mo
> >   	igt_require(ret == 0);
> >   	data->flipevent_in_queue = true;
> > -	kmstest_wait_for_pageflip(data->drm_fd);
> > +	kmstest_wait_for_pageflip_timeout(data->drm_fd, pageflip_timeout_us(mode));
> >   	data->flipevent_in_queue = false;
> >   	/* Get a crc and compare with the reference. */
