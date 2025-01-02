Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA5DEE77188
	for <igt-dev@archiver.kernel.org>; Thu,  2 Jan 2025 10:38:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62D2F10E40F;
	Thu,  2 Jan 2025 10:38:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WUjFGSfo";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3C3A10E411
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Jan 2025 10:38:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H1UWFaaYR5OszbaZB2XGYSAjbj3S5RfXoOTbxXb9p3Hk3OjlJaHd4Tk9x+Yk/lncOHfuwhRYBYtygcbeZBKu/GGCYJUgdeZCnWrS8GQrW651Vmov87VAMZzITRUgUsdu7uF7rkWSx7KBrrBLio76kDz8M6Ivy4k8WjBrT+dEOEgABMG0cgis6R1AoxG/BsAuvmU2YOhbIPm2U6l3jN3q3AwZOurVLFs9ZoMtN2OOvOW2U8k/8CFBc0BaAvogAXk9YRhVFMvM3e+y0zLPsgYEw9GnOmnCVeYJFo+ZIGv/XPyhsfFcg8AuD22UYpefNQGbdOGRVghx2IeVVrxucuDGQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O1z65wilJfq4RqLzwTlMxdpn5mPhbFGMtcuujei8OZg=;
 b=aHPmYUndqZkYKGQ1WtagjIuOM1+5D090ddZt3Xo7e0Yk4B+0Q3znoZUdC2FwDgVAEYeBOXPX+ajN7e54fUIqPEy+UazefVYKelZrAg0YeOnUAEDiTOzpwuxKHYPskS/LDyKaCJsYVQ33xVIlPdmWpXN8a3WAcGEeDMuDGDjRC9xi1pRe4ohOahObW9dtvzwyDxKncfiTy5FN31Oi4GkkvlQ1OnZKM0Mjbo3sME+R3ethcRLnxAboFLhwxqDnxXqP6vJDDW/QPrvHFKaF7qmYIkxl2eUr8ueknTdM/vOcH2BPNx3PHJNoFh9CyfOzBzJ24bi7cmg0+q9V6aBW3CGdRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O1z65wilJfq4RqLzwTlMxdpn5mPhbFGMtcuujei8OZg=;
 b=WUjFGSfo0GIJd5a2gwD/vlnGpHUqyJdrMr6PPXoviiYyafFErcobQqOxgwwATdgRgjTSY1mwL0r1AZd4FyhuqaRpPqZtlRknnVn6Qyhi2nmoDXT9+oYMbxPzT4dDBI/20AOFZsNkzh9RUhe8skEDztN4bOq9oVhr3Y/nZ9EvyPw=
