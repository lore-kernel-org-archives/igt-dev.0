Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D179ECD5BB3
	for <igt-dev@archiver.kernel.org>; Fri, 22 May 2026 18:14:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88ED810E0BD;
	Fri, 22 May 2026 18:14:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e1IKneBw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EF5C10E0BD
 for <igt-dev@lists.freedesktop.org>; Fri, 22 May 2026 18:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779473674; x=1811009674;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ItxdnAYfV45wN/qdhBOuldlsOt8m7lRus72xAsUijOw=;
 b=e1IKneBwb7YEr1Er4EOfHo2sN2qPh2Fr6dh5sfuZq/gpVX37czvDdpYH
 RVdG0SYYAJQ5p3f4haNI9JPiePtPFLqRg2jJWfPk+2l3KC2h5nHqtd8PC
 e/e1rzCt6j3S1WlG3UoP6m1EqlVMfk3o1eWg8LmL2rOjlPnqoo4MhgkkO
 l5kr6WXtNj6f8uMLZqfcpgOlT+xrWRNp+OnKWKmoIe9xpVYV9Sz4IbH1T
 xdfkLUoRpbR1tT2A3mKHNXTTXn9lgJTAia7T6z/hl88bLuwyHgpMb4Cxl
 QCk+Fq9TFAd3ulfXX5I/QjLhe5K8C3Kv56ZrI6bcGV0hQrXj9qlcCGKsg A==;
X-CSE-ConnectionGUID: DEnrNKvuSkSW0n5JTwEbSA==
X-CSE-MsgGUID: /MPF9wqxRV6wFhUAgBrgYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="67934142"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="67934142"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 11:14:34 -0700
X-CSE-ConnectionGUID: fQOIUB4EQoGarIaGSuj7Rw==
X-CSE-MsgGUID: KpBNEtyaRqupBJeERt05dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="240147479"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.187])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 11:14:30 -0700
Date: Fri, 22 May 2026 21:14:26 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>
Cc: "navaremanasi@google.com" <navaremanasi@google.com>,
 Singo Chang =?utf-8?B?KOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "jani.nikula@intel.com" <jani.nikula@intel.com>,
 "karthik.b.s@intel.com" <karthik.b.s@intel.com>,
 "swati2.sharma@intel.com" <swati2.sharma@intel.com>,
 "gildekel@google.com" <gildekel@google.com>,
 Nancy Lin =?utf-8?B?KOael+aso+ieoik=?= <Nancy.Lin@mediatek.com>,
 Paul-pl Chen =?utf-8?B?KOmZs+afj+mclik=?= <Paul-pl.Chen@mediatek.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 "fshao@chromium.org" <fshao@chromium.org>,
 "markyacoub@chromium.org" <markyacoub@chromium.org>
Subject: Re: [PATCH i-g-t 2/2] tests/kms_setmode: Disable CPU deep sleep for
 accurate vblank timestamps
Message-ID: <ahCdAq03EHvn3zu9@intel.com>
References: <20260520064651.3266598-1-jason-jh.lin@mediatek.com>
 <20260520064651.3266598-3-jason-jh.lin@mediatek.com>
 <ag28FVTooBC6Yly3@intel.com>
 <53284b68be0216eab50946da686968691fa59a56.camel@mediatek.com>
 <ag7g07pHLWgPViVh@intel.com>
 <988bcdc233564b398a87190cb40489d43ed3922c.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <988bcdc233564b398a87190cb40489d43ed3922c.camel@mediatek.com>
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

On Fri, May 22, 2026 at 02:59:00AM +0000, Jason-JH Lin (林睿祥) wrote:
> On Thu, 2026-05-21 at 13:39 +0300, Ville Syrjälä wrote:
> > On Thu, May 21, 2026 at 03:01:25AM +0000, Jason-JH Lin (林睿祥) wrote:
> > > On Wed, 2026-05-20 at 16:50 +0300, Ville Syrjälä wrote:
> > > > On Wed, May 20, 2026 at 02:46:26PM +0800, Jason-JH Lin wrote:
> > > > > Use igt_disable_cpu_deep_sleep() to prevent CPU wakeup latency
> > > > > that
> > > > > affects vblank timestamp acquisition.
> > > > > 
> > > > > This addresses vblank timing stability issues on MediaTek
> > > > > platforms
> > > > > where CPU entering idle states can cause ~200us timestamp
> > > > > jitter
> > > > > and
> > > > > test failures.
> > > > 
> > > > Can't you fix the kernel to generate accurate timestamps?
> > > > 
> > > 
> > > Hi Ville,
> > > 
> > > Thanks for the feedback.
> > > 
> > > Currently, the kernel timestamp itself is accurate. The issue is
> > > that
> > > even though the vblank IRQ fires accurately, the timestamp captured
> > > by
> > > DRM core via ktime_get() in drm_crtc_get_last_vbltimestamp() cannot
> > > avoid the delay(randomly ~200us) introduced by the CPU idle exit
> > > sequence before the IRQ handler can actually execute.
> > > 
> > > After looking into this further, I referenced how Intel handles
> > > vblank
> > > timestamps and noticed they use
> > > drm_crtc_vblank_helper_get_vblank_timestamp() together with
> > > get_scanout_position() to calculate accurate timestamps by
> > > compensating
> > > for IRQ handling delays. Please correct me if I'm wrong :)
> > > 
> > > However, this approach requires the hardware to provide scanline
> > > position information. On MediaTek platforms, this has not been
> > > fully
> > > validated yet, so disabling CPU deep idle states seems to be the
> > > most
> > > appropriate solution for now.
> > 
> > Then you should probably do that in the kernel, or not at all. I
> > don't
> > think adding hacks to make tests pass makes any sense because then
> > what
> > you are testing doesn't match any real world use scenario at all.
> > So all you are doing is sweeping the problem under the carpet during 
> > testing, but the problem still remains and will still be hit during
> > actual use.
> > 
> 
> Hi Ville,
> 
> Thank you for the feedback.
> 
> You're right - the patch was purely to pass IGT tests, not to fix a
> real problem (although we haven't encountered any issue within
> randomly ~200us jitter on our current platform).
> 
> I've investigated the real-world impact of this ~200us timestamp
> jitter. In our current Android SurfaceFlinger implementation,
> real-world usage is stable with CPU deep sleep enabled.
> It seems this issue only appears in IGT single-CRTC testing where CPU
> enters deep sleep during idle periods between frames.
> Therefore, we prefer not to disable CPU deep sleep system-wide in
> kernel due to power consumption concerns.
> 
> However, I'd like to understand how the 1-scanline standard was
> originally defined for this test. Do real-world use cases actually
> require this level of precision?

I don't have specific examples, but people cared about precision
enough to add the whole timestamp correction thingy into the kernel.
And in i915 we also sometimes use the timestamps to cook up a frame
counter (when the hardware lacks one) and I wouldn't want to do that
without adjusting the timestamps based on the scanout position.

Anyways, since this is usually implemented via a scanline counter
(sometimes even a pixel counter) that's the kind of accuracy one
would expect to get, and so that's what one tests for to make sure
it's working correctly.

> 
> Not all platforms support or implement get_scanout_position() -
> could the standard be relaxed for such platforms?

If you don't implement accurate timestamps then the test is
expected to fail. I see nothing wrong in that.

Relaxing the test doesn't make sense to me because then it can
no longer tell you whether your timestamps are accurate or not.
Although I guess you could have another similar test that
makes sure that the timestamps are at least somewhat sane,
even if not very accurate.

-- 
Ville Syrjälä
Intel
