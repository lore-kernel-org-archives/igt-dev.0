Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A8BCCF9E3
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 08:36:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C81A410E313;
	Mon, 10 Nov 2025 08:36:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="io6fNbNd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D5EB10E313
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 08:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762763788; x=1794299788;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XfRslhZIOwxnrNqNzS5OpeknhmSMH7qalulG0O5IOnE=;
 b=io6fNbNdaA/QsYHnqSvJ95qjqFoE/WJC5xzjrQT+4yQ383FnV5Ok/H7X
 yA0gmrwkOxFz8rWvVXwuQBH+Ne+9ctXgPNHfzXzVkaCOJVRtpS/f1Ox7N
 O0WQEgfATvg2XYdraD2LuidZh1MmnwWB0AyjztAhh50xKNzDhy7Kos2QA
 hRnlnPNu5HWXPkK6jxxY3KZvoaMZJEfVwkPYhI3nAYw5V3X+i7Y79wJt1
 /SbNvIoZcd/PhSVY0NCj1PBWbvhOr2xvXK43VQse6xpo0Lu4I9GanZLum
 S1FQelc6qH+N99tdMuFCSDOUD7nhbGJism1aJ93aMdcGOp4PYVfFVN/lL A==;
X-CSE-ConnectionGUID: OL5t9CdZQBORQcQKcGrTlA==
X-CSE-MsgGUID: Aw+r+ggwQbCq1FFCgP+b/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="64899164"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; d="scan'208";a="64899164"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 00:36:28 -0800
X-CSE-ConnectionGUID: zSPfc9XGRZa6uqxrT5xj8A==
X-CSE-MsgGUID: Yk7WV/6uRU2FmQcxj8MZQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; d="scan'208";a="219345360"
Received: from himanshu-h97m-d3h.iind.intel.com ([10.223.55.10])
 by fmviesa001.fm.intel.com with ESMTP; 10 Nov 2025 00:36:27 -0800
From: himanshu.girotra@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 kamil.konieczny@intel.com, aditya.chauhan@intel.com
Subject: [PATCH i-g-t] tests/intel-ci: Update blocklists for xe
Date: Mon, 10 Nov 2025 14:07:05 +0530
Message-ID: <20251110083705.17433-1-himanshu.girotra@intel.com>
X-Mailer: git-send-email 2.50.1
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

Blocklist non-intel gpu tests across xe platforms running in CI
and update wise Blocklist files for BMG and PTL.

Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
---
 tests/intel-ci/xe.blocklist.txt          | 1 +
 tests/intel-ci/xe.bmg.core.blocklist.txt | 1 +
 tests/intel-ci/xe.ptl.core.blocklist.txt | 6 ++++++
 3 files changed, 8 insertions(+)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index aa480c6d2..8706721e3 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -13,6 +13,7 @@ igt@vgem_.*
 igt@.*virtgpu.*
 igt@vkms.*
 igt@vmwgfx.*
+igt@panthor.*
 ##################################################################
 # Exclude all i915 tests
 ##################################################################
diff --git a/tests/intel-ci/xe.bmg.core.blocklist.txt b/tests/intel-ci/xe.bmg.core.blocklist.txt
index 15dbbf2b8..3a127f780 100644
--- a/tests/intel-ci/xe.bmg.core.blocklist.txt
+++ b/tests/intel-ci/xe.bmg.core.blocklist.txt
@@ -70,6 +70,7 @@ igt@xe_evict@evict-(beng-)?large-multi-vm-cm$
 # pxp support not available for BMG
 ##################################################################
 igt@xe_pxp@(?!pxp-bo-alloc$|pxp-queue-alloc$).*
+igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add
 ##################################################################
 # I2c tests needs AMC capable BMG in CI
 ##################################################################
diff --git a/tests/intel-ci/xe.ptl.core.blocklist.txt b/tests/intel-ci/xe.ptl.core.blocklist.txt
index 811062449..77baf061d 100644
--- a/tests/intel-ci/xe.ptl.core.blocklist.txt
+++ b/tests/intel-ci/xe.ptl.core.blocklist.txt
@@ -69,8 +69,14 @@ igt@xe_pm_residency@toggle-gt-c6
 # Expected skip as PXP is not enabled for PTL upstream
 ##################################################################
 igt@xe_pxp@.*
+xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add
 ##################################################################
 # System allocator feature is not POR for PTL
 ##################################################################
 igt@xe_exec_system_allocator@.*
 ##################################################################
+# survivability feature not applicable for PTL
+##################################################################
+igt@xe_survivability@i2c-functionality
+igt@xe_survivability@runtime-survivability
+#################################################################
-- 
2.50.1

