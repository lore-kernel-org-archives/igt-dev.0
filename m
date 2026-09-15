Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 518C0C88E73
	for <igt-dev@archiver.kernel.org>; Tue, 15 Sep 2026 08:51:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE53810FB1C;
	Tue, 15 Sep 2026 08:50:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oJZK05Kt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ED0710FB1C
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Sep 2026 08:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789462213; x=1820998213;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ad1i8MF23GitQDI6mV8lgwMnQM1knDulNEuZzy+4F3k=;
 b=oJZK05Kt4qng/Uk+CTkm9kBz6cNqoIQ2gslOWmTfj7b7zWLCpLjzMXeG
 pINkmCw5zd+wxkYI+OW19KTLhV5MCxIA233nYUoxZsYiJOam2vg290nRg
 Ws2A8PHwWCGvXzORR9jEDy5c37Rb84ltBB8aA9H+0wd5rDB2Hh8+V9MY0
 2QUhN1aFU32wN9dWFK/Agiw3h1R74J8qGwbMedqwTz8B68qBKJE3QgJhd
 FND1kl0Xh845AlMZf6zHq0YsRnKRjQt9Mhz4poMqhfgRTYESZqitz/c0U
 oi47+3NL8JtjvzFWrdqZkJWBetVZ7o0iZqGAXoj6bN6dv0zR+0PHx2ui4 Q==;
X-CSE-ConnectionGUID: npNCU7j4T06s/OfMv7iiqw==
X-CSE-MsgGUID: 35RxM6wCRwK96xin7D6gxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100143764"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="100143764"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 01:50:12 -0700
X-CSE-ConnectionGUID: ZVOVNoJiSse4rSAWPqMeKA==
X-CSE-MsgGUID: hg3n7WGLRWC+D67uQFX4Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="302785988"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 01:50:11 -0700
Date: Tue, 15 Sep 2026 10:50:08 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: Jan Maslak <jan.maslak@intel.com>, igt-dev@lists.freedesktop.org,
 andrzej.hajda@intel.com
Subject: Re: [PATCH v2 1/1] lib/rendercopy: Use the Xe2+ depth buffer packet
Message-ID: <20260915085008.6tqts6zjvutffo22@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Jan Maslak <jan.maslak@intel.com>, igt-dev@lists.freedesktop.org,
 andrzej.hajda@intel.com
References: <20260910162718.4189583-1-jan.maslak@intel.com>
 <20260910162718.4189583-2-jan.maslak@intel.com>
 <hjt2qv63b7hvhy4wmkv7xiwd7uy5mk5vlj5eor2hmwanj7k237@gyioi73vnsae>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <hjt2qv63b7hvhy4wmkv7xiwd7uy5mk5vlj5eor2hmwanj7k237@gyioi73vnsae>
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

Hi Zbigniew,
On 2026-09-10 at 19:02:17 +0200, Zbigniew Kempczyński wrote:
> On Thu, Sep 10, 2026 at 06:27:18PM +0200, Jan Maslak wrote:
> > Genxml provides a dedicated 3DSTATE_DEPTH_BUFFER definition for Xe2 and
> > newer platforms. Use GFX20_3DSTATE_DEPTH_BUFFER on those platforms,
> > keeping the existing GFX125 and GFX9 selections for older hardware.
> > 
> > Xe2+ platforms also support Tile4, but require the eight-dword GFX20
> > packet rather than the ten-dword GFX125 packet. Retain the HAS_4TILE
> > capability check only for pre-Xe2 platforms.
> > 
> > Signed-off-by: Jan Maslak <jan.maslak@intel.com>
> 
> LGTM. But wait for CI to make sure it doesn't regress anything.
> 
> Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> 

Applied, thank you all.



Regards,
Kamil

> --
> Zbigniew
> 
> > ---
> >  lib/rendercopy_gen9.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
> > index 31913badba..d3f793fcc3 100644
> > --- a/lib/rendercopy_gen9.c
> > +++ b/lib/rendercopy_gen9.c
> > @@ -1043,7 +1043,11 @@ gen9_emit_depth(struct intel_bb *ibb)
> >  
> >  	igt_genxml_emit(ibb, GFX9_3DSTATE_WM_DEPTH_STENCIL, wds) { }
> >  
> > -	if (HAS_4TILE(ibb->devid)) {
> > +	if (intel_gen(ibb->devid) >= 20) {
> > +		igt_genxml_emit(ibb, GFX20_3DSTATE_DEPTH_BUFFER, db) {
> > +			db.MOCS = mocs;
> > +		}
> > +	} else if (HAS_4TILE(ibb->devid)) {
> >  		igt_genxml_emit(ibb, GFX125_3DSTATE_DEPTH_BUFFER, db) {
> >  			db.MOCS = mocs;
> >  		}
> > -- 
> > 2.43.0
> > 
