Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8DE2D2A54D
	for <igt-dev@archiver.kernel.org>; Thu,  4 Dec 2025 21:31:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5813210E220;
	Thu,  4 Dec 2025 21:31:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pNUZ8wpn";
	dkim-atps=neutral
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010068.outbound.protection.outlook.com
 [40.93.198.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0DB210E220
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Dec 2025 21:31:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GJWAyZUHciWK3YhivaaHMYj0FcfQsIZHqUqv5R//yF3PgYPUI8rS1Wr6eLs4jG34YTu61NFnAibMNG/Ab3QIMmm79QmGe/OdsTFF7pyNiD1AHOJohzHBoC+4loA42UVBR37KL3YhOFPDoRhoqP6f0fdq13MDnOK1zlq7P72H/fgpjl6QD9BudEHS5P6ArE5KOaAdETprq9lBCuCA3tFzbVCd5PUqOQ516U4dXs1ZYc0MB4qOy0EOhZULmldBbfBa7y9BSVwm7Mgm1VbYFxpMaW8ibkHp+nnSE07r2lcuFqnnw9odlk1yEHtNd4AV+8mwEjfk3wrqsUrXqF+iwWnwRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+78aQ2/kz6IXsZWdPAkDaPfEnBABYvTzEVWKtwTaDQ=;
 b=C47aYLvw98k2nGeLmKwRDtA/GGiu4fmTTrc7+fXAJBug7aWOeU5OJAtRFbYI+1ChDdQvd4MXCglwHVdJ0D0Sda1kLoMo/DQJpWYsJJ+wVhocRVkAClqgZsVuHbL7x6czscLcCY7/OZKHgfx/KShEyzrsx1t58zee4xofBySSRLmfI0pz89LTSkgJPfMpddstgvH3FZTs5xTtMRarpbj6ScqkvhRN4hsy+G/0a0fFgx6KrrUiJ1hIskxCTHlOc2HsHI0cjG5nvB17xTqVcuRjNDHoasy0pvSO/fEw72fF+cNJuYk0WQv42tsKY0MdgiWQnCDxQSO7QrM5l0yUXNDSaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+78aQ2/kz6IXsZWdPAkDaPfEnBABYvTzEVWKtwTaDQ=;
 b=pNUZ8wpnMeXZsoX1itNygF31/PVTWRk/acxikCq9NczqOaTxzqcPwQIJBQGccBKp45mE9ZIhvLybNOM9qyr+KNCqhQc3I1K4wbV2FSIhariNObrmwiR3NTZBZpAt9yrwuRheVoVs55qAoi14IKG7Me9J7jtyV28VK4qJsT1ilT4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by CH3PR12MB8186.namprd12.prod.outlook.com (2603:10b6:610:129::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 21:31:15 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%5]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 21:31:15 +0000
Message-ID: <d4b779bf-bcee-43fc-ab04-9b8c7dc120f3@amd.com>
Date: Thu, 4 Dec 2025 16:31:11 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/amdgpu/amd_mem: fix compilation on armhf
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>, Karthik B S
 <karthik.b.s@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
References: <20251204211421.145825-1-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20251204211421.145825-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0287.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6d::13) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|CH3PR12MB8186:EE_
X-MS-Office365-Filtering-Correlation-Id: 61ab63b0-59bb-43c0-3872-08de337c740e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b3BZOXpMRUx6RTlwNnZqZ2dkbDdDdm10ZXdNQkNpQ2FpbzVIb1hZQzJIODVz?=
 =?utf-8?B?YTk5V0NPQXJ2QTZjTHBEd3FiZzBURnFwZHhHb2tjL05EeDJjdThXUTBCakZ1?=
 =?utf-8?B?bnlRU3JjS01NMHZRSkpoMGlaMTVCbG5zdzBBRVFFelRTS3dCZTJHd3ArV2dp?=
 =?utf-8?B?aXBsaUZwZCt2RmROdlB3RlVxMm5nQmxUN0o3a01HOSt2VExmeVJyTzJPOU1M?=
 =?utf-8?B?bXRhSHVBUWQxV01WTUZON3BWL2hINXBZYUZNUENWYlRMSWIrMmlRUkFudm1o?=
 =?utf-8?B?UGtEMFVaN0hvQmhTV0EzYlRJMFpLOEtqNjE5dG1yc1R0aXN0dTdjaitCUysx?=
 =?utf-8?B?dHZLeTdUMDZJbjc2U2NjYnh2cWdDakFFZHZ3dUtRTFczV1JHWUI1eldBNEZZ?=
 =?utf-8?B?SUJlUkdSRGpsbitRVEN2OXliMkc0WFB5enBNMXovdTZMYVhvNUxTeVA5VEJL?=
 =?utf-8?B?em53Zi83aE9iMk9kd1FMa2g4czk3MHhYMUVLNS90Y2FvR0piOVM5blRvOXd2?=
 =?utf-8?B?cFRTNlcvQXpUTWt5eSt5QmlKcjlnUEdpNmkrdUpNbXoyRXNJa3VxYklxbld0?=
 =?utf-8?B?NHZqM3lGVlhSeC9IaUxnR1NyNzFrMG1Bd0xDUWsreGhGbU5uUUx1Zmp6TUI3?=
 =?utf-8?B?RUVWTWpEYUROWmI1VnRQdGN1K3FJYU9lMkFaUWlqeFhOTEM5eTZ6MlJQRFds?=
 =?utf-8?B?Uk9OKzBuVUJoZnpPOFJLa3U4bll1VXNaMGMwQTlUc0RtWG9adVRxaDFuTDZn?=
 =?utf-8?B?QW04TzM0SFFIQ0l3dHUveFFxSis1Ti8xcjE1UkYwWTFmdFpWdjFicDNsalZH?=
 =?utf-8?B?SmIxSnZzSTZGaHUrSVllUUpkL2tMQjBnZGRuamhLRk9rbHhrOTFhYVgxckZT?=
 =?utf-8?B?TnpvQ1N3blM5ME5UNEZVMm5INmdvWkN6SUFFYVVpSjNMbWVvMHVhdUgvTnJw?=
 =?utf-8?B?MExSbWwrdW9uQUJGN044VTc0MzJPRzhGdDZ3TnRvWDdGeklEUXgwKzkxQmtn?=
 =?utf-8?B?a2lndmNHcGJoNkpzbm94MCtpUkhKUy83Rzl1bG04bGRCamQrdFM4Q1ljMXF6?=
 =?utf-8?B?RkpjYUlrb01XWVljVE1ySHYzTUNNRGhVVGRjdTdFWjVqcmdVbnRPMU5taVlP?=
 =?utf-8?B?SW1hT0FSUS9Cb2hKMUhPTXlqdGVUQ1orTXZYSjZEVmRoN21IUkd1ei84RHRN?=
 =?utf-8?B?MThxdElwYmNkQkFyQlJjSVBqdVc5NzN4R3dFNkNYcDdxTUdneGQ2YU1TNElL?=
 =?utf-8?B?MlpjakRJV0E3TkFLUzZFdHZsNUZEdmMzS0NxdkN6Tk8xMVBUcTk5b1dZMmRQ?=
 =?utf-8?B?a0xXakpFY0p3cEI5dHlUOW5UanVIY3pBRFJTeEMxRVpWRTBtdWtqSmNqcmM0?=
 =?utf-8?B?NHdSMHIzUDRxamNPcm5icEhSNkR6TUJlV2lORjZlLzBuYjFqNEYxTnhYMURM?=
 =?utf-8?B?NTJXQ2U0RjFjRjVmZnVtRHU5YzYxdDJtR1VtWVcrV2RnQWNuYkV3QzltS3Nv?=
 =?utf-8?B?eVNkTjZvMFBHRWM5VWRIaW1xaDlpb3VPMkNRSVlHa2RqWjlWVEN0MnF5aktC?=
 =?utf-8?B?eWJlaGdaWjJNTVEyakpYNFhwaXYyYzZGMS9TS0FMd2VrZWVqcU8zSnBhNnc4?=
 =?utf-8?B?QlNUdkFOb21OTitIditrK3BtRnlESEdpb01Eb0xZQXZJWkxZenkrRXVNd3FS?=
 =?utf-8?B?U3JEV3F3TDNaTXpLZFc5dVdFZENBSFBweEVwZ2ZlRm5nak5lYlN5eFlrVkIz?=
 =?utf-8?B?M3R3Q0VWS0d4emxlWFB2UGlvWXZLZkNGdUpEV3FJRVlSYjg5WFlaOE1KQmZq?=
 =?utf-8?B?dkhhaWdkNVhUSStMLzJYZjdoMW5Sa1NKbVd5Q3VGdnNpMTE4QjN2dkQzRG95?=
 =?utf-8?B?YmJQRDdQK1B4Y1FWcGV4V0ZjOGZHYlo0WUxvWmtiUTFkODRWNWlVV2dVVXgx?=
 =?utf-8?Q?o59TaAqeqGffUyhKJOiz1/zxbkLwZ4RD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yk8zL3kvYWhuaTJPejJzSFV5QzVUMlZGV3loNjZ2RlhFcTNrSXVZaFJXd0F3?=
 =?utf-8?B?SDd3WnN3dkg0RDVkYWVkMDcxbVBSYmFuTTFMWDN3Q1NaT0RZc1hQSVd4ays3?=
 =?utf-8?B?djBGVkl6djUySElPVTl1ZGd3SkI4UEQwS2hGYW9FNWZFMFNVUnpla1Fud2xB?=
 =?utf-8?B?WnhsSCszZllNcDdtbkgzS2RsMzBCSUpLSFdqWFYrbTJtaE5IS1VBZEl2R1E3?=
 =?utf-8?B?V1NiUkR6WjNNdndjbWJKZzgrcG9xWFBIdVFqclNIYXEwNXh0Zy9iS0ZsK1BO?=
 =?utf-8?B?d1BJcUxMdS95d1J6Z2hqS2QxWWZHbFFoMUhua1JpTkFlMC9ibi9MV05USjNu?=
 =?utf-8?B?aG8xaVNEZ3pOMGxVQVZsTlR5ekZIcGk1Sks5WGkxL2lTREZra1VIYU5lbnZ6?=
 =?utf-8?B?SVYxcHVKcXNUKytEUUptMjhEUnZWMml2Z2hhdk1jc1UvWUJPUDB0YnVpanZS?=
 =?utf-8?B?cTdncFhaOElnV1RyVGl4WU5TdkRIcWU1eldReHpwcmg3bDhKbGhBK3l4Vlp4?=
 =?utf-8?B?L3VzanZWcG5WTHZzbTFnclh5T0xrRDIwWTlFSHRFVjJmWkhCd1BQWkhEU3Bu?=
 =?utf-8?B?UGVSZ0ViQzFFbmdJSHYveTIvdzRNWC9sU1FHZ2tSR2hLNFVxUFNETEZUeFZP?=
 =?utf-8?B?b255SWw0N0VnZEFNS1ZNSkowK29WamdTeWNJWkNqMEtrUDdtblFlTHdaZzJh?=
 =?utf-8?B?eldpQkg0cUdwa3EwWDlLa0UyY0VpR3BsRVFXQmRPUWxCMzZtK2g4RlBDamV0?=
 =?utf-8?B?bkp3a2VPaU01VldIcU1lQ1RCVmErSitqMUFQekhJUVdmeWFYaWRVWmJQdFJV?=
 =?utf-8?B?RSsvaTZVOXU1Tis4RlJpOGV2SWc1R0NYalNXenYzN0RYcnFuZWtXSVFRRDBl?=
 =?utf-8?B?eENIOEhTUzZidjhKZHVzODhxaGV3b0ZCSWtTUmxkSDNNa0tHRm8xRno4S3dW?=
 =?utf-8?B?dHZpZVdjRXZuUmZ2OGdRK3dqVDFreTYvaXZYSzl5V05HUTY4QjNYdjN2SXFn?=
 =?utf-8?B?UHVIZWlDOG8yVW1OZXdyNDNjVnlWU3dsbUt6Z2tmQkNzbFkxY0NIZjlQWmxJ?=
 =?utf-8?B?am5YbEtYNjVRbUhXNi9tWHBjb2s3RGd5cEM2TklPdWVibHhPVy9xOCtWQklE?=
 =?utf-8?B?dUM0MnNBQ2xlWU1NV3Z4UlU1SldrRFRwcFMxUXprYXU1anAwSXlQN2MyU2hJ?=
 =?utf-8?B?ZFhuVEhlbjcvL1ZKTGdHOVErdnF5RXhiSTJ6NUxucGw2TlBqbisvMEw1UitL?=
 =?utf-8?B?WDcwNEI0QXZCeE5adW1DWGUwcDNTYy9WeSsyMXFsTWFtY2tCWFZzckgyelkx?=
 =?utf-8?B?SE1kckVvbEdTZm9MYktWZDBlNmpkWHUvMzRRdHNRV3VSaUU4bjNwL3NIeW9F?=
 =?utf-8?B?dzg1MUNnSTRuVUpmWVNjakhSQXJxSW1hLzlEVUNFMXg0NjBXYVIrc0JjRzlI?=
 =?utf-8?B?bWR0OHVWT295U1NPY0F1eDh4S3JNZDN6UnhuZzJMeXAvZkVVclVBTE9NaGl4?=
 =?utf-8?B?VXk5OGlDUVNMN2lhbVF5Z3dZdmZlaUdNV0ZVQVd3cDJjand6SEIrWXF4T1ZM?=
 =?utf-8?B?MEtjNjhLME1FMm0wQ0F0Rkc2TVdQMDViS0lhcnhkV3BJQ242bWlRZXByejcr?=
 =?utf-8?B?Z3RoYmRTT094THFidzZzQk4rNzd5NmlLdGFOK0dZV2FRSTAwc2REYXJ1Q29r?=
 =?utf-8?B?YjAwR2RuSGl6WnVwOXhJMmI0TDY0Z09YTEtSazI4cXYxdmgzSU9JRlhIWUZj?=
 =?utf-8?B?cmhwQk1LbFVMZ1cwdjl6aGc3cHdjL1Exc0VOM1N1QkZBYzhaY21KT2VYUGhi?=
 =?utf-8?B?ZkRaOE5ESFB2eUIyeEFBMnR6ZVh2dC9VZGl2U0JSYWFQenJFbFl6S292dXN2?=
 =?utf-8?B?d0FFaHUybWUzZFpUc3VDeFh1Q0ZHWU1xMWc1eVpYc2VnWXJBWUxWY2ZrTDU4?=
 =?utf-8?B?RUM5L05BM3JwbVJKdjUzVEhXYVM0c2FNODRZY2pKNXFEZmpEaVRrUmZhYmxp?=
 =?utf-8?B?bWwvWXVzZU1SemJVbDBuRGZtTnhMbUlwdGE3N1kzY0NyV3NFMUlQcWJDZ3JC?=
 =?utf-8?B?Tzd3Z09rdTBIR1pScXBuRXNUMFhqZm9EOVhDY0xIQy8xQXo0Mk5CL0hUZ012?=
 =?utf-8?Q?CnPPKIuGF7/1d+OgY2rgNk7vL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61ab63b0-59bb-43c0-3872-08de337c740e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 21:31:15.2301 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /04P4GuPI6VdODayEgVZZHm3IExMzPb34t8E2/96qpf8snTzV0lrK10vOveg6Ou2Fp5E+zv/660tsOB2hAbkTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8186
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

