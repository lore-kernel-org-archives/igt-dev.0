Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 088C2C54798
	for <igt-dev@archiver.kernel.org>; Tue,  5 Mar 2024 04:20:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B41E210E198;
	Tue,  5 Mar 2024 04:20:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NEvfrha3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A96D10E198
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Mar 2024 04:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709612414; x=1741148414;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=viFZtfh9rTLWkCg0W4dWzgR7Jy04iDE7/mpd4sYCkwE=;
 b=NEvfrha3G+YbDNcMgaJKOz7FM7UdQ4991NqmXfrwg/n9LpbJSI1KraEg
 Iwujpa2QpiY5P4fyBAU1YNq2IoIwWAG9kZZcEazyrpWpT+2f8M91eUhr8
 uGDoSJw9oyD76sLV6RNjuiHS3nZOrqig0mIuTvd9AuYnYOAJCJjcvxIzO
 nI0xEHaTEJGwvuZmEDZYe/7y7eepChhu4nuyzufI7Gaou+D1x+OldQGHA
 XIkvViLREFFcfRJNYyp/SEYkG8HZwFiUp2flUg76b0Jngyh8n5EZAna2j
 fW44zuuQFxQ3MSxuuq04Mt5mphy10zR9jxTRFrKr2nqM+TdT0NFLjkkQc Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="7089440"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="7089440"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 20:20:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="32396642"
Received: from unknown (HELO localhost) ([10.245.244.112])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 20:20:12 -0800
Date: Tue, 5 Mar 2024 05:20:09 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: =?utf-8?B?UGnDs3Jrb3dza2ks?= Piotr <piotr.piorkowski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 3/3] lib/xe/xe_query: Add helper to check if given
 gt id point to media gt
Message-ID: <20240305042009.cugxfdaephgenfya@zkempczy-mobl2>
References: <20240301151541.1280595-1-piotr.piorkowski@intel.com>
 <20240301151541.1280595-4-piotr.piorkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240301151541.1280595-4-piotr.piorkowski@intel.com>
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

On Fri, Mar 01, 2024 at 04:15:41PM +0100, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 
> Let's add a helper that can easily verify that the gt id points to
> the media gt.
> 
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>  lib/xe/xe_query.c | 21 +++++++++++++++++++++
>  lib/xe/xe_query.h |  1 +
>  2 files changed, 22 insertions(+)
> 
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index 729fba6b1..53a2b4386 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -710,6 +710,27 @@ bool xe_has_media_gt(int fd)
>  	return false;
>  }
>  
> +/**
> + * xe_is_media_gt:
> + * @fd: xe device fd
> + * @gt: gt id
> + *
> + * Returns true if @gt for device @fd is media GT, otherwise false.
> + */
> +bool xe_is_media_gt(int fd, int gt)
> +{
> +	struct xe_device *xe_dev;
> +
> +	xe_dev = find_in_cache(fd);
> +	igt_assert(xe_dev);
> +	igt_assert(gt < xe_number_gt(fd));
> +
> +	if (xe_dev->gt_list->gt_list[gt].type == DRM_XE_QUERY_GT_TYPE_MEDIA)
> +		return true;
> +
> +	return false;
> +}
> +
>  igt_constructor
>  {
>  	xe_device_cache_init();
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> index 2460384c9..82af2706d 100644
> --- a/lib/xe/xe_query.h
> +++ b/lib/xe/xe_query.h
> @@ -98,6 +98,7 @@ bool xe_supports_faults(int fd);
>  const char *xe_engine_class_string(uint32_t engine_class);
>  bool xe_has_engine_class(int fd, uint16_t engine_class);
>  bool xe_has_media_gt(int fd);
> +bool xe_is_media_gt(int fd, int gt);
>  
>  struct xe_device *xe_device_get(int fd);
>  void xe_device_put(int fd);
> -- 
> 2.34.1
>

Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

