Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D77BAC04FF0
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 18:34:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53EE810F2A9;
	Thu, 11 Apr 2024 18:34:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RpR/08+E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 641A110F2A9
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 18:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712860496; x=1744396496;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7DeRlmpZ/QI+98F6shtaK4Fc6FIdpHoS95oZJB22/Tg=;
 b=RpR/08+ELszpMrp+HjNxl/tkdcBVLwt09137qFZOC9muYi/MsblqsZwt
 lgSAhCHONLPJ+/J9/+jiWFgD1TC2IHrnOb9bB9rwyZYLK5Prq7TxSKqIF
 IZ/Ats6K60Zr7VO5OrCWPlfJS7sKM3z42XWVP2MpbEq6O27UmCsjLkJ1A
 gGcH4yuHy2POFyzCFdhUDiuHu/Y7w5XisSvSeei6Bgh1Ue945lT5760x3
 b0EehDf3q5VrfWaO2mHhQn0fdykFeggmMDlX6fT0njuYIdYPdWjDL+iCf
 H0jfgT6L5jxGOI1x699rfdbO8vuKHFThGZPbmNCBMQ9on935sDiB1Zwgi Q==;
X-CSE-ConnectionGUID: NDkeU4TlTRWeCVTzhzFggg==
X-CSE-MsgGUID: /HZhUhmqThS6qnX74BvNag==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8852304"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="8852304"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 11:34:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="827793656"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="827793656"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 11 Apr 2024 11:34:53 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 11 Apr 2024 21:34:53 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t v2 2/4] lib/kms: Adjust forced_connectors[] traversal
Date: Thu, 11 Apr 2024 21:34:48 +0300
Message-ID: <20240411183450.6417-2-ville.syrjala@linux.intel.com>
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

Get rid of the sentinel in forced_comnectors[] and just
use ARRAY_SIZE() to determine the limits.

The sentinel stuff actually looks broken due to the use of
ARRAY_SIZE() in forced_connector_free_index(), which was
apparently my doing in
commit ed6539ced33e ("lib/igt_kms: Rework forced connector handling")

Cc: Kunal Joshi <kunal1.joshi@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index d20a93372540..86651e3de348 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -98,7 +98,7 @@ struct igt_forced_connector {
 	int dir;
 };
 
-static struct igt_forced_connector forced_connectors[MAX_CONNECTORS + 1];
+static struct igt_forced_connector forced_connectors[MAX_CONNECTORS];
 
 /**
  * igt_kms_get_base_edid:
@@ -1499,7 +1499,7 @@ static bool connector_is_forced(int idx, drmModeConnector *connector)
 {
 	igt_assert(connector->connector_type != 0);
 
-	for (int i = 0; forced_connectors[i].connector_type; i++) {
+	for (int i = 0; i < ARRAY_SIZE(forced_connectors); i++) {
 		struct igt_forced_connector *c = &forced_connectors[i];
 
 		if (c->idx == idx &&
@@ -1513,15 +1513,14 @@ static bool connector_is_forced(int idx, drmModeConnector *connector)
 
 static struct igt_forced_connector *forced_connector_alloc(void)
 {
-	int i;
+	for (int i = 0; i < ARRAY_SIZE(forced_connectors); i++) {
+		struct igt_forced_connector *c = &forced_connectors[i];
 
-	for (i = 0; forced_connectors[i].connector_type; i++)
-		;
+		if (!c->connector_type)
+			return c;
+	}
 
-	if (i >= ARRAY_SIZE(forced_connectors))
-		return NULL;
-
-	return &forced_connectors[i];
+	return NULL;
 }
 
 static bool force_connector(int drm_fd,
@@ -1578,9 +1577,12 @@ static void dump_forced_connectors(void)
 
 	igt_debug("Current forced connectors:\n");
 
-	for (int i = 0; forced_connectors[i].connector_type; i++) {
+	for (int i = 0; i < ARRAY_SIZE(forced_connectors); i++) {
 		struct igt_forced_connector *c = &forced_connectors[i];
 
+		if (!c->connector_type)
+			continue;
+
 		kmstest_connector_dirname(c->idx, c->connector_type,
 					  c->connector_type_id,
 					  name, sizeof(name));
@@ -5311,9 +5313,12 @@ void igt_reset_connectors(void)
 {
 	/* reset the connectors stored in forced_connectors, avoiding any
 	 * functions that are not safe to call in signal handlers */
-	for (int i = 0; i < forced_connectors[i].connector_type; i++) {
+	for (int i = 0; i < ARRAY_SIZE(forced_connectors); i++) {
 		struct igt_forced_connector *c = &forced_connectors[i];
 
+		if (!c->connector_type)
+			continue;
+
 		igt_sysfs_set(c->dir, "status",  "detect");
 	}
 }
-- 
2.43.2

