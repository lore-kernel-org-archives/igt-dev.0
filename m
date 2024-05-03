Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 255ECC4345F
	for <igt-dev@archiver.kernel.org>; Fri,  3 May 2024 09:09:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5B8910E18B;
	Fri,  3 May 2024 09:09:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Bz20Kzl5";
	dkim-atps=neutral
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2046.outbound.protection.outlook.com [40.107.95.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D19DB10E18B
 for <igt-dev@lists.freedesktop.org>; Fri,  3 May 2024 09:09:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mltT/ndZY8C06Mn1T8Y7RCfouKQ9REOL8PBLITeLHAlqxoTdrkVnwsncaR/VGBSW3GQmORWLmNJ/F2QteY4vvjVaHuJESDaa2XKausSB2fKvucXmAEax9foNjWDsJFOBW3+yywnglP7cq3p71eD+f3cpmAItCIysJG48KWQJbGzRwgf9JMqVKADbIQT8S+aBtQ1lrL6rnGK4lJuRTnZRCPBV8k+kWj9GSs9Sc/pX1WuRReyW8AFMocdLgNd+KSSXa+wMRQRsSKFc2SaE9gsrLfwYzDNplKic2rk2Fey7iA6EQ0R7++tMgjfo5vHjdtlVDfVuZwolTjEIHTiJEzdWxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CEp2hrVRm+rMf1kkJIcy6UdPCrWf1+YxqOOL7I/cz9k=;
 b=FKKDK8tFvpEsmn9hz13W3zkTxCAIB/EQP6HlyGx5JkEhDTc0XnPONAHUa6/csQE77y3yd0lQMRLwqX2NdYjvghNFN5IKvfvB4FN4FXteq7J3BQokdnNKpE6yY276gsYrW+0ZuPU+m0qzn1XthZWXz8yAUIt5+gfOTWmZOpeWdfRyKvtERKxgALuIf20onyKKies7BZi7/vS5CvOS7eQvD+2dMcgs3NidYwLbjR93HCBTUiE6oc8rIs0qnDmr6XuXVhcbC6fNQLy+VUAHtjFFMYTQJnZoNj5+6Ow2drk+67dVZVViQelkN9SC3psOJOAxDj9FMrKv7l3cvcCJk02B1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CEp2hrVRm+rMf1kkJIcy6UdPCrWf1+YxqOOL7I/cz9k=;
 b=Bz20Kzl5Z9MsO/PxvkGZehnmJTlHQvjmHEpqa88dCFPalN3itpIeV0pSaTRbXu+4O0Duv9/RMx+MCt8hkY7pt0eDVgi0ZAhkoj1CCZAOIsNlYjDREheK7DDlAy+T1vxkRwf8aS7/evPOm3oIg4y6IJ5owY7PPWKZObgbbIwkfiY=
Received: from PH7PR13CA0008.namprd13.prod.outlook.com (2603:10b6:510:174::15)
 by MW6PR12MB8997.namprd12.prod.outlook.com (2603:10b6:303:23e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.30; Fri, 3 May
 2024 09:09:06 +0000
Received: from CY4PEPF0000E9D6.namprd05.prod.outlook.com
 (2603:10b6:510:174:cafe::c7) by PH7PR13CA0008.outlook.office365.com
 (2603:10b6:510:174::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.31 via Frontend
 Transport; Fri, 3 May 2024 09:09:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D6.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Fri, 3 May 2024 09:09:05 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 3 May
 2024 04:09:04 -0500
Received: from tom-BIRMANPLUS.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 3 May 2024 04:09:02 -0500
From: Tom Chung <chiahsuan.chung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <Rodrigo.Siqueira@amd.com>, <alex.hung@amd.com>, <sunpeng.li@amd.com>,
 <chiahsuan.chung@amd.com>
Subject: [PATCH i-g-t] tests/amdgpu/amd_replay: Add amd_replay IGT test
Date: Fri, 3 May 2024 17:08:54 +0800
Message-ID: <20240503090854.13663-1-chiahsuan.chung@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: chiahsuan.chung@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D6:EE_|MW6PR12MB8997:EE_
X-MS-Office365-Filtering-Correlation-Id: 539071ce-ef4a-4908-9230-08dc6b50af2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|36860700004|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NW8e+nwiQUmkVmGjqbxdhXpZsyYGAIV3SbnBtCmVyxpoQKd0wobmDliZR0Gt?=
 =?us-ascii?Q?e3ZeXA+X+OAKwb9gfyoB+dhvscRoUSm3qsyy4P0EEUGBNEfNqsJ2WGTanz2F?=
 =?us-ascii?Q?atR+U/sWYJUiKu6KSVsUELMmqSpclqPghXyVcTzS2uu1NUlyuZuTl5cfIXmv?=
 =?us-ascii?Q?p6RNAwkc6lZOoXc8rmCOdAC7UunkjmbLhZuy8sNQ2aBcoYliIMczRb7pSehX?=
 =?us-ascii?Q?/Ox1RAZ5vAUtxVmhTXNbbNIDAPvT6cNAldYQIRLvbd6QX+Mc4Jgrjtg1vPz1?=
 =?us-ascii?Q?bDLVC6ZhHk2GfeESN2zRSpd+GSOdIqQ/Y6RR8weQ8TgqeNbDF7VvYGni9kSH?=
 =?us-ascii?Q?Q4FoZPolHAT8lCBjCMH1YZTNA/VObWpkXCJShLFDom1q3t8Jsy4eq57aQEaY?=
 =?us-ascii?Q?tcswyWpYKlmsCGVmMPEAX5vykrrqdDsC1A9615aQ/HuFlDHmed+npqUoTJfs?=
 =?us-ascii?Q?X7q4DoYxiKPHcu7syz7njnQmGZfY7QUJlvaV4nC71zJnhpVBLQhztsO8Myy7?=
 =?us-ascii?Q?TbMCK2pSsuPCJuayVbwKuYglfY9TD+dwzVBqHPCXOXCcKtFMRp8GIv/hTHGh?=
 =?us-ascii?Q?wczxDcKVjh6/JnGKdrQcqdozuUtVOMYYJw+0oQwDhi82nIYAGkjAOuBFVC2m?=
 =?us-ascii?Q?faUkq6IsaPcF2aZ6u9ZpCqMiAxTO8sVPpP45d4qztaCkm7uye0Q2TG0/3RiI?=
 =?us-ascii?Q?B0coskDBHruh/PTst1gfZBe/81yb2pkwMkqv/q2mZqPlHfmrjnDLrxT8S1VP?=
 =?us-ascii?Q?QpUrWQg8a6/SlWjOVnLgEYQS1/nlcWQt9KIviLB6ytWlmLKHq6Ht7sj32Nuw?=
 =?us-ascii?Q?zzlHq/W9Mzk14Hwx0vN2t8OGKkxfQ9GmvkiOY2z2SQ9/6ZSPoa+PGpumlYq+?=
 =?us-ascii?Q?58DYhnQwO+6eRu9lVvY8i1J4gEZ5oncTZogFBBQaYB3KNqNsvYhtJL/w2s12?=
 =?us-ascii?Q?ZWR5J1yKH2d22og5LrNrLCZ8TotHzGpo9o32cofg2eS61ybpGYt+rvtP8dNZ?=
 =?us-ascii?Q?EcEVB/hcFDUJC38owqgstkX560k2O7dV+D1s9zoHlBB5JDl0n79SFKwgVUPt?=
 =?us-ascii?Q?5DLTl64uFyf79JCd2pAVaDC3TwQP5IBu+P9nh3HVuVJqagn6dQcECErpEAvw?=
 =?us-ascii?Q?P4bu/xFs62rwAaMG0Ngua+QsqJHRwvEdt1Z/ibM0LPLCQyB4eOWYRzzSMCvR?=
 =?us-ascii?Q?EtzLkvHNC5rQgN3our4TOWUtLpERiYKkG0Y5+8t3WxchN0+1alYKdnbK9JaH?=
 =?us-ascii?Q?wwi8qyY+agfxczecBQzwEG23m0oVXhTa6YcTpcTySWolPXMOM2IR+OpEqIa6?=
 =?us-ascii?Q?xo9GZtg1dR+h5ghOBIUS0XM/fyKyBrNvkrxyN68rn9DKSzFKcA5NrBqR54PG?=
 =?us-ascii?Q?gFDWMdQl7PaDPn5dBnc60BNiOxQ3?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2024 09:09:05.9098 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 539071ce-ef4a-4908-9230-08dc6b50af2b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8997
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

Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
---
 lib/igt_amd.c             | 102 ++++++++++++
 lib/igt_amd.h             |  39 ++++-
 tests/amdgpu/amd_replay.c | 325 ++++++++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build  |   1 +
 4 files changed, 466 insertions(+), 1 deletion(-)
 create mode 100755 tests/amdgpu/amd_replay.c

diff --git a/lib/igt_amd.c b/lib/igt_amd.c
index 149af5151..8bc6fdc6a 100644
--- a/lib/igt_amd.c
+++ b/lib/igt_amd.c
@@ -1014,6 +1014,108 @@ bool igt_amd_output_has_ilr_setting(int drm_fd, char *connector_name)
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
+		return false;
+	}
+
+	ret = igt_debugfs_simple_read(fd, DEBUGFS_EDP_REPLAY_CAP, buf, sizeof(buf));
+	igt_assert_f(ret >= 0, "Reading %s for connector %s failed.\n",
+		DEBUGFS_EDP_REPLAY_CAP, connector_name);
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
+		return false;
+	}
+
+	ret = igt_debugfs_simple_read(fd, DEBUGFS_EDP_REPLAY_CAP, buf, sizeof(buf));
+	igt_assert_f(ret >= 0, "Reading %s for connector %s failed.\n",
+		DEBUGFS_EDP_REPLAY_CAP, connector_name);
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
+		return -1;
+	}
+
+	ret = igt_debugfs_simple_read(fd, DEBUGFS_EDP_REPLAY_STATE, buf, sizeof(buf));
+	close(fd);
+
+	igt_assert_f(ret >= 0, "Reading %s for connector %s failed.\n",
+		DEBUGFS_EDP_REPLAY_STATE, connector_name);
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
new file mode 100755
index 000000000..61894cd84
--- /dev/null
+++ b/tests/amdgpu/amd_replay.c
@@ -0,0 +1,325 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2024 Advanced Micro Devices, Inc.
+ */
+
+#include "drm_mode.h"
+#include "igt.h"
+#include "igt_core.h"
+#include "igt_kms.h"
+#include "igt_amd.h"
+#include <stdint.h>
+#include <fcntl.h>
+#include <xf86drmMode.h>
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
+		igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
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
+				DRM_MODE_DPMS_OFF);
+		kmstest_set_connector_dpms(data->fd, data->output->config.connector,
+				DRM_MODE_DPMS_ON);
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
+		return false;
+	}
+
+	if (!igt_amd_output_has_replay_state(data->fd, data->output->name)) {
+		igt_warn(" driver does not have %s debugfs interface\n", DEBUGFS_EDP_REPLAY_STATE);
+		return false;
+	}
+
+	if (!igt_amd_replay_support_sink(data->fd, data->output->name)) {
+		igt_warn(" output %s not support Panel Replay mode\n", data->output->name);
+		return false;
+	}
+
+	if (!igt_amd_replay_support_drv(data->fd, data->output->name)) {
+		igt_warn(" kernel driver not support Panel Replay mode\n");
+		return false;
+	}
+
+	return true;
+}
+
+static void run_check_replay(struct test_data *data, enum test_mode test_mode)
+{
+	int edp_idx, ret, frame_count, replay_state;
+	igt_fb_t ref_fb, ref_fb2;
+	igt_fb_t *flip_fb;
+	igt_output_t *output;
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
+				    data->mode->vdisplay, DRM_FORMAT_XRGB8888, 0, 0.6,
+				    0.6, 0.6, &ref_fb);
+		igt_create_color_fb(data->fd, data->mode->hdisplay,
+				    data->mode->vdisplay, DRM_FORMAT_XRGB8888, 0, 0.0,
+				    0.4, 0.14, &ref_fb2);
+
+		igt_plane_set_fb(data->primary, &ref_fb);
+		igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
+		flip_fb = &ref_fb;
+		drmModePageFlip(data->fd, output->config.crtc->crtc_id,
+					flip_fb->fb_id, DRM_MODE_PAGE_FLIP_EVENT, NULL);
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
+			"Panel Replay was not enabled for connector %s\n", output->name);
+
+		/* Do some page flip and let the replay go into live mode */
+		for (frame_count = 0; frame_count <= 20; frame_count++) {
+			ret = drmModePageFlip(data->fd, output->config.crtc->crtc_id,
+					flip_fb->fb_id, DRM_MODE_PAGE_FLIP_EVENT, NULL);
+			igt_require(ret == 0);
+			kmstest_wait_for_pageflip(data->fd);
+
+			if (test_mode == (TEST_MODE_CONSTANT_LIVE || TEST_MODE_INTERMITTENT_LIVE)
+						&& frame_count > 5) {
+				/* Panel Replay state needs few frame to enter the live mode */
+				replay_state = igt_amd_read_replay_state(data->fd, output->name);
+				igt_debug("replay_state live mode = 0x%X\n", replay_state);
+				igt_fail_on_f(replay_state < REPLAY_STATE_4 && replay_state >= REPLAY_STATE_5,
+						"State should be REPLAY_STATE_4 (Active with single frame update)\n");
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
+			igt_debug("replay_state static mode = 0x%X\n", replay_state);
+			igt_fail_on_f(replay_state < REPLAY_STATE_3 && replay_state >= REPLAY_STATE_4,
+					"State should be REPLAY_STATE_3 (Active)\n");
+		}
+
+		/* Do another page flip if we do the replay_intermittent_live test */
+		if (test_mode == TEST_MODE_INTERMITTENT_LIVE) {
+			for (frame_count = 0; frame_count <= 30; frame_count++) {
+				ret = drmModePageFlip(data->fd, output->config.crtc->crtc_id,
+						flip_fb->fb_id, DRM_MODE_PAGE_FLIP_EVENT, NULL);
+				igt_require(ret == 0);
+				kmstest_wait_for_pageflip(data->fd);
+
+				if (frame_count > 5) {
+					/* Needs few frames to let state enter the live mode */
+					replay_state = igt_amd_read_replay_state(data->fd, output->name);
+					igt_debug("replay_state TEST_MODE_INTERMITTENT_LIVE during flip = 0x%X\n",
+							replay_state);
+					igt_fail_on_f(replay_state < REPLAY_STATE_4 && replay_state >= REPLAY_STATE_5,
+							"State should be REPLAY_STATE_4 (Active with single frame update)\n");
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
+			igt_debug("replay_state TEST_MODE_INTERMITTENT_LIVE after flip = 0x%X\n",
+					replay_state);
+			igt_fail_on_f(replay_state < REPLAY_STATE_3 && replay_state >= REPLAY_STATE_4,
+					"State should be REPLAY_STATE_3 (Active)\n");
+		}
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
+		igt_info("Panel Replay Visual Confirm %s\n", opt.visual_confirm ? "enabled" : "disabled");
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
+				      "set Panel Replay visual confirm failed\n");
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
+	igt_fixture
+	{
+		if (opt.visual_confirm) {
+			igt_skip_on(!igt_amd_has_visual_confirm(data.fd));
+			igt_require_f(igt_amd_set_visual_confirm(data.fd, VISUAL_CONFIRM_DISABLE),
+				      "reset Panel Replay visual confirm failed\n");
+		}
+		close(data.debugfs_fd);
+		igt_display_fini(&data.display);
+		drm_close_driver(data.fd);
+	}
+}
diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
index d7152a356..e8854c5fa 100644
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

