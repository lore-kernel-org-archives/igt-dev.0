Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20391C3600C
	for <igt-dev@archiver.kernel.org>; Mon, 31 Mar 2025 10:34:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE49710E118;
	Mon, 31 Mar 2025 10:34:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hURvoo77";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9D1D10E118
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Mar 2025 10:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743417250; x=1774953250;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=J62sN1m8Do5peMz83CIW+z53Ksw5H4+6eJ6cAn5JFxU=;
 b=hURvoo77MzObvxRSOKvuZPgApLDWgEV7oEFmYKyChBXHB7kRPcG7malg
 93qavlCTHOYuRCowrGjBYXJ/3+k0EdplNOxFKhhbAHl3eOPXuhbDQ4Pux
 35glLPUNtMqYt8Pk/oCVwBbduJfAmZ1MuSL6VCHKN/M7z4ZLI96MdVfkF
 IXH+hYh9JEFTtxRSVRv9qWngmo97CUsAx0bl6120XebPhaanDZEUaYlQt
 w97xgBXuKAfaAhSKdt0sixxGZz8My8XFc3HhaNa4DzR0LOoDELXdcGSNy
 fhoco033p1rlBOkXmBPWVlIrzdVcYtkxW4NG4ay4/iDT44PeIPoilZyDP A==;
X-CSE-ConnectionGUID: nNMD3jtBRfO8Y0ggceZRJA==
X-CSE-MsgGUID: VtRaV3UjS3+tAaFiZUJlZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="44585288"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="44585288"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 03:34:09 -0700
X-CSE-ConnectionGUID: zUOfCb0WSVmUSq4v+6NdkQ==
X-CSE-MsgGUID: ycLd1T+tRBWBZsX+IGccHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="149235732"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO [10.245.246.202])
 ([10.245.246.202])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 03:34:08 -0700
Message-ID: <565b112a-54f2-4838-9b70-d52638880242@intel.com>
Date: Mon, 31 Mar 2025 12:34:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/1] tests/intel/xe_exec_sip_eudebug: disable some
 tests on VF
To: Jan Sokolowski <jan.sokolowski@intel.com>, igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
References: <20250328081916.251987-1-jan.sokolowski@intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250328081916.251987-1-jan.sokolowski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Jan,

On 28.03.2025 09:19, Jan Sokolowski wrote:
> Tests wait-writesip-nodebug and breakpoint-writesip-nodebug
> were found to be incompatible with SR-IOV functionality, and
> should only be available to run if on PF.
> 
> Disable these tests if ran on VF.

As Łukasz mentioned, the toggle is not available for VFs. I think the 
proper fix would be something like:

```
bool xe_eudebug_enable(int fd, bool enable)
         bool old = false;
         int ret = __xe_eudebug_enable_getset(fd, &old, &enable);

-       if (ret) {
-               igt_skip_on(enable);
-               old = false;
-       }
+       igt_skip_on(ret);

         return old;
  }
```

That way if there is no eudebug in the KMD we will just skip it and it 
won't matter if it is not there because of not being compiled in or if 
it's in VF mode.

Regards,
Christoph

> 
> Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
> Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Christoph Manszewski <christoph.manszewski@intel.com>
> ---
>   tests/intel/xe_exec_sip_eudebug.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/tests/intel/xe_exec_sip_eudebug.c b/tests/intel/xe_exec_sip_eudebug.c
> index c317112b4..26b3f9176 100644
> --- a/tests/intel/xe_exec_sip_eudebug.c
> +++ b/tests/intel/xe_exec_sip_eudebug.c
> @@ -22,6 +22,7 @@
>   #include "xe/xe_eudebug.h"
>   #include "xe/xe_ioctl.h"
>   #include "xe/xe_query.h"
> +#include "lib/igt_sriov_device.h"
>   
>   #define WIDTH 64
>   #define HEIGHT 64
> @@ -316,6 +317,7 @@ igt_main
>   		igt_fixture {
>   			was_enabled = xe_eudebug_enable(fd, false);
>   			igt_require(!xe_eudebug_debugger_available(fd));
> +			igt_skip_on(intel_is_vf_device(fd));
>   		}
>   
>   		test_render_and_compute("wait-writesip-nodebug", fd, eci)

