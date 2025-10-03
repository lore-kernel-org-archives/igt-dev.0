Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F34FBCAC5B0
	for <igt-dev@archiver.kernel.org>; Fri,  3 Oct 2025 00:36:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9576D10E860;
	Fri,  3 Oct 2025 00:36:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jhO6v9v9";
	dkim-atps=neutral
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010069.outbound.protection.outlook.com
 [40.93.198.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B803410E860
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Oct 2025 00:35:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r7wNANK9WmgKsqQQq15Ix+ajpLPTq5diKlQDDFaPQCftZ16sxT0749BLvYb16EJepk75VXvwtVjQi5T3fFw63j02zDZ1QXPC5v5/sKLT1tB3uNITPDmqC1X+MxgNFJd5zz3MOGic7P10GGO/HcSsWLtROVV95FMYpvOc+YJBqiOyeHSQSiP5kwmO+dZS6j+1mbYQsk7QkNRto8+FLsQFf5/3WRXfJHa8hFiwpX8jsTbQraURzLQrpUI3uCfXrlA+q9gBH01oVaC+hgXOBc2ZDlN4/YHxj3hJ+APwa7fau3B+YwsLfeLJAj41wg+W0xp/mUOuAMTCQm+SsbBufoUvaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+UD7HVeIxOx3JO9dXYkS6AUA4tqyKj5rFCC7e/+eEU=;
 b=nowjbNmAmSUoFBcjEK+hyExnG9uSvtN6EwIGutAMgZ6X1PRq18oG4lvOM3ZldFngeSN4uZ/kvv0lGKHX/bjETU1DNoaJg5X6/ivep092EnrtHMJGXrUpaf9KJwCB2KDOi9lziIsy6t8fSlaXOYE7c2TvNENyIJTGoH4n2k7cEdcT9flj95wTOfoOt1ZYbIQBaC2Yb0XqSFObELqEM/5qpMlaH8A28z+AaXJqEW07wBjwJMm1CkJKgyJ650fePTvDlBUWB5l1zrpIZZfdbweknsPfBoUCm/E7zTb7/GpJOXyy6dhLNTfPpCIT9tOB8IofbAlYtwiHsb52JztTJw8urg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+UD7HVeIxOx3JO9dXYkS6AUA4tqyKj5rFCC7e/+eEU=;
 b=jhO6v9v9yhSIOiNFNMf+ETQrhP9uYX39xov2gThXrwCqpk9VDkL/aJqHUbLi5JU8AKqK/fkbr0WFFlIGPutLrTH0HoEK3G7Ob4slmOvfjOP5UeZvbwix11mKse8ZuuQ3sdnZy26xc2H8AqE2Vx/UckPI+HQQSFh+RBVXt89rRVY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by PH7PR12MB6737.namprd12.prod.outlook.com (2603:10b6:510:1a8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Fri, 3 Oct
 2025 00:35:54 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%7]) with mapi id 15.20.9160.017; Fri, 3 Oct 2025
 00:35:54 +0000
Message-ID: <9da39da1-3aae-4512-bb43-26c55a82aee5@amd.com>
Date: Thu, 2 Oct 2025 18:35:52 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V10 04/30] lib/igt_kms: Destroy colorops on exit
To: Louis Chauvet <louis.chauvet@bootlin.com>, igt-dev@lists.freedesktop.org
Cc: harry.wentland@amd.com, leo.liu@amd.com,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
References: <20250815040659.3321102-1-alex.hung@amd.com>
 <20250815040659.3321102-5-alex.hung@amd.com>
 <79518ab4-3184-4626-9a2b-b0f3783256a2@bootlin.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <79518ab4-3184-4626-9a2b-b0f3783256a2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0078.namprd04.prod.outlook.com
 (2603:10b6:303:6b::23) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|PH7PR12MB6737:EE_
X-MS-Office365-Filtering-Correlation-Id: ec1e488e-d5f0-45f5-74af-08de0214cfe6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ejVSVmtxejVZV0xmN1N0amtvNURnU2dHVUtNQTYzZHRLR3lacmhwVFJ6Qk5X?=
 =?utf-8?B?L0g0T21udnF6bGRIcDNwZ0R0WVpwdHZoclRSUEtIWXJrRzhpQ0wyZTdDTjlw?=
 =?utf-8?B?d3RxbzQzTFdzbjJRbUdBOWd0UmNoOHM5U3pmUGhEQUcvUDhlTTBpemovUGNr?=
 =?utf-8?B?SjJSUUdNaS9jK3ByQ0NQM3oxNEVnUkhkUGZHdFB0Zi9qNEFVV3RRUGJpb0Rl?=
 =?utf-8?B?S2IvYlFOYU51cWl6ZTEyaVJTTGMrMUNEQXhyT01WT24ycDdHUkhRNExGMmRh?=
 =?utf-8?B?UHdFNHJhYTN0eTU0YzdyTDN0Z0o3S2taMU4vZ29pclYrMGNWUWkzY1BGNWdO?=
 =?utf-8?B?Q1BuYlNHcTVaaXhDSm14VlBEOFpxQlk2RDFrZ3h1ekZlZHpCUmxTTjlxSDFP?=
 =?utf-8?B?MzlvUmNDU1gyVzZCVDh0cC9xc21oaFdpc2R6dGNTOWFXVGkveDE2SEs0dnVT?=
 =?utf-8?B?dGQ3K1Q2NnhKQVg2TzB0YzR5bW0zOG5LZUpvTDFNSy8xUGRIOFcwdVBDSjFI?=
 =?utf-8?B?cHVLNUZuYlpnZUVGc1BWRHFCUUphNFJaeW5tU1JtZWU2NlNUTGxNWlJGNm5l?=
 =?utf-8?B?U09qdCt3WTVVR1plSnZxQ0FxbFJWOEFMbjBZT2xCazBwdG1XTmhFbzQwR3hq?=
 =?utf-8?B?NVlvR0psM3FScllMSzV0T05zOG9JWFlVQjhQREdkQ3ovYnNZTHAvd2JUbEg5?=
 =?utf-8?B?MGZvbTVTMStkWW4yN3dPakFFTjNKSllCYTl0dUZscHJNaE4rakNEZ3FLbVF0?=
 =?utf-8?B?dkJmdW9yL2NWdVFLUThYbVZUZ29KY3NVTzZHdHZqdXBwcU00eGxKYXcvMEFP?=
 =?utf-8?B?V29IQjIwZGtJRWNwcjlJSFpnSHZRSWpvWFlRSS9OS3Q5ZFRMcnZCcndxWFZo?=
 =?utf-8?B?SCtKd3I5Q3lCWlhFUTdLb0MyNXZLVEtTTVZBUFBUd1YxdG9Yay8xa1BCZWNa?=
 =?utf-8?B?VFVRT3VhWmdrQ0RScGh3SXJrUkp3N0hiZXF1cHd3cW1XdG0rT3JibjdZdGJk?=
 =?utf-8?B?czFWa21VTit0QlJaSzErSENiaWhCenloK0V5SkMrQ0NyV2ZHMGlOVWI1Njho?=
 =?utf-8?B?dUthckdnZ0JpeXFVZ1dDbFlpYzdjTk5LUlZiajY0SmxNQWF2WnczN2RGMGpP?=
 =?utf-8?B?ZmFvRUtodGhaaFJHc0RuTDdiTGpmaDRhSHZJWnJvdmg5bG95a3I5NXZsWmJq?=
 =?utf-8?B?MnF1bGpOUlVHQlNpMVFjZHkzcFUxZERXdE1PTUpwMDVGTXF0bnNzL0hhSWhl?=
 =?utf-8?B?TXpBMEY3dTBrOUhQNGxiSC9RVnJTRVM0M1dmVWF3Qnh4SmtUMnA4S2FtMGFP?=
 =?utf-8?B?clFRU2FlWFdINDN1RWlVSjRGT1dxeDdtR3BJQXZ0eVhhSTl3SSszcncvSUVQ?=
 =?utf-8?B?bUlwZkx5OEpmMk9MZElMaDRtL1JaWHpJWTlEUEhVaGtCc2JnTU9CWURRUWQv?=
 =?utf-8?B?bEhZUGo3QkFScXFOQXJWanZrNEJzUUhCVVZ3WG9tTXcrbXZUa1FKU3czY2JE?=
 =?utf-8?B?bW95ZUF4YUV6cEp5V1IxSmZicXZDZ2h2TnM0SytFbk9veFgwY21RVi9DdTlp?=
 =?utf-8?B?NmIwSG1MRWNYazgwN2RRSkl5YTBYMjYrYkR3ekNnQkY1cVZxL3NhL3NEODBx?=
 =?utf-8?B?emNBSDYyNDBJZkpJOERqV1ZZRXRSNktCSUVJd2t2VVNERThNRWNoYkZTZGdj?=
 =?utf-8?B?NmljWVZWaEQ3MWJXN1E4MGd1K3NpOGtSVEdTQVp0OE1jVWpBaFlTZHA5eGtJ?=
 =?utf-8?B?cXNLMXp3V2RQdG55OEFwRStDSUw1Slp1SU44OHNBYkRlczRKd0FwR0pMOEwy?=
 =?utf-8?B?R21mTFIzcXJwajFSSXBSallFTDg2elJqUGFXTmFkd1ZRdGtoV2UwclhwTXVR?=
 =?utf-8?B?bTR0eTFpMldvamdBUzVTQ2FqYjBuOFlqNEZmSUt0RGN6OWdVY2ovYUYyZFN6?=
 =?utf-8?Q?+4IsU9opm+aIIdQooKKiA/9ZhF8JOjNs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEYzaHdWS0JYbUo0a0FZdWpLQXh6L1BQN0h0bXFMSHA1NFdNUEpWMmxISGZN?=
 =?utf-8?B?cjRlcU14VFphM0xZcUdhaGlUQmNMeU83azlGYU50RW9iTXEzd1hhMjQ5MTlX?=
 =?utf-8?B?SnBuaUV2WkRuVGlCalp0SUVkUTFTd3Evb3h4VlU0T2JrV28xcFlQUG9PMko2?=
 =?utf-8?B?OGlCL3Q0NmYxMWo5bVR3VTJiSW1ZNHV3c1gxQWk5dEZzR3hINXlrK0dYc24y?=
 =?utf-8?B?UG5EeXkyYTVaS1NPSTc1OG8yTkI2aGpzQk1IWkdxOWs0VVBzNitxTExmOHdS?=
 =?utf-8?B?cHBZcjFSb1h1d1ZxdkdmS0RlT3dCUGRsNi9VeEMzTVJOOWgwcTZZWFEzTElt?=
 =?utf-8?B?Q251blVnSDhoNVpVOGZpT29LWHFPSnFUR3JuNU9Cck9POTRKaGVZMVhPdldC?=
 =?utf-8?B?cE1pcGFJS081eTU2SmZ0a3FjVWVwSVBuV1F6bWJrNkhLeE5vODV2bjdtaEpr?=
 =?utf-8?B?RmhGVzBUL3VmUW5GWHpBbCtvVUs5ek1aRTllNytXTHAyYm5IbCtWSkQ5dXVt?=
 =?utf-8?B?MW41dVJBQTFBY0tuVGVnTVZsNGVJcWF6V296b1lXSUFKSkFSdzlaV1BTUk16?=
 =?utf-8?B?TmJJcWYyejB2SWxiWDltR2oySEYxY2tvT0RIM3BMSVJUOEJ5Q3RoWm9IelBk?=
 =?utf-8?B?ZzkwS0JoUCs0cWlTWmVramdvYThYRnB0QTFCNzV3QllTTjQ5c2Z5ZnpQb2xq?=
 =?utf-8?B?d1dOUm9wbGRoSVplMDNZNGttT3JsRkN0THRPSzVYUjlKMTM2UE5DWkdYRlJl?=
 =?utf-8?B?Uk1IYytsY1J6cVYvVng3a3pqUjJPSC9kN2dHUTljclk4RDFjRG5xTzJ2blR5?=
 =?utf-8?B?ZERWVFRyak5mTzVFZk1HQ1JaajVEMHFvWWJqb25KY3dTUjBYMkxVWllqME5r?=
 =?utf-8?B?aW9KV010aS8yaFA2bmU3UWs4U0JnQnV6NllCajBYOTh6a0JQUUI5K01CaEtV?=
 =?utf-8?B?WWVhM2RDYWZPS3NHRVNrT2krSXMyVlN6N1lNWjBraWVJZUFaUVpYY0VsNkh5?=
 =?utf-8?B?SDdHQmw4U0I1OEVMdUZmeHpTem56djZpQkpkZmoralNvLzkwMFh6OUNKOS81?=
 =?utf-8?B?aXRvRXRtek5aT09QVXpmU0VDUGs3M1crTmJrN1ZyZ3ZKakNrMFc1ajdNQmo0?=
 =?utf-8?B?dFExcWtYd2MwS2N0NmVCQ0NodmtMdHVqbG1ZN3ZYcnRsRWVUU01tZTlPZVZQ?=
 =?utf-8?B?R20wMXVFUkx4dzBRaVhQcVRyV3VJNUFMLzlpNDI0ZEszRWNnRU4rZzZZMkVG?=
 =?utf-8?B?d25YQW9JbE5MbjVONGFhdnpvR0tKQ2V2YjJ6V2d2bVV3NVZEb0dLM1E2aDZF?=
 =?utf-8?B?WkhJRWRzVTM2MFFlekFYR3RVMUJuNkxLSEZWYXNpSGIzcHBocVg4NElVSXFy?=
 =?utf-8?B?bU9Fc2k0YWJhMVEzdmZpRWdzekxxV0pFN1p6NzBvRzM5enZScVp6VytuYThZ?=
 =?utf-8?B?SkNzRGhxR0RydERFUjV0cnFYMUNxbkNLTlNxZGI3YWs5ZVFoUGhaK0VqV2Nh?=
 =?utf-8?B?QndMbkVDY3JiTjVmUmlYQzdERmRVL0xEdE5DNTVlRlpTWEQzNjF4aElVZnRh?=
 =?utf-8?B?UTh3dU5mbFNuNEhEK1U1dG9FVWd3UzNXMmZDcFFJQWxCOC94dmdOV0VuR2xW?=
 =?utf-8?B?Q0xrYm10SDhRd09MNTRiUUgrQnZPNVgvaUM1NFFudXo5aEJ5NjNaUWNhdzlS?=
 =?utf-8?B?Z3p5T3krZUd4eUNlV3dMKzBXYTZqUnd1YTh1Uk85dGVqT0VvanJwVGczNDAw?=
 =?utf-8?B?MXdMcmQxWnpFbEg4clNBMVhWN0ZDZmQ2cGQ4dC9vMVNWZEN5YW0rSWh3bnk4?=
 =?utf-8?B?VzFRUjBQMHNBSDZGMEIxcTdLZmg5Z0VsV0hVeVlsbUZpOXR0MGRJVGpRZzJW?=
 =?utf-8?B?T01XbFBtVUdPVnZqNlVPNHk4STM2dGZpN3BuUVFpbUlTbEV1MlJNa1JuSXZq?=
 =?utf-8?B?Ulp0TmUrL3ZNcXJRNDZ5VUl0R011L0h0VllnT1JZSjl3SHp2MS9VWXdkLzV5?=
 =?utf-8?B?NEhlY0JrK3VaMFkwbmlaa2JyY05OT2JTQUZlSldsM0VYUXJFRFpmTzE4VlRj?=
 =?utf-8?B?anpmY3NxV1hOZ1FIcUFKVTN0RXNqZmRZSk5LZUVFWlVLbndFa0JFNFkvMjhJ?=
 =?utf-8?Q?2ufhS8sezsShyQVvAxTFJlHlm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec1e488e-d5f0-45f5-74af-08de0214cfe6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 00:35:54.5858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ARpMsfVYv4gZWyV9cB93hVV8fFW7yud3Ghx4if469x7TQHem2jrt7OunyeehEY16BiNQEUvF8KZA4HaqhV2Kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6737
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



On 9/30/25 04:37, Louis Chauvet wrote:
> 
> 
> Le 15/08/2025 à 06:06, Alex Hung a écrit :
>> From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>>
>> - Free the memory allocated for colorops on igt_display_fini()
> 
> I think this should be done in the previous patch.
> 

Let me squash this with the previous patch.

>> - Disable COLOR_PIPELINE on igt_display_reset()
>>
>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> ---
>>   lib/igt_kms.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> index 69beb523f..67be5240f 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -2708,6 +2708,9 @@ static void igt_plane_reset(igt_plane_t *plane)
>>       if (igt_plane_has_prop(plane, IGT_PLANE_HOTSPOT_Y))
>>           igt_plane_set_prop_value(plane, IGT_PLANE_HOTSPOT_Y, 0);
>> +    if (igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE))
>> +        igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE, 
>> "Bypass");
>> +
>>       igt_plane_clear_prop_changed(plane, IGT_PLANE_IN_FENCE_FD);
>>       plane->values[IGT_PLANE_IN_FENCE_FD] = ~0ULL;
>>       plane->gem_handle = 0;
>> @@ -3436,12 +3439,15 @@ void igt_display_fini(igt_display_t *display)
>>       for (i = 0; i < display->n_outputs; i++)
>>           igt_output_fini(&display->outputs[i]);
>> +
>>       free(display->outputs);
>>       display->outputs = NULL;
>>       free(display->pipes);
>>       display->pipes = NULL;
>>       free(display->planes);
>>       display->planes = NULL;
>> +    free(display->colorops);
>> +    display->colorops = NULL;
>>   }
>>   static void igt_display_refresh(igt_display_t *display)
> 

