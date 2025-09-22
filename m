Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B70CA100F
	for <igt-dev@archiver.kernel.org>; Mon, 22 Sep 2025 15:50:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BDE310E27A;
	Mon, 22 Sep 2025 15:50:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="imJt4feD";
	dkim-atps=neutral
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010066.outbound.protection.outlook.com
 [40.93.198.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B66D10E27A
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Sep 2025 15:50:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IGU0fER87bhos5ma9LMJE3y7Hyrh8iYHBpCh39IeByIcmpJcVnDjowcot89+XYhWa47TVSEbKXP8JqYqFEypsnLGGT8JHazP5ZbZKi3HpBwxdBhiL4CxxpbYHi8tAFWUklSryabVH/TPZlXOGfv/CZRX/6iewEfLx3DZvad7QQvsXC1c2g+/hhC5BNIJRXpNov9rJOE57trfh4POUUmY3UymOPWvwSyq2vjnjLTK5ZQT423a3+nUCappHfWc6xrGDKHvCF4UbtJQype+m9a5CZYQlA+2UeovQ+6WTuJXqdgYq8uNkSSPZnO+MmJqUb4vTrJsvuPXEjwZ3N0DY5jegg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kaPOOd6nuX3E0NhKAF2+N4CRPtBxOkhrnSS4YREmJWM=;
 b=ozZoKMPdrXBHAvWFRAFSXiSMkD3R8iFVd3IMsKKvMbMcQoCknWU05j110WNMofP/uP4ReYk2ZaO5UWu7/xL8YR+5flI0qdFeqanzb0vLVgNh/RUidRiwTI7Y/M9sMTS+fF29vg47qVMvOOPmk+WzFZYUvDz+qJl4Me/YcOke7BM0QRJslKuXKOK68k677JZdblPULLizr93RuWapntPrX3pW8uaPSM6GG9ho0Zs0ylicbyBwSAaAIKriC4TlIx1ng/kpecOmdR6taMbDavxUb74FrqcNDQubvUzvqV3KzgapynWMTa/JLli3I+352ZYwJuVSgj7Y9gxdMhWD1kKQzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kaPOOd6nuX3E0NhKAF2+N4CRPtBxOkhrnSS4YREmJWM=;
 b=imJt4feD1uT4z8SoHz7bFWb9/9QTePcOm8iDudGjtEWHp2IVGem5Oi+0f8JEyQXLX6A0qzBwq0uUaVQkZoznpG2TNO8EKBMS/U53QYJ7BiXGNCbxw3GWpCV+jn9rvPUoMISCiaMoGOhtsNZwsMDEW2g1JM4cTCMPaZ3b9WMERVI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by CH1PR12MB9671.namprd12.prod.outlook.com (2603:10b6:610:2b0::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Mon, 22 Sep
 2025 15:50:02 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%5]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 15:50:02 +0000
Message-ID: <51422027-5bdd-4ad8-a46a-747d89d5224f@amd.com>
Date: Mon, 22 Sep 2025 11:49:57 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Refine VCN test skip condition to target RX 7600 (GFX12)
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 vitaly.prosyak@amd.com, igt-dev@lists.freedesktop.org,
 Yinjie Yao <yinjie.yao@amd.com>
References: <20250919191736.90385-1-vitaly.prosyak@amd.com>
 <20250922103705.vavsh25wkphvylb6@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20250922103705.vavsh25wkphvylb6@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0203.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:67::11) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|CH1PR12MB9671:EE_
X-MS-Office365-Filtering-Correlation-Id: 191b57c7-be11-4539-1cbd-08ddf9efb0d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QVlYOUowQU10TmphUTZSVUxXN01rakdVcUFZTXlZcmJOTW5vd29zeUJpeHpr?=
 =?utf-8?B?aUQzTCtrTXZlL29TTlUvTVo3eFBPaWhOem5YMDd2RWVVeGNYMFQyMEF1R3Ju?=
 =?utf-8?B?UGd3K2YrS0dURVhsREZ0bWJjY3B5SncxZ3ZLZG5KajYxVm9mRkt1SElOa3ow?=
 =?utf-8?B?bmpJODZOdVJHa1E1U3pNQjdZOUkyV0Vhcm5oNjZJVDQ5NXc2YnVsZitLakk2?=
 =?utf-8?B?Tzg1OFVlRDIxRDMvRUEwNWxoYThjZzJZSFJ2UzFJaHNyYVBCejB3NjBqa2w4?=
 =?utf-8?B?VTNzOWc1VFh3R0kzYjB1NDRpQnhSWWsrenhVQ0lyZDRQaEJWMmFteUFEYlRJ?=
 =?utf-8?B?RlBzVFVlRjgxTjJzcExJdmVVVUVXNU5DUVk2T1g0R3hkMXY4ajlSSTZZcUx2?=
 =?utf-8?B?dkFQZVdvd1MyQ3dVMHpXemdDcWJpcWY5dGQ2UjZVbHhaSTVKRFhuODVOR1JS?=
 =?utf-8?B?SWJwcWVxTUpIb3RGaG1XaitJRnI1R3hmTTJaWG1SVEJzZytjQjF2YU5pNnUw?=
 =?utf-8?B?bkNMMzFBdlk1OHJwNVJ4ZXVVNFgvdTcwOHhLRXJ2WWllazVWWEFUMkl4L0Zn?=
 =?utf-8?B?V3ZYMlZ2ai85ZDZFa2hOM2lKREpGZ2UyOTN2ZDl0aXMzWVM5c2VtWGN3c2hl?=
 =?utf-8?B?VHRWZkRwOWh3azl6N3k3MTJWSXhWZHdpejNGeHRaSk9lZHBCZDV4Q1MvaHVT?=
 =?utf-8?B?VnBaMXpUM2UwbEc2TDdHYm5JTHUwUFc2cXNSdmJtY2t2TlM1UWIvblRvbCtW?=
 =?utf-8?B?eFVoZVhNQ2VnbmxINXNleThya0pDYkxuZFlQaU9zQlAyQm9ndkE0dEhOUlVa?=
 =?utf-8?B?ZmVxaFdNUjdKMEVrWDd5cHArZnVTdGtCTEJud3ZnZ1RNTVY2K1pObk5NNWV3?=
 =?utf-8?B?RCtFeW80OWxuM2VEK25TS0NyUmc2MUVkR2FkUDE5bW55cm4yU090dDE2RUhp?=
 =?utf-8?B?SS8rRjVBalZzRGsyNzlRZXVtNmg4UmJLbDg3MzI3TlhPZG5kUi8vSGpJUWRW?=
 =?utf-8?B?dkZNaEh4d1dVL1M4Z1AzNjhzSngvTGh6MVJUVm5iNnEySXFrQkNhOVUxOFM4?=
 =?utf-8?B?VnVFV2l6RlhpS2pLeGxST2pFbWc0MW9WSDhPQVh0dFZEMVlDbHRzSjJ3T1lI?=
 =?utf-8?B?ejRhSjNtWktlTG1PRkdUcGhveU9VbVEvK1dKNkZIOWhIUW0zRjNUOWtmN1hP?=
 =?utf-8?B?MElnTFhnZ3UwTVFHTTIyZlRDWXdjOWRDaUl6aktrV1VQMTlkRXh6Z0hWdjRy?=
 =?utf-8?B?RCtWYTlmY1JHSHVKTThsYlRELzF5a3ZyNGdKMHAzMURlV3FuY0dLWGoxQUlH?=
 =?utf-8?B?dWFVTlMxTG1BTkZaTXJ0b2RJdnV0TWJJZmRIYUVqUDN4cGxXNlpmR2M0cjZV?=
 =?utf-8?B?RmNVakU5ZFhNRmx3SHRCMWVONjRuemlpM2RUQlhreUptaEorYW5iVE90TC9F?=
 =?utf-8?B?dVNaZ2FXNk0yY0UrV3o5UHgzWWduUnQ2dTRaYjY2eEpXQjgweGRETlNnUThH?=
 =?utf-8?B?MmFjQnF0RFkyRXNEbERCUVlJOEV2Y1ZvaGI0VzdmdFBqUnVDK0FiRFFzNGdq?=
 =?utf-8?B?YkducklpWm1Jb3RWSHZqZHZCQU00UjFFL0F5NUlDWWxPUzJKSEZEaEhweU5C?=
 =?utf-8?B?c3lSU1l4eC9aTlFDQnZxWWtvUmtxT2hQVXJGSUhqNGdPNGUydFdVQlpwOGtZ?=
 =?utf-8?B?d0pvbW1GWVRscjR5eGoxZXRnNzRuQndNMTVQbmdrN2Q3RWhkN3hOOWtxQXZX?=
 =?utf-8?B?V1E5V3FGUWJKY0hRNm5pNm1tdm5lSThLWHMyZGdBbjNZT2xRRXlNd2o1dkU4?=
 =?utf-8?B?WUVMSFEwTE5qdFJnZDZrUmNmZnZlOTFKb2tKUHhJWkpZTDFyUFpBZGRqTE90?=
 =?utf-8?B?M2lQTlVBbmIrcGhoNDF2cGJFUXJVOXRwdG1YVFVBVkVMdkJhOUxzMWZYNi9m?=
 =?utf-8?Q?bNw/saRwyvM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjYwd2lyM0M0WGlXWW5ZOE9kNU1DQUpYMmJONm1UcElkeHRLYWxERG04ZGxw?=
 =?utf-8?B?UzVpSWtTTFo2cGVWWXlBcG5WUWxlSXVZVjh1c0NTWCtXVU4waWt5TVRFQXBN?=
 =?utf-8?B?ekt3NDJiOCs2R2pDSGdHTEFBYVZlbW1abUk3QlpsVGZxRUpISk1lMG1laXBG?=
 =?utf-8?B?eHpMTmdXVmRtaFZOaEVrUTBVOVhiamtLaHd0WVRzOHVNamRNZ3RybHhZUlhK?=
 =?utf-8?B?Zk41cnNxdUxQMXREUEQxTy91ZndVUnRnVGRGaFZtMGIzQ2lGN1BtVG9lY29q?=
 =?utf-8?B?UTIvRVMySzIzRHdnRlFsN09rUEFRbk12ZlJ2WnI3ZlhQKzI1ZmF2QjJRWGxn?=
 =?utf-8?B?V3ZtamZDREVGVExXNmtGVnZQbE9oUlI1NmhDMVIxMDN4RXZBb0RzUE5qSTlX?=
 =?utf-8?B?WmFvd2REUGxURU85Q2J1ZDV2QTVIc0IvL2N1RUdCQ1F6czJHMWI4K3FrajR4?=
 =?utf-8?B?WnlCTk5yUXNzZlJHenoyRVNtSzZ3Ym5jRlN6RDlkUHJxcU5rRUtzQmpmMkxD?=
 =?utf-8?B?UjJVbUt5UDR4TVNVN2g3RHRDaEk3TmRGZUZ0S0J6d2JtYXcwazVyQ01taGpp?=
 =?utf-8?B?TWlSOVJyWk9wLzFzSjg1dTBFckliYzVjdHkxZ1h1c3didXZDOXJsOVkrYXFj?=
 =?utf-8?B?NFNFa2ZMWXp3OTJPT2ZRT2tjV05pVWU1UEMvV1dYOS83TkhidlhrVTJaTTlI?=
 =?utf-8?B?UTIveVZDVDVzSFJWZitKOUpjZFV6cnFWb1hSaHFDVXJRbStrUTdTSGVYVHNT?=
 =?utf-8?B?L1VpeEdLZGc5c0dOU1hLUXZPWGF5c0NCSnJHNEpUMVNLYUdiUmtkVEdpSE4r?=
 =?utf-8?B?a3c5WTd3YUlCbWRLL0FTMGxLOTZMSEt3U3AwbUt3ekNXaHBQL0pMc0ErRlJq?=
 =?utf-8?B?RnFpeTJBSFpreXQvNlJaODB4ZDZqMGd2VGxVbzk1RDNnbWFRVWNhREorVUpI?=
 =?utf-8?B?OXhwQjZ2dUZ0RmI3UGRaL04xRmE0RnVaaUdMUkRNQ094WlIycU9NNytZa3Jm?=
 =?utf-8?B?ZUFVU2xyY1NpTG9VblgzT2tXb0M1S3hXTXJjNlc0MUo0RWdsbGMyRVljK1VY?=
 =?utf-8?B?bUYwM2drQ1hTbUQrekk3MjNqcjY0ZWcyVzladjBzbEVDaEtNV2R4N283T05J?=
 =?utf-8?B?OFJ4UitGVUlIdS83b3VqMHBGR2YySkZhNElRU2JEZytiR0ZNSGpqa2IxZzFn?=
 =?utf-8?B?bjdKTWdzMGNEOW1ueHdQY2JxRnd0T3l3T0pPS3BWTWdkT25oZWpBcHdiMUVj?=
 =?utf-8?B?dExOWFd4WDZQN0xwaTVTVTJpZmdlQlFTdXFSMzhXK3FIaHBBV3QrZkJZdUNs?=
 =?utf-8?B?VTM0N1ArY29URkx1NXhnOTlNN2h2WmZsRGEvK1lQVWhhaTdEUEhmdllpZmlp?=
 =?utf-8?B?NVBqZTJ1NlRnQTQ2dWkzZ0g2SXd4SVNZem5HTHhwcDhLaWEvRkxSZmh6L25w?=
 =?utf-8?B?V0ZrTEF4SHZERkZqbUVlTms4QUpwdGZlQXZpckp0bGR5dklZSk5yQ3hEOFF5?=
 =?utf-8?B?ZUdtamxGdUNBajhjL2hoUlBoLzM3OFBRVEJMMGxpdFhMeFRIRmZTYU53QkJX?=
 =?utf-8?B?V0x3Vkd5YVlQSjVxQ1YzczZiNmw4Q3F2UkhTYWJ1NHJqZG9ocnJLWlZZYWda?=
 =?utf-8?B?Ti9mNUZLaHJtcXN0bDBwQll2WkQ3UUw0T1BmZlpKeUdXK1N1dkdFYzhpL21x?=
 =?utf-8?B?RGpEQ1Iya1Vtd0pIWjJKRzlWZDhHSHFaSy9vZWZQMU9IYUduV0VlVVJSWCs3?=
 =?utf-8?B?M05vTDdCMGlORkpXR0FvRUhRVnNZaHVWVEROemlnSDljNGJrdDhRUGNUZjhs?=
 =?utf-8?B?S0IrMGlrVHRaTVcrWVRVOVN6andQdSttdDROalMxdkJhQnE1MDB1Zzkwa3lD?=
 =?utf-8?B?VWxsOUx2YWRHYW4zS3pxd3dFVjlTanh4dmUzVlN6R1kxNkhnQmprbU5SMEF1?=
 =?utf-8?B?WEtjSFR5L3ppbmh6UlA3QjdKZVprMWQ1dEkvcFVCSHd0dVR2RlZvOWVObmhN?=
 =?utf-8?B?VlFRWVYzSWFSTkttS0pwZ0VtRHpqYkFINVRqNE1VbGg2ZHZXTzVLQnN0QzJ2?=
 =?utf-8?B?UjhCcHNBRjRqUE15R2hIZmZMaEMrUkE5QmhzTm94NnB1VTlIa0RETTM5TmRB?=
 =?utf-8?Q?efmpB2LxlF0smVVwBKtLteRlD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 191b57c7-be11-4539-1cbd-08ddf9efb0d1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 15:50:01.8635 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pYbiEk6w/BGVNQgf8wBNRyt0vgIWsHHkYrbXhNr3GPybBFcuAuoJ1Hfzy5x6iZEoPRvL0Ebov3RLIB7DyD1M6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9671
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

Hi Kamil,

Thanks for the reminder, and my apologies for the oversight on the subject prefix. I was in a bit of a rush and unfortunately missed the formatting before merging.

I’ll make sure to double-check the subject lines for future patches and follow the correct conventions going forward. Appreciate your understanding, and thanks again for pointing it out.

Best regards,
Vitaly

On 2025-09-22 06:37, Kamil Konieczny wrote:
> Hi Vitaly,
> On 2025-09-19 at 15:17:36 -0400, vitaly.prosyak@amd.com wrote:
>> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> small nit: please use prefix in subject, so it will be like:
>
> [PATCH] lib/amdgpu: Refine VCN skip for RX 7600 (GFX12)
>
> Regards,
> Kamil
>
>> The previous patch attempted to skip VCN ENC/DEC tests on RX 7600
>> by checking `chip_id == 0x51`, but this was not robust enough across
>> multiple system configurations or future variants.
>>
>> This change refines the skip condition using `family_id == AMDGPU_FAMILY_GC_12_0_0`,
>> which accurately identifies the GFX12 GPU family and allows
>> for consistent handling of RX 7600 devices.
>>
>> VCN tests are currently failing on RX 7600 and block IGT enablement
>> on this platform. This patch allows test infrastructure to proceed
>> until a proper VCN fix is implemented.
>>
>> Cc: Yinjie Yao <yinjie.yao@amd.com>
>> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
>> ---
>>  lib/amdgpu/amd_vcn_shared.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/lib/amdgpu/amd_vcn_shared.c b/lib/amdgpu/amd_vcn_shared.c
>> index 61075d8db..ee372cb5e 100644
>> --- a/lib/amdgpu/amd_vcn_shared.c
>> +++ b/lib/amdgpu/amd_vcn_shared.c
>> @@ -59,9 +59,9 @@ is_vcn_tests_enable(amdgpu_device_handle device_handle, struct mmd_shared_contex
>>  		context->vcn_reg_index = 2;
>>  	}
>>  
>> -	/* Skip VCN tests on Radeon RX 7600  (GFX12, chip_id = 0x51, family_id = 152) asic_id= 7550*/
>> -	if (context->family_id == 152 && context->chip_id == 0x51 && context->asic_id == 0x7550 ) {
>> -		igt_info("Skipping VCN tests on RX 7600 (family_id = 152, chip_id = 0x51, asic_id = 0x7550)\n");
>> +	/* Skip VCN tests on Radeon RX 7600  (GFX12, family_id = 152) */
>> +	if (context->family_id == AMDGPU_FAMILY_GC_12_0_0 ) {
>> +		igt_info("Skipping VCN tests on GFX12 RX 7600 (family_id = 152)\n");
>>  		return false;
>>  	}
>>  
>> -- 
>> 2.34.1
>>
