Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A8B7FED2DD
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 07:48:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D81F310E98E;
	Thu, 12 Mar 2026 07:48:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZsCahZkH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C2F10E98C
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 07:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773301717; x=1804837717;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=bHoCx5pigwWmcGZ69RViUzEn2+O9bS1apxvk/SuAeA8=;
 b=ZsCahZkH/QfATlcfCon23NtwZ79pAVdxNB4L6vX93sz1+25e4k0BfQkH
 x8qHEearbkDpB+hCyW64lutlqtl6UpHuRI/LbWaHJbSNsYcSmLK5EQAvi
 p+VrCYcO1clM0yMM74XfghaIlcFQeKAYkaOFn6aIxIajEcRhwU21PbKP/
 +x3USQqKLmivYWUXn8tq1czf8Ff4pxbTW5FCcx8LIHni2nAGDiphn1ceJ
 U7i8C2h3bMRVJkfbFOZgPzrYHV2LAu9LJRl8GRkvHimVKVhpgEQr+boUU
 /iRzSa7AYlJPZrRIwLN8lt+B1pJO93JrZxt27TWQPdpwe4+kgqb6cYwZi A==;
X-CSE-ConnectionGUID: R98qbi3DSHOBz70RzySLcg==
X-CSE-MsgGUID: 1RA1eR8DRx2ECgZRW4/2mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="61962311"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="61962311"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 00:48:37 -0700
X-CSE-ConnectionGUID: 0cul3/6rQxONUIaT2boaKw==
X-CSE-MsgGUID: VbjMo1HmQRKEmcQciRuinQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="225189267"
Received: from cml-cometlake-client-platform.iind.intel.com ([10.223.55.11])
 by orviesa004.jf.intel.com with ESMTP; 12 Mar 2026 00:48:35 -0700
From: Aditya Chauhan <aditya.chauhan@intel.com>
To: ramadevi.gandi@intel.com, himanshu.girotra@intel.com,
 swati2.sharma@intel.com, igt-dev@lists.freedesktop.org
Subject: [PATCH v2 i-g-t 1/2] tests/intel-ci: Add NVL core blocklist
Date: Thu, 12 Mar 2026 13:18:31 +0530
Message-Id: <20260312074832.51575-2-aditya.chauhan@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260312074832.51575-1-aditya.chauhan@intel.com>
References: <20260312074832.51575-1-aditya.chauhan@intel.com>
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

