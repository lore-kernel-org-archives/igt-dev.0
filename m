Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 851A4C87FDA
	for <igt-dev@archiver.kernel.org>; Fri,  1 Aug 2025 13:54:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 384B210E861;
	Fri,  1 Aug 2025 13:54:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="MCjLJsHC";
	dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2063.outbound.protection.outlook.com [40.107.100.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 387F510E861
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Aug 2025 13:53:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t4rDXaBggQbxxbnsS4SfNUzc/jIN8wDcQrW6wk4h2XjQXeyLRWhMi8zB+taACRgcAhMgJ3RW5CRmc0fQZH3gGSsC6h43ETDuROgmfydBH9fQI6KSQSV5b21iESiIgN8kbmpaNgGDX1j5kv+C4E9774oV8sFrFlox9GcF1DP6z3f7N3kybrlmsdk+2OE/M95uu5vZXfNP7nHXE8nB3nykAuADQd+KMH+Mq8J0AwU75NjTiBZiiF4uFo2FsTzQFd8bwKKoHruETMyp9iB8LuWjS4uoRafhWwRnn8+90ZYq8dw0PTUKOq0S0wuzxvvlu04b5ci989b94pZ55iCJ9Xb1Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1C3p1IjN0goed7nJGKEJRDA2i1JfWNwJIc64cZuoxZs=;
 b=uRL3x84VsQzccRtiltSqe8lzwfvlWQUFmrzLVBPdZGsGUTlHSyRE5bM+XH+uHEVM1ptivFJmyFWCnslWlOH6GLH1WLPhDhV8XC4VfDMZA1AKknI/Nf/CbDi05mo5JOqU+Xvq9/AykX9JE3rxncZtPNuMGGeFEbI11fJhrflSZn31Cw/z53xrbQGh410dsTk6lHCunGYw2lpxs5ARn5OvRXwZKP41mvuvibZaLxSKSfnJXPNH/Q3uAunwJbZfa2cOXnhrwmdjIeFMW42vMYJ6nYRAq0+1QfFj9lF1QP9KkoXg99goIgGw8Y12N5Z1+gTBLCA6Bl8sLhCFyWIDvtktgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1C3p1IjN0goed7nJGKEJRDA2i1JfWNwJIc64cZuoxZs=;
 b=MCjLJsHCOpGLH34DQ/XnglHN2weMCCrdD/mfbL3XzEa13OT5kTeE1lFlcvDAab8UMqlAnAYzWeZoJ2qQZ+ly0dotY0e4mJyu2E31HFEf7xaZoObjsoY+R8IV7v8tfHyYhtpdUFp/kov2hn5Eq6Sr9U+edfPWZasM5d1067mgHVs=
Received: from CH2PR14CA0060.namprd14.prod.outlook.com (2603:10b6:610:56::40)
 by IA0PPF80FB91A80.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bd5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Fri, 1 Aug
 2025 13:53:56 +0000
Received: from CH3PEPF00000010.namprd04.prod.outlook.com
 (2603:10b6:610:56:cafe::91) by CH2PR14CA0060.outlook.office365.com
 (2603:10b6:610:56::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.16 via Frontend Transport; Fri,
 1 Aug 2025 13:53:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000010.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Fri, 1 Aug 2025 13:53:56 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 1 Aug 2025 08:53:53 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: Vitaly Prosyak <vitaly.prosyak@amd.com>
CC: <igt-dev@lists.freedesktop.org>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>, David Yat Sin <David.YatSin@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>
Subject: [PATCH 2/2] drm-uapi/amdgpu: Add LDS and scratch apertures fields
Date: Fri, 1 Aug 2025 19:20:52 +0530
Message-ID: <20250801135052.3487752-3-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250801135052.3487752-1-srinivasan.shanmugam@amd.com>
References: <20250801135052.3487752-1-srinivasan.shanmugam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000010:EE_|IA0PPF80FB91A80:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f41a65e-2d6d-4545-3453-08ddd102db9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VG4zM2lYdXl4bGNXKzNmbjc1a2xMS3VTNk1iSUJLZDNxY2dPRnJUMkgrNWVo?=
 =?utf-8?B?RnpFNU5tNEhqbG1HVXFCTXl5TDJlbWdIclJ3bFJqUWF0QVRUV2k1Q1QvOXFU?=
 =?utf-8?B?TlpkQ3dPMjR1d2h3YnlxcTR0U2Z4QXI1L2dTakJjM25qRCs2NXBNdE9scWdq?=
 =?utf-8?B?YXl1aU1WMkJ5ZDNOQTRyOGxmOHJsVlVBVzc5QmJhYjZiL3N1YUNVbDZDejhG?=
 =?utf-8?B?MjBUVW52STJQcHBZR1pWdEhraE1EYkRxd3VZaUlXM1AvSjU4OUx0RVRzcElm?=
 =?utf-8?B?TWR0QlBCMVdraFA4ZmZsNE4zTE1PMnRPcXRIWUVvZW1yMUx5RkVHZGw0Wk9s?=
 =?utf-8?B?MUpHS09Ed1hTM004L0p2aFFlMVFiWkF3dmh6dEJwYkRUOGZBeGdsaFZsRHk2?=
 =?utf-8?B?U0Fib3BPMGM2Y1hrckN1OEhJTmkyNVhmdmZvYzNOcGx3UEp1T0J5UmVvbVZV?=
 =?utf-8?B?cmRFcEtvMHhnbHZNTWYwdXJNb1ZZTXExOEJZYnJMZFE0a2FFMnhiU1JlSFFj?=
 =?utf-8?B?MmhUTkdJYzlMNjF5ZkNEckUzZjBHOW8yUHVtYzZTQ1lyYUpBTElVdlhhcVdE?=
 =?utf-8?B?dHRGWkRlK0UrR1BEbUp4NUpMRUlhM0ZTL24xVWVGQTY3RHBkeFpZdGd3Sm5j?=
 =?utf-8?B?VmRiL0JyWGM2cUhscE80TDFyRC9lRHRYRHY2QUFSZllQOTI3eXdTUFlJallG?=
 =?utf-8?B?TkZkRzN3SkdFMHArZ2pKTm8yNjdWWEdybmc1MnFRSElwRDNORG4ydGRQMDdR?=
 =?utf-8?B?d2FjRGpOSDNnNW1nWmQwcExNZ2pjQmVBakV5UEJBVjZnQmM0Tm8xNmVEeGJz?=
 =?utf-8?B?dWJiTmlqWWltL2Zsb0QrZEVBdWxiQXNrUDl2OWk0anhHb2FvQ20zYWFuU2VK?=
 =?utf-8?B?TlF3RHZ2MFEzcXVBSXh2a0FsekpVUkhVb3crZTdBeXBYVjRNWTJERFNmQ1BD?=
 =?utf-8?B?R3QvVWNyOHNuREZOSXZISnNuTzVTQzZpUEt6aGlTR2J3SXI0WjBmQVN6SGoz?=
 =?utf-8?B?NzE0d0tOWWRvdU43MVlqMXhCc1FudnRtR3Fyc092UnFXY0NNV0doelA2ZHVs?=
 =?utf-8?B?Mmw1NVI3STUyQnJHKytqOVFvQnJBeWwzUXNNcW1nYVhJbHh1NERWb0xtZHo1?=
 =?utf-8?B?RzJ2eGhibXRjWngwdHJqT2lxSFBoZE5wUXdJQWR6RlVlR1IrRU9wbHRvU3lD?=
 =?utf-8?B?QjM0amV1eXI1RlE3MllJTXQ1Vm1aNkVwamZORGpqMGN4MGM0VHc2MVBkbDNV?=
 =?utf-8?B?Q1lOMUZvc2I5amtxN2prWE13ZUN0eW1VYk94RWU2YU96bjJYMXZORmtTWEdY?=
 =?utf-8?B?UHlBUm1EeWpQS3JCc0xkMXM2cW5MSDFmZlJjTG1TQkpnQ3kyRmpDRUNXeDQz?=
 =?utf-8?B?UUwrNzRxc3ZHL3B1OWFUM3N5RlIrUmlMSXQzRFFvNE0wbURycWhxL29YV2NZ?=
 =?utf-8?B?b0ZkMExxMmhCdDczUFlhbFIwemo5bW5Rb2l1dWhoZzlzMnRybjZHY2Vtc2xH?=
 =?utf-8?B?bFpHdFFiWWdxcDh6OEFwSmRMSWxvaUw1d3IvZXFpbHZXUVA0QjZjWlRMdE16?=
 =?utf-8?B?NllMNHlKRzVueDlpZjlnN0prM25FOGdNeHFJUk85ZDVmQW56V1lyd3U4aVdJ?=
 =?utf-8?B?TEtpKysvcStBa1RUb2VERDkxOS82anAzTUxmUGFJRjBvZThjdklWdVc2bHJF?=
 =?utf-8?B?ZnIxcHhHRVNWS1Q5RjRDRkhMNFp1UjBhQldCSUZsS1EwanBCam5EQm9qckd4?=
 =?utf-8?B?SmZjeUNEZGpBTE5FRG82djQyMTJGc2N1NWY0VTVsUUV6K0pFOERxb3RjZzF6?=
 =?utf-8?B?NHlZRGRsSk10czBJcmRVRVFnaDdJNzV0VmZUU0pSZ1JZM0h6YzUwbk1tYkh3?=
 =?utf-8?B?NWl0VGlTeFJneW9JMThReHNVWFBEd0JrcmhOQ1FvSkdBUjhvUGFNV1VhTTdZ?=
 =?utf-8?B?ZGZaYUxJdDVNbG4rQkNZbUxrQWZtR0tKV1hjelJjSDcxN1BvTWJDZnF2d3l0?=
 =?utf-8?B?ekNWQ2pKR013PT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 13:53:56.0720 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f41a65e-2d6d-4545-3453-08ddd102db9f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000010.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF80FB91A80
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

Add new fields for LDS and scratch base/limit aperture addresses to
drm_amdgpu_info_device struct used by AMDGPU_INFO_DEV_INFO ioctl.

TODO: The following kernel patch is pending merge and will be referenced
here once merged:

Patch link: https://patchwork.freedesktop.org/patch/661705/

Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: David Yat Sin <David.YatSin@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
---
 include/drm-uapi/amdgpu_drm.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h
index 80c558727..6b2685d20 100644
--- a/include/drm-uapi/amdgpu_drm.h
+++ b/include/drm-uapi/amdgpu_drm.h
@@ -1451,6 +1451,12 @@ struct drm_amdgpu_info_device {
 	/* Userq IP mask (1 << AMDGPU_HW_IP_*) */
 	__u32 userq_ip_mask;
 	__u32 pad;
+
+	/* Additional fields for memory aperture information */
+	__u64 lds_base;          /* LDS base */
+	__u64 lds_limit;         /* LDS limit */
+	__u64 scratch_base;      /* Scratch base */
+	__u64 scratch_limit;     /* Scratch limit */
 };
 
 struct drm_amdgpu_info_hw_ip {
-- 
2.34.1

