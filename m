Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B236C3DA7F
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jul 2024 15:57:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3069C10E367;
	Wed, 31 Jul 2024 15:57:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ArJavLFi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A20510E367
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jul 2024 15:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722441470; x=1753977470;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KDYxqZVRMzXKcq2wKEWR1JFM2lNFja8MQQXKuj56/aY=;
 b=ArJavLFi92yIcCXK3gTsgoQIcypP2SRBTntRTXMrBwZUZsPYgEs57xOa
 UG5hv9TSMN9cJpLL9hJMJfIO7m6Ph8mwoQiNxnq3r9iAGuhRcXTMDVebu
 TKfKLlNX6WevlunOKBxhsSVUbdjIBCqRCtFKns3iZCZA+3HwlFHCCcqmN
 BnEaLNnLpdo/tsFPyOz8adNrkV1HCKMp8b2V+Tg2ijTYsry0Kk4hXNA3V
 O9OTukqHphbHzxvQ2YCp1VCuIH6i0McXqk3gUH5Xnonb8G5h42SVEPouD
 vlWqnoMTNVOgoKy1qbKvukw6pK/J1OVYM31vah7aM1CvSIjoPNcyWt5eq Q==;
X-CSE-ConnectionGUID: pKHSzzNKSCSYgsMppikerw==
X-CSE-MsgGUID: jpJ4ylIgSaiBa2hq6hS4Nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="24095824"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="24095824"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 08:57:12 -0700
X-CSE-ConnectionGUID: q7kowjFCRBym0dKS6sqjeA==
X-CSE-MsgGUID: /ki3fo2tTxKLK2M49nBMiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="59782627"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 08:57:09 -0700
Date: Wed, 31 Jul 2024 17:57:05 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH i-g-t 1/2] lib: Add u32 variants of igt_assert_{lt,lte}
Message-ID: <20240731155705.ulgnw2aubp2qz6rf@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Matt Roper <matthew.d.roper@intel.com>
References: <20240729220251.3353533-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240729220251.3353533-1-matthew.d.roper@intel.com>
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

Hi Matt,
On 2024-07-29 at 15:02:50 -0700, Matt Roper wrote:
> igt.cocci assumes that u32 variants of the comparison assertions exist,
> so add the two that were missing.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_core.h | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/lib/igt_core.h b/lib/igt_core.h
> index 084d94da7..82f474c5f 100644
> --- a/lib/igt_core.h
> +++ b/lib/igt_core.h
> @@ -915,6 +915,15 @@ void igt_describe_f(const char *fmt, ...);
>   */
>  #define igt_assert_lte(n1, n2) igt_assert_cmpint(n1, <=, >, n2)
>  
> +/**
> + * igt_assert_lte_u32:
> + * @n1: first integer
> + * @n2: second integer
> + *
> + * Like igt_assert_lte(), but for uint32_t.
> + */
> +#define igt_assert_lte_u32(n1, n2) igt_assert_cmpuint(n1, <=, >, n2)
> +
>  /**
>   * igt_assert_lte_u64:
>   * @n1: first integer
> @@ -954,6 +963,15 @@ void igt_describe_f(const char *fmt, ...);
>   */
>  #define igt_assert_lt(n1, n2) igt_assert_cmpint(n1, <, >=, n2)
>  
> +/**
> + * igt_assert_lt_u32:
> + * @n1: first integer
> + * @n2: second integer
> + *
> + * Like igt_assert_lt(), but for uint32_t.
> + */
> +#define igt_assert_lt_u32(n1, n2) igt_assert_cmpuint(n1, <, >=, n2)
> +
>  /**
>   * igt_assert_lt_u64:
>   * @n1: first integer
> -- 
> 2.45.2
> 
