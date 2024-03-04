Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18BDFC54E41
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 21:16:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EE981125DB;
	Mon,  4 Mar 2024 21:16:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Y5sehw0O";
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7DCA1125DB
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2024 21:16:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ccatbRqZqCnzsygZYgiFtv+KTQSYFMPGKuRGqJwisvSSEJjPtNe4Csj+Jn9WW81hIVoJP5ttGOtGIVU0q6Xth5G0a8JFrO/iP4CG+rN5vX72iVTOTqrUqDiHEtc/sI/K3nkzh4mzaG8/BYIozfPbljC3QP0wKrk5KXEbOCAs0c9I3esM7YknXrAmXppyG4MePXgjWz4V07eyiVzy8GB5hHb1D//w84E9suWftLy7vsBSMs73ANYHUYQA7Uh7j+3H1gCcA6p3x8XhNHQfqA5aXUAGzYfJnndaBp4CmLnAw7n1YkSeBLrxyh0oHCgxjmXrsophqtT6i0RyJyGybzYnRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fJsScjMSExm69nidsT2rTSykpCp0ZHrYzrqgYnNRY6Q=;
 b=BErMkEPckvemXlSqCOPOT+bkHZfHQmJ45VK4HdFTTDhwaw+PikI2/t+PQcxjI4JsN3Puz8wsFmUWlq4P7PI/nRKM/XVOnWRcmlVPGHOQVNsURzRmSfxtRtxfsA9hkwIB2VORTZNYOVPMSaVAd9+I7GnHgkWJ5B4CqDDYRxzCb4b9vl1GJeTgMOqFSE9a+3CcWEcJzFgXdfK6ueC0WEYt//+Ko2z5cJ9F/CuGeNaiEHUw4/tNsRwX421ZBgGNy8uzdoYYXTIDFpemiJqJxwq3rc/MtvQ7tbuZolz5UggqATfbVb+dCwub82QERNMqX3lOlLpoBvWDEf0dMEi03W3VBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJsScjMSExm69nidsT2rTSykpCp0ZHrYzrqgYnNRY6Q=;
 b=Y5sehw0OPcedks/MiDOeyJMRqVY2cQMKo/dds3Ys+24IM6D8JCfoCDwYZSZ4O3lmfem+W3AmeQSH7yRk/+uDXcuHmqTlNVJZk8qVmxg5bijEtVnH/7GN+PbB2b/4teplfJFRenRDnvcSerxchNW2q9kZj68l6SB6Wi3LwNAvCpE=
