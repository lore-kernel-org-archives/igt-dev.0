Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26829C98321
	for <igt-dev@archiver.kernel.org>; Fri, 25 Sep 2026 19:38:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E8B10FC24;
	Fri, 25 Sep 2026 19:38:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wMo4wRTO";
	dkim-atps=neutral
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011066.outbound.protection.outlook.com
 [40.93.194.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 679DA10FC1E
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Sep 2026 19:37:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t7r3hItAJ+c5VMQzbYCIAHWyd4j7JAPPiURHCGdGiPBuBHKI6TbcgsHDVmFpOMoE/tRm4lzoL2AaoQlqnZoeq+w3MPP3zgiyBgkTUpcDlBUVO1iBf8ypKhnxnZnm+eii1PVCqTlM1RJ0TOhrtntYYEDm2Wha43fBC4QEwGwrdnHKWEpeNXtFSNUx9b+2JHjKsfX8UHJje70UO5+Om9a1aoZwjHglZzwh5boRW74/7EzB/Qhr7doPkMZjbKSaenxY/nla2w2K3w5mjDoTKyLDYY55ep7DeAWJ2j3o3DlNsL0fYg593hfj/tLuY1suji3YYRAa/xmkOOz46jp6mNwVkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K8cJjis1ZRMJno/Rv204pXgM2fzE6PAN2xnVrNSkXLg=;
 b=W2rgvPMV3c0hPI2hfdPN1Eyl75Ggl765Gz1U9yVuvGqsiVd7B02BV72znU0izlsNw7tOOxLzNwa7hjMzCnwkREjSfC6rU65Rfpfa+RWJ//XMQHGAeA9ulHOtn128h8bNQxyCWpLeivmHIig8GfB+0ldJsxUGNsYiltWxveKy9pqYBwtW/4gs14YedFbcQC3kTrXtqLnQGmm5Ei3XzxQFb1mCMJgc8w2tSyPZpkoolNOylVxHwaIhnwISg7BYmm6MBJDJhkqM0/BmzYj/3W3/XHY1l+39l3FKCk3UkZlI5vFnRcY2Py7H81l3VB4eggM2HRCjCL2e0V0gew+HEX3UPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K8cJjis1ZRMJno/Rv204pXgM2fzE6PAN2xnVrNSkXLg=;
 b=wMo4wRTOJNJEo+AQKKVAIo6m+bZYf463dQ4Gn/QdowN0HEr33PEMutNOM59G6Xr0592djQOzrXNK9Rlh0EA9I9vdzac+ARrsS2EQgTvOv0/TcEdAZ7cE90Gne2G2SLGKTm+guYPjLm1fEUS1KjERM43msZxoG+6i/b2G1QdLGew=
Received: from SJ0PR05CA0016.namprd05.prod.outlook.com (2603:10b6:a03:33b::21)
 by CH3PR12MB9022.namprd12.prod.outlook.com (2603:10b6:610:171::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 19:37:17 +0000
Received: from SJ1PEPF00002322.namprd03.prod.outlook.com
 (2603:10b6:a03:33b:cafe::71) by SJ0PR05CA0016.outlook.office365.com
 (2603:10b6:a03:33b::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.8 via Frontend Transport; Fri, 25
 Sep 2026 19:37:17 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002322.mail.protection.outlook.com (10.167.242.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Fri, 25 Sep 2026 19:37:16 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 25 Sep
 2026 14:37:15 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Alex Hung <alex.hung@amd.com>
Subject: [PATCH 2/2] benchmarks/tools: Preserve string const qualifiers
Date: Fri, 25 Sep 2026 13:36:42 -0600
Message-ID: <20260925193642.2627600-3-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925193642.2627600-1-alex.hung@amd.com>
References: <20260925193642.2627600-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002322:EE_|CH3PR12MB9022:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fdee97d-41ea-4c22-579e-08df1b3c682a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|1800799024|23010399003|376014|82310400026|3023799007|6133799003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 1uxcNSYgq8WKUovbKErGIWbmbNSxLXrhlthJI2Vk9RNDifAPejWO0oJp6jvuBBd85fkms6d2H6ftZymlU+tobFaNFFbUwdu1pdazU2DfdStu8zE+aXKWrewun20TeFNqSKPdpFgOs5wRqyECfmKKEtDquIzGpBiuBqyhONXEkf32pveZxFScVdu1xF12ysQxDX9zWn2S6FayD7MVuUEgvXyvx3hTkFH2DmaA7C1nOOeAd+KfJ8oL/M775Ol/TdLmHG+92h/JpmWqOKR8NbedTmGDsh33Ckird3Xq+vy0FxCW6wl0oj0OKnsuvXuxLfB3oMJy4zXG99CNpE/eybytdUFqu6+r7smGtXTC1QO6WH3G/AKl6HEOTZiGwhSTcGA+TX7MtYenbp866+MNfAw89bGLS5huYgtdIjwGgXchuZGBNPs95SS0QXnM1cV5OyOMvBldMWx0jjj4mtX5f5JpMBY7P0KQZy/qlOboZM0QXPwzMefkuolOQpirBZPnsLnYguJXs2NbbzSap4No7oqEfQ+IbYFQDJwxSEsEEGHj3rIIrvx79i+YQI8jMeFJRsE6ECdXYTCeEQ/voLBQJOXkhC77ge9rjY7DMxSmwE5XVeurfL2noPFYC2ruvfjZb3y0nQyr4w2i1Z6Q26p9G83+71hf5h0gdqtWUxivit88ubVx1WJmhMarhicbOiHknJCqnr4XywJVvAL2d+hwdE7vbQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(1800799024)(23010399003)(376014)(82310400026)(3023799007)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: rKen3V0Pwr6s7hhZEDyTNIC2FIEVbbOc4tyl3vUwI6MV58/RQUUw94DDbL3WsiLMd1ovBRHoX3C1c1tWmVl9ineI1ypGc/FLQQuDfLnOwoT9pK1ZjPymsDBM/+ebesWbyBvK8sHpU2IBEkFsJcJpXLz4jLjN6Jm3DE0Gzc49eegiil++lxBV8KAS18XLtyO3Fb2hr5XzAtm/4dGDoRRycKq3VKAgoifaG7xog4QvdI0pt8eSDdGwcFMZOXpWykoHva9uLKLMfna2WeQKiknQnXlX4URfH0+YFgmO9S/hwb905qm6uGwW/w6WIs2FKBFdWvP2TK+BeZUoqTwoeM+Eb5AZjv4A9DLETrdyUSmi34cG9+q4Tq7nBZQ3eagKgLKpxhFD5ITm9LYDN1ZQDivaF024mGGk8lR/jZdwUQr/0m4vTu29zF1zcKuTDdI16msN
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 19:37:16.8471 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fdee97d-41ea-4c22-579e-08df1b3c682a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002322.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9022
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

With glibc 2.43, string searches on const input return const pointers.
Storing these results in char * variables causes compiler warnings.
For example, str_to_engine() reports:

  warning: initialization discards 'const' qualifier
    from pointer target type [-Wdiscarded-qualifiers]

Use const char * for string-search results in gem_wsim and
intel_reg_spec. Keep a separate char * in intel_reg_spec to remove the
newline from the allocated filename.

Assisted-by: Copilot:GPT-6-Astra
Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 benchmarks/gem_wsim.c  | 2 +-
 tools/intel_reg_spec.c | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index 1a4139279..8cdf940f9 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -587,7 +587,7 @@ static intel_engine_t str_to_engine(const char *str)
 	}
 
 	if (str[pos]) {
-		char *s = strchr(&str[pos], '-');
+		const char *s = strchr(&str[pos], '-');
 		char *endptr = NULL;
 		long id;
 
diff --git a/tools/intel_reg_spec.c b/tools/intel_reg_spec.c
index 632db6b9f..e51c90ec9 100644
--- a/tools/intel_reg_spec.c
+++ b/tools/intel_reg_spec.c
@@ -228,6 +228,7 @@ static bool ignore_line(const char *line)
 
 static char *include_file(const char *line, const char *source)
 {
+	const char *source_dir;
 	char *filename, *p;
 
 	line = skip_space(line);
@@ -239,9 +240,9 @@ static char *include_file(const char *line, const char *source)
 	if (!filename)
 		return NULL;
 
-	p = strrchr(source, '/');
-	if (p && *line != '/') {
-		int len = p - source + 1;
+	source_dir = strrchr(source, '/');
+	if (source_dir && *line != '/') {
+		int len = source_dir - source + 1;
 
 		memcpy(filename, source, len);
 		strcpy(filename + len, line);
-- 
2.43.0

