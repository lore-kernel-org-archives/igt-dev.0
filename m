Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E83A4CD5BB1
	for <igt-dev@archiver.kernel.org>; Mon, 25 May 2026 18:38:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9415210E3B7;
	Mon, 25 May 2026 18:38:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EgosDeVK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8E0810E3B7
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 18:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779734294; x=1811270294;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tEx7Nyl2FNkUFSQqzxpE9zjKdqDaM9OFJmAin/y5bRU=;
 b=EgosDeVKDJ+KKPgJAWndkFxOjdTQydkdm3ZHyAeNcSDykwb//MEOcdLO
 EU3OK2A5IBoK6bM3M4l32hB6xUo1WbKEOQVx3VLfQ8VQiC0UsXLuz+aak
 9g1CkLjGDBXprTpErfnp1F3FkFS0X1Ek1ivRE44qQ+63WwxWIasi+M+DZ
 VCCWVAvnN5RQ41LfAPxDb8tjAAaKO2qgYZZsfTpwQv7ZkhA0JXldH0D9b
 f2ydYbqoiYIPNzC8lECX4Kz9D5REbbOD5j3uZxDTXwONNHl8nueVlb7W/
 c83brHT1i5oVkIhGN7mAs0lAZY3Y5Mh5OjviPEMT4X72u7ujoKLUown2B w==;
X-CSE-ConnectionGUID: Nk1VkTeFTeOzCcw3KlmDsQ==
X-CSE-MsgGUID: Tqyt9GWATkSHl5x4E/UUxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80460639"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="80460639"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 11:38:13 -0700
X-CSE-ConnectionGUID: ZSoxS4vYR/yV47KaUK0FZA==
X-CSE-MsgGUID: sp+XD+qBQ6GEd/XR9nFiGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="245959890"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 11:38:14 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 11:38:12 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 25 May 2026 11:38:12 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.33) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 11:38:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GmjGglwxIYZq1r6Xz8rLsTprxfHskeU5hzQqdPV/3G98xzjvRLigCDqF273x7dnSi6pePAJI3HQ2koXzx1FcTNTh89ZKo9JOl2ca4XItjk6gf19h2Y/byebbnXS6GxhXLd8dvo7ZJxtx8FVuKiUyeO6hxrZgna/Mfw7HtPzvAfeX4IRCxoBS8lEjhld9xUxLImSTD3kOXFOl8Wn4eo1Fb2NuQiH4Y5xOD2ffsEzh5nrYbJ5HqICCzVQ1vKeMzpvHg50Tp/XupS6SbkMcLnIHXXEuP/nMywNedisLY9WQXeU4cnDhUUOZaqMs9+p9YdH/tU2UZ2+FVZb5izw9R7R1mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7bHm98vviGQuYgsSAIWq8T7psJTCoztKIGYVfFokdhI=;
 b=Y94qBIgZctxRM4ND0jKwtgzO9G6rG4msJk47wVqapBOkghtjKf8pW3g/cm8ONJoT88UR7kAe2/u3nlYaVBc7Rl84T2z/xJnAnVmvC0QvRXz/KN5P4lbpL+DKn8Gmiu28d9d6oWZV+gHQSDAE72IOefX0krPEQrWWohZGwz3HcRh6iOWdhuIX8Wfl0dwaGI9DyN0bT3ukkxw3W3ptR2BCFHO39bgbSA38K9k1zr08rKqxemwr9ChSMhUN6Zxgl5CcC77FGpcXT2Ki5uGbCNFvVJ8m3qMRhCGY36CkZ0ahm69lRPHo5mFR16AaFzyTEF5beLirQ2Cbxzy4vBIduEXRSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by PH0PR11MB7659.namprd11.prod.outlook.com (2603:10b6:510:28e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Mon, 25 May
 2026 18:38:09 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%5]) with mapi id 15.21.0048.019; Mon, 25 May 2026
 18:38:08 +0000
Message-ID: <b300b836-7e9c-4376-8c59-5cb5c35d2bd6@intel.com>
Date: Tue, 26 May 2026 00:08:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/2] Revert "tests/kms_hdr: Move capability
 checks inside dynamic subtests"
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <sameer.lattannavar@intel.com>, Alex Hung
 <alex.hung@amd.com>
