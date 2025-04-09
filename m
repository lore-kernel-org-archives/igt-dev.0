Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36044C36002
	for <igt-dev@archiver.kernel.org>; Wed,  9 Apr 2025 15:29:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF1FE10E06E;
	Wed,  9 Apr 2025 15:29:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Hf9cKX45";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2050.outbound.protection.outlook.com [40.107.94.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F7D10E06E
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Apr 2025 15:29:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=grzpSiA6dJRx6aeBYe+Pa9YStrQQipstNYv6QeLtSCsSxtu+d/ZlU1CZGJCcmQLnMrRCqiCU9QPhJfWS1ylkaj5vbSOtILvpSR9ch/ue0nxZYeNrvU+cJwaNw7xjhTFrH310f9ndjggen8nlv2/h5X4JaynHv4x2DmxuoZ8evR51qtYQ8Mz8aqF+0BGf7EFjcL+MXXfGRpuBrXkvZJ0COR9RqNgOdwipIBUQZ1uqiBpLXhvUBThCUKVFHqFyPfrAbUPAQaAuWLt+qOwPaTh0y5I1Sy07re4OKqyif8uD8m6sXm1RC3muRFuhcSwn5MfDnlwPrQ4fPC8q6HjZTBei6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Gv5mBxoT3VnbAhs9thOgb2Kjsjo2RPxkIWMTR0KekA=;
 b=N8A5DeJw6aKVs2CaSCW3dBw0Bs/3RDwNjBOWlOFZkIaDXOC0li5zzrqc+6L5+YYeIUOOIvs8vnaByoR3/PDx76lXwieLwOPUcmU1aA+ZTLJyfcrOHAEOMK9XvAA1EDm4tBkDVjlD01RNFMn6G+2Tf0Rsnr8bohtmpeF8PnDginsfW6IdbyQsObd43i6tlj9sxZ2ESKubzbdwSvAHTePrDx2FUp0uOYZLwxuQaoCY21uFOdW9qEPgHWHo9GlyFCkwWtXrzgziujmYb9emdUcFNZNM9cc9mePle+rhQYLy7JKkrORNcIFHufTgTt2LT2j9fCLI/8LHzxzUIo5z3fhYNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Gv5mBxoT3VnbAhs9thOgb2Kjsjo2RPxkIWMTR0KekA=;
 b=Hf9cKX45zFEQP8iaHHx+CijdC5UbR82wEk1FCF4XRhz7Awj+TF+8i7OL5Pw92tw3jfSf/vlfD8Xo7tDfHMlQ+Iipv6JrZOFEt6xGdQJwvxUZaQqduJuEhhhdLqig7YdX5VM/J7w2gjL5CL4TU4goFjMPBvyxiIXAXflPXyMUL0g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by DS0PR12MB8296.namprd12.prod.outlook.com (2603:10b6:8:f7::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.34; Wed, 9 Apr 2025 15:29:40 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%4]) with mapi id 15.20.8632.017; Wed, 9 Apr 2025
 15:29:40 +0000
Message-ID: <f33c733e-5656-4c01-a11c-c8f125ceeacf@amd.com>
Date: Wed, 9 Apr 2025 09:29:37 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/4] tests/kms_async_flips: Check for atomic async flip
 cap
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 igt-dev@lists.freedesktop.org, Jeevan B <jeevan.b@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: kernel-dev@igalia.com, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Melissa Wen <mwen@igalia.com>, Rodrigo Siqueira <siqueira@igalia.com>
References: <20250409152206.132022-1-andrealmeid@igalia.com>
 <20250409152206.132022-3-andrealmeid@igalia.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20250409152206.132022-3-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0164.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8c::18) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|DS0PR12MB8296:EE_
