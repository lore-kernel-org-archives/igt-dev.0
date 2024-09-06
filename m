Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8370FE6FE4C
	for <igt-dev@archiver.kernel.org>; Fri,  6 Sep 2024 22:39:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3102C10EB1D;
	Fri,  6 Sep 2024 22:39:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XAAJCWAL";
	dkim-atps=neutral
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2084.outbound.protection.outlook.com [40.107.101.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC83C10EB1D
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Sep 2024 22:39:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vKY28pwf67rOY4yQXdo9xfNVU+Y2o1ixpS873ychfSQnp7vBw/ibzlOh7LwHp55ApKI/rQ3ds+Ekae8Nmkao+aypF7JH0Bh8EA6uDBTUbux8bEJnoizbWlJIUSqna1a9Ns7ugNf5DvdS4bVHnoyra0+sQReEL6GH5RGVRb6UyPhsB4p5/QJn51UtyLIYpYyCyd8tlvl+XQfVFAjMZeyMrk95isIriaJSGHYYxaFxClA34UhSXCUZlon4/crNdXtcRu050ozxAeb9ZqmCrG3FMjToY7G5oHBZcL3lqHOyHfrwhnJ9Y+jl3p1I6MLC4GEE4V//9xWoSWaTrSSBKSqYWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PS3d+wN+N4hJENjUYlquAAvvXt2b3jhUvbxW7dk8T2U=;
 b=jjj6nQtT3ne5J/mKl8jPOxDOIDKk50oPt6iwYkO+p6tdg7EZ7E4zpyXnGQD1H2rEzr/qk65rFndB+1YlCTCELSK1jvQAreOsmnzdap7pkJOubn0jxPpUt2PfmL6Y4HAG+AronIkhdMAF4L5M6uR8WKsdIy0fnFaMqZo3GT2rHehP8wb5Ld1g4zAY/AgpIvAvXPBlCyrEuYFBvW3kthAKTfndHDqLPZjuFBv9/6bJlDugLfjoM1WzNRQ5YyUecn9J5ruOYZip8bH36A8S30bte2nO1xHVMU6UEyHbher/t5rxW2F19G36ARb/rhqgCIBPybM5FAe+VK3NhCw93DYOuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PS3d+wN+N4hJENjUYlquAAvvXt2b3jhUvbxW7dk8T2U=;
 b=XAAJCWALtrEF4MgSSE4HFg5pdyZmmgHL/Di8YSrV4gBRLpuqabR9RDlNzh3Zn0iRrc3GaQb3DWfsNGR2sh39K1WERczl0ZjBbfDNOPemPzd82es7yT3DWdvVy4XXFnX1875LrPQ6LmjLgUNJKa7ZlxAbSVNtR04X3etotDPxYg8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by CH3PR12MB8187.namprd12.prod.outlook.com (2603:10b6:610:125::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Fri, 6 Sep
 2024 22:39:36 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%5]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 22:39:34 +0000
Message-ID: <4f055ab6-ec94-453c-91fa-c012f193e497@amd.com>
Date: Fri, 6 Sep 2024 18:39:30 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/amdgpu: fix concurrent queue test issue
To: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20240906021334.1085959-1-jesse.zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20240906021334.1085959-1-jesse.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0273.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::22) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|CH3PR12MB8187:EE_
X-MS-Office365-Filtering-Correlation-Id: 77eff472-ab7b-4a9c-8bf4-08dccec4c7cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YVl4czY3TEpjMmJCVG9pbTI1dnR5TDl1MVFLMkw4Qnl3TTJsMGp1TW1ieStR?=
 =?utf-8?B?c1lxekhBU2pyYVh6MWxvR0RCM1diZS8rNUVENXh2NFFmQXZnZkN2NTQ4SWJJ?=
 =?utf-8?B?WU0zZUIrSTJQcUtzUm9jNTc5Vy9lL3J3eTlSL1Q4K1BGR2w5N1pNdjNqNDBy?=
 =?utf-8?B?eHhHWWsrTHQ3S2ZKd1ZIa1NmaDVVMWhMNWxRcGF4NGttalVFbDdDbnhkZGo0?=
 =?utf-8?B?am8xRjhXMEN3anlwV1QzWmsvMnJZRnoyOTBOMTdvYThLS0UyN09LMVNwUFFK?=
 =?utf-8?B?VlloaldaUFlCSkxyaU5JZUt6WGNaZ1FBY3NaT3ZQektnZ1FKc2t4djBzZWov?=
 =?utf-8?B?clg5d3Y5eWR3UlRhZGFyUmNOKzVyYjF3NllDcUJNRlBxQy9FbnBqNmgways1?=
 =?utf-8?B?ZmhyY3BJOGtUZEh2cDZGcEpxV3dPUHczTC9yeVRsSkxmYWN5dGwyTlI2dFZ6?=
 =?utf-8?B?NlFxaGl0ZGt5c3k5YVkvZ1RMRzBXVnZzZ3pkK09NQVE0TVV2QWhtbHpuQzBz?=
 =?utf-8?B?S0FCL0pJbStYQngvMTArYVVGemVzQnNraldCR2Z4TkNSejdVdDA2dUZXcDJ1?=
 =?utf-8?B?b01MKy9nRzhzSG1WUTF1M0c1RHFTdWxYd09zZjBLbjJES1VoS3pCblRDOXZ0?=
 =?utf-8?B?WWs3MWJ1Nmx6VTJWV25FNFZvWWtYMmxGOGRldjdRWVVzQnRMZFdGb2llaTdj?=
 =?utf-8?B?SVJMVjYwSzh2L0JUbzFUYmFKakhkbFBSZXpCbG5qdjFqK2FTeHhmYitKVlhZ?=
 =?utf-8?B?a1czZittYk5sS0VBT013SEp0QTFhUHZVZFBKYlI5aFV2cXFKLzl4SXl5ME5W?=
 =?utf-8?B?clZ0ZjVHeXppMkF6aGFVWWNXOUlndC92VjdiM1AvVjVlTThvUjhHMTB4OURB?=
 =?utf-8?B?RlA4N3dqclo0Q1pQSXpldVVGY25BeFVJUzJmek5IdWVnK2dxNURBT2NTa3dU?=
 =?utf-8?B?elBpZitQQlhUcy9OUVFuYXRIQ3FIRVJxWjZMOWJueDZ3MmdtYWhSZWlodkZF?=
 =?utf-8?B?Q2p4YlcyQjhOSlp2UjA2dHB3bFA5R0VOb1VkZTU2bnZ4bGZPdEVFZkZDRzQv?=
 =?utf-8?B?NWZsRGFLT2NaN3dZOGJ5bnZiZnF3VG9ZTkduN1U0QTlmMmZqMzQzSU9YVFlt?=
 =?utf-8?B?ekxJb1BxUmZkOEx3eFJzUkRJTXRtNmQxWmsxcmlsRFJrYWRjNFRGcUlhdnBN?=
 =?utf-8?B?cjNOMEIxbGZnMG5uNlR2MzEzdjdXZlFZeEhOc0lEaFpScGxiQTlxWFYycncv?=
 =?utf-8?B?THR6UktmaER5c3hZZDRjQjBQQ2xEeVFYVjMweFBFYnEyRnVWSVJKV1RRMEhY?=
 =?utf-8?B?UFoyOVl6blZBQWRkaWRKYUpTU3FIWU12R3YzNUI5QVdxVER6WGpzNkkweWtw?=
 =?utf-8?B?bDF6YldVeFlHRTdpR1I4M01FRjhNZ2xHWWtlbXkvU2g1YTc1NkhYNEY3WXBB?=
 =?utf-8?B?ODluRUdOVlQzcXgwU2ZuMWgzd01FdzF1RExrdi9LbDQ5d1FpR0dFemt6L0hp?=
 =?utf-8?B?Q1lIVzBBcXgrWFZlL1RWZCtZd3Flc3BhMW4xbHdObXF6dW5sQmVXN0lxRElF?=
 =?utf-8?B?L1laY0xEVVFpbTEvaGZCMWRSRUY3TXUxd1VTenMzR25TMGZRaVdKVDZzOVA3?=
 =?utf-8?B?MHBJRm5VOVhjSlFXSjc3K2NDbzhrZ2dWeW1hMVA0WjBZYko5MnhpUGViaTRX?=
 =?utf-8?B?WjQrc2tyRFBCelhSVVJ3TnJsWmk2R211d2dTL1lNT1hlRkExb1R0ZFNYWHJP?=
 =?utf-8?B?NjREdnVWSUMzSVVoK05BMC8vdFVDYnRTT21hT3RCWHF4TytidktseVpLck1E?=
 =?utf-8?B?d1QvK3FpZUtSMkJTbFJkZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WE5YanlvM2xMUURBNVE1YUhsU3YzK09jNnA3WXVVK29nbk01U2t6bE8rRHdo?=
 =?utf-8?B?R3Y5dUw2YkNKRmZRNGdMU2d5eWZLdFplazEybkJkTU8wYWNLbDJRQkFxVkJ2?=
 =?utf-8?B?QmpEbjY4NlV2TTYyNVZhYVduQ3JNbncxVWw4MTBZNVAwWUdpMnlkcWpudzNv?=
 =?utf-8?B?WGdEcEJtZkhuVEQ4WlVzRi9Sdkk4aCtJUGtzYzNCRkNUUXZ0OHlEUmNjNzNV?=
 =?utf-8?B?bEdTaXlLbTN5TDhMNU1vRGhJUzRmaDJ0RExWQy8wY3NwYU9mN2sxelp6c1hC?=
 =?utf-8?B?K3oyUG9iRGlwM0JIak5FaG84Y1kwclJXT0VlYjhQbmdCbXVSOU5RZERnWU5i?=
 =?utf-8?B?K0hsR2xHdHFtaTZtcmR0clFlTnlVaDYyS01uRWhUVmdpT1loNndhTzdGY21w?=
 =?utf-8?B?ZEY2ZWZ5dmFwRnRrbjd3VDBROC8wYlZZcjVvNnpTaUFBams3NmxMb0xqVmQ1?=
 =?utf-8?B?ekxuSFRib0hCbk1qenFKeXVVTDFIbDZNWXBmN3EzdFZ6R2VHOGpwUzhjN3Q1?=
 =?utf-8?B?Tndwa2JYd0xVb2tMS1hPWGhFOE5qSHVoVmxaMFU3SlAwYlpCTDNwN3Z4U1JQ?=
 =?utf-8?B?OVAyZ2I2NG44MDJsQjVZd0x5TEZkdWxQZ0JVNWovcGNyc2IxQUs2Wjlyd25O?=
 =?utf-8?B?Q2JmckdxQWNFbmdLR2t0a21ZL25vTFdnSUR1MFB1RUFnODZ5eVhEUHBDb3pR?=
 =?utf-8?B?dldGMStMRDN2THFSZlhJMTVzZm9Kd3Rqd2FySUhJSG5KWG1DczV2TTJaR3Rx?=
 =?utf-8?B?dUcwVnVpSDdUMldVaVlua3N1bTlKT1FicTQ5ZjlKMWErWjZnNjlaVXBiNnpZ?=
 =?utf-8?B?UzVYb2IrY1BQMWNhTUI1ZlZHekd1OC9nSFcwNnByZks1NTRqakRsTWhXamtG?=
 =?utf-8?B?NWgxZm4vampES0M3UmNYdEdLWUpCSWVmN0Iva3c5M29lZDJmR0N1OGdtYTlO?=
 =?utf-8?B?SVNua1RZeFptbU1aVmJ4N1lubDUybE9UWmdSVnhtdDBGWFh5QUVlK3llSnlh?=
 =?utf-8?B?YmRwZFFmM01PNTlIaDBldGhURTJ2YWFMSDNSak1RaTB2bkhVOThxeFV3QXIr?=
 =?utf-8?B?KzRpTUVYcUdlM3JZVmZLSm1zL2RNckl5RDNtYk8vdC8wYmtTSUZENzNtTzZT?=
 =?utf-8?B?M1FIaVE4cVRqemd2ZkM5eXg0MHdZQ3RmWlpMaTV3b04rNUFlRmM4bXdXUWxE?=
 =?utf-8?B?TG9sSlFKanpUQkxPbjhIVXZhZmJ4RUljZFl4c3JEL2puVUx3RGNVMVdxb3Q3?=
 =?utf-8?B?dnhJZTZmVkcxc2FHNlZ3bXNGbXBNcGJTSHJPbG5uYkRJRDl6SWl0cEdyWEw3?=
 =?utf-8?B?REtmUE1JUUxrbWE1dWJ1aEkxdmwwcWJqWitmOThPS0o5SVV5ckVBZC9XYzNY?=
 =?utf-8?B?V3VOZUplZ3ZwOXNiZ1ZDZlRZVjFqNyt1ditvd3IxMVU0ZnhZUkg5a1JaRXkr?=
 =?utf-8?B?R2xlMmZwczgwTUJtNHJmeEJ4ejlPenZVM2c2N285NzlCTUZzVHFaWDdZRHlS?=
 =?utf-8?B?Uy84dGdaVS9ndEdlc3RYclh5SlQ3N1UrWjJZQklWOVFYaTNOTTU0UkpTRFpt?=
 =?utf-8?B?VFQvUUd0WE5PNmE4dlJibHZJVVJ6WUJrcTVUUFREZ2h6S2tTTjkvQUM3Zkgy?=
 =?utf-8?B?Z3lIV1hHQlhmeXNyYzNUVmNTV3VMR0pSMGpINzFQY3F4MFhyVDY0amI3Z3dK?=
 =?utf-8?B?UVZWQ21RUHdJWWVKZlh4dkx0b2Y4RmZiMGFSa1FIeTFpcmtJZjdMY2VHRU1F?=
 =?utf-8?B?dlVmMU1nQjF1Q1Q1VWV3V0l0Z3BHQUhDczg2RGwwNTV1ZHRuWGVPVE40cUJ2?=
 =?utf-8?B?d1lva3BPUElLZkd5cTlBMzJHNXVTVkp3ZDBQYnl4bW1yWVRFMHdlMHFxNGhy?=
 =?utf-8?B?a0ZOWk9QZmlsOW5HWWhpTGxMYWFISXhLa0RQSktEQU9rSlAya3JyQXdmVlZU?=
 =?utf-8?B?a3IyUkdSVVVxcGNacnI4Zmh0bnRqanFPWXlOd2tXZStuQ1BXTTZhZzBwb3dT?=
 =?utf-8?B?TVhTeDJtVHV0ZjRJaVZWdldkNTkvQlB1SzYxemJDdnZRSTJFQm9wRlZRUUkx?=
 =?utf-8?B?N3Y0Qk1TejBBb1cyOEhRc0kwbFJUejBkaHZqVkJHYWpXcitSQ0VVV3lDVGtB?=
 =?utf-8?Q?h2EMzklObYf91J/tTXPSogV3X?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77eff472-ab7b-4a9c-8bf4-08dccec4c7cf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 22:39:34.4316 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BkIzxPnqSh40TBSQEAg2UVj59kvFC1N87mfGjdYdXgfL8bBK3T9cMxN1Vdgv0BWpaZXjmfo7Y3Yxpj6w+PRFXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8187
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

The change looks good to me. 

Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

On 2024-09-05 22:13, Jesse.zhang@amd.com wrote:
> When running with parameter --device on multiple cards simultaneously.
> All queue test processes will share "/queue_reset_shm",which will create conflicts.
> such as:
> sudo ./tests/amdgpu/amd_queue_reset --device drm:/dev/dri/card0
> sudo ./tests/amdgpu/amd_queue_reset --device drm:/dev/dri/card1
>
> To solve this problem. It should open a unique shared memory for different devices.
>
> Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
> Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> ---
>  tests/amdgpu/amd_queue_reset.c | 42 +++++++++++++++++++++++++++-------
>  1 file changed, 34 insertions(+), 8 deletions(-)
>
> diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
> index 537f653f9..8f5c7d4b8 100644
> --- a/tests/amdgpu/amd_queue_reset.c
> +++ b/tests/amdgpu/amd_queue_reset.c
> @@ -32,7 +32,6 @@
>  
>  #define SHARED_CHILD_DESCRIPTOR 3
>  
> -#define SHARED_MEM_NAME  "/queue_reset_shm"
>  #define TEST_TIMEOUT 100 //100 seconds
>  
>  enum  process_type {
> @@ -349,7 +348,7 @@ static void set_next_test_to_skip(struct shmbuf *sh_mem)
>  }
>  
>  static int
> -shared_mem_destroy(struct shmbuf *shmp, int shm_fd, bool unmap)
> +shared_mem_destroy(struct shmbuf *shmp, int shm_fd, bool unmap, char shm_name[256])
>  {
>  	int ret = 0;
>  
> @@ -363,20 +362,20 @@ shared_mem_destroy(struct shmbuf *shmp, int shm_fd, bool unmap)
>  	if (shm_fd > 0)
>  		close(shm_fd);
>  
> -	shm_unlink(SHARED_MEM_NAME);
> +	shm_unlink(shm_name);
>  
>  	return ret;
>  }
>  
>  static int
> -shared_mem_create(struct shmbuf **ppbuf)
> +shared_mem_create(struct shmbuf **ppbuf, char shm_name[256])
>  {
>  	int shm_fd = -1;
>  	struct shmbuf *shmp = NULL;
>  	bool unmap = false;
>  
>  	// Create a shared memory object
> -	shm_fd = shm_open(SHARED_MEM_NAME, O_CREAT | O_RDWR, 0666);
> +	shm_fd = shm_open(shm_name, O_CREAT | O_RDWR, 0666);
>  	if (shm_fd == -1)
>  		goto error;
>  
> @@ -414,7 +413,7 @@ shared_mem_create(struct shmbuf **ppbuf)
>  	return shm_fd;
>  
>  error:
> -	shared_mem_destroy(shmp,  shm_fd,  unmap);
> +	shared_mem_destroy(shmp,  shm_fd,  unmap, shm_name);
>  	return shm_fd;
>  }
>  
> @@ -877,6 +876,29 @@ is_run_subtest_parameter_found(int argc, char **argv)
>  	return ret;
>  }
>  
> +#define ONDEVICE	"--device"
> +static int
> +is_run_device_parameter_found(int argc, char **argv)
> +{
> +	int i;
> +	int res = 0;
> +	char *p = NULL;
> +
> +	for (i = 1; i < argc; i++) {
> +		if (strcmp(ONDEVICE, argv[i]) == 0) {
> +			/* Get the sum for a specific device as a unique identifier */
> +			p = argv[i+1];
> +			while(*p){
> +			  res += *p;
> +			  p++;
> +			}
> +			break;
> +		}
> +	}
> +
> +	return res;
> +}
> +
>  
>  static bool
>  add_background_parameter(int *pargc, char **argv)
> @@ -1041,6 +1063,7 @@ igt_main
>  	struct shmbuf *sh_mem = NULL;
>  
>  	int r;
> +	char shm_name[256] = {0};
>  	bool arr_cap[AMD_IP_MAX] = {0};
>  	unsigned int ring_id_good;
>  	unsigned int ring_id_bad;
> @@ -1100,6 +1123,9 @@ igt_main
>  		else
>  			const_num_of_tests = (sizeof(arr_err)/sizeof(struct dynamic_test) - 1) * ARRAY_SIZE(ip_tests);
>  
> +		r = is_run_device_parameter_found(argc, argv);
> +		snprintf(shm_name,sizeof(shm_name),"/queue_reset_shm_%d",r);
> +
>  		fd = drm_open_driver(DRIVER_AMDGPU);
>  
>  		err = amdgpu_device_initialize(fd, &major, &minor, &device);
> @@ -1121,7 +1147,7 @@ igt_main
>  
>  		if (!is_background_parameter_found(argc, argv)) {
>  			add_background_parameter(&argc, argv);
> -			fd_shm = shared_mem_create(&sh_mem);
> +			fd_shm = shared_mem_create(&sh_mem, shm_name);
>  			igt_require(fd_shm != -1);
>  			launch_background_process(argc, argv, path, &pid_background, fd_shm);
>  			process = PROCESS_TEST;
> @@ -1169,7 +1195,7 @@ igt_main
>  		free_contexts(device, arr_context_handle, const_num_of_tests);
>  		amdgpu_device_deinitialize(device);
>  		drm_close_driver(fd);
> -		shared_mem_destroy(sh_mem, fd_shm, true);
> +		shared_mem_destroy(sh_mem, fd_shm, true, shm_name);
>  		posix_spawn_file_actions_destroy(&action);
>  
>  		free_command_line(argc, argv, path);
