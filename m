Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2409FD2ECEF
	for <igt-dev@archiver.kernel.org>; Mon, 19 Jan 2026 22:43:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB50010E169;
	Mon, 19 Jan 2026 22:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KgCr3HpV";
	dkim-atps=neutral
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010007.outbound.protection.outlook.com
 [52.101.193.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4FE210E169
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jan 2026 22:43:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P0u1+U3AkYEaE3XsJBdlyhBxT0EZh0XMrPyg0ZUaeXNBffPx4nqAyx4LQQY45Rn+v1Dv/GM8gbyvIwn8/8o5iMEJuS9IgWo+dy0/2LrJJhRON3402rtypHZkW1Voy9rGYwb6iunquLewuh8nb/6ijYxOhdCVFa8VXgW6tPJFR6G5wTTL8Uca0jtTxcUCMN08a6yLPaNXt5TOb782F96K6PNQA6I2H7MUmrTEI04+gyICaeIHQy8XsXwHY6ueC9T4D3Xzprdu974Fbjf8F0QZKmiDRzZtAILrTpPtU7E19xOnvVtlXhenR3LF2oihkcJSFuuZV9D8/Bs/JUZlstwaIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fYSmQhfbWKsP7Y+/2IvTFNo3nIVq2jqie5tS52Nu4eQ=;
 b=DCTWSL5opV5T/tQOohDQqsr378KuKPgvp/O9hN6lNTzlpLkMUwJCPseW37ZhrvTRLLPRAOQ0GkeH2Bm0JSDekovbFPVanon5x0+YoRPZGOdR/VR6xl6DuC61eDyi6AHeiUvBW1+/vxBK/U5z6/Ou8AjxT2n9o/uzacKac3q3O3Gv1LbqlBqk51fre9JWtTyaS4k9B7piz/l50fuQFnuz+jjKFksgyaJstVR/83VN9FQVWl6z/38Ylt+QlYGIB0+ZouoHicDbEPGivCJvOSMCJasvllZrwXIQJ3WeJk45Ipxg8uYApaXVUPKU5ob+5A4DfL6m6jF7+uID3+6tx5Sfwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fYSmQhfbWKsP7Y+/2IvTFNo3nIVq2jqie5tS52Nu4eQ=;
 b=KgCr3HpVmCkrEaAkHgaHku9GZIwtGuyTsyej3zCq2ec2eCc+8082YIgeq400vk+TVy8Ci3zF7E3S5cHfmrBStJp+WaQm33AcgV6+RmVAV0PyqH0ZOnDFfXH6PEvCUl3oYYFBdAAFAnDNDw0eaPwBDBt9SKJvSJG1WTEnx0/s2EA=
Received: from BN9PR03CA0492.namprd03.prod.outlook.com (2603:10b6:408:130::17)
 by CH2PR12MB4086.namprd12.prod.outlook.com (2603:10b6:610:7c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 22:42:57 +0000
Received: from BN1PEPF00005FFC.namprd05.prod.outlook.com
 (2603:10b6:408:130:cafe::d5) by BN9PR03CA0492.outlook.office365.com
 (2603:10b6:408:130::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.11 via Frontend Transport; Mon,
 19 Jan 2026 22:42:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00005FFC.mail.protection.outlook.com (10.167.243.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Mon, 19 Jan 2026 22:42:56 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 19 Jan
 2026 16:42:55 -0600
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <harry.wentland@amd.com>, <aurabindo.pillai@amd.com>, Alex Hung
 <alex.hung@amd.com>
Subject: [PATCH 1/2] lib/igt_kms: Increase MAX_NUM_COLOROPS
Date: Mon, 19 Jan 2026 15:42:36 -0700
Message-ID: <20260119224237.561000-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFC:EE_|CH2PR12MB4086:EE_
X-MS-Office365-Filtering-Correlation-Id: 02fcd991-a225-45ff-fa3b-08de57ac16ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PNq3GvrFz9Zy5Xj0Qdnad1npgwtXMMpcLQfyqkeLxgmeIdg/cLwI8jIa3xN3?=
 =?us-ascii?Q?6Z9/WezQO7/BkExYr6tcbNmOb16R3+LX1IDlYgZrA2VqqWB1oaJmWa+KJ/Ej?=
 =?us-ascii?Q?EA7DrcG3x+9CG0qm+FI6Ue/bIXaiegHJ+w2FumA3CjkxMteC7AfQLIDj9t8c?=
 =?us-ascii?Q?35A9UPxDo/Emsetvnfm7aeH/cDlx4UU+DV8ysIC5ss0kJOEFMids3s1acJAr?=
 =?us-ascii?Q?jll6zXUtkefArQ9WctClvli+on6904hj45eAmMKa5be5uLl9Ulm8KpL7JUgc?=
 =?us-ascii?Q?+JeDEBBEFg0BImYLtx/o89LRSYr20mmzrNCK0zIRHzTJjdQWenez/rIS4gs/?=
 =?us-ascii?Q?E9f4lBdvmg9rjeMKF05UwvB+kHEHb2nMv/BIze2Yz8ieplpSMrr8uMAcYrtI?=
 =?us-ascii?Q?p5ondrwbpEbCPF4kajC/ZqR8Lkq5lSyZaHCfp3uKSS3FwDg1ss4hQV6XrnEc?=
 =?us-ascii?Q?Wu/KVCd38hAe08bbuDoymMfY8bleiE+DT93T96hWxVmdA7g//8Yh58YkqDz1?=
 =?us-ascii?Q?Ft2vKEsfKoREydV4Ds/cjjAVRVsbRYUBqia4piXc/i6uST/wx/2X51ragdSu?=
 =?us-ascii?Q?7PJxfCvGY1A+eACPGH0asP2Wj8vBhURxkiLiRqYWzTc4WZ/okkjqLkqvjrOo?=
 =?us-ascii?Q?WA/UFWmJ+Rej1Y58JoRgTgJEDLxBRn/50Dey4TD0HB/vi00SDBG2QTHM5krI?=
 =?us-ascii?Q?6DImy9vRyah/nOjVClXnl8FZHfBA6FJJXoDgwQRpLIZAqPIHyTneyUJr3GSO?=
 =?us-ascii?Q?1CgpZcsAfGYfIkKkRSomXc0NVvTcomRws7rjjMCKnyeOfqR1wH2a6xibst2L?=
 =?us-ascii?Q?HBsoQes+KBuQzXhdeJvAOrX9drQXNgdcnZxiEsOFFHgJ8uQ36XVVFkTcAyg/?=
 =?us-ascii?Q?aMTyzROI0bncw0YXfXXhBz8Nd8fJUMK9jp2MwpKN8A2NzpXg55JTeXjJOFsr?=
 =?us-ascii?Q?k9toWf4CKa71PkKdC2YomD7FrRwZxjQgC+BTgjim7pJoNk63BOFW26Gcbnhu?=
 =?us-ascii?Q?VrpryJEVzL2+lwyd0vTMf0aqOf0b7dL0XhGcep6loFe2SBYEOZJ7T937/UuW?=
 =?us-ascii?Q?/zRV2Ruv58x9+lEvSauBPfewCmBWyST8WBtNAHlrC6QOYaqJZT8WS9dyX8OY?=
 =?us-ascii?Q?Sn1RUwmRtzFgGbll3iiARhFU5LEklcrHbWYFrNrlT9HLhy/Y0Uo7yvFAliqj?=
 =?us-ascii?Q?RxVGkGS7rWvtLoeyDTBqAgA3AVmcHcsRCcTQAZL7LtOqZT09NsVW7vYIeFRI?=
 =?us-ascii?Q?ZBs1WitdWSL75dj3GnOlOO7blX2/BmYOmmDgYKEDUAV5OaEzZ/rP3Lk/0URF?=
 =?us-ascii?Q?HhdqLZy2IfXYMPsyvNho6rPf6mNUsmbyzIImSRPyk7ZvyqOKs5jHEr0lI2wW?=
 =?us-ascii?Q?btSw9GloDpJSD28l7QwXnz8oA8jQo+49aztKRzt+ifQsv6OHNoKgZK+c7fBJ?=
 =?us-ascii?Q?OtuFvqVYxB9QYalfbgrf+kA4vhuACOiS/EKkl/bFNM03yKaxKYHYLJvkiHfE?=
 =?us-ascii?Q?1A1Q339axz/wIwR/pIxgzYSFxKTHSWIutkm0NS3vKLhAUjoDwEYmqnpWmvhZ?=
 =?us-ascii?Q?LSlnjeLTgwwHh2AfGnxMfaGXuZf3i3bF+DqKM4vy+QY1S0UMDHbkRqbvMdou?=
 =?us-ascii?Q?s6FlslahmivXedrN3a5d8N0fip8lvb6XHaM5NL+lprOMjclvlnD5RqLruY4l?=
 =?us-ascii?Q?kn6MwA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 22:42:56.1430 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02fcd991-a225-45ff-fa3b-08de57ac16ce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00005FFC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4086
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
kms_writeback from running.

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

