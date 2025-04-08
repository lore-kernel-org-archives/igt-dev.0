Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F727C369A1
	for <igt-dev@archiver.kernel.org>; Tue,  8 Apr 2025 18:54:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E919310E171;
	Tue,  8 Apr 2025 18:54:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xm+CN4W6";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2053.outbound.protection.outlook.com [40.107.94.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A4310E171
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Apr 2025 18:53:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E96ZgkxN9jnw0n0W3Kvhfkkpdy1QwoSBXUirsc6/p7NPaTg5OIPPijCvhBshgVTThO4PHpVdZK+5KUhKFgmAXUUKh5fVCDGjK7n5VGLHTO3N5pJyb9KC2bW3+w4at8pKeDOL3cSTI+qQJyI9BRjePGacdUB+61ZXA3KsXPtYJoxR0eXo+3SoY2T9PPVQAWi1AXqUXQjpCa3bkMwgVZco8MNXzxfoDLQcGYFsE25ZtZ9jPvFyNRpBZm95WxQOKK7k75ygxgxmW1qsvuEsCmQpin8HQo6eKaHpdw7lVuk2cYxF+CibcC1Xmxp1iwn67MmpLW17y30OjsOteE//UabSjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E+xgW24mM2NIKuLaKOCsGU/nlQvsmm+xPIwVvhBoCNQ=;
 b=QcMUdjpd+7MBNqVlpbBvlhtjilVJrzzFLZODHNJjbLeGO5N9n+6KN2oBgDlHHRKWrPkVEKFEHQO3I7Tv7buLgEtZB2pkoLIKqpOGe0YOAWtNDtPGty77R4UT/bsH9BPYDw6P0qN+ACR0Dy+aboRthL87+pJHKUAcgSxw8PVzOcHSz63/sDhl8LGRGKnCUL4tyW8vyRxahbesSpSd845SdGWThrVRjBPSxCU0pEECUdcuW3nipN+cxq2Uhoa7xfvACNq0lFf1da7Ygi0J9yQrpnACQt1ICJXmGi0DLvGceMdh/2nxn7pQoq+kvJpUs3Shvb67LZKjZmK79F4S2z1z8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+xgW24mM2NIKuLaKOCsGU/nlQvsmm+xPIwVvhBoCNQ=;
 b=xm+CN4W6yYxhrf2FTVCkfQuDyw9HqDKHb5Ld0ECpaX6WWq4riz7GaVsL0zVYn5iNv6HWr7PELiW2ysY/ORySuMd0nLRtkf0F2mTMVjZlyt6kLfVUsJCCleQC6CWVuiJ8z92o3D7dh7TIcRqypX158APa2PAXKGrINMWWuWRWRbA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by DS7PR12MB9503.namprd12.prod.outlook.com (2603:10b6:8:251::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.46; Tue, 8 Apr
 2025 18:53:55 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%4]) with mapi id 15.20.8632.017; Tue, 8 Apr 2025
 18:53:54 +0000
Message-ID: <3a9ad1a0-eaee-4049-b07e-d7e352853373@amd.com>
Date: Tue, 8 Apr 2025 12:53:51 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] tests/kms_async_flips: Create subtest for overlay
 planes
To: Melissa Wen <mwen@igalia.com>, =?UTF-8?Q?Andr=C3=A9_Almeida?=
 <andrealmeid@igalia.com>
Cc: igt-dev@lists.freedesktop.org, Jeevan B <jeevan.b@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, kernel-dev@igalia.com,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>
References: <20250408000221.140459-1-andrealmeid@igalia.com>
 <20250408000221.140459-5-andrealmeid@igalia.com>
 <afnz6bdd4ocgkhj372owmzarejsrsyfbtettjhhsj73eqv4pxz@mt3phtr6l3wp>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <afnz6bdd4ocgkhj372owmzarejsrsyfbtettjhhsj73eqv4pxz@mt3phtr6l3wp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0151.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8c::12) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|DS7PR12MB9503:EE_
