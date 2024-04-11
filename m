Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA09C4345F
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 18:34:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBD9810F2B0;
	Thu, 11 Apr 2024 18:34:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AMXSdSg9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 682C310F2B0
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 18:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712860494; x=1744396494;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cepI2xMXRp6oPoq3AgLg46YjPtP1eipbc4pfYgCR1pU=;
 b=AMXSdSg9Uhff35idBy6MLUKwr4DiPheyy4/xdCmrZpNB4G4hJCiH2NVD
 OhO2+MEV1cGvNtCiBKr81ILFVPvT5j5YEnsB4VdW518eztXy4qwa3iYis
 9nqAjNN9A/oh1VMSC8IWc7u4VgSK6By9P1dG+uxHhrte0FhGsRACdbMef
 GhpnhAgJt0i0yfSDJI26iDErKpzjc5khW/N/PnS1+8b3UY/GKfBKrunsS
 M74bxQoogT4stWvKqEJpR7h/Ujl60KX116/syNe4ldd4I8WU6fI8ULYIg
 1wv5D6mIxFJiNJuZkzga4n8J8DKcoI2dW1Vxxu6LFvu2jQW1ZE9+ORmyl w==;
X-CSE-ConnectionGUID: yw/iEAWKT1OY0wJdAOf9jQ==
X-CSE-MsgGUID: SXgot0vJTW66m1Ec0DecSA==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8852302"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="8852302"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 11:34:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="827793653"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="827793653"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 11 Apr 2024 11:34:50 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 11 Apr 2024 21:34:50 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t v2 1/4] lib/kms: Introduce struct igt_forced_connector
Date: Thu, 11 Apr 2024 21:34:47 +0300
Message-ID: <20240411183450.6417-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
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

Give the forced_connector[] struct a proper type name,
and utilize it in various places to make the code
less messy.

Cc: Kunal Joshi <kunal1.joshi@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 50 +++++++++++++++++++++++++++++++-------------------
 1 file changed, 31 insertions(+), 19 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 60339565a192..d20a93372540 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -91,12 +91,14 @@
 #define MAX_EDID 2
 #define DISPLAY_TILE_BLOCK 0x12
 
-static struct {
+struct igt_forced_connector {
 	uint32_t connector_type;
 	uint32_t connector_type_id;
 	int idx;
 	int dir;
-} forced_connectors[MAX_CONNECTORS + 1];
+};
+
+static struct igt_forced_connector forced_connectors[MAX_CONNECTORS + 1];
 
 /**
  * igt_kms_get_base_edid:
@@ -1498,31 +1500,37 @@ static bool connector_is_forced(int idx, drmModeConnector *connector)
 	igt_assert(connector->connector_type != 0);
 
 	for (int i = 0; forced_connectors[i].connector_type; i++) {
-		if (forced_connectors[i].idx == idx &&
-		    forced_connectors[i].connector_type == connector->connector_type &&
-		    forced_connectors[i].connector_type_id == connector->connector_type_id)
+		struct igt_forced_connector *c = &forced_connectors[i];
+
+		if (c->idx == idx &&
+		    c->connector_type == connector->connector_type &&
+		    c->connector_type_id == connector->connector_type_id)
 			return true;
 	}
 
 	return false;
 }
 
-static int forced_connector_free_index(void)
+static struct igt_forced_connector *forced_connector_alloc(void)
 {
 	int i;
 
 	for (i = 0; forced_connectors[i].connector_type; i++)
 		;
 
-	return i < ARRAY_SIZE(forced_connectors) ? i : -1;
+	if (i >= ARRAY_SIZE(forced_connectors))
+		return NULL;
+
+	return &forced_connectors[i];
 }
 
 static bool force_connector(int drm_fd,
 			    drmModeConnector *connector,
 			    const char *value)
 {
+	struct igt_forced_connector *c;
 	char name[80];
-	int i, idx, dir;
+	int idx, dir;
 
 	idx = igt_device_get_card_index(drm_fd);
 	if (idx < 0 || idx > 63)
@@ -1549,17 +1557,17 @@ static bool force_connector(int drm_fd,
 		return true;
 	}
 
-	i = forced_connector_free_index();
-	if (i < 0) {
+	c = forced_connector_alloc();
+	if (!c) {
 		igt_warn("Connector limit reached, %s will not be reset\n", name);
 		close(dir);
 		return true;
 	}
 
-	forced_connectors[i].idx = idx;
-	forced_connectors[i].connector_type = connector->connector_type;
-	forced_connectors[i].connector_type_id = connector->connector_type_id;
-	forced_connectors[i].dir = dir;
+	c->idx = idx;
+	c->connector_type = connector->connector_type;
+	c->connector_type_id = connector->connector_type_id;
+	c->dir = dir;
 
 	return true;
 }
@@ -1571,9 +1579,10 @@ static void dump_forced_connectors(void)
 	igt_debug("Current forced connectors:\n");
 
 	for (int i = 0; forced_connectors[i].connector_type; i++) {
-		kmstest_connector_dirname(forced_connectors[i].idx,
-					  forced_connectors[i].connector_type,
-					  forced_connectors[i].connector_type_id,
+		struct igt_forced_connector *c = &forced_connectors[i];
+
+		kmstest_connector_dirname(c->idx, c->connector_type,
+					  c->connector_type_id,
 					  name, sizeof(name));
 		igt_debug("\t%s\n", name);
 	}
@@ -5302,8 +5311,11 @@ void igt_reset_connectors(void)
 {
 	/* reset the connectors stored in forced_connectors, avoiding any
 	 * functions that are not safe to call in signal handlers */
-	for (int i = 0; i < forced_connectors[i].connector_type; i++)
-		igt_sysfs_set(forced_connectors[i].dir, "status",  "detect");
+	for (int i = 0; i < forced_connectors[i].connector_type; i++) {
+		struct igt_forced_connector *c = &forced_connectors[i];
+
+		igt_sysfs_set(c->dir, "status",  "detect");
+	}
 }
 
 /**
-- 
2.43.2

