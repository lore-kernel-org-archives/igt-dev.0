Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 388E0CD4F54
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 17:59:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D79D110E88A;
	Wed, 27 May 2026 17:59:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IGiVPAWd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D136D10E889
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 17:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779904746; x=1811440746;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=yHvs3TSMPExhdp1oepDTOG5Gwe/EUYlK/nsyBt+0Jc8=;
 b=IGiVPAWdqmKlrfjWtnCOs2m+jSwV1zNmiEugnf849wICRb7KWUMROv9w
 vQbGyebdleeFu8SphNoqx4xUN+WXIzMXdCtmQqnlAdI2lUMwycsYNNOPU
 cp4AalQz3lBWGesHNcW3oHB+TqBxaLWlgePC+nVss1QDBa5gcACZtjkaJ
 BCfJWsh5iO+2n7BMZYeJFg4dxkqevuK81Ttt1Ya6dpVvcrId4tLXrh3Ix
 8DkSqaskXgDOzt7c9gfgnyPFUoxpeZaL7vct9kWGzN+xsp93cvGn2GFAB
 kus5yKVeEGAU5/ZvfttE9BQxWjV3c1909uSIXAXWDQENLrb9umXYe6Q+p g==;
X-CSE-ConnectionGUID: IxvPHsn/QNOJYAqPo6cCRg==
X-CSE-MsgGUID: KJoXi4/+Sa2G0u9vtLTCTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80648771"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="80648771"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 10:59:06 -0700
X-CSE-ConnectionGUID: KmltMicqTL2g6r/PYWKeIA==
X-CSE-MsgGUID: jSkcYb/YTdWh8pU6KEWMMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="244139277"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.80])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 10:59:01 -0700
Date: Wed, 27 May 2026 20:58:58 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>
Cc: "markyacoub@google.com" <markyacoub@google.com>,
 "karthik.b.s@intel.com" <karthik.b.s@intel.com>,
 "swati2.sharma@intel.com" <swati2.sharma@intel.com>,
 "jani.nikula@intel.com" <jani.nikula@intel.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 "gildekel@google.com" <gildekel@google.com>,
 Nancy Lin =?utf-8?B?KOael+aso+ieoik=?= <Nancy.Lin@mediatek.com>,
 Singo Chang =?utf-8?B?KOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 Paul-pl Chen =?utf-8?B?KOmZs+afj+mclik=?= <Paul-pl.Chen@mediatek.com>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "fshao@chromium.org" <fshao@chromium.org>,
 "markyacoub@chromium.org" <markyacoub@chromium.org>,
 "navaremanasi@google.com" <navaremanasi@google.com>
Subject: Re: [PATCH i-g-t 2/2] tests/kms_setmode: Disable CPU deep sleep for
 accurate vblank timestamps
Message-ID: <ahcw4mAM-zaqbg6V@intel.com>
References: <20260520064651.3266598-1-jason-jh.lin@mediatek.com>
 <20260520064651.3266598-3-jason-jh.lin@mediatek.com>
 <ag28FVTooBC6Yly3@intel.com>
 <53284b68be0216eab50946da686968691fa59a56.camel@mediatek.com>
 <ag7g07pHLWgPViVh@intel.com>
 <988bcdc233564b398a87190cb40489d43ed3922c.camel@mediatek.com>
 <ahCdAq03EHvn3zu9@intel.com>
 <af89358195f2780dd882f339db7198e48543fb50.camel@mediatek.com>
 <CAC0gqY5ggHL8DM4qNHfpvx5Kc+_oZ63ogjU8k5fkaWfGeZ+SRw@mail.gmail.com>
 <fbd04831464f5b15708f88b24cdf95350f01f60f.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fbd04831464f5b15708f88b24cdf95350f01f60f.camel@mediatek.com>
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

