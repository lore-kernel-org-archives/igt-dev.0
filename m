Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23AE1C197BF
	for <igt-dev@archiver.kernel.org>; Thu, 27 Feb 2025 05:08:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D590410EA2B;
	Thu, 27 Feb 2025 05:08:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tgfuloiU";
	dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2079.outbound.protection.outlook.com [40.107.96.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A8E10EA2B
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Feb 2025 05:08:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kko7ZfImk0emcs2jsViVmTg8rNVbLLa3l5z/zQamyd0A5YqtP11clKVvJ+FOpSdnM10Ue62Kznj9wxHpPXpB0t26jr90b35PQ3zfhqRjqmGSPDFyRN3IyXa9vR2d6mrR+FC156MSSUzMxf3ZvkJeaOZv2IgcfanTsk9isb48C2PG30HcToY01TzgPMg6K/v74zwT1VEqE4afqzmUKFNZlbaCxzni4IgsDjMq1ypz0PGuYec9xfM5PoU3g2wJDV3KcSOZ6I+nHNnxqNRJavvyUr+84JZ7Lz8vKf2k2m5HcecrVtD/e8G4+aDeBm71fglHB5M4T5tg+Mg0A/yHVbYg/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X6PylsdLhqOh1r0jl9gTvniLGpCVOEvcKg4e/JvFI7Y=;
 b=X5hFbd93MM/3XvuGUUc2ALYC86b7Sx0yTQeYqbI5+d3Nqogj56p7N/WQAm1lV+kVNYwBtMRd+1yAbsRnfzgflS7tK5G8dBbig41+jCUC2Dp+gmzn3T/m+2eeV4kMzVpErp6u8ITOMFCyuhoW/3/Ytm6jMtZrgqhxQKJBiqn1boljijszfFNjwEpip6tvffk20R6BGAswb6ddkCj0k/n4xXLlKiI15m3SmiFr7uNAD7KpyiukTEWah4LBybkHwIwx8jQUBIF7RdQi9DZQwTsOZv5yK9RO2W+7fxud0aigF3a/UAAmN+Ik6Jl3zzZznwbp5L6Ui8YIrt9TUcR+KY70QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X6PylsdLhqOh1r0jl9gTvniLGpCVOEvcKg4e/JvFI7Y=;
 b=tgfuloiU/+VF8HZwNU2pVoeacvR4NWUJsqbG9j7GDPXo44ad5IGN+BVjMQqVLsZJ20AG6P+KiahNVXCTAfg9OhbzP2oUqxRc0aghZlKb0d9wExSFxexe40TaQ3RdDOf/BPuOmj2TtfSvXPsNe2lUB+QuqptR001K3Jo7picijTo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by MN6PR12MB8490.namprd12.prod.outlook.com (2603:10b6:208:470::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Thu, 27 Feb
 2025 05:08:23 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%4]) with mapi id 15.20.8489.018; Thu, 27 Feb 2025
 05:08:22 +0000
Message-ID: <2a494d9e-d771-4bd6-b328-517b7cc7dc50@amd.com>
Date: Thu, 27 Feb 2025 00:08:19 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib/amd: add memleak functions
To: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 vitaly.prosyak@amd.com, igt-dev@lists.freedesktop.org,
 Christian Koenig <christian.koenig@amd.com>,
 Alexander Deucher <alexander.deucher@amd.com>,
 Jesse Zhang <jesse.zhang@amd.com>, Harry Wentland <harry.wentland@amd.com>
References: <20250218114341.122653-1-vitaly.prosyak@amd.com>
 <20250219104149.npgbvmtr5vikkkhr@kamilkon-desk.igk.intel.com>
 <93281b6c-1ae1-426e-aae7-46974d355532@amd.com>
 <20250226090958.32igx6wiy4svxw3h@zkempczy-mobl2>
 <9c5d27e4-12b2-4597-97cd-da72bc07d1dc@linux.intel.com>
 <20250226100926.2qkfqmrm4e5qsunb@zkempczy-mobl2>
 <1ec35fc8-92a5-4e69-a562-142745f59659@linux.intel.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <1ec35fc8-92a5-4e69-a562-142745f59659@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0074.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::7) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|MN6PR12MB8490:EE_
