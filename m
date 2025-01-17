Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE95C02183
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jan 2025 10:01:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9880D10E2FB;
	Fri, 17 Jan 2025 10:01:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ilgRyjCM";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2082.outbound.protection.outlook.com [40.107.93.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C6CE10E2FB
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jan 2025 10:01:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BQXWLcEgJzbycumUwHbQnKADuPKoOG/WcNNrGz4uagy1nsW9j2Bf/eNvWZJJ5c9LJqmXkphnjhF4JKRct9tpchBg24KfW+ogIKrQdvI3+oqDNFBU777yiLysDVt1v4EqDGJLFOCcZ17kd71gJH3xqVs6nT4n3wlpGUxXrokVsMGgCP2loWG9nFeKkCTamrhsb2rTaccE8VX4ubK9qL1KROuIHkMItK+xSWR4NWnjWu/GK7tJcYfHKAyk+gr3btlLSnnGkQa9GXdZzreIWThP2G+xwKKHa+fsGK8qhzfjBnuodDsaNtAnZ4HULWd8o1Ncdr8nHEceG10Yx4f84xa6cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YXSXNhED+NMfwofnEDE6v436YMZceVjYWa6ABLQz/Lk=;
 b=iKSsmpmKy07jad6em0TuoqlNznF5PcfIp249FKsEHonX9T82EKZ+ql+j17mh4EWepyBiWVkTfxcuri1wDy1E9LJbuwnaNyZWqEgdmrjkd9BcxpSWXuQ4lZsohsnhmkv1oT95MBZ57JrYoaRkbsIQP+XhBdYpQwBpzz6zMT1vkW/oGcFM4jJQ2qXxG/nDOsK5E++zSoBlKN0WwHK5dtFxf4xOg7mThreO3ysJ6yT0rrmpfl+iXv9rAU+uHW41UH7Zx1SKy6mkAL3xNGR4UVmCnZ3xqmhbk1E+gbZv72Rrox34nBWW7XJxFfp5Z6XO1xSDJ5dj8H2i4ERrfJ2nUgc19Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YXSXNhED+NMfwofnEDE6v436YMZceVjYWa6ABLQz/Lk=;
 b=ilgRyjCMkRMNHkAGjPBaAK2VmhHf2a8LVkXTScGPriS3NkWTn2T6Gnq9ssRk0xCdA2MX7rou5DoKKGyunaW7ZakhhbLzsfiPBxyDNfYKI+ZqOJKIyJ7JlxaHWdZMI+YzSNk2TMjehEuC99W+6qpKk2g2KrPNId7ebvucuXWdsHo=