Received: from BN9PR03CA0515.namprd03.prod.outlook.com (2603:10b6:408:131::10)
 by SA3PR12MB8047.namprd12.prod.outlook.com (2603:10b6:806:31b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Mon, 4 Mar
 2024 21:16:38 +0000
Received: from BN1PEPF0000468A.namprd05.prod.outlook.com
 (2603:10b6:408:131:cafe::3d) by BN9PR03CA0515.outlook.office365.com
 (2603:10b6:408:131::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38 via Frontend
 Transport; Mon, 4 Mar 2024 21:16:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF0000468A.mail.protection.outlook.com (10.167.243.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Mon, 4 Mar 2024 21:16:38 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 4 Mar
 2024 15:16:37 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 4 Mar
 2024 15:16:37 -0600
Received: from desktop-host.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 4 Mar 2024 15:16:37 -0600
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Christian Koenig
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Michael
 Strawbridge <michael.strawbridge@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Petri Latvala <adrinael@adrinael.net>
Subject: [PATCH] amdgpu/tests: Fix vce enc test failure
Date: Mon, 4 Mar 2024 16:16:32 -0500
Message-ID: <20240304211632.184249-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468A:EE_|SA3PR12MB8047:EE_
X-MS-Office365-Filtering-Correlation-Id: e51175c3-e177-4f0c-cb16-08dc3c906134
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LMLtGAIMNksSRTyXERMl+tYoEnI+1mt1aB2r6iFPwBZ8O90HcUO6m74mUmudvJEw1c8IlnnQT2Pj5EQJ5y2PE5HqV4H5XrXDEpxcdO9hAmzXVua7VUv/QoDCLcElRwTa927cA6OnLxkRjkYsGPzttAmWp3D8aoFlgAXzu22XR2Pnis6wDItaIewlC8F0llAjRrD0Zoy80kwLmEiI9EidxiTDa/Spvhc+5eZG3y2BbxgDHLyIAXquQJcyYN78RhJwSnb/AGr4AcD+XhD22kK2PzD3Ek1FdNjlH7kXzRCmU/phsjuSofFj89ORELmFW0SDRxne3PEClfyHUFxSm2gDXxrt5pX3RsoGcBXl4dtMcmhLyR/5c/6WIArlqqhC/1XhF1cSHH/uNDKtIROpLyNXvcRKoG9rET8Ry8R70iVlqAw2rVXm5OobwPPQEJbcPCrKVG2tWhiEi4X9We72hJm6dkGAgpJqkHl42m7EBXpIJAIJkLMZZSxH+pgx3IY58iXMqX2JGCHptcTTGr+t3X9IvEc1XFT3ZzzMC9G8/aW6zER5INVl3OICJueZs88/c5huBB4cEsR+p1611I1zGpEx+xDCKv3szp3mbb4XFSs6HfpdyDKY+KIsazJqoh06gGoYAMNtLjtKvFKYZrExkrDzjP3kFrdSUtq9+AcFtkqu2puhMTcpCCpaflVthvOPfHYIOzouiRTu4/yvsewKcYcFD6opjjBYI8fa3nr9qFj4ODPFwrYe775U+FBNUCOXtLRx
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(82310400014)(376005); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 21:16:38.2949 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e51175c3-e177-4f0c-cb16-08dc3c906134
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF0000468A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8047
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

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Combine the following sub-tests: creation, encoding
and destroy as a single sub-test for vce encoder.
It is a similar change as commit 40ed74461d8a44657a0f4799ade86116722d3ea2.

Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Michael Strawbridge <michael.strawbridge@amd.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Petri Latvala <adrinael@adrinael.net>
Signed-off-by: Michael Strawbridge <michael.strawbridge@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_vce_dec.c | 32 ++++++++++++++------------------
 1 file changed, 14 insertions(+), 18 deletions(-)

diff --git a/tests/amdgpu/amd_vce_dec.c b/tests/amdgpu/amd_vce_dec.c
index 364534955..51902802c 100644
--- a/tests/amdgpu/amd_vce_dec.c
+++ b/tests/amdgpu/amd_vce_dec.c
@@ -552,6 +552,17 @@ amdgpu_cs_vce_destroy(amdgpu_device_handle device_handle, struct mmd_context *co
 	free_resource(&enc->fb[0]);
 }
 
+static void
+amdgpu_vce_enc_test(amdgpu_device_handle device, struct mmd_context *context,
+		struct amdgpu_vce_encode *enc, bool is_mv_supported)
+{
+	amdgpu_cs_vce_create(device, enc, context, is_mv_supported);
+	amdgpu_cs_vce_encode(device, context, enc, is_mv_supported);
+	if (is_mv_supported)
+		amdgpu_cs_vce_encode_mv(device, context, enc, is_mv_supported);
+	amdgpu_cs_vce_destroy(device, &context, &enc);
+}
+
 igt_main
 {
 	amdgpu_device_handle device;
@@ -574,24 +585,9 @@ igt_main
 		igt_skip_on(!is_vce_tests_enable(device, context.family_id, context.chip_id,
 				context.chip_rev, &is_mv_supported));
 	}
-	igt_describe("Test whether vce enc is created");
-	igt_subtest("amdgpu_cs_vce_create")
-	amdgpu_cs_vce_create(device, &enc, &context, is_mv_supported);
-
-	igt_describe("Test whether vce enc encodes");
-	igt_subtest("amdgpu_cs_vce_encode")
-	amdgpu_cs_vce_encode(device, &context, &enc,  is_mv_supported);
-
-	if (is_mv_supported) {
-		igt_describe("Test whether vce enc encodes mv");
-		igt_subtest("amdgpu_cs_vce_encode_mv")
-		amdgpu_cs_vce_encode_mv(device, &context, &enc, is_mv_supported);
-	}
-
-	igt_describe("Test whether vce enc is destroyed");
-	igt_subtest("amdgpu_cs_vce_destroy")
-	amdgpu_cs_vce_destroy(device, &context, &enc);
-
+	igt_describe("Test vce enc is created, encode, destroy");
+	igt_subtest("amdgpu_vce_encoder")
+		amdgpu_vce_enc_test(device, &context, &enc, is_mv_supported);
 
 	igt_fixture {
 		mmd_context_clean(device, &context);
-- 
2.25.1

