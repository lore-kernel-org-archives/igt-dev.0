Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D5FCDB470
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jun 2026 17:58:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E66F10EC3A;
	Tue, 23 Jun 2026 17:58:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="F529Ijjm";
	dkim-atps=neutral
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010058.outbound.protection.outlook.com [52.101.56.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D71410EC32
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jun 2026 17:57:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lgw6HsYgPzL76asRfNlSQ1n9MgR0o6sET8+yXwpRMX6XKB7cN+PQvkEh8iFFpbM4NOC9KfGcyFocxJ8L4GYqCxWB4yJN9+lAr4Dftb/F8t/Byl0Ff43+3YHdHNWRT8kaGNiVPTq15UP0w0Ws9qngTq+kUzKGEYTTHDyjSq9o4mCYVbhxRdl/pGisAEsVkj+ezkNtoJG371snggC28tnyI9uzxphsi7f/1eM1chGHBulkJIHPrqI8DqZ1anJnWDlBoM72LzfRqYdn7GXDDo5jqMDUzOi9V+U2oQn7tYVC7dcr1hh0Mw3OBTvXEfEMe4wV+aXt5NsmqpbNGiHISsgXlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t062Mb3uewiF/4IjTn7xj+JNy5RiYSJjLioL+9D8xV0=;
 b=SuWlrmN1M8fVaCSmzTF9ZoTeYNQdY/roPF/o5vO2pza6DjxRDK2oW/v6EXVTYuiUyUev/X0EaabDyFghFs1AgNAuv6cMTqjRy4NGq5pog42qlZnhR+CTX5FN39wmkY1noH/6D/7q8rXKCz2L0rst98meoV7E9hrGB1q4BVAabXGVaDOPJXNukxuHdPSksEqg9YQMX7vrX5V+Y7qtM2Qc+hWWWXC92JAo9D7xsWoJ3vY6JXBx64nD1LASqrIPelbNwZHFHLVtFWyN5CTr9W1AgSLFP+4OaFFpWILIer8EAqUD5+T7mkOJwstvMwER+vZuWSm4AG9c4gJnj5gvllEMpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t062Mb3uewiF/4IjTn7xj+JNy5RiYSJjLioL+9D8xV0=;
 b=F529Ijjm/yHC8xiiPWtxVu394I5QE24CZyNzUzL4htPu1hbv6s/Glb5t0oBMO/TOAueEtsf5+ki9iPzw6H/J+RMntAR0A4nSE1KuWnv/879J43yoxm0B9p8L9/yoH+ixgvoJ8HBKNv6+EfQ6QrwRIjGHq+tfsDAy7carC4UMCMw=
Received: from BL1PR13CA0191.namprd13.prod.outlook.com (2603:10b6:208:2be::16)
 by DS0PR12MB6485.namprd12.prod.outlook.com (2603:10b6:8:c6::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.20; Tue, 23 Jun 2026 17:57:47 +0000
Received: from BN1PEPF0000467F.namprd03.prod.outlook.com
 (2603:10b6:208:2be:cafe::a3) by BL1PR13CA0191.outlook.office365.com
 (2603:10b6:208:2be::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.9 via Frontend Transport; Tue, 23
 Jun 2026 17:57:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF0000467F.mail.protection.outlook.com (10.167.243.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Tue, 23 Jun 2026 17:57:47 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 23 Jun
 2026 12:57:46 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 23 Jun
 2026 12:57:46 -0500
Received: from hwentlanryzen (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 23 Jun 2026 12:57:46 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v3 02/12] lib/igt_kms: Add IGT_COLOROP_FIXED_MATRIX property
Date: Tue, 23 Jun 2026 13:57:27 -0400
Message-ID: <20260623175737.171142-3-harry.wentland@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623175737.171142-1-harry.wentland@amd.com>
References: <20260623175737.171142-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000467F:EE_|DS0PR12MB6485:EE_
X-MS-Office365-Filtering-Correlation-Id: 99707586-d095-41e6-d115-08ded150eefe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|82310400026|376014|36860700016|1800799024|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: /rXWX5pyUAx/+93avpRnaBtWpC0qDQAt6L+8HVz6ySWZh/nB6FDe/mSxaYvzSp1jq7b7uXqzSPCyc4fyGB7hu3+zzjXhhIdVaHsB8fgGi+7E5C0fblcLnw2nGVNTHN1NAjO7NMhG0+Q7cZPrZzKuJ2pkLc81g3BpjN/rEGNHYwDiSEqc98nbx4LTLYk3j8+msucQFnmAlPeYN0DdBu6RahDBjztpoBm1XqyHz/hcMtWzvhUMZHVmVESyZpA5RRtqhH1xCaFNEWmFD7fb34jDvYCjPPNdlI1RhXi8pi3kVNZLml5UPqmL8YR6fRIov/azGmPeb4jxuXDa59cqeLGNq//Aey8iLJMw/GNZGZPhFLgsNh384UXydFMkl/R1U7+Iw9rtHhOaO6qijsE1d/UtCFJWSTm4AXKdWbD3ASjxWImucV/xfCnvBzGjUFx62iQXS4ntDy6owWTMNJBnHUSuKtfY8zRxH0v+hxeL+bIy3z/4uo2ud2woPX4WCKzs+diwDKJHkSpRhRInAxNabcgVtAWIcXOUx6/Z6uFu1ZgqdLnt1h3Lp/J/ykDkJ/ZCwWi/SdItWiMK5P7dVmoo9006U7rTJ93IZh+AsRu3VKBfwIt5nrkEvDIfMXkJZYPtDA9sGDD4l+WrcsVrpij+ta7eshAivCoTsINqt04Ll7w+m0l3DrlXyzcm3Q65dtL39/om/LDBzTg/L3tYYqRoSrOpzg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(82310400026)(376014)(36860700016)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: J2U/QgHCk+fnFTAuU5KdUdyKjWXiNmw2uR3Own2DqvbWzDVbyQM10yWQXOkXK5JNKW7c3fWAuG95NJxxpd4G0Vbc1Cx2lT+RlDBMcGEUrMKe/awpIOiNYAWOYK9WDUieGE5fWubN1kkQ/OCR7MjyrJNTbeqzwBZx5ek0OQYqGa5VR60ettPVLtGUhfr2bqsFt+xiw8kpXb2p5iYLC/eRenwTtAaL34QFY6k77bQPHOkVS5oPhtdEZuwWceXXVV241REE05F3vEJ4l/QQ/MLCX7oyJixnkmVOoujdKAK8ShUxl2QB738uy9adT9VEtB0L08rd5FCBRZZetjtBl1GNzDvuD73uQ5MS72ofVWogv8IMFdHiIUsZhdvxilpmEpWqL1iK5+GFFHsT8bzWoejH218Xh+PT17wbvQ9VfU4GgTtb9HfkJBUS/lMrxURehrua
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 17:57:47.0031 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99707586-d095-41e6-d115-08ded150eefe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF0000467F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6485
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
---
 lib/igt_kms.c | 1 +
 lib/igt_kms.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index e82d32130666..9003b2b9e670 100644
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
index 3df3ba86630e..1be58288e119 100644
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
2.54.0

