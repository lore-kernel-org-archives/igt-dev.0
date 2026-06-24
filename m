Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4FBFCDB47F
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jun 2026 12:09:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5102310E033;
	Wed, 24 Jun 2026 12:09:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RRr3zInb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F4D10E033
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jun 2026 12:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782302944; x=1813838944;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kLL+CfinJC/AdBP1lx4KsUvO1OqEFRvTkeNTI5iQ0/8=;
 b=RRr3zInb1/pjzlTrZcVqBygyjS4Azxjx3k0upPcZF7hdGWZQaaayiF4B
 9dZPcPqKIzj3t+tcyjSI1mlfddkuVT7pe4hX8ey+FLkvQZSn9+0JgUkq0
 uGoHyEXgcNA5PX4FwrKkquUsjRhL5Oa4yaj+NRNddYOiL24+0PTTbDRGC
 y7JaVg1XVFwDXK97PrPmM9DZg28bfILlY/vVMAGRlFpj1WVLqcwmHojMP
 io9L2LenBXclVJmU8e3oR1WJhHZKmni8G7SgaIBpsWGi51T1PyQmGCJLZ
 VF71Z3yB6DEfchuEV8xsItth9Q29h/kf9YWHO2JvPLQHJlfQY/BtL3w6N A==;
X-CSE-ConnectionGUID: Ylm8qoJDSaC3a2wUYvjctw==
X-CSE-MsgGUID: GadlrPh0RTWwQI7LSVQYXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="83065276"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="83065276"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 05:09:03 -0700
X-CSE-ConnectionGUID: nYKbXe4+SF2OTgmixDQ9ZA==
X-CSE-MsgGUID: HVW9B6wcSfWCkxj3LmUeJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="279988902"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 05:09:00 -0700
Date: Wed, 24 Jun 2026 14:08:58 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Cc: igt-dev@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Subject: Re: [PATCH i-g-t 2/3] tests/gpu_buddy: Update buddy allocator tests
Message-ID: <20260624120858.bf4f5n35747tlzdk@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 igt-dev@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>
References: <20260623200152.12996-1-krzysztof.niemiec@intel.com>
 <20260623200152.12996-3-krzysztof.niemiec@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260623200152.12996-3-krzysztof.niemiec@intel.com>
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
On 2026-06-23 at 22:01:51 +0200, Krzysztof Niemiec wrote:

imho subject could be improved, like

[PATCH i-g-t 2/3] tests/gpu_buddy: Rename KUnit buddy allocator test

or am I missing something?

> The DRM buddy allocator has been moved one level up, and is now renamed
> to just the GPU buddy allocator. This means that the .ko object used to
> run the KUnit test has been renamed, so IGT tries to run a test that
> doesn't exist anymore.
> 
> Rename the drm_buddy.c file to gpu_buddy.c to reflect the kernel change,
> and update the igt_kunit() call to invoke the proper tests. Also update
> tests/meson.build to prevent the build system from trying to build

You do not need to describe change in build meson, it is natural
to change it when renaming test file.

Regards,
Kamil

> drm_buddy, and make it build gpu_buddy in its stead.
> 
> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
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
> index dbc7c957d..8683b5af0 100644
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
