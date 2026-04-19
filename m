Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ACBCEA71A1
	for <igt-dev@archiver.kernel.org>; Sun, 19 Apr 2026 14:52:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0772910E170;
	Sun, 19 Apr 2026 14:52:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NrPxUEze";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 874FA10E170
 for <igt-dev@lists.freedesktop.org>; Sun, 19 Apr 2026 14:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776610351; x=1808146351;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=17H6SwatNSPW80xjx54IqdvOOCHlhnVTzabeH3+ujR8=;
 b=NrPxUEze0WrPjGN+phRcmxDOawXaQYSO4Ime9hTWviL8gwnri35Ev7Ht
 r+4WZagX8dvKtl6JvzsXK/8QJdmLFxYvkTr8SD4zRqfg7jSIaQkvOYAjf
 ZcFFYbQ3ELGlgdgMrRr/N/aOIVScVUly3TyxZhQGcgCie27sIXEvZoFb1
 5wxaW8ceW3Z9a1yXyGpQMjqtZa4sO1cK/FAJQMB/uonoTP7FXft08lR/B
 kRghPJnkjERGrfrySy32sDiYI7oQ8IIOL+iMdu8u4ENwbKeRPntYPiGaN
 oaG4OYpTKD1ND0gbjRis5pIzv8mZ3f8WSDP/7NqgC5rBNrLnu/FQf4pKz w==;
X-CSE-ConnectionGUID: fHE2TErUQsqiP7jIRbCqpQ==
X-CSE-MsgGUID: OBkvWu7TTY2Mka1QbRPksg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77522021"
X-IronPort-AV: E=Sophos;i="6.23,188,1770624000"; d="scan'208,217";a="77522021"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2026 07:52:30 -0700
X-CSE-ConnectionGUID: szUroxYPQ12krW8m47IYLg==
X-CSE-MsgGUID: DAvpIkXVR5KfDXh/xMCf8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,188,1770624000"; 
 d="scan'208,217";a="269529621"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2026 07:52:29 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 19 Apr 2026 07:52:29 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 19 Apr 2026 07:52:29 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.29) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 19 Apr 2026 07:52:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c0X4s1Cj5NHk4lLcDJ6wvtV4VGs/kaqyqqQxP+zmbY4cKido2R5W3np8X2xyTAPBu9354u9fGapXssePL2ALrQkgE6M6o6QykKtYQuws/aAgHzy9GW/FEnEgoqCPw9SGgDNypEnWZr/TKm78NY9w51R2pen0MpoC1KYCfboJPWD44JooEmnRpMWopv5sWNP8928eQw9OvjV+gTDh/oPDVy6GDp7oJOOBjk5x1YXqa2UPGUvAM3M+DMBG+rxukvEHUHaVLrXY2UZGSt8kBzhm8ISE8tdopqpjn1/++6YT5x+poTlFgPc9wO6h8xb3R9giuYgwlMeChQjH+q++//uYqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W7vRQvYzNblj26tqRdLAJaL3szkibEq/yNFh1QP4lV8=;
 b=LqlTcP49n+9x7qTppRDgGnlvKPO8Qs9s1WgeWNG1wzKAK9k0ilEDjigMvpKET+NM/Ofb+J2KVu8WtxB7I2rYjZi8B+D8Ej57HrpOt2yUJwRfRbRrZVHO1DBT8KE2RcgzjYFPm5SkbOPrknrY9RjY7aLt/CmtSzPtpCH2N4KXa0fo0WP/8vtI4jIiqqFOgBKB4oufyg5oL+JjQxDYbFoIW9mDD0Ui8mcypy12t0aKWSzQDjvYnZZrbnwSEQ2ubISqK3EOMYOWWtaMqYojJbtWx7ITwFUNtZ9LEiF95/r3fxT9H2RIjpEH9yhdWX0hxORtlPlBxJrLzhQtKBeWtcbZPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14)
 by IA4PR11MB9346.namprd11.prod.outlook.com (2603:10b6:208:55f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Sun, 19 Apr
 2026 14:52:21 +0000
Received: from MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c]) by MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c%6]) with mapi id 15.20.9818.023; Sun, 19 Apr 2026
 14:52:20 +0000
Content-Type: multipart/alternative;
 boundary="------------VByXrFEOjYMQyHuY7pRR0YOU"
