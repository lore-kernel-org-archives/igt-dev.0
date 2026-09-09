Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7EDC79FAD
	for <igt-dev@archiver.kernel.org>; Wed,  9 Sep 2026 10:27:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3673D10F09D;
	Wed,  9 Sep 2026 10:27:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oFBzxWjV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3692B10F09D
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Sep 2026 10:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788949635; x=1820485635;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=2XgHeLrPDaYtYytrCm0/tSA0RQxzZXwe4LAHVGiJdb0=;
 b=oFBzxWjVfC5x8quFwY+GrGcIDdy+6vcN/e4bg4Ll9NJ3Ai5Ce8PN6jNw
 A3RjlbzZL8FoAhwf/FnyNbOWgE9ctcYCvYRLOLK96H4VI7QsXqGfWu1n3
 dJVfNZl1UYmGHwrMrTLZNl+UoVkT3vYVP9TNXi0vrSnZzoPJhl/tcp5TE
 JIE9RW8sdZ+T5A4GaWZZoGzbrTTezpH0hQR20p+ABo2qhDNEKqAFxJp70
 YOBQMaCSJtruyCjcOeRT4IID5U7OHth+MFOatFFrSiNsllnMd6lqnsUGH
 g7e0EGej5bZNlAc3SzcgDqs80CWjaJR0fXMr1OXs3/X3fPEVMK6yQ/g/K w==;
