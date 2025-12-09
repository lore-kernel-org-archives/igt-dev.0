Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24CD9D3B7F6
	for <igt-dev@archiver.kernel.org>; Tue,  9 Dec 2025 21:10:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDA6910E20F;
	Tue,  9 Dec 2025 21:10:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dvsmXi4B";
	dkim-atps=neutral
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012065.outbound.protection.outlook.com
 [40.107.200.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C54210E20F
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Dec 2025 21:10:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LB6plVd007Cp6UbYP+rxcUMngwq34ZF6SIg8dBrHIyINrSksksrpbG1nvR4gSvYRsZJkDBB+rIZYPypmsfvs6mwDhcg2nhZ/uFfN9neCPJc1hBp9OA1OAfrQjHOXTOlXjwRBrfs44mhSF4B/oyJRNZXHJjKCeKildpGpr6xZRYCCXKM//K5xVSs+QOZODvV9lEV5RjGwg66ps7dapFYCAkU82lRy3WPNI5ep1gCZp6Lu5v8uM1+ZKm+qmiDjf/HspG2Bw5ycfuRkSleRkB3UtdSo3t/7q52ZDMuOsv2ibpiGRG2+hJzI7jA8acWgSmwRR5tezPW/tupiZy6CmIyhBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AivqQ3LskqPwuS+OQ/tM5Uk2UzSK/JDHnotRky9T3YE=;
 b=If12mpxJvKNN28N3+8daaZfc8EA2vVEg+FB1K5Le1DZguXXWnj0MZkr2sT76plqXNroMOw+FioPBzwlz2e+rlo1etyH1zZNVcMvyto/6vn/7QYXODRxqXd6TjmQ0Np4+bBWnDVJHQXF89LU82Th2d/JGtsuI3WAdsKLS4jA0SZZ4yF7MTeDo0p4cNbRu0cMQlYYU24plSCfewuEbmXLLE6ILx/zZ9bGVmfw3J0XrRv3gOAqXhgMOty4hIbe4w6Q4qyQ52UCUq2x+KI+sfLCo67hbworAHOlE0CFNUYUC7pH4AQogmuZ9B9N2MeafXrb9asMAu5eGlfUxPisVvMLFnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AivqQ3LskqPwuS+OQ/tM5Uk2UzSK/JDHnotRky9T3YE=;
 b=dvsmXi4BMhy3Die7M+WDYZLMMbiybiYHU8tKRXgDH4djeYSIfWKc+nkFuTPJnhpP2IJa1kwISqJNY+NAP9/s5mGnCJ8I3jycrKIFxXyykebZn2xln++bewflfs5IxfdRBe9iMT6ZLeCryQQ3Nuj/7mlgprgJ3k+hL6MXVg2iXpA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by PH7PR12MB7818.namprd12.prod.outlook.com (2603:10b6:510:269::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Tue, 9 Dec
 2025 21:10:26 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%5]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 21:10:25 +0000
Message-ID: <5bdb9a19-63e4-4697-90ad-55dec4adfb87@amd.com>
Date: Tue, 9 Dec 2025 16:10:21 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] scripts: remove symlink
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Rob Clark <rob.clark@oss.qualcomm.com>, Ryszard Knop
 <ryszard.knop@intel.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20251209125130.22657-1-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20251209125130.22657-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0024.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:85::21) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|PH7PR12MB7818:EE_
