Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 559F7C5DF71
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jun 2026 06:46:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2EF410EC4F;
	Tue,  2 Jun 2026 06:46:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3uEGOB2r";
	dkim-atps=neutral
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012036.outbound.protection.outlook.com [52.101.53.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C0DD10EC4F
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jun 2026 06:45:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qg8TB06ekqvVzI8pMC+qYKqpd3M7gn87QqFHq3SUzKsD0Om9EP1mgy5csi7LBjTpzfID9ttUBMz/IMUalQ7dNunlezi8nGb1UtzUQ7LjkjbovLjHIx0KiNzzeN2JttV9bDYs0fG8OnWdo697r2RgAtTvllnY5hasXSPmHyjBfTaQCM08AGjZY2LL5VX6p0Xc+/eI/ZsKVJufrxqfHdAbSW+z6TaFj09db6F1/jUc8fj3tT4QmGYkIi5t1YgxBYTP3bJP984R2MqwjdXj/0O6iaoLive838gtthEzI0MiynGOf8rZ8dV/gAm+xTuZ9v1qNPaafOPYaVKCYL5CuNn/TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bArJOPghmOWBhSazlyMLqnjGa0shl0WfXPv3sEizbFU=;
 b=LwUVumQmCNm1Ykno8dXcx7qMvWU2MyCpUl7NmjYsg3D7BVvOyJzAyZIAlbtTKPqn3/ECNA9Hb/jjqdgvhJygtDGJAkyKRJAdKiq7C2/87T6SJYeTna3jsc4zT8eoDE7f+KYHY8KImb9RgMMCO/yceZfuNv61pkH8+7+eJkwmgvmjMYl7E/YNjsC4DzPhppa8tO4SY2PtppNDle8PgmxUOJp9GfaToSlp/YWSy1T+do2XzU3Olcg0Q65LppxHQDXdai7ir6+mp5QwDnf1CNdua9bHDP+DIZzynSzH4c1lJb/47F0JVMw0F1ga3y903GJTgjvOghL5tYDvWP32rltfew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bArJOPghmOWBhSazlyMLqnjGa0shl0WfXPv3sEizbFU=;
 b=3uEGOB2rN7KBstMh1UWMRtGiKD1gN5etD8O7xfRHX8kWzOw03fTbKoAXWZARrQnnaqjCBrGC9hb2DNVQQKTI7DLvFVbESUsrsN1yUkFS2BjJ5HbxWWTMr/hL32STscpWczeol1th7zOV1NLQDUPa8+2vWfeb4ZoaKFSkQv2tJdo=
Received: from MN0PR05CA0016.namprd05.prod.outlook.com (2603:10b6:208:52c::15)
 by IA1PR12MB6162.namprd12.prod.outlook.com (2603:10b6:208:3ea::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Tue, 2 Jun 2026
 06:45:53 +0000
Received: from BL02EPF0001A107.namprd05.prod.outlook.com
 (2603:10b6:208:52c:cafe::57) by MN0PR05CA0016.outlook.office365.com
 (2603:10b6:208:52c::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Tue, 2
 Jun 2026 06:45:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL02EPF0001A107.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 06:45:52 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 2 Jun
 2026 01:45:52 -0500
Received: from ray-Ubuntu.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 2 Jun 2026 01:45:51 -0500
From: Ray Wu <ray.wu@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <sunpeng.li@amd.com>, <chiahsuan.chung@amd.com>,
 <ray.wu@amd.com>
Subject: [PATCH i-g-t 1/2] lib/igt_amd: add helper to disable Panel Replay on
 all eDPs
Date: Tue, 2 Jun 2026 14:41:21 +0800
Message-ID: <20260602064543.58586-2-ray.wu@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602064543.58586-1-ray.wu@amd.com>
References: <20260602064543.58586-1-ray.wu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A107:EE_|IA1PR12MB6162:EE_
X-MS-Office365-Filtering-Correlation-Id: af6ccd40-b27e-4c6a-557d-08dec072974b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|376014|82310400026|1800799024|11063799006|5023799004|6133799003|56012099006|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: ZCNZ0+zI7y9zXgMU4MwgkiRA3OSsNqVNAwB43+Pv9UxBQR8oLNODz57hL1W1asfd1rCCdp+ZJjmzWxhLnnb9HI0Aunn4F3DpaZT1aBjI+dL/DGctzAzGupI6tkdJjff72xZmhcHbMazRxOyDOw3sfi9JuUhZrMliyAy/NPS87y1whOe/hxjM2JX2dJK59zz6UfEKhhMAuHhROnUuphlrXU7CgOzAIGdrHEAhv9v4BADMuDmJbeKHEHwrHWzCrvgopB88bzL0Zzv63r5p+G99WTbfVIOQtWikNafKXfRtEbaIYpt3XPN0TwbGiXivemj1oYjc6HB+5FY4qxrAotV16B+BJZ6swiJ+0geIbiLUUEkAJ9QXQl9eRrIQByqV3OC1ZF9IwuZNybfbMX/iISeQKi+QYaGb0YxMVtzZuDithIB6tthL+8FE9jzicwbExT05WNhTzWb2v4EP/9wtuNMBVXeUB/IERTuhHydYA35x/HCj6ZivIRPn526w86WP1pk9jAyX+lmhkT80u9JrM7mKVPOT7vfqo6YNMyzz+jBwQK10V2PA0nmTWtK/lRpdP5Ni7TzdcYmlFH0MCl+yysEV2FO0pslo35t6j1BjkGWCY/eFJyf7A+hLpVgkWTS1gaJRUVmXJvAYARSoe6TY1222avc8BiTD/4YwiCt3koP3SUrWW+YyhM76gxzvPIJ2KXr2cb+t7251CX542ubcycTc/8H+kBHCdf2dDp/7huGbXuU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(11063799006)(5023799004)(6133799003)(56012099006)(3023799007)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: aKdgCfcCz90j8XP7ZOnZtBQC9HQjBzgVURZt7w2VUS353iPS+dNwMhdfafsb8VQHo+hj7N3qwiOe47OsW71n4HLpJaAky/5MRD0kI2lDlVcZ2rNM+cSp5fuaVCMAtSM08bp4dsLjWJH/xqdYEsG5lV/Y2N6WXvohF3qPq1i2gmBEzZ9SbUQSWMZiNqh9bHJuJn779Y4zvLvb4v7P36YnVUvYxMAmt7KXlDgsve0IAGFchu5GoOLWFYvZqV5JLHZmJ9NDdb+ACNjLpdRFWyNtVJD2FL4hWNUu8/A9NFKqgW8SzZRv6Nj7wo/O3I7T0Yw/yyXXgdHdKRg244xeg6j5EpcGF7zS185nI7uxOOvoEuiwrTrLYr4rPZ2rSoRbHaploGoxXdC9bZEhJd5Nj7bKPjRO/FVKP2urB2apgzSoGGKt/oc5uClBc7TGWfDfNDrA
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 06:45:52.9861 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af6ccd40-b27e-4c6a-557d-08dec072974b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A107.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6162
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

[Why & How]
Add igt_amd_disallow_replay_on_all_edp() as a batch counterpart of
igt_amd_disallow_edp_enter_replay(). It toggles the
disallow_edp_enter_replay debugfs flag on every connected Panel
Replay capable eDP, wrapped in a DPMS off/on sequence, and returns
whether anything was reconfigured.

The filter matches "Sink support: yes" + "Driver support: yes" in
replay_capability; "Config support" is intentionally skipped because
it flips to "no" after disallow=1 and would break the restore pass.

Also change igt_amd_disallow_edp_enter_replay() to log and return on
missing debugfs instead of skipping the whole test.

Signed-off-by: Ray Wu <ray.wu@amd.com>
---
 lib/igt_amd.c | 53 +++++++++++++++++++++++++++++++++++++++++++++++++--
 lib/igt_amd.h |  1 +
 2 files changed, 52 insertions(+), 2 deletions(-)

diff --git a/lib/igt_amd.c b/lib/igt_amd.c
index 004bd2fe8..47e587e54 100644
--- a/lib/igt_amd.c
+++ b/lib/igt_amd.c
@@ -1395,8 +1395,11 @@ void igt_amd_disallow_edp_enter_replay(int drm_fd, char *connector_name, bool en
 	igt_assert(fd >= 0);
 	ret = openat(fd, DEBUGFS_DISALLOW_EDP_ENTER_REPLAY, O_WRONLY);
 	close(fd);
-	igt_skip_on_f(ret < 0, "Skip test: Debugfs %s not supported\n",
-		      DEBUGFS_DISALLOW_EDP_ENTER_REPLAY);
+	if (ret < 0) {
+		igt_info("output %s: debugfs %s not supported, skipping\n",
+			 connector_name, DEBUGFS_DISALLOW_EDP_ENTER_REPLAY);
+		return;
+	}
 
 	if (enable) {
 		wr_len = write(ret, allow_edp_replay, strlen(allow_edp_replay));
@@ -1409,6 +1412,52 @@ void igt_amd_disallow_edp_enter_replay(int drm_fd, char *connector_name, bool en
 	close(ret);
 }
 
+/**
+ * igt_amd_disallow_replay_on_all_edp: toggle Panel Replay entry on every
+ * connected Replay-capable eDP connector on @display.
+ * @drm_fd: DRM file descriptor
+ * @display: target display (already initialised via igt_display_require)
+ * @disallow: true to disable Panel Replay entry (e.g. during a test that
+ *            cannot tolerate self-refresh), false to restore.
+ *
+ * Returns true if at least one eDP was reconfigured, so callers can cache
+ * the value and decide whether a restore call is needed later.
+ */
+bool igt_amd_disallow_replay_on_all_edp(int drm_fd, igt_display_t *display, bool disallow)
+{
+	igt_output_t *output;
+	bool changed = false;
+
+	if (!is_amdgpu_device(drm_fd))
+		return false;
+
+	for_each_connected_output(display, output) {
+		char buf[128];
+
+		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
+			continue;
+
+		if (igt_debugfs_read_connector_file(drm_fd, output->name,
+						    DEBUGFS_EDP_REPLAY_CAP,
+						    buf, sizeof(buf)) < 0 ||
+		    !strstr(buf, "Sink support: yes") ||
+		    !strstr(buf, "Driver support: yes"))
+			continue;
+
+		igt_info("%s AMD Panel Replay on %s\n",
+			 disallow ? "Disabling" : "Restoring", output->name);
+
+		kmstest_set_connector_dpms(drm_fd, output->config.connector,
+					   DRM_MODE_DPMS_OFF);
+		igt_amd_disallow_edp_enter_replay(drm_fd, output->name, disallow);
+		kmstest_set_connector_dpms(drm_fd, output->config.connector,
+					   DRM_MODE_DPMS_ON);
+		changed = true;
+	}
+
+	return changed;
+}
+
 static bool get_dm_capabilities(int drm_fd, char *buf, size_t size)
 {
 	int ret, fd;
diff --git a/lib/igt_amd.h b/lib/igt_amd.h
index 90ec45828..27a06f6f3 100644
--- a/lib/igt_amd.h
+++ b/lib/igt_amd.h
@@ -237,6 +237,7 @@ int  igt_amd_read_psr_state(int drm_fd, char *connector_name);
 void igt_amd_allow_edp_hotplug_detect(int drm_fd, char *connector_name, bool enable);
 void igt_amd_disallow_edp_enter_psr(int drm_fd, char *connector_name, bool enable);
 void igt_amd_disallow_edp_enter_replay(int drm_fd, char *connector_name, bool enable);
+bool igt_amd_disallow_replay_on_all_edp(int drm_fd, igt_display_t *display, bool disallow);
 
 /* DM interface helpers */
 bool igt_amd_has_visual_confirm(int drm_fd);
-- 
2.43.0

