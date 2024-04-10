Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07491CD1296
	for <igt-dev@archiver.kernel.org>; Wed, 10 Apr 2024 06:33:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 834181131C1;
	Wed, 10 Apr 2024 06:33:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FXreXHR0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF82A1131BF
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 06:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712730829; x=1744266829;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3OzgAGwTYW2QgMBHoj0aPagBpQweAMDJ8xsiQ3v0VUA=;
 b=FXreXHR0LeXRalDHAJ+iHvnX2EI1yqIEznmH/pWrEE/ZRYRRpDzKNe8w
 5F1p6gK8wGYJj2lVP+PdB4ojblrcIG++YIbFsid++YrUKhn4g6zTi7kxk
 FEZcrgWwYOA0FILVn9kLXhWbw7Nil5MqRjRT+XVPzlIpIsz/YQUst4rQk
 WI/XfoabpvSz7+QBTsxJeIrgX1fnS/lMln1JzdlDnyjZ4fuilAx1+R2AB
 4wrykzQEyguE3rwDPguOcN22U5YcdMZl2tYTLK8x7S/sWJOFFjBp41+q+
 bvfLGwofpy2R2XXl1qrP3ChhdpDpYTTdr4I0aQmATnQMBKJRtdtEym6Xb g==;
X-CSE-ConnectionGUID: TaRaXmX3SjyIeOLZzs76ow==
X-CSE-MsgGUID: DDbgEs5WQ/ysyBZ5mT+EoQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="7948170"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="7948170"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 23:33:49 -0700
X-CSE-ConnectionGUID: zthjF2fNQx2kxaRAHVnZgw==
X-CSE-MsgGUID: rJ38npxXSnmHEYEVLdHJtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="25138185"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 23:33:46 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t 5/9] lib/igt_kms: add igt_reset_connectors_debugfs
Date: Wed, 10 Apr 2024 12:14:22 +0530
Message-Id: <20240410064426.1968399-6-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240410064426.1968399-1-kunal1.joshi@intel.com>
References: <20240410064426.1968399-1-kunal1.joshi@intel.com>
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

add igt_reset_connectors_debugfs to clean the state
along with some helpers to get debugfs attribute and default value
to set.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 38 ++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h | 11 +++++++++++
 2 files changed, 49 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index dac822c7a..18605531b 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1495,6 +1495,26 @@ int igt_connector_sysfs_open(int drm_fd,
 	return conn_dir;
 }
 
+static const char *get_debugfs_default_value(enum kmstest_force_debugfs debugfs)
+{
+	switch (debugfs) {
+	case FORCE_JOINER:
+		return "0";
+	default:
+		return "0";
+	}
+}
+
+static const char *get_debugfs_default_attr(enum kmstest_force_debugfs debugfs)
+{
+	switch (debugfs) {
+	case FORCE_JOINER:
+		return "i915_bigjoiner_force_enable";
+	default:
+		return "0";
+	}
+}
+
 static bool connector_is_forced(int idx, drmModeConnector *connector, enum kmstest_force_type type)
 {
 	struct forced_connector *connectors;
@@ -5320,6 +5340,24 @@ void igt_reset_connectors(void)
 		igt_sysfs_set(forced_connectors[i].dir, "status",  "detect");
 }
 
+/**
+ * igt_reset_connectors_debugfs:
+ *
+ * Remove any forced state from the connectors debugfs.
+ */
+void igt_reset_connectors_debugfs(void)
+{
+	/*
+	 * reset the connectors debugfs avoiding any
+	 * functions that are not safe to call in signal handlers
+	 */
+	for (int i = FORCE_JOINER; i < FORCE_DEBUGFS_MAX; i++)
+		for (int j = 0; j < forced_connectors_debugfs[j].connector_type; j++)
+			igt_sysfs_set(forced_connectors_debugfs[i].dir,
+				      get_debugfs_default_attr(i),
+				      get_debugfs_default_value(i));
+}
+
 /**
  * igt_watch_uevents:
  *
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 561edf98b..f676de737 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -256,6 +256,16 @@ enum kmstest_force_type {
 	FORCED_CONNECTOR_MAX
 };
 
+/**
+ * kmstest_force_type:
+ * @FORCED_CONNECTOR: Uses sysfs
+ * @FORCED_CONNECTOR_DEBUGFS: Uses debugfs
+*/
+enum kmstest_force_debugfs {
+	FORCE_JOINER,
+	FORCE_DEBUGFS_MAX
+};
+
 /**
  * intel_broadcast_rgb_mode:
  * @BROADCAST_RGB_AUTO: Choose the color range to use automatically
@@ -1094,6 +1104,7 @@ void igt_pipe_refresh(igt_display_t *display, enum pipe pipe, bool force);
 
 void igt_enable_connectors(int drm_fd);
 void igt_reset_connectors(void);
+void igt_reset_connectors_debugfs(void);
 
 uint32_t kmstest_get_vbl_flag(int crtc_offset);
 
-- 
2.34.1

