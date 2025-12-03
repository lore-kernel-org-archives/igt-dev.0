Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78741D12D7A
	for <igt-dev@archiver.kernel.org>; Wed,  3 Dec 2025 16:18:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA8D10E83D;
	Wed,  3 Dec 2025 16:18:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lVcHveuy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81B7810E83D
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Dec 2025 16:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764778711; x=1796314711;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=eNqYYpYVpWCf6MqLCKeOmrqjTksjX1m6t2G8is0LAmY=;
 b=lVcHveuywgnMv6jXxkvHN+pH98X8ybZFYuwlqpEvuQDEYqAoRUte2QhU
 msKWz3ffJPKuwrBUeoRrkd/LYLHTufYkGcCAl4oqiOPp6if4lLsASAyvC
 tbpn7QAwdfTx0zWTJe4lg9/c/3DvmtU4BUlO1WDzfnhd4uNkNYAX/FdSI
 /4r17IpOmN5SyG3qcxUmtVQJVG75RmZywOhI+VFykSJ5Z39bKiVGaCisx
 qMvMp1Tei4VtnZBkZi5aDbgLMqvRxC8rXFyZ8VGm+fHMNLzOTwGB7Q0l+
 Pmz8ZCiBG99EGBLEu9e3e4IMT1HDjn5mDY3suLRKf4+V22f8GXpsjY0T7 A==;
X-CSE-ConnectionGUID: 9fYEqcK1QTWVzp+a23tIOw==
X-CSE-MsgGUID: aLrks9H4Sb+wHwLOIoPQqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="54328634"
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; d="scan'208";a="54328634"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 08:18:31 -0800
X-CSE-ConnectionGUID: vAR6oE2PTAStgfrkkjwnaQ==
X-CSE-MsgGUID: ApH/ybiJTgmpwZYCxI2DWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; d="scan'208";a="232072032"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 08:18:29 -0800
Date: Wed, 3 Dec 2025 17:18:10 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Soham Purkait <soham.purkait@intel.com>
Cc: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, anshuman.gupta@intel.com,
 lucas.demarchi@intel.com, umesh.nerlige.ramappa@intel.com,
 kamil.konieczny@intel.com
Subject: Re: [PATCH i-g-t 2/2] tools/gputop/gputop: Enable support for
 multiple GPUs and instances
Message-ID: <20251203161810.ghbxs2a5iquxmdss@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Soham Purkait <soham.purkait@intel.com>,
 igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, anshuman.gupta@intel.com,
 lucas.demarchi@intel.com, umesh.nerlige.ramappa@intel.com,
 kamil.konieczny@intel.com
References: <20251127094043.3916839-1-soham.purkait@intel.com>
 <20251127094043.3916839-3-soham.purkait@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251127094043.3916839-3-soham.purkait@intel.com>
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

Hi Soham,
On 2025-11-27 at 15:10:43 +0530, Soham Purkait wrote:
> Introduce vendor-agnostic support for handling multiple GPUs and instances
> in gputop. Improve the tool's adaptability to various GPU configurations.
> 
> v1:
>  - Refactor GPUTOP into a vendor-agnostic tool. (Lucas)
> v2:
>  - Add device filter to populate the array of cards for
>    all supported drivers. (Zbigniew)
> v3:
>  - Cosmetic changes. (Riana)
>  - Avoid three level indentation. (Riana)
> v4:
>  - Add user message for running without root privileges. (Kamil)
> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>  tools/{ => gputop}/gputop.c | 253 ++++++++++++++++++++++++++++++------
>  tools/gputop/meson.build    |   6 +
>  tools/meson.build           |   6 +-

This still do not work without a root:

$ build/tools/gputop/gputop
No device found.

$ build/tools/lsgpu
card0                    Intel Tigerlake (Gen12)           drm:/dev/dri/card0
└─renderD128                                               drm:/dev/dri/renderD128

$ sudo build/tests/core_getversion --r basic
IGT-Version: 2.2-NO-GIT (x86_64) (Linux: 6.14.0-36-generic x86_64)
Using IGT_SRANDOM=1764778453 for randomisation
Opened device: /dev/dri/card0
Starting subtest: basic
0: i915 v1.6 0 Intel Graphics
Subtest basic: SUCCESS (0.000s)

This looks like you made it Xe-only tools, current gputop
works fine with i915.

Regards,
Kamil

>  3 files changed, 220 insertions(+), 45 deletions(-)
>  rename tools/{ => gputop}/gputop.c (63%)
>  create mode 100644 tools/gputop/meson.build
> 
> diff --git a/tools/gputop.c b/tools/gputop/gputop.c
> similarity index 63%
> rename from tools/gputop.c
> rename to tools/gputop/gputop.c
> index f577a1750..4d6c684b2 100644
> --- a/tools/gputop.c
> +++ b/tools/gputop/gputop.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: MIT
>  /*
> - * Copyright © 2023 Intel Corporation
> + * Copyright © 2023-2025 Intel Corporation
>   */
>  
[cut]
