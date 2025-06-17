Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F14C71155
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 04:38:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD6C810E583;
	Tue, 17 Jun 2025 04:38:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yLlr+FGJ";
	dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2070.outbound.protection.outlook.com [40.107.212.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EAD210E583
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 04:38:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X6gTiLMhGIz1r7D6QzVlVUDCp9XzGOxe0QqSKURJd6pKWNqjzDTDsfOPHSSdLrn8PKEv7ejfFqfqM4pnXcc9H2BFDxJ6RhhcvBUs7JMUQIIJx2x/8Befv+5lAbpp6npESojlR2W72iqtNGHNEHIDnmXGteYgCqTmGZt7PR52ejdlm1DP2sm9WRjC4BjOmCYpq3hIjAthEIpGt4rjXlFjr6jbWLiJRUvSOesG5+i4SxdXtbXjmVLsbSrE4GjQIjsAyAR+iK0mxrQiYEOEO9k6vZEzKapudlbIXTHwJvu5/uHUJ6lIDkJU132Uxs/Z1zrQZ6V35itlvWdG/7OVVpLwQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tr473oBC5vkXx50OVeQnc/o5ovpnSOscAuL0urtQCx8=;
 b=ufcGKDXKoOF1z6IWqCDhVu/zyL6sqXY2pJlqgf97ARn9i/6JdyWBUM1AMmsb7n07l9Yn46ByWj1Tj9NHMixe/e4QBtMLI4TeziI93DjAlH7DRSJS0UE2J9amWWvffGk9zI8U+NWgcKWDvycTh48KCwEPF/nap/LVFFVMw8NdLnml7JUEk1foPMDcxpb6J8KSk+pNXeoZ220ozOB45Gol8uPOMSXLsUZH4LfI1MLgkKJ/fWXRKdZNrmzEjmm2yUawieH2Ne9IsDM9A8XbPqNhRrjoCaCaMgLCTBA8hgaQt3RNes5dH7YMWl+QW4odGeYHQFc+PkPSvo3kziCRwn4aUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tr473oBC5vkXx50OVeQnc/o5ovpnSOscAuL0urtQCx8=;
 b=yLlr+FGJfSmF9V0/LtyXBMo0at3Ql1Uk5p/4fuum4gfQVLJXg/ZbqxHPZpQVUwuDR0TuQHH6uUQyyRqLNeXGYEjFGW6iYBPFozjFNv7pc+R2daGDt/08K7eaMc37L5DA1famRAkCi1znbFkX+6gCkIrC4WTcC1ETrLo+dRllfQk=
Received: from DS7PR03CA0055.namprd03.prod.outlook.com (2603:10b6:5:3b5::30)
 by IA1PR12MB7662.namprd12.prod.outlook.com (2603:10b6:208:425::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 04:38:34 +0000
Received: from DS1PEPF00017098.namprd05.prod.outlook.com
 (2603:10b6:5:3b5:cafe::aa) by DS7PR03CA0055.outlook.office365.com
 (2603:10b6:5:3b5::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Tue,
 17 Jun 2025 04:38:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017098.mail.protection.outlook.com (10.167.18.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:38:34 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:38:33 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, Bhanuprakash Modem
 <bhanuprakash.modem@intel.com>
Subject: [PATCH V9 09/36] lib/igt_kms: Destroy colorops on exit
Date: Mon, 16 Jun 2025 22:36:04 -0600
Message-ID: <20250617043631.2920587-10-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017098:EE_|IA1PR12MB7662:EE_
X-MS-Office365-Filtering-Correlation-Id: 59fe2cba-6f3e-4116-be41-08ddad58d1d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bUXzZ2AV0EM/ErGVpYgnZsqi4uEeggIexp7Qiy1JHhjhAr1TWnXHVaKHNeIZ?=
 =?us-ascii?Q?5CFLu5chNjkhnceulYpHvV+H7o7w0RNdIavmEp/msRWGqtA9BGVGoVqM5Rjj?=
 =?us-ascii?Q?E00TEBitcB9lylwPr52/m67+iQV3RKj8XHJFXj35gcZ1VzUyqa05MEFIr7pV?=
 =?us-ascii?Q?LZHw/GK1tb1a/rdGi/p2vOjjm/d18TnC8dkqNFl1keeWURYqRzMh+VlmlNRm?=
 =?us-ascii?Q?9OWHjQzupsdGKdiFwK0EVjy27VE6k2JeJeZQR41GgVD9wjVfHziec0/+wqSB?=
 =?us-ascii?Q?HLCaOBKyFlZ54iGNRI3isFG0Us1LXs/zb3Lxn2wcrkwVErsh+YwDr6wvsO39?=
 =?us-ascii?Q?Oy9VFTX8lmT2DZNhGEEw3e3XRT8X/doHyTMyG0WlX/9RfA4y3Bjl6y84V32s?=
 =?us-ascii?Q?pQlZTWPi+9wNIUsDXot9IKzBlD0e3ROkJuPt3oc4CrfKOI4wW89YodVPKoUj?=
 =?us-ascii?Q?Ruf33zKa3GfYqrFD6KklNGsiks1wQZvx56OmIz5WuBSX9/GBnDswsblnQYiW?=
 =?us-ascii?Q?3khUY8Puxj93VLkty4ISVDXJn4IFu3Dx74fnLqQeYHxyIW0GS+heFzFu7VCD?=
 =?us-ascii?Q?5vhPzIePJRex0wM6zmOMYiNCrCTIMbUHgORX0nnoyugoG0cLLAywuaLVb1O3?=
 =?us-ascii?Q?mQhhG/r1Vf1w4hd0bqKiNwUBTuGD9F2nT06c6SyAbzhJXuLt+DyDMzWNNBrH?=
 =?us-ascii?Q?yC7xniErEPPkvAi+w8BwNfsGb+xhnynk2OR4616knnfEpAAoZ+AScrn/werX?=
 =?us-ascii?Q?kyqd7BrPr89OfxOtd0KjGdO+JUnzunFmNd83Phog9h+hTjnThAiXJ2FOimKT?=
 =?us-ascii?Q?SXEdLbMW1oA0etrdhpTkDVDLEkjyR6v5l5a6Cy5/YLJ109PWzVuY7UwDojXU?=
 =?us-ascii?Q?ICx+NKQjqbxAyUo72awGY9bQg7QVfdkxZ+spIj9+RZTjGJa8Kk7mh6rlsxKw?=
 =?us-ascii?Q?eItyCYvquyYfnxcUmr2Rdh42dWxuGFreuZb4yipSMWrSd47vqNIP0voWbwSs?=
 =?us-ascii?Q?rnsV2eCoWEv3FPx8fU1kVX3tfZDOq05svSNJa1RS/FrX8jaDTx0IsJ7T30bP?=
 =?us-ascii?Q?LnLsVAL34QPAE5NMcUdQ8zynYO/rXlT5Nm7dfoV4Xdq0bMU/x8IXle2E7vMb?=
 =?us-ascii?Q?92Q7h9kdrZgv4Lcw1jmtHziqa6d2ABrWed26tzQ+wC5SbCUL5L6A0zQBkVav?=
 =?us-ascii?Q?kft4vH53cvKvXtJV7Pf1Hrw1s794nH5+e/NezEI0q64A73+lPnRSUq2ewVzn?=
 =?us-ascii?Q?KIvVL8O5nFhxQ8SeTTEYPZHhnGwcZGZiEG+h8UueGp9O9PGGF7WuEcXSYIYl?=
 =?us-ascii?Q?8oW6ITes7RBvaFt38oAqyXBSN4X3gz+tfIII5/WVJ5Eu1WAsGW+xFiqk7AMM?=
 =?us-ascii?Q?x2Y/gwgn8jRtbnlQLOhb/baeIf76uy8mHYMPSh6+jWIgjtSsfEJ++zGSSoMM?=
 =?us-ascii?Q?Ny/DGNBU3SZnmnCrcELvJ78OTgPICUrWJBvZZ9JYEAvdCPwJs0YssIRjw3Ib?=
 =?us-ascii?Q?7tdoh4wYgjGQ+uFZaSf8L2RiX28tgGU+9a4Q?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:38:34.4613 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59fe2cba-6f3e-4116-be41-08ddad58d1d1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017098.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7662
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

From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

- Free the memory allocated for colorops on igt_display_fini()
- Disable COLOR_PIPELINE on igt_display_reset()

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_kms.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index d0c0e5ac4..35ad7ca95 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2707,6 +2707,9 @@ static void igt_plane_reset(igt_plane_t *plane)
 	if (igt_plane_has_prop(plane, IGT_PLANE_HOTSPOT_Y))
 		igt_plane_set_prop_value(plane, IGT_PLANE_HOTSPOT_Y, 0);
 
+	if (igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE))
+		igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE, "Bypass");
+
 	igt_plane_clear_prop_changed(plane, IGT_PLANE_IN_FENCE_FD);
 	plane->values[IGT_PLANE_IN_FENCE_FD] = ~0ULL;
 	plane->gem_handle = 0;
@@ -3435,12 +3438,15 @@ void igt_display_fini(igt_display_t *display)
 
 	for (i = 0; i < display->n_outputs; i++)
 		igt_output_fini(&display->outputs[i]);
+
 	free(display->outputs);
 	display->outputs = NULL;
 	free(display->pipes);
 	display->pipes = NULL;
 	free(display->planes);
 	display->planes = NULL;
+	free(display->colorops);
+	display->colorops = NULL;
 }
 
 static void igt_display_refresh(igt_display_t *display)
-- 
2.43.0