X-CSE-ConnectionGUID: f7Il7xekTe+ihNuR54hHMg==
X-CSE-MsgGUID: KIXwWle7QQiGsX44CO/xPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="106740650"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="106740650"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 03:27:14 -0700
X-CSE-ConnectionGUID: DTwVcel3TtuJ+YmjltQNcQ==
X-CSE-MsgGUID: izviQM79TAyZT/KsRZRcWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="275418492"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 03:27:15 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 03:27:14 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 03:27:14 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.40) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 03:27:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qdfw83tpMMaqKZPMF4KqPxfU9kPyd3RP4HIt+8x2PXPpuhrSEIgWWe2afw9FRJk8BBjerOOiIUK1WRiFS5YIYy/QWYQcI9YK2wGzrMuuG40fPcThlbJnFE4ffAaXxiULvrLApsUMNPnQSng1jnsXY9F+jRmnuH3wnpYsmH72NgXJZNm6eWk7TCZbN0p+TTM5tSYh7I3hAzjzkEgkw9w8zCVKp5m6+PANEbl0U1CxI96HLgckKXXcdw4wAAqCei4CENrT2UZGTyyLZDRD4aKgFXFF/XjiRk6zCehVhtp9MBnCoNEoFbYMcMrg22rY+rrJHvx/6vuwdkifB6DWgnkrvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F11yqxnOuUCx+TsOjVRqGg3jLXdlAq0cfoACAimy6lQ=;
 b=JUUNfWvmgDO7aMIsNCoKz1qkbmmRcWF6UjK9xGylIyqCIMOvEwNiKBIYJqikDQUSDZJkYIKOoqWEVyXQSEh47wH/S3G93gsjv1IHdCTIELTkPP06rexXjS5GQCx0mKkFpKFayKlW8whdPT5Ztzt8TT/tKzfkCWyX2cvILv234cY0xOwz4emZuZLWThWiqluNWJwcbvuAJkhnYa4Gqv/voH9HjI1PGvNMICFqhc3jUQGYfihe0JkYZcGWClhvyiGPLhHwQwqkTjWavcwoxmsF/mQVi1h2LLP62V4GWAlvEPHUHmDTbzcTg8Q/GEVc/NBp2m8u6JiyEi9AUo2aK6XrTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by PH7PR11MB6449.namprd11.prod.outlook.com (2603:10b6:510:1f7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Wed, 9 Sep 2026
 10:27:09 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 10:27:09 +0000
Message-ID: <547521d2-ef07-4cec-abf8-d85edb8f5b6f@intel.com>
Date: Wed, 9 Sep 2026 15:57:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v5 1/7] lib/igt_kms: Rename IGT_COLOROP_FIXED_MATRIX
 to IGT_COLOROP_FIXED_MATRIX_TYPE
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260831192935.463134-1-swati2.sharma@intel.com>
 <20260831192935.463134-2-swati2.sharma@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260831192935.463134-2-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0048.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::14) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|PH7PR11MB6449:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bf01d5e-1f89-48a3-d8c4-08df0e5ce72b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: ISXUphgZn4zNAz+QsVfwun+fLDc4wcO0p1mN0lf23oXL+YpHyKnPg22sIhbl+OMvDOIDp0LtzVcqAT942v8+nGXMjwv/kXEbIqPfSbFiM5SoDe1UNzfFrwn/wqs0HZDTX1vUR3V8NrRi0WJjye5IXHIY93M769TmtvKvYPY92Lfhmj7vcsi2ywoJs7YaCAPnrhQGHF1bPxUYV37QH6DhKZuTjiGvIfH0Ljom7pmtjxm5N063K2IKmDoz4tdVWvB2XaQ59APGPU5PjE68gSuT1NEeM1KWGWIv5yQycyG3a1nfThHSmcPi7NcifSHfPSKZE3ragJNLjPsOYgSRCTrKE8E3L+cdcegycTPlPRsMV+1WxdDRTOsT7ecdbcREvfW2DlJoMDHVY9hyBVhnmWnTmNtYT71sxvvZdyaCmTX8HYJXZfqtr+hhBSSMKedRD+AhHizWoob0xKAk7lMqhuB3I3siVas4qo3MDRZljRRQ4akIVAS0QtRJntjjeEJkUvwDpO0QvZfaBSAq42J53vhLwX8g0s17KYKtqrSJCBieAbKiwfeayKvKxNOI9sPZJcmzy2rVj9XVx2B59lvETblyihJvZmC23+dIbCIty6K+4BRcyYiWrBDWC6JOEKbDjVHOf3lN7vmy7S0PgvVW7D1JuuktwtEeUgUsxSGbkRRbakQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0t4bi9TU210cFo4dmtPa1NlS2RQcVFlL2NpM29rNmxKdzZ2QVkwZkV5SjJs?=
 =?utf-8?B?bTl0cmZZcWgxYWcvNXNDRzA4eEZYY09zNEJvMmZqVFVyVXNMQ1pFaHRnQXlu?=
 =?utf-8?B?REpvb0xZVVB1alpjTDJZTDU3UWlIZkRHYnMrQlJpNWw5cDNtN3ZDWWJmYit5?=
 =?utf-8?B?RUNhTlY3ekJrMEJXQVRSZ0g4TER6WElOYjdtYU1zQkdDdFQrb05nbXh1OG5n?=
 =?utf-8?B?ZWovMCtMaXcrZkI2MlVNQ3h5ZXMyd3VicDRnVEtxTHQ2UXlKQm85SFdoZlNY?=
 =?utf-8?B?cHd5RmJVZnZpMSt0cWNueGdTc1ZWdEwzcWY0WnpWTGxJeDIweW1XdG5hdmRl?=
 =?utf-8?B?SGxSMHlPOU1heU1xWTlhdVpVRmV3anBUaTVsRXllOFNrZjV2Z1dWenBQZWN0?=
 =?utf-8?B?S3pWUmRzQU9QdytacVh2bWZOZWNGZlBMSnR1dm1YYzBpd1EvNDJKcjFhVlRZ?=
 =?utf-8?B?NFk4Q3BKMnBTSGxidlZsVUtxMFMrQ3h4MTZnZFVZUE1rTVBUVHVaUGxnTVdF?=
 =?utf-8?B?czJSSzNodzBzNGp6aXliR0lvaWtFeFRvV092ZnN6NXRuUXBoZjhJSW5XNDdr?=
 =?utf-8?B?ZmppMzlhMFVrbG1jcGlFOTZ4V0xQYmpGYkloVmcyVHd3Uk1vWGdqODJtVzA4?=
 =?utf-8?B?c2o3UGtLWmV6M3JsU3JiM0RpVHA0MXBseDY2Q3J1MEovbjczbGk4UUwyb21X?=
 =?utf-8?B?RlJMQ3BNMDc1OXJOK2hPZmFaMXozV1dSQUdYdU5oSkpRUzFSYXpHR3MzcFhK?=
 =?utf-8?B?b09MdzNqcVY4MXgyQkZNMmZ1MlRzQnNVZk1wUTFGQnBNUTQvdFNJd0o4L1Fp?=
 =?utf-8?B?S0dKM2JBWHVCUGZoaWwxSWtlTUUxNHlOUWFua2RmZTVsa1QwcGZiMDRFZVdr?=
 =?utf-8?B?VVBLUHFHNmFYblQyeHdmbmVOc0o5N2g3YkN6bFZCWmd6NUFUZVZXSWlLMWR3?=
 =?utf-8?B?WHZhRzI2MTV2U3ZRc2F4TnJXNERMbGt6QnJRRnUvbHVmeXZwL3NKTElLNDk2?=
 =?utf-8?B?M0VCR09RZ0tOZlFGYm9BaksvR0xBMnhBSlQ3U0cwZ243Q3J1Y1hSZXdJaUdE?=
 =?utf-8?B?ekFvNko0KzZNSlBrcU9XTVYrMGs1WmJ1dGR2UUxCemJLYU5HNy9xZnF0RnNx?=
 =?utf-8?B?T1RiMUlLRDhuSG9Odk5nOURmUGFWdkZ5UU4veVVTSlNkV1QxRDV4a294bGVy?=
 =?utf-8?B?Q3RBNWpRVzk0UzJqNEp1cFNMMnA0SDR5MUN0cmczTGV5TldIS1grdVFVUWtl?=
 =?utf-8?B?SXJ5MlNzcEIxSkQ2aFhkbmNIeVpISUl5SS9taWcvaFYzM0hxQ2NSd2xBRHQ1?=
 =?utf-8?B?TFlnRTNISWE2TWo0NFVVOTNBdTdDWTZOK2Z0TDNGY0w5YVFuY0RvVzZFN1Bh?=
 =?utf-8?B?SlJQaFJuUXRTbGtxdE1pUXBwaGxiYWg0cC9leHd0dS9qblF0YnZZMmVza3VH?=
 =?utf-8?B?TE92djRtc1h2SFBpS0pEOC90bUZvNFowU3AvUkJUemVsYTFMcGErQmxsNmp4?=
 =?utf-8?B?aGZGVUl4SWxwcVpzQnFxbnFsZ1czWERoZm9EUm14UVN2dmFvc1dPeStXTVFI?=
 =?utf-8?B?bENCdklwOWp6RzR3dHg0aFhKb2pNYUh1MlNueW5PbkExWTZyYk05ZnVtclJN?=
 =?utf-8?B?ZzVDdVlYbGRmeUdacUs0cGdpa3QyK0p6dDV3aWNrV1dCZmZPVi9ud3A4WTRt?=
 =?utf-8?B?eUR6NVJ2RzV1RDVQMzZPZGJlU2tWTUF2blUvay9CKzNXZzNhWDdRZ3lwVmd0?=
 =?utf-8?B?dTZFYk56djB0RzU1K1lEZDFGSTRrSnpNdURUWFJTUm1wYmVrMlFzM2xJdUtZ?=
 =?utf-8?B?RXF6TU5PYlk2NUVDbFhVTFVxbUdOVGgvTEZCaTgzb25kT0syNXlzR3JSeG55?=
 =?utf-8?B?dVBkM25NR0ZrZEZjUHpzbjhFTDNvWWhncXZ0bVFyV1BBbGVKdU5jOTgyeVBZ?=
 =?utf-8?B?VS9iM1hOWXMva214QzN3c1FFTW9lWmE0c0JQMlZwb21tUGhxVElKNVNERSs1?=
 =?utf-8?B?dDVGN1Izb3RlL1JRM0lqd0cwUVdjRWFRaDZzMjlRWXBIeTVRWVR1L1FEeHRx?=
 =?utf-8?B?V2VIT3V5cHhYWTZmblhzcStWay9CQjNwQUhMUGl3TWp0Z00xemwvV2l5eGFT?=
 =?utf-8?B?NCs3Y0tUNEtMTXgvYldyMVBid2RocnkzbG5PTHJzQlc4VytoblRPWWozRDNT?=
 =?utf-8?B?Wnp6QTBxczJhTENLVjliNFBNaDVVbG5lbVUxU3ljTDJRdkQ5WlJwdTJJa2tW?=
 =?utf-8?B?MzhYYnlJYzlrOFAzWlNCdmVrZHJ5UEc5c1FKZ2RVVERsNitFT3hOQ2FPaWho?=
 =?utf-8?B?UmpoYzI2WXR2UU14M1lSTUJBVGFRUEdmQ25iWUoyRGdqNnljNEx4RFJXU0g0?=
 =?utf-8?Q?290150UUsiXGMmfs=3D?=
