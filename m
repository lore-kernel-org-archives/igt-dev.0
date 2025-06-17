Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 543A9C7114A
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 04:38:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A5EF10E572;
	Tue, 17 Jun 2025 04:38:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kdiNtWd5";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2043.outbound.protection.outlook.com [40.107.93.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A29B10E572
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 04:38:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=blTb8oW/C6PdNX7hdfnLMU+lP+KlrVRF5/qU6kvUhs+pFteGi8kF0jmKX7YDEkyL/WUi4rOj93dvvOvk3XNxXIpFRRfqZ8PJV+0DirzuBPpUxT9ihXuevnLKX/FBH/vRQiecAweKv6xyszLfI1Lg/rcQRAe8HCO+4YQ5izqy/ulJqqnZPgVxlEVOEMKUA5wCY3ZLWQy4XvLETfFfvoBy3+6cWMoYQeBfV/SFYXxFIAsVkp/BNmL0xT73eX0FvGLQlzkMOBugmdeul8107Mju4BqaaA98AtNnlCbGw2YV4st1oqUVlo3KDaDNE5cMHap90EWklIJPnK/1xGetKOhTYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KwBgFY3+3tnau3kFhhSdMJkgkh8FAInixuJSD2eq6KE=;
 b=wMD9ATfmFLw0gW+5AC7FiIwurARJSKC6WmKBOmKNTOuIvh2fG1/lSTlgmSgqeb5geEM6SMs7n/QBdhWPE7Gl2aoVLOXHpGvDbDEaMghjccnk8sYYvjsGN1wOmDJwSJDxJ7nr6V9IgBFa3O2Uqt7CLV1XXPD7+P7qxf8B6Na4QSiiHNMpp7nmeBRqOVYLBfW9p5xSY7RIie6PvF6R5gBhsWQ7Gc0HfvAJwJtXwxQS1Slzja0CivxmJlXqh0OsVN5rMlXewLk1Syi37Mu1/4l/PpPQjKt0rkmUwapGDAoGBbR/eS5urcqDkiegmJHeBnWMtQaU+VvhfoMT/aUmSO5SWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KwBgFY3+3tnau3kFhhSdMJkgkh8FAInixuJSD2eq6KE=;
 b=kdiNtWd5MbrFDek0u9k+/qKnHTvM44ghGHjjePvhTm+HEFN4UPRNxaN7pYtYc5qFZuZWUme5+lNLLDgTHjJGBT0tpvMF/0orGyt+L8DmXtCwwi2HYxODmSWGPMBi7gaF4gRVLmb0QCqgfeT7AvcFZBk/hpFsybNtH66pSrMCdTs=
