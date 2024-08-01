Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F7E1C3DA4A
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 08:26:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E83010E6D6;
	Thu,  1 Aug 2024 08:26:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1B/eQusQ";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2052.outbound.protection.outlook.com [40.107.93.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0D1810E6D6
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 08:26:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W/ET8SZT7EmSelZEr/V7ajnnIUu7enSNZQvWpVivu+HdIU0A3wgZB4dl9l+zIIotDRuPl99/SOKzqcjJxJ4wNdUc71Db3TYRkS//34y4K1yPhJZtltomzY8IC9MRFZnMwos7j3OZ7y1nj+wqhRvg1NI88z1NYmF+QPALiokHCWIHvEdInU9C0ANIyd+uYf7goul3H08+TT4o7+Yuki7nvPybQ6A1j6kIjiCZs6KkghOdQqVRV4f8kHYQckRhleDJvW/axFih6MjautMyZJ2vGSMYyYVYcrYcPz31jssodEE7zt6dZnSfUTNu58zOYaEeGVB+GFMhuS/JHVOSds9oWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j8xXpJZNQftGnEm0PF3ynLIaN6Wh3DwIRifbrVCTFt0=;
 b=HizX5hriZsi9wKXAPzG/LooihOkJfD6lFIcRq7woQP0eOnlx2Y0XstbbkAUpiV4PTtXHLLQbdxAf4Mxa4r0GmF9w5REc+s5tH7WGLMisdetkzNN0u98e9Shq9G+VWcySlt6Qw9i5CJlnqfWAmllEb1WmaJIx6LG/wfExRe9RvXjVOz8pLXE3+XJ3FrMVZBDA6zjlP3EQs/KgOX6uLzNqvrMITp6tnOxnWxcQopfggqXzujOHcUxRSmBpUpgfeCYBOtQPgT13OdK2GbjqpQ39YH5RHiYrJ/Pj2u235sDZDNxMpIjwqTQuQ7545WoaNIpmvxL2AGM8a915kB089aC4HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j8xXpJZNQftGnEm0PF3ynLIaN6Wh3DwIRifbrVCTFt0=;
 b=1B/eQusQjqm2vFcrGJs3mMc1SACfC8raZ5cB0nRifZ7lwVw//YyIxAOCa7emhtiFV+vYvzKYkcWoMCfzcy6MY99Pe5BC6/+mCQH6g210kWOHYWnGKylFfd559bF5ESSj5KTaD2PSTNmdp2EL/E/2c6Vm+SoxaNaXTpOn8d2uMBU=
