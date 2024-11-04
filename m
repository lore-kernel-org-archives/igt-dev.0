Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9FE0D1BDE3
	for <igt-dev@archiver.kernel.org>; Mon,  4 Nov 2024 19:06:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7133E10E3F7;
	Mon,  4 Nov 2024 19:06:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3VBOiumz";
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2073.outbound.protection.outlook.com [40.107.236.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB75910E3F7
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Nov 2024 19:06:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=awZxQPKJU2xvRrU7WaM1rQjK6qRoCnIscPX2na627QeGvJQbyi2ZvnMnYRQYE0hSwI3SUJXZe55Xnytjqs474yaCB4he90eJS4vDTzZXgSQf5RCq10sR5AGH5LZBT7dwumkmw09KFnDYsaXjIYGVDH4lBLYL+epKPvJ9I2d26tnUTRUHglct475lvZrLOaAbElHWFQwcXMAxC1syCUMo9BhXl88mvD5xU6eILumuioK2oURfz9+4juMrnMUSU3aYP9MYe8/wxNC5hRa6E56yOoJTOYpf+/9Fbsp2DNIaCnImBQpLUj5Pj51KcFS+6YrD/myeiGaBmVmJ7obuGAjOUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SVr8cpAvYPHfsqo3hcjv7tvqck1T10Lh2TUij+hqEEQ=;
 b=vtVTjm8VgiGpXtxjOvRKb/kD2AOppFw0/uDn2yKwuY3CcZHnQTrOIIbTOsdvHFCU+1xrDWiLojMpmcxeiqtoz0bc90smXD3KGE0l1l/cZQA53rMZCiDCkpcM+NT9llBRhe0qZzjjdiew9/7ZfbONKsK4EptA5fbngQUYLxaA/+7inifceGCaxSpqdT4I6H9hdieTLiYNSvq0gdjbpfalzRt0nV2RPNRPbqZcOOAe8x1y3UuyrTfn4SdFavujlQ1nVF0nSdwVYva6H+S94VM8tV6cV6oXxDtC7zv2kw90xrUtqVfS1HE8zhzTWaiHPCOd6Jmn0OosDo5osu0EZg/D7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SVr8cpAvYPHfsqo3hcjv7tvqck1T10Lh2TUij+hqEEQ=;
 b=3VBOiumzrnHyORvJmnonHloKlaCiDiFILW25/rCeUu9uYf2xwiXNIq4GEV4DN9H/+rDZYarv3OvTcZNvHh3av45wPjH18V3Gf2KZWPwTjtj0+LbrsAas92yk2T35MkWYh43pmSpg+lp5isVj9WpwKF5Tn/7zG1rlFwUlVXVhnag=
Received: from BL1PR13CA0209.namprd13.prod.outlook.com (2603:10b6:208:2be::34)
 by MN2PR12MB4224.namprd12.prod.outlook.com (2603:10b6:208:1dd::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 19:06:26 +0000
Received: from BL02EPF0001A100.namprd03.prod.outlook.com
 (2603:10b6:208:2be:cafe::ee) by BL1PR13CA0209.outlook.office365.com
 (2603:10b6:208:2be::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.16 via Frontend
 Transport; Mon, 4 Nov 2024 19:06:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A100.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Mon, 4 Nov 2024 19:06:26 +0000
Received: from MKMMARLEUNG02 (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 4 Nov
 2024 13:06:25 -0600
From: <george.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <sunpeng.li@amd.com>, <chiahsuan.chung@amd.com>, <alex.hung@amd.com>,
 George Zhang <george.zhang@amd.com>
Subject: [PATCH] tests/amdgpl/amd_abm: Fixed test to only test one output per
 pipe
Date: Mon, 4 Nov 2024 14:06:03 -0500
Message-ID: <20241104190603.134982-1-george.zhang@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A100:EE_|MN2PR12MB4224:EE_
X-MS-Office365-Filtering-Correlation-Id: 4760d7ac-446a-440c-7be3-08dcfd03c83a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tSRiwwc3Mkez5vzQ24TXzi4J9oyxDGKddhkl0PsNA74wpJPi1uan0ewXc2S4?=
 =?us-ascii?Q?FijQNY/FOfnTUhPN5T96CFwqOevP9x0dwMVdnL/5OEFYZfA4dGSVN1fZ9MFk?=
 =?us-ascii?Q?70qaxqydbyU91XPI81EyB/TNSuPR2dBYbsi0LKh5rpdPHZLwdR7jskM0ggpt?=
 =?us-ascii?Q?YFMhYgcr48x0GQDXAwArNjNsDx8h8pkw6LxtWRmuYjWnT75vE5Wu3yo2hbrV?=
 =?us-ascii?Q?6QoyQWd2MnUf0VavBd6EFGOtMgZuH7feVdFVxAHrreXcO8S1LRuxogBh/mUp?=
 =?us-ascii?Q?EEyTviuy+4gOmkBX1pVI9jURtgJHUk6o5HrXa40084MTmlshIhqS7WMMiZ5V?=
 =?us-ascii?Q?VvfsG5hVE8UbsVF1/wGK013fxsw1F5E2H8FRFSOkxflJTsq29RxLGdmnu1UX?=
 =?us-ascii?Q?mcFIs9qCtrAPW+GoFTuxoZBBYf5YpGBVxjiPZzpk58IFJjoUlryVkvq88Jo5?=
 =?us-ascii?Q?0Fk/eSBrWIfGme+Z8zBrgk66dx33EmcHOAJX7ORxd5xBDqBGFsbe8WKbDpLQ?=
 =?us-ascii?Q?zgxXCUfCkmbbbkHLgcFqKpTu94oaU7gciudEi2+NS2qQ2SfZIgOCWDo3m0LP?=
 =?us-ascii?Q?AlD3CD2UbaaRyiydi88J07+hQLgeLgCHUipBZP1JkhZbv/SUUg7rtzl3y+dH?=
 =?us-ascii?Q?kIUylQj15u21767/XKlBSX52dvdi8kc7HPzXrtH1kDVVRSrxZJexLcRTFCbV?=
 =?us-ascii?Q?J1xBw7ZH32G0GDGGKgmdZzCMZO1U4KKTj+PKOTLbBgDkBQlJXH4L0rVK0rog?=
 =?us-ascii?Q?NmN7iDe2JnwSpKZh3gaefIlJ08CTVoZ/Kq95AUvPrIQ0G/gUUIkmD8trTirf?=
 =?us-ascii?Q?qGaIMG56122bp53HeL1ceyvv/kJ1j6ntPlY6OmEhoo5SZR3UGuLePe+En/0z?=
 =?us-ascii?Q?oQUgh5s4mSIQiNZexjrmudgwWbj+X76DVB7J9ttoT1mPuxfhwCu39Z/JJf5U?=
 =?us-ascii?Q?Js3gRrzZhNJrSZJGVguSdmmJQaII9Unu8vuyKAO09DsNy6eNly1yyhLFNepq?=
 =?us-ascii?Q?620mqe1q9Bi4hw91Hk6p1OF5MqJbSHzfo/YRoCI+eUzOX2yRJPz7tCknSgQJ?=
 =?us-ascii?Q?UOqy4tCTO2fMqD3NfH54Q8dKYdv4KmuN3n/SZSFGbwRbPLG/rtW62StR/sKv?=
 =?us-ascii?Q?R4/yMvWoYu9PY72rlwK3B3F4+BeXYoIbdsK4MEuuR1/IrLihZ4E8u1ydSzxK?=
 =?us-ascii?Q?w6fSNx/A2IOqfbywdAuq5xjd66Sv/798z5/oPmqXYMzdo5Mv5Z0PfiR2xABY?=
 =?us-ascii?Q?HgFuTDJw09RRxgOnq33r28gg+y28j7z/L4XERZUJdczUI+/Lk5LrG6JKdwNC?=
 =?us-ascii?Q?Fr+JAJjiczm470vUFuCYv7xlA5nTUqntgpQ2yPdV0JiXnI5McQ274C4u9z+t?=
 =?us-ascii?Q?+KuMDjZ+rUna/G1sFT9Z1uIwQjaBQ6yL6n9WZXOGSvls+L/kKg=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 19:06:26.4054 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4760d7ac-446a-440c-7be3-08dcfd03c83a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A100.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4224
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

From: George Zhang <george.zhang@amd.com>

This test only needs to run on one output per pipe, instead of all
pipes. Additionally, fixed the test not changing the abm level.

Change-Id: I401f0592d31db89b8ec1691e10ee041ca6e39e0a
---
 tests/amdgpu/amd_abm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
index a85f444c4..07d1520d1 100644
--- a/tests/amdgpu/amd_abm.c
+++ b/tests/amdgpu/amd_abm.c
@@ -291,7 +291,7 @@ static void backlight_monotonic_abm(data_t *data)
 	enum pipe pipe;
 	igt_output_t *output;
 
-	for_each_pipe_with_valid_output(&data->display, pipe, output) {
+	for_each_valid_output_on_pipe(&data->display, pipe, output) {
 		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
 			continue;
 		ret = backlight_read_max_brightness(&max_brightness);
@@ -299,7 +299,7 @@ static void backlight_monotonic_abm(data_t *data)
 
 		brightness_step = max_brightness / 10;
 		for (i = 1; i < 5; i++) {
-			set_abm_level(data, output, 0);
+			set_abm_level(data, output, i);
 			backlight_write_brightness(max_brightness);
 			usleep(100000);
 			prev_pwm = read_target_backlight_pwm(data->drm_fd, output->name);
-- 
2.34.1