Received: from DS7PR03CA0060.namprd03.prod.outlook.com (2603:10b6:5:3b5::35)
 by CH3PR12MB8849.namprd12.prod.outlook.com (2603:10b6:610:178::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 04:38:10 +0000
Received: from DS1PEPF00017098.namprd05.prod.outlook.com
 (2603:10b6:5:3b5:cafe::1a) by DS7PR03CA0060.outlook.office365.com
 (2603:10b6:5:3b5::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Tue,
 17 Jun 2025 04:38:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017098.mail.protection.outlook.com (10.167.18.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:38:10 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:38:09 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V9 07/36] drm-uapi: Add 1D LUT drm_colorop_type
Date: Mon, 16 Jun 2025 22:36:02 -0600
Message-ID: <20250617043631.2920587-8-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617043631.2920587-1-alex.hung@amd.com>
References: <20250617043631.2920587-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017098:EE_|CH3PR12MB8849:EE_
X-MS-Office365-Filtering-Correlation-Id: f75591ff-e85d-44d7-2331-08ddad58c375
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cCanNcXadjgb3A8ya/AHXwIZZuXRxXAS7hO6kaAUOg8Jm+y+e1ZCMzxxk/RL?=
 =?us-ascii?Q?h9DpGCcExLG1K9VD6zJiv0pdqWRI5LAtfHWpXDCgYe6jc4+G66gTGL/O+k6V?=
 =?us-ascii?Q?hy7ft/41S2y+wP1kyOlW3fCjHsCCOD2pTqPBDw547fhATOBZntVczO43Vv6E?=
 =?us-ascii?Q?8/yqqfwTw/3xzaQF4vThowbmvcdssLnqbj6y605VaMZGFuK3PIDv1WLGA6y9?=
 =?us-ascii?Q?YJuYVg28PJL2Drv5PPD2cWp/FHgR7UrL/ARzqgfaAogmOIBlClBZhPBe36jD?=
 =?us-ascii?Q?t1wVy+CqE1+lonWmd3aYrvjp2CuZikKZb6n5e9TQFdwhcaaCI0+5PWrpQObq?=
 =?us-ascii?Q?ixigGTfKH4QBr8OKQPwg03p5yFtaomn3n/A3RxQy1Lr2iVkKD9nQQw3SbFq3?=
 =?us-ascii?Q?Dotgaw24j1Z+D25V0KLmXENFOZFR5xyLRguHVI5M+plXABvDyQtQVoHjSp/q?=
 =?us-ascii?Q?x63z2xTjKv+oJy5L2CzD/4VB4fujMBT4m5CZXWzYyynNqvsQ0gNbPiYVCyEn?=
 =?us-ascii?Q?o17RdA023K6w0kNgQpKg3nSf8PbkbGQeuGQZcQtupnHBOixE+SZhm8Crj7W4?=
 =?us-ascii?Q?gziPhRHjT3S0VyQVNYUMGaT700h1fyN5lbtLurAOlKltjNxoY8b/MbYFW0yW?=
 =?us-ascii?Q?CILT97Vc9WGPY8BSqXTLr6IKwMStBKlqRpF9E8IhMT+28tro1dxQEI3hFtbr?=
 =?us-ascii?Q?A8o62B7/qbgsz6Bfrh5bRVEaV2oBbNQXN5nU1BtpZvevSUfJqh/Guq9iF1mP?=
 =?us-ascii?Q?JHJRYyWxwv6aydneHHBL68ig1Z6LHfgA317Vpdqy0TYuezCyfsDCSXJM+Uek?=
 =?us-ascii?Q?NUwShT3vF4zMa9lQ+DFx2MWq/gBvNTkPZLW9ye1lKosMMjAj7XFySTN4iohU?=
 =?us-ascii?Q?vyfqcVMqVVauSYRE/zXjYaYRhPa2FOrEGGNphscwHCfMylOU8Qgq8hsaeNPb?=
 =?us-ascii?Q?7At8VgPSECbI/yTdSyZ+OxcE4Eglivoa83M9tQduhot1ya7j2UbSGF/4IWCR?=
 =?us-ascii?Q?xaqcrpPb1gJWrqt0E2JxGhHzjbJ02MWXapOY+SeTvorWO6JoCOxb2TZseXXM?=
 =?us-ascii?Q?BcoUoaP5efyeZrALHtdhkFiSpnChueK/0WV5m6Na11tn64FezFjHCMf5+w/C?=
 =?us-ascii?Q?cqNPRTfdV3iUGBu98AhQXlb9j5q2wmqJBzCctj3hHwK6CztleAdXHMtMD3u2?=
 =?us-ascii?Q?gnhEsuSM+oXhtXGcn/ji/63bMwTwjEoWjKZuCffmbV2VlKA11S4uJLNOT0+N?=
 =?us-ascii?Q?Rgm2cufh7F50sjHZUZm/7FcB+dttyQxzjDccMVd9+WBNCBjFSyolStqAt/2m?=
 =?us-ascii?Q?oYZSIY/vcaEdfPhmYCjATHeUT1+4wI74XliIWHdMO0IKM/Nhq4RCpAs87GdD?=
 =?us-ascii?Q?dT71TVOsA9LpuCoktnrQZlwykIA0Wq24ylD5xyroYrLqttMcndCMdLpPSiTY?=
 =?us-ascii?Q?4hZgzqEp6WJa2MYPcwm6F2QKzX7VCO4MzHwqOZstjbHO0qtjTZaIBxtEW/lc?=
 =?us-ascii?Q?d8+KK8q6ATDK3i6PoeiBJrrb6INY4/FC+n/K?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:38:10.3684 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f75591ff-e85d-44d7-2331-08ddad58c375
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017098.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8849
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

From: Harry Wentland <harry.wentland@amd.com>

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 include/drm-uapi/drm_mode.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index c5debc1e2..fce45b5cf 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -876,6 +876,7 @@ struct drm_color_lut {
 
 enum drm_colorop_type {
 	DRM_COLOROP_1D_CURVE,
+	DRM_COLOROP_1D_LUT,
 	DRM_COLOROP_CTM_3X4,
 };
 
-- 
2.43.0

