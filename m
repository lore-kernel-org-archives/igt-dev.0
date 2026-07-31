Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD1D9C5516D
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jul 2026 18:02:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E74E10F36A;
	Fri, 31 Jul 2026 18:02:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bFrUIyd+";
	dkim-atps=neutral
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013030.outbound.protection.outlook.com
 [40.93.196.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B788510F36A
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jul 2026 18:02:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LcRGp8+r9xduRTUHBaKnUviGMPsiHKS3Jv77+7c4L66OeL6RsyB7iD769Xqc5aM8m77HIjd6kNDlVB/+dl6J7rXQ9TWqX2g6P46Deo3mkqICEo4xJ+2vb56iGxhpL3vmOBPlt1ZIcb2O0Phlo665boq99mncKvt/bdFrQimPjOn/zT08ZbGXduRzpG0o7wfKmYwoDtyT59PyM2JNSWJomaCjN6+XWwbXOQ0TlNRAo8ww2q6qVswCJj9yuwi6qQp+yl1W3Hz1iPlQQCEgOnRlSfQXMY7kQjzLQ9MDf9xCUdsHT/X5FSZMYrnrdY40pahZQ9dqsBkXGlFYv9YhsupHew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sZnD2p+Nd+8NqTR2YUYFFfGCUhCHTS4RCsHs5XUMNnw=;
 b=pbHiWSBNUbCs7eMg+ZnT/8tkBjdbUEf3n7/4EatGse73tahG425fzEx7PUa7PvoaKiQnEg6X2reThhQxgnYBWSkt9mSkXiElUECgbdgQvf+tU4nXJgj0trKyU9nd9r4ul14ndMZG4qD+eNG0ENDSSRF6Kunjdz5xb3GYArkpQok4kAqqacAWRfQ0TqsMXz8WhQimgkq4ll0yLrJ+nm3TwUXkuEd23iHGakW9YcYk8xvv5bqzFIuUL866I9rU5jaCh0vFxEV6iPHozfl1/Sq4sIpkqBOpVIrUqkdAhmfAgc8kdPYnPfWHCRvNOMi4x1pMD8G7VPgtzBHf0RgwPj1o6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sZnD2p+Nd+8NqTR2YUYFFfGCUhCHTS4RCsHs5XUMNnw=;
 b=bFrUIyd+3AyBus2wV2UCzjO0TN0/y7o+dSzmJyB8j2gR+tle9zG3wx2MQIZNJLlS85o5W+9EhQvwYEIjYMq0xTnsjg4X1LbYj7MZbWw88AClEMGuAuHlKDFbb7lkQrV3yXxzKG4c2C8kIkRo2OYDNWgKjZ6fs0pUwA/nkPr4FsM=
Received: from CH0P221CA0037.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::12)
 by SA5PPF06C91DA0C.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8c4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 18:02:09 +0000
