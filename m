Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29538C83F0A
	for <igt-dev@archiver.kernel.org>; Tue,  1 Jul 2025 16:21:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2DAF10E5C1;
	Tue,  1 Jul 2025 16:21:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SJ4CeQOx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA05710E5C9
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Jul 2025 16:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751386879; x=1782922879;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=AGLIguVpSl3MR4bFQvhLZVPTx4Q7xFZEVOOvzRz7KRo=;
 b=SJ4CeQOxSpuT980iAAxKKj4lN8usPoUgPGzhcxPvsm3o9T3UiDjsXFwK
 1Sg35R85371g/qmn75BVsrFuUPk0PU32YY0JvZr4TLtsLqb0ARIn3qU4O
 rEcoHsDDI0jTI4XoKvkNTJbtZ/5nmc2IyA0CQCJ9bDOz9uTwvK3acEWgS
 t64m20pFJ2DN8IY575TAIH1Tmbo3fvF3L/J/+1LM+GYzjA9Px3Tf3OpBd
 /bXxNMprWbtTi/5sFlHQrQmn8rgKde8xPdAVnuiyfwCxbDNGXT/Nl7J3d
 BdN1FZAa6DXWKcE/vxk1tJJa3lriPzemejSKpzjbFQh2H7Yped8f1JPjx g==;
X-CSE-ConnectionGUID: qBN9UjoIREyLy9nYkEm4WA==
X-CSE-MsgGUID: Unt7ciVKRROIQB0cigQeTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="57438672"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="57438672"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 09:21:19 -0700
X-CSE-ConnectionGUID: kajL1D3FQgqdpsWcdlzfiw==
X-CSE-MsgGUID: lpb+r3gcQnOd9FEnqJJ4Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="153424658"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 09:21:17 -0700
Date: Tue, 1 Jul 2025 18:21:14 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: igt-dev@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <rob.clark@oss.qualcomm.com>
Subject: Re: [PATCH igt 7/9] msm/mapping: Handle larger gmem file size
Message-ID: <20250701162114.5gkdr7f5cww23ou4@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 igt-dev@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <rob.clark@oss.qualcomm.com>
References: <20250630180903.77990-1-robin.clark@oss.qualcomm.com>
 <20250630180903.77990-8-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250630180903.77990-8-robin.clark@oss.qualcomm.com>
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

Hi Rob,
On 2025-06-30 at 11:09:01 -0700, Rob Clark wrote:
> From: Rob Clark <rob.clark@oss.qualcomm.com>
> 
> If running on a system with full desktop environment, the file will be
> much larger than 0x4000 bytes.
> 
> Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
> ---
>  tests/msm/msm_mapping.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
> index 03a9e814c931..978ea18375dd 100644
> --- a/tests/msm/msm_mapping.c
> +++ b/tests/msm/msm_mapping.c
> @@ -122,7 +122,7 @@ endswith(const char *str, const char *end)
>  static uint64_t
>  get_bo_addr(int drm_fd, const char *name)
>  {
> -	char buf[0x4000];
> +	char buf[0x80000];

If it is that big why not malloc() it?

Regards,
Kamil

>  	char *p = buf;
>  
>  	igt_debugfs_read(drm_fd, "gem", buf);
> -- 
> 2.50.0
> 
