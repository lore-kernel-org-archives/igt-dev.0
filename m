Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0921CCA0EE4
	for <igt-dev@archiver.kernel.org>; Thu, 14 Aug 2025 16:45:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9559710E8C3;
	Thu, 14 Aug 2025 16:45:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="muaVvO/I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1784010E8C2
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Aug 2025 16:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755189923; x=1786725923;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=sXOlriDWE04BvnVcjUqU6Y502VOMRNmtMT7M9hkVsHo=;
 b=muaVvO/IAvRTo1TemgfNQlTv3QPesJGcQX0ZNNrkNyaLabid7Lj2H+p/
 uTlvSZHDvI5rUpILKh2fCnYsdpTXM3EZKKH7GzY0AWxvk2C8IpXjfBVcY
 QarfaVb2d/38l8fT+4xCcOEmSe0GooXt8i8fVUHxxr1h3aXQF/HtAVqbq
 CEudRL7hgOqm1qIw5VEwT+5Egb5vuL6em7Y8PSur0yXKBri3USBBC2bxP
 oO7X1Tn7caDA6vAA1kHowAkZdkussnebwBwZhAfcJb+mzNsCOoyWpjg4n
 2Aw9LiEgkAWSPulp4p4XYKFiEa7afVBXw09BlZuU5OH2SdNqRjJ/lA76J A==;
X-CSE-ConnectionGUID: wxfvmbI5S2O4KV5ab7X9nA==
X-CSE-MsgGUID: wrfQLgo3TyuNxpxmPsUdlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="61353576"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="61353576"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 09:45:23 -0700
X-CSE-ConnectionGUID: OjpC223CTqmMm5e/0evhFg==
X-CSE-MsgGUID: N8aHC8E5TaaV4X71K/p/jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="166439610"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 09:45:22 -0700
Date: Thu, 14 Aug 2025 18:44:51 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/5] tools/intel_vbt_decode: Remove intel_bios.h
Message-ID: <20250814164451.vymqgxvjddnks6ar@kamilkon-DESK.igk.intel.com>
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

Please resend this as fdo patchwork has some problems and this one
is missing (so it cannot create a series and CI cannot test it).

Regards,
Kamil

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