Thanks a lot for fixing the armhf compilation errors and cleaning up the format warnings in amd_mem.c – much appreciated.

The changes look good to me:

Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

Best regards,
Vitaly

On 2025-12-04 16:14, Kamil Konieczny wrote:
> Fix two compilation errors on armhf:
>
> ../tests/amdgpu/amd_mem.c: In function ‘ptrace_access_invisible_vram_test’:
> ../tests/amdgpu/amd_mem.c:3017:56: error: cast to pointer from integer of
>  different size [-Werror=int-to-pointer-cast]
>  3017 |   if (ptrace(PTRACE_POKEDATA, parent_pid, word_before, (void *)original1))
>       |                                                        ^
> and same in near line 3019.
>
> Also while at this, fix warnings on var prints:
>
> ../tests/amdgpu/amd_mem.c: In function ‘test_signal_handling’:
> ../tests/amdgpu/amd_mem.c:3143:11: warning: format ‘%lx’ expects
>  argument of type ‘long unsigned int’, but argument 5 has type
>  ‘uint64_t’ {aka ‘long long unsigned int’} [-Wformat=]
>  3143 |  igt_info("System memory allocated at CPU: %p, GPU: 0x%lx\n", sys_cpu_ptr, sys_mc_address);
>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Jesse Zhang <jesse.zhang@amd.com>
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/amdgpu/amd_mem.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/tests/amdgpu/amd_mem.c b/tests/amdgpu/amd_mem.c
> index 39abd4f66..463e1213b 100644
> --- a/tests/amdgpu/amd_mem.c
> +++ b/tests/amdgpu/amd_mem.c
> @@ -3014,9 +3014,9 @@ static void ptrace_access_invisible_vram_test(amdgpu_device_handle device)
>  
>  		/* Swap values via ptrace POKEDATA */
>  		if (!err) {
> -		if (ptrace(PTRACE_POKEDATA, parent_pid, word_before, (void *)original1))
> +		if (ptrace(PTRACE_POKEDATA, parent_pid, word_before, from_user_pointer(original1)))
>  			err = 1;
> -		if (ptrace(PTRACE_POKEDATA, parent_pid, word_after, (void *)original0))
> +		if (ptrace(PTRACE_POKEDATA, parent_pid, word_after, from_user_pointer(original0)))
>  			err = 1;
>  		}
>  
> @@ -3140,7 +3140,7 @@ static void test_signal_handling(amdgpu_device_handle device)
>  	r = amdgpu_bo_cpu_map(sys_bo, &sys_cpu_ptr);
>  	igt_assert_eq(r, 0);
>  
> -	igt_info("System memory allocated at CPU: %p, GPU: 0x%lx\n", sys_cpu_ptr, sys_mc_address);
> +	igt_info("System memory allocated at CPU: %p, GPU: 0x%" PRIx64 "\n", sys_cpu_ptr, sys_mc_address);
>  
>  	/* Fork child process to send signal */
>  	child_pid = fork();
> @@ -3213,7 +3213,7 @@ static void test_signal_handling(amdgpu_device_handle device)
>  
>  		/* Submit GPU command to write different value */
>  		igt_info("Submitting GPU write command...\n");
> -		igt_info("Writing 0xdeadbeaf to address 0x%lx\n", sys_mc_address);
> +		igt_info("Writing 0xdeadbeaf to address 0x%" PRIx64 "\n", sys_mc_address);
>  
>  		/* Now SDMA should write to the correct address since we're using the same BO */
>  		r = cmd_submit_write_linear(dma_ctx, sys_mc_address, sizeof(uint32_t), 0xdeadbeaf);
> -- 2.52.0
