Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F6DCCF9E5
	for <igt-dev@archiver.kernel.org>; Thu, 30 Oct 2025 04:30:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5807510E8AC;
	Thu, 30 Oct 2025 04:30:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="eFJUPOos";
	dkim-atps=neutral
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010062.outbound.protection.outlook.com [52.101.85.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D259510E8A8
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Oct 2025 04:30:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=einP3F5Hb2bF3E5L7ZyDJU01pO9AuQ0GG/FRXJr1povRX/kvLvIQxc0dGa8JU9sIrlyCEuLMijUB2XtSRCeSTpRQl0aFoDtlS3hnkjK1BDm1W4WRgTtnd0VZWDp75OAEuIJNiwozwT3S06X9myS7FbUPJN2yvBt5XCjIIHsn2x8oO3S7of63WxCaq4sZZd6ssSGyRsWQk8IrpB89yAU+y8rQT+lRxnQBcMlQSXADkWKeetq0B25p4131Q0V+PouH49wEVJ3X11PnyoIXa7KSiVpQJuWI5O9AO/On/FIzerR2EzS2y8Lom4FPJglokBrIaUketXrIJydyqwnH60+jQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=blF+zLll9rsQpryU1cgymbZUVZyY0M1j/r1qxiQ3n2Y=;
 b=I2Dqh17C7l6aw/bYsGT/8FvReNcoKb0I3/QzDVpGPrixpYH7X3wSvpe6jVbqgSsoApTkYjXNqkgCgSQQBumbcjCe1ln34PPCjZhhsbRrDjSEAzyZpuuAexHc6hHnD+CsBJSEo9uZhhn5rLEu3xyNwC1nncxVS6NvqLRwnL8rPJqwwckkwTEumfMlbYI/KZYJGYZLJO2yFudflKy4hoKSKIVqEl3wgDQA2QdduGfxLo3bhJEp1l+ORgj2hLrkUhO3ApxpotOro+woIIwEww2+W7RK56waRV6BRkkIWgaLdjyz3PtUYK2ZW/A19u7QKoA1skOTJKTtJ1jv/VKfQQb5rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=blF+zLll9rsQpryU1cgymbZUVZyY0M1j/r1qxiQ3n2Y=;
 b=eFJUPOosLSDVaLvLWxgZpJaOK9GrB8RQUKLBQLuT6p32MhRVD1kdYP/kAYPrSOQZRt79rUH371/tSO0CtGRZLaXluBKYWSrB2qvkSldtYjpuxcC35k0dyWa4lUqNtHV/mhn/vFvh7KJMQY4OeAq6vt3o1wL+rQaiwAXUDsBebV0=
Received: from BN9PR03CA0570.namprd03.prod.outlook.com (2603:10b6:408:138::35)
 by PH0PR12MB7470.namprd12.prod.outlook.com (2603:10b6:510:1e9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 04:30:14 +0000
Received: from BN3PEPF0000B36E.namprd21.prod.outlook.com
 (2603:10b6:408:138:cafe::8d) by BN9PR03CA0570.outlook.office365.com
 (2603:10b6:408:138::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.13 via Frontend Transport; Thu,
 30 Oct 2025 04:30:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B36E.mail.protection.outlook.com (10.167.243.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.0 via Frontend Transport; Thu, 30 Oct 2025 04:30:13 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 21:30:06 -0700
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V11 09/32] lib/igt_kms: Add writeback functions
Date: Wed, 29 Oct 2025 22:27:38 -0600
Message-ID: <20251030042801.2315866-10-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030042801.2315866-1-alex.hung@amd.com>
References: <20251030042801.2315866-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36E:EE_|PH0PR12MB7470:EE_
X-MS-Office365-Filtering-Correlation-Id: 72834441-32bb-48a2-a959-08de176d04fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uQELWgSHnsiqPas7Wr1c1mXUyIDxC+6SjoNhJpTfVHeazrulf00cB30dmJTM?=
 =?us-ascii?Q?HZLbc82Ngh9j9hy3B20cTMSGIvMh19ZyvGbJ6aFpd57ex1cYBPBbDKXVY90/?=
 =?us-ascii?Q?HU63z2k7Uxz9TPXv9ZfNRxMbVERVIXGuyPZ2XSi4wO9hop9f4Na/WDTg4SBA?=
 =?us-ascii?Q?yA9Kxy/ZDaR53rGDb+rnuc/4lH+Uu4sfofs40aKyJ3aP19rzvZ+v1Lre6jtH?=
 =?us-ascii?Q?On6VLbyguvejeofREHWv4p8shMAkRV74bg5qIrrJnCqLA/R6nf5+vqICFAoD?=
 =?us-ascii?Q?Oups0mtsLLTSqi2ISHpoacsyK7REnkA/Xlud1vzbRkxwilXdgSzWAiAGrK5k?=
 =?us-ascii?Q?RoaHKTzZnqrhVAGFNvVie3PBA07vf8oem73ZbDF3UmM/tThm68TL/I+L5IrY?=
 =?us-ascii?Q?CSK92lOaqljTolOmHbmMRFGfZzSRssACzrJ04Uu6MCgpLgbK7/rC9exleR6Y?=
 =?us-ascii?Q?l6v/kzdycT06X3/R5vnf7bQZuLVvOzzHMyY9UhUD59SRjMibT98sl9EcdNpv?=
 =?us-ascii?Q?h81ZIUp97fg/9w9wh6RF64p2UOnWB5/D/4rOjgFRTTuYE9SxnOjuhBoRmYLi?=
 =?us-ascii?Q?qvedQEZOjnMZjtnYprPL0ANJXuEil7LRSVsri2CUZ+OLke4K5KP4JvWSRMXa?=
 =?us-ascii?Q?L62nrCyYMoLh/Uug9UR7l4H+dLCh+3KLwGgcuS0i45McoHLz7BuVRpAaFxr3?=
 =?us-ascii?Q?t6VyX3ph7XWw7daHamxn0amV77gzpcLXfFj0MuGxiWQqtzshwLu7y8+Hnt3g?=
 =?us-ascii?Q?ndX/PCaHrs32Mgd4y+WDT8s96Nbre9AQ7QKREs9rRcp/VHL9PSGotnB0IWzF?=
 =?us-ascii?Q?o5fNl239HgjJI3qKT9nzANrLBUxOJtF1dP6KNPHizS6SG/SJ2R9VQu+MBVQS?=
 =?us-ascii?Q?rmwnsmFZtSeg0F6n/dQrjl5jJqAlyoWjOFX/PnX9ccYUsv3P06U/hE/hpZrQ?=
 =?us-ascii?Q?il7wqQYeAhSU71XnT+2jen0n4jnnpHvtwKFJVEsJ6S7g7IGqkcnpU/ahNmS2?=
 =?us-ascii?Q?jv98sTb505/KPH0IBRQzMC33o+p0Xlc1Kefka1ccx/6DGjcf9UF8LkIUTuH+?=
 =?us-ascii?Q?amAdfcOSC00DjjChAF6mhfs04e8f10Sb0zL8JHoRte/4u4QP5EfXK3GO3hLh?=
 =?us-ascii?Q?waim2P0FnlY/SnyZbVH0FNFHWujcL0Rf2CSH/Ti7+Jt9m08qt4UQg4YWQtUG?=
 =?us-ascii?Q?xprgj4SEli4061rxNUABUto1eOsEg1zd07/jOn0NXnhTPo6U9a65TI9RP9U1?=
 =?us-ascii?Q?uTAVcCLDaQX5Y7ZVAWcwwQtP36eusc3Yzl3Ta1+RduVo8+EH42QNeE4Ut1r2?=
 =?us-ascii?Q?yiI3pL5BIGHehDRxFJfhi4R0L4g44UK9pDs3wvm3MRKiBRJ2FV5FSahr6VGO?=
 =?us-ascii?Q?RIHWm3QTZWLeTtiqdQzpfLkgep6Wk8cENdINanKFa9SacVwdJcDdVR2UXcWr?=
 =?us-ascii?Q?70uLBk2rGGY35baQbjR1x63vXRHyPh+HdxXG7fI6aRmFIt9IlYzpOuKZ4e9k?=
 =?us-ascii?Q?DhOACR4W81dtqmE7sItrP0sEX041rDO1CheIIRFTTsM1Pn614qvX5d0pyzn5?=
 =?us-ascii?Q?VfFJTutdsdeepSVtso8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 04:30:13.5440 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72834441-32bb-48a2-a959-08de176d04fe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B36E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7470
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

Add three writeback functions that can be shared in writeback and
colorop tests:
- igt_get_writeback_fb_id
- igt_detach_crtc
- igt_get_and_wait_out_fence

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 lib/igt_kms.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  4 ++++
 2 files changed, 49 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 1305044de..94664348c 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7818,6 +7818,51 @@ drmModePropertyBlobRes *igt_get_writeback_formats_blob(igt_output_t *output)
 	return blob;
 }
 
+/**
+ * igt_get_writeback_fb_id - Get writeback framebuffer ID
+ * @display: display structure
+ *
+ * Returns the framebuffer ID for writeback capture, or 0 if none configured.
+ */
+uint64_t igt_get_writeback_fb_id(igt_output_t *output)
+{
+	return igt_output_get_prop(output, IGT_CONNECTOR_WRITEBACK_FB_ID);
+}
+
+/**
+ * igt_detach_crtc - Detach the crtc from the output
+ * @display: display structure
+ * @output: output structure
+ *
+ * Detach the crtc from the output.
+ */
+void igt_detach_crtc(igt_display_t *display, igt_output_t *output)
+{
+	if (igt_get_writeback_fb_id(output) == 0)
+		return;
+
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+}
+
+/**
+ * igt_get_and_wait_out_fence - Get and wait for the out fence
+ * @output: output structure
+ *
+ * wait for fence from the writeback.
+ */
+void igt_get_and_wait_out_fence(igt_output_t *output)
+{
+	int ret;
+
+	igt_assert(output->writeback_out_fence_fd >= 0);
+
+	ret = sync_fence_wait(output->writeback_out_fence_fd, 1000);
+	igt_assert_f(ret == 0, "sync_fence_wait failed: %s\n", strerror(-ret));
+	close(output->writeback_out_fence_fd);
+	output->writeback_out_fence_fd = -1;
+}
+
 /**
  * igt_get_connected_output_count:
  * @display: pointer to igt_display_t
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 14152fad5..24895985f 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1378,6 +1378,10 @@ uint32_t igt_get_connected_output_count(igt_display_t *display);
 
 drmModePropertyBlobRes *igt_get_writeback_formats_blob(igt_output_t *output);
 
+uint64_t igt_get_writeback_fb_id(igt_output_t *output);
+void igt_detach_crtc(igt_display_t *display, igt_output_t *output);
+void igt_get_and_wait_out_fence(igt_output_t *output);
+
 igt_colorop_t *igt_find_colorop(igt_display_t *display, uint32_t id);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.43.0

