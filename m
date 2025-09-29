Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D428BCAC5B0
	for <igt-dev@archiver.kernel.org>; Mon, 29 Sep 2025 08:35:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CA9610E3BD;
	Mon, 29 Sep 2025 08:35:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XyBLvIkJ";
	dkim-atps=neutral
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013016.outbound.protection.outlook.com
 [40.93.196.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A21A410E3BD
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Sep 2025 08:35:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YzM3Rsczskc0NuDfSTayYvCG1vtvd6pe2dUY13QJWcwn+vAMbdMTkYKBh1MwLeM2vn/w52XQJ18Qi/eSMnGNLHmdQKORY29s1auiaW95Z1BUuFzNX8rBvXBGTF6EiwAixsnbEFenJJL/gYkM0zzjHSd6hXiUdgkAtaXS5yECec1mKjPPRVEQ63Klw11IyZinRKS6PnEa6wBhxXtv2d3aDXouhkZZVwYLTHJFmkwYKbR2CktwVO8fPoqzQF25GW63dXpwj0i69m0u/pqh6LpmZISUU9Bc+2Uock7Fyiakjfv0yVjm/tyP/en+rIvPb02jeSmfBIQQrqAW+al/X4YNvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q41S5Tkk68/L/apIDypzcjbOhc0sCiNQrpOrciMZ2aU=;
 b=ImXqpOZBrta1Mfs3xNQE+33xnDf5GDw3JiuYM4hQDWgH69L6MVjjH7Lb8Zb0JJ/k9/zP0oF3nKxbzf8GXXWh3zQANLx3uDxp9R9WH06mZo5Cxm1HzFldCEfNALLrwIf/LyqBGoJjeZpfyG1IWUHXfaiFKZn+g0hUhqDDcC5ybS5kkLkuaG0eERaF3ssPSNImVEK6+kzM8uC4UpWMaBjJZ1UIvHubGOL/ayj12RBvX8puUbdCAvY7yiEkNI8c/S5UpwbngvxQQuQYr+SyC+Vz7WxqUtC7O+YPJs5CuRXRJ+s+fVZ4SmkboWc2ngkZcT5kF4BK5l/T993RN+ZWabBWfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q41S5Tkk68/L/apIDypzcjbOhc0sCiNQrpOrciMZ2aU=;
 b=XyBLvIkJSVrSZFLdicCDw7mdk1d4dKdEsOKnne4pPf575wyDOn8dJjhA+hpT6AEIsLTBTjEMG3e6sgiUbpfEWP5rPkH/6OW6ETd83+o1j4sCEzziJHMXQUUdxfhSjXUyWFsqSdFrXFH3rxAynDI5N9Lp2CnG3/A8VtjRfLwxH3U=
Received: from BY5PR13CA0034.namprd13.prod.outlook.com (2603:10b6:a03:180::47)
 by BY5PR12MB4289.namprd12.prod.outlook.com (2603:10b6:a03:204::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 08:35:28 +0000
Received: from SJ5PEPF000001C8.namprd05.prod.outlook.com
 (2603:10b6:a03:180:cafe::89) by BY5PR13CA0034.outlook.office365.com
 (2603:10b6:a03:180::47) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.10 via Frontend Transport; Mon,
 29 Sep 2025 08:35:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001C8.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Mon, 29 Sep 2025 08:35:28 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 29 Sep
 2025 01:35:27 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 29 Sep
 2025 01:35:27 -0700
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Mon, 29 Sep 2025 01:35:26 -0700
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse.Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH V2 i-g-t 2/2] lib/amdgpu: Extend JPEG direct register support
 to version 5
Date: Mon, 29 Sep 2025 16:35:14 +0800
Message-ID: <20250929083523.3181081-2-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250929083523.3181081-1-Jesse.Zhang@amd.com>
References: <20250929083523.3181081-1-Jesse.Zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C8:EE_|BY5PR12MB4289:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cffb0a7-81db-4a98-4e05-08ddff3324d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Dm52XKp8ozKoZsg+by0eum6+Y+W0d8Ef3ez3d8ifLGxSgC4sk7CleKeS4jAq?=
 =?us-ascii?Q?la48Nnw/eo5glZCzpL1M0zyLidimgvBafpeJJ4xQr2DvJIMtiUHDhUKUZo8v?=
 =?us-ascii?Q?ZsKGk4aXMHPT35jxftmyCp7LJi2eMLfPTxf1tEE5OkMMBkOvxk2iXr3fhYmi?=
 =?us-ascii?Q?eVVR6MzM31rd6Y4EO/IbXlz/cHsE4tcmeX1k2hRewemmmj8SzT/zok05OXDE?=
 =?us-ascii?Q?kWYaN8CEg9xCxCShl/QrdVA+O0TOV3IC6TIxOD8cXMiKO95lGnHedFG3SCx7?=
 =?us-ascii?Q?eUubUg88l47SJkGzFx7nVi1rfSjuocdSluarTHABkOus7t6mAL7Z3nHnodyy?=
 =?us-ascii?Q?ZL2p7QSvoDAqjG05AqbM3jNwji+TwZWmE0oKf5cd6EkQIl4gSMNJRZzkphpd?=
 =?us-ascii?Q?lVaLQgqydA9BkxuhPBsMqSCpTFjD1p7Z4rEvhYmf910XZrONqWfe3kuBw3QK?=
 =?us-ascii?Q?LXkaScAIyva4Nwz5npwc3if7fpx393cN6h34/BpSc/mg0X4Zcc27yE/fYMQJ?=
 =?us-ascii?Q?2sd2WHUz7EOeWcrzIO19wP1ykEflDzRUWlDEyi//kUUYPjyCHMnYZFPFXhyW?=
 =?us-ascii?Q?ZVdh6eZL/jeCxi2EeciKpjxmFwBEY6yUyRVXw/E8G51IJVycZMxNaLwAzvL/?=
 =?us-ascii?Q?d8qbyyknB5bSJ+x8VUFTY5j+RchQDAaznnJ7cSZRx6wgsjqncAKtQXzjbtSG?=
 =?us-ascii?Q?t9hKzIh+c8VPho6/a2jW5Vy4J6KKVjZCktulpSgjIMLTWZKhtpS6W0OxecGS?=
 =?us-ascii?Q?xged5C3YkZmzur348fTUxNAkhEPHgsCZdAOOGF2on/inezI/gPtw++jnQ7gP?=
 =?us-ascii?Q?/VQ142fd85e+1NCxsOFtyKVtM4EmEoFe8SM4ExBBYZgxiO5FtEK5Tt9AUIaH?=
 =?us-ascii?Q?FUAigkFR6bUSl39388vCXhoUtjHznngHKUxZuVXevtHJACt6HK79cHQicb8s?=
 =?us-ascii?Q?2wmr4pDwkcCRqVzCrlJj5bE2/c6/LtNVqKq9K+Fd/FYxq9OMRZRBng04+fW9?=
 =?us-ascii?Q?WIpTpzsYUIHOqxehK47NsMvVmDpC1zxaaV8JT4l2qz1Eqn4zqa3RqQKu7dWr?=
 =?us-ascii?Q?E3t3XFW3WO0EzlRx3pwtuqOF46V7Jry+KV5R0nIV/8FnEKGSwt1dIZ4LV//5?=
 =?us-ascii?Q?6kpNJj7WP88eIwyJORd+c3bM+g74qDWw/MiprN+PbnwWRAGNvXl7EHJhn8jc?=
 =?us-ascii?Q?bqan787nSs2O2JvWnrsisHbjjx3WSw3zBhUriw6yQknnOo0kDyLacao636ZB?=
 =?us-ascii?Q?z0XbbfDxvMjcPIFMy7onRUuN8cg+Y8I/obF48Ivrk/v4d4ev+ld0d61o54WW?=
 =?us-ascii?Q?J6s3uNjZkra+TBnHXHeAeKQ1RjpJrsDjGhZox0Eh+QBK7zgClM6xZJlCdqcX?=
 =?us-ascii?Q?FQRnpDkKSgKObzBEEj9YfO7/++IghNjLKR3eyFgKqO1ABMd5NeuI3oXN9Jbm?=
 =?us-ascii?Q?XCZI9cTsiyfE6t+nGLeVsD4KUeOsURDoJCSLY/YKVlShco8gqQnXnXG6Rfzs?=
 =?us-ascii?Q?jx4ToxljpD+hTCF+xP9469pYyFKrQDKmGIUsbEwjNHd/kkjTEIk3K1TtQOW0?=
 =?us-ascii?Q?1eBu1pGxmb7gfEEzp9s=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 08:35:28.1661 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cffb0a7-81db-4a98-4e05-08ddff3324d6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001C8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4289
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

Update the JPEG IP version check to include version 5 for direct register access.

The change:
- Extends the condition from `info.hw_ip_version_major <= 4` to `<= 5`
- Allows JPEG version 5 hardware to use direct register access mode

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 lib/amdgpu/amd_jpeg_shared.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/amdgpu/amd_jpeg_shared.c b/lib/amdgpu/amd_jpeg_shared.c
index e9f673a42..4c17f89b7 100644
--- a/lib/amdgpu/amd_jpeg_shared.c
+++ b/lib/amdgpu/amd_jpeg_shared.c
@@ -22,7 +22,7 @@ is_jpeg_tests_enable(amdgpu_device_handle device_handle,
 
 	if (info.hw_ip_version_major == 1)
 		context->jpeg_direct_reg = false;
-	else if (info.hw_ip_version_major > 1 && info.hw_ip_version_major <= 4)
+	else if (info.hw_ip_version_major > 1 && info.hw_ip_version_major <= 5)
 		context->jpeg_direct_reg = true;
 	else
 		return false;
@@ -188,4 +188,4 @@ send_cmd_bitstream_direct(struct mmd_context *context, uint64_t addr,
 	/* set jpeg_rb_wptr */
 	set_reg_jpeg(context, jpeg_rb_wptr, COND0, TYPE0,
 			(JPEG_DEC_BSD_SIZE >> 2), idx);
-}
\ No newline at end of file
+}
-- 
2.49.0

