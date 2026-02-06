Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A7FECD9AA
	for <igt-dev@archiver.kernel.org>; Fri,  6 Feb 2026 01:06:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9380810E211;
	Fri,  6 Feb 2026 01:06:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sid/zVzC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57A0D10E211
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Feb 2026 01:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770339972; x=1801875972;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bttpDkcHCXZIY2bIpK9ursPlHODy8lvs+7yfEZdzyLY=;
 b=Sid/zVzC/Tz2kRF+lj8+4oBYBf5gtZYbG9G5zaR/75enFDayMhMWeJXP
 sAzf9se0+xchvurmLSLiK7ukLSYpnA4UHZPPDKXMJBzTeTVvHY+jFINdK
 +ZJVZWcE60idg9ZpFbVAVN3x7M0F/tqRYYW0/DwZ56UHHgKv5NYfWZKfn
 eBgTBccM4Wp5hZE/Vz0Ei0wNu1Uuk2h7GjwT7AAV3aVuzmW62ccQWF7Ga
 Vt1PgTJA8RWHb2OnDQyRhEqW2BeCtM0+Kdu9NlUOm1xH1HypJq2RFGVxL
 wRoUJe0LHwCLOcCDCNba35f2yvfPZZ59jtukdR+tifEgAOBjBppNcvcOV w==;
X-CSE-ConnectionGUID: T6VSIGGJRdCoPTf4KuoPvA==
X-CSE-MsgGUID: nfwUE/OdQZOI5QYHLDNo1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="82919042"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="82919042"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 17:06:12 -0800
X-CSE-ConnectionGUID: +nUfCfCyRpWXGmwx+hNBLg==
X-CSE-MsgGUID: 7uh9Uc6nTUKvBBtDcaTSuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="215223738"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.188])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 17:06:11 -0800
From: Pawel Sikora <pawel.sikora@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH i-g-t v1 3/4] docs: add API Reference user docs
Date: Fri,  6 Feb 2026 02:05:50 +0100
Message-ID: <20260206010551.267237-4-pawel.sikora@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260206010551.267237-1-pawel.sikora@intel.com>
References: <20260206010551.267237-1-pawel.sikora@intel.com>
MIME-Version: 1.0
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

Add docs/api_reference.md for the main API Reference page
to inform users about the generated API reference.

Add docs/api_tests_glossary.md to complement information
about tests for a given vendor/module.

Signed-off-by: Pawel Sikora <pawel.sikora@intel.com>
---
 docs/api_reference.md      | 114 +++++++++++++++++++++++++++++++++++++
 docs/api_tests_glossary.md |   5 ++
 mkdocs.yml                 |   2 +-
 3 files changed, 120 insertions(+), 1 deletion(-)
 create mode 100644 docs/api_reference.md
 create mode 100644 docs/api_tests_glossary.md

diff --git a/docs/api_reference.md b/docs/api_reference.md
new file mode 100644
index 000000000..56cf8ccf9
--- /dev/null
+++ b/docs/api_reference.md
@@ -0,0 +1,114 @@
+# igt-gpu-tools API Reference Manual
+
+!!! info "for igt-gpu-tools version '<IGT_GPU_TOOLS_VERSION>'"
+
+For library API reference see: [API igt-lib](igt-lib/files.md)
+
+For tests API reference see: [API igt-tests](igt-tests/files.md)
+
+For tests glossary see: [Tests Glossary](api_tests_glossary.md)
+
+Below you can find links to specific topics in either **igt-lib** or **igt-tests** API reference.
+
+## igt/Xe API Reference
+
+[DMABUF Sync File](../igt-lib/dmabuf__sync__file_8c/index.html) - DMABUF importing/exporting fencing support library
+
+[drmtest](../igt-lib/drmtest_8c/index.html) - Base library for drm tests and tools
+
+[ALSA](../igt-lib/igt__alsa_8c/index.html) - Library with ALSA helpers
+
+[Audio](../igt-lib/igt__audio_8c/index.html) - Library for audio-related tests
+
+[aux](../igt-lib/igt__aux_8c/index.html) - Auxiliary libraries and support functions
+
+[Chamelium](../igt-lib/igt__chamelium_8c/index.html) - Library for using the Chamelium into igt tests
+
+[Collection](../igt-lib/igt__collection_8c/index.html) - Generic combinatorics library
+
+[Core](../igt-lib/igt__core_8c/index.html) - Core i-g-t testing support
+
+[CRC](../igt-lib/igt__crc_8c/index.html) - igt crc tables and calculation functions
+
+[debugfs](../igt-lib/igt__debugfs_8c/index.html) - Support code for debugfs features
+
+[igt_device](../igt-lib/igt__device_8c/index.html) - igt_device
+
+[Device selection](../igt-lib/igt__device__scan_8c/index.html) - Device scanning and selection
+
+[Draw](../igt-lib/igt__draw_8c/index.html) - drawing helpers for tests
+
+[Dummyload](../igt-lib/igt__dummyload_8c/index.html) - Library for submitting GPU workloads
+
+[Framebuffer](../igt-lib/igt__fb_8c/index.html) - Framebuffer handling and drawing library
+
+[Frame](../igt-lib/igt__frame_8c/index.html) - Library for frame-related tests
+
+[fs](../igt-lib/igt__fs_8c/index.html) - Helpers for file operations
+
+[GT](../igt-lib/igt__gt_8c/index.html) - GT support library
+
+[Hook support](../igt-lib/igt__hook_8c/index.html) - Support for running a hook script on test execution
+
+[kmod](../igt-lib/igt__kmod_8c/index.html) - Wrappers around libkmod for module loading/unloading
+
+[KMS](../igt-lib/igt__kms_8c/index.html) - Kernel modesetting support library
+
+[IGT List](../igt-lib/igt__list_8c/index.html) - a list implementation inspired by the kernel
+
+[IGT Map](../igt-lib/igt__map_8c/index.html) - a linear-reprobing hashmap implementation
+
+[msm](../igt-lib/igt__msm_8c/index.html) - msm support library
+
+[pipe_crc](../igt-lib/igt__pipe__crc_8c/index.html) - Pipe CRC support
+
+[Power Management](../igt-lib/igt__power_8c/index.html) - Power Management related helpers
+
+[Primes](../igt-lib/igt__primes_8c/index.html) - Prime numbers helper library
+
+[Random](../igt-lib/igt__rand_8c/index.html) - Random numbers helper library
+
+[Stats](../igt-lib/igt__stats_8c/index.html) - Tools for statistical analysis
+
+[syncobj](../igt-lib/igt__syncobj_8c/index.html) - Library with syncobj helpers
+
+[sysfs](../igt-lib/igt__sysfs_8c/index.html) - Support code for sysfs features
+
+[VC4](../igt-lib/igt__vc4_8c/index.html) - VC4 support library
+
+[VGEM](../igt-lib/igt__vgem_8c/index.html) - VGEM support library
+
+[x86](../igt-lib/igt__x86_8c/index.html) - x86 helper library
+
+[Intel allocator](../igt-lib/intel__allocator_8c/index.html) - igt implementation of allocator
+
+[Batch Buffer](../igt-lib/intel__batchbuffer_8c/index.html) - Batchbuffer and blitter support
+
+[Buffer operations](../igt-lib/intel__bufops_8c/index.html) - Buffer operation on tiled surfaces
+
+[Chipset](../igt-lib/intel__chipset_8c/index.html) - Feature macros and chipset helpers
+
+[I/O](../igt-lib/intel__mmio_8c/index.html) - Register access and sideband I/O library
+
+[ioctl wrappers](../igt-lib/ioctl__wrappers_8c/index.html) - ioctl wrappers and related functions
+
+[SW Sync](../igt-lib/sw__sync_8c/index.html) - Software sync (fencing) support library
+
+## igt/i915 API Reference
+
+[GEM Create](../igt-lib/gem_8c/index.html) - Helpers for dealing with objects creation
+
+[GEM Context](../igt-lib/gem__context_8c/index.html) - Helpers for dealing with contexts
+
+[GEM Engine Topology](../igt-lib/gem__engine__topology_8c/index.html) - Helpers for dealing engine topology
+
+[GEM Scheduler](../igt-lib/gem__scheduler_8c/index.html) - Helpers for querying scheduler capabilities
+
+[GEM Submission](../igt-lib/gem__submission_8c/index.html) - Helpers for determining submission method
+
+[Blitter library](../igt-lib/intel__blt_8c/index.html) - i915/xe blitter library
+
+[I915 GPU CRC](../igt-lib/i915__crc_8c/index.html) - i915 gpu crc
+
+[Intel Context Wrapper](../igt-lib/intel__ctx_8c/index.html) - Wrapper structs for dealing with contexts
+
diff --git a/docs/api_tests_glossary.md b/docs/api_tests_glossary.md
new file mode 100644
index 000000000..a87c2b5b4
--- /dev/null
+++ b/docs/api_tests_glossary.md
@@ -0,0 +1,5 @@
+# API Reference - Tests glossary
+
+Below you can find up-to-date list of tests with their descriptions.
+
+For full reference and source code please look into [API Reference - Tests - Files](../igt-tests/files/index.html)
diff --git a/mkdocs.yml b/mkdocs.yml
index f511aeb95..62da23158 100644
--- a/mkdocs.yml
+++ b/mkdocs.yml
@@ -41,7 +41,6 @@ nav:
     - Links to CI for a specific HW platform:
       - Intel GFX CI: https://intel-gfx-ci.01.org
   - Download: 'download.md'
-  - API Reference: 'api_reference/index.html'
   - News: 'NEWS.md'
   - FAQ: 'faq.md'
   - API:
@@ -90,6 +89,7 @@ nav:
       - Variables: "igt-lib/variables.md"
       - Macros: "igt-lib/macros.md"
       - Files: "igt-lib/files.md"
+    - Tests Glossary: 'api_tests_glossary.md'
 
 extra:
   repo_icon: 'gitlab'
-- 
2.51.0

