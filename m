Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7454CCD187
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 07:36:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75F9F10E554;
	Wed, 18 Sep 2024 07:36:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BPYfxXXk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55A8210E554
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 07:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726644989; x=1758180989;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Rl9evpj3DmFwFOKHrVtPo7viOBooedsMm1cjRp4LLo4=;
 b=BPYfxXXkzUg6N+6QeHYVsGuAnbpb3wNLZvQqUrguuFKB6lg9fZwtoN2m
 /yJS8Tfi8aJToM93SStu9Qmr/EXWayl17aY+Dq4Ap1JMDhfePIMNoW5jm
 pdClvyEc2WiBSCmbkfaVAiNurHWFaf8k4CYBCO9XJkjwaAZwBOefF3PhV
 Jrpwv4b8ce5ZV0vCFVQpiS6XhfBAfoyeYyj77eh3Mh5NtKu9naCaXaXf5
 yrlK0vMYmoWYG5V/Zzf+MJLZHbO7dqSepe+OZ7cAPwyXp29rOyNalmSeC
 we9saqngLN+qRMq/VEZ1mEdc66csmqWG+5mVqNQY6saTmf9xgMewsdrFT g==;
X-CSE-ConnectionGUID: 0jyiHxoeREiDh/VZPkYGig==
X-CSE-MsgGUID: S3lPeOGVSNGvGNGVn5fVdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25359023"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="25359023"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 00:36:29 -0700
X-CSE-ConnectionGUID: 5Q2lJnZZQ8ixDqYQUYah4g==
X-CSE-MsgGUID: r3qMscCpSsCGTOzzLi33tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="73806730"
Received: from srr4-3-linux-124-kbs1.iind.intel.com ([10.190.238.68])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 00:36:27 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, santhosh.reddy.guddati@intel.com,
 kunal1.joshi@intel.com, Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v3 2/3] lib/kms: Update force joiner helpers to
 accomodate ultrajoiner
Date: Wed, 18 Sep 2024 13:04:12 +0530
Message-Id: <20240918073413.28598-3-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240918073413.28598-1-karthik.b.s@intel.com>
References: <20240918073413.28598-1-karthik.b.s@intel.com>
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

