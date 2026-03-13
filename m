Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2263105F7A2
	for <igt-dev@archiver.kernel.org>; Fri, 13 Mar 2026 12:35:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B0A410EBD7;
	Fri, 13 Mar 2026 12:35:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lg7SpYRQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 017D710EB91
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Mar 2026 12:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773405311; x=1804941311;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=NU9SAuB+AE810a4i7ANexuaRTew4n+CJ6sewub/wqLg=;
 b=Lg7SpYRQ/wDFcH/uJHQQmODlqXIU+JBI5VSQSLVDn9tztlHZO8hWkTQq
 XOjuIUcQ+hWw06U5OhvUKH36KSJBixa74MLt2nPmiUvGq5PuJUXOL0/L7
 kuXuCNmHb37vnyGQwUtYDXt7VDhYWCTZIjl1GBYWyeieW5wxYa1Vo0ZGd
 unTNAEe2A2gB52Oxwri43zoKHy7cC6/ThJJKC9lw46q60yvCn2RL+HH8h
 l9KmSJFM/yIGNWajzgyl9jnyWunu1D2HkuybJ8QWZ8AO6INCQ5YHuxq7t
 0fVfQXN8Tn1byvpIw8nYBdthG7PpqMjofWP38dtUFaXCf7oDB8xVJrxtT g==;
X-CSE-ConnectionGUID: 5egB4Cl4QBK+aj1yFEMbEA==
X-CSE-MsgGUID: pnBO7HGmSdG5LtqkH1l3ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="97121044"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="97121044"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 05:35:04 -0700
X-CSE-ConnectionGUID: IZ7jY0FNRzC0FpjpaW1J3w==
X-CSE-MsgGUID: URXLjVaoSJ+mGtXwjCzX6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="225608845"
Received: from cml-cometlake-client-platform.iind.intel.com ([10.223.55.11])
 by orviesa004.jf.intel.com with ESMTP; 13 Mar 2026 05:35:02 -0700
From: Aditya Chauhan <aditya.chauhan@intel.com>
To: ramadevi.gandi@intel.com, himanshu.girotra@intel.com,
 swati2.sharma@intel.com, kamil.konieczny@intel.com,
 igt-dev@lists.freedesktop.org
Subject: [PATCH v4 i-g-t 1/2] intel-ci: Add NVL core blocklist
Date: Fri, 13 Mar 2026 18:04:58 +0530
Message-Id: <20260313123459.64815-2-aditya.chauhan@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260313123459.64815-1-aditya.chauhan@intel.com>
References: <20260313123459.64815-1-aditya.chauhan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Introduce core blocklist for the NVL platform containing
NVL-specific core test exclusions. Also add this blocklist file
to meson.build so that this can be used in execution.

v2: Make commit message more descriptive (Swati Sharma)
v3:
 - Use correct subject (intel-ci) (Swati Sharma)
 - Add blocklist in alphabetical order in meson.build (Swati Sharma)
v4: Make comments more explanatory (Swati Sharma)

Signed-off-by: Aditya Chauhan <aditya.chauhan@intel.com>
---
 tests/intel-ci/meson.build               |  1 +
 tests/intel-ci/xe.nvl.core.blocklist.txt | 97 ++++++++++++++++++++++++
 2 files changed, 98 insertions(+)
 create mode 100644 tests/intel-ci/xe.nvl.core.blocklist.txt

diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
index cf0023c63..3c7fa28b7 100644
--- a/tests/intel-ci/meson.build
+++ b/tests/intel-ci/meson.build
@@ -23,6 +23,7 @@ intelci_files = [
   'xe.lnl.display.blocklist.txt',
   'xe.lnl.eudebug.blocklist.txt',
   'xe.multigpu.blocklist.txt',
+  'xe.nvl.core.blocklist.txt',
   'xe.ptl.core.blocklist.txt',
   'xe.ptl.display.blocklist.txt',
   'xe.sriov-vf.blocklist.txt',
diff --git a/tests/intel-ci/xe.nvl.core.blocklist.txt b/tests/intel-ci/xe.nvl.core.blocklist.txt
new file mode 100644
index 000000000..0f9750961
--- /dev/null
+++ b/tests/intel-ci/xe.nvl.core.blocklist.txt
@@ -0,0 +1,97 @@
+##################################################################
+# SR-IOV/IOV tests are not applicable for native
+# configuration and will be run under its separate configuration
+##################################################################
+igt@.*iov.*
+##################################################################
+# All Display related tests are being run under
+# separate display configurations
+##################################################################
+igt@.*kms.*
+igt@testdisplay
+igt@xe_pat@display-vs-wb-transient
+igt@fbdev@.*
+##################################################################
+# Valid skip: NVL is an integrated GPU and does not have
+# dedicated VRAM. Tests requiring device-local memory (VRAM),
+# small-BAR configurations, or VRAM eviction are not applicable.
+##################################################################
+igt@xe_mmap@vram$
+igt@xe_mmap@small-bar
+igt@xe_noexec_ping_pong
+igt@xe_create@create-big-vram
+igt@xe_evict.*
+igt@xe_pm@d3hot-mmap-vram
+igt@xe_eudebug_online@writes-caching-(?!sram-bb-sram-target-sram).*
+igt@xe_compute_preempt@.*vram.*
+igt@xe_vm@out-of-memory
+##################################################################
+# Valid skip: PAT index tests targeting older/different platforms
+# These PAT (Page Attribute Table) index subtests validate
+# platform-specific memory attribute encodings that are only
+# defined for their respective GPU generations
+# like ADL, MTL, LNL, BMG, PVC.
+# NVL uses its own PAT encoding; running these tests would
+# produce incorrect results or false failures.
+##################################################################
+igt@xe_pat@pat-index-xehpc
+igt@xe_pat@pat-index-xelp
+igt@xe_pat@pat-index-xelpg
+igt@xe_media_fill@media-fill
+igt@xe_pat@pat-index-xe2
+##################################################################
+# Valid Skip: Tests requiring multiple CCS (Compute Command
+# Streamers) engines — NVL exposes only a single CCS engine.
+##################################################################
+igt@xe_compute@ccs-mode-basic
+igt@xe_compute@ccs-mode-compute-kernel
+igt@xe_compute@eu-busy-10s
+##################################################################
+# Valid skip: Features / hardware blocks not present on NVL
+#   - xe_huc_copy@huc_copy: HuC (HEVC µController) firmware is
+#     not loaded/present on NVL; HuC copy operations will fail.
+#   - xe_exec_balancer@.*: Virtual engine / load balancer tests
+#     require multiple physical engines of the same class for
+#     balancing, which NVL does not expose.
+#   - xe_oa@oa-tlb-invalidate: OA TLB invalidation test relies
+#     on a specific OA unit configuration not present on NVL.
+#   - xe_pxp@.*: PXP (Protected Xe Path) content protection
+#     requires a TEE (Trusted Execution Environment) and
+#     associated firmware, which NVL does not support.
+#   - xe_exec_system_allocator@.*: System allocator execution
+#     tests depend on hardware features (e.g., SVM/USM page
+#     fault handling) not enabled on NVL yet.
+##################################################################
+igt@xe_huc_copy@huc_copy
+igt@xe_exec_balancer@.*
+igt@xe_oa@oa-tlb-invalidate
+igt@xe_pxp@.*
+igt@xe_exec_system_allocator@.*
+##################################################################
+# Valid skip: test applicable only for i2c capable systems
+##################################################################
+igt@xe_pm@d3hot-i2c
+##################################################################
+# Valid skip: multigpu/multitile tests are not supported on NVL
+##################################################################
+igt@.*@.*multigpu.*
+igt@xe_peer2peer@.*
+igt@.*@.*tiles
+##################################################################
+# Valid skip: Not Applicable for iGPUs
+##################################################################
+igt@intel_hwmon@.*
+igt@xe_mmap@pci-membarrier.*
+igt@xe_configfs@survivability-mode
+igt@xe_survivability@.*
+##################################################################
+# Valid skip: EU debugger and SIP (System Interrupt Protocol)
+# support is not yet available in the kernel for NVL. These tests
+# will be re-enabled once the required kernel enablement lands.
+##################################################################
+igt@xe_eudebug@.*
+igt@xe_eudebug_online@.*
+igt@xe_exec_sip@.*
+igt@xe_exec_sip_eudebug@.*
+igt@xe_live_ktest@xe_eudebug
+##################################################################
-- 
2.34.1

