Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEDA4CD4F25
	for <igt-dev@archiver.kernel.org>; Thu, 14 May 2026 11:24:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27A4310E3A2;
	Thu, 14 May 2026 11:24:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jOolyzIU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F0D710E3A2
 for <igt-dev@lists.freedesktop.org>; Thu, 14 May 2026 11:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778757845; x=1810293845;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=iszgHBzcps6/PgON9h6VhneSjTqnkTpqBKuT0tV7icg=;
 b=jOolyzIUBksjAqOgJ+VpWRMBAdXRaa8+fZszcD+JrssHipTd0BibIp87
 Ek2G24DSR+4Qq7OE6ZED055M2UhzK1qa/npPxbmW8MdHBwr9WHDaY4Cq4
 02H4qaNNC8lrU9SHbwAl/LXrU2xB/wQ3e9gkBWuAdqiKgX+JOLd/dNmUj
 DwR/E3cs+RPs6G8RzNpF2xB333rCyeI8/XjQDG1fxPY9E8sx1xz49+Dj5
 vPleyA/YdAJZI7VAHmtAaWUfI9nT8TO+lnGcGw60UHOmdxLx4ALqpZywT
 omKHIQeQsSV9pulw/xt1aEHlO8x7O8vKISfGbdtByVBIRMHNuZkS2coko w==;
X-CSE-ConnectionGUID: 7eDQavxMTbilVd6RZ4ugBQ==
X-CSE-MsgGUID: uy/20wr3RSOa08+DPamalw==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="97269197"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="97269197"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 04:24:05 -0700
X-CSE-ConnectionGUID: PKnz3IS4Tm+mWlwyE/RrqQ==
X-CSE-MsgGUID: 80/D1G7ZQZWVlU1NYYx3MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="235304786"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 04:24:04 -0700
Date: Thu, 14 May 2026 13:23:51 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Swati Sharma <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/2] tests/kms_colorspace: Add Colorspace connector
 property test
Message-ID: <20260514112351.lebyqp7ha4m5comw@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260427105514.2239876-1-swati2.sharma@intel.com>
 <20260427105514.2239876-3-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260427105514.2239876-3-swati2.sharma@intel.com>
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
On 2026-04-27 at 16:25:14 +0530, Swati Sharma wrote:
> Add a dedicated IGT test for the DRM Colorspace connector property,
> exercising both basic functionality and edge cases:
> 
>   - colorspace-enum-list: verify the property exists as an enum with
>     at least the Default value.
>   - colorspace-set-%s: set each supported colorspace value and verify
>     readback via atomic commit (16 parameterized subtests).
>   - colorspace-crc-%s: CRC sanity check confirming output is not
>     corrupted when each colorspace value is active (16 subtests).
>   - colorspace-dpms: verify colorspace survives DPMS off/on cycles.
>   - colorspace-suspend: verify colorspace survives suspend/resume.
>   - colorspace-invalid: reject out-of-range enum values (-EINVAL).
>   - colorspace-connector-type: validate HDMI-only enums are absent
>     on DP connectors and vice-versa.
>   - colorspace-unsupported-value: force a valid but unsupported enum
>     value via the numeric path and verify kernel rejection.
> 
> The test covers the full kernel drm_colorspace enum (16 values) and
> uses a static name-to-value mapping table for the unsupported-value
> subtest, eliminating the need for multiple connected outputs.
> 
> Co-developed-by: Claude Opus 4.6 (Anthropic AI)
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/kms_colorspace.c | 925 +++++++++++++++++++++++++++++++++++++++++
>  tests/meson.build      |   3 +-
>  2 files changed, 927 insertions(+), 1 deletion(-)
>  create mode 100644 tests/kms_colorspace.c
> 
> diff --git a/tests/kms_colorspace.c b/tests/kms_colorspace.c
> new file mode 100644
> index 000000000..8becab72f
> --- /dev/null
> +++ b/tests/kms_colorspace.c
> @@ -0,0 +1,925 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +/**
> + * TEST: kms colorspace
> + * Category: Display
> + * Description: Test the Colorspace connector property
> + * Driver requirement: any
> + * Mega feature: Color Management
> + */
> +
> +#include "igt.h"

Move this after system headers.

> +#include <fcntl.h>
> +#include <inttypes.h>
> +#include <xf86drmMode.h>
> +
> +/**
> + * SUBTEST: colorspace-enum-list
> + * Description: Verify that the Colorspace property is an enum and lists
> + *              at least the Default value.
> + *
> + * SUBTEST: colorspace-set-%s
> + * Description: Set the Colorspace connector property to %arg[1] and
> + *              verify atomic commit succeeds.
> + *
> + * arg[1]:
> + *
> + * @Default:				Default colorspace
> + * @RGB_Wide_Gamut_Fixed_Point:		RGB Wide Gamut Fixed Point
> + * @RGB_Wide_Gamut_Floating_Point:	RGB Wide Gamut Floating Point
> + * @opRGB:				opRGB colorspace
> + * @DCI-P3_RGB_D65:			DCI-P3 RGB D65 colorspace
> + * @DCI-P3_RGB_Theater:		DCI-P3 RGB Theater colorspace
> + * @BT2020_RGB:			BT.2020 RGB colorspace
> + * @BT709_YCC:				BT.709 YCC colorspace
> + * @XVYCC_601:				xvYCC 601 colorspace
> + * @XVYCC_709:				xvYCC 709 colorspace
> + * @SYCC_601:				sYCC 601 colorspace
> + * @opYCC_601:				opYCC 601 colorspace
> + * @BT2020_YCC:			BT.2020 YCC colorspace
> + * @BT2020_CYCC:			BT.2020 constant-luminance YCC
> + * @BT601_YCC:				BT.601 YCC colorspace (DP)
> + * @SMPTE_170M_YCC:			SMPTE 170M YCC colorspace
> + *
> + * SUBTEST: colorspace-crc-%s
> + * Description: Verify that setting Colorspace to %arg[1] does not corrupt
> + *              the display output (CRC sanity check).
> + *
> + * arg[1]:
> + *
> + * @Default:				Default colorspace
> + * @RGB_Wide_Gamut_Fixed_Point:		RGB Wide Gamut Fixed Point
> + * @RGB_Wide_Gamut_Floating_Point:	RGB Wide Gamut Floating Point
> + * @opRGB:				opRGB colorspace
> + * @DCI-P3_RGB_D65:			DCI-P3 RGB D65 colorspace
> + * @DCI-P3_RGB_Theater:		DCI-P3 RGB Theater colorspace
> + * @BT2020_RGB:			BT.2020 RGB colorspace
> + * @BT709_YCC:				BT.709 YCC colorspace
> + * @XVYCC_601:				xvYCC 601 colorspace
> + * @XVYCC_709:				xvYCC 709 colorspace
> + * @SYCC_601:				sYCC 601 colorspace
> + * @opYCC_601:				opYCC 601 colorspace
> + * @BT2020_YCC:			BT.2020 YCC colorspace
> + * @BT2020_CYCC:			BT.2020 constant-luminance YCC
> + * @BT601_YCC:				BT.601 YCC colorspace (DP)
> + * @SMPTE_170M_YCC:			SMPTE 170M YCC colorspace

Looks like a repeated content?

Regards,
Kamil
[cut]
