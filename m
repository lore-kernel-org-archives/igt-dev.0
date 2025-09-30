Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C926CCA470
	for <igt-dev@archiver.kernel.org>; Tue, 30 Sep 2025 14:31:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B8A010E5E2;
	Tue, 30 Sep 2025 14:31:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CYS2RB+E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B41B910E5E2
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Sep 2025 14:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759242705; x=1790778705;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yEI00Z2jsdALBAIu6focyGUG3ES6dz9jfjl2MYqxKKA=;
 b=CYS2RB+EqqT/6m/WBXNBi9jzzXsNNFngp/1VnjBoPRFgvZk4WQ1Mc0BA
 gICuC/6RVVBDk+kQclwVybjKKNQy5rtKpVuKJzwuPKIzc5M7492Ng9SHK
 Wb0dzd6jlMXisNlQ9fKeMf1deMEklSEOfiyMCy/vbisEC/+jn0oxjwsKf
 PnPmK6eGWl1E5PzC0DEgalgjwpnLVJ4kODDb4Fr+v5/kDoE5/kZF43/Rz
 QG8TXLa9a+6lh++NQGEk3bGCZOGkYuq0nnlYkdmUPoacrEvycFl1kVNKf
 R8QOlh7sFUzAEyz5Kpf95OOClNQvGRYnua44fMoHIq770O7WR60KIH2Hg g==;
X-CSE-ConnectionGUID: T1eDFOVIREyiwAIrgGDDow==
X-CSE-MsgGUID: LZ8OwzvPTXyrFW9ohjHI0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65322332"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65322332"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 07:31:44 -0700
X-CSE-ConnectionGUID: 0yXws7frREiFwDZ5/UQCXA==
X-CSE-MsgGUID: JG0rq2HnTj+eMknTFgolKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="177809724"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.116])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 07:31:43 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>,
 Nakshtra Goyal <nakshtra.goyal@intel.com>
Subject: [PATCH i-g-t 2/2] tests/xe_pat: Use blitter to copy to uc-comp surface
Date: Tue, 30 Sep 2025 16:31:33 +0200
Message-ID: <20250930143130.186193-6-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250930143130.186193-4-zbigniew.kempczynski@intel.com>
References: <20250930143130.186193-4-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Writing to uc-comp surface with cpu mapping is out-of-spec and might
lead to weird effects like not decompressing previously compressed
(during eviction) surface.

Specification requires to use blitter to write data to such compressed
surface. Use bounce buffer and blit from it to uc-compressed source buffer
used in render-copy.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5507
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Nakshtra Goyal <nakshtra.goyal@intel.com>
---
 tests/intel/xe_pat.c | 35 ++++++++++++++++++++++++++++++-----
 1 file changed, 30 insertions(+), 5 deletions(-)

diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 8bb0ac167d..59dfb6b111 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -23,8 +23,14 @@
 #include "xe/xe_query.h"
 #include "xe/xe_util.h"
 
+#define XE_COH_NONE          1
+#define XE_COH_AT_LEAST_1WAY 2
+
 static bool do_slow_check;
 
+static uint32_t create_object(int fd, int r, int size, uint16_t coh_mode,
+			      bool force_cpu_wc);
+
 /**
  * SUBTEST: userptr-coh-none
  * Test category: functionality test
@@ -419,8 +425,30 @@ static void pat_index_render(struct xe_pat_param *p)
 	}
 
 	/* Write some values from the CPU, potentially dirtying the CPU cache */
-	for (i = 0; i < size / sizeof(uint32_t); i++)
-		p->r1_map[i] = i;
+	if (p->r1_compressed) {
+		uint32_t tmp_bo;
+		uint32_t *tmp_map;
+		uint32_t tmp_region = system_memory(fd);
+		uint8_t tmp_pat_index = intel_get_pat_idx_wb(fd);
+
+		tmp_bo = create_object(fd, tmp_region, size,
+				       XE_COH_AT_LEAST_1WAY, false);
+		tmp_map = xe_bo_map(fd, tmp_bo, size);
+
+		for (i = 0; i < size / sizeof(uint32_t); i++)
+			tmp_map[i] = i;
+
+		xe_fast_copy(fd,
+			     tmp_bo, tmp_region, tmp_pat_index,
+			     p->r1_bo, p->r1, p->r1_pat_index,
+			     size);
+
+		munmap(tmp_map, size);
+		gem_close(fd, tmp_bo);
+	} else {
+		for (i = 0; i < size / sizeof(uint32_t); i++)
+			p->r1_map[i] = i;
+	}
 
 	/* And finally ensure we always see the CPU written values */
 	render_copy(ibb,
@@ -867,9 +895,6 @@ static uint8_t get_pat_idx_wb(int fd, bool *compressed)
 	return intel_get_pat_idx_wb(fd);
 }
 
-#define XE_COH_NONE          1
-#define XE_COH_AT_LEAST_1WAY 2
-
 struct pat_index_entry {
 	uint8_t (*get_pat_index)(int fd, bool *compressed);
 	uint8_t pat_index;
-- 
2.43.0

