Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2CE8C5516D
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jul 2026 18:03:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8894910F36A;
	Fri, 31 Jul 2026 18:03:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JT5xS/80";
	dkim-atps=neutral
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011050.outbound.protection.outlook.com [52.101.52.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF40110F36A
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jul 2026 18:02:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RndDk7MT53AFyJU1kbWbG6+jjSzW2dyTxgMof7v2KVW0KMB6hizZP8mCg8bnAsjXTqPEdMiwbT0FqsvzKbFxYyZXaMMAug6ftvIAFcRguV8B/HHyFm6FRUrvemrl/+j21k4BSdYinRAO6TDGtShOqtkZ7/m7icHghGJ+76kL75fVNXWYLWdyjvr5MuLa0zgB904hKa4Vw/9uXTXe8sreZ0NxpPOM1GAs1Brr6X2wibai4/HqiLAvpNjtczKkmR2siq8/IrMTTSkRO/kQ/nd3EX4RLdFDnkvnNcUPQX75g8gxfpCmMeyM/cJBx4KnM6kYVndC287xqHMAvwSJeoRgpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hU6c5VMPtCUHgnWTVSqBky1bNM9sHPQko+lznHG1u88=;
 b=uHRCD+C2tU3teL+y20UVApHrIOq1ZpK6VwV+sYmbpo5Ev+TtUyxkk+TKv0yGmLgwFk5JY0/qiYworC6A3arx9nZJwZtcDDwuIJymdMy5NCiLlhC8HJgCXrqYc/paX65LJiPYx3dCbA8Z0TM/hU+lyxv7s8iUun3hm66xxOJpIYwCa1q4ChYeRilu7/2+l6Ccyv38lG/XDFLVzUEIJ0dLFfmMbIi1JlIgFmN1WoPPssJFO/ey+ZciE2pFQ72HlmU5NhWTm3emNO+dGITOKKlC/n7JYL0B1E9rUl+GgEC4UTHV+GLs6qsKqzwSSS0sLT6LMTHQtld3rBNXIZzL3rjZzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hU6c5VMPtCUHgnWTVSqBky1bNM9sHPQko+lznHG1u88=;
 b=JT5xS/80CBhbiotUWxpD8tLAkDCJp+zOOGbebIJNQ/ML3bdJv6VhLpomycTke603hC3ik8v4gBoReY4vTq1aWdOXBSvDxtmFwtS07aon1NhDKr/+nC07K9HZ7JfI4RZ0JvHbaCljpBxGXhV9tJaM0pNeHUDldsuMPAlUAPOfrdg=
Received: from MW4PR03CA0121.namprd03.prod.outlook.com (2603:10b6:303:8c::6)
 by SJ2PR12MB9210.namprd12.prod.outlook.com (2603:10b6:a03:561::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 18:02:10 +0000
Received: from CO1PEPF00012E82.namprd03.prod.outlook.com
 (2603:10b6:303:8c:cafe::1) by MW4PR03CA0121.outlook.office365.com
 (2603:10b6:303:8c::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.15 via Frontend Transport; Fri,
 31 Jul 2026 18:02:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E82.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Fri, 31 Jul 2026 18:02:09 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 31 Jul
 2026 13:02:09 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 31 Jul
 2026 11:02:09 -0700
Received: from hwentlanryzen (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 31 Jul 2026 13:02:08 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: [PATCH v4 02/10] lib/igt_kms: Add IGT_COLOROP_FIXED_MATRIX property
Date: Fri, 31 Jul 2026 14:01:52 -0400
Message-ID: <20260731180200.668795-3-harry.wentland@amd.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260731180200.668795-1-harry.wentland@amd.com>
References: <20260731180200.668795-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E82:EE_|SJ2PR12MB9210:EE_
X-MS-Office365-Filtering-Correlation-Id: cee6e706-f473-4f4a-743c-08deef2dd766
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Arb2WHTmfO16LVi0bx+dpu0RYe/ier4iISyIjLwDtf/UNZKRAP3EFbLyEt4pjhQv/CFDFg08RjwSNgxXuHqiaKTb5bQGqxcgR3eBlcp3jlJdgIc3rNZSxQGZR8E6LdKmHS8ytuOVpBGw7wmGyQhzOWFtXxLhHooQcvSadE+lb6MZsltcNyf9vwS1bLv0bkgJ15kr8dOmvpd/E/LOwjeMb8oi2I6OrWjV4IjVDj/DK6/R3aZz7A9BoPV3waLU/RubeeISwftYrqfCCtC51HvktPsNgllnLuNLqkfcR38yjsfgO9ImrqfighNbNXiA4B/0KcHq96pIkmg+dvVP6iuvGB2eJbNgcO/KeRBj18lj80YgK7shX6WItwlmvEkjTi54FNxS/dJb87mD/OBIjVBze6w/1BJizXn80OkDxQoEvdxeLkxqK9odyGndhyRR+jM66LFOoAsDjzrIv7zbxwwW0Lt23Lxnrw03W6xT5r/i7+4usYzD8beCENS2fAMAStja2M+ieTgkl/iKqzAQnFMkU2MSg06QrZOdZT8WPxkjsDTaygDbs924tOVbzjUYatZugOPEpW1vVbg1eyMA7rn3isonjiDSHWU1HBkwVNh68VZJd7GXZpvayofWQ/nnLzTzBfJY72eR6lTx5T9EweKauEWSWCdxNcKFQvSTzRdXtZoxNNr9TxQRHSKf1qpZXIqk20kuqpKB3WUuweblBVlg9Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: VGSIklZ1jWJxeBCHRLBHq97jD177sCvHCM+/kcSJjpRJhpPYlWs6qdEcBkxTYgz7hj6ldzWGWxvGe3/dFJ48I+bw5hHjh3pXzrR7v0TeVqXVL1M9b5cMWrAVIXPthQ4O5uHlnP30m/aUYfHDVyKBlFHEHB/JS3TriT7kjjvafTJgW8elFm1WguNY9rna7BTmzFBZoWCGsG5lzqw9nteH0xB+beRtHH6WdZusxFAcT1Tq7jw7hDA4rzrflJC+na/wfUjpSeJzUVreOLIxo+rm883KKrpbSRr8YFHNBh1wYlLhYd/rLsjb6yn06PIl2M/Q5vehUyuYadoy+V5z/CK0TdZzaJ6OWN253CCg14S8T8cQjw7d8EFTmFnuo93QbVTqChDsOi+VFvIReLw68NX5WhEiCgCU3K5tqhTcB7qUHrq2c4BgIEhnqHiF2MX5wl42
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 18:02:09.8217 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cee6e706-f473-4f4a-743c-08deef2dd766
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E82.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9210
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

Add support for the Fixed Matrix colorop property:
- Add IGT_COLOROP_FIXED_MATRIX property to the colorop property enum
  and names array in igt_kms

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Alex Hung <alex.hung@amd.com>
---
 lib/igt_kms.c | 1 +
 lib/igt_kms.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index ef9496741ab5..0f1704d18803 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -725,6 +725,7 @@ const char * const igt_colorop_prop_names[IGT_NUM_COLOROP_PROPS] = {
 	[IGT_COLOROP_MULTIPLIER] = "MULTIPLIER",
 	[IGT_COLOROP_LUT3D_INTERPOLATION] = "LUT3D_INTERPOLATION",
 	[IGT_COLOROP_NEXT] = "NEXT",
+	[IGT_COLOROP_FIXED_MATRIX] = "FIXED_MATRIX_TYPE",
 };
 
 const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 521a03c01d72..27f8877a9f6a 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -363,6 +363,7 @@ enum igt_atomic_colorop_properties {
 	IGT_COLOROP_MULTIPLIER,
 	IGT_COLOROP_LUT3D_INTERPOLATION,
 	IGT_COLOROP_NEXT,
+	IGT_COLOROP_FIXED_MATRIX,
 	IGT_NUM_COLOROP_PROPS
 };
 
-- 
2.55.0

