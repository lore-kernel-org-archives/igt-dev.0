Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2523C87FCB
	for <igt-dev@archiver.kernel.org>; Fri,  1 Aug 2025 13:53:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 651F010E859;
	Fri,  1 Aug 2025 13:53:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Oz342Ws+";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99F3710E859
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Aug 2025 13:53:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e545S10tqawA4XYkW6g93MNSmc8MY+kuMQjwzRjxxYqZC+84GIl2RHkUWqYXNZKAQOpEjJjk+sSb31V8GoEunvl39yrWiLdVB4jLsVnJsH4s9NH9htbFZgiWV94NqLrb6Mz5Xr69hU/db1AFg8Dvkoj+jB0c3Io3HYPeMiL6TmTdHjPL3Do5Ua8CXimYI1t4XWmTfbIayZyRHvnCfY27edtue4ir/UkoQQt8D4Xa3STO0bCbvK/iNb1GWgcIN6AY571DCuxCPN/mfE9gDQZA9mesCTlYbSgTjlXkNgzMGtlUJblwuh///aq0lHF6yLc2gC8DGOUDGLScVLl1yyo8YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wEI3icurqB/GGW/1UTlRA5ThcPHYDqRC7oT6Y3z1sFc=;
 b=VBoijgCBk1EMbry3ANxoDLBNFd1whVmNzJYLE8HD6NgRV2l8U+WgU2Xqklis2JPexyGrYkJ8IARAiGhcQ03dUYuGPV7I0fRamPnFRrJd3C0mxj78BPj8gV+NZCMsAHnndi0P6LA1zxfzm9PCMVqKbCAhBOjDWCePMGBxU/FEGejkpPm2dGlZz+FbjWHveOiOY0504MxrLd0DqKEyAxN+aH7uBepOZw9G3n6M6x6+ntLPNHscqVuN5cf0uXPceVZm21NVQVrzOBwfOG5zOAYsneOH3sRW/QO13eVZmWQgiWG15HFmieUZQWo1GquABIMkPmSM3MfUuoI5ZnyMJGo7qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wEI3icurqB/GGW/1UTlRA5ThcPHYDqRC7oT6Y3z1sFc=;
 b=Oz342Ws+6Pl3V4pzd+tCTv993gJnWIJTLatVqM3LxF3utupNm9J07vh0fOXmmZeex8DD3RSHdnkSuiuNDB4JWuQGjI3ciYsMOA8V+Qudi+yRtwloB+le+c9lzeIYyfuhzpk6A5qZm6OU+zI9aGW6KA28Gr//HGc5SUIAbV4fI2o=
