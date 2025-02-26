Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DFC2C021B8
	for <igt-dev@archiver.kernel.org>; Wed, 26 Feb 2025 19:00:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD7810E9BC;
	Wed, 26 Feb 2025 19:00:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hsLsNEBL";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062.outbound.protection.outlook.com [40.107.220.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 273E910E9E0
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Feb 2025 19:00:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HbkGji9ewEKfqTReRjEBLknBTN+JZoXVSBElJVWR11F2+bFf/R7SnraNTEEOKUPS2zvX6hwCELPnXGbVH14Udv4QWL17LfzOlb1UnI8J9fcDdTk3dJ1tX4wEnB5rU7C2GVeaEVuBsKVsYgb5XHsg3ky/XQYS4QgyMovmcA+wSQh3rvW7k8RQifK8TVo/wvq9AsqWImgCwLwJA6P4OUFGu/9bxI7rwy+aWuN4zzmZRJ0gpO9hsj++LpD39sUjopjHnq/1jLszGMFT/q8nGBYSHWYGtdCsFclTy+cnA4wCrozB69P3P/LS+FQ6hpqiBfHhc0PPuN6LO9z7CKYPxWJfTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oE6rUidVZEqRCNAq+tEYWRSW4qMnN9s3qEqBDu0mdtA=;
 b=MHCyANvP7HY3P8zMGAs3g0RlbxKfXq5WtjtFqftvh4iRQhmpGtfLJzObtimsvULcfWOAdKc6IIpfq7djf7a91Nz3sww9s4tmBM9PVSLIuhqwgK8a260w3zjoTusEVHIcCE5XrrbLz+m+y1/xw5JUsHLJ1Aq9VClExm7Yp38LxOj2nRJONJxt6/bmvUxoAr7t6WnO+JKcuTczYWWJ/9P/sqkD0RjZtJ8QHTLmeWvoDJdSbQHSn7TQYfXLnTNgTa3khf0nGVjzR3bTw2qgPboNiqGs8X8zhg+3Ypld/msSicpPl3e3Rv8HLIrntVUGB1nLMKXTKbiZLb3OCDuwo3RcsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oE6rUidVZEqRCNAq+tEYWRSW4qMnN9s3qEqBDu0mdtA=;
 b=hsLsNEBLYWPivomVmG6+bJw58oBwaqPAhe6h0xVFCCj0mX/BoQIF31gRyuxGEF090PEZ2Y1tWVtRQnO1s4GwsIa4CAkevdyGKesGOZ64ulcFYt739JW4YQNzrtPxIuv8BlSIyTzTP15/zelOHj0P4mbsWOTKuJMp7sw7YtsHf2A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by LV3PR12MB9259.namprd12.prod.outlook.com (2603:10b6:408:1b0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Wed, 26 Feb
 2025 19:00:30 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%4]) with mapi id 15.20.8489.019; Wed, 26 Feb 2025
 19:00:30 +0000
Message-ID: <5c50fc99-805a-4bb6-9c83-611cf51b2b0b@amd.com>
Date: Wed, 26 Feb 2025 12:00:28 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/amdgpu/amd_abm: Skip the test if panel does
 not support ABM
