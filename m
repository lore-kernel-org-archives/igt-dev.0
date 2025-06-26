Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E96CC77B7C
	for <igt-dev@archiver.kernel.org>; Thu, 26 Jun 2025 01:44:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D370110E255;
	Thu, 26 Jun 2025 01:44:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2SMCGUDG";
	dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2073.outbound.protection.outlook.com [40.107.102.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3B6B10E255
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Jun 2025 01:44:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OciDAy4B90+4fZO+ksmA5YwKUJeVJmsVhEZejMh25nqVog+43sGYgnNTaSruMfHzmRSx0zuDK2yG/fDH5wn2Xp0lTxBDZ5Ocf5Me4pZbImtB1pLcGjShqW/xzJ3BUqltdOS89CigKewD4iZ4MIxl+Hxfi6OsFCGYT8vtaZWuJmh14G6AHDOL/SfpI5H9CrgK96/Cty2qvXHWj0zUO0K7Ml/UdQYPoRLLsAaHnGKCJgkOxzh4FznUgOTpk+8hhxkRKIKthFTnAzz+OTrCd+Ek1qYJboEI/6Z9MaR0ox8EECLV2yrW0z19Wl9ZOWnXb7qO/KyVtg2ejezRFwF8O3mHIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NodK0KGpBH1wvICc7Xmls9z7+GXjFJKqj8sZGIjDnvc=;
 b=exlUJRpLO5HzkfkL5HMKH42FNTen2miLLJCVu/wOlgowZLMazOYWkd/BDrreWcZUUriexT7OFtGhGCUTYe215cijPBfISHIqVd0cIInEZ4809QDqaXf5iRC12TiOxjuQJ7K20saoj+ZQr6sFrx4uyusnIWFqPKy2rAPI5DrMYmJOee6lzYxMHn9e6g1MwVFfjgAIOygAX/kI2vft2yvce6W+K/l2T2Z5BEmZN0lMsIOQweY8p3WT3+T1guG3zVmtadQlGfrxOHSEKbKfBCB7s9mw1u5oqLlKrxKUJEEjI9oYESKRB8HrCX6vtNkZLlH4aH+EphfMCMQw+ggCCubVRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NodK0KGpBH1wvICc7Xmls9z7+GXjFJKqj8sZGIjDnvc=;
 b=2SMCGUDGF/M1jgVn0mF0GfzCv+sGzkMetbbJw66PP6ZQoz4GPybAOqfOxlUfsx51yDQm/zMJYx1M8HmvXYL82G3NxK0jBgvjBSdWV+fR7GaLhy+kQO1tbcKKa73/wxOOd6AP52Y2XkxdKyF4Bg3kcms6yqfTMLbRld2dD6EaYkE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by PH0PR12MB7840.namprd12.prod.outlook.com (2603:10b6:510:28a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Thu, 26 Jun
 2025 01:44:39 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%3]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 01:44:39 +0000
Message-ID: <d6214f78-dc9b-4492-a124-0d286ea02151@amd.com>
Date: Wed, 25 Jun 2025 21:44:36 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 2/2] tests/amdgpu: Add SDMA with UMQ test case to
 amd_basic
To: "Jesse.Zhang" <Jesse.Zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>
References: <20250624080539.3548500-1-Jesse.Zhang@amd.com>
 <20250624080539.3548500-2-Jesse.Zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20250624080539.3548500-2-Jesse.Zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0332.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10a::6) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|PH0PR12MB7840:EE_
