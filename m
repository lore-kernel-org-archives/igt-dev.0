Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF6AFED9E7
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 16:05:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C9010E587;
	Tue, 17 Mar 2026 16:05:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="a+LKDstb";
	dkim-atps=neutral
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011049.outbound.protection.outlook.com [52.101.57.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B658410E6DB
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 16:05:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UqZ+9UoEScTNVx86tjWnyunEfv3AY6maZM1odzBaR447Jy6X+anBhcT62Qs6PvvyP3601OpqdkYpxWvrMu7JW4zRChnUDGqKRluPL326KBj35BZfWwMI1R5fJgqipz/+oO1F6sRkWYupdHa08qcozTHZ5J1R8v5l0OnWCJc59TNp2+1FkNWL2mOnWA6fJIAgb8eN+My3of+QvqN1rG/ht/9tBoPKuN3DZKGyuLjOAhswyFilEE5ZgN3w/nyWlu5s06POZ+2Zxxjb1CaYW572VF9WX1c4coKzuXOtG0B8T0dTgTTgePQ3ajrADtejkJFa5gTr/rs/830edSl3Iv8r3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QRseWOoq97i52aQ1i1+iPJ6xKv1uOHdDnitgn2JkUss=;
 b=ic+8ObHrNjT6QRi/fdH5BbbnXKKiVPOoP+7qmxJL6jgHDuV4nn5sDfbQY6qxGis9L7WF/KPS/fE6LaroPIxh/bm4YQSf5wS3YzMuWDlzU2AWciczdJVM8/MX+KbzkHw+jL1PWPMS7V1+4xhLTD8V7Lwf9ISt/d0xoIVh9afHt2P9rC+UrFS+3SILS4rQ0QpLUZVhAG5iOdy6qZz59f4fmZXLc9XgkzW4RrKhEevGWVeeOAaqbSJIofK8TmT6RNRWH3uIcDBpxqC8TpTMZG/na+v4MC7EhhEDKLq7MyjnLkD910kXa3abmz94mJD5aylhtR/QT3yAIsRlvySiXjiyZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QRseWOoq97i52aQ1i1+iPJ6xKv1uOHdDnitgn2JkUss=;
 b=a+LKDstbIlMokO4+Xg3+uwOI6DY8RfQyloD1awEhfH7XlyRABFK+OMmS5pP5txw4OLXerCC1I/Iy5AfSf8x1+EHJMxdbJqeg79LiRfcUosWyzA9DJtFt6uXzhHxD3G30gHBhiFwZGrZn2lkWUCL0o5u9YebgMftIBZCLTusmn5I=
Received: from SJ2PR07CA0012.namprd07.prod.outlook.com (2603:10b6:a03:505::13)
 by PH7PR12MB5997.namprd12.prod.outlook.com (2603:10b6:510:1d9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Tue, 17 Mar
 2026 16:04:57 +0000
Received: from CO1PEPF000075F4.namprd03.prod.outlook.com
 (2603:10b6:a03:505:cafe::dd) by SJ2PR07CA0012.outlook.office365.com
 (2603:10b6:a03:505::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.25 via Frontend Transport; Tue,
 17 Mar 2026 16:04:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000075F4.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 16:04:56 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 17 Mar
 2026 11:04:47 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Mar
 2026 11:04:47 -0500
Received: from hwentlanryzen (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 17 Mar 2026 11:04:47 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [RFC PATCH 02/10] lib/igt_kms: Add CSC colorop infrastructure
Date: Tue, 17 Mar 2026 12:04:28 -0400
Message-ID: <20260317160443.229812-3-harry.wentland@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317160443.229812-1-harry.wentland@amd.com>
References: <20260317160443.229812-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F4:EE_|PH7PR12MB5997:EE_
X-MS-Office365-Filtering-Correlation-Id: 5201dc91-e5bc-4f88-585c-08de843eeef8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|376014|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 8yVKOfhqaBPHjS7p5mpQY8szfWJoK1lLbpStyoVxZ3b5anmrrTpiY7YbsAUXfmoh+zxM++izHZ7n9729oZG0n463/b2MPpMgqN2oD7fyHL7a7dJ1Heh5h6SxGeRSXUi6g829G37uUHHtpSqmI8tuYVRZdaEdIjCIg3aTXd6xhU85jVJAfkOUQ12fQpQ4zUsjZbGj0c2ztke8xLZINat7xyLWPPAz8dePyZ9G2v1Gfq+hyXf2U9RThb/pC6Wzyv/DonkQtcKfbrCOEwgxvOB5HoRWtEdsxH2AMTZ4LfJIRHA0lYscmJFNqmS/IdYEYhLDQ43fHr+fdSjFVJ3dNz7uPKAav3LKA1vqLOkV0PJp3Z7II/CH//RjgarOqGWfyotWLUFPHcEdIVB1hK4BBrzQrq5zwNNkt2hr7+PDCTcaySk8ISFXoM+nJy2ZytRIfaX7WwVXNyOZ63wYN5Nnqmu4mPVpxcNpwsANooWWqDjUEU5SoVl9xMDJPZy7bMTDa6Oi/YK4L12Na+JJiNY2L8kxHs45qYNweL0WfdOJiEOcaNAOQdMqJ/dmYNAzgiBCYg8YMN18GXntNc6QeUPg1FKfCXQBP5ACI86CaztSGVjfXf0eECouD8D9OaddIb8hXhm+srzYBWD6ce0G7JtkY2xFqFzOOUH7S+HhwB+ZRCe5QbqjmTbC9O/7hujCeS0gnD7giGyb4o0ZsfNdk/JWNvDYgkBJkmY8lIhmwZ/4x8YAGV9zH/PgiCwQ9XR5DlsCDSpSSNbWV0MNeZqAbYgAynu+jw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: z7soylMa7HyFgvbHh6yLyZiFVvfAGpGpVqnIKwp9ClXCx/dMrDw9nIgwhLx8F4HJJ0vYpZl/gdCB50I2N53Qv+PcYfzx/hd7bLqc2a8GgMvfBznmlfVYlYAVDwBnlTdOf7eAnQxUrPx+gH76dVbIbwLRKdpTiRXSY2EENZSfGaqkm10oCXWK8fZO5o/8+P6txIjUkfTGkSkPc6RzdrKdZ3eCHQagsWJaTiG2PvTj3YfmjiOTa8JjezvkKDlUBA4yWzKXGVFHiMCbRqeJ5joXWk4oFJOH162k8slNrYUJesl/LX+240nuxmRP8oQtoj8SSq3gXB6KGf2Chkl4ZzaxyB1ZZhFpykS4ZyeV7Xd43zaxMXbK1LA8iNOMgXVebifcS7nYWqDWxjcZXRXdw/Hg/RzRo0Gm+/p0NMhqn/2xfyV5n6inmCmHLMKoloWU48l4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 16:04:56.3906 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5201dc91-e5bc-4f88-585c-08de843eeef8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075F4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5997
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

Add support for CSC (Color Space Conversion) colorops in the KMS library.
This includes:
- CSC colorop type handling
- Property management for CSC operations
- Integration with the colorop pipeline framework

Co-developed by Claude Sonnet-4.5.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_kms.c              | 2 ++
 lib/igt_kms.h              | 2 ++
 tests/kms_colorop_helper.c | 8 ++++++++
 tests/kms_colorop_helper.h | 9 ++++++++-
 4 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 57f5e099a313..ce509b7c8040 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -716,6 +716,8 @@ const char * const igt_colorop_prop_names[IGT_NUM_COLOROP_PROPS] = {
 	[IGT_COLOROP_MULTIPLIER] = "MULTIPLIER",
 	[IGT_COLOROP_LUT3D_INTERPOLATION] = "LUT3D_INTERPOLATION",
 	[IGT_COLOROP_NEXT] = "NEXT",
+	[IGT_COLOROP_COLOR_ENCODING] = "COLOR_ENCODING",
+	[IGT_COLOROP_COLOR_RANGE] = "COLOR_RANGE",
 };
 
 const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 0bb2734ea3d7..d846ba01d925 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -359,6 +359,8 @@ enum igt_atomic_colorop_properties {
 	IGT_COLOROP_MULTIPLIER,
 	IGT_COLOROP_LUT3D_INTERPOLATION,
 	IGT_COLOROP_NEXT,
+	IGT_COLOROP_COLOR_ENCODING,
+	IGT_COLOROP_COLOR_RANGE,
 	IGT_NUM_COLOROP_PROPS
 };
 
diff --git a/tests/kms_colorop_helper.c b/tests/kms_colorop_helper.c
index aaee4e567ef6..9ea30bae60a3 100644
--- a/tests/kms_colorop_helper.c
+++ b/tests/kms_colorop_helper.c
@@ -218,6 +218,8 @@ static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_
 		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_MULTIPLIER);
 	case KMS_COLOROP_LUT3D:
 		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_3D_LUT);
+	case KMS_COLOROP_CSC:
+		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_CSC);
 	default:
 		return false;
 	}
