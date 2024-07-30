Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B2EC3DA61
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 10:00:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27B1410E17C;
	Tue, 30 Jul 2024 10:00:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5FYrbPww";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2087.outbound.protection.outlook.com [40.107.220.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E704410E09D
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 10:00:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uh8e3lxU7kRkfs3bmsQMPjYm3rxc++iABkr5CgNeaXg+BdAu7/Jq4jizFXIJS1pg4gqULxZ2hJNWwCo4/8JJCS4Eh9shvgvH3fbn5Oqx5OAHWiV8+GNZ6/YmQCZqi9QzgDMvFs6qyDEWgVxzWQ2LGDk/sS1I2M/iR1ZFrdPKHgRc6v65GmPh48RlzFAZBfSXXrU+BeJPHzAa/4y8GhOmaX36pCyYcg+/awKHX3mk4TEQViP4hVQLKLGbCWmB/8yLITZdRz1MaohIFLgEXeyyVkEWqAKwhhDsR1bYCiWXYl+jufrX9Uel2HkOV+6XQsbcfc1V4ZM0WVTznNG+vb3X+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gXljMx91zMHOMJ9grhrBnzDoCOiQksgehJ2aK4ol4XQ=;
 b=uJSGpsjM7QO4idP6Fi31X/+Y90UJiPBfzJLsb9nuJvg5ykAd/uFVq3cMnVi4NOiOznOk9O9H8xPcoc6cXqp4ux0p92CVrGYG4ilvsVWyjQf+gYURn/SaOFEI51Cnpd9kxDR6Ngcg5S37TMdWe3QFGD87XYlLSfAdXNNLLGnRIxSv1Ww1YbdHepMePSvFKOYpcVbYzRWy1CYdgYoRhsMtCzNVH6YNs/eDgiRovMEWe/OoWMLrS7ifo6YVs0wVKAZIPRKMWWoqvfdXqkoyGpSq6lQkcJwP9RoCpjiAydvmmfHqu2nNSf7XnofTgktCYYhAt8Od1Jfd3Y2a9W7jt3NVNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gXljMx91zMHOMJ9grhrBnzDoCOiQksgehJ2aK4ol4XQ=;
 b=5FYrbPwwqYZjUNiMbMiYdYHMJLCydpYCqnt8LF8CJFot/O00sC9R/b7ZFmiK38w0FnF7roDso6jQURUXo89hxxdIZmnz9jImvi3fOGEvmTKusGkeu7MW1OOAx6ctaNTaCgfHjG2aZOqYB0inOJ4/gHEESWf5/kkf/Aup4YI/8s4=
