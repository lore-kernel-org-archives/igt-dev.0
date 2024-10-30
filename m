Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 897E4D6B6CE
	for <igt-dev@archiver.kernel.org>; Wed, 30 Oct 2024 19:37:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4532710E7F7;
	Wed, 30 Oct 2024 19:37:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cBXqmQU2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4B9B10E7F7
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Oct 2024 19:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730317025; x=1761853025;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LrQWSdRCxql89JLcr0IvzKJVSp9U/OjiP+lh5CD0o+k=;
 b=cBXqmQU2r174zDYa0DcJWrkzu1P+p1sVkks5NpsZFeVEsR3ZIAX/TKTP
 ImRtSo17gMI3no4TKEWNb7mHGe4KteqbQJSXT9BuAAHKpXOKMskzizQCt
 /xFpKllAU86h0JAfLd15OQZniTNb1YxrrJ+1q9yXELKUrSrJeA4gbzBMx
 dKkuKwgaBmLbfK0/05Ny5ZasmcbiL7B7qRM2OClhhiZeTS6/P9bYbyJzF
 2gSwbiyYRmcRlNODT+PU2D+7w/wxSIFZxaGoq7bD220CR18KGCL17V6UI
 FB2/eYq9aOifL2aXb1qwjxJMYuerJnj/2Wkt2H/fb4gdwlj7h+sPrwyLb Q==;
X-CSE-ConnectionGUID: pDphWqU9TRS5KNR2l8paMQ==
X-CSE-MsgGUID: Y0IaMBxjTu+yUWZn5h3Zmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47499974"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="47499974"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 12:37:05 -0700
X-CSE-ConnectionGUID: 7P+UkiDPQy+L7NJhEb9udQ==
X-CSE-MsgGUID: CI8ILrRGTfyvQl/lcX7cUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; d="scan'208";a="82578449"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.84.149])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 12:37:02 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com, michal.wajdeczko@intel.com,
 michal.winiarski@intel.com, narasimha.c.v@intel.com,
 piotr.piorkowski@intel.com, satyanarayana.k.v.p@intel.com,
 tomasz.lis@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 4/5] tests/intel/xe_sriov_flr: Verify full LMEM range
Date: Wed, 30 Oct 2024 20:36:28 +0100
Message-Id: <20241030193629.1238637-5-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20241030193629.1238637-1-marcin.bernatowicz@linux.intel.com>
References: <20241030193629.1238637-1-marcin.bernatowicz@linux.intel.com>
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

Read provisioned LMEM ranges from debugfs lmem_provisioned attribute
and verify full LMEM ranges in clear-lmem subcheck.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Narasimha C V <narasimha.c.v@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>
---
 tests/intel/xe_sriov_flr.c | 59 +++++++++++++++++++++++++++++---------
 1 file changed, 45 insertions(+), 14 deletions(-)

diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
index 5fc1baf96..f698eaf3d 100644
--- a/tests/intel/xe_sriov_flr.c
+++ b/tests/intel/xe_sriov_flr.c
@@ -13,6 +13,8 @@
 #include "linux_scaffold.h"
 #include "xe/xe_mmio.h"
 #include "xe/xe_query.h"
+#include "xe/xe_sriov_provisioning.h"
+#include "xe/xe_sriov_debugfs.h"
 
 /**
  * TEST: xe_sriov_flr
@@ -600,14 +602,6 @@ static void *mmap_vf_lmem(int pf_fd, int vf_num, size_t length, int prot, off_t
 	return addr;
 }
 
-static uint64_t get_vf_lmem_size(int pf_fd, int vf_num)
-{
-	/* limit to first two pages
-	 * TODO: Extend to full range when the proper interface (lmem_provisioned) is added
-	 */
-	return SZ_4M;
-}
-
 static void munmap_vf_lmem(struct lmem_info *lmem)
 {
 	igt_debug_on_f(munmap(lmem->addr, lmem->size),
@@ -683,10 +677,49 @@ static bool lmem_mmap_write_munmap(int pf_fd, int vf_num, size_t length, char va
 	return result;
 }
 
-static void lmem_subcheck_init(struct subcheck_data *data)
+static int populate_vf_lmem_sizes(struct subcheck_data *data)
 {
 	struct lmem_data *ldata = (struct lmem_data *)data;
+	struct xe_sriov_provisioned_range *ranges;
+	unsigned int nr_ranges, gt;
+	int ret;
+
+	ldata->vf_lmem_size = calloc(data->num_vfs + 1, sizeof(size_t));
+	igt_assert(ldata->vf_lmem_size);
+
+	xe_for_each_gt(data->pf_fd, gt) {
+		ret = xe_sriov_pf_debugfs_read_provisioned_ranges(data->pf_fd,
+								  XE_SRIOV_SHARED_RES_LMEM,
+								  gt, &ranges, &nr_ranges);
+		if (ret) {
+			set_skip_reason(data, "Failed read %s on gt%u (%d)\n",
+					xe_sriov_debugfs_provisioned_attr_name(XE_SRIOV_SHARED_RES_LMEM),
+					gt, ret);
+			return -1;
+		}
+
+		for (unsigned int i = 0; i < nr_ranges; ++i) {
+			const unsigned int vf_id = ranges[i].vf_id;
+
+			igt_assert(vf_id >= 1 && vf_id <= data->num_vfs);
+			/* Sum the allocation for vf_id (inclusive range) */
+			ldata->vf_lmem_size[vf_id] += ranges[i].end - ranges[i].start + 1;
+		}
+
+		free(ranges);
+	}
+
+	for (int vf_id = 1; vf_id <= data->num_vfs; ++vf_id)
+		if (!ldata->vf_lmem_size[vf_id]) {
+			set_skip_reason(data, "No LMEM provisioned for VF%u\n", vf_id);
+			return -1;
+		}
 
+	return 0;
+}
+
+static void lmem_subcheck_init(struct subcheck_data *data)
+{
 	igt_assert_fd(data->pf_fd);
 	igt_assert(data->num_vfs);
 
@@ -695,11 +728,9 @@ static void lmem_subcheck_init(struct subcheck_data *data)
 		return;
 	}
 
-	ldata->vf_lmem_size = calloc(data->num_vfs + 1, sizeof(size_t));
-	igt_assert(ldata->vf_lmem_size);
-
-	for (int vf_id = 1; vf_id <= data->num_vfs; ++vf_id)
-		ldata->vf_lmem_size[vf_id] = get_vf_lmem_size(ldata->base.pf_fd, vf_id);
+	if (populate_vf_lmem_sizes(data))
+		/* skip reason set in populate_vf_lmem_sizes */
+		return;
 }
 
 static void lmem_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
-- 
2.31.1