References: <20260525092621.668816-1-pranay.samala@intel.com>
 <20260525092621.668816-2-pranay.samala@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260525092621.668816-2-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0112.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::15) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|PH0PR11MB7659:EE_
X-MS-Office365-Filtering-Correlation-Id: 782dbaf6-d798-4a63-6122-08deba8cc40b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|56012099003|22082099003|4143699003|3023799007|11063799006;
X-Microsoft-Antispam-Message-Info: fCJ4KhAamFBN1xEuyYAqdbP1m7K/vpcqRdHyqzamNviYXOhMpuooEn6GLTAOow2s8tVuUKFWCQ2oqfFKgLVLPSp8JSZLjEbR2/oMXxCnPZgS3AR2937b5VZQOCl5WC+CkS1DwzIRRY1By3XX+p1elbdcCP6n2w4e5cqQeddt4ZqWV6qdncEKw/xd7o1xQwS545Of/6hrSL691uz8LisbnlvLxQ4tFqimphKbpkVdJPpERy2YSxDppFAnycLjRTlbvyggau50pRMT6Dx/IrHZJPH9H6PjOAAyMICTigzf5afEsxYMnPhEc5GfvWY/uY3/vOSvRbA2Gjn80cV7N8pX6NYdixOe7rbQx5p0efTR6mrZzS49VyzL0hqmJq+KespS/s1gw7OSlXNuuKbVPVLXo4ygFSvpMjOVLwyxxSyIYZO1E68SqDRA//5gMTFidQAI4LO65eyYZT9e+WHn5NUduVVqdOc9vqc+9oeNA90Mix9len/IJ6N1HLsBEXQSd3r9M3Q0Ea/SKKSNuKUcU1sxRZakBRN/AqsnmVGm2peqRL1zHr5mXpokDvIDYselrmrx5Sl8KhiBC+PDXObWhikyWT40GYs/VwWjcaamx/bI8hjIGeq0mpYbjdPN2xj84IeXkPfbFDP9naM9P+kYORvptQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003)(22082099003)(4143699003)(3023799007)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1p6Q3JQaGpBUVNwTmxNSXRqbTBvWFF5Mm1vWEd4aFUza01WMHNSckFSKzhJ?=
 =?utf-8?B?d1lnRHNYL1hUcHFOTU82Tkxpd0VrZm03WjhJbGtrelJBY1pPeFAxRDF6anVK?=
 =?utf-8?B?WktPMFZjNE5xbm9nM2ZFY05BVnZuUWZKbEw2ekl0bkN1OWhCRWJnVFZ6NWZm?=
 =?utf-8?B?SkZnL1ZQSExxWitpcEJkOHB3eHNuUHEyL081QngzVlFKTHZGSTZLZVRldC9R?=
 =?utf-8?B?clU1dnNtWllTNXhPOWlOakRKSlkyb1E5QWJUZy83MTViQ2EvOU4vTmhzcXRr?=
 =?utf-8?B?Y002eElpcGJvU0dZR3FhMm9BcW5EWGVsNWdsL3lMYmN0cTg0Rm5hSVFqeTBz?=
 =?utf-8?B?TFUyUEI0ajh6UmdINnNlUTZONVV4UWNpVitNbnhJM1V1dGdqUENWdnRVNXVn?=
 =?utf-8?B?TU45M1RJUnNtVkkwN1hDb3FvSWZKZ2swZ056UEtnT2pTYUNHU2V5MmlSQVNU?=
 =?utf-8?B?bWF2UlRudk1jR1h5cWNUS3loaVM2d1hqQVkwNXgzWjlvaXVvWmRXV0x1a2pZ?=
 =?utf-8?B?Y3FUbjBnUnBwa0xmOS85dU43VW14V3FZSHBweWl3TE0wVktKTEdJVVdlcGg2?=
 =?utf-8?B?bm9wMGJlSi9uZnVmaGdRTVRucTkvK1Z3a3RMSDhXMGU5SWJmdlEyRXowenVM?=
 =?utf-8?B?MkkvVG4xbGNQRHpCaURlN2FaTWRndUFhVTZjSVMrR2orMEFkMDdoQ1JqMDl4?=
 =?utf-8?B?cFAxb0VWeEhPN3djS1VZOGFjNkpsR3NFaVg2NTlIMzB5ZzM5QzBJMnBqeURZ?=
 =?utf-8?B?S2xwdi95MzFNbUxmQm5jVGlZbm9ZWmRSREpjZC90Vm1MQXEvK1RjU2VTeXNw?=
 =?utf-8?B?VkI4QXluRVI3OTgxcUdKL3hPeUd1MDNtY0trVzl3bGdkdUxZU2ZpVk4xWHlV?=
 =?utf-8?B?cHBkaWhJcXJnSjN6NS8vMHNnQ1hsS2psaVB1dFNjOGtFZm9UekRPbFR0UFY0?=
 =?utf-8?B?c2xoUm41RGhtUWRuTWxObHc1NHI3UnlvVzM4cmlYTEpTZDdKNnE4bjJsSGxo?=
 =?utf-8?B?N0NYRVl5K2dXOFh2RUxiUDluVC8rNkw5dEZ4V2ZsL2trY2grc280R3lNR01B?=
 =?utf-8?B?K0xSd2pqUkJGL1JSZ1Y0RVJKUGNnd3lDTWpHdlIvbmxXaG9OMTFUdDExdkxF?=
 =?utf-8?B?R2s4Q0FOYUlVTGlVZUpwenFWL3Vaa1JJZ2thd2RTZEhLL3hlSzA5aHVTdkZS?=
 =?utf-8?B?ZG5XNlJVcE9LcnlvVkEyd29HVnJVUVMzamNxQTQvNlRzTUNVRmV3UmZWYjZx?=
 =?utf-8?B?YXB6UFFpYkJxN1JMUVp1OU1qbUZmdExwc2V0NHRtRE5odkwwZjFKYXNINU1Z?=
 =?utf-8?B?cUhTeGRyMWRRYndMMS9tZ2pDMXhzUFJxUDVBU25Yak9vTTQ3blRGaFFKUFlo?=
 =?utf-8?B?bkl0b0haM0hNU1orWGl4cS96MTg4bTRPVXJBbDcrWGdrZ1VmUVp2dHF6KzlR?=
 =?utf-8?B?VDlmY0t4aUhKVElTUVovR0p0UFBQUnZMNmhtMnFKT05aRUlhVlJNc0NyMXBw?=
 =?utf-8?B?Qld3NENUUVFudEV5ZzZPU2dXYzg1bGpNT1ZHQUpQSmFKUjVydkZLeDFJcXp6?=
 =?utf-8?B?bUZBVE5UU0cvMnhZeldEc0ZJaVVvNHA0SDN2WFhCQ2pSVk9xbURmd2pjYUZB?=
 =?utf-8?B?VWZNWS9OWnlONFRrUlYvWVRlUCtxaGdoUlh0RGp1NWowbm0xRE0rUDFnQzlZ?=
 =?utf-8?B?KzN6YVZHdGZnZ3BGZFhXSWkyaU5LSWhSYnFNUDRNOXZFZGxteVBtSmVhZFNN?=
 =?utf-8?B?ZkNoV2wwZXRmdEVjNHMyTnAvcEZnV1kwYTQwWGtWNEcrVG11RlhkUmIwUytC?=
 =?utf-8?B?cEFZR1QwclQ5a0tXNHgvYm9zZGVYQk8wQnNLZEJjbTB0QjlyTDluY3FvZWs5?=
 =?utf-8?B?S2l3eDJPMmNGQVFYQURQaDY3bHZ5R2hybDFuYnkweGNNUklqVXBPRmlzNHR0?=
 =?utf-8?B?WHQ3UDJpRlZMVnY2b21wZWVQdzZZWVQ1b2lPZDRIZ0hwNG50UWVtc3lMa3R0?=
 =?utf-8?B?bEkzMTBINWFaK1Y5QU1TenRJd3ZiZllCZHp6Y2FqTWhvMEc4YlowMldDQUZv?=
 =?utf-8?B?K2lLY0paUmJQSy8zNWhia1NyL25LSlF0RjdTK0lySXArY0NEOXNKMVZrOTJP?=
 =?utf-8?B?cEp4TzlYTEN3Z3RNMEFZT3FOQzJDTENjbnVkWVZLSmx4VXNqMG9BY1JKOVJ1?=
 =?utf-8?B?YmwyV2NIVlAxZTVUYmZORVpwWjZhOWZuOFNzK1B2eHYwOERqYllGQ2tRVzEw?=
 =?utf-8?B?ZmczVzdHVGN3a0lZUWUxSVE5N3ZaOTNCZWlwSGlYaVUyV1FwQWtmTURwWlBm?=
 =?utf-8?B?YTBqekhHc05aNDFkZG4yN0p5cXphRWtGcU1pYkYzOWJud3hIWkhzUT09?=
