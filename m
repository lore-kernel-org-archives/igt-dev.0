Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C83C43458
	for <igt-dev@archiver.kernel.org>; Thu,  2 Jul 2026 17:26:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6152010E0C1;
	Thu,  2 Jul 2026 17:26:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qt7sO11h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A928110E0C1
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Jul 2026 17:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783013149; x=1814549149;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=QTICQdw9ztRnLtp/4zz3PIqWHy0K91BI+tJzv0znDY4=;
 b=Qt7sO11hkNavUgEwcvnfKdIp7riEZXwjf4lEev/7JriblsPKzC0BB6LZ
 9eJPnDKR0imcwrseNPHtsXN2TgoPHL8PqLTqrEWAxY8iHQnIwLIe2A+Uf
 khvwHAgP6QoQR8MnhQ65H/YFb9dFkMGG4AKRQ9Lg5KtWBBnt0TFwFVHCj
 bOBKyXDDxrPx+icNVu3SzBiGPXWa1fdoD66NVhI6V3OyGOeCR50HDI7t8
 DAo60aE2dS2UKch5JfbvfFLmBoGEQlYiqEK/59b2e7q/II5Hi8LBwTUTg
 xU640uwlhvwEpF05enPyzpU2HRhuXqwod73chN1jBJkprYLcN0oweFM7o A==;
X-CSE-ConnectionGUID: a2/qKYFgR/CFgBslH4vKKg==
X-CSE-MsgGUID: K6pdKplSRPOHS42ca6+iGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="82882782"
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; d="scan'208";a="82882782"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 10:25:49 -0700
X-CSE-ConnectionGUID: Gvu3Kid0TAWgogUqrcdNhA==
X-CSE-MsgGUID: uR5+aUsbSmeLAev+UK3ERA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; d="scan'208";a="257259848"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 10:25:47 -0700
Date: Thu, 2 Jul 2026 19:25:25 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: vitaly.prosyak@amd.com
Cc: igt-dev@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Jesse Zhang <jesse.zhang@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [PATCH 2/7] lib: Implement generic platform filtering framework
Message-ID: <20260702172525.2ubqjkqmu7c3waxq@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 vitaly.prosyak@amd.com, igt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jesse Zhang <jesse.zhang@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
References: <20260630032442.200729-1-vitaly.prosyak@amd.com>
 <20260630032442.200729-2-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260630032442.200729-2-vitaly.prosyak@amd.com>
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

Hi vitaly.prosyak,
On 2026-06-29 at 23:23:21 -0400, vitaly.prosyak@amd.com wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> 
> Implement the vendor-agnostic platform filtering core that provides:
> 
> - Three-tier priority system:
>   1. Built-in rules (highest, vendor-specific, requires rebuild)
>   2. Config file /etc/igt/platform_skip.conf (no rebuild needed)
>   3. Environment variable IGT_PLATFORM_SKIP_CONFIG (runtime)
> 
> - Config file parsing with format: platform:test:subtest:reason
> - Environment variable parsing (semicolon-separated entries)
> - Wildcard/glob matching for test and subtest names
> - igt_platform_require() integration with igt_skip()
> - Dump functionality for debugging filter state
> 
> All state is held in struct platform_filter_context (no globals).
> Vendor backends are accessed exclusively through platform_filter_ops
> callbacks, keeping this code completely vendor-neutral.
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Jesse Zhang <jesse.zhang@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Reviewed-by: Jesse Zhang <jesse.zhang@amd.com>
> Change-Id: I0a6ce532c2ef9913e68c9a23c8b9e642443a367e
> ---
>  lib/igt_platform_filter.c | 499 ++++++++++++++++++++++++++++++++++++++
>  lib/meson.build           |   1 +
>  2 files changed, 500 insertions(+)
>  create mode 100644 lib/igt_platform_filter.c

Compilation breaks on this patch.
[6/982] Compiling C object lib/libigt-amdgpu_amd_platform_c.a.p/amdgpu_amd_platform.c.o
FAILED: lib/libigt-amdgpu_amd_platform_c.a.p/amdgpu_amd_platform.c.o

tform.c.o.d -o lib/libigt-amdgpu_amd_platform_c.a.p/amdgpu_amd_platform.c.o -c ../lib/amdgpu/amd_platform.c
../lib/amdgpu/amd_platform.c:9:3: error: expected identifier or '(' before '/' token
    9 |  */
  |   ^
  In file included from ../lib/amdgpu/amd_platform.c:11:
  /usr/include/stdlib.h:98:8: error: unknown type name 'size_t'
     98 | extern size_t __ctype_get_mb_cur_max (void) __THROW __wur;
	   |        ^~~~~~
	   /usr/include/stdlib.h:278:36: error: unknown type name 'size_t'
	     278 | extern int strfromd (char *__dest, size_t __size, const char *__format,
		   |                                    ^~~~~~
		   /usr/include/stdlib.h:57:1: note: 'size_t' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
		      56 | #include <bits/floatn.h>
			+++ |+#include <stddef.h>
			   57 |



Regards,
Kamil

[cut]
