Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1665DC52D7C
	for <igt-dev@archiver.kernel.org>; Thu, 22 Aug 2024 18:45:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA5E610EBD2;
	Thu, 22 Aug 2024 18:45:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G343sQEj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DB1210EBD3
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Aug 2024 18:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724352315; x=1755888315;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ejNFS/zHGZLMeeveIe7KonoEbps/Cg6/dgdYKqQjt14=;
 b=G343sQEjQkyVyQ6cFKdWj6X/kwKCuEZqOIHd5zLP/QM5wXrf7gmNhD3V
 EPU4i9gKCPyfuD0q+hSEM7Naq6op4niKPnIukYyCvouuclz0xXQuC5BOM
 QYwv6CZZb8eOVrSjt+IvhFRm4SYFCmQ4jskgKXEXTuIWlOGdFZM3Zp5K0
 8uJMYbBYFlDzEipwDOIMX/nAbttq74I19Of6f8ivT8417aYjhBX3+uhGj
 6MtGQ+oPhpSRrn8qodc++8XeJuNRkTP2lGRTC2zNgfv796bsVSu8ToRGw
 U9CBSLWnoKD4XSn6V3U5H8KdDYgUvjhhQaBwDhq5AL438GuJsQGclVmdQ g==;
X-CSE-ConnectionGUID: Clyzd2mIRRqgD1xkyvuS4Q==
X-CSE-MsgGUID: 4zFebpEtT+u3upFcHp6URQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="33360768"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="33360768"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 11:45:00 -0700
X-CSE-ConnectionGUID: Suo5WhcTQ1akqxmf0BLv1A==
X-CSE-MsgGUID: Htr8Fl0ESS6Om8GrKmN+BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="92333778"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.107])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 11:44:57 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Mohammed Anas <triallax@tutanota.com>,
 Stefano Ragni <st3r4g@protonmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Reagan Bohan <xbjfk.github@gmail.com>, Yureka <yuka@yuka.dev>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH i-g-t v1 1/1] tests/intel/kms_pm_backlight: Fixed build on
 musl
Date: Thu, 22 Aug 2024 20:44:54 +0200
Message-ID: <3305001.aeNJFYEL58@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240821095137.60254-2-kamil.konieczny@linux.intel.com>
References: <20240821095137.60254-1-kamil.konieczny@linux.intel.com>
 <20240821095137.60254-2-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

Hi Kamil,

On Wednesday, 21 August 2024 11:51:37 GMT+2 Kamil Konieczny wrote:
> Fix compilation on musl by including proper POSIX header for
> basename. Also while at this, sort out other headers.
> 
> Cc: Mohammed Anas <triallax@tutanota.com>
> Cc: Stefano Ragni <st3r4g@protonmail.com>
> Cc: Bernd Kuhls <bernd@kuhls.net>
> Cc: Reagan Bohan <xbjfk.github@gmail.com>
> Reported-by: Yureka <yuka@yuka.dev>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel/kms_pm_backlight.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backlight.c
> index 8672afa7a..c2213d3b1 100644
> --- a/tests/intel/kms_pm_backlight.c
> +++ b/tests/intel/kms_pm_backlight.c
> @@ -35,15 +35,17 @@
>   * Test category: functionality test
>   */
>  
> -#include "igt.h"
> +#include <unistd.h>

Assuming you tried to follow the linux kernel rule of sorting headers 
alphabetically, why did you place unistd.h at the top?

> +#include <errno.h>
> +#include <fcntl.h>
> +#include <libgen.h> /* for POSIX basename */

LGTM.

>  #include <limits.h>
> +#include <stdio.h>
>  #include <sys/types.h>
>  #include <sys/stat.h>

With still the same assumption, did you notice the above two headers are in 
reverse alphabetic order?

With either the headers in correct alphabetic order, or otherwise the existing 
headers untouched:

Reviewed-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

Thanks,
Janusz

> -#include <fcntl.h>
> -#include <stdio.h>
> -#include <errno.h>
> -#include <unistd.h>
>  #include <time.h>
> +
> +#include "igt.h"
>  #include "igt_device.h"
>  #include "igt_device_scan.h"
>  
> 




