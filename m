Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6100E9A03B
	for <igt-dev@archiver.kernel.org>; Wed, 18 Feb 2026 10:40:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC0E10E158;
	Wed, 18 Feb 2026 10:40:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DtwbFNhf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C61110E158
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Feb 2026 10:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771411241; x=1802947241;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lyqmHsCc313uNBwyzxvcfCldLFk6mKwtoqHYDeumApE=;
 b=DtwbFNhfk67BTAqFP+rjFeK9XOd8hu3SOMCNw2hvCB/fIBy7JHGtJsXZ
 1CMN6l5GV4vWiQVK+0sJiD6xVVpuW1nvB2YLAq0TDdIibk7x+TAFZqM6Z
 ZNFYEv94qjMLa7btcT/t5bx9KPse7HY/Emg9y7gPOgsnCnbO8YyCXuZac
 yOpqzPfWp0yhUZaCF45wXnuU01ImseUNCmiqbyhguFU2rCH/GAxrwcGM8
 Ble6LwQOb+HXgubJwx9C+ENLkE9vNGZ+MHYzh1MK/eNgSyEl6VeuWlYhB
 TZ7257HyFXjDa8ppkCUYJw2ws7Zb30U+X145NU+kNFD1T+rfdygh+Xj9g w==;
X-CSE-ConnectionGUID: mgC+tFHrTyqmfjRt9KZDBg==
X-CSE-MsgGUID: s7n7hl7CSS+vSQtOdZnu4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="76344960"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="76344960"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 02:40:40 -0800
X-CSE-ConnectionGUID: eQD3H+1iT7WnXtLOgHcthA==
X-CSE-MsgGUID: amAlRrmIQgeuAPcLI21YDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="214148718"
Received: from yadavs-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 02:40:38 -0800
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.auld@intel.com
Subject: [PATCH] lib/intel_pat: Handle platforms without compressed PAT index
Date: Wed, 18 Feb 2026 16:06:09 +0530
Message-ID: <20260218103608.2015045-2-sanjay.kumar.yadav@intel.com>
X-Mailer: git-send-email 2.52.0
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

Previously intel_get_pat_idx_uc_comp() would silently return zero on
platforms where no compressed PAT index exists (e.g. CRI),
since uc_comp was zero-initialized by default. This could lead to
incorrect behavior when callers assume the returned index is valid.

Fix this by:
- Adding XE_PAT_IDX_INVALID sentinel to detect unsupported platforms
- Initializing uc_comp to XE_PAT_IDX_INVALID in intel_get_pat_idx();
  only platforms with CCS (graphics_ver 20/30) override it to a valid
  index
- Adding igt_assert_f() in intel_get_pat_idx_uc_comp() to fail with
  a clear error instead of returning an invalid index

Also update the bo-comp-disable-bind test to distinguish between "CCS
is disabled" and "CCS does not exist" using HAS_FLATCCS(). On platforms
without CCS, the compressed PAT bind check is skipped since there is no
valid compressed PAT index to test with.

Suggested-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
---
 lib/intel_pat.c      |  5 +++++
 lib/intel_pat.h      |  1 +
 tests/intel/xe_pat.c | 30 ++++++++++++++++++++++--------
 3 files changed, 28 insertions(+), 8 deletions(-)

diff --git a/lib/intel_pat.c b/lib/intel_pat.c
index 9815efc18..d30bee453 100644
--- a/lib/intel_pat.c
+++ b/lib/intel_pat.c
@@ -98,6 +98,8 @@ static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
 {
 	uint16_t dev_id = intel_get_drm_devid(fd);
 
+	pat->uc_comp = XE_PAT_IDX_INVALID;
+
 	if (intel_graphics_ver(dev_id) == IP_VER(35, 11)) {
 		pat->uc = 3;
 		pat->wb = 2;
@@ -155,8 +157,11 @@ uint8_t intel_get_pat_idx_uc_comp(int fd)
 	uint16_t dev_id = intel_get_drm_devid(fd);
 
 	igt_assert(intel_gen(dev_id) >= 20);
+	igt_assert(HAS_FLATCCS(dev_id));
 
 	intel_get_pat_idx(fd, &pat);
+	igt_assert_f(pat.uc_comp != XE_PAT_IDX_INVALID,
+		     "No compressed PAT index available on this platform\n");
 	return pat.uc_comp;
 }
 
diff --git a/lib/intel_pat.h b/lib/intel_pat.h
index e9ade2e2e..e5dd8a0af 100644
--- a/lib/intel_pat.h
+++ b/lib/intel_pat.h
@@ -10,6 +10,7 @@
 #include <stdint.h>
 
 #define DEFAULT_PAT_INDEX ((uint8_t)-1) /* igt-core can pick 1way or better */
+#define XE_PAT_IDX_INVALID ((uint8_t)-2) /* no such PAT index on this platform */
 #define XE_PAT_MAX_ENTRIES 32
 
 struct xe_pat_entry {
diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 21547c84e..052b7b699 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -844,15 +844,18 @@ static bool has_no_compression_hint(int fd)
  * Test category: functionality test
  * Description: Validates that binding a BO created with
  * the NO_COMPRESSION flag using a compressed PAT index fails
- * with -EINVAL on Xe2+ platforms.
+ * with -EINVAL on Xe2+ platforms. On platforms where CCS
+ * does not exist, the test verifies uncompressed access works.
  */
 
 static void bo_comp_disable_bind(int fd)
 {
 	size_t size = xe_get_default_alignment(fd);
-	uint8_t comp_pat_index, uncomp_pat_index;
-	bool supported;
+	uint16_t dev_id = intel_get_drm_devid(fd);
+	bool has_flatccs = HAS_FLATCCS(dev_id);
+	uint8_t uncomp_pat_index;
 	uint32_t vm, bo;
+	bool supported;
 	int ret;
 
 	supported = has_no_compression_hint(fd);
@@ -868,14 +871,25 @@ static void bo_comp_disable_bind(int fd)
 	igt_assert_eq(ret, 0);
 	vm = xe_vm_create(fd, 0, 0);
 
-	comp_pat_index = intel_get_pat_idx_uc_comp(fd);
 	uncomp_pat_index = intel_get_pat_idx_uc(fd);
 
-	igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x100000,
-				   size, 0, 0, NULL, 0,
-				   0, comp_pat_index, 0),
-		      -EINVAL);
+	/*
+	 * On platforms with CCS, binding a NO_COMPRESSION BO with a
+	 * compressed PAT index must fail. On platforms without CCS,
+	 * there is no valid compressed PAT index, so skip this check.
+	 */
+	if (has_flatccs) {
+		uint8_t comp_pat_index = intel_get_pat_idx_uc_comp(fd);
+
+		igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x100000,
+					   size, 0, 0, NULL, 0,
+					   0, comp_pat_index, 0),
+			      -EINVAL);
+	} else {
+		igt_debug("Platform has no CCS, skipping compressed PAT bind check\n");
+	}
 
+	/* Uncompressed bind must always succeed */
 	igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x100000,
 				   size, 0, 0, NULL, 0,
 				   0, uncomp_pat_index, 0),
-- 
2.52.0

