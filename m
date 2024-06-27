Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C95C3064D
	for <igt-dev@archiver.kernel.org>; Thu, 27 Jun 2024 07:56:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEEA910E137;
	Thu, 27 Jun 2024 07:56:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b7r1Xpk9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2880210E137
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Jun 2024 07:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719475002; x=1751011002;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=E3Fzc3NW76t5eQSNlpHlnfT7HhAdGxhwpxI7LA3q35s=;
 b=b7r1Xpk94XITEyL3xmsxpymHcfW/W6Q6oUDZgvBBvGd0i7p0QjzZBveJ
 2KofOFNR/4q3ToCgNSbnrzG/lmTgLtr/pegiIvV2hi4HIRcPz7jMyfe9/
 FPNA8i7YA3ua716RIfWPJ47gip85lfD12Lq8zxy6uOVMT5Gt1sVg9E6fs
 h7ezJlBRa06zdjUHNPUhtW/DidMgDUX5OsO3PEfVAp/diu3PgNwtsnzs+
 y0qDl2MJppezKzOeEVw3iKO6Xc9OOpd/v4njeLASwtFB8WHvDZ2iUIe4N
 NcYHyiclJHhzDgHWnCPM/a/LGmZJ3uJT8n2GB/z7zOqAGG+TQl+BqiFmi Q==;
X-CSE-ConnectionGUID: Di4Bmm3wQouai5lA66scsA==
X-CSE-MsgGUID: kUw+0rr5R867HYXQDPta8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16543810"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="16543810"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 00:56:42 -0700
X-CSE-ConnectionGUID: gYJ/MVKnTgizKaUZqskWtA==
X-CSE-MsgGUID: W3bWQDTJQhehpWeeHIFIIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="48753261"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.127])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 00:56:40 -0700
Date: Thu, 27 Jun 2024 09:56:37 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: igt-dev@lists.freedesktop.org,
	Stuart Summers <stuart.summers@intel.com>
Subject: Re: [PATCH i-g-t] lib/rendercopy_gen9: Use AUX_NONE for platforms
 with unified compression
Message-ID: <20240627075637.rp64nriujmzh67zl@zkempczy-mobl2>
References: <20240625091651.131301-1-zbigniew.kempczynski@intel.com>
 <20240625181733.GW2906448@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240625181733.GW2906448@mdroper-desk1.amr.corp.intel.com>
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

On Tue, Jun 25, 2024 at 11:17:33AM -0700, Matt Roper wrote:
> On Tue, Jun 25, 2024 at 11:16:50AM +0200, Zbigniew Kempczyński wrote:
> > For non-MSAA surfaces when unified compression is configured in PAT
> > auxiliary surfaces must be set to AUX_NONE. I haven't noticed this
> > on Xe2+ before as it setting was silently ignored by hardware but
> > setting to AUX_CCS_E is incorrect and may fail on newer platforms.
> 
> Matches bspec 57023; 0x5 is no longer listed as a valid setting for this
> field from Xe2 onward.
> 
> On Xe1 platforms, does this field still apply for platforms that use
> FlatCCS rather than AuxCCS?  It's unclear to me whether the setting is
> correct for DG2 or not.

To get the compression on Xe1 (DG2) setting aux-mode to AUX_CCS_E in surface
state is mandatory.

--
Zbigniew

> 
> 
> Matt
> 
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Stuart Summers <stuart.summers@intel.com>
> > ---
> >  lib/rendercopy_gen9.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
> > index 726f1a087b..62a365f3c2 100644
> > --- a/lib/rendercopy_gen9.c
> > +++ b/lib/rendercopy_gen9.c
> > @@ -229,7 +229,10 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
> >  	if (buf->compression == I915_COMPRESSION_MEDIA)
> >  		ss->ss7.tgl.media_compression = 1;
> >  	else if (buf->compression == I915_COMPRESSION_RENDER) {
> > -		ss->ss6.aux_mode = 0x5; /* AUX_CCS_E */
> > +		if (AT_LEAST_GEN(ibb->devid, 20))
> > +			ss->ss6.aux_mode = 0x0; /* AUX_NONE, unified compression */
> > +		else
> > +			ss->ss6.aux_mode = 0x5; /* AUX_CCS_E */
> >  
> >  		if (buf->ccs[0].stride) {
> >  
> > -- 
> > 2.34.1
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
