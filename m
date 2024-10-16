Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76BA7D1AD46
	for <igt-dev@archiver.kernel.org>; Wed, 16 Oct 2024 10:36:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ED1210E063;
	Wed, 16 Oct 2024 10:36:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DCAYf9sk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F77010E0ED
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Oct 2024 10:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729074967; x=1760610967;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=uTaQwKgeYJtyE+lOWjJdlyGMvC33VSPJEVKP+hglFcE=;
 b=DCAYf9skKNSOBdOvbRa4n0xdYufhGpV7w+sGMjpVOH0oqlyp212ojU2N
 /ulFV1SZVsHClQZ9eByrTqFuluRsSnMKFNcRRU3yXY/AOe+vVD2PjOj1Z
 1mNp5pVtRJQQX3Geomh0hALOYhFZEdnX76GKdJDOQfPc4A8d5F3UGBG67
 YAGyeR/911otS6kHiagp6D+bBAUKLVeRBBzGCMOv0x97GxLTZDQVe5T+X
 icboIFiuJzqLmS4gl3DNcbv1LCY6z61jLFkZk2T3bjglznrSvVm7jLj7E
 utr2AW5VgYg6V7PcCHZPAytuhhWTKtCs9VtEo05lr6pNOQdXU5MwRbEZd w==;
X-CSE-ConnectionGUID: R8LDQxtnQJekCuY5e/RtAg==
X-CSE-MsgGUID: Qonq81d6TfiY/5XYYRo9Iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="32313142"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="32313142"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 03:36:06 -0700
X-CSE-ConnectionGUID: lO+q3Ok1S5evj0JTNezvRA==
X-CSE-MsgGUID: xFLB6UyVRUmA8knmDxYIAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="78213354"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.76])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 03:36:04 -0700
Date: Wed, 16 Oct 2024 12:36:01 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Pravalika Gurram <pravalika.gurram@intel.com>
Cc: igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com,
 katarzyna.piecielska@intel.com
Subject: Re: [PATCH i-g-t 1/2] lib/xe/xe_query: xe_find_engine_by_class helper
Message-ID: <20241016103601.cmzyq6h5ven5pvbp@zkempczy-mobl2>
References: <20241016101933.4191790-1-pravalika.gurram@intel.com>
 <20241016101933.4191790-2-pravalika.gurram@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241016101933.4191790-2-pravalika.gurram@intel.com>
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

On Wed, Oct 16, 2024 at 03:49:32PM +0530, Pravalika Gurram wrote:
> Added "xe_find_engine_by_class" helper function to query with the required
> engine class and get the engine info.
> 
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
> ---
>  lib/xe/xe_query.c | 20 ++++++++++++++++++++
>  lib/xe/xe_query.h |  1 +
>  2 files changed, 21 insertions(+)
> 
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index 8694fa3f9..0c9cff066 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -731,6 +731,26 @@ bool xe_has_engine_class(int fd, uint16_t engine_class)
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
> +	for (int i = 0; i < xe_dev->engines->num_engines; i++)
> +		if (xe_dev->engines->engines[i].instance.engine_class == engine_class)
> +			return &xe_dev->engines->engines[i];
> +
> +	return NULL;
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

LGTM:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