X-MS-Office365-Filtering-Correlation-Id: b664b60d-df17-48ea-13b9-08ddb453037f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c0NVWDc1MmN5N2F2ejBqZk9tYVpiekpkOFlDeUVhZUU3TGxxNzZIaVhsVEFQ?=
 =?utf-8?B?OWxEeUdaaTlwWHVRY0dVMVV5RWdwVC9BcGtMMGQzQ1pVRGdmdVdJYWg4YWhC?=
 =?utf-8?B?MVYzRGk4TVp3N0pvdHcyZTUxWitYUksvMEdGME5EMlVmUGV6MUxOV0VBbWRu?=
 =?utf-8?B?aTBta3J5Uit6anhXWXowcUVESjd3MU1oR2pEYzdtdUtIUGovSXA4RmdYN0RL?=
 =?utf-8?B?QjJTNiszVWM4ZE02T2lyOWZuUjE0RWZOaW1xK2dyMkxoWlpUb3FkN3RiUHI4?=
 =?utf-8?B?ZGhDY0dNVWExU1d1SXRaMDYrV0pNZlVkZkVOSTJ3ekU5SlVaeEhyOUZ0NDdm?=
 =?utf-8?B?dHBSeG1ydlJGMGxScmFvVUM3c2ZhMkY1OWcvZlFLV3hyam9QTmxqUjJoTmtt?=
 =?utf-8?B?aFRZYmEvMHRRWVVqL0toRGk0cVBDWVJxaXYzY2pCZ2lJcER5aDRkQTZqVFJ6?=
 =?utf-8?B?ZWNpV2VMeVZaT3p5NndKSGFmTGpqRlBOR0dPSVcwSmhGdWkvUS9IMXAwOW9k?=
 =?utf-8?B?M0ZjbkJOSzl6cndKbGJzR05tM2dIRlhWOHlhMUtIUU1VNXdVazVFakdKWUtK?=
 =?utf-8?B?T1M4NGdkT1NpdUxTaFA2UkYzTlJRVkVkUFNiUy9vRERISlFuVTNmUjE0ckhB?=
 =?utf-8?B?NDJiMUovWWxEZHQxdGd0R3Brb3FvRmt2OTJmNld3RU5UcTVLU1VFcDFOZXhu?=
 =?utf-8?B?Vno1Y203OXA1Nk5FcXdmbTR4S3RPbkNlVks1UC9kMDRjbmJyRVJoRmtrclBG?=
 =?utf-8?B?ZVkyb0hpQUYyaEVlbG1maENoQjdWbDUxdlNwYkwzZVJvVWwwVFRCc0lQTVE2?=
 =?utf-8?B?WFNXaE5zemdyNGpHWjJtZ3BHa2JMZzBzOXF0M3hCQlVnRmJrNzBYMkduRUpP?=
 =?utf-8?B?MVRWdmVBSjZ2bllab2ZsWXBsejRUMzhSM1BGUkRQb0p1MGlDTEkzMkVrak5N?=
 =?utf-8?B?a1lWNmNjNFh0aWtEcW5UY0QwWVJhQjdUSHkrdFVVSXRGZk45RUdZSWxwdGNq?=
 =?utf-8?B?SmxjMUdyTHdrblRzVkpOaUZaU1NsdXBPdWNmOU1RbmZ6M204MVJVVy9TOGt5?=
 =?utf-8?B?OHFiV2dZR29tTUNDRUM5NHlqLy96a09QVFRBL0pkbUwyNVpXVDcwTGE5R2pC?=
 =?utf-8?B?NGF6SUE2VXkzOUtzQXRDc3NBSXg4Wmk3OWI0WVk0ZU96ZkR3YllheFk5N0Ni?=
 =?utf-8?B?L0VabUl2TlYwMEtVR2RqaHBUdDJYMG4zSy9PZWJOcm8zUXh6YXVqZkR6aDdM?=
 =?utf-8?B?YmExakQvUlRadjlNT3RGRVJxc1NaZHBCOHI5TjJOY01BWjh1TGl1bzJiRjl6?=
 =?utf-8?B?TUh1aWF0a0E5MTQwdnVINTlEaUttSmZFMzduWTdnNDBnNytRNlJ3N0Z0Nkxu?=
 =?utf-8?B?RGErSGxwM3lNaVdUb2hMbXhxR0FwWThVQ3B1TE9XQTlhMDBpZnVTMzhsQTBt?=
 =?utf-8?B?eFZ0SGhTYnlMM0pMQTdRSnpDeDhrcFdxZi9QbmhwcFhpQ3BFY0dyZUsvK1lJ?=
 =?utf-8?B?Z28rd2dnZE5IWWFpRTVFdmMwQXBTTFh4SlFiYXRjS2ZDUTk0VEdlVjRhUEJJ?=
 =?utf-8?B?M3c4TlJqWmhueVk2c1UvMjhXVkQxYklIQWhlbXVLZTArSnRnZ1N4OE55OVky?=
 =?utf-8?B?NUxQQ2cyWHFkcXlickdTSXBCUjdJM3dmT29nbFUyRGFMZmlTMHpYYk16aGV5?=
 =?utf-8?B?aVRkdEFlc0ZaRzJvSW5KRWRUNE9NanBmN2pjYjdockJLKzFhY0hNUGM2NGRa?=
 =?utf-8?B?clpackx1ODlJczlzMjhoMTFOQkhNb0RpTGdJT1E4SmxYMldOYnE0dncyb1Av?=
 =?utf-8?B?VU53UCs5MXBUb0VyaVJQMkR5QkhqK0ZidlRTVHhyZ09tdDJETUk2Ui9ZMFR5?=
 =?utf-8?B?K1RpdnhQRGhHNmZFVzVKNlNPZVI4Qy8zWXJaWHo1cmlFem81SGk1Y2VNRkhC?=
 =?utf-8?Q?e+CnXPCDYbU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGdMRjVScmVhK1Y2WVJLU1RSMTJ5R1RXVDBmeFNHS25Gay9VbWVlNGZnS3Z0?=
 =?utf-8?B?anR5UkhDS0JqeUljWXhwWno4bDFQSTZUU1NSQTdIYTdUcEMzTE1BczB1T2tD?=
 =?utf-8?B?SFppTVRvcUV6YzJVcHg5cFJjSkdsTktJdFN3UDdxVVRkTFUxUWVqaDl2TWdF?=
 =?utf-8?B?dUR1VnJPcTkvREE2TnlXd2txVTJvK1BYSnVEaE1YUjRWZnlkOVZFemw1QWYy?=
 =?utf-8?B?YkZxaVJzUjU3b2pxTEczR1IwYytCeWpENjYzaG1XbnJKRFZsaldyaWs1Lzd6?=
 =?utf-8?B?RXh5TDJheDVMOTFDbFlJekpScERjaGRqcjg1anE2QzdneXJhUWZsQjB5MG1n?=
 =?utf-8?B?RGpSQ0s3MHVYdVVmbUloeTBmTjRPUHJCbmRQczYzZXgrajNLWWs5Q1NLT1Bn?=
 =?utf-8?B?U3piL1hKNGNBYktJdmRXTy9sTmJ6UUZ5SWhkc0d1dm01WkJwYk1Pak1oWjBF?=
 =?utf-8?B?RFcxQlh4WnpJRjZHUTdYVEZHekRleHY5OWsxbmpWWXdIc0tkRWV3d2NKNnZB?=
 =?utf-8?B?NGNkZnpvMXBxczkwbkpYbi9UcjBhcTNXVE5FV01yRTlES0QvOGVvQlU2cU5T?=
 =?utf-8?B?a1ZjMjdoVENKdVJmWFlQK3NSZFJVQ0xBYmNPREFHaVltb09ycXhLcWYvb0hj?=
 =?utf-8?B?THg2WTU2Skt4MENpeGZSOFIyWHdzMVhWYzU2cmg4TjlHOWdwVXFSZWhhOUMv?=
 =?utf-8?B?YzZSNys4MFlMRGJsMVRoWUJieWNlTGlrTU9mY08rcmFhRUUxaHFYNkNZbms5?=
 =?utf-8?B?eXlheVpSMzVEVFVnaDVFZHBOamNuV29xWGRpWlU2TGxYRWdNaXhiNEhRWDZF?=
 =?utf-8?B?NjVBb2hiQ1kvRk54RFB4RXJHY0F5QUpSQ3RyZngvTGdtSTZiQzRXS0NWRnAy?=
 =?utf-8?B?WHorbWlWYndSL1QvYkpDbmdCb1dlZExBV2ExZ1p0aUI1akozRFB0ZGFJaFlB?=
 =?utf-8?B?NjRZVzdkZmRGaHBmOVprZ1QrWUduZUppOEc3T2tJdEU1VGJaWm5UcTltUzBk?=
 =?utf-8?B?b0dtbDR1ampNMERrRVN1cVJnOHZDUllVUTlSSlFlM1lqU01WUTdyUXRTOTNO?=
 =?utf-8?B?d0JPRDZWUVRsUysyTnZ4T29MKzUydHptTWswRW5tUG1ZZHU0NWEzMi9uWStV?=
 =?utf-8?B?TGlRNXZnV2trNVpDVVl3bVVBU3p5TGpDSEhWTU15a3ZkMGZhWHhwYjY4TDRr?=
 =?utf-8?B?cndlS0xpbGRJb29JZUNZSktiaDUvZDdjZGZNYVZKSEZIamYyUndwUWR2NEw4?=
 =?utf-8?B?TkNDbG1NNVVOSGk0cTV1cnBLakF6UWVtTHBOVEllVWQ4Z1RjS0FBTXNpdGIv?=
 =?utf-8?B?WGgyb2o3cGJJaEo4bzZ0ZUhWdm5walhQSzFVWnROOWNDWm9tYllFUHFmQlNQ?=
 =?utf-8?B?Tk16RXV4UU9sR0tUY0V4NEpRL3lQaEdTWTVIa2pObWQ1cnlTRGovcFg4cmx2?=
 =?utf-8?B?NUVKM3RrUG0vSlJLU1JmUzdCSENRZmlCL3JhbzBiTnQvbUExckZnSDhnSmgr?=
 =?utf-8?B?b1pkZVZwcjdaU2lEeEptb3ZPZ29UWkFhdnhOdW9hdkdodU5adVdEaVowbENl?=
 =?utf-8?B?M1lsZ3V0RTRTL0tRTGw3L3p0YnpnQTcyc2F6dlBldjFHWno3b0REcTJjZllj?=
 =?utf-8?B?NFJxY3ZEWEtRQXBTQWVTTmpqK2JlMlk3TXpJeGVxWUMvV0sxcEJGcmxJU0wz?=
 =?utf-8?B?NE1rYWkyc0pQRHRrbXE2SjJya1loMTJlbWt4TVUrbzNBanFpUkV0bGlXY2pP?=
 =?utf-8?B?dHhpZlNiUEQ2bno4UHE5L2JUYlJrYmNpVkFFazYwRGdna09SOTJjNFZtenlG?=
 =?utf-8?B?a0V3TG9icXJCaExHcVNMRFh1djJTeXlsaXMyRCtZY213TERtWmFQakRlRlRj?=
 =?utf-8?B?MkRYRWZSVzloTXg0M1JFbnVOQVVEcU5lRUVtdzlrdURRc3hsenZEYkNnM09j?=
 =?utf-8?B?SS95UzB0WVJFRXAwM1c3V3crOUNQVU1ha1NOS1V3aWtnR3VCZmkwUndSYXNl?=
 =?utf-8?B?cE1BRnp4ZktLVzlRY1VIeWJWcEkwOFJqVzRPZ0g1S3lPMzJHRURDN2ZSSnJs?=
 =?utf-8?B?TDBOT3VEQTFrK3c0Zk9ndzN6dmd4dEZZSDdWVCtNYlRtMHNhMTB6MC9aaUFi?=
 =?utf-8?Q?LKe9QUiPxE/+pLe2PNtDPRosY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b664b60d-df17-48ea-13b9-08ddb453037f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 01:44:39.3273 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3G+xrv5SJvRbGf6/mKOwj+8Gevcb+neQhG0eU42Pv+auYyAd8XmTWz/OKHO7xPjbvljbxDFqf7eI/F9BgcLhTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7840
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

