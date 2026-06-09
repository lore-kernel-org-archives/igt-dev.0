Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDDBECD8CA4
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jun 2026 14:49:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73BFF10E41D;
	Tue,  9 Jun 2026 14:49:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YXRjheam";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75CFF10E313
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jun 2026 14:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781016532; x=1812552532;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Gm26hatEkdqYJg7EHMKs49Khd57fUfWmJRmPa+d2WWo=;
 b=YXRjheamx7dv1KRQps8kU2GxUNJe1MXjbMrcRBadEBp6MTDS3+K7tUCL
 9M8TY3RO7bfgU5bITpbncQeHNFNT2micyooVUC+pitRrX7JxHYqSotn7E
 631zOEwXVcZzCXoV9WTbFiSLSyp0XgL8Zj4vmj54my+LLe0NugrJ20OID
 C1Yhowry+5CihTXf+CJ1NZBl8akxtOtufoTOvg2nObiIn3XWx7j8LAPxx
 JWeRD4mw29iLh86RbAkoeXdB+zrJ1KAUC5yJ7hmXo/az0Pne6xaOPriSa
 9vYU8tRTAwbD2i41vmNPFsmxwuTe8NarBYWCtkEEJgdtOtKSxqKlGcLFW Q==;
X-CSE-ConnectionGUID: y34yzjwHTgubNXKtlS4ptA==
X-CSE-MsgGUID: aqbsbjYsQ8aFfvu1S6PfUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="80910053"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="80910053"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 07:48:52 -0700
X-CSE-ConnectionGUID: +zLRGejQSC24U7sgPR8Eag==
X-CSE-MsgGUID: xn1nBpeOSiqK0HebStoCWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="250806856"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 07:48:52 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 07:48:50 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 9 Jun 2026 07:48:50 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.35) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 07:48:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gAtK1VyFVVEc/YV4EDDfwgzmI1n17xaBTNq9jStKLiLc7v88FWinvNCb0GfKxnVJWEuT0RtCmuMwNp+OT9mC9nXeG2FtcGl4wEfKkBMUNh4FeEyiQoJkUm8eaOeTNUiJEL3nLNCJgO6TOObyYMhkqOfdYKtrg0mG4Yu5ZOcEbnGP1R9QxPp3iVy7VqUkQeSyVaynUdZM8SxhNUJnAWKXbpUARvqEW2fiSD6g9NdJAn4f44NLdg466JW0KTTMUd16pCBWohFpmvs9mlpUjaEHfP2ijRPNCvQoqSMSwPU2cRa1tHN7FIHVkpovUWYJtbm2AmKDgYr75qW7fhJXRZ70Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c6+qmeYVgAnN9yXuld+ngsVBizQqvojx8iTU9+g9/HE=;
 b=gl0yFvOxC8U/ROFTNyj0NGjF9JN1iRCQvnnpKdP39MsFrNENkp5QuC9NA92KmJ23fK2NoIUlNodE1T+M6n6hEtmXvMzlaTFaWquBszx5HdL7oxAsFYmdRy+hYnKM07nXiXh6T66wPG621aax5ANmd30RARNeiysJpAeaZZuY1oHlxvSmLOjVdLmRFRnDWvSyH2RaSV9kx1VjBb/7JmlDpGxiSF0eNY2vWFv4FcDdMH/titach4pquLHC//7SQEmFW4nHkAV1kc+k+QDORiUO7k+F65vOfFx99jo2YyShpNxltWEvqQX5/+2PdZNqaHFKJckedkeaYlZOfQztIRBpDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by SA1PR11MB8575.namprd11.prod.outlook.com (2603:10b6:806:3a9::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Tue, 9 Jun 2026
 14:48:48 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%3]) with mapi id 15.21.0092.006; Tue, 9 Jun 2026
 14:48:47 +0000
Message-ID: <7289576f-52df-434d-96fc-571faa23756d@intel.com>
Date: Tue, 9 Jun 2026 16:48:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/8] tests/intel/xe_sriov_scheduling: Use timestamp
 helper
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <adam.miszczak@linux.intel.com>, <jakub1.kolakowski@intel.com>
References: <20260527205644.2801165-1-marcin.bernatowicz@linux.intel.com>
 <20260527205644.2801165-2-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260527205644.2801165-2-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0016.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::27) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|SA1PR11MB8575:EE_
