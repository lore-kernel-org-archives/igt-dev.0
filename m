Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23155CA5FA7
	for <igt-dev@archiver.kernel.org>; Tue, 29 Sep 2026 20:45:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92BFA10F0B3;
	Tue, 29 Sep 2026 20:45:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ih9/d+4V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C5A110F0B3
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2026 20:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790714693; x=1822250693;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dp8D7URpzYlamB+lXfrwLm2sotQ5bPtv0cnlqbtWG4w=;
 b=ih9/d+4VLHSeU7sTbmbtkJNYDfp2XuJCJjFPtDYt6AVqWjrxPicJcZih
 YYYYvoNS3AJtNdSMxtcgG5Jl0iCOLLikVJ5QkUElR32QV7cc45qmYIrsN
 HL3odBxRQVWvbkqZTcT+xHar/5Dm0TQ+2Rit0zitqklaPrg/sFsNSZhEZ
 NHqHMxBTTgmRSsY8CMpurMwtrxSvgTZgDhV6xJHpOXidWOntzoq25Mtbn
 k84UuKszZ1O2sjFHKqiZ8afYJ1lcd038BRCfyxJthucrOaap6m1xx0ThQ
 UC36ts3G3A1RNkMEWZyBzoSHdTR+uywHenQO65IrWU4cdY/d6+4WE4op/ g==;
X-CSE-ConnectionGUID: MC1UsJU6QJi/gaSLlcmYdw==
X-CSE-MsgGUID: CyG7YxVhRIyr3IlqU7Xqog==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="116974083"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="116974083"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 13:44:52 -0700
X-CSE-ConnectionGUID: OwQvs30QRfetTOXSnXVHVg==
X-CSE-MsgGUID: n8mXVgTzSCi/MCgU9x37Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="313419962"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 13:44:50 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1] tests/kms_force_connector_basic: Add EDID
 bit-banging read test
Date: Wed, 30 Sep 2026 02:14:50 +0530
Message-ID: <20260929204450.793812-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add a new IGT subtest to verify EDID retrieval through the I2C
bit-banging path.

The test forces EDID accesses to use the fallback software-driven I2C
mechanism, triggers connector reprobe, and verifies that a valid EDID
is exposed by the connector. It then restores the default EDID access
path and repeats the verification.
 
This provides coverage for EDID detection through both the fallback
and default mechanisms, helping to catch regressions in connector
probing and display identification.

Assisted-by: OpenAI Codex:GPT-5
Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_force_connector_basic.c | 91 ++++++++++++++++++++++++++++++-
 1 file changed, 90 insertions(+), 1 deletion(-)

diff --git a/tests/kms_force_connector_basic.c b/tests/kms_force_connector_basic.c
index c4252ea02..1f2ff3595 100644
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
+ * Driver requirement: i915
  */
 
 IGT_TEST_DESCRIPTION("Check the debugfs force connector/edid features work"
@@ -300,6 +305,87 @@ static void prune_stale_modes(int drm_fd, drmModeConnectorPtr connector)
 				FORCE_CONNECTOR_UNSPECIFIED);
 }
 
+static bool connector_has_valid_edid(int drm_fd, drmModeConnectorPtr connector)
+{
+	static const uint8_t header[] = {
+		0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00,
+	};
+	drmModePropertyBlobPtr blob;
+	uint64_t blob_id;
+	uint8_t checksum = 0;
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
+	for (size_t i = 0; i < EDID_BLOCK_SIZE; i++)
+		checksum += ((const uint8_t *)blob->data)[i];
+
+	drmModeFreePropertyBlob(blob);
+	return checksum == 0;
+}
+
+static void force_edid_over_bit_banging(int drm_fd,
+					drmModeConnectorPtr connector)
+{
+	char connector_name[32];
+	char debugfs_path[64];
+	drmModeConnector *temp;
+
+	igt_require_i915(drm_fd);
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
+		igt_warn("No valid EDID found with bit banging enabled\n");
+		igt_debugfs_write_connector_file(drm_fd, connector_name,
+						 "intel_force_bit_banging", "0", 1);
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
+		igt_warn("No valid EDID found after disabling bit banging\n");
+		igt_reset_connectors();
+		igt_fail(IGT_EXIT_FAILURE);
+	}
+	drmModeFreeConnector(temp);
+}
+
 static int opt_handler(int opt, int opt_index, void *data)
 {
 	switch (opt) {
@@ -338,7 +424,10 @@ int igt_main_args("", long_opts, help_str, opt_handler, NULL)
 		  force_edid },
 		{ "prune-stale-modes",
 		  "Tests pruning of stale modes.",
-		  prune_stale_modes }
+		  prune_stale_modes },
+		{ "force-edid-read-over-i2c-bit-banging",
+		  "Test EDID readout over bit banging.",
+		  force_edid_over_bit_banging }
 	};
 
 	igt_fixture() {
-- 
2.43.0

