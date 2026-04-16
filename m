Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8301F8A146
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 09:12:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ADD410E84D;
	Thu, 16 Apr 2026 09:12:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h+/O8JSe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B2110E84B
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 09:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776330750; x=1807866750;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cR6iK0FzrSYrDFdqp7XnTUrVnCdAVITB8POtLvC7j/k=;
 b=h+/O8JSe+VAPjQFRdVZggB+Wxf5OnHQe6Bo3z4dQeJ2bHuk0orH/SxMd
 upg03AQpYh54ryek2SyYKv0EEMERpuwJLCu4kqwX3/Xoy2Cj8ja8Uo/F0
 l5W1+8ynrPuFw0Cxfc4XuWn/ixSQYAevwz0dKm6QPzuJ7wrjDsJDKPFR+
 6gInkDbR6Qe5bHgS7ZEPYxhMrwb9p/1jN4gpLxNygL5/6/eno9fYHvIZN
 bDa1RbYJIxZgspoRTQIHWa0kBgGvIxbW41c2yYIeO2iT0YGo1H4IQDeVo
 SkQx6xIuK7j1hCe1yPG1FkKu/Y/ehgJsuLAn06RKiUHFPLNidkvX51FHH g==;
X-CSE-ConnectionGUID: /R1fUWnnS8ijjSeV0z7W2w==
X-CSE-MsgGUID: kVwulgntRgmtC8asDx6u9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="99973309"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="99973309"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 02:11:03 -0700
X-CSE-ConnectionGUID: OxrZdopcQAmupMPobtJ17Q==
X-CSE-MsgGUID: Xec4n9TvRaOr3MRMAxHZYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="230608834"
Received: from amiszcza-desk-dev.igk.intel.com (HELO localhost)
 ([10.91.214.39])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 02:11:02 -0700
From: Adam Miszczak <adam.miszczak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@linux.intel.com,
	kamil.konieczny@linux.intel.com
Subject: [PATCH i-g-t 2/3] tools/vmtb: Provide VF busy migration IGT/gem_wsim
 workloads
Date: Thu, 16 Apr 2026 10:35:43 +0200
Message-Id: <20260416083544.2441874-3-adam.miszczak@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20260416083544.2441874-1-adam.miszczak@linux.intel.com>
References: <20260416083544.2441874-1-adam.miszczak@linux.intel.com>
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

Define gem_wsim workload descriptor files for BMG and PTL
consumed by the xe busy migration test scenarios (test_migration.py):
- short_preempt.wsim: short preemptable batches (5ms)
- short_nonpreempt.wsim: short non-preemptable batches (5ms)
- long_preempt.wsim: long preemptable batches (100ms)
- long_nonpreempt.wsim: long non-preemptable batches (100ms)
- idle_ctxs.wsim: idle migration with contexts created

Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
---
 tools/vmtb/MANIFEST.in                        |  1 +
 .../resources/wsim/bmg/idle_ctxs.wsim         | 22 +++++++++++++++++++
 .../resources/wsim/bmg/long_nonpreempt.wsim   | 18 +++++++++++++++
 .../resources/wsim/bmg/long_preempt.wsim      | 17 ++++++++++++++
 .../resources/wsim/bmg/short_nonpreempt.wsim  | 18 +++++++++++++++
 .../resources/wsim/bmg/short_preempt.wsim     | 17 ++++++++++++++
 .../resources/wsim/ptl/idle_ctxs.wsim         | 21 ++++++++++++++++++
 .../resources/wsim/ptl/long_nonpreempt.wsim   | 17 ++++++++++++++
 .../resources/wsim/ptl/long_preempt.wsim      | 16 ++++++++++++++
 .../resources/wsim/ptl/short_nonpreempt.wsim  | 17 ++++++++++++++
 .../resources/wsim/ptl/short_preempt.wsim     | 16 ++++++++++++++
 11 files changed, 180 insertions(+)
 create mode 100644 tools/vmtb/vmm_flows/resources/wsim/bmg/idle_ctxs.wsim
 create mode 100644 tools/vmtb/vmm_flows/resources/wsim/bmg/long_nonpreempt.wsim
 create mode 100644 tools/vmtb/vmm_flows/resources/wsim/bmg/long_preempt.wsim
 create mode 100644 tools/vmtb/vmm_flows/resources/wsim/bmg/short_nonpreempt.wsim
 create mode 100644 tools/vmtb/vmm_flows/resources/wsim/bmg/short_preempt.wsim
 create mode 100644 tools/vmtb/vmm_flows/resources/wsim/ptl/idle_ctxs.wsim
 create mode 100644 tools/vmtb/vmm_flows/resources/wsim/ptl/long_nonpreempt.wsim
 create mode 100644 tools/vmtb/vmm_flows/resources/wsim/ptl/long_preempt.wsim
 create mode 100644 tools/vmtb/vmm_flows/resources/wsim/ptl/short_nonpreempt.wsim
 create mode 100644 tools/vmtb/vmm_flows/resources/wsim/ptl/short_preempt.wsim

