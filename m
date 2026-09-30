Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D51CA5FC7
	for <igt-dev@archiver.kernel.org>; Wed, 30 Sep 2026 15:45:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 471E410F11A;
	Wed, 30 Sep 2026 15:45:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="sJ6wjUq6";
	dkim-atps=neutral
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012040.outbound.protection.outlook.com [52.101.53.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F15A910E5D9
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Sep 2026 15:44:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mRKGhUhKasqKiLjroLNLCoQxavnLGbdxZJfSijSf4oen9CitBNKPVXvmhSxIPB4+ANibq1yndGTXFcayGmanXAMiAvUjDMX0FeJXfqYhwIZKCsi7+DP2QBDUOp1aveE1iUiQN36L99xM46Lu8q3ksD2RLU4cL8Y3gIWG7E9/lr6ww4fx1Er0fVf5kY4oiRqzkbI6nSLKvZ34BsihdYdwaaOuAwe4/Hpf1tgKvwnw8Ioxpdq3hzAL8hoqE8iCskKJAUV8xf4JDoi4RJeuqrqB9Y/1h/xDq/hOHNnqDGKCfEi0X5WDkly2ReLxQiBfiz64NrIIDypo+wrY/Cxd/AKagw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SovW2kYi9rkaV2XPnlWpXRHn3iai+96l3FyBRgbu83U=;
 b=sKK8yYYsTtqtQsgW5i+aEWtj6xjUbtvHNpiRMvo2mbtzu7UYzyk9L8WcXXsFKGU9LxiWNOxD1o4yxnK0+XzGjBelArgZZDmmhdQVgIy7DoAU45jClGUas6wQ0LDgGpnqDU4R4WDd932dJr/6BqHdvp3mietUVnnRbw8POeZVqdecCwQ+wSt/G+V+QCNHXiS3dUCTMSRJHJ21czVR1+qJUfAAikFu6u9oOmWjgsm3gCMq7PFF+2FMspyNQLWZv8GJKJoJ8tz/4JYawAIrB6jsnZrywb4rraNiIiBJtd2BVr2d4HhtNUyEH9O/PUqimYt/8io3/eqaeuc/kAzqmUPfAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SovW2kYi9rkaV2XPnlWpXRHn3iai+96l3FyBRgbu83U=;
 b=sJ6wjUq6JrB/La2aeD6xI8YlfBL4l1qB3eUyuNm17meOj2JSCr8ENsxYNCGrM3zpApbosWUeWDOislT9OadzuHXnjQOL+vmz7zuiV3eBcU2d20PP9iJ+ziPLFrJqB7o0vNwymiafDYNa5sRFBhJmwUJWHMSXdm0Ce5XNI5zyHZw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB7007.namprd12.prod.outlook.com (2603:10b6:a03:486::8)
 by MN2PR12MB4287.namprd12.prod.outlook.com (2603:10b6:208:1dd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.16; Wed, 30 Sep
 2026 15:44:43 +0000
Received: from SJ0PR12MB7007.namprd12.prod.outlook.com
 ([fe80::6f95:c4a2:894d:9e8a]) by SJ0PR12MB7007.namprd12.prod.outlook.com
 ([fe80::6f95:c4a2:894d:9e8a%3]) with mapi id 15.21.0451.022; Wed, 30 Sep 2026
 15:44:43 +0000
Message-ID: <bdd8a4e6-11d5-47df-b0ad-408bd20f9e32@amd.com>
Date: Wed, 30 Sep 2026 11:44:35 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 6/8] tests/kms_properties: check colorop
 properties on active color pipelines
To: Melissa Wen <mwen@igalia.com>, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org, kernel-dev@igalia.com,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Alex Hung <alex.hung@amd.com>, Swati Sharma <swati2.sharma@intel.com>,
 John Harrison <John.Harrison@Igalia.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, Simon Ser <contact@emersion.fr>,
 Xaver Hugl <xaver.hugl@kde.org>, Uma Shankar <uma.shankar@intel.com>
References: <20260902180016.303482-1-mwen@igalia.com>
 <20260902180016.303482-7-mwen@igalia.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20260902180016.303482-7-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0082.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::15) To SJ0PR12MB7007.namprd12.prod.outlook.com
 (2603:10b6:a03:486::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB7007:EE_|MN2PR12MB4287:EE_
X-MS-Office365-Filtering-Correlation-Id: 60b26ba3-d7d9-4058-35a5-08df1f09be96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|7416014|376014|366016|11063799006|56012099006|3023799007|10067099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: XxKqPvrg8fFS9EDNfT7c4DwWc9YYHVdNNotvWU+A2vX7Cu3HXurufVuC6s2GgqAZsK6jYpUNd+z3iTMLAiSa5s8mMVjDEVTP06hGrXGlPqGUBIyC+dChHKvMe5B5dcueJ0TwrrO3ZDyfFfpNxw9d8In2nllgpqeXsjAqxCc/kfHc7M7FULyacEzacZuYBHiloihyRmqXSpKE0Z0iZoFDAZpKrXSfuBU+5dIHsTVjumPDgJEdBZz9YOOKY1Faoy3ORLQqwgMrhzR/OsssK31/uFPmuwTwkaMRxTJlnpUxg1TA3fvyno+lWp4IoTtgJ20xb0zOkvoVTxRWoajOmBidAWCexsVAvzoLNvuSC+IpjHG8VovgI3/1HRHD5tsOzwNPuEM5S6Nt3gDZLazTVtJ6FhbWpepF4FsRmRhLCrssk1fJ9xh79d2cldpbc6DwX8myEbp9HIt4HfuXkSs4180K86K4bebYwZBhHxJs36wcH7qTOAF7MQYdiP2QuEwOTvlCiSJNhwFc/IrMod+4poGYy/3Vxd8UHru54vdpNJVY0luKYSumI2xIVoPO7qaD+yP5NcGYk2nPjiK5GL3IdKd4wj1uajKF4U2xpN7WUUzm22QSRAdbY5u9N9wIbKsBZxGcyNeve0y4VbgROIcwAGwKA1fuZ320P1lCrTbH9H8/35w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB7007.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(366016)(11063799006)(56012099006)(3023799007)(10067099003)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWh4b1hYOFpUTUc4OVNjSzdxcEExVHJncEl6ZTVrYVpJdGNKTTJHRXlGV3Nj?=
 =?utf-8?B?OVlCVnc5ZEUxYzUrN3VPMzkyMEM2V05OelE0ZUhhM01GamttM3NzN0NnMGpk?=
 =?utf-8?B?MlJENWhEUGhlbllNdEZob1dGdzRxSit4U0VOaVlGbUEzYzhXMDlHSy84ZVdk?=
 =?utf-8?B?S3VVc0tkZ2M0bkIxK3EvWTZDL0ljSnpMWHJjNE9wVnUyNDN4SkEzWmlRSDQ2?=
 =?utf-8?B?a1pueWNPU2gvOEY3TTNGNm0reVl1cWdhQUdRRHhIdmM3ZEFLMi9VZEpDbjAy?=
 =?utf-8?B?YWZ3WFBVbUg3ckNUN05sS1FPbEJUQ3hJVGVNRXp1WUd5bkpUVnZXL3JITTl4?=
 =?utf-8?B?bklpVmtYMS9nRUdYaVc1OXhrMVhNZnN6N3IrZXM0TUErZU1sTzNNS2dCNGRi?=
 =?utf-8?B?b3RDdFVYaE4xY3RuWWVaMjl6ejdZeVhtVVkzRTg2ZkdyTklPYWUrR0ZNMnRq?=
 =?utf-8?B?d3k5cms1cWlobHIxMkV5UVJUVEdmNm5lVE91MFc2akJld1JZQWxqQmtyUjNv?=
 =?utf-8?B?eS82d0NvMXBwNUpOVS9hcURZb1FnemtGNjhmSDJySlpnMTkrNE85R1JWSVpm?=
 =?utf-8?B?aVJMM2xzeGUzd0REeThOS1pkdmdvOFVVdEF5enpwSDB2MVBVQnFQUW1CdWJ4?=
 =?utf-8?B?MGxuRGhWandtOXNGbjAza3pOcTI2OVVkQXM1a1FCVnBaZkVCWUhoaXNpL21T?=
 =?utf-8?B?VzJxNzYwaE83REVOc2pMNzI1TlZLTmh3ek5MN2oxQTBvSUZlU29HUFNFNlVV?=
 =?utf-8?B?c0U1YjA1ZTFJNmsvSjFXWkFvUWRqS3pVcG5TbHBHai9IODRDeW95N0JHbkl3?=
 =?utf-8?B?Tm9XcUxVTmxacWp0Y1BHSDAxMEJ2YkMwZXlBWG1tZmJvR1RZUG9sdDJXY042?=
 =?utf-8?B?UWNZck4xTXVIQVJ0MWFaWUkyL2RSemdBeVd5MEd2ZTlVRDB5VW1qcHRnb2ZJ?=
 =?utf-8?B?dWc5YUp3RVh2bFdUNm1EQlpTamdMTUE0OFBuVGN1WDVSOVhNWUNTMlQzODBz?=
 =?utf-8?B?emhSY3RBbXdmb1RxMGRVbEc4VXZqQXpxN0VPN2pBSjZOUnpiS3NDMFFnUlFR?=
 =?utf-8?B?T2Noa0I0ZFFwWTJNUjNoK2h4S25HbVFybjdCVVFlK1NGVHd0Y092Um9lZG5t?=
 =?utf-8?B?RnNQK1J5NG91b3F0cnUzeC9TWDBFOEdBSTBHWEdNUFlvSkJVSHpVbFQ1MGhJ?=
 =?utf-8?B?ekNoSk44b0Vqa3hxMVRtQWxXVEtrZUl1UFhxWkNvNVBJaXBkU2k5b09aOEc5?=
 =?utf-8?B?SmMwc1BCd2k3bzRZWEE2cDdxdmZSdGhqK0F4QUNWd0VYU3JobmtHY3AyeFFz?=
 =?utf-8?B?NnJMekd5THorNkRZbWtrNmdsbGQwQkNlL281cmkyRlpTUkdZdG1Sb2hNNHRZ?=
 =?utf-8?B?aXNITmp1MHpBN3BSOWJ6cjVOUW4vZHRGZi9MTkdUdzZGSnNXVWNoUWkydkFm?=
 =?utf-8?B?T05kZTRZU3FzUXA5bTdKT0hFcjEyL3gwaFBBMSsrZzBwSmtEbmM1WUVLVERI?=
 =?utf-8?B?SHdUVjR1OFgvQUhHcERKZ0xvRDFlTEU5Um8yeHhmdFRmSjNqblE3OTMwVExZ?=
 =?utf-8?B?dTUvUmJicEU2RWRiSHhtOTB2SzBRQWM2bThsQ2VHcUgxd2J2S0xWRmhEUTV4?=
 =?utf-8?B?S00zQkVpbnhoZHd1dXhkMkZNV1VZSElDakdmSm5GUkd0aXlvRW9hY01USGVV?=
 =?utf-8?B?WVBPZlVMT3JsZEI3MVFka1QvSkFHdmRxYmNaeURtOXF1bER6TW1HZytlV1F0?=
 =?utf-8?B?V2owY2V1RXhQTDc0cVhaOHdJUE9vZ1JsRHM4RytKNHJtOEY2Q0t4NzlwZEZi?=
 =?utf-8?B?bkhLV3UwajUvMDZkNmFtU3ZEVnZmYVdhQlB3L2FJQlZWWTMvVDduejVsem1B?=
 =?utf-8?B?NDhtUUwxbkw1dUNZMXNXNkpqUzlBQS8yb1ZIVXNVOEo1ejNMeDhBbVliV2o2?=
 =?utf-8?B?M1BPbjdVNFVtZ3dVRTY2TTZhckZKMEVHRFBPSC9QaEVCSkVNVHI2aTlJZmNj?=
 =?utf-8?B?Qko1bDJLZ2ZQbDhXSVFNQUxCYjA1MFhhOENmRjVwV3hRZXdPU1ZoY3lOZXoy?=
 =?utf-8?B?OVdBSHRIakdYVXRjU3k1WUkzUWtWRkI1bVBGMlp3U2ZTdFNoZlFOYTZ2Uzhu?=
 =?utf-8?B?N2FKMEUvUmsraG0rNkhOTVQrWEV2bytHbHJnWmcxVy9zb0dMUExtMWRlTWdB?=
 =?utf-8?B?QWpveXdFMWttdDdRZ2UraG41VWFjN3VsNGVXSTdJbE5Kdm9KdlhEZjhPeUVL?=
 =?utf-8?B?Z2Jvemtwb1E0Z0Q1ZE1ySDQ1LzJTOXlBSGxyNUlzRnA5Qm5HRVVLOVM0WVpw?=
 =?utf-8?B?dWFYaStYd2lMTmRPRnUvNWgvVll2MDdxaU1McThIeXFJZlc2K0hidz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60b26ba3-d7d9-4058-35a5-08df1f09be96
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB7007.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 15:44:42.3906 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ltICntWtv/NDrldtFfNAYOXQ8/C3cPia+KQBlLup+gNRr8UvAtYVpt2P9RN9835dIsK0ZuNzVPGKxGJIKRJZlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4287
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

On 2026-09-02 13:58, Melissa Wen wrote:
> A colorop property can only be changed if its color pipeline is active,
> i.e. the colorop is in the chain of the color pipeline set in the plane
> COLOR_PIPELINE property. Set each color pipeline active before checking
> the properties of its colorops, and restore Bypass afterwards.
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
> 
> v2:
> - detach different changes from a single commit (Chaitanya)
> v3:
> - move hunk to the previous commit (Chaitanya)
> v5:
> - add missing commit of bypass color pipeline
> ---
>   tests/kms_properties.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/tests/kms_properties.c b/tests/kms_properties.c
> index c55a271da..76aadd162 100644
> --- a/tests/kms_properties.c
> +++ b/tests/kms_properties.c
> @@ -271,6 +271,9 @@ static void run_colorop_property_tests(igt_display_t *display,
>   		for (i = 0; i < plane->num_color_pipelines; ++i) {
>   			/* iterate over all colorops in pipeline*/
>   			colorop = plane->color_pipelines[i];
> +			igt_plane_set_color_pipeline(plane, colorop);
> +			igt_display_commit2(display, COMMIT_ATOMIC);
> +
>   			while (colorop) {
>   				igt_info("Testing colorop properties on %s.#%d.#%d-%s (output: %s)\n",
>   					  igt_crtc_name(crtc), plane->index,
> @@ -285,6 +288,9 @@ static void run_colorop_property_tests(igt_display_t *display,
>   			}
>   		}
>   
> +		igt_plane_set_color_pipeline(plane, NULL);
> +		igt_display_commit2(display, COMMIT_ATOMIC);
> +
>   		/* only the fb created above needs to go away here */
>   		if (plane->type != DRM_PLANE_TYPE_PRIMARY) {
>   			igt_plane_set_fb(plane, NULL);