Received: from CH0PR07CA0021.namprd07.prod.outlook.com (2603:10b6:610:32::26)
 by SN7PR12MB8025.namprd12.prod.outlook.com (2603:10b6:806:340::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.32; Thu, 1 Aug
 2024 08:26:00 +0000
Received: from CH1PEPF0000AD7F.namprd04.prod.outlook.com
 (2603:10b6:610:32:cafe::c2) by CH0PR07CA0021.outlook.office365.com
 (2603:10b6:610:32::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22 via Frontend
 Transport; Thu, 1 Aug 2024 08:26:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7F.mail.protection.outlook.com (10.167.244.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 08:26:00 +0000
Received: from prike-code-pc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 03:25:58 -0500
From: Prike Liang <Prike.Liang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <Vitaly.Prosyak@amd.com>, <Alexander.Deucher@amd.com>, Prike Liang
 <Prike.Liang@amd.com>
Subject: [PATCH] tests/amdgpu: update bad length case
Date: Thu, 1 Aug 2024 16:25:48 +0800
Message-ID: <20240801082548.2496123-1-Prike.Liang@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7F:EE_|SN7PR12MB8025:EE_
X-MS-Office365-Filtering-Correlation-Id: 62b0b55c-12df-4366-09b4-08dcb2039319
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KWDh/Js922ZXr5O1rYc1Y4exWCZ7xIG/mJKcnUOn6E3dboWdF3yUv1CEBQ5F?=
 =?us-ascii?Q?XsSeM9/9+QT3zNSrdKL8qVQ6hQ8wsdcAuGm7ZQWnNuN6KWK//QGEamnKDN4x?=
 =?us-ascii?Q?aV5AGo9xr9GHpnZsrVdA1ncaqsluDGofpBp4ONWcHwydIbnCX+QW3JEKQ9xm?=
 =?us-ascii?Q?rve6OfgHgdN0Ovrz18lHY53sT899frr/B56u+GH5liAmcDbq/yxdYIyZfzc5?=
 =?us-ascii?Q?D1zkffvtxN4F9bH+GevI5do382qNXhqqyW3xXOX/5no+ZQmKdan8pDo3yCM1?=
 =?us-ascii?Q?0AsHAU20aQwLok+0oAou+LiL+IacKEMVNiVIUTk61hAm52ejeGRVQQvl/C8j?=
 =?us-ascii?Q?X3WH92S8DCRXllIKQuPvXMwn4NKkVueWK4UGzWrvq7tf/fj0Y9J1vfekiP4u?=
 =?us-ascii?Q?obHnIDjNvGQQmY64SjU1T44uocUtyld4uPJPyyKdHZNxMTsSFGY5uAUAqAaz?=
 =?us-ascii?Q?mSCWXp6NkQ5HgvoED01I7tdAIeRejzytgdz/zc2t9H+P92N0yZNjTYU1Vu0L?=
 =?us-ascii?Q?K0cLdKZwek/gW0GGpiUDrqzzEKurOf4ZbqP1CT+EI73dEW5VFUgqyO3Hb1F/?=
 =?us-ascii?Q?7drK4NvAkrSxBet6Rc7rdCIMUawku/LljxPDKXjLJVQQsNVussP8AizLbc7T?=
 =?us-ascii?Q?TApqPos351yQse4ItE+GV5cplZRsR0N0zU4BiZVdUc1or2H5twSt6ibR+sF2?=
 =?us-ascii?Q?Kg6VPrnUn610fY6d49OYuPW/wsJTAzUQxq3Zr5YM/ovoBDOQHDn4GqVeBz6w?=
 =?us-ascii?Q?Datz2Zd5xqTLuwvChAt7Ztx57cxsu4DKdMs8ieSI8339ScTLURrKekQnAYXf?=
 =?us-ascii?Q?5F4qoflDGIiqyEWF/4RAPJJ31uHliG9IZgWvgMHqQiyv4R7CELQVvieSJ6jc?=
 =?us-ascii?Q?alao+JhYofPHik/Sz++MtSxQbsZvwp8KglvvxqD0c+YkrRb/uVoDpW/6yNIi?=
 =?us-ascii?Q?UQv+Fqxw7mor3Q6MNptJKxvLwiDJF3wHEaG/FKRfpDbNuC3snNr5xHZ6zfDL?=
 =?us-ascii?Q?dW8TULT0XVqjgXzB85C+MgbGQ/SIfDneqxCSlh3fOOL/IY1hbHCJZG3xJFrT?=
 =?us-ascii?Q?zIqOZyG3m0AGDCzeEUemziMaaijgEBLPZjm0Ny3B20rVcbBUN/6AqCSBgili?=
 =?us-ascii?Q?3ou3WdJ/CzB36AKK0oHQ5sagJxTCbU1Ad745VlGLW+bagzdaB+GSNXRpzezi?=
 =?us-ascii?Q?v9rNYmXFIPxwmIDwk1jSds1CkZLSkA9oEz2LGkhUA+hUTVz8QXizjR3iViqZ?=
 =?us-ascii?Q?2PBfbaz8tGDOoJq6psl9lEh/OpNkrNOxm8zoX0GloXfU926t+mzjrRmoG7sI?=
 =?us-ascii?Q?s7ZstHe06BPnEJpSt9KXkZsSl81vPy0ldKlTd/UPGCgvodOMYGT9AqlTNpXD?=
 =?us-ascii?Q?yLBDWFUCgacDjxv7w+PAkzOpE+XWxCzF6OEJqqws4CTLpxJwUeRMiCYF/+Xu?=
 =?us-ascii?Q?W9mwewOu4CX7qwNp/qy6sKZzaDCwUR1y?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 08:26:00.0430 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62b0b55c-12df-4366-09b4-08dcb2039319
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8025
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

In the bad length case, when the header length is bigger than packet
stream length then CPFW will pending on the stream data and raise a
CP halt error which requires do the pipe reset. As to the orignal case
of header length is smaller than PM4 stream length then the PM4 stream
data may will create a bad opcode error which only requires the queue
reset. So for testing the pipe reset need to update the header length
bigger than the PM4 stream data length.

Signed-off-by: Prike Liang <Prike.Liang@amd.com>
---
 lib/amdgpu/amd_ip_blocks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index f675b97dd..edfd16e76 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -201,7 +201,7 @@ gfx_ring_bad_write_linear(const struct amdgpu_ip_funcs *func,
 	if (cmd_error == CMD_STREAM_EXEC_INVALID_OPCODE)
 		ring_context->pm4[i++] = PACKET3(0xf2, 2 +  ring_context->write_length);
 	else if (cmd_error == CMD_STREAM_EXEC_INVALID_PACKET_LENGTH)
-		ring_context->pm4[i++] = PACKET3(PACKET3_WRITE_DATA, (ring_context->write_length - 2));
+		ring_context->pm4[i++] = PACKET3(PACKET3_WRITE_DATA, (ring_context->write_length + 4));
 	else
 		ring_context->pm4[i++] = PACKET3(PACKET3_WRITE_DATA, 2 +  ring_context->write_length);
 
-- 
2.34.1

