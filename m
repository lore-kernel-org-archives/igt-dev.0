Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89034C4707B
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jan 2024 13:15:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06F1710E819;
	Thu, 18 Jan 2024 13:15:33 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2088.outbound.protection.outlook.com [40.107.237.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13EF810E819
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jan 2024 13:15:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YoNi5iBmNI+NonvMrfnat91G8MGEd+iMBob6TTVy6XoAqz8EbGEJ7IsPXcbadQOA+XHAArKnGbRvHEoKLBzgK5Ktze+ZRgU+KJB9hczbfND5WaTXgUb1aMP6pbY1rKxstFadpf7TByxAcRxQHmAcqTN83vl/qDZaizfd/tCbiwDq5iGeJZK3xOg88pCO6a7SEy69bjqSPVhOvi78wVTOymbAuzE1QILC4AGT5xh108JJe74wjJlET/t/kuPUjvfePS0RtrOqtOBu/q3ZLJIHD2u5kBnidPPFWH0RwsqRPRssBoQQm1rOVk4v567w2UWZBVDrCZGRcan3rARUn/1E+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DPql8skC/fNk5yDaK4YExmUYUqgxwBdNVzLlGX2BDLU=;
 b=BaaPnVsuF9bA3ea+WOf0y6SpiQY2NeKycEqTYmYKPnAXiMCZ970PSijMxy2BpFzTLz+VkJ3BpXEhf2vTwLxRwnBli6Z7ymRmziSuJUOE4gHnxtTWDXzDvA4TuGVtKRuV/IzsyTF7tKEGqUtqBK+CKXccwMZF7AFrg79fDcXFLyBxODrXdCci7N9jq8MBVIpU0ch7jmWyVVX2F5MuKCz2QkHI3RKmZGvUE/iNRhihfNhcjI2Wx9anzqqaGxrk1l0YemZXttgM8k9NVdrfd+G42xiBOW0TI06/L26x3Uksd7EKy+Rn7xb1htX+OWZvsM0vPE8/lQPujwQOaSXRTdbQnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPql8skC/fNk5yDaK4YExmUYUqgxwBdNVzLlGX2BDLU=;
 b=KMYeT5GaawgyEvGtHn4nd4yf0e7jAvQ+RxwJfqeuM2CDJj9yM76Cc2wX4w7M8U013W+yeX/8FHU33e6VjFdGGqvZhhjz10V2SuHdJyHqCE3MdrvMETvJ62yYzQaQKpN7+a+KMU8KrZJ0XwXtSHDcdCqRvt0PuL2Gkm0MOCn+b0g=
Received: from DM6PR17CA0025.namprd17.prod.outlook.com (2603:10b6:5:1b3::38)
 by BN9PR12MB5241.namprd12.prod.outlook.com (2603:10b6:408:11e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Thu, 18 Jan
 2024 13:15:26 +0000
Received: from CY4PEPF0000EE30.namprd05.prod.outlook.com
 (2603:10b6:5:1b3:cafe::fc) by DM6PR17CA0025.outlook.office365.com
 (2603:10b6:5:1b3::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24 via Frontend
 Transport; Thu, 18 Jan 2024 13:15:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE30.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Thu, 18 Jan 2024 13:15:26 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 18 Jan
 2024 07:15:25 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 18 Jan
 2024 07:14:58 -0600
Received: from hersenwu-Majolica-CZN.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Thu, 18 Jan 2024 07:14:57 -0600
From: Hersen Wu <hersenxs.wu@amd.com>
To: <igt-dev@lists.freedesktop.org>, <rodrigo.siqueira@amd.com>,
 <aurabindo.pillai@amd.com>, <alex.hung@amd.com>, <hamza.mahfooz@amd.com>,
 <wayne.lin@amd.com>
Subject: [PATCH 2/3] [i-g-t] tests/amdgpu/amd_bypass: Fix psr edp r/x crc read
 timeout
Date: Thu, 18 Jan 2024 08:14:53 -0500
Message-ID: <20240118131454.19652-2-hersenxs.wu@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240118131454.19652-1-hersenxs.wu@amd.com>
References: <20240118131454.19652-1-hersenxs.wu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE30:EE_|BN9PR12MB5241:EE_
X-MS-Office365-Filtering-Correlation-Id: 5885c372-b66c-4128-b981-08dc18278933
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rR+zSUwnrYrd1e95Sma6mDOmHctLJNtYCyxxfHZ5Xr+Y8ypN/1YPwNdBm+GHRlrZCZlZpv3M7MDKkeZFP3D1hFzWGQoP70jFNU/wLtFITKVVNX0rZq4sHYSjSOqlSW6ORaPQLEZOESjlzBqP1KFcVXYjo1pibZmuljqBA1iLUNKUdLRmIAHGv3OSQ++6Q6FMaa9fseuLnAeFZqNbDgao+Fnb980RKAUVmRiMs3wRtMNso9oNGG67mMqnpoq7q7LflekyLDaN0/q8JH28c1dt6w6tTtEtVO/LeN6GYg0U27F0Cj8jsSJDmjlJBEuumZ3Pdz9JZF6G7KJomECzlEPXUTEX1vBCXNMhbk8Td7/g988ltm3sKO2eh65WLhz6YRz4sG2uX0Xd5GMGBMouhVYUHg9sDWcevm6/BAeEr4nF7xlLcg8MSFCiLvjfSNeYpFZHSU3c7Q+mp+e6Jw5pg3JrJ/MsJffQXC4/bcvK+0fift71OEy9PzhYlc3Xcd4l+e1uAmUaOvC58i57o0TgpYK0WcU2Tda1bYqr7gvBODIW4zJHV8aVFV0DGteHL6aWq5jYVKQdOJUoFExyKLtfrDw+wHflI9zhhpeyLjHq6dDczAonp0URnj+M6mEm1iofzbdhIoepN4FqnFt7GgaTlA77VTcjY999fj10QDo/KMbl5x/ZwNuL7Z7K7QiwgGdQp0hOyJJ3FzHo2D5SBEvEBS7oyvYXLZhOJGinAG5HjS1Tk3HztE6bfJeQDeOTTDsS6Fi3xGE9AcT9vPTy37veXWBsLw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(346002)(376002)(39860400002)(396003)(230922051799003)(1800799012)(451199024)(82310400011)(64100799003)(186009)(36840700001)(40470700004)(46966006)(81166007)(82740400003)(70586007)(110136005)(70206006)(316002)(86362001)(6636002)(54906003)(478600001)(6666004)(7696005)(2906002)(40460700003)(40480700001)(36756003)(36860700001)(8676002)(8936002)(5660300002)(47076005)(4326008)(1076003)(26005)(336012)(426003)(356005)(2616005)(83380400001)(41300700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 13:15:26.3333 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5885c372-b66c-4128-b981-08dc18278933
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE30.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5241
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

With debugfs disallow_edp_enter_psr, disable edp psr before
tx read rx crc.

dpms off, tx write dpcd 0x600=2. this will let dpcd 0x170=0.
rx psr and crc check for rx internal logic are disabled.
with disallow_edp_enter_psr, when dpms on, kernel driver will
light up edp with dpcd 0x170=0. then tx read rx crc successfully.

Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>
---
 tests/amdgpu/amd_bypass.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/tests/amdgpu/amd_bypass.c b/tests/amdgpu/amd_bypass.c
index d192a30ea..d82e22ded 100644
--- a/tests/amdgpu/amd_bypass.c
+++ b/tests/amdgpu/amd_bypass.c
@@ -72,6 +72,24 @@ static void test_init(data_t *data)
 	data->output = igt_get_single_output_for_pipe(display, data->pipe_id);
 	igt_assert(data->output);
 
+	if (data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP) {
+		kmstest_set_connector_dpms(data->output->display->drm_fd,
+			data->output->config.connector, DRM_MODE_DPMS_OFF);
+
+		/* with dmps off, tx write dpcd 0x600=2 to rx. edp rx
+		 * exit psr state and stop verify crc from main link.
+		 * with disabllow edp enter psr within kernel, when run
+		 * dmps on to turn on display, kernel tx will not notify
+		 * rx psr enable and crc checking by rx. by this, when tx
+		 * want to read crc from rx, rx will check crc and response
+		 * right away. timeout will not happens.
+		 */
+		igt_amd_disallow_edp_enter_psr(data->drm_fd, data->output->name, true);
+
+		kmstest_set_connector_dpms(data->output->display->drm_fd,
+			data->output->config.connector, DRM_MODE_DPMS_ON);
+	}
+
 	data->mode = igt_output_get_mode(data->output);
 	igt_assert(data->mode);
 
@@ -370,6 +388,11 @@ static void bypass_8bpc_test(data_t *data)
 	igt_plane_set_fb(data->primary, NULL);
 	test_fini(data);
 	igt_remove_fb(data->drm_fd, &fb);
+
+	if (data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP) {
+		/* restore allow kernel driver eDP PSR */
+		igt_amd_disallow_edp_enter_psr(data->drm_fd, data->output->name, false);
+	}
 }
 
 igt_main
-- 
2.25.1

