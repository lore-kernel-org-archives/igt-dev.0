Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 368D5CAC5B0
	for <igt-dev@archiver.kernel.org>; Thu,  2 Oct 2025 20:12:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDAD810E845;
	Thu,  2 Oct 2025 20:12:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="eEzgPAu7";
	dkim-atps=neutral
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010016.outbound.protection.outlook.com [52.101.46.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C03610E845
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Oct 2025 20:12:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i2+2/TrT7kKJAy6fa8xoeexi171ZLlAVvH3IJcjfduaaH77nvca2Q99NkSV2B42YUxI/z/TAiG3kIZBm2ebW261gKLTpLip4Urjxyi/ICl5+ik0Tj+jOYbzXGFjb2rMKCWvUkcKrGrwoejyK9qzjjunZh6ZwnKzI5RjvyuSW0yXamiYO4C68iW6JRXaNxMuZg/BOE3P892+fhm1CvHRFu3oy/U6wBQ7Rw29lDyq9oHAkBwrbg9iQRUgTI9Ml6EvOGB7C0Jcu/FtIb3SJgdzmSJ6bkXfh2wU685LZHVnFcBpbqwms0PsI2wSEYQxh1/bV+EKAxF/uAfO/Ro34A+Wdcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PEc3rSx55L++5GlDo3P+rr6ZAMoLb6a3t1Pq2CdSaLc=;
 b=otGiqjsxi1+grlf98CPsYZSaZ8OJl/hF4OTYYLPa6XmYBNbN/BgRwNXl4jh+2KF9u1OvtgIis7SCf7uuyFHtRO+Qrbrp3oMeHv1vwxBoTZe7oxj3B9FlD35waifPRkvw7+1kq4g/aNSQz61lqLllbjvzNcwZ9wQP0uY1wWuf5fPHnPwFjAsGtel286L7F/usoYMytnZKYK4Lqyb0Tmvt1nP+0q0XIQiqlsG5VmqVI1GbwuuLw7kKm0bmFAvaFPhowXqXUZA54Ti/cIfHyq+gZdcgrx2TtlhWDSJNnmW0V5TUPKV6FyUAIdBKXo4Rfwdkzlqy65pKqFf4MRJyL1aELw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PEc3rSx55L++5GlDo3P+rr6ZAMoLb6a3t1Pq2CdSaLc=;
 b=eEzgPAu7CdA8AzSKv/7XXZYzn0ME/B7UELqsFm9Jz4DJBkcqY329s5yFndjz2k6zPD4aDDY+eHh1qazXqrTZqeY9nk0fsSC868zmeXjzl6Ng3ggm+vCnDWjQ7VxwFKGG5969/QJaPlcR/mZSRxhRqn3PMi7z1xgWRrn3Tmeuog0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by LV3PR12MB9268.namprd12.prod.outlook.com (2603:10b6:408:216::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Thu, 2 Oct
 2025 20:12:18 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%7]) with mapi id 15.20.9160.017; Thu, 2 Oct 2025
 20:12:17 +0000
Message-ID: <d582314f-c6f3-4e59-b34a-dcbbc7cc89d7@amd.com>
Date: Thu, 2 Oct 2025 14:12:16 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V10 02/30] lib/igt_kms: Introduce
 DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
To: Louis Chauvet <louis.chauvet@bootlin.com>, igt-dev@lists.freedesktop.org
Cc: harry.wentland@amd.com, leo.liu@amd.com
References: <20250815040659.3321102-1-alex.hung@amd.com>
 <20250815040659.3321102-3-alex.hung@amd.com>
 <5efb9dc9-6007-4d0b-bf84-950cbf208362@bootlin.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <5efb9dc9-6007-4d0b-bf84-950cbf208362@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0279.namprd03.prod.outlook.com
 (2603:10b6:303:b5::14) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|LV3PR12MB9268:EE_
