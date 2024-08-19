Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC519C5320E
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 20:58:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEF3110E43A;
	Mon, 19 Aug 2024 20:58:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dezY+n5n";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2045.outbound.protection.outlook.com [40.107.220.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DD9710E42B
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 20:58:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uTKPBGEjpTSHmt9SiNyheBiCwVZLDpi+oCD/faQ0qLN6bbniwk3Hpckw05DEywBvHP4LRs3YDA436pOwEcFc5zmcLDb3z4XFi3G8VuEZxWSVuppCVTMVQ/XGjvduz8rnYgEKGclu84qaeMvGrA+TLBuE7iw6JDAcfmgXld6lqX9pVvI9ByR6kxSemrnSDZW9GdNQVHOE27iiuyMDtUGRJgBZ5525cvyevrSlVvuKd1PR0iyxtcnfBAzjhSL5Oi1s9Mov0AAygvy/lDBuQQY+DCjYVvpaBx0iP4iI9E4+BXIIOCoMYqecY8uERYJjVVoZPwcebmg80HzLD5OzUgL/Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Do8yJao3nSnERvdJtK8lDZE/fNcOTtuwhtcj+Dx772E=;
 b=qaaeAyD54nXaSo5X02V98EZ9N5gk29YWbhsFpujn4GOR3tYHTALoEMUYpkGE5dtCodZ/yMUas7IZ7uYjCYPmwraSyvsH7rU8mVQJ9YA8VnSY20jLQuXVTDF8gdiSLUbT7uJR7OYhWFw4t1XmFjedDnzjwp6xvSKvmX4xnA3pHr0na/ljg83SY7UfoKykEmLmSZ45W5RAGm9sRR2F9mmgUcZ13TaCcHVn6bWJ8ZnCmulyFEIuWA2q5utbiJBULILN1enrimRf8gerG5WNhM+/cLuAbCbrzYw61L7Cj1GJHbEPCcluFFS9wKLUfkshBmXKVd9ehhzuQyPgXkKw43Gudw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Do8yJao3nSnERvdJtK8lDZE/fNcOTtuwhtcj+Dx772E=;
 b=dezY+n5n4XDWCO++kZVWqFpDNqhwSNznTIrY4sGnIjaGFQvKomr3SKpIsYXYxt6pqUcc33uD5qU7V8gFaqowT/GlwhHl7rgQbYILmJsgKrJ0IDYborPSu2PCkwB8d53E+jwxhGFcr/U6xncQa1cNErPpcuICcFV6T3aQwSyNZ4w=
