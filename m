Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9814ACD98F2
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jun 2026 19:26:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 491C910F0E9;
	Wed, 17 Jun 2026 19:26:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0ya/Raw2";
	dkim-atps=neutral
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012022.outbound.protection.outlook.com [40.107.209.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89DA510F0E9
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jun 2026 19:25:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JogHbz8cxWIQNKy7j/4z5G1sbrBkiV577mE5rK2odJLit7Io29uECUMkQv21EcEjk4TY1cAnq/ic9kTPXDzyyBFuvTH0dB4Regh25bcUugMbnbhm8IX/vrnnISoLFlSw5JOxkZaBQ4fkbINRKp2wKFZ5o0hHyJ8ESyY7xH0aXRqmgS0D1zoeXM91mWdCH7uf7+nRvtpcv/GS8+heqPeuDs4IhvB/tEPQK2fm1FtZc1p1K6cEcTb9NuUsZMmZiFPoEzY1noDBgQrSOyRUfuLU1bkpVb3KnuHOPTmIzvlHngb8vlKF0MONRW/YyAdWupu1g5I41nEs9QPjPlIU0ACB+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9claKGPmv2tMmjI1Vux9YcGomrlnuhQJGgPCsPZlEE4=;
 b=MdYIRdMy8athjpcfiXjcDhhRQ5yzarnQJror2C1L015NZwp5kabItJCAwnqPd0WsYk7E1BB6nEDpv0/G0SMob1+bxeg4frtW/SPJvP5anHRmS7JwUQuDb/S6AZNLoYKFS+RWnw9nRDAnk5YZoyUdK/jn6QtjIQ36l5tyxCWat5AZBOmmV2l3Kca+9P92eMW/VgSMbMeuSh/pTsl8lesnpoUbm+9IfKbAehCUgvLmZILesfvy51RoBLa0KExV2hgLOrWuPREVJhFD6K6SaE52zkr7QQZBd2PpI4bsq4p6DUC4/kxwvosDqo//+p5KreMsxsM/PCaje1e5vumeYGCaHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9claKGPmv2tMmjI1Vux9YcGomrlnuhQJGgPCsPZlEE4=;
 b=0ya/Raw2u1JzxDweMLSHkF88lD4wmShoJzB83R09LNHF+n5Wh4Gz5gb8L87gzgnl0w0fZa8P3ERX9rjgveQIbvTFk+mm5rGeL18DTAQqG9dQQpcHaZtWE4qoSE0VujyJSwAbIPaqeYoSOqZ6k6gLRY/8yvHoZ3UbWugzuAXjY0E=
Received: from CH0PR07CA0014.namprd07.prod.outlook.com (2603:10b6:610:32::19)
 by PH7PR12MB8426.namprd12.prod.outlook.com (2603:10b6:510:241::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 19:25:13 +0000
Received: from CH2PEPF0000009E.namprd02.prod.outlook.com
 (2603:10b6:610:32:cafe::53) by CH0PR07CA0014.outlook.office365.com
 (2603:10b6:610:32::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Wed,
 17 Jun 2026 19:25:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF0000009E.mail.protection.outlook.com (10.167.244.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Wed, 17 Jun 2026 19:25:12 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 17 Jun
 2026 14:25:11 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 17 Jun
 2026 14:25:11 -0500
Received: from jzuo-laptop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 17 Jun 2026 14:25:10 -0500
From: Fangzhi Zuo <Jerry.Zuo@amd.com>
To: <igt-dev@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <Christian.Koenig@amd.com>, <Alex.Hung@amd.com>
CC: Mark Broadworth <Mark.Broadworth@amd.com>, Fangzhi Zuo <Jerry.Zuo@amd.com>
Subject: [PATCH 2/3] tests/amdgpu: Fix for HDMI Compliance Automation
Date: Wed, 17 Jun 2026 15:24:48 -0400
Message-ID: <20260617192449.4166-2-Jerry.Zuo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617192449.4166-1-Jerry.Zuo@amd.com>
References: <20260617192449.4166-1-Jerry.Zuo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009E:EE_|PH7PR12MB8426:EE_
X-MS-Office365-Filtering-Correlation-Id: 58caa67e-a06b-46ec-e204-08decca6275f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|23010399003|36860700016|376014|22082099003|18002099003|56012099006|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info: IHVr5/ea5aehVP1zwT6YOKxHRYm/P50foNnnfd2t/79YHWr9qyVbfAtTBqsasITWfi2Cs4P0LBYblsHaITLq1tMTLrlZHQJ+DjBFsrKqe8PoIBt+l8Q/OeC0AZ0jB8o/Zz6raTQUrn4Tj2egdnhfPIrJ+ssZKZubX6ytUvzbTtrURZy7X+hUD+PML1pS5aWaJcy3PW9Zsi2x6tUoJsBt+YgC8qCh+6e1GMrQj9KhNpJqfExwVZEUqibyMcx20h0LUEBec6ToU99pqT0x2JtREv5d0y1w0dOX3K+B4uWBmigU0fLBnNIzGq5RlU7tueSQ3Z2n2Lq2OWPaxchKRdF9ZrTKrPlYakev1e/W5wgIwyxcqBhM/x49dZ66jGgceW21YZ/EOJFq2HL5w1sk/i5dhRQqp5SXpVkTpWyS6PDkvNBXuIiWNXVthaqJYneehNHhZHhCtNUON5fV4Cli3Ua8OElXZxuN/c0D6E/EMERKZ52iAsC/6fuNxBdLXP62MutqPywvN4AbNuNDcDTr/Mkkp0pNpc+2MAj3ccVHtgkBpLi3C1f78HvlElq7M5YkXQrH1Lx5DDzy/GVeiW2SrHJvRngQjiVplPrxNwIWQDbMd7eVNB1DR7yXsGcerIZ0+9JPY2Hq5/CUgaKZ7ZUIjKa++AJVKwtY2oOEmdXe4oJMtM4YbLZplHYFZAzpLikSgz7EPeceuGuXiIkEKXkgww3QnYxmoSH9lpv9bRe9wAqjX/A=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(23010399003)(36860700016)(376014)(22082099003)(18002099003)(56012099006)(6133799003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: S9PsEB8hj9oUBb9GYeg/Ns6wskUdygnb2SN+WKwiscGn2cRjFSPrNal5fKDOWyQyQ2H3r3KtN23JwDBNEHTHuaPmryecd35PRBKEwAx8S6OH16+vd+FcVizDqwB2IROMPuq37QDHyFf3gTjlANSTBo6LKStT0zO1pQLHCKD5dt12BfF1u6cnJOIRP+zGX/XTOilWyWHvyb1vikTbId4MvAQ5DK6piT02mp5PCQyk+XSXInJUE7DkJtIkVsE4tNRghdvSLfDMg4jcTMQMv4wreQfTgNxNZZJaOhFqPrYYNhXo9V3feLjeuluf/szVNN+jbeMx0Pqrs79dJnuhgnIEdzls5+VftrX/SoPUSGtO70MsEYkAuA99+XGCZ/i+PzwRYOzMSMdB04G0MLNEW6Rr3bhZ/nGN1dpT2iNjNH+xliPAHj9DgWqqQ5Hn+mvQxX3U
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 19:25:12.9875 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58caa67e-a06b-46ec-e204-08decca6275f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000009E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8426
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

From: Mark Broadworth <Mark.Broadworth@amd.com>

It is to fix hand shaking issue between DUT and the box.
Need to block until SIGNALRM triggered.

Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
Tested-by: Mark Broadworth <Mark.Broadworth@amd.com>
---
 tools/amd_hdmi_compliance.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tools/amd_hdmi_compliance.c b/tools/amd_hdmi_compliance.c
index dc24430dd..14f455320 100644
--- a/tools/amd_hdmi_compliance.c
+++ b/tools/amd_hdmi_compliance.c
@@ -915,8 +915,12 @@ static void test_vic_mode(data_t *data, int vic, int conn_id)
 	igt_plane_set_fb(data->primary, &afb);
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
-	igt_info("Press [Enter] to finish\n");
-	wait_for_keypress();
+	if (data->timeout_seconds > 0)
+		pause(); /* block until SIGALRM fires (works when detached) */
+	else {
+		igt_info("Press [Enter] to finish\n");
+		wait_for_keypress();
+	}
 
 	test_fini(data);
 }
-- 
2.43.0

