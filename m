Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F8DC3ABA5
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 01:36:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F51110E6AC;
	Wed, 30 Apr 2025 01:36:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NN56Q9ld";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2046.outbound.protection.outlook.com [40.107.93.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFCA010E6AC
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 01:36:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U+jERyS9mD77aS+Lh2dUdgCSfy991OiwuEMKmaLcBgDj29p+kCLy26136uAQApGJE/CXGHP8qAf0rLbr5cxSVWnv5g00N2bFC21beHgF/vy4ZfcV/IeofymIMkLaweSA7hu14PWegCIoIVRVpigCL/d7neCPBkCrlJoF6lB6g+POzZRUOYmgBO6MXNv3ueR+6O+AJRVYXE0fYFCN7oDe+yX+L3GMd1L55iXxYZA9U3akcnr2QbnRuTV6rV4P9JWhFNvcTT/KOBty9GEynxhgH8rjrSyoXvv+ZwChW0+X1g9Q3o8E0r+85dPRjyHSI6w24Id8so8hUPiM3ljKZe/F9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KwBgFY3+3tnau3kFhhSdMJkgkh8FAInixuJSD2eq6KE=;
 b=Sgx487yCw81/WUezi8BBcvIzMftQo8bAFtW+hxfWLSJ8h7faihdfEfWwRZ3ZzPZme1hgczdOgh/BIgk/frTnFT25+xewryZ+GBdrERmlfC4pVn8QpjITsb+B2LGcCFMsAlwTxYNqNVXi02omgwcHohIoKff2cOFOWb9z0f6v+jSyFJJDtZcqGcaXmxXZxeVVkzN6aouzt6XrQesdKKQkZnuD+seCp+ygk4FXwFejHZ7ZWFzR3M5V9QKmzZU4CasOY/6fBJj33/SFs3vC5eJjWpfhQlCyiGa9bN6MfOFhTAng1rCrUA2fW+kCyfuI5eUKhhLSI6Z2MFOmHcYGWADLmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KwBgFY3+3tnau3kFhhSdMJkgkh8FAInixuJSD2eq6KE=;
 b=NN56Q9ldYJJnXt8YXmwoV/Bdc5wVM/UXwxPFArRfzszIoa1J6DqMWsd4iw/ADMYYqyx3XP51dmu6hil7/ebcWuKZ/jOE4gJoP75GZyyEqhBhno3QnitTxgSr/s+CGwM1Yr/ThDh96TwLXFlv2KJw4j9FJw+YE+6FQkWUvOZDsvs=
