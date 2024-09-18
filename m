Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3926DCCD19A
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 11:10:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBCEC10E23C;
	Wed, 18 Sep 2024 11:10:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g0OpxogE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3D7610E23C
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 11:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726657810; x=1758193810;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N3xu8flzSKnPKr+Mrrk12P/LM8tVjEA9Ny7OZSix3FA=;
 b=g0OpxogEr97ftStiXujSthOzZOxNj7jbFLTOQqQq+V21ubp/jWT1AGwC
 GJg+rYBEo+YVuah3mFKg1Nu+91JZHBI4jjhgjssVVbEa1WXFOQ+ixM8l0
 a26cSm1wFctJxS1MEeDDEdMe7akc6IhJmjpkTY1yXNCZGTYdKvngDTKL3
 kYIxFwMeYnRWABI0smfhpj+qxcCpONbreWjKUA+gDR4qKB4picXCExaJB
 yK0yIL4Kz11EJvLEycOXnA6cvB/PFWc9I26Y5zTtv4Xtrf9IFkVqlDwP7
 7cStBUemCf7HUAPN8cF2j4UCY2RsI4Kroj5A2l3Rw2YSwQBMTfpzM6GRi w==;
X-CSE-ConnectionGUID: QaAtOZ1GRJ6lCsz9fF5jNw==
X-CSE-MsgGUID: XysjWEpTQu25qh+kl9ikwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25682184"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="25682184"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 04:10:10 -0700
X-CSE-ConnectionGUID: FZN4BtHqSGuM9oW3ne3IBQ==
X-CSE-MsgGUID: 22CfXXIJTDmqwqzRC8YOtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="69499936"
Received: from srr4-3-linux-124-kbs1.iind.intel.com ([10.190.238.68])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 04:10:07 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, santhosh.reddy.guddati@intel.com,
 kunal1.joshi@intel.com, Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v4 2/3] lib/kms: Update force joiner helpers to
 accomodate ultrajoiner
Date: Wed, 18 Sep 2024 16:37:53 +0530
Message-Id: <20240918110754.26140-3-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240918110754.26140-1-karthik.b.s@intel.com>
References: <20240918110754.26140-1-karthik.b.s@intel.com>
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

v2: Split the lib updates to separate patch (Ankit)

v3: Use enum for joined pipes (Santhosh)

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Acked-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 lib/igt_kms.c            | 33 +++++++++++++++++++++++++--------
 lib/igt_kms.h            | 16 +++++++++++++++-
 tests/intel/kms_joiner.c |  2 +-
 3 files changed, 41 insertions(+), 10 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index cf453dcfc..a39d1176f 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1720,34 +1720,51 @@ bool kmstest_force_connector(int drm_fd, drmModeConnector *connector,
 	return true;
 }
 
-static bool force_connector_bigjoiner(int drm_fd,
+static bool force_connector_joiner(int drm_fd,
 				      drmModeConnector *connector,
 				      const char *value)
 {
 	return connector_attr_set_debugfs(drm_fd, connector,
-					  "i915_bigjoiner_force_enable",
+					  "i915_joiner_force_enable",
 					  value, "0");
 }
 
 /**
- * kmstest_force_connector_bigjoiner:
+ * kmstest_force_connector_joiner:
  * @fd: drm file descriptor
  * @connector: connector
  *
- * Enable force bigjoiner state on the specified connector
+ * Enable force joiner state on the specified connector
  * and install exit handler for resetting
  *
  * Returns: True on success
  */
-bool kmstest_force_connector_bigjoiner(int drm_fd, drmModeConnector *connector)
+bool kmstest_force_connector_joiner(int drm_fd, drmModeConnector *connector, int joined_pipes)
 {
-	const char *value = "1";
+	const char *value;
 	drmModeConnector *temp;
 
+	switch (joined_pipes) {
+	case JOINED_PIPES_DEFAULT:
+		value = "0";
+		break;
+	case JOINED_PIPES_NONE:
+		value = "1";
+		break;
+	case JOINED_PIPES_BIG_JOINER:
+		value = "2";
+		break;
+	case JOINED_PIPES_ULTRA_JOINER:
+		value = "4";
+		break;
+	default:
+		igt_assert(0);
+	}
+
 	if (!is_intel_device(drm_fd))
 		return false;
 
-	if (!force_connector_bigjoiner(drm_fd, connector, value))
+	if (!force_connector_joiner(drm_fd, connector, value))
 		return false;
 
 	dump_connector_attrs();
@@ -6420,7 +6437,7 @@ bool igt_has_force_joiner_debugfs(int drmfd, char *conn_name)
 	if (debugfs_fd < 0)
 		return false;
 
-	ret = igt_debugfs_simple_read(debugfs_fd, "i915_bigjoiner_force_enable", buf, sizeof(buf));
+	ret = igt_debugfs_simple_read(debugfs_fd, "i915_joiner_force_enable", buf, sizeof(buf));
 	close(debugfs_fd);
 
 	return ret >= 0;
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 4455632f4..2461fa47c 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -260,9 +260,23 @@ enum intel_broadcast_rgb_mode {
 
 struct edid;
 
+/**
+ * joined_pipes:
+ * @JOINED_PIPES_DEFAULT: Default setting with no force joiner
+ * @JOINED_PIPES_NONE: Force to exactly one pipe
+ * @JOINED_PIPES_BIG_JOINER: Join two pipes big joiner
+ * @JOINED_PIPES_ULTRA_JOINER: Join four pipes for ultra joiner
+ */
+enum joined_pipes {
+	JOINED_PIPES_DEFAULT,
+	JOINED_PIPES_NONE,
+	JOINED_PIPES_BIG_JOINER,
+	JOINED_PIPES_ULTRA_JOINER = 4
+};
+
 bool kmstest_force_connector(int fd, drmModeConnector *connector,
 			     enum kmstest_force_connector_state state);
-bool kmstest_force_connector_bigjoiner(int drm_fd, drmModeConnector *connector);
+bool kmstest_force_connector_joiner(int drm_fd, drmModeConnector *connector, int joined_pipes);
 void kmstest_force_edid(int drm_fd, drmModeConnector *connector,
 			const struct edid *edid);
 
diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index 633bf51c7..e193f9071 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -106,7 +106,7 @@ static void enable_force_joiner_on_all_non_big_joiner_outputs(data_t *data)
 
 	for (i = 0; i < data->non_big_joiner_output_count; i++) {
 		output = data->non_big_joiner_output[i];
-		status = kmstest_force_connector_bigjoiner(data->drm_fd, output->config.connector);
+		status = kmstest_force_connector_joiner(data->drm_fd, output->config.connector, JOINED_PIPES_BIG_JOINER);
 		igt_assert_f(status, "Failed to toggle force joiner\n");
 	}
 }
-- 
2.39.1

