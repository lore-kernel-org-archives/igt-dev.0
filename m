Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A2CC48BC3
	for <igt-dev@archiver.kernel.org>; Tue, 20 Feb 2024 19:16:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37AB510E51B;
	Tue, 20 Feb 2024 19:16:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Y7cK5/fA";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2085.outbound.protection.outlook.com [40.107.223.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D867710E51B
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Feb 2024 19:16:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E89F2hrSMOryKzHZDMhpDGT0w0eoFKFC8vx/1BEJ+tP7MTLYKcmzZq6Q+jzliUKH2NO2wZL8y4RyrkpUeAmCAPIBzEFNkrnEcgQqrdalFA6nr60KGB34Ny6Jg5X72mRgAsJQngEZ3Z4IhF3k/z6A1ChgUCpsvzvgt/NIbylykYJfYicszgBknQruHmntNCg3AlHNRdMSndR7XeMc2ebYjBFjm3x+MYOuqcsbcWb8eWteH4L5+8FezsBWQOBuEWMK11eet6D01WBfowH5WClvyHBJBl6WQp066f49XvOUGvTg4Su5IxsxLdIBAVAcSVlEZLjmhp2q4UZK/ZbHeQufOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/F3jjeqdmfKth7nVtMMxF1CORn0C5rVYz759k6/Yzo=;
 b=HPiFTQkv9yU8N7hGvbOwjM+c6m5Laxta7G8ByFWXbxuVa786HI+BcX1dlg0UhTn6/NfjKjlrxh0iKFRN+/iHKsxxlmymLxE7KiwVxqjl3aRBCkSXaGoF2LMK9ulOoqRzcfLWQVEhYAx4NvlpyJWGW0tZMBf15xFr0b9J54ac8kxdK5RQwfncta69XS6gYRJOTrkgHae40qXw3hBTztDIAJME4PjTgl057hDJY7+boUF5GZYa+sgLujFIsq/6I6tfd9fxWpYFS+wt+wzKdEhXDR+rzVUDXJlU8MqRxvy5NEKeOsLxukwcuLOdEDGbqy5qysVoFOhwaOS6r0FMciIeLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/F3jjeqdmfKth7nVtMMxF1CORn0C5rVYz759k6/Yzo=;
 b=Y7cK5/fAz3dmUEJGDlSZ+MaCoUlrHaBmQJHiOk97ErQaR8hnL7AbX8UzNbiPnsXNK31NsREXdlPJh21OoehqaX+iEM6qg+phxOMU7w7V1ZaZdYOV0UURic1a4xhRSkWQr6w2JTRP8rc45OrpV54UGfrbJP4wUEbZn/BEzjX9xG4=
Received: from DS7P222CA0005.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::17) by
 IA0PR12MB8838.namprd12.prod.outlook.com (2603:10b6:208:483::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.19; Tue, 20 Feb
 2024 19:15:57 +0000
Received: from DS1PEPF0001708F.namprd03.prod.outlook.com
 (2603:10b6:8:2e:cafe::36) by DS7P222CA0005.outlook.office365.com
 (2603:10b6:8:2e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.40 via Frontend
 Transport; Tue, 20 Feb 2024 19:15:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0001708F.mail.protection.outlook.com (10.167.17.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Tue, 20 Feb 2024 19:15:57 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 20 Feb
 2024 13:15:56 -0600
Received: from hersenwu-Majolica-CZN.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35
 via Frontend Transport; Tue, 20 Feb 2024 13:15:55 -0600
From: Hersen Wu <hersenxs.wu@amd.com>
To: <igt-dev@lists.freedesktop.org>, <rodrigo.siqueira@amd.com>,
 <aurabindo.pillai@amd.com>, <alex.hung@amd.com>, <hamza.mahfooz@amd.com>,
 <wayne.lin@amd.com>
CC: <markyacoub@google.com>, Hersen Wu <hersenxs.wu@amd.com>
Subject: [PATCH] [i-g-t] tests/amdgpu/amd_bypass: Fix psr edp rx crc read
 timeout
Date: Tue, 20 Feb 2024 14:15:54 -0500
Message-ID: <20240220191554.111722-1-hersenxs.wu@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708F:EE_|IA0PR12MB8838:EE_
X-MS-Office365-Filtering-Correlation-Id: 15e4fe86-9aa1-409a-f85a-08dc32485dcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WlVFZ/GsVNhacn0j3qSlbUH7Nm09d+p/ZJ3U8nnHbsUXXUazrlxf29LCH/DYbUUOZpRax0mMKYg6ALPZu1BYoQHYChp2xUxc666YwHW7lqh2Y9i255weY0gAu/sRbciD5Hp4PNhkPC5/XELxag4z3nXzA1KFfeeWEIlgQSMzHU0I4tbqb9g+YvhcO85Pvhajug/IwrM8xXiAJdQWvrycYQ1qt+YEmeZVpXtpFEATDpPV29CkXm15CnfbI3tAiS5Lijrsv3GTQ3prTY/cY7QlhTR382s74Jz/Edpji3nushl79by/MWUSHf0JJ5TtSklMil+Wza65BP4P0y81usWKkFLVhvI8Qbi273nuSmtpyYMP+8bTKyTPtG17o1mrGAXW8HL9exaIdl6Qj+1o7AIKoqmahFrCzgU0NVUkips0B0HgocVKvElcO/8mK1fQgOqX/zxDkrImx4EaKlvoWQHvYuQUHNqGMcDTWhU36omKV3N8jQBz0PJMLdtZgYd/+qLssB9Z+QJIltlMQWBCgSt8GHUDuJIip84cNGx+ONHCfp7K2CfR9dsRMDs05Dqjk5ZtlH5+jYMHOKO6K54VIL/OS4XpdUN0fZufNxOha6UvYdl0vY0fSfxnliAcwu/ZJrVwZc7okebYZktwBoyzVOSUKuoQGzs73NHwGKUoGQfmxH4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(46966006)(40470700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 19:15:57.1734 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15e4fe86-9aa1-409a-f85a-08dc32485dcc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001708F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8838
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

Disable edp psr before tx reading rx crc.

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

