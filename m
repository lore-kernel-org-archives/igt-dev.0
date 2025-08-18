Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E48CA0ED1
	for <igt-dev@archiver.kernel.org>; Mon, 18 Aug 2025 16:35:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F26B110E4A1;
	Mon, 18 Aug 2025 16:35:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dk+drMxW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 741F110E4A1
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Aug 2025 16:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755534930; x=1787070930;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MUQXmG6DYJGuw7pnn75Pl51ZsavDwmZcjK+PLaUmk7o=;
 b=dk+drMxWFJeInWzI5aTeEmWc53qnpm2iSA0TxbWIBhKsKGXI9ol0+eLK
 xn/RBMCXLf6mux2Jaq2fkrbRa4BB3rQ9NuSVlXX+CdiSCzOTvWFqx0bQU
 gXq7WjsT2yU83eSchGIvbg/3dI4mTaQbn6m+7YA7VB4Egja7Q5Iwcz6R7
 ZTJdhBfheHZqUd/ib7B5cKd3d+WvTCzdebB+jFdzKFgJC42IxbFmcIi8E
 hq97NHfUyb6Cgq8LK7NWQj/zx0PAwRov81eUF4QVmjXJXSYjBw3Zqg9F5
 D155HPK8d1NuM+sZILW7RIiXsbxgfSmSvFQNklZLcpC1F26JXji46fk5m w==;
X-CSE-ConnectionGUID: BWlk5PbhT4Cuyd29Yh6iGQ==
X-CSE-MsgGUID: mWiiP4gcSIyguioVORbmEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="69213500"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="69213500"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 09:35:30 -0700
X-CSE-ConnectionGUID: jWcYRw1jRLSUIxrt3IDjaQ==
X-CSE-MsgGUID: B9vvBagkSviz+XY0/1ACHg==
X-ExtLoop1: 1
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 09:35:29 -0700
Date: Mon, 18 Aug 2025 18:35:27 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/5] tools/intel_vbt_decode: Remove intel_bios.h
Message-ID: <20250818163527.krk3s4fua22w4vna@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org
References: <cover.1755175663.git.jani.nikula@intel.com>
 <7090e70d712c94aed53f52c49a8155eb4c6b966c.1755175663.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7090e70d712c94aed53f52c49a8155eb4c6b966c.1755175663.git.jani.nikula@intel.com>
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

Hi Jani,
On 2025-08-14 at 15:48:53 +0300, Jani Nikula wrote:
> With the DSI VBT defs having been split to a separate file, intel_bios.h
> has become rather small. Incorporate the remaining contents to
> intel_vbt_decode.c. Use existing macros for LVDS config.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tools/intel_bios.h       | 47 ----------------------------------------
>  tools/intel_vbt_decode.c | 19 +++++++++++-----
>  2 files changed, 14 insertions(+), 52 deletions(-)
>  delete mode 100644 tools/intel_bios.h
> 
> diff --git a/tools/intel_bios.h b/tools/intel_bios.h
> deleted file mode 100644
> index 0bb4455d1f26..000000000000
> --- a/tools/intel_bios.h
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -/*
> - * Copyright ? 2006 Intel Corporation
> - *
> - * Permission is hereby granted, free of charge, to any person obtaining a
> - * copy of this software and associated documentation files (the "Software"),
> - * to deal in the Software without restriction, including without limitation
> - * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> - * and/or sell copies of the Software, and to permit persons to whom the
> - * Software is furnished to do so, subject to the following conditions:
> - *
> - * The above copyright notice and this permission notice (including the next
> - * paragraph) shall be included in all copies or substantial portions of the
> - * Software.
> - *
> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> - * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> - * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> - * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
> - * SOFTWARE.
> - *
> - * Authors:
> - *    Eric Anholt <eric@anholt.net>
> - *
> - */
> -
> -#ifndef _INTEL_BIOS_H_
> -#define _INTEL_BIOS_H_
> -
> -#include <stdint.h>
> -
> -#define DEVICE_TYPE_DP_DVI		0x68d6
> -#define DEVICE_TYPE_DVI			0x68d2
> -#define DEVICE_TYPE_MIPI		0x7cc2
> -
> -struct bdb_legacy_child_devices {
> -	uint8_t child_dev_size;
> -	uint8_t devices[0]; /* presumably 7 * 33 */
> -} __attribute__ ((packed));
> -
> -#define BDB_DRIVER_NO_LVDS	0
> -#define BDB_DRIVER_INT_LVDS	1
> -#define BDB_DRIVER_SDVO_LVDS	2
> -#define BDB_DRIVER_EDP		3
> -
> -#endif /* _INTEL_BIOS_H_ */
> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> index f7dee8646b4a..307c4da14843 100644
> --- a/tools/intel_vbt_decode.c
> +++ b/tools/intel_vbt_decode.c
> @@ -40,7 +40,6 @@
>  
>  #include "igt_aux.h"
>  #include "igt_halffloat.h"
> -#include "intel_bios.h"
>  #include "intel_chipset.h"
>  #include "intel_io.h"
>  #include "drmtest.h"
> @@ -55,6 +54,16 @@ typedef uint64_t u64;
>  #define _INTEL_BIOS_PRIVATE
>  #include "intel_vbt_defs.h"
>  
> +/* additional macros for parsing */
> +#define DEVICE_TYPE_DP_DVI		0x68d6
> +#define DEVICE_TYPE_DVI			0x68d2
> +#define DEVICE_TYPE_MIPI		0x7cc2
> +
> +struct bdb_legacy_child_devices {
> +	uint8_t child_dev_size;
> +	uint8_t devices[0]; /* presumably 7 * 33 */
> +} __attribute__ ((packed));
> +
>  #define YESNO(val) ((val) ? "yes" : "no")
>  
>  /* This is not for mapping to memory layout. */
> @@ -1816,10 +1825,10 @@ static void dump_lfp_data(struct context *context,
>  }
>  
>  static const char * const lvds_config[] = {
> -	[BDB_DRIVER_NO_LVDS] = "No LVDS",
> -	[BDB_DRIVER_INT_LVDS] = "Integrated LVDS",
> -	[BDB_DRIVER_SDVO_LVDS] = "SDVO LVDS",
> -	[BDB_DRIVER_EDP] = "Embedded DisplayPort",
> +	[BDB_DRIVER_FEATURE_NO_LVDS] = "No LVDS",
> +	[BDB_DRIVER_FEATURE_INT_LVDS] = "Integrated LVDS",
> +	[BDB_DRIVER_FEATURE_SDVO_LVDS] = "SDVO LVDS",
> +	[BDB_DRIVER_FEATURE_INT_SDVO_LVDS] = "Embedded DisplayPort",
>  };
>  
>  static const char *default_algorithm(bool algorithm)
> -- 
> 2.47.2
> 
