Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81BECC61DFD
	for <igt-dev@archiver.kernel.org>; Mon, 31 Aug 2026 20:57:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15A1A10E33B;
	Mon, 31 Aug 2026 20:57:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0iXbTTH6";
	dkim-atps=neutral
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010009.outbound.protection.outlook.com [52.101.61.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 233AA10E33B
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Aug 2026 20:56:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PBfEzTW1wue/LdASivu7evNSVg9W9QcNrk1Z31mqp/fMUhwJGN12LouMPlhdpPUUdUZ6YXDsKelUZiwjNgP6FKDU7+BOQNGLi/RIuZV3szk47+W3SS8e7tMonKhyqfTGEfkoXExpLybJad6fczZCnCLuZCHhxWjEJPOkSJwC9ufHj9OmeiRkyfNduFbM/7DHsbJyRh+J7MrKPlsA1TcquMOWdfuBOUokAekAaz+rs5Cm7YkQlGA4m49P8O8hfXkTu1d5YXyQdBrAvVVLtArdFvgCm2fRUOQJl2iwDxYzgNOXviJLgVV9HnAxmphKqipeDvP598EUF57iDMCCX9wgGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ptvnmSwZ9QAqZWVeW8jgQ7ItOaZ4X3zErpS+4kPYURM=;
 b=UGUQxm/hF4ZEVeNMOw0zqZQ+BuofojNGOxxHkH8vzzkLbvErwlgHLmNatNTXoQiQf32xusbpunghoeyHZ58fBIYzYUbLk/NvzGoApTQqqlvjceKitOIkQb7JDHeL3z7mnq6yxJ1GHfbtydaLTTfZmbSjbG+Jv6BGjxst7EqmzTG7aOVrID0FBw3sygYCF/f8qS5GFNpmBD4/cgSLYAIteomaM4KAXI+Zvt7QW1VouE0aN2zx0yPC56w09HJGar8CRo7k3FF2O+zya2JZRXsAVD5o4Og/4BB/lHjx7eXJHswW1WF5BcTXSjZf1AXcgOj4nCrxbNOcutW+UYeq5TbV9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ptvnmSwZ9QAqZWVeW8jgQ7ItOaZ4X3zErpS+4kPYURM=;
 b=0iXbTTH68AG3f05Bgb8SIOnZNMPS+yVNtBqoZeRTyNrHOYdzKsuqlajM6KfI/f80TBYrkzB/R/m0w0lI08A94foXkSlF2D+l4U8QDPQqAfRBLikhrRxc55LemW1TeL2JV0opq7vAOmeD0ENg+J8gj8TrqxRf/z3e1uSZF908If0=
Received: from BN1PR13CA0025.namprd13.prod.outlook.com (2603:10b6:408:e2::30)
 by SA1PR12MB7295.namprd12.prod.outlook.com (2603:10b6:806:2b6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 20:56:53 +0000
Received: from BN7PEPF000000A2.namprd04.prod.outlook.com
 (2603:10b6:408:e2:cafe::a5) by BN1PR13CA0025.outlook.office365.com
 (2603:10b6:408:e2::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Mon,
 31 Aug 2026 20:56:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN7PEPF000000A2.mail.protection.outlook.com (10.167.248.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Mon, 31 Aug 2026 20:56:53 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 31 Aug
 2026 15:56:52 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 31 Aug
 2026 15:56:53 -0500
Received: from roman-vdev.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Mon, 31 Aug 2026 15:56:52 -0500
From: <Roman.Li@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, Roman Li <Roman.Li@amd.com>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [PATCH i-g-t] lib/igt_amd: parse link_settings records by label
Date: Mon, 31 Aug 2026 16:56:39 -0400
Message-ID: <20260831205639.117351-1-Roman.Li@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A2:EE_|SA1PR12MB7295:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c855377-6f15-49d6-3522-08df07a262c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|36860700016|82310400026|376014|1800799024|6133799003|56012099006|10067099003|11063799006|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info: useB1KxpNeF6bWqhrq5tWGXdBBMiqo8nYWmj4ZnaEukdnCUWaw/TAyGZ0vMt71TNVdY3hLMxMYU9YAqvcHBkJ/n8Ej4OeR0wwhWRu+aelvBARaDBFHOyZEqR+2O76g/NgNHDf31+2WcZJbPdHMFNqRaso3uw0vb8B0VTGSEG4gRmLdKhZcVMz08xdB8MrRg2pDBFIUjuI8JrCKb2iMEFRNc4Fmv1eEr76xaARGyw9q9a3KCN4NpoB1NTc2duhD8FR+ussbVNTy1SsZAgp32HQXujN5d4XjXhrM6l+sxf5aNrhSBU0dZRXAfrdDDa9H+iOqgtnyowwXz/nWSRZ6y+PAWU+ipGxbshZ4I9mQeguvikrw+I2ysVPBEOa0iGgPDPccizNjFSqmkI7kjdZG4WEwmUT0k8WW16Ma8Kqy8r/laEqHN49YnIliBnoLz4/nydlWqCXJCvfXu7UlmQHiCr+Ax5mZFBvdELIRhZcholug0a4ZsXIneyfXesefmJm0FNioblZtCw+zdV5qls0nDi5iTbAD5xn5UWzV5YzybRc6gZPRtqiR3IXK+yfhyU+bwpNqNuZ44mJjRtdLSrpTA3AQPwc5dj2eFFwQeVTrPVydZXbUSAwNJjX3YC8bILjHD7LdxVsvavBbjo17F+rEGssGy9TzGo9ezYcJcJyFa9dmmgTgjwwBjvPnY7p9nL+20T0D6NRqEGeBU2R4lkU+sqyA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(1800799024)(6133799003)(56012099006)(10067099003)(11063799006)(3023799007)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: RGBU+RjM+20wvWumBOwwzGiRTEFple66NDJnaB4UbbXoUTIr/LMPZiB52OeY+QfKzx0BZwWiERZgE41iWAIBvkbYQ8w78SjszO/yv9VclF9svE7eh9D0Vg/D1JuY+OZg8AWeT4E9pHIRw4Uwze7sk5SuGyWxVekQCevOJHBnzrAw2sJ+q5jLEDFNQRy5jVYnPsmgOeVVJQyklV9mFbW2R39CJu55RCVgSWZqgS5jsc3BU0LeVZYNhhuuWAFgJA86SCYoBH+mhjZBXqe4qtjSyDiaCO0XpwzvBlmaAgjOjAUyKorYsGEctKDOB1wkzfzMp7OQcG0n5/ENFywMjoCsqb/iwY4rzJT8ZxbirrJE7raXR4WYyrMg7RmT9R7SNatHJtqDJW2paAhFxBJrNL2zhDiYjC9EonPoyJs9jTfKz5cNRVeY5wiwBED3hHAclZYR
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 20:56:53.2583 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c855377-6f15-49d6-3522-08df07a262c4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN7PEPF000000A2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7295
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

From: Roman Li <Roman.Li@amd.com>

[Why]
igt_amd_read_link_settings() depends on an artifact of a kernel bug.

dp_link_settings_read() passes strlen() of each format string as the
size argument to snprintf() and advances its output pointer by that
same fixed amount, so each of the Current, Verified, Reported and
Preferred records is truncated at a NUL written inside the buffer.
The parser rewrites those NULs to ';' and uses them as strtok
delimiters.

A kernel fix for that truncation is pending [1]. It makes the node
emit a single, properly terminated string, at which point the whole
buffer collapses into one strtok token: only Current is parsed and
the remaining records stay zero. amd_ilr@ilr-link-training-configs
then writes a lane count of 0 taken from the Reported record, the
driver rejects it as invalid, the link is left at its previous
configuration, and the trained lane count no longer matches the
requested one:

  Write training setting - lane count:0, supported link rate idx:0
  Actual link result - lane count:4, link rate:0x1E
  Failed assertion: reported_lc == data->lane_count[CURRENT]

Parsing by label is correct either way, so this can land ahead of
the kernel change.

[How]
Locate each record by its label with memmem() over the number of
bytes actually read, then parse it with sscanf(). Searching the raw
buffer rather than treating it as a string keeps the parser working
whether or not the records are separated by NUL bytes, so both old
and fixed kernels are handled.

Tested on eDP with both kernel variants: amd_ilr passes in both
cases.

[1] "drm/amd/display: fix malformed link_settings debugfs output"

Cc: Harry Wentland <harry.wentland@amd.com>
Assisted-by: Copilot:Claude-Opus-5
Signed-off-by: Roman Li <Roman.Li@amd.com>
---
 lib/igt_amd.c | 46 +++++++++++++++++++++++++---------------------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff --git a/lib/igt_amd.c b/lib/igt_amd.c
index 47e587e54..79052979c 100644
--- a/lib/igt_amd.c
+++ b/lib/igt_amd.c
@@ -833,10 +833,11 @@ int igt_amd_trigger_hotplug(int drm_fd, char *connector_name)
 void igt_amd_read_link_settings(
 	int drm_fd, const char *connector_name, int *lane_count, int *link_rate, int *link_spread)
 {
-	int fd, ret;
+	static const char * const labels[] = {
+		"Current:", "Verified:", "Reported:", "Preferred:"
+	};
+	int fd, ret, i;
 	char buf[101];
-	int i = 0;
-	char *token_end, *val_token;
 
 	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
 	if (fd < 0) {
@@ -844,29 +845,32 @@ void igt_amd_read_link_settings(
 			 connector_name);
 		return;
 	}
-	ret = igt_debugfs_simple_read(fd, DEBUGFS_DP_LINK_SETTINGS, buf, sizeof(buf));
+
+	ret = igt_debugfs_simple_read(fd, DEBUGFS_DP_LINK_SETTINGS, buf,
+				      sizeof(buf));
 	igt_assert_f(ret >= 0, "Reading %s for connector %s failed.\n",
 		     DEBUGFS_DP_LINK_SETTINGS, connector_name);
 
 	close(fd);
 
-	/* Between current, verified, reported, and preferred are null terminators,
-	 * replace them with ';' to use as the delimiter for strtok. */
-	while (strlen(buf) < sizeof(buf) - 1 && buf[strlen(buf)] == '\0')
-		buf[strlen(buf)] = ';';
-
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
+	/*
+	 * Some kernels separate the records with NUL bytes, so locate each
+	 * one in the raw buffer rather than treating it as a single string.
+	 */
+	for (i = 0; i < 4; i++) {
+		const char *label = labels[i];
+		char *rec = memmem(buf, ret, label, strlen(label));
+		unsigned int rate;
+		int lanes, spread;
+
+		igt_assert_f(rec, "Missing %s record in %s for connector %s\n",
+			     label, DEBUGFS_DP_LINK_SETTINGS, connector_name);
+		igt_assert_eq(sscanf(rec + strlen(label), "%d %x %d",
+				     &lanes, &rate, &spread), 3);
+
+		lane_count[i] = lanes;
+		link_rate[i] = rate;
+		link_spread[i] = spread;
 	}
 }
 
-- 
2.34.1