X-MS-Office365-Filtering-Correlation-Id: 61cb76de-7e01-497a-9ef9-08dec6363664
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: NtHUks/rRrQxCCWK+vqfbppAxyZLfv1kt8fv0s4IiPO2rxPm39bSmFkwioNmVm/aEILq8y06ClnZF931PGhDeVtpL4FenOxm5iNXe+EqELjxKjBW4ELV+r5bt76JnL3aQaWJ+Z07MyfZm2O8tu3SLG3T8PUqdOXfh8Orrz/0WHXFICaHh8v1JbRzrbp+zBPXZW7pgVIpqk68CfpI2JyxWDDrInn26klbg9s3EbJxB59B8CxhrCsiRfT9PNeEWcK99ON8yh3nb4Zq6vX4vJ/e7E0Avn/N/lH19hFYufiMBnglCzCvRLHPpgaK6D+viSlyA/EmwWTHKqy/78c7Vu8jR3HIdBUWqVG4uSmOr5qaJv+voy6YwPEYwP28uDCZHOI08oOUZbh/XQ39Rw32XOrGLbgmRQglhwztTO6ZqDGxg+EQPNvOHJmuNfoaWhIPQEXhUt6EsK9ZJUfJd4eocDwITvbX53YBWh4tX6s48ezWC19A5WRFY1+G1y0k3y+vNt2EzmYEgcLw3pQxOLmg1lDtIqGpTVXDFeL1Mdn+La0+7fEC76SkMuOfTZpoz5PULNWEGVEzPJK7PA+FBz6+K/RBYRpqIfYyF796Ah+/j1yJfgJXC16s5ViTWVFmlL7vapng6Fkr3fu5mREktH5e3GG2tJun6IrueuGzX27UThxkFnF/Ha8BQaFgC3SIXHD7es8K
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0xZQ1lGVUtUaWNiMWd4ZXBSdS9JaWhzdDg1SmZ6b3p2Q2hMT0RaOEw1N3ls?=
 =?utf-8?B?TkdxdUxBSFJJUUh1cUZUSWYwTVgrdW1ZQlJndmdrTm41QkVTTTlja3I1bXRG?=
 =?utf-8?B?TU5NU2RNSTVzVzVUbDhNbmRvZkV4WUppVXNTWUlTdlhXNWFXb000Wnl0Ynha?=
 =?utf-8?B?RWlyVEpyWStvOEhHTG56MW03eDVGQkVSUHN5MmxLUGhTQ1ZYR2tzRFVpcXo3?=
 =?utf-8?B?UVJiSTVFejVnZXcrb0hyMFBBOEVYSHVJTTc0TVlBVkZNNkxVaHlqUkhCSEV0?=
 =?utf-8?B?a25VU2tKaWRCcDZoOXR2K3I2RWNvZVVXNkJGYVBvdko0OFhibGwrSFMrK29S?=
 =?utf-8?B?alJvQjcwcmRPM1p0djlWdEU5ZTFpd2RJdUVPWC9mYW9hcFMwQnlSUDhxT0JF?=
 =?utf-8?B?Um1mbzhRUnVRVEVSVEhoS0RDZ01lc25UeFpOUlJEa1doT2ZIdXRzWm8rdVpO?=
 =?utf-8?B?RDQycVN6ViszajBINnJlYWZvaDRLYnRMNzM0ckhEUWlrbXdtb2J6Y2dqVG9C?=
 =?utf-8?B?UDd0NE4rYjZUOFBHMlA0QTB3Q2V3T0NZdzN1OWZFN1JJV2tRME5BQzRnVk5o?=
 =?utf-8?B?WVFGRmVhVU5QNk9Xa0FSa0JJRDZ4MTJQdWF3Tnhha0laRGhGbmlJdTlreDJP?=
 =?utf-8?B?S04wUVc0NkFwemVLTGlKeVRROFdMMmpIYldUcWxUelBtNlI5dk45Sm1ONW1z?=
 =?utf-8?B?NDEwYXNFNTJYcEZISmRhSTBsbENUNWFaVUtYZWRETzRUSnI1QTh2dzJqcFJT?=
 =?utf-8?B?MVAyM3BEVG1aeS8xU1ljbThRMHhTa3VPNGNRbmNsMlA3THZOSGVES3U4NGMr?=
 =?utf-8?B?T1BZa2lKazhWYWVhMDUvdEI3RjRkR0xyNUNGYTZBUFVUUTJ5dVhxcW5xY2Ez?=
 =?utf-8?B?a29UekJqZ2M0ZTZ0QUNHTlhaNW9OWDExYjlqMkVjSlZuTWt5TmNhR2duSDUv?=
 =?utf-8?B?WjJXbVhqVitqUmRnaStycVV3ZVh5bUpZS1J3VzBYMERlaGFzSDE4OE1HWURS?=
 =?utf-8?B?ZXpsaHhMSmZ4RlE0cllDNHJlWnFOZHh0SFp6MlNIU1UyTGlGMi9QQWYzYTRR?=
 =?utf-8?B?UnpITkVVM0hlVVRXckdPSGsvR1RubVlHRHhVQno4N3lJbGZXNWprOEhTWkN1?=
 =?utf-8?B?Mm4wb1JJYkp3Vjg5ZWNSOU50aEdiWXRyRlhYakN3YU9PWmd3TVVoeUI5NHQv?=
 =?utf-8?B?NVc5eXpLL0tXdDdFVUx1VzMwNjZQNm1pM0J4L0NqY2JNQ0hiZ21ad0pIdUxK?=
 =?utf-8?B?L3lQM25xTHA4WXgwU1hsRElraktxWEJMMFZLMktJS0tBRmgycXNBeUJuUC9E?=
 =?utf-8?B?dFhZMlFETUdieFZnRTB1YXdkQmtoSnZESDdjRzJwOThMRW5OYlhvUlc0RVhU?=
 =?utf-8?B?VnNUMDlUWGxUTlc5RE9VSW14ZFlRYU1pbnVHNkM3alFIRHduWWJub09hdm5M?=
 =?utf-8?B?bFIxTTNwNkcwdXB0TWp6eUo5Uy9ON1A0RHhIdzB3V2dXYmdhVElPdnRDM0Vw?=
 =?utf-8?B?a05XTEpiTEJ4TUdNM1ZMMnVMaTZYNC8wLzdQdHE0ckMwYTlXazRsTllmR3Bt?=
 =?utf-8?B?YWxnS1hHQWQ5cWRXN2Q5OUNoS3pxQkZDU3ZYUlNweWZMQ09ObWNmMlJrY2R3?=
 =?utf-8?B?S0FjVFBWcEE0RjlZeUlvMHFqVjBFMngwNkxXQkVyb2tPTU9UTVdWSURxazZj?=
 =?utf-8?B?VmF3U3B0cVhLZS9nb0FscDY2clZydm44Q0V3TlEyc012Z3B4TE9MY0MzdkNh?=
 =?utf-8?B?Y1hpYklKeE1qQkhrNHJrWmpXemtENTlSaXU3aS9QK2x1UStHbmdqTTk3VTJr?=
 =?utf-8?B?YTdGRjNxUEQ0bWtTUXFYUTJpL0lsazZKTzBwWUsyRk92V0U5czZockRsdWUx?=
 =?utf-8?B?Y0ptVEl5ZlBDcXJiaFFPSjhYdzJkVXRqYzcvemJMRUFyMWN5ZERXTU5wUWZ3?=
 =?utf-8?B?RlQzNEo5N0FLaEErNXg3TVloOEJxSVE0U1RXa2lZamFRM3ZRZ1RRQW51QjZB?=
 =?utf-8?B?WGU2Y3VsSUp4MExFKytZSVRkYmc5a1JpNExJQ1AyT0llZUJWeDhwVUxwc2RD?=
 =?utf-8?B?aU96ZDNVVk85b0dPYzM3ekNoMjJmNFBFdWhmbmpXK0pab2RqME5uc1BKN3BQ?=
 =?utf-8?B?SHJQMU1QRGRyOWhPYW84WlpkRzcyb2lPRlNDU0NuSmtzbk5wME01ZHp0ck81?=
 =?utf-8?B?eWRrMVg5LytubkRCVWh5MVI0Rmw2UnkveER6K2wxWStSOWZuVlFMaHduWCtE?=
 =?utf-8?B?dWtWZXBkb2hVQXdWS29wblIzVDB2OWU0dCs0amZpMnFJVTE2dThjVUNzZUE4?=
 =?utf-8?B?encvc0QwRnlISEI3c3VOdTZ3Z3Z5c0pwUjBRMEdxRmdIMmFxaXMzQT09?=
