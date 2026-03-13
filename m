Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B3AA105F782
	for <igt-dev@archiver.kernel.org>; Fri, 13 Mar 2026 08:57:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33C8710EB54;
	Fri, 13 Mar 2026 08:57:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="deQCkLqf";
	dkim-atps=neutral
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010014.outbound.protection.outlook.com [52.101.61.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27EF710EB54
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Mar 2026 08:57:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XoWYwdqzUgT3lyhG8PPu5IY69qX9ym6cXUnbmCvrdRFlQNCzoZVLK249uff+qMZsQChQlOtHQx2l8LcPNda1eNE77DRGaDmrrQYWKDO7v4EREvmgEPyWaB/5+mOKXjQrCeb34EHwhiSHfVMBJfG/mTcNdiwNdkpQzM7V6FQlb+TShlHmfP8O++0LmuBIHRb/esry2jS6y7/7jKO4HfMsRC/kkyxzKVtyumy/E+P6ULTP1hkgycVdn4gZYoocM+YodggKR37WWS+kUS5NrnLIy5FOgTtl8X3Zwh8RK7Lyq7j82LBCubIa/Kg3X1bYJQurfotlfAon8sYmKB6RgslhQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cOUt5aLuh/ddxQkBpV1fxAiuDnQ9OuwZGeNpqNAr6bs=;
 b=Q2RDwuewEsLmFoEuadUVpXKMlNOTr+AMZFOVCIJFQe53lwOOqZlzE9fAM9y47hh1fnagetugT8gqizpwrA8QVe67qnnuCCWNmW9KBFlP3i/xuyc5f+PL/7/vasfdnRo/YLBO0qXQniPhM6qE6k/HPyTDlMLzYHtq3pjejyIcv0y17egJ+//uMHzfvYjLSGJm9amn0iJpVI/+Miw6WWEfZmjNbOkUPy9c2cMLg+ABP2RA9+q/O5XEj3Ro83zb8QWbOtpkmx1mSjoFcduHd79A19bmYMphEP2IOz3P4zWt2kB+ScUBO+hkAC8lpN/db+oMlq8NB8NSNUcya8sN+a8Kew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cOUt5aLuh/ddxQkBpV1fxAiuDnQ9OuwZGeNpqNAr6bs=;
 b=deQCkLqfKUgsVKBDVvNtA4WZiaid+prYBpvVvi574iRrKFd1thy9DPqDKgcn7jwG8ExkvkM1td8yPwqI3VXxT3OfSTfZlnVqqD4bVzUpKCiWPQwQjCehp1B1dkgQPuHkeq6/pQVhOLck6hV9VBSV4IcEymDIpgudWButfvcVkAw=
Received: from CY5PR22CA0015.namprd22.prod.outlook.com (2603:10b6:930:16::7)
 by IA0PR12MB7651.namprd12.prod.outlook.com (2603:10b6:208:435::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.8; Fri, 13 Mar
 2026 08:57:20 +0000
Received: from CY4PEPF0000E9D4.namprd03.prod.outlook.com
 (2603:10b6:930:16:cafe::bf) by CY5PR22CA0015.outlook.office365.com
 (2603:10b6:930:16::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.29 via Frontend Transport; Fri,
 13 Mar 2026 08:57:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9D4.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Fri, 13 Mar 2026 08:57:19 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 13 Mar
 2026 03:57:19 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 13 Mar
 2026 03:57:19 -0500
Received: from ray-Ubuntu.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 13 Mar 2026 03:57:17 -0500
From: Ray Wu <ray.wu@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <sunpeng.li@amd.com>, <chiahsuan.chung@amd.com>, "Ray
 Wu" <ray.wu@amd.com>
Subject: [PATCH i-g-t] tests/amdgpu/amd_ilr: add disallow replay debugfs and
 fix CRC read timeout
Date: Fri, 13 Mar 2026 16:57:04 +0800
Message-ID: <20260313085713.890370-1-ray.wu@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D4:EE_|IA0PR12MB7651:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b0b30f7-a5a1-4d23-de7f-08de80de88d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700016|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: aiectsUsTIN3RD4F3pAhZMQaeBfxuLktnKupPg7FH0zdDUN1bX8MmfLyWkMK0xpouevtSQ/cv5T89mibT2zA8rcN7kB4xJyw1GIjJ9hl+4ijBzjz1stoXZD/QgBnbQmzZtmQRqmV/osSBq2jYttBDfKX8Nbu+UIAHzTjwT77N9QsVtWXblb7jeB+H/e1ESaeyIKTT2R3XuExHQzJUYNTk36d4yowURyBseahz7s4tJsxgAdOJBKItXFEa4gB+zaW5qJz8ond+Bj4c8Qc31ptLR/k8Y7AqYy1GXngdiaaon5pDMaSBf/8tM/DrE5yIiXOh+d4qj48KMmSNw6e93QD+rLR5cbbhO5FgMmz+TnnDm/iTCjt9NPt5HBfUDeiWpEd5ohAIx1qZBhgEZGCn17w+TwctvWgItr+wwG4VANiRro4b7bWHyvQwOzB18hKwIGO/jcGxD8iG+rAEc1VKbeTlKA3qO5fuG9VkJ3FPpgek5wFO1a6K6qeMGU3iHHM4qLLpsiXdID9lLLBfbsTzk6ljkkGJwoVT+GiPbkFdPBisaWYzY6UA4RWd5VtewAbLOwMmUiSPDVqIE2qEO32+LgveVy2TtlRxu2AFTMtJ0gdqzuUTUITuas6AkGOTjAe/TIxSzNAoyLxUg3txtsAUT8vgtX4KeeoC53s6Htdnkgni/bQnUJhOTfx4zuxr4mTGCd4ihpOKy3DJIV9WyHIHo1rqHNPNt1rGz0XXl8NzX2eCxJtI5NfnRqizkTz52Mt0H75e7qHmTrzOU5Y6S34G0sR7w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: BwaLSK9I81PVCTwDkFmJ4E8KWOqc+hX4xamHtpjb7Fu+518WRGS67WYOGD4TSbr8tpdAZxKaoHEC/20rAlbL0hGb/zEwwZ4xF2XoAx9/VpglyC7yZygLQnLtUjMPr5DAS2hu0w4oVJ3chLtNLmsJ5UzI1NaB3a3Pht1YBzKYFLR0GZ/JWXecsQqHvMnFppUzSrHOKsXavED5U7ItAr5+NWtExud0DaZm4H34MR9m42qqFO1CyQjrT0pZaFhXqe235Q7az0G0zzy0otFXWKx9pj4+7MalI4YwxVKJg0naEnOiIzY0gju/k0m1KBAEIbWvvd2vx7can3YftOKDydXSMU/PRuDzG5d0R/6lUt7JZ/aMcTYp+eTvNebFnISTdj9HzfGls4KEFz0HnTwZv2h75zBfldgfY42QI096/k2r3QIQLIs1A7WUNhwpMdSbMHNF
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 08:57:19.9003 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b0b30f7-a5a1-4d23-de7f-08de80de88d3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7651
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

[Why]
On eDP panels that support Panel Replay, the kernel enables replay during
link training. This causes the eDP Rx CRC read to time out because the
panel enters replay mode and stops sending CRC data normally.

[How]
1. Add igt_amd_disallow_edp_enter_replay() helper in lib/igt_amd that
   writes to the disallow_edp_enter_replay debugfs node, following the
   same pattern as igt_amd_disallow_edp_enter_psr().

2. In amd_ilr test_flow():
   - Call igt_amd_disallow_edp_enter_replay() with enable=true before
     reading eDP Rx CRC to prevent the panel from entering replay mode.
   - Call igt_amd_disallow_edp_enter_replay() with enable=false after
     reading CRC to restore normal replay behavior.

Cc: Leo Li <sunpeng.li@amd.com>
Cc: Tom Chung <chiahsuan.chung@amd.com>
Signed-off-by: Ray Wu <ray.wu@amd.com>
---
 lib/igt_amd.c          | 44 ++++++++++++++++++++++
 lib/igt_amd.h          |  2 +
 tests/amdgpu/amd_ilr.c | 83 +++++++++++++++++++++++++++++++-----------
 3 files changed, 108 insertions(+), 21 deletions(-)

diff --git a/lib/igt_amd.c b/lib/igt_amd.c
index 3ddb5f403..a97adad43 100644
--- a/lib/igt_amd.c
+++ b/lib/igt_amd.c
@@ -1365,6 +1365,50 @@ void igt_amd_disallow_edp_enter_psr(int drm_fd, char *connector_name, bool enabl
 	close(ret);
 }
 
+/**
+ * igt_amd_disallow_edp_enter_replay: notify kernel skip edp replay setup and enable
+ * @drm_fd: DRM file descriptor
+ * @connector_name: The connector's name
+ * @enable: skip kernel eDP replay setup and enable -- disallow edp enter replay
+ * example usage: disallow replay
+ * echo 0x1 >
+ * /sys/kernel/debug/dri/0/eDP-1/disallow_edp_enter_replay
+ *
+ * expected IGT sequence is as below:
+ * 1. disable eDP PHY and notify eDP rx with dpcd 0x600 = 2.
+ *    for example, kmstest_set_connector_dpms off will do this.
+ * 2. echo 0x1 /sys/kernel/debug/dri/0/eDP-X/disallow_edp_enter_replay
+ * 3. enable eDP PHY and notify eDP rx with dpcd 0x600 = 1 but
+ *    without dpcd 0x37b.
+ * 4. read crc from rx dpcd 0x270, 0x246, etc.
+ *    igt_pipe_crc_collect_crc will do this.
+ * 5. echo 0x0 /sys/kernel/debug/dri/0/eDP-X/disallow_edp_enter_replay.
+ *    this will let eDP back to normal with replay setup.
+ */
+void igt_amd_disallow_edp_enter_replay(int drm_fd, char *connector_name, bool enable)
+{
+	int fd, ret, wr_len;
+	const char *allow_edp_replay = "1";
+	const char *dis_allow_edp_replay = "0";
+
+	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
+	igt_assert(fd >= 0);
+	ret = openat(fd, DEBUGFS_DISALLOW_EDP_ENTER_REPLAY, O_WRONLY);
+	close(fd);
+	igt_skip_on_f(ret < 0, "Skip test: Debugfs %s not supported\n",
+		      DEBUGFS_DISALLOW_EDP_ENTER_REPLAY);
+
+	if (enable) {
+		wr_len = write(ret, allow_edp_replay, strlen(allow_edp_replay));
+		igt_assert_eq(wr_len, strlen(allow_edp_replay));
+	} else {
+		wr_len = write(ret, dis_allow_edp_replay, strlen(dis_allow_edp_replay));
+		igt_assert_eq(wr_len, strlen(dis_allow_edp_replay));
+	}
+
+	close(ret);
+}
+
 static bool get_dm_capabilities(int drm_fd, char *buf, size_t size)
 {
 	int ret, fd;
diff --git a/lib/igt_amd.h b/lib/igt_amd.h
index bce4657cb..a45122b68 100644
--- a/lib/igt_amd.h
+++ b/lib/igt_amd.h
@@ -53,6 +53,7 @@
 #define DEBUGFS_EDP_PSR_STATE	"psr_state"
 #define DEBUGFS_ALLOW_EDP_HOTPLUG_DETECT "allow_edp_hotplug_detection"
 #define DEBUGFS_DISALLOW_EDP_ENTER_PSR "disallow_edp_enter_psr"
+#define DEBUGFS_DISALLOW_EDP_ENTER_REPLAY "disallow_edp_enter_replay"
 
 /* amdgpu DM interface entries */
 #define DEBUGFS_DM_VISUAL_CONFIRM "amdgpu_dm_visual_confirm"
@@ -235,6 +236,7 @@ bool igt_amd_output_has_psr_state(int drm_fd, char *connector_name);
 int  igt_amd_read_psr_state(int drm_fd, char *connector_name);
 void igt_amd_allow_edp_hotplug_detect(int drm_fd, char *connector_name, bool enable);
 void igt_amd_disallow_edp_enter_psr(int drm_fd, char *connector_name, bool enable);
+void igt_amd_disallow_edp_enter_replay(int drm_fd, char *connector_name, bool enable);
 
 /* DM interface helpers */
 bool igt_amd_has_visual_confirm(int drm_fd);
diff --git a/tests/amdgpu/amd_ilr.c b/tests/amdgpu/amd_ilr.c
index 5dd467b43..f7f480e66 100644
--- a/tests/amdgpu/amd_ilr.c
+++ b/tests/amdgpu/amd_ilr.c
@@ -203,10 +203,12 @@ static void test_flow(data_t *data, enum sub_test option)
 		}
 
 		/* states under /sys/kernel/debug/dri/0/eDP-1:
-		 * psr_capability.driver_support (drv_support_psr): yes
+		 * psr_capability.driver_support (drv_support_psr): yes/no
+		 * replay_capability.driver_support (drv_support_replay): yes/no
 		 * ilr_setting (intermediate link rates capabilities,
 		 * ilr_cap): yes/no
 		 * kernel driver disallow_edp_enter_psr (dis_psr): no
+		 * kernel driver disallow_edp_enter_repay (dis_replay): no
 		 */
 
 		/* Init only eDP */
@@ -216,9 +218,10 @@ static void test_flow(data_t *data, enum sub_test option)
 		 * DPMS on/off will not take effect until
 		 * next igt_display_commit_atomic.
 		 * eDP enter power saving mode within test_init
-		 * drv_support_psr: yes; ilr_cap: no; dis_psr: no
+		 * drv_support_replay: yes | drv_support_psr: yes;
+		 * ilr_cap: no;
+		 * dis_psr: no, dis_replay: no
 		 */
-
 		mode = igt_output_get_mode(output);
 		igt_assert(mode);
 
@@ -228,11 +231,16 @@ static void test_flow(data_t *data, enum sub_test option)
 				      0, &data->fb);
 		igt_plane_set_fb(data->primary, &data->fb);
 
-		/* drv_support_psr: yes; ilr_cap: no; dis_psr: no
+		/* drv_support_replay: yes | drv_support_psr: yes;
+		 * ilr_cap: no;
+		 * dis_psr: no & dis_replay: no
 		 * commit stream. eDP exit power saving mode.
 		 */
 		igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-		/* drv_support_psr: yes; ilr_cap: yes; dis_psr: no */
+		/* drv_support_replay: yes | drv_support_psr: yes;
+		 * ilr_cap: yes;
+		 * dis_psr: no & dis_replay: no;
+		 */
 
 		/* igt_amd_output_has_ilr_setting only checks if debugfs
 		 * exist. ilr settings could be all 0s -- not supported.
@@ -247,23 +255,35 @@ static void test_flow(data_t *data, enum sub_test option)
 
 		igt_info("Testing on output: %s\n", output->name);
 
-		/* drv_support_psr: yes; ilr_cap: yes; dis_psr: no */
+		/* drv_support_replay: yes | drv_support_psr: yes;
+		 * ilr_cap: yes;
+		 * dis_psr: no & dis_replay: no
+		 */
 		kmstest_set_connector_dpms(data->drm_fd,
 			output->config.connector, DRM_MODE_DPMS_OFF);
 		/* eDP enter power saving mode.
-		 * drv_support_psr: yes; ilr_cap: no; dis_psr: no.
+		 * drv_support_replay: yes | drv_support_psr: yes;
+		 * ilr_cap: no;
+		 * dis_psr: no & dis_replay: no;
 		 */
 
-		/* Disable eDP PSR to avoid timeout when reading CRC */
+		/* Disable eDP PSR / Replay to avoid timeout when reading CRC */
 		igt_amd_disallow_edp_enter_psr(data->drm_fd, output->name, true);
-		/* drv_support_psr: yes; ilr_cap: no: dis_psr: yes */
+		igt_amd_disallow_edp_enter_replay(data->drm_fd, output->name, true);
+		/* drv_support_replay: yes | drv_support_psr: yes;
+		 * ilr_cap: no;
+		 * dis_psr: yes & dis_replay: yes;
+		 */
 
 		/* eDP exit power saving mode and setup psr */
 		kmstest_set_connector_dpms(data->drm_fd,
 			output->config.connector, DRM_MODE_DPMS_ON);
-		/* drv_support_psr: no; ilr_cap: yes: dis_psr: yes
-		 * With dis_psr yes, drm kernel driver
-		 * disable psr, psr_en is set to no.
+		/* drv_support_replay: no & drv_support_psr: no;
+		 * ilr_cap: yes;
+		 * dis_psr: yes & dis_replay: yes;
+		 * With dis_psr yes and dis_replay yes,
+		 * drm kernel driver disable psr/replay,
+		 * psr_en & replay_en are set to no.
 		 */
 
 		/* Collect info of Reported Lane Count & ILR */
@@ -282,33 +302,54 @@ static void test_flow(data_t *data, enum sub_test option)
 				break;
 		}
 
-		/* drv_support_psr: no; ilr_cap: yes; dis_psr: yes */
+		/* drv_support_replay: no & drv_support_psr: no;
+		 * ilr_cap: yes;
+		 * dis_psr: yes & dis_replay: yes;
+		 */
 		kmstest_set_connector_dpms(data->drm_fd,
 			output->config.connector, DRM_MODE_DPMS_OFF);
 		/* eDP enter power saving mode.
-		 * drv_support_psr: no; ilr_cap: no; dis_psr: yes.
+		 * drv_support_replay: no & drv_support_psr: no;
+		 * ilr_cap: no;
+		 * dis_psr: yes & dis_replay: yes;
 		 */
 
-		/* Enable PSR after reading eDP Rx CRC */
+		/* Enable PSR / Replay after reading eDP Rx CRC */
 		igt_amd_disallow_edp_enter_psr(data->drm_fd, output->name, false);
-		/* drv_support_psr: no; ilr_cap: no: dis_psr: no */
+		igt_amd_disallow_edp_enter_replay(data->drm_fd, output->name, false);
+		/* drv_support_replay: no & drv_support_psr: no;
+		 * ilr_cap: no;
+		 * dis_psr: no & dis_replay: no;
+		 */
 
-		/* eDP exit power saving mode and setup psr */
+		/* eDP exit power saving mode and setup psr/replay */
 		kmstest_set_connector_dpms(data->drm_fd,
 			output->config.connector, DRM_MODE_DPMS_ON);
-		/* drv_support_psr: yes; ilr_cap: yes: dis_psr: no */
+		/* drv_support_replay: yes | drv_support_psr: yes;
+		 * ilr_cap: yes;
+		 * dis_psr: no & dis_replay: no;
+		 */
 
 		/* Reset preferred link settings*/
 		memset(data->supported_ilr, 0, sizeof(data->supported_ilr));
 		igt_amd_write_ilr_setting(data->drm_fd, output->name, 0, 0);
-		/* drv_support_psr: yes; ilr_cap: yes; dis_psr: no */
+		/* drv_support_replay: yes | drv_support_psr: yes;
+		 * ilr_cap: yes;
+		 * dis_psr: no, dis_replay: no;
+		 */
 
 		/* commit 0 stream. eDP enter power saving mode */
 		igt_remove_fb(data->drm_fd, &data->fb);
-		/* drv_support_psr: yes; ilr_cap: no; dis_psr: no */
+		/* drv_support_replay: yes | drv_support_psr: yes;
+		 * ilr_cap: no;
+		 * dis_psr: no & dis_replay: no;
+		 */
 
 		test_fini(data);
-		/* drv_support_psr: yes; ilr_cap: no; dis_psr: no */
+		/* drv_support_replay: yes | drv_support_psr: yes;
+		 * ilr_cap: no;
+		 * dis_psr: no & dis_replay: no;
+		 */
 	}
 }
 
-- 
2.43.0