X-Exchange-RoutingPolicyChecked: cQZQnWSzIa6lSr+3l/35mORywT0dsYxiGrNuSgaFufdzDRHQKfaXe2dmsfMVDFDNaKVQcAaU+964RTwGWvfzv07RBm/mLWzuwgAsXk4Qa3pTQWzL4c+DsKPsB9821iIUD86RH9/sO+G2953bHWtb00CBzE0CHjDY0/QciMoEQfzIBXLrLru4dNZi3wJrENdG4Aae3P7aqGP08MrSfeT19GUVljyR+iP1VQ6cjlx1QKT4tRAzPSoHfOXtRYcNQB0626enMt1NGJxQwHR1NydxQ3e+hEYK5rXzK56+SNd9mgDIi0D8hxBSV8qNemc9pfrlumxYOM1YbatOEP9rGJ+z/Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bf01d5e-1f89-48a3-d8c4-08df0e5ce72b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 10:27:09.1355 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UZ4X4p5zwSDCbQIChZYwrECyW6p7IJlEXzv2VzehmDhHQVeKhCAVDM7BLeIpyFcCvCi2Mw/3rhBJYGVH+h+P8lQKZhOD8fLkZI7+FjrPltc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6449
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



On 9/1/2026 12:59 AM, Swati Sharma wrote:
> Rename the enum/prop name to match the actual DRM colorop property
> name "FIXED_MATRIX_TYPE" and update its users accordingly.
> 

