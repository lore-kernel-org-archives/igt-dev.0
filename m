Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C62DCCD37A7
	for <igt-dev@archiver.kernel.org>; Tue,  3 Sep 2024 23:34:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79FC410E625;
	Tue,  3 Sep 2024 23:34:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jTEfnfhU";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2054.outbound.protection.outlook.com [40.107.223.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2463F10E625
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Sep 2024 23:34:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ENR85rJ5UVENWEmtPzO+qL9BHG32TDv3Ud7D9s6lUenwfv4PfM+R/JKBvd/2fv14+Es253nWrJzsohat86O13DA9lDG5OM/MFIrPCmuxMmDtld88LOsMuT1uhfUC2eJ93mfOhMZVNhPYtQnZzvFxo17HA53x3jpBnxkfATJsUwqhcYVYT2ej0pubM4PtioHEX8oAIZfo0mVZehSMDjJ6DrCo0jV+NhvdkHoE7kAhmK9Sv9lU1dcphMST6KLxz5PY/BFQlAJOfMmb+gDtVZt0WwLiW1QaEAETSfF+CZ+QwXQOd5Jrz4sjYaOWIO3UA/pIp3NvBG+gkkbu7pBsFpJBTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V/xM8gi9rdvK9hXSpDNf9/XcNylPlAwEf4iilksnFMw=;
 b=s5OgrkOyFo2wnbPSLhARWCcQArA0LBLpu5B5OU3ImuU4ilZsFRb19lXv4VwiS6PwRxttbtuPr4L7DSIIaLjkz8LrczW1EeQRKbSOkfGid56ccnFI7to6SIVnwB6EodAgjGV3DRMC53S/vUFP/5P9TfjNZHyxtrWJTVsKrKU7TKV0a5DabMwWMvap4KkgMdqYf+CcDY4NdUHdcLMy8X2YdO8dapH4xAKKkH3rcbV2TkFAT0FgpafrFoAHQoGp93ifoULhxP+THIR6UdDJTatnw2vSE7diB/p9aWpVeJuHwGFuLutBYwKHk73tin/6oDq6HFCwZA65J0QaK+5Vg4m2qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/xM8gi9rdvK9hXSpDNf9/XcNylPlAwEf4iilksnFMw=;
 b=jTEfnfhUGI2SLvkWySHPUCGaylN6EfebNkXBfZINNmk0FUyWBhoXQY7JW2RjGjK3lR65AkrITdw7wMFnXMP+ZstZccj77PNFxf9Ga0KfvbGSQOr6xFccutYJxI7dh4ZHK4hcpu3hfE6kX8ezzwZEQ1LRMcrvyeG9ZRFFp2xvEMQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8495.namprd12.prod.outlook.com (2603:10b6:208:44d::9)
 by SA1PR12MB6896.namprd12.prod.outlook.com (2603:10b6:806:24f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 23:33:59 +0000
Received: from IA1PR12MB8495.namprd12.prod.outlook.com
 ([fe80::97d3:87e9:1c4c:c692]) by IA1PR12MB8495.namprd12.prod.outlook.com
 ([fe80::97d3:87e9:1c4c:c692%4]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 23:33:59 +0000
Message-ID: <19898311-7e6a-443e-94c3-42ecbd2d7c55@amd.com>
Date: Tue, 3 Sep 2024 17:33:55 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] tests/kms_writeback: Add clone mode subtest
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: quic_abhinavk@quicinc.com, quic_ebharadw@quicinc.com,
 igt-dev@lists.freedesktop.org
References: <20240828-igt-cwb-v2-0-7b255c730c55@quicinc.com>
 <4c40e28d-a8db-40ec-bde2-0081314a7e8e@amd.com>
 <77a149a4-ede3-496e-bee6-728f396199d9@quicinc.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <77a149a4-ede3-496e-bee6-728f396199d9@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0053.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::25) To IA1PR12MB8495.namprd12.prod.outlook.com
 (2603:10b6:208:44d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8495:EE_|SA1PR12MB6896:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b23ae69-36f1-4669-4bae-08dccc70e289
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a0VZN1JmK0JHNVorWjE3TDZNV3lrMmhMV0dTL0pGbzhvVnFCVURETmh0SmhI?=
 =?utf-8?B?TGNudkJKUER6ZEhUa2QwWGdRZk5ud2lPMmNNeWM4Rll2YzFVV04zS0pocU9F?=
 =?utf-8?B?M1dRTk1YbUR0cUVGN3R5TVFBc041bDN5SG8rOVZ4dEFLWUMwR0ZEeFd5YVlZ?=
 =?utf-8?B?ekQrTXExcWdGK0oyemJaK0dqSGpKcS9kSGluQWNYcVkxTEprcFl1d1d4MmtS?=
 =?utf-8?B?Z0xUbjZKcjBjbEljZEswM2d2dzc5NjluRWZaUUZZeFZuNlorWFZKRlEwMWRp?=
 =?utf-8?B?OTFSdHFsUlBQOExQVTBtK0V5WlBuUHlPZGx0TThHdjNrb3BxUS9ac0M4R0xi?=
 =?utf-8?B?TFdrRUtEZ1h2MHNqek8xM3c4MGNlNk0yd0Y2V2JPcHJQK3Y2NlNIaDMyTUQr?=
 =?utf-8?B?OVJaTm9sejlYZ2NCZDI4K3hJUU5aaG9GdCtLa1dNYnpER2pvYXl5OFFUckJF?=
 =?utf-8?B?Z3NaRnIvOVdxN20zVVN4TVk2Q0ZiQTVtNmRtN204enFRZG9ETEFXVnZlR3lF?=
 =?utf-8?B?c2JyN3F1MkI5UjlRTTNaNG9ncUdHS1pjd1d2RndpQlBxL0l3Vnk5VStFYjg0?=
 =?utf-8?B?R3l3bHZZZ0sxa29CTHN4M0dSeEFBcXp0Mm1SY2pSMzBmRFFZU1B1VHJGY0t3?=
 =?utf-8?B?ZmxnN1ZwbVE1L2Z1d0xYUHlaOFVnTDBldjVvYTZ5UDkvemZENUlodDdWNGlW?=
 =?utf-8?B?MXNKamxwRG9GaXJlYWFTU0pzT1V5cGw4WGJlazdKbDFtMC9ZVzg4bDF2WWdC?=
 =?utf-8?B?aWxVOURjcmRXVXN6SVNvN1dlbUNScC9FY2RFTWI4ZkZvbXZyaXJrV29XV2Vx?=
 =?utf-8?B?QVI2eFBhQS9VY2RJVVZFdWEyRlRFcG1HQ0pQcTRGN0U1OWZIU20rdXBHUmdK?=
 =?utf-8?B?dTc1eGFiUjhVWnlkcEpBREs3YlhGUXk1ZDh0Tm10SlMzaW96NUNrU3hxWW55?=
 =?utf-8?B?aVZFODVycU1QUEd3VStYZEp0Z1hLci82c3pEd1pVOGM2NkJVQU0rYnR2TDlr?=
 =?utf-8?B?UkhxTTNVUUZheHN1ZlVGaTcwR1BOczVpemoyWktGTVBMbEZnTUV2dWdMMFZx?=
 =?utf-8?B?TDYvSHE2K3UyQkJiZnNxNHlST3JGL0UvRmFITmIwTHozNnNuY0hrU2ZTbE1l?=
 =?utf-8?B?YzJTSUc0Z0YxZ1RYUGk3bHRpN2JCMm9VUE1aRjlvY2hWbFpRWVIxdnVEU3l3?=
 =?utf-8?B?SXR5Z3VtYm9KRmNQTU9iZjl1VklBdE9zN1liQXpnaW9XWWRndkpjYXV4R2tF?=
 =?utf-8?B?T3JDdnYxMGdYSG1ZL0FSV3hDODdad1NDWWRXZHN2Qnd1dmFDVnFJR1UxaVpZ?=
 =?utf-8?B?c1ZrVk5VYWNicjU3MG9CSGRrUkxpbHhCTC9RT2dIc3FoU2tEaEdCQTJhNU5i?=
 =?utf-8?B?Rk4vMGNydll0ZkYxZkFJUlUzb3ovenlSeWRLSFZlRnVHbkd1bno2SUhsTXVw?=
 =?utf-8?B?bGdHZTBEZXREOWp0Q0l3T3JCSUVGRFhacnQ0aVdseWJseUNrakVRZDI0SlZZ?=
 =?utf-8?B?aUluWTNSTkl3NS9CR3podm9FMzFoRjJBd05Od3BJdDdEU3ZsU2pzc1g0NHds?=
 =?utf-8?B?YmZjOFZjdWhTcU1kejBQbEtPUjEvV3lDb0ZkZmMrampDcWk5c2Z1ZmliYUs4?=
 =?utf-8?B?UDA4dnQ0alcwLzdYdFBlWmlOYVF5Z0ZlZGNtR1NRWjk2ZXdzRVZlQlFONEo1?=
 =?utf-8?B?cm1pSmxzRVFsRUxTK28yaHBlR3dmNWlnSkhDSDhLZEswTGlGSW1GTno4aHRy?=
 =?utf-8?B?c2lCb1YvL1Jnd0NDajBWUU5BcWRpVzVlUXlIM2FKMzNNNkNiS0lPbXRkeFRO?=
 =?utf-8?Q?x8mqPw0/dDtVRJaHlm61LnSqQpKd/J694gaiU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB8495.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEQzWU1nblNuc2daZWMrSmx6WitiTG42dnJZcXdDN2M2MWFXZFpOaSs3QldC?=
 =?utf-8?B?Tys2blhONHRYSHgvT2dsdXZ3cG0vZk5TdDN3OVluYnd5bEs5QjVreEJGUWZX?=
 =?utf-8?B?R0VtR1c5czJoR3lxa3lCNEl1eWFTS05VNWpCKzRPVGRhK29ndXc0OHBoQlln?=
 =?utf-8?B?cUl0V1lhbUlQZE5CbXFLYjFReitwZGpHbjlKU1F5ZG5mSHBkSDNFQVArWUxH?=
 =?utf-8?B?N0ZZZDNTOE1yNFE2RW1rQlY3TTlQVTdMbDZVS0xCZG0xYUg0WE9LZEJFaEZF?=
 =?utf-8?B?eFFRL2ZxU1NSMjk2K1RkTTVNMDBHUlRjb2RvMGRZdVFsdDFuSFdBOTFjZlZy?=
 =?utf-8?B?SzhwdEd5RWdEWlgvUnF5Y2NCS2ZsdUZEOUZ3azZxTEExNHhIa2VONE1UUW9X?=
 =?utf-8?B?TFFvZWxxYkk4SUU2cjlYOUFUNldMQ3pNck5uN2lsM1FMMzAwTkcwMmpKSjEw?=
 =?utf-8?B?SlVLUzhCdC9lTkt0dy9PRjZGTFhLeVI1b2RuMEZ6aWMyNFpnWGxXc0RZQnVI?=
 =?utf-8?B?THdEMGk0VGphdlFNVEc0aE9uVWZHN3h1a2V0R2ptNkV0YjdHUkNuQldYTnBJ?=
 =?utf-8?B?R0g5cGljMjZ2UnA4Z1VzMTkrd2t4K0FHN0J5cGVhc1dtTVFaZjhLYUhmYTRy?=
 =?utf-8?B?dmJpT0VRaWtKSDd3RCt6aU5aUzFyc2FKTkNmbVBYUzRjOGZ5RGdTQVRISVFO?=
 =?utf-8?B?aWZCOUJKVFlUWkp6aWlaYmxyM0k5T0Z6VHRDSTVvU2tKLzRSU21nZnNPeVR2?=
 =?utf-8?B?OXl6blh1RTRrU2N6N0hOV1JZb3pTZWNwTmMyZVNxQU96S3d4TklMMnhDVWQv?=
 =?utf-8?B?Z1c0ems3bkNuOUxReFViUEx4R3QrWDU0RVgxZWRFVnpzWnQyVGdpclQwZkJB?=
 =?utf-8?B?ODdqcVdLdE1Hc3FyaGozdloyZk1tY3FmSlV0OXB2TzdqOHppM1IvOGRFVG13?=
 =?utf-8?B?U1R5NVFwK3lNUGFKcGp3L1pEQ0o5NkZDajdqM1c3UEpUVWNtV09PZmdtRTRw?=
 =?utf-8?B?TnJ4RmwxYXhBQmxwbHRRTzZ6VXhWb09OSDZxRHE3QURJcXNJNGZhNkx5c2hI?=
 =?utf-8?B?bVVMRDVoSTFZT0FvR1I3NlFZQVg2aW1tYXFUQjgxYTc0VC8vUHl0cVJ2cWpU?=
 =?utf-8?B?VWEvbDl6ekgvNkRaRXlxUVMzampKSkxaYmpHZWtiazFrdUJKVEZmTVBZZlRm?=
 =?utf-8?B?TFgrdGdwcjFlRkZXd2ZCOXE4Rk1CMWIzbWluNU5GM1dCbDhBRGxUMDJZTThV?=
 =?utf-8?B?OXdRYUdYNnpLODVMa1EwWEhDbTBlQWZWMVh4QUNsZmpGd3gvTThXY0V4WHJP?=
 =?utf-8?B?SlJDcjBqQ3RYV0llMCs3UEhXdU5UaEJBc25DbXMyR2laYTJFbkY3ckhLN1d2?=
 =?utf-8?B?MEdZcUZnN0dFWmozVlg1M3ZhbXhMUzNpQWVhVmtBaVdwQW5TeURaN1ZLRmFn?=
 =?utf-8?B?KzQxQVpTMEJXSStrWXc0ZUExcVBRajlNa3UvNzdkVFVOQXBCb3g2amZCU1Az?=
 =?utf-8?B?Y3JnVEJPenB2Y0RYRHNMRS9iWnpmVGNkOHRteDh6cTJXdTVqTnVyQm5XUGRT?=
 =?utf-8?B?Z09VQnR1c2J3YS9aeGZ2a0FQMWt3L2VHa2VtWjJQck5XcU43b2dLZEZwK1hR?=
 =?utf-8?B?N0VtTm10SGlvVGs0ODNEZFBWbnhiK2VtVHZZTEs1VTcwUmw3ZVFiZ1pSd2F5?=
 =?utf-8?B?Q1J6Tng1MTJKN1Avb0ZzTkRQSjR0V2JDY0hHaUpxSHRnOUVSWElFTStCQUZQ?=
 =?utf-8?B?KzBreUE0VDhxNEkzNDJTVjVnOXF5NGR2ZDZjV3dIVUUrbHM4ejM3WGVDeGdK?=
 =?utf-8?B?czBLdk0rcFJ0L1htbUE5L01sWDlRT21YMUE0MkZIUzh3aHZiSUFrK25LK3Fy?=
 =?utf-8?B?bFhZb2xObTVkWWZ6Q0tmQ0RGVEYrd0Y2NUhncFJwNk1TU2ozUGR4clk3YWlK?=
 =?utf-8?B?b2t0R0poaktMVGhkUDZ5a1psMjFIZklGM0lKOVh1dXVFTFcxbE5HNGJaeVZV?=
 =?utf-8?B?MjBpaGQ4ak1TTEcrV1dhRUJiU243QmdVTmRHRnpRNW8zNWFhN2lOc2o4UjhF?=
 =?utf-8?B?VXZKVjM1Qm9HRk85S2F3RHFJelRGUHp5OGJoTkhCWk84ekpkekJEVXEyL0FG?=
 =?utf-8?Q?LjyEw8gCeFvWs98x93CRRpeJp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b23ae69-36f1-4669-4bae-08dccc70e289
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8495.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 23:33:58.9955 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EOILNCOSyD5B0Cb2WSrt4WH0Z8KE+sHcojoMJrKs92xdWItGvd9qUavB/EkAt0QxfLnJBjSlZkeraXpEnMe3ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6896
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



On 2024-08-30 12:32, Jessica Zhang wrote:
> 
> 
> On 8/29/2024 1:28 PM, Alex Hung wrote:
>> I ran a smoke test and Patch 4 (tests/kms_writeback: Disable all 
>> outputs after igt_display_require()) is causing a regression on my 
>> test platform:
>>
>>
>> Starting subtest: writeback-check-output-XRGB2101010
>> (kms_writeback:1973) CRITICAL: Test assertion failure function 
>> get_and_wait_out_fence, file ../tests/kms_writeback.c:345:
>> (kms_writeback:1973) CRITICAL: Failed assertion: ret == 0
>> (kms_writeback:1973) CRITICAL: Last errno: 38, Function not implemented
>> (kms_writeback:1973) CRITICAL: sync_fence_wait failed: Timer expired
>> Stack trace:
>>    #0 ../lib/igt_core.c:2051 __igt_fail_assert()
>>    #1 [get_and_wait_out_fence+0x8e]
>>    #2 ../tests/kms_writeback.c:401 writeback_sequence()
>>    #3 ../tests/kms_writeback.c:424 writeback_check_output()
>>    #4 ../tests/kms_writeback.c:782 __igt_unique____real_main557()
>>    #5 ../tests/kms_writeback.c:557 main()
>>    #6 ../sysdeps/nptl/libc_start_call_main.h:58 __libc_start_call_main()
>>    #7 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
>>    #8 [_start+0x25]
>> Subtest writeback-check-output-XRGB2101010 failed.
> 
> Hi Alex,
> 
> Thanks for testing and reporting this.
> 
> The overall goal of that patch was to force a modeset for cases where 
> the primary display mode and the mode being used on writeback were the 
> same. If the modes are the same between commits, the DRM framework won't 
> perform a modeset on the encoder even if the connectors have been changed.
> 
> To get around this, we thought it would be good to disable all the 
> outputs and start from a clean state before doing the writeback 
> connector setup.
> 
> Is there anything in AMD's disable path that could cause the writeback 
> connector/encoder to be in a bad state for the next commit?
> 
> Thanks,
> 
> Jessica Zhang
> 

I did a quick check but haven't found anything wrong in disable path yet.

If this is required specifically for your devices, maybe you can have 
something similar to is_i915_device() or is_amdgpu_device() for time-being.


>>
>>
>>
>> On 2024-08-28 21:05, Jessica Zhang wrote:
>>> Add a subtest that will iterate through all pairs of
>>> non-writeback and writeback cloned outputs and dump the writeback
>>> framebuffer for each pair.
>>>
>>> This series includes:
>>>
>>> - Fixes for properly cleaning up the kms_writeback state and forcing a
>>>    modeset after igt_display_require() to prevent commit failures when
>>>    the writeback mode is the same as the primary display mode
>>> - Adjust the duplicate pipe check in igt_display_refresh() to allow for
>>>    combinations of valid clones
>>> - Moving the writeback dump to its own subtest
>>> - Adding a subtest to dump all writeback/non-writeback cloned pairs
>>>
>>> To dump the clone mode buffer, run the following command:
>>>
>>> IGT_FRAME_DUMP_PATH=<dump path> FRAME_PNG_FILE_NAME=<file name> \
>>>     ./build/tests/kms_writeback [--run-subtest dump-valid-clones] \
>>>     -dc <primary display mode>
>>>
>>> This will output a file named <file name>-encoder<writeback encoder
>>> id>-encoder<primary display encoder id>
>>>
>>> ---
>>> Changes in v2:
>>> - Corrected author email
>>> - Link to v1: 
>>> https://lore.kernel.org/r/20240828-igt-cwb-v1-0-48aee421fc97@quicinc.com
>>>
>>> ---
>>> Jessica Zhang (5):
>>>        tests/kms_writeback: clear writeback properties in teardown path
>>>        lib/igt_kms: Add helper to get encoder index
>>>        lib/igt_kms: loosen duplicate check in igt_display_refresh
>>>        tests/kms_writeback: Disable all outputs after 
>>> igt_display_require()
>>>        tests/kms_writeback: Add dump for valid clone mode
>>>
>>>   lib/igt_kms.c         | 57 +++++++++++++++++++++++++++++------
>>>   lib/igt_kms.h         |  2 ++
>>>   tests/kms_setmode.c   | 14 ++-------
>>>   tests/kms_writeback.c | 83 
>>> +++++++++++++++++++++++++++++++++++++++++++--------
>>>   4 files changed, 122 insertions(+), 34 deletions(-)
>>> ---
>>> base-commit: 3b6b2d238e864ff1af9e33159d3bbf4b7f01d86d
>>> change-id: 20240827-igt-cwb-23fd81d3a7a4
>>>
>>> Best regards,
