Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A63CC6B1D
	for <igt-dev@archiver.kernel.org>; Wed, 14 Oct 2026 15:51:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01DA410E44E;
	Wed, 14 Oct 2026 15:51:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9711D10EA8F
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Oct 2026 15:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791993043; x=1823529043;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xxqzk5MOWQqHHyjwIxbU6muI8lCBTMyJHFFrp14v3Rk=;
 b=f3QciuQscHPlRVcW6JubwPQsX6QvaKswNkEYfnz8uXaOY5C2depDvskX
 jFX9VShslgy8QY7/txGYh8co7n/iixiJCGgQKlU/WvYKlEpjuZuwLVYbR
 tD1WAgqG00f9ZRWreUzj66S2yzv66MWyyRCdbegFyzEyrus3lpRiGvuTN
 Op8QfLpuFXdtEUkaprZN4dYKHakjgsxowHpsL7psz7vveT6TyoSDMpEly
 fGBIWT1XBswrUM1wQt4X2mvH634HEhKUrcn7MqqOHAfKEP7oHmojKMQBW
 mJAgE9AaS7pa3JWcZbNU9KXVsG3l3fBNWrZnTrJvVo9PbxyvX1o+BzKcW Q==;
X-CSE-ConnectionGUID: 4clC2aM4S8CNn0x7IZRkRg==
X-CSE-MsgGUID: p5hqdRrERBGQKMF6fLviOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="750545"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="750545"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 08:50:42 -0700
X-CSE-ConnectionGUID: urw6fscOTR2Y1wp2d7FQQQ==
X-CSE-MsgGUID: ZNV1AMMlR7Cl9B2aG/Zj8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1429425"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 08:50:41 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, karthik.b.s@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v2] tests/kms_force_connector_basic: Add EDID
 bit-banging read test
Date: Wed, 14 Oct 2026 21:20:35 +0530
Message-ID: <20261014155035.2121642-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929204450.793812-1-ramanaidu.naladala@intel.com>
References: <20260929204450.793812-1-ramanaidu.naladala@intel.com>
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

Introduce a new test that exercises EDID retrieval under different DDC
access mechanisms and verifies that valid EDID data is returned
throughout the transition.

v2: Drop EDID checksum validation and update the commit message. (Jani)

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_force_connector_basic.c | 89 ++++++++++++++++++++++++++++++-
 1 file changed, 88 insertions(+), 1 deletion(-)

diff --git a/tests/kms_force_connector_basic.c b/tests/kms_force_connector_basic.c
index c4252ea02..5b82512e7 100644
--- a/tests/kms_force_connector_basic.c
+++ b/tests/kms_force_connector_basic.c
@@ -31,6 +31,7 @@
  */
 
 #include "igt.h"
+#include "igt_edid.h"
 
 /**
  * SUBTEST: force-load-detect
@@ -45,6 +46,10 @@
  *
  * SUBTEST: prune-stale-modes
  * Description: Tests pruning of stale modes
+ *
+ * SUBTEST: force-edid-read-over-i2c-bit-banging
+ * Description: Test EDID readout over bit banging.
+ * Driver requirement: i915, xe
  */
 
 IGT_TEST_DESCRIPTION("Check the debugfs force connector/edid features work"
@@ -300,6 +305,85 @@ static void prune_stale_modes(int drm_fd, drmModeConnectorPtr connector)
 				FORCE_CONNECTOR_UNSPECIFIED);
 }
 
+static bool connector_has_valid_edid(int drm_fd, drmModeConnectorPtr connector)
+{
+	static const uint8_t header[] = {
+		0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00,
+	};
+	drmModePropertyBlobPtr blob;
+	uint64_t blob_id;
+
+	if (!kmstest_get_property(drm_fd, connector->connector_id,
+				  DRM_MODE_OBJECT_CONNECTOR, "EDID", NULL,
+				  &blob_id, NULL) || !blob_id)
+		return false;
+
+	blob = drmModeGetPropertyBlob(drm_fd, blob_id);
+	if (!blob || blob->length < EDID_BLOCK_SIZE ||
+	    memcmp(blob->data, header, sizeof(header))) {
+		if (blob)
+			drmModeFreePropertyBlob(blob);
+		return false;
+	}
+
+	drmModeFreePropertyBlob(blob);
+	return true;
+}
+
+static void force_edid_over_bit_banging(int drm_fd,
+					drmModeConnectorPtr connector)
+{
+	char connector_name[32];
+	char debugfs_path[64];
+	drmModeConnector *temp;
+
+	igt_require_intel(drm_fd);
+	snprintf(connector_name, sizeof(connector_name), "%s-%u",
+		 kmstest_connector_type_str(connector->connector_type),
+		 connector->connector_type_id);
+	snprintf(debugfs_path, sizeof(debugfs_path),
+		 "%s/intel_force_bit_banging", connector_name);
+
+	igt_require_f(igt_debugfs_exists(drm_fd, debugfs_path, O_RDONLY),
+		      "%s is not available\n", debugfs_path);
+
+	igt_assert_eq(igt_debugfs_write_connector_file(drm_fd, connector_name,
+						       "intel_force_bit_banging",
+						       "1", 1), 0);
+
+	/* Reprobe the connector with bit banging enabled. */
+	kmstest_force_connector(drm_fd, connector, FORCE_CONNECTOR_OFF);
+	kmstest_force_connector(drm_fd, connector, FORCE_CONNECTOR_ON);
+	temp = drmModeGetConnectorCurrent(drm_fd, connector->connector_id);
+	igt_assert(temp);
+	if (!connector_has_valid_edid(drm_fd, connector)) {
+		igt_debugfs_write_connector_file(drm_fd, connector_name,
+						 "intel_force_bit_banging",
+						 "0", 1);
+		igt_reset_connectors();
+		igt_fail(IGT_EXIT_FAILURE);
+	}
+	drmModeFreeConnector(temp);
+
+	igt_assert_eq(igt_debugfs_write_connector_file(drm_fd, connector_name,
+						       "intel_force_bit_banging",
+						       "0", 1), 0);
+
+	/* Reprobe once more after restoring the normal EDID read path. */
+	kmstest_force_connector(drm_fd, connector, FORCE_CONNECTOR_OFF);
+	kmstest_force_connector(drm_fd, connector, FORCE_CONNECTOR_ON);
+	temp = drmModeGetConnectorCurrent(drm_fd, connector->connector_id);
+	igt_assert(temp);
+	if (!connector_has_valid_edid(drm_fd, connector)) {
+		igt_debugfs_write_connector_file(drm_fd, connector_name,
+						 "intel_force_bit_banging",
+						 "0", 1);
+		igt_reset_connectors();
+		igt_fail(IGT_EXIT_FAILURE);
+	}
+	drmModeFreeConnector(temp);
+}
+
 static int opt_handler(int opt, int opt_index, void *data)
 {
 	switch (opt) {
@@ -338,7 +422,10 @@ int igt_main_args("", long_opts, help_str, opt_handler, NULL)
 		  force_edid },
 		{ "prune-stale-modes",
 		  "Tests pruning of stale modes.",
-		  prune_stale_modes }
+		  prune_stale_modes },
+		{ "force-edid-read-over-i2c-bit-banging",
+		  "Test EDID readout over bit banging.",
+		  force_edid_over_bit_banging },
 	};
 
 	igt_fixture() {
-- 
2.43.0

