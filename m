Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D55D4920F
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 11:30:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C96C10E49D;
	Mon, 18 Nov 2024 11:30:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iUUN4N83";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D8F910E49D
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 11:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731929449; x=1763465449;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=GD1x11BteAwhbxQSyILiru+6zUJwo7JubJ6M2wdQrYg=;
 b=iUUN4N83iiULIPsXyXj6E8agGzSLnWMxzAfwpDmPukbMF16A/9jvMPM1
 5851npKtnaTcGAd2sturYsJ6dKljPM6pnxTj962ddYVtZg4o/IwchOjJL
 YLoZKr9P7BTU8Aa87XMOIlWNS5ET+S2N3/fauXG9cY0lFjhLznYKifSmY
 Ds9JDNhrzM+i/dzNz7rMPUiZdpBZFZDeBDSiHgOUgSa/SQZ/IHw3LCUPQ
 7S5E2y7aIywFUDrL73/sLBwF9mAWNDc8/eYVK3dJogNQWy+ON3ZwI2vvJ
 PCKnIHRgk4706WTjOoccGgswqY7rJvxyLt53Jjq0XB+MHJ6ymmP/DlqCA A==;
X-CSE-ConnectionGUID: zhH+ydDhTMuu4aM521R5Gg==
X-CSE-MsgGUID: DN+PtKNzRz+wlVIVVe+frw==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="43268223"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="43268223"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 03:30:48 -0800
X-CSE-ConnectionGUID: zu41fDuhSfqfgwAfgkUI1Q==
X-CSE-MsgGUID: O24DAoaQSnGuYs8wch/RbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="120050692"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 03:30:47 -0800
Date: Mon, 18 Nov 2024 13:31:19 +0200
From: Imre Deak <imre.deak@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 3/3] tests/i915/kms_flip_tiling: Fix pageflip
 timeout for low vrefresh modes
Message-ID: <Zzslh97tC5c-OS5N@ideak-desk.fi.intel.com>
References: <20241022155311.2797257-1-imre.deak@intel.com>
 <20241022155311.2797257-4-imre.deak@intel.com>
 <ee9c4c59-3807-4712-bed8-30f09859a2ac@intel.com>
 <ZzeAtMTrx_24vFur@ideak-desk.fi.intel.com>
 <edc62da3-6ef7-4c45-ab88-a23bfe1b0896@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <edc62da3-6ef7-4c45-ab88-a23bfe1b0896@intel.com>
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

On Mon, Nov 18, 2024 at 01:31:34PM +0530, Sharma, Swati2 wrote:
> Imre, Can you check if your patch is fixing following gitlab issue
> 
> https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1491
> 
> This is MST config re-lnl-4 with 4K@30 mode
> 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2244-5b1f614ccf1008e7aee531bf76bb639802e0df88/re-lnl-4/igt@kms_flip_tiling@flip-change-tiling.html
> 
> If so, add closes tag.

Yes, it looks like the same issue.

> Anyways, patch LGTM
> 
> Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

Thanks for thet review, patchset is pushed now adding the above closes
tag. The CI failures are unrelated, since all of those happen in a
different test than igt/kms_flip_tiling (in which these changes have no
effect).

> 
> On 15-11-2024 10:41 pm, Imre Deak wrote:
> 
> > On Fri, Nov 15, 2024 at 05:14:22PM +0530, Sharma, Swati2 wrote:
> > > Hi Imre,
> > > 
> > > Do we have some gitlab issue associated with this fix?
> > Not sure if there is, the problem needs a mode with a vrefresh rate <
> > 60Hz (to be added to CI for an MST config at least).
> > 
> > > On 22-10-2024 09:23 pm, Imre Deak wrote:
> > > > The current fixed 50 ms timeout for pageflip completion is not long
> > > > enough for low vrefresh modes. In general the timeout should account for
> > > > one frame for the flip itself + one frame for vblank waiting due to FBC
> > > > invalidation + a fixed amount for scheduling overhead delivering the
> > > > completion event to userspace. For the usual 60Hz modes the 50 ms
> > > > timeout worked ok based on the above (2 * 17 ms + 16 ms), but didn't
> > > > work for 30 Hz modes (the minimum timeout for those being ~67 ms).
> > > > 
> > > > Based on the above use a timeout length of 2 * mode specific frame
> > > > time + 20 ms fixed scheduling delay.
> > > > 
> > > > Testcase: igt@kms_flip_tiling
> > > > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > > > ---
> > > >    tests/intel/kms_flip_tiling.c | 14 +++++++++++++-
> > > >    1 file changed, 13 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/tests/intel/kms_flip_tiling.c b/tests/intel/kms_flip_tiling.c
> > > > index 3bf02564e..e937c2171 100644
> > > > --- a/tests/intel/kms_flip_tiling.c
> > > > +++ b/tests/intel/kms_flip_tiling.c
> > > > @@ -86,6 +86,18 @@ static int try_commit(igt_display_t *display)
> > > >    				       COMMIT_ATOMIC : COMMIT_LEGACY);
> > > >    }
> > > > +static uint64_t pageflip_timeout_us(drmModeModeInfo *mode)
> > > > +{
> > > > +	uint64_t timeout_ns;
> > > > +
> > > > +	/* 1 frame for flip + 1 frame for vblank wait due to FBC. */
> > > > +	timeout_ns = igt_kms_frame_time_from_vrefresh(mode->vrefresh) * 2;
> > > > +	/* 20 msec scheduling overhead. */
> > > > +	timeout_ns += 20000000;
> > > > +
> > > > +	return DIV_ROUND_UP(timeout_ns, 1000);
> > > > +}
> > > > +
> > > >    static void
> > > >    test_flip_tiling(data_t *data, enum pipe pipe, igt_output_t *output, uint64_t modifier[2])
> > > >    {
> > > > @@ -137,7 +149,7 @@ test_flip_tiling(data_t *data, enum pipe pipe, igt_output_t *output, uint64_t mo
> > > >    	igt_require(ret == 0);
> > > >    	data->flipevent_in_queue = true;
> > > > -	kmstest_wait_for_pageflip(data->drm_fd);
> > > > +	kmstest_wait_for_pageflip_timeout(data->drm_fd, pageflip_timeout_us(mode));
> > > >    	data->flipevent_in_queue = false;
> > > >    	/* Get a crc and compare with the reference. */
