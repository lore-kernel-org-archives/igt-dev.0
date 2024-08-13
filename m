Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E1E8C52D7C
	for <igt-dev@archiver.kernel.org>; Tue, 13 Aug 2024 12:15:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44ED110E31F;
	Tue, 13 Aug 2024 12:15:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EmsRn5mw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C24910E31F
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Aug 2024 12:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723551358; x=1755087358;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KikZEE1fz2MCZLTe+dfGMZy6PC9tmlDbUdxFptR9Qtk=;
 b=EmsRn5mw0wE3yllKpjUVmrN+gEhDsjJiLziVw+f31+zeV2E+dhn70jnn
 aj8/e4lVA6apmt3jIYnLo6mO97NR+8886It4T6wgyAdUHGzf9Gxt4LfDS
 3pKYvr1L1dZKFlnYqnYtCB5V2atL1j7BMueDaZBjW2iVt8YyYyLP7hFAw
 vCccfSVMSA6dGH0D+gqGEQUzT/UG6v/W5VhOJtXMyWwFrEmhvmHV3K0A5
 fuK0/V3NZYNQ0yztYwXCEw2BCC89qC1BBk3PKCP99XBRj5yb6uzAu9BxG
 8YTC5C0/Kpuk8kWkRBMc0mig0zbDkRCRqBvzri6HEMbo17rNFcWPd+zgb w==;
X-CSE-ConnectionGUID: mmw8WjXnQVaFm1ZZs6KbiA==
X-CSE-MsgGUID: LguagBSnQ3Kr335qxb38gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21869618"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="21869618"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 05:15:58 -0700
X-CSE-ConnectionGUID: La8quMhRSkqoKa7QTqYwPw==
X-CSE-MsgGUID: am3H0/zrQKqVhA6g9J0EHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="96181335"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 05:15:56 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [i-g-t 1/5] lib/igt_kms: Add infra to handle crtc arbitrary attributes
Date: Tue, 13 Aug 2024 17:36:14 +0530
Message-ID: <20240813120618.2697195-2-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240813120618.2697195-1-bhanuprakash.modem@intel.com>
References: <20240813120618.2697195-1-bhanuprakash.modem@intel.com>
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

We may want to poke at various other crtc attributes
via sysfs/debugfs. Add a mechamisn to handle crtc
arbitrary attributes.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_kms.c | 150 ++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |   3 +
 2 files changed, 153 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index e030b35a6..a8e535a8b 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -92,6 +92,7 @@
 #define DISPLAY_TILE_BLOCK 0x12
 
 typedef bool (*igt_connector_attr_set)(int dir, const char *attr, const char *value);
