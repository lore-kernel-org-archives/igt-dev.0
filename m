Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36467C55167
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jul 2026 07:16:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC14E10F199;
	Fri, 31 Jul 2026 07:16:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YqDlFlaV";
	dkim-atps=neutral
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010007.outbound.protection.outlook.com
 [40.93.198.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 701BD10E18F
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jul 2026 07:15:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SS9kPDCeVfIBgJgPZfqy2xi0cqWlsupvCWOK4x/gjAZhR/rF6YnUKZOQFn0roiDqgfhig/sGXJrup5tvaWnli4pmjiFFkFjiHcGJYrJ+xpFYm+6gx1w6OlXa00frDO3W194WGpAeQA/wtouaAS1DASGTYZyHXd3wqm+ZgzXE7gAMKMniWk7VT6EtFXhmDxIzRwE+UWyc5W8/Km6xLL2RvzoBnOqNWty0xHj3UM9MhhVT+Ap93F0qtSi+6pYGWz+Cn+l78LDPIrDS0HMcbvgFd6FCsQQ8ZefB0TI3znyv1dZCn07mN/DNv45VHzqxN+aZ79YFGJt4tFviEYtoeg+2OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SPw2AtKfs7wQUVt6ooRf472dNr9Yq2w9LojdgQx6PV4=;
 b=oWyugYVjquDVvIPfp6NDI1O5aZJvao9eR2EcWJioBlpR2vC7ZZEYjU1oJMiFcRYGIxtg+geFsWPyxC0lqKOLtBz3jPwb3tXJyTdFvR/NmCMEBQIN3zShyDBxoqDQJEiVCysfqPvc0g+cOy/1L4timhNSdH2PLQFh/57Hof+H9mgwQ23zuuoQLcZ7Yk6b0tq2JnOW1+rLO1gPry0zcUQ5dZy7TYVt4489QCDs1B6Ed7meUvDyHMd1T/zX7yPEM151wfnlsmwfDwOUD9SXMaxDStpZ/dBBwrew6QmTVwXJ9gQa4RfM6n51KZPV/2S6BSp+hcH0MB/vynXPirc/Q+onwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SPw2AtKfs7wQUVt6ooRf472dNr9Yq2w9LojdgQx6PV4=;
 b=YqDlFlaVsOFpUTNER5elIOeZcxxJInbtaMDUcaF5xrcpGbuYEkL+zsSMh9SIBR9KP9g83XJxchSJ7GQJXhd+h+YThXqtjJIrqu2L7zBirfMBUbFfcA/ZatPpgnGPA10RLsKhzP2KzQjz6z6n4+A2CYjTGy38DxhN/SAkshF6t8s=
Received: from SJ0PR03CA0023.namprd03.prod.outlook.com (2603:10b6:a03:33a::28)
 by CH3PR12MB8726.namprd12.prod.outlook.com (2603:10b6:610:17b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 07:15:28 +0000
Received: from CO1PEPF000066EB.namprd05.prod.outlook.com
 (2603:10b6:a03:33a:cafe::50) by SJ0PR03CA0023.outlook.office365.com
 (2603:10b6:a03:33a::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.13 via Frontend Transport; Fri,
 31 Jul 2026 07:15:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF000066EB.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Fri, 31 Jul 2026 07:15:27 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 31 Jul
 2026 02:15:27 -0500
Received: from james-Birman-PHX.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via
 Frontend Transport; Fri, 31 Jul 2026 02:15:20 -0500
From: James Lin <PingLei.Lin@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <sunpeng.li@amd.com>, <chiahsuan.chung@amd.com>,
 <Pinglei.lin@amd.com>, James Lin <PingLei.Lin@amd.com>
Subject: [PATCH i-g-t] tests/amdgpu/amd_cursor_overlay: reset primary position
 for reference frame
Date: Thu, 30 Jul 2026 20:57:32 +0800
Message-ID: <20260730125740.110354-1-PingLei.Lin@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EB:EE_|CH3PR12MB8726:EE_
X-MS-Office365-Filtering-Correlation-Id: b6d1dc56-f59e-4049-1f3c-08deeed37f88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700016|23010399003|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: MZ3z8hCIbI9AcvUgKtZzNf1klxwgEffH1EnGZ7MFUhjL1M0LHrOsRNLsmEOtR0ECnIBb31QnjxOA8lnI9rWp75qE3YxxETxw+s5WrMut69NP+TpB8DaBdXJ/GZphK/Ay72p9fDQ7ICyGRxjieOCTMQ9dpOHPZpl4YA0sYMrShoisbHIDE8Y/luwBCOgNrmgONEza5cNdyM3bg56YaqiC9kHkebARTdaUDQlu+6XQm7Flv/U6kVaxGn4+mBOaVEUtPHGC8c/XkHrXh9h0/18LBDAOaBb4lkqY01UVtepp34CvHO22pF2iBF2YCkD8MUNjnAJ2BQEW/uhRtNB8uAr0ZxB+hRRWve2K7LJ8bt6lineIRX+FnF1ZkDw9YbbwMBi8ZLR3/ulqwYt6FnKY3NnNHoPephOTgwUFyE5YRXr0AaXNdCApfPNwSi12co0Xr0bW8UMXzvlNQmv+jiDVhty65/0zwsGjhTRZBoJMQCvhOiOU/hBRCJw/wGj1DlRCbHXTT/Juu6MBGoI+IDts3El23pvU+WqJs4Wn8plk62spuscvBs2Vh8yo1RXboV8Myzin9tqSPs/nVAeWHz1ooS7Ud3w/O3p04OP2QH1T7Ad8u+KwrTmbHvSMihRz678+guM2sYa4q6REnzVL+IUqxlibOmMm4dPCqAVioP4800HxzCArBr15FXH9Ok3bYX9h+VZWYBuxUflXn60kjfhS9UlJSw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(23010399003)(18002099003)(11063799006)(56012099006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: v0K+CcPpZOBgMZE3t5V8nm7foInLBbZ73eJRGWaJjfh4ZWg+zBz/kODscIUPCL0y/dsruxOjI9EUwULAkIJ65zI0XiRlrVZYoTeceFzWlMS/p13CqhQBKxbsH04ls4UWS6S83kAnnHplA7MLipzPlHporgVSjwUDzGCppaRrhol2gRPHuyxW0LMQjbwUSvG8xK+bsk6jnZR5Y3B5WIH8T8jCKvxUMZl9qS7R35df1utCWMnHqemjuPmXi33IfgzwG7VGI03IPwMkaIuPSme3LfxGnVbNkOURtSQnuv2skfwEVqJeoKtuSbVdefL0yTyADIhz+xb+MQE2ftABR1oU7sgPxZduSUT/JsktQomQapXgY8pkb4CCuI9xQSK2Sl/1kxrxpYDkQtEoflXRcdiFJY6w+YRerDtN67gnI316XpyDmOaogThgUFLQXcDDIsRm
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 07:15:27.7233 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6d1dc56-f59e-4049-1f3c-08deeed37f88
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8726
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

[Why]
test_cursor_pos() reuses the primary plane across cursor positions. The
TEST_QUARTER_FB path repositions the primary to an opposite quarter of the
screen (opp_x, opp_y). On the next iteration the reference frame reprograms
the full-size framebuffer with igt_plane_set_fb(), which resets the plane
size but NOT its CRTC position, so the "full-screen" reference primary keeps
the stale quarter offset and therefore no longer covers the CRTC.

On DCN4x the cursor falls back to overlay mode whenever the top plane does
not fill the CRTC. With the stale offset the reference frame is composited
with an overlay cursor instead of a native one, which renders differently
from the settled frame and produces a stable CRC mismatch against the test
frame (only the first position, where the primary is still at the origin,
happens to pass).

[How]
Explicitly reset the primary plane position to (0,0) for the reference
frame so it actually covers the CRTC, matching the test's intent.

Signed-off-by: James Lin <PingLei.Lin@amd.com>
---
 tests/amdgpu/amd_cursor_overlay.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/amdgpu/amd_cursor_overlay.c b/tests/amdgpu/amd_cursor_overlay.c
index 41c9905b8..b130da4ff 100644
--- a/tests/amdgpu/amd_cursor_overlay.c
+++ b/tests/amdgpu/amd_cursor_overlay.c
@@ -214,6 +214,7 @@ static void test_cursor_pos(data_t *data, int x, int y, unsigned int flags)
 	cr = igt_get_cairo_ctx(rgb_fb->fd, rgb_fb);
 
 	igt_plane_set_fb(data->primary, rgb_fb);
+	igt_plane_set_position(data->primary, 0, 0);
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
 	igt_paint_color(cr, 0, 0, rgb_fb->width, rgb_fb->height, 0.0, 0.0, 0.0);
-- 
2.43.0