Received: from CH2PEPF0000013C.namprd02.prod.outlook.com
 (2603:10b6:610:11d:cafe::7) by CH0P221CA0037.outlook.office365.com
 (2603:10b6:610:11d::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.13 via Frontend Transport; Fri,
 31 Jul 2026 18:02:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF0000013C.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Fri, 31 Jul 2026 18:02:09 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 31 Jul
 2026 13:02:08 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 31 Jul
 2026 11:02:08 -0700
Received: from hwentlanryzen (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 31 Jul 2026 13:02:08 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: [PATCH v4 01/10] include/drm-uapi: Add DRM_COLOROP_FIXED_MATRIX
Date: Fri, 31 Jul 2026 14:01:51 -0400
Message-ID: <20260731180200.668795-2-harry.wentland@amd.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260731180200.668795-1-harry.wentland@amd.com>
References: <20260731180200.668795-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013C:EE_|SA5PPF06C91DA0C:EE_
X-MS-Office365-Filtering-Correlation-Id: 34c87bea-9ddb-463f-997c-08deef2dd714
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|56012099006|10067099003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info: IhKlBpUsgOuvW9SQQCPreGbpVcvJlDi1jdsomw8h1eraPyl+dvwR8RcYRUdpRnno5WgpoLwNqsB1+OBPn1d/A0EhOMQzlbO/IbkEccCSwejWvEfOK4tSL+FhQQhUasklNwacX9sXRzbfOdow6XqK8DPinsVmuewklu//mUy2cMzZsV0ET8kkg5KsI03kpWAoowG7pftBaARqqAKH9qyharvcN3xCOHB6kkaDAieC9hZkd22gLn2xUG1CBgIbLLcAEImQ/QIM8cv+NQUaJ8lJZnWv+xz8gCO5Fq2sWt1OwgBeXtdlZWIcsJwe1Lso6zRXJA/MdNJMcLHQbGF9ImB29KfK4/AwKaA4vqRFOJLOPiVTvPl6Fvn/rQqcuEA6/ecFOuI3KHZc4yzXrvJECxItnC7tRf6T3O9xOdWATCbdfAwPHC1MtKRfqfUSpl8y4xSOJNLo1rTOSXPtykrUQ0hqrAX1RPAQjpLTjqVJjOeOKSGptCbYMiUaJVv3leIi0NhiHCPQGls2ZO4TLB+BVMKsuzYh3F11srS0DtAloHHzOC1DxrwQCBWgJPiF/6i4d0eCel2II4WlsnAa/D5+RceWfID9WM60hmRCmxaFy8FdUN5mebih/XmStq7u+vXAOSCNnAeX6pHNTJgO+ZhEgOF8PdOiRRfRU3iLdsHN62w1tT/N3ZMS1fnLuyiHGu89XEmetDF2uP7o58aHR1a5jvSGSQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(56012099006)(10067099003)(18002099003)(22082099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: eepce+4/b+YEOZP/ixXnfYtiKLFDueyvm3dlVec+sQSfLq2kgHL8ngry1Ln0vgozq3kLq7fobjj7jI1vxeFjHaWkwrGgBpIBtGP9Qe5gHyG7WQSh0ZyF8V/0REwp2lI9vw98BUC9f/i5dWFsSvbPCYROaSJXi8kY8u8b7LOdTNf8hIa2TJWluyV3B7jeEWN/b8YlmA4pPqiq0V2ujb7H3FS0BJQzJDhnnfCzk2WBaukgEGdGDpjakjRnQOmQwuvsaG24J1/BD9veReRbIjAFMa8CvBN3AWRPA7yl1W9+keveCt/Jz6w2YrwLwTV944S074y/qMTR4WNRJgX436tdKkMIJNOUpiEIotfLFR5H2DGboR/rJ2L0vBW1D+sUNujs6/m6hsVF0o1/QAeXmrKVrIQifXjOUAWG8qh2hoRHSgxNf37k9+Ids8Y8e+A6yMWg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 18:02:09.3646 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34c87bea-9ddb-463f-997c-08deef2dd714
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF06C91DA0C
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

Add DRM_COLOROP_FIXED_MATRIX to the colorop type enumeration.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Alex Hung <alex.hung@amd.com>
---
 include/drm-uapi/drm_mode.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index de10ce859fdb..0924e38af09c 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -934,6 +934,17 @@ enum drm_colorop_type {
 	 * LUT size is advertised via the SIZE property.
 	 */
 	DRM_COLOROP_3D_LUT,
+
+	/**
+	 * @DRM_COLOROP_FIXED_MATRIX:
+	 *
+	 * enum string "Fixed Matrix"
+	 *
+	 * A Colorop block that performs a pre-defined matrix operation selected
+	 * via the FIXED_MATRIX_TYPE enum property. The driver advertises the supported
+	 * operations through this property.
+	 */
+	DRM_COLOROP_FIXED_MATRIX,
 };
 
 /**
-- 
2.55.0

