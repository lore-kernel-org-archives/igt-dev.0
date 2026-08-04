Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A5EC55822
	for <igt-dev@archiver.kernel.org>; Tue,  4 Aug 2026 19:50:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27A4D10E1CE;
	Tue,  4 Aug 2026 19:50:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XH2YInfK";
	dkim-atps=neutral
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010013.outbound.protection.outlook.com [52.101.61.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84E4210E1CE
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Aug 2026 19:49:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lm8e3gb0Nq8BhQBrKr3q1OnYpCWY8bqn/QbxTAPAsX5hzKDmXxCztSa4FKj5QF4wqxKpyctKo/F82riIPUvSbtdqLm2A9suYxjGiE8UpKUXz8WSaBfIIZNtjMh4RzmSr7KYf5Ly8J6f7z9O/z197S207nn9eyiwMZU1URz3t3ZPk4pqZJ6c6ExL+3tBHkdYJVOum4D1s6E2+epayPPRoJlqGs4nlLHre2+gTgkQVCunFuSt/cUkff8CMGlj7FYxnSsUh/Q9lV7AYiwTRZ5HqiiSGEPmHFG5qr1axE6HQFb0nk7OhJkVPeIKN4XvQXwtLkXNcNRFNanUIW53gzM2piw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LOM2KCWFQSmF3+Tt2zD9ieBvAwRMminYABkkdKDSP1k=;
 b=wGgUhFYr4UEob2AH4SrRFg90J0kvF9djFZvoE9pgiaLCm+IjFyCoJS7gsxYuFKachS9VHATf7SLozgQbFWrDdUVmz1uY72UVjc4aE5XFKsCaG+Eh+1sY6sEK+X5aCMOc4C3BNHlu9GBHz14kt5LMXkuzuny9akA6CzwCRQ/cdy2KAAf938XKrAnxP+Nzki3pWTvR0lu3Np1kA0VEG1t8hUFObwM6GcTtCvyCoUeV+aNmp9DbJqR3FrI31/v1n4a05iOcPYKmOzoESllsQgBe4ZrYOYMOdOLIaFoCzagqwWQ5cx2YoMFwEDPUNvEbKu1tfhAsPynbegVGWXDtGMMEAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LOM2KCWFQSmF3+Tt2zD9ieBvAwRMminYABkkdKDSP1k=;
 b=XH2YInfKVPTgnJhfupV56SpKfcMTHob+05TKOWqKKioPxRppc7pJOhUs1FU6wlQL0ZE40I+NRXAfi4sXXD8Q6cm0mHsV0+Y21mIKmO73KuwhQBaBR5/6Bc62ROFranZnmH8MRzUyR7KNfhKlcLK5vekBmJlAYxW53ekncyDGUKs=
Received: from MN2PR05CA0065.namprd05.prod.outlook.com (2603:10b6:208:236::34)
 by IA1PR12MB7520.namprd12.prod.outlook.com (2603:10b6:208:42f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 19:49:31 +0000
Received: from BL6PEPF0001AB4B.namprd04.prod.outlook.com
 (2603:10b6:208:236:cafe::8) by MN2PR05CA0065.outlook.office365.com
 (2603:10b6:208:236::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.15 via Frontend Transport; Tue, 4
 Aug 2026 19:49:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB4B.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Tue, 4 Aug 2026 19:49:30 +0000
Received: from jzuo.laptop (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 4 Aug
 2026 14:49:30 -0500
From: Fangzhi Zuo <jerry.zuo@amd.com>
To: <igt-dev@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <Alex.Hung@amd.com>
CC: Fangzhi Zuo <jerry.zuo@amd.com>
Subject: [PATCH] tools/amd_hdmi_compliance: Add ALLM content type toggle test
Date: Tue, 4 Aug 2026 15:47:35 -0400
Message-ID: <20260804194735.1577182-1-jerry.zuo@amd.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4B:EE_|IA1PR12MB7520:EE_
X-MS-Office365-Filtering-Correlation-Id: 683e3bfc-c26f-4b12-8841-08def2618027
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|23010399003|376014|82310400026|1800799024|6133799003|10067099003|56012099006|11063799006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: CaaRRlxxg7jefHo+xQcTslycBFcg/mmFbUgK8iVCTrBA/BMzJBVZN6LVeH1Gq9NdUPzNI19KRq1K1SOm6cgTtRbvIiufG4yBbNlm3X9aJBTWZd3kRj6d6WspRMLjjGRC+jV1NEJw9mEkJCx/6i1x2V6nxNFUkchiqqrWqOzLOCPbJelUQkbBbNxx3hx6XSSP9yLsY9hLwsQL0Q5s6/qA1oqsQp6mFsHD9SQ5cNgRHBcENAma3bG3GVRoVNpm98lUv2BITH0ZRSnzwmVcZK4ulGnJn442n7Qtwh83KiyehnWmH8zFHW1uPsz02sVOOhl6jZfS9v+gVoFaM/HALtk6OEhEHJBRuKwBgF8lW4RZIRwzhxwJa82CDBIyazfg7L21hrZ18m9pJ9BSVtDRCxnrLaJ2ZLyUdS1xTBn3aLKgYU9RUeR0h7xhbJrtq6AXSrEAT4uZXSd7T1SgOoMsDBvBN8iBQV9xOxkys7pfDC5arZhEYZGVzgx5jjHNs4kHX4Or8gPu8fSI6lzvg6ru1Vbb/mzE/PpD2TXGy+pkXxfgFY1oU9NwH2A14vECX8ZGQzxO8bQYtQvCtEhmistnMexnBXKijMmpYpBT9tzjhGv/soCOg3Xtq6nxPK3TzdkriiyjZHS28nuCK6JTfpiAvkYyNXZkWH205yOuMqP5vKFwVPCVoTv2x9bm1t3oX7Q434hFophnqRXtq2TWFaEPbqZpCA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(23010399003)(376014)(82310400026)(1800799024)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Wlv1InvhPq8kOa7Q4ub3FQYcUpc5LyDdrQ8zpshfy7rseG/yX0weywiGWrGpU5SIxdp5olzn7onl1ir3Ei0Sde5pi4EkfZHNlDrMOS05tdn0i8S0+TV5849o/fWTkWAI5bghwGuZCqJTC/Lt068tSYmF8D3+Olo/7ScA5xn4cbYyLoHd4NdwLAkWGxYvY7aAN0OA6/4K0c6wlcdkGmPV5DaWuuoa90VLhPXwM0TSzlZZpyCafkQoLoB38lAwgyvh6e7bulpoClc9S0pYTbXM3imxwpxk/LjBxfmLewYxleyxbFTDs1fzke+Nd+vidkGi2/p6HeiwsbqYrsAImrGhfh2rkyaoD2CqG2c1ql3zu7cHU0rLtYnp1ijpv1p7IsuGpyxTpHJAEsjB+ltPzOCzLaandBEvGIzjzRwMLT+nYxzobvt1oCYvcpfAvMWIjZKR
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 19:49:30.8566 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 683e3bfc-c26f-4b12-8841-08def2618027
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7520
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

Add a new '-a' option that exercises HDMI ALLM (HF1-56 steps 14/15) by
toggling the connector 'content type' property between No Data and Game
on a live pipe without tearing down the link.

A full atomic modeset is performed once, then each toggle is first
attempted as a property-only atomic commit. If the kernel rejects it,
the change is retried with DRM_MODE_ATOMIC_ALLOW_MODESET. The path taken
is reported so the operator can tell whether ALLM was toggled in-band
(seamless, link stays up) or required a modeset that blanks/retrains the
link.

Signed-off-by: Fangzhi Zuo <jerry.zuo@amd.com>
---
 tools/amd_hdmi_compliance.c | 97 +++++++++++++++++++++++++++++++++++--
 1 file changed, 94 insertions(+), 3 deletions(-)

diff --git a/tools/amd_hdmi_compliance.c b/tools/amd_hdmi_compliance.c
index 0bc77e092..2af4c0bab 100644
--- a/tools/amd_hdmi_compliance.c
+++ b/tools/amd_hdmi_compliance.c
@@ -913,7 +913,91 @@ static void test_vic_mode(data_t *data, int vic, int conn_id)
 	test_fini(data);
 }
 
-const char *optstr = "hvt:i:b:y:e:";
+/*
+ * Toggle HDMI content type (No Data <-> Game) on a live pipe to exercise HDMI
+ * ALLM (HF1-56 steps 14/15) without tearing down the link.
+ *
+ * A full atomic modeset is performed once, then each toggle is first attempted
+ * as a property-only atomic commit (no DRM_MODE_ATOMIC_ALLOW_MODESET). If the
+ * kernel rejects it, the change is retried with ALLOW_MODESET. The path taken
+ * is reported:
+ *   [seamless, no modeset] -> ALLM toggled in-band, link stays up
+ *   [MODESET required]     -> content-type change blanks/retrains the link
+ */
+static void test_allm_toggle(data_t *data, int conn_id)
+{
+	igt_display_t *display = &data->display;
+	drmModeModeInfo *mode;
+	uint32_t connector_id, prop_id;
+	uint64_t cur_ct = 0;
+	igt_fb_t afb;
+	char line[16];
+	int game = 0;
+
+	test_init(data, conn_id);
+
+	connector_id = data->output->config.connector->connector_id;
+	igt_require_f(kmstest_get_property(data->fd, connector_id,
+					   DRM_MODE_OBJECT_CONNECTOR,
+					   "content type", &prop_id, &cur_ct,
+					   NULL),
+		      "connector has no 'content type' property\n");
+
+	/* Initial full atomic modeset with a test pattern. */
+	mode = igt_output_get_mode(data->output);
+	igt_info("Using connector id %d, mode %s\n", connector_id, mode->name);
+	igt_create_pattern_fb(data->fd, mode->hdisplay, mode->vdisplay,
+			      DRM_FORMAT_XRGB8888, 0, &afb);
+	igt_plane_set_fb(data->primary, &afb);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+
+	igt_info("\nMode set. content type = No Data (0).\n");
+	igt_info("Press [Enter] to toggle Game <-> No Data, 'q'+[Enter] to quit.\n\n");
+
+	while (fgets(line, sizeof(line), stdin)) {
+		drmModeAtomicReq *req;
+		uint64_t val;
+		int ret;
+
+		if (line[0] == 'q')
+			break;
+
+		game = !game;
+		val = game ? DRM_MODE_CONTENT_TYPE_GAME :
+			     DRM_MODE_CONTENT_TYPE_NO_DATA;
+
+		req = drmModeAtomicAlloc();
+		igt_assert(req);
+		drmModeAtomicAddProperty(req, connector_id, prop_id, val);
+
+		/* Try a seamless, property-only commit first. */
+		ret = drmModeAtomicCommit(data->fd, req, 0, NULL);
+		if (ret) {
+			int nomodeset_err = errno;
+
+			ret = drmModeAtomicCommit(data->fd, req,
+						  DRM_MODE_ATOMIC_ALLOW_MODESET,
+						  NULL);
+			igt_info("content type = %-7s (%llu)  [MODESET required, link blanked] (nomodeset err: %s)\n",
+				 game ? "Game" : "No Data",
+				 (unsigned long long)val,
+				 strerror(nomodeset_err));
+		} else {
+			igt_info("content type = %-7s (%llu)  [seamless, no modeset]\n",
+				 game ? "Game" : "No Data",
+				 (unsigned long long)val);
+		}
+		if (ret)
+			igt_warn("commit failed: %s\n", strerror(errno));
+
+		drmModeAtomicFree(req);
+	}
+
+	igt_remove_fb(data->fd, &afb);
+	test_fini(data);
+}
+
+const char *optstr = "hvt:i:b:y:e:a";
 static void usage(const char *name)
 {
 	igt_info("Usage: %s options\n", name);
@@ -924,7 +1008,8 @@ static void usage(const char *name)
 	igt_info("-b 6|8|10|12|16	Set 6|8|10|12|16 bpc\n");
 	igt_info("-y 1|2|3|4	Set RGB|YUV422|YUV444|YUV420\n");
 	igt_info("-e seconds    number of seconds to display test pattern and exit\n");
-	igt_info("NOTE: if -i is not specified, first connected HDMI connector will be used for -t, -b and -y\n");
+	igt_info("-a            Toggle HDMI content type (ALLM) Game <-> No Data on a live pipe\n");
+	igt_info("NOTE: if -i is not specified, first connected HDMI connector will be used for -t, -b, -y and -a\n");
 }
 
 int main(int argc, char **argv)
@@ -935,6 +1020,7 @@ int main(int argc, char **argv)
 	int conn_id = 0;
 	int max_bpc = 0;
 	int pixel_format = PIXEL_ENCODING_UNKNOWN;
+	bool allm = false;
 
 	memset(&data, 0, sizeof(data));
 
@@ -958,6 +1044,9 @@ int main(int argc, char **argv)
 		case 'e':
 			data.timeout_seconds = atoi(optarg);
 			break;
+		case 'a':
+			allm = true;
+			break;
 		default:
 		case 'h':
 			usage(argv[0]);
@@ -979,7 +1068,9 @@ int main(int argc, char **argv)
 	if (max_bpc)
 		set_max_bpc(&data, max_bpc, conn_id);
 
-	if (vic >= 0) {
+	if (allm) {
+		test_allm_toggle(&data, conn_id);
+	} else if (vic >= 0) {
 		if (vic > ARRAY_SIZE(test_modes) || !test_modes[vic].name[0])
 			igt_warn("VIC %d is not supported\n", vic);
 		else
-- 
2.53.0