X-Exchange-RoutingPolicyChecked: LdEUJn5D023dcvaiOe96JVhCwDgen9CxnErmcIiJk3jeL+9vXYAXP9PNZKvsZGuipkMFMF6AbjCmQnZ5T+V1TLzd2HA/0R5rnbuTIQ3pQ9kHUSHBQNw7bMf5OOxbPDmgOVJtZ+PClPeeHfyzCjvNsOxKVE6VZyIQycSb8M3/LO0bO09wV1Dtq0oA/SpadicZZp+kKTYSMvQyhEtCG6HDwq+f8CkwLG/SAV5oJc6JqCAbqDM2b5UdAIxpUltzZB1pWQ2WCF9woPBHqPnoeFj2PbsLkmCBK6tDJLNCjlAS21RmZrvDrTzrPZGtmnwMiyIJFo19pi3UIox4Q2vxxjqZUA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 61cb76de-7e01-497a-9ef9-08dec6363664
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 14:48:47.7798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rURUZXMsDBSqAnbAHzAM/PhjcRiQA2hBIIosOlTdlmdGyhcbtHi5MwyKIhKAb1mrqfJYWvdRqzei9ZeOiTyXBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8575
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


On 5/27/2026 22:56, Marcin Bernatowicz wrote:
> Replace open-coded timestamp collection with current_timestamp_ns().
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> ---
>   tests/intel/xe_sriov_scheduling.c | 26 +++++++++++++-------------
>   1 file changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
> index 4228eea2d..509d6fd00 100644
> --- a/tests/intel/xe_sriov_scheduling.c
> +++ b/tests/intel/xe_sriov_scheduling.c
> @@ -85,6 +85,15 @@ struct subm_set {
>   	pthread_barrier_t barrier;
>   };
>   
> +static uint64_t current_timestamp_ns(void)
> +{
> +	struct timespec tv;
> +
> +	igt_gettime(&tv);
> +
> +	return tv.tv_sec * (uint64_t)NSEC_PER_SEC + (uint64_t)tv.tv_nsec;
> +}
> +
>   static void subm_init(struct subm *s, int fd, int vf_num, uint64_t addr,
>   		      struct drm_xe_engine_class_instance hwe,
>   		      unsigned int inflight)
> @@ -164,8 +173,6 @@ static void subm_wait_slot(struct subm *s, unsigned int slot, uint64_t abs_timeo
>   
>   static void subm_exec_slot(struct subm *s, unsigned int slot)
>   {
> -	struct timespec tv;
> -
>   	syncobj_reset(s->fd, &s->done_fence[slot], 1);
>   	memset(&s->sync[0], 0, sizeof(s->sync));
>   	s->sync[0].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
> @@ -174,8 +181,7 @@ static void subm_exec_slot(struct subm *s, unsigned int slot)
>   	s->exec.num_syncs = 1;
>   	s->exec.syncs = to_user_pointer(&s->sync[0]);
>   	s->exec.address = s->addr[slot];
> -	igt_gettime(&tv);
> -	s->submit_ts[slot] = (uint64_t)tv.tv_sec * (uint64_t)NSEC_PER_SEC + (uint64_t)tv.tv_nsec;
> +	s->submit_ts[slot] = current_timestamp_ns();
>   	xe_exec(s->fd, &s->exec);
>   }
>   
> @@ -200,12 +206,9 @@ static void subm_exec_loop(struct subm *s, struct subm_stats *stats,
>   {
>   	const unsigned int inflight = s->slots;
>   	unsigned int submitted = 0;
> -	struct timespec tv;
>   	unsigned int i;
>   
> -	igt_gettime(&tv);
> -	stats->start_timestamp =
> -		tv.tv_sec * (uint64_t)NSEC_PER_SEC + tv.tv_nsec;
> +	stats->start_timestamp = current_timestamp_ns();
>   	igt_debug("[%s] start_timestamp: %f\n", s->id, stats->start_timestamp * 1e-9);
>   
>   	/* Prefill */
> @@ -222,9 +225,7 @@ static void subm_exec_loop(struct subm *s, struct subm_stats *stats,
>   		unsigned int slot = i % inflight;
>   
>   		subm_wait_slot(s, slot, INT64_MAX);
> -		igt_gettime(&tv);
> -		stats->complete_ts[i] = (uint64_t)tv.tv_sec * (uint64_t)NSEC_PER_SEC +
> -					(uint64_t)tv.tv_nsec;
> +		stats->complete_ts[i] = current_timestamp_ns();
>   		igt_stats_push(&stats->samples, stats->complete_ts[i] - s->submit_ts[slot]);
>   
>   		if (!subm_is_work_complete(s, slot)) {
> @@ -246,8 +247,7 @@ static void subm_exec_loop(struct subm *s, struct subm_stats *stats,
>   		}
>   	}
>   
> -	igt_gettime(&tv);
> -	stats->end_timestamp = tv.tv_sec * (uint64_t)NSEC_PER_SEC + tv.tv_nsec;
> +	stats->end_timestamp = current_timestamp_ns();
>   	igt_debug("[%s] end_timestamp: %f\n", s->id, stats->end_timestamp * 1e-9);
>   }
>   
