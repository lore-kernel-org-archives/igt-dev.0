Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05767C36008
	for <igt-dev@archiver.kernel.org>; Sat, 29 Mar 2025 14:36:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9421B10E251;
	Sat, 29 Mar 2025 14:36:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U7msatiF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E03C10E251
 for <igt-dev@lists.freedesktop.org>; Sat, 29 Mar 2025 14:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743259001; x=1774795001;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4Sml6ONPFa8uSbwTjyYfbMgvOCSNO1B5CsIqZtCykOs=;
 b=U7msatiF4nquT6yu3F42fU2ba0Zi8nK9zkyCKDiPa9WMDXXEF26UHCAn
 hCvtVjL289Zo28fafwhkehivF+63yBY7y3YbQ9hMeHGJoRshQssWTQyDa
 g2asB9tjqKPwyIq4blonlW8LZD6ON3cIWWn64MwtCTFxrU+WcEGnVEm9o
 ksQesZr4IvbXh4brVcbSgkv05hvcRwG25UojmHwDu8GuVtpyJqOkFOw+b
 dae4eD/EkEfNO4BRXgTGQwQwTCPraUu/+BBry/laWXxuJM4P06ytT5jso
 EoE+dqecqmm4LUidzD/NEhYP32iDdAHbuzbEKgEgvz76VXiCjDBguR8+N w==;
X-CSE-ConnectionGUID: Q6EqFxyNSF+P0xiiLdjW1w==
X-CSE-MsgGUID: S+6FbAS2S/CC+IK16K7DBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11388"; a="55265969"
X-IronPort-AV: E=Sophos;i="6.14,286,1736841600"; d="scan'208";a="55265969"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2025 07:36:40 -0700
X-CSE-ConnectionGUID: gViC6KlkR4e7P472sithDw==
X-CSE-MsgGUID: +Z7+qXqgQ5yWMeyU4nV/TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,286,1736841600"; d="scan'208";a="126606857"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.118.0])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2025 07:36:39 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 zbigniew.kempczynski@intel.com, kamil.konieczny@linux.intel.com
Subject: [PATCH v2 i-g-t] man/lsgpu: Add man page for lsgpu
Date: Sat, 29 Mar 2025 15:36:06 +0100
Message-ID: <20250329143607.33723-1-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Add man page for lsgpu.

Cc: zbigniew.kempczynski@intel.com
Cc: kamil.konieczny@linux.intel.com
Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/172
Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---

v2:
 - Adds a newline after the SPDX identifier line
 - Adds Zbigniew Kempczyński to Cc list

 man/lsgpu.rst   | 89 +++++++++++++++++++++++++++++++++++++++++++++++++
 man/meson.build |  1 +
 2 files changed, 90 insertions(+)
 create mode 100644 man/lsgpu.rst

diff --git a/man/lsgpu.rst b/man/lsgpu.rst
new file mode 100644
index 000000000..a6dbec918
--- /dev/null
+++ b/man/lsgpu.rst
@@ -0,0 +1,89 @@
+.. SPDX-License-Identifier: MIT
+
+=====
+lsgpu
+=====
+
+-------------------------------------------------------------
+List and inspect GPUs by scanning the PCI bus, DRM, and sysfs
+-------------------------------------------------------------
+.. include:: defs.rst
+:Author: IGT Developers <igt-dev@lists.freedesktop.org>
+:Date: 2025-03-27
+:Version: |PACKAGE_STRING|
+:Copyright: 2009,2011,2012,2016,2018,2019,2020,2023,2024,2025 Intel Corporation
+:Manual section: |MANUAL_SECTION|
+:Manual group: |MANUAL_GROUP|
+
+SYNOPSIS
+========
+
+**lsgpu** [*OPTIONS*]
+
+DESCRIPTION
+===========
+
+**lsgpu** is part of the **igt-gpu-tools** suite, and it is designed to assist in GPU enumeration and debugging. **lsgpu**  is a command-line tool for listing and inspecting GPUs available on the system. It scans the PCI bus, DRM subsystem, and sysfs to gather information about detected GPU devices and their properties.
+
+By default, **lsgpu** displays a list of GPUs along with basic details. The tool supports additional options to print detailed properties and sysfs attributes, apply filters to select specific devices, and verify access permissions to GPU nodes.
+
+Filtering can be performed using the -d or --device option, allowing users to match GPUs based on vendor, PCI attributes, or other criteria. When a filter is applied, only the first matching device is displayed.
+
+Additionally, **lsgpu** attempts to open the corresponding DRM device nodes (/dev/dri/cardX, /dev/dri/renderDX) to check for access permissions. It follows the IGT variable search order for selecting the target device:
+
+1. The **--device** option, if provided
+2. The **IGT_DEVICE** environment variable, if set
+3. The **.igtrc** configuration file (Common::Device setting), if neither of the above is specified
+
+OPTIONS
+=======
+
+-h, --help
+    Show help text.
+
+-n, --numeric
+    Print vendor/device as hex
+
+-c, --codename
+    Print codename instead pretty device name
+
+-s, --print-simple
+    Print simple (legacy) device details
+
+-p, --print-details
+    Print devices with details
+
+-P, --pci-scan
+    Print PCI GPU devices
+
+-v, --list-vendors
+    List recognized vendors
+
+-l, --list-filter-types
+    List registered device filters types
+
+-d, --device <filter>
+    Apply a device filter (e.g. 'pci:vendor=Intel,device=discrete,card=0'). Can be used multiple times.
+
+-V, --version
+    Print version information and exit
+
+Default print mode options
+--------------------------
+
+These options are only valid when using the default printout mode:
+
+--drm
+    Default: Print DRM filters for each device
+
+--sysfs
+    Print sysfs filters for each device
+
+--pci
+    Print PCI filters for each device
+
+
+REPORTING BUGS
+==============
+
+Report bugs on fd.o GitLab: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues
diff --git a/man/meson.build b/man/meson.build
index 00264a21f..5c976c5d0 100644
--- a/man/meson.build
+++ b/man/meson.build
@@ -17,6 +17,7 @@ manpages = [
 	'intel_upload_blit_large_map',
 	'intel_upload_blit_small',
 	'intel_vbt_decode',
+	'lsgpu',
 ]
 
 defs_rst = configure_file(input : 'defs.rst.in',
-- 
2.43.0