diff --git a/tools/vmtb/MANIFEST.in b/tools/vmtb/MANIFEST.in
index 7674c199d..954990a63 100644
--- a/tools/vmtb/MANIFEST.in
+++ b/tools/vmtb/MANIFEST.in
@@ -1,3 +1,4 @@
 include pytest.ini
 include vmtb_config.json
 include vmm_flows/resources/vgpu_profiles/*
+recursive-include vmm_flows/resources/wsim *
diff --git a/tools/vmtb/vmm_flows/resources/wsim/bmg/idle_ctxs.wsim b/tools/vmtb/vmm_flows/resources/wsim/bmg/idle_ctxs.wsim
new file mode 100644
index 000000000..1d8c9a2d7
--- /dev/null
+++ b/tools/vmtb/vmm_flows/resources/wsim/bmg/idle_ctxs.wsim
@@ -0,0 +1,22 @@
+###############################################################
+# VF S/R scenario: idle migration with contexts created
+#
+# 1. Run 3ms pre-migration WL on each engine
+# 2. Wait 20s for migration to happen
+# 3. Run the WLs again in post-migration phase to check fixups
+#
+# BMG variant - engines:
+# Root tile: RCS, BCS, CCS
+# Media tile: VCS, VECS
+###############################################################
+1.RCS.3000.0.0
+1.BCS.3000.0.0
+1.CCS.3000.0.1
+1.VCS.3000.0.0
+1.VECS.3000.0.0
+d.20000000
+1.RCS.3000.0.0
+1.BCS.3000.0.0
+1.CCS.3000.0.1
+1.VCS.3000.0.0
+1.VECS.3000.0.0
diff --git a/tools/vmtb/vmm_flows/resources/wsim/bmg/long_nonpreempt.wsim b/tools/vmtb/vmm_flows/resources/wsim/bmg/long_nonpreempt.wsim
new file mode 100644
index 000000000..45add4217
--- /dev/null
+++ b/tools/vmtb/vmm_flows/resources/wsim/bmg/long_nonpreempt.wsim
@@ -0,0 +1,18 @@
+###############################################################
+# VF S/R scenario: long non-preemptable batches
+#
+# 1. Run 100ms non-preempable batches on each engine
+# 2. Emit the workload for 20s (rerun in a loop) - keep executing during the migration.
+#    Use 'gem_wsim -r 200' that gives: 0.1s * 10 = 1s * 20 = 20s
+# 3. Finish execution in post-migration phase
+#
+# BMG variant - engines:
+# Root tile: RCS, BCS, CCS
+# Media tile: VCS, VECS
+###############################################################
+X.1.0
+1.RCS.100000.0.0
+1.BCS.100000.0.0
+1.CCS.100000.0.1
+1.VCS.100000.0.0
+1.VECS.100000.0.0
diff --git a/tools/vmtb/vmm_flows/resources/wsim/bmg/long_preempt.wsim b/tools/vmtb/vmm_flows/resources/wsim/bmg/long_preempt.wsim
new file mode 100644
index 000000000..2c3d22d40
--- /dev/null
+++ b/tools/vmtb/vmm_flows/resources/wsim/bmg/long_preempt.wsim
@@ -0,0 +1,17 @@
+###############################################################
+# VF S/R scenario: long preemptable batches
+#
+# 1. Run 100ms preempable batches on each engine
+# 2. Emit the workload for 20s (rerun in a loop) - keep executing during the migration.
+#    Use 'gem_wsim -r 200' that gives: 0.1s * 10 = 1s * 20 = 20s
+# 3. Finish execution in post-migration phase
+#
+# BMG variant - engines:
+# Root tile: RCS, BCS, CCS
+# Media tile: VCS, VECS
+###############################################################
+1.RCS.100000.0.0
+1.BCS.100000.0.0
+1.CCS.100000.0.1
+1.VCS.100000.0.0
+1.VECS.100000.0.0
diff --git a/tools/vmtb/vmm_flows/resources/wsim/bmg/short_nonpreempt.wsim b/tools/vmtb/vmm_flows/resources/wsim/bmg/short_nonpreempt.wsim
new file mode 100644
index 000000000..5ff9cc74a
--- /dev/null
+++ b/tools/vmtb/vmm_flows/resources/wsim/bmg/short_nonpreempt.wsim
@@ -0,0 +1,18 @@
+###############################################################
+# VF S/R scenario: short non-preemptable batches
+#
+# 1. Run 5ms non-preempable batches on each engine
+# 2. Emit the workload for 20s (rerun in a loop) - keep executing during the migration.
+#    Use 'gem_wsim -r 4000' that gives: 0.005s * 200 = 1s * 20 = 20s
+# 3. Finish execution in post-migration phase
+#
+# BMG variant - engines:
+# Root tile: RCS, BCS, CCS
+# Media tile: VCS, VECS
+###############################################################
+X.1.0
+1.RCS.5000.0.0
+1.BCS.5000.0.0
+1.CCS.5000.0.1
+1.VCS.5000.0.0
+1.VECS.5000.0.0
diff --git a/tools/vmtb/vmm_flows/resources/wsim/bmg/short_preempt.wsim b/tools/vmtb/vmm_flows/resources/wsim/bmg/short_preempt.wsim
new file mode 100644
index 000000000..c09b82cce
--- /dev/null
+++ b/tools/vmtb/vmm_flows/resources/wsim/bmg/short_preempt.wsim
@@ -0,0 +1,17 @@
+###############################################################
+# VF S/R scenario: short preemptable batches
+#
+# 1. Run 5ms preempable batches on each engine
+# 2. Emit the workload for 20s (rerun in a loop) - keep executing during the migration.
+#    Use 'gem_wsim -r 4000' that gives: 0.005s * 200 = 1s * 20 = 20s
+# 3. Finish execution in post-migration phase
+#
+# BMG variant - engines:
+# Root tile: RCS, BCS, CCS
+# Media tile: VCS, VECS
+###############################################################
+1.RCS.5000.0.0
+1.BCS.5000.0.0
+1.CCS.5000.0.1
+1.VCS.5000.0.0
+1.VECS.5000.0.0
diff --git a/tools/vmtb/vmm_flows/resources/wsim/ptl/idle_ctxs.wsim b/tools/vmtb/vmm_flows/resources/wsim/ptl/idle_ctxs.wsim
new file mode 100644
index 000000000..1e17b7a53
--- /dev/null
+++ b/tools/vmtb/vmm_flows/resources/wsim/ptl/idle_ctxs.wsim
@@ -0,0 +1,21 @@
+###############################################################
+# VF S/R scenario: idle migration with contexts created
+#
+# 1. Run 3ms pre-migration WL on each engine
+# 2. Wait 20s for migration to happen
+# 3. Run the WLs again in post-migration phase to check fixups
+#
+# PTL variant - engines:
+# RCS, BCS, VCS-1, VECS-1, CCS
+###############################################################
+1.RCS.3000.0.0
+1.BCS.3000.0.0
+1.VCS-1.3000.0.0
+1.VECS-1.3000.0.0
+1.CCS.3000.0.1
+d.20000000
+1.RCS.3000.0.0
+1.BCS.3000.0.0
+1.VCS-1.3000.0.0
+1.VECS-1.3000.0.0
+1.CCS.3000.0.1
diff --git a/tools/vmtb/vmm_flows/resources/wsim/ptl/long_nonpreempt.wsim b/tools/vmtb/vmm_flows/resources/wsim/ptl/long_nonpreempt.wsim
new file mode 100644
index 000000000..2b49426ca
--- /dev/null
+++ b/tools/vmtb/vmm_flows/resources/wsim/ptl/long_nonpreempt.wsim
@@ -0,0 +1,17 @@
+###############################################################
+# VF S/R scenario: long non-preemptable batches
+#
+# 1. Run 100ms non-preempable batches on each engine
+# 2. Emit the workload for 20s (rerun in a loop) - keep executing during the migration.
+#    Use 'gem_wsim -r 200' that gives: 0.1s * 10 = 1s * 20 = 20s
+# 3. Finish execution in post-migration phase
+#
+# PTL variant - engines:
+# RCS, BCS, VCS-1, VECS-1, CCS
+###############################################################
+X.1.0
+1.RCS.100000.0.0
+1.BCS.100000.0.0
+1.VCS-1.100000.0.0
+1.VECS-1.100000.0.0
+1.CCS.100000.0.1
diff --git a/tools/vmtb/vmm_flows/resources/wsim/ptl/long_preempt.wsim b/tools/vmtb/vmm_flows/resources/wsim/ptl/long_preempt.wsim
new file mode 100644
index 000000000..e06c2f290
--- /dev/null
+++ b/tools/vmtb/vmm_flows/resources/wsim/ptl/long_preempt.wsim
@@ -0,0 +1,16 @@
+###############################################################
+# VF S/R scenario: long preemptable batches
+#
+# 1. Run 100ms preempable batches on each engine
+# 2. Emit the workload for 20s (rerun in a loop) - keep executing during the migration.
+#    Use 'gem_wsim -r 200' that gives: 0.1s * 10 = 1s * 20 = 20s
+# 3. Finish execution in post-migration phase
+#
+# PTL variant - engines:
+# RCS, BCS, VCS-1, VECS-1, CCS
+###############################################################
+1.RCS.100000.0.0
+1.BCS.100000.0.0
+1.VCS-1.100000.0.0
+1.VECS-1.100000.0.0
+1.CCS.100000.0.1
diff --git a/tools/vmtb/vmm_flows/resources/wsim/ptl/short_nonpreempt.wsim b/tools/vmtb/vmm_flows/resources/wsim/ptl/short_nonpreempt.wsim
new file mode 100644
index 000000000..5e8ff1c26
--- /dev/null
+++ b/tools/vmtb/vmm_flows/resources/wsim/ptl/short_nonpreempt.wsim
@@ -0,0 +1,17 @@
+###############################################################
+# VF S/R scenario: short non-preemptable batches
+#
+# 1. Run 5ms non-preempable batches on each engine
+# 2. Emit the workload for 20s (rerun in a loop) - keep executing during the migration.
+#    Use 'gem_wsim -r 4000' that gives: 0.005s * 200 = 1s * 20 = 20s
+# 3. Finish execution in post-migration phase
+#
+# PTL variant - engines:
+# RCS, BCS, VCS-1, VECS-1, CCS
+###############################################################
+X.1.0
+1.RCS.5000.0.0
+1.BCS.5000.0.0
+1.VCS-1.5000.0.0
+1.VECS-1.5000.0.0
+1.CCS.5000.0.1
diff --git a/tools/vmtb/vmm_flows/resources/wsim/ptl/short_preempt.wsim b/tools/vmtb/vmm_flows/resources/wsim/ptl/short_preempt.wsim
new file mode 100644
index 000000000..b2316f957
--- /dev/null
+++ b/tools/vmtb/vmm_flows/resources/wsim/ptl/short_preempt.wsim
@@ -0,0 +1,16 @@
+###############################################################
+# VF S/R scenario: short preemptable batches
+#
+# 1. Run 5ms preempable batches on each engine
+# 2. Emit the workload for 20s (rerun in a loop) - keep executing during the migration.
+#    Use 'gem_wsim -r 4000' that gives: 0.005s * 200 = 1s * 20 = 20s
+# 3. Finish execution in post-migration phase
+#
+# PTL variant - engines:
+# RCS, BCS, VCS-1, VECS-1, CCS
+###############################################################
+1.RCS.5000.0.0
+1.BCS.5000.0.0
+1.VCS-1.5000.0.0
+1.VECS-1.5000.0.0
+1.CCS.5000.0.1
-- 
2.39.1