Received: from CH0P221CA0012.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11c::16)
 by BY5PR12MB4180.namprd12.prod.outlook.com (2603:10b6:a03:213::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.12; Fri, 1 Aug
 2025 13:53:53 +0000
Received: from CH3PEPF0000000F.namprd04.prod.outlook.com
 (2603:10b6:610:11c:cafe::e8) by CH0P221CA0012.outlook.office365.com
 (2603:10b6:610:11c::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.17 via Frontend Transport; Fri,
 1 Aug 2025 13:53:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF0000000F.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Fri, 1 Aug 2025 13:53:51 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 1 Aug 2025 08:53:50 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: Vitaly Prosyak <vitaly.prosyak@amd.com>
CC: <igt-dev@lists.freedesktop.org>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>
Subject: [PATCH 0/2] amdgpu: Expose and test GPUVM, LDS,
 and Scratch aperture sizes
Date: Fri, 1 Aug 2025 19:20:50 +0530
Message-ID: <20250801135052.3487752-1-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000F:EE_|BY5PR12MB4180:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b06dd03-c2cb-47a9-5cd1-08ddd102d8fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aURPNmJsM2NvQlFkaGxHUjJvN3IrNFluQVNzejgrNFVrSzJVMkU0eTJ4VFlr?=
 =?utf-8?B?K3F4YkJzblRrMUtIbXpwb2sxVG00WUZpSWlUZjAveVBHRGZFbFJzS2Z1ZnM0?=
 =?utf-8?B?b0JIWDlLSWYvTFhPaVFoQVIwM2h0L2piZDdlRDVrcmMvQXpadkw5N01ValhM?=
 =?utf-8?B?M3lKMEkwdk1kOE9odks4WmdRUE8yWXZja0xiUnhMcU9mNWJpNncrQzNDUFFX?=
 =?utf-8?B?WEk5TDNFMUFJSXhFR0ZMS2ZFSWkvQXd3eCtsWFZFb2xML3JqRGt1NTVzS0Zt?=
 =?utf-8?B?SDl1WnB1bWJNbHVZZVovOG84ajF1WXZKY0ZXeHN1N3pFTjRyb0xoU1l3QnVT?=
 =?utf-8?B?RFhlTXpmdDdqb3QwVUVCdHFUaUt5czUxeXhUeXRtRnc0U0o0elFPWDZ6bXdE?=
 =?utf-8?B?NDZlUnlOUlBBNlRGL1hUVTZNUTRhMEJsc2pTTUl0VFRTN2M4YXNLcUNkTEVD?=
 =?utf-8?B?LzgrVjUzekN1TWJCMHhvWjNNTmxrR05yeklzMkh1bmFJeGpPYlpGR05nRTBS?=
 =?utf-8?B?NjNsTUFSQmlSeHA3N09vQ2lzTzg4KzlPaXdTS1MwMmpXS1hxQThwY3ZaaGlH?=
 =?utf-8?B?THNzSzR4b2ZJZG13OXB2ZzZRWVRtelFCNDlEV2JBWkNrMGVNcU9KRjl1N3hI?=
 =?utf-8?B?OVhCU0FVR04zR28xcFlNUkpZQlp2Q1NSUVZZenNCUjQ2SSsxSXJpb0hnNjdr?=
 =?utf-8?B?UDVNZURaditKREtLYStsR3Fta253ZE1KZWFFTTVBM1FhbmNiVmJFVWRJSDUy?=
 =?utf-8?B?Y0o4cm1NRWM4dHBFNG1acFlXMU9TZHVlTXRFOUhja1dPbDczWU9meWNJUzZK?=
 =?utf-8?B?emkvYUMzMitldm0xSVJzVzNKb0FqTEZGWFNxN2dDckhxVFNsVnVPQ0twSGxy?=
 =?utf-8?B?ZmJscWhrZUtzZkM2enlSWVpyWjBSRjVWMGtXSmtJTGdPbUt3U0xuVHBsaW84?=
 =?utf-8?B?WHlFY3Nid3N4MG5ralBUejIyaWJPbEROdUdKaW84ZUZCbHArOE13MDdXdEJm?=
 =?utf-8?B?Nnc1MFBiYXd6M1hYUmlhZ0xzSmVQSWtMOXArUlZ3b3FEUWlhTFpTYTQzSVhz?=
 =?utf-8?B?VXRGTk9wUGRmVitRT1B6Y0VTWHh0ZkVZTHBNRkZMQW1WOWFEalNzS2tOLzhV?=
 =?utf-8?B?UWNCdGVpQjgrdG14MzVJOW9lT1VKU25Qd1BXZkM5S1RtMFJyb1BESXFhRStk?=
 =?utf-8?B?UEJMYlFFTlczTmN1cThCajYwNk0zOTNwUEVsS1NoZk9WZ1FyamtpZE1wb0h4?=
 =?utf-8?B?Z1FWSWRYZm5odjNxYURzbmxIaldzc1BMN2hadHNvWTZCNmJQby8vcEpocmhO?=
 =?utf-8?B?SFVSV3lHRDhybHZYblNQc2lENG9rcXNnQlp3VzVwUU4zNnVoeUxzNDMvcldx?=
 =?utf-8?B?NHArZG9XU1lCMm9XZkJvaUoyTEprTm5LWVVuZWlUNXI3QU83R2lqMmhXTWJR?=
 =?utf-8?B?d1BMOUlZbm9FeHQ0ZnhFMldBTlUzV2FvMExXWHdUQXlpT3pUKy91bFBGZ0Zt?=
 =?utf-8?B?STkrVGNDOWRpWDdUbzNYMnhVVFMzMTB2OFBQa25OMkw5bm9FK05DZ2JXcGlW?=
 =?utf-8?B?MmVlMVBOd0xoUTFxTGF5WHg5RW1ETlJ3eDJ2Qi9jMjhDK3FuRzR3Ti8vdXpj?=
 =?utf-8?B?SnFpdXN2YlA5V2gycS82K3NaS3hnVVFtc0M4emltOTNacUl6YlY2OUhGMFBJ?=
 =?utf-8?B?QWdnLzY4bEZUbElPd0NwWHlhWW9sTmQ0cGE1NFJNZFZoMUVYb3FLV2RRRlBE?=
 =?utf-8?B?RER2UHlUZzYxOHFVYjRMZmFja3BkSk5zNTJoVXRxYXdXVVJyckNPOGJwYnhJ?=
 =?utf-8?B?cTNoNGV3WVo3dGFSRHJPUVllcm5xSCtMaDNIR2xETksvNmpkOWp0dE9BbGp1?=
 =?utf-8?B?MlJ6RkVTSm81VEVONUM4TWJTcko0dkZpaW5JUlN4Zm5ZMlpYemZNS1poTmdo?=
 =?utf-8?B?STAwb0VMSWFsVTJlSkp4MWh1VGQ1SU5CSG1PamRDZnlYaDdmM2V2dmNraDBS?=
 =?utf-8?B?THU3aU00M3liTmRta0xBZmlHZjMxeUVPaUtJYWVJQSt4SzF0WCtEUGhGQWVr?=
 =?utf-8?Q?Bzllpg?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 13:53:51.6411 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b06dd03-c2cb-47a9-5cd1-08ddd102d8fb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF0000000F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4180
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

This patch series exposes the LDS and Scratch aperture sizes in the
amdgpu_info ioctl and adds a new IGT subtest to validate these GPUVM
(aperture) sizes reported by the kernel driver.

The ioctl updates add LDS/Scratch base and limit fields to the
drm_amdgpu_info_device structure, enabling user space to query these
values reliably.

Patch series:
- drm-uapi/amdgpu: Add LDS and scratch aperture fields (include/uapi/drm/amdgpu_drm.h)
- tests/amdgpu: Add GPUVM, LDS, and Scratch aperture sizes subtest (tests/amdgpu/amd_vm.c)

Srinivasan Shanmugam (2):
  tests/amdgpu: Add test for GPUVM, LDS, and Scratch Aperture Sizes
  drm-uapi/amdgpu: Add LDS and scratch apertures fields

 include/drm-uapi/amdgpu_drm.h |  6 +++
 tests/amdgpu/amd_vm.c         | 90 +++++++++++++++++++++++++++++++++++
 2 files changed, 96 insertions(+)

-- 
2.34.1

