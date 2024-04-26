Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BFA0C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 26 Apr 2024 08:21:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A1CF10ED83;
	Fri, 26 Apr 2024 08:21:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iN2XNRly";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC2F710ED83
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Apr 2024 08:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714119687; x=1745655687;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=zDLt6dFjigOnVcKX8rjhQElxPkAa4tkaNr/m6wEWkAw=;
 b=iN2XNRly0J4EDqzrIFQeHGZ/60lO95PUk2XtUpFcUtGr0+GZ5BYqOtEm
 15hisCmm1eWEQ68CRoxIcmGDAs8Xv31TrCtzFfNIJXBSpb4lMeeDlFo0m
 tmSVH1K4sGToKhfoyM5onmL87F362MBxGwnf1rw5pnqX71tia/Rv6W+v+
 r94T/HAGvbkIUONoFPamkVOhmf9jwaJGSuCls4PACQn9iIblQYtvsOgde
 8fiJDwhpxCa3QL2LV15+oPWNs0VNlkaw2LhKWJ0qdpwVkMK8CvNjVyVfO
 2VNjpHqcGJ7Dk3HpVUKxSPSskvUgK81dN+cgGWB6vYHPsiMlMf/w9b2eu w==;
X-CSE-ConnectionGUID: 4DpsEZGRQuGJMFz4qg5LFQ==
X-CSE-MsgGUID: dGYRhouLQvuKyN4h6j1TBw==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="20460963"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="20460963"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 01:21:26 -0700
X-CSE-ConnectionGUID: bvXvIbLDTcuLvYqmQvTtbw==
X-CSE-MsgGUID: hO/SEGJ2RqizEfcx5ru3rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="62824299"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.61])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 01:21:24 -0700
Date: Fri, 26 Apr 2024 10:21:21 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 6/7] lib/rendercopy_gen9: Allow to use all tilings
 on flatccs platforms
Message-ID: <20240426082121.yn4breer4tj7rwmz@zkempczy-mobl2>
References: <20240425104721.52376-1-zbigniew.kempczynski@intel.com>
 <20240425104721.52376-7-zbigniew.kempczynski@intel.com>
 <218a0925-015d-46ba-b7f3-e0545daf7f88@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <218a0925-015d-46ba-b7f3-e0545daf7f88@gmail.com>
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

On Thu, Apr 25, 2024 at 03:26:12PM +0300, Juha-Pekka Heikkila wrote:
> On 25.4.2024 13.47, Zbigniew Kempczyński wrote:
> > Instead of limiting compression to Tile4 lets enable it for any
> > tiling when platform has flatccs area.
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > ---
> >   lib/rendercopy_gen9.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
> > index 7c7563d50c..67bb7cfacd 100644
> > --- a/lib/rendercopy_gen9.c
> > +++ b/lib/rendercopy_gen9.c
> > @@ -175,6 +175,7 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
> >   		case 64: ss->ss0.surface_format = SURFACEFORMAT_R16G16B16A16_FLOAT; break;
> >   		default: igt_assert(0);
> >   	}
> > +
> >   	ss->ss0.vertical_alignment = 1; /* align 4 */
> >   	ss->ss0.horizontal_alignment = 1; /* align 4 or HALIGN_32 on display ver >= 13*/
> > @@ -232,7 +233,6 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
> >   		ss->ss6.aux_mode = 0x5; /* AUX_CCS_E */
> >   		if (buf->ccs[0].stride) {
> > -
> >   			ss->ss6.aux_pitch = (buf->ccs[0].stride / 128) - 1;
> >   			address = intel_bb_offset_reloc_with_delta(ibb, buf->handle,
> > @@ -268,7 +268,7 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
> >   			ss->ss13.clear_address_hi = (address + buf->cc.offset) >> 32;
> >   		}
> > -		if (HAS_4TILE(ibb->devid)) {
> > +		if (HAS_FLATCCS(ibb->devid)) {
> 
> This I suspect will break mtl. Those few above blank line changes probably
> also here as not needed 'extra'.

You're right. I've checked how compressed surface looks on mtl and it is
compressed but looks different than tile4 compressed surface. Thanks for
spotting this.

--
Zbigniew

> 
> /Juha-Pekka
> 
> >   			ss->ss7.dg2.memory_compression_type = 0;
> >   			ss->ss7.dg2.memory_compression_enable = 0;
> >   			ss->ss7.dg2.disable_support_for_multi_gpu_partial_writes = 1;
> 
