Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A682AC282EC
	for <igt-dev@archiver.kernel.org>; Fri, 14 Mar 2025 07:57:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F7FF10E081;
	Fri, 14 Mar 2025 07:57:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cDun2SoG";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A9EB10E081
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Mar 2025 07:57:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lLuqfLsuUm75jT9RONKlYy8e6H+ySyXqB0hlYgQpybbjX9SxyAcKtAvBv9xt4YMfHm6Xqs6s7IjuRdF+/rc4JC5RgTdO1LwCgcYfaWzEvYZ54NkpHtdtN2j8COx8bQBhk3sSJI8RkEGraWpON95RFbwHL5M7j5x4vPpHXOdYwaPBWLiIfNMLYoHJlypxN7IPRpI+KDgou8ciMJEdyf4UuNbpYbkWEwNedtyY/yaDZOHZR/burByXB6im6nqzDh2Ak76T4a+HAETy4VxKydVYH2DyKCeiWMwK8/5bpq0VOzJB2ZqEyfLB0AP+kMjGdNYQJN/qm+MWGzxRiEVj0IsAVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ui8oIBLBYjlK5CX+l/f4w7wNX+hu78gkdjayGBZ7KYA=;
 b=LigD6GwcdK3XELYUipzkhon2FZMDTjylDdmZvwDfocUCsfWoF6vog9fSwyYEJRiAuhI8XNWuco4uWeRbEbgcYSCT518aoTrA6AFkq2IP83l3cqjafP+3YXo9N6CnGt9Ee8IpX3EtBGsPEdTCfNNfFxt1oTLEMJpDpWsb4yhIohOZZdeHmgUkHijAQZVQrqKa1lmU/J5WUTum082YrIjL5u+Cc2Zj1Lvvq8iG90doNKMJSD14jDkHk+Z8QAt1xW2/oNc+VzCpiTnGgEFmgyjnSV9Qdcs2RlAqlppNI/wfnPh80bvPnCCysufJVwo5+bUcGao09KU37Ep0Tz35u7bPuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ui8oIBLBYjlK5CX+l/f4w7wNX+hu78gkdjayGBZ7KYA=;
 b=cDun2SoG6kJgtDIpyW8NaxkVih5Psw0kWW9UeYPJmpDSJQQj7bOX2vb61HIL8pWTwBbJUWOIlNlnU1KafS4Zn2sJ4EWrsaptRWRjc/2HNSJnsquqcBc5MQA3NjvDaHZEGZKXYbu2KCwIkUXB18LrfBR7TYPcbNS1TjZFHzPE/TQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6611.namprd12.prod.outlook.com (2603:10b6:510:211::11)
 by PH7PR12MB7817.namprd12.prod.outlook.com (2603:10b6:510:279::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Fri, 14 Mar
 2025 07:57:30 +0000
Received: from PH7PR12MB6611.namprd12.prod.outlook.com
 ([fe80::76d1:e471:c215:4381]) by PH7PR12MB6611.namprd12.prod.outlook.com
 ([fe80::76d1:e471:c215:4381%4]) with mapi id 15.20.8511.026; Fri, 14 Mar 2025
 07:57:30 +0000
Message-ID: <535959ef-c399-415f-b5c8-c3a26a47a4d2@amd.com>
Date: Fri, 14 Mar 2025 15:57:24 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/amdgpu/amd_hotplug: add missing include file fcntl.h
To: Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org
References: <20250314033249.2426485-1-alex.hung@amd.com>
Content-Language: en-US
From: "Chung, ChiaHsuan (Tom)" <chiahsuan.chung@amd.com>
In-Reply-To: <20250314033249.2426485-1-alex.hung@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0031.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::7)
 To PH7PR12MB6611.namprd12.prod.outlook.com
 (2603:10b6:510:211::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6611:EE_|PH7PR12MB7817:EE_
X-MS-Office365-Filtering-Correlation-Id: 16b9b257-711e-4169-ca75-08dd62cdde79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MFJqa1JWdksxaHRSRmcxdWdTUGlEYkttZS8xUzc3eXd3R0VudmRMakpLb2ND?=
 =?utf-8?B?RzRMYkt3T1JqNndnc2ZuZVFDd0J4S2RBc014ZzY5ZFJDZVEyQWlHY2pKWlFN?=
 =?utf-8?B?TXBlN2dkb0ZCUXloakc1ZitlYmpXRGtlWlNxQTJPeFpKeENpOXpOYzRuVnFS?=
 =?utf-8?B?QVdxTmJOc1ZQRCtTVW5uMG9wajZqR1YzWWNTZm1RcUhqMFduMjQ0OHh6MVNL?=
 =?utf-8?B?RENIdTNwbUFRSWFRQlpxWk10ejRNNm5pMmV2WWdJTDNlV3dJZUp6WlBYeGZL?=
 =?utf-8?B?Z0dVMTlaLzVUUmhtdFRnLzNhSkl5ODc4NWw3WWNydmVsVEdxbERqM21TaExI?=
 =?utf-8?B?blRwRFMrTWRtMm5RUlYrYUVlNUx2dWN3QXg1QVFIeC8wMWV4TDhiYytCZEdE?=
 =?utf-8?B?QWYvdkltcU1EdC9VdDBZSFU4aHN0cDZXL0paUDRzbWlWMVhNTllndm9HMVV4?=
 =?utf-8?B?K2dqaVdXVVBlMlZjVm1RanhML3ZWUUlTc2VCOGlpd3BqSUVGbDVTaEhORysv?=
 =?utf-8?B?R3BMRjdqR3BWalU1dGIyeXNuZmZlR2hqd0Fodnl2alhOYUFwVk5UM1g2bURo?=
 =?utf-8?B?Q0dSYU04Ris2N1diR3hCdUJTcllSRVlZeFZiRkw5aFhNbFNjL0t3cHlHZjZS?=
 =?utf-8?B?SjJFU296d05xSWxxNm0wQU5IeEtpUERURHB5cng5VUE5UlJuK25wUDBKOWJS?=
 =?utf-8?B?OHJNc2k4Uk9uaWg1TG82U2hqblNmbzZYQWM4S3BNRXRkaWJKMThqU0dCdVJG?=
 =?utf-8?B?YmVzdGluMTd6NlhjWXEyMnBCelRHVUVlNVRyZFNZaU9vdS9aeGRsVmNtd2RF?=
 =?utf-8?B?NnJtM1M4SWR3NHVWUzRycEtGT2JUYkFqa1lZd0NzMEtlT0EwRk93TE5WdG1Z?=
 =?utf-8?B?R1lNcU05YzUxMUFSUHp6dHdDdjRzeUxTaHFGQ3FJL3pRbi9hdXZXUUJMNVFl?=
 =?utf-8?B?K3dHeWJibGZwbWVpREJWREJYb2hTWjRJakJDM0dLU1VDTnZFRk1nL2dFOTgv?=
 =?utf-8?B?bjBpVldIbHdlaURYNkhFUmdlNDJPelcrVzAyaE15TE5WVWhKQ3dZK0Z0cEVR?=
 =?utf-8?B?b3NPdkRLZ1I4Vjk3RWVYcVZMSGdOM1NxWmJjV1RJTGZLL0NmclpsVFNHMlFR?=
 =?utf-8?B?VHU0UlA0b3Y3ZmVNUTdsQ2kyeDF3bk9nVGJoT3RLUnlTbmkvUFdXUWJaK2FP?=
 =?utf-8?B?MkcxNGtTVDQvdElYdnBKZ3l5SXE2SDNXQ3ZTVGtmUUcwdFZ3K3lvZEpqdUNm?=
 =?utf-8?B?WFo3c3hyWk5ZWWsrT1lwdjdFK0Z0NFVGUFRRNlQ1QjZ5Z1diK3RDRWRTVWND?=
 =?utf-8?B?bHNOSXR0bzFrV2UrZlY2cXpud3dvSFB4M2lXbDI5SmE5L3FVZDFSOHlScDFx?=
 =?utf-8?B?RHJzVUxodUFNTGN0ZUxtdk14Sm1wY0tod0FpaGVERG1wRnFQRHJYQjNrUlV2?=
 =?utf-8?B?eFJkRzNDZTZ0QlcraEtZVkx5QVVjeURFVDBHRVR4R2hjemhvN081Vm8vL2ti?=
 =?utf-8?B?RFFpM0JRWTgwWWZHSk1zL0RTd3FLc2VtNzRtT2VwRnl3bkc1d1VHb0VvNHNy?=
 =?utf-8?B?Z1VqcjYyT3Y1VzlRTXlxUDlZNjkrNWppUEpYUGhTVjl5UnZGWmQ3OXlrYmtJ?=
 =?utf-8?B?TFBsSXQ5NDBDYU9jZEN4VzAxMDUrSmVMRzN5YXNpNU8xSTFaZGdIZ25EbXRz?=
 =?utf-8?B?TEFwcXRjbjcvS3d2K1lpTnZrY1poS3BOOU1OTk1SekhlbjFlcmQyYWpLc00w?=
 =?utf-8?B?YVA5WGx1NHB1RnRnQjV4ZW0rN1pEMzlIL3VXQUFKb1g4cjNlcVppR3FTNi9q?=
 =?utf-8?B?SE1oNHBzOGV0c09VMGNmcU9PWmNCR1luQ3UxMlM5OG1sclJrbXZOeFZrUklB?=
 =?utf-8?Q?dV8aq9Pvhqvno?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6611.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTV5YytIMkVJRUE0RnhrcGxmVHRBb09vUmNPRTgvQ1JHditCaE54UEZGdzNa?=
 =?utf-8?B?WGY1SUFwczRacng2V1dTbEVYSmNzT2Q5RFMwQVZMd1QzTHhMbTJ1RkMwS3lq?=
 =?utf-8?B?ektQS1R3Q0NFSWhMakdBWFFQS0pBMlRTeG5GWjREQUFRM3BYM0hDSFJUWk5x?=
 =?utf-8?B?bUg3OUNlbDFmdWVsMUZaSXV0WXF6djlkV2xPWE96MExDZEcyNEFIZ0lNL1Rw?=
 =?utf-8?B?QWFzeVJab0t0VS9hS2luc0VBcUQ3b1RxZ29PM1l0amZSUGJPbG1kQWJROUtn?=
 =?utf-8?B?Z2tnNHhtU1JxUzFoekNxVE1MWmtlRCtMZTNBbnJnZzBqbWoxdDVkdEs4eFNC?=
 =?utf-8?B?a0Jma1JCUHNTa3VVQ0ZHZU9XR25Nb3FkaTdIa1RHZWdYQzhqM2V4SlM0bm0r?=
 =?utf-8?B?Y0xIUjRiYVpCNHMrZmgvb2tldmJkdVZ2dGRuWCtxS2RCYTVIYW4xdWhsRU03?=
 =?utf-8?B?ZDQvekNjVm1jaldpQ3pYWTNteUV5d2g1eG1KYUwwS2tWSEJXaHR0QndoUkNY?=
 =?utf-8?B?NTl3dC9MdmlnOW9mQytuZENoSTZmQ2xZS3VhSjJGbStWTi9keENPKzJ0VU1M?=
 =?utf-8?B?elpPQmxpbUhORzBCZW80ZVF0TTBwV09LZEVzcmVJWFl1VCswUExMMmcyTnBV?=
 =?utf-8?B?dDU3aVhxU3dBWnh3OEtDcjQ4SWJvU3lvOG1HVDg1Vi9DR3pBcm11bkZHcmls?=
 =?utf-8?B?MGxYbktBQ2Z5YVZtSlBrUWNvKzloL00rS1FWYk0vNEZYZ09PTmxmTnN5SGRv?=
 =?utf-8?B?RWQ0WDgxUEFITHZ4dG5uM1dabEhVa0JnYTRBVVFrWWNPSlBJT0E2S0NTai82?=
 =?utf-8?B?VitzbDh2cnE5a2FyME1PdlNSSGsxaENWSFdPS1lHVGtEME5wZjVKRnliR3Zq?=
 =?utf-8?B?NERuZVh1bDFhZWphTFhDRXpWSXc3TXFMQk5zci9uOWlEang4OGhJc2U0WWF0?=
 =?utf-8?B?Qkdlak8xT0U5VVRqbXNXTWV3ek5rM0F3TEJwTldYTFMxSTR3YjhhSFF6RHlj?=
 =?utf-8?B?cEJlaXhoOUdLVHZxOThPdisxTm1jYmVGWG1MMTNRb1lGN3J1WFM3MlhxbWgw?=
 =?utf-8?B?c1NjOVdaSytOaXNoUGM0UHFWZ2JvTjhmcnlVRUdpbHhINmV2UUg3UHdkOEJ1?=
 =?utf-8?B?QnlVOXdUTEFBeGVTdjRUaWVJcmU4d3JwK1dSN24xNCtIbjl5c09ORUlpc2t4?=
 =?utf-8?B?N1RQMjVZWmRQVERiN3dUUndldWE0UnVBRDZDTFdjV2pxS3EwWnhING5HcXZm?=
 =?utf-8?B?MjdaQm91amVyb1Y3K0pRUFk2NUdOM0xHeWVsaUlJM3lpanpKamlob3F3VVZh?=
 =?utf-8?B?UGo4L1hpSnZoejNRODN1T2kxTzNRTnVyY1AvYm94cnVqamtnOUtHY2lNaHpD?=
 =?utf-8?B?UVdoSzhFYzhZejdCTlp6N1JFRXZ2MTgwMEpDZ0xyVGpoOFN5RjI2OTJadkN5?=
 =?utf-8?B?cFhPRFA0Wk1oR0ZQNFd5aE40ZU8wM1lBYlkzZnpRUGJXalVTMHhaaFVOTHhY?=
 =?utf-8?B?TkxrenhBdE5WT29jL295dU55VXVrczRDQVloc205bmRlZ2lSQTdYRnlJOTlp?=
 =?utf-8?B?UzQ5aTVMYnc1N05xR2pneSs4ZzB5QnduSERHTTNiMWJleFl6dDJTNnp4dU1S?=
 =?utf-8?B?cldxM0s4SE5iWVlVYmVuc3crUVRpYlE1bzJIZVUwQ0JsTG9IVjl3cTlrK1VB?=
 =?utf-8?B?dDRVV2Z4ZXVSS1FRRk9jVkRtTHFHY2x1RTB3UjBmQkNTRnpvejQ0a29UL2FL?=
 =?utf-8?B?UG50NE5TVUFtbmxWa1N5c1JENzNDYmF5UEZRS0FwaXdJb3FDbUZvdlJSWnR6?=
 =?utf-8?B?RXFEWENUSUE0cUlkaWV5YWo3VDJFM3FFSDhidnJsbnBFRDVoSGtibUZqaE9m?=
 =?utf-8?B?c29neVZNalRJYlRUK0tkL2ZuYlVxYW0xVnZQWmRyN1JITW9SZ3pHeGF3MU5G?=
 =?utf-8?B?SzF3dHhIT1hFa2VzVHFQdi9uWE9mbVorYUNEdStCVDE3eG9KNDVodTVycm5j?=
 =?utf-8?B?YTBKbFVqMERyendSSGNkU1QxWU1VUjcvSXpLdE5TcU5LT0NidkU1anpQaWdO?=
 =?utf-8?B?RkUxelNjdjVidEFFOGo3SmtYQXdYMThKTDBaaFo1TGxMSnZSaGZjUG5nOUdO?=
 =?utf-8?Q?Ntn21pKZ3hLa/yPUneknpYZXy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16b9b257-711e-4169-ca75-08dd62cdde79
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6611.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 07:57:30.0240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bvgtYrxGA6cNu2FW/2fXZ+nDQBTb2XQsZPeteMVfDqtpyIPzR+iswrbJKnRgojPrybItZJAsq1m2mIlprs1Ucg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7817
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

Thank you so much.

Reviewed-by: Tom Chung <chiahsuan.chung@amd.com>

On 3/14/2025 11:32 AM, Alex Hung wrote:
> Add missing include file to fix cross-compilation errors:
>
> ../tests/amdgpu/amd_hotplug.c: In function ‘is_system_s2idle’:
> ../tests/amdgpu/amd_hotplug.c:110:7: error: implicit declaration of function ‘open’; did you mean ‘popen’? [-Werror=implicit-function-declaration]
>    fd = open(MEM_SLEEP_PATH, O_RDONLY);
>         ^~~~
>         popen
> ../tests/amdgpu/amd_hotplug.c:110:7: warning: nested extern declaration of ‘open’ [-Wnested-externs]
> ../tests/amdgpu/amd_hotplug.c:110:28: error: ‘O_RDONLY’ undeclared (first use in this function); did you mean ‘STA_RONLY’?
>    fd = open(MEM_SLEEP_PATH, O_RDONLY);
>                              ^~~~~~~~
>                              STA_RONLY
>
> Fixes: 6796e79abba2 ("tests/amdgpu/amd_hotplug: Check the suspend state after resume")
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>   tests/amdgpu/amd_hotplug.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/tests/amdgpu/amd_hotplug.c b/tests/amdgpu/amd_hotplug.c
> index ee3256c0b..bbd50452b 100644
> --- a/tests/amdgpu/amd_hotplug.c
> +++ b/tests/amdgpu/amd_hotplug.c
> @@ -20,6 +20,8 @@
>    * OTHER DEALINGS IN THE SOFTWARE.
>    */
>   
> +#include <fcntl.h>
> +
>   #include "igt.h"
>   #include "igt_amd.h"
>   
