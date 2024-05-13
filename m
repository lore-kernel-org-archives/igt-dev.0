Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE0DC25B10
	for <igt-dev@archiver.kernel.org>; Mon, 13 May 2024 14:02:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E974C10E7A9;
	Mon, 13 May 2024 14:02:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YYZRq+S7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EECD710E7A9
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2024 14:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715608949; x=1747144949;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8dmtLJZpE6GhDE+wiFbtzYnLVZob3iood17a7kNpcB4=;
 b=YYZRq+S7xIwoMXKM0L/MqMxBjVIfx7T79bqcsPcRsIi+49wMq1THtJXo
 obM3mSLBAw9B2iuqppTh6KCbWHmD8j8H3EdPMI61pvJN69OnPZ+h8tWyk
 6cX592B+H4g6q/u3K/AqZuo5aRZ9SpTWAM39m2UhGusQZhMuWJP9ADzGN
 522YGNlSqQScdGcq5Q2cPV2VljfuCEFYibW6pSgy+r1+KsCB7EzzoeM8R
 kL6nAOc8yI+cnyb3NSH6ovj4DBSzkj7OkeF8GxM8NM3CzHcmGm3aka03B
 sGcv4HbLFKPotiTjwgfTx4bq7jYBR0pGydgfjaHxHE0O8s2FUAdFhVkxy Q==;
X-CSE-ConnectionGUID: X/Mxrw9JSGajEkEY2fskIQ==
X-CSE-MsgGUID: +FZJQMXWSwSy75YD5/RzPw==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="15335693"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="15335693"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 07:02:27 -0700
X-CSE-ConnectionGUID: KPtZ6aFOTKS0cXmJzxnbRw==
X-CSE-MsgGUID: t/SWZKGTRmCwb4bORzlXsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="30372877"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 07:02:25 -0700
Date: Mon, 13 May 2024 16:01:55 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Zack Rusin <zack.rusin@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Maaz Mombasawala <mombasawalam@vmware.com>,
 Martin Krastev <krastevm@vmware.com>, Ian Forbes <iforbes@vmware.com>
Subject: Re: [PATCH i-g-t 1/3] tests/vmwgfx: Removing incorrect assert in
 mob_repeated_unref
Message-ID: <20240513140155.ythxuqxir5dtw3ao@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Zack Rusin <zack.rusin@broadcom.com>,
 ian.forbes@broadcom.com, martin.krastev@broadcom.com,
 maaz.mombasawala@broadcom.com,
 Maaz Mombasawala <mombasawalam@vmware.com>,
 Martin Krastev <krastevm@vmware.com>,
 Ian Forbes <iforbes@vmware.com>
References: <20240509191529.3783796-1-zack.rusin@broadcom.com>
 <20240509191529.3783796-2-zack.rusin@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240509191529.3783796-2-zack.rusin@broadcom.com>
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

Hi Zack,
On 2024-05-09 at 15:15:27 -0400, Zack Rusin wrote:
> From: Maaz Mombasawala <mombasawalam@vmware.com>
> 
> Remove an incorrect assert in test mob_repeated_unref that checked if return
> value from multiple unrefs of a mob was 0. This was a bug in the vmwgfx driver,
> since after the first unref it should return -EINVAL.
> This bug was fixed with buffer rework in the vmwgfx driver and now the unref
> ioctl behaves the correct way.
> 
> Signed-off-by: Maaz Mombasawala <mombasawalam@vmware.com>
> Reviewed-by: Martin Krastev <krastevm@vmware.com>
> Reviewed-by: Ian Forbes <iforbes@vmware.com>
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
> ---
>  tests/vmwgfx/vmw_ref_count.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/vmwgfx/vmw_ref_count.c b/tests/vmwgfx/vmw_ref_count.c
> index da4b41f89..92d49dbd0 100644
> --- a/tests/vmwgfx/vmw_ref_count.c
> +++ b/tests/vmwgfx/vmw_ref_count.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0 OR MIT
>  /**********************************************************
> - * Copyright 2021-2022 VMware, Inc.
> + * Copyright 2021-2023 VMware, Inc.
-------------------- ^^^^
This should be 2024.

Regards,
Kamil

>   *
>   * Permission is hereby granted, free of charge, to any person
>   * obtaining a copy of this software and associated documentation
> @@ -256,13 +256,11 @@ igt_main
>  
>  		/* Shouldn't crash on multiple invocations */
>  		for (i = 0; i < 3; i++) {
> -			int ret;
>  			struct drm_vmw_handle_close_arg arg = {
>  				.handle = mob->handle
>  			};
> -			ret = drmCommandWrite(fd1, DRM_VMW_HANDLE_CLOSE, &arg,
> +			drmCommandWrite(fd1, DRM_VMW_HANDLE_CLOSE, &arg,
>  					      sizeof(arg));
> -			igt_assert_eq(ret, 0);
>  		}
>  		free(mob);
>  	}
> -- 
> 2.40.1
> 
