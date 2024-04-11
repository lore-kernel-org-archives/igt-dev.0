Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0513C4345F
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 18:35:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A113D10F2B2;
	Thu, 11 Apr 2024 18:35:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H2DuPPEu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADE5310F2B2
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 18:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712860500; x=1744396500;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s9d9+XwqeBgYUmYRvK1GPmmpfLqt/RB5HV/DnXuyrBU=;
 b=H2DuPPEu03V13QATolmmHWhQnK0U6e2YMhFoY22v/wg/u3mjq9WmNgmg
 Gp9ojtgVUOpLT0ajL6PIn09Ai4TLJbuoDwauJq4Gm5eD8we5wlLHlWy+N
 Qq63LfvG1aMBf02iNpDosJpedWJl0OALJ1QajO9TjOURsD8E04LHFPHM8
 F5MEo+Egqkq7W+nwsy0LEy0JMRzjpNPCIrv8CX/hnAbM4cmeJ+j92VNtE
 tphsoRbeWv7+Xj2TmhgUFKtkzDSJDGXeWnEAEP0cv5Af7rlTzqhCeY8AM
 09+HtYHCTSfsKhAlLLJvjotgNu88sqzixlOx1gVJ5+dZmum/LM55t2AAb A==;
X-CSE-ConnectionGUID: Se+piDZXSEid5Ta06zfqFQ==
X-CSE-MsgGUID: UQLyzEDGT1aJEpvxsZXH0Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8852314"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="8852314"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 11:34:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="827793659"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="827793659"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 11 Apr 2024 11:34:57 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 11 Apr 2024 21:34:56 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t v2 3/4] lib/kms: Generalize forced_connectors[] to
 handle arbitrary attributes
Date: Thu, 11 Apr 2024 21:34:49 +0300
Message-ID: <20240411183450.6417-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240411183450.6417-1-ville.syrjala@linux.intel.com>
References: <20240411183450.6417-1-ville.syrjala@linux.intel.com>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

We may want to poke at various other connector attributes
via sysfs/debugfs. Generalize the existing the force_connectors
mechamisn to handle arbitrary attributes.

v2: Fix connector_attr_alloc()
    Set c->value before using it

Cc: Kunal Joshi <kunal1.joshi@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 143 ++++++++++++++++++++++++++++++++------------------
 1 file changed, 92 insertions(+), 51 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 86651e3de348..3da49d1ccb6e 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -91,14 +91,18 @@
 #define MAX_EDID 2
 #define DISPLAY_TILE_BLOCK 0x12
 
-struct igt_forced_connector {
+typedef bool (*igt_connector_attr_set)(int dir, const char *attr, const char *value);
+
+struct igt_connector_attr {
 	uint32_t connector_type;
 	uint32_t connector_type_id;
 	int idx;
 	int dir;
+	igt_connector_attr_set set;
+	const char *attr, *value, *reset_value;
 };
 
-static struct igt_forced_connector forced_connectors[MAX_CONNECTORS];
+static struct igt_connector_attr connector_attrs[MAX_CONNECTORS];
 
 /**
  * igt_kms_get_base_edid:
@@ -1495,39 +1499,87 @@ int igt_connector_sysfs_open(int drm_fd,
 	return conn_dir;
 }
 
-static bool connector_is_forced(int idx, drmModeConnector *connector)
+static struct igt_connector_attr *connector_attr_find(int idx, drmModeConnector *connector,
+						      igt_connector_attr_set set,
+						      const char *attr)
 {
 	igt_assert(connector->connector_type != 0);
 
-	for (int i = 0; i < ARRAY_SIZE(forced_connectors); i++) {
-		struct igt_forced_connector *c = &forced_connectors[i];
+	for (int i = 0; i < ARRAY_SIZE(connector_attrs); i++) {
+		struct igt_connector_attr *c = &connector_attrs[i];
 
 		if (c->idx == idx &&
 		    c->connector_type == connector->connector_type &&
-		    c->connector_type_id == connector->connector_type_id)
-			return true;
+		    c->connector_type_id == connector->connector_type_id &&
+		    c->set == set && !strcmp(c->attr, attr))
+			return c;
 	}
 
-	return false;
+	return NULL;
 }
 
-static struct igt_forced_connector *forced_connector_alloc(void)
+static struct igt_connector_attr *connector_attr_find_free(void)
 {
-	for (int i = 0; i < ARRAY_SIZE(forced_connectors); i++) {
-		struct igt_forced_connector *c = &forced_connectors[i];
+	for (int i = 0; i < ARRAY_SIZE(connector_attrs); i++) {
+		struct igt_connector_attr *c = &connector_attrs[i];
 
-		if (!c->connector_type)
+		if (!c->attr)
 			return c;
 	}
 
 	return NULL;
 }
 
-static bool force_connector(int drm_fd,
-			    drmModeConnector *connector,
-			    const char *value)
+static struct igt_connector_attr *connector_attr_alloc(int idx, drmModeConnector *connector,
+						       int dir, igt_connector_attr_set set,
+						       const char *attr, const char *reset_value)
+{
+	struct igt_connector_attr *c = connector_attr_find_free();
+
+	c->idx = idx;
+	c->connector_type = connector->connector_type;
+	c->connector_type_id = connector->connector_type_id;
+
+	c->dir = dir;
+	c->set = set;
+	c->attr = attr;
+	c->reset_value = reset_value;
+
+	return c;
+}
+
+static void connector_attr_free(struct igt_connector_attr *c)
+{
+	memset(c, 0, sizeof(*c));
+}
+
+static bool connector_attr_set(int idx, drmModeConnector *connector,
+			       int dir, igt_connector_attr_set set,
+			       const char *attr, const char *value,
+			       const char *reset_value)
+{
+	struct igt_connector_attr *c;
+
+	c = connector_attr_find(idx, connector, set, attr);
+	if (!c)
+		c = connector_attr_alloc(idx, connector, dir, set,
+					 attr, reset_value);
+
+	c->value = value;
+
+	if (!c->set(c->dir, c->attr, c->value)) {
+		connector_attr_free(c);
+		return false;
+	}
+
+	return true;
+}
+
+static bool connector_attr_set_sysfs(int drm_fd,
+				     drmModeConnector *connector,
+				     const char *attr, const char *value,
+				     const char *reset_value)
 {
-	struct igt_forced_connector *c;
 	char name[80];
 	int idx, dir;
 
@@ -1543,53 +1595,42 @@ static bool force_connector(int drm_fd,
 	if (dir < 0)
 		return false;
 
-	if (!igt_sysfs_set(dir, "status", value)) {
-		close(dir);
+	if (!connector_attr_set(idx, connector, dir,
+				igt_sysfs_set, attr, value, reset_value))
 		return false;
-	}
 
-	igt_debug("Connector %s is now forced %s\n", name, value);
-
-	/* already tracked? */
-	if (connector_is_forced(idx, connector)) {
-		close(dir);
-		return true;
-	}
-
-	c = forced_connector_alloc();
-	if (!c) {
-		igt_warn("Connector limit reached, %s will not be reset\n", name);
-		close(dir);
-		return true;
-	}
-
-	c->idx = idx;
-	c->connector_type = connector->connector_type;
-	c->connector_type_id = connector->connector_type_id;
-	c->dir = dir;
+	igt_debug("Connector %s/%s is now %s\n", name, attr, value);
 
 	return true;
 }
 