X-MS-Office365-Filtering-Correlation-Id: 91e5c7f1-7733-4e66-4414-08dd76ceb5cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SlJTSnBHN3dDd290RmpvRmJzZUU0azRZOHhXVXJZRG9zckNCTno2V1d0QUhj?=
 =?utf-8?B?SVJvRkJPQjQ4QzNBMXBXN0l3TFpuM21leU5idnZlUkcvRmJYLzBrSGc1azRl?=
 =?utf-8?B?dDUyZVduekY0MjkvM29YSzFYbTQySGNMRHBpQkZqVngyTjh3ZVRnVi9jUUpp?=
 =?utf-8?B?STFXeUJ4cFRabnE1OHVMVjRrNDNGSkF4VHo5UjcyRlBtK0JFNGFrdDJzbXNl?=
 =?utf-8?B?Vk1XTEFFRy92RlpPbGFIMWhCb3BZV0hSdFFKUnk2YSt2SWVNQitvSWM0aDNr?=
 =?utf-8?B?VStpYnZBMVQrWEN4M1kxT1lMUUUxUVFTNTlVTGFCVk9qcmFvbjYzN0VMZnh0?=
 =?utf-8?B?WWJBdXJhcmY0dXdQbXhTbE50WnlhaTlHNmM0TnQvaCtiWENNdVpQa3JjQzMz?=
 =?utf-8?B?ZkZpeHRuandwb0g0OEMvWWxsenNJQXFzL2VsdUlIbkh0WlZOK25vRmJTVCtm?=
 =?utf-8?B?LzJFWHJ4TkVIb0hNaklTUkZOOXFuQTJVSTNod1FLRkFtd1M4ZlVSM0tBenYw?=
 =?utf-8?B?ZjJ4NDJUS0dBeWx1bUw5RGNxWDVYTWV4L2l3NUUrVklXekdZYmRkZ1JuVisy?=
 =?utf-8?B?RnJPM2ZORUhIN0ducS9CV0d3bEtZanhPSEFkcmdIN3RaZU9nRC8wMGptZ3ZF?=
 =?utf-8?B?ZzYwYVh3WXpVL0s1eWJaRU1XRXplR01rYjNSZDVDbnVpN3IrN3NUWW1EazFK?=
 =?utf-8?B?NjlTckw1T29zZ0tyMEVXeFR2bVV6RVplcmFGeFY3bnhoOUpkNGg2alAyUkdw?=
 =?utf-8?B?bEJIRlJtQXB1VURseDJlTmVFcldrSEt2Q21aeEhGWTFTOXV0YlJGOTlnVDg2?=
 =?utf-8?B?cEYvV3AweGQ1eFVYNzZnT3RJMjdwSCtOOWFId0dVL1NnN0tlampWSlRrVGVB?=
 =?utf-8?B?UWFIWGFzYldFVnpaWk0vZXlCY0tRa2lYTzJ6emNUMlJvSkVzVHpqUHBTVENo?=
 =?utf-8?B?OGtlNFZ1NjFoaWN5NkN3VVJ1SjFhREdIdER4cjRDYzBCUHk3cHQ2U0hNa25Z?=
 =?utf-8?B?VTg2NEVpWXpxNWdDZGdXZGg2Zm1FNHEvM0JaaDZHRjVjNEpJZDhHSzhYcmpD?=
 =?utf-8?B?R0tvYXRhU2JQS2l4YndiVm81enYwV3Nmcm9wUjNhWURmaHVCendCT09CbWxO?=
 =?utf-8?B?RmhlenY5MGFieUgzNUtVbVJCbkpEbXNaVnZESVV5Qk9WVHRIR0dnRzhCbkVZ?=
 =?utf-8?B?VGJFREwrQjRvMzhBRHpvK2E0Yy9JVmtJT0puQnVCaVBwbWNBSHBXZDkyZDZr?=
 =?utf-8?B?dVpQRmh6SmUvUExMT3dKV1hwUWZpTHdCd3c0UU1VM1hMRGZkWndaRVpMY0g3?=
 =?utf-8?B?eVpIckEvUFRsVUZ1SkJRR3ZLWGhGNVBueElERVBac2VyM3gxMjU4SjFFenBn?=
 =?utf-8?B?bGlRRFFMMWpnNjFwVzJKUThhb0xBN282cnRnM1hCZ3RjZU9sQzAyZXpheTBS?=
 =?utf-8?B?V2g4WFI3QjZLMEg2TEtZV3NONlhuYU5NUTBBNEt5ajE4QWJoaVBWb2dlM2tw?=
 =?utf-8?B?U05YYnlXeGZsSmpCdjdkNjU2TjNTeDBTQ3YvM1IyS1BMR3plOEloOXI3NXly?=
 =?utf-8?B?a3RQUXVWL2lRb0RzVmZoSFl1ZGxaYVNjQmRyT0d1Z29SVVAzRmZyZHNXRFZn?=
 =?utf-8?B?bnNVaXhDTDdNYk5naDFEaGJKdm40RUVjekFxVExnSFdocTA0N0lkU1NXUGJ1?=
 =?utf-8?B?TU9ISzJ2akV0eWJVQ0U2SkNxOW1IQ0dkUURPaHJhUkQ1OXlsQWl1MS82cGJp?=
 =?utf-8?B?ZDlhZEc5RUw3NkVSOW1wYnVYa1lFUTBLU3lJRjFFNnNmay9ONjQzVnNDVTNz?=
 =?utf-8?B?U3hhSkdDNzlxLzNmdXVWUXc1ZEF6MVlRL1FFanRBRzh4OHBSUkd3cVVpNnJ6?=
 =?utf-8?Q?78iC2MyJW+kFQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVZ4Y2x3NzlpUXcwaFVrUVE4dTBSVE4rK3VYMFBQM2llbnJmd1laeXhFaFQ0?=
 =?utf-8?B?emMrNDc0Y0wxVENCNzFIV05VcVVXcndzMG96OW5DQkhWUUtnSjBpMk5va2tY?=
 =?utf-8?B?SUVXaHVOUG1PUEIvbkpVQjg2dW5hWkJhbzRGN1h1eVJVSDRQbU5HOUVRSXlu?=
 =?utf-8?B?RzRveGsrTXhZM21mUllKb2lha3VKaFE4QUZOVjhnUXlURERTS0Y5SW94a0Q4?=
 =?utf-8?B?WTR1UVI4YlpRZXdiWlBoMUdtTGVCTy9RVDNQczQwTEFDTVRBK1Z3VkxNMzlN?=
 =?utf-8?B?M2lqM29oVVVTTUZ6aDUybXVSaml3bWEwVkZKN0ZTcjlvM0x1YnVKWlFXSnJi?=
 =?utf-8?B?SVIvVFRUVnJjTkdCYUt5NitGOWlsZWFpN2h3Y1ZYSXBPL1BsVlRvTGwwRDlG?=
 =?utf-8?B?T2Z2Q2dNK1VhUmt1SnJDL3ByT1VyWDVpeUtOTjFrY2ZveU12bk1NcDRyMWc1?=
 =?utf-8?B?cjcxRlppRjluMW8zOHJRU3ZaZTJ2MElsUXhMMWJqQ3F0eXJXbWxVRjFPdTVo?=
 =?utf-8?B?VkUvY1g1ZmkvL1B6dktjOU55VGhWcnVybnZIc0NBMnFHQ1VhSFRBYU4vQ0tS?=
 =?utf-8?B?MUlQakJOSWZpTG8xN0I2bDRFMnlTckFZa1pYMHNIeGhicWZtaW1RNFF3RU95?=
 =?utf-8?B?M0Q5a3duQlI5QkwrU21Ja2VKK0dtSDhMYkVxVEJpSDQ2N3podVZtVzBzZy9s?=
 =?utf-8?B?aFR4cVRUOVZEQXo1SUNrTmdXWFZJRDdJYVloUHVPT09sUXRGY3BCcFFDNlVs?=
 =?utf-8?B?OGdvVStBM0FXWCsrSjdCY1VIM21XVTIwN0grQWMvR3VnYWc2RitXYmdhL2Z3?=
 =?utf-8?B?dnhsOE1LN1I4N29PeWtFUmNzdHZScGZjci9BUVF4KzhjRTgySGVENVZoakRo?=
 =?utf-8?B?aGZoSjBpRTlxSmg5VUxnQm9QVjQ1SEJFbktrWTV1V1JzUWVDWDdqbjlYUCtD?=
 =?utf-8?B?dTFYWkwxN0hUMGNkdEREc0NMcjU5MWJ1SU5vZEpOL1ZpUGxoR0pwZmNIUkZE?=
 =?utf-8?B?TWI0Zisya05UMlFoait4czd1TWpSYVpCdndCMVdidVc0NlVwZktSRXpzZlVx?=
 =?utf-8?B?eXZUbUs4aG9uaVdDRmpPWWJSUGxZQ3IvdDI2K21xbkZnV0hFdTROazhhYmJR?=
 =?utf-8?B?TDdzT2xkdk5NK3p3cWdRUllxd0hIZ3EreFZGYWh0VXdXZ05YUWxZelQrRWNM?=
 =?utf-8?B?NHVPUUxQTlpOL3VDR2FjUzZueHN0U1dPazdJNkRzME4wMEljOG8vQ3MzNkxQ?=
 =?utf-8?B?bktMZFdIdjhNM0pLeDNOMDBzSml3bG5Yb0VUbWVWS3ZxOTNZTmZMMGtGZlk0?=
 =?utf-8?B?Y1JFOGU1Y1p1akhNTzF1TUlxbWxPeHh2MnJFMHYyRUtxbVdXd2xQSmNFbTNO?=
 =?utf-8?B?eHFGUnp6OHIwK3lrR2tickFXMlV3MUZiY0NNSEVuUlRqYkNNcEJqd0JHdHE2?=
 =?utf-8?B?UjNoSHkyWFRwQUpMNjVtR1pKTFZGdWVpZW1PcTB6UHl1WVRSNWg4bGtzRDBZ?=
 =?utf-8?B?Q3pka2dqM1paMjR6emM5RjRMTFdrWUhkbzBVcnFjWkdjSjROUzdJZDVxWVR1?=
 =?utf-8?B?YlNaOFpycHc0cVFQR1JkUGZ3cUJ0QkUzNVhNc2RnL2t0Z010OGxqelBhQlZR?=
 =?utf-8?B?WDg1WWRvd3E0VDZRSmR6aHNVVnhReFpGYklxMzdxdlF3c2F5d09WL0xJeHpy?=
 =?utf-8?B?M1NzYnNZcDdqbDJjajZCTzRhQ3NGakhRSGw4eUdIMlBsbGpwTWh5SU15c0Rh?=
 =?utf-8?B?YWMxaEpJZUdNUWg4cXk1eFJHcTdRTWhqQ05DTHlRV1JGdGd5ZU51SVdjeXg3?=
 =?utf-8?B?NFdRcFRFT0dwSW9oWEYxZ1JCTjlFajZBeW5zQnJNUkl3anNSYUVOVWxSdnNK?=
 =?utf-8?B?TFZoVC9wQTFGbWs4ZlZnUW1WeDJ5dzVZdFIzK3ppcFk1N3J0UEMvUEdlUERJ?=
 =?utf-8?B?OVM5L1lXWE1OYVZhamdRbUZuUzA3UnJrblhiMURic1JNWVBzQy9BYk94MU5J?=
 =?utf-8?B?WThNUitLL3JOSlNPRWlGRTc5TG9rZk5pYTRPd0FBME5FZTBvRXVrSzFCUE80?=
 =?utf-8?B?T3FROEQ5YWs3U0tFeHFBQm94L0tPQ0hsYjRjMmF0bXZmMGJQeXR2MFJqSnZw?=
 =?utf-8?Q?I/R0PRogKP9aUTQB85gkE4TM2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91e5c7f1-7733-4e66-4414-08dd76ceb5cc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 18:53:54.3477 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +mskyzdfZorywhuTliE3PHfVR2Zjhqh5jNkwIP3vYFj7osovNeATHdng5CcKuec7glozLsspMTowweoKtdHphA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9503
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



