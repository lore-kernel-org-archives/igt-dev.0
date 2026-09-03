Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B5DC61DD3
	for <igt-dev@archiver.kernel.org>; Thu,  3 Sep 2026 19:26:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF99110E172;
	Thu,  3 Sep 2026 19:26:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SPgLbs1r";
	dkim-atps=neutral
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012070.outbound.protection.outlook.com [40.107.209.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C7AA10E172
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Sep 2026 19:24:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a/W4KwGm56OfyCZhV7cYZQlRQu4RJzAvrpy+qHq3vfEIbjy92jwLiQToWEKj+J5VPu7RLgsux7FdvpSCQHuEbu2b1i+Rt1ZJUUXwWSIFdk+C0Cic1ryJt9xs/yb+MKPbE2IT40iSJo7NvJFOPCtPFRZeRxMJxjaeiL98paAEa+Kc/gPQ9OciL+jFnblBMLD73nGIqiJIb6PcvhArrgSvpKo/3OOeyvtDyWgixbwqkFA44Q4EE5CQBmbkVVkOgx0dZTNz8Akd7+GQ6s+f5rMQvEh9vg4WIQYxTd58nT2IYSeQVFRi/4uMqTOciTqvXA+PVo3wlAJwULzofab9Hs07wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HHWNKhwlqUKnsy5YpvEaZnk7tTxuozveJMSyunK+FhQ=;
 b=nxS2smEiqRwb0vVJng1y9+AnJea+t77wG+8ZSpXfgJ3DQ6/djcCTzIzlDeU51jgtrLAXfAnTTKMtUnBcFoeqRa4oiKcYVUvzZkmNbKLsxODMf6FdJ2zhrKHyDjENscfC9QnXMIOt11OCJYzwLREFJRbnyOsX6xANmQ7lxBIjq/m67p3Suk9I6ob9lVavV138TDBjsutwhRcL8CY6MrWJGJpLk345hQ9iCzd9FL+2s+DcUdeOM2kr9H0uJ49GMHpLMNpgm9nf2LK8fUio95eT17j77oweFWJB+7J4mvpmioudGRPyzAbe04Fv5vWSW/YkiIUGe8v0GeP13YY/8TEarQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HHWNKhwlqUKnsy5YpvEaZnk7tTxuozveJMSyunK+FhQ=;
 b=SPgLbs1rygMvU4p5bM0N93dgXJu+aPfZfd1z61xEtVTGhRDFLXX9tytbs8ymtEvlcWkJUMcPPWLg5llLYGC5Oqdn4/5I4i/jF1aNYhQ3XNKK8MQmgobhXesFatAcKftYJhMjbCPtVgtULUeJzK4koS+AfEU71r6NjaB/2ypLU98=
Received: from SJ0PR05CA0094.namprd05.prod.outlook.com (2603:10b6:a03:334::9)
 by SJ0PR12MB7033.namprd12.prod.outlook.com (2603:10b6:a03:448::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Thu, 3 Sep
 2026 19:24:48 +0000
Received: from SJ1PEPF000037A6.namprd04.prod.outlook.com
 (2603:10b6:a03:334:cafe::9) by SJ0PR05CA0094.outlook.office365.com
 (2603:10b6:a03:334::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.4 via Frontend Transport; Thu, 3
 Sep 2026 19:24:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037A6.mail.protection.outlook.com (10.167.244.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 19:24:48 +0000
Received: from georzhanmkm.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 3 Sep
 2026 14:24:47 -0500
From: George Zhang <george.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Fangzhi Zuo <jerry.zuo@amd.com>, Ivan Lipski <ivan.lipski@amd.com>, "Alex
 Hung" <alex.hung@amd.com>, Harry Wentland <harry.wentland@amd.com>, "George
 Zhang" <george.zhang@amd.com>
Subject: [i-g-t,
 v2 2/2] tests/amdgpu/amd_dp_dsc: Reset link settings after subtest
Date: Thu, 3 Sep 2026 15:24:52 -0400
Message-ID: <20260903192458.1149302-2-george.zhang@amd.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903192458.1149302-1-george.zhang@amd.com>
References: <20260903192458.1149302-1-george.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A6:EE_|SJ0PR12MB7033:EE_
X-MS-Office365-Filtering-Correlation-Id: f862903c-5e18-467d-1573-08df09f104d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700016|82310400026|376014|23010399003|10067099003|56012099006|5023799004|18002099003|11063799006|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: XnvbdLkwaGQov9uCJTz98cbucWYtc6l0x6XJoMeIVdMcudDFaajDAmUWv/6cTyUqZjuDPcXKW6XtLsQh453Ctgcj+RHTyHelSKotQtotqc0EtbRS+8Ru7SboA93cYfkcer0Azg7RJBfRxUZcGB8dtoozQT+vJabvzggVS2fC7oSVexoiQfm5eC2tQHhzE0InkDMINpft+bvXGe+iD5roybfG1fIcwuxrsvFiYiI979e048ZKglEuf9RnyP2ms40RCWdN+Cxf4un+CzcQ/Ljt5Oe0FHuXQLRhMjGzoM3PUCSK0IjPyQ/15FsVnORFUuQ8apXZWxYzlRJA2j3NAR+tlXcAsNVEJDWmf6jcHJu4LEajii3OdmBRQNf9K6A/1RbiwD93xcVSYSYpo15EU6aQuRQF2tndvdxCY6XpF0VKlVb2O/Gq/wmDqJnP/9siusVgBMbw6+yV02IWVBBl7yalFRPYSWP2r79Xcbp14mKyomuN4DEu/BhlZBD8I4qC9iOX7Q/wYj+5g1K32f7BQxkceAkpGnGL72slviGH1btP5fKxJUJrUFFZL0cGBLeT9w9hWN2jWg23BbCZQ6kL74NzK5dZOHXok9YpMxhctMgTefAohKiTZqHiF8XwxjpUwc3eJijynMLtmeUKS2WsGskHcDzIOutxX+K8/Hnf4lICc8k/4UcqnY4YZ2rcXYen6ZtxXGeO6dtXrHWHe7EFLLDQGA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(23010399003)(10067099003)(56012099006)(5023799004)(18002099003)(11063799006)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: BKwG30FhSCmv8FDDGxDvc0LEO+CIFmg5iy1soRyuctgQWQAM9kYQGDKRGXt77tkCJCf0RYkYcTf9aWe0OruInyTQp4cE1VacZBAEVE0kklSfbgXGrzorJiPS8Rg4ZVt0VFHt/bdiVxXWVvVL27uW5BeJGPvsjzbC18RVG7Qw3ayHtuBwknct8BeD2gxYsufZyA3AjC+nC0f4LJJ57lwvDtsiestrc/FapA+m99Qng42qS1fLzK3aWZL01cGkvUD8cBk2Csk0PpUCSNbb+CY6ZMADlMur8blvvnf6ub5MQyhA8kpR4/LH6RV2IuAG8aLsXiSu6tKDGL+DwKhmHwsf0VyNGeKYOYQig80mSKdYSph9tF99r0gofhRh61bwcWAA7taxlUllNwpynyd5UZ0/Yu3NR2dRFxBfmguNxm1pr4fiY0sVYU8BOMF2BS1AvEch
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 19:24:48.1442 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f862903c-5e18-467d-1573-08df09f104d4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000037A6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7033
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

Currently, the link settings persist after the link settings subtest,
and can retain a lowered link rate/lane count going into subsequent subtests.

Fix it by resetting the link settings on an igt_fixture after running
the dsc_link_settings subtest. We can do so by setting it to lane count
and link rate unknown and letting the driver set it to the default values.

Signed-off-by: George Zhang <george.zhang@amd.com>
---
 tests/amdgpu/amd_dp_dsc.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tests/amdgpu/amd_dp_dsc.c b/tests/amdgpu/amd_dp_dsc.c
index 690a6c39d..6c8e76e00 100644
--- a/tests/amdgpu/amd_dp_dsc.c
+++ b/tests/amdgpu/amd_dp_dsc.c
@@ -356,6 +356,23 @@ static void test_dsc_slice_dimensions_change(data_t *data)
 	igt_skip_on(test_conn_cnt == 0);
 }
 
+static void reset_link_settings(data_t *data)
+{
+	igt_output_t *output;
+	igt_crtc_t *crtc;
+
+	for_each_crtc(&data->display, crtc) {
+		output = data->output[crtc->crtc_index];
+		if (!output || !igt_output_is_connected(output) ||
+			!is_dsc_capable(&data->mode[crtc->crtc_index]))
+			continue;
+
+		igt_amd_write_link_settings(data->fd, output->name,
+					    LANE_COUNT_UNKNOWN, LINK_RATE_UNKNOWN,
+					    LINK_TRAINING_DEFAULT);
+	}
+}
+
 static void test_dsc_link_settings(data_t *data)
 {
 	igt_output_t *output;
@@ -609,6 +626,9 @@ int igt_main() {
 	igt_subtest("dsc-link-settings")
 	    test_dsc_link_settings(&data);
 
+	igt_fixture()
+		reset_link_settings(&data);
+
 	igt_describe("Tests different bpc settings and logs if DSC is enabled/disabled");
 	igt_subtest("dsc-bpc")
 	    test_dsc_bpc(&data);
-- 
2.55.0