On Wed, May 27, 2026 at 03:49:36PM +0000, Jason-JH Lin (林睿祥) wrote:
> On Mon, 2026-05-25 at 09:07 -0400, Mark Yacoub wrote:
> > 
> > 
> > On Sat, May 23, 2026 at 2:02 AM Jason-JH Lin (林睿祥)
> > <Jason-JH.Lin@mediatek.com> wrote:
> > > > 
> > > [snip]
> > > 
> > > > > Hi Ville,
> > > > > 
> > > > > Thank you for the feedback.
> > > > > 
> > > > > You're right - the patch was purely to pass IGT tests, not to
> > > > > fix a
> > > > > real problem (although we haven't encountered any issue within
> > > > > randomly ~200us jitter on our current platform).
> > > > > 
> > > > > I've investigated the real-world impact of this ~200us
> > > > > timestamp
> > > > > jitter. In our current Android SurfaceFlinger implementation,
> > > > > real-world usage is stable with CPU deep sleep enabled.
> > > > > It seems this issue only appears in IGT single-CRTC testing
> > > > > where
> > > > > CPU
> > > > > enters deep sleep during idle periods between frames.
> > > > > Therefore, we prefer not to disable CPU deep sleep system-wide
> > > > > in
> > > > > kernel due to power consumption concerns.
> > > > > 
> > > > > However, I'd like to understand how the 1-scanline standard was
> > > > > originally defined for this test. Do real-world use cases
> > > > > actually
> > > > > require this level of precision?
> > > > 
> > > > I don't have specific examples, but people cared about precision
> > > > enough to add the whole timestamp correction thingy into the
> > > > kernel.
> > > > And in i915 we also sometimes use the timestamps to cook up a
> > > > frame
> > > > counter (when the hardware lacks one) and I wouldn't want to do
> > > > that
> > > > without adjusting the timestamps based on the scanout position.
> > > > 
> > > > Anyways, since this is usually implemented via a scanline counter
> > > > (sometimes even a pixel counter) that's the kind of accuracy one
> > > > would expect to get, and so that's what one tests for to make
> > > > sure
> > > > it's working correctly.
> > > > 
> > > > > 
> > > > > Not all platforms support or implement get_scanout_position() -
> > > > > could the standard be relaxed for such platforms?
> > > > 
> > > > If you don't implement accurate timestamps then the test is
> > > > expected to fail. I see nothing wrong in that.
> > > > 
> > > > Relaxing the test doesn't make sense to me because then it can
> > > > no longer tell you whether your timestamps are accurate or not.
> > > > Although I guess you could have another similar test that
> > > > makes sure that the timestamps are at least somewhat sane,
> > > > even if not very accurate.
> > > > 
> > > 
> > > Hi Ville,
> > > 
> > > I understand your point, and I agree that implementing
> > > get_scanout_position() is the proper long-term fix.
> > > 
> > > However, I'd like to explain our reasoning for this patch.
> > > The purpose of this test is to verify the accuracy of the kernel
> > > vblank
> > > timestamp itself. We have identified that disabling CPU idle
> > > eliminates
> > > the jitter and the test passes, which confirms that our timestamp
> > > implementation is correct - the ~200us jitter is caused by CPU idle
> > > wakeup latency as an external interference, not by the timestamp
> > > mechanism itself.
> > > 
> > > Therefore, before we complete the get_scanout_position()
> > > implementation, we believe this patch still has value - it allows
> > > the
> > > test to effectively verify our timestamp accuracy by removing the
> > > external CPU idle interference, while also preventing other
> > > potential
> > > issues from affecting timestamp precision on MediaTek platforms.
> > > 
> > 
> > here is my 2c: 
> > As this test uncovered another bug (external CPU Idle interference),
> > it MUST not be removed. Otherwise, we hide a bug, even if it wasn't
> > the intended test.
> > Therefore, if you decide with Ville that there is value in your
> > workaround, it must be ANOTHER test.
> > Test#1 shows that you have an accurate timestamp without interference
> > (this shall pass for MTK)
> > another test showing that CPU idleness with throw off the accuracy of
> > the timestamp (will fail)
> > This will give you 2 results: accurate timestamps that deviates
> > sometime. It's up to you and the platform owner to decide if this is
> > an acceptable behavior. 
> > But, we shall not change a test to hide a bug.
> > 
> > -Mark
> > > 
> 
> Hi Ville and Mark,
> 
> Thank you both for the valuable feedback.
> I investigated implementing get_scanout_position() on MediaTek, and I
> found a hardware limitation that prevents us from achieving accurate
> vblank timestamps on DSI.
> Unlike Intel, which typically has an output-side scanline counter that
> tracks the real panel scanout position across the full frame (including
> blanking), our DSI provides an input-side line counter. It only eflects
> the DSI input processing position during the active region, and it
> becomes non-informative during vblank (often reading as 0), so we
> cannot determine the exact scanline position within the vblank
> interval.
> 
> A simplified diagram of the difference:
> 
> DISP -> DSI -> Panel
>      |      |
>      |      +-- Intel scanline counter (OUTPUT side)
>      |      e.g. PIPEDSL
>      |      - Counts the real panel scanout position
>      |      - Covers active + vblank (0 ~ vtotal-1)
>      |      - Still meaningful during vblank
>      |
>      +-- MediaTek DSI line counter (INPUT side)
>      e.g. DSI_INPUT_DEBUG
>      - Counts DSI input processing position
>      - Only covers active region (0 ~ vdisplay-1)
>      - During vblank there is no input data, so the
>        counter may stop/reset and return as 0
>      - Therefore it cannot indicate the exact position
>        within the vblank interval (vdisplay ~ vtotal-1)
> 
> I attempted a get_scanout_position() based approach, but due to the
> above limitation, the 1-scanline accuracy requirement cannot be met on
> DSI (I got +-140 ~ 280us jitters). As a result, this test cannot pass
> on MTK DSI unless we eliminate CPU idle wakeup latency effects.
> 
> Regarding Mark's suggestion to split into 2 tests:
> In our case, a “Test #2” that expects accurate timestamps with CPU idle
> enabled would effectively be a permanent fail (or would have to be
> skipped) on DSI due to the hardware counter limitation.
> Therefore, I believe keeping a single test with a clear comment on the
> limitation and the disabling CPU idle workaround is more practical.
> 
> Given this hardware limitation on DSI, would you consider the
> workaround justified for MTK DSI platforms? Or do you have any
> suggestions/ideas on how we could avoid or mitigate this limitation
> and still provide accurate timestamps?

If your hardware can't pass the accurate timestamp test
then just let it fail.

-- 
Ville Syrjälä
Intel