X-MS-Office365-Filtering-Correlation-Id: ecaef935-8147-4d0c-9d89-08dd777b588a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YjlsbWtMZ0lMeEhKTWRNQllYTmtreGJxblY0WkM4SkJYcUptNzFXNXZpVDFr?=
 =?utf-8?B?NHRrWnVWVkRWdmd5VzZqS3JZTkUzTmpscTdqdmVqRXpjT0l4UlVoNExXQ25F?=
 =?utf-8?B?OWlhalNZMUw1VDhYOHgxVk9hVmFKZHdhOE9TZ0dEOTRFZGIwV09wVEdZTlJE?=
 =?utf-8?B?Vi8wY1NaU1RpbE0wSzhzWHFrYkZoVzNlb3RxZitUUkFpeTkyM1dsTXFyM2VQ?=
 =?utf-8?B?NzVtbWtuU3NSQ09KWWR5ZVhTOHgrMzBNQlUyVkNEeGY0eERyTE84T250OCtU?=
 =?utf-8?B?S2JrcHFTVGdHVlNTYjhJR0VSVFNkZjBsemR4bjRBdGFINEI3SnFtUVVuTEda?=
 =?utf-8?B?cGgxaE1ZRldJdUpuU1h4OUZsUXc5dldPcGtHRXEyU0l3NHYvNHpsMGpKaHl5?=
 =?utf-8?B?RXZQYStQRzU3REs1dGRJd0UxZHViZytPaGRpRmRSeVdSVGhERUpaMjhINVBS?=
 =?utf-8?B?aWJpc1dHSFc4ei9RcEg1UDNuU1NOODF3U1cwSW9sRXlSUTFGMHlwY2ZaWFRZ?=
 =?utf-8?B?TDMzRzJMYlRsTVVKdkR4MkNsTm9rWGIrSFUwUHNodTRzSGhKVmNtRVh3T3pE?=
 =?utf-8?B?cmZwWDh1Ylo2NGMwTXdVQkRJQ0NqU3JDUWtOSm00VWJrYkxENEV0SXlLd2Rr?=
 =?utf-8?B?OHdaQlVoZHVEQjg0dmJweERnMVh5WFFNNCtlZGhxWXBhTjJ3cjFVb0I1ZVVU?=
 =?utf-8?B?TmdFRWp2c3JybC9sM0cyYkRPZ3dVM2ZrNWpFRXFGb3ZiK2E4M28xUFE1NmF6?=
 =?utf-8?B?UE42V1l4MGdhN1B3VG1hQXZXT1lkYVkwc1pzTGQvUzVCdUppaGFKVWVYUHdO?=
 =?utf-8?B?aFQ2Um0xUzZhcmtnWFhFd1I4R2JRRDlWSG9OL2daQmdwN2FFdFErbTMvQXpS?=
 =?utf-8?B?MUE5akJBYklYemJCN0tlN0lYNm1mVDkwSXY1aHZuSFE0VHRBcURwMWZlR2R5?=
 =?utf-8?B?WkhDQ3kyTUtFcEdsNHJJQ05qZTc3MzJvclk2NmdIYVF1Nk00WDMwRzhiUU5r?=
 =?utf-8?B?L2V2WWgzeTVOdXE2VmdCK1IyQ0xSVGcvcVl6VXZXbFdhZnY5ZjNuc2xvSHhQ?=
 =?utf-8?B?N0RpeHMrNEYxWEVpQTd3QUpDZi9WWTcwVlVtZFAwcTNTRDBFY3VSOVFWbU9O?=
 =?utf-8?B?L2pIOWRLa1VOVHMvSitDdEhlZFNGaDhaTHdrdVRibTZGOVhsdlh3RzBaUWVC?=
 =?utf-8?B?cDZ3c2t3QU5RQUtNdFJIQ3loYmhkNjdudVZhVlVteHAvVXdtdm5Ya3Blb1pG?=
 =?utf-8?B?d1Q1dWRaTTY1TWdxMkRDcFdzQmxhQTlPQU9qUEpmUE5XWThjQzJIak9lYksx?=
 =?utf-8?B?YVNJZVpRRDg4dG5MM1MxS1c0WmhUQkkwVWlmbUkvTjRtVWJWQUttK2hhb1E0?=
 =?utf-8?B?aVduaXAyS3NSb28yMDZpTjlSVjFQcEIyYmRQMkZPWGZBaHBXdDBzaCtsRHoy?=
 =?utf-8?B?ZERENGZmSFJRMmpYckFXNElVa3VXOHBMTDhGcjRlNHdzaWkxc2tHTm9lMkZw?=
 =?utf-8?B?Z1pUVm1nckxiTlJpWjR4b0ZkSnhFZVFPZFR5NkVoUVg4UnlpUmxmaFFmc3I0?=
 =?utf-8?B?dUVWWEMveGpaUzlSd2dVTmM4ekcyKzBGMkl0V1kxdUF5VThLbEFmcWlPSThj?=
 =?utf-8?B?N25LOWxiY1FtWDYzOUF2Qy9xYXNlM0NKOGtLUEdNeTcyRS83SU5pWllocnJ0?=
 =?utf-8?B?UmpJeDdZSDIxMHJqZ1pMczhXdm1aWUd2Y0oxN1BhVVllRUcwdEhhVG1VaE9J?=
 =?utf-8?B?cTZDcUVUNUhRV2ZDNlJ6U256NVhGVHRBRUlER1d5U1JSckpKMkh2R1hhSUtX?=
 =?utf-8?B?ZW5YczQwLzFWN2JsRStzVURHVng3UXJjMzFKb3hqNkorY2hTUnBrSzY5c0Ra?=
 =?utf-8?B?dnB4a0lxamhwRVp6ZDlNTU1KdUZoRzFVRWFDVitNSTQyUU5EdHR6Rks1K1NW?=
 =?utf-8?Q?tTxwGRDcWpo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGt0bXpEa3Qwd2trM05nMUg1VmlsVTcyN21QdVdpdEE4cXBRVHhpUE1SZ25Z?=
 =?utf-8?B?VDkwcTF0ekdvelNzTXpGbmh4dUkydlpMdElERXJNeitSQkJSWEY2K2ZrcUhs?=
 =?utf-8?B?QlRIam81bk43YUx3VUZQNFEzNGJBRVRNTWh3Tm9ZSG5jMlV4Z0p2QUN2NjYv?=
 =?utf-8?B?cnBUQkw2aHFWTXRDNU4rRHNkK2VlQWovRVZCaVBSeUVUL2pWWjZpeXArZ3k5?=
 =?utf-8?B?c0lNVzhvaXh0djFaMHh3TEtpcG1qdlhpOWZDUnJpOXU0ZmJwdy8yMDhlOGZF?=
 =?utf-8?B?b3JXVXJkZzFtMUR0M1YyTTRzdWVRMUNNK1dRQ05QQzhCSmtLSUNTNGNyOXRl?=
 =?utf-8?B?TFVKcjg0a1JJbklZVWJ1UklqOGx1cXI2bHI1R0NiQ3MxaWZkZFVUUjJIaXhr?=
 =?utf-8?B?YnlOZGZ1cVdBanFOV2RyejBMb25JNnFzdUJzd0Q2V2gvRmlzemY0SDBqcnZv?=
 =?utf-8?B?TU5IanF1TC9HUlJaOFFFcVVTcHZ2czB0dUl3MEJLR3BxajBnYUlTWnpwZjVD?=
 =?utf-8?B?WmNQVEcyNFFQSlo1b2NGWlN4TjFzZ0pQSW54dGsvOEU2OFlVL1g4WE1ETE1l?=
 =?utf-8?B?ajVMUytVUndGR0hDTnU5R0RGMEZwNlZBUDN3YStNVzJQaWlCYjMwTUlDMVJh?=
 =?utf-8?B?NUpLL2QzU2FNdmtiREFQY1U0VWx5WGVRSURxN1hXRHF5NTFzWHNIWVJtL3c4?=
 =?utf-8?B?SW1YbmpNU0swRmNIT3crbFk1YVBab21FcjZDQVlNZGRoZGxxd1NKakwvTm43?=
 =?utf-8?B?VE0vazhjMnZWcENUTmlrQmI0aVlmRHYwcEhXbDBLUTNQL1dpa2Y2dGRlY2sr?=
 =?utf-8?B?cGJMdnBwcDE5cG9wVUFQcjVlZW0zOXUya1dSZitUa3BleHE1YzVRcFRGRkkx?=
 =?utf-8?B?YWNOSStsL0dIb1JGaFBIRGhIOUFyQnd6anBNeFZZVWNkdkEvZmwwNHVsbldE?=
 =?utf-8?B?U1pXWGc0UEdidGJQb1hjcnAwcmwzNmpNRDhJYXRKTjZzaExMbCtFcTB3TDBK?=
 =?utf-8?B?bzFSRHB1NURXY2x6WVMxdUhDajBuL1hOejJCNDRVLzBzb0ZXQ2J1a0JUZjZX?=
 =?utf-8?B?NmpYbERySnRKbW1XdlZ5STExODJValhVdzgwOWZmUnBsU3FnZTVBRlVMNUg2?=
 =?utf-8?B?eDRldXJBMkhYRGNUZU5pVTZqMVhrbjM5M09QNjlSU2hPQ044cUloNTExSVJ4?=
 =?utf-8?B?VlJMRldjWmRWNnlLLzcwYWJjYXFiNnoyN1pMaGlaZ2VDS1dOYWVrL1M3cFFV?=
 =?utf-8?B?WFlDNFNZcSt3dkZacithaHhhY3JYTU85NUx5dTF3b21zTTgwOGFyYTE0UXVW?=
 =?utf-8?B?eXoxUWVNM2xjVGxIeU1qdGNldml1Y3FRUFBwbXdrUjBld1dqT0xLRFExNy9m?=
 =?utf-8?B?REhqR3RqK0xUTnZUOXRuOWZaTmZ0VEN2bGtBekIzNzREYjVSYmtwRi9kbnRT?=
 =?utf-8?B?WnRTMVRnUS9jTjVCbmo3RWFzK2RDQm5ReTlubEpDdFoyL1gvRDkzQTBJR2xj?=
 =?utf-8?B?NmRGeGVVSWowOUk3aGNVVnNaTDlBT0dwTjI5cmQyY0tvbGdtVmR0TllRVjVl?=
 =?utf-8?B?RXE2VEllVU9VTE9RMlpzaXR3TUJhNU52Z25LTFFWV3V0TlNxcDFSU1RZSm1W?=
 =?utf-8?B?VVlzaU9IdWNwWUVTWVcwNDNCMHlUUFY4N0RYQmtMT2s2S041eXB3cmRkYzFu?=
 =?utf-8?B?ZmJEQ0NZcUd1L3QrS1VsVUd3aTNsSFBhSTdqa1JXTDZvemF1bFhWTWg3MW9l?=
 =?utf-8?B?V3IwSHFMWmtPSVI2dEhvMlJ0TjFPc3Q4Y0s0UWpQUElBQnRvNjZUSGlFVThX?=
 =?utf-8?B?cVMrR3VqZHBTWDJIa29PczFydmxjVFY2K0tiaHVGVEdOa0xWcjk3ODBFcDlP?=
 =?utf-8?B?SFFMOGlJcG9xMVJvcWlCWnFIVmdBSzEwMXl3dzhZK3hqWjhjcWdTcG5ZR3V6?=
 =?utf-8?B?ZG5jYVZhTFozTWZlcHNFZkJFMlVyWXpjay8wSURydjU1RFQ5L2QyeDV4dzlh?=
 =?utf-8?B?UWhlSzE1dit3U0R3WkFxdjZjZlBSOGZvRWtWcXlqRjlsRytVNGRFd0wya0JV?=
 =?utf-8?B?VU9xRHE5cE5aVjh0QlRIbkpPc1l0US81OFJIRkVzcTkrZXpzblBzbm1ra3BG?=
 =?utf-8?Q?H/AcM3xVtc3TV3nx0N1ShztfI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecaef935-8147-4d0c-9d89-08dd777b588a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 15:29:40.8191 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SLMkSJrS+u3kHcQOseEDL9bG5ePGjWBgEtOYNT7zNxskQoFTLF7X3R05Dv8TT3nv6owtnQyIOXE4Nyo/0S6F0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8296
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

