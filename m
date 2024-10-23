Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4830DCF5365
	for <igt-dev@archiver.kernel.org>; Wed, 23 Oct 2024 12:22:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3C7210E7C2;
	Wed, 23 Oct 2024 12:22:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MQVjRfDe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5268E10E7C2
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Oct 2024 12:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729686121; x=1761222121;
 h=date:from:to:subject:message-id:references:mime-version:
 content-transfer-encoding:in-reply-to;
 bh=GfV6o2tJcYOVZTTBXEXoqVhYj4URrhn3CVmPWCzX0+c=;
 b=MQVjRfDeSfp5b62Hw34fyTaBsPT7Do1VS7CHwDip1ct/Q4+H8PDaBl2c
 yaE2MO55tUbxY/SVqHBgDaSDGolQ3vUq3je47aLyHpjFi2yKP92w4AXGm
 wskxTncSTRKBs+KkN9UweDH7G3oiqEtw1Bu9fZpCzbgrXIApP2NZU58qd
 DRs/8DnqWdo7ed5ypgSwy8P+WqqXmjyHiGcVcWuAud10Hij7tLD8QPdyJ
 8lC7zvdmHd9rm0yvMWXYaTcUd9o6kKURo6O+AS2rX9Krb6McM0P03Rr74
 PHcfJ9FnoaDJLRRFfojQn6v0Rd8vB0M+v+9cTmPGE1pzdA+zj+ehMfBB4 A==;
X-CSE-ConnectionGUID: YM8h0C/cSoayU5yeUa3A7g==
X-CSE-MsgGUID: QJGX02vOTxKkYcH2g1zIgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="39844669"
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; d="scan'208";a="39844669"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 05:22:01 -0700
X-CSE-ConnectionGUID: xFKdaVXSRLuVRGyjXD8xow==
X-CSE-MsgGUID: FpTCumnzSKCvyWqMEyIR0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; d="scan'208";a="80255204"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 23 Oct 2024 05:21:59 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 23 Oct 2024 15:21:58 +0300
Date: Wed, 23 Oct 2024 15:21:58 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 14/14] tests/gem_draw: Test igt_draw without kms
Message-ID: <ZxjqZlItJEyvYOvi@intel.com>
References: <20241004104121.32750-15-ville.syrjala@linux.intel.com>
 <20241011104354.26924-1-ville.syrjala@linux.intel.com>
 <20241022163047.yosdbkyzr5ajltnq@kamilkon-desk.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241022163047.yosdbkyzr5ajltnq@kamilkon-desk.igk.intel.com>
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

On Tue, Oct 22, 2024 at 06:30:47PM +0200, Kamil Konieczny wrote:
> Hi Ville,
> On 2024-10-11 at 13:43:54 +0300, Ville Syrjala wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > 
> 
> This is intel specific so please use it in subject:
> 
> tests/intel/gem_draw: Test without kms
> 
> > kms_draw_crc is our only way to confirm that igt_draw
> > linear<->tiled conversion routines are correct. That may
> > not cover every case as we could be hitting display
> > specific limitations that prevent testing everything.
> > 
> > Introduce a new gem_draw test case that compares igt_draw
> > mmap/pwrite methods against GTT mmaps. This will verify that
> > the software conversion routines match the hardware (de)tiling
> > peformed via the fenced region.
> > 
> > TODO: could verify against blt/rendercopy
> >       when gtt mmaps are not available...
> > 
> > v2: Drop the "driver requirement: i915" to make it past
> >     the documentation build scripts
> > 
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  tests/intel/gem_draw.c | 233 +++++++++++++++++++++++++++++++++++++++++
> >  tests/meson.build      |   1 +
> >  2 files changed, 234 insertions(+)
> >  create mode 100644 tests/intel/gem_draw.c
> > 
> > diff --git a/tests/intel/gem_draw.c b/tests/intel/gem_draw.c
> > new file mode 100644
> > index 000000000000..86df7c33ff2d
> > --- /dev/null
> > +++ b/tests/intel/gem_draw.c
> > @@ -0,0 +1,233 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2024 Intel Corporation
> > + */
> > +
> > +/**
> > + * TEST: gem draw
> > + * Category: GEM
> > + * Description: Tests whether the igt_draw library actually works.
> > + * Functionality: tiling
> 
> Add here 'Mega feature:'

I have no idea what that is.

-- 
Ville Syrjälä
Intel
