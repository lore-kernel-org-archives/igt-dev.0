Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A985F43858
	for <igt-dev@archiver.kernel.org>; Wed, 15 Apr 2026 16:54:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2091610E255;
	Wed, 15 Apr 2026 16:54:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZDeFbm0f";
	dkim-atps=neutral
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012020.outbound.protection.outlook.com [52.101.48.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CF6E10E723
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Apr 2026 16:53:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VLIu6tyxRP6IatrOWY8Iov7Y/zQe8r542QB7DAnVrckOvDXS+oGoSnEjAQjtuU5igNPy73vaAkuQLFXj6ePGk5mPbLdhwipdvVfDVyUHV1P8cHOqQzXyWEwmf2TuzHXwgE6zxvLHcvwotSvq5Fe7YkJZBhQI2RvtJkYKyMGCD5eog65s04TNpplxkF9HTvg90gYIikpwrexa33/cwn61uLIofkdKyX2LJc4bdzoEKcJUKi0yzZVYA+eDg1ecg475096w+okeLZf9ZxknjufGigTdpmBaTdLRvrdiqw8yPtGbJEOwIP16+8jnZkWc5tpCtpL1Ytyfer+wdC2KZ6jRzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6wMZky5yWjKWXebdwNKBJRn3Krjuo8/YWjybrZWmIFY=;
 b=DImSWITDKkasV4mPR/hXrR7wSxU4Tp3PpsX5SVDYzdPQNyU9DkKrMHtsrRO/i3ZsqiEh7PlbFcKOQ2M9CtN6MgOrr1wZ+kKwlf2rMCsHUhBeR71zL2Nvh8n0n5E2/+/xW1KYgmkafQqi+J4jiM9FdP1wpz3miw3MhNA1FNEF+hgiAdmDSd9tsOT2bNekEaEeaAkF7uxjXQaST+gL3u1gP6ad5U3wTCasw8lSNNSFg64RorjlDu8QPuTj7OSxsNr9KDQ+z1fMiIm4HQ1EVr0UeoUs9/92p8+vL3NbuawDxTqDa2cRbedZicA4x/fhoQJubiIQffqQVR98/T5vRGYHcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6wMZky5yWjKWXebdwNKBJRn3Krjuo8/YWjybrZWmIFY=;
 b=ZDeFbm0fqhJzrnVChsUNUXxcdXbWdNtEn83Rj2LeXkMA/S1GhYAFT0DwcnIT4RO5MCxL10pX8LacVOjD5E57BYWXDNPuLci6x6xZsDKy8QWgGk+WItWvhMnCkV1AvqOFUOr226AO8eP7kWoq1gMZw02u3xz8YCJphnyUCcjhjjc=
Received: from SJ0PR03CA0088.namprd03.prod.outlook.com (2603:10b6:a03:331::33)
 by DS0PR12MB8814.namprd12.prod.outlook.com (2603:10b6:8:14e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Wed, 15 Apr
 2026 16:53:49 +0000
Received: from MWH0EPF000A6732.namprd04.prod.outlook.com
 (2603:10b6:a03:331:cafe::b3) by SJ0PR03CA0088.outlook.office365.com
 (2603:10b6:a03:331::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Wed,
 15 Apr 2026 16:53:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A6732.mail.protection.outlook.com (10.167.249.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 15 Apr 2026 16:53:48 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 15 Apr
 2026 11:53:46 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <aurabindo.pillai@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: [PATCH] tests/amdgpu: Fix typos and grammar in comments
Date: Wed, 15 Apr 2026 10:53:24 -0600
Message-ID: <20260415165324.918274-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6732:EE_|DS0PR12MB8814:EE_
X-MS-Office365-Filtering-Correlation-Id: d621d86a-6c86-44f4-8f6d-08de9b0f90d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: lZH0CGlp8/QZuurvT6wTmrAW0tPwjQGFiB0By1tlcR//uyB3azTb4vYnaiHVVYpdqVQXWMcqiddio3J3+KB3NK4hxsl+Apv8DjRn1JUmg1OaRofosbuNBZvf/SnoHRujMqMcPeCL+aar7Jp5k84utYJPqUCCUodZPHxnhLa01QpXzQdFxZ+030OJ6Cm+FSieJW4rKDXcqFfv0ViyL1ImkkUEY5YfcF3JLspQkt2SlDBb+LXSlM1ss6N080wgYWMERYit3o8Pxf0AWGCOo6Vtg6o9LNW82rjhHUlGhNDlYm5K0yr+ZGEkasohsWxDwdkxYxNF4gMyPZ/Hhl1ZEg6I5FLlyw3TWyCpd4ptrLTX5NyoJRivK/M4kkk2Z+1opv2yrSv292iUzzY+EVO0sYK4c3gQm7hJG4h5JTXLbwknS5nVXqXUmEwVqFn+IuswSjR7ks17rmNc7MSIQGI+uXKZDk8qA6rMo6bfWGRfON32YJnvgwJYJFEbtBfTSa/sJ7ibXsYNTmpFWtdDCj4CiMjg9hw30WZL3jOPI/STc4LVZF6WGCIAznKSvHaG6GzG7GiR9WcTCWdO6Wdsp83oQQKmCLv1odQ9B/rD/LqWVv4JO+K/i54xmpNpThoosUbsEvUhF4AVNdDMLY9Iytuf4vCvln26uhoywJZY4Y+zaVYZkJC6H6HXJNinWc/w0LXM0eUmu2Y8vSMr7wv1B41Qv0gSx7sUSqo4rfn2a3QlEY2cM0c06k+dQ5mREjbwrXQ+lkQmBK9JgoAgK4a/eM4qP4Rn3Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: SwUC57O1wgS6vswhptn6rG7yPFteGQQXR/9ZKXc4oy8qzUeauolm+OoJU+Wck2jnrZig9w+kvwho9ySBBURxOHJBIFggJ6pLPE5RlMKMDnDqhGwzocBDxOpC8Sfrnv2XXApdbzBsw/Csj+5wEWa89MOnhPdB54n86FcAb1PqhJ6a5mtCvO2skT8hKEA06CBC0hHmpxx0ORm+e+lIGw8q1C30S9jsdJ7NmiZdf8IN6sONvgh+1k7JOn4it/RbWx0PGVzyr/YaF6SjXEwIGQ60EgZf+yWc/is4uiRkoK7MfZnGnmiUOHhWke/Be0Xfbe4wYBX3Kbt1lQs1ZxOhls40uVUYw7inV7d7tgusnoVZae+SW8iV2yGe4LG3y4hpm9LsiYoOTP6ZfAkXOu+p9FPB9tGlKNJCMqhL44/y5Zd2LKLTnGbLxEHSFrTLjrnVWybi
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 16:53:48.8266 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d621d86a-6c86-44f4-8f6d-08de9b0f90d0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6732.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8814
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

Fix spelling and grammar issues in the following tests.

amd_dp_dsc.c:
- 'Maximumm' -> 'Maximum'
- 'outpus' -> 'outputs'
- 'horisontal' -> 'horizontal'
- 'v_ative' -> 'v_active'

amd_hotplug.c:
- Capitalize 'return' to 'Return' in function comment
- Add missing article 'the' before 'reference image'

amd_mem_leak.c:
- 'amdpgu' -> 'amdgpu'
- 'memroy' -> 'memory'

amd_vrr_range.c:
- 'Maximumm' -> 'Maximum'
- 'more safe margin' -> 'more safety margin'
- Add missing article 'a' before 'golden sample'
- 'Cannot parsing' -> 'Cannot parse'

Assisted-by: GitHubCopilot:claude-sonnet-4.6
Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/amdgpu/amd_dp_dsc.c    | 8 ++++----
 tests/amdgpu/amd_hotplug.c   | 4 ++--
 tests/amdgpu/amd_mem_leak.c  | 4 ++--
 tests/amdgpu/amd_vrr_range.c | 8 ++++----
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/tests/amdgpu/amd_dp_dsc.c b/tests/amdgpu/amd_dp_dsc.c
index b84411636..1742c7df4 100644
--- a/tests/amdgpu/amd_dp_dsc.c
+++ b/tests/amdgpu/amd_dp_dsc.c
@@ -28,7 +28,7 @@
 
 #define NUM_SLICE_SLOTS 4
 
-/* Maximumm pipes on any AMD ASIC. */
+/* Maximum pipes on any AMD ASIC. */
 #define MAX_PIPES 6
 
 /* Common test data. */
@@ -82,7 +82,7 @@ static void test_init(data_t *data)
 		if (!igt_output_is_connected(output))
 			continue;
 
-		/* Ensure that outpus are DP, DSC & FEC capable */
+		/* Ensure that outputs are DP, DSC & FEC capable */
 		if (!(is_dp_fec_supported(data->fd, output->name) &&
 		      is_dp_dsc_supported(data->fd, output->name)))
 			continue;
@@ -236,7 +236,7 @@ static bool update_slice_width(data_t *data,
 		igt_plane_set_fb(data->primary[conn_idx], &ref_fb);
 		igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
-		igt_info("Forcing slice width: slice width %d num slices horisontal %d\n", slice_width, num_slices[i]);
+		igt_info("Forcing slice width: slice width %d num slices horizontal %d\n", slice_width, num_slices[i]);
 
 		act_slice_width = igt_amd_read_dsc_param_slice_width(data->fd, output->name);
 
@@ -293,7 +293,7 @@ static void test_dsc_slice_dimensions_change(data_t *data)
 		h_addressable = data->mode->hdisplay;
 		v_addressable = data->mode->vdisplay;
 
-		igt_info("Mode info: v_ative %d  h_active %d\n", v_addressable, h_addressable);
+		igt_info("Mode info: v_active %d  h_active %d\n", v_addressable, h_addressable);
 
 		/* Save pipe's initial DSC state */
 		dsc_before = igt_amd_read_dsc_clock_status(data->fd, output->name);
diff --git a/tests/amdgpu/amd_hotplug.c b/tests/amdgpu/amd_hotplug.c
index 83ad55ea0..c54288e90 100644
--- a/tests/amdgpu/amd_hotplug.c
+++ b/tests/amdgpu/amd_hotplug.c
@@ -122,7 +122,7 @@ static bool is_system_s2idle(void)
 	return strstr(dst, "[s2idle]");
 }
 
-/* return the last hw_sleep duration time */
+/* Return the last hw_sleep duration time */
 static int get_last_hw_sleep_time(void)
 {
 	int fd;
@@ -189,7 +189,7 @@ static void test_hotplug_basic(data_t *data, bool suspend)
 					  "Suspend did not reach hardware sleep state\n");
 	}
 
-	/* Trigger hotplug and confirm reference image is the same. */
+	/* Trigger hotplug and confirm the reference image is the same. */
 	for_each_crtc(&data->display, crtc) {
 		output = data->output[crtc->crtc_index];
 		if (!output || !igt_output_is_connected(output))
diff --git a/tests/amdgpu/amd_mem_leak.c b/tests/amdgpu/amd_mem_leak.c
index 1e55fe785..1d7aa3a2f 100644
--- a/tests/amdgpu/amd_mem_leak.c
+++ b/tests/amdgpu/amd_mem_leak.c
@@ -45,7 +45,7 @@ static void test_init(data_t *data)
 {
 	igt_display_t *display = &data->display;
 
-	/* It doesn't matter which pipe we choose on amdpgu. */
+	/* It doesn't matter which pipe we choose on amdgpu. */
 	data->crtc = igt_first_crtc(&data->display);
 
 	igt_display_reset(display);
@@ -167,7 +167,7 @@ int igt_main()
 
 	igt_describe("Test memory leaks after resume from suspend");
 	igt_subtest("connector-suspend-resume") test_suspend_resume(&data);
-	igt_describe("Test memroy leaks after connector hotplug");
+	igt_describe("Test memory leaks after connector hotplug");
 	igt_subtest("connector-hotplug") test_hotplug(&data);
 	igt_describe("Test memory leaks with driver unload");
 	igt_subtest("driver-unload") test_driver_unload(&data);
diff --git a/tests/amdgpu/amd_vrr_range.c b/tests/amdgpu/amd_vrr_range.c
index cc3323df3..4397f3c15 100644
--- a/tests/amdgpu/amd_vrr_range.c
+++ b/tests/amdgpu/amd_vrr_range.c
@@ -28,7 +28,7 @@
 
 IGT_TEST_DESCRIPTION("Test EDID parsing and debugfs reporting on Freesync displays");
 
-/* Maximumm pipes on any AMD ASIC. */
+/* Maximum pipes on any AMD ASIC. */
 #define MAX_PIPES 6
 #define EDID_SIZE 256
 #define EDID_PATH "/sys/class/drm/card%d-%s/edid"
@@ -249,7 +249,7 @@ static void trigger_edid_parse(data_t *data, igt_output_t *output, uint32_t test
 	else
 		igt_amd_trigger_hotplug(data->fd, output->name);
 
-	/* more safe margin until resume and hotplug is completed */
+	/* more safety margin until resume and hotplug is completed */
 	usleep(1500000);
 }
 
@@ -325,7 +325,7 @@ static bool find_vrr_range_from_edid(data_t *data, igt_output_t *output)
 }
 
 /* Check if EDID parsing is correctly reporting Freesync capability
- * by overriding EDID with ones from golden sample.
+ * by overriding EDID with ones from a golden sample.
  */
 static void test_freesync_parsing_base(data_t *data, uint32_t test_flags)
 {
@@ -354,7 +354,7 @@ static void test_freesync_parsing_base(data_t *data, uint32_t test_flags)
 			trigger_edid_parse(data, output, test_flags);
 
 			igt_assert_f(find_vrr_range_from_edid(data, output),
-				"Cannot parsing VRR range from EDID\n");
+				"Cannot parse VRR range from EDID\n");
 
 			expected_range.min = data->expected_range.min;
 			expected_range.max = data->expected_range.max;
-- 
2.43.0