X-MS-Office365-Filtering-Correlation-Id: 51f0c468-7c2d-4f2e-631a-08de37675f05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?KzAyVkZGVGd2OHpoM2phZkxBZzZ1aXNNMncrRHZLNWMra3V5MHI2VzBCcTND?=
 =?utf-8?B?bVBQZHFjdlAwbERwVjhvOEU5d1RiOGtPVmlCcVFOWmtpdWdoZ0EzOU1QbUY5?=
 =?utf-8?B?L0xFK05ha0lyOC9kN1dDbVVZMHRjd2F5RkZyZGRmZ0hwY3pKT3JjZ0djaUox?=
 =?utf-8?B?VXBreFNzZENaR3BBZ2hiSTBqS3lrK1pvY0JrZDFrRzBvM1gvTE4wM2pzSmJF?=
 =?utf-8?B?MHN6SzhNWXlGOVhxVTN0TERDL3BaTjBDeTVOdTdNNkpQUWg2L3VuSEdMUHp5?=
 =?utf-8?B?a01mYUkwaVZQd21KSTdYakRqWTFJdXlMMCttNk14UE5FTnJLWXJMVkg4YWhB?=
 =?utf-8?B?bGZLNGcyQ3RwSnZNL3c4QkdTTGRYMnIxR2J4UCtVdHplMnBLaWxWdHVoZjJa?=
 =?utf-8?B?S0lHdWdWMlN0ZG4ybE1aZW9keVcvQ2VMYzJ0VDFLdGg5a3JsajhzK1ArcEFO?=
 =?utf-8?B?dHhremFSM1djV2FZZTZsM2NKSVFxT3VUWHFMYkhENlAxNlBEVzgvRHRDT3gw?=
 =?utf-8?B?UDNsVDZqMFlzMGNjbjc3RWsrc2c3RHFzOGR4NW4zeUR0dUtJUnBva3pjWktO?=
 =?utf-8?B?WmE1aThmVkxwSjFhc1RZWTlsblBGK2xsdE9tckRkaUZycDRQZUxuWEZVUGs0?=
 =?utf-8?B?eHMrWElpeGx5QUNuQm9pR05HSGZRUlFCR3FMWHVCZHptQnRhaEF1eTZhRENk?=
 =?utf-8?B?TDBjQmZ3UXJ3cWR2TTNsbUdpSzJkYWF2aG0rWUZYejViNndNZUdFa01DNzFC?=
 =?utf-8?B?SU9BWnh3YUVnNjdDRDljaWxkWXFRMUc5WDlpRG1iZW9FVW9XZnhqUkJDUGFl?=
 =?utf-8?B?NjdqUExtdjhSMGFIMmRWbVR3OWY1UjV1SkpJd3NISUhadlZFdC9VM2RJdFVP?=
 =?utf-8?B?U0tHbFZIdkdIc1ZOc2o3RDFrQ0M3c0FHaEFMMzFpQUE4SzFuZVhWMVZaNFdX?=
 =?utf-8?B?SEsySWlLRUNsMlFkMk5kc0p4Mk41QWlyWk8xNG9aWG5YSWc5ZnRRZlVjMGFz?=
 =?utf-8?B?R092eDk3TmYzQ1Y1Tmtucjc1ZUlmbGhwZ05XVFkvVXNEZ3ZyTUZ5bEFiN1k2?=
 =?utf-8?B?dC8vL2xiK2lzaTVNbU56TURMNlVuUjhHMG1vSWkwRVh0TDFBZ3IrQjl2YjJx?=
 =?utf-8?B?NnJheWU5RENwYVBzMDJGVkVYc0hZb0svWEE0NUpPVkF0YkpWL1pIcXpqUmFJ?=
 =?utf-8?B?aUMvN2NHN3NDeGNBWXk4amtwcWQyQXIvMGRldjFYSnJTRVZZdVg4TEl0cEdr?=
 =?utf-8?B?WmlTUjVIWXdyNG5WUldGZkMzR0NqVHdXRTRnZmI2Vm0wekN5cjkxNzlPU1Ny?=
 =?utf-8?B?NlZsVkJERzQwbDRVT1E5c1VmNXdxT0lRUUw2d1Rua1lsTXVLeE1tQ1ZqU0NS?=
 =?utf-8?B?S0RNbEJvdW5HKy9tYW53eTJxLzB1ZjdNbjdHc1RjY0RXeVpuaTBPRkZKRTZC?=
 =?utf-8?B?a2RtTzdlT2VaZzk2UE9Jckxrc3V1dzdpL1pIclpBNEtqSmMxdTdPVENDb3Zi?=
 =?utf-8?B?RGRRUVpxRHJ3aloxN0s4dHViUml5MHFHMjA5emhsT2tBNC9FWXlON094T2Fs?=
 =?utf-8?B?aFRDa2pEanp3YWxibi8rUjdCQXpwaEZLUXlZMGY5UmZBQW9Ob0sxZ0gycXZr?=
 =?utf-8?B?U2dxQURPV05rVlBkQmptbXhWclhvWGc4dmg1VWhCdStvMTJiTmhNMkR4bFF5?=
 =?utf-8?B?SzJ2Yy9seEliSDREZ3RRUGRQbkI0cURzbzdjS0pVZkRZMU41OFRqTVlrOHBY?=
 =?utf-8?B?aG1CMWZZaytXRDVYc3RqRGJieGVUMW1UcDNpeUZNRkU2b29FQU0rNXpNVnJv?=
 =?utf-8?B?aFhrWmRrbkxON2E0VytqbXQvL2VSRk5sVEVGTmdkZlFxMkR0cjlhRWtHNVNr?=
 =?utf-8?B?Nmk0bW5jMTk5YXVDaGlrN1FzdlVINHNrN2IzdlRWSTAyOTRDNWJQcXovamZo?=
 =?utf-8?Q?guQgLNUmW3HONa6DfENlRt9bhaPNT7zi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlE1bDVFQlRaSUR4YkFVcXFFaWp4MXFtZmpsOHJEb200bklTaHRkbmZxV2Js?=
 =?utf-8?B?V3ZyUU1tVXlmZlRQSld2UTY5L29zeDF4MkhGa0U1eWJJWm55VGRNRWEyMm8v?=
 =?utf-8?B?eG1GbUpGT0xBYitmcHBhUlZ1VzdubkpTT3JYanlZNFF4UUZCdWp2cjJJZ0x2?=
 =?utf-8?B?b0dqVHZZZWFjcmxJY01UU2RkU3dtb01IN00wdWwxY3JiVkJYS3Z5TGZWbFR2?=
 =?utf-8?B?S2g4Skxpb09Yd2swdmRZV01odFkvYnlpNFg1UjRJMUlTL3h1U29OOVcxVzJS?=
 =?utf-8?B?VjJ0VWdVMWhFV3J5cnNFTzRJcUFIdnRhTnB1ZnhtNXBrNXZVeWVOR1ZPOExI?=
 =?utf-8?B?VSthcndrWDh5N1lUTVJsYmJaUHNkRkZBZURhMTNpZmVVcjZLMmVMTENWUDVp?=
 =?utf-8?B?ZFh3QUNPd2FkdU1UK2NQMnlCVEw5ZnI3a3FNS0tTVHpkZnlDaUNYWmZMVXB1?=
 =?utf-8?B?MXVRSGVUK1BTTGpVQ29vdmZ2K0hBWlRWUkpJMm81YTR6WHFqcVZLTDlGVk1R?=
 =?utf-8?B?WVR1Z3NCc2hPYnpmYWNhTGpBR1EzVElYUTV4cFpFRXppRjVpdVJYd2V0ZUNx?=
 =?utf-8?B?MFl1VENWK2lvQTl3SmErQTh6bVo3RktXTlI1V0Z3RG1HallRa3hhSlZlQmVX?=
 =?utf-8?B?SlZVdUdUVU5xQ0Vab1ozWmlNNFNZdUZtVGxZS1A1MkRRZWdDTWdVMHQ1ek5K?=
 =?utf-8?B?dUFvY0FEeGk3VlNxNVc5UDFjeUhUbEZkaWdRUEhYSndTZnBscm1ZaDFOektn?=
 =?utf-8?B?TlJ2d3dYdUR1V0NneHZTNjQ0WmZSeC9hVVQrQ1lRYXJub3RFc2pqQVB4L0lJ?=
 =?utf-8?B?YUlnck44SldndHhwaG03VVM2THlFYi90NTNUQnlLMThqcVQwV2hLNllLMFhq?=
 =?utf-8?B?OHNDd2dsc0F1UVNjajZnc3lBWTc4QjNGcExUa3RlU2JqZGNQU3JvbmhHWERK?=
 =?utf-8?B?SHlGenZRSjRGWE5vbzl0Ukk0T3U3bkRIdmgzTDdLUXdqbUpTZjd2VjU0TUs5?=
 =?utf-8?B?MGcrOFIvaVpTVnNtMGR2QXpNdXBhY2U1NjlCWFJOa1o2YWswV2NkdG1jdm40?=
 =?utf-8?B?MDYwOVJEZ2h1bjZLWEVBTjJDTWZkV0tYWmxBcWhFSVVRRWRzUUxIOEI2T2Q1?=
 =?utf-8?B?Kys5YngrckZ1Tk5YMmVVOEVYR0xSSHVUb1lEcS96WnlXb2p0aXJndlNqU1da?=
 =?utf-8?B?SkJUOEtvSlNzL2p0WDBLWk5LQk9IaWxDMmxCcUtra1hyNHJjZ0ZlelAvZzlr?=
 =?utf-8?B?dzlrcy9ISGVkdUhuaU1XaWxGOHJ1TUZzTjZRUjhweCtiRWR0RzJXUmk5ZGxU?=
 =?utf-8?B?cmNOU1ZPbmxrcjB5c1J3ZHBORUM1YWdUQnhEemZiUVlIUFI3cUxtTkhkSTFH?=
 =?utf-8?B?UGJNZjV4c0k4QmtUUkdoT2p4Q0hxWmFoSTk3ODBKcnBqVGNnelZIMXBKNStv?=
 =?utf-8?B?VGRaVDFuVlAyYmkzaS9OTG43U0JwN1BwTG9vbDJISlB3UUtlaUpCU3FyUS91?=
 =?utf-8?B?VnhEZkQyVXA4MGFzWk9WMGpZSmZHTDkzL2lsVnh4TDA2NHk2d3VWdjZSL2F4?=
 =?utf-8?B?b0JIYXNvdmtHdGNhZzFRcUZPVE9OTUtMdmdwTkF5VVB4ZmNUdjdtNDRONEQ1?=
 =?utf-8?B?aHpNNEtORllheEtvNjRvZlRiZnVUVFJEdVJjVnJCdGRXanlMTkpBRDk2NFEz?=
 =?utf-8?B?OFVmODZDcitESHpLbFUwV2FiUHgyM0lxVXAwSjJJZ21wT1c0bXVHU0lPdk5j?=
 =?utf-8?B?YnBGY0xHZlRIN1JsR3hmdVlYeHJ0VG5sbkh5Zm5XRUh4K25lWis5Rk9tUlJx?=
 =?utf-8?B?bUVwcDA0cWNBUWk2NHlOb2ZzSGlhc1ZzbDUxT05RYk1sYjh6bUNBbWh5emto?=
 =?utf-8?B?TFN4NHpMdHo0WlV3eWFyQXlXN29sSFAreUZaVGpLTDlDMlJ1MmM0OUJqb1h3?=
 =?utf-8?B?bXVXRHBycTQ4S3BlOWlFSGRuQ1ZxeVN0ZjlTb0RMdjVDY1hHeGlORTIwTzNX?=
 =?utf-8?B?d2ViQTl5RXRzZ2JBakxxL284ay8zSVd1b2hYTWRCdHBhbnc4dlBUSG9PNGR2?=
 =?utf-8?B?VGo4TFVhSkRzcTVyTDdQbS9jTFl1bUpzdkhNS0R2ZUNLbmsrOW93WEVLQXdJ?=
 =?utf-8?Q?hHvVG1Hu3O1vvFWpiduOtO63F?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51f0c468-7c2d-4f2e-631a-08de37675f05
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 21:10:25.1080 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1AaTSWJTYjkIKix/ucwAurbLckA8OHuAEqsPaRW+s96r+F9lMZ4t/Z2B7NDgXwB9TKi9TMgNlYchx52Se/LurA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7818
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

Reviewed-by : Vitaly Prosyak  <vitaly.prosyak@amd.com>

On 20251-12-09 07:51, Kamil Konieczny wrote:
> GitLab pipeline now run without this symlink so remove it.
>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Rob Clark <rob.clark@oss.qualcomm.com>
> Cc: Ryszard Knop <ryszard.knop@intel.com>
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  scripts/verify-blacklist.sh | 1 -
>  1 file changed, 1 deletion(-)
>  delete mode 120000 scripts/verify-blacklist.sh
>
> diff --git a/scripts/verify-blacklist.sh b/scripts/verify-blacklist.sh
> deleted file mode 120000
> index 7f706d61b..000000000
> --- a/scripts/verify-blacklist.sh
> +++ /dev/null
> @@ -1 +0,0 @@
> -verify-blocklist.sh
> \ No newline at end of file