On 4/8/25 10:16, Melissa Wen wrote:
> On 04/07, André Almeida wrote:
>> amdgpu can perform async flips in overlay planes as well, so create a
>> test for that.
> 
> Hey,
> 
> LGTM. Thanks!
> 
> Reviewed-by: Melissa Wen <mwen@igalia.com>
> 
> Alex,
> 
> Can you check if it's fine for AMD too?

Hi André,

I ran the subtest "overlay-atomic" on PHX APU + kernel of 
amd-staging-drm-next, and they were skipped.

What the kernel and ASIC did you run overlay-atomic?

IGT-Version: 2.0-g52620e408 (x86_64) (Linux: 6.12.0-99-custom x86_64)
Using IGT_SRANDOM=1744137696 for randomisation
Opened device: /dev/dri/card1
Starting subtest: overlay-atomic
Starting dynamic subtest: pipe-A-eDP-1
Test requirement not met in function require_overlay_flip_support, file 
../tests/kms_async_flips.c:241:
Test requirement: !igt_display_try_commit_atomic(&data->display, flags, 
data)
Async flip for overlay planes not supported
Last errno: 22, Invalid argument
Dynamic subtest pipe-A-eDP-1: SKIP (0.785s)
Dropping event type 2 length 32
Starting dynamic subtest: pipe-B-eDP-1
Test requirement not met in function require_overlay_flip_support, file 
../tests/kms_async_flips.c:241:
Test requirement: !igt_display_try_commit_atomic(&data->display, flags, 
data)
Async flip for overlay planes not supported
Last errno: 22, Invalid argument
Dynamic subtest pipe-B-eDP-1: SKIP (0.788s)
Dropping event type 2 length 32
Starting dynamic subtest: pipe-C-eDP-1
Test requirement not met in function require_overlay_flip_support, file 
../tests/kms_async_flips.c:241:
Test requirement: !igt_display_try_commit_atomic(&data->display, flags, 
data)
Async flip for overlay planes not supported
Last errno: 22, Invalid argument
Dynamic subtest pipe-C-eDP-1: SKIP (0.788s)
Dropping event type 2 length 32
Starting dynamic subtest: pipe-D-eDP-1
Test requirement not met in function require_overlay_flip_support, file 
../tests/kms_async_flips.c:241:
Test requirement: !igt_display_try_commit_atomic(&data->display, flags, 
data)
Async flip for overlay planes not supported
Last errno: 22, Invalid argument
Dynamic subtest pipe-D-eDP-1: SKIP (0.789s)
No dynamic tests executed.
Subtest overlay-atomic: SKIP (5.668s)
Dropping event type 2 length 32



