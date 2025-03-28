Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F28C36011
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 14:28:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C8310EA3D;
	Fri, 28 Mar 2025 14:28:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MJZotCuC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0AB310EA3D
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 14:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743172106; x=1774708106;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=AhEJWz3EVirJOGpiW3z3NDhMC5D7iNV1aX1HdTjOOVM=;
 b=MJZotCuCAQ2MwIUq1C/INNQWbEc3b2r+z9R0fW/ZyfyIMKWKLhr4hpvy
 mb4G52Tu9QwNoUhSD0riQ0+B/gNdnRQLmFG7e9HCuXvXMNTMp1mr3n+JF
 EUvgrVcEKsj6vrNlKIyP7cyaloo1OyH0OpET8riS4VLnIFbN2c3bCE5Iz
 vRR+UmticQuCfSpNndutrTJ11ivYg1DmozsHcPX4w6PRUyAY7V6irdE42
 FPSwKswJlFTr9+9e3sUBPQVIKVMl4VtXUqOqeeM5lWq4PrrQkN3NF9BmS
 q14HQn7mpPiIatIdNtaIUq25EZh6SJE/cZEaNTgwWMdBv/Ij8EOOA8MMY g==;
X-CSE-ConnectionGUID: E4f7tzowTS2Ll95TiyUbWw==
X-CSE-MsgGUID: CUxdR5HUQ+qyKU0MDK2XMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="43691311"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="43691311"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 07:28:25 -0700
X-CSE-ConnectionGUID: 90eY2i5XTPaMwnLXmeElqg==
X-CSE-MsgGUID: V9yrY8sLSLSWkZcDTxAc7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="156393734"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 07:28:24 -0700
Date: Fri, 28 Mar 2025 15:28:21 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t] man/lsgpu: Add man page for lsgpu
Message-ID: <20250328142821.brica7hjyky6lmuy@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20250327110616.59257-1-peter.senna@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250327110616.59257-1-peter.senna@linux.intel.com>
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
On 2025-03-27 at 12:06:16 +0100, Peter Senna Tschudin wrote:
> Adds a man page for lsgpu.

This looks good but it has an error seen in compilation
and later on with view. I checked it with:

meson -Dman=enabled build
ninja -C build

man/lsgpu.rst:2: (WARNING/2) Explicit markup ends without a blank line; unexpected unindent.

man -l build/man/lsgpu*gz

Please fix it (see below) and send v2.

> 

+cc Zbigniew

Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>

> Cc: kamil.konieczny@linux.intel.com
> Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/172
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> ---
>  man/lsgpu.rst   | 88 +++++++++++++++++++++++++++++++++++++++++++++++++
>  man/meson.build |  1 +
>  2 files changed, 89 insertions(+)
>  create mode 100644 man/lsgpu.rst
> 
> diff --git a/man/lsgpu.rst b/man/lsgpu.rst
> new file mode 100644
> index 000000000..d67437fc3
> --- /dev/null
> +++ b/man/lsgpu.rst
> @@ -0,0 +1,88 @@
> +.. SPDX-License-Identifier: MIT

Add one empty line here, this should fix it.

Regards,
Kamil

PS. Please update your git to some recent version, 2.34.1 looks old
compared to 2.49.0

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
> +By default, **lsgpu** displays a list of GPUs along with basic details. The tool supports additional options to print detailed properties and sysfs attributes, apply filters to select specific devices, and verify access permissions to GPU nodes.
> +
> +Filtering can be performed using the -d or --device option, allowing users to match GPUs based on vendor, PCI attributes, or other criteria. When a filter is applied, only the first matching device is displayed.
> +
> +Additionally, **lsgpu** attempts to open the corresponding DRM device nodes (/dev/dri/cardX, /dev/dri/renderDX) to check for access permissions. It follows the IGT variable search order for selecting the target device:
> +
> +1. The **--device** option, if provided
> +2. The **IGT_DEVICE** environment variable, if set
> +3. The **.igtrc** configuration file (Common::Device setting), if neither of the above is specified
> +
> +OPTIONS
> +=======
> +
> +-h, --help
> +    Show help text.
> +
> +-n, --numeric
> +    Print vendor/device as hex
> +
> +-c, --codename
> +    Print codename instead pretty device name
> +
> +-s, --print-simple
> +    Print simple (legacy) device details
> +
> +-p, --print-details
> +    Print devices with details
> +
> +-P, --pci-scan
> +    Print PCI GPU devices
> +
> +-v, --list-vendors
> +    List recognized vendors
> +
> +-l, --list-filter-types
> +    List registered device filters types
> +
> +-d, --device <filter>
> +    Apply a device filter (e.g. 'pci:vendor=Intel,device=discrete,card=0'). Can be used multiple times.
> +
> +-V, --version
> +    Print version information and exit
> +
> +Default print mode options
> +--------------------------
> +
> +These options are only valid when using the default printout mode:
> +
> +--drm
> +    Default: Print DRM filters for each device
> +
> +--sysfs
> +    Print sysfs filters for each device
> +
> +--pci
> +    Print PCI filters for each device
> +
> +
> +REPORTING BUGS
> +==============
> +
> +Report bugs on fd.o GitLab: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues
> diff --git a/man/meson.build b/man/meson.build
> index 00264a21f..5c976c5d0 100644
> --- a/man/meson.build
> +++ b/man/meson.build
> @@ -17,6 +17,7 @@ manpages = [
>  	'intel_upload_blit_large_map',
>  	'intel_upload_blit_small',
>  	'intel_vbt_decode',
> +	'lsgpu',
>  ]
>  
>  defs_rst = configure_file(input : 'defs.rst.in',
> -- 
> 2.34.1
> 