Received: from BN0PR02CA0051.namprd02.prod.outlook.com (2603:10b6:408:e5::26)
 by CY8PR12MB7433.namprd12.prod.outlook.com (2603:10b6:930:53::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:58:29 +0000
Received: from BN1PEPF00006002.namprd05.prod.outlook.com
 (2603:10b6:408:e5:cafe::a1) by BN0PR02CA0051.outlook.office365.com
 (2603:10b6:408:e5::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:58:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00006002.mail.protection.outlook.com (10.167.243.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:58:29 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:58:28 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:58:28 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v5 06/37] drm-uapi: Add 3x4 CTM
Date: Mon, 19 Aug 2024 16:57:52 -0400
Message-ID: <20240819205823.316656-7-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205823.316656-1-harry.wentland@amd.com>
References: <20240819205823.316656-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006002:EE_|CY8PR12MB7433:EE_
X-MS-Office365-Filtering-Correlation-Id: f416e99e-b00a-46f9-597d-08dcc091ad75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8OgeR+ZygCP+QwOt4CvyRJFhxCnymCaaL3dETqViNYYYAa08n3SFjuEYpAjZ?=
 =?us-ascii?Q?nvDDrdtyzogbJjswNom0HtEgvOdx5U40WdfuH8Tpm7XCp56vA6rd5NmI01rk?=
 =?us-ascii?Q?nIC2iCU/QtB7MUIz2IKHQW3G2lsNdsvV4qek/7k6R2kSGB/SODsbE5L45Aes?=
 =?us-ascii?Q?ZqWgqMNpjn/bx/ASnQbT8VtgwLVlhlMs1nr/1TBoO/c4uvzulIima79nk3//?=
 =?us-ascii?Q?xYutHiyYiotUiBk0vYnHkflIm/BQ8VX86e+W4IoljQe2WDm8h7H2si6xOyhy?=
 =?us-ascii?Q?FCJQQmaN8CfaLk8EQrBp7hD0xFlnKh6HcrA4UHtDDu0AzcYbQ5xUYPA/fQ9m?=
 =?us-ascii?Q?7oBYB3+Y4jO/VGVbChCvRFeQQUJwRgSbDIAoWml6FIqpYXa/SNLYqZKIQppA?=
 =?us-ascii?Q?afzpk4XDkqzPlM4NLOQQcEUZdXbIdA0FeO4PFdjrHdLxMdfSby4VFBJu5QkK?=
 =?us-ascii?Q?Jfl2sCm4Df5w5LOYlF/HXZFvB8wIdT5jpOXcVS9yH5epPVlm8pcfji2znSSx?=
 =?us-ascii?Q?fnpMLvKmvVyB7K5iAKHMFwePbPP8JbIDfDFiDSuLF3hsRDaUS1qbXYK/OVNY?=
 =?us-ascii?Q?c77UB0rsc+G49B3vfcK+1qYlFVNLhHmK+1ugWp6H9JnDqbS//H8ZQKZ5yxYh?=
 =?us-ascii?Q?Fq6qbUJVo33p/KFPGP81Lqx7UL5Djhx95ZOvAIXU/i/j2G9KALFKgQk1KP6I?=
 =?us-ascii?Q?hsvSKmqVzs5pefldmicsnKPPyxSebHtpJKwpWARQswkOj3ENCpB2zZESoRex?=
 =?us-ascii?Q?zbvfEoAKyX7AmOzf/2GrM+9pgjK9Ak6fUkfZt/kMfYuD7Ov5LVH+pbqvySTg?=
 =?us-ascii?Q?bbgFhHLgt+O9ZnZbIC2TWu5s5hOS22o0Sn/2DOOXIbws/Nz+mC+NxNQxldsY?=
 =?us-ascii?Q?wHVTM+ZZQBSxrfleF/+8pK8qA2Yqn4okU+qK5hZslpRvfVIw1qJZrr4yd0mE?=
 =?us-ascii?Q?pf22Dl8hVfHuGRiOvSEa7lARWeYfM5t/mSMv7EcV4Bvao79Y1a7NzZeoOOEy?=
 =?us-ascii?Q?yecFGIFTUWoIy5eFlSiXcmBe8CuB5PdU/S8AW7N1bLmJ/TI23DYDX0+ZEr0/?=
 =?us-ascii?Q?4XCUZBlzz4AFhBKIpkdzHnNWi4wLGbJmOkxFzMoajPSaZsi1sjLnHcMrQsP7?=
 =?us-ascii?Q?CsYJeDaCGixF7+aFYLGdtOa9mCaDVQ48koue4ARfcKfbZrMZW2KytLDgv/ES?=
 =?us-ascii?Q?TZATQvxmTx1VqCHT/SKtv6PsvIZ3D9OMlzgpgyv95ppK5obg01JBd69EOn3m?=
 =?us-ascii?Q?6ZQ6MVbW+0arPAdQ1zBve2H9QNxCgZvdncKKnKpKml86CL+AiXBj6bxm5rax?=
 =?us-ascii?Q?vDtE/28gDqu6KUzFwoVHj6XtfilyIyOWlkVSSBVymW24TerzdqCFM3yGSHwA?=
 =?us-ascii?Q?8lnKyHTUX3RykGnXxJkjUDPRjvLE+uB3K+OjKbBUmOnCX21HGLCUeGO9TNLw?=
 =?us-ascii?Q?p+qDASGaHKAAxTu9Bb/BX8F+VzdtPLWJ?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:58:29.1926 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f416e99e-b00a-46f9-597d-08dcc091ad75
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00006002.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7433
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

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 include/drm-uapi/drm_mode.h | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index c49526bca034..358c5c313bd8 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -847,6 +847,22 @@ struct drm_color_ctm {
 	__u64 matrix[9];
 };
 
+struct drm_color_ctm_3x4 {
+	/*
+	 * Conversion matrix with 3x4 dimensions in S31.32 sign-magnitude
+	 * (not two's complement!) format.
+	 *
+	 * TODO what's the format?
+	 *
+	 * out   matrix          in
+	 * |R|   |0  1  2  3 |   | R |
+	 * |G| = |4  5  6  7 | x | G |
+	 * |B|   |8  9  10 12|   | B |
+	 *                       |1.0|
+	 */
+	__u64 matrix[12];
+};
+
 struct drm_color_lut {
 	/*
 	 * Values are mapped linearly to 0.0 - 1.0 range, with 0x0 == 0.0 and
@@ -859,7 +875,8 @@ struct drm_color_lut {
 };
 
 enum drm_colorop_type {
-	DRM_COLOROP_1D_CURVE
+	DRM_COLOROP_1D_CURVE,
+	DRM_COLOROP_CTM_3X4,
 };
 
 /**
-- 
2.46.0