On 4/9/25 09:22, André Almeida wrote:
> If a driver doesn't support doing an async flip through the atomic uAPI,
> the atomic tests fails. Instead of failing, create a function that
> checks for this capability and skip the test if is unsupported.
> 
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> Reviewed-by: Melissa Wen <mwen@igalia.com>
> ---
>   tests/kms_async_flips.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index c1637104e..f7a233045 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -209,6 +209,14 @@ static void require_monotonic_timestamp(int fd)
>   	igt_require_f(ret == 1, "Monotonic timestamps not supported\n");
>   }
>   
> +static void require_atomic_async_cap(data_t *data)
> +{
> +	int ret = igt_has_drm_cap(data->drm_fd, DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP);
> +
> +	igt_require_f(ret >= 0, "Atomic async flip cap doesn't exist in this kernel\n");
> +	igt_require_f(ret == 1, "Atomic async flip not supported by this driver\n");
> +}
> +
>   static void test_init(data_t *data)
>   {
>   	drmModeModeInfo *mode;
> @@ -689,6 +697,9 @@ static void run_test(data_t *data, void (*test)(data_t *))
>   {
>   	igt_display_t *display = &data->display;
>   
> +	if (data->atomic_path)
> +		require_atomic_async_cap(data);
> +
>   	for_each_pipe_with_valid_output(display, data->pipe, data->output) {
>   		igt_display_reset(display);
>   
> @@ -714,6 +725,9 @@ static void run_test(data_t *data, void (*test)(data_t *))
>   
>   static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
>   {
> +	if (data->atomic_path)
> +		require_atomic_async_cap(data);
> +
>   	for_each_pipe_with_valid_output(&data->display, data->pipe, data->output) {
>   		test_init(data);
>   

