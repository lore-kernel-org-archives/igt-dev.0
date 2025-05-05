Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF076C369C2
	for <igt-dev@archiver.kernel.org>; Mon,  5 May 2025 03:42:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C7910E236;
	Mon,  5 May 2025 03:42:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bFTr9Q8D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7767B10E236
 for <igt-dev@lists.freedesktop.org>; Mon,  5 May 2025 03:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746416565; x=1777952565;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jyVV4k3pszzfz+OIOEwA0Qkr5r7X/5tLjKg+wh1xnc0=;
 b=bFTr9Q8DKCG0X91NTHgJBiQk5bEq96E6BXw3SkUhD60/oJmSV++yiT8y
 LlB2uqu+2s6BWT5Kx1J5BcGaTJ8IGBrfScGfSfRLpjNznVEG0NELHP7jY
 AvrEamgwGTFqvXkl0MP2MK5wrkXE47m0iLS2vjRzwSP+SqTjhFnFOdl44
 Xf1VS8h+aAL4z6Nn0LNJSsBX4n8aNoDDpJ8m6/G8Vpma5pYnz8aIhIcpK
 1S5aASufzNFoe8R9ybOFXxwJuC4aXuXAZqFUDMYaAEurZOIKMXh26o2Vv
 /nS/YQzMX5FQ+r0I4oct1A4pM9MJdMzqVWuUUHA4SUiCrI91yKyB7KQzY g==;
X-CSE-ConnectionGUID: f940NUrxROiCLtrMBpoPeQ==
X-CSE-MsgGUID: svqdUA23Rx2t+4mjVTdEOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="59403533"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; d="scan'208";a="59403533"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2025 20:42:42 -0700
X-CSE-ConnectionGUID: K5P6i4x7TcyGVMsykqHAJA==
X-CSE-MsgGUID: hA3X/DknTJScFrPB9vLu2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; d="scan'208";a="172364588"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa001.jf.intel.com with ESMTP; 04 May 2025 20:42:40 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v2] tests/kms_tiled_display: Skip if connectors are not
 of same type
Date: Mon,  5 May 2025 09:19:41 +0530
Message-Id: <20250505034941.930385-1-pranay.samala@intel.com>
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

v2: Replace igt_assert with igt_skip_on_f to skip the test.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_tiled_display.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/kms_tiled_display.c b/tests/kms_tiled_display.c
index 1f5331408..6d461c976 100644
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
+			igt_skip_on_f(connector_type != conns[count].connector->connector_type,
+				      "Connector type mismatch: Expected %d, but got %d\n",
+				      connector_type, conns[count].connector->connector_type);
+		}
+
 		count++;
 	}
 	igt_require_f(count == data->num_h_tiles,
-- 
2.34.1