+typedef bool (*igt_crtc_attr_set)(int dir, const char *attr, const char *value);
 
 struct igt_connector_attr {
 	uint32_t connector_type;
@@ -102,7 +103,16 @@ struct igt_connector_attr {
 	const char *attr, *value, *reset_value;
 };
 
+struct igt_crtc_attr {
+	int pipe;
+	int idx;
+	int dir;
+	igt_crtc_attr_set set;
+	const char *attr, *value, *reset_value;
+};
+
 static struct igt_connector_attr connector_attrs[MAX_CONNECTORS];
+static struct igt_crtc_attr crtc_attrs[IGT_MAX_PIPES];
 
 /**
  * igt_kms_get_base_edid:
@@ -1802,6 +1812,125 @@ void kmstest_force_edid(int drm_fd, drmModeConnector *connector,
 	igt_assert(ret != -1);
 }
 
+static struct igt_crtc_attr *crtc_attr_find(int idx, enum pipe pipe,
+					    igt_crtc_attr_set set,
+					    const char *attr)
+{
+	igt_assert(pipe != PIPE_NONE || pipe >= IGT_MAX_PIPES);
+
+	for (int i = 0; i < ARRAY_SIZE(crtc_attrs); i++) {
+		struct igt_crtc_attr *c = &crtc_attrs[i];
+
+		if (c->idx == idx &&
+		    c->pipe == pipe &&
+		    c->set == set && !strcmp(c->attr, attr))
+			return c;
+	}
+
+	return NULL;
+}
+
+static struct igt_crtc_attr *crtc_attr_find_free(void)
+{
+	for (int i = 0; i < ARRAY_SIZE(crtc_attrs); i++) {
+		struct igt_crtc_attr *c = &crtc_attrs[i];
+
+		if (!c->attr)
+			return c;
+	}
+
+	return NULL;
+}
+
+static struct igt_crtc_attr *crtc_attr_alloc(int idx, enum pipe pipe,
+					     int dir, igt_crtc_attr_set set,
+					     const char *attr, const char *reset_value)
+{
+	struct igt_crtc_attr *c = crtc_attr_find_free();
+
+	c->idx = idx;
+	c->pipe = pipe;
+
+	c->dir = dir;
+	c->set = set;
+	c->attr = attr;
+	c->reset_value = reset_value;
+
+	return c;
+}
+
+static void crtc_attr_free(struct igt_crtc_attr *c)
+{
+	memset(c, 0, sizeof(*c));
+}
+
+static bool crtc_attr_set(int idx, enum pipe pipe,
+			  int dir, igt_crtc_attr_set set,
+			  const char *attr, const char *value,
+			  const char *reset_value)
+{
+	struct igt_crtc_attr *c;
+
+	c = crtc_attr_find(idx, pipe, set, attr);
+	if (!c)
+		c = crtc_attr_alloc(idx, pipe, dir, set, attr, reset_value);
+
+	c->value = value;
+
+	if (!c->set(c->dir, c->attr, c->value)) {
+		crtc_attr_free(c);
+		return false;
+	}
+
+	if (!strcmp(c->value, c->reset_value))
+		crtc_attr_free(c);
+
+	return true;
+}
+
+static bool crtc_attr_set_debugfs(int drm_fd, enum pipe pipe,
+				  const char *attr, const char *value,
+				  const char *reset_value)
+{
+	int idx, dir;
+
+	idx = igt_device_get_card_index(drm_fd);
+	if (idx < 0 || idx > 63)
+		return false;
+
+	dir = igt_debugfs_pipe_dir(drm_fd, pipe, O_DIRECTORY);
+	if (dir < 0)
+		return false;
+
+	if (!crtc_attr_set(idx, pipe, dir,
+			   igt_sysfs_set, attr,
+			   value, reset_value))
+		return false;
+
+	igt_info("Crtc-%d/%s is now %s\n", pipe, attr, value);
+
+	return true;
+}
+
+/**
+ * kmstest_set_connector_dpms:
+ *
+ * Dump all attr state on all crtcs.
+ */
+void dump_crtc_attrs(void)
+{
+	igt_debug("Current crtc attrs:\n");
+
+	for (int i = 0; i < ARRAY_SIZE(crtc_attrs); i++) {
+		struct igt_crtc_attr *c = &crtc_attrs[i];
+
+		if (!c->attr)
+			continue;
+
+		igt_debug("\tcrtc-%d/%s: %s\n", c->pipe, c->attr, c->value);
+	}
+}
+
 /**
  * sort_drm_modes_by_clk_dsc:
  * @a: first element
@@ -5459,6 +5588,27 @@ void igt_reset_connectors(void)
 	}
 }
 
+/**
+ * igt_reset_crtcs:
+ *
+ * Remove any forced state from the crtcs.
+ */
+void igt_reset_crtcs(void)
+{
+	/*
+	 * Reset the crtcs stored in crtc_attrs, avoiding any
+	 * functions that are not safe to call in signal handlers
+	 */
+	for (int i = 0; i < ARRAY_SIZE(crtc_attrs); i++) {
+		struct igt_crtc_attr *c = &crtc_attrs[i];
+
+		if (!c->attr)
+			continue;
+
+		c->set(c->dir, c->attr, c->reset_value);
+	}
+}
+
 /**
  * igt_watch_uevents:
  *
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index e8582a45b..6cfa6230a 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1085,6 +1085,9 @@ void igt_pipe_refresh(igt_display_t *display, enum pipe pipe, bool force);
 void igt_enable_connectors(int drm_fd);
 void igt_reset_connectors(void);
 
+void igt_reset_crtcs(void);
+void dump_crtc_attrs(void);
+
 uint32_t kmstest_get_vbl_flag(int crtc_offset);
 
 const struct edid *igt_kms_get_base_edid(void);
-- 
2.43.2

