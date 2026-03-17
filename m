Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A71DFED9E7
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 16:05:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1906F10E6ED;
	Tue, 17 Mar 2026 16:05:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HNFN0NGJ";
	dkim-atps=neutral
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011001.outbound.protection.outlook.com [52.101.57.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D7BD10E6EB
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 16:05:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bi1VfWbGHnJtwTwSqV2OFSMEDjVHZ9Ha4R2vUmQ0uUVYjh+X4jzzBAIMoNA5YfzV4YOgfcIR4czTZb3vWiJSI9RMm/QUbkrZ/A0+8QEc1aOahDpqMMZzD0MMr+aSz4WIMQn6O4hTUOOsWQYNyioCF3LwpE/MBf2hqHTJlBcadebJxYDdVjKjAIZING5589fYZ4c4OASZ/Z+1pHdmlq1GH8m3rqAeaQ7ch9vJI4FAcyU+QZWUMI33IyQOluRZI0dZ3UeIqPvVT+DjAf39moBIFT+Pu/JikL0GMIFcsZ7HbZzenyhPCYDa+DIQmFoEcI+nNyzmrBCiJwpYo4RXOgNglw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5o1ddEx+Een6iVjOCDORT7X07Y0Zggt7htQdd3dXfWE=;
 b=a8Zhg1a3m2FSXGdXhvJQoQKj5cmfAUrCxq0Pe7UiQ8RG1P75X18fURF/McCGflOI13OMHQTzfBlDtC6wxR47qJPy7gzQQN8XZGjQxS6aMie6Rp/LxiJotuMtulTExVOQbmIbaYOJ7ym/R01qSIngQIW0rUDPfZw8B/bsOd2xp1XF/AVaIOWo7jzCTeSqNyuqz/OOGdaIpHVcXbokVUz/+rQSQ0r67l3539ERMAsYI3JizXzAE8/2UafU8xrk331oXKnbfMChFwuZzl7qlQpEgK7E0NK0bsSdgVEh3CrzvqzWR7HHG5zG1czu+GCyjOvwh06MwyT4GlGIRvQ0xbNodg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5o1ddEx+Een6iVjOCDORT7X07Y0Zggt7htQdd3dXfWE=;
 b=HNFN0NGJOXnjHMGhDh3ifyCSFWXoTXV75N+c6mSGbRb65e1VQRavI2uXMuQJneV17VLLD356/wJSqdzmHjYWG0WZhMwNENLN/Cs07195rlp74tdX/xOxFYt8zEgYdwRo0qNwJmkRTGEOgpUYziVxUw+bS1D8IYOtbh9aG3SdV9U=
Received: from BN1PR14CA0027.namprd14.prod.outlook.com (2603:10b6:408:e3::32)
 by BY5PR12MB4292.namprd12.prod.outlook.com (2603:10b6:a03:212::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 16:05:15 +0000
Received: from BN1PEPF00004689.namprd05.prod.outlook.com
 (2603:10b6:408:e3:cafe::50) by BN1PR14CA0027.outlook.office365.com
 (2603:10b6:408:e3::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.25 via Frontend Transport; Tue,
 17 Mar 2026 16:05:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004689.mail.protection.outlook.com (10.167.243.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 16:05:13 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 17 Mar
 2026 11:04:51 -0500
Received: from hwentlanryzen (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 17 Mar 2026 11:04:51 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [RFC PATCH 10/10] tests/kms_colorop: Increase VKMS bracket to 3 up
Date: Tue, 17 Mar 2026 12:04:36 -0400
Message-ID: <20260317160443.229812-11-harry.wentland@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317160443.229812-1-harry.wentland@amd.com>
References: <20260317160443.229812-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004689:EE_|BY5PR12MB4292:EE_
X-MS-Office365-Filtering-Correlation-Id: f8baeab5-67f5-4797-0788-08de843ef935
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: LNC8yF4sFAIEy128deX70L6fpJDKZfUdK2yQDilGmiE3euug2ZSFBiii8OcHSBUUnTMlB+jNXk2UGkCCZDrDva9TpKNXVm5+ZtBd5+VNGgFssIBxRrL9msKeTY77UKRSVsa/og2bmjhG1nTn5/wGJuNr1YPw5G6F2LepPs8Iv11wAIziqNe8zP0CFoRSh5bYoRwCZg+3Oa26ADw6tiJ9DwMgbYtAvRx00tgbFo5blVrfkR+7Zk0tbMgTMyQAxlzuqxBJG8wY6Q6jpsGsEChOu0z0rNZ6no2eW+yNXKvjkJYiNNhFaOruzwXzeDvJsNS7wenT7qD8U5IkKWWWba/fzcxnm8AzIOt8yzoATQEDZYpj1BFHKp3JkzEjsP42INKVz0jlh84eHzelKxCnnyB5zZtnLemSPLkPGM75LESthS8GodBPdzOMaz/TtTyDPH/8YGcfMCUac3G34xKgcFc8MO1EEfOKzOb5O8QiiUvbW9OGZnL6PWAYPQjmO1f0xxH78/JvfbfOl9vuQjxVfWWerjvV/o11BuYH7prNfMYe2E3/xUmxczN7BDOuwxP9QMFGnNb4INxUTlRiGY/Ap7Ds+M1wuEQWdWZfj8AkrZjRsleR0Xr2cjki1VhP4sTs7rQ32+6vfl+zubmVxtU5r7WEwts557Cp3n15EbToe1OhLdTqG/g979ImMVClk/KFiFlz332TlzY5DP2VGZd+QFBhisNPr2ZxfPA2NHQepZD9HK8xaAKpuISDTnNMqoG955ETbpG2UyWzMvU7Qy/ecXBGKA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: dXeGL4g9yJJpEaFkKYfl5x/EIHjy6SSUta0aJ7/ZkdoVO5hmLoA/kvhrcHjB5qsI12eFayWw0nchxoLaigFSftvuxCV/FDP2wRwkJMF4mSnvJOTDDvz++IhTu9AwxqGlh8GY8kEKtgMlNT7svTqkSkfRnWgjdhFLaVY4z45c3GuE7ST0Ii4F8mYqjIBpZOL1UYgceZDf+cdA9OdkB4KKS+qG9FnRYXa3jX3337Jk3OnFlMKnFQo6MWjuViTzfat2xaksKDoPR0QxBVqBFUltu5RILXhUT+sD0ZFyNdly7vvkp1ICy1VaxUWadsmb8jh59kQsJJVOiB6DRNoVI5zhA2Kl2LLZCMxR6L41wlbZtKs+V2PmPyxwtCR3z2Ph5g2BfAayOie0AuguohNNxSB2mxyOoWNZgxxiPf557mVw+xTWK1NfW+wICodFdlE18m7j
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 16:05:13.6615 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8baeab5-67f5-4797-0788-08de843ef935
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004689.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4292
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

The delta is a bit wider for tests of the CSC with other colorops.

Increase it to 3, which is still pretty tight.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index d697f2e19868..971577f28071 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -241,7 +241,7 @@ static bool compare_with_bracket(igt_fb_t *in, igt_fb_t *out)
 {
 	/* Each driver is expected to have its own bracket, i.e., by trial and error */
 	if (is_vkms_device(in->fd))
-		return igt_cmp_fb_pixels(in, out, 1, 1);
+		return igt_cmp_fb_pixels(in, out, 3, 1);
 
 	if (is_amdgpu_device(in->fd))
 		return igt_cmp_fb_pixels(in, out, 13, 13);
-- 
2.53.0

