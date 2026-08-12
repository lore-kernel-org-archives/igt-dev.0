Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302E8C5B572
	for <igt-dev@archiver.kernel.org>; Wed, 12 Aug 2026 13:06:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCEE210EFC3;
	Wed, 12 Aug 2026 13:06:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nIZ5P67l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA32F10EFBF
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Aug 2026 13:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786539932; x=1818075932;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Ul+HCcy9fWIn7yFlUSVPOKFmQxgPSi5N6YBNrDN81XA=;
 b=nIZ5P67lvXoiUWph5tsU3lSh1zxt96R6fALW3am7/JJEL/fNP5EjMOkL
 JLf5bWBOWvuTB+OTv4OGpPm/2RneebUN3H/R5M//hnAoTKvnBo6cmGmUl
 F0b+Pd+9UfS5KZySZYnkstk8uGSOYET5z6yDWotgZmiaR89ZK13KY/OYF
 3IoyyEUS73++spIYg/tYcv6mTAQnOto6B0wHgr3zD9M6fy1vDjJvx62NM
 dHt5KZFWO2rdUdywtCfBbO7iYy5CLBC/s7ku9IoC9ylZG6PTnYLGmsSL4
 qSc6aiDtbrPfx1pGJiry/UATrPL8MMygjX+NllaamvryOoBSjrqPlrFn6 w==;
X-CSE-ConnectionGUID: dU7TxVk3Sz2x1V9NclleeQ==
X-CSE-MsgGUID: jjgvdUoVQ3Ortk10uSP6YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="87020677"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="87020677"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 06:05:32 -0700
X-CSE-ConnectionGUID: akzdXHtdRPaT3dGG95Nv7w==
X-CSE-MsgGUID: PHMgXZmnQk6JLv/dSDGCwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="261884697"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 06:05:31 -0700
Date: Wed, 12 Aug 2026 15:05:24 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Luka Mamrikishvili <lmamrikishvili01@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH] tests/sw_sync: fix invalid fd test
Message-ID: <20260812130524.zzj55qlvm6ig724f@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Luka Mamrikishvili <lmamrikishvili01@gmail.com>,
 igt-dev@lists.freedesktop.org
References: <20260810170019.479199-1-lmamrikishvili01@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260810170019.479199-1-lmamrikishvili01@gmail.com>
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

Hi Luka,
On 2026-08-10 at 19:00:19 +0200, Luka Mamrikishvili wrote:
> The invalid file fd test overwrites the file descriptor returned by
> mkstemp() with a DRM device file descriptor. As a result, it tests a
> device fd twice instead of testing a regular file fd, and leaks both
> the first device fd and temporary file fd.
> 
> Close the device fd after its test and retain the temporary file fd
> for the file fd test.
> 
> Signed-off-by: Luka Mamrikishvili <lmamrikishvili01@gmail.com>
> ---
>  tests/sw_sync.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/sw_sync.c b/tests/sw_sync.c
> index 8012652d6..a75ec044b 100644
> --- a/tests/sw_sync.c
> +++ b/tests/sw_sync.c
> @@ -334,6 +334,7 @@ static void test_sync_merge_invalid(void)
>  	fence_invalid = drm_open_driver(DRIVER_ANY);
>  	fence_merge = sync_fence_merge(in_fence, fence_invalid);
>  	igt_assert_f(fence_merge < 0, "Verify invalid fd (device fd) handling");
> +	close(fence_invalid);
>  
>  	fence_invalid = mkstemp(tmppath);
>  	if (fence_invalid == -1) {
> @@ -341,7 +342,6 @@ static void test_sync_merge_invalid(void)
>  		goto out;
>  	}
>  	unlink(tmppath);
> -	fence_invalid = drm_open_driver(DRIVER_ANY);
>  	fence_merge = sync_fence_merge(in_fence, fence_invalid);
>  	close(fence_invalid);
>  	igt_assert_f(fence_merge < 0, "Verify invalid fd (file fd) handling");

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> -- 
> 2.55.0
> 
