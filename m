Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D0F8C52D7C
	for <igt-dev@archiver.kernel.org>; Wed, 21 Aug 2024 14:48:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA4D910E64E;
	Wed, 21 Aug 2024 14:48:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EWYLATOU";
	dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2062.outbound.protection.outlook.com [40.107.100.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD35510E64A
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Aug 2024 14:48:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tscfMua9qW3YKq7jMNaTAA2+G2UyyE0Br88KeB55YxnwVzpT4ed32YIHNVjO67hRimUlt+fdBRXiDIXbtPmTt+EigLgkg8DviL8krNyMjmrjccS9Wsa6TasRyaQ9enm969E4vm8/U/rivJRc4zsJ/pcvClHKBDIBq98WSTxcPqgAJfoE7Nc3331uvIuGdKqThLdBc+/wMp4aQBhQDC5O21QDgcYkQyGJsg57gh5bNfe5HxofQzGuq4PWxFBQl7CwyZTSfcCUUe9pPGz8/GEd+Bg6WMOvl65Pz1I92u8YMju1qO0sdN5/SFVLgbBw4rw7OaecYCfroLrkmNKfc8Mfuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q6cioV5BcA34jcgyiSfgHfarhbT9SHYb+IwITfdVSkk=;
 b=eCFWMkRcxnNdaGHTdEXDuw0P9JbQSBR+ThrRxAYdm/t+at8gC00hkckbN6TsiBuo7zvNivB7T6wEJMsI+r1+sORAi9A/NLKmTn+Koa3hrGhraUW4yZnpf4p2mPu/EDWxFGBDXPqnrewb7mHTTN2C2Mui/JBo3CuECJJ2s8loxMMVpIkbXfDmOiOrFBHrEouDWWWaWfpAXrvsdTI+DBYVPw1SZBzJoRLHRk2H9z+Pzn8qE2s86UWlLf2VSDRdrVOp/hYePuYhcwQJGNVGOtIVyhfGdxOdafRHtd3GYLo+cbM7B5m5P2u1Y4/l/Fg4QEqVFcC5YB5LNQOVHRNQ6e5WFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q6cioV5BcA34jcgyiSfgHfarhbT9SHYb+IwITfdVSkk=;
 b=EWYLATOUqrZJaTHfFT0/+RmxprMKhter4q3TmLCMBPDYLa4z/jn9jvpJVAy42OmYJAJOfGT+fIqFbHG6jOC/qq/wsPHr6EIicxR3Ve+WWvxVJfhFqJ7393mDJL5/yKrDM63juNYlztrPqsZ6CyGrm+EH3rZKXEDYmc7y5fzOqvo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by MW3PR12MB4411.namprd12.prod.outlook.com (2603:10b6:303:5e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.29; Wed, 21 Aug
 2024 14:48:23 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%5]) with mapi id 15.20.7875.019; Wed, 21 Aug 2024
 14:48:23 +0000
Content-Type: multipart/alternative;
 boundary="------------3jPqMOnl00GLNS3nzT1meNZr"
Message-ID: <0abfaae6-1ff3-4f15-ab11-21f8b05416a7@amd.com>
Date: Wed, 21 Aug 2024 10:48:19 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/amdgpu: enable amd_deadlock test on Renior
To: Trigger.Huang@amd.com, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
References: <20240821110232.2559-1-Trigger.Huang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20240821110232.2559-1-Trigger.Huang@amd.com>
X-ClientProxiedBy: YQBP288CA0021.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:6a::8) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|MW3PR12MB4411:EE_
X-MS-Office365-Filtering-Correlation-Id: 1aab15d6-8aed-408c-988f-08dcc1f04e40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TXZBTmZjdHo0OGN6ckR3bGRLOFdjWEJQbmFSaEFXNzBKcE1BODZaQzIybUVU?=
 =?utf-8?B?UHhWWEVCeHRxSHpVOURtK2tFbXVMcTRPWXdPd0xnVmYxMEVIOXZoUW5HK1B6?=
 =?utf-8?B?TE1OUnM5YnMxV0FheXBWODhPZ2t1aTc4ZFgyZDVUSUdyNmFEb240bWduVGgw?=
 =?utf-8?B?aHFnVE0wSnZncVIram1DVVhOUlN0bUJXbElpcDlTWGNjNTJNUituZUlXd1N0?=
 =?utf-8?B?RHU3SXpMaGlVN1VhaWVybFBzSTFOQnpGbWNRanF5a2YzNHRYWEtHZThELy9W?=
 =?utf-8?B?STdZZFZlTWxJR0ozNVNOUHZDMHpuK0hUR2FxTmt1ZE1NeFhoejBQcjNsKzFQ?=
 =?utf-8?B?ZURHOXkwN1VNNWpXK0ZwQkFhSGZ0LzdVejFMS1UzVGg2ei9kanl0Y0VXUEdD?=
 =?utf-8?B?VUFmZjVYOE1pUFI3Q0dKdWsvcGJMa2cyUkZLcE5tTFM2WWlOSzYwbjdXVmVJ?=
 =?utf-8?B?RUwrTStlbWlLM080V0dxdFFIUXZSeEd1WC81Qm94TktUNTNpVDNhSmh1ZUVQ?=
 =?utf-8?B?THZ6ZkhvT0lYTkI0dEdlakRmd0hUTXVKR2dvQWphc0Z3ZG8ydHRrelVkNDgx?=
 =?utf-8?B?QVVrQnV6M25Ha3MzMjdzSXY4MVd0Y1RkM3BQZXlxZjY2UDhxRW9rNFliR00v?=
 =?utf-8?B?YnQ2L042dGlEV3E2ektBMHBGdmZNYnk5dkMvakFrcFZjdGxHOC9mZ2w2N1Fa?=
 =?utf-8?B?UHdyYlNoRXRPVzNha0V1MmVIaEJtczAvWjZFMWZxTUwxdnU0Y1F0eTBIam1T?=
 =?utf-8?B?NkdvdHQ3Sll3OUFqb096THdMNi9KZWtlVHpMbGplakN0amxDb2xFejM4S0Nn?=
 =?utf-8?B?L3FGeFY3TnRuQTFsWXZ4aHpaMlEzdlJzWm5TY0h0NTZNM0huRnZ0WDUzYXF5?=
 =?utf-8?B?Um9YVjRaUlUrZHV0Sm9sa3VpZVB6MUp2ZWwxZVVTbGh6YVFZUTcxMi9sVUFs?=
 =?utf-8?B?RzdrR0hVNTIrSUJQTlBvaHlkMEFDNmJnRFpLdUdwczFPMVFMeW9QRnBOVHM3?=
 =?utf-8?B?MzNZNldqZEYvYnN0Z3VJTXFYbkhqM3VJTmFEcmNhVFQ1MTVYUDgvUzg0TmlJ?=
 =?utf-8?B?RzZiVlBxVVZOcHN4MDhob1NPeHI3K3pWbkJzSENndDVxVUlEeHFnblFISFhL?=
 =?utf-8?B?Q3JWc0hDK3AxSXdrbUxEbCtlekdySmRyRGxmR21FdGViczhFWVlVZTVBSXZN?=
 =?utf-8?B?ZDhYd1ZWUEhDUVV4K1lBWFRLcFRvM1N6TE1RTVpDNEYra092SDNrenVmNGRF?=
 =?utf-8?B?VFlHWk1MWE5lK3dUbENBeFdraFVsckNaL3BNSTQ3RGw3bjBuamRHTTJITVcv?=
 =?utf-8?B?MVJ6QlY5YzljMHRYVmQ4NFVtUzJGdHl0L3RCSHFnU0llNjdQYnRDNUIybDd2?=
 =?utf-8?B?U3haVWpZbHhiQ3RUU05BVFRHTXMwbFlhVm9TNUNUdU5yei9jME5HS1FveXpX?=
 =?utf-8?B?UU9iSkw1Lzg1Z0g5Um9qanVSbWtiYVhJQ1MwMzFKblNZQWhPQ2I4N1NEWDdX?=
 =?utf-8?B?NjhoWHhpd2Z6aDdCb3kwOHUwQ3JtZWcyR0pPUXpTMWxicGM1aEFVdHZZYWMz?=
 =?utf-8?B?KzZCaHFoeGNvYkZnbXBocExPNE5RcVpyVHA3emVqRW1KTVZUVDU5a3N6OHhw?=
 =?utf-8?B?VXVKTWQyWjFHZi9WV3Qwd3paczhqeWVOTnk4TGwzRiticDJKY1FLTU8wTms3?=
 =?utf-8?B?azVuR1p4NmFHU09FM1lBY2I3K3VuM2o4RWtKZm9Md2pTZHFCbUpwTjgvSTBh?=
 =?utf-8?B?bDZhQWFaNDNtbi9EdUFQaitUL0FpUDVBOE52MWtKSFF1N3ZmUHpPcHRjdTlQ?=
 =?utf-8?B?VG9hZnR6dkhPVWxoZEZuQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjErQU15REsyUWpNdWZ3allxOVZTR241NDM4QTRxdk9BUkpVcGw0NVlzcWJa?=
 =?utf-8?B?SVMzSmFHUFN1bURjTklaSUw1d3BGWkRSNUFSdFNycnhyZ0UxaEUrbDhUdlBU?=
 =?utf-8?B?bEI5Y29FVEFxUXRLMkUxSGFhdDRLdzQ1WmN4bys0emw2MTArRERYT3JQSm1z?=
 =?utf-8?B?VEp4ZWNSY2FzWXdSZ3U4MzhCNi9LWEVnaHBNS3dtMi9vUUNQOHc3MG13K25G?=
 =?utf-8?B?R1pQOStrL3dSaUlWMkU4WHBuZkpUTWp0bm1sUFFGOWhwTlJ3MG9LN0RraDFl?=
 =?utf-8?B?eEVYQi9ldVdjcGlBM1M5RWdCTHhVdE9IM0trY0diV1NjTkJ4MEhSc2pGNENy?=
 =?utf-8?B?dHEvU05oM0xLZXYvWGs1NjFSbldkeTZTYlpqdWNGOENRSVNPQ2Y0Z2xzSDIr?=
 =?utf-8?B?ZUpXaWZHNTFPdGU2V0c1K2lLblBnMCtPTEpVR0dXSkRseFViTG93QTlLSnds?=
 =?utf-8?B?VUxPZzVMdlRobUx0WEp0VUZ6VFg0WGR3LzJzZFgyL1Q1V2Y5VUVJQVhleXZm?=
 =?utf-8?B?OXdCL1ltZVBleGNZYURYR1VsQzZEQkhZQmJDcDZHdWY2MENSYzh4aXhMN3RQ?=
 =?utf-8?B?N2tTeCtxaEVSQno1SkxHVDF1REFFNDI1bFVHQndpNzllM3E2YWFuaE9KRWRx?=
 =?utf-8?B?MEZZRExOemxLZjJLTWRUNnRvSmg5clRQT0hpS05DeTIwOXBnSlBaUUEvSmFl?=
 =?utf-8?B?dFJNbDhWRERpcVAyK0dPcWVXZzRTaGNJdTNCRFV3dXlqMVRpaUNIYlV1K29y?=
 =?utf-8?B?K1dDYUN1ZnVvT3lmc3FvRHJ0QW9WblhYNndsWkZRV2RMcERSb2w3cmdiNVJr?=
 =?utf-8?B?OHBRN0FkTVZaQmcvZ1NvNGxpQU9rSkxMVVBYc2VZYWV2K2JWYjdObUtKd2Nx?=
 =?utf-8?B?RUUxazBHZThWNVM1dFR0U0NWSGlFUE5Ya0ZpZit0Nkx4Z1dSenVodDk2RWlT?=
 =?utf-8?B?WWJ6cGg5bGVyVjVudUhMMmNLWUlkeFVad1pmTzhPT09MKzVHdjhnOE03Um5B?=
 =?utf-8?B?UURUREVxZFVjMG1RbmJRaUErem5qSm9KN1gxbUVDa3o2LzhncHgzSVdwTDBE?=
 =?utf-8?B?amdqVTJJcDg2eVBnbVdDUlFYV3FUTXQzaENrUEF1T0xkVVhhZ2w5MGQvdFVW?=
 =?utf-8?B?NjhuL0hhbFBJL2NTZ1NhK3haRkl1T3RZKzRKMlZmS3dkaytObExBMEwxZG42?=
 =?utf-8?B?SjF4a0Jpb2h0ZkJZTG5BaXZibDEyaDhKbEVMSDBoNm9RUC9Ma05lMGJWTVZC?=
 =?utf-8?B?dE53K053REU0OUJlTWo1U2EzR3M2bW1QbUN0ZzZidVNyNURNNEY2RFNnVnlv?=
 =?utf-8?B?UTVya0FjdDA2aFpFVHdIc0hSVWZ1dVBQMm01TENidXRjdXBMMmRNc255bm1S?=
 =?utf-8?B?SEpOWFQ5WWhtUHpicE9JQ05KSnFFNzc2U2pDazBGUUV3dk5GUTE3MFNRSkFG?=
 =?utf-8?B?MkI0WnVza241b3Q5QVp5WWpycFEvOVpuTUlxazJUQ05uVkluTVBNV09PcTVN?=
 =?utf-8?B?Y2NDVUdyL2FJL3BGMGthVWhWV2s5dXdKTWpFZ2NWRkpqcnFSWU1GNDBlSTht?=
 =?utf-8?B?dkZTRnNjWlc0TXliYzgyeTRQNldYeEt2K3RSL3JTUzE1dHhFSHA3S05rUi9J?=
 =?utf-8?B?L1FFQkN2NXpyR3JxZWgwVjdrcUFPc1dTOWRaQmE1UzlidklzNlljcldTaHpu?=
 =?utf-8?B?aldvYTAxcE5IZE1adytObGxzZ2FaMUQzKy91SWRtR2dqSUkvUllpVWhvMk1J?=
 =?utf-8?B?UGYzVG1zOHJwaklRaVIzV0pFcDdBdlAyYU9SdUxKTXhvY2xmSjVkcTVjc1ll?=
 =?utf-8?B?QjBTbnNNVk9pNmN6eG1IS1NBSTBON0Y2TWI4dzdkaStwWEYzZnJWSEJGcWRC?=
 =?utf-8?B?d3BENEY2TnJvemsrWUR4dTRBT3grMGZyYVJOSHZEN0RNS1FrY0R2NzNQdWlP?=
 =?utf-8?B?NkhaeVNJMG45Q2orVzlQKzFUcENCTTlXN0s0LzFRb2VIQVBUTXZVZnJtdUNQ?=
 =?utf-8?B?VXRpTC9Oc0hxeDdTSUU1NzFia09pT0Y4aHA5NkdCcW1uREN5K0w3SWZmQjVt?=
 =?utf-8?B?THo0ZENTSXpmQlRSSXVYakQyNlV3NEhkbDJ0OSs2bmthc1JwVTlQYUZDUFQr?=
 =?utf-8?Q?ngOadw0rWqwOLkmtmNLRhZRh2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aab15d6-8aed-408c-988f-08dcc1f04e40
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 14:48:23.1141 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ld7Skt5nv7Mh3vumVux5jh+kdkfCh0AVaqKYzabqlj/ET7UPaxiRFgL39+nXNSc6KWPxG8Zr1BCZcqm1+CfWhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4411
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

--------------3jPqMOnl00GLNS3nzT1meNZr
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Thanks for catching this. Please add the following comment: "For example, the |ioctl amdgpu_query_hw_ip_info| could fail if certain IP instance types are not present in the ASIC."

Also, to avoid compiler compliance issues with zero initialization, please add |memset(&|hw_ip_info|, 0, sizeof(|hw_ip_info|));|

With this fixed, it is reviewed by Vitaly Prosyak vitaly.prosyak@amd.com.

Thanks, Vitaly

On 2024-08-21 07:02, Trigger.Huang@amd.com wrote:
> From: Trigger Huang <Trigger.Huang@amd.com>
>
> When family_id is AMDGPU_FAMILY_RV, we further check if it is Renoir
> by chip_external_rev.
>
> When checking if a command ring is available on a specific AMD GPU in
> is_rings_available(), delete the igt_assert_eq(). Because it is normal
> that not all the rings are available on all ASIC families.
> For example, there is no AMD_IP_VPE on Renior
>
> Signed-off-by: Trigger Huang <Trigger.Huang@amd.com>
> ---
>  lib/amdgpu/amd_ip_blocks.c  | 4 +---
>  tests/amdgpu/amd_deadlock.c | 4 +++-
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
> index 3cd9ce7d2..c880a2926 100644
> --- a/lib/amdgpu/amd_ip_blocks.c
> +++ b/lib/amdgpu/amd_ip_blocks.c
> @@ -902,10 +902,8 @@ is_rings_available(amdgpu_device_handle device_handle, uint32_t mask,
>  		enum amd_ip_block_type type)
>  {
>  	struct drm_amdgpu_info_hw_ip hw_ip_info = {0};
> -	int r;
>  
> -	r = amdgpu_query_hw_ip_info(device_handle, type, 0, &hw_ip_info);
> -	igt_assert_eq(r, 0);
> +	amdgpu_query_hw_ip_info(device_handle, type, 0, &hw_ip_info);
>  
>  	return  hw_ip_info.available_rings & mask;
>  }
> diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
> index 52ba08494..96da49002 100644
> --- a/tests/amdgpu/amd_deadlock.c
> +++ b/tests/amdgpu/amd_deadlock.c
> @@ -8,6 +8,7 @@
>  #include "lib/amdgpu/amd_memory.h"
>  #include "lib/amdgpu/amd_command_submission.h"
>  #include "lib/amdgpu/amd_deadlock_helpers.h"
> +#include "lib/amdgpu/amdgpu_asic_addr.h"
>  
>  #define AMDGPU_FAMILY_SI                        110 /* Hainan, Oland, Verde, Pitcairn, Tahiti */
>  #define AMDGPU_FAMILY_CI                        120 /* Bonaire, Hawaii */
> @@ -24,7 +25,8 @@ is_deadlock_tests_enable(const struct amdgpu_gpu_info *gpu_info)
>  	if (gpu_info->family_id == AMDGPU_FAMILY_SI ||
>  	    gpu_info->family_id == AMDGPU_FAMILY_KV ||
>  	    gpu_info->family_id == AMDGPU_FAMILY_CZ ||
> -	    gpu_info->family_id == AMDGPU_FAMILY_RV) {
> +	    ((gpu_info->family_id == AMDGPU_FAMILY_RV) &&
> +	     (!ASICREV_IS_RENOIR(gpu_info->chip_external_rev)))) {
>  		igt_info("\n\nGPU reset is not enabled for the ASIC, deadlock test skip\n");
>  		enable = false;
>  	}
--------------3jPqMOnl00GLNS3nzT1meNZr
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Thanks for catching this. Please add the following comment: &quot;For
      example, the <code>ioctl amdgpu_query_hw_ip_info</code> could
      fail if certain IP instance types are not present in the ASIC.&quot;</p>
    <p>Also, to avoid compiler compliance issues with zero
      initialization, please add <code>memset(&amp;</code><span style="white-space: pre-wrap">hw_ip_info</span><code>, 0, sizeof(</code><span style="white-space: pre-wrap">hw_ip_info</span><code>));</code></p>
    <p>With this fixed, it is reviewed by Vitaly Prosyak <a rel="noopener">vitaly.prosyak@amd.com</a>.</p>
    <p>Thanks, Vitaly<br>
    </p>
    <p></p>
    <div class="moz-cite-prefix">On 2024-08-21 07:02,
      <a class="moz-txt-link-abbreviated" href="mailto:Trigger.Huang@amd.com">Trigger.Huang@amd.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240821110232.2559-1-Trigger.Huang@amd.com">
      <pre class="moz-quote-pre" wrap="">From: Trigger Huang <a class="moz-txt-link-rfc2396E" href="mailto:Trigger.Huang@amd.com">&lt;Trigger.Huang@amd.com&gt;</a>

When family_id is AMDGPU_FAMILY_RV, we further check if it is Renoir
by chip_external_rev.

When checking if a command ring is available on a specific AMD GPU in
is_rings_available(), delete the igt_assert_eq(). Because it is normal
that not all the rings are available on all ASIC families.
For example, there is no AMD_IP_VPE on Renior

Signed-off-by: Trigger Huang <a class="moz-txt-link-rfc2396E" href="mailto:Trigger.Huang@amd.com">&lt;Trigger.Huang@amd.com&gt;</a>
---
 lib/amdgpu/amd_ip_blocks.c  | 4 +---
 tests/amdgpu/amd_deadlock.c | 4 +++-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index 3cd9ce7d2..c880a2926 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -902,10 +902,8 @@ is_rings_available(amdgpu_device_handle device_handle, uint32_t mask,
 		enum amd_ip_block_type type)
 {
 	struct drm_amdgpu_info_hw_ip hw_ip_info = {0};
-	int r;
 
-	r = amdgpu_query_hw_ip_info(device_handle, type, 0, &amp;hw_ip_info);
-	igt_assert_eq(r, 0);
+	amdgpu_query_hw_ip_info(device_handle, type, 0, &amp;hw_ip_info);
 
 	return  hw_ip_info.available_rings &amp; mask;
 }
diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
index 52ba08494..96da49002 100644
--- a/tests/amdgpu/amd_deadlock.c
+++ b/tests/amdgpu/amd_deadlock.c
@@ -8,6 +8,7 @@
 #include &quot;lib/amdgpu/amd_memory.h&quot;
 #include &quot;lib/amdgpu/amd_command_submission.h&quot;
 #include &quot;lib/amdgpu/amd_deadlock_helpers.h&quot;
+#include &quot;lib/amdgpu/amdgpu_asic_addr.h&quot;
 
 #define AMDGPU_FAMILY_SI                        110 /* Hainan, Oland, Verde, Pitcairn, Tahiti */
 #define AMDGPU_FAMILY_CI                        120 /* Bonaire, Hawaii */
@@ -24,7 +25,8 @@ is_deadlock_tests_enable(const struct amdgpu_gpu_info *gpu_info)
 	if (gpu_info-&gt;family_id == AMDGPU_FAMILY_SI ||
 	    gpu_info-&gt;family_id == AMDGPU_FAMILY_KV ||
 	    gpu_info-&gt;family_id == AMDGPU_FAMILY_CZ ||
-	    gpu_info-&gt;family_id == AMDGPU_FAMILY_RV) {
+	    ((gpu_info-&gt;family_id == AMDGPU_FAMILY_RV) &amp;&amp;
+	     (!ASICREV_IS_RENOIR(gpu_info-&gt;chip_external_rev)))) {
 		igt_info(&quot;\n\nGPU reset is not enabled for the ASIC, deadlock test skip\n&quot;);
 		enable = false;
 	}
</pre>
    </blockquote>
  </body>
</html>

--------------3jPqMOnl00GLNS3nzT1meNZr--
