Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A730CAC59A
	for <igt-dev@archiver.kernel.org>; Wed, 17 Sep 2025 11:59:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F04B510E1A2;
	Wed, 17 Sep 2025 11:59:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jSsui023";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA05F10E0DC
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Sep 2025 11:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758110344; x=1789646344;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XNsHDkjZbTFTBuOLlJi/f86s0N/9/75c7Yl6GqvgtBY=;
 b=jSsui023vWF9m/cGSYeLQHQtjgkBDyjWajV8VMm+wR0+auoeu9hs7z6s
 Hz35KSJ/bN7LzqG5btN7DMOf9DmATlk7odaSUIJEgBJAVgAgv976olDcg
 FiNs90fIdr6TiogeIPT6HLaVx4oQQ+1j5Ue1kZjkzcOO27IKi4xHk3umg
 6vF8aATG62yIM736FqayGxYZb/TWMbLoCSgCPTAsisW+LC8rPdkgcfpY9
 84q4t8Z8khJ/INIzC6X9IdBrFdRVhqZgEt+vrFGCp3KIRqX8+w01kkb7b
 XkcEBAZzrBmqG0h61o009HGoLBiwNfia9xGJnnCqvRb5OU4Pi0VeHIFkp g==;
X-CSE-ConnectionGUID: DxF3vbYVR5SswbndJJCLYw==
X-CSE-MsgGUID: 4AHTAKLYQBiGdXTf80Z64Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="60558738"
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="60558738"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 04:59:02 -0700
X-CSE-ConnectionGUID: 5s2qSZ0tSTixmsfQL7n2Xg==
X-CSE-MsgGUID: YdNiRHB7RLGiCr8EGPqSyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="174831190"
Received: from himanshu-h97m-d3h.iind.intel.com ([10.223.55.10])
 by fmviesa007.fm.intel.com with ESMTP; 17 Sep 2025 04:59:00 -0700
From: himanshu.girotra@intel.com
To: aditya.chauhan@intel.com, ramadevi.gandi@intel.com,
 igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] Update Platform wise Blocklist file
Date: Wed, 17 Sep 2025 17:28:59 +0530
Message-Id: <20250917115859.14876-1-himanshu.girotra@intel.com>
X-Mailer: git-send-email 2.40.0
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

From: Himanshu Girotra <himanshu.girotra@intel.com>

Update expected skips as per the current kernel behaviour for LNL & BMG

Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
---
 tests/intel-ci/xe.bmg.core.blocklist.txt | 15 +++++++++++++++
 tests/intel-ci/xe.lnl.core.blocklist.txt | 14 ++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/tests/intel-ci/xe.bmg.core.blocklist.txt b/tests/intel-ci/xe.bmg.core.blocklist.txt
index 6207d6af6..25da760aa 100644
--- a/tests/intel-ci/xe.bmg.core.blocklist.txt
+++ b/tests/intel-ci/xe.bmg.core.blocklist.txt
@@ -56,6 +56,8 @@ igt@xe_eudebug_online@.*
 igt@xe_exec_sip@.*
 igt@xe_exec_sip_eudebug@.*
 igt@xe_live_ktest@xe_eudebug
+igt@xe_eudebug_sriov@deny-sriov
+igt@xe_eudebug_sriov@deny-eudebug
 ##################################################################
 # Expected Skip as per the current behaviour
 ##################################################################
@@ -72,3 +74,16 @@ igt@xe_evict@evict-(beng-)?mixed-threads-large$
 igt@xe_evict@evict-(beng-)?threads-large$
 igt@xe_evict@evict-(beng-)?large-multi-vm-cm$
 ##################################################################
+# pxp support not available for BMG
+##################################################################
+igt@xe_pxp@(?!pxp-bo-alloc$|pxp-queue-alloc$).*
+##################################################################
+# I2c tests needs AMC capable BMG in CI
+##################################################################
+igt@xe_pm@d3hot-i2c
+##################################################################
+# Hugepages tests needs extra setting in CI
+# echo 128 >  /proc/sys/vm/nr_hugepages
+##################################################################
+igt@xe_exec_system_allocator@.*huge.*
+##################################################################
diff --git a/tests/intel-ci/xe.lnl.core.blocklist.txt b/tests/intel-ci/xe.lnl.core.blocklist.txt
index 1e69170d8..a3cd52935 100644
--- a/tests/intel-ci/xe.lnl.core.blocklist.txt
+++ b/tests/intel-ci/xe.lnl.core.blocklist.txt
@@ -22,6 +22,8 @@ igt@xe_noexec_ping_pong
 igt@xe_pm@d3-mmap-vram
 igt@xe_pm@d3hot-mmap-vram
 igt@xe_sysfs_tile@physical_vram_size_bytes
+igt@xe_vm@out-of-memory
+igt@xe_compute_preempt@compute-preempt-many-vram.*
 ##################################################################
 # No d3cold support for LNL
 ##################################################################
@@ -82,4 +84,16 @@ igt@xe_live_ktest@xe_eudebug
 ##################################################################
 igt@xe_oa@oa-tlb-invalidate
 igt@xe_oa@unprivileged-single-ctx-counters
+igt@xe_pmu@.*fn.*
+igt@xe_mmap@pci-membarrier.*
+igt@xe_module_load@force-load
+##################################################################
+# I2c tests needs AMC capable machines in CI
+#################################################################
+igt@xe_pm@d3hot-i2c
+##################################################################
+# Hugepages tests needs extra setting in CI
+# echo 128 >  /proc/sys/vm/nr_hugepages
+##################################################################
+igt@xe_exec_system_allocator@.*huge.*
 ##################################################################
-- 
2.40.0

