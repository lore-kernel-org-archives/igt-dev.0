Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39CF2CD4F5E
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 10:39:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C82DC10E47A;
	Thu, 21 May 2026 10:39:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lTuKiZa+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C5F310E463
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 10:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779359963; x=1810895963;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=z3337D2b/TR7aStPin4rxhaGuLqoeV+ddtHXPzrW+ag=;
 b=lTuKiZa+IanRndMXB3DRrgvhwweuVC0o/5sqO6zDD4iJdzGqWutbzQi9
 z1U7LUaZEzExL5pziInGrMmgfOrVdeynU6mfWR+1FQESMnjymakWIi5Pk
 c/ehvgW3Gwh33sMAmkmOY/KOiPuzbYYv41rRyDyK29r/kmaK4PgN2HfDZ
 tA33VNM7cz2HwD9dFYRP2aU7y+FQW0UEA/s8xz9G2fBTXaApS2s4dUft4
 XXPJC9XFDlwDGjJOheJAVikq8wJHDSxH2QoahF/FOZX+WJqOb8E6m/6X5
 3lAi3lb+wAlW+oPqKy1h5QLotVSk2W75WWBf64G6xZ6CFKUh9phaN/5bO w==;
X-CSE-ConnectionGUID: 76C3OiCZRduPLEa8jr3b/A==
X-CSE-MsgGUID: /OD0gUVhTzuUy7ytrG/Kuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="83893194"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="83893194"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 03:39:23 -0700
X-CSE-ConnectionGUID: evLoOqibSf6i9LUcec1t/A==
X-CSE-MsgGUID: 8wBR8mpIQ62xQ4GI/mc+/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="264299210"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.86])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 03:39:19 -0700
Date: Thu, 21 May 2026 13:39:15 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>
Cc: "karthik.b.s@intel.com" <karthik.b.s@intel.com>,
 "swati2.sharma@intel.com" <swati2.sharma@intel.com>,
 "jani.nikula@intel.com" <jani.nikula@intel.com>,
 "navaremanasi@google.com" <navaremanasi@google.com>,
 Singo Chang =?utf-8?B?KOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
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
Message-ID: <ag7g07pHLWgPViVh@intel.com>
References: <20260520064651.3266598-1-jason-jh.lin@mediatek.com>
 <20260520064651.3266598-3-jason-jh.lin@mediatek.com>
 <ag28FVTooBC6Yly3@intel.com>
 <53284b68be0216eab50946da686968691fa59a56.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <53284b68be0216eab50946da686968691fa59a56.camel@mediatek.com>
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

On Thu, May 21, 2026 at 03:01:25AM +0000, Jason-JH Lin (林睿祥) wrote:
> On Wed, 2026-05-20 at 16:50 +0300, Ville Syrjälä wrote:
> > On Wed, May 20, 2026 at 02:46:26PM +0800, Jason-JH Lin wrote:
> > > Use igt_disable_cpu_deep_sleep() to prevent CPU wakeup latency that
> > > affects vblank timestamp acquisition.
> > > 
> > > This addresses vblank timing stability issues on MediaTek platforms
> > > where CPU entering idle states can cause ~200us timestamp jitter
> > > and
> > > test failures.
> > 
> > Can't you fix the kernel to generate accurate timestamps?
> > 
> 
> Hi Ville,
> 
> Thanks for the feedback.
> 
> Currently, the kernel timestamp itself is accurate. The issue is that
> even though the vblank IRQ fires accurately, the timestamp captured by
> DRM core via ktime_get() in drm_crtc_get_last_vbltimestamp() cannot
> avoid the delay(randomly ~200us) introduced by the CPU idle exit
> sequence before the IRQ handler can actually execute.
> 
> After looking into this further, I referenced how Intel handles vblank
> timestamps and noticed they use
> drm_crtc_vblank_helper_get_vblank_timestamp() together with
> get_scanout_position() to calculate accurate timestamps by compensating
> for IRQ handling delays. Please correct me if I'm wrong :)
> 
> However, this approach requires the hardware to provide scanline
> position information. On MediaTek platforms, this has not been fully
> validated yet, so disabling CPU deep idle states seems to be the most
> appropriate solution for now.

Then you should probably do that in the kernel, or not at all. I don't
think adding hacks to make tests pass makes any sense because then what
you are testing doesn't match any real world use scenario at all.
So all you are doing is sweeping the problem under the carpet during 
testing, but the problem still remains and will still be hit during
actual use.

> We will evaluate the feasibility of properly implementing
> get_scanout_position() and improving our vblank timestamp accuracy
> afterwards.
> 
> Best regards,
> Jason-JH Lin

-- 
Ville Syrjälä
Intel
