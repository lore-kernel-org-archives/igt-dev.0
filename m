Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87485C3600B
	for <igt-dev@archiver.kernel.org>; Mon, 31 Mar 2025 14:22:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E2E910E054;
	Mon, 31 Mar 2025 14:22:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ak7kpor3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C0EA10E054
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Mar 2025 14:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743430933; x=1774966933;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=a544JSzp8IS1IWRlwObQs8YQMVvGtn6+SKn3/KaARQQ=;
 b=Ak7kpor3GI96+oFLcrLTneEiYJQQ8kzQy+nq8krIj+vfC2cEbGHM6eKj
 ybAvQDD4l543ROt2rtv8J8rR1fJVDxaD8eppq/9G+/Ecj2r3RQpgh+X2+
 08PTryrazW6wzF6bBuagNOnimiUFcXkRI4TD5sz7y46g79zB9CsjRZXzP
 +fwbbeJ+Htgv2Vwtu7zJ+AeyalkQ9r7LIadpd+kh23gmMsmSxdyZbjmIc
 h3seIex/lwEIVIp1Sxuq7GCa5Qjd0gQ938JMMP9LVfBiBVfxCy/tDbVbC
 FqUlyhEpSCbFPaKz5SXVXiqdx7+hb2yI4NQStG2f5UKjUdKqiJ8Sv54kO w==;
X-CSE-ConnectionGUID: kjO8upYQT1StS5PSBqohdQ==
X-CSE-MsgGUID: FiUsJ6J4RQauGDqrqQG9UQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="47442884"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="47442884"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 07:22:13 -0700
X-CSE-ConnectionGUID: Djv2KVZ+RsyS2iE5z7sXMA==
X-CSE-MsgGUID: WcAZyOUSTtSkAlmhH319Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="157022171"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 07:22:11 -0700
Date: Mon, 31 Mar 2025 16:22:08 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com
Subject: Re: [PATCH v2 i-g-t] man/lsgpu: Add man page for lsgpu
Message-ID: <20250331142208.cdljrk5bel2kmfem@kamilkon-DESK.igk.intel.com>
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

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
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
> 2.43.0
> 
