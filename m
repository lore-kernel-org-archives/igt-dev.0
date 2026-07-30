Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F270C55164
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jul 2026 15:34:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2A7610EFB8;
	Thu, 30 Jul 2026 15:34:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YvC2meRf";
	dkim-atps=neutral
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013017.outbound.protection.outlook.com
 [40.93.201.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFCEF10EFB8
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jul 2026 15:34:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fK27B2f3vLHXBuSmxTf/Te5iaY3DfL6t8IYPQs187RT1okpZQbm2tmBFSbGf7Wfy9ZE5m+Ue771/b2gJ5Ytc55wZmgvXz1KwzYmLAWET3s6XG3Nfly8+lNjcOFcA63D12aqdRfOHBSqy7imwJ7JvicJdAKihb6b7EZZqALGKYdA0/Kv15UpYWKFYP3kAn8x9OIiMg85sKv2/qjsLCVw3Wg+uzmgHtZlup4Ygyg17IrkBvXbd8EhM4b0CmWkBpDNVLWjxGddMQGF4LXQ0dNJmMhqpCUmb/qj6TVFmcJ4biFw34fkSIaKv1174/EzXGtmwkR+ZLENUe0ZbXfovlmqtUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c1u1+aTIlfW3J/8adkgAgtUVni0xQLobrde26MI1xjY=;
 b=NRXN91CAJtw3trOPrHcOlZZvxN0nKl+W90cbYW9xkQjhI/A1V7Mj/dDa6FYjzS/8cDSl4fv6xnKO7GaDZVpYvX9dMOJbVqIbFDsnYuR6SeB6M8bRvCNc2q0FMq45dGpM1+Y87YQyyShjT3XAGLK4IrRWKdQ4XA6iZkJcxfUFTJljY8i7rFrlLEHq+2MhMF2aB5WmtVo1Yh3k1FTdEfGuwu9d98lC42r6yiGa5JTyZqI/uUrwEfAHqw7ofxyY3g+d4v/8j2bvrHzvwW2OXd0NtXnY+N9skupP8queEigxTSpiWE7VIOeq4tfEDkIaxiVDreRDzkchdVeqzvpW00nqWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c1u1+aTIlfW3J/8adkgAgtUVni0xQLobrde26MI1xjY=;
 b=YvC2meRf5n+gFZoRHkc9kIoBn5t/0QjBQX2D2RC+s3M4KGOWtXdHB87i2zWZ4vA0rsEk9p4L9ZkkXoaBBIRWKgt1lFs5KT8gA2gHsKtx+MABtur12ioSqZvORAXYhC9XboFuKXMD6FocHMsOT7rcaUAp86d4RiwKhg9Wj4IuoHI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB7007.namprd12.prod.outlook.com (2603:10b6:a03:486::8)
 by BY5PR12MB4227.namprd12.prod.outlook.com (2603:10b6:a03:206::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Thu, 30 Jul
 2026 15:34:08 +0000
Received: from SJ0PR12MB7007.namprd12.prod.outlook.com
 ([fe80::6f95:c4a2:894d:9e8a]) by SJ0PR12MB7007.namprd12.prod.outlook.com
 ([fe80::6f95:c4a2:894d:9e8a%5]) with mapi id 15.21.0270.009; Thu, 30 Jul 2026
 15:34:07 +0000
Message-ID: <cd537d9a-4abe-490d-92ab-089b23753cd1@amd.com>
Date: Thu, 30 Jul 2026 11:34:01 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/12] lib/igt_kms: Add IGT_COLOROP_FIXED_MATRIX
 property
To: Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org
References: <20260623175737.171142-1-harry.wentland@amd.com>
 <20260623175737.171142-3-harry.wentland@amd.com>
 <e4dcc6bd-95ff-468c-9431-cbbcf0436ccc@amd.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <e4dcc6bd-95ff-468c-9431-cbbcf0436ccc@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0241.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:66::31) To SJ0PR12MB7007.namprd12.prod.outlook.com
 (2603:10b6:a03:486::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB7007:EE_|BY5PR12MB4227:EE_
X-MS-Office365-Filtering-Correlation-Id: ba4d415f-b828-4af7-cc5c-08deee4ffe3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|11063799006|56012099006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: fWitltmwFMdWutC5M2BJzLjLt6InNzeS/xLrxTHdDqJxOgx9XKOIDz6Kch+MQ19Pvw1N2637I31YIv4a4/YRRXiljTwi5Xk0qAsS5sbmMRYiWEfU1uzbu33eHuDdCBP+J0fnuN54IqfJ6Ec0rmhVW43qhq9eEyIZymV88SryKvCVu+nuwj8WR2/OUbx5D7qLSt3GWTZnZp4uyjHPwC4RgKbNWjMdSrj5KxeZjMe4H7dk7WqoPlycnNnsaSuAyNPxjVVQu6l0btjo2o4V8M5BerwM/pWUDjOd6CMSjxm3dystOv4kWNgaj3Ajxj3RptXMIQLZ6f3bxS6bXA1lofAna6R4luzhS473bUoLPXmdy/fuwZAza+0J9e6WzhN9VFdoc5Ad0UMRcEROxjGTSOTLPqKD09eLWBwpm/Jp95tbHgwE9wOiyHvLum2vgUw+ZAGI/7/2oIzljqk27FTiZih+hLzpr7obDxiMXn14csfzQKJBgj8xJab+2UG4Q9TvNjdqqMKIH07WCwGlyVMSGU47Yi5nYWkdapzuPy1f+ptMjjFLmyPJyY3WTBmRY6t6DUQ2kPze8tCr2x01imqZX69n3UWITxY3HURVoc5vaqARHpL/7Ri8QNSZqXBr/1V3RAi33RWRQYLkLWTLwcmoPcKBOf5Gbe02bCkHxcZekAF3y4Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB7007.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(11063799006)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWtKRFlNMm42Y3BNR1dyQmp0T0grdjFJUDlTa2oyQjFCeTIxbjdvS1ZLcWhj?=
 =?utf-8?B?WkhpRXVoZWxveHVyZGd2dHVVZisycjRFY29HUlo4Q1AzcEE1SVlFMmxVK2NZ?=
 =?utf-8?B?bnJUWVVnbDlMVVJJK1pyL2J4RlpBQk1pWDRrblpkVnIrYzBzd0RqM05ralY3?=
 =?utf-8?B?akxFWE5FWmVHSm5nSWNzeU4vSXJZbC9xVlROcU5STVNLSnhJdDYyV3B5T3VL?=
 =?utf-8?B?cGJaOVVqUkovS0ZCdlhQNWhDeE1RRlJ1UFkxM2ZjUWlvekYxZUVvRG12d3pQ?=
 =?utf-8?B?OWcvQXVhNXBzSEhqNUd3SVc4OFp3ZGd3M3FCNlRQSDI4OTg2cmFvV3orTTVr?=
 =?utf-8?B?dWRrck5VOTN2QTJVTkNrWGhSL1dZL2NmcHpHb1VwMzZOWjlEZnNOYVNXaktr?=
 =?utf-8?B?OHlXMG9TZm1TOEY3YnNncnlFLzhJaWxNajF4ODRXUnpMVUtxOExIVmhEa1dz?=
 =?utf-8?B?MzQ4Z0pBMHNRNzMwSmdFYTZhVWxxeU5FajdHL1lWdmNPWWV2aU9QOEk3VGdW?=
 =?utf-8?B?alBCbERXdE1yT2lTbzJDVlAzK29pdkNzOHFjZFVyWEtjajRsd1EzNVViTiti?=
 =?utf-8?B?NldoQm1ZYWIvWGJvQzFKMW16d1ZNb3o5VW8xemY5dlNKcUFGYm05aThMOExk?=
 =?utf-8?B?SlRkRjNIb0RyMDNnY1piTm1aMW50SGZ5QTBxNnN0UHNldkI3dDRWT0lwNWdH?=
 =?utf-8?B?cWN4Um5hQU9DMFhKbFBZVDFFbDAyd3puajc0VWhKazg3WDNKb3NBVEljNnlM?=
 =?utf-8?B?cUVuS0Y2UWQ5emYxcE05eTZZT3MvcmZRbzJPRkxTLzFnSEliRk9NQ3VYU2h0?=
 =?utf-8?B?VURoVVczRDRQOG1wOFZPaTFCSVNERWpMMldMbUVzd2V2UnRCMlQ3alA0d0pO?=
 =?utf-8?B?VjdyNDlnTy9DUm5iRERGazFDbi9oL21sM1Q1Tm13b2o3a2FaK2w0OGVMOE52?=
 =?utf-8?B?Qzl2aVg2WVhQcTlQMko3Y241by94Zm16UXlwT0labjU1aXZDQjR3clEvcStq?=
 =?utf-8?B?RXJ4ZWhjV2xqYTRpTTRRLzRIOWNsWUlkL1dVSUxsRnVEeENkS0pvZFY4WUdM?=
 =?utf-8?B?Y0laa2Q0K3ZxVW5KUTlwbHE5MlJYVzdyV2M3YU02YVJOS1duWXhRalp1cGtK?=
 =?utf-8?B?T1FsN3dLNVczeCt0VTE0MU5TdUt3M1JiWTZ4MisxYno0eTlaV21NN1pRZFdH?=
 =?utf-8?B?VExRZUorWG4zditNRDhVZ0d5OEY0ODE0Y0lRVEZYMlNoUXhQaytkblgwcXky?=
 =?utf-8?B?M3RYTmVybWhjYzVLbUE0c0FMZ2tRemtVNURtME9aY3FjdXM0MytTVE8rVm5W?=
 =?utf-8?B?NERjMXB4aXBFMEh3L0l3MXNQTHNCS01RaExCMEhHVGdsWVkvUFpSR0cxOExa?=
 =?utf-8?B?Q0UzYmZha3AwRi95U1lpV0o4ZGtWZ3RRcWZnSjR5N0xGUXhybnZ2YzBPSERm?=
 =?utf-8?B?SkhRMDMybHIwTm85M2swN3dHUGwvTWdPc3BuYkVwN2tsNktKZUhMek0yUE9s?=
 =?utf-8?B?aXNuWUJoUjlNUkx0NStnZFFQQU1hZEJWMFlKbE5tNy8zRWVyRTJMd1BHVVo1?=
 =?utf-8?B?Zm5FcmRCeWlxRWxYRk5Jc2tQMEVzNjVaNUxEUHY5blNGdWcwUGFiWGwxMmd6?=
 =?utf-8?B?MmtBRy96WGlVMzBucWVwWGZOQ2I2OVVXdEZ3ajEvazcxRmRXTGRQeVhZemZs?=
 =?utf-8?B?dVFhRlJDWVVZelRoNmJoUVdOQTJ4c2gyT3Z6emYrR0ZyWWFzUWVlekgvVGxY?=
 =?utf-8?B?YVFsbjNkMG5nbEx1SEFwNVNFZG9zWUZZd0MxUmVOZWwxZmZ5dWRJc1kvTExH?=
 =?utf-8?B?YitkaGdJZzdLd29tWkZaKytwOVFVVUl1ay9jODJ4Sm9yTWVtakFJZGQyUUw1?=
 =?utf-8?B?dGYvK2pQWW1COUJQOTQ2a3NQY29Ed2RVa0dIa0lDaUIyKzIxdzJWeVdOM29P?=
 =?utf-8?B?ZUdxOVNDUVlxVEhsU2NvajRWUzNTUnAyMXRIMVdNdnV6bUJidTFmM3dldkpk?=
 =?utf-8?B?MFpQYXY3ZlNTWHo0Qm5ONXJjd1hQQjVKdDFJL2VQbGc4ZHFOT09hd1ZNTWhV?=
 =?utf-8?B?ZWlQVUkxTjFYYnRSWEs1OVY5UDdYVnN4Um1JU0ZpTDF6T3hOQkQ1ZTEzS2d5?=
 =?utf-8?B?dVEzYWJqNWJDcXFvWjlPVTRmRVM4Wk5SZDlkQzVLNWJUNzY3WTlQMGxFTzZ1?=
 =?utf-8?B?dXhmOGJBLzV1a0xxNmx3TkhhS29MMU8vczgvSDBzYXVGOHdacnNVamp4WVVB?=
 =?utf-8?B?TDRIRUovbU5pVkFxazJhbC9lZGpyTVF5QnAxR2NsOHdHU2RrYjFmT2FpZFJk?=
 =?utf-8?B?ME1ralMyRkcvQktvcEczMkxBOEFYakRzbzh6cXczcHZOVE12eFRvdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba4d415f-b828-4af7-cc5c-08deee4ffe3b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB7007.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 15:34:07.0580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CDxGqJAm/AtXLqCEzLPET7cPtRrWbl/msR/4U4XewnwcVv8Fzrc31xjqVJGyrskEH62pkZFEOWVjRY6ZxV836g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4227
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



On 2026-07-25 02:56, Alex Hung wrote:
> 
> 
> On 6/23/26 11:57, Harry Wentland wrote:
>> Add support for the Fixed Matrix colorop property:
>> - Add IGT_COLOROP_FIXED_MATRIX property to the colorop property enum
>>    and names array in igt_kms
>>
>> Assisted-by: Claude:claude-opus-4-6
>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>> ---
>>   lib/igt_kms.c | 1 +
>>   lib/igt_kms.h | 1 +
>>   2 files changed, 2 insertions(+)
>>
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> index e82d32130666..9003b2b9e670 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -725,6 +725,7 @@ const char * const igt_colorop_prop_names[IGT_NUM_COLOROP_PROPS] = {
>>       [IGT_COLOROP_MULTIPLIER] = "MULTIPLIER",
>>       [IGT_COLOROP_LUT3D_INTERPOLATION] = "LUT3D_INTERPOLATION",
>>       [IGT_COLOROP_NEXT] = "NEXT",
>> +    [IGT_COLOROP_FIXED_MATRIX] = "FIXED_MATRIX_TYPE",
> Should we move IGT_COLOROP_FIXED_MATRIX before NEXT?
>>   };
>>     const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
>> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
>> index 3df3ba86630e..1be58288e119 100644
>> --- a/lib/igt_kms.h
>> +++ b/lib/igt_kms.h
>> @@ -363,6 +363,7 @@ enum igt_atomic_colorop_properties {
>>       IGT_COLOROP_MULTIPLIER,
>>       IGT_COLOROP_LUT3D_INTERPOLATION,
>>       IGT_COLOROP_NEXT,
>> +    IGT_COLOROP_FIXED_MATRIX,
> Should we move IGT_COLOROP_FIXED_MATRIX before NEXT?

I would prefer not to re-order existing enum values and
simply append new ones. I see no good reason why _NEXT
should be the last entry of the enum.

Harry

>>       IGT_NUM_COLOROP_PROPS
>>   };
>>   
> 