X-MS-Office365-Filtering-Correlation-Id: 21d35f04-c20b-4a96-e282-08de01effc6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?azlGRVNBTFI0WWVaMjF4bGc0ejdlamhmRk54d3RUK0MranZSMzFLUkk0YXow?=
 =?utf-8?B?a1RtSFNtNDN3b2F0MnJWNTNPdll2ZVJnRzlWSy9HR0tNY0k2WTRTVFVHcU5l?=
 =?utf-8?B?V09XVzYwTE1VQjUxbTd5Z3RoUTFOSzNLdWtPWFNnQ2tRejNqenRZOUpqSUpr?=
 =?utf-8?B?TkN4U0wxeXllVlZON0w1Rll4S3BYS2ZyWnBHZUcwTnhLRmoyTHNBdkdDK21t?=
 =?utf-8?B?YkRDUkVRUHVvcC9TM3dNS01iODFZY0kzNXBrdFBPM0grdkdkbS95M25tN1RI?=
 =?utf-8?B?ZlRDanVDbVZDWXlnY3FEdU96bkwvOENkTEFtcVZDM3lKTHp4MDgwMTg1aSto?=
 =?utf-8?B?d1h5cUNiUWJ5SzFkMHJQeTB1V2pNTUFRdThSQm9Rc2JoUFdPSUdyY1p0SG9D?=
 =?utf-8?B?MU1DOGhjbi82cUo2ZkhjdU5rOGpscjB1UkFWSEpkOTd0WFF4L2loSVVoVDhQ?=
 =?utf-8?B?VDRvbGVwQS9jblhuMlFJck9zeFVmdXdjNXFubFpQbklzdHlGYko5cXI0T1lU?=
 =?utf-8?B?ejVxeEZxMmEvUVdjbUJ1bUtQaVpkZ1YrNG4zaWhvelp1Z2JWY1NSSWRFWGh2?=
 =?utf-8?B?WlBUMjZCa0wvendGNGI4eFptK09PbXJGZG00Ylhuam8vMVJqdDRqemI4NFpW?=
 =?utf-8?B?eGlXVk9jd0o2amY0RGVTMnpMcXhKVE9nRkNYTnpyNjkrT0FYckJHTE9YZmtO?=
 =?utf-8?B?YmRvdFNiUjNRd3pyWHV1T0U3akFseFlzMVdjbjQ4RzRkb0JUOFhPSER1dGxl?=
 =?utf-8?B?TnBtQ2pYclVMQlBpSkRsdVZneEo4MEw0MjY5TGhjcTBaZUZYb3liSWtaaTFF?=
 =?utf-8?B?OSs4N1ZSbGM1V3k5OHJCSkpKM2kxSEFWTktjLytuZ0haVmR1U3pSR0wxQUtN?=
 =?utf-8?B?R0VwVDVGcVdKTUN0dnNKeHFoaHVLN2M3c1ExcEpnT1ovaVdWS2t3WXNGMExj?=
 =?utf-8?B?WFY4UktFdEFWOHpXNERtQk8yZTN2d2pDakJtNXdQZFBsbzNHTkNBSk9Ua3dk?=
 =?utf-8?B?Q2lzQ0gyVGZ4Qjg2WWwyN0hHYU5KZllpMmR1bW1LVHc4ZUdzSjhKd00vNE5a?=
 =?utf-8?B?Y3FLaWNBK1F1OGUrai9aTWNUcHdnNlhONUxVOGVhZ0hVOTRpYlc1UEx0S1ll?=
 =?utf-8?B?QURyZUs0cUpUTEcwdlhPbkR0WW1SaU9DNVZzQ2hsajc2V1ZkZjRvSWtpME5o?=
 =?utf-8?B?eEVtQ21mRVZudUZhSzFCdlhjcVQyUktJbzcvSURyMGZKUWh4RUlNcHFMSDY4?=
 =?utf-8?B?Y0xmOXorRG11Wit2ZTBNdFp6MlhPbHZWOXRIMHlBSHl5ZFd4UDd1N3R6UXRj?=
 =?utf-8?B?ZTZyNWlyWndzU1ZzZVBXTkFpdGFtZjBRczl2SUtQaG5XOHc1VTVoNks3WGdP?=
 =?utf-8?B?cGMxSWFkV0g4VXB3MXgwZS9TclBxUDdHMHpERmUrclRZUlV0ZkhiVys2dWV4?=
 =?utf-8?B?OGoxWWdodnV3UmVyOUo0VWJzTTdaS2JNckdnZGtiYXBRVlR0cEdZTEhySGNL?=
 =?utf-8?B?dHVmdjN2TkpHZFN5YUI0ZUZiMFhlWm93Z0dTZldQSHd2dlhxUjhMRm41YVF5?=
 =?utf-8?B?N1BFd3FWVzRyTHJ4RGU0UzJLb2RFSmhiQlVtRmVBUVNQaUxzb2pWM2ZOV3hk?=
 =?utf-8?B?V2M5N1FzekFXT01GSk5VWWdIYkdYVXAxNFBYdU1wUEJnNTdoNDRtb0prMkRS?=
 =?utf-8?B?eUl5U3FtTmlDOHdRbWRvUUpPY1Eya3haNklldHF0a0h5WHJWQU1EVU9MWlN2?=
 =?utf-8?B?aVE1cVh5cTFkenFSbVgyY214S0FrdHlsUmkvNEVZYWM0T2xaMmhUdzNzVnRG?=
 =?utf-8?B?dDRxbWhoajZRUmJKZndwQ2N5TENQM2o5ZnNST0hPUmZ6QUNBWGhCVytNaXZ6?=
 =?utf-8?B?VTB5bWlacHlvZzJQaStLT2VpSHgrR1FKQ05hWmMrcG5NcHBDSjVEd3M1Snhv?=
 =?utf-8?Q?5eircqiQSRfW7BR6wZ0xlgabKLci7GfS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mkc1SG9LUDd3c0JlWEtqZ251TlpQeFJ4TEFYbENubWtYbzZTaTZOZnZKL0tl?=
 =?utf-8?B?ei9iTXFEd3Q1MTUvODRJTmkwQjRTc3FvcmpTdmtqekJMRkQ5a0xFQW8zUUNk?=
 =?utf-8?B?aHdNZ0xJbXJDcndPb1F3ZVd4NnRVYldWYmo2RkN1Rm12SzFvZk5VOURwNFF2?=
 =?utf-8?B?WTQ2L3IxVzFOQ1pVODhjNEpHaTEwdFZ2TlpDcXNpNmloYk1oREEvTXFsZG10?=
 =?utf-8?B?WXlCMEltWWFSZ2l4bXVVSUNqVXNrSXZpZ2NqU0VPS25KRzByYUJvU3dKUzdk?=
 =?utf-8?B?cXJObEd2MEsyaStDemdFRFQ3d2gySURPek5iU2V1S3lTblFJendKY0I5RGVw?=
 =?utf-8?B?TCtZQXhJaFpuY21xalEyNXRJNDB0YThGRzZMYTgvRzJ0dGdrVU5zaGZsYTBn?=
 =?utf-8?B?dUQwSFFQQzVielQ1dHQzenUyaVBxOExLcGJzNGkwWUZ4Wm5YZmxIZSt6WUlP?=
 =?utf-8?B?L1JqUzhRMkZOYXcxZ25LdGROTUovZ3RobGJ1eHEyNnBVQjhPVjZ4VFQ1MFhk?=
 =?utf-8?B?VGxnNklOcEZRQnpQcksvSC9ZRytNRU04eCt6STRsQk9KS1FuUjAyYVljV3Vt?=
 =?utf-8?B?cnVFTTZDeDVDQmRGbTJKa0kwMC9hVjJKdmNBZ1k1NitMOGpwSHpJbnZBajFo?=
 =?utf-8?B?SkRvQWNCTEhZVWxnd2xUTlJNd2RHL0hCOGVicUNlckdJSkt2NzhjSWVaZVFp?=
 =?utf-8?B?LzlyTlF2Uk1MZWJnTUNETjNmYVREU2NmMDNrYTc3R0VTOStSVGNLY0prWldr?=
 =?utf-8?B?Rk13WXlzc0JpQXk3TzdYajkrYVZadW5ZWUxNUUI4dUgybE9BN01MNTRFSzR3?=
 =?utf-8?B?N2FvMk1nYldvbDRkZGdybFRkSkNRVlVHRUtBdjFyUXRnRnVwQ25wVGJsR2pS?=
 =?utf-8?B?dnVlYU9pNkVvMHhxeWpBV25tS3hPaEgyVXJWUUx3OHI5b256eEZ1a1hBNUpm?=
 =?utf-8?B?UjJUSEs4Vks1MWhVRTR0d2lETmx2WGVOOUdtR1hFS01KY1hPTWplNFpyWG16?=
 =?utf-8?B?WHRzSE5lR3dGL05YanlKKzB4Mk1BUXl1eXoxNUg4RVYvTWJGSDBVRGNERXBQ?=
 =?utf-8?B?bkdtSkhQUUNNa05ISXYrM0JBWFVkTXZZSmVsZ1ljcTg5a3pRcGZQZzZHQjQ3?=
 =?utf-8?B?UnNVTmdDUDJqN0M3WDZ3cEdCblZ5N3l4anZ5Z0pZb1h0cDlzWXcwSDM3Y1BO?=
 =?utf-8?B?dDhqREtTZnoxWE1iNnVybXZvWExZOWJkU05FR0grZG1wcmRRd04zUzFTbThR?=
 =?utf-8?B?ZEsvWnBhV3ZpemV3eXl5NTk3WG5HTHFsdGVyUmpMUkxSdEF5eVRTdVZ2c00v?=
 =?utf-8?B?ZVBxbHFSNnh6S2I1MmpiY2RFMm82YmsvUFdYOVNxY0pCNUl2N2FTUzhJMG1U?=
 =?utf-8?B?djY2dFJZdXNXUXZsNEQwd1diVnRSMXRSV0ZOTEEvQndaQlhOc09FSUpXdjA2?=
 =?utf-8?B?TFVLdi9ZVGo3USsrRzlKYjVPTE4xbVZWMlpEa3hmaGhmRE1qZ3hiZ0xQeTJI?=
 =?utf-8?B?SHVZN3p1UUp5TkFLL3hLd21XOWFhYWd1MGlhN29iMEVMK1VrdktIOFN2ckZi?=
 =?utf-8?B?V2VtanZaL2dnUXNLQzJIcUxnUGVJT3dXRG0xdGU5Y0Z4T25YNndPTmE5NnJp?=
 =?utf-8?B?aTVVTVA5RnREbWYra3N6Vm0yMjhSRDF5cTdEaXZzWWFjb01QL2JOK2Njb1po?=
 =?utf-8?B?akZhZGg5TzJFZktoTlVLdzJObks4UXc3aDJ4N1FNcm10ZS9rRjI5VjdKL0xj?=
 =?utf-8?B?b1RPTXdqVFd2S01FZm5ic2ZPckY0djlDQmcvT0RHb09WK3BZeGc3ajB3blF0?=
 =?utf-8?B?K2tvai9EUlNHWkRGTzFLOWFuTnZuSFJLT2FPNktVdXRLV09ISXZXalBSaGhJ?=
 =?utf-8?B?REhmQUhFSWRNNWppbU53aE9tM3dzREpZbWdzZEdHS1B6Y2JEL202WEVYUld0?=
 =?utf-8?B?VVhWcG9MbTh4d3ZkdnN2dmlBQTZKZmpBNERhU2JNRU1sOFltVitnV0xGZW8z?=
 =?utf-8?B?VDViUWJEVnBzREc5QWE0WGxBWTVLZ1JaaDJZc0ZhSGQvZHVjR0xXV2VZSUNE?=
 =?utf-8?B?OWZOSjl2VXFHanBqTmlUWlhmdjF6cWh0QTNWZ2V2Um9nNzllRjQraDlYWFZq?=
 =?utf-8?Q?v2jwteQPJp1/+dCHbFXokgpVJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21d35f04-c20b-4a96-e282-08de01effc6c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 20:12:17.8957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kiCxOiNCncGENRGgWgsZGU0qjak06c2H2fPCl8PhDOnJ7PuxDlD7fadVRiV8v4GrKjBI2y85wS7IkTozkvqljA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9268
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
>> From: Harry Wentland <harry.wentland@amd.com>
>>
>> Setting the COLOR_PIPELINE plane prop is only allowed when the
>> DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE is set.
>>
>> Setting COLOR_RANGE and COLOR_ENCODING is only allowed when the
>> DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE is NOT set.
>>
>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>> ---
>>   include/drm-uapi/drm.h | 15 ++++++++++
>>   lib/igt_kms.c          | 63 ++++++++++++++++++++++++++++++++++--------
>>   lib/igt_kms.h          |  1 +
>>   tests/kms_properties.c | 20 ++++++++++----
>>   4 files changed, 81 insertions(+), 18 deletions(-)
>>
>> diff --git a/include/drm-uapi/drm.h b/include/drm-uapi/drm.h
>> index 4e4f7c2c3..6b9af3348 100644
>> --- a/include/drm-uapi/drm.h
>> +++ b/include/drm-uapi/drm.h
>> @@ -869,6 +869,21 @@ struct drm_get_cap {
>>    */
>>   #define DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT    6
>> +/**
>> + * DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
>> + *
>> + * If set to 1, the DRM core will
>> + * - expose plane COLOR_PIPELINE properties for pre-blending color 
>> management.
>> + * - reject setting of these plane properties:
>> + *   - COLOR_ENCODING
>> + *   - COLOR_RANGE
>> + *
>> + * The client must enable &DRM_CLIENT_CAP_ATOMIC first.
>> + *
>> + * This capability is currently in development.
>> + */
>> +#define DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE    7
>> +
> 
> I think this should go in a separate commit ("inclde/drm-uapi: sync with 
> color pipeline series")
> 
>>   /* DRM_IOCTL_SET_CLIENT_CAP ioctl argument type */
>>   struct drm_set_client_cap {
>>       __u64 capability;
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> index 7191bf92e..a9641eba4 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -2545,6 +2545,8 @@ static int get_drm_plane_type(int drm_fd, 
>> uint32_t plane_id)
>>   static void igt_plane_reset(igt_plane_t *plane)
>>   {
>> +    igt_display_t *display = plane->pipe->display;
>> +
>>       /* Reset src coordinates. */
>>       igt_plane_set_prop_value(plane, IGT_PLANE_SRC_X, 0);
>>       igt_plane_set_prop_value(plane, IGT_PLANE_SRC_Y, 0);
>> @@ -2561,13 +2563,15 @@ static void igt_plane_reset(igt_plane_t *plane)
>>       igt_plane_set_prop_value(plane, IGT_PLANE_FB_ID, 0);
>>       igt_plane_set_prop_value(plane, IGT_PLANE_CRTC_ID, 0);
>> -    if (igt_plane_has_prop(plane, IGT_PLANE_COLOR_ENCODING))
>> -        igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_ENCODING,
>> -            igt_color_encoding_to_str(IGT_COLOR_YCBCR_BT601));
>> +    if (!display->has_plane_color_pipeline) {
>> +        if (igt_plane_has_prop(plane, IGT_PLANE_COLOR_ENCODING))
>> +            igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_ENCODING,
>> +                igt_color_encoding_to_str(IGT_COLOR_YCBCR_BT601));
>> -    if (igt_plane_has_prop(plane, IGT_PLANE_COLOR_RANGE))
>> -        igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_RANGE,
>> -            igt_color_range_to_str(IGT_COLOR_YCBCR_LIMITED_RANGE));
>> +        if (igt_plane_has_prop(plane, IGT_PLANE_COLOR_RANGE))
>> +            igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_RANGE,
>> +                igt_color_range_to_str(IGT_COLOR_YCBCR_LIMITED_RANGE));
>> +    }
>>       /* Use default rotation */
>>       if (igt_plane_has_prop(plane, IGT_PLANE_ROTATION))
>> @@ -2982,6 +2986,9 @@ void igt_display_require(igt_display_t *display, 
>> int drm_fd)
>>       if (drmSetClientCap(drm_fd, 
>> LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT, 1) == 0)
>>           display->has_virt_cursor_plane = 1;
>> +    if (drmSetClientCap(drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 
>> 1) == 0)
>> +        display->has_plane_color_pipeline = 1;
>> +
>>       plane_resources = drmModeGetPlaneResources(display->drm_fd);
>>       igt_assert(plane_resources);
>> @@ -3609,6 +3616,29 @@ static uint32_t igt_plane_get_fb_id(igt_plane_t 
>> *plane)
>>       igt_assert_eq(r, 0);    \
>>   }
>> +static bool
>> +igt_atomic_ignore_plane_prop(igt_pipe_t *pipe, uint32_t prop)
>> +{
>> +    igt_display_t *display = pipe->display;
>> +
>> +    if (display->has_plane_color_pipeline) {
>> +        switch (prop) {
>> +        case IGT_PLANE_COLOR_ENCODING:
>> +        case IGT_PLANE_COLOR_RANGE:
>> +            return true;
>> +        default:
>> +            return false;
>> +        }
>> +    } else {
>> +        switch (prop) {
>> +        default:
>> +            return false;
>> +        }
>> +    }
>> +
>> +    return false;
>> +}
>> +
>>   /*
>>    * Add position and fb changes of a plane to the atomic property set
>>    */
>> @@ -3628,6 +3658,12 @@ igt_atomic_prepare_plane_commit(igt_plane_t 
>> *plane, igt_pipe_t *pipe,
>>           igt_plane_get_fb_id(plane));
>>       for (i = 0; i < IGT_NUM_PLANE_PROPS; i++) {
>> +        if (igt_atomic_ignore_plane_prop(pipe, i)) {
>> +            igt_debug("plane %s.%d: Ignoring property \"%s\" to 
>> 0x%"PRIx64"/%"PRIi64"\n",
>> +                kmstest_pipe_name(pipe->pipe), plane->index, 
>> igt_plane_prop_names[i],
>> +            plane->values[i], plane->values[i]);            continue;
>> +        }
>> +
>>           if (!igt_plane_is_prop_changed(plane, i))
>>               continue;
>> @@ -5222,12 +5258,15 @@ void igt_plane_set_fb(igt_plane_t *plane, 
>> struct igt_fb *fb)
>>           igt_fb_set_position(fb, plane, 0, 0);
>>           igt_fb_set_size(fb, plane, fb->width, fb->height);
>> -        if (igt_plane_has_prop(plane, IGT_PLANE_COLOR_ENCODING))
>> -            igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_ENCODING,
>> -                igt_color_encoding_to_str(fb->color_encoding));
>> -        if (igt_plane_has_prop(plane, IGT_PLANE_COLOR_RANGE))
>> -            igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_RANGE,
>> -                igt_color_range_to_str(fb->color_range));
>> +        if (!display->has_plane_color_pipeline) {
>> +            if (igt_plane_has_prop(plane, IGT_PLANE_COLOR_ENCODING))
>> +                igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_ENCODING,
>> +                    igt_color_encoding_to_str(fb->color_encoding));
>> +
>> +            if (igt_plane_has_prop(plane, IGT_PLANE_COLOR_RANGE))
>> +                igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_RANGE,
>> +                    igt_color_range_to_str(fb->color_range));
>> +        }
>>           /* Hack to prioritize the plane on the pipe that last set fb */
>>           igt_plane_set_pipe(plane, pipe);
>> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
>> index f140ad91a..8ec39fa85 100644
>> --- a/lib/igt_kms.h
>> +++ b/lib/igt_kms.h
>> @@ -508,6 +508,7 @@ struct igt_display {
>>       bool has_cursor_plane;
>>       bool is_atomic;
>>       bool has_virt_cursor_plane;
>> +    bool has_plane_color_pipeline;
>>       bool first_commit;
>>       uint64_t *modifiers;
>> diff --git a/tests/kms_properties.c b/tests/kms_properties.c
>> index b30387888..e646b8184 100644
>> --- a/tests/kms_properties.c
>> +++ b/tests/kms_properties.c
>> @@ -101,7 +101,7 @@ static void cleanup_pipe(igt_display_t *display, 
>> enum pipe pipe, igt_output_t *o
>>   }
>>   static bool ignore_property(uint32_t obj_type, uint32_t prop_flags,
>> -                const char *name, bool atomic)
>> +                const char *name, bool atomic, bool has_color_pipeline)
>>   {
>>       if (prop_flags & DRM_MODE_PROP_IMMUTABLE)
>>           return true;
>> @@ -111,6 +111,14 @@ static bool ignore_property(uint32_t obj_type, 
>> uint32_t prop_flags,
>>           if (atomic && !strcmp(name, "DPMS"))
>>               return true;
>>           break;
>> +    case DRM_MODE_OBJECT_PLANE:
>> +        if (has_color_pipeline && !strcmp(name, "COLOR_RANGE"))
>> +            return true;
>> +
>> +        if (has_color_pipeline && !strcmp(name, "COLOR_ENCODING"))
>> +            return true;
>> +
>> +        break;
>>       default:
>>           break;
>>       }
>> @@ -164,7 +172,7 @@ static bool has_additional_test_lookup(uint32_t 
>> obj_type, const char *name,
>>       return false;
>>   }
>> -static void test_properties(int fd, uint32_t type, uint32_t id, bool 
>> atomic)
>> +static void test_properties(int fd, uint32_t type, uint32_t id, bool 
>> atomic, bool has_color_pipeline)
>>   {
>>       drmModeObjectPropertiesPtr props =
>>           drmModeObjectGetProperties(fd, id, type);
>> @@ -183,7 +191,7 @@ static void test_properties(int fd, uint32_t type, 
>> uint32_t id, bool atomic)
>>           igt_assert(prop);
>> -        if (ignore_property(type, prop->flags, prop->name, atomic)) {
>> +        if (ignore_property(type, prop->flags, prop->name, atomic, 
>> has_color_pipeline)) {
>>               igt_debug("Ignoring property \"%s\"\n", prop->name);
>>               continue;
>> @@ -230,7 +238,7 @@ static void run_plane_property_tests(igt_display_t 
>> *display, enum pipe pipe, igt
>>           igt_info("Testing plane properties on %s.#%d-%s (output: 
>> %s)\n",
>>                kmstest_pipe_name(pipe), plane->index, 
>> kmstest_plane_type_name(plane->type), output->name);
>> -        test_properties(display->drm_fd, DRM_MODE_OBJECT_PLANE, 
>> plane->drm_plane->plane_id, atomic);
>> +        test_properties(display->drm_fd, DRM_MODE_OBJECT_PLANE, 
>> plane->drm_plane->plane_id, atomic, display->has_plane_color_pipeline);
>>       }
>>       cleanup_pipe(display, pipe, output, &fb);
>> @@ -244,7 +252,7 @@ static void run_crtc_property_tests(igt_display_t 
>> *display, enum pipe pipe, igt_
>>       igt_info("Testing crtc properties on %s (output: %s)\n", 
>> kmstest_pipe_name(pipe), output->name);
>> -    test_properties(display->drm_fd, DRM_MODE_OBJECT_CRTC, display- 
>> >pipes[pipe].crtc_id, atomic);
>> +    test_properties(display->drm_fd, DRM_MODE_OBJECT_CRTC, display- 
>> >pipes[pipe].crtc_id, atomic, false);
> 
> Is there a reason to not use display->has_plane_color_pipeline here?

The patchset focus on plane so it is false for CRTC and connector 
(below) for now instead of passing display->has_plane_color_pipeline for 
CRTC or connector.

Hi Harry, please correct me if I am mistaken.

> 
>>       cleanup_pipe(display, pipe, output, &fb);
>>   }
>> @@ -258,7 +266,7 @@ static void 
>> run_connector_property_tests(igt_display_t *display, enum pipe pipe,
>>       igt_info("Testing connector properties on output %s (pipe: 
>> %s)\n", output->name, kmstest_pipe_name(pipe));
>> -    test_properties(display->drm_fd, DRM_MODE_OBJECT_CONNECTOR, 
>> output->id, atomic);
>> +    test_properties(display->drm_fd, DRM_MODE_OBJECT_CONNECTOR, 
>> output->id, atomic, false);
> 
> Ditto
> 
>>       if (pipe != PIPE_NONE)
>>           cleanup_pipe(display, pipe, output, &fb);
> 

