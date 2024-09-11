Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A23D5EE0214
	for <igt-dev@archiver.kernel.org>; Wed, 11 Sep 2024 07:24:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C23310E805;
	Wed, 11 Sep 2024 07:24:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PIC9ffb6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C76010E805
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Sep 2024 07:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726039455; x=1757575455;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8h6TSOy6r/kAg0OWdRwnruu2NBRjZaO1mLElGXY/8EE=;
 b=PIC9ffb6T+ZDgYHvWo0TTZgs0vSFtUoaGFaXy0U4N4TYWqW996iPR1qY
 L5qPUgAp0leOxyuklX/6QOI9PrdZgS9FASoTLLsVFgOyogOi/Jtj6IZMi
 0LkkEjxHRLJeg41Hx0JNjcefQ4ozoNjcm7ppckhn+BLZcMyfroUXZAvjF
 5q8WvDDyhZve9lEGmrWw/PF+cZelvLkiwFMp8QQadOTEnMJshqdBYBn74
 GO5ZrU6ndYG5GcKB7aFEY5zldJx93fZmps12tjkvE3R5bRoEksT0UFNux
 k658tab/iDtCU+q68qEZ+y5SY/1x4cOTwhTfUFHGFA8KDUnIXAsFrzJ0e Q==;
X-CSE-ConnectionGUID: uBkQC9SQTCSVOUJSJMgnqw==
X-CSE-MsgGUID: xWiY2w1ERM+pUu7g8lVxDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="13468084"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="13468084"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 00:24:15 -0700
X-CSE-ConnectionGUID: JjxabIbIQmajr6bjhk77Dw==
X-CSE-MsgGUID: h333fy9iRB6UyKI05kBaUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="67116439"
Received: from srr4-3-linux-124-kbs1.iind.intel.com ([10.190.238.68])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 00:24:13 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, santhosh.reddy.guddati@intel.com,
 kunal1.joshi@intel.com, bhanuprakash.modem@intel.com,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v2 2/3] lib/kms: Update force joiner helpers to
 accomodate Ultra joiner
Date: Wed, 11 Sep 2024 12:52:03 +0530
Message-Id: <20240911072204.22825-3-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240911072204.22825-1-karthik.b.s@intel.com>
References: <20240911072204.22825-1-karthik.b.s@intel.com>
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

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 lib/igt_kms.c            | 33 +++++++++++++++++++++++++--------
 lib/igt_kms.h            |  2 +-
 tests/intel/kms_joiner.c |  2 +-
 3 files changed, 27 insertions(+), 10 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index cf453dcfc..34e6d0cad 100644
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
+	case 0:
+		value = "0";
+		break;
+	case 1:
+		value = "1";
+		break;
+	case 2:
+		value = "2";
+		break;
+	case 4:
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
index 4455632f4..c25acbb5f 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -262,7 +262,7 @@ struct edid;
 
 bool kmstest_force_connector(int fd, drmModeConnector *connector,
 			     enum kmstest_force_connector_state state);
-bool kmstest_force_connector_bigjoiner(int drm_fd, drmModeConnector *connector);
+bool kmstest_force_connector_joiner(int drm_fd, drmModeConnector *connector, int joined_pipes);
 void kmstest_force_edid(int drm_fd, drmModeConnector *connector,
 			const struct edid *edid);
 
diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index 633bf51c7..13863d5e1 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -106,7 +106,7 @@ static void enable_force_joiner_on_all_non_big_joiner_outputs(data_t *data)
 
 	for (i = 0; i < data->non_big_joiner_output_count; i++) {
 		output = data->non_big_joiner_output[i];
-		status = kmstest_force_connector_bigjoiner(data->drm_fd, output->config.connector);
+		status = kmstest_force_connector_joiner(data->drm_fd, output->config.connector, 2);
 		igt_assert_f(status, "Failed to toggle force joiner\n");
 	}
 }
-- 
2.39.1

