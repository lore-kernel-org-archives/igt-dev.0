Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F457C54E56
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 21:14:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B326510F293;
	Mon, 26 Feb 2024 21:14:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CVNZQjQb";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2075.outbound.protection.outlook.com [40.107.223.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E64E610F28D
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Feb 2024 21:14:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E062tRTrgrNJG06gOu7KYNs2CP7g+OP2OtaOz3oevFNQVDXFXBNHgE6DMON/TkUggGH2t+4sdDHts8mcx/Vv+OPE41U2F2sGSdI6Vq++CHc2ZVyUZoBtNxdVtSy69eM2QLJh2MMiFxPIlU4+CaBCjXn+Q337IIFmwZD+HoGUkux1NM59gF2kcLA8gnDRAofEyxLY7KK6R573BlAdHIhmc60QvupipOXEW2r8QAUutbLR+FR9rzkjpIEIoXDWdyDrflBXdailTq7bGUvdWgRJ7vKyAL0CTqotWc0sZsfxgPWK4TaalpastyhZDh6/QD0QJbqmUIk/Fdk0KaG5TWiSWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QzgOISEIQP4xix4sWc+gVGZZ3PwuqSUeX1QRTQbt5vI=;
 b=f+LDhjWFQW4EGT2i6Ii6DI5464G5E6suRJK3VGbiwoSm1aew4TYGVgMFn46eyi2WAD2toghEGLtjxDxEFZ6GZ8wxpSlgJa91FiJ/gCKH1yM3Mz8sLbg0q+8NAaq4FQSrtVsM0WOOmhZHlIEnN+2AJ5WTzZJcVfiwq39IVMMc8QCevF9od6tjtDexj5gZ0nOorig24toY7yFqBBxVyFltKblCJLoT70Q6dBYBjrYwHxZnrfo5V0jS6jOBGpPc3fBPhXmnyC97ZytkuLPf3yFIKDFYg1N1Fyt5PF1ThcuOLbn5aQzDKfVPdGoDjh+rR4/JRBY1AUhftjqM7D+o/+uWSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QzgOISEIQP4xix4sWc+gVGZZ3PwuqSUeX1QRTQbt5vI=;
 b=CVNZQjQbr1+P6unP/vdVOxrrrQPrEo3OU7ZJ5AeiaGsmA/xA/z/lspZHbLGx2Yk+AD6tQ9bDF426xCG0OKt3d+kyCwYQTXBDm8OrjRNDYpcp4ICOGz/JfF+HVCuFUl8D1fOOPZgsvw9Pg1PA8b01OLCJdCFOXt5kDk3SMckr5U4=
Received: from MN2PR20CA0039.namprd20.prod.outlook.com (2603:10b6:208:235::8)
 by PH7PR12MB7986.namprd12.prod.outlook.com (2603:10b6:510:27d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 21:14:33 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:208:235:cafe::8e) by MN2PR20CA0039.outlook.office365.com
 (2603:10b6:208:235::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 21:14:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:14:33 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:14:33 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:14:32 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:14:32 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [RFC PATCH v5 07/32] drm-uapi: Add 1D LUT drm_colorop_type
Date: Mon, 26 Feb 2024 16:13:51 -0500
Message-ID: <20240226211416.100660-8-harry.wentland@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240226211416.100660-1-harry.wentland@amd.com>
References: <20240226211416.100660-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|PH7PR12MB7986:EE_
X-MS-Office365-Filtering-Correlation-Id: ff1cffd6-ef64-4b75-cf6a-08dc370fedde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c0f0mKjeJy/277OXHlNIBJxshfCQ9q6H+ARtl+YaoeO2IWZZIcg5GP+MsI1LALeuANgfhOcLP1OZ8TixPZDSkm30Q8wjsmujoH4jRlI7Hd+rVicX0WqCgUFonKN1HiC4WBVC9wtX4Mblt7Ba/Su5/GXFzDICRN3TwaPWyP1D73AWD9P4VO8Fzm0x2JyYsr6sFdIES8kElCGcpkds6fneGm+IkEGTJofC73vgrK8VGoFy5CFNXJUvjuv5pl4RZMbxvIsf3mxJxRvI9CH12bF5XXwZJgNcXL5KBPT51WJCzsff0AygfaHHUc+gpc8P/Dx40yuavsS6+vahx7B6UufqydhQofIoxMEwlKFAeoPoO8hNJGyM1/dYbYNS8uQWjUAyB0yg9/UdUTMWVNygkZSzA0+XAULW0sfFtH6j/QRBS9d5cicbz+iU8K6P42wWVigmOpAnv2zjkiT7jbgNidMHnioNU4p2NIwtGYOAG1QOTblA6xVvDCTwUHBqko2qI99GnH5RU/3M08urlm7ZfU8PigV/jLV9Gs12CDksAjUsboS55NrYpS0qxSECOpJjREMOvxDbkjomUwLggdMd0o7dExwKsv6XIN+1bv83W1TMKCg8ApiBZ9p4PPK3+k5nfGzfyJRXPOfpLujCoyrLF7SFvrquoy0RmIJXKE46Gkw/NF1PIMeSwYQL8Izsm7lttm0EhmYTCdRKNK1EuRzM1mLCoLeefSrHwdejyfYllzclayPz6LZaH6TnV7TQoItzyOYc
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:14:33.4294 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff1cffd6-ef64-4b75-cf6a-08dc370fedde
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7986
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
 include/drm-uapi/drm_mode.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index 358c5c313bd8..59dc8dcaa481 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -876,6 +876,7 @@ struct drm_color_lut {
 
 enum drm_colorop_type {
 	DRM_COLOROP_1D_CURVE,
+	DRM_COLOROP_1D_LUT,
 	DRM_COLOROP_CTM_3X4,
 };
 
-- 
2.44.0