X-MS-Office365-Filtering-Correlation-Id: 418242bc-f399-4198-5b5e-08dd56ecc230
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dzA1ZzNjUzM3SjFOYkpDYkg0WkJ0Y0pzRjh6MVBwS2VDc3hvZEZYQ285WDUy?=
 =?utf-8?B?bjVsWHhjVUxpSnB2M3ZHcStzQUVYMGZZUzgzNjB6VWk1alZQZk9RNC9mUkZT?=
 =?utf-8?B?YWE0SE4vSDhkZGFqdXNYcTc0blhkS3p6dlUyT2dOR3FBaVVuZXRwQlVBcE5U?=
 =?utf-8?B?VVJqR2xtRUZ6TXJ0T1pkTFM2ZFBFclJUaUVHb1VzUndHY1VBbU1aVkNGT3ll?=
 =?utf-8?B?TVZ1NmM0bSsvVlFiQTJYZWtTM1BzSTU0dWtXd3FRMFV4eDZjV3RiOHNadnZC?=
 =?utf-8?B?WkR0NXlRalhGNjJKY1N1cUFiMyszRDZDSmVmandqK1M3cGRFekhvZG83Qmww?=
 =?utf-8?B?bC9xZ0ZXR2dWdy9oUkFHRTZ4ajBuRUFqN0lQWHM3U084b0RTK0VrOTBkaks4?=
 =?utf-8?B?S3lBYkNTYkRLSTVUTzZSUEpySDFrdHA1aFlVOWMzcEZEdDR5eDhZMFQzOFFk?=
 =?utf-8?B?VGxua0xtek1iVkNlaGdLWnhWOEtHS3ZKZWlmUmpNK0tHY2VpdlErWHRVYlNR?=
 =?utf-8?B?dzhEZnhBWGplV2FUVlRZRmJaelE0V3YyTGJvUjVsRnJnaHA0YnlDUUVDaSsv?=
 =?utf-8?B?V0N2NDhWb1dDS21mbGdobDR3OEJGY0RaZ3pVdzJ6a1I5U29CMlZtaTVJV1Vw?=
 =?utf-8?B?UFNSOEFyVVFBM3ViVnVnUkhSZ0E2U0NnWmU0RnJNdmpzcnBvdXlWRUxVT1hD?=
 =?utf-8?B?cnZiL1ZlTWxockl5c3RaMjJBOWU2R21CRFNCODlWUG1IRWpna0hlbXdKa2VJ?=
 =?utf-8?B?bjZ0ZjR4aTQ3V3RLV1RBMExBOTNZbWMvOUNGeGliWlIwN2lIRmtXeE93V0ZV?=
 =?utf-8?B?Q1d5aitIay92US9OeVk0a0wzWmZuNDRlRTNDR2g2RTlQK2hwT0JSaUdrT2FK?=
 =?utf-8?B?cnV4bHVjWmx0cFpqYVQ1N1RPNGlIb1c0M3hJQ1ljQkdUd1EvbFR3SE4xM20r?=
 =?utf-8?B?ZzlCUDVMS1pDdit5dXVaOTl6dTNqcmpkS3lud3pHK1p6WWdQeVJCS2dLaFdy?=
 =?utf-8?B?RHBvSW5VOENvK1pKdUoyZmdndzlJWEZXc0k3OWpTTmNxV3VhOHdVY2NXL1NM?=
 =?utf-8?B?NVV3MEJuSFp5Zmo2aHh2WTdkNmdCeHRPaFBWMVc5UHl4UkQwVmwzSVZFc25X?=
 =?utf-8?B?OXAySmhtOEVEYlY2RGpUSnJ1SnNlWVJMTVo0SThUYnVnUi92OUlKYWRaRGdQ?=
 =?utf-8?B?ZWxVcW40V0tTWDlETDVOUEVYTHpEdWpFQUp0djFHV2JCWVBDbVlQc3B1OXpx?=
 =?utf-8?B?R2JzREZVb2JaTnlCSlRQT3Q1Si9ZTW5CQjd4OXAwQ3J0Y2pqWmJudTBHSjU5?=
 =?utf-8?B?MGpISGV1VEVERzAvSVdmNEl2czUyTlZiUUtRWnVZOTNMZTEzcHZtU3drN0Y3?=
 =?utf-8?B?aEpQWXUzNG9SaDZCdUQ1RFdaZnltNDhpdFBSd3VzODJnTlNXUXNERkRoS0k5?=
 =?utf-8?B?Z2MzRmoxbDVNcFRaaVIyRVo3RXc4bWU3QTRzdk1RRzdRN0hrQnZDRjhablN2?=
 =?utf-8?B?eEh1WnBNQURJbmNWTmlhUEZRY1I4aVNhTUkreitDdkM0eFVmOUJzT01pSUNm?=
 =?utf-8?B?QjgyMW1kSDE4TGhCTjlYK29VeHI4akJPVmtnbGRpcGlKK2FTWjY1ZEVub2RE?=
 =?utf-8?B?d1d5MFF2NTBiclprZlV2NjZ0cjdQYWsvSjd5amt1blJiS0hPM25yV1VLNG1h?=
 =?utf-8?B?R1JVMkNIM3h2VmVnVVc3dHBzTjJOWEVMcFV2NllUVE95aGVmQXZQb1hPUi95?=
 =?utf-8?B?aVVheTVkL2RhakRicVdzQlYrQkJHeXd5OFQ0VkRYMjlzc3RGZjZOalZVaUdZ?=
 =?utf-8?B?MHFmN2plSWNFMmkyZUs5dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2hibzZxeDhTcGJPZmZnZkJXSkNvSWJsYVI1WGlOYm9FTjlMTEovanM4VFdX?=
 =?utf-8?B?ODgwZ21EVjV6bEhnNWJsY1BOWTBPcCtScWhPZVBXZEZHaXpKUThac25tdlRz?=
 =?utf-8?B?bmdEdHJnU0JRRnhOQ09jbU1WMUpkbkdlWk9IRDJXc0R2aWlhdDZFU3NRY0dk?=
 =?utf-8?B?NWd4eUdjWkw3Vzl0RlBjSWs5Ym1vTjkzcjRmbnZSa0s5bVdRRlg3STgxZklI?=
 =?utf-8?B?Vm9UUi9LNFRzZHVGTUNsaHNuKzIyNkFucUtLaGVRWkpGalJiNk52QUltZGtM?=
 =?utf-8?B?QWVkcVN6TG5vMGsvQnMzekN1QUxScXUxWWQ3SUlablNVTTREdUp1dmc2dEZa?=
 =?utf-8?B?VjB2cVZWazhYWXowYlZpdjhQWUVLMERVOUY1OWVob2xVMFEwS04rSDcrRHF2?=
 =?utf-8?B?MThIc2NuWU81L0FDaTdiYjgvb0tsWUQvMUVVLzN2M2JUMlV5TXp1UjgzNDg3?=
 =?utf-8?B?dEE0QTl4WU1NcEl5K0Zyb2krZzYxNjhLamtXTEkvTzFOUEx6blpWNWFSOFo0?=
 =?utf-8?B?MmxVVG5SbFp1YmYrdVJ6SGNOWkJnUzFEcE9jRjJoZlhaRm9xSThvWGJod0RC?=
 =?utf-8?B?WjQzOGdUd2xwYWlnODlqQVVxd0tZdkp6cHV4aFQ0YWJZRjlyNXJ6UUtxTldm?=
 =?utf-8?B?ZHlLdnJLaTJmeENCSFhIUUJqcms2c28zWFRCaFBmSC9VSkhPeGN2Z2N2NzVl?=
 =?utf-8?B?V3FUeGQrWVF1aUNjQXl4dFd4eHVLMnZNNUYvSE5ZdkZaWEFUM2UrMUZEN1Iz?=
 =?utf-8?B?VkpWQmN2dTA5dVJiZjRXd2V2REZFMUY5d0x4VExheXVYd3BFZlU1TExEcTFL?=
 =?utf-8?B?M284RWxRNUsyOGZzZm4xVk9QODdDVDJFQ1NUakttaWUzeFpxVnFjc0l2VVM2?=
 =?utf-8?B?Um1VVXhEN0hBV1Y2RU04NGFpMGhLUHg0T01SOXlQT0dVa3h3aUpOS09oMVM4?=
 =?utf-8?B?bG9PSDQ5YzZxa3orb0JRNGw0bjFXdDlEeUlCSi95VlRXME1vOUJzYjlEUkgx?=
 =?utf-8?B?bGwvUkZ4MWN2Wm55Z29tdi9EemdDeVlCWjAraG13aWIxQWR1MWtEUnJiSGR0?=
 =?utf-8?B?ekRsNWIyQlUrUXNjZXNlazNBdFVXNFgvYmFlRHlob3VyNEZ1NUt4RG1yWEpx?=
 =?utf-8?B?VWRQV0RDVktPdkF2UnZVY3RZTGJWR3pZQmtpOFVsczlidnNnRG1QM29rMWpj?=
 =?utf-8?B?OS9Bd0p6cUowc1RFYWxsR1JPZTQ5RW5oTEVXTkVCQ3BwbC9HcVBkSitvZDlt?=
 =?utf-8?B?L0ZJaEsvbG5IZE9DR3VmbVlsdWk5bU5mZDl5Y0xYVDhQUkZGUlNNS0FBWEJx?=
 =?utf-8?B?TWU5Ry9qeGRudUliTWh5ZTA3OCtwYXRoSEJET2xsODQ3TzhIZTFuOHMvQ0RW?=
 =?utf-8?B?S1daUEZpSE5pbUxyN2k2N1ZIOGEvbk9KeWdFejRCcHZCbWRLSkpldWdHdlFJ?=
 =?utf-8?B?MnNvWUVUMDBCUmdYMXFnL2FhZEx2bk1nR2JVditpSFBKMkVCSlVucCszbnhN?=
 =?utf-8?B?a3pDNmhvMExSTElPVk9hMUpKVEd4Y0Jlb0s5RlpHeUxvOUhTemhDT24xcVhP?=
 =?utf-8?B?Si9mNzlBNHNWUXU4NkFXK3RZaDd3dHVETkFoMCtLMHNvcFRhLzVLN2s0ZGcw?=
 =?utf-8?B?NDd0OEJzb0VVd0tkK09wSnhkUEszT0haVGFMTFpuNEpsL0c0WnJLVzhPOU1i?=
 =?utf-8?B?ZWRmUUJFdEYvZjZDU0lPTnY5ZitPYnlZMEtLQU40Y3NuRVV0ZlA2Z1grVkNI?=
 =?utf-8?B?Ynd6RXRyb0plT3FxR0FFWXl3cmZkR2FuSkFmQWpSWVhSSjJkZlhIRVhQK1JY?=
 =?utf-8?B?NklhdVk4Qm5mWU1WZitmR3d4KzhxK3B5VDB2a1MrRGFsVXR1Z0xjdlE1OU9q?=
 =?utf-8?B?Z09DNjJyelFxaGxxeWs0SjRLRTU2WlpNUUxSUmw3RXpFc0w0QWlNdm00NTJZ?=
 =?utf-8?B?Qjk4YzlIQm94dHhBSkJKSlNmL1A5NUlEOHVIcVR2OUdNYUV6bWoyWHp1WG10?=
 =?utf-8?B?V1gvUmVvUGV2VDVkUDRWWFpEbGlvV2pMZGlvTyt3YTI3NXVUbnpVd2NENFU4?=
 =?utf-8?B?cHlsdW1ZbE9uektiZ1NWbGszSWhCNndvb1ZIc0FpRUhDU0s2NHorQ3ZqSHVz?=
 =?utf-8?Q?HCtsmysfvJ8xMs0y+Ms3E52A5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 418242bc-f399-4198-5b5e-08dd56ecc230
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 05:08:22.8563 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bGtGhysmVGitz79+tbICtsyGCh7qY/Pkt+e+AQ5EgMigcsD/qCQy55kz2oCQDE27C6TGDXj2cQEA2ztoGGrpzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8490
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