@@ -362,6 +364,12 @@ static void set_colorop(igt_display_t *display, kms_colorop_t *colorop)
 
 		configure_3dlut(display, colorop, lut_size);
 		break;
+	case KMS_COLOROP_CSC:
+		igt_colorop_set_prop_enum(colorop->colorop, IGT_COLOROP_COLOR_ENCODING,
+					  igt_color_encoding_to_str(colorop->csc_info.encoding));
+		igt_colorop_set_prop_enum(colorop->colorop, IGT_COLOROP_COLOR_RANGE,
+					  igt_color_range_to_str(colorop->csc_info.range));
+		break;
 	default:
 		igt_fail(IGT_EXIT_FAILURE);
 	}
diff --git a/tests/kms_colorop_helper.h b/tests/kms_colorop_helper.h
index a081fa02db8e..eadfa5401341 100644
--- a/tests/kms_colorop_helper.h
+++ b/tests/kms_colorop_helper.h
@@ -22,7 +22,8 @@ typedef enum kms_colorop_type {
 	KMS_COLOROP_CUSTOM_LUT1D,
 	KMS_COLOROP_CTM_3X4,
 	KMS_COLOROP_MULTIPLIER,
-	KMS_COLOROP_LUT3D
+	KMS_COLOROP_LUT3D,
+	KMS_COLOROP_CSC
 } kms_colorop_type_t;
 
 typedef enum kms_colorop_lut1d_tf {
@@ -50,8 +51,14 @@ typedef struct kms_colorop_lut3d_info {
 	enum drm_colorop_lut3d_interpolation_type interpolation;
 } kms_colorop_lut3d_info_t;
 
+typedef struct kms_colorop_csc_info {
+	enum igt_color_encoding encoding;
+	enum igt_color_range range;
+} kms_colorop_csc_info_t;
+
 typedef struct kms_colorop {
 	kms_colorop_type_t type;
+	kms_colorop_csc_info_t csc_info;
 
 	union {
 		kms_colorop_enumerated_lut1d_info_t enumerated_lut1d_info;
-- 
2.53.0

