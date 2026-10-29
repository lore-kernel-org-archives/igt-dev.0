Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC9B606A31A
	for <igt-dev@archiver.kernel.org>; Thu, 29 Oct 2026 06:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PPq0uWyE
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3EC010E7C8;
	Thu, 29 Oct 2026 06:37:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2486F10FFA8
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2026 06:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793255785; x=1824791785;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=q//3q//ncqAQNtzqgGvoxyHFdpExKKFue3KKjZQiRGY=;
 b=PPq0uWyE1/dVpaxMkpEOE1sd38ZvlucuEUSb7F1Z964Ixih/lMUE7utQ
 +kt6xzAQ+C/GqB6zpKxvbW6hQ6h4Zj9xxVe1UZoJMolxFsIYR+Me1kRkE
 mh5K2x9Kbi1bTgPdDzKKIXOEMN5Kn3XtBlpdeXkNKpzvo4IBNL+dMwmYV
 QlUN93cf5LYRM0yquHOJV2GdpFqYyhqjl8MCLsUxuPsTFXR0E7uqwO9rL
 SbiB6RB61zcDEaIBJmHvBIKwoeavy07K9BfWVVkrEPuUi0nndYZSynHqo
 Tgg81FiW0tOp9+9hMPdFWY674DjuGHThj936YDEF4EKqtNEg9UqbxCAoS w==;
X-CSE-ConnectionGUID: uxxgCu2iRFKND51wS93dlA==
X-CSE-MsgGUID: LZ2muVgnQreSIU6UsQalkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2005595"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2005595"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 23:36:25 -0700
X-CSE-ConnectionGUID: /xcPjokzR+WipySAlXqc9w==
X-CSE-MsgGUID: gl4wrYBWT06evsqSS9cMVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="4957437"
Received: from dut2116bmgfrd.iind.intel.com ([10.223.34.13])
 by orviesa005.jf.intel.com with ESMTP; 28 Oct 2026 23:36:22 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	arvind.yadav@intel.com
Cc: kamil.konieczny@linux.intel.com,
	gustavo.sousa@intel.com
Subject: [PATCH] tests/intel/xe_exec_system_allocator: Skip reserved PAT
 madvise indices
Date: Thu, 29 Oct 2026 06:36:20 +0000
Message-ID: <20261029063620.1540187-1-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Nishit Sharma <nishit.sharma@intel.com>

With Wa_14026539277 active, KMD marks the 2-way-coherent PAT entries as
reserved in the debugfs pat_sw_config dump and they must not be used.
Skip the PAT-index madvise subtests when the selected PAT index is
reserved instead of decoding the coherency bits of the PAT entry.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 45ec62813..38e550896 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -26,6 +26,7 @@
 #include "xe/xe_gt.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
+#include "xe/xe_wa.h"
 #include <string.h>
 
 #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
@@ -1216,6 +1217,24 @@ xe_vm_madvixe_pat_attr(int fd, uint32_t vm, uint64_t addr, uint64_t range,
 		      DRM_XE_MEM_RANGE_ATTR_PAT, pat_index, 0, 0);
 }
 
+static bool pat_idx_is_reserved(int fd, uint8_t pat_idx)
+{
+	struct intel_pat_cache pat_sw_config = {};
+	int32_t num_pat_entries;
+
+	if (!xe_wa(fd, "14026539277"))
+		return false;
+
+	num_pat_entries = xe_get_pat_sw_config(fd, &pat_sw_config, 0);
+	igt_assert_f(num_pat_entries > 0,
+		     "Couldn't get Xe PAT software configuration\n");
+
+	if (pat_idx >= num_pat_entries)
+		return false;
+
+	return pat_sw_config.entries[pat_idx].rsvd;
+}
+
 static void
 xe_vm_madvise_atomic_attr(int fd, uint32_t vm, uint64_t addr, uint64_t range,
 			  int mem_attr)
@@ -2887,6 +2906,9 @@ int igt_main()
 			if (IS_PONTEVECCHIO(dev_id) &&
 			    strstr(s->name, "madvise-pat-idx-uc-comp-"))
 				igt_skip("Skipping compression-related PAT index on PVC\n");
+
+			igt_skip_on_f(pat_idx_is_reserved(fd, s->fn(fd)),
+				      "PAT index reserved by Wa_14026539277\n");
 			xe_for_each_engine(fd, hwe)
 				test_exec(fd, hwe, 1, 1, SZ_4M, 0, 0, NULL, NULL, s->flags, s->fn);
 		}
-- 
2.43.0

