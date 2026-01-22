Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30623C44500
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 08:17:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8A6710E01F;
	Thu, 22 Jan 2026 08:17:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jejSrx48";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF1A110E01F
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 08:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769069821; x=1800605821;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=bYbxSYY6mvNDYYanp6c1aXAjuGbe1ToiA7xKRFsxCvw=;
 b=jejSrx482g7cXioFSYzNbjaeHQQ8PGzXge7s8L33aTJF3M2UvJn9lhve
 OQmh06iza+HZZIq3WGm3IIqaQfH7M015Pfkj5zwjpgIXyecNK3j+sue3g
 4Na3ErY9Pp+4yceaQvgdYDfFUM2F7Zinnn6fq7eSHbmYl9mP8JX4EkTv6
 CXItBPxBLTR+1uMRnjeuDsn1gZrU66rRZPiE3V1QpMRj/VkrlwIR8n+Wc
 hVKiywc8n/WZWrgExrWOYb9tqAsLUU0xw9k8HVAZEVxt9NnrNBprPtSfu
 qbef8XkW0h2lUo3NjOl0s8/uHN8cjpZq7nK4eQnhWf+0zbeBo+XwkBrwo Q==;
X-CSE-ConnectionGUID: Tu/fsDkvTti1wT7E87nAlQ==
X-CSE-MsgGUID: HzJ8OWs/SpaPJ0qhKqzf1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="92970748"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="92970748"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 00:17:01 -0800
X-CSE-ConnectionGUID: UNzo7oyBSVCFRfzjUKQ/IQ==
X-CSE-MsgGUID: HetG2UJzSe+b+wxj9mDplw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="205918911"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.217])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 00:17:00 -0800
Date: Thu, 22 Jan 2026 09:16:57 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/intel/gem_tiled_pread_basic: Create basic
 subtest
Message-ID: <6mn7scfciw7dvwdp7r6647urx6pkqmgnofslrycrcwrsubibav@dwrdkd33znlt>
References: <20260120170507.131181-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260120170507.131181-1-kamil.konieczny@linux.intel.com>
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

On Tue, Jan 20, 2026 at 06:05:07PM +0100, Kamil Konieczny wrote:
> Create basic subtest and make proper cleanup in igt_fixture.
> Also while at this, sort include headers.
> 
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel/gem_tiled_pread_basic.c | 40 +++++++++++++++++++----------
>  1 file changed, 27 insertions(+), 13 deletions(-)
> 
> diff --git a/tests/intel/gem_tiled_pread_basic.c b/tests/intel/gem_tiled_pread_basic.c
> index 9b5d82865..7c6ef0540 100644
> --- a/tests/intel/gem_tiled_pread_basic.c
> +++ b/tests/intel/gem_tiled_pread_basic.c
> @@ -35,19 +35,19 @@
>   * other systems.
>   */
>  
> -#include "igt.h"
> -#include <stdlib.h>
> -#include <stdio.h>
> -#include <string.h>
> +#include <errno.h>
>  #include <fcntl.h>
>  #include <inttypes.h>
> -#include <errno.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <sys/ioctl.h>
>  #include <sys/stat.h>
>  #include <sys/time.h>
> -#include <sys/ioctl.h>
>  
>  #include "drm.h"
>  #include "i915/gem_create.h"
> +#include "igt.h"
>  /**
>   * TEST: gem tiled pread basic
>   * Description: Test pread behavior on tiled objects with respect to the reported swizzling value.
> @@ -57,7 +57,8 @@
>   * Functionality: tiled pread/pwrite
>   * Feature: gtt, mapping
>   *
> - * SUBTEST:
> + * SUBTEST: basic
> + * Description: Basic test to check swizzled offsets and values.
>   */
>  
>  IGT_TEST_DESCRIPTION("Test pread behavior on tiled objects with respect to the"
> @@ -127,19 +128,16 @@ calculate_expected(int offset, struct offset *dbg)
>  	return (dbg->base_y + dbg->tile_y) * WIDTH + dbg->base_x + dbg->tile_x;
>  }
>  
> -int igt_simple_main()
> +static void
> +basic_test(int fd)
>  {
> -	int fd;
>  	int i, iter = 100;
>  	uint32_t tiling, swizzle;
>  	uint32_t handle;
>  	uint32_t devid;
>  
> -	fd = drm_open_driver(DRIVER_INTEL);
> -	igt_require(gem_available_fences(fd) > 0);
>  	handle = create_bo(fd);
>  	igt_require(gem_get_tiling(fd, handle, &tiling, &swizzle));
> -	gem_require_pread_pwrite(fd);
>  
>  	devid = intel_get_drm_devid(fd);
>  
> @@ -231,7 +229,23 @@ int igt_simple_main()
>  				     offset, offset + len,
>  				     swizzle_str);
>  		}
> +	} /* for i < iter */
> +}
> +
> +int igt_main()
> +{
> +	int fd;
> +
> +	igt_fixture() {
> +		fd = drm_open_driver(DRIVER_INTEL);
> +		igt_require(gem_available_fences(fd) > 0);
> +		gem_require_pread_pwrite(fd);
>  	}
>  
> -	drm_close_driver(fd);
> +	igt_subtest("basic")
> +		basic_test(fd);
> +
> +	igt_fixture()
> +		drm_close_driver(fd);
> +

Ok, change looks correct. CI also is not complaining.

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  }
> -- 
> 2.52.0
> 
