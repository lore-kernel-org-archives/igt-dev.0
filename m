Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A26DCD11C2
	for <igt-dev@archiver.kernel.org>; Wed, 10 Apr 2024 06:33:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBDC21131BF;
	Wed, 10 Apr 2024 06:33:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fa72G7jj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13C041131BF
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 06:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712730826; x=1744266826;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PPsmsB+qs3NJdFyZqRbT1JSJhR4/RX+LTqwttii/w8k=;
 b=Fa72G7jjGTrJfbcVxEq/9lYEneN2V+oNZL4GTWAOW5FaP1NnvYdsDRLe
 zrTKZ1fDkL3Mlfssne5N4YJAvKOSDShtV6GZnGA6X8C5f1lZZMivEOHS2
 wSqanq8Rkspv/RtKsBeTmq70mv6kE0TNkbUNk1T6sjeJS4DuIqX0Sibxr
 EQZE/LLlMDZI1W22YCLErQZKj9GcRrOSTx1tJOzrGU+tmI866NAwCDMy3
 t/rLCYiRbqaG/QBEArV+IcefF1Jc04uwpfm7uQtihs8ztcC6qa5MoYB3r
 +3IVXWbsBRNOu+F6NdphP4H4Ok8rVs4pXXtTFli+jAomZ6k/ZvjKpVmmg Q==;
X-CSE-ConnectionGUID: H1PAFgIGQv+4fhaREiP0lw==
X-CSE-MsgGUID: sTWY/G8LQkaeWeVQvhk5sA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="7948165"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="7948165"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 23:33:46 -0700
X-CSE-ConnectionGUID: RSOcuo+lTlKRwwp/y2HhAg==
X-CSE-MsgGUID: OvOS8MmjSUapYVYDFYla1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="25138164"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 23:33:43 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t 4/9] lib/igt_kms: refactor helpers forced_connectors
 helpers
Date: Wed, 10 Apr 2024 12:14:21 +0530
Message-Id: <20240410064426.1968399-5-kunal1.joshi@intel.com>
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

refactor connector_is_forced, forced_connector_free_index and
dump_forced_connectors to behave according to kmstest_force_type

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 46 +++++++++++++++++++++++++++++-----------------
 1 file changed, 29 insertions(+), 17 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index cc934a514..dac822c7a 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1495,28 +1495,37 @@ int igt_connector_sysfs_open(int drm_fd,
 	return conn_dir;
 }
 
-static bool connector_is_forced(int idx, drmModeConnector *connector)
+static bool connector_is_forced(int idx, drmModeConnector *connector, enum kmstest_force_type type)
 {
+	struct forced_connector *connectors;
+
+	igt_assert(type >= FORCED_CONNECTOR  && type < FORCED_CONNECTOR_MAX);
 	igt_assert(connector->connector_type != 0);
 
-	for (int i = 0; forced_connectors[i].connector_type; i++) {
-		if (forced_connectors[i].idx == idx &&
-		    forced_connectors[i].connector_type == connector->connector_type &&
-		    forced_connectors[i].connector_type_id == connector->connector_type_id)
+	connectors = type == FORCED_CONNECTOR ? forced_connectors : forced_connectors_debugfs;
+	for (int i = 0; connectors[i].connector_type; i++) {
+		if (connectors[i].idx == idx &&
+		    connectors[i].connector_type == connector->connector_type &&
+		    connectors[i].connector_type_id == connector->connector_type_id)
 			return true;
 	}
 
 	return false;
 }
 
-static int forced_connector_free_index(void)
+static int forced_connector_free_index(enum kmstest_force_type type)
 {
 	int i;
+	struct forced_connector *connectors;
+
+	igt_assert(type >= FORCED_CONNECTOR  && type < FORCED_CONNECTOR_MAX);
+	connectors = type == FORCED_CONNECTOR ? forced_connectors : forced_connectors_debugfs;
 
-	for (i = 0; forced_connectors[i].connector_type; i++)
+	for (i = 0; connectors[i].connector_type; i++)
 		;
 
-	return i < ARRAY_SIZE(forced_connectors) ? i : -1;
+	return i < (type == FORCED_CONNECTOR ? ARRAY_SIZE(forced_connectors) :
+		   ARRAY_SIZE(forced_connectors_debugfs)) ? i : -1;
 }
 
 static bool force_connector(int drm_fd,
@@ -1546,12 +1555,12 @@ static bool force_connector(int drm_fd,
 	igt_debug("Connector %s is now forced %s\n", name, value);
 
 	/* already tracked? */
-	if (connector_is_forced(idx, connector)) {
+	if (connector_is_forced(idx, connector, FORCED_CONNECTOR)) {
 		close(dir);
 		return true;
 	}
 
-	i = forced_connector_free_index();
+	i = forced_connector_free_index(FORCED_CONNECTOR);
 	if (i < 0) {
 		igt_warn("Connector limit reached, %s will not be reset\n", name);
 		close(dir);
@@ -1566,16 +1575,19 @@ static bool force_connector(int drm_fd,
 	return true;
 }
 
-static void dump_forced_connectors(void)
+static void dump_forced_connectors(enum kmstest_force_type type)
 {
 	char name[80];
+	struct forced_connector *connectors;
 
+	igt_assert(type >= FORCED_CONNECTOR  && type < FORCED_CONNECTOR_MAX);
+	connectors = type == FORCED_CONNECTOR ? forced_connectors : forced_connectors_debugfs;
 	igt_debug("Current forced connectors:\n");
 
-	for (int i = 0; forced_connectors[i].connector_type; i++) {
-		kmstest_connector_dirname(forced_connectors[i].idx,
-					  forced_connectors[i].connector_type,
-					  forced_connectors[i].connector_type_id,
+	for (int i = 0; connectors[i].connector_type; i++) {
+		kmstest_connector_dirname(connectors[i].idx,
+					  connectors[i].connector_type,
+					  connectors[i].connector_type_id,
 					  name, sizeof(name));
 		igt_debug("\t%s\n", name);
 	}
@@ -1625,7 +1637,7 @@ bool kmstest_force_connector(int drm_fd, drmModeConnector *connector,
 	if (!force_connector(drm_fd, connector, value))
 		return false;
 
-	dump_forced_connectors();
+	dump_forced_connectors(FORCED_CONNECTOR);
 
 	igt_install_exit_handler(reset_connectors_at_exit);
 
@@ -2618,7 +2630,7 @@ static void igt_handle_spurious_hpd(igt_display_t *display)
 			 conn->connector_type_id);
 	}
 
-	dump_forced_connectors();
+	dump_forced_connectors(FORCED_CONNECTOR);
 }
 
 /**
-- 
2.34.1

