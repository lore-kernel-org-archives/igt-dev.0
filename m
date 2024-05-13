Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B985C25B10
	for <igt-dev@archiver.kernel.org>; Mon, 13 May 2024 13:58:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11BD610E7A9;
	Mon, 13 May 2024 13:58:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="thBVjV/E";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2056.outbound.protection.outlook.com [40.107.93.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 850B510E7A9
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2024 13:58:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dzel3pftBSc/jeXavQBJPLkU5Z9bb6loWZsNEHdxQskoTIwFNan3onKhFAMPEUgJGSZZSX7sKr3m4vNZca2Dcm9mcaMn5/mxLxxePDbFY/gK6vwhiODO0d2/Br+/DE1ETS02Ek9b/PR6npnKao+IMZYHtmtvf6A8peRE/aYIRxfp2oO7UJJekYZva2cSXycvLBpbJWtotT3KHl3rQVjNvB4vq9QXyb0JiJGTt0TDYkrdiLhBjFLXzTX4qXqMEDZpxnLcGeJ8b0AacChHpJTffhaCMd8Yeoa5uCaREB6JOAhTRYC4VsLdREZOt5CU5i0/OxmmemB3o5vIUNPgh0h6PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EuuUsC4dE+ABS4PCSRevl3obPU1R1dk9wZXHXfJKh6A=;
 b=FXAOh0QkUedPhEbNS+MNAwMQl2tp1NMEPz7XD6Jjr3XLc65Cg4Tf2jtyLnpUqpWoPJImntZs/WvHHkN24fnvVsFkw9qBBf2C37Xjq3qs9wciQRrvgbSk/Tt45OdYU1XZxr1soeEgsl+VB5Gq2MB6xvTCw5g4Auor47GAL6WgLT2zUfehtAarTDDYXwC788Ad6IP5kavz4GOYR2Tkni6eBmU6clA+Uzc0WJOiIM6H6geai3iPZnJfFqd8Fx/yED8blNdZQP+MrIdl6+kY4o5CQYg9MBkYKf/kbcZHIvbrbFAtcw5tafIpZhyI/E3Bm/P2C2u4YZ4rt8mfKv2B1PcwtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EuuUsC4dE+ABS4PCSRevl3obPU1R1dk9wZXHXfJKh6A=;
 b=thBVjV/EliB2qpazKU1x4Uu0hlFUrvmZ4HrxHPNONJrnlkzvwFSOAnaw+kuQGhYdRgPoOFcGVVXzonJFWS8eSrEbqmZHH8GuIUpocjS5FGCf4CnHz3jcSPUbHfw3rsrSgX5FWIJBPL+5At4EQMLYCZtiokHhyZvS0mjzDwyjNr0=
Received: from BYAPR05CA0069.namprd05.prod.outlook.com (2603:10b6:a03:74::46)
 by DS0PR12MB7948.namprd12.prod.outlook.com (2603:10b6:8:152::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 13:58:01 +0000
Received: from SJ1PEPF00001CE3.namprd05.prod.outlook.com
 (2603:10b6:a03:74:cafe::db) by BYAPR05CA0069.outlook.office365.com
 (2603:10b6:a03:74::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.22 via Frontend
 Transport; Mon, 13 May 2024 13:58:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE3.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Mon, 13 May 2024 13:58:00 +0000
Received: from sathish-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 08:57:58 -0500
From: Sathishkumar S <sathishkumar.sundararaju@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sathishkumar S <sathishkumar.sundararaju@amd.com>, Leo Liu
 <leo.liu@amd.com>
Subject: [PATCH i-g-t 2/2] tests/amdgpu: use 64x64 jpeg bitstream
Date: Mon, 13 May 2024 19:27:05 +0530
Message-ID: <20240513135705.2399645-2-sathishkumar.sundararaju@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240513135705.2399645-1-sathishkumar.sundararaju@amd.com>
References: <20240513135705.2399645-1-sathishkumar.sundararaju@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE3:EE_|DS0PR12MB7948:EE_
X-MS-Office365-Filtering-Correlation-Id: cb348b34-0350-44b7-c0ad-08dc7354b3d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|82310400017|376005|1800799015|36860700004; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cVZUd2xDRHFpQmdYRWZPQ1NOaFp4T0JBUFhkZURpZ0dxTzFPUEdyKzBzQ0FK?=
 =?utf-8?B?WGc2QzFXOWErbXVrNlNrREJmeGo3NXhpeXNSOWFnV0tYV0o4cmZ4VFc0Z1pQ?=
 =?utf-8?B?WVpTeFlMaUtlY0ZDUzcrMnNZUHo3d0FaZXNSRzJoaFphVEY5QmFYcHhjVFBj?=
 =?utf-8?B?T29NRlNpMmVqdUpZbzJiczZ5Q2E3UG5rK3JUMG94MHhISUdYeVhJZldycm9B?=
 =?utf-8?B?YVFQdmo4dHJxT3VvTytxYVRXenZPd09WRCtxcEVJeCtUcjZVZmt5MmZYNnEz?=
 =?utf-8?B?aUFRdEFST2lzMHRNZVJIckQ4TkJxZkVGMlJabEsyaE1kVkxobEdqeXNQZUZD?=
 =?utf-8?B?UHRVKzZibS9TYVRPR0ZseVZZRG55WDJDK0VMYlJBbXVMcWlRWTNmY2F1bmx1?=
 =?utf-8?B?RCtPaE51SG9XZlpiV0FlNHRoSDU5Z1FyWnkwUThVYTB1b0pOVjFQZEQ5Y29Q?=
 =?utf-8?B?eHRvTHpxeDdBWTJHN0VoWStGbkhzTDBIY2hpY1dBME5oM1JSd00rVGNuZ2s1?=
 =?utf-8?B?MnFqUmVZM3V2L2FEd1IvQmhqSUk5SnoyejZ6VHg1WFo4OFNDQ0xOSGtjT1Jr?=
 =?utf-8?B?MkNBWDF4bjIzQWZRUVd6eVg2TSsrSzBVSHpHL01JYjlFODRXa1ZNVUtTVDRv?=
 =?utf-8?B?bGhzNFlpenlEUW1jNHF2THgyZzJpRnpkY1RibWdLWittZDg0NW1nRVRKNC84?=
 =?utf-8?B?YldTcDd2R3ljNnpSTGFTaDUvYXVQZWkvTlhiQlFrbTVoU0pQR2MzcWZWTW9s?=
 =?utf-8?B?MmlLdUpzQWdaRlJtbVFxMzJhK01UUTZKYmNadjJFY2RmKzJoSnM3a0NzbVhL?=
 =?utf-8?B?M0RRbWR0UnZTR1BjUDRVa2plWWNHRDcxMW5oeXdnYTVteTN2QS9NSUNnK2Q4?=
 =?utf-8?B?WEIzWFNlUDNvcDdEcUZnU21lWEJxS2JSRHUwQkpqWlVKbjd6T2pmdTBQb0RW?=
 =?utf-8?B?Z1dlTEJEa1JmYzhUUDFtVFJlM1U5UjlJN0FuMWJFZnNMcWo2Vzh3L0pJakYz?=
 =?utf-8?B?QzU1MG12NUhyb1pwby9GSEFVS0p5Y0FQUXhIaGNqTjRDVFZjV3BKOWdhYTNh?=
 =?utf-8?B?TUpVMUZMTW9Nd2ZYeTYvY2ExcjJuT1FlOHo4S2ppdlk5Qm1TV25UK2wwV0Nv?=
 =?utf-8?B?dk5CZkR5N09vdXVodW5oR2kzZ3pTZkk3WFJzWVhSa3BhY1JqZXlEUjVYVTlS?=
 =?utf-8?B?SnUyTHhiS0VpT2szbUJiaHVCSjdmaWJlNG5Ha3J3T0FHN2VtdkZhb0xUWDJx?=
 =?utf-8?B?Y0ExTUhFQXZoditlZEdHcFNaRXJQQjZzaDZ3SGVRbEowUW5BblpzMEM5Rm5O?=
 =?utf-8?B?ejlRdzZ1QTUyaVErcWlzU3hWQUZjN21SSlF4N29FdW80ZklkaURsQ3ppck5M?=
 =?utf-8?B?eEFqU3llQ2R4cllLQmNmYXBiZEhrbHN3dnNIakRabGJOYXhzcjU1TjZqMW1W?=
 =?utf-8?B?WHU4VCtvWG5ZNG9WaTErSGtvREVuOWNwOWZPMk16YUZhNG12eVdXR0J2ZWpL?=
 =?utf-8?B?ZDhxSkFXWWhteGpNb2xwQmphczJJWlVZYUZRM3d1RmtHQ1VMY1JDTnljK3ll?=
 =?utf-8?B?OWpTMXZ6YWRoZWt4NnpmU0V3VG1kZW5NRWNOcWkxUlVxUEZuN1E0TTMvZWs3?=
 =?utf-8?B?djZlQkhWMW9zZCtMdmt1M1crOUF0aG1vcDdVTVZFcnNDUnFYMVdva1I0WVdx?=
 =?utf-8?B?WjRnNFpCN1FGVE0vbEdqT1R4Wk9WZzNTTVY4b3Fud0h3Y3orenEySE0yNTE1?=
 =?utf-8?B?dUZQcmEwK3AzMTNkeUMrUHZ4Q1VlbkZXYURSd3lQZElFeW5zMjE1V0w4NFJG?=
 =?utf-8?B?V1hLY0hlZkRtOTYvbXJqN2FzUFFrT1dnY1lnRTQrSmQyU21VV2pmMHYyaDBq?=
 =?utf-8?Q?G32X8CfxwoXg3?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400017)(376005)(1800799015)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 13:58:00.9898 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb348b34-0350-44b7-c0ad-08dc7354b3d2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7948
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

height to be aligned to mcu boundary on chroma plane as well.
tested on jpeg_1, jpeg_2, jpeg_3, jpeg_4_0_5, jpeg_4_0_3

Signed-off-by: Sathishkumar S <sathishkumar.sundararaju@amd.com>
Acked-by: Leo Liu <leo.liu@amd.com>
---
 lib/amdgpu/amd_mmd_decode_messages.h | 51 +++++++++++++++-------------
 tests/amdgpu/amd_jpeg_dec.c          | 31 +++++++++--------
 2 files changed, 43 insertions(+), 39 deletions(-)

diff --git a/lib/amdgpu/amd_mmd_decode_messages.h b/lib/amdgpu/amd_mmd_decode_messages.h
index 22f223aaf733..20428d98549f 100644
--- a/lib/amdgpu/amd_mmd_decode_messages.h
+++ b/lib/amdgpu/amd_mmd_decode_messages.h
@@ -833,30 +833,33 @@ static const uint8_t feedback_msg[] = {
 };
 
 static const uint8_t jpeg_bitstream[] = {
-	0xFF, 0xD8, 0xFF, 0xDB, 0x01, 0x06, 0x00, 0x08, 0x04, 0x04, 0x04, 0x04, 0x04, 0x05, 0x05, 0x05,
-	0x05, 0x05, 0x05, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06,
-	0x07, 0x07, 0x07, 0x08, 0x08, 0x08, 0x07, 0x07, 0x07, 0x06, 0x06, 0x07, 0x07, 0x08, 0x08, 0x08,
-	0x08, 0x09, 0x09, 0x09, 0x08, 0x08, 0x08, 0x08, 0x09, 0x09, 0x0A, 0x0A, 0x0A, 0x0C, 0x0C, 0x0B,
-	0x0B, 0x0E, 0x0E, 0x0E, 0x11, 0x11, 0x14, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xC4, 0x00, 0x4B, 0x00, 0x01,
-	0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-	0x08, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-	0x00, 0x00, 0x00, 0x10, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-	0x00, 0x00, 0x00, 0x00, 0x00, 0x11, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xC0, 0x00, 0x11, 0x08, 0x00, 0x08, 0x00, 0x08,
-	0x03, 0x00, 0x22, 0x00, 0x01, 0x11, 0x00, 0x02, 0x11, 0x00, 0xFF, 0xDA, 0x00, 0x0C, 0x03, 0x00,
-	0x00, 0x01, 0x11, 0x02, 0x11, 0x00, 0x3F, 0x00, 0x9F, 0xC0, 0x07, 0xFF, 0xD9, 0xFF, 0xD9,
+	0xFF,0xD8,0xFF,0xDB,0x01,0x06,0x00,0x08,0x04,0x04,0x04,0x04,0x04,0x05,0x05,0x05,
+	0x05,0x05,0x05,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,
+	0x07,0x07,0x07,0x08,0x08,0x08,0x07,0x07,0x07,0x06,0x06,0x07,0x07,0x08,0x08,0x08,
+	0x08,0x09,0x09,0x09,0x08,0x08,0x08,0x08,0x09,0x09,0x0A,0x0A,0x0A,0x0C,0x0C,0x0B,
+	0x0B,0x0E,0x0E,0x0E,0x11,0x11,0x14,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
+	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
+	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
+	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
+	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x02,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
+	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
+	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
+	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
+	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x00,0x00,0x00,
+	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
+	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
+	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
+	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xFF,0xC4,0x00,0x4B,0x00,0x01,
+	0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
+	0x08,0x01,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
+	0x00,0x00,0x00,0x10,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
+	0x00,0x00,0x00,0x00,0x00,0x11,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
+	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xFF,0xC0,0x00,0x11,0x08,0x00,0x40,0x00,0x40,
+	0x03,0x00,0x22,0x00,0x01,0x11,0x00,0x02,0x11,0x00,0xFF,0xDA,0x00,0x0C,0x03,0x00,
+	0x00,0x01,0x11,0x02,0x11,0x00,0x3F,0x00,0x9F,0xC0,0x00,0x00,0x00,0x00,0x00,0x00,
+	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
+	0x00,0x7F,0xFF,0xD9,0xFF,0xD9,
 };
 
+
 #endif /* _AMD_MMD_DECODE_MESSAGES_H_ */
diff --git a/tests/amdgpu/amd_jpeg_dec.c b/tests/amdgpu/amd_jpeg_dec.c
index 12f5bfcff556..8fcc471b8a88 100644
--- a/tests/amdgpu/amd_jpeg_dec.c
+++ b/tests/amdgpu/amd_jpeg_dec.c
@@ -113,13 +113,14 @@ static uint32_t jpeg_chroma_base0_0;
 #define TYPE0				0
 #define TYPE1				1
 #define TYPE3				3
-#define JPEG_DEC_DT_PITCH		0x100
-#define JPEG_DEC_BSD_SIZE		0x180
-#define JPEG_DEC_LUMA_OFFSET		0
-#define JPEG_DEC_CHROMA_OFFSET		0x1000
-#define JPEG_DEC_SUM			4096
-#define IB_SIZE				4096
-#define MAX_RESOURCES			16
+#define JPEG_DEC_DT_PITCH       0x100
+#define WIDTH                   64
+#define JPEG_DEC_BSD_SIZE       0x200
+#define JPEG_DEC_LUMA_OFFSET    0
+#define JPEG_DEC_CHROMA_OFFSET  0x4000
+#define JPEG_DEC_SUM            262144
+#define IB_SIZE                 4096
+#define MAX_RESOURCES           16
 
 static bool
 is_jpeg_tests_enable(amdgpu_device_handle device_handle,
@@ -472,7 +473,7 @@ amdgpu_cs_jpeg_decode(amdgpu_device_handle device_handle,
 	int sum = 0, i, j;
 	uint32_t idx;
 
-	size = 16 * 1024; /* 8K bitstream + 8K output */
+	size = 32 * 1024; /* 8K bitstream + 24K output */
 
 	context->num_resources = 0;
 	alloc_resource(device_handle, &dec_buf, size, AMDGPU_GEM_DOMAIN_VRAM);
@@ -486,10 +487,10 @@ amdgpu_cs_jpeg_decode(amdgpu_device_handle device_handle,
 
 	if (context->jpeg_direct_reg == true) {
 		send_cmd_bitstream_direct(context, dec_buf.addr, &idx);
-		send_cmd_target_direct(context, dec_buf.addr + (size / 2), &idx);
+		send_cmd_target_direct(context, dec_buf.addr + (size / 4), &idx);
 	} else {
 		send_cmd_bitstream(context, dec_buf.addr, &idx);
-		send_cmd_target(context, dec_buf.addr + (size / 2), &idx);
+		send_cmd_target(context, dec_buf.addr + (size / 4), &idx);
 	}
 
 	amdgpu_bo_cpu_unmap(dec_buf.handle);
@@ -499,14 +500,14 @@ amdgpu_cs_jpeg_decode(amdgpu_device_handle device_handle,
 	r = amdgpu_bo_cpu_map(dec_buf.handle, (void **)&dec_buf.ptr);
 	igt_assert_eq(r, 0);
 
-	dec = dec_buf.ptr + (size / 2);
+	dec = dec_buf.ptr + (size / 4);
 
 	/* calculate result checksum */
-	for (i = 0; i < 8; i++)
-		for (j = 0; j < 8; j++)
+	for (i = 0; i < WIDTH; i++)
+		for (j = 0; j < WIDTH; j++)
 			sum += *((dec + JPEG_DEC_LUMA_OFFSET + i * JPEG_DEC_DT_PITCH) + j);
-	for (i = 0; i < 4; i++)
-		for (j = 0; j < 8; j++)
+	for (i = 0; i < (WIDTH/2); i++)
+		for (j = 0; j < WIDTH; j++)
 			sum += *((dec + JPEG_DEC_CHROMA_OFFSET + i * JPEG_DEC_DT_PITCH) + j);
 
 	amdgpu_bo_cpu_unmap(dec_buf.handle);
-- 
2.25.1

