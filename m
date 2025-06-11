Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD331C71133
	for <igt-dev@archiver.kernel.org>; Wed, 11 Jun 2025 15:21:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77C0A10E6A0;
	Wed, 11 Jun 2025 15:21:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="S8uu6ZDa";
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2067.outbound.protection.outlook.com [40.107.236.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA2610E6A0
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jun 2025 15:21:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=byd5ac5BtH1yn0Ew8QUWDIhnJST7Ku6K8PQ/+oLyI8LXK7AGgDL85P8uqoNVB378a5rYfbzg2v9UQKLi9k2m5RQc4PZ9sOqMTjFf2DjcOFZMFA5GeChvzx2aHwoKWSejhx2aTc9SB+Wj3+Z81jc6m9tv8E8xVJe4h9oKAsLdwjL0MTakYJoLSOcv54Ee0pkkgI9io3WOOv+dBbbJ8qmjBqjhFma3KtpMQu21d3A4OSeeYNf4deA4NUOEUaOQzCrpr0fYqx59vcndIacp6Fwv8owt6eBkuLVRmNvAnPJzzP64CUAhzrvQeFNByLmiEI8pMWPwbyyvk40r+EcVGICjgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ExtMbQRWiGmBwekO5iHEgfdbOkm4qJzjLYxgEFZgA4U=;
 b=H2nk5kstXiO7GEgFYmzyYLjkLfTEXSLVB4qgp4i7Xf+/bbVy/VnMmqizlbbqP+yPj7+JU8cLWOba4w2yU4V7gsrQOYVIdzxov4b6MuVDs7aMMRpuOIRnAzcrubZ2OkAVpg63V7d5Q80cOaP6z+dPokUg2qInXDY2BKjAYADlvut4raRkU+rvROzZGBTCOxHzCyvNtcaHZBqpK2hRsBoyyRxesVpL6j+YwUjEDcLXvFhPf/oRZLetZBcA5y+Wo8qJkq/gc0nEnd6I6I2ZFYl2fRIrknPIGD8lwzkpQHXuaBaEgMybh/bi3PBSkVZVlDF11exemh/Rc4acPL0laYpEEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ExtMbQRWiGmBwekO5iHEgfdbOkm4qJzjLYxgEFZgA4U=;
 b=S8uu6ZDag3t2xeQwfd0mCjt3Y9VC/X/R7ifmLsl9JtcgRguD/c/RjdUqxLYN+UJ3hKQgVZvTSrnMoY4EiZPebTgo+1KJNDADuyD1BJLeSRHXE7yp8t9mpgnh4OpVilYucYkZ4Ah5llgsHkzhuYIKp3qPXbMnHDTS++Wf+lqgKWU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15)
 by IA0PR12MB8861.namprd12.prod.outlook.com (2603:10b6:208:487::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Wed, 11 Jun
 2025 15:21:51 +0000
Received: from BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e]) by BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e%3]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 15:21:51 +0000
Content-Type: multipart/alternative;
 boundary="------------AKlEeo5n0nI0moPAVrNKYSke"