> 
>>
>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>> ---
>>   tests/kms_async_flips.c | 77 +++++++++++++++++++++++++++++++++++++----
>>   1 file changed, 71 insertions(+), 6 deletions(-)
>>
>> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
>> index 3535817b4..40773260a 100644
>> --- a/tests/kms_async_flips.c
>> +++ b/tests/kms_async_flips.c
>> @@ -85,6 +85,9 @@
>>    *
>>    * SUBTEST: async-flip-suspend-resume
>>    * Description: Verify the async flip functionality with suspend and resume cycle
>> + *
>> + * SUBTEST: overlay-atomic
>> + * Description: Verify overlay planes with async flips in atomic API
>>    */
>>   
>>   #define CURSOR_POS 128
>> @@ -105,12 +108,14 @@ typedef struct {
>>   	uint32_t crtc_id;
>>   	uint32_t refresh_rate;
>>   	struct igt_fb bufs[NUM_FBS];
>> +	struct igt_fb bufs_overlay[NUM_FBS];
>>   	igt_display_t display;
>>   	igt_output_t *output;
>>   	unsigned long flip_timestamp_us;
>>   	double flip_interval;
>>   	uint64_t modifier;
>>   	igt_plane_t *plane;
>> +	igt_plane_t *plane_overlay;
>>   	igt_pipe_crc_t *pipe_crc;
>>   	igt_crc_t ref_crc;
>>   	int flip_count;
>> @@ -122,6 +127,7 @@ typedef struct {
>>   	bool allow_fail;
>>   	struct buf_ops *bops;
>>   	bool atomic_path;
>> +	bool overlay_path;
>>   } data_t;
>>   
>>   static void flip_handler(int fd_, unsigned int sequence, unsigned int tv_sec,
>> @@ -217,6 +223,25 @@ static void require_atomic_async_cap(data_t *data)
>>   	igt_require_f(ret, "Atomic async flip not supported\n");
>>   }
>>   
>> +static void require_overlay_flip_support(data_t *data)
>> +{
>> +	struct igt_fb *bufs = data->bufs_overlay;
>> +	igt_plane_t *plane = data->plane_overlay;
>> +	int flags = DRM_MODE_PAGE_FLIP_EVENT;
>> +
>> +	igt_plane_set_fb(plane, &bufs[0]);
>> +
>> +	igt_require_f(!igt_display_try_commit_atomic(&data->display, flags, data),
>> +		      "Overlay planes not supported\n");
>> +
>> +	flags |= DRM_MODE_PAGE_FLIP_ASYNC;
>> +
>> +	igt_plane_set_fb(plane, &bufs[1]);
>> +
>> +	igt_require_f(!igt_display_try_commit_atomic(&data->display, flags, data),
>> +		      "Async flip for overlay planes not supported\n");
>> +}
>> +
>>   static void test_init(data_t *data)
>>   {
>>   	drmModeModeInfo *mode;
>> @@ -232,12 +257,15 @@ static void test_init(data_t *data)
>>   	igt_output_set_pipe(data->output, data->pipe);
>>   
>>   	data->plane = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
>> +	if (data->overlay_path)
>> +		data->plane_overlay = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_OVERLAY);
>>   }
>>   
>>   static void test_init_ops(data_t *data)
>>   {
>>   	data->alternate_sync_async = false;
>>   	data->atomic_path = false;
>> +	data->overlay_path = false;
>>   }
>>   
>>   static void test_init_fbs(data_t *data)
>> @@ -252,22 +280,40 @@ static void test_init_fbs(data_t *data)
>>   	width = mode->hdisplay;
>>   	height = mode->vdisplay;
>>   
>> +	/* if the modifier or the output changed, we need to recreate the buffers */
>>   	if (prev_output_id != data->output->id ||
>>   	    prev_modifier != data->modifier) {
>>   		prev_output_id = data->output->id;
>>   		prev_modifier = data->modifier;
>>   
>> -		if (data->bufs[0].fb_id) {
>> +		if (data->bufs[0].fb_id)
>>   			for (i = 0; i < NUM_FBS; i++)
>>   				igt_remove_fb(data->drm_fd, &data->bufs[i]);
>> -		}
>>   
>> +		if (data->bufs_overlay[0].fb_id)
>> +			for (i = 0; i < NUM_FBS; i++)
>> +				igt_remove_fb(data->drm_fd, &data->bufs_overlay[i]);
>> +	}
>> +
>> +	if (!data->bufs[0].fb_id)
>>   		for (i = 0; i < NUM_FBS; i++)
>>   			make_fb(data, &data->bufs[i], width, height, i);
>> -	}
>>   
>>   	igt_plane_set_fb(data->plane, &data->bufs[0]);
>>   	igt_plane_set_size(data->plane, width, height);
>> +
>> +	if (!data->bufs_overlay[0].fb_id && data->overlay_path) {
>> +		for (i = 0; i < NUM_FBS; i++)
>> +			make_fb(data, &data->bufs_overlay[i], width, height, i);
>> +
>> +		igt_plane_set_fb(data->plane_overlay, &data->bufs_overlay[0]);
>> +		igt_plane_set_size(data->plane_overlay, width, height);
>> +	}
>> +
>> +	/* remove unused buffers */
>> +	if (data->bufs_overlay[0].fb_id && !data->overlay_path)
>> +		for (i = 0; i < NUM_FBS; i++)
>> +			igt_remove_fb(data->drm_fd, &data->bufs_overlay[i]);
>>   }
>>   
>>   static bool async_flip_needs_extra_frame(data_t *data)
>> @@ -295,12 +341,17 @@ static bool async_flip_needs_extra_frame(data_t *data)
>>   static int perform_flip(data_t *data, int frame, int flags)
>>   {
>>   	int ret;
>> +	igt_plane_t *plane;
>> +	struct igt_fb *bufs;
>> +
>> +	plane = data->overlay_path ? data->plane_overlay : data->plane;
>> +	bufs = data->overlay_path ? data->bufs_overlay : data->bufs;
>>   
>>   	if (!data->atomic_path) {
>>   		ret = drmModePageFlip(data->drm_fd, data->crtc_id,
>> -				      data->bufs[frame % NUM_FBS].fb_id, flags, data);
>> +				     bufs[frame % NUM_FBS].fb_id, flags, data);
>>   	} else {
>> -		igt_plane_set_fb(data->plane, &data->bufs[frame % NUM_FBS]);
>> +		igt_plane_set_fb(plane, &bufs[frame % NUM_FBS]);
>>   		ret = igt_display_try_commit_atomic(&data->display, flags, data);
>>   	}
>>   
>> @@ -316,6 +367,9 @@ static void test_async_flip(data_t *data)
>>   
>>   	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>>   
>> +	if (data->overlay_path)
>> +		require_overlay_flip_support(data);
>> +
>>   	gettimeofday(&start, NULL);
>>   	frame = 1;
>>   	do {
>> @@ -824,6 +878,15 @@ igt_main
>>   			run_test(&data, test_async_flip);
>>   		}
>>   
>> +		igt_describe("Verify overlay planes with async flips in atomic API");
>> +		igt_subtest_with_dynamic("overlay-atomic") {
>> +			test_init_ops(&data);
>> +			igt_require(is_amdgpu_device(data.drm_fd));
>> +			data.atomic_path = true;
>> +			data.overlay_path = true;
>> +			run_test(&data, test_async_flip);
>> +		}
>> +
>>   		igt_describe("Verify that the async flip timestamp does not "
>>   			     "coincide with either previous or next vblank");
>>   		igt_subtest_with_dynamic("test-time-stamp") {
>> @@ -927,8 +990,10 @@ igt_main
>>   	}
>>   
>>   	igt_fixture {
>> -		for (i = 0; i < NUM_FBS; i++)
>> +		for (i = 0; i < NUM_FBS; i++) {
>>   			igt_remove_fb(data.drm_fd, &data.bufs[i]);
>> +			igt_remove_fb(data.drm_fd, &data.bufs_overlay[i]);
>> +		}
>>   
>>   		if (is_intel_device(data.drm_fd))
>>   			buf_ops_destroy(data.bops);
>> -- 
>> 2.49.0
>>