Received: from SJ0PR03CA0104.namprd03.prod.outlook.com (2603:10b6:a03:333::19)
 by PH7PR12MB7428.namprd12.prod.outlook.com (2603:10b6:510:203::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 30 Apr
 2025 01:36:48 +0000
Received: from SJ5PEPF000001D4.namprd05.prod.outlook.com
 (2603:10b6:a03:333:cafe::53) by SJ0PR03CA0104.outlook.office365.com
 (2603:10b6:a03:333::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.41 via Frontend Transport; Wed,
 30 Apr 2025 01:36:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001D4.mail.protection.outlook.com (10.167.242.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 01:36:48 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:36:46 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V8 07/36] drm-uapi: Add 1D LUT drm_colorop_type
Date: Tue, 29 Apr 2025 19:34:25 -0600
Message-ID: <20250430013454.226910-8-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430013454.226910-1-alex.hung@amd.com>
References: <20250430013454.226910-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D4:EE_|PH7PR12MB7428:EE_
X-MS-Office365-Filtering-Correlation-Id: fab44e80-3c86-432c-a655-08dd8787794a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/kjGSbYuQQRDFZMfFl/rn+jU3uIW2nPcajuF0meXKu/2QknO+gWMXFXOk78Z?=
 =?us-ascii?Q?R+AEDOkJOoSQwCzytraC4zzTIsk/RGhi+EPnwYMdL0qVXyMKxmbe+reBXJIW?=
 =?us-ascii?Q?QUPi/WBIQnXLQvdp6LSRNZnT0EvQjB/BjHMXWmnwj7vVERWMnh7xYw5GNOLp?=
 =?us-ascii?Q?ObJU/y4UHFvXdpDZL32/qCPfrkq1kcjssMrJu02YwHNDDyCQ5661R9XBjirb?=
 =?us-ascii?Q?B4svmbVgJ3gQvdACiewkjweLFlRledoP9EdZOftMHbW2A+tsmXIqCb+DZ3cU?=
 =?us-ascii?Q?1QWgtvVSIzRx/zn6TGQL2YJhRDieWhhzyJRTJ5HBhjpCE4IINJd3M0VDH6gs?=
 =?us-ascii?Q?YMfG2i10TjdXLebSNdH4qDke5EQk/c9fBTO5WuxCFF7OjMMXWTLqy7uI0u5G?=
 =?us-ascii?Q?JoKn4vnHvjDb/+fHK6i1r2j3OnYdvw5En1EJxWj8xlNwLBvCuzzuYQe7izoP?=
 =?us-ascii?Q?ngX4UkdF0pSRLCMK2WIMTS8EtpXg7ggSV8jbojY6Grfzr7vjtoiYquRKWAqm?=
 =?us-ascii?Q?9b9S+pzcPEiuq52bxhufrQ6vqkpEd3qRpI1VLeDb0LEr4breR+/lGXqMfS5f?=
 =?us-ascii?Q?WoE6CLq1F0MSRl+bE316DJ4mzt0fyotLOFptmPMFhKmlEAXXdcsdWNQtb/Xc?=
 =?us-ascii?Q?+NjnhN+dlJFaoFn2uekjxD/ddGay/mNR5NYSVtFVlXZFIxYJAuUHVGCTVLam?=
 =?us-ascii?Q?fiF6UDantxb9FaDMGZqHDdgws4GPoM8qoMrFAw141MrW5MtdD78c+2KSPKzr?=
 =?us-ascii?Q?RRte00ao8AZiCi4OgXfpoXR/5QYMkNsYIxZ+PmlGMXixt6gXt1Nm9NmM21XW?=
 =?us-ascii?Q?SRVzZz84d591WMPY/hiPLG9brHiJKVP8LGE/Bbx4jC0k1DfPKhNco4SMYR7o?=
 =?us-ascii?Q?+YPngYR6vusjlBeryG49zG8+/dVcEwoWvxIpDPYKyYWTE03NvwhA1EV8cuI1?=
 =?us-ascii?Q?Z8UZavB2x82TOKYfzlTVySPtBQ5XwMRb3cuakv7ufmD1uoRdqLhmSErvXl2/?=
 =?us-ascii?Q?Nh2EVuWdGb/opjYLOJ12dyfGwDji/pU2vvZsP13obZ4lvxw+JUZH9LNyUYEZ?=
 =?us-ascii?Q?bNYUystZoCUWgDAdYzSgDx6lV8+5YCVkQIyTPNSMDkaeWuIh8rHbQfxbAkFM?=
 =?us-ascii?Q?Ml3prVYQjZao/fNnhPqujorluOjxy/y+iYJKQNvOPYusDFY4RA7LREtu3NXF?=
 =?us-ascii?Q?FMcFSPBJbQjhDDRQfJqDNIlSptg0xvLSHuGUayBqCmg8ZfPOkQcNRpotn8/V?=
 =?us-ascii?Q?/mc9if0rySpQVvlJZPg3zUm8hJ5up1yG0sZ2/BlbpcPZLgxIwYpGOEK760Gz?=
 =?us-ascii?Q?pb+UWMCXXmjcTtD5tpxKN+1DGUmWd5EFAcCOUVMYpLqEObtPsKhkeqhral+/?=
 =?us-ascii?Q?NoJyhsMFs1vOy0MzpWWa8+X6ymGuV6f9I2ysek+FV3cTDSwDQFC6xTwv1OjS?=
 =?us-ascii?Q?AkrwVZP67gvwvXBQKVSe0YO5+O9nmxZ3RK/Tcmn7WQNRKrcqUgTvFznsznc5?=
 =?us-ascii?Q?G1zBObIayKn77YKi11qqXKv8M7xf4iUKwR1W?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:36:48.0344 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fab44e80-3c86-432c-a655-08dd8787794a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7428
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

From: Harry Wentland <harry.wentland@amd.com>

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 include/drm-uapi/drm_mode.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index c5debc1e2..fce45b5cf 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -876,6 +876,7 @@ struct drm_color_lut {
 
 enum drm_colorop_type {
 	DRM_COLOROP_1D_CURVE,
+	DRM_COLOROP_1D_LUT,
 	DRM_COLOROP_CTM_3X4,
 };
 
-- 
2.43.0

