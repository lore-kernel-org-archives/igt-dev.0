Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 809BBCFD356
	for <igt-dev@archiver.kernel.org>; Mon, 24 Nov 2025 21:11:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 125BF10E260;
	Mon, 24 Nov 2025 21:11:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kkblBjv6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3846010E260
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Nov 2025 21:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764018712; x=1795554712;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=n6OIvyG8UXE3qvAcaPyYHnKXtdiQXzn6x6iJnFiHwGg=;
 b=kkblBjv6a9aNspWqiPQqj1PNvUMJdKM1qQVybs52r91fMqeHSs6zejgX
 PiyWz3zAqqECcnxlFC6BI4UGMwI8kfSgXJCIq1+agiVdr9zA5OKMsLGon
 6JjnrnbX5jHQP8Zq7TrzTbiHaHqWnR2cMuTeR7SX0Kln9n8NEY8Ppe1uP
 rNbCbFHGNh3Hik5ob5E573b9xsAOKTRhF3rm4HruL+g8asT41ZhSppxEz
 RZdr5dBwjePjLLD1MB1m6bKEOoV6ZBm0P6uV7fd7ZSn6PFXbWCEF9KWCu
 naw/5wFxW1vcidkZaPXyuruYtzHYNWjfVQGCD/Ayreiy2iJLBcOPg3myO Q==;
X-CSE-ConnectionGUID: 4yUnKyLXQH2STNnuzZKvCw==
X-CSE-MsgGUID: nzgvRNkvSmyq+z7DsAJaKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="83420970"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="83420970"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 13:11:52 -0800
X-CSE-ConnectionGUID: XE7gkEWNQ8CmU4Oe+234LA==
X-CSE-MsgGUID: lA2i5ZZ1TYe8R/qBwedUyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="192684392"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.124.222.176])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 13:11:45 -0800
Date: Mon, 24 Nov 2025 23:11:42 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/8] igt: Name drmModeCrtc variables 'drm_crtc'
Message-ID: <aSTKDpX5hLC2bk5B@intel.com>
References: <20251121190633.24522-1-ville.syrjala@linux.intel.com>
 <20251121190633.24522-2-ville.syrjala@linux.intel.com>
 <2a9ad8950036a45431774a6ab66b11d65a8a041f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2a9ad8950036a45431774a6ab66b11d65a8a041f@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Mon, Nov 24, 2025 at 11:37:23AM +0200, Jani Nikula wrote:
> On Fri, 21 Nov 2025, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > The current situation with pipes vs. crtcs is a giant mess.
> > In order to untangle things properly I think we need to
> > move away from the pipe stuff into a more pure crtc world.
> >
> > I suspect the best way to get there is by renaming igt_pipe_t
> > into igt_crtc_t and making everyone use it instead of the raw
> > index/pipe numbers. And presumable we'll want to call the
> > igt_crtc_t variables 'crtc', so let's clear out the namespace
> > for that by using 'drm_crtc' as the variable name for the
> > lower level drmModeCrtc stuff.
> 
> For clarity, I suppose also s/crtc_offset/crtc_index/g for the member in
> igt_pipe_t (igt_crtc_t) would be in order as follow-up.

Yeah, IIRC I have that in one of my wip cocci scripts as well.

-- 
Ville Syrjälä
Intel
