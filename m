Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E16FED9FE
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 17:52:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77E7010E17F;
	Tue, 17 Mar 2026 17:52:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yR1nBaVt";
	dkim-atps=neutral
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012001.outbound.protection.outlook.com [40.107.209.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35E1E10E641
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 17:52:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tUeM9P4wLf6WEDXbPf98AijBFGBk/JP3mHflok9j4J5sv352noXmwfYFNK5b1aFw/ZxpgvOVF7V5m6pqaU1bO+MF5J3klublvBLuUk0vO0xSCrT2ZR+IS1/OVCFLl52OVimuD5ZHFaH8fC/oNbA1alYBPb8Aend12VzSjLs/mMB8hNy3bjiAsRmNaB+8H+rYtzkGb+OPaeq30s3QaOie+ZNO13NXh4Vw0KsEAfNHgyJqf6SvvTnb6k2/D4YWedsInEGaV0iLZM4kA17+osZN2seC22D3hBoHTjmqfiBVt9bZXFcKTiSfrDTYI2Np/nBJXOnUdkKqamy1vWuvOtalIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FUziBPmIdQnFdl6Uaq8YDFav80y/1RrIiBoefaXij2w=;
 b=XkZSbuZv9oEx2sTYe/9GUuHECur63ChTgJfoTSAWEV+kecvMN2ZmWvrffmjRT0mdmP4pTbquDy62+0PBRl0E7wvs16MO7PYnsWQYagxKpuf4Q9wkOkw6h2A3JSz+BqNRkyDmfbiGaTixLl9wBTMGnTgT17jn4Ud/tDLQ1hogBnFUkon5OWsHLd3jYhdvDl8kf3m3D/UjHQ6yghowlO3Jvby5WqVpkUa917ujD/E42egigB04dWoS4iGTHCNo9+eXV1bfVNvXYc9YOmLUWHQS5aixkepGsP3cHOjnL1v950Jfw/T1xsV9PSupmVJZbkT3SHwb2gWk9hsfA+HRROufxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FUziBPmIdQnFdl6Uaq8YDFav80y/1RrIiBoefaXij2w=;
 b=yR1nBaVtijk+HIRBK9QcdiR1W/VFYI9hNyETwCjQgcn64f6urRU7fGF2TmyQdwqFLPcP+BQG1ij7WARV3vVcS0Qogdf17Pb69izXBDwwuiQ6Ss61p7pcc6fXnmn4e6qJYV1ewkO4JMvl4whIv0oXqdZSDQHNJ3mD6uV+wG2+3ro=
Received: from CH0PR03CA0291.namprd03.prod.outlook.com (2603:10b6:610:e6::26)
 by SA1PR12MB9515.namprd12.prod.outlook.com (2603:10b6:806:45a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 17:52:35 +0000
Received: from CH1PEPF0000AD80.namprd04.prod.outlook.com
 (2603:10b6:610:e6:cafe::d9) by CH0PR03CA0291.outlook.office365.com
 (2603:10b6:610:e6::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Tue,
 17 Mar 2026 17:52:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD80.mail.protection.outlook.com (10.167.244.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 17:52:34 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 17 Mar
 2026 12:52:33 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <wayne.lin@amd.com>, <Mark.Broadworth@amd.com>, Alex Hung
 <alex.hung@amd.com>
Subject: [PATCH 3/3] lib/igt_hdr: Fix EOTF bit flag checking
Date: Tue, 17 Mar 2026 11:51:32 -0600
Message-ID: <20260317175136.3754576-3-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317175136.3754576-1-alex.hung@amd.com>
References: <20260317175136.3754576-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD80:EE_|SA1PR12MB9515:EE_
X-MS-Office365-Filtering-Correlation-Id: 544ec70c-b41b-40c6-8bdb-08de844df817
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700016|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Qwv4F+0UKiugWkpbLbwKF2q1YvRMN4NMnxmiJoRbUs2V+E0KaR4VCOgWKXLtGdNiwI7X4GntiCtVLui/FiID71dM6K9FBdfTv8wydMlMmWKpVW7OV5K9cv6IuNcjD1izqeFL25yMn4ysD3HlvFVpfKft9MxSFrCzFa/9qtKyd43nUkSfpp0+8rc8A198+/A8vIA8QhPjE4i/OqttKbPSYdGNipyusjdD+RGfbFU5Vak/eZkUnHSy49Jd7wP+PhUqw0SRiDc6Z1E19Xg/cKp5cYR1ZaYU/U7zmty4a5JzHwCcIqtreo51gGUHhheeI8lLbbLUEwQyp8vg9ttSqHBmXVCB10/YzISgIwjdaekg8Ir2oJLBpAQOaRi/q5KQH/VpSt6wGdQ/1G7soWdxqiLP73DU0ZeXrmp3FwL8DJonPTSjkBrUs3fh2UN5GAjp0JBcsrHCO5isQ2DJlivbUceMnsnX/+x4iEulc9m6qwtRUSe3EjLUFIp8P1YaRFVa0KRG7alsvj9Iu6pPFQlC7Aj6AR+X6pVy9X1RccY5CapAEGNNxxzd3S/xs58r/WD6RkEeSx6FBlAeKVKuYezTeoNWmFbCFMD6CUt5+oLn4d0jSvylSqg+EU7rT8MIQ5zYEF+QbBudEY0ITpEKE8TUwkPX6EDtPeMCyHpqZ/jVZ8sCLHLIDYk3KDqbKPy1nF4fHKtn/FO/skx47aBxQK6Qhc/v2EH1duKUWgGgsZEGbGouLR+HQUbTi4tWJG8clSOjco3+reRg8fU4YVBJPnYCkmNfdg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: a9p1nvOiY++sLML134vC1nut6Jpzk8NJGUKgIOqwV7P+f+vxaDWPkUnTXG8ZrF+kkKNRUPzHRBXqQrKl12xq4GQdixJu+DAaNugcZ8dIErEVn4YYL/deeOVJA7P3TQPq5/YtpI8OFIz+3TDkC6EAA9jZ0kemKTIJN/aEW51mylFp+RIOYO+shTIchlsHjOOFy8wXvLHeEymmJWsg220fzgdJdfAunOOa3WpUHw21axYPE0sDxVP4VQKdzkrA9+NEINlffXEFYM8z4f73tgmHAdYdkOdAI1/ZAMCqsgU77Fc5vJKZXC84UJESjtiYqYXcOP0odvtAroa9r6reZW4t+c1mfETyouDISSOa79s+Jdz21gz4WmrwTJGzvbHXl6BWAphcRj8F/KnR2s4mQFNkO8tW1ehGvdb3cM5V1hqbL5XZ8Qgmu2mKYJ9c7Aio0zsu
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 17:52:34.2286 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 544ec70c-b41b-40c6-8bdb-08de844df817
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD80.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9515
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

EOTF values are bit positions, not masks. Use (1 << value) to create
proper bit masks when checking HDR support in CTA-861 EDID blocks.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 lib/igt_hdr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_hdr.c b/lib/igt_hdr.c
index 6368ae78b..e1bd69087 100644
--- a/lib/igt_hdr.c
+++ b/lib/igt_hdr.c
@@ -151,8 +151,8 @@ bool igt_hdr_cta_block_has_hdr(const char *edid_ext)
 {
 	if ((((edid_ext[0] & 0xe0) >> 5 == USE_EXTENDED_TAG) &&
 	     (edid_ext[1] == HDR_STATIC_METADATA_BLOCK)) &&
-	    ((edid_ext[2] & HDMI_EOTF_TRADITIONAL_GAMMA_HDR) ||
-	     (edid_ext[2] & HDMI_EOTF_SMPTE_ST2084)))
+	    ((edid_ext[2] & (1 << HDMI_EOTF_TRADITIONAL_GAMMA_HDR)) ||
+	     (edid_ext[2] & (1 << HDMI_EOTF_SMPTE_ST2084))))
 			return true;
 
 	return false;
-- 
2.43.0

