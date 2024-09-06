Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71BD7CE7AE0
	for <igt-dev@archiver.kernel.org>; Fri,  6 Sep 2024 07:46:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 119FC10E82E;
	Fri,  6 Sep 2024 07:46:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BZWBLuwZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC44010E82E
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Sep 2024 07:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725608818; x=1757144818;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=MSxyxIFCP4gR129IO1jQVjJklC2ymY58fzIPvwepDEQ=;
 b=BZWBLuwZdEHP1VISdkifGIpQPpM/aBnvqGuGvzVegVrDJZMa2w3BuHOi
 yfKgW0tg+h1xrl+7Pj5V6XCliI1WVu3tbi/ZzJ7uWp9SnTRvgtw4DTTy1
 ZZrPF5CKoabl101lFvEIzRMxln5J4IZGmV2fTsjQRXCwQM+Hc1Z3q3CQ+
 WIsMxOxh0faJ8IjGaVjOdeKls5b/lD8lx6B3UAHjL4aou0VkRxE//ukNx
 Br8H+5GQFi1A7USkIsSOY5B6YeidMWZX5D6SS+BFXfUzR058mA/atrDOH
 RQ+kIOHlx/pT6rSEx4MXBbTkHRYZvKhlwLEfTDmr1Wth5D4lZN1rfOWl+ Q==;
X-CSE-ConnectionGUID: WcPqki2xS1CeNjpO1QKHLQ==
X-CSE-MsgGUID: Anz/1LFdRT22wKci/+xTwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="23866082"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="23866082"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 00:46:57 -0700
X-CSE-ConnectionGUID: uFFhvjnbQBa2wnW3jZdYwg==
X-CSE-MsgGUID: X4sYhH+aQryWAdkCTOwflA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="70458111"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.252])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 00:46:54 -0700
Date: Fri, 6 Sep 2024 09:46:51 +0200
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
Subject: Re: [PATCH i-g-t v6 06/17] lib/intel_batchbuffer: Add helper to get
 pointer at specified offset
Message-ID: <20240906074651.boypgycezrukyes3@zkempczy-mobl2>
References: <20240905092812.94553-1-christoph.manszewski@intel.com>
 <20240905092812.94553-7-christoph.manszewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240905092812.94553-7-christoph.manszewski@intel.com>
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

On Thu, Sep 05, 2024 at 11:28:01AM +0200, Christoph Manszewski wrote:
> From: Andrzej Hajda <andrzej.hajda@intel.com>
> 
> The helper will be used to access data placed in batchbuffer.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> Cc: Mika Kuoppala <mika.kuoppala@intel.com>
> Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Acked-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> ---
>  lib/intel_batchbuffer.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
> index cb32206e5..9e3430e2a 100644
> --- a/lib/intel_batchbuffer.h
> +++ b/lib/intel_batchbuffer.h
> @@ -353,6 +353,13 @@ static inline uint32_t intel_bb_offset(struct intel_bb *ibb)
>  	return (uint32_t) ((uint8_t *) ibb->ptr - (uint8_t *) ibb->batch);
>  }
>  
> +static inline void *intel_bb_ptr_get(struct intel_bb *ibb, uint32_t offset)
> +{
> +	igt_assert(offset < ibb->size);
> +
> +	return ((uint8_t *) ibb->batch + offset);
> +}
> +

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  static inline void intel_bb_ptr_set(struct intel_bb *ibb, uint32_t offset)
>  {
>  	ibb->ptr = (void *) ((uint8_t *) ibb->batch + offset);
> -- 
> 2.34.1
> 
