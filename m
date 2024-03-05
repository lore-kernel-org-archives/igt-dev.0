Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A33D8C54798
	for <igt-dev@archiver.kernel.org>; Tue,  5 Mar 2024 04:17:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D0E810ED8F;
	Tue,  5 Mar 2024 04:17:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GZ6+Lu9T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C730010ED8F
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Mar 2024 04:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709612225; x=1741148225;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=BcoYBHdslu3K0gHcoAENXu5hEABLhD0fr9XXevi6pf0=;
 b=GZ6+Lu9TlCCzJZ2W3Rc5utxEy1tPDf0Cp2iTTThgK2+iL6MXKHNMgnZv
 9nKewgeYfJ1hLOaUEZq5DMrd51MUoAQfS7Ah5SSmsQji1BmZw3yKq9knh
 wB9Vf1qXDHYf53+6CukfSlkMZYqZLdx9VLPo1TqefXZ05IzR9CJ5/mMT5
 WcqcKvx1XPAQl1W3lCLPn5+dc3bPY5B4gI30ig8rYbSjDUO0RNFBku5Ig
 rOzLj5foPpmAad1SvIBZsJsPiRs8YStUch7C1cFK/n7fMErJrGuVG/3/1
 7bO0A7s89pfGkRMUkrqsiFabRU8Gjb/h/4J3GHNbFEc1OSe+3TThw1HS5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="15282513"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="15282513"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 20:17:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="46767034"
Received: from unknown (HELO localhost) ([10.245.244.112])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 20:17:03 -0800
Date: Tue, 5 Mar 2024 05:16:59 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: =?utf-8?B?UGnDs3Jrb3dza2ks?= Piotr <piotr.piorkowski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/3] lib/intel_mmio: Add 64-bits ioread/iowrite
Message-ID: <20240305041659.zjqgebw4aqwbavns@zkempczy-mobl2>
References: <20240301151541.1280595-1-piotr.piorkowski@intel.com>
 <20240301151541.1280595-3-piotr.piorkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240301151541.1280595-3-piotr.piorkowski@intel.com>
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

On Fri, Mar 01, 2024 at 04:15:40PM +0100, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 
> Add functions to read/write 64-bit values from MMIO
> 
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>  lib/intel_io.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/lib/intel_io.h b/lib/intel_io.h
> index e39384ca5..e8dfd930b 100644
> --- a/lib/intel_io.h
> +++ b/lib/intel_io.h
> @@ -79,6 +79,7 @@ static inline uint##x__##_t ioread##x__(void *mmio, uint32_t reg) \
>  {\
>  	return *(volatile uint##x__##_t *)(mmio + reg);\
>  }
> +__ioread(64)
>  __ioread(32)
>  __ioread(16)
>  __ioread(8)
> @@ -89,6 +90,7 @@ static inline void iowrite##x__(void *mmio, uint32_t reg, uint##x__##_t val) \
>  {\
>  	*(volatile uint##x__##_t *)(mmio + reg) = val; \
>  }
> +__iowrite(64)
>  __iowrite(32)
>  __iowrite(16)
>  __iowrite(8)
> -- 
> 2.34.1
> 

Same as 1/3, lgtm:

Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
