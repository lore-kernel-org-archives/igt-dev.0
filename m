Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F095EEFCD6E
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 09:46:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C2EC10E1BF;
	Mon,  9 Mar 2026 09:46:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="L6TFMXfN";
	dkim-atps=neutral
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011007.outbound.protection.outlook.com
 [40.93.194.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2144410E3CE
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Mar 2026 08:47:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IXmTeAoGU9WkiwHhLSRuRXrzTuVZxDMQ+fgh6VxFoMXRIHWGk/mBnp5kF/JhUFQyWcN9GRBMLd190sr6hwl2FSgmWcFwmOVz/kUaNPR1OE44aT+euOCrGBXp0mb3YrKyC7W4pYd2ysafctvMb4dorAKedARYBKy+ZDp4bn08jew/TQV5fVJ/Apn6RJG60ge+4nmTTR/Qaud7l2yDvf2iuqJ7iinyAeProBKvtLfQgbTkO4TH+ZYKXEm463UAPpnsV6LN5F65PAWZFrm+BvjyUg4IhiTpUNl2pbIxSk0hP5NiVe0e/2c7sC5GyrHFuONXuaRRU6szhogMIbCstVSOHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gU1prBUQN6/8jteM8ifE01H+x7W1+P/seJ4l5BFpOv4=;
 b=yEcOOmlTMCLNsPErHeYBYd/SXtJTElElrFiQjf5Qov/0iOOd5lPLabC4ec/hTE8MEA6PTmbpmIsHpx8a6TqGPzfyFdExUX9yfbSoORThAvnrVrDSSmIpViyUfIPo8KH8xEgfBdAeqEMK34X5mpKrVaKMELjn3zE/WeEhm9H/Jo9YDqdU+kXfGbxsRamKctJvgRMcFgloPKqooU5SjnciF9KnPNBbFdcCZsgFn7lH7/j3zlOyvZ2BtTwb6ZTx2E2wdSANAmWnoOMzzDfOnl8A+C+thslB31nMBVbfUR4CfefyslNlagv8t3ZH2x4hxHyAm9SId8D3M7roaonfWhMh5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gU1prBUQN6/8jteM8ifE01H+x7W1+P/seJ4l5BFpOv4=;
 b=L6TFMXfNTNJNLHTDXM1cIZ53nRzkK33GMLtaXQ8A9KQz+HhGE/xAXuan2pGD3L7CIFWsGdd+gKHrwUKDP+sSKrtrHA15zb2+DEHEAqA4CZyHuUp8tensQvNS/ByCqS43U618pKx3M/8rLgARyu8Y3HSOWPkT9AdfDPUlZgGCTFg=
Received: from BL0PR0102CA0004.prod.exchangelabs.com (2603:10b6:207:18::17) by
 CH8PR12MB9815.namprd12.prod.outlook.com (2603:10b6:610:277::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 08:47:23 +0000
Received: from BL6PEPF0001AB72.namprd02.prod.outlook.com
 (2603:10b6:207:18:cafe::bf) by BL0PR0102CA0004.outlook.office365.com
 (2603:10b6:207:18::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.19 via Frontend Transport; Fri,
 6 Mar 2026 08:47:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF0001AB72.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 6 Mar 2026 08:47:22 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Fri, 6 Mar
 2026 02:47:22 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 6 Mar
 2026 02:47:22 -0600
Received: from chenyu-station.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 6 Mar 2026 02:47:21 -0600
From: Chenyu Chen <chen-yu.chen@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <mario.limonciello@amd.com>, <chiahsuan.chung@amd.com>, Chenyu Chen
 <chen-yu.chen@amd.com>
Subject: [PATCH i-g-t] tests/kms_properties: Add panel_type to immutable
 property list
Date: Fri, 6 Mar 2026 16:46:36 +0800
Message-ID: <20260306084652.797940-1-chen-yu.chen@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: chen-yu.chen@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB72:EE_|CH8PR12MB9815:EE_
X-MS-Office365-Filtering-Correlation-Id: fb32bdb0-7162-4dee-5550-08de7b5cfc1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: 8t54vsKA8eANBPzHDxCJPYgQBtekQQ5z3dmyj8PNy9tKTUVVl4CcD8f5kOvvSdwqB/VpOgz3ak+VCFXTo4HgXDTCNoowwdxf04EKmgVUqW2Qciw1q49PPiY2xRml3ymEpD35a6unY10V5ZqjVdfCLQcp+RIoYamwp5FleXZqW+V1T+xYhBn/qyLz/FnhuMXCqmig/jRwl/W1Df6htUurnIWZ2G6ET2mkD78YrGcMAeDED6AK5WOq6O+AESKGMKu2j7TbwubEPknSrfsyZ7yJoX1vP3F8DMR+u714So8iwRUYD3Z9cJBv58hWe4dNKiWAPDKb6uCdqXDv6DN8gSEMk0RtoITILbq4O4Q3XmpY43+Wx1WsZECmVhSlQKQ2yTJH713+ye37VwXjNICRVN8GLcQQ9AGGUP33QSJmciNzxgpIMsm4PVpQrlCbERSmowXtI6vlQXX3ueStn/6XeRJdUM5CX9w8yzNV5CFd19XeX1vfqA8cVppkr4h2zRc3FDKQ5UqbvwX5XMdEh8Y7m7ys9IiBUsLqyc/ikPwLWZnqelvg0uYWhZ+05kkCfipF/2vbzTTy10xJWk28hUT0f2USpnfukSSZQVfi5dcxe//J/rZ8WcLjTfF8srzO6y4CXrCLXmvXAWi2sbEak+HYiKtNtjmLftZ7Ym7Z0GWWAhh0+OrRWMljrYIyiCIg4ifekV6216r5H92BQW52kF7swTTAJMeAfuq/368AeDkmKQ1Cw2ivFJP1o87Vazn0eJzNHVP6/LtijTiKE0/829dn/ppYUg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: K70ebAAsTUb1BQtLxvWUpWhLFJdrTPvMO2R+laEACIoHksFL7mm362b7fKgqbjHNKn4CdubTKaofKxlLiUFxAYAmD1me3XTfWoxbChjgmg21U9dp/jW1PnySrId1jP+qGdXHkh+It8C16zLsMZu7GcNengR3iYGFLVytyjeoIDrwP6POnQs0oSth42SpxAotHtUSgyzb0pC0bfb7HYcU6/8PxpP4B3jbkjPyrx2GuANaFz412gYlNIF89x75XoUEzz9TaDAO3a1onxA+or+hHOiyNslvzNwXmza1hv0PVLzqPpwrFHCyq60Ea38jxRMVoQo9OJ06cRt1sEyGfyT7BiSemhN+GUnRvEEsDC8b8/7etnCj0Djw9iV5md2PuCBAgHZhFnx1SZ93eJPJ9VAZYdz78wWIt8evYHoMpW7f3fZ7oFT2l5o/EbK2iU07Bt3K
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 08:47:22.9743 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb32bdb0-7162-4dee-5550-08de7b5cfc1d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB72.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9815
X-Mailman-Approved-At: Mon, 09 Mar 2026 09:46:03 +0000
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

The connector property "panel_type" is immutable and should be
validated as such in the get_properties-sanity test.

Signed-off-by: Chenyu Chen <chen-yu.chen@amd.com>
---
 tests/kms_properties.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index d41003781..f735839da 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -560,6 +560,7 @@ static const struct {
 	{ DRM_MODE_OBJECT_CONNECTOR, "suggested X", IMMUTABLE_REQ },
 	{ DRM_MODE_OBJECT_CONNECTOR, "suggested Y", IMMUTABLE_REQ },
 	{ DRM_MODE_OBJECT_CONNECTOR, "vrr_capable", IMMUTABLE_REQ },
+	{ DRM_MODE_OBJECT_CONNECTOR, "panel_type", IMMUTABLE_REQ },
 
 	{ DRM_MODE_OBJECT_CRTC, "DEGAMMA_LUT_SIZE", IMMUTABLE_REQ },
 	{ DRM_MODE_OBJECT_CRTC, "GAMMA_LUT_SIZE", IMMUTABLE_REQ },
-- 
2.43.0

