Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ACF91062884
	for <igt-dev@archiver.kernel.org>; Wed, 11 Mar 2026 12:26:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 500BE10E1C8;
	Wed, 11 Mar 2026 12:26:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mjg4zzGT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDD2D10E116
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2026 12:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773231971; x=1804767971;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=mNUH+yTWaGdHGEw7/OjygcXYcBQ7ty5OKor08g/LKbo=;
 b=Mjg4zzGT6y0RaeCoT16sOnh4dwz6vvEx8zqSbgEzUksijv0+QS3ZvrPx
 hATNV6qI8V8XsixZFckClAahHtQNaLuRgz1REnvG6bhpUf6RLRISb+kuq
 83VlTo+W5AgqSnSr6pQlEdYVNrtfM70hM7S1Y1VpZCq/7yFpKtyatwP6O
 DOrQumb1K/ES/iJAw4dZ5/9vmhMbAtxiGsXlK42oJzHluJ8X97RuuSVIQ
 JKiiB/440K94qn6kwkT5DHSbcycq07SymxJ+xu5P8Swn4DDBKuC0a+muj
 wld1fGA6Jlj7bz7iAeBYFdc4Ed/8sJasbCMiX3v1/jDVz2+pjOD0AgCB+ Q==;
X-CSE-ConnectionGUID: gRZput0XSye6X9Zixnembw==
X-CSE-MsgGUID: v5Ndek6LQm+4xGURfslxwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74335540"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="74335540"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 05:26:11 -0700
X-CSE-ConnectionGUID: /m21PdD0S4y7MI3T2S4qLg==
X-CSE-MsgGUID: gSljWKh0R2+/2DLm9F0QEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="225148289"
Received: from cml-cometlake-client-platform.iind.intel.com ([10.223.55.11])
 by fmviesa005.fm.intel.com with ESMTP; 11 Mar 2026 05:26:09 -0700
From: aditya.chauhan@intel.com
To: ramadevi.gandi@intel.com, himanshu.girotra@intel.com,
 swati2.sharma@intel.com, igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 1/2] tests/intel-ci: Add NVL core blocklist
Date: Wed, 11 Mar 2026 17:56:05 +0530
Message-Id: <20260311122606.42223-2-aditya.chauhan@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260311122606.42223-1-aditya.chauhan@intel.com>
References: <20260311122606.42223-1-aditya.chauhan@intel.com>
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

From: Aditya Chauhan <aditya.chauhan@intel.com>

- Add xe.nvl.core.blocklist file to intel-ci
- Update meson.build

Signed-off-by: Aditya Chauhan <aditya.chauhan@intel.com>
---
 tests/intel-ci/meson.build               |  1 +
 tests/intel-ci/xe.nvl.core.blocklist.txt | 69 ++++++++++++++++++++++++
 2 files changed, 70 insertions(+)
 create mode 100644 tests/intel-ci/xe.nvl.core.blocklist.txt

diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
index cf0023c63..a1e9dff55 100644
--- a/tests/intel-ci/meson.build
+++ b/tests/intel-ci/meson.build
@@ -25,6 +25,7 @@ intelci_files = [
   'xe.multigpu.blocklist.txt',
   'xe.ptl.core.blocklist.txt',
   'xe.ptl.display.blocklist.txt',
+  'xe.nvl.core.blocklist.txt',
   'xe.sriov-vf.blocklist.txt',
   'xe-sriov-vf.blocklist.txt',
   'xe.sriov-vm.blocklist.txt',
diff --git a/tests/intel-ci/xe.nvl.core.blocklist.txt b/tests/intel-ci/xe.nvl.core.blocklist.txt
new file mode 100644
index 000000000..297651d43
--- /dev/null
+++ b/tests/intel-ci/xe.nvl.core.blocklist.txt
@@ -0,0 +1,69 @@
+##################################################################
+# Tests NA for Native
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
+# Expected skip as iGPU has no vram
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
+# Expected skips as the test are expected to run
+# only on older platforms
+##################################################################
+igt@xe_pat@pat-index-xe3p-xpc
+igt@xe_pat@pat-index-xehpc
+igt@xe_pat@pat-index-xelp
+igt@xe_pat@pat-index-xelpg
+igt@xe_media_fill@media-fill
+igt@xe_pat@pat-index-xe2
+##################################################################
+# Expected skip for the platform as the tests need more than
+# one CCS engine
+##################################################################
+igt@xe_compute@ccs-mode-basic
+igt@xe_compute@ccs-mode-compute-kernel
+igt@xe_compute@eu-busy-10s
+##################################################################
+# Expected skip for the platform
+##################################################################
+igt@xe_huc_copy@huc_copy
+igt@xe_exec_balancer@.*
+igt@.*@.*tiles
+igt@xe_oa@oa-tlb-invalidate
+igt@xe_pxp@.*
+igt@xe_exec_system_allocator@.*
+##################################################################
+#Expected skip for integrated platforms
+##################################################################
+igt@intel_hwmon@.*
+igt@.*@.*multigpu.*
+igt@xe_peer2peer@.*
+igt@xe_mmap@pci-membarrier.*
+igt@xe_pm@d3hot-i2c
+igt@xe_configfs@survivability-mode
+igt@xe_survivability@.*
+##################################################################
+# Kernel support not available
+##################################################################
+igt@xe_eudebug@.*
+igt@xe_eudebug_online@.*
+igt@xe_exec_sip@.*
+igt@xe_exec_sip_eudebug@.*
+igt@xe_live_ktest@xe_eudebug
+##################################################################
-- 
2.34.1

