Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 484A4C04FFE
	for <igt-dev@archiver.kernel.org>; Wed,  8 May 2024 05:59:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED32D112812;
	Wed,  8 May 2024 05:59:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RvsKUxP/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98ECC1133A7
 for <igt-dev@lists.freedesktop.org>; Wed,  8 May 2024 05:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715147962; x=1746683962;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=dWIBDW4Je1zUL0zwwfl0Aox6of6hDUu9amw0JcIGino=;
 b=RvsKUxP/7zHzZZkS7RW7QW5WZDBBrSoa3JOeAw23OtvLvbfcaHE1ph3O
 8tWCjmtRy5wM5nUfo96kXiVERzS2YLEkEGI2Zv8npisRdxiSLpkKbW1oD
 4znpnTPgqh9e4IfHsvKvKbwLYzFc1oc0J/Q4I1NZk2/YxRtgsJzP5XCpp
 Y1g+5mg0CYpd8g5fW3cvwYK1eXRsWlSUvQH+MxZYl88HE7IuxcIPfdj26
 lKtHPsaJKJYKlkPgdfTY99G8b0cqpm8U8ubz5Ptvpu/ocYhXeAR0DT19y
 zd2wPsJMKE2AvnJAr5Vpd39+dsEHM9LVHVlOdyWMyGnid0TmXTIL4p7P3 g==;
X-CSE-ConnectionGUID: 7Q7q1urdRe2F51fXOo0NSw==
X-CSE-MsgGUID: MwbMp/QCT++JB8o2w3l+Xw==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="36364032"
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; d="scan'208";a="36364032"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 22:59:21 -0700
X-CSE-ConnectionGUID: BIFjk5NxSwuQz73CM07+IA==
X-CSE-MsgGUID: +pUqmNVCRr6W2yQP1s4GgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; d="scan'208";a="28856934"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.60])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 22:59:20 -0700
Date: Wed, 8 May 2024 07:59:16 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org,
 Karolina Stolarek <karolina.stolarek@intel.com>
Subject: Re: [PATCH i-g-t v3 06/11] lib/rendercopy_gen9: Allow to use all
 tilings on flatccs platforms
Message-ID: <20240508055916.jcf7fvq23xej52hh@zkempczy-mobl2>
References: <20240507075836.259581-1-zbigniew.kempczynski@intel.com>
 <20240507075836.259581-7-zbigniew.kempczynski@intel.com>
 <4996210e-3377-4dc9-8806-e8bec462028f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4996210e-3377-4dc9-8806-e8bec462028f@gmail.com>
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

On Tue, May 07, 2024 at 03:59:27PM +0300, Juha-Pekka Heikkila wrote:
> On 7.5.2024 10.58, Zbigniew Kempczyński wrote:
> > Instead of limiting compression to Tile4 lets enable it for any
> > tiling when platform has flatccs area. For integrated leave Tile4
> > condition to properly configure compression on those platforms.
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Reviewed-by: Karolina Stolarek <karolina.stolarek@intel.com>
> > ---
> >   lib/rendercopy_gen9.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
> > index 7c7563d50c..c73f815efc 100644
> > --- a/lib/rendercopy_gen9.c
> > +++ b/lib/rendercopy_gen9.c
> > @@ -268,7 +268,7 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
> >   			ss->ss13.clear_address_hi = (address + buf->cc.offset) >> 32;
> >   		}
> > -		if (HAS_4TILE(ibb->devid)) {
> > +		if (HAS_4TILE(ibb->devid) || HAS_FLATCCS(ibb->devid)) {
> 
> Is this change needed? What that HAS_4TILE checks here is if there is need
> to use members of below structure which are post dg2, hence named these
> members dg2. Currently all platforms to my knowledge that need to use these
> dg2 members are with tile4 but not all of them are having flatccs.

You're right, I didn't realize above condition also extends to Tile64.

Anyway I've noticed after checking documentation for xe2 r8g8b8a8
compression type is not 0x8 but 0x2. And looking at png on compressed
surface setting there to 0x2 gives better compression ratio.

Thanks for the review. I'm going to alter this patch and resend it.

--
Zbigniew

> 
> >   			ss->ss7.dg2.memory_compression_type = 0;
> >   			ss->ss7.dg2.memory_compression_enable = 0;
> >   			ss->ss7.dg2.disable_support_for_multi_gpu_partial_writes = 1;
> 
