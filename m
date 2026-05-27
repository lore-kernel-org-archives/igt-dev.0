Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22572CD4F54
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 12:17:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C912F10E7A4;
	Wed, 27 May 2026 12:17:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jLhelC/3";
	dkim-atps=neutral
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013062.outbound.protection.outlook.com
 [40.107.201.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4250810E7A6
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 12:16:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vp5Tn46hJ68veihiFuWxxgW069Cl+Bfv6Slq37lCEbZAA8gHHuOYkduTGeLltEMwfgev+zkwBdtFZMudnSV1pc3YMdastlR51r4DK+kILmYsI/wPMwlLL4rDHX2Ic0Uu6C8m2iEpDSbQKXmxqt+IAFIVy70duPEpiNlCKwcbMhS34RvzhSzZaEWdkPXJL3HL8/ppI5ltBL6ZlZxFK3Yc2b6+fJOVXnIf0gUqI8VXtK4vbXTNKdbf0tDEitJc8fglT6HG+K7W4xv118Phk33sP3tQMkIDuCtLUF/jBF1SdpsrSPSnQUrUbwBnSrTQ7OVruGG4cDzsyP4EkRkPBASpXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gYBa3dCH0zwOswLpZeNvEVKCaKQcTdFMsrfIS48HGy4=;
 b=c0+e1FF8Nd/KTXqSMQJpPvbXj0I3qGfmN7JWy2CS3DAEM4peOWkgVjI/CC5Eb4ot/bv3ZRwIp+uY81FlanfmJysx+v7/I7QTa9ZQ0zY1sXR/TFymw5B9oKVVhDuFVvWdeTHV0RqWbFYqPauXAflDQ1EFBRoIBFFS0EETGEcT7oQjDGeaC49uV61TGSscgY9Hp8uwN8/1h5frU7NbOgjNcvcCEnZ7s1LL8Q83vzp6wvLiP+IXqVZ8PgzB4tt4z2YZOOte2DWTV9FzFQLYgoDByXWakCmCQzHz8nikJBhXkvB8OuXJmKEbOJLqKOPZuWt28o5QYFz61kmP9E1yZa7rOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gYBa3dCH0zwOswLpZeNvEVKCaKQcTdFMsrfIS48HGy4=;
 b=jLhelC/3ojnhx9rKKLAyp6jYJz8tGFu99To1ZrSm8QB+7gI9M+iVe7heZfZbqFe8idqIiPwF0F+KEr/SgGebe+dl0pEDBQAuC1kVbLmBzIEqAwRHGchWC9ZRiDC9AxQwdRFHQJhkV/WyOIHcG4fFss39Jib4hTgj7TNGQ8ltfuE=
Received: from SA9P223CA0002.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::7) by
 MN2PR12MB4111.namprd12.prod.outlook.com (2603:10b6:208:1de::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Wed, 27 May
 2026 12:16:25 +0000
Received: from SN1PEPF0002636C.namprd02.prod.outlook.com
 (2603:10b6:806:26:cafe::12) by SA9P223CA0002.outlook.office365.com
 (2603:10b6:806:26::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Wed, 27
 May 2026 12:16:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002636C.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Wed, 27 May 2026 12:16:25 +0000
Received: from caden-arch.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 27 May
 2026 07:16:22 -0500
From: Caden Chien <chih-wei.chien@amd.com>
To: <igt-dev@lists.freedesktop.org>, <vitaly.prosyak@amd.com>,
 <jesse.zhang@amd.com>, Jani Nikula <jani.nikula@intel.com>
CC: <Solomon.Chiu@amd.com>, <Peyton.Lee@amd.com>, <HaoPing.Liu@amd.com>,
 <Yu.Wang4@amd.com>, Caden Chien <chih-wei.chien@amd.com>
Subject: [PATCH i-g-t 2/3] tests/amdgpu/vpe: set blit test based on IP version
Date: Wed, 27 May 2026 20:08:01 +0800
Message-ID: <20260527120802.617332-3-chih-wei.chien@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260527120802.617332-1-chih-wei.chien@amd.com>
References: <20260527120802.617332-1-chih-wei.chien@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636C:EE_|MN2PR12MB4111:EE_
X-MS-Office365-Filtering-Correlation-Id: eb91502c-afed-420c-1806-08debbe9c620
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700016|1800799024|11063799006|3023799007|6133799003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: iEgCUPeF0vEhyU+dTQf2flzjNuOAjvvUpwk6bQWomTxMu3yMXQ4VcMOvJSzevrgWgdDGLBWHn+zaXaFgx2X40PkYsh7bN2UTQKtqm+nJSYYLw9j75LnpvGnDjrBfAvW+VB/VjRZFGo6ueavFB/oSINced72gEAC20WlgxcuLxMRTP7NUaibo9XQ9sSrGOKKhKsfCKop3Mu9GbK0X8i1ww7eA/XvJyj+EDEgm4IwR3/gofrcpVLPRqSMOZXFLr/sN1XCRrR2K3KhljxJIh/DxyoFK/5lY9OJvpkWW5MiTjOwVl7OsvpWcX5n4qEiFE/EBL83JnABo/PBZbSJLrNIIpU1yThX2G+c2MNXtuC0yXASqnNn+YOxSmeQvgA3lE4ooPHWR2NR2q+ORbhC2LB5+jfYakah5iD899BPdJSkzgSbQ0BmLW7TASb9sCgcenOG8b1A3VWRZ12ppPTtSC70eyHs1ooiA1WdFr15WZTxE7rfA6sqIWgY2ZIsW374xPw3TxzjPzC13xQ+K2a7jBVo9PnHvIjhbRaphH8OtYhuYAVgXvpi9UjM4FErjwYDCvRdGIVPO7LTvRpsiVsvKax7h+QYb3hd8o0qE57+4JXu8BzwG8IELmAMLLw/I3Ib9TW+YEu0JWKwDfkVQP3fnUbJNyy0SJxp7LpXY3B8QYMfgUHqeTTeOwMmmxryUor/zSaquxrPGQO5OGzI8JK+rcLgFN3tgG29X2FHWcWWXweSTzzo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(11063799006)(3023799007)(6133799003)(18002099003)(22082099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: JS2/8wxyEb/UJyknxgOV52BbVkIMSdrTekmC+jyl+wWcqwqj5fe67dR7NL6KsuznNqQONgZ2kJ5+rFrAuJcoclxtP+BLa/q6g692ns5f6Qx3EFI1R3cKeMFMX+8RK9nDzNFmC3hZvJG8xBRM43ocwt0UkuWAoPeDOGJdyluvN2HEOPdGD8HFFAOLxgkUqfon1qlzjypxMZQLhe3XRut6NCcEfYGGEs7ScV2oT/X/23vKYjx6j76Ek576xv7PE0m/oDPx/2UAmaXl5X9ZbiQCL6hgzXrIAhVOQVMDXdGxMYPXgDqCQq4XAyFxDWFdWpDZyGVaCACqqagGPD0Ytz5yzh5uN+f+fh7Myo5whnFlpX8qOBnWLDB4XlG7/2jlu6zKSUkbF9+W3kOq/n65GHWE4bUbVjCu49MyAlI245fFbxxeDNTllPQNtwFT4AeEHS3d
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 12:16:25.8304 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb91502c-afed-420c-1806-08debbe9c620
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4111
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

Commands for new VPE version may not be compatible on older VPE HW
(e.g. VPE1 HW can not execute VPE2 commands).

For test runner to run all tests without manually specifying which
blit test to run based on udertesting IP version, a new switch case
is added to execute the blit test corresponding to IP version, in
the single blit test entry.

Signed-off-by: Caden Chien <chih-wei.chien@amd.com>
---
 tests/amdgpu/amd_vpe.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/tests/amdgpu/amd_vpe.c b/tests/amdgpu/amd_vpe.c
index 809f22d17..9c72b1c0b 100644
--- a/tests/amdgpu/amd_vpe.c
+++ b/tests/amdgpu/amd_vpe.c
@@ -176,7 +176,7 @@ static int check_rgba8888_hmirror(void *addr, uint32_t width, uint32_t height)
 	return 0;
 }
 
-static void amdgpu_cs_vpe_blit(amdgpu_device_handle device_handle,
+static void amdgpu_cs_vpe1_csc(amdgpu_device_handle device_handle,
 				struct mmd_context *context)
 {
 	const uint32_t vpep_config_offsets[] = {0x34, 0x128, 0x184, 0x1c0};
@@ -337,6 +337,25 @@ static void amdgpu_cs_vpe2_hmirror(amdgpu_device_handle device_handle, struct mm
 	free_resource(&dst_plane_bo);
 }
 
+static void amdgpu_cs_vpe_blit(amdgpu_device_handle device_handle,
+				struct mmd_context *context, struct mmd_shared_context *shared_context)
+{
+	switch (shared_context->vpe_ip_version_major) {
+		case 6:
+			/* VPE1 has major version as 6 */
+			amdgpu_cs_vpe1_csc(device_handle, context);
+			break;
+		case 2:
+			amdgpu_cs_vpe2_hmirror(device_handle, context);
+			break;
+		default:
+			igt_info("Unsupported VPE major version %d in blitting test",
+				 shared_context->vpe_ip_version_major);
+			igt_assert(false);
+			break;
+	}
+}
+
 int igt_main()
 {
 	struct mmd_context context = {};
@@ -370,11 +389,7 @@ int igt_main()
 
 	igt_describe("Test VPE blit");
 	igt_subtest("vpe-blit-test")
-	amdgpu_cs_vpe_blit(device, &context);
-
-	igt_describe("Test VPE2 blit");
-	igt_subtest("vpe2-blit-test")
-	amdgpu_cs_vpe2_hmirror(device, &context);
+	amdgpu_cs_vpe_blit(device, &context, &shared_context);
 
 	igt_fixture() {
 		amdgpu_device_deinitialize(device);
-- 
2.54.0

