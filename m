Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD8C7D10376
	for <igt-dev@archiver.kernel.org>; Thu, 24 Oct 2024 21:07:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C4CE10E3B5;
	Thu, 24 Oct 2024 21:07:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Ze3YJFn0";
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2048.outbound.protection.outlook.com [40.107.237.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA5B410E3B5
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Oct 2024 21:07:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w6IvnnWBhExtF6LYg3AfrNEyaaQTlX2WvjVy1nEMhuxBBBmpTDRx8HllJxtxxgPd2PmJ40eZY1EEKaDEyi63CpgOqV//nTPagF6WP4AaozmG1lXxtzhmExPUHL2LtOAny3FcnMuWabYNGVkQzw0uuO/WfoWpa4ZvdfgAts1HIc7r1KP7H3l2PGZKOGlXYoQQUqYZ3XKvv057rVAKL5pWH6bHT8KMQ3uRJjHE3fTPQAeE+uTYnDOMSLeZXhXOVwJgWECuLa8lM1I+K5VRIaZOcm2dvogNbGon2nUoGl1YKttMPTwO6uf7OjbVdvFB+Br9OpVfOAIOeygAOryHx9wRpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+qaMtSqQ99syAwuBHhuRcBes+keIkWlQlSl4c3M7qMI=;
 b=FIeoRuPl4NaoJg+nFI4csKSeIG5qb47meEsIYYLuosQ6jwcLUte1ZgHa6CztZrTBchKkWuueq1LYjzCpTJuYRP0EfkhrUKkjmkaSwCnx3ayL+g4TCeIYUNzNGFYiIrguV4ApS19uv7HNQPRBduaFLRw83e2NnuxE3mKTXRtuiJ5dAR+kaZbXY4vr35dufPSbSB75pe5cnRO+HpuDAXdskpKzzDft9pXnlRK28ic7A0lwZO+cTsWRe/Dw3cwITbglSULRTsFrBII6zz9Z/aaCHwODJUPnCGNZJYz7Vgm0UA3oFMDxoS7FhpV/uGuEETnKonPr1wlkc8AD0V+Tr/NBbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+qaMtSqQ99syAwuBHhuRcBes+keIkWlQlSl4c3M7qMI=;
 b=Ze3YJFn0ZTUq/hnwvncgQhR0Ku1ELcRNN207aXnW55c5+XvS/miQjQjltNc61+VJk1jPWexfkJB4r9RKoEpOUlpNxETFBCuANjpgAFBzpeVUs0XLD2NSZ4z0rnrdUBCJUY6RAG4uhUDoK+X7dxdg6WRjCPNqWdqoQeMIPKxtHNI=
Received: from MW4PR03CA0245.namprd03.prod.outlook.com (2603:10b6:303:b4::10)
 by CY8PR12MB8266.namprd12.prod.outlook.com (2603:10b6:930:79::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.18; Thu, 24 Oct
 2024 21:07:27 +0000
Received: from SJ1PEPF00001CE8.namprd03.prod.outlook.com
 (2603:10b6:303:b4:cafe::98) by MW4PR03CA0245.outlook.office365.com
 (2603:10b6:303:b4::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.18 via Frontend
 Transport; Thu, 24 Oct 2024 21:07:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE8.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Thu, 24 Oct 2024 21:07:27 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Oct
 2024 16:07:23 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <harry.wentland@amd.com>, <rodrigo.siqueira@amd.com>,
 <mark.broadworth@amd.com>, <sunpeng.li@amd.com>
Subject: [PATCH 4/5] tools/amd_hdmi_compliance: Support VIC 91 and 92
Date: Thu, 24 Oct 2024 15:03:44 -0600
Message-ID: <20241024210345.511501-4-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241024210345.511501-1-alex.hung@amd.com>
References: <20241024210345.511501-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE8:EE_|CY8PR12MB8266:EE_
X-MS-Office365-Filtering-Correlation-Id: 95f20c98-858e-4e4a-4f61-08dcf46fdd78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gdsrntG/kaFe4PSiacik3WIJR4bbanXdBzGrvKWVuT7LH0II4TI0CBysq/y9?=
 =?us-ascii?Q?PwB0wDLjc2espPpUlu0/OiNwd63r22Wte9+22QMuX7o7pzNSPlH5OzR7Br3W?=
 =?us-ascii?Q?PvV31UEmUvW0ZH+xqG6GIf2E4NJz9jJdWddpywbDvqBABNKyr2mqBatVmCDI?=
 =?us-ascii?Q?YgAlVjzkb2G6ZcTPJ7vWonHq30XaWGbAGdGldBD9fe5Wxq2fATwROLSnZg1m?=
 =?us-ascii?Q?ZVgirKaOCp3Lnxkn//2hEPrQ73Oq3/4yC5SvrM+NCPKsNJoIQcz3DJsY3qL+?=
 =?us-ascii?Q?TiGUFhCUI9zvv1gz99HzXJH3vf2wGCOsiqzWpfYl/EA5ELoEe61jBtGOKUrp?=
 =?us-ascii?Q?WOxyPV9reKEVOrVxI8s59va+mzn3iHPNwJ4bXYtCUPxzSZkXJMRFra9LDlV0?=
 =?us-ascii?Q?y3Y13fHmMzRPrZLuowstwZe2NY3dKO8J+THfduicCM1xr88wTptQn0BaD6dT?=
 =?us-ascii?Q?TRTxH8YSAkdl2Cr7FcaOQJfBgjUDzlJ6z5c6NqAZnGWCcUbnJj/Fq0ioO7uN?=
 =?us-ascii?Q?yLi+R3kmd6MIXqnOkaiMXPueKp38gn3gUPiKRXgHO7R1f+oNv/7Ao3tW92VT?=
 =?us-ascii?Q?8foOCYTHFN3ATQ5SeGY0gCu0qB+fJNoiyJNS62o7LG98ZCdFtbwZhIEGQaua?=
 =?us-ascii?Q?zNUWOjKSFoVg/LpnkjQhyYP+6HDtSoQpdmVGzLOkIu/yM9yfbcLpUpmvHOTV?=
 =?us-ascii?Q?xZQYt/M4CENz+kjEurDOS+yYoL6xMJWflVSOPN/PaDhGFMo8KPn6PS0n8/eH?=
 =?us-ascii?Q?yfT1Byj+dmpuYahkxGwiCvWU2CGRZ8VO4QVigsMFTU55uNwJcf9N4OFYbf8V?=
 =?us-ascii?Q?pNfrPvRY76RocETN+jp9rJ05Cw5SXdezKzYIbZuyRy9tMn1JSGuz9pda/sl6?=
 =?us-ascii?Q?GkYl3FZwOBwmECHlxbH8OkN8K5BIWOB4Vzv7Q3OVUCBrKwX54zrN9Zknw6Ix?=
 =?us-ascii?Q?KoPX0hc9yLVAfU8WK6qR0GIDqztZici4quJX/WYjmx42JyGAoJEIAqsw6Mi9?=
 =?us-ascii?Q?YqOMMsFRXtnux/SfV6h2mKQUJ/3XWJXdKoth9mRalWtGFMttg87eBnLb1GjU?=
 =?us-ascii?Q?LPUgDgBmTU5tvEeSsrj0WD9GqZ/QnMPEQxfOp0vx+WucS+nGW0kKRKrFs42Q?=
 =?us-ascii?Q?QwN0RPuBDKifLz3/pxyQDOMlOD+WzlRyO4rHOD7y42LiCOvOEBH9nRBI63/z?=
 =?us-ascii?Q?VoypJxdt2D4yjVdbt1tiVUdEnST886Kc1KOsSLQvRDKrqio+JEoSpgT/uloU?=
 =?us-ascii?Q?TzI38pMWfwe0RsjAGmz+IUGFfojzsnojDkiD/aU8MCE8nFoKvOWpIXuQUpPF?=
 =?us-ascii?Q?ct1mT48+yybgxby+JJrQRMaULJT5Q908ToZQF3BBg2LJZvZN0Nhg2c6AdBmo?=
 =?us-ascii?Q?qeJxji63BroTWegXj6zwC1tHIPblpNAK+3+psjNN0bOMA/sy0g=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 21:07:27.2401 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95f20c98-858e-4e4a-4f61-08dcf46fdd78
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8266
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

From: Stylon Wang <stylon.wang@amd.com>

VIC: 91, 92 are supported timings by DUT. Add these timings
to pass few CTS items

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Stylon Wang <stylon.wang@amd.com>
---
 tools/amd_hdmi_compliance.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tools/amd_hdmi_compliance.c b/tools/amd_hdmi_compliance.c
index f06af72b0..49fc21d5a 100644
--- a/tools/amd_hdmi_compliance.c
+++ b/tools/amd_hdmi_compliance.c
@@ -266,6 +266,18 @@ static drmModeModeInfo test_modes[] = {
 		60, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
 		0x40, "2560x1080",	/* VIC 90 */
 	},
+	[91] = { 371250,
+		2560, 2778, 2822, 2970, 0,
+		1080, 1084, 1089, 1250, 0,
+		100, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		0x40, "2560x1080",	/* VIC 91 */
+	},
+	[92] = { 495000,
+		2560, 3108, 3152, 3300, 0,
+		1080, 1084, 1089, 1250, 0,
+		120, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		0x40, "2560x1080",	/* VIC 92 */
+	},
 	[93] = { 297000,
 		3840, 5116, 5204, 5500, 0,
 		2160, 2168, 2178, 2250, 0,
-- 
2.43.0

