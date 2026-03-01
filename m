Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A78ACFD006E
	for <igt-dev@archiver.kernel.org>; Sun,  1 Mar 2026 15:36:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 488B010E2B8;
	Sun,  1 Mar 2026 15:36:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="doC5GuBs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 874E010E2B8
 for <igt-dev@lists.freedesktop.org>; Sun,  1 Mar 2026 15:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772379362; x=1803915362;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TbwSPwjEDBJP17Tz/crMhlA1o50TqpvWDzun20mpnjU=;
 b=doC5GuBssSFBWrtb3p/GlkCq+l4RgYkigLCV9n1Asdjy3MeJvMPYUTdW
 tIYorqW2MLQZ1n7d/AoC+3oHP0+pUmMRPAm3UVIJsGnaFvy6HXPavLyAe
 ZqVTMcHHbtlXwZCDNFoSuakGM0m4ufkAyl44lpskJ94VciL3pf2hpYThQ
 39lBrHQcg9T6/l4glIw+4SKO9raWWomKmLGHxV+EnuHmYzVGx6zl0o8VG
 jPTPk4Tjc02VIFFFUimpxnFahBL5oosnCK4YGaP4NLQUMu220OOuuhZHV
 j3VRb+RaQYgw8Q8ULt+8Hu3EfRKlIt1nz185enhNWzgEf68kQS3EFUjGw w==;
X-CSE-ConnectionGUID: qAAealX+Q3qrD28Aro5IXg==
X-CSE-MsgGUID: A4SewuMUQF6KuV+I+SkzOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="73105072"
X-IronPort-AV: E=Sophos;i="6.21,318,1763452800"; d="scan'208";a="73105072"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2026 07:35:59 -0800
X-CSE-ConnectionGUID: eMkcwpGxS5GWWSbh3qLf2A==
X-CSE-MsgGUID: JEH6oNqNRB2fIgm9CwJv4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,318,1763452800"; d="scan'208";a="244559197"
Received: from himanshu-h97m-d3h.iind.intel.com ([10.223.55.10])
 by fmviesa001.fm.intel.com with ESMTP; 01 Mar 2026 07:35:58 -0800
From: himanshu.girotra@intel.com
To: matthew.d.roper@intel.com, x.wang@intel.com, igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] lib/intel_pat: Cache PAT config for unprivileged
 processes
Date: Sun,  1 Mar 2026 21:05:53 +0530
Message-ID: <20260301153553.23708-1-himanshu.girotra@intel.com>
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

Commit 4e59b8e7779b ("lib/intel_pat: use kernel debugfs as
authoritative PAT source for Xe") changed the Xe PAT lookup to
read from debugfs, which requires root access. Some xe_oa subtests
fork a child process that drops root privileges before performing
GPU operations that internally need the PAT write-back index.
After dropping root, the debugfs read fails.

Fix this by caching the PAT configuration on first access. A new
precache helper lets tests populate the cache while still running
as root, so later lookups succeed without debugfs.

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Xin Wang <x.wang@intel.com>
Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
---
 lib/intel_pat.c     | 39 +++++++++++++++++++++++++++++++++++++++
 lib/intel_pat.h     |  2 ++
 tests/intel/xe_oa.c | 10 ++++++++++
 3 files changed, 51 insertions(+)

diff --git a/lib/intel_pat.c b/lib/intel_pat.c
index 8660a2515..16dfc0217 100644
--- a/lib/intel_pat.c
+++ b/lib/intel_pat.c
@@ -7,6 +7,16 @@
 #include "igt.h"
 #include "intel_pat.h"
 
+/*
+ * Global PAT cache.  PAT configuration is a hardware/driver property that
+ * does not change over the lifetime of a device, so we cache the result of
+ * the first successful query.  This allows unprivileged processes (e.g.
+ * after igt_drop_root()) to use the cached values without needing debugfs
+ * access.
+ */
+static struct intel_pat_cache pat_cache;
+static bool pat_cached;
+
 /**
  * xe_get_pat_sw_config - Helper to read PAT (Page Attribute Table) software configuration
  * from debugfs
@@ -98,6 +108,11 @@ static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
 {
 	uint16_t dev_id;
 
+	if (pat_cached) {
+		*pat = pat_cache;
+		return;
+	}
+
 	/*
 	 * For Xe driver, query the kernel's PAT software configuration
 	 * via debugfs. The kernel is the authoritative source for PAT
@@ -110,6 +125,8 @@ static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
 		igt_assert_f(parsed > 0,
 			     "Failed to get PAT sw_config from debugfs (parsed=%d)\n",
 			     parsed);
+		pat_cache = *pat;
+		pat_cached = true;
 		return;
 	}
 
@@ -134,6 +151,28 @@ static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
 	} else {
 		igt_critical("Platform is missing PAT settings for uc/wt/wb\n");
 	}
+
+	pat_cache = *pat;
+	pat_cached = true;
+}
+
+/**
+ * intel_pat_precache:
+ * @fd: DRM file descriptor
+ *
+ * Pre-populate the global PAT cache while the process still has sufficient
+ * privileges (e.g. root) to read debugfs.  After calling this function,
+ * subsequent intel_get_pat_idx_*() calls will return cached values even if
+ * the process has dropped privileges via igt_drop_root().
+ *
+ * Tests that fork a child and drop root before using bufops/intel_bb
+ * should call this in their fixture or before the fork.
+ */
+void intel_pat_precache(int fd)
+{
+	struct intel_pat_cache pat = {};
+
+	intel_get_pat_idx(fd, &pat);
 }
 
 uint8_t intel_get_max_pat_index(int fd)
diff --git a/lib/intel_pat.h b/lib/intel_pat.h
index e9ade2e2e..c204eeac7 100644
--- a/lib/intel_pat.h
+++ b/lib/intel_pat.h
@@ -28,6 +28,8 @@ struct intel_pat_cache {
 	uint32_t pat_ats;
 };
 
+void intel_pat_precache(int fd);
+
 uint8_t intel_get_max_pat_index(int fd);
 
 uint8_t intel_get_pat_idx_uc(int fd);
diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 927f3f4f2..37449c87c 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -27,6 +27,7 @@
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 #include "xe/xe_oa.h"
+#include "intel_pat.h"
 
 /**
  * TEST: perf
@@ -5094,6 +5095,15 @@ int igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
 		write_u64_file("/proc/sys/dev/xe/observation_paranoid", 1);
 
 		render_copy = igt_get_render_copyfunc(drm_fd);
+
+		/*
+		 * Pre-cache PAT configuration while we still have root
+		 * privileges.  Several subtests fork a child that drops
+		 * root before using bufops/intel_bb, which internally
+		 * needs the PAT WB index.  Without this, the child would
+		 * fail to read debugfs after dropping privileges.
+		 */
+		intel_pat_precache(drm_fd);
 	}
 
 	igt_subtest("non-system-wide-paranoid")
-- 
2.50.1

