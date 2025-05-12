Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C275C3ABBC
	for <igt-dev@archiver.kernel.org>; Mon, 12 May 2025 04:38:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91C0510E12D;
	Mon, 12 May 2025 04:38:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PiW8DxJl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08E4410E059
 for <igt-dev@lists.freedesktop.org>; Mon, 12 May 2025 04:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747024723; x=1778560723;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=j7dynZCRluMdNIjZINGrdQy19yWLJ3/cOJETSX4C2YE=;
 b=PiW8DxJlSqbP6i/njFtcz9UbUE/OTeGQJGV5jTAiIM271yHqF3bCZqqX
 +y1WljaYta7h4Vt2K/eReOX2oH2hm4q2CO8dvppbhc9BXfGArUY91i+/7
 gAHW1HBxp2i4thqamYMnjvMuu8Y8DVEF1IwZAwkjyN2SwDhRwmXxnhugV
 MzSyfxlxMOLmUiXNJ6q+kCuXN0s7+H7+TjLneopGjrYQmWPEZyWjIqoGC
 TP6hmsp4YIbxQZKlWB9VCHQMKVi/2+UGCXpS5hhf0MVIPqyPGun+DYwaA
 cTGNcix0mI58vDiBTfQlB3WGi6m4cA8N61E0HecuC00uaXBY96tR+/EfA Q==;
X-CSE-ConnectionGUID: WRVOQXgWQhCT4UuZhvR97Q==
X-CSE-MsgGUID: tkZ09rm8REeHKTNv4iOgAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="52456184"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; d="scan'208";a="52456184"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2025 21:38:43 -0700
X-CSE-ConnectionGUID: HI6yKd+QTZKUQPh9i8Znqw==
X-CSE-MsgGUID: 9gc6zBWHSpOLGV7xrt/dCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; d="scan'208";a="137651344"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa008.fm.intel.com with ESMTP; 11 May 2025 21:38:40 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com, ankit.k.nautiyal@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v3] tests/kms_tiled_display: Skip if connectors are not
 of same type
Date: Mon, 12 May 2025 10:15:43 +0530
Message-Id: <20250512044543.1230985-1-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
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

Tiled display setups require all involved DP connectors to be of the
same type. This patch adds a check to skip the test when
connector types differ, preventing invalid configurations and reducing
confusing test failures.

v2: Replace igt_assert with igt_skip_on_f to skip the test.
v3: Add supported port sync in commit message (Ankit)
    Ensure if connector type is not DRM_MODE_CONNECTOR_Unknown (Ankit)

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_tiled_display.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/tests/kms_tiled_display.c b/tests/kms_tiled_display.c
index 1f5331408..aa7e5ba04 100644
--- a/tests/kms_tiled_display.c
+++ b/tests/kms_tiled_display.c
@@ -159,16 +159,24 @@ static void get_connectors(data_t *data)
 		get_connector_tile_props(data, conns[count].connector,
 					 &conns[count].tile);
 
-		if (conns[count].tile.num_h_tile == 0) {
+		if (conns[count].tile.num_h_tile == 0 &&
+		    conns[count].connector->connector_type == DRM_MODE_CONNECTOR_Unknown) {
 			drmModeFreeConnector(conns[count].connector);
 			continue;
 		}
 
 		/* Check if the connectors belong to the same tile group */
-		if (count > 0)
+		if (count > 0) {
 			igt_assert(conns[count].tile.tile_group_id ==
 				   conns[count-1].tile.tile_group_id);
 
+			igt_skip_on_f(conns[count - 1].connector->connector_type !=
+				      conns[count].connector->connector_type,
+				      "Connector type mismatch: Expected %d, but got %d\n",
+				      conns[count - 1].connector->connector_type,
+				      conns[count].connector->connector_type);
+		}
+
 		count++;
 	}
 	igt_require_f(count == data->num_h_tiles,
-- 
2.34.1