Message-ID: <7264a3f2-d860-4804-a614-690d78a2ce01@amd.com>
Date: Wed, 11 Jun 2025 20:51:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/amdgpu: Fix compilation warnings for USERQ
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Sunil Khatri <sunil.khatri@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20250611140415.158461-1-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <20250611140415.158461-1-kamil.konieczny@linux.intel.com>
X-ClientProxiedBy: PN2PR01CA0028.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::33) To BL1PR12MB5753.namprd12.prod.outlook.com
 (2603:10b6:208:390::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5753:EE_|IA0PR12MB8861:EE_
X-MS-Office365-Filtering-Correlation-Id: be710569-ac2e-498a-9536-08dda8fbb092
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|8096899003|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aUU1OG5wd1MzbGlpYyszeG11alZEa3hzTEtjNEIvRTBBWjlCSnN6RVRud1FT?=
 =?utf-8?B?aHJXMm1ZWDZjd0lvMnZEZkFKV3lJT0lnQ0lqM25xR2t2S3BGR0VKRzE0NHV2?=
 =?utf-8?B?YUxwbWdwNitTNXM4cEV0WkRIeTYwTk1BM0JLK05kSzlJb2YvSnlSbDVzUVpV?=
 =?utf-8?B?U1ZVdmkrd2EvZ014eHJxQ1N0dTVxZ2ZzUTlOK3RST0RNbHVvVGF4cGRSeHNK?=
 =?utf-8?B?ZW84NFJiNmRXdTFyMmFUL2JUTWlLNklYWndXVS9ZQSs2MEJleGtPQWdjM0p5?=
 =?utf-8?B?cGxnVU1zRUROOXM3aTZ1WGNITEd0TFk4ZHFoc3NUellwYUZxbGtOdHZrN1Za?=
 =?utf-8?B?aVBTYk9GUi9mRzNzTTRmcTBjd2NpK3VaUU9WMXhTRjhud1lTRldvZ0l0bUJy?=
 =?utf-8?B?NnBDMWU4S1ZlSnlJTzFQeHRmZTk1dDJlUnF3TDRiTjhxVytkUDRoeEVvdHQ4?=
 =?utf-8?B?ZnlEVGZUV2NPbXdTK25OY3lYdjN6d3Boei91YjkrTllVQ25oQnUvbTJ5K0ZK?=
 =?utf-8?B?TmhFb0VCWTZhSVhhWVhqeUNhYXRKWHYzU1g3ZzRaRTg4SFhIS2VLSWhkVXhE?=
 =?utf-8?B?a1dIUUk3REJBUHo3S3hXcVFLTlZzYTZnRDJyWUZsSkRBV0J1OXpKQVZ4a1pM?=
 =?utf-8?B?MlVjaHI2Qk1IQWlEOHkrcy8zWUh6cFpJUDI5UzlMVlBPTGtlcGVxcURYSlRQ?=
 =?utf-8?B?NVQ5Zzg4SmVTT1Rrak84djhjRkdPZHUxVUU3Ykh3ZWJlL3IvWlE4Qml2SW13?=
 =?utf-8?B?QjNJVHJETDYzVGJYMkp4cGtCUlh5akRNS05RVEZNMDBYbHQ2ZTUrWmJ2b294?=
 =?utf-8?B?MlFXaElPU04zdHkzOU42OFkvbFpZSmZ2ZWNzNzB1TVdOK1c4SjZ0WmxGT1d4?=
 =?utf-8?B?MklTWnZIdCtldHZ5R2phc2pqaTU5eWtRZ1FPblZJUmNLUHNpWGVtY0k2M2Y0?=
 =?utf-8?B?QlN6VHkyTlhuRm5xVitwTHQ1WTkycEpQYlN3SGg5UTlzNE0yOUJ1UFViRmVr?=
 =?utf-8?B?YUxVNGptL3lrMzYwTXZzVG9YNVRIWEJrclBYUmRpbW5mQmpxblUvUFZhSWlY?=
 =?utf-8?B?cmw5RTJFZmpZV25EenZobXMrdUlTZUZ1emg0akkvMXgyS1AremhiLzFTREd0?=
 =?utf-8?B?djhRRTBHMER5cGVuYW1WckJUb0YraStiZkltN2VKaU9OUWQ2VnlweHQwSGha?=
 =?utf-8?B?OXdHbjlXVk56WkM5cS9QZ0JFOXQ2TXExaCttMUkvQ2gxRGxiK3Fma2pGZTR0?=
 =?utf-8?B?bFM3aEJVSXFiWmF0K1doeTdMcXFxMUg1dGRjTGVrNFZlclBmbXJHdnlWUVkz?=
 =?utf-8?B?OE95Y2tkWFllNVhUalg0NWJEdzhOUTdsS2FDa1paVEF3azViV0l2V1pmZ0lG?=
 =?utf-8?B?QWxtbWFKOGRzY1hpOHBDS2dFcnBUMnZjZTMzQjhrdyswL1lLYjlVSXJtWk9h?=
 =?utf-8?B?elFaa0FOZ05UeFFPcWdyb0JzMGlxeGNPeEk2NXh1U3RaUTZpbng4c3FNbmNB?=
 =?utf-8?B?Slkzdkc4azhnM3BUNkl0enY4b3Q1Z3p3b2hGM0VFY0paU0ZsTmZSLzlCdjlB?=
 =?utf-8?B?MWkvNzZZek1qQ2xxbERVUHZvcVJ2MEgvZ2xnbENpb2M4SndXQWJQNXVFVFFG?=
 =?utf-8?B?R1k2Qkl2SS8zODhVR00xWDJhTDM4SzZJYWpQOFhJM0cwV1p1SlkzNDZ6emp3?=
 =?utf-8?B?elg3c1lvSy9TYU82bThnQWV5OHhwZWdTNjRmWmVabnlEWUcxMjlKQ24vb2Fj?=
 =?utf-8?B?N2srZGF4NlY5dktweUxLWU81b2pDbDhxTHJNN3BZOUVUQnhRSE40bnZIZnlh?=
 =?utf-8?B?eGFqbmpXTHBnVXlWbURGdVcwUmZJTjErNWdkL1l5a0E0VThUdTJ0cy9RYUx3?=
 =?utf-8?B?Mk4xLzlWSU8wWlAydlFFSEJiSitjWXRyRXQ3VHV1cysvWDVNSWdvOGs1UXdN?=
 =?utf-8?Q?Lpa2nvwr0CI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(8096899003)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHhSUm5MbG9jMnZZWHcrSXBvTDAxNFYrTVA5dTh1RjdGSzBHNXFqQjZPdlhl?=
 =?utf-8?B?ako5TGE5ZHdJZ0VkbGdSN3hLV09MU0xuQVVBZ2t4OFZpS1dEcDJGRUdyOGZG?=
 =?utf-8?B?dnRmcEpOYzFjcUhnWnhUV090UUNXNld0cnlGR2hIbFVJMGNSSE5SRTJnZUIx?=
 =?utf-8?B?RlNHQWozNW9yaENUZDZRdVFyNVFZckg1M2dFWTZkLys3bFAvMWljeWhPbk1O?=
 =?utf-8?B?K1JvOVZEMmEvSnI5VFFKOCtzUnhONTFTRWJWSHlBa0g3RndrMStuOHN1TGJy?=
 =?utf-8?B?SzEzWFZacm85YTdMdE83ZXFmK2piR0VKakw5QUdyZk00N3V5c3ZPcFRQQlpH?=
 =?utf-8?B?SjRnWldkRVBjRzc4c1kzdXZ5azZlVFd0WW5ZUktPOGpZTjFhUDlWaFVvd2xo?=
 =?utf-8?B?a01mZU0zYXoyeERTSjdzcjhGTzVDcU9TSHJhTThoa0VKd1NXYjBHMnlVMldO?=
 =?utf-8?B?ck5pNVl5Y2NXYVJ5dEJsZnVsN29Ld1hwaDJKQlNuZDB5VzFHcTQ0MGxxcnAv?=
 =?utf-8?B?b213N1RGSktSSWwyK1V5d0pMSUdVaE85d0s5SW9LcXdCYmFLZ0g0K1llZnNZ?=
 =?utf-8?B?dHlRMkhZeldoa3FPRWo4MlFXTEtkV1djeTNzK0Y5TGt2MHNmaFQ4MC9PcWRL?=
 =?utf-8?B?Q1VkRGlyMmRuUkxFL0kzeVdUVkNMUE5jaHR4bXZpdHhOMllBWlB3MGx4dkVq?=
 =?utf-8?B?V2dsdVdFczZOYXl2NUJmNUliOSt1Z3dpRURVSWxlbi9Lcmw4QXFYVVFTNnpS?=
 =?utf-8?B?dHJyUVJaQXh3SCtmRkNLU0lTRFZVSjBVWkFzWjRuUi9TVGY0K2VGOUlNMndC?=
 =?utf-8?B?K2RkbHVKa01GMUhkZnAwemQ1dk1yZEN0YzZyVERMemJ4Qmw0NVhLck5YeElx?=
 =?utf-8?B?aVlPQll6KzNvZ3k5bkNLNVBBSmM1bVJnNDdYRFl0MEdDdmJ6NXB5aVpPQ3Z1?=
 =?utf-8?B?eXRQQUFCbjBBTHQrYm15em9Mc2c4V0ZMVlF0TXlMVlFVOXJHQlpXTlZSQjYr?=
 =?utf-8?B?cGUxNmVPWFVuM1Rkb1pvdU9rYjIvT3lPOGVGNkdReWFkTGFEbHJqenNKL3c4?=
 =?utf-8?B?MnF3Njh2TzI4bldLU1poMVVPcFMvbmJBd2U2c1lqZ2g4NEtJeEVHZytiQVlu?=
 =?utf-8?B?M0xqR2Q2QldqZlQ0VDdvY3NPL2JWREpQR0NTOWpEOUcvMjBkRUt6N3VrZW1r?=
 =?utf-8?B?cFNqN21adnhJMCt4WnA4TXFwRHZLK2Vid0hUWldFWEVhaWpQTjFqekNJaHN6?=
 =?utf-8?B?L1BCbmxMN1V6MDU3UCtKbXVEU0diSStubUlHeHJYaUF0eGZqMkQwUitiZzhI?=
 =?utf-8?B?REl0a3FialBoNEduU3BuVlQ0NFppR2JHbDFzdGp3Q1paanNTaTIrbnExd0hO?=
 =?utf-8?B?Q2FMd3RjYnA2cVM4L3Z2blpWUEJRZ01ySTBMYjROQ2Y5a3M2dHlXbmhuMm40?=
 =?utf-8?B?dlpPM0V2bllMTkpCdU1vNXhjOUR1OFZJRXZoLzhDbVRNNHFNaUtzdDhrMFRB?=
 =?utf-8?B?SW9NaFF3VVZxNGx6VU9oczFMUHU3cjlrU0FUV3RlVVVXTWtlSGhTT2VMT08x?=
 =?utf-8?B?NVhJaUd5L01DMnRxMEtlTU0vY2h5R1JDZXRFbmJSUkM5dnd2NmkrY0p4cWs1?=
 =?utf-8?B?dUw5MllZVHBtdzJZMW96OXNtbTBHZEpWTEp2RFhYQWJtRWppSjRSamFoWXl2?=
 =?utf-8?B?b3N3QWtRUWthb0RiaDRPUisxZVM4T2tMeXJDb0taUjR6dG8rZ3Z4WEZEZVNW?=
 =?utf-8?B?eG9SOGE1cmQxVFJsakdQNEpwU2RzbDhxbHA1SFo4ZHYzeENrWU5GbFNzUjNT?=
 =?utf-8?B?bXNBalY2TEFRYnVGR2Fuc2RvVXBqU0JFQURZZnk1N0Z3Wk5mNUZqd0FzUG1Q?=
 =?utf-8?B?OUExT0YzREJ1aHZoQ2lCQ3M5LzFFME5CMGRkY0MvZzN6NkdYVk8wVDBVYzVW?=
 =?utf-8?B?dEZrby96aVorOWtZbkhNOTdEOW5BUzErajBySTcvTEU5TGhyYTZ6TFNWREgx?=
 =?utf-8?B?SVBKRnhQdEt4eUdCZ2RjMUVQaHlKRERIZC84NStUdEJhLzMvb3dhOUdtNExO?=
 =?utf-8?B?ZEJwSWY5M09sM0p5Q21PVTlYaFNrNVpBSCsvNDBnbkN1YzIzNThPT1dsTC9n?=
 =?utf-8?Q?O8mYA+YmEdApWNirLqjYn1Fvv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be710569-ac2e-498a-9536-08dda8fbb092
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 15:21:51.3093 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sL6QImyDMSAzNK2TRrjA3CdUrWUavFBGWexu5phmq5DovR/Z01rHNrp8OmdzKemuj1SJOYB67ZcgQhsD0vw7rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8861
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

--------------AKlEeo5n0nI0moPAVrNKYSke
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/11/2025 7:34 PM, Kamil Konieczny wrote:
> Recent change bringed compilation warnings, for example:
>
> ../tests/amdgpu/amd_security.c: In function '__igt_unique____real_main311':
> ../tests/amdgpu/amd_security.c:319:14: warning: variable 'enable_test' set but not used [-Wunused-but-set-variable]
>    319 |         bool enable_test = false;
>
> Fix this and move setting var into igt_fixture.
> Also while at this, print if AMDGPU_USERQ_ENABLED was defined.
>
> Cc: Sunil Khatri<sunil.khatri@amd.com>
> Cc: Vitaly Prosyak<vitaly.prosyak@amd.com>
> Fixes: dad4b2bb9e5a ("tests/amdgpu: add environment variable to enable tests")
> Signed-off-by: Kamil Konieczny<kamil.konieczny@linux.intel.com>
> ---
>   tests/amdgpu/amd_cs_nop.c   | 10 ++++++++--
>   tests/amdgpu/amd_deadlock.c | 11 +++++++++--
>   tests/amdgpu/amd_security.c | 10 ++++++++--
>   3 files changed, 25 insertions(+), 6 deletions(-)
>
> diff --git a/tests/amdgpu/amd_cs_nop.c b/tests/amdgpu/amd_cs_nop.c
> index 644016d5d..24fae3635 100644
> --- a/tests/amdgpu/amd_cs_nop.c
> +++ b/tests/amdgpu/amd_cs_nop.c
> @@ -173,8 +173,11 @@ igt_main
>   	bool userq_arr_cap[AMD_IP_MAX] = {0};
>   	bool enable_test;
>   	const char *env = getenv("AMDGPU_DISABLE_USERQTEST");
> -
> -	enable_test = env && atoi(env);
> +#ifdef AMDGPU_USERQ_ENABLED
> +	const char *enable_str = "USERQTEST enabled";
> +#else
> +	const char *enable_str = "USERQTEST not enabled";
> +#endif
>   
>   	igt_fixture {
>   		uint32_t major, minor;
> @@ -189,6 +192,9 @@ igt_main
>   		igt_assert_eq(err, 0);
>   		asic_rings_readness(device, 1, arr_cap);
>   		asic_userq_readiness(device, userq_arr_cap);
> +		enable_test = env && atoi(env);
> +		if (enable_test)
> +			igt_info("%s\n", enable_str);
>   	}
>   
>   	for (p = phase; p->name; p++) {
> diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
> index 45a864feb..d416b4909 100644
> --- a/tests/amdgpu/amd_deadlock.c
> +++ b/tests/amdgpu/amd_deadlock.c
> @@ -45,8 +45,11 @@ igt_main
>   	struct pci_addr pci;
>   	bool enable_test = false;
>   	const char *env = getenv("AMDGPU_DISABLE_USERQTEST");
> -
> -	enable_test = env && atoi(env);
> +#ifdef AMDGPU_USERQ_ENABLED
> +	const char *enable_str = "USERQTEST enabled";
> +#else
> +	const char *enable_str = "USERQTEST not enabled";
> +#endif
>   
>   	igt_fixture {
>   		uint32_t major, minor;
> @@ -71,6 +74,10 @@ igt_main
>   		igt_skip_on(get_pci_addr_from_fd(fd, &pci));
>   		igt_info("PCI Address: domain %04x, bus %02x, device %02x, function %02x\n",
>   				pci.domain, pci.bus, pci.device, pci.function);
> +		enable_test = env && atoi(env);
> +		if (enable_test)
> +			igt_info("%s\n", enable_str);

enable_test is for test specific which arent supported by user queues in 
kernel driver yet but the enable_str only says user queues is supported 
and not test specific. So both are for different purposes

all together. I see the warning is coming when AMDGPU_USERQ_ENABLED is 
not set and in that case the variable enable_test is unused.

> +
>   	}
>   	igt_describe("Test-GPU-reset-by-flooding-sdma-ring-with-jobs");
>   	igt_subtest_with_dynamic("amdgpu-deadlock-sdma") {
> diff --git a/tests/amdgpu/amd_security.c b/tests/amdgpu/amd_security.c
> index 45bd7e771..891d8f577 100644
> --- a/tests/amdgpu/amd_security.c
> +++ b/tests/amdgpu/amd_security.c
> @@ -318,8 +318,11 @@ igt_main
>   	bool userq_arr_cap[AMD_IP_MAX] = {0};
>   	bool enable_test = false;
>   	const char *env = getenv("AMDGPU_DISABLE_USERQTEST");
> -
> -	enable_test = env && atoi(env);
> +#ifdef AMDGPU_USERQ_ENABLED
> +	const char *enable_str = "USERQTEST enabled";
> +#else
> +	const char *enable_str = "USERQTEST not enabled";
> +#endif
>   
>   	igt_fixture {
>   		uint32_t major, minor;
> @@ -338,6 +341,9 @@ igt_main
>   		igt_assert_eq(r, 0);
>   		asic_userq_readiness(device, userq_arr_cap);
>   		igt_skip_on(!is_security_tests_enable(device, &gpu_info, major, minor));
> +		enable_test = env && atoi(env);
> +		if (enable_test)
> +			igt_info("%s\n", enable_str);

We dont want this based on enable_test as its for a different purpose 
all together. Without that the enable_test will again be unused.

Regards
Sunil Khatri

>   	}
>   
>   	igt_describe("amdgpu security alloc buf test");
--------------AKlEeo5n0nI0moPAVrNKYSke
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/11/2025 7:34 PM, Kamil Konieczny
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250611140415.158461-1-kamil.konieczny@linux.intel.com">
      <pre wrap="" class="moz-quote-pre">Recent change bringed compilation warnings, for example:

../tests/amdgpu/amd_security.c: In function '__igt_unique____real_main311':
../tests/amdgpu/amd_security.c:319:14: warning: variable 'enable_test' set but not used [-Wunused-but-set-variable]
  319 |         bool enable_test = false;

Fix this and move setting var into igt_fixture.
Also while at this, print if AMDGPU_USERQ_ENABLED was defined.

Cc: Sunil Khatri <a class="moz-txt-link-rfc2396E" href="mailto:sunil.khatri@amd.com">&lt;sunil.khatri@amd.com&gt;</a>
Cc: Vitaly Prosyak <a class="moz-txt-link-rfc2396E" href="mailto:vitaly.prosyak@amd.com">&lt;vitaly.prosyak@amd.com&gt;</a>
Fixes: dad4b2bb9e5a (&quot;tests/amdgpu: add environment variable to enable tests&quot;)
Signed-off-by: Kamil Konieczny <a class="moz-txt-link-rfc2396E" href="mailto:kamil.konieczny@linux.intel.com">&lt;kamil.konieczny@linux.intel.com&gt;</a>
---
 tests/amdgpu/amd_cs_nop.c   | 10 ++++++++--
 tests/amdgpu/amd_deadlock.c | 11 +++++++++--
 tests/amdgpu/amd_security.c | 10 ++++++++--
 3 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/tests/amdgpu/amd_cs_nop.c b/tests/amdgpu/amd_cs_nop.c
index 644016d5d..24fae3635 100644
--- a/tests/amdgpu/amd_cs_nop.c
+++ b/tests/amdgpu/amd_cs_nop.c
@@ -173,8 +173,11 @@ igt_main
 	bool userq_arr_cap[AMD_IP_MAX] = {0};
 	bool enable_test;
 	const char *env = getenv(&quot;AMDGPU_DISABLE_USERQTEST&quot;);
-
-	enable_test = env &amp;&amp; atoi(env);
+#ifdef AMDGPU_USERQ_ENABLED
+	const char *enable_str = &quot;USERQTEST enabled&quot;;
+#else
+	const char *enable_str = &quot;USERQTEST not enabled&quot;;
+#endif
 
 	igt_fixture {
 		uint32_t major, minor;
@@ -189,6 +192,9 @@ igt_main
 		igt_assert_eq(err, 0);
 		asic_rings_readness(device, 1, arr_cap);
 		asic_userq_readiness(device, userq_arr_cap);
+		enable_test = env &amp;&amp; atoi(env);
+		if (enable_test)
+			igt_info(&quot;%s\n&quot;, enable_str);
 	}
 
 	for (p = phase; p-&gt;name; p++) {
diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
index 45a864feb..d416b4909 100644
--- a/tests/amdgpu/amd_deadlock.c
+++ b/tests/amdgpu/amd_deadlock.c
@@ -45,8 +45,11 @@ igt_main
 	struct pci_addr pci;
 	bool enable_test = false;
 	const char *env = getenv(&quot;AMDGPU_DISABLE_USERQTEST&quot;);
-
-	enable_test = env &amp;&amp; atoi(env);
+#ifdef AMDGPU_USERQ_ENABLED
+	const char *enable_str = &quot;USERQTEST enabled&quot;;
+#else
+	const char *enable_str = &quot;USERQTEST not enabled&quot;;
+#endif
 
 	igt_fixture {
 		uint32_t major, minor;
@@ -71,6 +74,10 @@ igt_main
 		igt_skip_on(get_pci_addr_from_fd(fd, &amp;pci));
 		igt_info(&quot;PCI Address: domain %04x, bus %02x, device %02x, function %02x\n&quot;,
 				pci.domain, pci.bus, pci.device, pci.function);
+		enable_test = env &amp;&amp; atoi(env);
+		if (enable_test)
+			igt_info(&quot;%s\n&quot;, enable_str);</pre>
    </blockquote>
    <p>enable_test is for test specific which arent supported by user
      queues in kernel driver yet but the enable_str only says user
      queues is supported and not test specific. So both are for
      different purposes</p>
    <p>all together. I see the warning is coming when <span style="white-space: pre-wrap">AMDGPU_USERQ_ENABLED is not set and in that case the variable enable_test is unused. </span></p>
    <blockquote type="cite" cite="mid:20250611140415.158461-1-kamil.konieczny@linux.intel.com">
      <pre wrap="" class="moz-quote-pre">
+
 	}
 	igt_describe(&quot;Test-GPU-reset-by-flooding-sdma-ring-with-jobs&quot;);
 	igt_subtest_with_dynamic(&quot;amdgpu-deadlock-sdma&quot;) {
diff --git a/tests/amdgpu/amd_security.c b/tests/amdgpu/amd_security.c
index 45bd7e771..891d8f577 100644
--- a/tests/amdgpu/amd_security.c
+++ b/tests/amdgpu/amd_security.c
@@ -318,8 +318,11 @@ igt_main
 	bool userq_arr_cap[AMD_IP_MAX] = {0};
 	bool enable_test = false;
 	const char *env = getenv(&quot;AMDGPU_DISABLE_USERQTEST&quot;);
-
-	enable_test = env &amp;&amp; atoi(env);
+#ifdef AMDGPU_USERQ_ENABLED
+	const char *enable_str = &quot;USERQTEST enabled&quot;;
+#else
+	const char *enable_str = &quot;USERQTEST not enabled&quot;;
+#endif
 
 	igt_fixture {
 		uint32_t major, minor;
@@ -338,6 +341,9 @@ igt_main
 		igt_assert_eq(r, 0);
 		asic_userq_readiness(device, userq_arr_cap);
 		igt_skip_on(!is_security_tests_enable(device, &amp;gpu_info, major, minor));
+		enable_test = env &amp;&amp; atoi(env);
+		if (enable_test)
+			igt_info(&quot;%s\n&quot;, enable_str);</pre>
    </blockquote>
    <p>We dont want this based on enable_test as its for a different
      purpose all together. Without that the enable_test will again be
      unused. <br>
    </p>
    <p>Regards<br>
      Sunil Khatri<br>
    </p>
    <blockquote type="cite" cite="mid:20250611140415.158461-1-kamil.konieczny@linux.intel.com">
      <pre wrap="" class="moz-quote-pre">
 	}
 
 	igt_describe(&quot;amdgpu security alloc buf test&quot;);
</pre>
    </blockquote>
  </body>
</html>

--------------AKlEeo5n0nI0moPAVrNKYSke--
