Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85989C47258
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jan 2024 19:43:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3320610FC8A;
	Wed, 31 Jan 2024 19:43:50 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2070.outbound.protection.outlook.com [40.107.94.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A89B10FC8A
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jan 2024 19:43:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fbsA0xN3bLw0N6/tgnr+lo8s6hRl7Hw6ae04pTyHlWZ5zkH7ADAO+CtuetrT5Ar9CQjJmxZxUaTUnMStJxO5v+31kbkxYrDgk3Jr7kGWNQvr6P8UydOe4h2i41cUcVXMfONu9MZO0ssWeRVXygN2s2fEz2UpzuQ8iI17dEtupmDINDXwEjIVNC+0MfpgY41m+Q23KakTZX86e6uM2YxRU4CmMgN2JBwdlSAccorDrEKy3YeqcH4RMvUwipsN3y2RhL/c0Jcv9U6vD2FQdKh7bmSc1xN46RIfjX8shDXFoGLRozOPMKvX7o9bPwxfKiwgiZ7Tcm61+ybz/FYzSQHTTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lIO8k7EMrWaUgA6rhuKD7w6cmp96rhaSdQy4NoH2nj4=;
 b=C4tNU7NNdNxbRfM7gmmqNPh7HHT0GqsFD2OEbW4Ums+8kPvU0gDUMEkF8CJQGsZuZrN16tVVGdDtRwGo+7eVsxEjw1+je+Pop2q35gdqoPyNfmfd11lq/zNgnBVya4C3W03mWRgEh0yZJGrpqOQ8BesONjfanMblqLfBtJKGOsB0HOGRQt1Lt6+SH1gF55TODYxLp4JzifZo2EOqLaEU1QfwjJPsPWzkBSPyVYmoHT6uAloT1FpYPkcJx3VGyZondTom1Qs8kQH7eXjKlwLqmNp3POWbCWw+kcTY3eShAlIkyefKPwIQkOZ2zLTwRUu0Uajuia/L6im6v+Q7agLvwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lIO8k7EMrWaUgA6rhuKD7w6cmp96rhaSdQy4NoH2nj4=;
 b=WpG7gYn2TEFg4WB6veB8MhB2RL8NTdGidUdKyUoJPnq3THDvEGo56BQ1UvmP51BXkh1SuyRwQn2tY4wbv9lj1rm8a7dGfi61exqiMH/z7frvsXysqieoxtRF54Ymyy3k/XJxxzs/n/3uJaXoRNF4XuasUmQpp7hgtt8MRGchqUQ=
Received: from BYAPR04CA0004.namprd04.prod.outlook.com (2603:10b6:a03:40::17)
 by IA1PR12MB6283.namprd12.prod.outlook.com (2603:10b6:208:3e5::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22; Wed, 31 Jan
 2024 19:43:46 +0000
Received: from SJ5PEPF000001C8.namprd05.prod.outlook.com
 (2603:10b6:a03:40:cafe::cf) by BYAPR04CA0004.outlook.office365.com
 (2603:10b6:a03:40::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22 via Frontend
 Transport; Wed, 31 Jan 2024 19:43:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001C8.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Wed, 31 Jan 2024 19:43:45 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 31 Jan
 2024 13:43:45 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 31 Jan
 2024 13:43:44 -0600
Received: from hersenwu-Majolica-CZN.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Wed, 31 Jan 2024 13:43:44 -0600
From: Hersen Wu <hersenxs.wu@amd.com>
To: <igt-dev@lists.freedesktop.org>, <rodrigo.siqueira@amd.com>,
 <aurabindo.pillai@amd.com>, <alex.hung@amd.com>, <hamza.mahfooz@amd.com>,
 <wayne.lin@amd.com>
Subject: [PATCH] [i-g-t] tests/amdgpu/amd_ilr: Fix psr eDP crc read timeout
Date: Wed, 31 Jan 2024 14:43:42 -0500
Message-ID: <20240131194342.182455-1-hersenxs.wu@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C8:EE_|IA1PR12MB6283:EE_
X-MS-Office365-Filtering-Correlation-Id: c133e9be-2049-4e59-011b-08dc2294f046
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VFRbrsXo+3N/WEOW8iSWerrWf/TZ5N8YrLobFWuWf2s7F838dFZYP33qD9w8pi/nXOvviHPaSWP+sl0dyOGdu+cHzQHaaCq688It0if3DTPyiVXjSD5kQ5ZcG/Vj8LoeGPxYtIgLMXG3IsPinB10a9y6OKBrod75wcE94oCzBjLQSKT7bmj6wWqq61ZhKtx1wrPx2CO2XqOUrAQ+7pB7+gmPbqpxElzoJK/PawaSTySlQZM4ymZ4YfI1+24h5Moyf+6WQzHnN+7wDav2jS08wQAvMT7gPvFUK8VHJYjqTArBqhW8tNVjzmJQQLYMz/6t+KN1JrKb3EwEQ8Wd8CEJLOY0CQri7J78YyQ8l3A4d5BNTsPoe+ZhUyXOdX9qBfCgCO3Aa8IAGqKBBzpv+i2XLlXsqmUbBuMX7FHfJfMuRQFUKZrKJm6xsGPE7e4Ke835zAcjJFbouW8vFbS08+EK7DjEm+/W19el7w9P1FKQrNnBrNkpAOxSrlvOTBLubxUqMXeu5AwlKlrtIDln41o4AQuL5wtwo3n6JpEyjnmvCL2ljKXYgeri11l+SleMQmJNLJ+2ZlXOQhtqrInERcsmuVB5PbPvvyYzH0/d+PzDE+qW/1/OJ/U5AMs9Pp5n5Nbnmkk9u1QhpwL+4qCJBCCGK33MesDTBFV7T8MnUZurgBGINVagfLcZbb9dkin5Ov4B/OhqFRbLXaM8Dp0abAYHYh5KV/kL6GDV2mYvjlri/WCYjOer3znCiwkE9nOKCUuWYDBMMXqbRPAxh6lHCfOh1g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(136003)(346002)(39860400002)(376002)(230922051799003)(64100799003)(451199024)(1800799012)(82310400011)(186009)(40470700004)(46966006)(36840700001)(316002)(6636002)(356005)(2906002)(40460700003)(40480700001)(54906003)(4326008)(8676002)(8936002)(36756003)(36860700001)(110136005)(47076005)(86362001)(5660300002)(70206006)(70586007)(82740400003)(81166007)(83380400001)(26005)(336012)(426003)(1076003)(2616005)(7696005)(41300700001)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 19:43:45.9829 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c133e9be-2049-4e59-011b-08dc2294f046
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001C8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6283
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
Cc: Hersen Wu <hersenxs.wu@amd.com>, markyacoub@google.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Disable eDP psr via debugfs disallow_edp_enter_psr
before IGT reads crc.

With set_all_output_pipe_to_none within test_init,
Tx writes dpcd 0x600=2. eDP rx is power down.
Rx dpcd 0x170 is reset to 0 by Rx. eDP psr and crc
check for rx internal logic are disabled. With
disallow_edP_enter_psr = true, IGT sets test patterns,
then igt_display_commit_atomic, kernel driver will
turn on edp. Rx FW set dpcd 0x170 = 0 (default value).
Therefore, IGT could read rx crc successfully.

Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>
---
 tests/amdgpu/amd_ilr.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tests/amdgpu/amd_ilr.c b/tests/amdgpu/amd_ilr.c
index b2c0f294d..46ad6f60a 100644
--- a/tests/amdgpu/amd_ilr.c
+++ b/tests/amdgpu/amd_ilr.c
@@ -205,11 +205,22 @@ static void test_flow(data_t *data, enum sub_test option)
 			continue;
 		}
 
+		/* igt_amd_output_has_ilr_setting only checks if debugfs
+		 * exist. ilr settings could be all 0s -- not supported.
+		 * IGT needs to check if ilr settings values are supported.
+		 */
+		igt_amd_read_ilr_setting(data->drm_fd, output->name, data->supported_ilr);
+		if (data->supported_ilr[0] == 0)
+			continue;
+
 		igt_info("Testing on output: %s\n", output->name);
 
 		/* Init only if display supports ilr link settings */
 		test_init(data, output);
 
+		/* Disable eDP PSR to avoid timeout when reading CRC */
+		igt_amd_disallow_edp_enter_psr(data->drm_fd, output->name, true);
+
 		mode = igt_output_get_mode(output);
 		igt_assert(mode);
 
@@ -243,6 +254,9 @@ static void test_flow(data_t *data, enum sub_test option)
 		igt_remove_fb(data->drm_fd, &data->fb);
 
 		test_fini(data);
+
+		/* Enable eDP PSR */
+		igt_amd_disallow_edp_enter_psr(data->drm_fd, output->name, false);
 	}
 
 }
-- 
2.25.1

