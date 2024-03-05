Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70688C54E55
	for <igt-dev@archiver.kernel.org>; Tue,  5 Mar 2024 09:14:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C0E10E1B2;
	Tue,  5 Mar 2024 09:14:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NUxdcDmf";
	dkim-atps=neutral
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2072.outbound.protection.outlook.com [40.107.95.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E6F210E185
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Mar 2024 09:14:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nghbs5vzqOcIPaEQaLYIbCUeaU71iMEQKn3SZ7ABmR9TUWWfsKS4mwQuBwO+BDPncobkQQaZdWhzZKqg5Vwzd6HDDOViVj+UeNnuIfrmX+Ql6RCERY7FXYvIle/1EoX7gZHgWu+LrOfVnAUTtrYX7gEvPURtCtnY0yznmZg7zCZO8nXbN0K8vlgo+d6UWw2uOh0PneYVH/G7JyB6+yDoJiYTJ/fAaT0lWYwLJrCJoA86inqsrFg2VBHtb3G7Gp5/ZHLSMVZzYin2QkMn997kcx6eX9JwCGB3d2bWFy4WwvKWK7Xqa0PkIJ4gzuby2YR1zUxK6IsO8w7eP3r6aATMQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QBNEIlVI5qk5B3s6Qwf6ahyxOHbxQpcijTry70w4bEo=;
 b=dti4CkJoSS9t792PGYN2LaRaMAZr48aD4ZFZKQPmkR5WgXF+K4u/WzIi18imQYA9Y7chq89Yf6fKgpSfdpErKj3daPRZA8k/Rc7eiEBYMAqrs+W7D9iUTOpCSpbgYaYANr0Y3OEsorMBjzP3rxpdOfMIT9D0a76ULo7uikTbw87UqMeQUgrdUDofv9wzoFa6DUMuFaMuTIjndum9UfCWjTrwBgdvMOCTWB7VDPWNoaX1+8btoYl+oc+Evjdd0suL6yxli9AceKiwveEOfQh3qh4u3I6CRHMydTrtL9B5J2gcRNQX4za/rCCi/GJhuwmsTGzE3/egM+BjoEdxnWtiJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QBNEIlVI5qk5B3s6Qwf6ahyxOHbxQpcijTry70w4bEo=;
 b=NUxdcDmf5ee6Gb7Ea9OVv4lM5qQkLkwpe4RGNYbyII5NmnxWnSjDxuS4DFXEr3Qr+vA0Pcmqq/7hDsYTchsk8OF4icdCmZ0CJS3PCbmUxK+sLfdInkuNF55vmnGc7a8PDmp/WDyHesPMlE7jc+cLsH4FgPveam4Ef1fcxe9Nc8U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB9238.namprd12.prod.outlook.com (2603:10b6:a03:55d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Tue, 5 Mar
 2024 09:14:18 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7339.031; Tue, 5 Mar 2024
 09:14:18 +0000
Message-ID: <5d7b3d57-3b54-49eb-bfbd-67284e5322ba@amd.com>
Date: Tue, 5 Mar 2024 10:14:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] amdgpu/tests: Fix vce enc test failure
Content-Language: en-US
To: vitaly.prosyak@amd.com, igt-dev@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Michael Strawbridge <michael.strawbridge@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Petri Latvala <adrinael@adrinael.net>
References: <20240304211632.184249-1-vitaly.prosyak@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240304211632.184249-1-vitaly.prosyak@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0097.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB9238:EE_
X-MS-Office365-Filtering-Correlation-Id: 88d5f265-1b47-4743-515e-08dc3cf4a32a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1ifs4hqkftgCzcuuP5wdEjXD141IyOMjhKegcoICAn2gqLzE4YmYoLTKwNWZgMMvY1vb/ovPgq9ZwK7hKJ2P9JDurrv4rCjxZKYEgrucxHPDzOBFT2dfqatQvZPTKf4KRus8cbP6hT9cijHNjUrOA0qVikmGJJiTv0fTiN79FyKyz9rcUQMChJbHsTrVXszbJPfT6g9MtH14tMuJdftmF3sFPipj/KCKWNcnwbcFssgP/6WV/8rfAR0jX/ggDSkW4Y2MBp9kmmMxWgW9UT9ivEw858HnnUS3ghrwddsnRjsVka9NXgjX5EuYlO4myqSb5z7C4iBEKJKSGfGsQAgvi3h8svErKm4nOLFn3FArke0VqyVzFUBLB01kv+6xiM1SYPqbyYMbI96+bAPTZ1APvlooQJs/UYJMfr72t0p/cPHc8MYsZdJyOLeBGEHbfcTI0T7wacNz+ruUjxlgGxXvSMzHu8WV/cG5idrs8fFUiMbb7Es9WG5PD0Ba4IwQyKo2D07IpeeKZfB5nHFRe/N/XoUdAqxlok1aL6g223t1G3f6xpWpb2eu2Ny73nphhJfifQi10cgmpPPB4fwKo9nIu2r/T+wDIZNEl7Irt2ZmA4x/U8xU+MNNPgHw92NipID4pe6CDhMfhiPERB1cSAloIegtdO5E9FqQF7hgSvAmwiM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXNSYkVqY1ZqeTZ1WmQ4dTg5RG1TSmlIRHFub1E1akdydnYrVTZPNzBNb1l4?=
 =?utf-8?B?Z1pwS0RCUXR5N1I1TFR3WmhtVGoraGpqbDJsS0V6N01HUW1SRkU1L1p6Qnp1?=
 =?utf-8?B?TmZoVkt3UURjSUlYcUhCSmxLb1hXOE5WT1NmTy9sM0luTXljTXhsdms2blpM?=
 =?utf-8?B?MHhnQTBNL1VxV2M2ZnJRNi9JK1ZJcHVyNU96VmwyeFRnbjdCT3JMSDhuZ0VE?=
 =?utf-8?B?d1dEdjdWTmFlUitkZVQvM0pCZEljY2xCK3RQRzE3Q0dSdUQ0ZXFOeWtNS3hK?=
 =?utf-8?B?dGp4WnNjNzFCaWVNRTFLbW1Pa2l1WkhlM3JNNlUrSVQ4KzhxOWd5VkF3WFlL?=
 =?utf-8?B?T2g5S096VXgrcS8yQUpRQldaWWV3aHpxWUEwb3lxeXZHU2hRQVhTK0ZkRGtO?=
 =?utf-8?B?TDlyYWtDc1FLcFJiRHhEMm5TRjNCZzByMEVVYjUyQnBkYVlqU1djVFRUSTdt?=
 =?utf-8?B?SVU1eDBZejVIdCthdEJPaGV5VE0zbjNJVkUrUFZQSVdvOGFFYlBqWnZGaDhq?=
 =?utf-8?B?enVsZ0R5TEN6UnF6bXpQa25QMC9rVFI1UllGdE1MbmNORmJ1MEdtVTNNbUZI?=
 =?utf-8?B?dFVlbU14ZEcrZ09KdDIrZ29vZ081UVdBY3hxM0NHTzdOYllWYVAxQ2xjd29T?=
 =?utf-8?B?Y0xhSWhnaDlNalFWSkFKRmNnTnZabi8zSnZjTnlleW5heW56cmo4Zy9xMElM?=
 =?utf-8?B?UlFjbnFiLy9mUXlCdzMvby9qUTU1TCtmMm10eiszOGY2M0RFTDFINjlkV0RY?=
 =?utf-8?B?dWdiU3FpVTVQMkNkbm43Nk5TeFJmNzV1blUyenZicmVnQkpudTJSRjRwY1Qz?=
 =?utf-8?B?VXhqNXVER0w0WnFyOEJrcko0Uk56RlpXQjk0V01GakFRQnI4QTJBcENPL0dB?=
 =?utf-8?B?bmovWlFITWRhc0tlcDhHZC9pZUc2cm1kVHRxK1lQcEpmZGZEUHBhdjh3UFQ2?=
 =?utf-8?B?NEJhb0NLbHdLYnVxamtxSEpGaDVZL1BUTnRxZ1AyYnAvZEVKOTFNZ1JvY1g2?=
 =?utf-8?B?NHdDQ1FSYURiSHJOeEZUdDk5Y2trNGgrTUY5bFN5dUFBbElwZ3Fxc0paUGx4?=
 =?utf-8?B?U3h5a29nRUhBZVNuRmcrQUNvcDVlTGZRaFhXcWZUNnZpYzdZS2dyMlVJQTFp?=
 =?utf-8?B?aUhFWVExQlFkL0ZYcHRSd1FpWWd3Vy9OQ0x6M0FwcXF3Rmg3aDZBRWVlVGRS?=
 =?utf-8?B?b3R2S1lUYVhvWDBKR1h5bEpVclBVS2xYd2c1RFUzeE5NbjBCWWs4MFJhb0dJ?=
 =?utf-8?B?R3hmNWYzS2IvNnZXU0QxRUxJVVl5cUp1OWt2UFlsZmFqdlRoeFRzOXIybzdJ?=
 =?utf-8?B?b2hhR2RPSlI0b0c5TE0yTWV0aFB1TWw4RTF1OU1McCtmSDJMK2NlWkFiNkVL?=
 =?utf-8?B?MW9aUWxDTlhmaE9KZmpBNEd1dWQ3MFpaMU5kbk5mVk4yZ2FYQVBCR0FrT2dl?=
 =?utf-8?B?d2FpcGdoVlFmdGlXT3JrdzN0TFpvY0FoUjltVzN5amk1YzF0NG16RnNMcmRm?=
 =?utf-8?B?TTYxOTY2OFcvYm42NE5NZDlIMzRaUTBkRk9GdjNiWWozb0FyL01NVjRmVEM5?=
 =?utf-8?B?ZURsQXJXMmViUFNiZlFZb2hIWjQ4WUNiS3BwRC9QbUk4RjdhSk9PY0x1bmJl?=
 =?utf-8?B?TDcrWHg5K3hPVW1Bc0hpemg4TjB6dC83NTdaT3k0YlZPVGp6WjV4alVMdjVx?=
 =?utf-8?B?ZzdtczhESUtBZnBacXZCRjhmczJKMXdkTjFaYVMwL2xZUkZSaUJPRWlQSGtn?=
 =?utf-8?B?SHNycDZ1ZEVibm5xQWZpTjNNcnQwdGtHN240UkZ0MTgvSkdBMm9kYnhuU3hn?=
 =?utf-8?B?bmk3NXJQRTI5aEdlR2xhZm5rTU83ZFJCUzFmZzBHcHVwQXY1c1JyNFMrMGJy?=
 =?utf-8?B?ejIxMkIyZHBCemdiSUZqY1JUbUxZS1dqTnhOUDBlUXIrMm9HbktXOG51T1c4?=
 =?utf-8?B?Zkl0VVdWUmczM01tMUZCc2ZCS3JFTEJiUmpYMzE3bm9VZjhTVUwwZWRrbUVR?=
 =?utf-8?B?SnQ3M3U3bFRod0IwalE3RXpCRnQ2b0dZc01UdG05d2lxSDB0OFAzTUV0c1p6?=
 =?utf-8?B?dDdVZzZFWEtiVGtQRnIwaUViSWtrZzR6aUFoOVNVUlcrOE5lenZJN0R5bERZ?=
 =?utf-8?Q?yIfZZyNKQsrPLDYvt7U1RGC8D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88d5f265-1b47-4743-515e-08dc3cf4a32a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 09:14:18.8084 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uF7u94WHPeTn5oDC4bJKXrSU5OlQEmSDkLLSI65mluIjX1flBKYGlxol6QG80mc8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9238
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

Am 04.03.24 um 22:16 schrieb vitaly.prosyak@amd.com:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>
> Combine the following sub-tests: creation, encoding
> and destroy as a single sub-test for vce encoder.
> It is a similar change as commit 40ed74461d8a44657a0f4799ade86116722d3ea2.
>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Michael Strawbridge <michael.strawbridge@amd.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Petri Latvala <adrinael@adrinael.net>
> Signed-off-by: Michael Strawbridge <michael.strawbridge@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   tests/amdgpu/amd_vce_dec.c | 32 ++++++++++++++------------------
>   1 file changed, 14 insertions(+), 18 deletions(-)
>
> diff --git a/tests/amdgpu/amd_vce_dec.c b/tests/amdgpu/amd_vce_dec.c
> index 364534955..51902802c 100644
> --- a/tests/amdgpu/amd_vce_dec.c
> +++ b/tests/amdgpu/amd_vce_dec.c
> @@ -552,6 +552,17 @@ amdgpu_cs_vce_destroy(amdgpu_device_handle device_handle, struct mmd_context *co
>   	free_resource(&enc->fb[0]);
>   }
>   
> +static void
> +amdgpu_vce_enc_test(amdgpu_device_handle device, struct mmd_context *context,
> +		struct amdgpu_vce_encode *enc, bool is_mv_supported)
> +{
> +	amdgpu_cs_vce_create(device, enc, context, is_mv_supported);
> +	amdgpu_cs_vce_encode(device, context, enc, is_mv_supported);
> +	if (is_mv_supported)
> +		amdgpu_cs_vce_encode_mv(device, context, enc, is_mv_supported);
> +	amdgpu_cs_vce_destroy(device, &context, &enc);
> +}
> +
>   igt_main
>   {
>   	amdgpu_device_handle device;
> @@ -574,24 +585,9 @@ igt_main
>   		igt_skip_on(!is_vce_tests_enable(device, context.family_id, context.chip_id,
>   				context.chip_rev, &is_mv_supported));
>   	}
> -	igt_describe("Test whether vce enc is created");
> -	igt_subtest("amdgpu_cs_vce_create")
> -	amdgpu_cs_vce_create(device, &enc, &context, is_mv_supported);
> -
> -	igt_describe("Test whether vce enc encodes");
> -	igt_subtest("amdgpu_cs_vce_encode")
> -	amdgpu_cs_vce_encode(device, &context, &enc,  is_mv_supported);
> -
> -	if (is_mv_supported) {
> -		igt_describe("Test whether vce enc encodes mv");
> -		igt_subtest("amdgpu_cs_vce_encode_mv")
> -		amdgpu_cs_vce_encode_mv(device, &context, &enc, is_mv_supported);
> -	}
> -
> -	igt_describe("Test whether vce enc is destroyed");
> -	igt_subtest("amdgpu_cs_vce_destroy")
> -	amdgpu_cs_vce_destroy(device, &context, &enc);
> -
> +	igt_describe("Test vce enc is created, encode, destroy");
> +	igt_subtest("amdgpu_vce_encoder")
> +		amdgpu_vce_enc_test(device, &context, &enc, is_mv_supported);
>   
>   	igt_fixture {
>   		mmd_context_clean(device, &context);