-static void dump_forced_connectors(void)
+static void dump_connector_attrs(void)
 {
 	char name[80];
 
-	igt_debug("Current forced connectors:\n");
+	igt_debug("Current connector attrs:\n");
 
-	for (int i = 0; i < ARRAY_SIZE(forced_connectors); i++) {
-		struct igt_forced_connector *c = &forced_connectors[i];
+	for (int i = 0; i < ARRAY_SIZE(connector_attrs); i++) {
+		struct igt_connector_attr *c = &connector_attrs[i];
 
-		if (!c->connector_type)
+		if (!c->attr)
 			continue;
 
 		kmstest_connector_dirname(c->idx, c->connector_type,
 					  c->connector_type_id,
 					  name, sizeof(name));
-		igt_debug("\t%s\n", name);
+		igt_debug("\t%s/%s: %s\n", name, c->attr, c->value);
 	}
 }
 
+static bool force_connector(int drm_fd,
+			    drmModeConnector *connector,
+			    const char *value)
+{
+	return connector_attr_set_sysfs(drm_fd, connector,
+					"status", value, "detect");
+}
+
 /**
  * kmstest_force_connector:
  * @fd: drm file descriptor
@@ -1634,7 +1675,7 @@ bool kmstest_force_connector(int drm_fd, drmModeConnector *connector,
 	if (!force_connector(drm_fd, connector, value))
 		return false;
 
-	dump_forced_connectors();
+	dump_connector_attrs();
 
 	igt_install_exit_handler(reset_connectors_at_exit);
 
@@ -2627,7 +2668,7 @@ static void igt_handle_spurious_hpd(igt_display_t *display)
 			 conn->connector_type_id);
 	}
 
-	dump_forced_connectors();
+	dump_connector_attrs();
 }
 
 /**
@@ -5311,15 +5352,15 @@ void igt_enable_connectors(int drm_fd)
  */
 void igt_reset_connectors(void)
 {
-	/* reset the connectors stored in forced_connectors, avoiding any
+	/* reset the connectors stored in connector_attrs, avoiding any
 	 * functions that are not safe to call in signal handlers */
-	for (int i = 0; i < ARRAY_SIZE(forced_connectors); i++) {
-		struct igt_forced_connector *c = &forced_connectors[i];
+	for (int i = 0; i < ARRAY_SIZE(connector_attrs); i++) {
+		struct igt_connector_attr *c = &connector_attrs[i];
 
-		if (!c->connector_type)
+		if (!c->attr)
 			continue;
 
-		igt_sysfs_set(c->dir, "status",  "detect");
+		c->set(c->dir, c->attr, c->reset_value);
 	}
 }
 
-- 
2.43.2

