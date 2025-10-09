Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C12CCA471
	for <igt-dev@archiver.kernel.org>; Thu,  9 Oct 2025 04:20:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9145310E1E0;
	Thu,  9 Oct 2025 04:20:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GCkkzpef";
	dkim-atps=neutral
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010057.outbound.protection.outlook.com [52.101.56.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE41A10E1E0
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Oct 2025 04:20:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dhBUeMUdEPNvGuceg+OWHLhvXkA2TNbw/W03+1tShhi+sFEbnNqnWEX99OZwFOJjtoUVcG6KFxcQHx5TL3VSiBRz6jNBwi23aPOcekEC0Qn0nBPAellS+WmyOvV30tZduBgz04J463LPhWvXBMKXTkDwSuMFM1vjHeKoZDQFq8fIg4OrFJaH6lG786T+Pu9jw/eIap2lPS/lyuR9e7R/qc6UO3fMPpvFCtImdJ51iitH/ptAMaYg4GIiN5i4WW6fRWiPa/WutDP3eKDKyRwRkAwqqXF2qSrVHSoydP5VSru0AkO/2LWV89HTiOCdZ0GxLUmolO6KWiNCTBYDRzh09g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wEkpEZOO6ge8oF4OBeDv+Qvxukj/KLUFJm2jT66zPuc=;
 b=XnbMxxVgUs56fbpMBR15EZrYuUxF38fJCuQ3oaJ7th2pabMqDGLCAN5CHM0VIUTrgiSmyIEat0IAIuARelchxkVGPTSVjCGZr32kVwSPX3xu4omeMq8JHgMRxozNSAAYFWcS/YC+wf5HOf6t072oMeGgqQRiKk95SflRlA+R0AI9+xgJCOODoiMFq0gjmox+FGVOb1jS2xl/YxjKmrLKnQjW7IHgTLJ8p7mgIW81ub3AhA1tbS8bGQosUc57ceWSbKSx46NhxVqYYSBvEKps+uw+5IvICxgxv0o9NrR91dHInsCzbj5CHKHNyGgvlEwSoz3I8xf5LXp5/PoGU1kvsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wEkpEZOO6ge8oF4OBeDv+Qvxukj/KLUFJm2jT66zPuc=;
 b=GCkkzpefVSOzOOoD+imiexYOAzFxZaMWFn1geqUROQoh8zPgKkLDRtj4BI8GYuvsmpXkvaQ3YkChFDE4rYjogAELlz/cOSNsEEZdbQAm0XsGjvoR3XAiaHqcGAHHsI5eYcqwm6acWBk+DnSfjOI7DyrNx1QIOOxJV/mgH9SI2LE=
Received: from CH2PR07CA0019.namprd07.prod.outlook.com (2603:10b6:610:20::32)
 by IA0PPF8FC6E1236.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bda) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Thu, 9 Oct
 2025 04:20:46 +0000
