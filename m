Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E8FC48291
	for <igt-dev@archiver.kernel.org>; Fri,  2 Feb 2024 15:10:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C06B210E617;
	Fri,  2 Feb 2024 15:10:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GPDRmLUD";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2066.outbound.protection.outlook.com [40.107.220.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54A5110E617
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Feb 2024 15:10:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L1Rzl4v5a1XAaLviaiAEDfv4vl5Aem/xVrdnilFQWkwvc1p801tC+IdI3vsZ0WLgc0JJOnzr0TAp5fBTXpYaTdOQlxZKXojp05TmzaTNNRo8M5gyec0C8bxdKtHir8iU1XwAIstmtDG574bsydJC5FLqWgObiUFxeA3toLk9yw/qZ+tt5D16ZtTredN2FSEzQzuEmZ7BLUMXIq1Q9YhPO3l22/ciHxi3U2ubnCVndVRSqqdW97CB8paVGSHqJgys9QVf8yVcJsctmHIJK/v/loYeeaJvtQAgVtBR748F45FWnkgHgfNYbW1ZWGfCZNbk7Uas6Kw16NT7cBboR1Yt2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fu9Wr2ZCSpehE36MC1lapCnQkIk5REtuXvsr9xlkJig=;
 b=GkEMaMGLaoMn680E/798l1360Nza//FnlGwqs2tzBP8dh12f/U0vDB4LaPbYBte2XT00dzdfIJqzDtUfejojnwDt1w8vjZZvLQYNC1iO456QwQq1jMoIdbhumSVMCHdpsvhF2S5odH7Js15e9nQuop9L0LEfxi6iuD/hqf/GxF/XEaSB0cw5jWOYLNML47uZydeUu5Xc+Ypw3Ha14pzuYytujTHR8u5N8s19uemtS3WP4Z60sb3y/sJjzb0hOTqeUWDV4LARZI4RipqWRacNPw8yKZecgkAteakt1PGtB793KaaoqRKgnItcbBifcfVTe5J0lFRjJxYaA7pIXW5Vhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fu9Wr2ZCSpehE36MC1lapCnQkIk5REtuXvsr9xlkJig=;
 b=GPDRmLUDu3+E/cC3jrBdy6ccIf/Q5oykWvSPoIFbP7lztnFL0th48xLmORqj+jGtWZzBOTcGunKAV0JbCRwuCP4dbrBuENikjeKjPJLwZfllqATg/8MJZuO4/af6fOc8fx3QqQ55QUX/rQR7/Zr1XZTF1q9leUJURTooZarORu8=
