Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6050D1D87B
	for <igt-dev@archiver.kernel.org>; Tue, 15 Oct 2024 15:49:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52C8B10E5A9;
	Tue, 15 Oct 2024 15:49:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n3lWbZZK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 211F810E5A9
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Oct 2024 15:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729007352; x=1760543352;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=L5xbjfoGnwyfJUnpyB6aTpTksj3JMKXhn1bbQEaPFFw=;
 b=n3lWbZZKqgyzdNhIzCrZCbG30Swoc4cc1o2IbQV+DDjeIhiPad/ue5bX
 2p7kBftM5PKolS6Bn+u2zeqiNd7h78Yh5PipAYyD3X5FDWnbCRMyfHTfq
 kPEcalwvy/G4JnddDaLMHS8cr3QmNdvhJYVekapyeLyfnsSwn3ZY10Tn5
 fnlfjSDXK6+eZh8Tjoe467MqGCn8ragLPvywTdefwBgBNaIIX0bz94Z0O
 HHa05ZtmMbP0V8275RYCG+GlOnPf/60XCwZMarH03N+Yufbj8vR22UILu
 eJahYB0U/B1df063JsOI3tPlpYgcKq5uHZapEbqLfzoWT6m/pDMUA1WxU Q==;
X-CSE-ConnectionGUID: oy0MT+LhSfyV8wi33D/pGQ==
X-CSE-MsgGUID: JbwVBcVHQEulA3q5Xx79Kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="31285709"
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="31285709"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 08:49:12 -0700
X-CSE-ConnectionGUID: pN29tshsRViY52DIJ0bNAQ==
X-CSE-MsgGUID: t00NHjvuRgqoKVbJZL99ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="82733676"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.69])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 08:49:09 -0700
Date: Tue, 15 Oct 2024 17:49:05 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Pravalika Gurram <pravalika.gurram@intel.com>
Cc: igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com,
 katarzyna.piecielska@intel.com
Subject: Re: [PATCH i-g-t 1/2] lib/xe/xe_query: xe_find_engine_by_class helper
Message-ID: <20241015154905.lzhxmj6laespjb32@zkempczy-mobl2>
References: <20241015141826.4186247-1-pravalika.gurram@intel.com>
 <20241015141826.4186247-2-pravalika.gurram@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241015141826.4186247-2-pravalika.gurram@intel.com>
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

On Tue, Oct 15, 2024 at 07:48:25PM +0530, Pravalika Gurram wrote:
> Added "xe_find_engine_by_class" helper function
> to query with the required engine class
> and get the engine info.
> 
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
> ---
>  lib/xe/xe_query.c | 22 ++++++++++++++++++++++
>  lib/xe/xe_query.h |  1 +
>  2 files changed, 23 insertions(+)
> 
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index 8694fa3f9..ddb9d4065 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -731,6 +731,28 @@ bool xe_has_engine_class(int fd, uint16_t engine_class)
>  	return false;
>  }
>  
> +/**
> + * xe_find_engine_by_class
> + * @fd: xe device fd
> + * @engine_class: engine class
> + *
> + * Returns engine info of xe device @fd and @engine_class otherwise NULL.
> + */
> +struct drm_xe_engine *xe_find_engine_by_class(int fd, uint16_t engine_class)
> +{
> +	struct xe_device *xe_dev;
> +
> +	xe_dev = find_in_cache(fd);
> +	igt_assert(xe_dev);
> +
> +	igt_assert(engine_class >= 0 && engine_class < xe_dev->engines->num_engines);

This assert isn't true. You're mixing engine_class and index.

--
Zbigniew

> +	for (int i = 0; i < xe_dev->engines->num_engines; i++)
> +		if (xe_dev->engines->engines[i].instance.engine_class == engine_class)
> +			return &xe_dev->engines->engines[i];
> +
> +	return NULL;
> +
> +}
>  /**
>   * xe_has_media_gt:
>   * @fd: xe device fd
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> index fd1155f7f..cabb8078c 100644
> --- a/lib/xe/xe_query.h
> +++ b/lib/xe/xe_query.h
> @@ -108,6 +108,7 @@ uint16_t xe_dev_id(int fd);
>  int xe_supports_faults(int fd);
>  const char *xe_engine_class_string(uint32_t engine_class);
>  bool xe_has_engine_class(int fd, uint16_t engine_class);
> +struct drm_xe_engine *xe_find_engine_by_class(int fd, uint16_t engine_class);
>  bool xe_has_media_gt(int fd);
>  bool xe_is_media_gt(int fd, int gt);
>  uint16_t xe_gt_get_tile_id(int fd, int gt);
> -- 
> 2.34.1
> 
