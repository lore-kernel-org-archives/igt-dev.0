Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D6CDCA0EFF
	for <igt-dev@archiver.kernel.org>; Fri, 30 Aug 2024 10:58:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2371510EA75;
	Fri, 30 Aug 2024 10:58:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e5eudvDc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBB3F10EA75
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Aug 2024 10:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725015479; x=1756551479;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=No6CfFK1Vv3wrFfARvFR45YQ1csBm4+CD2PaeVrr28s=;
 b=e5eudvDc4wzFd6U8BQlRUprHdTS/wEX7gKbZlYrMiaIhmkDYIz8ZIaAl
 /KmKeGojw3AbvmMyPVIs5LQBXtHlKlIi6f7+wbA94UZIgdr9ZT9hAlfyQ
 ZoJIcxZc+S4/Gw8ClwiI6Ytc6HDNykj/5NPGK/WO0pJZ8knOk04E5ZZi0
 0/XFVs7dKzl2HOzGTrTv/mN1ckLugZ+mylpsZo91yf2tSDtUreplergsm
 lpkIEljyEylvKfqM5/ulUhiMgIMKXCHy1R6DaJK5bx+iYvvHnzMl/k6Hb
 O4vchS8GWGr+pp6D8JXQruFjwWNFkBcGlxB7N/G2bOD7IVF4ToXYzF+1/ g==;
X-CSE-ConnectionGUID: MFC68xw+QCGwPx1Fs9+Wew==
X-CSE-MsgGUID: mFqINmKrR+K6O8pHjn3cpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="23779423"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="23779423"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 03:57:59 -0700
X-CSE-ConnectionGUID: doqXudN5TZG64fUJ7bpfFA==
X-CSE-MsgGUID: KsKSdEmqRE2mzIszzzHYLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="68705997"
Received: from ksztyber-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.68])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 03:57:54 -0700
Date: Fri, 30 Aug 2024 12:57:51 +0200
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
Message-ID: <20240830105751.hxkfypxyuarxma3h@zkempczy-mobl2>
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

It seems that intel_bb_ptr_set() is also wrong, it should be < too.

Regarding 'get' - nothing will protect us from using returned pointer
out of bounds leading to memory corruption. But at least we may try
to catch some cases early.

Feel free to fix 'set' as well.

--
Zbigniew

> 
> Thanks,
> Christoph
> > 
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
