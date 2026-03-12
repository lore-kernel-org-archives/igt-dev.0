Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F276DFED2FF
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 10:22:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA1B110E9CF;
	Thu, 12 Mar 2026 10:22:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kJeyWsFu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 182E210E1D7
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 10:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773310926; x=1804846926;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=OaNWBdiFysdajyhOlEtQmrvdQ3SYV8Eyq7+EzKsjZ00=;
 b=kJeyWsFuoXc+1blMX984RwME0AcpyoqHEYNkhVdSvzheCKjpmy0iecQ5
 Y8SANd1KGxVJ45d4e92OQnPStpGXsPG1a1mLHKJxh5bL/GTR3XCrPCiI9
 Nee+l6OBGvWGtNJYoEv22cPayEukScHwqtb9ZYQrhd2uvaD4GZdnhdn2O
 BfDUUMPbvxMnpWJBuHUDtZ1wH7YecM0e7/4+a1f5sai2Lg+OZCVLfmdT0
 91zN/6jIkQa3a1t1pKCPja/CDj2SnX8AlZD8CWQHLPFdpNOjFfg0Br8Gk
 GaRDysNgNO0ZWZ2Q/G5zcNC0WBMS2NI9siN6HvnG5Efna8JhMh3BUxrb4 g==;
X-CSE-ConnectionGUID: Q1sL7AS9Qo+Re2ZLpwF4Wg==
X-CSE-MsgGUID: 1QDMyYK0Q9Sw3M3h5t4N6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74310493"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="74310493"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 03:22:06 -0700
X-CSE-ConnectionGUID: Wa5/7ZZwTOKajHpbdNSR5w==
X-CSE-MsgGUID: wRQog0Y4SfuLP8EgXATRmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="246181016"
Received: from cml-cometlake-client-platform.iind.intel.com ([10.223.55.11])
 by fmviesa001.fm.intel.com with ESMTP; 12 Mar 2026 03:22:04 -0700
From: Aditya Chauhan <aditya.chauhan@intel.com>
To: ramadevi.gandi@intel.com, himanshu.girotra@intel.com,
 swati2.sharma@intel.com, kamil.konieczny@intel.com,
 igt-dev@lists.freedesktop.org
Subject: [PATCH v3 i-g-t 1/2] intel-ci: Add NVL core blocklist
Date: Thu, 12 Mar 2026 15:52:00 +0530
Message-Id: <20260312102201.53909-2-aditya.chauhan@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260312102201.53909-1-aditya.chauhan@intel.com>
References: <20260312102201.53909-1-aditya.chauhan@intel.com>
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

Introduce core blocklist for the NVL platform containing
NVL-specific core test exclusions. Also add this blocklist file
to meson.build so that this can be used in execution.

v2: Make commit message more descriptive (Swati Sharma)
V3: Make comments more descriptive for blocklisted tests,
use correct subject(intel-ci) and add blocklist in alphabetical
order in meson.build(Swati Sharma)

Signed-off-by: Aditya Chauhan <aditya.chauhan@intel.com>
---
 tests/intel-ci/meson.build               |  1 +
 tests/intel-ci/xe.nvl.core.blocklist.txt | 69 ++++++++++++++++++++++++
 2 files changed, 70 insertions(+)
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
index 000000000..aee1edd15
--- /dev/null
+++ b/tests/intel-ci/xe.nvl.core.blocklist.txt
@@ -0,0 +1,69 @@
+##################################################################
+# Valid Skip: Tests NA for Native
+##################################################################
+igt@.*iov.*
+##################################################################
+# KMS - Display related tests
+# Other Display specific tests
+##################################################################
+igt@.*kms.*
+igt@testdisplay
+igt@xe_pat@display-vs-wb-transient
+igt@fbdev@.*
+##################################################################
+# Valid skip: Integrated GPU has no vram
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
+# Valid skip: Tests are expected to run
+# only on older platforms
+##################################################################
+igt@xe_pat@pat-index-xe3p-xpc
+igt@xe_pat@pat-index-xehpc
+igt@xe_pat@pat-index-xelp
+igt@xe_pat@pat-index-xelpg
+igt@xe_media_fill@media-fill
+igt@xe_pat@pat-index-xe2
+##################################################################
+# Valid skip: Tests need more than one CCS engine
+# which is not the case with NVL
+##################################################################
+igt@xe_compute@ccs-mode-basic
+igt@xe_compute@ccs-mode-compute-kernel
+igt@xe_compute@eu-busy-10s
+##################################################################
+# Valid skip: Not supported on NVL
+##################################################################
+igt@xe_huc_copy@huc_copy
+igt@xe_exec_balancer@.*
+igt@.*@.*tiles
+igt@xe_oa@oa-tlb-invalidate
+igt@xe_pxp@.*
+igt@xe_exec_system_allocator@.*
+##################################################################
+# Valid skip: Not Applicable for integrated platforms
+##################################################################
+igt@intel_hwmon@.*
+igt@.*@.*multigpu.*
+igt@xe_peer2peer@.*
+igt@xe_mmap@pci-membarrier.*
+igt@xe_pm@d3hot-i2c
+igt@xe_configfs@survivability-mode
+igt@xe_survivability@.*
+##################################################################
+# Valid skip: Kernel support not available yet
+##################################################################
+igt@xe_eudebug@.*
+igt@xe_eudebug_online@.*
+igt@xe_exec_sip@.*
+igt@xe_exec_sip_eudebug@.*
+igt@xe_live_ktest@xe_eudebug
+##################################################################
\ No newline at end of file
-- 
2.34.1

