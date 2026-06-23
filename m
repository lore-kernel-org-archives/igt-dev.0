Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA57CD98F2
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jun 2026 17:59:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF55D89A77;
	Tue, 23 Jun 2026 17:59:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tdl/Xbk4";
	dkim-atps=neutral
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012003.outbound.protection.outlook.com [40.107.209.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DD4910EC3A
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jun 2026 17:57:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l7N9DqqbwulBeVrGTicjCwxh+172Mo6XWmR3TNDjl1wap8LXU4PUdv1RL1nZ3TeiUaSQEcJtdUoCcAimmvmZP6/6Qyv2LlIZKem8sQN4dMz8gUbJmVHdOAAztJYVaM0NSXNzMqnM7cJhiU1MoOggOK1yjPH255aLdsowwmodqkfWw4Pe5LyTwsxQpaMrlup1dpNkecybPuoFNiJBn4D0CgYPCUoFOWyWWmXInAz3rUYgprkK5E0ovnI+3g90mcVgeh5a8XeUnVoTjlWa8i2Pla7Lcu0g4viLkTaNiAgPNmRVWeEv5ZwaJfr0kFsi+FyLpg6UYQ22+COFtcsODO8EsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GGEGDjYcMTZmsfE6VVC3TEgpiFJXglQ4zU9W6UpWlO0=;
 b=lejkK43VsoNamgjJGVq6I3quM2y9nr8s9yK5jHtf2TtLrHNjeVRmsq7+9mdX/MANcjc0n+9rep4KxZ8NvDTBEJU5T2zkfX2TZtJNFgYz2NV2YENPCeXfayp7C+FscgG2pStwp5Ktbz5Ol7+n2zfzDwnOrA4bqP+NwJkSQcVqU2DcXi5ltWV8vQc+sEHqxmGPXCDUCoUbwnioBUTdZU0vVhiWiaZARCddd0ELGFCvt8AkfogZWUYWpKYg9pdU2I14P7jm/3wISL9TvkhyE3MTbtLxqtDjBpEw3hfveqtBPurNyrUaqVuIktkN8czS/Ml90UWPB5rjRr/D0Dxqp/H42Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GGEGDjYcMTZmsfE6VVC3TEgpiFJXglQ4zU9W6UpWlO0=;
 b=tdl/Xbk4nQfzrxFJSPnkCL5lQcULi+foiX5AoXCdWg3XFlgI8WofuwU4W0QpjAH5lUfA1tXrmtqdwfmw6CwMFTKIdIyRsFLD9JoUrlL3uDe4WQms1N3SRdFkFMXvBSfr4FhfcyB8nliBKaRVolPe8c2J2u2aS8ZIjEkNmSmxVmI=
Received: from BN9PR03CA0601.namprd03.prod.outlook.com (2603:10b6:408:106::6)
 by PH7PR12MB9104.namprd12.prod.outlook.com (2603:10b6:510:2f3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Tue, 23 Jun
 2026 17:57:48 +0000
Received: from BN1PEPF00004680.namprd03.prod.outlook.com
 (2603:10b6:408:106:cafe::10) by BN9PR03CA0601.outlook.office365.com
 (2603:10b6:408:106::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.13 via Frontend Transport; Tue,
 23 Jun 2026 17:57:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00004680.mail.protection.outlook.com (10.167.243.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Tue, 23 Jun 2026 17:57:48 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 23 Jun
 2026 12:57:47 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 23 Jun
 2026 12:57:47 -0500
Received: from hwentlanryzen (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 23 Jun 2026 12:57:47 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v3 04/12] tests/kms_colorop_helper: Add helpers to get
 encoding/range from FIXED_MATRIX name
Date: Tue, 23 Jun 2026 13:57:29 -0400
Message-ID: <20260623175737.171142-5-harry.wentland@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623175737.171142-1-harry.wentland@amd.com>
References: <20260623175737.171142-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004680:EE_|PH7PR12MB9104:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cf37baa-8753-4e04-c2b0-08ded150ef9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|376014|23010399003|82310400026|1800799024|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: g+nTvAdHLxCAmfhrrSlGkOzB7ATMWNgB3PWyIY+2bRt2HqufdRmBdr9zn0TC0bcO2SWwyb36Yq8O3HIhMpzEf9JtPRFq9Bv9OHcha+nzvr4R4i57AG0+KeD0VC6drGFzDBHIXgYWpltLGi2BEyHn6RjVKxZ1xxaytthzwrF++uTTJvgTHrDM6oocNQpK6xjBk74yWBSM2N7dx4qu+0gae+uwyNaJWESLCAnICELz/k60jiY6caciwxfMncjTT1p3EEQoOz95HQm95/3+z+pXsck5LbHwUIbjjJ21Wserodd9yBIgrP6Sp+0/1MyxhYZyXgF2V6OyJwfbK4Tcv1LSJRvB8SW1okxT0haIdaWHa9AAMQxnYNupGkHW/nnJ5Krd5LGcCSIv43uzJhhSmSRnLGZ2CDykJ5IF20/8IxX0pb4SJEQwCnRnvIMW3HX6L1D8/b1w7WZ7cNb9VYqGlxqXhRmzlqio42fyNYpm5xnFRALbvRtGw6kXFCA5XgC1tmnFk6Ada4b3j8Fx0t+CAa31PBBFbM3mHRsGF+mgYv36onkyyF8CSpK0NfZe9PYUfIN+txvLssrX/ivc6KlKI5VzIJ73rGOeCaH95oeaxu2hoOT/+JkyWR/6LioyEqwLAKLRC4IyYr7BRDmWnCYe3Zvb060vHjeYz70E+dtuGBtC8otbA8JNrxH1mxq33GkL+wz6Yp1U8uj0kb9NEo4imf1lAw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(376014)(23010399003)(82310400026)(1800799024)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 7YU1/dQHlW8fVG2dfgql2c5PfukS1lFiE3TocwK1oVp2WXn1LVr9ZDLaYXClB1s/1nCaD95+Vp61Pa97J7Xd3s0pPUXFNgrRT8r2xs7WdclRKnFhlbaXXb0L7f23tiIlCjqHwyj48gMsYC3kv8TgImGLZrxJtRDdCHKHnp5vtb6mVI8I86dWryXQKSjWpTV05jKRJb6RvnAFqePt2jYh4DPi2xbh6NTbqvtUHESDS/eHUtKpyhNiRNiTSOHfEbuwH3JgQ77/zWf6WIU1W6Q88wyZOJ5e1/c5mo2R3gOktN8DZFETqjyjzVj0Y/u3f4kuBmexAZVONQgf0A3xnolnwK5U5UOoQ0pAJgjYXHQhs7XOUin4SSfAbaK/IcGm/JkFPeQmXf7OMjc/EJ3tNGtuI6uv9q5LqoIkqHo60ZhW2IKXUf77ShWV64ZDiWWqmuul
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 17:57:48.0581 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cf37baa-8753-4e04-c2b0-08ded150ef9f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004680.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9104
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

Add fixed_matrix_type_to_encoding_range() to map a FIXED_MATRIX colorop's
DRM enum string name (e.g. "YCbCr 709 Limited to RGB") to the matching
igt_color_encoding and igt_color_range. This lets the tests derive the
encoding/range needed for the software reference CSC directly from the
colorop the hardware advertises.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop_helper.c | 30 ++++++++++++++++++++++++++++++
 tests/kms_colorop_helper.h |  4 ++++
 2 files changed, 34 insertions(+)

diff --git a/tests/kms_colorop_helper.c b/tests/kms_colorop_helper.c
index d12584c9adb1..e589fa5c99a9 100644
--- a/tests/kms_colorop_helper.c
+++ b/tests/kms_colorop_helper.c
@@ -473,3 +473,33 @@ void reset_colorops(kms_colorop_t *colorops[])
 	for(i = 0; colorops[i]; i++)
 		reset_colorop(colorops[i]);
 }
+
+static const struct {
+	const char *name;
+	enum igt_color_encoding encoding;
+	enum igt_color_range range;
+} fixed_matrix_type_map[] = {
+	{ "YCbCr 601 Full to RGB",		IGT_COLOR_YCBCR_BT601,  IGT_COLOR_YCBCR_FULL_RANGE },
+	{ "YCbCr 709 Full to RGB",		IGT_COLOR_YCBCR_BT709,  IGT_COLOR_YCBCR_FULL_RANGE },
+	{ "YCbCr 2020 Full to RGB NC",	IGT_COLOR_YCBCR_BT2020, IGT_COLOR_YCBCR_FULL_RANGE },
+	{ "YCbCr 601 Limited to RGB",	IGT_COLOR_YCBCR_BT601,  IGT_COLOR_YCBCR_LIMITED_RANGE },
+	{ "YCbCr 709 Limited to RGB",	IGT_COLOR_YCBCR_BT709,  IGT_COLOR_YCBCR_LIMITED_RANGE },
+	{ "YCbCr 2020 Limited to RGB NC",	IGT_COLOR_YCBCR_BT2020, IGT_COLOR_YCBCR_LIMITED_RANGE },
+};
+
+void fixed_matrix_type_to_encoding_range(const char *fixed_matrix_type_name,
+				   enum igt_color_encoding *encoding,
+				   enum igt_color_range *range)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(fixed_matrix_type_map); i++) {
+		if (!strcmp(fixed_matrix_type_name, fixed_matrix_type_map[i].name)) {
+			*encoding = fixed_matrix_type_map[i].encoding;
+			*range = fixed_matrix_type_map[i].range;
+			return;
+		}
+	}
+
+	igt_assert_f(false, "Unknown Fixed Matrix type: %s\n", fixed_matrix_type_name);
+}
diff --git a/tests/kms_colorop_helper.h b/tests/kms_colorop_helper.h
index 68ae1dd05c6f..539067b5a494 100644
--- a/tests/kms_colorop_helper.h
+++ b/tests/kms_colorop_helper.h
@@ -115,4 +115,8 @@ void set_color_pipeline(igt_display_t *display,
 void set_color_pipeline_bypass(igt_plane_t *plane);
 void reset_colorops(kms_colorop_t *colorops[]);
 
+void fixed_matrix_type_to_encoding_range(const char *fixed_matrix_type_name,
+				  enum igt_color_encoding *encoding,
+				  enum igt_color_range *range);
+
 #endif /* __KMS_COLOROP_HELPER_H__ */
-- 
2.54.0

