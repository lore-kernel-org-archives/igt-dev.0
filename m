Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD87FC9830D
	for <igt-dev@archiver.kernel.org>; Wed, 23 Sep 2026 21:49:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 664BC10E4C9;
	Wed, 23 Sep 2026 21:49:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X4gIAERN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E5AC10F1DF
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Sep 2026 21:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790199716; x=1821735716;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=nACEqDO+PPuB8fQhuqXmhuJV+USc8s3KMMmjbLBNT4M=;
 b=X4gIAERNF8D9zLMVFMsHla4QowkyMr+YJuorPFuiZ0Hv8sbFXWDjUPAG
 0TT+RHJmkm27F1WpDKASzbZqBWiuv36VMIeK2wGe82mfUEmBhl5PgDqCj
 HATNL6aB3EoDubqhVboSRYd2n/UFcAYZ82fFWWdAHEWTrOrKezbPyjPcU
 UvkvvZZ8/o6FfVNti/uPNkplsD1S0BtxF+9b16kIylDFimpb1Sa+8pmUJ
 yQ1ZzC2jYKetIaXz/GZSWpea8/6nYggCtxlm5m0mu4R+JBpllmPyBdpeh
 ni14paZxbVlFwAnVFK/lkrpNB0maSBVGG1Ilek2KYO3NMOcV/q1ZGc23r A==;
X-CSE-ConnectionGUID: +oYsbCV8TVW9opzxyZk8Gw==
X-CSE-MsgGUID: ZLj7PRdPRsaCiObQjDJEkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="93445425"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; d="scan'208";a="93445425"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 14:41:56 -0700
X-CSE-ConnectionGUID: Pz2TeSf1S9qCs7tyfjR+7g==
X-CSE-MsgGUID: akJHXMmdTQuSIvZsZRUhRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="4907745"
Received: from inaky-mobl1.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.113])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 14:41:54 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Wed, 23 Sep 2026 18:41:18 -0300
Subject: [PATCH i-g-t v2 11/11] intel: Implement Wa_14026539277
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-wa_14026539277-v2-11-528b575299d2@intel.com>
References: <20260923-wa_14026539277-v2-0-528b575299d2@intel.com>
In-Reply-To: <20260923-wa_14026539277-v2-0-528b575299d2@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Atwood <matthew.s.atwood@intel.com>
X-Mailer: b4 0.15-dev
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

Implement the adaptations in IGT required for Wa_14026539277, which is
basically selecting an alternative PAT index instead of 2-way-coherent
ones.

Because xe_pat_cache->wb is expected to be at least 1-way-coherent, we
need to select an alternative that fulfills that requirement.  Let's
use the XA 1-way-coherent index for that (PAT index 19), because other
1-way coherent configurations do not cause GPU caches to be
automatically flushed at the end of a batch in certain occasions due
to the L2 Flush Optimization feature in Xe3p.

In the specific case of the xe_pat "false-sharing" subtest, it already
checks for XA 1-way-coherent, so it is just simpler to skip the
creation of the dynamic subtest for the 2-way-coherent PAT indices,
which are tagged as reserved by the KMD on the debugfs dump of
pat_sw_config when the workaround is active.

Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 lib/intel_pat.c      |  4 ++++
 tests/intel/xe_pat.c | 28 ++++++++++++++++++++--------
 2 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/lib/intel_pat.c b/lib/intel_pat.c
index 6808eaa9b77e..9d5ba6a46a05 100644
--- a/lib/intel_pat.c
+++ b/lib/intel_pat.c
@@ -7,6 +7,7 @@
 #include "igt.h"
 #include "intel_pat.h"
 #include "xe/xe_query.h"
+#include "xe/xe_wa.h"
 
 enum xe_pat_config {
 	PAT_SW_CONFIG,
@@ -109,6 +110,9 @@ static int32_t xe_get_pat_config(struct xe_device *xe_dev, struct intel_pat_cach
 	free(line);
 	fclose(dbgfs_file);
 
+	if (xe_wa_from_cache(xe_dev, "14026539277"))
+		xe_pat_cache->wb = 19; /* XA 1-way-coherent. */
+
 	return parsed;
 }
 
diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 17c3f2106f9f..6c3432f90179 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -32,6 +32,7 @@
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 #include "xe/xe_util.h"
+#include "xe/xe_wa.h"
 
 #define XE_COH_NONE          1
 #define XE_COH_AT_LEAST_1WAY 2
@@ -1871,30 +1872,41 @@ static void false_sharing(int fd)
 	uint16_t dev_id = intel_get_drm_devid(fd);
 	uint32_t graphics_ver = intel_get_device_info(dev_id)->graphics_ver;
 	bool is_dgfx = xe_has_vram(fd);
-
 	const struct fs_pat_entry *fs_entries;
-	int num_entries;
+	int num_fs_entries;
+	struct intel_pat_cache pat_sw_config;
+	int num_pat_entries;
+
+	if (xe_wa(fd, "14026539277"))
+		num_pat_entries = xe_fetch_pat_sw_config(fd, &pat_sw_config);
 
 	if (intel_graphics_ver(dev_id) == IP_VER(35, 11)) {
-		num_entries = ARRAY_SIZE(fs_xe3p_xpc);
+		num_fs_entries = ARRAY_SIZE(fs_xe3p_xpc);
 		fs_entries = fs_xe3p_xpc;
 	} else if (intel_graphics_ver(dev_id) == IP_VER(35, 10)) {
-		num_entries = ARRAY_SIZE(fs_xe3p_lpg);
+		num_fs_entries = ARRAY_SIZE(fs_xe3p_lpg);
 		fs_entries = fs_xe3p_lpg;
 	} else if (graphics_ver == 20) {
 		if (is_dgfx) {
-			num_entries = ARRAY_SIZE(fs_xe2_discrete);
+			num_fs_entries = ARRAY_SIZE(fs_xe2_discrete);
 			fs_entries = fs_xe2_discrete;
 		} else {
-			num_entries = ARRAY_SIZE(fs_xe2_integrated);
+			num_fs_entries = ARRAY_SIZE(fs_xe2_integrated);
 			fs_entries = fs_xe2_integrated;
 		}
 	} else {
-		num_entries = ARRAY_SIZE(fs_xe3);
+		num_fs_entries = ARRAY_SIZE(fs_xe3);
 		fs_entries = fs_xe3;
 	}
 
-	for (int i = 0; i < num_entries; i++) {
+	for (int i = 0; i < num_fs_entries; i++) {
+		if (xe_wa(fd, "14026539277")) {
+			igt_assert(fs_entries[i].pat_index < num_pat_entries);
+
+			if (pat_sw_config.entries[fs_entries[i].pat_index].rsvd)
+				continue;
+		}
+
 		igt_dynamic_f("%s", fs_entries[i].name) {
 			__false_sharing(fd, &fs_entries[i]);
 		}

-- 
2.55.0

