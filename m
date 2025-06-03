Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C97C5AE59
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 05:12:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 048CB10E5B9;
	Tue,  3 Jun 2025 05:12:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FnTCmBp8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B82CD10E5AC
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 05:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748927560; x=1780463560;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=42S884idpsDXPdXi03l2vR7CoB8D4+cw2x/AbTBFkE0=;
 b=FnTCmBp8kH0wKjnQ3678A+YvqiIiEtW+2PMPqiRDCVVTMqCtfB30Ezo5
 IHJxk4IdrtTDRh6EmrgtZT0xyrI5NA4TzSzpwjgoq48yowKyl8d/5FqL4
 nlKObGz28EvpwuXAu1UWtO8wYswBtwyP2pWlztPisw6AEkdFCctK9RPqt
 y0JFNr1P197tfNXya5s1v3fcPT6DAut+GEsPXyBrqmvBtVlAkmVSUdFWZ
 ZBqDY8ycxGtJyT14PrrJwjaLXMMSG/+/li4XLeZVPaHVBwk2Bv93O0odz
 wLb27XSL1pvK+hcvbqkONlYzKFgeKFwy0E0MXiqwjuLElf1ub7rciJ96S g==;
X-CSE-ConnectionGUID: Liy5caZ9RgW0BLSwAW6/4A==
X-CSE-MsgGUID: 8h0OHCRLTt6YK5/PLnEjVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="62007586"
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="62007586"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 22:10:18 -0700
X-CSE-ConnectionGUID: c2IPGyxpRg+UcaS7iunVAg==
X-CSE-MsgGUID: PHw41g4TTcmXI6w9AfgSDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="175595384"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa001.fm.intel.com with ESMTP; 02 Jun 2025 22:10:17 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v4] tests/kms_tiled_display: Skip if connectors are not
 of same type
Date: Tue,  3 Jun 2025 10:47:22 +0530
Message-Id: <20250603051722.1690985-1-pranay.samala@intel.com>
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
v3: Edit port sync supported in commit message (Ankit)
    Check if connector type is DRM_MODE_CONNECTOR_Unknown (Ankit)
v4: Remove connector_type check

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_tiled_display.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tests/kms_tiled_display.c b/tests/kms_tiled_display.c
index 1f5331408..a1b7f90d1 100644
--- a/tests/kms_tiled_display.c
+++ b/tests/kms_tiled_display.c
@@ -165,10 +165,17 @@ static void get_connectors(data_t *data)
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