Received: from CH2PEPF00000099.namprd02.prod.outlook.com
 (2603:10b6:610:20:cafe::54) by CH2PR07CA0019.outlook.office365.com
 (2603:10b6:610:20::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Thu,
 9 Oct 2025 04:20:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF00000099.mail.protection.outlook.com (10.167.244.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Thu, 9 Oct 2025 04:20:45 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 8 Oct 2025 21:20:43 -0700
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>
CC: <igt-dev@lists.freedesktop.org>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>
Subject: [PATCH v2 0/2] tests/amdgpu: Exercise MMIO_REMAP remap page
 (alloc/map + HDP flush)
Date: Thu, 9 Oct 2025 09:50:25 +0530
Message-ID: <20251009042027.63945-1-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000099:EE_|IA0PPF8FC6E1236:EE_
X-MS-Office365-Filtering-Correlation-Id: dc71a663-611b-41dd-a741-08de06eb37cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UVNBbFNwM0JJVHk0dmhDRDlwc3RGVG1Rb2IweUozalR2bnRwK2hqb2RFUWht?=
 =?utf-8?B?RUtzekdxbnl2L3hQa0NpSFdUZ1hXM2pnb1ZaK3hwaXVod2gyNldqQkNxL3Uz?=
 =?utf-8?B?K05NSmdDK0I0Wmp0VEhCWmRKZldhT3ZSMWxYZG4xdHZyZVhpYVhKUGcrUDhu?=
 =?utf-8?B?WWFXeUF3V2NSUi9ESTA0bDJjL1o2UVkrRGNvSGtodFJuNnhCSHgwTklIMTIz?=
 =?utf-8?B?M0VBbWptZGkxcVdYQzRaMFp5MXgyVytnTWkzTSs3azIrdG9TZ1A0YktSekM4?=
 =?utf-8?B?WEdLZFVLTldhbmNDOThidzk5L3ZJeGUxL1BRNEc3Qk5nZVo2cFVMblo1djB5?=
 =?utf-8?B?a1h6a0ZJVnVIbTgzTFBndU5VaG56QlhmQ2oyWUhTM2JUK2lOVFh6WUgzTVNk?=
 =?utf-8?B?dERHdUwxL1l6Y25oa3d3dzJEYUNSZ2hTM29leFdLSERWRkx6TGlMc1BrcVhI?=
 =?utf-8?B?UXpQTVRaTVQvemhtUEV5d1V3cll4N1lCTXAzbVB3R2JSSzYvdmhnbENJVzNq?=
 =?utf-8?B?MTh5ZFliSXpoUm5zbVNZRTZ2c3dmUWkxY2JKSmQ0ZyswUUdKaXNCalBaV0s1?=
 =?utf-8?B?MlNQTVBUZytVUWhaTlFLZjFLakNrWmFXZW5CMytaNVliWWNyNDRoaGlJU3pB?=
 =?utf-8?B?RmVlVThRMXIrRDZjWk1xK1dmd2V2WkZBTkxlOFhCdFk0cmJFUTd6cHhVTkFy?=
 =?utf-8?B?Z0FaYVljeGZiYXNCUlloTFltZFlOb2JTTmI3RVpOVWcvQ3FLMDVWMTQ1T3RF?=
 =?utf-8?B?V256SDJBUkVzVEMvbnlBbE5ISXg1RG1QNncza0dHS05kejNtVHhiSTVzekFT?=
 =?utf-8?B?c3NJcWJib01qSEl2Vk04S08xZDZKbXJ4MlVtcVpYTFoyeU5FRmNHeER0aEVh?=
 =?utf-8?B?ZjlTTStDcUQ1SEtzV3JDTC8rKzJLWWNJQlBXcC83aGpvMHM0SkZkVm8xd3JY?=
 =?utf-8?B?NFYvUnYyckRxNW1TWUZrQmMvYzdFR2dkTEJpY0kybDNsRmkxYW9scUtGdUNI?=
 =?utf-8?B?UlhjOVFWc2lGamNmMnJFN1IzOURvK044UHBVTXJXREFZcC91MVNaNlNZblNP?=
 =?utf-8?B?eVJKUjYrUzFKUzEwakdYWFBCWnV3OWZnaVZXUnpDVUhhSjNEOTJ1bGZUS2dJ?=
 =?utf-8?B?VmhkZ2FYUnowOWVVcmVqYTJOUTZkS1B3aHhhT0JMSHNwckJaU3p4QUlUYlZ4?=
 =?utf-8?B?Snhld09WUlRtR1p6aUFLTzNNcmkzWVJibjNnTU8yM05WbTRzNzJGV1NxaWFa?=
 =?utf-8?B?KzU0MDNKNXhpV1UvcXEwQ0pOc0NGKzBvMDN2MVkyWWxpN0EwaXRGYlVrRHA3?=
 =?utf-8?B?UzQ3c1g0K3BkZ25NSitqMjlMeG9iWlBnVG5ISnNGTWlCM0hDYVZlR1c4MTls?=
 =?utf-8?B?K24zRU82Nll6TWcwdVg5M3c5SnA3djBXWnFxWWxCUnZqRFdQRXV4SGxScDR1?=
 =?utf-8?B?WjBHWlpEeU5saitRRHBmbnhtaXBKeHlOYWlaK1MzREtJNFg0SVFWZHhZK1Jx?=
 =?utf-8?B?Z1pMUzN3VzdSV0ltMitkeTRqellWOEhFR1lLaFA4VkZZWjVyUUNyeFZSVlp1?=
 =?utf-8?B?R0Z4aDJtZkxNbC9XNitYNjNpazJxTnpGelo0VCtvL0xHVWh1S0JxWGNoMlky?=
 =?utf-8?B?d0ROYTJySWIwZy8rRmlEOHhtaHYwbHlNMDY2YXlEOW1UN2gvMGNYREJBVjlp?=
 =?utf-8?B?Y3ZTVkdxRWllMlJ6Q1luN1JzTmpzdndzL2ZKYlhrbVVSRkxpWjBHa3dudFhI?=
 =?utf-8?B?S1MrcituWDhteU9oZmVNRjYxTHV4NGw0N0VWTXV1S3luSUkrZVp5czhjZUQv?=
 =?utf-8?B?NWlTUmZzbWNnS2NSa281YnkrOWlMZUM5QlpNUWQrN1R1VTJUcU5pTk14bGlw?=
 =?utf-8?B?WFhRdGd3dkl6Q3N2L0NIbjgvanhzb0tkNWkzekV2OEdLd2lZUEFwaU5KaXZF?=
 =?utf-8?B?eEdoMEowRVZWZmtnaFZsQkZKd3ZhMkpZTDJScWtiVWlpRnBnRjNXdCt5MmNU?=
 =?utf-8?B?QlN5eThsb2R3VzZIMDVuU0NSQ3BpVHh6Yk1HVTRHSGY3S3QzWWtHQm1lOVdZ?=
 =?utf-8?B?Q3duQzhVeXFyb3BGVEtDaUZhUURBNG9MblU1K3V1Z2tCN0tHNlA3cjlHdWp3?=
 =?utf-8?Q?T+W4=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 04:20:45.5956 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc71a663-611b-41dd-a741-08de06eb37cd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000099.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF8FC6E1236
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

v2: Incorporated Vitaly's feedbacks
 - Removed excess debug logs
 - Drop non-essential igt_info logs, add MMIO write posting barrier ,
   and move skip-eligible checks before allocations (free any temp handles
   before igt_skip) to avoid leaks.

Srinivasan Shanmugam (2):
  tests/amdgpu/amd_bo: Add mmio_remap_gem_create_close subtest v2
  tests/amdgpu/amd_bo: Add mmio_remap_map_and_poke (HDP flush) subtest
    v2

 tests/amdgpu/amd_bo.c | 124 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 124 insertions(+)


base-commit: 67bac214fa369d741def819b33b104324c80a0f2
-- 
2.34.1

