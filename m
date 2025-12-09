Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 842B1D3B7EA
	for <igt-dev@archiver.kernel.org>; Tue,  9 Dec 2025 13:13:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EDA110E54D;
	Tue,  9 Dec 2025 13:13:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YP1k/Ujc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D69E10E54D
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Dec 2025 13:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765285994; x=1796821994;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=qcgc9pat9ju5vTQyIFRR/ZMFpbBLg6bRfvbCjMpeeg4=;
 b=YP1k/Ujcj/FEr0ie3XfalCNX58WPSolkGFSKiL9J3n4s0uaiX8FMplCz
 2M+qHl5oK1KEVDWTHNY72JZ3dB6OgvP3Ugg3Z6mN7KRmPQokf+reBbbMd
 mUPGRezOqZhfjdwuiQOUDNKLfx76hUN8YOGwGinDPsvNbOgUMLmLXNwAD
 L/MfYBG/QHdAwpC2D+iobgEuQePXtxaTPhEx2UhsxO/E1iWUC+aH16sSo
 eYSqnrJzdvktWk4s27UEDQoiR5pFyKXxgSFBRyMCMKZSbPyGFudhd0R6W
 iUsoFrG6AgaQDfE0o7ZZ2GWAi4fRQTUwIzOX2XBO1WEd9y+kdiKZljBit g==;
X-CSE-ConnectionGUID: Wh/HarbrT9yz4i9ic0HrXw==
X-CSE-MsgGUID: gLuZ1+X2QJurY1MHEiRWEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67408259"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="67408259"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 05:13:14 -0800
X-CSE-ConnectionGUID: PUiHsdXJRj6zFXYUJVim4g==
X-CSE-MsgGUID: IEUq6m7kQ8mhLPedlEKeBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="200655839"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 05:13:13 -0800
Date: Tue, 9 Dec 2025 14:12:55 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Swati Sharma <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org, chaitanya.kumar.borah@intel.com
Subject: Re: [PATCH i-g-t 1/3] lib/igt_hdr: Move HDR helpers from kms_hdr
 into shared library
Message-ID: <20251209131255.buigwv6vktpn5t3a@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 igt-dev@lists.freedesktop.org, chaitanya.kumar.borah@intel.com
References: <20251203090836.1164827-1-swati2.sharma@intel.com>
 <20251203090836.1164827-2-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251203090836.1164827-2-swati2.sharma@intel.com>
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

Hi Swati,
On 2025-12-03 at 14:38:34 +0530, Swati Sharma wrote:
> Introduce lib/igt_hdr.{c,h} containing metadata fill helpers, EOTF enums,
> ST2084 construction, and blob programming utilities. This allows
> kms_hdr and upcoming tests (e.g., HDR support in kms_frontbuffer_tracking)
> to share common HDR code.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  lib/igt_hdr.c   | 200 ++++++++++++++++++++++++++++++++
>  lib/igt_hdr.h   |  33 ++++++
>  lib/meson.build |   1 +
>  tests/kms_hdr.c | 298 ++++++++----------------------------------------
>  4 files changed, 284 insertions(+), 248 deletions(-)
>  create mode 100644 lib/igt_hdr.c
>  create mode 100644 lib/igt_hdr.h
> 
> diff --git a/lib/igt_hdr.c b/lib/igt_hdr.c
> new file mode 100644
> index 000000000..263d251ce
> --- /dev/null
> +++ b/lib/igt_hdr.c
> @@ -0,0 +1,200 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "igt.h"
> +#include "igt_hdr.h"
> +#include <fcntl.h>
> +#include <termios.h>
> +#include <unistd.h>

Add newline.

Here place igt headers in alphabetical order.

> +#include "igt_edid.h"

Regards,
Kamil

> +
> +/* HDR EDID parsing. */
> +#define CTA_EXTENSION_VERSION		0x03
> +#define HDR_STATIC_METADATA_BLOCK       0x06
> +#define USE_EXTENDED_TAG		0x07
> +
[cut]

