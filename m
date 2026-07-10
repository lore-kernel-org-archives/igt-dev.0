Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A983C43458
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jul 2026 09:55:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD04910F7E6;
	Fri, 10 Jul 2026 09:55:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="iCORR58k";
	dkim-atps=neutral
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACD3310F80D
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jul 2026 09:54:06 +0000 (UTC)
X-UUID: 473d06a27c4511f18dc8c9802ae25ab1-20260710
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=pxh5iviBilU1BiQwQ0kXZoPZnV0DGWsXkRxkB/x4JI8=; 
 b=iCORR58kMPlBbWmN2FrqRVrUnu7ep8bT1/qTyd0ZYdMnlOH6VI5yXSlFBNS0Mr5Dosef9SxHCgFSXgkGfK67i/QTIuSzVpW2N1wflRbEgyl1yGPbSNN0gTaoveEQzYFgjmiJAu93uFVO8/I2ALDRyX+T0ro/LU9/vP8K197RmIY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17, REQID:36c9b487-b110-4501-b834-1d7a72624a7f, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:d497b38, CLOUDID:795bf518-ab14-4403-9336-76696324c5a8,
 B
 ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
 0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
 OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 473d06a27c4511f18dc8c9802ae25ab1-20260710
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 970960463; Fri, 10 Jul 2026 17:54:01 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 10 Jul 2026 17:54:00 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 10 Jul 2026 17:53:59 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: <igt-dev@lists.freedesktop.org>, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Ville Syrjala
 <ville.syrjala@linux.intel.com>, Fei Shao <fshao@chromium.org>
CC: Jani <jani.nikula@intel.com>, Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>, Lancelot Wu
 <Lancelot.Wu@mediatek.com>, Manasi Navare <navaremanasi@google.com>, Gil
 Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH i-g-t v3 2/2] tests/kms_setmode: Add basic-no-cpu-idle subtest
Date: Fri, 10 Jul 2026 17:52:48 +0800
Message-ID: <20260710095358.2518446-3-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260710095358.2518446-1-jason-jh.lin@mediatek.com>
References: <20260710095358.2518446-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
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

Add a new subtest that disables CPU deep sleep to eliminate wakeup
latency interference during vblank timestamp verification.

This allows platforms without get_scanout_position() to verify their
timestamp accuracy is correct, separate from CPU idle interference.

The original "basic" test remains unchanged to detect any timestamp
issues including CPU idle interference, while "basic-no-cpu-idle"
specifically tests timestamp accuracy without external interference.

Once get_scanout_position() is implemented, the vblank timestamp
will be accurately compensated regardless of CPU idle states.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 tests/kms_setmode.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index ef0082dbf70b..a65ea8b232fc 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -42,6 +42,7 @@
 #include <math.h>
 
 #include "i915/intel_drrs.h"
+#include "igt_pm.h"
 #include "xe/xe_query.h"
 
 /**
@@ -49,6 +50,13 @@
  * Description: Tests the vblank timing by iterating through all valid crtc/connector
  *              combinations
  *
+ * SUBTEST: basic-no-cpu-idle
+ * Description: Tests vblank timing with CPU deep sleep disabled to verify
+ *              timestamp accuracy without CPU idle interference. This test
+ *              is for platforms lacking HW/SW get_scanout_position() support,
+ *              allowing them to verify vblank timestamp correctness without
+ *              external CPU wakeup latency interference.
+ *
  * SUBTEST: basic-clone-single-crtc
  * Description: Test allows the use of a single CRTC for two connectors, such as VGA/HDMI,
  *		VGA/DP, and HDMI/HDMI
@@ -1034,6 +1042,11 @@ static void run_test(const struct test_config *tconf)
 		test_combinations(tconf, connector_num);
 }
 
+static void restore_cpu_deep_sleep_at_exit(int sig)
+{
+	igt_pm_enable_cpu_deep_sleep();
+}
+
 static int opt_handler(int opt, int opt_index, void *data)
 {
 	switch (opt) {
@@ -1105,6 +1118,30 @@ int igt_main_args("det:", NULL, help_str, opt_handler, NULL)
 		}
 	}
 
+	/*
+	 * This subtest disables CPU deep sleep to eliminate wakeup latency
+	 * interference during vblank timestamp verification.
+	 *
+	 * NOTE: This is for platforms that have not yet implemented
+	 * get_scanout_position(). Once get_scanout_position() is properly
+	 * implemented, the vblank timestamp will be accurately compensated
+	 * regardless of CPU idle states, and this test becomes redundant
+	 * with the standard "basic" test.
+	 */
+	igt_describe("Tests vblank timing with CPU deep sleep disabled");
+	igt_subtest_with_dynamic("basic-no-cpu-idle") {
+		struct test_config tconf = {
+			.flags		= TEST_TIMINGS,
+			.name		= "basic-no-cpu-idle",
+			.resources	= drm_resources,
+		};
+
+		igt_require_f(igt_pm_disable_cpu_deep_sleep(),
+			      "Platform does not support CPU idle control\n");
+		igt_install_exit_handler(restore_cpu_deep_sleep_at_exit);
+		run_test(&tconf);
+	}
+
 	igt_fixture() {
 		drmModeFreeResources(drm_resources);
 		drm_close_driver(drm_fd);
-- 
2.43.0

