Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97676CD4F54
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 18:28:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 487C610E8EB;
	Wed, 27 May 2026 18:28:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bNAyUfxs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F52610E8E9
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 18:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779906487; x=1811442487;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=JlnmaEf3MScBDQ1pMiXmDEn1u90IbANwU8DLA+Y6edA=;
 b=bNAyUfxsTu50Crkt7uJ4OwYs6Yt6tcE7pwEWp8UrXv2G3Y3qK948aDHz
 8kyNCJiN1Wp6ebyCR4Qv+/8Qy35sjQIIXIvlXarKscXQicj7i8IPG2js/
 JlAANNz5+7kxITPgOk19lH2riMWShNIAQjiiGFy5aJDwBVCs0p8r7ZNQv
 NqHb/x0zpIKPCF1UTNFfDKvb7YJjTNIGZ4dUXPVgF4uyAVoMTIteEpdSk
 6mKNRlt2kPGvf59bXUd6BUNjC08PXGTkE2xh7BHYTo7bCd/mlc6pRj7e4
 7+BABFgMLCP3VoqypePp/0n+qT8apO1M9okCwYmmKOWJe82BfHIYf+jeF w==;
X-CSE-ConnectionGUID: a0JgE10fSgmMA2sPNnhEew==
X-CSE-MsgGUID: oPxi8E4RRcq3zW6QyK2ukw==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="103422837"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="103422837"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 11:28:07 -0700
X-CSE-ConnectionGUID: JYkXeipCR6eMlcbYgvLSUg==
X-CSE-MsgGUID: SBfOsI7wQGCq6cRfojdJuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="235951355"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.80])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 11:28:02 -0700
Date: Wed, 27 May 2026 21:27:58 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>
Cc: "suresh.kumar.kurmi@intel.com" <suresh.kumar.kurmi@intel.com>,
 "jani.nikula@intel.com" <jani.nikula@intel.com>,
 "navaremanasi@google.com" <navaremanasi@google.com>,
 "karthik.b.s@intel.com" <karthik.b.s@intel.com>,
 Singo Chang =?utf-8?B?KOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>,
 "swati2.sharma@intel.com" <swati2.sharma@intel.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 "bhanuprakash.modem@gmail.com" <bhanuprakash.modem@gmail.com>,
 Nancy Lin =?utf-8?B?KOael+aso+ieoik=?= <Nancy.Lin@mediatek.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 Paul-pl Chen =?utf-8?B?KOmZs+afj+mclik=?= <Paul-pl.Chen@mediatek.com>,
 "gildekel@google.com" <gildekel@google.com>,
 "fshao@chromium.org" <fshao@chromium.org>,
 "markyacoub@chromium.org" <markyacoub@chromium.org>
Subject: Re: [PATCH i-g-t] tests/kms_rotation_crc: Add MTK device support
Message-ID: <ahc3rjW0MFg3LBAB@intel.com>
References: <20260410100806.62906-1-jason-jh.lin@mediatek.com>
 <adjQJE8Ok5K_sNuc@intel.com>
 <7c20c056822e3bb860f48c23f3830a8ae93a67ef.camel@mediatek.com>
 <ad5De-s-yxyyTt7s@intel.com>
 <73567dcf64c48d1e02206839ce589809b1366d58.camel@mediatek.com>
 <CAMNLLoSF9xLz=2pUwcTULURdxZDn+NR1+Y-oGHBaOsre3Uz-cw@mail.gmail.com>
 <CAMNLLoSDZ5mGALP=vwuL245R+yZWf+adpCD3cFyeqv9k1bKzAw@mail.gmail.com>
 <CAMNLLoSNXHyLS7gftj4ofMFknnhP-tdKoYjG32W3j3kb4DZO2A@mail.gmail.com>
 <61f912e0d6a934afac8e2e978dae27314d27a23a@intel.com>
 <986ffe07650b69ac71c36b10bb6d5e18aa82106f.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <986ffe07650b69ac71c36b10bb6d5e18aa82106f.camel@mediatek.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Wed, May 27, 2026 at 05:04:36PM +0000, Jason-JH Lin (林睿祥) wrote:
> On Wed, 2026-05-27 at 15:52 +0300, Jani Nikula wrote:
> > On Tue, 26 May 2026, Manasi Navare <navaremanasi@google.com> wrote:
> > > Hi @Ville Syrjälä <ville.syrjala@linux.intel.com> @Karthik B S
> > > <karthik.b.s@intel.com>  @Kurmi, Suresh Kumar
> > > <suresh.kumar.kurmi@intel.com>
> > >  ,
> > > 
> > > Could we get some feedback on this upstream discussion, Ville has
> > > suggested
> > > to use the frame counter instead of adding an extra Vblank wait.
> > > However since MTK hardware does not have a support for the frame
> > > counter,
> > > this patch adds an extra vblank wait before grabbing CRC only for
> > > MTK hw.
> > > We need this change to get the test passing on MTK HW and would
> > > appreciate your feedback and Intel's help
> > > in getting this landed.
> > > 
> > > @Jason-JH Lin <jason-jh.lin@mediatek.com>  has provided the
> > > justification
> > > on why Ville's approach will not work for MTK HW.
> > 
> > Not sure why the driver couldn't do the vblank waits itself before
> > exposing the CRCs to the userspace. Maybe I'm missing something.
> > 
> > And that really makes it a non-upstream discussion, because the
> > upstream
> > Mediatek driver doesn't have a CRC implementation.
> > 
> > 
> > BR,
> > Jani.
> > 
> 
> Hi Jani,
> 
> Thank you for taking a look at this discussion.
> 
> You raise a valid point — having the driver handle things internally
> is indeed the cleaner approach. However, we would like to clarify
> why this is not straightforward for MTK hardware.
> 
> Unlike Intel, MTK hardware does not have a HW frame counter
> register, which means the driver cannot reliably associate each CRC
> entry with the correct frame number when calling
> drm_crtc_add_crc_entry(). A software frame counter would not help
> here either, because the MTK driver calls drm_crtc_add_crc_entry()
> on every Vblank, but the latency between atomic_commit() and the
> correct CRC becoming available is variable (1~2 vblanks) depending
> on asynchronous CMDQ execution timing.

Why is the CRC even being added from the vblank if the CMDQ
thing is the one that actually generates it? Sounds like you
may need to handle more stuff from the CMDQ so that both the
flips and CRCs know which order they happen in.

> 
> It is also worth noting that in MTK's DRM driver, the page flip
> completion event is fired in the CMDQ callback (i.e.
> drm_crtc_send_vblank_event()), which is only called when the HW
> configuration actually takes effect. However, this IGT test does not
> wait for the page flip event before capturing the CRC — it captures
> the CRC directly on every Vblank.

AFAICS the test either does a blocking commit or explicitly waits
for the page flip event before calling igt_pipe_crc_get_current().
If the CRC returned by that doesn't match the commit then the CRCs
clearly have bogus frame numbers.

I guess if you can't fix the CRC frame numbers to be accurate then
maybe just stop telling drm_crtc_add_crc_entry() that you even have
any frame numbers. That should make igt_pipe_crc_get_current() throw
out all captured CRCs and wait for the next one to come in. Perhaps
that is enough to get you through this.

> 
> As illustrated below, even if WaitPageFlip() were used, the correct 
> CRC for MTK would still only be available one additional Vblank after
> the page flip event is received:
> 
> atomic_commit()
>     |
>     v
>   EOF N -> CMDQ callback
>         -> HW config takes effect
>         -> drm_crtc_send_vblank_event() -> page flip event fired
> 
>   Vblank N -> drm_crtc_handle_vblank() -> vblank counter++
>            -> CRC(old) reported via drm_crtc_add_crc_entry()
>              (CRC captured before EOF N, reflects old config)
> 
>   EOF N+1 -> CRC(new) captured by HW
> 
>   Vblank N+1 -> drm_crtc_handle_vblank() -> vblank counter++
>              -> CRC(new) reported via drm_crtc_add_crc_entry() ✅
> 
> Note that if atomic_commit() is issued after EOF N has already
> passed, the CMDQ callback will not take effect until EOF N+2,
> meaning the correct CRC would not be available until VBlank N+2.
> This is why the latency to the correct CRC is variable (1~2
> vblanks). However, by waiting one extra vblank at the userspace
> level after atomic_commit(), this is effectively equivalent to
> waiting for the page flip event (WaitPageFlip()) before capturing
> the CRC, which ensures the correct CRC is always captured regardless
> of when atomic_commit() was issued.
> 
> 
> Regarding the upstream CRC implementation, we did submit a patch
> previously:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20240614024620.19011-20-shawn.sung@mediatek.com/
> 
> 
> However, it has not been rebased and resubmitted due to internal
> scheduling constraints. Additionally, the MTK DRM driver is currently
> undergoing significant expansion and refactoring to support the
> latest generation hardware, which has further delayed the
> prioritization of the CRC upstream patch.
> 
> In the short term, we are relying on the downstream CRC
> implementation for IGT validation. We do intend to upstream the
> complete CRC implementation once the ongoing driver refactoring
> stabilizes.
> 
> In the meantime, we would appreciate any guidance on the preferred
> approach for handling the CRC reporting delay within the driver, so
> we can make sure the eventual upstream submission aligns with the
> expected design.
> 
> Thanks again for your input.
> 
> Best regards,
> Jason-JH Lin

-- 
Ville Syrjälä
Intel