Received: from BLAPR03CA0095.namprd03.prod.outlook.com (2603:10b6:208:32a::10)
 by DS7PR12MB6165.namprd12.prod.outlook.com (2603:10b6:8:9a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.22; Thu, 2 Jan
 2025 10:37:53 +0000
Received: from BN2PEPF000044A5.namprd04.prod.outlook.com
 (2603:10b6:208:32a:cafe::73) by BLAPR03CA0095.outlook.office365.com
 (2603:10b6:208:32a::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8293.15 via Frontend Transport; Thu,
 2 Jan 2025 10:37:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF000044A5.mail.protection.outlook.com (10.167.243.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8314.11 via Frontend Transport; Thu, 2 Jan 2025 10:37:53 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 2 Jan
 2025 04:37:52 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 2 Jan
 2025 04:37:52 -0600
Received: from tom-maple-halo.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 2 Jan 2025 04:37:50 -0600
From: Tom Chung <chiahsuan.chung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <Rodrigo.Siqueira@amd.com>, <alex.hung@amd.com>, <sunpeng.li@amd.com>,
 <chiahsuan.chung@amd.com>
Subject: [PATCH i-g-t] tests/amdgpu/amd_vrr_range: Fix panel cannot light up
 after test
Date: Thu, 2 Jan 2025 18:37:26 +0800
Message-ID: <20250102103741.2105-1-chiahsuan.chung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: chiahsuan.chung@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A5:EE_|DS7PR12MB6165:EE_
X-MS-Office365-Filtering-Correlation-Id: f260a49c-b7be-4719-4a25-08dd2b198342
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TXZTQi9MUlU3bmY3STFrb2pLS0U5NmxCZW14M2tOZFpiMWtEcEs1UUhIcUVk?=
 =?utf-8?B?WjZDZmc5ekVoelhJZENpQ2xCREdRcWJSdWhwSFpNRm5XZFZST25tOEZuaWhN?=
 =?utf-8?B?aGM4aC9XT1Z0Y3FjS1RFYmZWYXp6c2NiYkI4MFlGY3dUNEZOaWd6T1RCZmdR?=
 =?utf-8?B?YzZNdUkzWjlYY3IwdnBvVGplc1dLTlNFTDBqM0U4aTBKYTRKZ0FQTnc1VnBX?=
 =?utf-8?B?TWMrd2R2anJtUVJhRVBtRDFaZGkvYlo3NjZzL051VnB0WVQzaUc1U1ZqMWdn?=
 =?utf-8?B?S3JqOUowUjdUUXRCMG5FN3lvRGt5SklPUXpGYVArdC9Nb3l3cCtSTnMvNnEv?=
 =?utf-8?B?SXJlRnNjYmFTd0k2RmxseWtaUGJZOWZIZE9aTHNNN3BwREVLYnZGNDlSaExT?=
 =?utf-8?B?LzU0dVNiMFVDdGkwNDY5UGc4eTdoRkcrK3J0SG5jdHVPdWE5Z2ZnL1lWRTZ1?=
 =?utf-8?B?c2s4eG16ZU1vaXMvZWFWenIvVFRYcWFvQmp5RkFCdGlNc0tjQ2NoZ2phdXd5?=
 =?utf-8?B?eHVKWnhFay9wV3BXL2hDQmVEVXlpRGE0K1BFRCsyMHFySExMcE5kcy9vMnUy?=
 =?utf-8?B?anhwQ3pBb0pJMGF3VG4zTytlUnhrSGlTUW9OV3VoNkh6WkNzQUtaQnNFMndL?=
 =?utf-8?B?NkVPYVpTL1BKVDRhbG83MjdyRFR2dmozRkw0U1JoQjJMaGdPdmUzTFErM3k4?=
 =?utf-8?B?dWNlNHVQV2FqRjljbEwrcG5kNEJYWFlIa3l0YXJNN2FDNzRpYlpJUmNxbWNI?=
 =?utf-8?B?NkpBQlVFVnI0TzNySEJWa0F6azFPOTZRWllSdWg5aG4vZzFlUnNKSS82eDNq?=
 =?utf-8?B?Yk01SDJuZk1jczJ6M0hvVjBBK1ZaVXRZNmp4dWROTytONTJkUTBpajBlVVU2?=
 =?utf-8?B?VDhURHoyVUZLcURDVjZacFdwNUdHbFhydit0RXB5Mk9NUDhiWE9lNm1tSnB3?=
 =?utf-8?B?UU53bzcySjNrNjZqeGxjS1dkNU9WZWhHR2dTZGc4OWhneGtMZ3NSYU1VSGcw?=
 =?utf-8?B?Y3ViZFlneEUxaE5PcXdiMU9OZndESHMwR2NrSDBhNDFySElRV3l4UGtVaXRn?=
 =?utf-8?B?dmdhWFJMNjVjU3Q5QXZtVXJrd21KTkRxOUN1cGsrd1FjK0JHODhxKzhFWWsz?=
 =?utf-8?B?VVU0MW9jeHRCeDVvbVVpN0RKMHZlMjhOZ2RtbzErUXRBMHlxaVpVMTY5c0dN?=
 =?utf-8?B?bUcxM2JydERid1VkWks1eEN5ZndLN0VCMmRjYjBGWjhFZzZsUkdrNDNWTlBw?=
 =?utf-8?B?UjFxZVFrenlvNWtGSGJQVFZxZDc1Wkp5STVoanBvTExZS0ZFeVd2SzRFVUtS?=
 =?utf-8?B?Z2oyWmdhMkxSSE1HbXVxNHlWZUVwRjlCem9aVmozZ3VIYkRrUnd6d2tWTG9D?=
 =?utf-8?B?elhDaFFCekNWL1FpOFdJRmIxb3JUNi9PSmpCQVNCczdwd2IrK2RKbXE4S2Nv?=
 =?utf-8?B?OGEyTHQ1WVRmK2F4bkRZaVFwOUhIdUdpajYvVityT2lERHFHYkVzYWo1THhr?=
 =?utf-8?B?QWNuclAwdWFjOEVGdk93aUxaMGp2cnBISW82bzhVandkdmUvOUd0cGNBUlcv?=
 =?utf-8?B?aGRIdC9zS2NYUjFWZ3d3eUQzOU41V0dKdkVSNDM4ZEM0UG1wWmlhemYvNFFW?=
 =?utf-8?B?UkZxaDgxb3J5SFZaWTBWS3Y0RHljMGdzOWhXMVVMUmlhN3puMXJkcHlYczQx?=
 =?utf-8?B?emt6ZHZtSGJWSXZGWTFYRnlrc3RET0JzYlVRV0t2bGZZTXZBSkp1K0E3VWJH?=
 =?utf-8?B?VmlzMWhBR2p0dlBTcEFDMVRPWVJnTU5FVi8wVEJ5d21JKzhQTVFCYmtlbzJN?=
 =?utf-8?B?c3VvYVZydG5EQ0NYMjRTUzA2djQ4aHQ0bU1KcVhxbUc1R0plbUFyZHFTbkJK?=
 =?utf-8?B?MWQyRTdTZ04yZU5yKzg2U0FtYjBGVmNpdmxQNHJnZ2tvWitUKzB2eHVSVS81?=
 =?utf-8?B?THh3c3JESXdBcituNVV4Yk84MGJkaHU1c0FmT1E1akNDUk11VUV1ZXFKYkhD?=
 =?utf-8?Q?FeBx92qm0yUnTkzhj2vIo7hXc83Em8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2025 10:37:53.2033 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f260a49c-b7be-4719-4a25-08dd2b198342
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6165
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
If the sink side support VRR, override the EDID may cause sink
side cannot light up.

[How]
Just parsing the VRR range from sink side EDID without override it
if the sink side support VRR.

Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
---
 tests/amdgpu/amd_vrr_range.c | 125 ++++++++++++++++++++++++++++-------
 1 file changed, 102 insertions(+), 23 deletions(-)

diff --git a/tests/amdgpu/amd_vrr_range.c b/tests/amdgpu/amd_vrr_range.c
index 79db6f9c4..15bebbfa7 100644
--- a/tests/amdgpu/amd_vrr_range.c
+++ b/tests/amdgpu/amd_vrr_range.c
@@ -29,20 +29,23 @@ IGT_TEST_DESCRIPTION("Test EDID parsing and debugfs reporting on Freesync displa
 
 /* Maximumm pipes on any AMD ASIC. */
 #define MAX_PIPES 6
+#define EDID_SIZE 256
+#define EDID_PATH "/sys/class/drm/card0-%s/edid"
 
 /* Common test data. */
+struct vrr_range {
+	unsigned int min;
+	unsigned int max;
+};
+
 typedef struct data {
 	igt_display_t display;
 	igt_plane_t *primary;
 	igt_output_t *output[MAX_PIPES];
 	int fd;
+	struct vrr_range expected_range;
 } data_t;
 
-typedef struct range {
-	unsigned int min;
-	unsigned int max;
-} range_t;
-
 /* Test flags. */
 enum {
 	TEST_NONE = 1 << 0,
@@ -53,7 +56,7 @@ struct {
 	const char *name;
 	uint32_t connector_type;
 	const unsigned char edid[256];
-	const range_t range;
+	const struct vrr_range range;
 } edid_database[] = {
 	{
 		/* EDID Version 1.4. Timing requires 2 DP lanes. */
@@ -212,12 +215,12 @@ static int find_test_edid_index(uint32_t connector_type)
 }
 
 /* Returns the min and max vrr range from the connector debugfs. */
-static range_t get_freesync_range(data_t *data, igt_output_t *output)
+static struct vrr_range get_freesync_range(data_t *data, igt_output_t *output)
 {
 	char buf[256];
 	char *start_loc;
 	int fd, res;
-	range_t range;
+	struct vrr_range range;
 
 	fd = igt_debugfs_connector_dir(data->fd, output->name, O_RDONLY);
 	igt_assert(fd >= 0);
@@ -249,13 +252,84 @@ static void trigger_edid_parse(data_t *data, igt_output_t *output, uint32_t test
 	usleep(1500000);
 }
 
+/* Returns true if an output supports VRR. */
+static bool has_vrr(igt_output_t *output)
+{
+	return igt_output_has_prop(output, IGT_CONNECTOR_VRR_CAPABLE) &&
+	       igt_output_get_prop(output, IGT_CONNECTOR_VRR_CAPABLE);
+}
+
+static void parse_vrr_gange_from_edid(data_t *data, uint8_t *edid, int index)
+{
+	bool max_rate_offset = false;
+	bool min_rate_offset = false;
+
+	/* Check Bytes 4 Vertical rate offsets
+	 * Vertical rate offsets:
+	 * 00 = none;
+	 * 10 = +255 Hz for max. rate;
+	 * 11 = +255 Hz for max. and min. rates.
+	 */
+	if ((edid[index + 4] & 0b10) == 0b10)
+		max_rate_offset = true;
+	else if ((edid[index + 4] & 0b11) == 0b11) {
+		max_rate_offset = true;
+		min_rate_offset = true;
+	}
+
+	/* Bytes 5 Min vertical field rate (1–255 Hz; 256–510 Hz, if offset).*/
+	data->expected_range.min =
+		min_rate_offset ? edid[index + 5] + 255 : edid[index + 5];
+	/* Bytes 6 Max vertical field rate (1–255 Hz; 256–510 Hz, if offset).*/
+	data->expected_range.max =
+		max_rate_offset ? edid[index + 6] + 255 : edid[index + 6];
+}
+
+static bool find_vrr_range_from_edid(data_t *data, igt_output_t *output)
+{
+	char edid_path[PATH_MAX] = "\0";
+	uint8_t sink_edid[EDID_SIZE] = "\0";
+	const uint8_t range_limits_head[4] = {0x00, 0x00, 0x00, 0xFD};
+	const unsigned int range_head_size = sizeof(range_limits_head);
+	int fd, i, read_size, index = 0;
+
+	/* Get EDID */
+	igt_assert(snprintf(edid_path, PATH_MAX, EDID_PATH,
+			   output->name) < PATH_MAX);
+
+	fd = open(edid_path, O_RDONLY);
+	if (fd == -1)
+		return false;
+
+	read_size = read(fd, sink_edid, EDID_SIZE);
+	close(fd);
+	if (read_size < 0)
+		return false;
+
+	/* Find Display Range Limits Descriptor block */
+	while (index < EDID_SIZE - range_head_size) {
+		for (i = 0; i < range_head_size; i++) {
+			if (sink_edid[index+i] != range_limits_head[i])
+				break;
+			else if (i == range_head_size-1) {
+				/* Found Display Range Limits Descriptor block */
+				parse_vrr_gange_from_edid(data, sink_edid, index);
+				return true;
+			}
+		}
+		index++;
+	}
+
+	return false;
+}
+
 /* Check if EDID parsing is correctly reporting Freesync capability
  * by overriding EDID with ones from golden sample.
  */
 static void test_freesync_parsing_base(data_t *data, uint32_t test_flags)
 {
 	const struct edid *edid;
-	range_t range, expected_range;
+	struct vrr_range range, expected_range;
 	igt_output_t *output;
 	int j, test_conn_cnt = 0;
 	igt_display_t *display = &data->display;
@@ -277,15 +351,27 @@ static void test_freesync_parsing_base(data_t *data, uint32_t test_flags)
 		if (output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP)
 			igt_amd_allow_edp_hotplug_detect(data->fd, output->name, true);
 
-		/* force to use hard coded VRR EDID */
-		kmstest_force_edid(data->fd, output->config.connector, edid);
+		if (has_vrr(output)) {
+			/* A VRR sink, just parsing range from EDID directly */
+			trigger_edid_parse(data, output, test_flags);
 
-		trigger_edid_parse(data, output, test_flags);
+			igt_assert_f(find_vrr_range_from_edid(data, output),
+				"Cannot parsing VRR range from EDID\n");
 
-		range = get_freesync_range(data, output);
+			expected_range.min = data->expected_range.min;
+			expected_range.max = data->expected_range.max;
+			range = get_freesync_range(data, output);
+		} else {
+			/* force to use hard coded VRR EDID */
+			kmstest_force_edid(data->fd, output->config.connector, edid);
 
-		/* undo EDID override. re-parse EDID of display */
-		kmstest_force_edid(data->fd, output->config.connector, NULL);
+			trigger_edid_parse(data, output, test_flags);
+
+			range = get_freesync_range(data, output);
+
+			/* undo EDID override. re-parse EDID of display */
+			kmstest_force_edid(data->fd, output->config.connector, NULL);
+		}
 
 		igt_amd_trigger_hotplug(data->fd, output->name);
 
@@ -317,20 +403,13 @@ static inline void test_freesync_parsing_suspend(data_t *data)
 	test_freesync_parsing_base(data, TEST_SUSPEND);
 }
 
-/* Returns true if an output supports VRR. */
-static bool has_vrr(igt_output_t *output)
-{
-	return igt_output_has_prop(output, IGT_CONNECTOR_VRR_CAPABLE) &&
-	       igt_output_get_prop(output, IGT_CONNECTOR_VRR_CAPABLE);
-}
-
 /* More relaxed checking on Freesync capability.
  * Only checks if frame rate range is within legal range.
  * Display under test MUST be VRR capable.
  */
 static void test_freesync_range_base(data_t *data, uint32_t test_flags)
 {
-	range_t range;
+	struct vrr_range range;
 	igt_output_t *output;
 	int test_conn_cnt = 0;
 	igt_display_t *display = &data->display;
-- 
2.43.0

