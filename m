Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D57D0C8303F
	for <igt-dev@archiver.kernel.org>; Wed,  2 Jul 2025 11:32:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BF3E10E6F0;
	Wed,  2 Jul 2025 11:32:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ESn9+Zch";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A28D10E6F0
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jul 2025 11:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751455925; x=1782991925;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ITE2sP9yuI5K+Av4NPIBocWXYUgSDFGDO2b8haYk6dk=;
 b=ESn9+ZchdhipnSWCTYYOQJy3de72qX8g+NIQA3+PLMtrqEHfvbNgXv+1
 mZhaDoB99lugwYs5aBgmkl3wdLtl7Iq9pbTJcHb08TUOpAdoJe+b+7MDG
 7JKjeUz81A2vy/O30JgxqYYVgjfco/Yf8FBVfTJd9+A33K0SsCHuoT9Gj
 8THX1nMufzbQOg2RZq5LTXBxvt633PWxwy3kikOyR98HNONuLkYX27jp0
 /i/YwPCcF8d61G7ZJbVLUFJCHu3Bnxq2xKQny/592Me6uQSClY/cdLCrl
 AtTFBItUTCwGuR9GZkfISf6ghFq7lQ0tIv0hPaT1RSpefYbZNh5yagOyq Q==;
X-CSE-ConnectionGUID: RtS1NDfETAGrUH7e7HBvqg==
X-CSE-MsgGUID: zdhEsrllQrW7HPjzLRTwjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="65094098"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="65094098"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 04:32:05 -0700
X-CSE-ConnectionGUID: OdXVcdoFQQWJEs87unyG8w==
X-CSE-MsgGUID: 9wZJVZOYRw2TG4IipezKkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="158088154"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.145])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 04:32:04 -0700
Date: Wed, 2 Jul 2025 13:32:00 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 4/7] lib/xe: Ensure GT loops iterate over all GTs
 properly
Message-ID: <ygkncpazkc5prbhae44ychk4zt6ud67df6jonxwxpzb6lbgwzz@mg7pfjibeama>
References: <20250630163529.2096664-9-matthew.d.roper@intel.com>
 <20250630163529.2096664-13-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250630163529.2096664-13-matthew.d.roper@intel.com>
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

On Mon, Jun 30, 2025 at 09:35:34AM -0700, Matt Roper wrote:
> There's no guarantee that GT IDs will be consecutive on future
> platforms.  Ensure that the GT loops visit each GT in the GT ID mask,
> rather than [0, num_gt - 1].
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  lib/xe/xe_query.h | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> index 9a2ceb4c8..4aeff639a 100644
> --- a/lib/xe/xe_query.h
> +++ b/lib/xe/xe_query.h
> @@ -77,8 +77,9 @@ struct xe_device {
>  	for (__class = 0; __class < DRM_XE_ENGINE_CLASS_COMPUTE + 1; \
>  	     ++__class)
>  #define xe_for_each_gt(__fd, __gt) \
> -	for (__gt = 0; __gt < xe_number_gt(__fd); ++__gt)
> -
> +	for (uint64_t igt_unique(__mask) = xe_device_get(__fd)->gt_mask; \
> +	     __gt = ffs(igt_unique(__mask)) - 1, igt_unique(__mask) != 0; \
> +	     igt_unique(__mask) &= ~BIT(__gt))

Replace ffs to ffsl, then:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  #define xe_for_each_mem_region(__fd, __memreg, __r) \
>  	for (uint64_t igt_unique(__i) = 0; igt_unique(__i) < igt_fls(__memreg); igt_unique(__i)++) \
>  		for_if(__r = (__memreg & (1ull << igt_unique(__i))))
> -- 
> 2.49.0
> 