Received: from BY3PR05CA0059.namprd05.prod.outlook.com (2603:10b6:a03:39b::34)
 by PH7PR12MB6441.namprd12.prod.outlook.com (2603:10b6:510:1fb::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Tue, 30 Jul
 2024 10:00:15 +0000
Received: from SJ1PEPF00002320.namprd03.prod.outlook.com
 (2603:10b6:a03:39b:cafe::25) by BY3PR05CA0059.outlook.office365.com
 (2603:10b6:a03:39b::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.19 via Frontend
 Transport; Tue, 30 Jul 2024 10:00:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00002320.mail.protection.outlook.com (10.167.242.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Tue, 30 Jul 2024 10:00:14 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 30 Jul
 2024 05:00:14 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 30 Jul
 2024 05:00:12 -0500
Received: from tom-BIRMANPLUS.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 30 Jul 2024 05:00:10 -0500
From: Tom Chung <chiahsuan.chung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <Rodrigo.Siqueira@amd.com>, <alex.hung@amd.com>, <hamza.mahfooz@amd.com>, 
 <sunpeng.li@amd.com>, <chiahsuan.chung@amd.com>
Subject: [PATCH i-g-t,v4] tests/amdgpu/amd_replay: Add amd_replay IGT test
Date: Tue, 30 Jul 2024 18:00:07 +0800
Message-ID: <20240730100007.2243-1-chiahsuan.chung@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002320:EE_|PH7PR12MB6441:EE_
X-MS-Office365-Filtering-Correlation-Id: 042442df-a417-45ea-2f97-08dcb07e68c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?h96Q8L4BBNDY8TbsijQIo83s7mdjdPVgpfMwD6uIZazgYGRP42QrKT0ToxVW?=
 =?us-ascii?Q?7g2uXDTnkPkdxfYoA0fpILKJaK4yERdou8KyRZuZ8I1rBDnMSJaJH//EnHj2?=
 =?us-ascii?Q?aQ1YzXoDYxEZ1b0KoDWyvHZKvGRNcbuxX8CfMVT4dhoSYMTWOwuYQ6VWlaLo?=
 =?us-ascii?Q?PN9DcdajhmTYanORXg9jXIFQIvKKDsku/2bV8xbKsUiBwSS4gyZj23MgW4Gb?=
 =?us-ascii?Q?oLvrEL0MBreSdJQgVWo3RsXib7g/FUNnYB+NDIFDyDmJR9mwAgUjB/kTJxnz?=
 =?us-ascii?Q?17Oa2BsJVbRmvalQR1S2m7RAx8Ou0EEgfJIFBMQMhciU1UmT+uPeihZWZ0+F?=
 =?us-ascii?Q?A1sF2TvfyaBuTHqMAmiRXrK/RGptynB0TL1iwMu3dAfNPXfthyZ4vlQ9g6rd?=
 =?us-ascii?Q?FPaeNPYYOfDeSVgYic3BZQgb7GPZZstayS4WfntHmt52g+8suQs9BmFZeXHt?=
 =?us-ascii?Q?+k7UMgT1RXszODERs5MAQm/fikoCVLkn/zoaSrIM/xvtFN/knui2oXbj6+s6?=
 =?us-ascii?Q?v/MdF2aTC1351tLtbZq6CN5sGX0CdShTsuhMDlyRugQ5L634Tt2v4lL+y2NU?=
 =?us-ascii?Q?6bBDFWRCDY5OCAdAxr1E2syi92Kv5a233SBoBYVdtG1zBeJV1esOQvxYSI94?=
 =?us-ascii?Q?oECbHdyiW4wpSDtkxHU+yPshm5wQoMFXNOjfg8zZFG2HygiJCmNHQ4VTbGM8?=
 =?us-ascii?Q?3oL/vaIfgHShe87Au8f+PPuHRmypDigsiuSHcLL5MzHTBNIW9KZ2e7bRDYi4?=
 =?us-ascii?Q?rZwL9ZOChwkoOpuIrc7c0LqMHWv9Y7OoJmvzWEnnDVJUFlVlcxmOmyi+EJZP?=
 =?us-ascii?Q?vm7FIC1FQo6+SG02xcGAcAdV/HDU7CkNSj3fYyNSbPk1Hm6lW2R3LFf4LBWV?=
 =?us-ascii?Q?y+T1iwT2fBeddNXdHsGCIMzlIAhTOxDUd8WIVom7CfgXPiY7Ua79X5pUxbm2?=
 =?us-ascii?Q?G6I7QlwQINyLmcu2l02ySM9yaLgC7wgq1hlMEeyDbu16/2A8XKnUw17n83ba?=
 =?us-ascii?Q?oIMT8aOVl2HjOIe9D7nbqeABqYVDV/rGZ8Z4wb1O+U+HMLW7rB0WxLFnkah0?=
 =?us-ascii?Q?u+cXh/rBBIp9AH6/Wm9U1Y9zVtTJMTI0KZIxsbmv1VTQzNmQ4TU/cteugtG6?=
 =?us-ascii?Q?BD/G94GWWBkkxPdHz7oPCLDDz5uHMpvRNTJOSLs7TmbrnbaR+Ics2Los1iHv?=
 =?us-ascii?Q?CJZ8MFko/uGwPJragtID8fRcgta2JSHp6MQLhYDA9hLyGLb66Az0G6QQznyC?=
 =?us-ascii?Q?KFtEk+P7MUnR9A57i20yf46wBXdcRAqSAIIHCXB4UmNpOoK6qO7i4AB2zxvF?=
 =?us-ascii?Q?wK3FqlG/QFFZYQnhR8Wmjc1fRa6aiSFTp7+LB5UBl0EqX5jPz3LoDOOJJF3q?=
 =?us-ascii?Q?qBcEJB6pHucDJGKIvxICwuSEBgdi31KX4nkGL34PPx+ErNNb7US5zWE3NdsL?=
 =?us-ascii?Q?3XKXMLjpojeOUKpiH9ToXd4ajm6F7cUV?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 10:00:14.8613 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 042442df-a417-45ea-2f97-08dcb07e68c7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002320.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6441
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
v4: 1. Update enum replay_state and include file.
    2. Modify the return value of igt_amd_read_replay_state()
    3. Add a page_flip_test() to simplify the test function

 lib/igt_amd.c             | 163 ++++++++++++++
 lib/igt_amd.h             |  41 +++-
 tests/amdgpu/amd_replay.c | 458 ++++++++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build  |   1 +
 4 files changed, 662 insertions(+), 1 deletion(-)
 create mode 100644 tests/amdgpu/amd_replay.c

diff --git a/lib/igt_amd.c b/lib/igt_amd.c
index 149af5151..99d6f105a 100644
--- a/lib/igt_amd.c
+++ b/lib/igt_amd.c
@@ -1014,6 +1014,169 @@ bool igt_amd_output_has_ilr_setting(int drm_fd, char *connector_name)
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
+/*
+ * Convert raw panel replay state to emum panel replay state.
+ */
+static enum replay_state convert_replay_state(uint32_t raw_state)
+{
+	switch (raw_state) {
+	case 0:
+		return REPLAY_STATE_0;
+	case 0x10:
+		return REPLAY_STATE_1;
+	case 0x11:
+		return REPLAY_STATE_1A;
+	case 0x20:
+		return REPLAY_STATE_2;
+	case 0x21:
+		return REPLAY_STATE_2A;
+	case 0x30:
+		return REPLAY_STATE_3;
+	case 0x31:
+		return REPLAY_STATE_3INIT;
+	case 0x40:
+		return REPLAY_STATE_4;
+	case 0x41:
+		return REPLAY_STATE_4A;
+	case 0x42:
+		return REPLAY_STATE_4B;
+	case 0x43:
+		return REPLAY_STATE_4C;
+	case 0x44:
+		return REPLAY_STATE_4D;
+	case 0x45:
+		return REPLAY_STATE_4E;
+	case 0x4A:
+		return REPLAY_STATE_4B_LOCKED;
+	case 0x4B:
+		return REPLAY_STATE_4C_UNLOCKED;
+	case 0x50:
+		return REPLAY_STATE_5;
+	case 0x51:
+		return REPLAY_STATE_5A;
+	case 0x52:
+		return REPLAY_STATE_5B;
+	case 0x5A:
+		return REPLAY_STATE_5A_LOCKED;
+	case 0x5B:
+		return REPLAY_STATE_5B_UNLOCKED;
+	case 0x60:
+		return REPLAY_STATE_6;
+	case 0x61:
+		return REPLAY_STATE_6A;
+	case 0x62:
+		return REPLAY_STATE_6B;
+	default:
+		return REPLAY_STATE_INVALID;
+	}
+}
+
+/**
+ * @brief Read Panel Replay State from debugfs interface
+ * @param drm_fd DRM file descriptor
+ * @param connector_name The connector's name, on which we're reading the status
+ * @return Panel Replay state
+ */
+enum replay_state igt_amd_read_replay_state(int drm_fd, char *connector_name)
+{
+	char buf[4];
+	int fd, ret, raw_state;
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
+	raw_state = strtol(buf, NULL, 10);
+	return convert_replay_state(raw_state);
+}
+
 /**
  * igt_amd_output_has_psr_cap: check if eDP connector has psr_capability debugfs entry
  * @drm_fd: DRM file descriptor
diff --git a/lib/igt_amd.h b/lib/igt_amd.h
index 6780b99de..bce4657cb 100644
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
@@ -100,6 +102,37 @@ enum dc_link_training_type {
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
+	REPLAY_STATE_2A = 0x21,
+	REPLAY_STATE_3 = 0x30,
+	REPLAY_STATE_3INIT = 0x31,
+	REPLAY_STATE_4 = 0x40,
+	REPLAY_STATE_4A = 0x41,
+	REPLAY_STATE_4B = 0x42,
+	REPLAY_STATE_4C = 0x43,
+	REPLAY_STATE_4D = 0x44,
+	REPLAY_STATE_4E = 0x45,
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
@@ -135,7 +168,8 @@ enum amdgpu_debug_visual_confirm {
 	VISUAL_CONFIRM_HDR	= 2,
 	VISUAL_CONFIRM_MPCTREE	= 4,
 	VISUAL_CONFIRM_PSR	= 5,
-	VISUAL_CONFIRM_SWIZZLE	= 9
+	VISUAL_CONFIRM_SWIZZLE  = 9,
+	VISUAL_CONFIRM_REPLAY = 12
 };
 
 uint32_t igt_amd_create_bo(int fd, uint64_t size);
@@ -189,6 +223,11 @@ void igt_amd_write_ilr_setting(
 	int drm_fd, char *connector_name, enum dc_lane_count lane_count,
 	uint8_t link_rate_set);
 bool igt_amd_output_has_ilr_setting(int drm_fd, char *connector_name);
+bool igt_amd_output_has_replay_cap(int drm_fd, char *connector_name);
+bool igt_amd_replay_support_sink(int drm_fd, char *connector_name);
+bool igt_amd_replay_support_drv(int drm_fd, char *connector_name);
+bool igt_amd_output_has_replay_state(int drm_fd, char *connector_name);
+enum replay_state igt_amd_read_replay_state(int drm_fd, char *connector_name);
 bool igt_amd_output_has_psr_cap(int drm_fd, char *connector_name);
 bool igt_amd_psr_support_sink(int drm_fd, char *connector_name, enum psr_mode mode);
 bool igt_amd_psr_support_drv(int drm_fd, char *connector_name, enum psr_mode mode);
diff --git a/tests/amdgpu/amd_replay.c b/tests/amdgpu/amd_replay.c
new file mode 100644
index 000000000..799ac5229
--- /dev/null
+++ b/tests/amdgpu/amd_replay.c
@@ -0,0 +1,458 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2024 Advanced Micro Devices, Inc.
+ */
+
+#include <dirent.h>
+#include <fcntl.h>
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
+	igt_fb_t ref_fb;
+	igt_fb_t ref_fb2;
+	igt_fb_t *flip_fb;
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
+	TEST_MODE_SUSPEND,
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
+	data->ref_fb.fb_id = 0;
+	data->ref_fb2.fb_id = 0;
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
+static bool page_flip_test(struct test_data *data, igt_output_t *output,
+						 enum test_mode test_mode, uint32_t frame_num)
+{
+	int ret, frame_count;
+	enum replay_state replay_state;
+	uint8_t panel_dpcd = 0;
+
+	if (!data || data->ref_fb.fb_id == 0 || data->ref_fb2.fb_id == 0
+	    || frame_num <= 5) {
+		return false;
+	}
+
+	data->flip_fb = &data->ref_fb;
+
+	for (frame_count = 0; frame_count <= frame_num; frame_count++) {
+		ret = drmModePageFlip(data->fd, output->config.crtc->crtc_id,
+				data->flip_fb->fb_id, DRM_MODE_PAGE_FLIP_EVENT, NULL);
+		igt_require(ret == 0);
+		kmstest_wait_for_pageflip(data->fd);
+
+		if (test_mode == (TEST_MODE_CONSTANT_LIVE || TEST_MODE_INTERMITTENT_LIVE)
+				&& frame_count > 5) {
+			/* Panel Replay state needs few frame to enter the live mode */
+			replay_state = igt_amd_read_replay_state(data->fd, output->name);
+			dpcd_read_byte(data->fd, output->config.connector, 0x378, &panel_dpcd);
+			igt_debug("replay_state live mode = 0x%X\n", replay_state);
+			igt_fail_on_f(replay_state < REPLAY_STATE_4 && replay_state >= REPLAY_STATE_5,
+					"State should be REPLAY_STATE_4 (Active with single frame update)\n");
+			igt_fail_on_f(panel_dpcd == 0, "Panel is not in replay mode\n");
+		}
+
+		if (frame_count % 2 == 0)
+			data->flip_fb = &data->ref_fb2;
+		else
+			data->flip_fb = &data->ref_fb;
+	}
+
+	return true;
+}
+
+static void run_check_replay(struct test_data *data, enum test_mode test_mode)
+{
+	int edp_idx;
+	enum replay_state replay_state;
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
+			 data->mode->vdisplay, DRM_FORMAT_XRGB8888, 0, 0.6, 0.6, 0.6, &data->ref_fb);
+		igt_create_color_fb(data->fd, data->mode->hdisplay,
+			 data->mode->vdisplay, DRM_FORMAT_XRGB8888, 0, 0.0, 0.4, 0.14, &data->ref_fb2);
+
+		igt_plane_set_fb(data->primary, &data->ref_fb);
+		igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
+		data->flip_fb = &data->ref_fb;
+		drmModePageFlip(data->fd, output->config.crtc->crtc_id,
+			 data->flip_fb->fb_id, DRM_MODE_PAGE_FLIP_EVENT, NULL);
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
+		igt_skip_on_f(!page_flip_test(data, output, test_mode, 20), "page flip failed\n");
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
+			igt_skip_on_f(!page_flip_test(data, output, test_mode, 30), "page flip failed\n");
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
+		igt_remove_fb(data->fd, &data->ref_fb);
+		igt_remove_fb(data->fd, &data->ref_fb2);
+	}
+
+	test_fini(data);
+}
+
+static void run_check_replay_suspend(struct test_data *data)
+{
+	int edp_idx;
+	enum replay_state replay_state;
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
+			 data->mode->vdisplay, DRM_FORMAT_XRGB8888, 0, 0.6, 0.6, 0.6, &data->ref_fb);
+		igt_create_color_fb(data->fd, data->mode->hdisplay,
+			 data->mode->vdisplay, DRM_FORMAT_XRGB8888, 0, 0.0, 0.4, 0.14, &data->ref_fb2);
+
+		igt_plane_set_fb(data->primary, &data->ref_fb);
+		igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
+		data->flip_fb = &data->ref_fb;
+		drmModePageFlip(data->fd, output->config.crtc->crtc_id,
+			 data->flip_fb->fb_id, DRM_MODE_PAGE_FLIP_EVENT, NULL);
+		kmstest_wait_for_pageflip(data->fd);
+
+		/* Suspend and Resume */
+		igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
+
+		/* Do some page flip and let the replay go into live mode */
+		igt_skip_on_f(!page_flip_test(data, output, TEST_MODE_SUSPEND, 10), "page flip failed\n");
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
+		igt_remove_fb(data->fd, &data->ref_fb);
+		igt_remove_fb(data->fd, &data->ref_fb2);
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

