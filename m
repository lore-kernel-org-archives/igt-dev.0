Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F12EC369C2
	for <igt-dev@archiver.kernel.org>; Tue, 22 Apr 2025 23:57:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20DD810E3D1;
	Tue, 22 Apr 2025 23:57:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="iNnQdN0z";
	dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2043.outbound.protection.outlook.com [40.107.100.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B408310E3D6
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Apr 2025 23:57:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hVaZHa13YIg1VVtSNJ4m64yUEDtlVy29grZ0rxMMRTulxYAkWpY9dXYELpdT0J6MznQSQ7avN5k4XLnONOU5cnDt9fVBMaRTvqKSu92bBG5hK7RJZY1oAIviEwjtlUUVMr8qByk0Efe87Hd4QTrfcbrCU1J9FJtGxfr8XT5xnH1q88wesYt553k+3pAVMUsdzc5ZZ6NEg9C+ORmefM66UPbfLroCxGcnDBzYUfPMVb9nPH2yVgNHnDhwr6B7Rwt9zHUoCEiSlcdlYzHmBia1GwBXY8qf5wuQdQVk+v7UYYPIh4UrcRQlABRqhxDbxERmnWWDU59V6BUDqBLJfomQgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qsAHMcoS74DXDA39yJh+0L6L94H9RoYUI1yrxFvJdFg=;
 b=JmEPVFhgwddpzSdrDYo4/VE1C9PxzcaRu4P7jH+ArF0KEzid0Y3C9ArM3u8FR2hmZFOWl09DiX7ExAJpM8MvIScZ3WGhQwyuSEW/orY9cMIN2tJhNoCzCej0LC8OFGGlSU0KdRFMFty2vAS+3EsAFmIcEJxPuZ7i3zjLUAk4jjO5Ua9TWKGMN0v2tnR6YGyH7L6MVt8f2ICx/F2uubAO5GW+LG3aQ/T71TZLjZkohSoVWDGGkwKDvErBJ5s7MmFGep/z1l22YMHJP8npG/rSPIHuK3fZ715DhoIuFkKTI8c26QFKmG8d047ayTfhDfNpYNt6egEygOb8+G3fuLSiVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qsAHMcoS74DXDA39yJh+0L6L94H9RoYUI1yrxFvJdFg=;
 b=iNnQdN0zIRTk3FC/5Je/5+UQqyg1YbhFpEMKvrFuxJ8crguE0gYjn+hEMjRLvg4EhTw0XgzijX+ob99Lqm9MvOWB9zqyT51+LgVj1fm2vlt0pggur0HS431Ow7CxhYss2W5crwdFnEBfBb+81Og1YrdbkENlj11VD+CaV+9GImI=
Received: from BYAPR02CA0028.namprd02.prod.outlook.com (2603:10b6:a02:ee::41)
 by IA1PR12MB6652.namprd12.prod.outlook.com (2603:10b6:208:38a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.34; Tue, 22 Apr
 2025 23:57:45 +0000
Received: from SJ1PEPF00002313.namprd03.prod.outlook.com
 (2603:10b6:a02:ee:cafe::c9) by BYAPR02CA0028.outlook.office365.com
 (2603:10b6:a02:ee::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Tue,
 22 Apr 2025 23:57:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00002313.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Tue, 22 Apr 2025 23:57:44 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Apr
 2025 18:57:44 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Apr
 2025 18:57:43 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 22 Apr 2025 18:57:43 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH] lib/amdgpu: fix potential issue with bitwise AND operation
Date: Tue, 22 Apr 2025 19:57:39 -0400
Message-ID: <20250422235740.131691-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: vitaly.prosyak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002313:EE_|IA1PR12MB6652:EE_
X-MS-Office365-Filtering-Correlation-Id: c163842a-7d6e-415e-cf43-08dd81f979f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cUp3Y2IwUVRoY05DallscE9td2RDSGZvRmhHM01KSmVLZFBHdVErNHE2S1hK?=
 =?utf-8?B?cUlmMThVS2diS3BsWTZlV3pEVC9BOHU1THdQem5qQnJqdjRUSlo1aDE4V1RR?=
 =?utf-8?B?V2FEaGZnd3o0STIwaEYwTjVSUkI0T3BhcFFYU0F1WFoyRkJKTjFEcVhIS0hB?=
 =?utf-8?B?RHNjcHB4M1BjaXFoRkNhZUhsNmVmUmZTTlVuTi9yT2JmTDIwSVZERzRvZ0xp?=
 =?utf-8?B?WWg1MlhQVjBGc2tRQmQ5dTh1UkgweWc2eWN1WE1JLzdCcTNLMW5SNzhyaUcy?=
 =?utf-8?B?WFd0aVZLWDlHeW1GODh0VzRvWVVsNUVKTFNaZ1ltUkNLWjJsSGhEeXdsdTFO?=
 =?utf-8?B?ZW12VG5EbTdyWXdSdmdac1ZPZlhKYjJXbnJCRXJrL0s4bHhzS3FpVlNQRDY3?=
 =?utf-8?B?OTRxaHZ6MCsrNWZZSkZOT2VLY2Z0TUJLdmEwZkxJbFBsRFh1QkJnQ2UvZFM1?=
 =?utf-8?B?VWU2L01FVFcvclVuNUpHNko5Zzh2bmR2dzRKVVR1QWZrbUsxL05SQnk3V29z?=
 =?utf-8?B?Rk9HMHE2SXlhKzIrbnNvdkRxUFVtbWpidDUwUGpoclRGcUJZMmpteFJqV0dl?=
 =?utf-8?B?UUV4S0FqT2lMajhhQStxL3dFOUhyRnhMYlZEZ1pSUlRaMHhBVzluLytSODRO?=
 =?utf-8?B?WjZwU3EyWjgrb0QySVpyQ09hT0JOM05EVkxyQ1VnbWZMaFAraG11OG1Md1VT?=
 =?utf-8?B?VTZwZXF4YlpmVmtaRDB6KzBaOHZoNUg2ZlVlM1pJTXRxWFpWZmQ1Y2J4Zlgz?=
 =?utf-8?B?ejFiaWVJUUx4YWZ1N2RHcGNXUWdvZVVRSlNkc0lVQjkzckFEMmlyUGszVURF?=
 =?utf-8?B?OFFaNWVGY1FjM05ndmdSVThLQ0VWVVo0YlByNE0rZzZoSmlpcE9nb1hsRU9h?=
 =?utf-8?B?ZDMrdmRDV3ltc0VmLzMrYWNsRkd6V3hnb05lWWwyMlBqSUVIbHhYYWJaM1hU?=
 =?utf-8?B?aHkxRHI4bjFVYnI5UURzQVQycEViemJpOTh2UVlEbWUybVlDcFE4L0R6WDJ1?=
 =?utf-8?B?aXJJelBBRVNyTFRzMmhYb2tsWWdmQTZ4ak95UTQvQXV3REU0eUpNcDhLN1Vt?=
 =?utf-8?B?dFRyS085TG9YOEZYVy9nV1VVR3hBZmNSYVdMb2xReHo3Nnk5NkxJOGRveEla?=
 =?utf-8?B?NXpnK01QWEl6aFQ4QkNFNFdRSnpER2ZDTlhMYnhTOGo0azN1bUpsL2dNakRO?=
 =?utf-8?B?TjlxZXRrYlRsajU2bnZqd1R5cFdZKzljSXIwTEw1OTQyVjZ6ZGxsSlY5NWJa?=
 =?utf-8?B?Z3MweC82L3l5UU9XQjd1cnNudHBRSm9pVSsyZUVaM1JESmI2R2loUkdWajhs?=
 =?utf-8?B?S3dMeUx6bmdMTENGS25FdUVqaHovYS9XdVJ2STlmZHZEOFNHM0liNERINnF3?=
 =?utf-8?B?ajd3dFFZVmNvMllNWTl5ZVpJVmNWcXhML0lQUzdISlRmcVp2eUVXZGYxeFNT?=
 =?utf-8?B?ZDRxS3M5cXlVS3JiaVlKeFNZUEZtcWljN25Wdk9rbGcwKys1NGpFK09iL0k5?=
 =?utf-8?B?MlUySHRZVjJub0pVK2YrdlZJUDhjQ0NFQjBoWGtuODFlS3d0ZzIrV29VVGlO?=
 =?utf-8?B?QXBQeUZZaEZxNnBzY0FxY0p1TXE3Rlg3dmYrUVVFSXZSOStuMS91bTliTVBr?=
 =?utf-8?B?RFM5M1hXQ0JuVVo2T1VmRUNaVFVTVzNlRWxYUWxERW14RHpOUi9MZUNGTEJC?=
 =?utf-8?B?bVRla29xSzM4UEppZGlOT0pZMHNKYkVVK2tNeDd6YXdESWZYcUlheU1TVDFU?=
 =?utf-8?B?dGlOdzExb0JSelV4S3YzU25rM1RhRDF1bXpsKzJxV0x1ckNuZmF0dG42OGU5?=
 =?utf-8?B?NlpncXZjQWpzbmIvL09tWVZzMnZuNFBsdUJRVDNrLytTR0hPdVdOOUladVFl?=
 =?utf-8?B?ald3SVdIeGZDOXhBWFBMVitZN05POG9NTkExWVQ0WGFBZ3d6NXhwUklCem9S?=
 =?utf-8?B?WlBKRHR6dW9QTW1yTlRjcEtTei9nVnFISDR4ZWxKODNoNDRyMTlhVVdtSmgx?=
 =?utf-8?B?ellOOHRTaHdKTmhPMlhMTnFJUXhjbXAwQlZjS1llb2dBLzRjSkk3NUJ3aU8x?=
 =?utf-8?Q?pQxrDr?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 23:57:44.8220 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c163842a-7d6e-415e-cf43-08dd81f979f5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002313.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6652
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

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

The availability of reset mask options should be tested using a
bitwise AND, but since we’ve only ever used a single option per
call, this typo didn’t manifest as a bug.
Also, improve the debug message to provide more clarity when
the requested reset type is not supported by the driver or firmware.

Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_ip_blocks.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index 4eaf639b3..d6764194d 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -1022,6 +1022,7 @@ is_reset_enable(enum amd_ip_block_type ip_type, uint32_t reset_type, const struc
 	char cmd[256];
 	FILE *fp;
 	char buffer[128];
+	char buffer2[128];
 
 	char *token, *buf;
 	char reset_mask[32];
@@ -1047,6 +1048,7 @@ is_reset_enable(enum amd_ip_block_type ip_type, uint32_t reset_type, const struc
 	buf = fgets(buffer, sizeof(buffer)-1, fp);
 
 	if (buf != NULL) {
+		strcpy(buffer2, buffer);
 		token = strtok(buf, " \n");
 		while (token != NULL) {
 			for (i = 0; reset_arr[i].name != NULL; i++) {
@@ -1062,11 +1064,12 @@ is_reset_enable(enum amd_ip_block_type ip_type, uint32_t reset_type, const struc
 		igt_kmsg("***FAILURE fgets %s LINE %d FILE %s\n",
 				buffer, __LINE__, __FILE__);
 	}
-	if (mask == reset_type)
+	if (mask & reset_type)
 		enable = true;
 	else
-		igt_kmsg("***FAILURE mask found 0x%x requested 0x%x operation is not supported LINE %d FILE %s\n",
-				mask, reset_type, __LINE__, __FILE__);
+		igt_kmsg("***FAILURE mask found 0x%x(%s) requested 0x%x operation %s is not supported LINE %d FILE %s\n",
+				mask, buffer2, reset_type, ip_type == AMD_IP_GFX ? "GFX": ip_type == AMD_IP_COMPUTE ? "COMPUTE" : "SDMA",
+						__LINE__, __FILE__);
 
 	pclose(fp);
 
-- 
2.34.1

