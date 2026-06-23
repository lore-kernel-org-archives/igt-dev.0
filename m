Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D41CFCDB46F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jun 2026 15:56:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83FF410E40B;
	Tue, 23 Jun 2026 15:56:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="d1q85lZS";
	dkim-atps=neutral
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011019.outbound.protection.outlook.com [52.101.52.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E01D10E40B
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jun 2026 15:55:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x53xi413lWyZjRxHSE/koI/8VkuIxsz/7Eh5pReJ+71cu7FCuQa++tD41MLhELNNo+8cHtxgIL+mOXGg33S1u9IqgzDKosS6j1CIMmyS7ADwRq779I/+UGxRg2sTK3wan1LEoXLpZSG6ofdaugvb8wyOJOXd7/vhvAZinpiSWiIVJSLmgPs3SuRjKZp+EBCjCA0PAX82DDbsivwUyYBCgCi8EFe80Kdwp/LPE5UHk8DDEpUQgHSvUuTiR52MdOZf33rha5g+uh9TeqEFoxRQU+phaKpUSameREV/rdARS0irqfxIW8HnbDaEeZE5yoKxFGdUL4GXf7/ggEp/RVtPGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wcW0VcMy8PTApmMLsiHUcHKjnZOSMLpDV7AdErYendE=;
 b=vj7kTPkt5bD91YZplCd3Hr16Z1zqCOulnoTbCGgVp2gf+t+Rv7HoKlCDvgdo+xN3pIYIJEA6qTPvSs42hJzCKAZLplZnZ6XINzhVfDhGQiBbJOQZIwBqVDZnDzZxi3MHAS1PrPxWCyVXu6vAWgFb1UStdPaa78yn6HDWnRZoqiUe2F25zSRmBgPi+luFswEtn+VfI/2xP1db4JktG6cuyq3YvAWecCoawx3o35yto+71qHKW3/I+8OtK2yP5pPmatuWYLlJ7QPGSyq3pT9ji5nQ+Kmah8kCDrBtXJf96xpqzOp4xIVVLH3CtcCHngBt2t6h75QaPOgwFYEZRPbeBQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wcW0VcMy8PTApmMLsiHUcHKjnZOSMLpDV7AdErYendE=;
 b=d1q85lZSLjaYctO8OuegpT3QQ/3adOZIl9jDKx1sEFml5EwS0qt71J2CIiVLPvO0EaAplVeXmj1u0f+w8tdEqDwEs/U1+q4XixFOXJ2P/gUIjeGaR2RfZ3mT160DYXbyqA1P+DuL6cY5q5/uw7dg1V9tt0NmXye4OJQn8Gsm5eo=
Received: from SJ0PR03CA0369.namprd03.prod.outlook.com (2603:10b6:a03:3a1::14)
 by SJ0PR12MB6805.namprd12.prod.outlook.com (2603:10b6:a03:44f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.12; Tue, 23 Jun
 2026 15:55:43 +0000
Received: from SJ5PEPF000001F7.namprd05.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::7c) by SJ0PR03CA0369.outlook.office365.com
 (2603:10b6:a03:3a1::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.20 via Frontend Transport; Tue,
 23 Jun 2026 15:55:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001F7.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Tue, 23 Jun 2026 15:55:43 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 23 Jun
 2026 10:55:43 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 23 Jun
 2026 10:55:43 -0500
Received: from hwentlanryzen (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 23 Jun 2026 10:55:43 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH] lib/igt_amd: don't rely on NUL separators parsing
 link_settings
Date: Tue, 23 Jun 2026 11:55:41 -0400
Message-ID: <20260623155541.32145-1-harry.wentland@amd.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F7:EE_|SJ0PR12MB6805:EE_
X-MS-Office365-Filtering-Correlation-Id: e10180a4-7d32-4f23-5299-08ded13fe205
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|82310400026|36860700016|1800799024|18002099003|6133799003|3023799007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: vEhcL7pdTFYC13b40vmbNk3OEi13rzIizRbdTrKTIq4GoxXetLsXHtpe1mT+7smU5nHI+jpZjnbt9fLg+6NTn7hc1KlC/tzVStv+fcNjBHbHE+OEMdJZNUBmSowLt7Xy/M0I9+cNarrZcm5KZPm7wgMmo7JNF+o4WsJZQuhwxen+t9jgYH+6nS/A/GWXaKEbAWJugqzg9ylXwZJJoKrYvcfmjNdDq8Co20sbMbppCzyRqyXzQkCM4rxpImj65rSEIYQVQ7kI94+rpzjVziZIO6myIPq4yDBZO6NgFqrTXoPauNbN0hgPOgavIe4Ju53AhK4qtacao7SGpuhJnESI0X34kRNCiX7TGzvPVolddkf1R/awOU/+nWTo2WN15dNnVfZ1XX9b5vC1j05JK76x8Yl8pQTj8TsZX3aAjp81HOdNF6n3slg8DS2hQ/hn/vjGoFVlNKWPQZRpfo8Ws2NcDYr6TsOd/sQZWDtH/XKO9MwwdS+PH97haMS6Hby6Ur6QudEgsNLiDOMQ69aTENIAk5EauLSVgxsjjex4hBxAbzwFsqBC45irg57WrPesaqbIZgd/EYB5CNLl+LIEAmy28CrvOmHf0hn+7grQQ1qy7RHi/LD2kVKZ6NfWObZICa30W6TZ/OP+Y4neW/clWBT8dfzDQ2sHXSp3MdsJvDQVtMHGWcfXVUGrgNkuvrpwuD8NTTY3xqV5x4absoT5R2vecA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(82310400026)(36860700016)(1800799024)(18002099003)(6133799003)(3023799007)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 7JD8HDdyMYiKZWY+8RzgfrzVRZjUxnq4mgjIhOAsANfg1WSGzQrhV0ySVNlsoEV+RKS6evC2hwcd6ryS9MCTR0dykZCbESX8yYR2QWstjry8HEU9d9X0cvw8s9NkcZfLGk5uM0KIvVCROkbkULF3rApk6/ZAjRW72EcWXUWTbo+AEIwLHT65CPgKK/dFDEqfn6XD/mvwgVC6EcV3pgIzYvSXW+drCJYB/V2zFa43ky7SKsVMoRJK7MV77chifG5r9XljnnsUgKBBSgnLp1fagGLZRYA8SUtneHQjCU0qBAIcCWJYU/PSgqDriV7GrAANSiclxQTc/TFu5lEVdLB9r4mSwq+2OGSC5SRlIHvF5NM4kxZYNK3PuxVqU83dkdH3wUbcULmthz8Ei00aEy3fPp0qqFVGZqOFpI4XLkv77Ro/pKkzT4nKXMz3RX1cHIsN
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 15:55:43.7666 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e10180a4-7d32-4f23-5299-08ded13fe205
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6805
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

igt_amd_read_link_settings() parsed the dp_link_settings debugfs node by
replacing the NUL bytes that the kernel accidentally wrote between the
Current/Verified/Reported/Preferred records with ';' and using those as
strtok delimiters.

The kernel side has been fixed to emit a single, properly NUL-terminated
string with no embedded NULs (amdgpu: fix malformed link_settings debugfs
output). With that fix the buffer no longer contains internal separators,
so the old parser collapsed the whole string into a single token: only the
Current record was parsed while Verified, Reported and Preferred were left
unset (0). amd_ilr then wrote a lane count of 0 and asserted it against the
trained lane count, failing the ilr-link-training-configs subtest. The
NUL-scanning while loop also walked into uninitialized stack.

Parse the node by locating each label and reading the three values that
follow it, so it no longer depends on embedded NULs or any other record
separator and works with the contiguous string the kernel now produces.

Assisted-by: Copilot:claude-opus-4.8
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_amd.c | 38 ++++++++++++++++++++------------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/lib/igt_amd.c b/lib/igt_amd.c
index 47e587e54de0..7d33ab65858c 100644
--- a/lib/igt_amd.c
+++ b/lib/igt_amd.c
@@ -833,10 +833,13 @@ int igt_amd_trigger_hotplug(int drm_fd, char *connector_name)
 void igt_amd_read_link_settings(
 	int drm_fd, const char *connector_name, int *lane_count, int *link_rate, int *link_spread)
 {
+	static const char * const labels[] = {
+		"Current:", "Verified:", "Reported:", "Preferred:"
+	};
 	int fd, ret;
 	char buf[101];
-	int i = 0;
-	char *token_end, *val_token;
+	char *ptr;
+	int i;
 
 	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
 	if (fd < 0) {
@@ -850,23 +853,22 @@ void igt_amd_read_link_settings(
 
 	close(fd);
 
-	/* Between current, verified, reported, and preferred are null terminators,
-	 * replace them with ';' to use as the delimiter for strtok. */
-	while (strlen(buf) < sizeof(buf) - 1 && buf[strlen(buf)] == '\0')
-		buf[strlen(buf)] = ';';
+	/* The debugfs node returns a single NUL-terminated string of the form:
+	 *   "Current:  %d  0x%x  %d  Verified:  %d  0x%x  %d  "
+	 *   "Reported:  %d  0x%x  %d  Preferred:  %d  0x%x  %d\n"
+	 * Locate each label and parse the three values that follow it. Do not
+	 * rely on embedded NUL bytes (or any other delimiter) between records,
+	 * as the kernel emits a single contiguous string. */
+	ptr = buf;
+	for (i = 0; i < 4; i++) {
+		ptr = strstr(ptr, labels[i]);
+		if (ptr == NULL)
+			break;
 
-	/* Parse values read from file. */
-	for (char *token = strtok_r(buf, ";", &token_end);
-	     token != NULL;
-	     token = strtok_r(NULL, ";", &token_end))
-	{
-		strtok_r(token, ": ", &val_token);
-		lane_count[i] = strtol(val_token, &val_token, 10);
-		link_rate[i] = strtol(val_token, &val_token, 16);
-		link_spread[i] = strtol(val_token, &val_token, 10);
-		i++;
-
-		if (i > 3) return;
+		ptr += strlen(labels[i]);
+		lane_count[i] = strtol(ptr, &ptr, 10);
+		link_rate[i] = strtol(ptr, &ptr, 16);
+		link_spread[i] = strtol(ptr, &ptr, 10);
 	}
 }
 
-- 
2.54.0