Received: from MW4PR03CA0212.namprd03.prod.outlook.com (2603:10b6:303:b9::7)
 by CH3PR12MB7618.namprd12.prod.outlook.com (2603:10b6:610:14c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22; Fri, 2 Feb
 2024 15:10:30 +0000
Received: from CO1PEPF000044EE.namprd05.prod.outlook.com
 (2603:10b6:303:b9:cafe::57) by MW4PR03CA0212.outlook.office365.com
 (2603:10b6:303:b9::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.30 via Frontend
 Transport; Fri, 2 Feb 2024 15:10:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044EE.mail.protection.outlook.com (10.167.241.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Fri, 2 Feb 2024 15:10:29 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 2 Feb
 2024 09:10:29 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 2 Feb
 2024 09:10:28 -0600
Received: from hersenwu-Majolica-CZN.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Fri, 2 Feb 2024 09:10:28 -0600
From: Hersen Wu <hersenxs.wu@amd.com>
To: <igt-dev@lists.freedesktop.org>, <rodrigo.siqueira@amd.com>,
 <aurabindo.pillai@amd.com>, <alex.hung@amd.com>, <hamza.mahfooz@amd.com>,
 <wayne.lin@amd.com>
CC: <markyacoub@google.com>, Hersen Wu <hersenxs.wu@amd.com>
Subject: [PATCH] [i-g-t] tests/amdgpu/amd_bypass: Fix psr edp rx crc read
 timeout
Date: Fri, 2 Feb 2024 10:10:25 -0500
Message-ID: <20240202151026.52210-1-hersenxs.wu@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EE:EE_|CH3PR12MB7618:EE_
X-MS-Office365-Filtering-Correlation-Id: bb273fc2-ff48-4e3a-a6ee-08dc2401182b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nU5o781W79mDKTdHfeerKFAiwyRDNHz32eFCuxm2wM6xxzctTYg+L6FKh0zoGkRpftRfs8IJUcWqqt5IQncpBDAqeD6BsLnHZLTgvYEc1D6DTXUru4/smj7xogFckCto/Hf2bmfNZtLH/QtypMDPSMSS8u3qivFiQik4MLZzEav+FLYGbe16XwgZhi3ArAy4srjSepAUCljWyM/8VKC+nJWtzAz1w2bM1+gAp20y0tVoSif7sQ2IWHzsPg1EJ2bfpCLqufKXU11CVSUSc1eNzQWx1K8aISJz4uj7bVFgIxkfr/Rctnr1IdBMLbCKB2vntBvJBJqwrdm+KhjF8j0bYAJeTrBdgWGx3cu21NhXjxCrL44tail/P5fxYwOCDRN4qCg7iYIWJZAEGxUgIYkqtEFyL0/y/2bRwefMzXd3vE+8khKI/ZLdFYzlr8b3ScEkh52Agq/J0x4Uohzo6RDAnj2E2mn3nkXy3LwNVqIW2dRyhiQkBboShFStoWs8ckjfUS/6i3QDwRwCL+IrUxp1WGExKopQsAuyMraqDNnFZTiMPox6+GajJqNoy5uFD2tSdfDI+mJN6qEO7GXV7XXE2NWMpEip4tfBuxH1TSwG1guqLxjNJ5gPeIkFcFqaOTxhf1gTcBApfgW18YtOapv2rlQTkqPzlgio6E4dEGGIXQ/XumH/egnKZyUZiwzr2aPFKHxENZ/r4WRvEtZKuClC7bQ25IgSDMLNpy8wVe3IVZdujlDgoatShFyOUFmV1utyAJoCnTbrXLJD0VvW9p8qbQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(346002)(39860400002)(396003)(376002)(230922051799003)(451199024)(64100799003)(82310400011)(1800799012)(186009)(36840700001)(40470700004)(46966006)(2906002)(36756003)(47076005)(8936002)(36860700001)(41300700001)(426003)(86362001)(81166007)(82740400003)(356005)(4326008)(8676002)(6666004)(7696005)(478600001)(70586007)(83380400001)(336012)(1076003)(316002)(54906003)(2616005)(110136005)(6636002)(70206006)(26005)(5660300002)(40480700001)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 15:10:29.7286 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb273fc2-ff48-4e3a-a6ee-08dc2401182b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7618
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

With debugfs disallow_edp_enter_psr = true, disable edp psr
before tx reading rx crc.

DPMS off, tx writes dpcd 0x600=2. eDP rx will reset dpcd 0x170=0.
Rx psr and crc check for rx internal logic are disabled.
With disallow_edp_enter_psr = true, when DPMS on, kernel driver
will turn on edp. eDP Rx keep dpcd 0x170=0 (default value).
Then tx reads eDP rx crc successfully.

Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>
---
 tests/amdgpu/amd_bypass.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tests/amdgpu/amd_bypass.c b/tests/amdgpu/amd_bypass.c
index d192a30ea..01946de24 100644
--- a/tests/amdgpu/amd_bypass.c
+++ b/tests/amdgpu/amd_bypass.c
@@ -72,6 +72,17 @@ static void test_init(data_t *data)
 	data->output = igt_get_single_output_for_pipe(display, data->pipe_id);
 	igt_assert(data->output);
 
+	if (data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP) {
+		kmstest_set_connector_dpms(data->output->display->drm_fd,
+			data->output->config.connector, DRM_MODE_DPMS_OFF);
+
+		/* Disable PSR before reading eDP Rx CRC to avoid timeout */
+		igt_amd_disallow_edp_enter_psr(data->drm_fd, data->output->name, true);
+
+		kmstest_set_connector_dpms(data->output->display->drm_fd,
+			data->output->config.connector, DRM_MODE_DPMS_ON);
+	}
+
 	data->mode = igt_output_get_mode(data->output);
 	igt_assert(data->mode);
 
@@ -367,9 +378,23 @@ static void bypass_8bpc_test(data_t *data)
 		igt_assert_crc_equal(&data->crc_fb, &data->crc_dprx);
 	}
 
+	/* igt_pipe_crc_stop is called within igt_pipe_crc_collect_crc,
+	 * but kernel drm_dp_aux_crc_work is not flushed out. Create
+	 * and commit of new fb let kernel stop dp aux crc work.
+	 */
+	igt_create_pattern_fb(data->drm_fd, data->width, data->height,
+			DRM_FORMAT_XRGB8888, 0, &fb);
+	igt_plane_set_fb(data->primary, &fb);
+	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+
 	igt_plane_set_fb(data->primary, NULL);
 	test_fini(data);
 	igt_remove_fb(data->drm_fd, &fb);
+
+	if (data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP) {
+		/* Enable eDP PSR within kernel driver */
+		igt_amd_disallow_edp_enter_psr(data->drm_fd, data->output->name, false);
+	}
 }
 
 igt_main
-- 
2.25.1

