Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 185F0C8303C
	for <igt-dev@archiver.kernel.org>; Tue,  8 Jul 2025 07:48:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDFCC10E5B0;
	Tue,  8 Jul 2025 07:48:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nKnv8dIU";
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2058.outbound.protection.outlook.com [40.107.243.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8012610E5B0
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jul 2025 07:48:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H3QYJ0p3GzXdSKLyw9Zm6bBPWdS1g8V4tmCZ8A3Muw3+l44hG5NnYTp+nPGZMl4UghlizX0I8WNCLpRq01dqQUm1LkMfIO87qqeqF+3hSBTm59JFcaXDwkD0uf+wmmVZRGkEDLx/bSdlHqb3nLAj1czZ8KgYoSdmOrdkM9n4vVYhEtXAGSFyp+upFzNMITdQuRqSfwna6yM+h72XEt7Kzelfytfkcx06qoA5S/nA6WqYC+aPpS/TKcu4SgAuucapp6c6W4itCWejlJtYo3nvPRRAm0OXEUicWYW2VGd/ldntqLzvuK7X/VrrnNm+A2kcNaqOvuobplKA2r+566jFUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gKQNWoYPmn2z1HRkbBUSzGQXNNDwWzdwMjp8MUJITf0=;
 b=myS5BkSM+eP39+/e5iS6Gv7QRcHUUgkB9rnXOTkB+K7SzBCvoeL13ThKLideKkStBRX7rfja65bH9JiGf1/5fIOeG4ARhke0UccC/BNeNShaIlnOkgWUaDQ696ofYDB0spPtuZEkhsVNmsXCL6/CEgyEkt6hP7wsfkxoE65a5y5uDgwJKUsgWAhNv3o+LZjZ1C+TDgdiOiwNkWmjBu1H2EIidwQOfi565/zjCpZLkuj3xldoKqRiKpJ0Bi7gs0ksBDMf8Co4ZOIpP/r2gowfZfdP4ysOrerYpL2XLCvN6ffi7j2U0SZLbdz9Nl2HwE8z1MgkHDadVYI+CBcTpNEXvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gKQNWoYPmn2z1HRkbBUSzGQXNNDwWzdwMjp8MUJITf0=;
 b=nKnv8dIUfsSMEQoDo6kI9H6eCXEJ+txc8Ou/1qu+JrbOQEnUqrtIAZTxOdaJaBcFvfNWp1T1x05+KgzSju/myL129EiKITab2xnuzmxSVXoCzRH80qMtyWk1+QX8LuIYwvYX/vTsPlD7EYlkkvSuXYL83eYR54mTTrw74ZyhV8Q=
Received: from BN9PR03CA0427.namprd03.prod.outlook.com (2603:10b6:408:113::12)
 by CY5PR12MB6201.namprd12.prod.outlook.com (2603:10b6:930:26::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Tue, 8 Jul
 2025 07:48:23 +0000
Received: from BL02EPF00021F6D.namprd02.prod.outlook.com
 (2603:10b6:408:113:cafe::c7) by BN9PR03CA0427.outlook.office365.com
 (2603:10b6:408:113::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.27 via Frontend Transport; Tue,
 8 Jul 2025 07:48:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF00021F6D.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 8 Jul 2025 07:48:22 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 02:48:22 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 8 Jul 2025 02:48:20 -0500
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse.Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t 1/4] drm-uapi/amdgpu: Add num_userq_slots to hw_ip_info
 structure
Date: Tue, 8 Jul 2025 15:47:47 +0800
Message-ID: <20250708074819.624367-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: Jesse.Zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6D:EE_|CY5PR12MB6201:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a03587f-85ca-4ce6-0e10-08ddbdf3d053
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TzQKQlkIs+ruii5i3MKwfEW5XJh/OeniTPgAJTA0gs3x4sY6AGzblatzAyvJ?=
 =?us-ascii?Q?ql2CcDeCFjgYgimus3teBa3XRef4mXPmRRD4ddjBzAmOdWUJwMh3TCggkfT0?=
 =?us-ascii?Q?UeOetKu/XOvx0KHo1VLVouIJZO/QWzbUSP6lUW5OSIkZOa1um9JvbQXQCg7O?=
 =?us-ascii?Q?HtrfBotO8lauWhPyq7tV/X6pO/Zb7yX6m2JdPrkZbQIksgRqFDdDhtBObYI/?=
 =?us-ascii?Q?wX8K9OBb+EGf5Uqun7j2l/E0vae+fWsp2nYms8YCEMjOSWEIDwR+OGKCwMEq?=
 =?us-ascii?Q?+/RsrdmW84+f9fXUeiHmIIWuaW7vEJ9mUNjhQbkuWhEU8KNrWt+nDwMW79h2?=
 =?us-ascii?Q?znwrduRhiLwv9F7x7nZNTdvN2rSCtsW1RPBLFribOWO4gSFH03uITfjXWnhB?=
 =?us-ascii?Q?k6ccUI44aEJ2PZTs6EvMgtAQ11ZBmS6cJ5TnGsIo9uXXMdDkKp+Krb+V/pye?=
 =?us-ascii?Q?JJXddwSFoGyljcdVdeSv78MulXIvJXkYQRls/lfON6n0ArXpasnR9vtArygD?=
 =?us-ascii?Q?0lZFpumH8PPMdsewgpe/gPLk1Km7bvhVJfHEN/gf/+WaWdw52yg+FG82/jAf?=
 =?us-ascii?Q?tb1qEnZmMU/V4T9KCJwHd0Q0t+jBrZjAm4IJ1MXTPRbOoqVyYnjUTrfhPoFQ?=
 =?us-ascii?Q?WRxa0vikU+q1U9iQCy8/rcFx6Dk2uKV8jWlLA6slHwrCf7OCYwBO3TWxQ6pf?=
 =?us-ascii?Q?feSJO3cEPsK50OyEw4vd+Wvfm32ia2uK1DyWBm8/mO+r1GlPQwnA8KgouolG?=
 =?us-ascii?Q?WKmy6QUMF/pX3t09wso8M8iDDTYsNrZ3juk6agnv1f4h7FVr6YNNXHiTO+8b?=
 =?us-ascii?Q?1DsIIWU1pjElD6c4uzVY2n6lyf/J0iz3vCXRoHli+XIvZbRHcmzpNRvrD7gA?=
 =?us-ascii?Q?Gm8X7E457RPBRy5lZ3JxRdxDXc1NY5IVCW5jsJc/5nLshW8wzQoeielVOI2J?=
 =?us-ascii?Q?9GKbI8o9lY0eCVvhaMuj3olhpeX2wFmD5+5vyBcs8mMx/JwJgQLVLPcCd/uC?=
 =?us-ascii?Q?at4HAWu6DLq4PYuxBs9XoddtYibRAxBwtslrnob8Qt3iHBegpp9QBt2EZ7U6?=
 =?us-ascii?Q?rz/foo+FXUxAnnYgdjJ0jKXNx2z4jFeojZ3quS9YuNwAfKtz8M3LAdMVQqp+?=
 =?us-ascii?Q?8+DKqE6tqONsIdf3fya8yCisn/qAZZ2MoCml6dvspp/3w9wo7ChLVq38KS6s?=
 =?us-ascii?Q?x7V/r/0NCczwPFq6zK04E9vx2L1j0cm265H2kUy05UMl2Q+u+o/7BAFYYg5x?=
 =?us-ascii?Q?cWS5Rl50Gj4Rw5k9JVGGUyolpiyYv2oHkCjDwWMqQqj6c21yXr536ANexVvR?=
 =?us-ascii?Q?SnCg1V2iAg85ZGEPHTPYDa3+ApmSR4KdP83rwsAKtItXz7MZoc+NPGBkDgui?=
 =?us-ascii?Q?/IMJkAGjD+BV0m5Ohs4qyt864cF46iyjEbYR93VeJNLQAa/SZZnFALQddmFV?=
 =?us-ascii?Q?gyiyZB5TvaaMtbD9u57I3/cq556nEHsqzfViorcG24Fts8eFLgVBjoFppBi9?=
 =?us-ascii?Q?vYnedfp9l/yblqCaXquGERAIzA3w4Hxyl+xd?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 07:48:22.5846 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a03587f-85ca-4ce6-0e10-08ddbdf3d053
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6201
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

Add a new field num_userq_slots to struct drm_amdgpu_info_hw_ip to expose
the number of available user queue slots per hardware IP block. This
enables userspace to query and utilize user queues more effectively.

The field will be used by the amdgpu driver to communicate the number
of available user-mode queue slots to userspace applications

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 include/drm-uapi/amdgpu_drm.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h
index ddcda5d3b..b38f27d69 100644
--- a/include/drm-uapi/amdgpu_drm.h
+++ b/include/drm-uapi/amdgpu_drm.h
@@ -1465,6 +1465,7 @@ struct drm_amdgpu_info_hw_ip {
 	__u32  available_rings;
 	/** version info: bits 23:16 major, 15:8 minor, 7:0 revision */
 	__u32  ip_discovery_version;
+	__u32  num_userq_slots;
 };
 
 /* GFX metadata BO sizes and alignment info (in bytes) */
-- 
2.49.0

