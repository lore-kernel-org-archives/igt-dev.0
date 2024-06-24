Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B880BC2BD05
	for <igt-dev@archiver.kernel.org>; Mon, 24 Jun 2024 09:44:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 587CE10E3DB;
	Mon, 24 Jun 2024 09:44:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ogW1BZoS";
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2040.outbound.protection.outlook.com [40.107.92.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5866110E3DC
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Jun 2024 09:44:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GYiHR7NpULzRIZ5IYJrumvP6bPeBh9a75UONWtoAwXUJonnV2v7ommAdiwMQjOOnUiurs9F+57hs+7qhd3xzzIS3sQ+tYj39p9JacTTPdQma6ro/imPH/WVon+I1ihymsuZHXbookIYhcOC7T8tuRBim4hgtQ5ku62Z6PZta8qshzvEGDf2VsxG5nPmwac0hme5XFQy3lkbfpaBVvmelPeXG009VLfypkTJMQxWSHOgFsG3y4EIDlBtgHEU4CA5ewvvRFjarmUF6heHtGxT2/z8WEXYHoWYyEOt5r9dtiM9FhpiMNi4DSMdY1eNGl40DwHDR4dhJJboHt6E3EBu2zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e+x6tAOn7JbKBXnid9sEKa7egbClF4MBPLcWhTZSRcQ=;
 b=esWIosiQtcdFEM5yyea/8HTKK7qT9rhscRdbjlNOx/naPiOk7j8L3M8IUeqhdC19WwwBPUG2CNqtDNkZ+xSEBc7e8s6ft4FOa3yCpGFEIpZWS8huknAA9wIRmVN4OBaCXq4MPZ22r+vYiA7VcEEzwH/xKWiXn3JLWX/MxKl7rzBjZsbgN/finGDH0QMksSj+G+zp453SrfqahE/sGupoOSq4aFTX+HcXnwC9FzKXXlXzpoclrFkRRQGZqkKe/XgnEkp2ous4jEy+ak/Q4kKADegF9cF3GmRBrV9QNcfwCrjKyAMEJ0MZu6v9ZmaWul2jgFk05MkXh2T2d5cFFsaD5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e+x6tAOn7JbKBXnid9sEKa7egbClF4MBPLcWhTZSRcQ=;
 b=ogW1BZoSyzXxJrxLNM6rwCnSUFmN5r8zNuVZpXfvDN4Q8cyFA/resNk4ufKl19NnmmSb17Il5owWoEsMDeREB7AZwzXs8wpCFro16MVVAb1K3UM6uoqjsKP5SZA6cKW9dWrvy1qOmOckk1sYUdjJiJNQxik0Ja1SZq9MBHOzjWg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM6PR12MB4252.namprd12.prod.outlook.com (2603:10b6:5:211::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.24; Mon, 24 Jun
 2024 09:44:42 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 09:44:40 +0000
Message-ID: <a4022941-78b3-47cf-a6d0-579b8dd8318d@amd.com>
Date: Mon, 24 Jun 2024 11:44:35 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tests/amdgpu/gang_cs: skip test for some chips
To: vitaly.prosyak@amd.com, igt-dev@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jesse Zhang <Jesse.Zhang@amd.com>
References: <20240622225216.108985-1-vitaly.prosyak@amd.com>
 <20240622225216.108985-2-vitaly.prosyak@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240622225216.108985-2-vitaly.prosyak@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM6PR12MB4252:EE_
X-MS-Office365-Filtering-Correlation-Id: 81223df2-fd70-4995-8cf1-08dc943244d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eSs2QVFGTUVQa1VrR05oeFErZUx2dFJOR2hxNFJyWDhzSXVLMk5NRzVudGhq?=
 =?utf-8?B?ZWxocDloVEloaXBadzNSOVVqZ3M5U2plbEZidnMvYUxKY2pWR1BqanJGeEs2?=
 =?utf-8?B?TU5JMk9iYUQ1OXlJaGc4VnhlcjRiSWQyWk9DUnVuc3YybUtncWh3QmlzWEVI?=
 =?utf-8?B?L04wbzdhcC9XNlMyc2Y2SnlHeWVKNWVNRHpvWnRrZzlsbk5mQUR6RWVxSVJi?=
 =?utf-8?B?QnZMeGFLbkxKT29pYU9qQUV1VllCZVNXaWk1VHc4bGxiZmZzNjRURnVYZFZl?=
 =?utf-8?B?YkZvZi8rQ0VGS2YwaFBrWjViOTNZbmp2eVpBWUVIbm9GcGYwV2VqT0RpQU43?=
 =?utf-8?B?d05xUklBYXNrK2NKa0ZBVDhNcGxucXdnUlN4MjhzZTBidDY3cWxsc1pvZW13?=
 =?utf-8?B?Z0pFZGRWMkdxeHFOUlgwQXNQVEtFMHJPS0FJQVY5Q29pWFV6c0NQb1BVZTF5?=
 =?utf-8?B?ZkdhK09EYWltQ2hFTXc5NlVJUFpENUV4M0oyeVhPQkVVSk1SekJSZitMb0FX?=
 =?utf-8?B?ZVJENUhTQ1Fvck8wYThETWkzUnVXekg0R1FpK24yWTdGbmE1c01pcmZjU3N6?=
 =?utf-8?B?ZlFiZVQ4bXdmVGEyR3ZoVDZJZGNtelQrUHVZaHF4cnU0SUhpOERWdHZscGVL?=
 =?utf-8?B?UW90MHFER01WeUxoWWRCYlNzUWVYZ3RXSDNpN01SNVRldEZMVy9NN2l2UzNy?=
 =?utf-8?B?VjMwZjRHYm1WTmZkQjBRZ3NtcFVqdHpHWHV3ZTNJOVVPV0o3d29sRjVpRHJv?=
 =?utf-8?B?ZTNvNTAwTUxnQks5YUJSaFkvcW9NcnFpaTRvVEdDOGlzakFrc09oaUNhMWtB?=
 =?utf-8?B?U1lhM0NVVWE1aVg2dGFudzlBQ1dkYVc2UERYMlM4SDZDSWtGZ2l5cWJ3bVp2?=
 =?utf-8?B?cE11WW00WHNrSXp0UEJ1Nk45cFlVSTVQbWUyK2t0SEtxSTJjTDJmcWtGOUZt?=
 =?utf-8?B?WVI1NlJPUVVXdENvMEhaSHpEUFJ1NCttUnJDZDFHOFBBRmNzSVpmVGdoMmZ1?=
 =?utf-8?B?dW1NRjdHMkRVY3hwVFJmZGdJb2JXYXFmSkc0bFFtWWpJUjVDb1ZtNDFMTDRk?=
 =?utf-8?B?U3JrcXc3SDZzMXpXRi9pQ05uZytuU0VhQ2N2Q1BpeVIzZU9GbG1TaWdkL240?=
 =?utf-8?B?SjMyaG1wVFJnYlF0QmJsVEN6alF6RjN2d0tvYm56R1UxTWlTZWpxM2llYVNj?=
 =?utf-8?B?YkhDWW9CR3p2RnlhYkdYZmdYV3hWV2VRR2IrVjdvQ2YreCt2a3hsQ1dqREE3?=
 =?utf-8?B?dzl2ZWVkemhnZnJZdDN4dDNMZnByQU4wSEEreDZHdmJsWnZjTjRveUw0MS9k?=
 =?utf-8?B?eWZoMXdnaEdUd3NNWXhEZVYvZWFOVGluMEhhdmZ3azJ0aERBRmk3TXprQTZX?=
 =?utf-8?B?UWVKZjl4YW1aMDdiWlJVV0d3R1ZDOStnTXFTUHJjTk40VGd0QkpzYnJkNWZG?=
 =?utf-8?B?SmtrUWc1bytTUXFpQ3IrOWcwc04zcERUdTNHS3lDLzhpQUJDR0RkM3ZFQmlj?=
 =?utf-8?B?b3dGcGN3Q3BRYTl3Njd2TGZRdGZXVk9rQXp2cDM4TDhLSy9LbTZyT2N2MnFU?=
 =?utf-8?B?dGJzVDAza1RSMnVRNXhWQlIwQlZQSHZMbFlZWEU5NjVGQzFkYXJMUEJEWTg3?=
 =?utf-8?B?UnFkYU5lbEdOQmpvQmI2UWdIaS9uZi9zOW5TQ2hjL0xkdWEzZ3J3UEExOXRC?=
 =?utf-8?B?OGJXbmZxbVBsSjgxd3RiY3FNMGlhSDJsdzVNSUc3QVIxMitxTUFvYzZwVDVN?=
 =?utf-8?Q?Aa28N5Ux6adJl3wR3Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWlYdkZyT2dWbUdSWFZ1T3k0WUVlTTRUQmpCOWswRW5DdXlYa093QnFQRlAz?=
 =?utf-8?B?YmcrWXpWZUY2UU9lcFVNZmttOHZ0WnVQamhwa1RJVjN6UTAzNjhLZnVwUzh0?=
 =?utf-8?B?YmJsZ0R5bFBWQml5dDc3OGpqTW96VjBMampLNW40cmpjR3pmbGhlL2NaQll0?=
 =?utf-8?B?OWVKZTZRN2UrZ09CSU5VYjNsaFgzeDZkQWhnNG52dnRyMWRnRjhBeVc2Ulpo?=
 =?utf-8?B?WUd3anluNmZsNGpVbkx1elIrMmhTQ1J4YjhYTGJRNDhpVTZRaEZXY0hUeC9X?=
 =?utf-8?B?V2JZdXNFTDlhRXFDQWg1NkY5S2RPdDNBUnV1UnNCZjIwa2xHSXB5WFFRMTh5?=
 =?utf-8?B?TVFwdDhjcC8wTHdlK29kRnFmTTdhcEYvSURISXhzVG11ZEI1Y29CK3dseFll?=
 =?utf-8?B?U3hzYVlhZlFiUTVxdWVtWWc4V2d2dTJPYlBkYkpCRE9XeUYyTUtPZ2ZKQWdq?=
 =?utf-8?B?M0pHVnM0TnJ2VlJGV1h3Wk9DSXFYZmhtTWxwUk51VTZnWnEwaFJDb21UVm11?=
 =?utf-8?B?bHRaN1lvQzBoWHYrL2JRZnJJZDIvZFBUbEZLVjVmSWVoTk9BQWtsYVBSMXJ0?=
 =?utf-8?B?RkNDRlNjcUFoWFdTcENBTzJkTGNkM29vUzJydTFpOXRHZDBMdU1DbzhpLzlF?=
 =?utf-8?B?Q3RxcW5RUlBmWFFRS0lrRzIxempVdHhrODV6NkM1Z21sWVJCNXRUVnNYdEZH?=
 =?utf-8?B?NmUxYnBtV3VDQzFPMjVmOFJ2WjBhOG51R1NHQXRrVWhNdytwcHU3L01WNmYr?=
 =?utf-8?B?eldLaU43N2h2WFpEUlJQYTJLYjE3K0hLdmFTQmZxL01ITkF5S05KTDNZeXQv?=
 =?utf-8?B?Yk14RXZaRWMxZTNxRmhJUHJNNlpCOWU0WEMvMG14WnpVQzBXVzNLczJja0Q3?=
 =?utf-8?B?V3JIUVZNYkFhcUx0dWpobE9uNkpRNFp1WkJUZzNZSmc3MzNtRXVkekkvM2pu?=
 =?utf-8?B?aE4rOWRMYlFQazBSWDNpTGJlMDVEcXA1WWxKb0NCN3Zab3FwV1BNaTByRTh6?=
 =?utf-8?B?WDJqU09GTk5valJUVUh4anByWjBTUk5DLzI5bHNtbkhGS24wQlFUbzh4RmZs?=
 =?utf-8?B?cTNNWVBJM1g1Y2J6MURQTENkNVNoR0l0SjY5RkVmK3NkOFhOSjhxclN0OFBK?=
 =?utf-8?B?cTVjRFAxeld3ZGEyblR4NUlKTFVqeit6QUE4SXRsa2FKYjBPN3NIUUhCTEIr?=
 =?utf-8?B?YjVtRTlydmlXazI2UWxJSGZ4Mk5HV3hTb1kzT0MxNjBrY1V0Q2FuWk9zNkZ6?=
 =?utf-8?B?a0NBbkhSOEx2ZnJRYWk0K2RPaHVwcEIrV3pmVG5yYW1qSFNBdGsrUC82OTlq?=
 =?utf-8?B?bWFTemwwZ2h4MzhxZlNaNTFiNG1GRVFOazNtTUtzaHgrY3lVUTU3bDFkNFV1?=
 =?utf-8?B?dXZDKy9WQk83dFl4NnkzTW5DOExJOExPWkIvRnlOY0lzSW5oK2lNdjQ0TFlD?=
 =?utf-8?B?TlZHK3NiZStRbGZrMmVpa3d6bkl4Y2tXNk4zTFl5ZUd2SXJtNC9TN25haEl2?=
 =?utf-8?B?TGlLck5KUmdBNk43NjR6aWxRN0ZudVdpK29lL3JmN1pJajViZWRlMTZLaXNa?=
 =?utf-8?B?THhKM2ZXZStRclV5d1ZiTG45YWpXdkdONU9kVW1NL0xFZXMwQkJCcEg3UldC?=
 =?utf-8?B?ZlhDbE1wVWJEQndEYjExSmFYelZiK0ZqM3lVL0hrOXZLZ3BlWGRNMlpVbHRD?=
 =?utf-8?B?VlE1c1FSb1N1Smp5L1pGL2tXWmJld0wwSTgrby9CSFU5RU1CRDNOaWo4STN0?=
 =?utf-8?B?aGhZZWxjbU5wclhYVjlTUHhtaWxDbFFpMGtYelpudklyck1VbGZYUFpoZGpr?=
 =?utf-8?B?VGMrNDVmTjBNUjRWUmxKdG5KSHBCaGFBYkF1azJqR3VUbmE3cldRR1ZDa0Fh?=
 =?utf-8?B?UWdyNU41MDN6c2FLMTNVbmJBK0o3c1hmb1FBL0tSdFdBSHFvLzI4REdkdFlM?=
 =?utf-8?B?eGNVemloWUpCTjFTMk4xSzJZOVMyVjlIUnUveTV5Q2NadlZJYnhmd05FZ2tK?=
 =?utf-8?B?SzNvbTUrbU5YbXBKV0g5QkNLT3BxbXpSR281ZENtSm40RVc1YkxaTXlNb1Yr?=
 =?utf-8?B?YVJpdzRKMkVJcWNwcnNBeEM1U2d5YkJ4UnFCK3NEQVJ0cVlURXJ3NzJJTnlx?=
 =?utf-8?Q?lxT8gtKpS5vc6onVrUhq27btz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81223df2-fd70-4995-8cf1-08dc943244d2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 09:44:40.6382 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j2RrDrhXnJ5/h+76SDLUWVzh86TY5CItdhn7dadMEjH/Y5BRmul29VhtimjfN1I3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4252
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

Am 23.06.24 um 00:52 schrieb vitaly.prosyak@amd.com:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>
> Check if gang tests are enabled based on GPU information.
> Gang tests are supported starting with Vega10, but are broken
> on Navi10 and Navi14. This function mirrors the logic in amdgpu.

It's not the whole gang submit feature that's broken, only gang submit + 
reserved VMID doesn't work on those hw generations.

Not sure if that makes much difference.

Regards,
Christian.

>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Jesse Zhang <Jesse.Zhang@amd.com>
> Suggested-by: Christian Koenig <christian.koenig@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> ---
>   tests/amdgpu/amd_gang_cs.c | 29 +++++++++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
>
> diff --git a/tests/amdgpu/amd_gang_cs.c b/tests/amdgpu/amd_gang_cs.c
> index 722c376ee..699862670 100644
> --- a/tests/amdgpu/amd_gang_cs.c
> +++ b/tests/amdgpu/amd_gang_cs.c
> @@ -9,10 +9,38 @@
>   #include "lib/amdgpu/amd_ip_blocks.h"
>   #include "lib/amdgpu/amd_memory.h"
>   #include "lib/amdgpu/amd_cs_radv.h"
> +#include "lib/amdgpu/amd_family.h"
>   
>   #define IB_SIZE	4096
>   
> +/**
> + * Check if gang tests are enabled based on GPU information.
> + *
> + * Gang tests are supported starting with Vega10 but are broken on Navi10 and Navi14.
> + * This function mirrors the logic in the following amdgpu code:
> + *
> + * void amdgpu_vm_manager_init(struct amdgpu_device *adev) {
> + *     adev->vm_manager.concurrent_flush = !(adev->asic_type < CHIP_VEGA10 ||
> + *                                           adev->asic_type == CHIP_NAVI10 ||
> + *                                           adev->asic_type == CHIP_NAVI14);
> + * }
> + *
> + * @param gpu_info: Pointer to the structure containing GPU information.
> + * @return: True if gang tests are enabled, false otherwise.
> + */
> +static bool is_gang_tests_enable(const struct chip_info *pChip)
> +{
> +	/* Concurrent flushes are supported only on Vega10 and newer,
> +	 * excluding Navi10 and Navi14 due to known issues.
> +	 */
> +	if (pChip->family < CHIP_VEGA10 ||
> +		pChip->family == CHIP_NAVI10 ||
> +		pChip->family == CHIP_NAVI14) {
> +		return false;
> +	}
>   
> +	return true;
> +}
>   
>   static void
>   prepare_compute_cp_packet(amdgpu_device_handle device,
> @@ -233,6 +261,7 @@ igt_main
>   		igt_assert_eq(r, 0);
>   		r = setup_amdgpu_ip_blocks(major, minor, &gpu_info, device);
>   		igt_assert_eq(r, 0);
> +		igt_skip_on(!is_gang_tests_enable(g_pChip));
>   		asic_rings_readness(device, 1, arr_cap);
>   
>   	}

