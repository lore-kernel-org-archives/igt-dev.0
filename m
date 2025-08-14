Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC5E5CA0EDC
	for <igt-dev@archiver.kernel.org>; Thu, 14 Aug 2025 11:02:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6293410E841;
	Thu, 14 Aug 2025 11:02:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gRYKOkA7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B72E210E841
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Aug 2025 11:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755169354; x=1786705354;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=SAlJEcHfW1BG8SwtzmE/pdKzhmqb+2Ohsi5Cpsa1LAg=;
 b=gRYKOkA7dZaxDI85nt9FuJmntbKtpO4iuzZrjRr+ioLL3sTZrYibgIty
 wYJRs2lW3UzR3NhncUOrEoqv7EVpKeIpzwFQRgbtmdKp1lOBXxSFgufmQ
 wwcNfkCmfMuYkewVmVDdkzREj3CanMsudcxprxcICSBONA+mf8AnxrhDN
 EmahMwnfBhFgzvdPgOAABHKsiVrksOsV0acut6mu4WjXFMWRi4KK/y/g+
 bSBVc2W8v3cpDJrzDFSKO06bHvQbmb7bJ7w6XzF0Mm+j2DgXuRjge005X
 gqIeRCEup1y6vxF41fr5ejvB9hsUEOvvAou3QMN9GCp03QtBzqwQUl3B8 g==;
X-CSE-ConnectionGUID: g4FdEm0SQDCwaKBISGVS2g==
X-CSE-MsgGUID: WD5JiDTiS/yFMLNVnEOrvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="45058877"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="45058877"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 04:02:33 -0700
X-CSE-ConnectionGUID: 13jhui2DTvWq1nKsIBSL6w==
X-CSE-MsgGUID: 7izwcyCMQVeussq+BxTHVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="170939493"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 04:02:32 -0700
Date: Thu, 14 Aug 2025 13:02:15 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/4] lib/intel_compute_krn_sip: separate sip from
 the shaders
Message-ID: <20250814110215.b6zzx4btjwykof2l@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250813082502.371493-6-zbigniew.kempczynski@intel.com>
 <20250813123304.456124-2-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250813123304.456124-2-zbigniew.kempczynski@intel.com>
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

Hi Zbigniew,
On 2025-08-13 at 14:33:05 +0200, Zbigniew Kempczyński wrote:
> SIP in hex form are quite big and keeping them with smaller shaders
> makes navigation harder. Lets separate them to keep shaders code
> clearer.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/intel_compute_krn_sip.h        | 5051 ++++++++++++++++++++++
>  lib/intel_compute_square_kernels.c | 6236 +---------------------------
>  2 files changed, 5054 insertions(+), 6233 deletions(-)
>  create mode 100644 lib/intel_compute_krn_sip.h
> 
> diff --git a/lib/intel_compute_krn_sip.h b/lib/intel_compute_krn_sip.h
> new file mode 100644
> index 0000000000..35c2b4f1a9
> --- /dev/null
> +++ b/lib/intel_compute_krn_sip.h
> @@ -0,0 +1,5051 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef __INTEL_COMPUTE_KRN_SIP_H__
> +#define __INTEL_COMPUTE_KRN_SIP_H__
> +
> +#if !defined INTEL_COMPUTE_KRN_COMPILE_GUARD
> +#error "Header designed to be included in compute kernels file"
> +#endif
> +
> +static const unsigned char xe2lpg_kernel_sip_bin[] = {
[cut]
