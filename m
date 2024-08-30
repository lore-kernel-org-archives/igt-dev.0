Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC281CA0FE0
	for <igt-dev@archiver.kernel.org>; Fri, 30 Aug 2024 11:16:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 891B710E9B8;
	Fri, 30 Aug 2024 11:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kjGPkKQX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E99C10E9B8
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Aug 2024 11:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725016581; x=1756552581;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=1m1BXlthv//nZX2ows74GQdyhWtl+nkFhIygGl2sXbQ=;
 b=kjGPkKQXskmzuRws9NqDIO/k/DvYw6xD7+n+/i7caw4HYuDJfayOjU0D
 ukwEXNAFG/AGCJL2l1R5ogSdpdyuklLcepgA+SDkQS5fsRFHW3SWNmErS
 2MqPgUmEVu1ixUaKJ0bMjdSVJmeYWLIV7pA+bedWotwRNUR/PqzwMl0zu
 9Uj85/HlGq9YY/zeE6T7pbffRs5JqumdSNjdPqV2udL/LKQU+lhfOin+b
 6+2yXBOEUbzQ9rBVQzu2c6HmRnHYU9gTG7EO0P3Qbm5p8LXm4xqxJ7mWX
 Y+/XIdMlJtGkrSCG4AT8+VH29WqRyHYKE8JxNL6JenlIxlU7rgws5YuPV Q==;
X-CSE-ConnectionGUID: sGBiP+nuS62WTinzBVhFDg==
X-CSE-MsgGUID: M9iCkGKZQMShd4qLu0SAUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="23837580"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="23837580"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 04:16:21 -0700
X-CSE-ConnectionGUID: hG7Ap8u+SLeQhcf0Tgkovg==
X-CSE-MsgGUID: Y1n/XuknQYCk6NPe2iNzJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="68687530"
Received: from ksztyber-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.68])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 04:16:18 -0700
Date: Fri, 30 Aug 2024 13:16:14 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: Re: [PATCH i-g-t v5 06/17] lib/intel_batchbuffer: Add helper to get
 pointer at specified offset
Message-ID: <20240830111614.km3qy5sdgljudb3n@zkempczy-mobl2>
References: <20240829144547.105371-1-christoph.manszewski@intel.com>
 <20240829144547.105371-7-christoph.manszewski@intel.com>
 <20240830093630.jax6pxsqzlnmhzqh@zkempczy-mobl2>
 <9fa037eb-379a-4272-8621-12555e90aa6d@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9fa037eb-379a-4272-8621-12555e90aa6d@intel.com>
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

On Fri, Aug 30, 2024 at 11:44:11AM +0200, Manszewski, Christoph wrote:
> Hi Zbigniew,
> 
> On 30.08.2024 11:36, Zbigniew Kempczyński wrote:
> > On Thu, Aug 29, 2024 at 04:45:36PM +0200, Christoph Manszewski wrote:
> > > From: Andrzej Hajda <andrzej.hajda@intel.com>
> > > 
> > > The helper will be used to access data placed in batchbuffer.
> > > 
> > > Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> > > Cc: Mika Kuoppala <mika.kuoppala@intel.com>
> > > Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> > > Acked-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> > > ---
> > >   lib/intel_batchbuffer.h | 7 +++++++
> > >   1 file changed, 7 insertions(+)
> > > 
> > > diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
> > > index cb32206e5..b1670d23e 100644
> > > --- a/lib/intel_batchbuffer.h
> > > +++ b/lib/intel_batchbuffer.h
> > > @@ -353,6 +353,13 @@ static inline uint32_t intel_bb_offset(struct intel_bb *ibb)
> > >   	return (uint32_t) ((uint8_t *) ibb->ptr - (uint8_t *) ibb->batch);
> > >   }
> > > +static inline void *intel_bb_ptr_get(struct intel_bb *ibb, uint32_t offset)
> > > +{
> > > +	igt_assert(offset <= ibb->size);
> > 
> > I think it should be < only, == means we're outside the buffer.
> 
> Now that you say it - it makes sense. To be honest I just took a similar
> approach to intel_bb_ptr_set. But I will change it to '<' for
> intel_bb_ptr_get then.
> 
> Thanks,
> Christoph
> > 

I forgot. Christoph, please add your s-o-b to all patches as you're
responsible for transporting and altering them to igt ml.

--
Zbigniew

> > --
> > Zbigniew
> > 
> > > +
> > > +	return ((uint8_t *) ibb->batch + offset);
> > > +}
> > > +
> > >   static inline void intel_bb_ptr_set(struct intel_bb *ibb, uint32_t offset)
> > >   {
> > >   	ibb->ptr = (void *) ((uint8_t *) ibb->batch + offset);
> > > -- 
> > > 2.34.1
> > > 
