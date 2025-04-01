Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A5D7C36014
	for <igt-dev@archiver.kernel.org>; Tue,  1 Apr 2025 12:37:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C107410E599;
	Tue,  1 Apr 2025 12:37:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cALRuUOA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0C0C10E5AF
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Apr 2025 12:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743511042; x=1775047042;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=GagsfERzpPkgzJewiypFf/bzinsH/tWOCvlAmQgxmSU=;
 b=cALRuUOAI42dz+V6OXFuy2izhj7Iia/QsRENiUyDVT54Wao1aNojMYJx
 JzbKTpQHsRsRjlBGmK01sN9zWWMVpSqAPfe5gprWi9veLofV4ZMl+3lCy
 hRxXQfDtDjvxo868BdOVjbYhIH42u4cKSeyK98/JBdOfh743S//57G71S
 iS5awu9Tvl3FFvGVXBnLlbtRHNcoSszxmyhLCPkTu7Zm0z+6JxoVVolpe
 GMe2PXI4Hrbi5HuKKFx2PSFZCPv+51WV2UMbZxsmRszH1Nbmjb7qTBgNg
 lBSZeAPLnnK0rWpKTajJx+At4WDwHIQISbNRPo9oZ5PXgmdesTaVcLOim A==;
X-CSE-ConnectionGUID: iNl2LzgPR4iehqqdwLCoFA==
X-CSE-MsgGUID: nAnQwGMpTkaXDNkQHZHL0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="44543236"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="44543236"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 05:37:22 -0700
X-CSE-ConnectionGUID: E49s35sqT+e98bCHu7bp5Q==
X-CSE-MsgGUID: EGLYfK2iRn+FojIgdAcI0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="131096772"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 05:37:21 -0700
Date: Tue, 1 Apr 2025 14:37:07 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com
Subject: Re: [PATCH v2 i-g-t] man/lsgpu: Add man page for lsgpu
Message-ID: <20250401123707.kek7fya7sjym452k@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com
References: <20250329143607.33723-1-peter.senna@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250329143607.33723-1-peter.senna@linux.intel.com>
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

Hi Peter,
On 2025-03-29 at 15:36:06 +0100, Peter Senna Tschudin wrote:
> Add man page for lsgpu.
> 
> Cc: zbigniew.kempczynski@intel.com
> Cc: kamil.konieczny@linux.intel.com
> Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/172
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> ---

Applied, thank you!

Regards,
Kamil

> 
> v2:
>  - Adds a newline after the SPDX identifier line
>  - Adds Zbigniew Kempczyński to Cc list
> 
>  man/lsgpu.rst   | 89 +++++++++++++++++++++++++++++++++++++++++++++++++
>  man/meson.build |  1 +
>  2 files changed, 90 insertions(+)
>  create mode 100644 man/lsgpu.rst
> 
> diff --git a/man/lsgpu.rst b/man/lsgpu.rst
> new file mode 100644
> index 000000000..a6dbec918
> --- /dev/null
> +++ b/man/lsgpu.rst
> @@ -0,0 +1,89 @@
> +.. SPDX-License-Identifier: MIT
> +
> +=====
> +lsgpu
> +=====
> +
> +-------------------------------------------------------------
> +List and inspect GPUs by scanning the PCI bus, DRM, and sysfs
> +-------------------------------------------------------------
> +.. include:: defs.rst
> +:Author: IGT Developers <igt-dev@lists.freedesktop.org>
> +:Date: 2025-03-27
> +:Version: |PACKAGE_STRING|
> +:Copyright: 2009,2011,2012,2016,2018,2019,2020,2023,2024,2025 Intel Corporation
> +:Manual section: |MANUAL_SECTION|
> +:Manual group: |MANUAL_GROUP|
> +
> +SYNOPSIS
> +========
> +
> +**lsgpu** [*OPTIONS*]
> +
> +DESCRIPTION
> +===========
> +
> +**lsgpu** is part of the **igt-gpu-tools** suite, and it is designed to assist in GPU enumeration and debugging. **lsgpu**  is a command-line tool for listing and inspecting GPUs available on the system. It scans the PCI bus, DRM subsystem, and sysfs to gather information about detected GPU devices and their properties.
> +
[...cut...]