LGTM
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> Assisted-by: GitHub Copilot
> ---
>   lib/igt_kms.c              | 2 +-
>   lib/igt_kms.h              | 2 +-
>   tests/kms_colorop_helper.c | 4 ++--
>   3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 2d78e3bee..1e27a25f6 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -725,7 +725,7 @@ const char * const igt_colorop_prop_names[IGT_NUM_COLOROP_PROPS] = {
>   	[IGT_COLOROP_MULTIPLIER] = "MULTIPLIER",
>   	[IGT_COLOROP_LUT3D_INTERPOLATION] = "LUT3D_INTERPOLATION",
>   	[IGT_COLOROP_NEXT] = "NEXT",
> -	[IGT_COLOROP_FIXED_MATRIX] = "FIXED_MATRIX_TYPE",
> +	[IGT_COLOROP_FIXED_MATRIX_TYPE] = "FIXED_MATRIX_TYPE",
>   };
>   
>   const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 695f666ba..c8fa11b47 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -363,7 +363,7 @@ enum igt_atomic_colorop_properties {
>   	IGT_COLOROP_MULTIPLIER,
>   	IGT_COLOROP_LUT3D_INTERPOLATION,
>   	IGT_COLOROP_NEXT,
> -	IGT_COLOROP_FIXED_MATRIX,
> +	IGT_COLOROP_FIXED_MATRIX_TYPE,
>   	IGT_NUM_COLOROP_PROPS
>   };
>   
> diff --git a/tests/kms_colorop_helper.c b/tests/kms_colorop_helper.c
> index 3243d01d3..f58f629f5 100644
> --- a/tests/kms_colorop_helper.c
> +++ b/tests/kms_colorop_helper.c
> @@ -263,7 +263,7 @@ static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_
>   		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_3D_LUT);
>   	case KMS_COLOROP_FIXED_MATRIX:
>   		if (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_FIXED_MATRIX &&
> -		    igt_colorop_try_prop_enum(colorop, IGT_COLOROP_FIXED_MATRIX, desired->fixed_matrix_info.fixed_matrix_type_name))
> +		    igt_colorop_try_prop_enum(colorop, IGT_COLOROP_FIXED_MATRIX_TYPE, desired->fixed_matrix_info.fixed_matrix_type_name))
>   			return true;
>   		return false;
>   	default:
> @@ -411,7 +411,7 @@ static void set_colorop(igt_display_t *display, kms_colorop_t *colorop)
>   		configure_3dlut(display, colorop, lut_size);
>   		break;
>   	case KMS_COLOROP_FIXED_MATRIX:
> -		igt_colorop_set_prop_enum(colorop->colorop, IGT_COLOROP_FIXED_MATRIX,
> +		igt_colorop_set_prop_enum(colorop->colorop, IGT_COLOROP_FIXED_MATRIX_TYPE,
>   					  colorop->fixed_matrix_info.fixed_matrix_type_name);
>   		break;
>   	default:

