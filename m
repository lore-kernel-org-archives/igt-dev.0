Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 151EFC7115A
	for <igt-dev@archiver.kernel.org>; Wed, 18 Jun 2025 20:50:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B86D110E942;
	Wed, 18 Jun 2025 20:49:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="n86QNfuW";
	dkim-atps=neutral
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2057.outbound.protection.outlook.com [40.107.95.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E6F10E942
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Jun 2025 20:49:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MbCDPuXhval2YbL2ESps53LRJZj08qGoqc+jUp6hIR62uTwnhZjK8/W1cn5gzn6vZmR4JGl/48xSRftAl46nQ6JkBDwPjm0LiO0elNLp7XQ8VtnKGAo+mKUpMbHx83AgayBoKHVz4jqnRybEPap0rm78JDPceNnb3HCM6h5NkY0OChxbD3dOdD4lGBFQ4ANNYPX7QplIOpsGLg2YP5xxfrii2HTP6tUdUV4rmeThifWUzHJTDaDL1be+nbpsplX7sZ/6biTS1x63RlmPwwd29CAgA0mSVIFBIDJtl0F6G3tZV5e5kz7RbV96RFDzvFOFEVplgUUF+Osc5ln0u9q5rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CtuAdsU1jrx+eW2fa2r56bch94xLtltVObqVblr6HCU=;
 b=yM834H+N2koJAesP/wuEPw1mxipFYZPlMLnoYVQlIsIg6x+06ZES1yt7AbHatRDq4I+i8vaVMqNuQgx5oD5Z2TGcjAKV/ihAP1IA9wAKXzzacGFwS6Ix1LqrsLUOCpA9x4k7ktjp+hwdXrN72MVIJpzA5VYJgyvHiC/DqBt+HLrqi/+yWN7atwNChPmUWkUWSjsaZOG5+xXMWVXYQF386vpu67jcQYT7yeGJRYtSFtLF2prBnraLM3rGs0FFE4pPmCu+h2fxgB+MDQiKM1xfCLZxo9dysPYFbeQKdSGWfcXoiuKNkAWamkb3IMdP/0AB5MVR9Z3tEPf6MfxeksXjTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CtuAdsU1jrx+eW2fa2r56bch94xLtltVObqVblr6HCU=;
 b=n86QNfuWFiXcarsWC02LWE59NRfD++wtF2uvCfbIyZvp3UCVxCgpPb+RJlYiacsrNUvNO/CsU3Al7EAIotoYWkwwQMHKoTG/ub8onrkhJpgOQ3wIgITeHxKCZIgSvyPdy4c2FPbCp/ZBEoOKB0SCcwnEMCfvNclk0LF8CDh1alg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DS0PR12MB9273.namprd12.prod.outlook.com (2603:10b6:8:193::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Wed, 18 Jun
 2025 20:49:53 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%7]) with mapi id 15.20.8857.016; Wed, 18 Jun 2025
 20:49:53 +0000
Message-ID: <ce648e31-7390-4e52-be4e-ad0ec3683834@amd.com>
Date: Wed, 18 Jun 2025 16:49:50 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V9 02/36] tests/kms_writeback: Fix kms_writeback for VKMS
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org
References: <20250617043631.2920587-1-alex.hung@amd.com>
 <20250617043631.2920587-3-alex.hung@amd.com>
 <20250618200646.6im5hrnubt4evjfi@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20250618200646.6im5hrnubt4evjfi@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4P288CA0070.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d2::18) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DS0PR12MB9273:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fd58fad-89dc-4869-21a3-08ddaea9acc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bVBFMDlOd3NFS0c4NWgvZGFEeUtIM0hRNFd0OE5aZC9iZ1hHeCtxekF3OXJu?=
 =?utf-8?B?TFFXMlJBeDUxb2l5TmxaQmphdk0wenhxdUhUVERGVVo3Qm9vUnBtYkd4VWQ3?=
 =?utf-8?B?UnJkK2tld1NpcW85Qlp1ZTZpK3FJMGVBRFN4ME1UZ3JGcm0yYzBRYlpibWFV?=
 =?utf-8?B?eUU5dVhBdzAwSHVrdzBzQ2FPTm5Lb216dGRleWFLOSs2L09HSkUvNElCUFFH?=
 =?utf-8?B?S2lGQ05iME52aGYyeTV1K3BoaEMxVkpiU0lzOURBbEl0bS8ySTF3a0w4VmxU?=
 =?utf-8?B?elREZlhUODVpVjNLc2NMWnUzdGxVR2k3TFRGUnl1eWwyVGQ1UmR2amNnaEFD?=
 =?utf-8?B?Z1hRUUlpNWdxNS93SHRJTnJsL1B1NXZiWEl2UThHUkFvWkFmV2xaaXF1MXd0?=
 =?utf-8?B?OWlRL3RsOCtxTC8vZ1JNNThucHBBUVlIUFpyb2prSG9vNjJ1RXhnSEZXYUxT?=
 =?utf-8?B?ZjBUNDJOZjQyVno4a1VSdHdHTTdPZDNVN0J2MDZrWjNkR2p2U0YzamhGK1RN?=
 =?utf-8?B?RnhSMU5jTEtzQnlWam1NaUZJWUFjQUUyQWhJOU8xeVY3MmwvYU9JWjJzYXNO?=
 =?utf-8?B?RlRzQWtSdi82bFhMcTdQd24yUFBIdjVTSkFqdGNzTldyR1hETjd5VkJQVjND?=
 =?utf-8?B?TkVQa3ZhTzhxcFg0R1kwVVdBZkRJdW5iZjcrRU1yNDFVQnB4RjQ0SUowNk9M?=
 =?utf-8?B?MEJCM2V6MGRRNytBRElGM1E0dzhna2d6SHpVZklNSllYb3F6T3l5eEF6TVIz?=
 =?utf-8?B?ckdQNkIrRmlkQXpHOERvZHdBU1M4YS9acWg2d1N0SFNBWWtaS2drcmduSitY?=
 =?utf-8?B?b0hZaTVEK3o2Zy85bEJwejZ0cWlCR2psdmZhMVVWTlZoVnJFRTBBZGVnMjBu?=
 =?utf-8?B?SlNKMFg0LzRhV01ZSmxHL04xOU9KU3ZHTHN2SzFmRTBhd200SUQ1bWFGL2dm?=
 =?utf-8?B?ZFR6eDlEUWxsZzMwdEd1RDF1SlVGSDBselRwK2MzNmFBZlJHenN4Ukd6M1Nl?=
 =?utf-8?B?cktpSkNJaGlxSWRHbUcwYzNIZTk5bTdOM1BYS1dBRW4rZk40OCsycXNuUDBr?=
 =?utf-8?B?S1R3OGloNXc4ZTFIZ3VHWlBVd0Iyb0gzT0NiY1gwRWVqZmJrQ0l5ZURnamJW?=
 =?utf-8?B?ek8vbFoyMzdjZm1VWEFhb2N6d09yMDVycmREbkYwN21wQmZHT21TNjVQK1FM?=
 =?utf-8?B?K1BaQ0FUUmVjeS83bUU5VTN2NU5ZV3pqVFdhZjB5ZHhTcHlMUnUxUmljZWla?=
 =?utf-8?B?N1p3cUREWWZFelYwQVJObHVrS2JSc0RwQ2lIU1lYcm5kVG5XL1V3ZFdVZm9H?=
 =?utf-8?B?aXkzSXVSdjIwUHZkL3o2R3JDRjZRTWJteXhtcVFmdGJqNDVOMFNHYTVaUkUw?=
 =?utf-8?B?dlNmaWZqTTJNN0dFaFBwc0x3VkdSNjNNTENHMW5yUkJmMUthTDZhdDNERU5T?=
 =?utf-8?B?QnB0azFyRW1xcXJ0NGVvVi9jM2NtY1lnbjlLQmxNbzBlUk5GMlBvRHFZV3hC?=
 =?utf-8?B?QlRKZUhvN2Q3dkcrcVNsQ0wxR0xsdXVoZzNiM1Mram1TMHZ4QWpDOTdaZmZo?=
 =?utf-8?B?cnVpUy9EMUFoN0o5Z2xBQ3U4ZmQ1RC9DMmZ0VmN5UXRjdXlGWkJlOWdJL0l4?=
 =?utf-8?B?MjdUWGUxNjk4aWNMRVc1WkQzc1VMRVk3VnpzU0svNjVsMk9McUdSaDROVytO?=
 =?utf-8?B?cUV0MXg4N1QxdElGa2lnMWNnc3ZYZ0JVZmgyOGJ5YW03UzdBbzNBT094ZWYy?=
 =?utf-8?B?TTl1bGJZdjg5Mlhsc2J3a2JweWF5ZUQ0SFhpWUNGVlBUblI3UWJjWEZ5anhI?=
 =?utf-8?B?Zi93NGlUanZWRVhYZVRSdW8xdStIMS85dDVKYXFqbmpMdnJNT3lmeHhXU1Vs?=
 =?utf-8?B?RUxVNjlJdTJtNDdQTUdrT1YyWm5sUXhRbHQ4RzZYSW1HdkdEMHFwemZzTWU1?=
 =?utf-8?Q?HHeyhW2u2qM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmRFMTlacDdwaUYzL0kvL2g2RVI1MVQ2SE8ra29yL3l4cGhsSHVUajZsd1JK?=
 =?utf-8?B?eGhkRWl3SElSL2thVk16WDBIb0lGRW4xRExhbk5pU1dyOEVEd0pOSXd1cHpu?=
 =?utf-8?B?R25BMHQ3ZktiR0VpbmZNSmRlSHJJNy8xSmdGK2JoTW9ZWHF1N3I4YUxLWXk3?=
 =?utf-8?B?TllwZzdVeTRMYmxHYU43bmRmbHZZUVNzRkVoNnI2M1VjdXBlc1h0MW1UL1Jv?=
 =?utf-8?B?cWxkdDJlTUtHcEpGaDZHVkdwZzRVdmpQdU5GZkdUSW55VnR4czF4cmsraEFM?=
 =?utf-8?B?aDJhazJxQXJvc25YOHAza00vYlRhWGxGTVFZMGRZaVVEREoxY2VjKy9MbWNz?=
 =?utf-8?B?RGl0cGNHWmZFMmVaVUphU2h0cHE2R2I5S3RLbitTVTNOa2JVZkY3MUxQVFlQ?=
 =?utf-8?B?M3NTRUR4c3FqbklVa2VaUnB3NnhkRUJ5bDRTL09qaDFqTEMzRFozUUdBdy9P?=
 =?utf-8?B?ZU95VHNrT1RLRjk2a1cwQitnOW9iSHRFTnJFcFdreGlBWjcza1RQUlFoaHQv?=
 =?utf-8?B?MXI2dzEwRzJtb2h0MkZTMHl4Vnd5L0FNL3F1Z1Rhbno1SVBGbVdiWTBiVXJZ?=
 =?utf-8?B?cFZFOTJLKzVMVkdXY3lCSlZrSCtsWVI1ci9tWXFCUm14dXMzVmJCTHdGVU1N?=
 =?utf-8?B?dDJMMTlpU29qMzZiZk9YQnJEOVNEODZFV2kwQ2FFQlJpV0JCZDkxeTNibHFz?=
 =?utf-8?B?Z2JObVZRdXkybXRXNnVUYkVnbnZsUFAxWkhCR1J4ejd2UVVSU095K3p3Vk1I?=
 =?utf-8?B?aEg3NndBUnl2QWN4M0NZMkVnbzRMWk1qb0Rqdkx4SWtsRWNkNUJHdCtFTFRO?=
 =?utf-8?B?UE51MmZZSHhZblRQTG9PbHJLbmRhUDY3M20xbFBrZjZIdEVPVkZnbHJackM3?=
 =?utf-8?B?VnZ3czd5YVVRdStObmlNM3lZcTRDbndCcEt0SERnRjUzb0Y3M0VJVi9xSEpQ?=
 =?utf-8?B?eUMvODArUzBPNm9xOXBuM2ZSeERLRkVJVFBIL21uTGttdjBKOU5xWlJZazlE?=
 =?utf-8?B?NGdmZ3lUbXp6Qld1UjZUWnpGZGlRMVRrYmdkU1dPbDhMMmlGei9zU1d6SnBa?=
 =?utf-8?B?eThCOHl3Nmljd3lBTmQ1SlVJem5kZFhmUWhRUmRScXhYT2hmYnpBVWVKV1U4?=
 =?utf-8?B?RHI3T3NpRjZMc2R4dzRBYXcxRm1WY2dwQVEvUmQ0bkd4T0E0L0NmVTlZNi95?=
 =?utf-8?B?dDQvSUt4R2JjSTBzZmxQVHo0bGNkTVpobXpwYjdDVk4rWW1XcFovemFyMXU4?=
 =?utf-8?B?Y2dZSG5hY0tJeTlRMER4V0pGV1diNllSYlpaOGJiVVM2Y2k2UmdIM2gzc2ZH?=
 =?utf-8?B?eGR1UjlyMUZxUFlLYkdQRTdyN1BYUDlLQVVOU3FXSE1STVRBS2NCV2NLckxu?=
 =?utf-8?B?UW8vZzlBZ1ArakY2cmN0NGdvck1DV21IOW5mY1JsQUVwcGlMUkdSWmdVTnRJ?=
 =?utf-8?B?TWx4em1LWjFpM0pJTHkrR1ZRbVVob1J4NFZHS3BLb2paM0FZdGpLWkZwUHFR?=
 =?utf-8?B?ZjVvNUplNU51bmJkRFBJL090bFVvU0l5RDBkcXZqcEFsZk95ZWtPNjkxMFhW?=
 =?utf-8?B?RG5lMUxLUlZlZnFWak5LMm9uMzZkTWFHbEl5eEtzM0ZhQ3JYNE16L2xPVTFq?=
 =?utf-8?B?eTYrRCtacElFeWJZWm1jZG93MXpSdEYyck82c3VLZnNQYW9teW43TVE3Q1NO?=
 =?utf-8?B?WEtKYXZEeTZDY3dGSVk3R3NRelFCc0xqT1VnNzhMK3lCUGNUM0ZWeUs0WFh1?=
 =?utf-8?B?cWc4dHh5TDdUV0xOc2lJYVRZVzFNeVc0Q053Wmhla3R2c1IzUTNaZWpiVlk2?=
 =?utf-8?B?TU9EakJMQmxiR0ZEa2tTVkduaWVucXNFRzlLSHlBbnNjckttNU1BN3lpaGV2?=
 =?utf-8?B?bUNjVG1tL3lKYkJYbXlHbFVFb3ZCem1lMmh0TDEvTUdodmlDNlFsZnZzYjMv?=
 =?utf-8?B?K2pKUllnWGc0YktmdVJCTU5GaWd0alVGVjVrcmpwZ3YxbzZlMXZQOGRGV08v?=
 =?utf-8?B?dml0eElTSmZiZlhDS3ZkaDhqL3hFR0h4d211bExhU05lYnNic0xYd3lBb2do?=
 =?utf-8?B?R0hlWUl0bFdmZEVJYWl1cEJHa2gxNzFZUm5ORHA5Qm9qQ2JWcU4wS1djemRS?=
 =?utf-8?Q?Mw6I+b76DKUy2JbaW0lfWjf2Q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fd58fad-89dc-4869-21a3-08ddaea9acc7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 20:49:52.9993 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w52fR7tCVPDAiwhtQFdgE+RIoWro2CaFzLoVlQuoY+grAB8hG60JbI3z1btboGGABzker58DRX189zR34w4fag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9273
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



On 2025-06-18 16:06, Kamil Konieczny wrote:
> Hi Alex,
> On 2025-06-16 at 22:35:57 -0600, Alex Hung wrote:
>> From: Harry Wentland <harry.wentland@amd.com>
>>
>> VKMS doesn't like us to add buffers with unknown fourcc
>> type. Other drivers might behave similarly. Make sure
>> we avoid creating 10bpc buffers if they are not supported.
> 
> Could you split up vkms patches into separate series?
> Why send them with this big colorop one?
> 

No need to have it part of the big series, that's just how
it started out and I never got around sending it separately.

Harry

> Regards,
> Kamil
> 
>>
>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>> ---
>>  tests/kms_writeback.c | 19 ++++++++++++-------
>>  1 file changed, 12 insertions(+), 7 deletions(-)
>>
>> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
>> index 05680837e..8765fda34 100644
>> --- a/tests/kms_writeback.c
>> +++ b/tests/kms_writeback.c
>> @@ -131,6 +131,10 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
>>  	height = override_mode.vdisplay;
>>  
>>  	for (i = 0; i < sizeof(fourcc) / sizeof(uint32_t); i++) {
>> +		plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>> +
>> +		if (!igt_plane_has_format_mod(plane, fourcc[i], DRM_FORMAT_MOD_LINEAR))
>> +			continue;
>>  
>>  		ret = igt_create_fb(display->drm_fd, width, height,
>>  				    fourcc[i], modifier, &input_fb);
>> @@ -140,7 +144,6 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
>>  				    fourcc[i], modifier, &output_fb);
>>  		igt_assert_lte(0, ret);
>>  
>> -		plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>>  		igt_plane_set_fb(plane, &input_fb);
>>  		igt_output_set_writeback_fb(output, &output_fb);
>>  
>> @@ -590,12 +593,14 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
>>  				      &input_fb);
>>  		igt_assert(fb_id >= 0);
>>  
>> -		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay,
>> -				      mode.vdisplay,
>> -				      DRM_FORMAT_XRGB2101010,
>> -				      DRM_FORMAT_MOD_LINEAR,
>> -				      &input_fb_10bit);
>> -		igt_assert(fb_id >= 0);
>> +		if (igt_plane_has_format_mod(plane, DRM_FORMAT_XRGB2101010, DRM_FORMAT_MOD_LINEAR)) {
>> +			fb_id = igt_create_fb(display.drm_fd, mode.hdisplay,
>> +					      mode.vdisplay,
>> +					      DRM_FORMAT_XRGB2101010,
>> +					      DRM_FORMAT_MOD_LINEAR,
>> +					      &input_fb_10bit);
>> +			igt_assert(fb_id >= 0);
>> +		}
>>  
>>  		igt_plane_set_fb(plane, &input_fb);
>>  
>> -- 
>> 2.43.0
>>

