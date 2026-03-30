Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DBFD1061B0F
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 15:35:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3B4B10E6B7;
	Mon, 30 Mar 2026 15:35:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yVqDIDHy";
	dkim-atps=neutral
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012040.outbound.protection.outlook.com [52.101.53.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 165A710E6C6
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 15:35:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J4ZLt3rL2HyAm05NDq+55iTEuk7zRliNDI7a01En3BdiqjB2gispv1VwJLM1yJit6QLNIwP/Tipp2+nPPMP5KcjKTPAl4joW86jcXgMHUGmOShrdYYuSGHOdQIranbAfiCqYSoXaAe3XRdar3qOSQNHrxWdyqaLvvQs9IVxLurGTmz9KWAgrO1i2JqR4TcsrGCPzSiGRqxpxQMxk02yrYyahKVfIu3EmPc0CiG7s9tPd7ERW5Y2wJwOm7NVE51ee1zGYA5a4OT2yaLCTLZAZfMCBmEUH3VtYsgFmCKBpsuHwUmu1iIuru3nBkHtkymzMUL/0AGhNwECQ9k6WDgzEpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZASRIUJQsjyRecPoZHCHTfT4qLjRIrs3fSq1ETSLPFw=;
 b=sPSCLQQZxAhQvNqWC0KOR7Mm/4doO8BuGZeMT2tSo/Nkg8pj7T5yPRqFf2970RDYUu+RnROYuwWeBvaHvDlboub+syIKE0AoOAG8rQ1iU7l3TQJlziWwt1pfF0mVgWlYOzamAehrYO5TDMBikipw3QJ3imxLS+YOF1LOcjkDz6gtG0r/QA4AYUnUHBK8xaWvk+HD9BI7eyzV8hFgyc5vXFF3zh5gb/9Yn9PSzhBIhue/pcEddPtGiJpeZT3osX13H0iWLYF1BDMk7Pn/co1+dYqwHB9iNUsabDvbNOBYWHP2k2jpGy2iJxNxGLYA/SUMHSKmo2YEPbNTRfZYti0vNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZASRIUJQsjyRecPoZHCHTfT4qLjRIrs3fSq1ETSLPFw=;
 b=yVqDIDHyTRvM1RJHNk3RndelkwwnXunXnpt4w5R55gl4Vdsjk65KpR2EwIaejx2dY4R50EBrIuwi3K99Mw1vxb2aGoXThAd1MGT20TgpoNmStjx8MZ9JodRrJwC5d6dohlFMU2f37xteUT5shoA2pzsh+ddO3tB/yea5MDtTFLM=
Received: from SJ0PR03CA0056.namprd03.prod.outlook.com (2603:10b6:a03:33e::31)
 by MW4PR12MB5601.namprd12.prod.outlook.com (2603:10b6:303:168::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 15:35:22 +0000
Received: from SJ5PEPF000001E8.namprd05.prod.outlook.com
 (2603:10b6:a03:33e:cafe::dd) by SJ0PR03CA0056.outlook.office365.com
 (2603:10b6:a03:33e::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.28 via Frontend Transport; Mon,
 30 Mar 2026 15:35:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001E8.mail.protection.outlook.com (10.167.242.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Mon, 30 Mar 2026 15:35:22 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 30 Mar
 2026 10:35:21 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 30 Mar
 2026 08:35:21 -0700
Received: from hwentlanryzen (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 30 Mar 2026 10:35:21 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [RFC PATCH v2 01/11] include/drm-uapi: Add DRM_COLOROP_CSC_FF and
 drm_colorop_csc_ff_type
Date: Mon, 30 Mar 2026 11:35:08 -0400
Message-ID: <20260330153518.99898-2-harry.wentland@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330153518.99898-1-harry.wentland@amd.com>
References: <20260330153518.99898-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E8:EE_|MW4PR12MB5601:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fa88bdd-1d71-47d5-5a41-08de8e71f4f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|376014|1800799024|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: CrfGevwDFdBpDTudQHP4sxvVW1W8GdiaSwufnkiD4jv9RMYqi2dSrb/XJynit8K9H0TiqiWroiF0CMDPCaXbfAIE67H400tTmAoUYoLoXlYx5sUbhv103ep3GloFaxzoCW4GJzQwQXv9OlUeyten0VrmkM/yovqk/HoO/rTWnxbpakJg/YBqNyWPhv/uZ8lGnTYVU7MAH1KPdhY0nB8ZLDhtFPSYDR6PXl9hJV+zJq1rF3F5V3l+fOaZnGXFvzmZ99R5gjRyf8c+TarPD2zE8A3xpiMIHgDi54/lVAFfGCaTYaDe68eraCMh4hebF/IE9VLADyAJmRN/9m6k9mCVqg0t7wbzY4sSB9Olb0XncKqUsadsSEt/zRYqzztOPie2KgfDjxBSFj8WbTj+70ds5Ykwnl+ipIMPzx2Q/5zvWDRdmgCW7VEJWelq5ovvSZxE9tbfR5j2tHDj00691YpS1pX8VkgNewa0nCGLCT7SgOwr/qdiYP17u5qDSw8z4FCNjW4h8ejmWWB7qIG5QNeBQiyZbZpjyu8qlKvhFBc3mJelT702qg/SnBSGag3mxhW1OxIusVN8G3dfUK28naFfRmG1V/nhhxiSXjdK0OkGe0Iz0t6hzYYhFIUpnflCLlrgB6l1yR12aKUPnvPjKTywfFXUsxGuSgm2cTk3sA7BKAPdKF56YcwEw5mpvOJa8jujbIfnHM2QAiXoq4scWlg/W0gwzkbcfC4Mgl/brDIU984X3m98tpj4OJwnYsn+v060j1Ct8kt+mMQzsrv9Glgs7A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 9f8XHm7DpgyCw5mUrjdfdDSd9dlgmtPoFl46qDXUBHn6e74DSvhyidxhKWeBdMC99LL0KYO7JPJI19ZbtQXWSsFenMHs1jW8ggL5NArh6jYSEufmUE30OxoMb1AxLjrh9P1Eu3t6XB88Ft+88uHE2PKow51QYFfbng143aLOkSzz8CLruMnitElHttKz5Rk5eVuzFgwGVmHNPJn0CIqvLyhjCWkEPcErY8UsPMOgI6TpZ7HBYTF592yq6OaSu+Vxk5v4Snqts/sIpxDvDm3BKL7otW+yqc8GDt/RtuQAjF2k5wYiahl2KHIfTb2fr9Iq5u1J+Id4O6B4DaILuLy4QuN3V3xWczN4yvapBCImZNIuXEYUCrAAS7szbJUz3P49h204DPU8fRnp0YnscPs2vVmhiar/ajHHSKOfcig9iE+9JWadHq/bReATgkR1IpPA
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 15:35:22.4310 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fa88bdd-1d71-47d5-5a41-08de8e71f4f5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5601
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

Add DRM_COLOROP_CSC_FF to the colorop type enumeration and define
the drm_colorop_csc_ff_type enum with the supported fixed-function
CSC modes. This includes full-range YUV to RGB conversions (BT.601,
BT.709, BT.2020), limited-range variants, and RGB709 to RGB2020.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 include/drm-uapi/drm_mode.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index de10ce859fdb..2716f48c18ce 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -934,6 +934,31 @@ enum drm_colorop_type {
 	 * LUT size is advertised via the SIZE property.
 	 */
 	DRM_COLOROP_3D_LUT,
+
+	/**
+	 * @DRM_COLOROP_CSC_FF:
+	 *
+	 * A fixed-function Color Space Conversion block where the coefficients
+	 * are not programmable but selected from predefined hardware modes via
+	 * the CSC_FF_TYPE enum property.
+	 */
+	DRM_COLOROP_CSC_FF,
+};
+
+/**
+ * enum drm_colorop_csc_ff_type - type of CSC Fixed-Function
+ *
+ * Describes a CSC operation to be applied by the DRM_COLOROP_CSC_FF colorop.
+ */
+enum drm_colorop_csc_ff_type {
+	DRM_COLOROP_CSC_FF_YUV601_RGB601,
+	DRM_COLOROP_CSC_FF_YUV709_RGB709,
+	DRM_COLOROP_CSC_FF_YUV2020_RGB2020,
+	DRM_COLOROP_CSC_FF_RGB709_RGB2020,
+	DRM_COLOROP_CSC_FF_YUV601_LIMITED_RGB601,
+	DRM_COLOROP_CSC_FF_YUV709_LIMITED_RGB709,
+	DRM_COLOROP_CSC_FF_YUV2020_LIMITED_RGB2020,
+	DRM_COLOROP_CSC_FF_COUNT
 };
 
 /**
-- 
2.53.0

