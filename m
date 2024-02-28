Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1D3C5478C
	for <igt-dev@archiver.kernel.org>; Wed, 28 Feb 2024 21:26:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9217B10E3C4;
	Wed, 28 Feb 2024 21:26:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hp4tpphT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 465F610E3C4
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Feb 2024 21:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709155587; x=1740691587;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=vhB8Xx5BV16KCSJSmMViQ0Hid9tGopRko5B2JVL73Hk=;
 b=Hp4tpphT2qDYKpL43ZbSxyhjhEbpo6zIN2pIbgHOGT2JSfg9PtXrOzLT
 HcJuAwXi5c+NKkdNS0POAnRgLpxgZFzhqEcWlL1vi/S2bwpQ0RXwlI76N
 t17e6SdtyqKXrMTrCRh3aQwXZoPOt+wytt06yG/dA1JkjXrxKuIQbdgvZ
 C7keqFk3/L9fyiJLw1mWFSiqrjngWE/lfxDZllvmfmyQNAIe2AfzTTXMh
 ji3RJ/gXowv9p2SXVh9RQQRTqtOY5yLv6CIk5VKW6KL2BWSEQ9jxnucph
 4hHqaqaXHOeQiBtTtbcVSdUaPEDWRxNVGTaNcaxKvLfRD0d0TmFzZkhl6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="29025580"
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; d="scan'208";a="29025580"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 13:26:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; d="scan'208";a="12235056"
Received: from unknown (HELO localhost) ([10.245.96.13])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 13:26:24 -0800
Date: Wed, 28 Feb 2024 22:26:20 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 7/7] tests/xe_intel_bb: Dump do png without detiling
Message-ID: <20240228212620.4ylmlj7tlq4ydush@zkempczy-mobl2>
References: <20240228145407.370325-1-zbigniew.kempczynski@intel.com>
 <20240228145407.370325-8-zbigniew.kempczynski@intel.com>
 <514273c6-505c-41b5-82b2-1fef437d0c23@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <514273c6-505c-41b5-82b2-1fef437d0c23@intel.com>
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

On Wed, Feb 28, 2024 at 05:22:46PM +0000, Matthew Auld wrote:
> On 28/02/2024 14:54, Zbigniew Kempczyński wrote:
> > On my work on Lunarlake I often needed to inspect surface without
> > detiling. Replace dumping surface exactly how it looks in the memory.
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> 
> Not sure how to parse "Dump do png" ?

Eh, should be 'Dump to png'. Thanks for spotting this and for the
review of the series. As I see full run is still ongoing I'm going to
to wait until it will complete.

--
Zbigniew
> 
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> 
> > ---
> >   tests/intel/xe_intel_bb.c | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/tests/intel/xe_intel_bb.c b/tests/intel/xe_intel_bb.c
> > index ef12715dea..c3a4b5450e 100644
> > --- a/tests/intel/xe_intel_bb.c
> > +++ b/tests/intel/xe_intel_bb.c
> > @@ -913,9 +913,9 @@ static int render(struct buf_ops *bops, uint32_t tiling,
> >   	if (write_png) {
> >   		snprintf(name, sizeof(name) - 1,
> >   			 "render_dst_tiling_%d.png", tiling);
> > -		intel_buf_write_to_png(&src, "render_src_tiling_none.png");
> > -		intel_buf_write_to_png(&dst, name);
> > -		intel_buf_write_to_png(&final, "render_final_tiling_none.png");
> > +		intel_buf_raw_write_to_png(&src, "render_src_tiling_none.png");
> > +		intel_buf_raw_write_to_png(&dst, name);
> > +		intel_buf_raw_write_to_png(&final, "render_final_tiling_none.png");
> >   	}
> >   	/* We'll fail on src <-> final compare so just warn */
