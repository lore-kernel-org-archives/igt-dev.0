Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAED8D15D89
	for <igt-dev@archiver.kernel.org>; Mon, 21 Oct 2024 12:59:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8348710E4E4;
	Mon, 21 Oct 2024 12:59:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VFTSQZSi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72BA910E4E4
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Oct 2024 12:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729515592; x=1761051592;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+lS7wdFXVK1nwgh09T/hC5aQYtqjJ0/SG2On5ZYEatw=;
 b=VFTSQZSiJPep4bkr8lbMKiafFMfph9Ts6YfnJBp/BKsUfvHC9aEnE1fu
 RPlKaIVUGCXhYa4HErVN7tQ3OjeVTtdaVAfxTjecnro/4HBdidgytucHN
 2cJoIaefkTLsT8C301TU0hrafzQ5ZnxlYF1Ojsj7oIG8V9gTkahTcrG2w
 lFDTiJE/XmW5oY1IL/Z50E+kYU9ArgwbGoDFKlciKFU/SSjeOTLJK25Wb
 ZIEUGephljuXuZn//pgsvt3tkGHgdNJWppNPTAI/Ld7TH5AwBJibPWoDm
 SYbugYpmUa0WuIxaTUYwfzGWE3EJqd7aSNyNH0fEYlg8Dm3o8EGQlnsgU Q==;
X-CSE-ConnectionGUID: OMvznF5zSBabWjWTZokJ/g==
X-CSE-MsgGUID: DQsR5puhTXOiyKs63WYKYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="29093196"
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="29093196"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 05:59:52 -0700
X-CSE-ConnectionGUID: m5gNNLZjQxiZoPJtKnBL3g==
X-CSE-MsgGUID: YHotGfBxQgCstZyvBVahSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="84579789"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 05:59:50 -0700
Date: Mon, 21 Oct 2024 14:59:08 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Pravalika Gurram <pravalika.gurram@intel.com>,
 zbigniew.kempczynski@intel.com, sai.gowtham.ch@intel.com,
 katarzyna.piecielska@intel.com
Subject: Re: [PATCH i-g-t 1/2] lib/xe/xe_query: xe_find_engine_by_class helper
Message-ID: <20241021125908.cvcvo4svhxd2pmdy@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Pravalika Gurram <pravalika.gurram@intel.com>,
 zbigniew.kempczynski@intel.com, sai.gowtham.ch@intel.com,
 katarzyna.piecielska@intel.com
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

Hi Pravalika,
On 2024-10-16 at 15:49:32 +0530, Pravalika Gurram wrote:
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

imho here just 'if (!xe_dev) return NULL;'

Regards,
Kamil

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
