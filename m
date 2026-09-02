Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C01FEC624D4
	for <igt-dev@archiver.kernel.org>; Wed,  2 Sep 2026 15:59:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66FBF10F2AB;
	Wed,  2 Sep 2026 15:59:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mHTaO/j1";
	dkim-atps=neutral
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011052.outbound.protection.outlook.com [52.101.52.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A533A10E517
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Sep 2026 15:57:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ddW+48P3/FkAjMybjrJ9OpcmXQBmDAJrxPLk43Prxi8a8aTiLrZXnEhGfCCOJPAFr/YKOssnZrbG4Xe8zUnGZsHDFEuRTgTzonR1tu4k5I7xUei9iFdF2pI8ocd1o7fZB15zSgfLQvC9LzzAAuRCdrkHAwjILaiASYHYumD/IDz9le+gJt4u8B/0Ql16av7BKXMLSCGp2s41xUsDxPkyb+OLrJryy3/oK3WiUDNPJuaZG8Xqi8XvQfD4tpRdHtr+OVOQUDMsDrOZAmP5OsqPkkdOosbHupjXVcXvL+i0yPGitPISmvGMtji4WDLZagOeKmPwVkEj4OZf+oLdbvsF1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JOKHPwSBUBkK9OxhkUxQThWTS3zs0nJYBj4M5+omW9g=;
 b=Bw5JxUscN2f0i3Cdr77hxO7Fnh1DG0dY5qN7WLTapESNUu3ryVOaCHqlQzum2GYl2uaDbVzKqZ8jvt+J0TAAUBVKBjEstxl7czSoWrKL8sGjtkfixCvk8AvvvLd73I7JCicIQf/BPHYHATxYmjBjTEXPZKM6toxwJcMs57sSg9UJ1RzfHFG12/Eoj5wHVAYQlvmhdyjaRR5fnjDYSiaDOgQvYk6Mw2LuzaQlEUfnbVKN3arkH1+gqoyEdXDW0momHO+nT3JYzvyGpACfNr/Uf/Zn/wC3Bhx5TYR+I59LYkblc1FYjv3IrCzbqyNt94Z4aMVS9C2cba/1wLaK1fDBFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JOKHPwSBUBkK9OxhkUxQThWTS3zs0nJYBj4M5+omW9g=;
 b=mHTaO/j1r9LPqhcCpwadNUMz6JGcQw9DtuVgMR7zai6AjNZPhI8E/SptFj+vV/oU/hGAy3/Wg4/KU0CaPQ0dELIF24hc4dcVYSRtc3jCeiIK2hW0ea6P4qFFT/hFbywKfFULedtsnD1IFhMYaHn2PsjNRhOpkr7FbAPrPRGBNKg=
Received: from DS7PR07CA0004.namprd07.prod.outlook.com (2603:10b6:5:3af::13)
 by DS7PR12MB5912.namprd12.prod.outlook.com (2603:10b6:8:7d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 15:57:45 +0000
Received: from SA2PEPF000015C8.namprd03.prod.outlook.com
 (2603:10b6:5:3af:cafe::98) by DS7PR07CA0004.outlook.office365.com
 (2603:10b6:5:3af::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 15:57:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015C8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 15:57:44 +0000
Received: from georzhanmkm.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 2 Sep
 2026 10:57:44 -0500
From: George Zhang <george.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Fangzhi Zuo <jerry.zuo@amd.com>, Ivan Lipski <ivan.lipski@amd.com>, "Alex
 Hung" <alex.hung@amd.com>, Harry Wentland <harry.wentland@amd.com>, "George
 Zhang" <george.zhang@amd.com>
Subject: [i-g-t 2/2] tests/amdgpu/amd_dp_dsc: Reset link settings after subtest
Date: Wed, 2 Sep 2026 11:57:14 -0400
Message-ID: <20260902155742.990457-2-george.zhang@amd.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902155742.990457-1-george.zhang@amd.com>
References: <20260902155742.990457-1-george.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C8:EE_|DS7PR12MB5912:EE_
X-MS-Office365-Filtering-Correlation-Id: 66fea902-3c02-4d8d-f37f-08df090aed94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700016|23010399003|376014|22082099003|18002099003|56012099006|3023799007|10067099003|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info: EOHAi5DOcTeu6zfNJH8M10PIXbt6ufnQAAU3vUwgBPZvGB9qhdPEnzT2mogm5ud7Tnoee3G4oGfbgXmHCo32n36UOQazwqGGVCeWpYNgzUfPkJlyPo5JnUjTpI6tT6BZ4/TmY7L0aPtLIJKTyc987t1lrjHQhXs8bHvJkwAQOhn+J5gdJfxNhqrpZcSeYZ0fExqagm0fWxwl/Dkzs/gG0wL+gnRH8IKFX+S2KkYgJoy9e5sv7pYKIht5S3K8YIH8rIyIMyStM3+UzxYWN+4KuSNZIQihCSGq8L+s1p5rcgsjNSCiXcHxqyQsGQR4JTARbUh+0fc7ZZvEss6gb0gY/e7TM4lAHVL18sYxwmgvJB4FZ1JZaepgBSO4/fLapypv6IBuj7vajwIwiH6NnpL51TqWJoQPhhq8B+djmQpkKfRaaeA/is5mnPWaPczt5JjZIJ4efFcVgmxoJgtodXlAd2vGBOE1e8qwULy0s0fUgZA4l4x39Ci2hEWhNFoerbp44Bj8Tpx4uAnp49FkA7GUc/U2fAkZRG+adpAmHMWZeiklV4Y+lYYHXUrWBaY47xXr4uDcqRx6hSkyDHiNwztRpy5AmxSEr0+ETleiCP9TywvqID4Xd3h9IqNyrUOZKepueOaaJbsZ8U9M7MTyvwKRB8HymdPw5xnmOLeEI1EhJIvVr3nVn8K0VKMdTpjXzrvrpFg+HkhmKac2f+xzLZ7FlA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700016)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(3023799007)(10067099003)(11063799006)(5023799004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 8Ib0cFHBcBus7MCEyRVIw4rMVycGiwLMne3GYXTfcoj9EIqarwzLXhPXCiiyHSEFkVdEMhbO1fmNWwuJKekDCOvl+uEft+iFJV483tbXoBrVFclEPe6mElvwkjj0E0pdxACq7Za7kK1ovlc8+c+AkV7NVho7oZ9GR51Sh0la/kDX0t7gyoDeERyuk2pchUsgrXR/3zvtPDX74IXrb9ubTsxDdqvcIWBikaGhYNeQ45eV8aVwRoA5VLUo/LR44C7ZeM+TZ5Ao1Mi7JsEHmgl3TIHJm+G0RCaxWp8kIjQkd/hIndD8Mo0CjOngTnwLD3ezbc4fCmo7myL/6KsRdtN4CVhbKUIfHl7+RwHxrmkkHurOfO6KdBglbI4HvD2edIfgQXrGhI2ThdceFLJDoagI4YaJ+iWfQg1peHA2ciwk4DFS4mRQhtk2YuNBIT3SPGCO
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 15:57:44.9514 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66fea902-3c02-4d8d-f37f-08df090aed94
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5912
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

Currently, the link settings persist after the link settings subtest,
and can retain a lowered link rate/lane count going into subsequent subtests.

Fix it by resetting the link settings on an igt_fixture after running
the dsc_link_settings subtest. We can do so by setting it to lane count
and link rate unknown and letting the driver set it to the default values.

Signed-off-by: George Zhang <george.zhang@amd.com>
---
 tests/amdgpu/amd_dp_dsc.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/tests/amdgpu/amd_dp_dsc.c b/tests/amdgpu/amd_dp_dsc.c
index ccaf64c66..a5668a31a 100644
--- a/tests/amdgpu/amd_dp_dsc.c
+++ b/tests/amdgpu/amd_dp_dsc.c
@@ -351,6 +351,25 @@ static void test_dsc_slice_dimensions_change(data_t *data)
 	igt_skip_on(test_conn_cnt == 0);
 }

+static void reset_link_settings(data_t *data)
+{
+      igt_output_t *output;
+      igt_crtc_t *crtc;
+
+      if (!data)
+              return;
+
+      for_each_crtc(&data->display, crtc) {
+              output = data->output[crtc->crtc_index];
+              if (!output || !igt_output_is_connected(output) ||
+                  !is_dsc_capable(&data->mode[crtc->crtc_index]))
+                      continue;
+              igt_amd_write_link_settings(data->fd, output->name,
+                                          LANE_COUNT_UNKNOWN, LINK_RATE_UNKNOWN,
+                                          LINK_TRAINING_DEFAULT);
+      }
+}
+
 static void test_dsc_link_settings(data_t *data)
 {
 	igt_output_t *output;
@@ -604,6 +623,9 @@ int igt_main() {
 	igt_subtest("dsc-link-settings")
 	    test_dsc_link_settings(&data);

+	igt_fixture()
+		reset_link_settings(&data);
+
 	igt_describe("Tests different bpc settings and logs if DSC is enabled/disabled");
 	igt_subtest("dsc-bpc")
 	    test_dsc_bpc(&data);
--
2.55.0

