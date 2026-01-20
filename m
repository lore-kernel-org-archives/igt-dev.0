Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC084D2ECF9
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 04:47:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7155110E183;
	Tue, 20 Jan 2026 04:47:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="k56Pce1k";
	dkim-atps=neutral
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013069.outbound.protection.outlook.com
 [40.107.201.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B82410E183
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 04:47:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VXrncSb7PLeee6teSWUAE7MXxjXlMp+FSmYDCpg5enKG5eZGcuPPXtD8bkIwldc2PacXXUNcz9/ZvTZLCvQPV4bEhoOAyGAg3xSEO4mqvvuBRgY8ctKZvk1/slODWARv04TMwIHUPIUQM9PzuyfxF1Uu5b+XHuvqhoFfmuyKf32uTY77sApCFuYQnm8JARy2op9Up1ESJqN6jGgTl5laDv/sBNbKz4wlcuaMgU3YiTMUnNG47OWhKZ8OOwHDlUaRkP2Kxrxa8JXID7Tkod0Jl6wXmDvRLVfwo72rav3XvZgcN+PXLvSrJillGjeCaPz5YbqHM69fytUhnDWIuPajLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c7hkG6s0UwnKheDeBDF6+bpqKwq/mfykNq66C52ano0=;
 b=Tp9HLIk3DJPY6OXddLc+t4/bQfOuoipDMr/tYrm3thFkKLpa0JC7DdlCuwbk0Cb8NCXzgupaWKn6w140t/82Z0rN6WyOBggpHb1nWxQoXsTb+KCIS7x4MAfVaeRpgbiPimQUrfgnPLiV8oXYytlSzuJYLXea7sRb0aX61XJ/FCaw4AOiUDhjJEKPSJeD4uLeH0bUfWzoOxu7IrJvVHwx78Eli+ySPSfT+txuuU2+e5PdyMYNc//8UiG0PWd9IQt0+hNedpy2ZJXF7pZXPrPhlMhtM4SSIb5lCcf7paK8/SM2KjvdHFT8k29/4pKe/SwcPv8yzgWb+1el1r3AJNgRIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c7hkG6s0UwnKheDeBDF6+bpqKwq/mfykNq66C52ano0=;
 b=k56Pce1kHQvcX/jktUX4ayOwrbzCdHnSaAkfa0QwIHFhbiWsYv5CJ180GNSWk6Lh/ZAkDamlCFxbacrxH0EQF+WmLTl/OHRhph4dck57vma00mmgJRv4n9343PliNxqK+njb8Q5ctlQwg7tEqmrobI8axZ2LkpF8Z7lu9jzBUs0=
Received: from MN2PR05CA0058.namprd05.prod.outlook.com (2603:10b6:208:236::27)
 by CH3PR12MB8356.namprd12.prod.outlook.com (2603:10b6:610:130::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 20 Jan
 2026 04:47:01 +0000
Received: from BL6PEPF00020E63.namprd04.prod.outlook.com
 (2603:10b6:208:236:cafe::68) by MN2PR05CA0058.outlook.office365.com
 (2603:10b6:208:236::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.8 via Frontend Transport; Tue,
 20 Jan 2026 04:46:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00020E63.mail.protection.outlook.com (10.167.249.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Tue, 20 Jan 2026 04:47:00 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 19 Jan
 2026 22:46:58 -0600
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <harry.wentland@amd.com>, <aurabindo.pillai@amd.com>,
 <suraj.kandpal@intel.com>, Alex Hung <alex.hung@amd.com>
Subject: [PATCH 1/2][V2] lib/igt_kms: Increase MAX_NUM_COLOROPS
Date: Mon, 19 Jan 2026 21:46:45 -0700
Message-ID: <20260120044646.589301-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E63:EE_|CH3PR12MB8356:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f5d6e3e-42ee-4510-7065-08de57def2c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?s3nholv27duJzAhjM0DpRVbTOh5Flvela9vbttNFp0DHnG+zuawxTyStt8oy?=
 =?us-ascii?Q?7uglBE4tcwGnLP3SrdqWoFKgG/M1QEhkQS/TwCkzimzxtERqCZnJbXo0t0IU?=
 =?us-ascii?Q?XlkDMtfYP+DChEuHQKXF4PQw2XsVdRqT4FwTsKguOzkZ9McFOrO7PN2L2VOW?=
 =?us-ascii?Q?kPQ1hc0ghIp10Ob0K+zx1y2kTRXZ58+bGsV5AHh5BgosT7PufhWExsk9hewX?=
 =?us-ascii?Q?VDEYCE72dSzu/LQVouLgPMXNwdpTfKhnq/Q9Rs+qml6CRrl2in+2V/a14jba?=
 =?us-ascii?Q?s7r8oynjXaZrFBytRp7JtB4Um7kgSH13dbc2Ww/DQ850GygiH6FsNmdFROOc?=
 =?us-ascii?Q?BeobFhpdBs5E7epCOEDpAXm+ufvcheEvBwDlh9hf2N3t4visbb1TSZQERZlu?=
 =?us-ascii?Q?JESTUFDTahihYNpUV74OIJEnLIObkVjOee9R+olLacUTbQMvGmws/gH6AnQ9?=
 =?us-ascii?Q?tZBa+oI5veniEtyOIPlRQA/f/GumeIwaD1j+l+Pg/JZTGxK6UARc1dpAZcrk?=
 =?us-ascii?Q?hJ5D1e1oiYVWbNGC9qXRk7gG24kT73uAHNulsnAHgbNZYVAheErYl07xVSnI?=
 =?us-ascii?Q?fAPhD+tLNxNtgEaRUHG7J8G7HmlT2mOA+IIU20urg1w/sjucpPZ408sTduav?=
 =?us-ascii?Q?0r6l80AvG0khAyv29wuRz7VAZivPcQufzdzpnbsTrHDUb5FshlQBkWwjCiqx?=
 =?us-ascii?Q?mwZWVBSp1UfOTdPYqp9oxdDZvr77dBvuY2iSInuUbqvnnJuq+hsxGAHUASmO?=
 =?us-ascii?Q?2ZrU5TpN33V6/83WcLofqIW/wSA5p1XttQWVssO8j1RmgjUg7RGRTGJJqBqt?=
 =?us-ascii?Q?TsIeeKYosMUqaqoeUq7lmsTrDRh3fgAWif1OtMn+jv4P+Lv7jHvOlb4AhzL6?=
 =?us-ascii?Q?ZIbGDdA/UuwBXG1YlWLH8GwAyx+MD91pX5pO+X/3UWA18L0ZqK50M7DaTiD9?=
 =?us-ascii?Q?dCrvWgUHj0sxs+8IKpPhgCmJXLFR9z8607a9Jz81xXtAWGeZSdrPC5pw3YvK?=
 =?us-ascii?Q?SuMQsSLa4Vt8uGmbYDGxaAnPq7gMAI9xlGD/wVZdg6uu31ICEcnjg5lfPihd?=
 =?us-ascii?Q?J2R6z3CAkjotkxWQ47n6spWOZZ1Gl7eQlbZlmdbEwGFy7fgoZMvdGoHkJZk1?=
 =?us-ascii?Q?7XPELhPgIJzULiq2JCe2bGQ8fbOYTpZHI6ZGtm45niQS+RUGEU0FfHRoy/Du?=
 =?us-ascii?Q?aYLJJB+Duz8C6wlIUIrNJ/VhX8g3RzxvbgE4qVzhv2BJVWlUe63PQ7Lu14rL?=
 =?us-ascii?Q?4HBKA4LR8fqBvkjfKz4NJsxyQDUjic/HBf1PeMveNiyZCl8GCLR2Y/VzWFfg?=
 =?us-ascii?Q?CIHyMAZMyUgLSZ2XZKtDbYUgQmuAN3Nv6pIhxfFZ8aMnEx+WWKo87rmBmO31?=
 =?us-ascii?Q?Tr3RwD6LY64GAm+UXLoUT1DUziMSDzkOF9Ju3L/rtkVgrA58FZG0od9N8Ink?=
 =?us-ascii?Q?3gd9rrKqBR05raO8f1v0qk89NMb69nRbSMicfzso/ige8co5IHp2em4GyGqN?=
 =?us-ascii?Q?sRlVlDFiwPlXteGe3TMqszk5RlYe5+KKyCq3cQsuvZV7V9ZLtE/qbWLDDw6z?=
 =?us-ascii?Q?OfCnGc8VIs8LebgToHieNrAHd77VrFp7jenbUkDr0NKuAC9WYacVpCFglLxj?=
 =?us-ascii?Q?7DWQv1ASuP+FL/Gw/lbv1DbYt1K7aM0dtk3L3v541jeXqc+PJ8pwNZsRS9jn?=
 =?us-ascii?Q?kn1cWg=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 04:47:00.0144 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f5d6e3e-42ee-4510-7065-08de57def2c5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00020E63.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8356
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

MAX_NUM_COLOROPS = 128 is too small for some hardware and it stops
kms_colorop from running by the following assertion:

(kms_colorop:3233) igt_kms-DEBUG: Test requirement passed: resources->count_crtcs <= IGT_MAX_PIPES
(kms_colorop:3233) igt_kms-CRITICAL: Test assertion failure function igt_fill_plane_color_pipelines, file ../lib/igt_kms.c:877:
(kms_colorop:3233) igt_kms-CRITICAL: Failed assertion: display->n_colorops < MAX_NUM_COLOROPS
(kms_colorop:3233) igt_kms-CRITICAL: Last errno: 95, Operation not supported

Double MAX_NUM_COLOROPS to 256 to avoid future frequent changes.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 lib/igt_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 77b3ae2af..dfdebb83f 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -92,7 +92,7 @@
 #define MAX_CONNECTORS 32
 #define MAX_EDID 2
 #define DISPLAY_TILE_BLOCK 0x12
-#define MAX_NUM_COLOROPS 128
+#define MAX_NUM_COLOROPS 256
 
 typedef bool (*igt_connector_attr_set)(int dir, const char *attr, const char *value);
 
-- 
2.43.0

