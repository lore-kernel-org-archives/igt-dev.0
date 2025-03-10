Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD17CC28B2E
	for <igt-dev@archiver.kernel.org>; Mon, 10 Mar 2025 09:14:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EBC410E3C1;
	Mon, 10 Mar 2025 09:14:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QEbSXmFb";
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2051.outbound.protection.outlook.com [40.107.237.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 283EE10E3C1
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Mar 2025 09:14:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T2rM36wimsEv4AH3/ijkv34JkvTGCG0TRxmLUloo5LvVC3nVWzdbJPM23Ps6/5taUEFclVSxxXUoIR/so6BVYzY0FatAIBAkELxbhuBjliPS7ZNR+JxhkCg2R7Rv1OrZt6sFziCH4du3RU0yQ9pH6FBvIRWG3WLzUtdJJH9o3BNcahMIgadGELZa5SoKD7W3CR6Vzi1P3ezbGNyvn2eOWSBBlS2LEqn0MsDkukDSlsJs/gWGhdjef7pyxd4ltBZkTeK2Ki9pE3h6l+rQsBl5FmeahUJUav713I3UGmlYdmMjfgKPTMV1ne7UkOO9IQ03O9Ngz1mogRvYubdIzYrewQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W55gFXXHGgIKucB1VO8rCOhrHeKbOV1DA2T7xtWyZWs=;
 b=lpYb573aoiwYm9V3YsJDtycNDlPrwHizKJR7Rwmz8YVGkhXEkLQlEYtLP2Tl+M1mPrAxf30xzJWU37UKOV+U/I4/bJ/QMoQvaofQsTidIi0dClTaiKRL10dv3tzR66+P5zCw6uNu0P0M/N8Mdwj+4IDO2POl6Pp4GMY7qN5ZjfLS4iS66VMzpV2vBdnMkaRdsTnvp38r3IOeWaPXmYbzBOkUL9X5IitAVFNwAQ7tX9ai6gDdmUoh6WnGuNb8M0X6CIweSLiQwCFf5x41HCbhHlAQ0wp7c2ggij/p9PU+vBHShlj0kFyH7fI9mhDruL79iw86smYvgK6v0UBMAg0Nxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W55gFXXHGgIKucB1VO8rCOhrHeKbOV1DA2T7xtWyZWs=;
 b=QEbSXmFbmVs0PpP5698cgACmINMdIhNXhQDTPuGx5Eht7MVOpl0oxqJH9VEGBBhrnNLr+5HqA0hBX66aD3+n4zUBg21Z/lgifYLV71Iv2kPnkfERoWHeJmNZHDy7bXwHgdpx5PjlcJE+D3TR81979imHRL4If/dQRSr3UFCXCr8=
Received: from SN1PR12CA0059.namprd12.prod.outlook.com (2603:10b6:802:20::30)
 by IA1PR12MB6651.namprd12.prod.outlook.com (2603:10b6:208:3a0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 09:14:45 +0000
Received: from SN1PEPF0002636D.namprd02.prod.outlook.com
 (2603:10b6:802:20:cafe::b8) by SN1PR12CA0059.outlook.office365.com
 (2603:10b6:802:20::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.26 via Frontend Transport; Mon,
 10 Mar 2025 09:14:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636D.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Mon, 10 Mar 2025 09:14:45 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 04:14:44 -0500
Received: from tom-BIRMANPLUS.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 10 Mar 2025 04:14:43 -0500
From: Tom Chung <chiahsuan.chung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <sunpeng.li@amd.com>, <chiahsuan.chung@amd.com>
Subject: [PATCH i-g-t] tests/amdgpu/amd_hotplug: Check the suspend state after
 resume
Date: Mon, 10 Mar 2025 17:13:48 +0800
Message-ID: <20250310091440.2045-1-chiahsuan.chung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: chiahsuan.chung@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636D:EE_|IA1PR12MB6651:EE_
X-MS-Office365-Filtering-Correlation-Id: b088044b-e668-4005-8617-08dd5fb3ffca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JhVj0qITb3I396C3R9r5YyQuTqyhZZqDA6E5NtNTnZbDU7Pu1r0QpSmSf0Dd?=
 =?us-ascii?Q?QdWZSK31jCcQZRlQJz/1OB3wU5RTO1kHGPFvh9wLYtYWdePzjZlDuDT3qldW?=
 =?us-ascii?Q?hrWzrmp8yAWFWtvBbjE9GBHvEBO1O11R7RVjuNQJfCxeZSPcLUHDzBfrCZr5?=
 =?us-ascii?Q?iOoEQZR2KM6ZsQx7LJt+Mq9VcchSXSFrP0jc7B2IEB8U9T/X/1RiVRhFDCPr?=
 =?us-ascii?Q?gVbK9bINqovjJq3Yo4gKTp5YP1p91BUJxGE9w4kNZO8HZq8KpAxJS3Ns8cDj?=
 =?us-ascii?Q?BfblCtHZSfr/cSrfY2vskut+Wm141bbPTJGr306vDZjXBpmb6hnDESwzPN3S?=
 =?us-ascii?Q?afn6sODlBixxrOjgs6vf4atid5IaRCozamYTScJV2N10h96jgkLsseIq5aZf?=
 =?us-ascii?Q?befJhzwyYqPBITpVPavXjmnoEtXYD0518f754bMdHEQIj4N6caVxyGWaoGed?=
 =?us-ascii?Q?YnCBkte/JRr9Yu/3Muc+M/NvMaEPXQX2htjW4I4PJlexws0bhohyYXvM32zW?=
 =?us-ascii?Q?5OfvL3esKopUcclF3kwhVMlx9lSPVtveNU9rnCJSCi9Rw8s2HHo6qM+riU9S?=
 =?us-ascii?Q?oazD48K95Zduyqn0PKGX3R7Clmts3ttUJhmc+T0JU9IWhwXSBJo5rwEjqtfz?=
 =?us-ascii?Q?/ylvXrmuFZC4r/2cHXgkIRX/EYx4kfZx3yBoaiTuIijxshMa0XDBcBUfZDmO?=
 =?us-ascii?Q?yUubAgte2i8mJhz/Wn4ZwF8+1s/u+Vh9S6boVtHP+YRV6wfwDx4/IXKbrXKM?=
 =?us-ascii?Q?3s7rK4HJYCctnIN85LC+PzqO5mzr+hhWbE/nYryFkhjDSlvE7giCVuRBRepa?=
 =?us-ascii?Q?S+S9XEZqAF80vdbE7zcDQScny1aeUFpMT+5TGluWzAXhikjdfSpSD+PA7Nao?=
 =?us-ascii?Q?r9KozJmx+A88hpY6UFfPs1dVxe2ARlQGHmzLmYKXbmX+vg/rCkDKetRLieUD?=
 =?us-ascii?Q?9JdPA/C+VCqt0B0yuDnHGHycNW+m6swojjPCMcDg7G6gXP6hZof5pO9JjLmK?=
 =?us-ascii?Q?000B5ZTqCAiehiDeZmGWfgQXjC7Cc3y1DyjWHHUCHabuUGu27utPGq7ztDea?=
 =?us-ascii?Q?5wyP6IN/HMxgHf5KcBUVz7+mCa/NsL3KcDA08+qYPtN8owdOPYf0V3r6KoW0?=
 =?us-ascii?Q?u8XymD35NEEbNFqLBmEvzqgTUqvMd7By5VYmWww04pDo+wn/s9rKgUpqPumz?=
 =?us-ascii?Q?GN5OZ/vgPdxJJYB05cBJjxDMK1DxRQmn8jqoRobzo6e1NTc3GsFqW2kl091G?=
 =?us-ascii?Q?9bwt3fywRwQ8SkisJ5H4jrSR6R9d/EPTfHaz6X5YDCWypErdFEPCKjPTibq7?=
 =?us-ascii?Q?2kaWELpC71PZBFrlv8l+fcaEJNdYSvce/CrlU2xS66yXceMWOPmJVXeKHHdx?=
 =?us-ascii?Q?Ss87cvWWNpIjfyaTc3JDa/OgJnWx8znIQEnPpMthTDqzPfmkW6vUFponRDvA?=
 =?us-ascii?Q?8DMImop7npeQU6uWT6IQjl42q6BvIphHHO2D/YfqcDU7Hs093inEaBr+5wBD?=
 =?us-ascii?Q?4rQdla0xSK0sewE=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 09:14:45.0788 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b088044b-e668-4005-8617-08dd5fb3ffca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6651
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
Check the last hardware sleep state after resume to make sure
last suspend really reached hardware sleep state.

Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
---
 tests/amdgpu/amd_hotplug.c | 48 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/tests/amdgpu/amd_hotplug.c b/tests/amdgpu/amd_hotplug.c
index c13bf49d3..df394f920 100644
--- a/tests/amdgpu/amd_hotplug.c
+++ b/tests/amdgpu/amd_hotplug.c
@@ -27,6 +27,8 @@ IGT_TEST_DESCRIPTION("Test simulated hotplugging on connectors");
 
 /* Maximum pipes on any AMD ASIC. */
 #define MAX_PIPES 6
+#define LAST_HW_SLEEP_PATH "/sys/power/suspend_stats/last_hw_sleep"
+#define MEM_SLEEP_PATH "/sys/power/mem_sleep"
 
 /* Common test data. */
 typedef struct data {
@@ -98,6 +100,47 @@ static void test_fini(data_t *data)
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
 }
 
+/* Check if mem_sleep is s2idle */
+static bool is_system_s2idle(void)
+{
+	int fd;
+	char dst[64];
+	int read_byte;
+
+	fd = open(MEM_SLEEP_PATH, O_RDONLY);
+	if (fd == -1)
+		igt_skip("Open %s file error\n", MEM_SLEEP_PATH);
+
+	read_byte = read(fd, dst, sizeof(dst));
+	close(fd);
+
+	if (read_byte <= 0)
+		igt_skip("Read %s file error\n", MEM_SLEEP_PATH);
+
+	return strstr(dst, "[s2idle]");
+}
+
+
+/* return the last hw_sleep duration time */
+static int get_last_hw_sleep_time(void)
+{
+	int fd;
+	char dst[64];
+	int read_byte;
+
+	fd = open(LAST_HW_SLEEP_PATH, O_RDONLY);
+	if (fd == -1)
+		igt_skip("Open HW sleep statistics file error\n");
+
+	read_byte = read(fd, dst, sizeof(dst));
+	close(fd);
+
+	if (read_byte <= 0)
+		igt_skip("Read HW sleep statistics file error\n");
+
+	return strtol(dst, NULL, 10);
+}
+
 static void test_hotplug_basic(data_t *data, bool suspend)
 {
 	igt_output_t *output;
@@ -131,8 +174,13 @@ static void test_hotplug_basic(data_t *data, bool suspend)
 	}
 
 	if (suspend) {
+		if (!is_system_s2idle())
+			igt_skip("System is not configured for s2idle\n");
+
 		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
 					      SUSPEND_TEST_NONE);
+		igt_assert_f(get_last_hw_sleep_time() > 0,
+					  "Suspend did not reach hardware sleep state\n");
 	}
 
 	/* Trigger hotplug and confirm reference image is the same. */
-- 
2.43.0

