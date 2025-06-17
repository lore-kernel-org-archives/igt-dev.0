Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA3A3C71155
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 06:29:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 386DA10E4E9;
	Tue, 17 Jun 2025 06:29:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PJ3URyX7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CC8010E4E9
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 06:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750141789; x=1781677789;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZW6i+fQ+lNUWCddO/r9hvReZiifztRNxfwNRucFUg4I=;
 b=PJ3URyX7teVkvN94ZjKtgwPDag0G4yWDZEckPxD16GPC3pW6gAY72xlz
 0hovtp6IuCzWEIUH/qxhMqaxTncVOH9w0sblNxs/jWL1/p6r32mXzglrG
 dsRSSWesEUIjFrZCwenappoX/jxtBiV/+EEsGohKbkVeXeldMcGK0G1zL
 kk4W/I8hi7iQBI2ZoVP5ku1RmIHIw7BfHzqbByc9AlU8pxPPeOv8paaFX
 mRVxXVR6M+JqsFGNVl7tuBbY8ri0OzNc34uhWdyHRYt41da2D7GqNa30A
 yYxcR6uqriAI7Ba6rwJwWnIUET9QwBmVVBbY1uToUWW0bEPcJtMBLNFJm A==;
X-CSE-ConnectionGUID: vADWNwFVSHKZ3sRGLCYyQA==
X-CSE-MsgGUID: k9/GpIEXQZGE7i9dTnAy7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52167914"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; d="scan'208";a="52167914"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 23:29:49 -0700
X-CSE-ConnectionGUID: c+qCJj9lTgi9+HoQf2AbTg==
X-CSE-MsgGUID: 5fDnUl1OTDKtwLlNRftP5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; d="scan'208";a="149581653"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa009.fm.intel.com with ESMTP; 16 Jun 2025 23:29:47 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v5] tests/kms_tiled_display: Skip if connectors are not
 of same type
Date: Tue, 17 Jun 2025 12:07:27 +0530
Message-Id: <20250617063727.36557-1-pranay.samala@intel.com>
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

Tiled displays expose each tile as a separate DRM connector, requiring
correct grouping using tile metadata. However, when multiple identical
monitors or dummy plugs (e.g., HDMI and DP) report the same tile_group_id
and positions, it's ambiguous which tiles belong together.

This can lead to invalid groupings across different connector types
(e.g., using dummy HDMI and DP plugs that both advertise tiled displays),
causing test failures. To mitigate this, restrict tile selection to
DisplayPort connectors only which is only type that properly supports
tiled displays.

v2: Replace igt_assert with igt_skip_on_f to skip the test.
v3: Edit port sync supported in commit message (Ankit)
    Check if connector type is DRM_MODE_CONNECTOR_Unknown (Ankit)
v4: Rebase and remove connector_type check (Ankit)
v5: Restrict only to DisplayPort connector (Ankit)
    Update the commit message (Ankit)

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_tiled_display.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/tests/kms_tiled_display.c b/tests/kms_tiled_display.c
index 1f5331408..4fb8be1d5 100644
--- a/tests/kms_tiled_display.c
+++ b/tests/kms_tiled_display.c
@@ -159,16 +159,24 @@ static void get_connectors(data_t *data)
 		get_connector_tile_props(data, conns[count].connector,
 					 &conns[count].tile);
 
-		if (conns[count].tile.num_h_tile == 0) {
+		if (conns[count].tile.num_h_tile == 0 ||
+		    conns[count].connector->connector_type != DRM_MODE_CONNECTOR_DisplayPort) {
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

