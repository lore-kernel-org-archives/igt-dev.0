Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C4EEC4829B
	for <igt-dev@archiver.kernel.org>; Mon, 12 Feb 2024 15:08:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3262A10E7D6;
	Mon, 12 Feb 2024 15:08:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aSIOoEz9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1034B10ED33
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Feb 2024 15:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707750486; x=1739286486;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=toH41vThOWc9UKDN7WTq8xg1CcWWNgEEd7Qfd87bOLc=;
 b=aSIOoEz9HNcqGrCcXci9znCACe2XgDWpN2fBfMM3tUMIzIl6c8Q+mK2E
 co18iNXKtR45VvkNCVx/cUdid6JjMZ86JY5jAbJ5/207pgOowMALhTCzS
 AQWKkDzO45skRFX59b0DSiMynzfpTv2MX1ms1fm0g7d1JcmVCxGgmv/KN
 bBsRF68xIiNRGCPKJB97HVC+8M8Y3HPXBSrsGwFCcjcMRjcKnhBwY4Ey8
 nEZS/bOmgCpag5Ck89Sp6yzE0QtxUW6mZigceqZy9hFaXMjOtItnVuCPX
 PVZBJKztwxFQwQQQenFDj6SKRiFdanLLbit3R/PoCwXPO2ECFzenM8WAW A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="436873862"
X-IronPort-AV: E=Sophos;i="6.06,264,1705392000"; d="scan'208";a="436873862"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 07:07:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,264,1705392000"; 
   d="scan'208";a="2610899"
Received: from unknown (HELO localhost) ([10.245.86.45])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 07:07:43 -0800
Date: Mon, 12 Feb 2024 16:07:41 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 8/8] lib/igt_fb: assert fb->size blt_fb_init()
Message-ID: <20240212150741.hsk6jzcdiztbyf2l@zkempczy-mobl2>
References: <20240209183433.375099-1-matthew.auld@intel.com>
 <20240209183433.375099-8-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240209183433.375099-8-matthew.auld@intel.com>
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

On Fri, Feb 09, 2024 at 06:34:33PM +0000, Matthew Auld wrote:
> If fb->size is zero here, the mmap failure is pretty obscure from the
> logs. Make it more obvious if we hit this.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  lib/igt_fb.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 71c220a08..65e0638c2 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2780,6 +2780,8 @@ static struct blt_copy_object *blt_fb_init(const struct igt_fb *fb,
>  
>  	blt->plane_offset = fb->offsets[plane];
>  
> +	igt_assert(fb->size);
> +
>  	if (is_xe_device(fb->fd))
>  		blt->ptr = xe_bo_mmap_ext(fb->fd, handle, fb->size,
>  					  PROT_READ | PROT_WRITE);
> -- 
> 2.43.0
>

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
