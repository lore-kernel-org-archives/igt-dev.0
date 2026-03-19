Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83FDE107527C
	for <igt-dev@archiver.kernel.org>; Thu, 19 Mar 2026 08:54:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2861210E7D3;
	Thu, 19 Mar 2026 08:54:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d5ZPrxr5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0AAE10E7D3
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Mar 2026 08:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773910482; x=1805446482;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=TPYp3AQwnI4bbcsKZoJaD2TcIFmqVrJeaS1Iro6EAjk=;
 b=d5ZPrxr5WhyKfvV7P14mWFDQB8vfYXCbw5kea3vB6PHhWpDiz8G/EDnv
 b3FNX8Q1i/xR/u5tXaWhDSkv3pLKWbNFOYv4kW3CGyJKZz8vGSrh8+lDf
 DcnaaFk0v7oFjfv7Rv+JOsUt7FjM9N8pc9lOcJF9ZUfDba7+3SCUeWCJB
 ZNhrSF1l1yAK8S8vHfwiuI+ijG5im2APflm7VJmuUgGkRut6BvEWHN/xQ
 HC256GakLdo+IpbOC6r5FBIgiRlCeclJIzPXLjr8ZINoJVe47AWyGap0T
 pt/vXy9yr4N3mJp9Uwbun0Aexdsj6qkucKTpVMotCdEktgg2NJeWevEaJ g==;
X-CSE-ConnectionGUID: Y2RykjdpQTy6m59HcmC52g==
X-CSE-MsgGUID: t2prO0QSRLmuujo7IWuDnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="77584152"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="77584152"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 01:54:42 -0700
X-CSE-ConnectionGUID: Kp3mB942QcutA5q2GpGSDg==
X-CSE-MsgGUID: 24+LKsQpT7eOhnOa6Ht8SA==
X-ExtLoop1: 1
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.118])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 01:54:39 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org
Cc: wayne.lin@amd.com, Mark.Broadworth@amd.com, Alex Hung <alex.hung@amd.com>
Subject: Re: [PATCH 2/3] tools: Add amd_hdr_visual for manual HDR verification
In-Reply-To: <20260317175136.3754576-2-alex.hung@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260317175136.3754576-1-alex.hung@amd.com>
 <20260317175136.3754576-2-alex.hung@amd.com>
Date: Thu, 19 Mar 2026 10:54:36 +0200
Message-ID: <7f02ddf383a74633529a642954377ed908e8ddac@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 17 Mar 2026, Alex Hung <alex.hung@amd.com> wrote:
> From: Wayne Lin <wayne.lin@amd.com>
>
> Add a visual verification tool for AMD HDR display output. This tool
> displays HDR test patterns with different metadata types and waits for
> user confirmation, enabling manual inspection of HDR output quality.
>
> Subtests:
> - static-swap-smpte2084: Display with SMPTE ST2084 (PQ) HDR metadata
> - static-swap-traditional-sdr: Display with traditional SDR gamma metadata
>
> Co-developed-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Wayne Lin <wayne.lin@amd.com>
> ---
>  tools/amd_hdr_visual.c | 372 +++++++++++++++++++++++++++++++++++++++++
>  tools/meson.build      |   5 +
>  2 files changed, 377 insertions(+)
>  create mode 100644 tools/amd_hdr_visual.c
>
> diff --git a/tools/amd_hdr_visual.c b/tools/amd_hdr_visual.c
> new file mode 100644
> index 000000000..58decb356
> --- /dev/null
> +++ b/tools/amd_hdr_visual.c
> @@ -0,0 +1,372 @@
> +/*
> + * Copyright 2026 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +#include "igt.h"
> +#include <fcntl.h>
> +#include <termios.h>
> +#include <unistd.h>
> +#include "igt_edid.h"
> +#include "igt_hdr.h"
> +
> +IGT_TEST_DESCRIPTION("Test HDR metadata interfaces and bpc switch");
> +
> +/* Test flags. */
> +enum {
> +	TEST_NONE = 1 << 0,
> +	TEST_DPMS = 1 << 1,
> +	TEST_SUSPEND = 1 << 2,
> +	TEST_SWAP = 1 << 3,
> +};
> +
> +/* BPC connector state. */
> +typedef struct output_bpc {
> +	unsigned int current;
> +	unsigned int maximum;
> +} output_bpc_t;
> +
> +/* Common test data. */
> +typedef struct data {
> +	igt_display_t display;
> +	igt_plane_t *primary;
> +	igt_output_t *output;
> +	igt_crtc_t *pipe;
> +	igt_pipe_crc_t *pipe_crc;
> +	drmModeModeInfo *mode;
> +	enum pipe pipe_id;

Please avoid using enum pipe and crtc->pipe for anything unless you
actually really *really* need to know the (Intel) hardware pipe.

Further details at [1].

BR,
Jani.



[1] https://lore.kernel.org/r/356099f0d5b2c882460e344869720b92c0da538d@intel.com



> +	int fd;
> +	int w;
> +	int h;
> +} data_t;

-- 
Jani Nikula, Intel