Received: from SJ0PR05CA0208.namprd05.prod.outlook.com (2603:10b6:a03:330::33)
 by DM4PR12MB5796.namprd12.prod.outlook.com (2603:10b6:8:63::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Fri, 17 Jan
 2025 10:01:12 +0000
Received: from SJ5PEPF000001D7.namprd05.prod.outlook.com
 (2603:10b6:a03:330:cafe::20) by SJ0PR05CA0208.outlook.office365.com
 (2603:10b6:a03:330::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.7 via Frontend Transport; Fri,
 17 Jan 2025 10:01:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001D7.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Fri, 17 Jan 2025 10:01:12 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 17 Jan
 2025 04:01:10 -0600
Received: from tom-maple-halo.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 17 Jan 2025 04:01:09 -0600
From: Tom Chung <chiahsuan.chung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <Rodrigo.Siqueira@amd.com>, <alex.hung@amd.com>, <sunpeng.li@amd.com>,
 <chiahsuan.chung@amd.com>
Subject: [PATCH i-g-t,
 v2] tests/amdgpu/amd_vrr_range: Fix panel cannot light up after test
Date: Fri, 17 Jan 2025 17:59:08 +0800
Message-ID: <20250117100101.4282-1-chiahsuan.chung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: chiahsuan.chung@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D7:EE_|DM4PR12MB5796:EE_
X-MS-Office365-Filtering-Correlation-Id: ed6ca217-dedb-4217-cbf1-08dd36dddfa2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vk15Qy9vb013bHlOM1NTWjlOcXE5cHR1Tm9Da2NDK3FZQVVkaDZjQ1BsQnlB?=
 =?utf-8?B?bUoza1BLb3Rld2RRT0VENEJPK3FSUGwrdjlibFkxNkNNKzFJYVMwSW90Q0hv?=
 =?utf-8?B?MVk2VXErSzhMcDhLZWpmelltdE9ib3l1aEROMkIrbTdyRllCZktpQnQwNlBh?=
 =?utf-8?B?WmVlV1BTamxIUHFvTE1wbFFrWW1NeXBNaVd6TVR4TDk1MkF0UXI3T2UvZlNx?=
 =?utf-8?B?WCs2RkRtOWxiV3pwZklqQnNzdmExMnc3eFlkcFZsSGFPRHpsbDlZdmh1a29V?=
 =?utf-8?B?aDRDQ1pYOGRKMmUxeWZjZ2hrQmJKeGNYdzhDdXRnVWxReG1YUUdhTmFYdGVP?=
 =?utf-8?B?amZINE9WQ1kwQ0RjYVZyTWJ2U3pnU2NvUnVvK1FjUW00OC82aVExNU9GTjlD?=
 =?utf-8?B?LzJPSTYrQ1FmVG4vQVhzeHB2L28rbmFOaDh0RHIzMlpjZWllOXhNNitLK2Vp?=
 =?utf-8?B?MWM4c2dreWR2SndJSDB5OENOZlNraEhBdU0zenFWRE9oM2orcGxEK2hWTG5P?=
 =?utf-8?B?dXZlZTlSbjQ5b3VvamwvWEl1N0t3MTR4amk5M1NMUjNIck1iNzZVSkFPY1R5?=
 =?utf-8?B?Tmx6cTlIcmNPSFNRdWZ4L3lKUDFNc3pVdHhMTURMQUF3Y3RqUTZUS05sbDNF?=
 =?utf-8?B?R2ltOWRRdDlMSUZFa1BtNkozOEd4eEQ3cXlicEFweDRrSTJVbzZiRVNROUhG?=
 =?utf-8?B?Q0JveWJsOVQ3VzNGVk9oMzBoSEtXcGhZay9OK21BSGV2dUpCcFQ3M3Q0MWZV?=
 =?utf-8?B?Y0IwY25NWmlISHpodDhzUzFvNVRRNVlJTzI0S2dwbklpQnNoSy9xTEF5aWw0?=
 =?utf-8?B?VDMzS0VYRk1ZYittQVg3Nlo1S3V4cVgrUDlxVzlUek9heVVLUXVZMDNNa2s4?=
 =?utf-8?B?VFJaQzdCNDBHdkpHTXB1Y2FyYWFRYTZxN1NhamowQ01aVjdjaEpReGdIYSt3?=
 =?utf-8?B?VURVY0ZLNFJFKys5NW83NFIwcEgrRDN3anFKRmt0TU1NNmFQWUFEVXpobTlR?=
 =?utf-8?B?QXNER3J5SUw4OFNsejJ6RWJNUExGbG9lRWs2TFRaWXh0TzlWYS9zSGp2dFNj?=
 =?utf-8?B?eVg5NFoxSFdoN2JaTlFjRGRZKzBSYnFvVjVuWlZrSUhDbG1RU1NOMHpvK1h1?=
 =?utf-8?B?R3M2ZkN0NUMvWUUrRHIvVmUzWktaeCtCQlJXSUZlMjI5bmhMM0U5cHFza3hN?=
 =?utf-8?B?KzJzRnZxRUJaR0lIN1J2VUdXdVZCZ25zcWJqeXpwRGxqMmF6N1BKWVpLVmQz?=
 =?utf-8?B?OVdLeEZVY3dtb3Ywd1dwVSt0VzVpU0dVd01rUURvTFBlamNKR2FUdWJoRS9R?=
 =?utf-8?B?aWZIOERuNVpwMDdaTkNnZXZsMDlJNDZINFVLOTZVSmNTcFpXM2RWYmdjUjVM?=
 =?utf-8?B?SnRvV1V2T1VFUTRhbmlhbDBLRUdDZUtoV00rZnpGMytOOGZ4WFk0N3AyNkNP?=
 =?utf-8?B?Z3M4V3lTQ0FVL1laUldaUDFkM0lyMnZuOUx0RHkwWUFrOG5xNEM2alYrQkd5?=
 =?utf-8?B?bDFxMnY1UnJCYUxKRUlkY3BTTDFOdXpwazAzd1lPRHpROUZwb053SzIxa1Vt?=
 =?utf-8?B?VHpVWWFVc3JhVkRZTFZIUVZxQmg3U3NWazJkcS9nNzBCRlI0OWFXL21vRFBG?=
 =?utf-8?B?Q2xYSUdOTllNOW41b0VyUVZYaFhiS09veFZMVUxaMVhQQ2w2TkJPd1VLaFFK?=
 =?utf-8?B?UVF0TmU3cE13Wk9ObmprbC96SncyMWFLc3pnOVdCVWpxMEpjQjhMNFNWV2hR?=
 =?utf-8?B?K2ZEUk9FaFZPeFhvMzFZZ0REMDRQMWVzNGtoRStRRzd2akJOZTJLdHI5Umg4?=
 =?utf-8?B?QlVibU1TSzdDWEdpZ1pBeGtHc2RUVkVBclZRU1JtMzFOZVgvQ2ZYRnlvendH?=
 =?utf-8?B?RUxsWUR1T1hIaHRnWWtlSHlNUDl0TDRmRzJqYlovb3VocmIvUk93Q3l4VCtV?=
 =?utf-8?B?eHZRcTE2Sy9zUmd5ZWxPM1RZcm4zYW03eWhUZTVJdE9sUWlWTS9Ta05aSVpj?=
 =?utf-8?Q?v8B20F9Tc2xk/UNN9xXGOVzosJ/KIw=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 10:01:12.2576 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed6ca217-dedb-4217-cbf1-08dd36dddfa2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5796
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
v2: Move igt_amd_trigger_hotplug() to non-VRR sink only

 tests/amdgpu/amd_vrr_range.c | 140 +++++++++++++++++++++++++++--------
 1 file changed, 110 insertions(+), 30 deletions(-)

diff --git a/tests/amdgpu/amd_vrr_range.c b/tests/amdgpu/amd_vrr_range.c
index 79db6f9c4..9d2462e5e 100644
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
@@ -273,25 +347,38 @@ static void test_freesync_parsing_base(data_t *data, uint32_t test_flags)
 		edid = (const struct edid *)edid_database[j].edid;
 		expected_range = edid_database[j].range;
 
-		/* eDP allow read edid for each display detection */
-		if (output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP)
-			igt_amd_allow_edp_hotplug_detect(data->fd, output->name, true);
+		if (has_vrr(output)) {
+			/* A VRR sink, just parsing range from EDID directly */
 
-		/* force to use hard coded VRR EDID */
-		kmstest_force_edid(data->fd, output->config.connector, edid);
+			trigger_edid_parse(data, output, test_flags);
 
-		trigger_edid_parse(data, output, test_flags);
+			igt_assert_f(find_vrr_range_from_edid(data, output),
+				"Cannot parsing VRR range from EDID\n");
 
-		range = get_freesync_range(data, output);
+			expected_range.min = data->expected_range.min;
+			expected_range.max = data->expected_range.max;
+			range = get_freesync_range(data, output);
+		} else {
+			/* A non-VRR sink. Override a golden EDID */
+			/* eDP allow read edid for each display detection */
+			if (output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP)
+				igt_amd_allow_edp_hotplug_detect(data->fd, output->name, true);
 
-		/* undo EDID override. re-parse EDID of display */
-		kmstest_force_edid(data->fd, output->config.connector, NULL);
+			/* force to use hard coded VRR EDID */
+			kmstest_force_edid(data->fd, output->config.connector, edid);
 
-		igt_amd_trigger_hotplug(data->fd, output->name);
+			trigger_edid_parse(data, output, test_flags);
 
-		/* eDP dis-allow read edid for each display detection */
-		if (output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP)
-			igt_amd_allow_edp_hotplug_detect(data->fd, output->name, false);
+			range = get_freesync_range(data, output);
+
+			/* undo EDID override. re-parse EDID of display */
+			kmstest_force_edid(data->fd, output->config.connector, NULL);
+			igt_amd_trigger_hotplug(data->fd, output->name);
+
+			/* eDP dis-allow read edid for each display detection */
+			if (output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP)
+				igt_amd_allow_edp_hotplug_detect(data->fd, output->name, false);
+		}
 
 		test_conn_cnt++;
 
@@ -317,20 +404,13 @@ static inline void test_freesync_parsing_suspend(data_t *data)
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

