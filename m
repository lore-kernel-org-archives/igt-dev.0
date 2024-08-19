Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 669B6C52D7C
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 20:59:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB3C410E47E;
	Mon, 19 Aug 2024 20:58:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bNOX19+R";
	dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2078.outbound.protection.outlook.com [40.107.102.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E2A10E429
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 20:58:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FRoLIf35h48RLfauBLyMkCJE9Lv8MxSpyXNfmPZeZ2O/fYNRzq4qvyOZ4e4fs1fwq8egltqajQG8njdknCWfT0jlh/P1Cg4C3gbxcblvx2uqxRhO/BC8/k2/iDfe183uowDBMfed0X00A9322LlmZA+3x6Or8KJ5urmLFUOceJjUXB8WzSvchLPMR6N6cYikk5Bft1ed4N1F1yK+DkKNd5BsslBS5jJgHVUSMj+cbLH9RKB/PgKkXP093g9e9WzwCGQqH2jdhnnUhXlQk2rMDOaMoRa65J5fMkX7hIhLUqi0JFWY1or4QlNrVMdTXVTQQrPrlP0KuGNFxCqQAhjc9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XKRXc260ZVa9ynKQH+B6DydlE0ggrRQxNHvZ4KT3/o4=;
 b=B+WyWD4rFLR6BSJ4/iJE5hOu3WsgMRkM2ZXLJflxWaYj8KfFfCMoQT2MSfNSiYAGGSG2XtEQzy/TzupY6BhLXdoBu5+UpSSQoKulsqYtbh31yimp+LmM7U1wrCKHTxYxUU9PbQQOmy9vHfh9jLFaGlJctm89CU2ordzWA0kqzaa/6zqw6RNkrsZV5/6qegEAABg3eC6kPmqndt7R5rFRagiy69/XFA7Xhp5T2z+N8S/3bnwr/D+J644mO0EK8KG+mgbEolMaD9qQOj/pI3Ld3UIkWB+8ec1WSGnG+F2m8v83X9/SnyO3nh4rkxbIdl1gz+uT+QJL0ar+ysekEdQwsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XKRXc260ZVa9ynKQH+B6DydlE0ggrRQxNHvZ4KT3/o4=;
 b=bNOX19+RPZUCJp3ezauvu4deQNJG/1G4GJmu2QFV8Gwd8ILl5ZostkEknnnVp6l0PHCbnwZTjCWNVBMNj40fTyj0hEw7Pr/p+JGAsqEyKUvdSSK3eSyA9zlTfIGgtV3tq58OggMQmcsgECEmYqkbyJtjeJvsfZT4e/R8bjOGbV8=
Received: from BN0PR02CA0053.namprd02.prod.outlook.com (2603:10b6:408:e5::28)
 by SJ1PR12MB6051.namprd12.prod.outlook.com (2603:10b6:a03:48a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:58:39 +0000
Received: from BN1PEPF00006002.namprd05.prod.outlook.com
 (2603:10b6:408:e5:cafe::3e) by BN0PR02CA0053.outlook.office365.com
 (2603:10b6:408:e5::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:58:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00006002.mail.protection.outlook.com (10.167.243.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:58:39 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:58:39 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:58:38 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Alex Hung <alex.hung@amd.com>
Subject: [PATCH v5 26/37] lib/igt_kms: increase MAX_NUM_COLOROPS to 128
Date: Mon, 19 Aug 2024 16:58:12 -0400
Message-ID: <20240819205823.316656-27-harry.wentland@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00006002:EE_|SJ1PR12MB6051:EE_
X-MS-Office365-Filtering-Correlation-Id: 65b7f53a-4f40-43d4-77d8-08dcc091b385
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?k8xpN48j0/vtu83ReBvufEuRo7NtOx64WNomQE/UExIv1twArKWDRzaraHPj?=
 =?us-ascii?Q?8fvo1qtrwY7aZcyaUtzKcH/Zoc1Q7BXMxg/bMXTRUsQkFs7GcKQeQF0EovRO?=
 =?us-ascii?Q?mmgfxXsdJVRoMmnmzkzSPMKyklWq6SWMpVjFAAsQryK8T1IP6TQRZMtl7zX9?=
 =?us-ascii?Q?bqIqvQlozwzzny88lttzW2+O8svs59WfhVXsE3la3jPSQUxx9022hpCaCAqW?=
 =?us-ascii?Q?zpI+c9PKXHfeNYqkB7pYRdgvXZGbp09MExAK4D/vt+j6xXABv5QhX4qgcqP8?=
 =?us-ascii?Q?ZW4RQEGF6w9s6XFNYqb4x3EP/AqvdzqO6MA5dcOrdug5mnX4+nY+Eg8GGkuH?=
 =?us-ascii?Q?HPeG6guKOsbiVEIw3Ib4iUiZQaJCRg5UrO88r/fNm9R0IvsA58zPY9A1E4+5?=
 =?us-ascii?Q?iOf0SZufnqVaey8nv3dFwL8AN5ePA6kVdC+jSj11bFXK1pPjLZ9mM2NFYv3Z?=
 =?us-ascii?Q?chFopyDMlOpjzrwFHTqd65ELt84/1WKMMMKCpc2zS6XT/oPFM3Qfi/cdy7l2?=
 =?us-ascii?Q?4El+XMLVQf+mZFPZD2DnISTa244Un1jAQ2R5NBr2sYdM1acmtlCYVV84/91W?=
 =?us-ascii?Q?+lUVChl1WVvhT+xTYrg0/1LWIOOD7t21ZdgzPhgj0zOTIi60AwyzbTlg/d+L?=
 =?us-ascii?Q?lJVkw1zJaXmsJ9fhky19y/NDePdFu1BfV10j6V2rWd/a6U8vwgxEkmmejQrl?=
 =?us-ascii?Q?NYOoEBUOIUTUyQ+4VpDKYHfzdEP/195Sa0Fv0X/IdnhI3iRwsTKT2LziaOdr?=
 =?us-ascii?Q?Q5Eg9CsYl0PBuoq4oSJLTSFnlqIt8vFajNEJ6puEAt43VWNE3a2s2jzbgOTd?=
 =?us-ascii?Q?N2YD9KY4s1LE7Ic90lLwuljwn8Q1U7F4SLtljXXGuErXeEMcLG1LvixnLGr+?=
 =?us-ascii?Q?O2XE+Wfw+MYhxkVY/dEfL5rcnXLG98nrVknEluCmLaL9JWXmzanztALnLbkI?=
 =?us-ascii?Q?/dufkGEUiPP8u0Z8NvVV/wRKkEO9bbgBF7CyT9FY+yjgPxsJjRvmpn3YFY+n?=
 =?us-ascii?Q?8GZoGTwEJffVBwKu8iPlGYlJqmxSxixdq8DBg7Cg1BAYMqJrKpntj86oTmSE?=
 =?us-ascii?Q?IejCaRPoNAaOVBz5FVyGmnLj7W7IJ/AkZz+m9fE16pWXUadF5MCz8q6uqb1b?=
 =?us-ascii?Q?rNPIN8CpIrCMSLK2baQ10WHZmYq3HIQ7DaTsx0DdykrHtFWLLzljjw1oGve+?=
 =?us-ascii?Q?LI8dHcmtiitfw/WItBX5lFVgqy+eH5jpEfNd6EO3A6W9t0C8160zGzsb/HOe?=
 =?us-ascii?Q?aTwrNV55QQ/r+uHmx6/7OXCVMG8UC3f0SR/Wpvw+eCwgfiZn01acicbklAXs?=
 =?us-ascii?Q?ByYLoFHqtJd/bb4Vm2G8TkorHwBTcDr/mmstFaQtqyk0WLZ8eS9nli8KzVQG?=
 =?us-ascii?Q?7/mUhEamYSkjhXDEzobrZatmi4e/sMizN0gVcDd520ICmKOtp7ib3ImFLhdj?=
 =?us-ascii?Q?CSSvojxpGCwmAA1s96cMJw4OVyrSAmMl?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:58:39.3802 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65b7f53a-4f40-43d4-77d8-08dcc091b385
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00006002.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6051
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

From: Alex Hung <alex.hung@amd.com>

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 lib/igt_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 4e45841ac393..fc3a76250925 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -90,7 +90,7 @@
 #define MAX_CONNECTORS 32
 #define MAX_EDID 2
 #define DISPLAY_TILE_BLOCK 0x12
-#define MAX_NUM_COLOROPS 32
+#define MAX_NUM_COLOROPS 128
 
 typedef bool (*igt_connector_attr_set)(int dir, const char *attr, const char *value);
 
-- 
2.46.0