Both patches look solid—nice work.
Reviewed-by: Vitaly Prosyak vitaly.prosyak@amd.com>

On 2025-06-24 04:05, Jesse.Zhang wrote:
> Add a new subtest "cs-sdma-with-IP-DMA-UMQ" to verify DMA command
> submission works correctly with UMQ (User Mode Queue) for write,
> constant fill, and copy operations.
>
> The test checks SDMA functionality when using UMQ by calling
> amdgpu_command_submission_sdma() with the UMQ flag set to true.
> The test will only run if the user queue capability is available
> for the DMA IP block.
>
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> ---
>  tests/amdgpu/amd_basic.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
> index 97a08a9a3..10af3271a 100644
> --- a/tests/amdgpu/amd_basic.c
> +++ b/tests/amdgpu/amd_basic.c
> @@ -116,7 +116,7 @@ static void amdgpu_command_submission_compute(amdgpu_device_handle device, bool
>  						     get_ip_block(device, AMDGPU_HW_IP_COMPUTE),
>  						     user_queue);
>  	/* nop test */
> -	amdgpu_command_submission_compute_nop(device, user_queue);
> +	amdgpu_command_submission_nop(device, AMDGPU_HW_IP_DMA, user_queue);
>  }
>  
>  /**
> @@ -136,6 +136,8 @@ static void amdgpu_command_submission_sdma(amdgpu_device_handle device, bool use
>  	amdgpu_command_submission_copy_linear_helper(device,
>  						     get_ip_block(device, AMDGPU_HW_IP_DMA),
>  						     user_queue);
> +	/* nop test */
> +	amdgpu_command_submission_nop(device, AMDGPU_HW_IP_DMA, user_queue);
>  }
>  
>  /**
> @@ -815,6 +817,14 @@ igt_main
>  			amdgpu_sync_dependency_test(device, true);
>  		}
>  	}
> +
> +	igt_describe("Check-DMA-CS-for-every-available-ring-works-for-write-const-fill-copy-operation");
> +	igt_subtest_with_dynamic("cs-sdma-with-IP-DMA-UMQ") {
> +		if (userq_arr_cap[AMD_IP_DMA]) {
> +			igt_dynamic_f("cs-sdma-with-umq")
> +			amdgpu_command_submission_sdma(device, true);
> +		}
> +	}
>  #endif
>  
>  	igt_fixture {
