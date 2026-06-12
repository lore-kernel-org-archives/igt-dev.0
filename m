Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A024DCD98CE
	for <igt-dev@archiver.kernel.org>; Fri, 12 Jun 2026 14:17:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D84D10F54F;
	Fri, 12 Jun 2026 14:17:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QwOwCt9M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AA3810F543
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jun 2026 14:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781273800; x=1812809800;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=z5xLLejKxcEvs7Lw7YeqY4ZgJCZGRt6HnYaiO9qwvn8=;
 b=QwOwCt9MsU19I+XfLT68szZa6+xuGMXlhRTFn88LoKZZktqp5+92VhyA
 krDKVJB8V1Yy9816ao3E+nsOk6qO0qdvUIXgrwqL/63HOunTFHOJKvyYB
 pcYDLQU4RKFejbtR64ZM+/vPZLhEqHRtKvM4nK9kVbppkWVCZEwO3Q1X5
 9U/2jGzL6emQAgfExN73UZTKh7qkMLv/CkhftReqDowyIeeGxNS+9dpbp
 vY3hF0OOvzWlNi9Ee9skXJPnlK1ACzT/gg6BOZSF6HQ0z0b/CbQiowWIf
 OpRvuawa4J8hv0kn4cTu+C2MoUk+l9UTF+ZbHT6qfSVG2Djo9sTfyScyJ w==;
X-CSE-ConnectionGUID: QavfAlplQGiMZsA0RL/RvQ==
X-CSE-MsgGUID: HawkWm4ZR7qIgJn/2PZEww==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82148102"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="82148102"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 07:16:40 -0700
X-CSE-ConnectionGUID: s5wghJmASV+M5x7zRLat2Q==
X-CSE-MsgGUID: ee0CPkmgT2K/qtQgcEOvaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="242453599"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 07:16:38 -0700
Date: Fri, 12 Jun 2026 16:16:36 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>,
 ville.syrjala@linux.intel.com
Subject: Re: [PATCH i-g-t 2/4] lib/intel_device_info: add a helper to guess
 the PCI ID for a codename
Message-ID: <20260612141636.5zd4s75ietudsx6r@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org,
 =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>,
 ville.syrjala@linux.intel.com
References: <cover.1781261899.git.jani.nikula@intel.com>
 <b02ca4e981b402b630810c017ce144f14d7626a8.1781261899.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b02ca4e981b402b630810c017ce144f14d7626a8.1781261899.git.jani.nikula@intel.com>
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
On 2026-06-12 at 14:00:42 +0300, Jani Nikula wrote:
> The struct intel_device_info contains the codenames for the
> corresponding PCI device IDs. Add a reverse lookup to get a PCI ID for a
> codename.
> 
> It's a bit fuzzy, though. The codenames aren't always spelled the same,
> there are suffixes sometimes omitted, and you can only pick one of the
> matching PCI IDs. Name the helper intel_guess_device_id() to emphasize
> the point, and try increasing fuzziness in the matching to find an
> appropriate struct intel_device_info.
> 
> There's nothing exact about this, and it should not be considered as
> such. But it will be useful in VBT parsing.
> 
> Cc: Michał Grzelak <michal.grzelak@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  lib/intel_chipset.h     |  1 +
>  lib/intel_device_info.c | 75 +++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 76 insertions(+)
> 
> diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
> index 3fcc5b18d648..98a2a81fcffd 100644
> --- a/lib/intel_chipset.h
> +++ b/lib/intel_chipset.h
> @@ -103,6 +103,7 @@ struct intel_device_info {
>  };
>  
>  const struct intel_device_info *intel_get_device_info(uint16_t devid) __attribute__((pure));
> +uint16_t intel_guess_device_id(const char *codenameish) __attribute__((pure));
>  
>  const struct intel_cmds_info *intel_get_cmds_info(uint16_t devid) __attribute__((pure));
>  unsigned intel_gen(uint16_t devid) __attribute__((pure));
> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> index da0b9f398885..3b5373265000 100644
> --- a/lib/intel_device_info.c
> +++ b/lib/intel_device_info.c
> @@ -3,6 +3,7 @@
>  #include "i915_pciids_local.h"
>  
>  #include <strings.h> /* ffs() */
> +#include <ctype.h>

Move it before strings.h, keep alphabetical order.
Also, all system headers should be before igt ones.

Regards,
Kamil

[cut]
