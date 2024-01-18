Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34036C4707B
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jan 2024 13:15:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C799D10E7E6;
	Thu, 18 Jan 2024 13:15:09 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2054.outbound.protection.outlook.com [40.107.102.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A6A10E7E6
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jan 2024 13:15:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iIqzz/h09rWHCqDmOdhhR9Qr2XfGdgnbI8fWkR+z1BgugWS6EqSQragbW0wnOl6u3zsWQbE4FR21ONwKVcDX71w4mqkhhLUqA7Cc5koFaUlHPcNkkTkGWKPu3aPYloiQS8VKe/WLKU/R0aaPwm8SFwPsvduBlaWcrZ7gLSJuAwFnYxunp4dXdMgpEX4nJLDt+BpiQgVPWr057+E8ymC4N3VkA7EqXpm7fe7bbBXw1ROLi+Ty8n3s6QIIs3faxD2ylxxCexKSfYkHOysRoFCEfprllLG7m/aYotTnYyd+2Qec2cHSn9aSL+R2s0dGyR6yiDdwCj497C9J+1B9urROHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tf/h7B3vNt/KSt2RY8qarITtmQlDVeWD9GDzyPdChO4=;
 b=Meb0cWDykJ4m4sWpEbyLqrimbpxqA49VSObNNHYI9zgYOdWdQnShGRODPqGq7LaD4IPInA/ykZypy31gbbXkrWrzsV3SbuAV6/5BfkiAEP+yDvqownybq1Cnx9qWIl1DAOEHN07MiJXE9WxdTxY2gUrjNLJINSusYG+v/V7ow/ivDKg9TQkfWS7PT4ScDB9muAaLbVq5JHq9ahbWbOx7GWlhAHFhbGGa2AM4SHsYlL4Nb9dfjOcByU71gfunyEIdHS4rHhYQ9dEQe2fz1rkO/X8Vn9j8mMfvD6WMu1r0awzfwbWP72URBQta/XGqi3oAyV3R2QKrFcMD608IdzIjrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tf/h7B3vNt/KSt2RY8qarITtmQlDVeWD9GDzyPdChO4=;
 b=jOCNRR/8qWUGjfRgiRuBItmviL5/90wJOSjOgh5oyIJ00YKMCD+KSmeztUxeKSOyO9+CoBhO3Rn3SYgH6ZpvNmrht5IYm6XAVwQ8FfBShFZ42QX0aGRHQIu1+2y7GVHFVJRHZBGau0pwl/LRC4o1utg9jlkHyeYpD43xXHyQliY=
Received: from SN7PR04CA0158.namprd04.prod.outlook.com (2603:10b6:806:125::13)
 by MW3PR12MB4587.namprd12.prod.outlook.com (2603:10b6:303:5d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Thu, 18 Jan
 2024 13:15:00 +0000
Received: from SN1PEPF000252A3.namprd05.prod.outlook.com
 (2603:10b6:806:125:cafe::56) by SN7PR04CA0158.outlook.office365.com
 (2603:10b6:806:125::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24 via Frontend
 Transport; Thu, 18 Jan 2024 13:15:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF000252A3.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Thu, 18 Jan 2024 13:14:59 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 18 Jan
 2024 07:14:59 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 18 Jan
 2024 07:14:59 -0600
Received: from hersenwu-Majolica-CZN.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Thu, 18 Jan 2024 07:14:58 -0600
From: Hersen Wu <hersenxs.wu@amd.com>
To: <igt-dev@lists.freedesktop.org>, <rodrigo.siqueira@amd.com>,
 <aurabindo.pillai@amd.com>, <alex.hung@amd.com>, <hamza.mahfooz@amd.com>,
 <wayne.lin@amd.com>
Subject: [PATCH 3/3] [i-g-t] tests/amdgpu/amd_ilr: Fix psr edp rx crc read
 timeout
Date: Thu, 18 Jan 2024 08:14:54 -0500
Message-ID: <20240118131454.19652-3-hersenxs.wu@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240118131454.19652-1-hersenxs.wu@amd.com>
References: <20240118131454.19652-1-hersenxs.wu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A3:EE_|MW3PR12MB4587:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d36e1e4-d020-4e8f-eb77-08dc18277962
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K3TOr3kqTRpYW3yKSY3XER0gv9xnX4hnppF1h0ME8NqIToKe4Rs2jjN03v2C2VZ2qD0bHgynhaOkdCC0XW/l1Kyaoo91R02kX6LRLMWhMXLxNfJBnXr6PResysiPDI1vdtkSENt2U8KD5h4k9F3IWltGk+vuETXH7xgu5wu2XfgcHjHp/BueLGAGZIn/VllBxn1g4ewC1CYoFKnUplsPPiO2Ht1I7nrib1JWlmK3BN0zu6SKR9SqKOzOemf1Nf11f4uupOecaNh4eFQo8ma0Yd6Mbf9FMdKk+QCN0ysjQeNEyRCekfzQaC5IuT/FZMviuYZjSD5HpMc2GOLPgJwVQyom9+yJomkaH3t7e3JCjlRQnxd+vs9j2uZ18yCRYfU4NzpPIBU5gb670TYffalllr9jlUTVv0L0xxjpRBQTFdiJ4n3siC9IlWPXTPi3y7j4D6iP1EPeD80+kIKL7pVfNg5000d+dqEVvUQHmbTICz+0gUSFUdv9t4ozkpz7BRu0uvV3G+MYnnxuBhAeJikfnlb+UkPA8q4Bscr00aauJHevp/912Uo9/F14FbuRTGaD9jVzpeJBTkWvus4tqNRiLSj2YuAVWskhL0emPoDdt9FiizlnIGsaz4vIu8JZFRbUFmtUIrOT1TQotFHpdhG/epadOb+csnZxCI4GOGAgzvo9/jvQSc9wyR87ycM1D7I42RQixzJAG/4Sst5EaqkyU4fhyC1Ii/Ii0AogjwRdrfSycSIkxyXH9uAwwySTOGK6neHOdYA8zqrCAQrmIdb7YQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(346002)(376002)(136003)(396003)(230922051799003)(1800799012)(82310400011)(186009)(64100799003)(451199024)(36840700001)(46966006)(40470700004)(2616005)(426003)(336012)(26005)(1076003)(40460700003)(40480700001)(41300700001)(6666004)(7696005)(47076005)(86362001)(83380400001)(36860700001)(478600001)(316002)(70586007)(70206006)(54906003)(110136005)(36756003)(6636002)(81166007)(2906002)(356005)(5660300002)(8936002)(8676002)(4326008)(82740400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 13:14:59.8459 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d36e1e4-d020-4e8f-eb77-08dc18277962
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4587
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

With debugfs disallow_edp_enter_psr, disable edp
psr before tx read rx crc.

With set_all_output_pipe_to_none of test_init,
tx write dpcd 0x600=2. this will let dpcd 0x170=0.
rx psr and crc check for rx internal logic are disabled.
with disallow_edp_enter_psr, when set test patterns
are committed by igt_display_commit_atomic, kernel
driver will turn on edp with dpcd 0x170=0. then tx
read rx crc successfully.

Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>
---
 tests/amdgpu/amd_ilr.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/tests/amdgpu/amd_ilr.c b/tests/amdgpu/amd_ilr.c
index b2c0f294d..8e892738f 100644
--- a/tests/amdgpu/amd_ilr.c
+++ b/tests/amdgpu/amd_ilr.c
@@ -205,11 +205,31 @@ static void test_flow(data_t *data, enum sub_test option)
 			continue;
 		}
 
+		/* igt_amd_output_has_ilr_setting check if debugfs exist,
+		 * but ilr settings could be all 0s -- not supported.
+		 * need check if ilr settings values are supported.
+		 */
+		igt_amd_read_ilr_setting(data->drm_fd, output->name, data->supported_ilr);
+		if (data->supported_ilr[0] == 0)
+			continue;
+
 		igt_info("Testing on output: %s\n", output->name);
 
 		/* Init only if display supports ilr link settings */
 		test_init(data, output);
 
+		/* with set_all_output_pipe_to_none within test_init,
+		 * kernel driver tx write dpcd 0x600=2 to rx. edp rx
+		 * exit psr state and stop verify crc from main link.
+		 * with disable edp enter psr within kernel, when run
+		 * set test pattern, display is turned on. kernel driver
+		 * tx will not notify rx psr enable and crc checking by
+		 * rx. by this, when tx want to read crc from rx, rx will
+		 * check crc and response right away. timeout will not
+		 * happens.
+		 */
+		igt_amd_disallow_edp_enter_psr(data->drm_fd, output->name, true);
+
 		mode = igt_output_get_mode(output);
 		igt_assert(mode);
 
@@ -243,6 +263,9 @@ static void test_flow(data_t *data, enum sub_test option)
 		igt_remove_fb(data->drm_fd, &data->fb);
 
 		test_fini(data);
+
+		/* restore allow kernel driver eDP PSR */
+		igt_amd_disallow_edp_enter_psr(data->drm_fd, output->name, false);
 	}
 
 }
-- 
2.25.1

