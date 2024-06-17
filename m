Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6159AC2BA1A
	for <igt-dev@archiver.kernel.org>; Mon, 17 Jun 2024 09:47:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10DB410E326;
	Mon, 17 Jun 2024 09:47:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jb8nIWc4";
	dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2052.outbound.protection.outlook.com [40.107.212.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BEA810E329
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Jun 2024 09:47:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YIPB9nIFBag2EDXXOwumimNqA5tK5NB7TmzV1r8nnOmaYtRT+SPD0mDLEV0eZYzqLMYEwqWF2qyGAS7Fx8piPMh9Tg3wJhG4u/d14CpDZYsY1r3efxioeW5YiOZ667vy/3LzhgxvdoGoJwngXLaFsEuI8LzylpN+l+Lwdn7hsNiqKapNe14DMIodUUP23EGBYkHg8Wt3aPLFbUeE0y2JRNclHDEDnFJzdJC5pQzMRteXvsq01yZRXqo/Q5I/+EQpHRpA18U043FP7NqGpeQ0f8FVP6hu5kcls6lzn/dHjOLUO0ZlKUgu5UwbVxUgF4rlRMs7w6PkdeGpzPhU3RD0UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cJU04siC7AFpuRxy7qe64c+4BBiueGm5ovtLrfBu2fg=;
 b=Rcz9XaYKaEdqzksjQwjAStMoz1yrgQWzyAylhl2XHNdRryEqtAG84JJiYVjXuIlkBE8bcwieRtNdP6yLIPH1zmfhyiIqPuBbG8pp1VYKPHd9FxDJAed1S0txcMlZnOkP2zOEUFIEYeLFK1RabdodGKTxOiWKvINQ7z4qRhu6igHuViWPdNlelR1eW8RyhKXVS5eSxYQXudNCI8WvmDnJYF6Icy8sWdHHOipH8nQxeszb0d0ZrnKNJsL04B8riepz58PTbj1CyS/04C/RqAXPuwoFtE9J3gPayHDEwZ/q0TY7T+K00w7pOrm+aiwEVgLYWSVVDUiAu087+++nrVfh8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cJU04siC7AFpuRxy7qe64c+4BBiueGm5ovtLrfBu2fg=;
 b=jb8nIWc4ZQRQaS5pKqQehMpdaszl6TF32bpWFteNmnJvnlp/2xQdRz4XdwD+ZWd6/M6wp2pO1uLkEhNUfulIdUipi8NNBPsTq5RFuZyeh/KNCmjmU+jDVR0izC3oXNisLWLFpi7oGlG2sExB7XoRhxn1+0/hozbFuZaU6swZsRA=
Received: from CY8P220CA0020.NAMP220.PROD.OUTLOOK.COM (2603:10b6:930:46::18)
 by LV2PR12MB5775.namprd12.prod.outlook.com (2603:10b6:408:179::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 09:47:15 +0000
Received: from CY4PEPF0000E9CE.namprd03.prod.outlook.com
 (2603:10b6:930:46:cafe::ff) by CY8P220CA0020.outlook.office365.com
 (2603:10b6:930:46::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30 via Frontend
 Transport; Mon, 17 Jun 2024 09:47:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9CE.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Mon, 17 Jun 2024 09:47:15 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Jun
 2024 04:47:13 -0500
Received: from tom-BIRMANPLUS.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 17 Jun 2024 04:47:12 -0500
From: Tom Chung <chiahsuan.chung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <Rodrigo.Siqueira@amd.com>, <alex.hung@amd.com>, <sunpeng.li@amd.com>,
 <chiahsuan.chung@amd.com>
Subject: [PATCH i-g-t,v3] tests/amdgpu/amd_replay: Add amd_replay IGT test
Date: Mon, 17 Jun 2024 17:47:03 +0800
Message-ID: <20240617094703.29421-1-chiahsuan.chung@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: chiahsuan.chung@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CE:EE_|LV2PR12MB5775:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d63ddd7-9dd8-4b85-edba-08dc8eb27838
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|376011|36860700010|1800799021|82310400023; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ahIdtgraCECAMghalwk1JpHiWcP0u6NWx6wuqzB2eM+P8AYLO1Ul09n9LjZm?=
 =?us-ascii?Q?qMx4FuHYQr9nPZJibNHy1ARP+oupuD2+6p6lBysPjnIY+1039m0uHRQxfw6d?=
 =?us-ascii?Q?J/qfD27SP2lrH7cgIW0XPVr9YXhfm7y3RGajmBpy+yH9FFgtm/66CXiUIG1V?=
 =?us-ascii?Q?g93XDkhDoomU/HJVRH5DFw3rs3KjxiH78ImISyKR42P40IfbGAljyrtUkTiE?=
 =?us-ascii?Q?01TbUjmlMBSjTP/9l19ts6mOw31PCve+NviGuuW0Z2Pe6GY857P8qQr+i+5p?=
 =?us-ascii?Q?4KZ7iJc+4jAp6FfRs6H/qxDmAN/689dm95avax8/YgqNPPlCBrXGDTS6Xjgq?=
 =?us-ascii?Q?Ydm0ZksFB/ylGS3s4PpQo0NZYqrefWo/nfRMEscTPtBmk7zdCsZExBWu+pkj?=
 =?us-ascii?Q?uKNvBWZOPkUwssiyyjgNvIZs7YApu02ptSxEJMzADF8+2J01P0rmYfFmuY3I?=
 =?us-ascii?Q?LqRGoyaJLBUJ2Ev2hpoyLUvovxBmdpQAm+5w3tKHQw0fyKzaqEUCrMoDZtYo?=
 =?us-ascii?Q?LBph7pZYODhR72ABncoIT5chXxOImV+boPKsKLqqUYI5uAOp4MiC9l9uNmQq?=
 =?us-ascii?Q?GVGqsc+4cY07ZksPPc4EzOrfW+d8ay71w0zFeTn+cwvPBGRRU3ETe/GDdU/k?=
 =?us-ascii?Q?L7b72c/1cXvdB8vyhbYC6xZ3U5muv8wb+xEkLVoZNnf7zQZZ+J+Sb9jDxQdj?=
 =?us-ascii?Q?xvMdkoNCLd/4O2jke9QgenrLU++5JUCgOzYtfo8Lrpwfm3BTeOywH+6GfWIz?=
 =?us-ascii?Q?5qzm9o6957nJlFGnC3MSsekJopXzTeoKOoExEo+BP8X/a7hQFx4mI7qDP1iq?=
 =?us-ascii?Q?Fif5WBa48ErJy8JhZFULYYCbfCuMU03NELTY9+lQ+INhI5A215TY8zQbO08Y?=
 =?us-ascii?Q?i1qIAQYRePXFZESjcJn8h9yQearsnfm4841bmUyTBjX8qhwEH4GYIObQTjtt?=
 =?us-ascii?Q?gP2WRzn1FZQg6cJEQkehJTnEhZG57zl1dHWr0v9BOVYqGhmSFFHKgjfTBUli?=
 =?us-ascii?Q?zP/ZTxd4dJwcUzqX43NnnGM3T1g7buNQGVkQKtI21Sgm3mXaMcaRaX9sjngk?=
 =?us-ascii?Q?twVwRCcagZmlm9reMXBHJCFrCkqby8zLs0Y9obWAaMBkrhJhoRCFhqgLRCpx?=
 =?us-ascii?Q?Gm1mYjelf1wXTPJnorPx145sA4TLZbS4Y/JVKZwiJdoLm+suj2eq1NjAYalQ?=
 =?us-ascii?Q?45uWbWGKkSUkeEirWJh2fxCiQyXS7gAcQ0RXoz+w56BxApmrgH4Q7TSkLogP?=
 =?us-ascii?Q?dyMZthbAYTgITWUPSvMiUFn7QPJ0uCbaT1UUjgX9zM1YIaPlK3Dfh4FbpY/L?=
 =?us-ascii?Q?SlEoeuQOZ4KS5g+5/1W7dLvfC8rny9pmenFidsumuNKh59gsGR5E1tQYxzBg?=
 =?us-ascii?Q?igeBW0chfpxetdZ3NMh2ktpEiGODbW8QhC2pdp16QvJbTQlF3g=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230037)(376011)(36860700010)(1800799021)(82310400023); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 09:47:15.0837 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d63ddd7-9dd8-4b85-edba-08dc8eb27838
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9CE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5775
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

[why]
Add a basic IGT test for panel replay feature.

[how]
Subtest case

a. static screen
   1. Check if system support panel replay.
   2. Start video flip for a while.
   3. Stop video flip and wait for a while.
   4. Check if replay state is in Replay mode.

b. Live mode (intermittent)
   1. Check if system support panel replay.
   2. Start video flip for a while.
   3. Check if replay state is in Live mode.
   4. Stop video flip and wait for a while.
   5. Check if replay state is in Replay mode.
   6. Repaet 2 to 5.

c. Live mode (constant)
   1. Check if system support panel replay.
   2. Start video flip for a while.
   3. Check if replay state is in Live mode.

d. Resume from Suspend
   1. Suspend the system and resume
   2. Start video flip for a while.
   3. Stop video flip and wait for a while.
   4. Check if replay state is in Replay mode.

Cc: Leo Li <sunpeng.li@amd.com>
Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
---
v2: Modify the include header files in tests/amdgpu/amd_replay.c
v3: Fix some coding style issues. Add a new subtest case.

 lib/igt_amd.c             | 105 +++++++++
 lib/igt_amd.h             |  39 +++-
 tests/amdgpu/amd_replay.c | 464 ++++++++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build  |   1 +
 4 files changed, 608 insertions(+), 1 deletion(-)
 create mode 100644 tests/amdgpu/amd_replay.c

diff --git a/lib/igt_amd.c b/lib/igt_amd.c
index 149af5151..a7db95c86 100644
--- a/lib/igt_amd.c
+++ b/lib/igt_amd.c
@@ -1014,6 +1014,111 @@ bool igt_amd_output_has_ilr_setting(int drm_fd, char *connector_name)
 	return igt_amd_output_has_debugfs(drm_fd, connector_name, DEBUGFS_EDP_ILR_SETTING);
 }
 
+/**
+ * igt_amd_output_has_replay_cap: check if eDP connector has replay_capability debugfs entry
+ * @drm_fd: DRM file descriptor
+ * @connector_name: The connector's name, on which we're reading the status
+ */
+bool igt_amd_output_has_replay_cap(int drm_fd, char *connector_name)
+{
+	return igt_amd_output_has_debugfs(drm_fd, connector_name, DEBUGFS_EDP_REPLAY_CAP);
+}
+
+/**
+ * igt_amd_replay_support_sink: check if sink device support Panel Replay
+ * @drm_fd: DRM file descriptor
+ * @connector_name: The connector's name, on which we're reading the status
+ */
+bool igt_amd_replay_support_sink(int drm_fd, char *connector_name)
+{
+	char buf[128];
+	int ret;
+	int fd;
+
+	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
+	if (fd < 0) {
+		igt_info("output %s: debugfs not found\n", connector_name);
+
+		return false;
+	}
+
+	ret = igt_debugfs_simple_read(fd, DEBUGFS_EDP_REPLAY_CAP, buf, sizeof(buf));
+	igt_assert_f(ret >= 0, "Reading %s for connector %s failed.\n",
+		 DEBUGFS_EDP_REPLAY_CAP, connector_name);
+	close(fd);
+
+	if (ret < 1)
+		return false;
+
+	return strstr(buf, "Sink support: yes");
+}
+
+/**
+ * igt_amd_replay_support_drv: check if driver support Panel Replay
+ * @drm_fd: DRM file descriptor
+ * @connector_name: The connector's name, on which we're reading the status
+ */
+bool igt_amd_replay_support_drv(int drm_fd, char *connector_name)
+{
+	char buf[128];
+	int ret;
+	int fd;
+
+	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
+	if (fd < 0) {
+		igt_info("output %s: debugfs not found\n", connector_name);
+
+		return false;
+	}
+
+	ret = igt_debugfs_simple_read(fd, DEBUGFS_EDP_REPLAY_CAP, buf, sizeof(buf));
+	igt_assert_f(ret >= 0, "Reading %s for connector %s failed.\n",
+		 DEBUGFS_EDP_REPLAY_CAP, connector_name);
+	close(fd);
+
+	if (ret < 1)
+		return false;
+
+	return strstr(buf, "Driver support: yes");
+}
+
+/**
+ * igt_amd_output_has_replay_state: check if eDP connector has replay_state debugfs entry
+ * @drm_fd: DRM file descriptor
+ * @connector_name: The connector's name, on which we're reading the status
+ */
+bool igt_amd_output_has_replay_state(int drm_fd, char *connector_name)
+{
+	return igt_amd_output_has_debugfs(drm_fd, connector_name, DEBUGFS_EDP_REPLAY_STATE);
+}
+
+/**
+ * @brief Read Panel Replay State from debugfs interface
+ * @param drm_fd DRM file descriptor
+ * @param connector_name The connector's name, on which we're reading the status
+ * @return Panel Replay state as integer
+ */
+int igt_amd_read_replay_state(int drm_fd, char *connector_name)
+{
+	char buf[4];
+	int fd, ret;
+
+	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
+	if (fd < 0) {
+		igt_info("Couldn't open connector %s debugfs directory\n", connector_name);
+
+		return -1;
+	}
+
+	ret = igt_debugfs_simple_read(fd, DEBUGFS_EDP_REPLAY_STATE, buf, sizeof(buf));
+	close(fd);
+
+	igt_assert_f(ret >= 0, "Reading %s for connector %s failed.\n",
+		 DEBUGFS_EDP_REPLAY_STATE, connector_name);
+
+	return strtol(buf, NULL, 10);
+}
+
 /**
  * igt_amd_output_has_psr_cap: check if eDP connector has psr_capability debugfs entry
  * @drm_fd: DRM file descriptor
diff --git a/lib/igt_amd.h b/lib/igt_amd.h
index 6780b99de..a41b423b7 100644
--- a/lib/igt_amd.h
+++ b/lib/igt_amd.h
@@ -47,6 +47,8 @@
 #define DEBUGFS_EDP_ILR_SETTING "ilr_setting"
 #define MAX_SUPPORTED_ILR 8
 #define MULTIPLIER_TO_LR 270000
+#define DEBUGFS_EDP_REPLAY_CAP "replay_capability"
+#define DEBUGFS_EDP_REPLAY_STATE "replay_state"
 #define DEBUGFS_EDP_PSR_CAP	"psr_capability"
 #define DEBUGFS_EDP_PSR_STATE	"psr_state"
 #define DEBUGFS_ALLOW_EDP_HOTPLUG_DETECT "allow_edp_hotplug_detection"
@@ -100,6 +102,35 @@ enum dc_link_training_type {
 	LINK_TRAINING_NO_PATTERN
 };
 
+/*
+ * enumeration of REPLAY STATE below should be aligned to the upstreamed
+ * amdgpu kernel driver 'enum replay_state' in dmub_cmd.h
+ */
+enum replay_state {
+	REPLAY_STATE_0 = 0x0,
+	REPLAY_STATE_1 = 0x10,
+	REPLAY_STATE_1A = 0x11,
+	REPLAY_STATE_2 = 0x20,
+	REPLAY_STATE_3 = 0x30,
+	REPLAY_STATE_3INIT = 0x31,
+	REPLAY_STATE_4 = 0x40,
+	REPLAY_STATE_4A = 0x41,
+	REPLAY_STATE_4B = 0x42,
+	REPLAY_STATE_4C = 0x43,
+	REPLAY_STATE_4D = 0x44,
+	REPLAY_STATE_4B_LOCKED = 0x4A,
+	REPLAY_STATE_4C_UNLOCKED = 0x4B,
+	REPLAY_STATE_5 = 0x50,
+	REPLAY_STATE_5A = 0x51,
+	REPLAY_STATE_5B = 0x52,
+	REPLAY_STATE_5A_LOCKED = 0x5A,
+	REPLAY_STATE_5B_UNLOCKED = 0x5B,
+	REPLAY_STATE_6 = 0x60,
+	REPLAY_STATE_6A = 0x61,
+	REPLAY_STATE_6B = 0x62,
+	REPLAY_STATE_INVALID = 0xFF
+};
+
 /*
  * enumeration of PSR STATE below should be aligned to the upstreamed
  * amdgpu kernel driver 'enum dc_psr_state' in dc_type.h
@@ -135,7 +166,8 @@ enum amdgpu_debug_visual_confirm {
 	VISUAL_CONFIRM_HDR	= 2,
 	VISUAL_CONFIRM_MPCTREE	= 4,
 	VISUAL_CONFIRM_PSR	= 5,
-	VISUAL_CONFIRM_SWIZZLE	= 9
+	VISUAL_CONFIRM_SWIZZLE  = 9,
+	VISUAL_CONFIRM_REPLAY = 12
 };
 
 uint32_t igt_amd_create_bo(int fd, uint64_t size);
@@ -189,6 +221,11 @@ void igt_amd_write_ilr_setting(
 	int drm_fd, char *connector_name, enum dc_lane_count lane_count,
 	uint8_t link_rate_set);
 bool igt_amd_output_has_ilr_setting(int drm_fd, char *connector_name);
+bool igt_amd_output_has_replay_cap(int drm_fd, char *connector_name);
+bool igt_amd_replay_support_sink(int drm_fd, char *connector_name);
+bool igt_amd_replay_support_drv(int drm_fd, char *connector_name);
+bool igt_amd_output_has_replay_state(int drm_fd, char *connector_name);
+int  igt_amd_read_replay_state(int drm_fd, char *connector_name);
 bool igt_amd_output_has_psr_cap(int drm_fd, char *connector_name);
 bool igt_amd_psr_support_sink(int drm_fd, char *connector_name, enum psr_mode mode);
 bool igt_amd_psr_support_drv(int drm_fd, char *connector_name, enum psr_mode mode);
diff --git a/tests/amdgpu/amd_replay.c b/tests/amdgpu/amd_replay.c
new file mode 100644
index 000000000..551544238
--- /dev/null
+++ b/tests/amdgpu/amd_replay.c
@@ -0,0 +1,464 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2024 Advanced Micro Devices, Inc.
+ */
+
+#include <dirent.h>
+
+#include "igt_amd.h"
+
+/* hardware requirements:
+ * eDP panel that supports Panel Replay
+ */
+IGT_TEST_DESCRIPTION("Basic test for enabling Panel Replay for eDP displays");
+
+#define REPLAY_SETTLE_DELAY 10
+
+/* Common test data. */
+struct test_data {
+	igt_display_t display;
+	igt_plane_t *primary;
+	igt_output_t *output;
+	igt_pipe_t *pipe;
+	drmModeModeInfo *mode;
+	enum pipe pipe_id;
+	int fd;
+	int debugfs_fd;
+	int w, h;
+};
+
+struct {
+	bool visual_confirm;
+} opt = {
+	.visual_confirm = false,	/* visual confirm debug option */
+};
+
+const char *help_str =
+"  --visual-confirm           Panel Replay visual confirm debug option enable\n";
+
+struct option long_options[] = {
+	{"visual-confirm",	required_argument, NULL, 'v'},
+	{ 0, 0, 0, 0 }
+};
+
+enum test_mode {
+	TEST_MODE_STATIC_SCREEN = 0,
+	TEST_MODE_INTERMITTENT_LIVE,
+	TEST_MODE_CONSTANT_LIVE,
+	TEST_MODE_COUNT
+};
+
+/* Common test setup. */
+static void test_init(struct test_data *data)
+{
+	igt_display_t *display = &data->display;
+
+	/* It doesn't matter which pipe we choose on amdpgu. */
+	data->pipe_id = PIPE_A;
+	data->pipe = &data->display.pipes[data->pipe_id];
+
+	igt_display_reset(display);
+
+	data->output = igt_get_single_output_for_pipe(display, data->pipe_id);
+	igt_require(data->output);
+	igt_info("output %s\n", data->output->name);
+
+	data->mode = igt_output_get_mode(data->output);
+	igt_assert(data->mode);
+	kmstest_dump_mode(data->mode);
+
+	data->primary =
+		 igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
+
+	igt_output_set_pipe(data->output, data->pipe_id);
+
+	data->w = data->mode->hdisplay;
+	data->h = data->mode->vdisplay;
+
+	if (opt.visual_confirm) {
+		/**
+		 * if visual confirm option is enabled, we'd trigger a full modeset before test run
+		 * to have Panel Replay visual confirm enable take effect. DPMS off -> ON transition
+		 * is one of many approaches.
+		 */
+		kmstest_set_connector_dpms(data->fd, data->output->config.connector,
+			 DRM_MODE_DPMS_OFF);
+		kmstest_set_connector_dpms(data->fd, data->output->config.connector,
+			 DRM_MODE_DPMS_ON);
+	}
+}
+
+/* Common test cleanup. */
+static void test_fini(struct test_data *data)
+{
+		igt_display_t *display = &data->display;
+
+		igt_display_reset(display);
+		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
+}
+
+static int check_conn_type(struct test_data *data, uint32_t type)
+{
+	int i;
+
+	for (i = 0; i < data->display.n_outputs; i++) {
+		uint32_t conn_type = data->display.outputs[i].config.connector->connector_type;
+
+		if (conn_type == type)
+			return i;
+	}
+
+	return -1;
+}
+
+static bool replay_mode_supported(struct test_data *data)
+{
+	/* run Panel Replay test if eDP panel support Panel Replay */
+	if (!igt_amd_output_has_replay_cap(data->fd, data->output->name)) {
+		igt_warn(" driver does not have %s debugfs interface\n", DEBUGFS_EDP_REPLAY_CAP);
+
+		return false;
+	}
+
+	if (!igt_amd_output_has_replay_state(data->fd, data->output->name)) {
+		igt_warn(" driver does not have %s debugfs interface\n", DEBUGFS_EDP_REPLAY_STATE);
+
+		return false;
+	}
+
+	if (!igt_amd_replay_support_sink(data->fd, data->output->name)) {
+		igt_warn(" output %s not support Panel Replay mode\n", data->output->name);
+
+		return false;
+	}
+
+	if (!igt_amd_replay_support_drv(data->fd, data->output->name)) {
+		igt_warn(" kernel driver not support Panel Replay mode\n");
+
+		return false;
+	}
+
+	return true;
+}
+
+/* Read from /dev/drm_dp_aux
+ * addr: DPCD offset
+ * val:  Read value of DPCD register
+ */
+static bool dpcd_read_byte(int drm_fd,
+	drmModeConnector *connector, uint32_t addr, uint8_t *val)
+{
+	DIR *dir;
+	int dir_fd;
+	uint8_t buf[16] = {0};
+	*val = 0;
+
+	dir_fd = igt_connector_sysfs_open(drm_fd, connector);
+	igt_assert(dir_fd >= 0);
+
+	dir = fdopendir(dir_fd);
+	igt_assert(dir);
+
+	for (;;) {
+		struct dirent *ent;
+		char path[5 + sizeof(ent->d_name)];
+		int fd, ret, i, j, k;
+
+		ent = readdir(dir);
+		if (!ent)
+			break;
+
+		if (strncmp(ent->d_name, "drm_dp_aux", 10))
+			continue;
+
+		snprintf(path, sizeof(path), "/dev/%s", ent->d_name);
+
+		fd = open(path, O_RDONLY);
+		igt_assert(fd >= 0);
+
+		k = (addr / 16) + 1;
+		j = addr % 16;
+
+		/* read 16 bytes each loop */
+		for (i = 0; i < k; i++) {
+			ret = read(fd, buf, sizeof(buf));
+			if (ret < 0)
+				break;
+			if (ret != sizeof(buf))
+				break;
+		}
+
+		close(fd);
+
+		closedir(dir);
+		close(dir_fd);
+
+		if (ret > 0)
+			*val = buf[j];
+
+		return (ret > 0);
+	}
+
+	closedir(dir);
+	close(dir_fd);
+
+	return false;
+}
+
+static void run_check_replay(struct test_data *data, enum test_mode test_mode)
+{
+	int edp_idx, ret, frame_count, replay_state;
+	igt_fb_t ref_fb, ref_fb2;
+	igt_fb_t *flip_fb;
+	igt_output_t *output;
+	uint8_t panel_dpcd = 0;
+
+	test_init(data);
+
+	edp_idx = check_conn_type(data, DRM_MODE_CONNECTOR_eDP);
+	igt_skip_on_f(edp_idx == -1, "no eDP connector found\n");
+
+	/* check if eDP support Panel Replay. */
+	igt_skip_on(!replay_mode_supported(data));
+
+	for_each_connected_output(&data->display, output) {
+		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
+			continue;
+
+		igt_create_color_fb(data->fd, data->mode->hdisplay,
+			 data->mode->vdisplay, DRM_FORMAT_XRGB8888, 0, 0.6, 0.6, 0.6, &ref_fb);
+		igt_create_color_fb(data->fd, data->mode->hdisplay,
+			 data->mode->vdisplay, DRM_FORMAT_XRGB8888, 0, 0.0, 0.4, 0.14, &ref_fb2);
+
+		igt_plane_set_fb(data->primary, &ref_fb);
+		igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
+		flip_fb = &ref_fb;
+		drmModePageFlip(data->fd, output->config.crtc->crtc_id,
+			 flip_fb->fb_id, DRM_MODE_PAGE_FLIP_EVENT, NULL);
+		kmstest_wait_for_pageflip(data->fd);
+
+		/* Panel Replay state takes some time to settle its value on static screen */
+		sleep(REPLAY_SETTLE_DELAY);
+
+		/* Check Panel Replay state */
+		replay_state = igt_amd_read_replay_state(data->fd, output->name);
+		igt_debug("replay_state static mode before flip = 0x%X\n", replay_state);
+		igt_fail_on_f(replay_state < 0, "Open Panel Replay state debugfs failed\n");
+		igt_fail_on_f(replay_state < REPLAY_STATE_2,
+			 "Panel Replay was not enabled for connector %s\n", output->name);
+
+		/* Do some page flip and let the replay go into live mode */
+		for (frame_count = 0; frame_count <= 20; frame_count++) {
+			ret = drmModePageFlip(data->fd, output->config.crtc->crtc_id,
+				 flip_fb->fb_id, DRM_MODE_PAGE_FLIP_EVENT, NULL);
+			igt_require(ret == 0);
+			kmstest_wait_for_pageflip(data->fd);
+
+			if (test_mode == (TEST_MODE_CONSTANT_LIVE || TEST_MODE_INTERMITTENT_LIVE)
+				 && frame_count > 5) {
+				/* Panel Replay state needs few frame to enter the live mode */
+				replay_state = igt_amd_read_replay_state(data->fd, output->name);
+				dpcd_read_byte(data->fd, output->config.connector, 0x378, &panel_dpcd);
+				igt_debug("replay_state live mode = 0x%X\n", replay_state);
+				igt_fail_on_f(replay_state < REPLAY_STATE_4 && replay_state >= REPLAY_STATE_5,
+					 "State should be REPLAY_STATE_4 (Active with single frame update)\n");
+				igt_fail_on_f(panel_dpcd == 0, "Panel is not in replay mode\n");
+			}
+
+			if (frame_count % 2 == 0)
+				flip_fb = &ref_fb2;
+			else
+				flip_fb = &ref_fb;
+		}
+
+		/* Check Panel Replay state in static screen */
+		if (test_mode == TEST_MODE_STATIC_SCREEN || TEST_MODE_INTERMITTENT_LIVE) {
+			/* Panel Replay state takes some time to settle its value on static screen */
+			sleep(1);
+
+			replay_state = igt_amd_read_replay_state(data->fd, output->name);
+			dpcd_read_byte(data->fd, output->config.connector, 0x378, &panel_dpcd);
+			igt_debug("replay_state static mode = 0x%X\n", replay_state);
+			igt_fail_on_f(replay_state < REPLAY_STATE_3 && replay_state >= REPLAY_STATE_4,
+				 "State should be REPLAY_STATE_3 (Active)\n");
+			igt_fail_on_f(panel_dpcd == 0, "Panel is not in replay mode\n");
+		}
+
+		/* Do another page flip if we do the replay_intermittent_live test */
+		if (test_mode == TEST_MODE_INTERMITTENT_LIVE) {
+			for (frame_count = 0; frame_count <= 30; frame_count++) {
+				ret = drmModePageFlip(data->fd, output->config.crtc->crtc_id,
+					 flip_fb->fb_id, DRM_MODE_PAGE_FLIP_EVENT, NULL);
+				igt_require(ret == 0);
+				kmstest_wait_for_pageflip(data->fd);
+
+				if (frame_count > 5) {
+					/* Needs few frames to let state enter the live mode */
+					replay_state = igt_amd_read_replay_state(data->fd, output->name);
+					dpcd_read_byte(data->fd, output->config.connector, 0x378, &panel_dpcd);
+					igt_debug("replay_state TEST_MODE_INTERMITTENT_LIVE during flip = 0x%X\n",
+						 replay_state);
+					igt_fail_on_f(replay_state < REPLAY_STATE_4 && replay_state >= REPLAY_STATE_5,
+						 "State should be REPLAY_STATE_4 (Active with single frame update)\n");
+					igt_fail_on_f(panel_dpcd == 0, "Panel is not in replay mode\n");
+				}
+
+				if (frame_count % 2 == 0)
+					flip_fb = &ref_fb2;
+				else
+					flip_fb = &ref_fb;
+			}
+
+			/* Panel Replay state takes some time to settle its value on static screen */
+			sleep(1);
+
+			replay_state = igt_amd_read_replay_state(data->fd, output->name);
+			dpcd_read_byte(data->fd, output->config.connector, 0x378, &panel_dpcd);
+			igt_debug("replay_state TEST_MODE_INTERMITTENT_LIVE after flip = 0x%X\n",
+				 replay_state);
+			igt_fail_on_f(replay_state < REPLAY_STATE_3 && replay_state >= REPLAY_STATE_4,
+				 "State should be REPLAY_STATE_3 (Active)\n");
+			igt_fail_on_f(panel_dpcd == 0, "Panel is not in replay mode\n");
+		}
+
+		igt_remove_fb(data->fd, &ref_fb);
+		igt_remove_fb(data->fd, &ref_fb2);
+	}
+
+	test_fini(data);
+}
+
+static void run_check_replay_suspend(struct test_data *data)
+{
+	int edp_idx, ret, frame_count, replay_state;
+	igt_fb_t ref_fb, ref_fb2;
+	igt_fb_t *flip_fb;
+	igt_output_t *output;
+	uint8_t panel_dpcd = 0;
+
+	test_init(data);
+
+	edp_idx = check_conn_type(data, DRM_MODE_CONNECTOR_eDP);
+	igt_skip_on_f(edp_idx == -1, "no eDP connector found\n");
+
+	/* check if eDP support Panel Replay. */
+	igt_skip_on(!replay_mode_supported(data));
+
+	for_each_connected_output(&data->display, output) {
+		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
+			continue;
+
+		igt_create_color_fb(data->fd, data->mode->hdisplay,
+			 data->mode->vdisplay, DRM_FORMAT_XRGB8888, 0, 0.6, 0.6, 0.6, &ref_fb);
+		igt_create_color_fb(data->fd, data->mode->hdisplay,
+			 data->mode->vdisplay, DRM_FORMAT_XRGB8888, 0, 0.0, 0.4, 0.14, &ref_fb2);
+
+		igt_plane_set_fb(data->primary, &ref_fb);
+		igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
+		flip_fb = &ref_fb;
+		drmModePageFlip(data->fd, output->config.crtc->crtc_id,
+			 flip_fb->fb_id, DRM_MODE_PAGE_FLIP_EVENT, NULL);
+		kmstest_wait_for_pageflip(data->fd);
+
+		/* Suspend and Resume */
+		igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
+
+		/* Do some page flip and let the replay go into live mode */
+		for (frame_count = 0; frame_count <= 10; frame_count++) {
+			ret = drmModePageFlip(data->fd, output->config.crtc->crtc_id,
+				 flip_fb->fb_id, DRM_MODE_PAGE_FLIP_EVENT, NULL);
+			igt_require(ret == 0);
+			kmstest_wait_for_pageflip(data->fd);
+
+			if (frame_count % 2 == 0)
+				flip_fb = &ref_fb2;
+			else
+				flip_fb = &ref_fb;
+		}
+
+		/* Panel Replay state takes some time to settle its value on static screen */
+		sleep(REPLAY_SETTLE_DELAY);
+
+		replay_state = igt_amd_read_replay_state(data->fd, output->name);
+		dpcd_read_byte(data->fd, output->config.connector, 0x378, &panel_dpcd);
+		igt_debug("replay_state static mode = 0x%X\n", replay_state);
+		igt_fail_on_f(replay_state < REPLAY_STATE_3 && replay_state >= REPLAY_STATE_4,
+			 "State should be REPLAY_STATE_3 (Active)\n");
+		igt_fail_on_f(panel_dpcd == 0, "Panel is not in replay mode\n");
+
+		igt_remove_fb(data->fd, &ref_fb);
+		igt_remove_fb(data->fd, &ref_fb2);
+	}
+
+	test_fini(data);
+}
+
+static int opt_handler(int option, int option_index, void *data)
+{
+	switch (option) {
+	case 'v':
+		opt.visual_confirm = strtol(optarg, NULL, 0);
+		igt_info("Panel Replay Visual Confirm %s\n",
+			 opt.visual_confirm ? "enabled" : "disabled");
+		break;
+	default:
+		return IGT_OPT_HANDLER_ERROR;
+	}
+
+	return IGT_OPT_HANDLER_SUCCESS;
+}
+
+igt_main_args("", long_options, help_str, opt_handler, NULL)
+{
+	struct test_data data;
+
+	igt_skip_on_simulation();
+	memset(&data, 0, sizeof(data));
+
+	igt_fixture
+	{
+		data.fd = drm_open_driver_master(DRIVER_AMDGPU);
+
+		if (data.fd == -1)
+			igt_skip("Not an amdgpu driver.\n");
+
+		data.debugfs_fd = igt_debugfs_dir(data.fd);
+
+		kmstest_set_vt_graphics_mode();
+
+		igt_display_require(&data.display, data.fd);
+		igt_require(&data.display.is_atomic);
+		igt_display_require_output(&data.display);
+
+		/* check if visual confirm option available */
+		if (opt.visual_confirm) {
+			igt_skip_on(!igt_amd_has_visual_confirm(data.fd));
+			igt_skip_on_f(!igt_amd_set_visual_confirm(data.fd, VISUAL_CONFIRM_REPLAY),
+				 "set Panel Replay visual confirm failed\n");
+		}
+	}
+
+	igt_describe("Test whether Panel Replay can be enabled with static screen");
+	igt_subtest("replay_static_screen") run_check_replay(&data, TEST_MODE_STATIC_SCREEN);
+
+	igt_describe("Test whether Panel Replay can be enabled with intermittent live mdoe");
+	igt_subtest("replay_intermittent_live") run_check_replay(&data, TEST_MODE_INTERMITTENT_LIVE);
+
+	igt_describe("Test whether Panel Replay can be enabled with constant live mdoe");
+	igt_subtest("replay_constant_live") run_check_replay(&data, TEST_MODE_CONSTANT_LIVE);
+
+	igt_describe("Test whether Panel Replay can be enabled after resume from suspend");
+	igt_subtest("replay_suspend") run_check_replay_suspend(&data);
+
+	igt_fixture
+	{
+		if (opt.visual_confirm) {
+			igt_skip_on(!igt_amd_has_visual_confirm(data.fd));
+			igt_require_f(igt_amd_set_visual_confirm(data.fd, VISUAL_CONFIRM_DISABLE),
+				 "reset Panel Replay visual confirm failed\n");
+		}
+		close(data.debugfs_fd);
+		igt_display_fini(&data.display);
+		drm_close_driver(data.fd);
+	}
+}
diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
index 3982a665f..69706fa70 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -30,6 +30,7 @@ if libdrm_amdgpu.found()
 			  'amd_prime',
 			  'amd_psr',
 			  'amd_ras',
+			  'amd_replay',
 			  'amd_security',
 			  'amd_uvd_dec',
 			  'amd_uvd_enc',
-- 
2.34.1

