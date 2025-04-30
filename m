Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D31C369DC
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 07:31:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ADDC10E6DA;
	Wed, 30 Apr 2025 07:31:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MjV6wo72";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4BAE10E6DA
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 07:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745998296; x=1777534296;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8iHPXOnPadYl5yIWihmWQ7KotfPIl8PGwNKKqxK8Pes=;
 b=MjV6wo72frUYMG0D3FZ7Gwmz5oEHkzcuJ8lS8t1dLgUDCOpiWvpXrmo5
 7SO9sNDmb4FCNL22nd1GnHD2LRrL4b9Dwi+jPE6XdSKCRuenyj0onSfoh
 6VlrVWkCnhWdmCU7CdkjxjfKbCt4o6bpZXFrADgilV3vJ3WO/fk2XXI38
 KQaNlLqilAd199YVbFjf3SFOJrjwfkKaZi0m7Imv7/lnuuk2aZKWgOQ48
 Zl5gotRrW9OyoYcDd4XvcM/WydiqOVyArBhLD0xe76d824i7HXvZVXfUG
 ydk0mu5JX2NQQwf40fUOxjiA1m0YqxikByeD6+xXFnqYQY3io9XAehuWL Q==;
X-CSE-ConnectionGUID: ISUQTOVRQXmDrmxHk0UbOA==
X-CSE-MsgGUID: wHl7LKecTA+akd4CPVHEfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="73032208"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="73032208"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 00:31:35 -0700
X-CSE-ConnectionGUID: zorGEmmoSP2ZLtY9x+QWXQ==
X-CSE-MsgGUID: sJLxjTbPSfaJV3HzFcZBPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="133968332"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa006.fm.intel.com with ESMTP; 30 Apr 2025 00:31:33 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t] tests/kms_tiled_display: Skip if connectors are not of
 same type
Date: Wed, 30 Apr 2025 13:08:34 +0530
Message-Id: <20250430073834.492414-1-pranay.samala@intel.com>
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

Tiled display setups require all involved connectors to be of the same type
(e.g., all eDP or all HDMI). This patch adds a check to skip the test when
connector types differ, preventing invalid configurations and reducing
confusing test failures.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_tiled_display.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/kms_tiled_display.c b/tests/kms_tiled_display.c
index 1f5331408..42ae5f6ee 100644
--- a/tests/kms_tiled_display.c
+++ b/tests/kms_tiled_display.c
@@ -149,6 +149,7 @@ static void get_connectors(data_t *data)
 	int count = 0;
 	igt_output_t *output;
 	data_connector_t *conns = data->conns;
+	int connector_type = -1;
 
 	for_each_connected_output(&data->display, output) {
 		conns[count].connector = drmModeGetConnector(data->display.drm_fd,
@@ -169,6 +170,14 @@ static void get_connectors(data_t *data)
 			igt_assert(conns[count].tile.tile_group_id ==
 				   conns[count-1].tile.tile_group_id);
 
+		if (connector_type == -1) {
+			connector_type = conns[count].connector->connector_type;
+		} else {
+			igt_assert_f(connector_type == conns[count].connector->connector_type,
+				     "Connector type mismatch: Expected %d, but got %d\n",
+				     connector_type, conns[count].connector->connector_type);
+		}
+
 		count++;
 	}
 	igt_require_f(count == data->num_h_tiles,
-- 
2.34.1

