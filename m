Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FE4606A330
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 21:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=CLCzxrng
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3322610F8A2;
	Tue,  3 Nov 2026 21:44:37 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010037.outbound.protection.outlook.com [52.101.201.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B296610F897
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2026 21:38:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AyiJ+YXynNFS4Ux+viAaghGlmx3D4nHbyoBCQr3FrriG11hyEetFIIKMWxpEPiSX0QWvX3pTwDo1UcAecmomQEBL6jmtbnthdGgSN8+5QVc23Q6OxZs+bu+DLOsezb6X5GA0YnoUBg3lN9OdnCx2Szhh8UFolVRwUz031dtGqaWnS3Y9oPDUPveGZyLEuka8NZcwfV+In5cMUHCFwz2D/0jGVr6y+glJbP0ZyiT2H/BfxBSQF5H3LKMxwKxqPhTqFwQz9/ZP1NFk5UJ8jOc/0OveRZoC60HpMpVtWLKVHrZx06bLg4Ff9ubceZUre2AHWWq7/JAPMAG9QwlhSWs4vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jN44nUXYPpY9d/TLarW2RnfBmd3+9lhaiOr2uVcIDNE=;
 b=qTcwI8sxogX41IG24zOzRiXKtKIR4HQBzHMTPrv+Tgv0Bw9I42saN5pO6wqB1S++Tov0XksYAwAQxPYDSholq7wzSEdol7rPCV4+WQgSprvNq7i6Ef0+TiH4zLIFIg26WhTbry7WvWhs/47UgY1+K0YcMtW+VckucNxo0ngjfPdc42eRNKYmBCxLzLGwDcBZ+yPzdFjLL8+OWWvmmsI9N36zLvIuCno0YtGzBL4sxF+ZEw4KR09+GLWM0INHwUFhf+7VJYn2I5/nwNAvi9/AYiezuZ0dmhQ5NniQ8EsDoqWMJwXpT955lNjNqyE7q1K3vUZqpPWjWFB1tiSm/Vmn9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jN44nUXYPpY9d/TLarW2RnfBmd3+9lhaiOr2uVcIDNE=;
 b=CLCzxrng3vjXNmo9/ttfa6QaLT/t+WVmrUDeN/SLx7WC/NZWNXNMJvUvrDeGRJ5eQIxSBPsq0hzwlMuA6XaO5FODMHgUhaQz5L9pLQcvd9pE3s697rGHYFCC+CtLecHbiCTLKiF3Y3dK4M7w+CjFHFOtUg2ZVw/5oGC6szb/6QI=
Received: from BN0PR02CA0028.namprd02.prod.outlook.com (2603:10b6:408:e4::33)
 by DS5PR12MB378793.namprd12.prod.outlook.com (2603:10b6:8:47d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 21:38:19 +0000
Received: from BN1PEPF00018075.namprd04.prod.outlook.com
 (2603:10b6:408:e4:cafe::7a) by BN0PR02CA0028.outlook.office365.com
 (2603:10b6:408:e4::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Tue, 3
 Nov 2026 21:38:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00018075.mail.protection.outlook.com (10.167.245.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Tue, 3 Nov 2026 21:38:19 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 3 Nov
 2026 15:38:18 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 3 Nov
 2026 15:38:18 -0600
Received: from hwentlanryzen (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Tue, 3 Nov 2026 15:38:18 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v1 02/10] lib/igt_kms: add DMA 3D LUT colorop properties
Date: Tue, 3 Nov 2026 16:37:52 -0500
Message-ID: <20261103213800.618130-3-harry.wentland@amd.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103213800.618130-1-harry.wentland@amd.com>
References: <20261103213800.618130-1-harry.wentland@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018075:EE_|DS5PR12MB378793:EE_
X-MS-Office365-Filtering-Correlation-Id: 7676bfde-604b-4c25-b87e-08df39f2c6f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|82310400026|36860700016|11063799006|56012099006|261021123027099003|261009223027099003|261102123227099003|261021121427099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 3xP/84pfD/SZeBxDUhbrDHw5O/zT1BWhoyiFJr9dBsi8wScSWXOvMYP9vvyZ5Xdk/XxPpxpMG569W5o4GsUKfXgDhrziQaV6tbY//8FTCx+p8PbPIHoEXQPNkQfsOSc1zmqDan74FSjocbVR94rbOnL2/E+CaJfEggFWGFtBCJ+enGGvoA+iKnsW1Awtxs4fjbAaD4gfNWhwigI2p/bicc+f+kcjPGPZa+N5Mwypl8Hk10fiEZTErdqkK/YlB3bsA5pEyd2YEsFCL6OLTz6mRWfpLDc9hrivvlmaOBk5zPd1jn0nuSzQI02EwUBlShUMIxSrfs5YfjR35hb1B2JaasG/UriCzrUWd8nXniEkHjEhvTSc3pFTaJI7C81xf68HGMnOutVAILxEI2E8f/LCoQcBc7JZML2e/ilV+4HC1SwAgx/XPfmXQ1CnKUGhycPqVH4HWailsE26qBstFcWQ4Pvh6Bafob/y096lfRPBD31tuLsjqh8aQ/Fa4OQRzbSA3AjhaP8YILIPbTScjJzgKbQBTb3g4WXYQWqQiHEmZJySny/4pD75iGF+wCEZLQlJ5iUyYwIgML1ZghQE5DEsVVaLl1j+7rHHofVqlzZtK5BfW8PrW22ip3KwF8eC8f0grSNkV0ZFOBBKhkbKzezzVq/6uQd6fKBMKsiCPGNp9Dl6oI9coi7IK9o5xlTIMM0A9NJx9u0ZuRU7/RTA1LC77g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(82310400026)(36860700016)(11063799006)(56012099006)(261021123027099003)(261009223027099003)(261102123227099003)(261021121427099003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: SvgDo/j2EPKJBNUpOwzS+sL+hI3B7r4JUYQaBuxGC880IP+oqxxIm2ybZZQJzB/JiG/UDuBXOlI3YbujxO7f5ubTw6Nd8sx2x6uKnlAP2q2ZGPnOTYkI5IgfFn5iFlJSPLx3gaya56DHesuA91kLJNhzmXOJ9j2719/7AH9Sszc8foYXW6Y8ee8DUIU92IevpDadczu5NSF0o/DoRfEAaK3Oq0xIa15W92T0HO1yK2nVU6NjP8fwqsppGLcP5wiwD6LZiEvJHs7NqNhThf9a17bkOYT3xj38XmkVJ4BWC9p9PMvXTN7nFtPPswGk730lLelolvnVuz5CTUzZ/hKPdZcZc3MS7vCBjyLgHoKh9QqrgMZJjktxAWEXm3wGUyE5TpWIifW0zkr8PLWdV7MPQ5JM35b1oF8xRQ/I4lYrcMFsQK9J8uXwQD17z/BHG5Jq
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 21:38:19.2531 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7676bfde-604b-4c25-b87e-08df39f2c6f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00018075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PR12MB378793
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the LUT_3D_FORMATS, LUT_3D_FORMAT and FB_ID colorop properties to the
colorop property enum and name table so they are discovered and can be
programmed through the generic colorop property setters and the atomic
commit path.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_kms.c | 5 ++++-
 lib/igt_kms.h | 3 +++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 915c6a8a2cbd..9a6d4f1e9996 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -100,7 +100,7 @@
 #define MAX_CONNECTORS 32
 #define MAX_EDID 2
 #define DISPLAY_TILE_BLOCK 0x12
-#define MAX_NUM_COLOROPS 256
+#define MAX_NUM_COLOROPS 1024
 /**
  * IGT_KMS_CONNECTOR_NAME_SIZE - Size used when a connector name is needed
  */
@@ -727,6 +727,9 @@ const char * const igt_colorop_prop_names[IGT_NUM_COLOROP_PROPS] = {
 	[IGT_COLOROP_LUT3D_INTERPOLATION] = "LUT3D_INTERPOLATION",
 	[IGT_COLOROP_FIXED_MATRIX_TYPE] = "FIXED_MATRIX_TYPE",
 	[IGT_COLOROP_NEXT] = "NEXT",
+	[IGT_COLOROP_LUT_3D_FORMATS] = "LUT_3D_FORMATS",
+	[IGT_COLOROP_LUT_3D_FORMAT] = "LUT_3D_FORMAT",
+	[IGT_COLOROP_FB_ID] = "FB_ID",
 };
 
 const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index dfcb91e02218..d8f2dd4d1525 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -371,6 +371,9 @@ enum igt_atomic_colorop_properties {
 	IGT_COLOROP_LUT3D_INTERPOLATION,
 	IGT_COLOROP_FIXED_MATRIX_TYPE,
 	IGT_COLOROP_NEXT,
+	IGT_COLOROP_LUT_3D_FORMATS,
+	IGT_COLOROP_LUT_3D_FORMAT,
+	IGT_COLOROP_FB_ID,
 	IGT_NUM_COLOROP_PROPS
 };
 
-- 
2.56.0

