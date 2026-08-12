Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85FBC5B572
	for <igt-dev@archiver.kernel.org>; Wed, 12 Aug 2026 15:34:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53A1F10E41B;
	Wed, 12 Aug 2026 15:34:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nHQLzS3I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC7510E261
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Aug 2026 15:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786548855; x=1818084855;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=S9XppUsC8e3tX006TzhrMvyzjagFGX81JfrdZaP8Zw8=;
 b=nHQLzS3IlvKHk2Ss12I6o0srf1IrcbpvMNx8U4RanIeF8d7AX2+13yNf
 5FwE60tmh8eD8g2H5Mz50WeUdUyns/Gnd1ye0BVVGw+14K0FWgCcce329
 yLZD4Ar+kL9ztDrIKGp7dZE8c1LedSeQodi9/g6QG7gIMmbV8h1Ctv7Rt
 0gHZa+oHih/CB3dXfWQh9m+e9FAslsqbOJRY5endWEwQlndXbEvDwFBg9
 DpLUnhNv7Rvi8R5St8kPdumv3jT/kM9da1v+X6c7FOXQtpGTi5ZRXfR+i
 a8d9sPjSc422T8/FEnGyEaVGb/GnZAhpIDd2rnl6WPCfbq6U7oSxtd6RR A==;
X-CSE-ConnectionGUID: YYc02504SCqFJVtZ2CV9wA==
X-CSE-MsgGUID: dLTLx5sPSCmsmy90b6YuBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="86227225"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="86227225"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 08:34:15 -0700
X-CSE-ConnectionGUID: 0qknBml9QJGY9xzj9p/EIg==
X-CSE-MsgGUID: shYEbvfBQQa8RkGw1faWTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="288451594"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 08:34:14 -0700
Date: Wed, 12 Aug 2026 17:33:59 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Luka Mamrikishvili <lmamrikishvili01@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH] tests/sw_sync: fix invalid fd test
Message-ID: <20260812153246.dt6gkdv3iu6qlanm@kamilkon-DESK.igk.intel.com>
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

Hmm, sorry for late notice but this should be drm_close_driver()

With above fixed you could add my r-b.

Regards,
Kamil

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
> -- 
> 2.55.0
> 
