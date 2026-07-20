Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C30C44515
	for <igt-dev@archiver.kernel.org>; Mon, 20 Jul 2026 11:56:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC7D110E15F;
	Mon, 20 Jul 2026 11:56:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JLjMGvaP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63C4D10E15F
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jul 2026 11:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784548543; x=1816084543;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=BJXEFBr3XF3wH5iu6qSt6ilH0pIlFBpsWbQtQsO29s8=;
 b=JLjMGvaPw60PO7rJDdfgJRQkSFs6Pd75gghbyebs2baIxNOW7f4yAgpC
 lLCu185j9DnULUbzE83TLq+VnZTzb9DlDH9vmX1LRIiosCLf79bpgEoQa
 ajyxtTZ5rcpcvQcvw7M+ZO9DAlAOl/l2nXFJSQdkr37CAC0FlPt16O5Qi
 A7j0+sr9yjLkBqp/u9FJoi/hrQlWaG1HcZOgRSYjuABkAv555/67eMFDA
 UvhDFue4CydOdhBgbJBV94gnbDKGlMlv61pptvI6hI+arlHk03OIFesWu
 zef61gYDAVsUp1pAlab+3uIy9oZPS9we9ARXlS2vbn6k9VzjLRoe8yKwt g==;
X-CSE-ConnectionGUID: hWhpEiqXREKHxlqiVsQkFA==
X-CSE-MsgGUID: G+u2aa/UTM2w//idqETfcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="88949265"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="88949265"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 04:55:42 -0700
X-CSE-ConnectionGUID: VI4T0yhBQuSAO3nz5w+81Q==
X-CSE-MsgGUID: XEpzYuPiSFGYvDiOvFZSLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="253497960"
Received: from zzombora-mobl1 (HELO localhost) ([10.245.244.173])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 04:55:40 -0700
Date: Mon, 20 Jul 2026 13:55:38 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Jeevan B <jeevan.b@intel.com>, 
 Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/kms_pm_dc: Fix compilation on arm64
Message-ID: <dovcr7kpqxpty6pald6k5hujeihgqso3zuouuyxp3wlewfwhzu@bjakqntat6ow>
References: <20260720114835.35398-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260720114835.35398-1-kamil.konieczny@linux.intel.com>
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

On Mon, Jul 20, 2026 at 01:48:35PM +0200, Kamil Konieczny wrote:
> Fix compilation on arm64, where following error occurs:
> 
> ../tests/intel/kms_pm_dc.c:428:16: error: implicit declaration of function ‘poll’; did you mean ‘powl’? [-Werror=implicit-function-declaration]
>   428 |   igt_assert_f(poll(&pfd, 1, timeout_ms) > 0,
>       |                ^~~~
> 
> Also while at this add a newline to separate system includes
> from igt ones and a compilation warning in other place:
> 
> ../tests/intel/kms_pm_dc.c:322:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
>   322 |         color_t red_green_blue[] = {
>       |         ^~~~~~~
> 
> Fixes: e4a428ca3a46 ("tests/intel/kms_pm_dc: Detect frame drops via page-flip events")
> Cc: Jeevan B <jeevan.b@intel.com>
> Cc: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
> Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

LGTM,

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> ---
>  tests/intel/kms_pm_dc.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index 37c795ca8..29cfa847e 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -32,9 +32,11 @@
>  
>  #include <errno.h>
>  #include <fcntl.h>
> +#include <poll.h>
>  #include <stdbool.h>
>  #include <stdio.h>
>  #include <string.h>
> +
>  #include "igt.h"
>  #include "igt_kmod.h"
>  #include "igt_psr.h"
> @@ -309,14 +311,6 @@ static void assert_dc_counter_negative(data_t *data, int dc_flag, uint32_t prev_
>  static void setup_videoplayback(data_t *data)
>  {
>  	igt_plane_t *primary;
> -
> -	primary = igt_output_get_plane_type(data->output,
> -					    DRM_PLANE_TYPE_PRIMARY);
> -	igt_require_f(igt_plane_has_format_mod(primary, data->dc3co_fb_format,
> -					       DRM_FORMAT_MOD_LINEAR),
> -					       "Primary plane does not support format %s\n",
> -					       igt_format_str(data->dc3co_fb_format));
> -
>  	color_t red_green_blue[] = {
>  		{ 1.0, 0.0, 0.0 },
>  		{ 0.0, 1.0, 0.0 },
> @@ -328,6 +322,13 @@ static void setup_videoplayback(data_t *data)
>  		{ 1.0, 0.0, 0.0 },
>  	};
>  
> +	primary = igt_output_get_plane_type(data->output,
> +					    DRM_PLANE_TYPE_PRIMARY);
> +	igt_require_f(igt_plane_has_format_mod(primary, data->dc3co_fb_format,
> +					       DRM_FORMAT_MOD_LINEAR),
> +					       "Primary plane does not support format %s\n",
> +					       igt_format_str(data->dc3co_fb_format));
> +
>  	create_color_fb(data, &data->fb_rgb, red_green_blue);
>  	create_color_fb(data, &data->fb_rgr, red_green_red);
>  }
> -- 
> 2.54.0
> 