X-Exchange-RoutingPolicyChecked: E7cIUBFjwReA3VGQ3hhmYx/AorlpWiLWa5c3lFZ0ZB4K5z853FUfawcCX3e4xja/6XizfoKRrQH/6z3dzoVH2ot7zkz+FfMXxafyMlWQDdE/Pj2wi5zm67w6gMZhsAYac+lXdsGQBiLsAYLBq5ItHp6DVHmp7/9vQx9vzgyN9F+iBBQO0IVBIa09Jmd5zXRJq3wm31LCIsX4FHXov5lsvxJhQDPk/NUerC6wsMqwRxDdlacPuEVsRHVG9lTA69mPSrdeae4R4xqO5F4RpFKoPaJjFISU8G1Fgzyq606jyxhiCPZDkA6Olz6sZyYzsv2NHT9umaCv+NPmACkMYDJuXw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 782dbaf6-d798-4a63-6122-08deba8cc40b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 18:38:08.1558 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cugH/CXdSkyik7pDKuDhv3N8uHy/MTm93efzPkph/sJYagI68TSSNVtJu6IlBaRcF/llG33VwjUDU66xsTMe0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7659
X-OriginatorOrg: intel.com
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

Hi Pranay

On 25-05-2026 02:56 pm, Pranay Samala wrote:
> This reverts commit d9667a6fd6468adcdb5542d741ac423339a20556.
>
> The previous change moved output capability checks inside dynamic
> subtests to avoid losing valid results when a later output failed a
> check. However, the real issue is in the helper behavior rather
> than the kms_hdr test flow itself.
>
> Move the checks back outside the dynamic subtests and restore the
> previous behavior. The issue will instead be handled at the
> helper/API level by updating igt_get_output_max_bpc() to return
> status, allowing callers to handle read/parse failures explicitly
> without changing the existing kms_hdr control flow.
>
> v2:
> - Update commit message (Karthik)
>
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   tests/kms_hdr.c | 170 +++++++++++++++++++++++++-----------------------
>   1 file changed, 88 insertions(+), 82 deletions(-)
>
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index affd38887..32d8dfe14 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -255,6 +255,17 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
>   	for_each_connected_output(display, output) {
>   		igt_crtc_t *crtc;
>   
> +		if (!has_max_bpc(output)) {
> +			igt_info("%s: Doesn't support IGT_CONNECTOR_MAX_BPC.\n",
> +				 igt_output_name(output));
> +			continue;
> +		}
> +
> +		if (igt_get_output_max_bpc(output) < 10) {
> +			igt_info("%s: Doesn't support 10 bpc.\n", igt_output_name(output));
> +			continue;
> +		}
> +
>   		for_each_crtc(display, crtc) {
>   			igt_output_set_crtc(output,
>   					    crtc);
> @@ -266,29 +277,25 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
>   			for (int i = 0; i < ARRAY_SIZE(hdr_test_formats); i++) {
>   				prepare_test(data, output, crtc);
>   
> +				if (is_intel_device(data->fd) &&
> +				    !igt_max_bpc_constraint(display, crtc, output, 10)) {
> +					igt_info("%s: No suitable mode found to use 10 bpc.\n",
> +						 igt_output_name(output));
> +
> +					test_fini(data);
> +					break;
> +				}
> +
>   				data->mode = igt_output_get_mode(output);
>   				data->w = data->mode->hdisplay;
>   				data->h = data->mode->vdisplay;
>   
>   				igt_dynamic_f("pipe-%s-%s-%s",
>   					      igt_crtc_name(crtc), output->name,
> -					      igt_format_str(hdr_test_formats[i])) {
> -					igt_require_f(has_max_bpc(output),
> -						      "%s: Doesn't support IGT_CONNECTOR_MAX_BPC.\n",
> -						      igt_output_name(output));
> -
> -					igt_require_f(igt_get_output_max_bpc(output) >= 10,
> -						      "%s: Doesn't support 10 bpc.\n",
> -						      igt_output_name(output));
> -
> -					igt_require_f(!is_intel_device(data->fd) ||
> -						      igt_max_bpc_constraint(display, crtc, output, 10),
> -						      "%s: No suitable mode found to use 10 bpc.\n",
> -						      igt_output_name(output));
> -
> +					      igt_format_str(hdr_test_formats[i]))
>   					test_bpc_switch_on_output(data, crtc, output,
> -								  hdr_test_formats[i], flags);
> -				}
> +								  hdr_test_formats[i],
> +								  flags);
>   
>   				test_fini(data);
>   			}
> @@ -530,6 +537,40 @@ static void test_hdr(data_t *data, uint32_t flags)
>   	for_each_connected_output(display, output) {
>   		igt_crtc_t *crtc;
>   
> +		/* To test HDR, 10 bpc is required, so we need to
> +		 * set MAX_BPC property to 10bpc prior to setting
> +		 * HDR metadata property. Therefore, checking.
> +		 */
> +		if (!has_max_bpc(output) || !igt_output_supports_hdr(output)) {
> +			igt_info("%s: Doesn't support IGT_CONNECTOR_MAX_BPC or IGT_CONNECTOR_HDR_OUTPUT_METADATA.\n",
> +				 igt_output_name(output));
> +			continue;
> +		}
> +
> +		/* For negative test, panel should be non-hdr. */
> +		if ((flags & TEST_INVALID_HDR) && igt_is_panel_hdr(data->fd, output)) {
> +			igt_info("%s: Can't run negative test on HDR panel.\n",
> +				 igt_output_name(output));
> +			continue;
> +		}
> +
> +		if ((flags & ~TEST_INVALID_HDR) && !igt_is_panel_hdr(data->fd, output)) {
> +			igt_info("%s: Can't run HDR tests on non-HDR panel.\n",
> +				 igt_output_name(output));
> +			continue;
> +		}
> +
> +		if (igt_get_output_max_bpc(output) < 10) {
> +			igt_info("%s: Doesn't support 10 bpc.\n", igt_output_name(output));
> +			continue;
> +		}
> +
> +		if ((flags & TEST_BRIGHTNESS) && !output_is_internal_panel(output)) {
> +			igt_info("%s: Can't run brightness test on non-internal panel.\n",
> +				 igt_output_name(output));
> +			continue;
> +		}
> +
>   		for_each_crtc(display, crtc) {
>   			igt_output_set_crtc(output, crtc);
>   			if (!intel_pipe_output_combo_valid(display)) {
> @@ -541,77 +582,42 @@ static void test_hdr(data_t *data, uint32_t flags)
>   				prepare_test(data, output,
>   					     crtc);
>   
> +				/* Signal HDR requirement via metadata */

There has been recent changes here (already merged), please fix this.

https://patchwork.freedesktop.org/series/166879/

> +				igt_hdr_fill_st2084(&hdr);
> +				igt_hdr_set_metadata(data->output, &hdr);
> +				if (igt_display_try_commit2(display, display->is_atomic ?
> +							    COMMIT_ATOMIC : COMMIT_LEGACY)) {
> +					igt_info("%s: Couldn't set HDR metadata\n",
> +						 igt_output_name(output));
> +					test_fini(data);
> +					break;
> +				}
> +
> +				if (is_intel_device(data->fd) &&
> +				    !igt_max_bpc_constraint(display, crtc, output, 10)) {
> +					igt_info("%s: No suitable mode found to use 10 bpc.\n",
> +						 igt_output_name(output));
> +
> +					test_fini(data);
> +					break;
> +				}
> +
> +				if (igt_is_dsc_enabled(data->fd, output->name))
> +					flags |= TEST_NEEDS_DSC;
> +				else
> +					flags &= ~TEST_NEEDS_DSC;
> +
> +				igt_hdr_set_metadata(data->output, NULL);
> +				igt_display_commit2(display, display->is_atomic ?
> +						    COMMIT_ATOMIC : COMMIT_LEGACY);
> +
>   				data->mode = igt_output_get_mode(output);
>   				data->w = data->mode->hdisplay;
>   				data->h = data->mode->vdisplay;
>   
> -				igt_dynamic_f("pipe-%s-%s-%s", igt_crtc_name(crtc), output->name,
> +				igt_dynamic_f("pipe-%s-%s-%s",
> +					      igt_crtc_name(crtc), output->name,
>   					      igt_format_str(hdr_test_formats[i])) {
> -					igt_require_f(has_max_bpc(output) &&
> -						      igt_output_supports_hdr(output),
> -						      "%s: Doesn't support IGT_CONNECTOR_MAX_BPC "
> -						      "or IGT_CONNECTOR_HDR_OUTPUT_METADATA.\n",
> -						      igt_output_name(output));
> -
> -					if (flags & TEST_INVALID_HDR)
> -						igt_require_f(!igt_is_panel_hdr(data->fd, output),
> -							      "%s: Can't run negative test on "
> -							      "HDR panel.\n",
> -							      igt_output_name(output));
> -
> -					if (!(flags & TEST_INVALID_HDR))
> -						igt_require_f(igt_is_panel_hdr(data->fd, output),
> -							      "%s: Can't run HDR tests on "
> -							      "non-HDR panel.\n",
> -							      igt_output_name(output));
> -
> -					igt_require_f(igt_get_output_max_bpc(output) >= 10,
> -						      "%s: Doesn't support 10 bpc.\n",
> -						      igt_output_name(output));
> -
> -					if (flags & TEST_BRIGHTNESS)
> -						igt_require_f(output_is_internal_panel(output),
> -							      "%s: Can't run brightness test on "
> -							      "non-internal panel.\n",
> -							      igt_output_name(output));
> -
> -					/* Signal HDR requirement via metadata.
> -					 * A framebuffer must be present for the driver to accept
> -					 * a metadata commit. Use TEST_ONLY so hardware state is
> -					 * unchanged.
> -					 */
> -					igt_create_fb(data->fd,
> -						      data->w, data->h,
> -						      hdr_test_formats[i],
> -						      DRM_FORMAT_MOD_LINEAR,
> -						      &data->afb);
> -					igt_plane_set_fb(data->primary, &data->afb);
> -					igt_plane_set_size(data->primary, data->w, data->h);
> -					igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
> -					igt_hdr_fill_st2084(&hdr);
> -					igt_hdr_set_metadata(data->output, &hdr);
> -					igt_require_f(!igt_display_try_commit_atomic(display,
> -										     DRM_MODE_ATOMIC_TEST_ONLY |
> -										     DRM_MODE_ATOMIC_ALLOW_MODESET,
> -										     NULL),
> -						      "%s: Couldn't set HDR metadata\n",
> -						      igt_output_name(output));
> -
> -					/* Reset IGT display state; hardware was not changed. */
> -					igt_hdr_set_metadata(data->output, NULL);
> -					igt_plane_set_fb(data->primary, NULL);
> -					igt_remove_fb(data->fd, &data->afb);
> -
> -					igt_require_f(!is_intel_device(data->fd) ||
> -						      igt_max_bpc_constraint(display, crtc, output, 10),
> -						      "%s: No suitable mode found to use 10 bpc.\n",
> -						      igt_output_name(output));
> -
> -					if (igt_is_dsc_enabled(data->fd, output->name))
> -						flags |= TEST_NEEDS_DSC;
> -					else
> -						flags &= ~TEST_NEEDS_DSC;
> -
>   					if (flags & (TEST_NONE | TEST_DPMS | TEST_SUSPEND |
>   						     TEST_INVALID_HDR | TEST_BRIGHTNESS))
>   						test_static_toggle(data,
