Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97847C021B8
	for <igt-dev@archiver.kernel.org>; Wed, 26 Feb 2025 14:43:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55A3110E926;
	Wed, 26 Feb 2025 14:43:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O/nUofA6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1789210E926
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Feb 2025 14:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740580982; x=1772116982;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pGFS8GQ4oPpMac0/bf7bgqI8JddyCehMytZ7h35hsQA=;
 b=O/nUofA6n6pHOUinzsbgCzv6EmDUnpqn1uy41gHxfPvNrSLVQWp2wlJr
 A9ahyGg5mhJ707aYs9ahfrdGMxx800IePyhVdMZDmOUpFvlxFLgt3u8kv
 kbBCtzviyHcvawBLGJOb52NuxWN01Oz+gAiTtCaU1IpubcFIKDGRs2tX/
 +FpBCujzfcGi9oqUDEvHxqTI7b1JqPxdktjX+kgZPC5Md6Ze9Er2rNGih
 RTFxMNw5vv5utVCc569oIJ/2Gf+wFb/zUzfT50ohfRwdFV8854URVuSrk
 H76tH8x4NI+0Q+zPaE7BEAOYU2ecotsVW1vNfLCegTyrrSlvtD/KXOHts Q==;
X-CSE-ConnectionGUID: U9BcJTmySJOue+SugB30oA==
X-CSE-MsgGUID: ZRxNbOwAQOqUBPnrqT7vqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41625679"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="41625679"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 06:43:00 -0800
X-CSE-ConnectionGUID: OVti8+9vRZeH/+Ma8IhmEQ==
X-CSE-MsgGUID: SzyFbstcQuiS29DbXkPjSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117639774"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 06:42:59 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@linux.intel.com, michal.wajdeczko@intel.com,
 adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com
Subject: [PATCH i-g-t] tests/sriov_basic: verify VF disabling when its fd
 remains open
Date: Wed, 26 Feb 2025 15:42:54 +0100
Message-Id: <20250226144254.28129-1-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
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

Introduce a subtest that verifies the VF disabling when its file
descriptor remains open. The expected behaviour is forceful VF driver
unbind and VF disabling.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/sriov_basic.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tests/sriov_basic.c b/tests/sriov_basic.c
index 36bca4149..986566dc2 100644
--- a/tests/sriov_basic.c
+++ b/tests/sriov_basic.c
@@ -118,6 +118,21 @@ static void bind_unbind_vf(int pf_fd, unsigned int vf_num)
 	igt_sriov_disable_vfs(pf_fd);
 }
 
+/**
+ * SUBTEST: disable-vf-with-open-fd
+ * Description:
+ *   Verify the VF disabling when its file descriptor remains open
+ */
+static void disable_vf_with_open_fd(int pf_fd)
+{
+	igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
+
+	igt_sriov_enable_driver_autoprobe(pf_fd);
+	igt_sriov_enable_vfs(pf_fd, 1);
+	igt_assert_fd(igt_sriov_open_vf_drm_device(pf_fd, 1));
+	igt_sriov_disable_vfs(pf_fd);
+}
+
 igt_main
 {
 	int pf_fd;
@@ -209,6 +224,10 @@ igt_main
 		}
 	}
 
+	igt_describe("Verify the VF disabling when its file descriptor remains open");
+	igt_subtest("disable-vf-with-open-fd")
+		disable_vf_with_open_fd(pf_fd);
+
 	igt_fixture {
 		igt_sriov_disable_vfs(pf_fd);
 		/* abort to avoid execution of next tests with enabled VFs */
-- 
2.40.0

