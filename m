Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 951FCC83F25
	for <igt-dev@archiver.kernel.org>; Mon, 21 Jul 2025 18:27:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45DAE10E2B1;
	Mon, 21 Jul 2025 18:27:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1KPgGVUT";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2088.outbound.protection.outlook.com [40.107.244.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F79410E2B1
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Jul 2025 18:27:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NMcuRVwjzunzIQ0ou05djEqGnxepneIVPfYok6CA/SmMSElrBXETyTvTtd7vJa9+Ldm2A+3fq8AGFhsKIr4Q/bzRCUWu3HaAUhHYq6AHux3Y3sD99wPZ2NE0b28VkHqbXaWzyq/17vm9foCQoyj27UD95hl0+0hdupf5MIxpXGPeJTs4VVSW7ULv8uinP/RvFyYfLSIKoxcQyDG6fMeS/sUS2zNvC+EEVyg4T6zffo2zblwAgbs9NtyiW7VXmyaDD8/Ako9hIEC0aMp4/58Ktv1PDMHCAJyHQeYYmowVljaA4E576o+ofNReRSQZZWV09BGZgi4j1NfcIoRVjjoL1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=txGCruJBltBbasBdj0MBA6bA7LOD2SGLe70iuKv9ifQ=;
 b=FTgbiNHMawI3aZ2hNBqL6LTbJbb2FLxBlOMg0UhpSo0ybYyHl3b9mQEJCdx9zzbfHntg2e+ebrD7bqcH59ut5o1+kzTMaNbAE6kM/HpgS0Td7HI4cvY6xUZavhdTmEoAMqsYSANuz4kgO15U5S3YOLQHtJfeC7Q8UywNB8L1WmEyHd0MwmwpMkVIZyC8HnK51F7nitGxSvQS8NNDRUASkiPTKbdRMwz26IH8m/ACP3nxNHXrwTa6laoNOh8Y1FqTmQTU+PyN4SoFic8JFbwjAB6ej62kd/zpPR2A7WNZllDqGb7/fShzHYnqdpJa+5CcxAh0DzOtPYj5A09VW81Cug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=txGCruJBltBbasBdj0MBA6bA7LOD2SGLe70iuKv9ifQ=;
 b=1KPgGVUTgKCM9EAbC04m0u9WuQXNZJB7pzcA6JpH8ttdU0Ex3FuFcG92gGZiRiDVvzU1GeF8ZRrCvR3VjMbvRusp/sIKVdj47a39Tm8XWsDfH7uqMZDBTvtWbbumS8/jIJb87GDfN40ifA9et0sYOKX8eZOGZedsM4xAb/bUtpI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by MN0PR12MB6272.namprd12.prod.outlook.com (2603:10b6:208:3c0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.28; Mon, 21 Jul
 2025 18:27:45 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%3]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 18:27:45 +0000
Message-ID: <65893b1d-fba2-44bc-99c7-a8ea2e5f5632@amd.com>
Date: Mon, 21 Jul 2025 14:27:42 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib/amdgpu: reduce the job count for deadlock helpers
To: Alex Deucher <alexander.deucher@amd.com>, igt-dev@lists.freedesktop.org,
 vitaly.prosyak@amd.com
References: <20250717154617.236002-1-alexander.deucher@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20250717154617.236002-1-alexander.deucher@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0070.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::18) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|MN0PR12MB6272:EE_
X-MS-Office365-Filtering-Correlation-Id: 7efe4bfb-7618-4ff0-fdbc-08ddc8844955
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NzB6TzdPZjhKcmVsaS9TU3JxcFNxNDhjb2RaSXJLRGMxNUdhR2FCdUVxZnpD?=
 =?utf-8?B?cnlNUS9DVmpUTUQ4VFpBUmZHYjIycThqamtmZUh3Y0E2Mm9ncHBWWFFKejJH?=
 =?utf-8?B?b25nN0JsLzN5cytRajBOdXVBa29uTGhXT20zNlFZaG9LcG45MVJqb1J3cEFC?=
 =?utf-8?B?bWxUUlZVYnZhQTAraHlNSE1LU29XZjRBVWlLazN3aGZJVFdON1pkQTd2THdM?=
 =?utf-8?B?TDJFekd2TkJuQmxHUUQzeGVaeGNzVnh4UlFadnhsaGhRRXl5UUU4SkVHdkRv?=
 =?utf-8?B?VlE1RUVzUndDS1FPcmR0Y001TUUwQ1ZPYnZpTmpVK2xOQTZvOTBwek5YZW1t?=
 =?utf-8?B?eVJKcStGblp6bUR2MDN6VjN5cjFDVGlZQWtwR0RxVzdlWXlYd1F4NVpiQXV4?=
 =?utf-8?B?TjRPUmtXK09Vd2JVamdFM0R3QmxYOE1SY1lSYVRmdVNrY0U4azU3VzJSK2hO?=
 =?utf-8?B?SnB1QUwvd0tNUjYyN0d1MWNyRlR5bmNKZjlydSsxTFpKVFR5cTUrbjJJNjBB?=
 =?utf-8?B?ZDlFTTl1OFNwbUZsb05mTW9seUd2Z2psMHVHL2xWaFJSbEdwK2NkWVErZlQ2?=
 =?utf-8?B?QTNrU1d4M0x4aE41ZjdSRmhsZy9vVkdvSlB1eG0zV25MdG41blZCN1BxaGRD?=
 =?utf-8?B?aU9GTDNvL1N1TE90T1NBV0JMaXBqcCtWM3hzLzlYemlXZE9od3Rwd1BwdzQ4?=
 =?utf-8?B?OHc1RVQvVlk0aDZLSGZ4ekVKZk5BNFl3VEM1Yyt3VkcwT1E4bkl1QlVJN0ZQ?=
 =?utf-8?B?QkRJUmE1dWcyN01Yd1hWSDQvZGoxc3Avd2dkN1g2Wm1BSFJIK29RNGF2enU1?=
 =?utf-8?B?dk1lSkxLUHZTdzdZeit1Y2lUOEI0Z0N2aGhPa3NndmhxNng0S3NmTm9WY1pC?=
 =?utf-8?B?OGNHWmF2aDFoUE1ZMzNnQ0lUbmhhM1lwUERMWTNKblZKWUczanJ5VFJCdEh1?=
 =?utf-8?B?S1N2cFRhblVwTTJyU2NTRXE2V3NmUlBsZVlJeUZacEFTYVBWY3I0dGF1K2ll?=
 =?utf-8?B?QVQ5VGVTTHhBSmpibjZ1TzZDRUtvR2JXN1puOGJvTG5rajBCQ0RBMGJRaXpv?=
 =?utf-8?B?ZDVmSkRiYWtIOU40WDUvTFViMm1MZ00rUWtmdGZXSHg1ZlRzUXZEbGlJTHVQ?=
 =?utf-8?B?dDZ1R05mWC9veTlNTlFTeTU2VngxV2lVSXlHOEVXWkt4SFcyUWZPODZsRXd0?=
 =?utf-8?B?WWVGTkxqbGMrNVVLYmdQUUsyZjZqeVdLYVRXd29pR1g1MlMxZmJsbklOOGY5?=
 =?utf-8?B?UXlSMVVpNjQ5TnNUTVl1L2VPQktnZlZKdHk2Ykd5QnloU1dvVDFzVzgza3ZH?=
 =?utf-8?B?T211RHduUnQ2RHRRR1NPaGtHYnkweVAzV1R0VENlLzJwNTRsdElmRnlLeU1I?=
 =?utf-8?B?dlRrSVp0VlIrME80bXlBWmYxQ3MxZ3FiWitEWGpINWN6ckhXQnJTYU01cmxq?=
 =?utf-8?B?RnJQZ29SNUF0N01nNlExYVVjTlFyQU03WjBqNkRrb3VWallQRUNFQWg2SkVt?=
 =?utf-8?B?K29ZQnhGS3JOWU00ckZOUlZYTUwrcVhRLzVRSVhJUlRMeEVWWDIzWFZlTGhn?=
 =?utf-8?B?dDB2YmN1L1Z5bnBYVTNncFAzMmJ6eUFKYkowTmNvWmxGbFNIN09RODBNZzZD?=
 =?utf-8?B?YXZ0RU1nMkFaWERaM2dzc0xyUWNzVDNoWkZ1NTlWa3JGYzhlTzlTOFk3eEVj?=
 =?utf-8?B?VDdVZ2J3bWVadTdoZXQyTGp0bnNWQUx6L0J5UTRZaXMwendXTEVQTGNZZVlq?=
 =?utf-8?B?aGwzV0Yvamg0MUx2Z1A3VTJiUXhqYzREWkF2ZVlxS2dkQkY3SVBnak1tNTdK?=
 =?utf-8?B?cXJiMTFhaE0yVEZKSFFrSmdTY1hrUkUrR2s0WndlRUxLV0xrREtiQVMrWVNQ?=
 =?utf-8?B?eDZmZi9xWXRucFhQUDZRc0xybkgrTE16QWtmS0J5K201YmJhYzMyRTJGRVlj?=
 =?utf-8?Q?pQWZPMfF/vo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WCtHWXZLZERvdWJLSzEvOEtYRHg5VElEOG9ibXRpRnlucW9MVVExZ0hVZUFq?=
 =?utf-8?B?ODVVZmZJMnVxSlVQOUlaUi9jQ3pvYUN5NFd3YngxYzJuVi9NYVV4VlhMWVVa?=
 =?utf-8?B?K0NtWVVYaWtFQjc2bkFkenkyQklTcjc4WjB5UlEraEJIbU5IT3NwNTVXR2g3?=
 =?utf-8?B?cVNrS3dvV1NLNFN0WU0zVUtiRmFJcnF5bHU5Z203b1NCRjNTWDJITlNySkh1?=
 =?utf-8?B?dVNsZUVsV3AzOVdKUXhJbDdZd1pyL09ydTNkZHVtQU84OGFFQzliZUVNNHZD?=
 =?utf-8?B?Z2xZbjZSMTN4Qy9nZC9ZNUFsd1JheFJjM0RHc1dpTTlmL05tQk10aGpscVB3?=
 =?utf-8?B?aEFkMEM5YnRHdTlGUVZFT0krRVVTMFB0Snh5MTlhaVdZckpGNkk3UXQxVDBW?=
 =?utf-8?B?TXA3M0k4d09rbTNSUno5cUx3WjhkamVqS3F4ekpXNW82YXVwajNJempobURQ?=
 =?utf-8?B?Y3ozbVlZOVFBd20yWmMxQ3ljOVU5TnRFZUVVMy9DdlNZekxWRDhYQ2RuVzhv?=
 =?utf-8?B?MWtBTnkrbHFIZ3o4WlJtZ1VZSWxHQXhhOXQrclNvYzNZdEk1eFdyc2I2VXdY?=
 =?utf-8?B?QWh6Zk9uWmVYVkM3MnlEaWZQSHl1RzRGM0kvcDl5T0dSQmNBZml2Zk1RYm1p?=
 =?utf-8?B?TmJVQkdvSm1SazhVOTF3YTF3NC81MkMvNWJxZ2t3WHFRZnFDV1Q5S0lhRHNx?=
 =?utf-8?B?akdxVUt3WlpEZE9RUmNBWGlPeXV3RFV0YW9VbmFmNWNibVJYYlZzQnJuelFE?=
 =?utf-8?B?RjJBTTZvVGs4UTJYTmtidHUzY0FHTjY4aTNNbUJWd1BGbm5nUEdGaDhiT2Vo?=
 =?utf-8?B?RHVxcXJBdTN1OXJnbTJZa1cyVUpXRGpCMUlNamJNSXd1MFo5WGtQeUVtdFNa?=
 =?utf-8?B?TUswNVZhSnFKanNQZEUvK0dFQWNIQjBrYzZMNnNkR3V6UnNvNWMyb08vWnM2?=
 =?utf-8?B?VWNjT2hwRTdJbzFoOHBsbmFuRGNRUUlWTFhkRDVIZ0JySjRRZzE1NU1SSzlu?=
 =?utf-8?B?OWZhZ3YrZkZjc3oxUldVYVFsYkdLZlhrZ2gvQXMxalplVTJMUTJiRTBiUzFE?=
 =?utf-8?B?NEtKOHlGQmdVT3lxZlh3K1poQ212VnZuZ3JlVEl6bGR6Rmh2dlhHMlhSSjd4?=
 =?utf-8?B?WVdBWXpXSDY0V01RelYvN011Yk8zN1BndVlaa29YcENUOHFtUGZYdTJGMDRH?=
 =?utf-8?B?UURTTHFIbU5QR3NicWRBQ2R1d0NITHdYT3JTMm9FV3lBY1RFL2lkY3BDTWlr?=
 =?utf-8?B?TDkrWHBEYmtoUk5SUnFjL29ZMHUrTE1SYzZoaGlLSk1JMU9IOVlFb01rTDhY?=
 =?utf-8?B?MENobkxPV1J2TDk0L01ubmZHbVczNHJGWWhYNDQ1Rytub3ZwTFFHYk5CeFo5?=
 =?utf-8?B?RGc0VXZxTjhnSEhVZ3RXN1IxVXdCQmdmblIvSGUrMlVUY3BuL1dBL1NhTTdl?=
 =?utf-8?B?VlVncTExMWR0dDU2RnBEMnkwa2xCMXBPSHMwb1N6eVJtRktkQVp1a2RQZUNk?=
 =?utf-8?B?cjBSU3k3YUxRSnRVNWVaN3pSdWk0TmtHMFVVR2xLZzBtMThtRFBXWVV5WFBS?=
 =?utf-8?B?NXZZSDJzdEV1MENxVWNQUlFIenhXejRjZGhMZm9BQUhiMndGcU5KZ0JHZzNV?=
 =?utf-8?B?N3MxOG9RVkZvYUVHdGc2K3dpd1Z5SmpmSlZ2dTlMNFE2c1d4STBSUVBsc1Zw?=
 =?utf-8?B?WGVpcXRNV3huVXQ3cmx5TnBJM1A3MG1wTC9yT2FHaFpLVEhSUC9pclIrMjAw?=
 =?utf-8?B?SlF5NDgwa0pwZzEzZkYwTFJaQlZSYmRCbTJyNFd2Nm1TdmdnTGhQc0pkVGdU?=
 =?utf-8?B?N1lLMU5Qd3JMYk4rZmlhY203aUlWeHBLR05HbXBuS0ZvSmhrblEzUjcxalVO?=
 =?utf-8?B?NE9udFFONFl0M3RJeld0YmsyNmlTTDRucVRSVVhzdm8wOURPZHNVVG5WZGhO?=
 =?utf-8?B?bW83cFpqR2hqUVlSL0l4OXlIWUI5dS9lc2V2WEU4c2FUTTY3VzUvMm5IV3RB?=
 =?utf-8?B?TC85SnBLcnM5ckpQM0RjMllhcVhIOHZITTZxQkVWM202bzJzR0RRYmJLUDNs?=
 =?utf-8?B?S29DQXFDRE45aDQ4L1k2YUZlQUhENjk4c0pTQVZ0TXVDWmVqZ2VmcmlybTJ1?=
 =?utf-8?Q?EvFvNjGLyXqJbd5GYpCjD6ytd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7efe4bfb-7618-4ff0-fdbc-08ddc8844955
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 18:27:45.0837 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w1A7/ZZnw3GtOBzSyFc9t3ZnGpmulsJoCvjHjgbiLyiY5iIkpclWNKh5A5DQNDQniOwHz/yVg6v/TXJRdpg9lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6272
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

Reviewed-by: Vitaly Prosyak  <vitaly.prosyak@amd.com>

On 2025-07-17 11:46, Alex Deucher wrote:
> The current limit (200), takes significantly longer with
> the improved reset code which the new code just kills the
> bad job, not all jobs in the queue.  This leads to the
> deadlock tests taking longer than expected and getting
> killed by the CI systems for taking too long.  Reduce
> the limit to 20.
>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> ---
>  lib/amdgpu/amd_deadlock_helpers.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
> index 49582b6c9..84635e043 100644
> --- a/lib/amdgpu/amd_deadlock_helpers.c
> +++ b/lib/amdgpu/amd_deadlock_helpers.c
> @@ -15,7 +15,7 @@
>  #include "amd_deadlock_helpers.h"
>  #include "lib/amdgpu/amd_command_submission.h"
>  
> -#define MAX_JOB_COUNT 200
> +#define MAX_JOB_COUNT 20
>  
>  #define MEMORY_OFFSET 256 /* wait for this memory to change */
>  struct thread_param {