Message-ID: <64f6adac-6ea2-4b28-b528-e116a95f721a@intel.com>
Date: Sun, 19 Apr 2026 20:22:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/8] lib/xe: add xe_exec_queue_create_class_gt
To: <igt-dev@lists.freedesktop.org>
References: <20260323162911.1912755-1-juhapekka.heikkila@gmail.com>
 <20260323162911.1912755-4-juhapekka.heikkila@gmail.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20260323162911.1912755-4-juhapekka.heikkila@gmail.com>
X-ClientProxiedBy: MA5P287CA0004.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::16) To MW4PR11MB7149.namprd11.prod.outlook.com
 (2603:10b6:303:221::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7149:EE_|IA4PR11MB9346:EE_
X-MS-Office365-Filtering-Correlation-Id: e13b61bd-774e-4482-7bb0-08de9e2341c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|22082099003|56012099003|18002099003|8096899003;
X-Microsoft-Antispam-Message-Info: 2FBYA7ZOXbHJkZIcL9XwPAJWkEQ6QndZktUDejJiWvRV1zSSZFAraOqLqNVOV9KfrXNUBL2as0EkeyWbv2mPW/jFMvYgzuByCTgw3BeZ6tcTh1GIpi7+wwQWDSATTo0KWM0Thd9dHqw2wcpv5CDhY/KRwOjUEPvfZH03JnYPC/YMpHnZTprJhIS7/Q5JVTD9PGXz01ZJw3VA7iYis0nUbb262OrFYNfNqApLjsuvbh3DV2aV+OumGCf8+gPzbYvgPeQOKqs2TJ9P6QigZUSZ3EXeFxPF8s+tyka9qEJtJTKX/sr1YwJPPSjbTS6jeN4wbV4yrutv9rS9tSTb+p1ffGcTGjyTPw51V1M0Otw0lh3rMWM+mFXgk7CflJ0lwO1nVtYCVLWrNz/hAOtrj1VZo62kLw/PyQblPOFtn1y1DrC8iBj3vWpCa+qeivJCJLQ3aUK3W013oDzOG/bp/Id/vMiMm+iiIjFNHSxvfWTj/SmTtoIEc8NfHRIC4xEGoFbrIJAzqQWUgS7tXIWcySx8iS6eoyS4NQ9OsYguqs9MlQ3ReSJ39/yzBxEQk4RUZu56UWapdQmcxXN8ibnyyzLvS3K11aDvKgWLdJRsZFedcFopM+WV9S/FODhBDnr8paPtxfPtfqEX30vr9j0DvndNaEZ2dL9IDqd58gNNJPmSyvmxeKW7s7MxBkNa1LX2xxU/BHT8X/PbX1GNZKyt9lbdBv/HaibH2QQAjRHC+Kvy6ls=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(56012099003)(18002099003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnBrSGpjZkt3R0YxZ3NtYm1DTkcxTHhhMjYydkNpWG53bGIwRWE1cUpWZnU1?=
 =?utf-8?B?K0U5ZXVXcXk5akkwd1BobGpRMXVqRnU3bk1WUG1ybjB2aGh3TjM4UnUvOFBY?=
 =?utf-8?B?SFNYM1EzRURwWHNwand4WjlZYld2cjZmRGVod3o4SUlNdTIrbWs0VGQyWlY0?=
 =?utf-8?B?OXBaWThXRHcwYkFXT2tVS0tOKzRSdW45VFc4aU96U1FnSE9MRjJDdFpZQ21E?=
 =?utf-8?B?N2N1TzB3aWZGOUprZ0ZqWVIrOW1tV1kwdmVJM3BFQzdRUzhZQ2s1R1UxNGpa?=
 =?utf-8?B?b3lLNDFHSDVKZ1R5SXIyVmlwL01YcWx3S3RhbTY5TkE4eldmRGtBRmI1ME43?=
 =?utf-8?B?TTNTaVFnSEVUUEE2Wlh0UjdNdnhVemFITmxhWTl3Z0xVQWVLZ09SOXNMYjQ3?=
 =?utf-8?B?eFFnVk1NNnhMcEpRUFl3SWFycEI0ejhkSFM2Ym9vUG9KN0cvS1lCU0N2bXJJ?=
 =?utf-8?B?cTBOdTZGZWxHS1BCMXV5SmNDaWlzVGRlYVZKb250dGlQUnNWemthSDhuZGVZ?=
 =?utf-8?B?aGlBajNRSTJJV1I1YXc5cDZtMzFySmZZWVZ4c1UyejFRNTQxQTNjV0JJWHhK?=
 =?utf-8?B?S1IyRkMvc0s4d0Eyd0RXL2FyTVRqZmRNejdkRWd6eXBsMWFQTm5YbUZrWWR0?=
 =?utf-8?B?K2dHSE9BK3NwL3hySkZ4RFFsZ3VGbU96czFNd282U3VnSlZVSnJ2eWhCRmYv?=
 =?utf-8?B?VXE3N2pkdTRRS1c5UnM4N010NEs0Qld2RHJ0K3ZoOE9zRktyM1J2S1J3YmNo?=
 =?utf-8?B?U29rTm1qTmJCcVZyY2hxT0FiMy9TcWt6N0xvR0ZIOUdUTkQ0VVlaLzlEekZI?=
 =?utf-8?B?bnM4bzJZbWFyUiswZEc1ak84NXRaNmphMGJ0UTdFTmFYdDBka2x6Mk1vcEkr?=
 =?utf-8?B?OThYOGFDalBKU0dkNE9jRGF6aEwwTTNrZWEwVnhSeFJ1Vjgwb3o2NzdNM1JZ?=
 =?utf-8?B?Z3g4cEcvNTNJSnYxaHZpTHZDWk14NjVRZnZFWjFFWVhnb1FFMEt2WGpyd2Uw?=
 =?utf-8?B?cEtJNEFBOHcvT0hQeGl5NXJVQ0wrMXhUZ0lVRFlPOVFrdnlOTWJMS3RSeW03?=
 =?utf-8?B?ZXFTYUcreHVLSzhObUJRVWI1cjBjVWVKWmZTdFdtanNHRWFzQXZzdVZBdkls?=
 =?utf-8?B?Y2lGaXFNaTlwaDh0RDNXYUYzRStqNXBhbHNpQ0dlemQxQklxb3FiZUppWGRB?=
 =?utf-8?B?QjlIckJFZVJVWEZnYXVXOGlqNW1LTEZQNjNiVzFGZjdKNG51UkdxdjI3eEpv?=
 =?utf-8?B?clJNd21aaGFFQjBQM3BOSG1DTGJWTFd0RzVnUzFKeVcwVmhXN2NRSXJwNzVC?=
 =?utf-8?B?bmFrS3VZVWk3bTF2V3IzaWlPVDVIdVVWbks3QXFDNlZsRUdHUEFHTHpTeHJ0?=
 =?utf-8?B?MG1lR3lmU2lWRlIxaUdiYXJIcUxHMzhYSWJYV0M3T2hHSXNuMC8vTkY3Yjcw?=
 =?utf-8?B?MFlpclhmQVVnblU0USt4eXJ0V2hRUnlTeHh6U2tFdWJVUnRwU3BqRFYxMVNH?=
 =?utf-8?B?czFNangyNit4TkRSWDhhRVhHeExISEpuMnMwTk5LN1FmQ3ovUnlMQmFEWnVu?=
 =?utf-8?B?YVZpbEpEcVVzY0RZcE1TNFp1d3ZNdkZ6NzZDWnBEVWswaWJpVHJpNWJSUlNK?=
 =?utf-8?B?TWk0MFVhTEpyZHRHTXBhMUMwNkxnM1k4OE9pUVBCVUsrTncySi9RK1p1TUcw?=
 =?utf-8?B?anhUMzl6M2tlT3dKdktsd1lLVHJxaHd6QU9iYnMxVDlRZG5ienFmcDBvMEls?=
 =?utf-8?B?UGtRbVFhNXZucFlaKzJ3U2hFN3Z4dkZxRGxxbjNpZHIxdEI1T1ZkalVWNmxX?=
 =?utf-8?B?TVp4SnBvM3VZaXlZd29xZVVqdm8wRHpiSm4wa0oybDRCRGdGMWVqelZNVW1D?=
 =?utf-8?B?cFRXeWdrKy9lZFZvWXBlZEJYZmNIN05JWnBza1FXN05mTUtKeExwRVB2TEJ5?=
 =?utf-8?B?SnZtWmMyemJSQlNxZ1BSekhrNjhvczl5NFVXajViSjlTU0J5WjBnMi9PWkhD?=
 =?utf-8?B?UHJHK2hSRURaMFcwRXQzaDhmWjJIdGxLc3U1YTFNZVRwcFU5TjNqRmlXaUwz?=
 =?utf-8?B?a3FoeVdrY0RnOWx4R2xKV2Mza3lvdDNMMjJhYkhQSGRrQy9QdUxxVENyeVZo?=
 =?utf-8?B?alRCTGdMWFlBejU4RTRZZWNUMmVuTWl6Z21GT3RFNzMrdUNGd1F6dDBiRU9T?=
 =?utf-8?B?UVZBUElnVmpVb0grV3ZpeGJ4Rytpc1VpNXRwMlFoVFJmMWR4SW5vNnkweFVL?=
 =?utf-8?B?NkdLcE5CajFVNHJISDBUcjRsa3d0OXJXbXVPTTRYUG5Vc3UwSjZmRkMzL2ZO?=
 =?utf-8?B?ZGlvYURGcVYyY0JibHRVVXdtNXNiVmVUdzhuaWhTT1R6Y294WnpoYUxodFM5?=
 =?utf-8?Q?B9li1kd4fbeCYZfQ=3D?=
X-Exchange-RoutingPolicyChecked: bsEaWinmfeu3JJTufFM5Mjzx/M7n6eXI+jcWIW470axQ9EwH29lczUcjy9JbniWL6KvgRd3Hwfp9vvAhrBtzrf5P1frQPvtvdM8QK+KxlASWZS11i+yAYxSp6BPXeS7QFAhiLB7GokjT4GYgeHwiFIhfKTlWxgDbFDQUQabwJb4aC46cJuwI2X9aYgIrjWrCjOfIdb6hz17UgdXnEWJj1WdtGtEKvAV7s8RwgyPM0GSa0l/6GWux0Lxui24Ri99c3LjAZlLt9cFaTbzLKt2NgmxPlSa9OS+zuqcHXaIyZNVbKwtvobqccuLEh5FiQQOFLOltGvH1mm0K379L3pDmbA==
X-MS-Exchange-CrossTenant-Network-Message-Id: e13b61bd-774e-4482-7bb0-08de9e2341c9
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2026 14:52:20.1638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YJPyZN3u0l+iTRkvfsmghLJn5auLWb9czb/QTo35ze4aFjzzsSUZcVJEMdXkSOtp6wEXfU26KHThtdCWol0NgDqG5OJEdidcPeQ3w4OgFwE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9346
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

--------------VByXrFEOjYMQyHuY7pRR0YOU
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi JP,

On 3/23/2026 9:59 PM, Juha-Pekka Heikkila wrote:
> add function to create exec queue with class and gt id
>
> Signed-off-by: Juha-Pekka Heikkila<juhapekka.heikkila@gmail.com>
> ---
>   lib/xe/xe_ioctl.c | 20 ++++++++++++++++++++
>   lib/xe/xe_ioctl.h |  2 ++
>   2 files changed, 22 insertions(+)
>
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> index ea3f2fcaa..d56c58053 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -503,6 +503,26 @@ uint32_t xe_exec_queue_create_class(int fd, uint32_t vm, uint16_t class)
>   	return create.exec_queue_id;
>   }
>   
> +uint32_t xe_exec_queue_create_class_gt(int fd, uint32_t vm, uint16_t class,
> +				       uint16_t gt_id)
> +{

Imho, Invalid class values needs to be handle with valid reason message.

DRM_XE_ENGINE_CLASS_VM_BIND is kernel only class. It does not represent 
an actual hardware engine and is reserved for kernel-internal VM bind 
queue management.

> +	struct drm_xe_engine_class_instance instance = {
> +		.engine_class = class,
> +		.engine_instance = 0,
> +		.gt_id = gt_id,
> +	};
> +	struct drm_xe_exec_queue_create create = {
> +		.vm_id = vm,
> +		.width = 1,
> +		.num_placements = 1,
> +		.instances = to_user_pointer(&instance),
> +	};
> +
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create), 0);
> +
> +	return create.exec_queue_id;
> +}
> +
>   int __xe_exec_queue_set_property(int fd, uint32_t exec_queue, uint32_t property,
>   				 uint64_t value)
>   {
> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
> index b62d259fd..f2164e640 100644
> --- a/lib/xe/xe_ioctl.h
> +++ b/lib/xe/xe_ioctl.h
> @@ -83,6 +83,8 @@ uint32_t xe_exec_queue_create(int fd, uint32_t vm,
>   			  uint64_t ext);
>   uint32_t xe_bind_exec_queue_create(int fd, uint32_t vm, uint64_t ext);
>   uint32_t xe_exec_queue_create_class(int fd, uint32_t vm, uint16_t class);
> +uint32_t xe_exec_queue_create_class_gt(int fd, uint32_t vm, uint16_t class,
> +				       uint16_t gt_id);
>   int __xe_exec_queue_set_property(int fd, uint32_t exec_queue, uint32_t property,
>   				 uint64_t value);
>   void xe_exec_queue_set_property(int fd, uint32_t exec_queue, uint32_t property,
--------------VByXrFEOjYMQyHuY7pRR0YOU
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi JP,</p>
    <div class="moz-cite-prefix">On 3/23/2026 9:59 PM, Juha-Pekka
      Heikkila wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260323162911.1912755-4-juhapekka.heikkila@gmail.com">
      <pre wrap="" class="moz-quote-pre">add function to create exec queue with class and gt id

Signed-off-by: Juha-Pekka Heikkila <a class="moz-txt-link-rfc2396E" href="mailto:juhapekka.heikkila@gmail.com">&lt;juhapekka.heikkila@gmail.com&gt;</a>
---
 lib/xe/xe_ioctl.c | 20 ++++++++++++++++++++
 lib/xe/xe_ioctl.h |  2 ++
 2 files changed, 22 insertions(+)

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index ea3f2fcaa..d56c58053 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -503,6 +503,26 @@ uint32_t xe_exec_queue_create_class(int fd, uint32_t vm, uint16_t class)
 	return create.exec_queue_id;
 }
 
+uint32_t xe_exec_queue_create_class_gt(int fd, uint32_t vm, uint16_t class,
+				       uint16_t gt_id)
+{</pre>
    </blockquote>
    <p>Imho, Invalid class values needs to be handle with valid reason
      message.</p>
    <p>
    </p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt">DRM_XE_ENGINE_CLASS_VM_BIND
      is kernel only class. It does not represent an actual hardware
      engine and is reserved for kernel-internal VM bind queue
      management.</p>
    <blockquote type="cite" cite="mid:20260323162911.1912755-4-juhapekka.heikkila@gmail.com">
      <pre wrap="" class="moz-quote-pre">
+	struct drm_xe_engine_class_instance instance = {
+		.engine_class = class,
+		.engine_instance = 0,
+		.gt_id = gt_id,
+	};
+	struct drm_xe_exec_queue_create create = {
+		.vm_id = vm,
+		.width = 1,
+		.num_placements = 1,
+		.instances = to_user_pointer(&amp;instance),
+	};
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &amp;create), 0);
+
+	return create.exec_queue_id;
+}
+
 int __xe_exec_queue_set_property(int fd, uint32_t exec_queue, uint32_t property,
 				 uint64_t value)
 {
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index b62d259fd..f2164e640 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -83,6 +83,8 @@ uint32_t xe_exec_queue_create(int fd, uint32_t vm,
 			  uint64_t ext);
 uint32_t xe_bind_exec_queue_create(int fd, uint32_t vm, uint64_t ext);
 uint32_t xe_exec_queue_create_class(int fd, uint32_t vm, uint16_t class);
+uint32_t xe_exec_queue_create_class_gt(int fd, uint32_t vm, uint16_t class,
+				       uint16_t gt_id);
 int __xe_exec_queue_set_property(int fd, uint32_t exec_queue, uint32_t property,
 				 uint64_t value);
 void xe_exec_queue_set_property(int fd, uint32_t exec_queue, uint32_t property,
</pre>
    </blockquote>
  </body>
</html>

--------------VByXrFEOjYMQyHuY7pRR0YOU--