To: Tom Chung <chiahsuan.chung@amd.com>, igt-dev@lists.freedesktop.org
Cc: sunpeng.li@amd.com
References: <20250226100929.3363-1-chiahsuan.chung@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20250226100929.3363-1-chiahsuan.chung@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0103.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:3::39) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|LV3PR12MB9259:EE_
X-MS-Office365-Filtering-Correlation-Id: 60825445-6e18-4af8-885d-08dd5697d70d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MFpQTm9oUHFCMTl3MktxbmMyUENlSlo5ZkJFckhZb2lnRmM0RTJUQTBIOGNG?=
 =?utf-8?B?Q05KWlJ4aGxOYUQ2NVhvQjlUVGdzRE0raGRRM1B2YWl0QUV6RlEyOVJvSXZK?=
 =?utf-8?B?SDZxVXV1WmIzNU5CakxCYm1ZTmxRZVd5TFZYc2hmcnVRc3JPWFgrSGFtSzFC?=
 =?utf-8?B?dHhjMnNJY1BlTkJvc2R0UUF1cUdobzlnTFp1MHRWblNtMlRjai85RDFsTjZN?=
 =?utf-8?B?UDBaRlI1S2VWdTRVUWZ1Tkl6akdhdkhXVGplZnJsb041WXFJSXNIcklFRzZJ?=
 =?utf-8?B?UmNrVWU2KzJuZW4zT2NacDlydDI4SWdBenZOaFFTbitoZ3ZWTnR3SzFCeFIy?=
 =?utf-8?B?MTJhWE1QTFdoU2lFRytrWlJKWGlUV0MwN2kvM2tjaWc4YVZwL3lubW9saG5E?=
 =?utf-8?B?LzY1czhpT09xQmJkOGEzWDhFOEFtZ1hZUkV4Z1JONmpOd1ZMdzB3M3NXOWJ2?=
 =?utf-8?B?N3hYbm9MZVd2SzRIcjZ3cXp6dStoS2hPSWpEbkl0ZUc3WVBUNzlubU5JWHNo?=
 =?utf-8?B?UlJGdDhsb1NsVmNnakdTa21MbVE3V29IZXZHZHo2bXRtZVFRU0dXcGUvY2Nq?=
 =?utf-8?B?eFZDT0ZoS25nSTI5d3RHZDZXNk5Tcm5XTk1TdWRBTnZaMGlZVWxSaThFOTl5?=
 =?utf-8?B?VnVQblUvVVVOeHlFaHloWGREVXpxNjlSRTN4MDNFV2xETnJMQWdleUZOWjFX?=
 =?utf-8?B?eGRxSEJ5WGdYdHljcHdHNnJLSFpyVzFiK0k5V2lEbmlmQzFhUmttWDRINGdE?=
 =?utf-8?B?RHpDcVVhYVBuWE9WNW9GZElnUFFjRXN5ellSYW5Od1lWZVRldDRHVUtiazRG?=
 =?utf-8?B?SGhBU0FDd24rY2xRUVRSUHI3ZHVYTmZBZkhaaUlWWGgrYllqUldqUVMzTGVT?=
 =?utf-8?B?cjJWTUk0cmorY1NaQzR0K3haR0p6V1Zsa2c4cHZwbkR1L2U1NERQN2NvOWFK?=
 =?utf-8?B?MTBVNm91ME53dThHS1U3dHQwb25wdDM1OXNVckt3WkR1UGJGdFFISzR6LzlE?=
 =?utf-8?B?WGJiQVY3elBLNVVnZk9uamwyVXJseUxHUWVwdVA3bjNvaDU2L3E2TjQ5UGtj?=
 =?utf-8?B?eWZUYVBXNHl2OERucnpUb20zK1kraFhaQTRWSHFsRWFoVVNKYTJ3Nk90RDZz?=
 =?utf-8?B?M0dIazZ2NzROcVBuQ0pwaThHNzAzemJwR0NYNjM0TVhCOGpEaDU2ZGM4Sll1?=
 =?utf-8?B?QnNXUUhGVGhwSkpuaVhud2lkUmk5aUlNdE5YNFgwSWU0dFhBakdqcE5JaGlZ?=
 =?utf-8?B?MUNIM2FFTnozdExrYTZGYzVjajZRcWxGeHpySEo3T1N3T2tScEhxRTVqVGpa?=
 =?utf-8?B?L2c3dVoxcmpFdkF0UUMwazVlUGVFbGQvTmQ4clU2dTM0M2dNSC9MaTJYaFhL?=
 =?utf-8?B?R01LNlNucCtpQ2FaQlhkZzhuR2tGRVdZejR2Um9PbC90R0g3elFYekZ0VGhw?=
 =?utf-8?B?Qm83ZE9rYnlHVVkxZC9na09DL1JnNjdDOHlJWGM3dDhXZU83VGJ2YnlZd3FK?=
 =?utf-8?B?ZFpWZ0NNdDhSdUpqN3lWbjEreUxDUEY0cEJhaUJ1Q1lSU1ZmekVSTW9xYzJh?=
 =?utf-8?B?WHhGMkd5WkJYdmpYaTJ1bkZGdmROalhSMVNWTENaRHl4T2EwOGM2RGE2WG1y?=
 =?utf-8?B?MnJiMUZPQTArZHk5U2dQb2QrODRVUGU5bVo3cFQ3SFpJM29LU0FkaXRKZmN2?=
 =?utf-8?B?bFB5T0tJb2NqeExRMFlNRWhiY3c5Y1ZKZlJHb2FxN2dZZjc3RzBZYlNDZWFh?=
 =?utf-8?B?QVRndlNKWWY2TTAwblY4WFVqU2hXYyticmJxNjZSTFNCTDBFMG1sNklwOURE?=
 =?utf-8?B?SCs1djBObGNXSzJlcEZ4QlNvTldsUEZKbGV6SlhTWjhER1lFWWErT1dWbXFR?=
 =?utf-8?Q?utdD/4bzYQq8E?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlJGK0VnTEEvZ1NYZFZXL1AvamgrNzVCOTgzaXJMdzgxZzVFU3cwb1ZoRkZ3?=
 =?utf-8?B?ajVWa0hHcTkyOXNWYlorYWQwdUJCOUNGU2dlNThHVTZsR3haZHYwYzZNU3Zz?=
 =?utf-8?B?THJJcHNuN2R5eCtoNmNsZ2loNkpzMDdzNVFhSk9FUE1pTm9oVmk0VFAyaWlD?=
 =?utf-8?B?cEo0TXFMY291bE9NUnVlYml5TjhIdk5uaUc4WGdFUXg0dUlJQjJBMVI0S294?=
 =?utf-8?B?NC9SMERRZjdLT0d4b29PL3JUWmxFMTN4RGtHY2hweGFyTHFRZWRCdDRuMnIy?=
 =?utf-8?B?blFWcE15ak84bmZLWGFZd3BvRW1wZy9kejI0SXRDcDJDa3hnTTV6RUJ2SUhR?=
 =?utf-8?B?UHRLTW02Y2tSKy90N3JaY2Q0Y21UZVlFSFRRL3RuNFpkTDFyMXpLbTZsR2R5?=
 =?utf-8?B?SWZIMkJjZy9aZzhyY0VFbVJtWGQ0ZUVnNklRNHpBQlE1WjMrNGNpN0xtRkZM?=
 =?utf-8?B?VlVCZDB0Ris3ZmNGN1hYY202K2xNcHdWbmxQWGxPazE3L2tjZURHTnpYMHJH?=
 =?utf-8?B?bHhNMG5idEFYczA2NVJkRmhJQkVjVEU2QWF2cUlueThGQzlibjdCNWZFbHJB?=
 =?utf-8?B?aFFsbGxiV0Y4OUFKMGlPMlJSUm5rdWkwcHJVS2lPRmV4bVhDNGpJL1JtUmo5?=
 =?utf-8?B?RjdCMFB5TDdmNkJldHRyRkRETzg0N29FejhPckxpcElzcyttYWprN3ZEZTZY?=
 =?utf-8?B?WU9kdStaMnBsM3RsaDBCdk4waDhHVFR0Zkg5VDhBYXNJLzRsY0ZpUGRjTlEx?=
 =?utf-8?B?alVEMHEwMHNLcUpDamNCSk1rWjNzUDJOYk1kT1czeEtHYUVPc0lVcnJ4SHNW?=
 =?utf-8?B?RURjQUorbVhVWi9zQW53ckJzZ0JYLzEzR29TSjZUKzFYc3BxbUpKSFhNYUdD?=
 =?utf-8?B?N1ZSeVF1ZEpaaUc5bDk5dTRsQnlJa2NtOFFIY05FUnF1VEJDdU9odE1QWFQr?=
 =?utf-8?B?eWx6QW5Cc3JwSG5SMzE3UWRXN3dieXpHcVVEcHJHZU8zeEk5TWZrYW9pV0dx?=
 =?utf-8?B?ck5OOExqNzZqbVhWZzZQMGtQSHlOVG9ORHk1LzIyR3JjTFFzcVRpbXZiNHBl?=
 =?utf-8?B?MElxdzBZOTNSUURoRG05ak42djI1dU1oNGdISDhjNkhKOWtwNFkyUEd2dzdj?=
 =?utf-8?B?Sy9BanNsVTh6ZnV2cElQbWtFTWVHREFmd0djWmUxenE5bXA5dGhWVDNaUHNL?=
 =?utf-8?B?ZFdybmFZWTJFTzZMOEprdGt2aWZnSHV6K3o2RjM1OW9YdVVlNFdNMFhQVStI?=
 =?utf-8?B?cDFFcSs1cGZ0V0xqaWVONVVCbnV5TUhSWlJlc1JKQy9JOVBVUGZTTFF5eW15?=
 =?utf-8?B?NVFBV29wSlgzNVpFV1d4dU9YajI4ckloRlRKc1dCU2Eyb1dXSU4yVTlIYUha?=
 =?utf-8?B?YnRnTGNsRzBpemVCbno5V3BoOXBUMDFMdC9jVXlINUR3aEttekliazFDemph?=
 =?utf-8?B?YS9BZWxnNVk4ZllZRmJ0UlQyWVRuYlRacXVUV1BLSlJYUTY5aW1rRWFRQ0s3?=
 =?utf-8?B?QXBPNnZ6ZGp2N0wwWG5KMUMxeG5pM1ZsYlFVT3JHcndyZjV4WGJpZ0phOHpO?=
 =?utf-8?B?ZnIwV21RU1Y1MW1QU2RqQTcxWEhSQVZ6WFJPdkxKdDUxZmRMKzlCaXc3dHR6?=
 =?utf-8?B?cDcrTGY5RmgvYklyYUx4d3AxNjZYenA4cUdQOGRCRFZETUU5TmE0dVV3ZUNo?=
 =?utf-8?B?V1ExVS9rVXRsZGhScmZxNk9IUjBuM2IvMUdKWHpqRHQxVzJSNmJ6cExKaHc1?=
 =?utf-8?B?VWRuVTVBYjh4N0xiaFVDaEk1OEN6RURJOTJmSis3T2ZiTjB0eWQ0TjVmbGhZ?=
 =?utf-8?B?bnNLY2VkRGZka3RhN0MyaW5RM2xhdzlsN0tmTlVYbkpLbXpRK1p1QWhYamI5?=
 =?utf-8?B?WE9FelcrMVNPQVcrc2taUmgxWGpHQVFXN0tQYXJzQ3dDTy9qVStXUGhPM1VG?=
 =?utf-8?B?QlVQQTg1NytlS1dSSnlSS0FOWVZmaFdDYWtET212TUdSRkdUV1ZqK0xFdlRK?=
 =?utf-8?B?V3ZNd0R1NDhUbTE3ZVBRaFBRdmNPeE4xc3VRMmV5YS9vNlNrcUd5TFlGeTZy?=
 =?utf-8?B?UmpHdmJINE96V2RWaVBSR3BUSVlCTlVMNUdyTGREUlZGR3ZjSmoxeGN6aTJm?=
 =?utf-8?Q?F98t7/z3Z+2sXDdueIstzG0th?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60825445-6e18-4af8-885d-08dd5697d70d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 19:00:30.5905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bOemMh2ddivazI55gD4eYc7FDEHWuaHzsQlvhW8BvDBAfCzBbPZE9BFaffzdTBgmhsjwcamUHBH4MHElJaEMOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9259
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

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 2/26/25 03:09, Tom Chung wrote:
> [Why & How]
> Skip the ABM test if this panel does not support ABM.
> 
> Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
> ---
>   tests/amdgpu/amd_abm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
> index 8f7f489ad..13274aa4c 100644
> --- a/tests/amdgpu/amd_abm.c
> +++ b/tests/amdgpu/amd_abm.c
> @@ -191,7 +191,7 @@ static void set_abm_level(data_t *data, igt_output_t *output, int level)
>   
>   	fd = open(buf, O_WRONLY);
>   
> -	igt_assert(fd != -1);
> +	igt_skip_on_f(fd == -1, "Cannot find %s. Is it an OLED?\n", buf);
>   
>   	igt_assert_eq(snprintf(buf, sizeof(buf), "%d", level),
>   		      write(fd, buf, 1));

