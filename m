Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BDB9C28B2E
	for <igt-dev@archiver.kernel.org>; Tue, 11 Mar 2025 08:15:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C3DD10E525;
	Tue, 11 Mar 2025 08:15:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="H7xDlvjy";
	dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2060.outbound.protection.outlook.com [40.107.100.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3040A10E51F
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Mar 2025 08:15:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TqmB0gpz4WvJ5x5aqntNuDFD+/FjibLI9kZQzq4r/dntyU5F1Onpb4GtkHwNU1Lmfg++isHg/AZk82ecfWPzrNWS65MoxM2hPmi4cFT1VIhKbA5afyGz4zfxk+ELNmi9cl25bqaOnuXpTrQjMVKrN7sZUmxHkTNZ01R0w2i3mz87P8xR7Vj/zDwS6NDqUWDD6DD/Uw70UgshmahGklp80Q5nczm3p8PWPrVh6q0AoZyZ9JtQ91+GTWcHG7/17WdSuN3A8Rf1fu4UNoj/3w+R+H3w31cBxGi1JgxO+RdUNl0N6U3rAlgehiF5K4brL1Zc3oLnbc8qQmM3mhjaSvveOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tary/Z7XCSdNeIIG9tLK09DFWnWORlXHSD//mwBYgp0=;
 b=rWy+BWQDB1skw92jXc5vRpcq6J1I2UtzR20zQbrb57TfNzp4aw95e5XAq0j1HE9NpqQQl0Ud6Bho5BxD3t1nLnYL3csCEIO3I5fr9WbQH5Lf9CJYpEqfZQJzqB82PGwQgB4GtyYG8vPTZe9rX6Xfl2z4knNiPNWFvUZ8RmxjG+CaaLHWOv2Eq+J10iMMaq39nNxWr9nezmdAyA8r/spdLOJ8h1A5k3VP95y7DqDheL12KQFSMMkdx4DNDqLl0u1WYWJCbih1jQNtP1vZjo33EFwmoXa/Y33EPPEDqEz1dett6/H9Ese7Dv3mMDqcvzsUK0iwFK8iJsqhQ5OpCcJIEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tary/Z7XCSdNeIIG9tLK09DFWnWORlXHSD//mwBYgp0=;
 b=H7xDlvjygIDCEb5wgedIqsWA8PkcXnWr8HjczPdaiIpjAFeA8y4tG4m+pibXewaRyQ6qMJjLd3MisTRP0jN8ijv1W5SjojrrJ/W3C2/B00weXt19DDJTQXqWNmjWrqQWqZ2j9BAR7yIZWXA/Be0ehW8xfOMLJW1JnZDP0y/CAM8=
Received: from SJ0PR05CA0027.namprd05.prod.outlook.com (2603:10b6:a03:33b::32)
 by MW4PR12MB5601.namprd12.prod.outlook.com (2603:10b6:303:168::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 08:15:04 +0000
Received: from SJ1PEPF000026C5.namprd04.prod.outlook.com
 (2603:10b6:a03:33b:cafe::31) by SJ0PR05CA0027.outlook.office365.com
 (2603:10b6:a03:33b::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20 via Frontend Transport; Tue,
 11 Mar 2025 08:15:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF000026C5.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Tue, 11 Mar 2025 08:15:04 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 11 Mar
 2025 03:15:02 -0500
Received: from tom-BIRMANPLUS.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 11 Mar 2025 03:15:01 -0500
From: Tom Chung <chiahsuan.chung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <sunpeng.li@amd.com>, <chiahsuan.chung@amd.com>
Subject: [PATCH i-g-t,
 v2] tests/amdgpu/amd_hotplug: Check the suspend state after resume
Date: Tue, 11 Mar 2025 16:13:36 +0800
Message-ID: <20250311081457.2396-1-chiahsuan.chung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: chiahsuan.chung@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C5:EE_|MW4PR12MB5601:EE_
X-MS-Office365-Filtering-Correlation-Id: 11d2f88b-a249-4906-ba41-08dd6074d406
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Umt0ZGw2bDhGektkeERPQ0g1dUtQbWhrQ1RwVjFKRlhvYXIvNDI4dEpIUStj?=
 =?utf-8?B?bUVlME96VlVwbzBBWFNkbWc3aUdWVWJPMjRUTDNaTFpQMEwySFV0akV3Z01V?=
 =?utf-8?B?aUxKV1lRUGNTRUJIOW80YmNMMHVpdktobzVMaVdJRll4cUdkSWl5U2J2dHlK?=
 =?utf-8?B?UmhKZXFjazllekRWQzRlMnZ2MVBJUmlBZ24vUEZraHp0S2tkNVRXWDZJa0tG?=
 =?utf-8?B?VXA1NHg3UUU3VWFUVks5WWdZbDh1cG1rUW9OajVsbWdEQzZpNVBsWTVXakN4?=
 =?utf-8?B?RTlWbTN0Mks1ak1SQXFNa1E4amIvaWhrT1k3V1FzS0tPTnlTWGVJWTMycXpU?=
 =?utf-8?B?VzM2L01tOUhnbHVmN2FzZ2Z4L3VjTzdLb1NFRHFobzVlREpOcTA0a2RBbm05?=
 =?utf-8?B?cjJVN2cvOFQvc0RjT2gxNUIydkJWdnFYWXZuWHh3aG1zTTlqbjJ5ek16ekJz?=
 =?utf-8?B?NkhBNjFTUEJLY3pVeXJ6NUo1dDR2eW5hUHdZVmJQcjRralg0WEt5Yit3Z0xl?=
 =?utf-8?B?QmJmUGtOZzZpbUdjQmg2UnZUOVhMR0VKUSt0VjNNVGFqK2ZCM2xEbkJjeEE5?=
 =?utf-8?B?aVV4TkNYNmZhaS9oTmk0dEwyOW8wenpjNSt1TTViNG9OMmhuTlhBVS9rM0pp?=
 =?utf-8?B?MVBtME94eHNjbGloVUpJMThRdTZKQWlsdzhTbklqb3RLWFExelRDNDB1QlB3?=
 =?utf-8?B?QVZkV25rZWRNRWxOdEg3MVo5NjFyblIwandmSU9hTTA4N0lEVVdFZjFiaGcx?=
 =?utf-8?B?WUxyQk9kckdxeVBxTHlFOWtzUmJOSEVwb1QrdWVBMmxGL1NlcmdhYS9kOHBI?=
 =?utf-8?B?cDgvVHFoZWhoaHZJZlZ0NlZPTFZrRXFJOG5YTHczYzdQc3JnZVBrZXVHWHFp?=
 =?utf-8?B?N2dXcEZpbTBNaDBITjNhck9tcVlkQTliR2JXamJDeWhWNDFsd2pLK2tkcGd0?=
 =?utf-8?B?bWJXaFp3WHdzRlRmYUErb0JqWWprcE9lMmF0dDhjeU5LN2hNVzgwd2dDVzJZ?=
 =?utf-8?B?YVV6UGltb1pLZkZmVzRJa3pHOS9nOCtMNDJkUXB3bXBHanc1bUVpdmc4b3NI?=
 =?utf-8?B?ODBGckU0Q3Azd1g4VFlZRDB2Ty9rL3dtMWNCZm0xY1lNOWZVQkMzUVNINFRP?=
 =?utf-8?B?UTRoak5sUndPMVB5VzJvM3FuQVBPZFFnbjJmdFZtOHR3MGlVZU1ERllBMXpV?=
 =?utf-8?B?NHdpNkxwdlZEM2xVWjlHcXJlc0x3NExkd3FoN1dHcDJnSFAyTlRwT2k1cW51?=
 =?utf-8?B?Ym5VTHhCMEp1cGU4UGEyakFVS2VNU2dSSnZrSkg0UUVlaEl1bzZjaDQ3aGgw?=
 =?utf-8?B?ZlZETkVpUDJHWDBDMWN2dGFqVEdBZ0hOd2ZlVGJub2V0VlltRXJET2NHUmpk?=
 =?utf-8?B?NzYvY2V3eit3cWc2UWdxZUluMFk4THdwT2U3Rm1leU1hdmZweDh1Y1hUV3NL?=
 =?utf-8?B?dnNZNzBLKzhGL0ZKS2ZxVWdUcnBKWkk4SGkvaUtzWHg1ekNRRzJBdU93TkN1?=
 =?utf-8?B?ZFZ0N29sbG93MFVnSmdDQmg0eWRiYzlsSzd6cnNrY0dOc0tsODR0WW5EZnpa?=
 =?utf-8?B?R3d5alVLMmdHWm8ybXJSWVFTd25DdDJqM3htVStpdU85VlJPUHBkdUt4RGFs?=
 =?utf-8?B?cGJPbVkrSk1ST0NJejQ5SFpZc2ExYytRZlVlZTFXY29pTWowSnpUTUMrUlpn?=
 =?utf-8?B?ajRlWksvczVsV1E2b2lxUmdoYTVBaVZRNnBHemlUaExLL2tkQ0YxcTJiY0Ro?=
 =?utf-8?B?MUlSTWNPaE1xTEp0NzU5M3FrUVFoaS95aEE3Zk9MQlZDK0lXWGtRaU4xbXFK?=
 =?utf-8?B?ZnFVcUlzSklYMVFKOGQ0a2VySDhsT1Z4YWQ5L0ZvVEFUS216alo0eWE1NlY3?=
 =?utf-8?B?aFhMcktDK1Qzd0wxMm1pYjBFaXBqQW9CalVrUEFLekZIaEhTT3hYNmN0bko5?=
 =?utf-8?B?akgyaG5GSVhXQXdSQkFPaHo1UlNmRkhUZlBoMkZ6aUN5cTlGaW01UmlkUjVn?=
 =?utf-8?Q?ztFPMGjHtyjS2dipxRSbL+gzfuv8tM=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 08:15:04.4598 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11d2f88b-a249-4906-ba41-08dd6074d406
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000026C5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5601
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

Make sure to enable the suspend related settings in kernel config

Linux Kernel Configuration
└─>Power management and ACPI options
Suspend to RAM and standby
ACPI (Advanced Configuration and Power Interface) Support

Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
---
v2: add kernel config note in commit messages

 tests/amdgpu/amd_hotplug.c | 47 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/tests/amdgpu/amd_hotplug.c b/tests/amdgpu/amd_hotplug.c
index c13bf49d3..ee3256c0b 100644
--- a/tests/amdgpu/amd_hotplug.c
+++ b/tests/amdgpu/amd_hotplug.c
@@ -27,6 +27,8 @@ IGT_TEST_DESCRIPTION("Test simulated hotplugging on connectors");
 
 /* Maximum pipes on any AMD ASIC. */
 #define MAX_PIPES 6
+#define LAST_HW_SLEEP_PATH "/sys/power/suspend_stats/last_hw_sleep"
+#define MEM_SLEEP_PATH "/sys/power/mem_sleep"
 
 /* Common test data. */
 typedef struct data {
@@ -98,6 +100,46 @@ static void test_fini(data_t *data)
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
@@ -131,8 +173,13 @@ static void test_hotplug_basic(data_t *data, bool suspend)
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

