Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210CD606A31A
	for <igt-dev@archiver.kernel.org>; Fri, 23 Oct 2026 21:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eR7pr9x8
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3073112D32;
	Fri, 23 Oct 2026 21:08:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02CBD10E6E8
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2026 21:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792789408; x=1824325408;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=cm18lx5ESYe1GL1jYuzkzEkkosyWV4ojxj6DvdqaRXo=;
 b=eR7pr9x8JwBNPZaDhbTpBhdO5wyyNgHIZlgnwYE2l0R1EKoE9NnYGvpY
 e50zCu5umV3ZYXHNo8c/14WFxu+IKnXI3B+c1Q3YDCJFofM2WPhH/xoZ/
 xkxWzA1ml/2AK0dasu5L/LRLPI1WECl0TRDgZeod6GuIPr486fnu/4if+
 Nmq16KH6H3w9RtArFIIaf4f3YQRJli2peN+VY1MG1SdE8mPAyo2Hdzg2l
 5ZbH6XcHJhAqGaMXuw1rnJcZjnG0C8uJXklhSFu8y+nIRMOxTV17XOTVZ
 XlKusZH9Nviwfkl2A+cNR2JszHG/cyNmBZxmTp/n2cLsVH4X6vDGn2tkV w==;
X-CSE-ConnectionGUID: pup8qYoZR6KmD5NrBQeVDg==
X-CSE-MsgGUID: kpe1gA6gTZqqn7SgKaDTxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1457473"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1457473"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 14:03:22 -0700
X-CSE-ConnectionGUID: vGAJhEpFQJ2dmDhw1UbUzQ==
X-CSE-MsgGUID: Akh9xPXNTk6TZMY9DloxEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="5585845"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.115])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 14:03:21 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 23 Oct 2026 18:02:46 -0300
Subject: [PATCH i-g-t v3 11/11] intel: Implement Wa_14026539277
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-wa_14026539277-v3-11-b8723ececb7f@intel.com>
References: <20261023-wa_14026539277-v3-0-b8723ececb7f@intel.com>
In-Reply-To: <20261023-wa_14026539277-v3-0-b8723ececb7f@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Atwood <matthew.s.atwood@intel.com>
X-Mailer: b4 0.15-dev
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
2.56.0

