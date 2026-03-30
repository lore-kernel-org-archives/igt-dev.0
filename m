Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B8CB1061B0A
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 15:36:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1ECA10E6E2;
	Mon, 30 Mar 2026 15:36:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FhjLeTUV";
	dkim-atps=neutral
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011063.outbound.protection.outlook.com [52.101.52.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A0910E6B7
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 15:35:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FDVsov1j4L5jEzcGnLC0wKF1qlbZhJfzU3FHfbNmOSSX/hVU+HoP2biWth8k4n7hJn6iwWiB7SMmkST3ZlCAi4jRz5gmISVOxrsoAoD4NBfw3XkKl4OGMH5Hi1xgQHbI7kb0dV2b1ag1vJh/rCh94TzPFTmUyK2hjp928mpJ15F1FSAFSh38QxRzzUjCa5IW9h4wW6vdoii8Pl0yXDjTKWaEWLrh6T3dT/TlkXkoUpjpXVKD+DpGcR7q8gTKtu3L77qNErRFBFZP//1uHHetJLvksdKS4m5BWE9rMGmE88naebGF4Fn0Cq+EF0+Mkkb3NFdXNwa95iLReA9634IL6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K3MVvLEKlsArVRt2dOczJ1RbDe84XNlq/VN9XwZqorc=;
 b=itY+3Nzxt0uWpbM9JI7SmvW1Kd3V+cQX3pIOr0N12/2VKNJsZmPhC7tSlS8v3lQZ8DJMOSpnE9iBypm/RRXLkYqUkOr9W5pPLPBnQxQUuV8h7bRxmrsH00tsOi4diNe56qhiw81QbYsu8veoHCYPfO/SW0UeRmHhu+irSrJlkFMRS0NogwPjW13f4GssRTGkzhXiwcCHpP1hfUNMN6IQbM7syN1OPYdAaJ1509iQ+Jr3zXyhuYIBuwDHgqauyK+Rl9onOp4EIusC8om7xlZaHz5MsBTvI4oO3NUxiKykpb9il9BN6MPP883GXM1Qv0vpuKxFll7stI6B5YXDusN/Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K3MVvLEKlsArVRt2dOczJ1RbDe84XNlq/VN9XwZqorc=;
 b=FhjLeTUVetqRPF8w91PqAj0r6og2njHLgEQ+9ntlnYAbE+u9c1ch/fsUMsKYa/qFsd3J14NvsA4XeJY+255xomCiKbCKIAntM9/qiOzrTXgYhcqqmQgY4BmKTd6J5BTuQxtJGvh20meG/P9aWKAWo5qjCQC/rHIEvww0LW02QSw=
Received: from SJ0PR05CA0086.namprd05.prod.outlook.com (2603:10b6:a03:332::31)
 by CY1PR12MB9674.namprd12.prod.outlook.com (2603:10b6:930:106::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 15:35:27 +0000
Received: from SJ5PEPF000001EB.namprd05.prod.outlook.com
 (2603:10b6:a03:332:cafe::f1) by SJ0PR05CA0086.outlook.office365.com
 (2603:10b6:a03:332::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.28 via Frontend Transport; Mon,
 30 Mar 2026 15:35:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001EB.mail.protection.outlook.com (10.167.242.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Mon, 30 Mar 2026 15:35:27 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 30 Mar
 2026 10:35:24 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Mar
 2026 10:35:24 -0500
Received: from hwentlanryzen (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 30 Mar 2026 10:35:23 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [RFC PATCH v2 05/11] lib/igt_color_encoding: Add XRGB2101010 format
 support
Date: Mon, 30 Mar 2026 11:35:12 -0400
Message-ID: <20260330153518.99898-6-harry.wentland@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330153518.99898-1-harry.wentland@amd.com>
References: <20260330153518.99898-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EB:EE_|CY1PR12MB9674:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a65db55-d0bb-4ca3-942a-08de8e71f7fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700016|82310400026|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: M+9UYcy1BtvwqHQqo7LByMMKPgEPAIbRrFl9zZ0dem8C/05mxt3Kv5YU7NkbZ0aujrOksk83dChyVu05I1jLVq66fZUZhezOgaspu4VC43WyMp4V4lU7H4DQCo4GVBbVsiDShGvyL3MjVWIHOLOruyLKB6usrjVUa1H7ElfeZKBUjFpAS+r0t303GXC+P1b8eiL8I6Qjj8Gok3FIUr0nLqWLJlZNwqx2e51rtqCx1oo+DnhyGSVxejAsSFlDpPEs7Eva4ZFtwYwangLkF633t+pgomE2z0ChszCbFQz9M4MfJ4qtenxlNUGIB+lGs2Sux2KnoDxeZEe8IA8/TDZEbhWFrGdAgH/Q457IGbob0p4K/tB6KYyzHWxWcySZ1zi3rSpaAPF5/QY4kY+dPJqZPUGydRUSW7USg/Llq3MlXavHTji8nptWbHMylQ7gh55IvRdSO4p96z+0er28T7SppTcEs+0hP5ye1JgzZAXZRPJ/NfEtG51ykoGo/9nixS48TrNRjSW0Ds61IgFEmJDQUblkVSWUjrSHpKhFzWeUrE0YAMYc++oSSoCNCznKJ1H0NWnTg1NGRNo3elcCTSE7lC6SaTggX00ZDFmN87L0uHG+CXk59hh7cSHovhw+0wLWf5BBSWnFkLZ3Dm15yU/MGvo6sCtove57aWvBFGyl5TjMecL+yQVzrbKOqU0hBkEDx2OswGaQ4dI/dUyaWRs3d1S4bSWyGATL5a1Z/rYWjOd3kGFClGeledVPVKsLCLLgZ36lOaMry/0zxZS73mjIWg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: bIG+XbYkPF+XCr0kKOBDL4Q/jsGSp6GZVFxqSbKzE6IicNdA016EJ+1wx7obNBU6Hs37JGvxwWc8vEd0IekVdVCamVzGePre+QOo2JE+WOha5lL02AbRzGXBhFxXZ9MZNWxC9I6UaGrkqNpDyFhsse8HDNLyiyGJ+HnzT54OrhSWu3/w3SNSj/eSvMaMF+KUmq/RPm5YlYwV1+MtfkN71sepWwharb4GWvN0jdaldIXD9UBXf3rmuWmvOCa69qKSi73atNB+TxsBusttE2CkUSnCDukf5KPU4CudXnRuAWsaBUr3dIJe9zGpA9PHvbWeTmtOk6DXAEmiIiPIHg+Syj1Tasa3O48oX15AeRT3HWL33u+7Nqvig4G/a/mNCXEShACqzyI4fT2Bp7aobx1bO7Nn6gaR4UQLt/1bmyu4VYDHg0GilawVPPNLLcVP4ysG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 15:35:27.5391 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a65db55-d0bb-4ca3-942a-08de8e71f7fc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9674
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

Add XRGB2101010 (10-bit RGB) to the color encoding format list. This
enables proper color encoding handling for 10-bit RGB formats used in
CSC testing scenarios.

Assisted-by: Claude:claude-sonnet-4-5
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_color_encoding.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/igt_color_encoding.c b/lib/igt_color_encoding.c
index a7bd2b22f73b..7df6b55ccc4b 100644
--- a/lib/igt_color_encoding.c
+++ b/lib/igt_color_encoding.c
@@ -135,6 +135,7 @@ static const struct color_encoding_format {
 	float ofs_y, max_y, ofs_cbcr, mid_cbcr, max_cbcr;
 } formats[] = {
 	{ DRM_FORMAT_XRGB8888, 255.f, },
+	{ DRM_FORMAT_XRGB2101010, 1023.f, },
 	{ IGT_FORMAT_FLOAT, 1.f, },
 	{ DRM_FORMAT_NV12, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
 	{ DRM_FORMAT_NV16, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
-- 
2.53.0

