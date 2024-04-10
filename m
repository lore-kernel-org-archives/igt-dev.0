Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDDDCCD129A
	for <igt-dev@archiver.kernel.org>; Wed, 10 Apr 2024 15:02:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 476A810E802;
	Wed, 10 Apr 2024 15:02:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K7gFSdZc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B9F7112965
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 15:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712761359; x=1744297359;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WyRmVpTAqGrFu7xArCQWMJmDabY590rcC0igXydWRv4=;
 b=K7gFSdZcQCslRYVF/zPMs3EwaKQF1qIZ4NA4/XNW4zsyhTqV6fwMA9ej
 x77URNU+N9BIBzNLyovuNXn16NSjlYe7wfuZ+Zgl7gZWOj4/TYRMHusnA
 L9qmxu0z3eXsSnPLtb2zJO3GDltIPRFcEro1Ef4yaGN6dMrvQZKYUufBA
 9S6vTxyTNKpthgoyqz33JVDrt6p0xdILS+LREju0Ib4AZv6TONS/kgCY5
 KtMaVRqH8rGVoav6Hb7/V4g6OsGLxCGPtgdLHiXQfaXdx1FXcnP3PMJjm
 66goS4rIjkX1OFTFHNYGMbbHK1L34Kuor/S3bOcYJRwPyxb+jQBLyn0MS Q==;
X-CSE-ConnectionGUID: TEwtUPGxRPmDvqXjQjKzTA==
X-CSE-MsgGUID: rYLs3JXaTk6dFeV5CRAMrw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8697269"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="8697269"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 08:02:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="827793159"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="827793159"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 10 Apr 2024 08:02:35 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 10 Apr 2024 18:02:35 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 3/3] lib/kms: Generalize forced_connectors[] to handle
 arbitrary attributes
Date: Wed, 10 Apr 2024 18:02:29 +0300
Message-ID: <20240410150229.28922-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240410150229.28922-1-ville.syrjala@linux.intel.com>
References: <20240410150229.28922-1-ville.syrjala@linux.intel.com>
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

Cc: Kunal Joshi <kunal1.joshi@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 131 ++++++++++++++++++++++++++++++++------------------
 1 file changed, 85 insertions(+), 46 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 19bb4ac66ece..5b23fada94d9 100644
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
 
-static struct igt_forced_connector forced_connectors[MAX_CONNECTORS + 1];
+static struct igt_connector_attr connector_attrs[MAX_CONNECTORS + 1];
 
 /**
  * igt_kms_get_base_edid:
@@ -1495,39 +1499,80 @@ int igt_connector_sysfs_open(int drm_fd,
 	return conn_dir;
 }
 
-static bool connector_is_forced(int idx, drmModeConnector *connector)
+static struct igt_connector_attr *connector_attr_find(int idx, drmModeConnector *connector,
+						      igt_connector_attr_set set,
+						      const char *attr)
 {
 	igt_assert(connector->connector_type != 0);
 
-	for (int i = 0; forced_connectors[i].connector_type; i++) {
-		struct igt_forced_connector *c = &forced_connectors[i];
+	for (int i = 0; connector_attrs[i].connector_type; i++) {
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
+static struct igt_connector_attr *connector_attr_alloc(int idx, drmModeConnector *connector,
+						       int dir, igt_connector_attr_set set,
+						       const char *attr, const char *reset_value)
 {
-	int i;
+	struct igt_connector_attr *c = NULL;
 
-	for (i = 0; forced_connectors[i].connector_type; i++)
-		;
+	for (int i = 0; connector_attrs[i].connector_type; i++) {
+		c = &connector_attrs[i];
+		break;
+	}
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
+	if (!c->set(c->dir, c->attr, c->value)) {
+		connector_attr_free(c);
+		return false;
+	}
 
-	igt_assert_lt(i, ARRAY_SIZE(forced_connectors));
+	c->value = value;
 
-	return &forced_connectors[i];
+	return true;
 }
 
-static bool force_connector(int drm_fd,
-			    drmModeConnector *connector,
-			    const char *value)
+static bool connector_attr_set_sysfs(int drm_fd,
+				     drmModeConnector *connector,
+				     const char *attr, const char *value,
+				     const char *reset_value)
 {
-	struct igt_forced_connector *c;
 	char name[80];
 	int idx, dir;
 
@@ -1543,45 +1588,39 @@ static bool force_connector(int drm_fd,
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
 
-	for (int i = 0; forced_connectors[i].connector_type; i++) {
-		struct igt_forced_connector *c = &forced_connectors[i];
+	for (int i = 0; connector_attrs[i].connector_type; i++) {
+		struct igt_connector_attr *c = &connector_attrs[i];
 
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
@@ -1626,7 +1665,7 @@ bool kmstest_force_connector(int drm_fd, drmModeConnector *connector,
 	if (!force_connector(drm_fd, connector, value))
 		return false;
 
-	dump_forced_connectors();
+	dump_connector_attrs();
 
 	igt_install_exit_handler(reset_connectors_at_exit);
 
@@ -2619,7 +2658,7 @@ static void igt_handle_spurious_hpd(igt_display_t *display)
 			 conn->connector_type_id);
 	}
 
-	dump_forced_connectors();
+	dump_connector_attrs();
 }
 
 /**
@@ -5303,12 +5342,12 @@ void igt_enable_connectors(int drm_fd)
  */
 void igt_reset_connectors(void)
 {
-	/* reset the connectors stored in forced_connectors, avoiding any
+	/* reset the connectors stored in connector_attrs, avoiding any
 	 * functions that are not safe to call in signal handlers */
-	for (int i = 0; i < forced_connectors[i].connector_type; i++) {
-		struct igt_forced_connector *c = &forced_connectors[i];
+	for (int i = 0; i < connector_attrs[i].connector_type; i++) {
+		struct igt_connector_attr *c = &connector_attrs[i];
 
-		igt_sysfs_set(c->dir, "status",  "detect");
+		c->set(c->dir, c->attr, c->reset_value);
 	}
 }
 
-- 
2.43.2

