Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD669D49208
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 10:10:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE1A10E0B0;
	Mon, 18 Nov 2024 10:10:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dqNo3riS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B98B910E36F
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 10:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731924641; x=1763460641;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+RiDrMzIdGjCVT0ERkN6mZjA/WeFUxaFsFaurT3VvzM=;
 b=dqNo3riS76ir1rc9oHvdzAbm+fSbaahnmzyNMwpFP570VaT//8QWqXWI
 yPwhhJYubLiPcMFvfRlW270xjwdcRZUgcXw7X69PDpQXddg9M73L90Gs1
 Sdyrq4FGQOpFS3BmypC1+UiVUsidCklLqrflfwr2IIfer/u2QoROprjEu
 FUjyDm1X8eq/rZ8LLjuUau/N2fKHlNST46fqVxIb70QEWPFvSy31JyTDO
 c57Gqyp6u7efOLn0eaEHlunOku0pu6ALsCFgwogOXpYrxT63b7zmytWZB
 2SCTzN0cS75yeddLddCdyLL/RvgDy8MqL65lOtaGfCsFRyQN46MXyQjdL w==;
X-CSE-ConnectionGUID: Qji4njorQACZ+crbcUFQfQ==
X-CSE-MsgGUID: EI1xiz8HQQ23+Zb0k+CPdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31809909"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="31809909"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 02:10:41 -0800
X-CSE-ConnectionGUID: qe0Ht7kATEqceDQAQV+naw==
X-CSE-MsgGUID: DfqU20XhSGSxKCFisT9AdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="94272116"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 02:10:39 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	swati2.sharma@intel.com
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [i-g-t V3 1/4] lib/igt_kms: Add infra to handle crtc arbitrary
 attributes
Date: Mon, 18 Nov 2024 15:29:45 +0530
Message-ID: <20241118095948.2017893-2-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241118095948.2017893-1-bhanuprakash.modem@intel.com>
References: <20241118095948.2017893-1-bhanuprakash.modem@intel.com>
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

V2:
 - Fix derefering of NULL pointer (Kamil)
 - Other minor cleanups (Kamil)

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_kms.c | 171 ++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |   6 ++
 2 files changed, 177 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 5d8096a17..f88c7d6c0 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -93,6 +93,7 @@
 #define DISPLAY_TILE_BLOCK 0x12
 
 typedef bool (*igt_connector_attr_set)(int dir, const char *attr, const char *value);
+typedef bool (*igt_crtc_attr_set)(int dir, const char *attr, const char *value);
 
 struct igt_connector_attr {
 	uint32_t connector_type;
@@ -103,7 +104,16 @@ struct igt_connector_attr {
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
@@ -1827,6 +1837,146 @@ void kmstest_force_edid(int drm_fd, drmModeConnector *connector,
 	igt_assert(ret != -1);
 }
 
+static struct igt_crtc_attr *crtc_attr_find(int idx, enum pipe pipe,
+					    igt_crtc_attr_set set,
+					    const char *attr)
+{
+	igt_assert(pipe > PIPE_NONE && pipe < IGT_MAX_PIPES);
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
+	igt_assert(c);
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
+ * igt_set_crtc_attrs:
+ * @drm_fd: drm file descriptor
+ * @pipe: pipe
+ * @attr: attribute to set
+ * @value: value to set
+ * @reset_value: value to reset to
+ *
+ * Set the attribute @attr to @value on the crtc-@pipe.
+ *
+ * @return: true on success
+ */
+bool igt_set_crtc_attrs(int drm_fd, enum pipe pipe,
+			const char *attr, const char *value,
+			const char *reset_value)
+{
+	return crtc_attr_set_debugfs(drm_fd, pipe, attr, value, reset_value);
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
@@ -5484,6 +5634,27 @@ void igt_reset_connectors(void)
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
index bd154d1c1..51eba3c69 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1110,6 +1110,12 @@ void igt_pipe_refresh(igt_display_t *display, enum pipe pipe, bool force);
 void igt_enable_connectors(int drm_fd);
 void igt_reset_connectors(void);
 
+bool igt_set_crtc_attrs(int drm_fd, enum pipe pipe,
+			const char *attr, const char *value,
+			const char *reset_value);
+void igt_reset_crtcs(void);
+void dump_crtc_attrs(void);
+
 uint32_t kmstest_get_vbl_flag(int crtc_offset);
 
 const struct edid *igt_kms_get_base_edid(void);
-- 
2.43.0

