Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C13F0C44501
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jul 2026 13:02:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62D1210E363;
	Thu, 16 Jul 2026 13:02:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c72t45YK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52BC510E360
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jul 2026 13:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784206922; x=1815742922;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KLjL+lGPHjT8WldT5wnb6A+nY1DMqEpZBcuj8j2za50=;
 b=c72t45YK8s7cwdtvYpNvdRTCliG6tlWUVese4EBXxJowVQVLyIJeuYce
 MxVxj5fwbAZpJ/zED6EgkREH4heRdUXPBzdcdfldvcrWVCUtx4VvMUaEY
 387JK9em15zUEnUes7tM3KfkhjoeeOw54aJz7KZe5jVvtuPS/qklB23j0
 HH73opShd6owQGcML2ZOMUDBO7FE5geMxhr5RLD/PyX/Cgoqn3CfPPWbn
 JRD8RVBkBM8a5nY7ooa84fmbjHrqyo3UFLnkKYpUs+gnxDEIlqaAqsSqo
 ZVxTmasaT7eOMhXNFFO7Kjrmml+alhjUwn8edNXjwIdK/d5CJkQBq7TPX Q==;
X-CSE-ConnectionGUID: ULwU1wseRmGTQ1mU8RLr8A==
X-CSE-MsgGUID: +tlT8nkiRWeclxgDSSikGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84824740"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="84824740"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 06:02:00 -0700
X-CSE-ConnectionGUID: mmIQVYKMQryF42CJ1XjCDQ==
X-CSE-MsgGUID: wFhLzB/wQt6+ME3+quQk8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="258470422"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 06:01:57 -0700
Date: Thu, 16 Jul 2026 15:01:55 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Cc: igt-dev@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Subject: Re: [PATCH i-g-t v2 3/3] tests/gpu_buddy: Rename the KUnit buddy
 allocator test
Message-ID: <20260716130155.6e2uztehbhfnhpbd@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 igt-dev@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>
References: <20260625192850.56004-1-krzysztof.niemiec@intel.com>
 <20260625192850.56004-4-krzysztof.niemiec@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260625192850.56004-4-krzysztof.niemiec@intel.com>
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

Hi Krzysztof,
On 2026-06-25 at 21:28:50 +0200, Krzysztof Niemiec wrote:
> The DRM buddy allocator has been moved one level up, and is now renamed
> to just the GPU buddy allocator. This means that the .ko object used to
> run the KUnit test has been renamed, so IGT tries to run a test that
> doesn't exist anymore.
> 
> Rename the drm_buddy.c file to gpu_buddy.c to reflect the kernel change,
> and update the igt_kunit() call to invoke the proper tests.
> 
> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

Applied, thanks!

Regards,
Kamil

> ---
>  tests/{drm_buddy.c => gpu_buddy.c} | 4 ++--
>  tests/meson.build                  | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>  rename tests/{drm_buddy.c => gpu_buddy.c} (51%)
> 
> diff --git a/tests/drm_buddy.c b/tests/gpu_buddy.c
> similarity index 51%
> rename from tests/drm_buddy.c
> rename to tests/gpu_buddy.c
> index dbc7c957d..4cea2e124 100644
> --- a/tests/drm_buddy.c
> +++ b/tests/gpu_buddy.c
> @@ -6,9 +6,9 @@
>  #include "igt.h"
>  #include "igt_kmod.h"
>  
> -IGT_TEST_DESCRIPTION("Basic sanity check of DRM's buddy allocator (struct drm_buddy)");
> +IGT_TEST_DESCRIPTION("Basic sanity check of the GPU buddy allocator (struct gpu_buddy)");
>  
>  int igt_main()
>  {
> -	igt_kunit("drm_buddy_test", NULL, NULL);
> +	igt_kunit("gpu_buddy_tests", NULL, NULL);
>  }
> diff --git a/tests/meson.build b/tests/meson.build
> index 4c1a39e9e..0d9008bbd 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -12,11 +12,11 @@ test_progs = [
>  	'dmabuf_sync_file',
>  	'device_reset',
>  	'dumb_buffer',
> -	'drm_buddy',
>  	'drm_mm',
>  	'drm_read',
>  	'drm_virtgpu',
>  	'fbdev',
> +	'gpu_buddy',
>  	'kms_3d',
>  	'kms_addfb_basic',
>  	'kms_async_flips',
> -- 
> 2.45.2
> 