On 2025-02-26 05:24, Peter Senna Tschudin wrote:
>
> On 26.02.2025 11:09, Zbigniew Kempczyński wrote:
>> On Wed, Feb 26, 2025 at 10:43:08AM +0100, Peter Senna Tschudin wrote:
>>> Hello Vitaly,
>>>
>>> On 26.02.2025 10:09, Zbigniew Kempczyński wrote:
>>>> On Wed, Feb 19, 2025 at 12:50:49PM -0500, vitaly prosyak wrote:
>>>>> Hi Kamil,
>>>>>
>>>>> Thanks for raising this question. Currently, only a single test uses the memleak feature. However, we are planning to add more. This effort requires careful selection, as we want to avoid unnecessary overhead or burden. Enabling the memleak configuration significantly slows down test execution—potentially increasing the duration by 2-3 times.
>>>>>
>>>>> Additionally, we aim to reach internal consensus on which tests should have this feature enabled. We also want to avoid enabling both KASAN and memleak simultaneously. These considerations are the reason for the delay.
>>>>>
>>>>> Thanks for your understanding!
>>>>>
>>>>> Vitaly
>>>> +Peter
>>>>
>>>> Peter proposed solution which is global and vendor agnostic. I mean
>>>> his changes https://patchwork.freedesktop.org/series/143996/
>>>> allow you to selectively run with kmemleak on using runner (-k).
>>>> Together with proper list selection passed to the runner you're
>>>> able to run only tests which you want to check for memory leaks.
>>> Thank you, Zbigniew! Just to clarify, my patch currently supports:
>>>  -konce, which collects a single kmemleak log after all tests have run.
>>>  -keach, which collects kmemleak logs after each test.
>>>
>>> However, after reading this discussion, I came up with a proposal for a
>>> new option: -kfile. With this mode, igt_runner will collect kmemleak
>>> logs only after running the tests specified in a given text file.
>> You don't need this, testlist is your file.
> Yes, indeed. A test list + -keach does it. Vitaly would you comment about
> the current approach in the context of your needs?
Hi Peter,

Thanks for the update! I really appreciate the effort you’ve put into making the approach more global and vendor-agnostic—great work!

It would be incredibly useful to have both --kmemleak options available (for the entire test list and individual tests).

Could you kindly provide guidance on how to add these options (-konce or -keach) to igt-runner? For example, how should I modify the following commands to include them?

sudo ./scripts/run-tests.sh -t -v /home/vprosyak/src/igt-gpu-tools/build/tests/amd/amd_basic  

or

sudo ./scripts/run-tests.sh -v -T /home/infra/igt/custom.testlist  

Thanks again for your great work and support!

Vitaly
> [...]
