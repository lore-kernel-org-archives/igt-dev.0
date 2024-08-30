Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44949CA0EF9
	for <igt-dev@archiver.kernel.org>; Fri, 30 Aug 2024 09:36:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0839210EA44;
	Fri, 30 Aug 2024 09:36:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f3fPvb4t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9500C10EA49
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Aug 2024 09:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725010597; x=1756546597;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gluOWsgDltyJQRK378sOIhhUBpusOdDA+QtfvulrwGk=;
 b=f3fPvb4tBWZDynhAdfoy9/mAV+U24K+inE/NSkUTrcZdpL/Oh/x37bp3
 R4C4DFofMIw9gXFh6sYkqT2fQvodbaRq6NNRJiRWyxj5tR1RPaeK4T+6w
 9DCIfST/i++QQK3yL7T+Ag6F5NTjOcz95m2qHUOUfiknL62Tg8C7Zsott
 F58zXOuI0STYsKbRME7s7AfRVX+VLYRo5zCznRICmX7vXmgC9wLHKJriC
 Iqtv714YLBuSkimoMT5rmJdvJgtX8m5aWYeHM+Ha3k9Q0Hoo+dBjioIB7
 t41CGkek0PSszWvocpK9YTrTcP+nHkUldyEK97SK1ytkKDwWc40Ld0wDZ A==;
X-CSE-ConnectionGUID: tfyKRqh/SA+37puQb3c2rQ==
X-CSE-MsgGUID: K6bEZ80iQQ2pPFTviB29pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="23782474"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="23782474"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 02:36:37 -0700
X-CSE-ConnectionGUID: wziVry4vSU2W52yJtwDXoA==
X-CSE-MsgGUID: PzMw1OJ4SqWSBEw3JeQyEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="64193564"
Received: from ksztyber-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.68])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 02:36:33 -0700
Date: Fri, 30 Aug 2024 11:36:30 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Christoph Manszewski <christoph.manszewski@intel.com>
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
Message-ID: <20240830093630.jax6pxsqzlnmhzqh@zkempczy-mobl2>
References: <20240829144547.105371-1-christoph.manszewski@intel.com>
 <20240829144547.105371-7-christoph.manszewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829144547.105371-7-christoph.manszewski@intel.com>
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

On Thu, Aug 29, 2024 at 04:45:36PM +0200, Christoph Manszewski wrote:
> From: Andrzej Hajda <andrzej.hajda@intel.com>
> 
> The helper will be used to access data placed in batchbuffer.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Mika Kuoppala <mika.kuoppala@intel.com>
> Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Acked-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> ---
>  lib/intel_batchbuffer.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
> index cb32206e5..b1670d23e 100644
> --- a/lib/intel_batchbuffer.h
> +++ b/lib/intel_batchbuffer.h
> @@ -353,6 +353,13 @@ static inline uint32_t intel_bb_offset(struct intel_bb *ibb)
>  	return (uint32_t) ((uint8_t *) ibb->ptr - (uint8_t *) ibb->batch);
>  }
>  
> +static inline void *intel_bb_ptr_get(struct intel_bb *ibb, uint32_t offset)
> +{
> +	igt_assert(offset <= ibb->size);

I think it should be < only, == means we're outside the buffer.

--
Zbigniew

> +
> +	return ((uint8_t *) ibb->batch + offset);
> +}
> +
>  static inline void intel_bb_ptr_set(struct intel_bb *ibb, uint32_t offset)
>  {
>  	ibb->ptr = (void *) ((uint8_t *) ibb->batch + offset);
> -- 
> 2.34.1
> 
