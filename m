Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F5C4C531F9
	for <igt-dev@archiver.kernel.org>; Sat, 25 Jul 2026 07:06:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCE5F10E0F4;
	Sat, 25 Jul 2026 07:06:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bUrQpqM5";
	dkim-atps=neutral
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010030.outbound.protection.outlook.com
 [40.93.198.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E8BE10E0F4
 for <igt-dev@lists.freedesktop.org>; Sat, 25 Jul 2026 07:05:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NvQkcC5rrR71WUmnDf/3HNoEgKJ/CCu0pDP9lCGP2JBgkBjJHM5sUmlnG66JroalLjSYebpgx3ZOjZjkYkc2hscMvZnUSnoQtqWFTmgWnEARpe2gsPy2yxbK5MCQjH1jeLU5IknebpcbDFvqmOJOCC967fNRvuXKJdy1Qk0eQMGhBB1NbvVM90qkbA7ltVUp0rJpnnwx+Bsr2b5jrUQfZvWUIKsna9LiuCSgy4UGNLY9/8NN73zR2IuqYdktkp2QMH2xiV0pgLqHGi/PKkdE3HgbjzhOFYzQrK0oymjjTlboCr/cWGrfQOWJlV/wbIuqniS3ifQTW0Unqppzll7GEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uHnGQQaj6S0ZIVza8C7WhGCxMv9pJA6Aa0X/7tWvV2A=;
 b=RsI63zbaPivEu5450SuYnoD+H6pjVTaMgLkIkvI47i1UCV7+y0RKfxZcHvnphmA0Mbj9y5nkKaEVTf9tRc1+g8YQJXBQuhOR3yNctwaJNvZPdrtS6+xep6gR/Vd+zQ/eTu1fC2C+ltPv3vuOBZ7z2Gdr9bAN+/xXKBgbw7kp34MFhEaWHy+KZ4APAvwzj5BVJRkdQ7fq7yU6WTKpXVSAbQ53BYczh80OJaQDjiDO4GaM00LvePvtRkL5GZItwjNv4Xw4F14pmpM6Iwo8IasQsz9rFfp0JHGKyr3YcV+YayCqoBqaUVjCNFCSmbKXySyVkCnJCryBAXFxGDWXFYuqtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uHnGQQaj6S0ZIVza8C7WhGCxMv9pJA6Aa0X/7tWvV2A=;
 b=bUrQpqM5YLPchG70AXi7qgSW+CX40Zx4RZmSLgt8tc83nOsnIq0uxskJ+iXdZioEYlY+82Ih79VhdG13r+GRBm5VMBgLlMeWWojQNvZyAPOcnvh6aDyzCRhR3466/hO/Qavm9RDjn6wW0GOb2bzdX0s5z4j5J3pekg6HE4Q6jJ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by DS2PR12MB9664.namprd12.prod.outlook.com (2603:10b6:8:27b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Sat, 25 Jul
 2026 07:05:27 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.21.0245.012; Sat, 25 Jul 2026
 07:05:26 +0000
Message-ID: <89545447-18bc-4afa-8727-2c129ce83e15@amd.com>
Date: Sat, 25 Jul 2026 01:05:25 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/12] lib/igt_color_encoding: Add XRGB2101010 format
 support
To: Harry Wentland <harry.wentland@amd.com>, igt-dev@lists.freedesktop.org
References: <20260623175737.171142-1-harry.wentland@amd.com>
 <20260623175737.171142-7-harry.wentland@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20260623175737.171142-7-harry.wentland@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR02CA0022.namprd02.prod.outlook.com
 (2603:10b6:303:16d::15) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|DS2PR12MB9664:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d7d2a22-824f-45a2-4178-08deea1b1ac7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|10067099003|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: cTcVzenHTVOPNppSuJsE4Pvui7KgCXRJu4D0HYzuT/jQekBdRo0r6R7is4KqObrSWzTcUjMC90Nx4RYGCkCBvF6gAC7Q5z8ecQ5IaKOFTViaE+atkPBR0fcYUO96h/7T0OKB8CnXpRRviYzQSmzHD7tKaMF2D0vVnw4X/86xMh0LxWAUhjZG7hkOhHnf+4QMjqXbSY9xBG2bttpCvy+tnwOatdpmRG1x6ZgOdirVHCCS+Kwdxpqj+q6dC+d5JSAUGqSp8DVScDB5auIEXPXDYV5IosSZaX1AFrxNr4KJ5aFR7lf1rX/pyEXZG33CZCDQQ2HXoFAgEYVaHszEKpHm1eCj4eX3X4IYDmyOd4fBH6PgZ+UMZDkg6CeePqtGzyWVq/CdqBsvBh1nT1CsJqwvX0T/OEqFquzoAax5sfkrf7fGLMdXVVD6sIElvzV05bK4+9mIguFGaJNn5VifIMyKq/HQxJ0ah7SpJQ0YIF3MruhPFjzqpOXSeuFojOSBk0pYH3G1BRuY8B5P8AuzvkVwsvCRUMel+KJCm3kSaVHMaQy+wtz6t9iWW2LHIbuvuzK8GDHJN9LqZeMmvcWMqOtYhQTR9uI7gyuZY8S/c5y4Yt6P8SuC0u3JGi2LgWki/M6xtKvqvYfMpE/g72PX+v8feG2dLAiKja/6T2LS1kKwQcg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10067099003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTJkbkJtZ1ZhWC9zMXA2ME9oOVUzUm05UjRTZGYrRWhRUGNsdGI5M2FlS1c1?=
 =?utf-8?B?WFpHNGl4WTczT0hSWVhCOEJHQ2sxdEwzbHpPWThTek5tR2Vlbk1zSWkzNjBo?=
 =?utf-8?B?U1A5cjEwZWRNMUtWMHNiNjd5bDd2amZqSHdtSnZDaGlVWkU2ZWVYVmMyenBY?=
 =?utf-8?B?aVhrbnV1eENsWUZlZkg1MlBPVkFCRE9zcWlpdlptaDRhNUtFczdqWWlZNmts?=
 =?utf-8?B?bVhNL0FHRk1xWXJQRERPTDVkS2FjNW1vTURUSUFPcEZPYjBSaXpvWTVZU0JZ?=
 =?utf-8?B?Qlhnc2xHMlV3TVAyekY3ZzlSVUNiQlc5Zml1R2VER2lwM1BrRlptd0tQRUhp?=
 =?utf-8?B?WjlCZXpRaTJqbkc2V2JNYW8xNTZob2pUeVNSNHR5VjNMVDFRaWZzOFhCQVFT?=
 =?utf-8?B?OHRkL3dqNXpQQTEwSUpxVVFiVDM1Z05mZVc2SUNOdm03dUJpV0o3RmE5QTFz?=
 =?utf-8?B?citTY1BYaWZ4SHJJaml4WEtkL3VOTVZBQ2tSaTBGTjFzVVNsN3VqYmRORkNN?=
 =?utf-8?B?R0Q0MTJwU05URk8zNkxydUJYalpCWCtBLzM0UzRVUThobHlnUFZRaGtGeEJL?=
 =?utf-8?B?dWRrMFZvTHhzVVRwaDlwMEo0dzQ2T1ZIV2h6NlkrZmRreUcwSHE5UDc2SUlU?=
 =?utf-8?B?Umd2cW1PcnNmUTZWWFJESHBucHNJRTNHc2JnYTFHUDRaSi92QURDcUpXM3Zk?=
 =?utf-8?B?bkFXMFZDZkQxTDd6a2NTSVlVdFRIbEllNFg1L25DeU05dWdZVW9qVHJlam15?=
 =?utf-8?B?dDdqSEI0STBMK2VLUHp0VnRtTHZaM0ZmOFNuakswaEx0dDExR2VNL1lJVWlv?=
 =?utf-8?B?clVVZ2JvTVFDRVdKZk1xa2NOTHNvRVRiQlFQWHlyb0VKZEM3ZXIyMmRNeUxa?=
 =?utf-8?B?VElFQW41STlock5hYlhMeEJhbmNsVndCSTc4Sk9VcXl0cnRkV2xweFhnNlY1?=
 =?utf-8?B?c0Z2MjFlYmFjZnVJL3JIWUZST1UyNlU4Yk1CQzU0dTVQK3dsbEsxQk5PcHFy?=
 =?utf-8?B?UGFjM3BWR2p2NlhSTHNZbGxCNzR4M292dGlVS2N1NzJBbWNtNnBKaWZrc21Y?=
 =?utf-8?B?Z0lKSDA4UlY1Y0VKV1E1TU1EWWYxMk1SS2lXRkNRZ0tMN0hPUVZWcHdnZTkz?=
 =?utf-8?B?OVJPbzVrRjZLejlmQi9xZXBhWFl4S1BpN2JnOU9KcHE2WDFMTE16Q25XT2xX?=
 =?utf-8?B?SjFkY2hzWEs0Q1hwVUYyYSs0N2lyT2xmT1J4QWdxdjI5TXo5RTRmemlBQ0Er?=
 =?utf-8?B?Q09RMkIyWEFNaXgrNEJLRlVobXFzQnlUU1ZmcjlFUTZQNlAzSXpWWTBmSDBI?=
 =?utf-8?B?VWJtQlUxMzFlWWpJSDNUV2NsVXFZUW40NEJGV1FlWnBsZWZuZUxiNEFrOHcw?=
 =?utf-8?B?bXBzWHZYUlRtaElacjh6ZEFiYlUxcXp6VndIYnEvdWtYUWxqUkVpbkJUZ3dC?=
 =?utf-8?B?UlZBQ0lXRXphQWphZXkzMzRJUkVBSGpJbG9rWTNSNjV5Z3VPTUsrbUJMYlJC?=
 =?utf-8?B?RlBpQ05TUVZiMjdFeU5hR0FqSDdHUXZ5SlAzVzI3SVVEMDdiem1heVFZUm45?=
 =?utf-8?B?U2dKT0pQSjB4bGRvbFdtK0daZ0E2cWs4VlNEMnEzbUpudGRBYVpTZTZhbS83?=
 =?utf-8?B?UjZQSFlFVUR1RmRvWEliY2pOQlg2Y0tiSlBUeDVhY2tJemF0TGNJRkY4YTJ2?=
 =?utf-8?B?YkdWM3lMV29CaEYvZVFpZmVZRGxqVSszTjNPdFFVSzV6bFRMcnJZL0drdGtZ?=
 =?utf-8?B?MGhvc3U3UDhmd1hUTHJlUUhvZkZEMnFvTmR3bDE5bDUyOHluOW01U1Fmc2gv?=
 =?utf-8?B?VFl2UEtZaGZnSUdKR2JCbzlyN3N0Qm5BM2xpY1IwSkFjblRvL0VPb2FwSTI1?=
 =?utf-8?B?RzZFc3BFbEhoa0MzYzR5VVJBSVZ0cCszZXZnSjZ2d2NoU1JNSlRtT1c5M1hQ?=
 =?utf-8?B?OTVQc0tJTUtWTU9KNGVicm1PZWNhMEZnMGM1M0c1RVVkWksyTjN1K0cxZW9D?=
 =?utf-8?B?QlpSVkNiSXdqQi9BcWVVYk9FaWNGV2M2R25LNjJIdGI3NDc4SUhDeUwxZmNo?=
 =?utf-8?B?SEl1MUl1K1pqM1FhczZNNitLaHVlKzBWZ3U2VVlMTDc1Y05LdnlXdVpJeUxp?=
 =?utf-8?B?ZC93T3ZmUFYvRG1td0ZaNmw3SmtyOUF0ZnJNTVJxeDBxcklRQUhDR3lRTVAz?=
 =?utf-8?B?a09WOEZXY0x4ZUNSWnA4YndncC9rUE1BSXdWWlJDZHBUWk9qMHJ4c0xDU1RC?=
 =?utf-8?B?ZnFuSkRTUFNlejE3aVovVmNVekIvMnNjbzRvakt5bVUwUCtSWjJhZHNsNWRU?=
 =?utf-8?Q?/mSB/gGToF5OQ//Y7n?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d7d2a22-824f-45a2-4178-08deea1b1ac7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2026 07:05:26.9046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FtxSs1o+Z+eAV/lGgOjfFC8Xb48rTaWQPHH0ugNVgGqr78EqkcWoTqcTX9C1+580tYhvab9g3+bsuKGEiDSR0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9664
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

On 6/23/26 11:57, Harry Wentland wrote:
> Add XRGB2101010 (10-bit RGB) to the color encoding format list. This
> enables proper color encoding handling for 10-bit RGB formats used in
> CSC testing scenarios.
> 
> Assisted-by: Claude:claude-sonnet-4-5
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>   lib/igt_color_encoding.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/lib/igt_color_encoding.c b/lib/igt_color_encoding.c
> index da56b2b10593..1d01c7eb0583 100644
> --- a/lib/igt_color_encoding.c
> +++ b/lib/igt_color_encoding.c
> @@ -135,6 +135,7 @@ static const struct color_encoding_format {
>   	float ofs_y, max_y, ofs_cbcr, mid_cbcr, max_cbcr;
>   } formats[] = {
>   	{ DRM_FORMAT_XRGB8888, 255.f, },
> +	{ DRM_FORMAT_XRGB2101010, 1023.f, },
>   	{ IGT_FORMAT_FLOAT, 1.f, },
>   	{ DRM_FORMAT_NV12, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
>   	{ DRM_FORMAT_NV16, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },

