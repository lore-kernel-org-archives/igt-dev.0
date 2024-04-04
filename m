Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92895CD1299
	for <igt-dev@archiver.kernel.org>; Thu,  4 Apr 2024 13:44:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 062B110FA2A;
	Thu,  4 Apr 2024 13:44:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HYSRtRsV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4763910F318
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Apr 2024 13:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712238281; x=1743774281;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=GgOazif9E0h9c6HEQGcbLIqcbuWW79k+3LPU8mPehVY=;
 b=HYSRtRsVXF+qheMTRgjN4EkQ705dc/wfKsyf0UceLSSAMnN3/Qtzl134
 Tah87ARWnXEjl1AD+aEs0znQJc5Cr5qB/3Rp8mGfxz5GMtvG6TgC2b1Bd
 CaqOQigFEutsT9iJjBSRp5s+QZI/ENZ/A4VnJ3YA14mH3L/LVwE6uDgED
 4P1Dcd/sXvg8MThcrYbWBr1mo3Pl4ax1WjOeRIexwIQyDhRWVviMzQwEQ
 V7k4hYEq2lFbDWYRqj7quOoiPl+hLmQ0qfo+rC7aZ/R8RKY6CUQ0t7Bo7
 UrFgmDICICxoGN0a0ahNdvkEAwc//MRMnZtC0jJKpjntgzCnEdUOpnh4+ w==;
X-CSE-ConnectionGUID: tRJqO7YNS4yeGRzzl8xk3A==
X-CSE-MsgGUID: jbWGiyuBTXeDio4EWS64Pw==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="11337749"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="11337749"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 06:05:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="827790427"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="827790427"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 04 Apr 2024 06:05:32 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 04 Apr 2024 16:05:32 +0300
Date: Thu, 4 Apr 2024 16:05:32 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: igt-dev@lists.freedesktop.org, Simon Ser <contact@emersion.fr>,
 Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@redhat.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Sameer Lattannavar <sameer.lattannavar@intel.com>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH i-g-t 4/5] tests/kms_cursor_crc: Test the SIZE_HINTS
 property
Message-ID: <Zg6lnKuoVrR5OjK8@intel.com>
References: <20240315191505.27620-1-ville.syrjala@linux.intel.com>
 <20240315191505.27620-5-ville.syrjala@linux.intel.com>
 <20240404115105.0d2a9694.pekka.paalanen@collabora.com>
 <Zg6HQgfK4JZtH2tB@intel.com>
 <20240404155250.7fb245d2.pekka.paalanen@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240404155250.7fb245d2.pekka.paalanen@collabora.com>
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

On Thu, Apr 04, 2024 at 03:52:50PM +0300, Pekka Paalanen wrote:
> On Thu, 4 Apr 2024 13:56:02 +0300
> Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> 
> > On Thu, Apr 04, 2024 at 11:51:05AM +0300, Pekka Paalanen wrote:
> > > On Fri, 15 Mar 2024 21:15:04 +0200
> > > Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> > >   
> > > > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > > 
> > > > Make sure the driver accepts all the sizes declared in the
> > > > plane's SIZE_HINTS property.
> > > > 
> > > > TODO: Actually test that each reported size works fully?  
> > > 
> > > What does this mean? What does cursor_size_supported() do?  
> > 
> > It does a TEST_ONLY commit using data->fb and the specified size.
> > So just confirms that the kernel accepts it, not that it actually
> > looks correct on screen.
> 
> Good, that's better than my first impression.
> 
> > > I don't know that, so it looks like you just create an FB and destroy
> > > it, never putting it on the plane where the SIZE_HINTS were found.
> > >   
> > > >       Would need a bunch of restructuring of the test,
> > > >       and for the moment i915 is the only driver that
> > > >       supports SIZE_HINTS and it's already >100% covered
> > > >       by the existing tests. So I'll leave this for the
> > > >       next guy whose driver has different needs...  
> > > 
> > > How would they know to fix this test? They just see the test pass and
> > > are happy, right?  
> > 
> > I would expect them to actually care about testing their driver
> > properly. But perhaps my expectations are a bit high.
> 
> Yeah, a screenshot or CRC test would be best.

Yep. We have CRC tests, but the impelementation would need to be
completely flipped on its head to iterate the sizes as the inner
loop rather than as the outer loop. Not impossible, just a bunch
of work (and wouldn't extend the coverage for i915 at all).

-- 
Ville Syrjälä
Intel
