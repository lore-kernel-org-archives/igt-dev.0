Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E195DD10380
	for <igt-dev@archiver.kernel.org>; Thu, 24 Oct 2024 21:07:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 964BF10E3BA;
	Thu, 24 Oct 2024 21:07:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="eBWq+BTU";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2082.outbound.protection.outlook.com [40.107.223.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42D1C10E3BA
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Oct 2024 21:07:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MCZ53IsnVjPrfC6Pr9KxYOGAjU1TmTEf7orCD8rRrugp3ICYwmUhxlRyJv/DjxOTkzKRFdg3HwUAZEs5U3qQrMEZ6DySgFfdvre8u8RF35jabi1UU2tFSih550Xiyh8pBnWYOdNGpGOCxENM5HT6fMaC6tuNH3s5jTy0fX4lRoh3Wk0yMnG+KbMBRN1SIHiIzB0iDvRNrId88gOwvwETJNpHEa3suJJrc2oviAxgi+XdpGqyowLZZJXKhjz0pKBFncHjujAZohUZr+2OFJzgmL6+3YAKmbtuIZEyR7nkzjcwFbv4L8oy7NHWtwOgBg2dP/1NyMVGpsRjT8DOpgpixA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfnQGgqv6EQbod9bzAALn1mrnyTIxYUZpn0DdmDnuis=;
 b=EDFEIc1R+Dfya0ZOGqIB9HJiSFNRY8hAXBaKNGnsyCRBbUvqwZTxIR0JpCEuRhIU/8AjYEsbk0xQ8ZR1jXR1p9GcaGwvSriABmp0G+cVPoCypNGolJl6KD148yrIE5JunuC9jlZPAz0XFcEWZV2C3jK8BnqBgIbqnXOpTQpEOuz4VyYg2GTCOzizCPL68KKuiYJSon7TnMEEMH5eZj5HTYAhW1JvADkiypmJAnHXLGbvR5QjJI2ZOvGVBkubCBmra9puq2Wf8khTm8PNsJ++7BdE4t9ldvMouy+HWk8+WEZOpKNc5CFTRkaMgGQChplGX1EdPYjfiMU/xqgKlsKKRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfnQGgqv6EQbod9bzAALn1mrnyTIxYUZpn0DdmDnuis=;
 b=eBWq+BTUTgHfYByvKTSM2fI4QcSONIJwCaZL19VOc5QSjnTQ0jx6RyTSzMhoS+XbO8naSvyBFmouAy57j36NImHgoUT2DPav8dFlxlIMQOfWr6U2CSo4KA+bVZlxFgapYrzxih7LYyUJWkp1Kuz0UOcq+3elGHFqgrR0kQK+FNA=
Received: from BYAPR05CA0068.namprd05.prod.outlook.com (2603:10b6:a03:74::45)
 by LV3PR12MB9258.namprd12.prod.outlook.com (2603:10b6:408:1bb::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.21; Thu, 24 Oct
 2024 21:07:15 +0000
Received: from SJ1PEPF00001CE4.namprd03.prod.outlook.com
 (2603:10b6:a03:74:cafe::f9) by BYAPR05CA0068.outlook.office365.com
 (2603:10b6:a03:74::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16 via Frontend
 Transport; Thu, 24 Oct 2024 21:07:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE4.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Thu, 24 Oct 2024 21:07:15 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Oct
 2024 16:07:10 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <harry.wentland@amd.com>, <rodrigo.siqueira@amd.com>,
 <mark.broadworth@amd.com>, <sunpeng.li@amd.com>
Subject: [PATCH 3/5] tools/amd_hdmi_compliance: Fix VIC 0 not working
Date: Thu, 24 Oct 2024 15:03:43 -0600
Message-ID: <20241024210345.511501-3-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE4:EE_|LV3PR12MB9258:EE_
X-MS-Office365-Filtering-Correlation-Id: 67be51a6-7e12-4e91-a3b3-08dcf46fd646
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rExKx0Fwt8+ilwdFhxIAG2NK8Di9hkWBW4fDKtU1q38iX7E7hFGd/P9xiA6a?=
 =?us-ascii?Q?oOvaRlGPy1fQa4bvTCsQAhzZqUHqlYx1f+Mw8Gi1RrPsts3VflIEGZgNi51i?=
 =?us-ascii?Q?FfWR5Sg0NHs3TDYaIG2aKjOrF2HYHSdBA6RlkSsTpvG2NgN2umS4LtqiT1w2?=
 =?us-ascii?Q?AwITfGXo+D/a6bGDQ/SJDfoRbnbF2oA7NeRTgmQ3Tq3mGXEmHyBrc/RgrhqV?=
 =?us-ascii?Q?urAZ9+YZCTp7GzKoW8yHJvx5FBG4EYucM2pXCgVAVx2EMJrdxB24nBNcXqem?=
 =?us-ascii?Q?ZpJXGKRjxp8wh9tKVFzAmvyZ2g2VcpwSIELpGNCHjcJmU16IHJF3gKw7UPsC?=
 =?us-ascii?Q?8CRXQkmHKoKRWiNunY9OvNuqw4SF82exUCoOr7hegwXunfEUhvTgTV/pWXYN?=
 =?us-ascii?Q?rgM4jTW+KSjct9LzfNXW8v49QDtR4H9mvjIxmr0QUjyj4XdqUbhl5IR/KsV3?=
 =?us-ascii?Q?uKb1/CY9mD0CnCsV4BqOmhcei7I0wnu/pFCfsFVcOsHQzvPay3O5pnznRW6x?=
 =?us-ascii?Q?guoVeYDQ54BnBgytRHMR9DA6jpvElY7pIptwbhP70lb1avFUjmsTcGQGYQDS?=
 =?us-ascii?Q?JxC5RgzOQJC4H5HHLN334lN4SnvRTsYks6SxAHpsoul/zq640VgXPL9IpWSK?=
 =?us-ascii?Q?VHi7OSZvsQ2XCernfysE15FhGE6YZGzY8zA8wvlmcyzLud3bYAjFv4w7dXsR?=
 =?us-ascii?Q?T6UFi9t9RW7rd3AzBCBvB/FuU5kgABfMxNdZlEEO3Bnt6SOb1apTdV4/AF4G?=
 =?us-ascii?Q?Xwah2k/u91epGI+voQes5kCz3rqUXyFRaDkXb/syR0D/jtrBOR/EHb0R/gUe?=
 =?us-ascii?Q?fl0WQLclXqWcLLMx7HX8Dethbm2aNr6zXBqmrKK2AlAN4d2uwg1zetWB7MmP?=
 =?us-ascii?Q?2LnAaEPNfLeWvUO6FICjO5JA9QEL/wnwUoz69fSRUCXray20DN+/2LjyTtHG?=
 =?us-ascii?Q?1ixA5R/Jr8xDZD6LhijHBiDDMdeqRYlTMt3KKuzTEZlE3WAJi2vV7i8hLQ99?=
 =?us-ascii?Q?oCMYZDHkLmbS6b9HiZ1tnePDlqbwnQnjxTMYJrNb1YdiFKbORSPGcq0z9/10?=
 =?us-ascii?Q?SE5GqeE/xpjDmFCceuSEanpCT2OU6lKa78iF2jQyeZEN+/OVXvoEx8WEAkXw?=
 =?us-ascii?Q?5biF4T926sDUhSVuBDrZBvLB+gfxtoc0ee8Oc1COCAspyoiMVOCTsze4BEZG?=
 =?us-ascii?Q?IWlkc8oHfCnGff1xO7Zh84RjUsCgK4gENjp+vPSU3cwYFVYy8/48hGPKkS7c?=
 =?us-ascii?Q?2B/UDz4PThwaVWUy29/DtOoT/ivl3Fj1IVvHIhg02dQmDi9VkatPJXIHnmNS?=
 =?us-ascii?Q?riBKw3CQyFtyQBSHf0WM5B5wz9MjtVq5e+UZv+9T7sMxCgCB25Fn3dW826nL?=
 =?us-ascii?Q?uks7oFPSDpH7OnUznnI5l7274y4o6B/Wh7SP83cksCHAcxVH2A=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 21:07:15.1862 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67be51a6-7e12-4e91-a3b3-08dcf46fd646
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9258
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

[WHY]
VIC 0 is not working with -t option

[HOW]
Make 0 pass as a valid VIC

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Stylon Wang <stylon.wang@amd.com>
---
 tools/amd_hdmi_compliance.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/amd_hdmi_compliance.c b/tools/amd_hdmi_compliance.c
index c0a324eb9..f06af72b0 100644
--- a/tools/amd_hdmi_compliance.c
+++ b/tools/amd_hdmi_compliance.c
@@ -527,7 +527,7 @@ int main(int argc, char **argv)
 	if (max_bpc)
 		set_max_bpc(&data, max_bpc, conn_id);
 
-	if (vic) {
+	if (vic >= 0) {
 		if (vic > ARRAY_SIZE(test_modes) ||
 		!test_modes[vic].name[0]) {
 			igt_warn("VIC %d is not supported\n", vic);
-- 
2.43.0

