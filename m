Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A0BC43458
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jul 2026 08:22:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 488F610E804;
	Mon, 13 Jul 2026 08:22:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kkxq9quZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5229410E396
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jul 2026 08:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783930933; x=1815466933;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=6sDzX/+rRal6vdwscaacf2E76zb5zk9AQIQXrSduDZo=;
 b=Kkxq9quZRorayuRkjTl4oSMTVpv5FVWfNoFeB7TKqAEIiYeXjuN/3NrH
 SRcek4KBcW5CnX8hXl+8i2TJKYHSPs5vW1OaU7oo4q6CJfrr1Qb/Ts073
 9wM9BwOfLa9ScBqxycfnL6ZfWWumHLoQFJSMTni1f4Je1FBfZr3KPziv9
 6KLoWs+UwkAi5m/1dGXIMPud30VFR1xy4a40zRzQWf9C6eeMycKxIx6tY
 F6wDdwxx+4Q+kFfp0CHXPfONlZgPuoK08F7GAsgS9kSXpjwg02UYC7Xx6
 hqHaj0qfUjwP2fugNPUxk3k81YeNusY5mZmZh+TOOurTBRADFEggn98Xf g==;
X-CSE-ConnectionGUID: ejZRc5OKTkaxkbH4SM7zyA==
X-CSE-MsgGUID: A0aA4rMqT3W31oFf4UM0Uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83511823"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="83511823"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 01:22:12 -0700
X-CSE-ConnectionGUID: jE9ZDzHXTqiCWQZpuNOg3g==
X-CSE-MsgGUID: ZpWs0ErNTXGSuffsnK5C3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="255559266"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 01:22:12 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 13 Jul 2026 01:22:11 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 13 Jul 2026 01:22:11 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.59) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 13 Jul 2026 01:22:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZVy88lEHeyB2lZHdZ7IyJp76h6PQDXyCBK9v5Tv1CObIWD/ab7SwLdFOxN0UnSt6Vxojuk6bVj77/u2enWcYqvJzmxpQ681jCj/8W4+8jnxnXu8ZNvpbaErN/st1OSwmbIoD9MH2n2H/HrCyL13HM9I0yGTgwKFz4s5aVemtGhn6B15QKBr7TMVe4Tn+wY8NyNUA8bRVoRPOL2FcDwEXNiUZs8GMGkck2kqKWIAJlBsONXQH43Mj0XiZ3Nh8bM5+UqZpIOcJGtl0IyMUCeIwhPRg6qzUGyJyqLePepJ46N5Q/JMv7fNENOQYM/7yBUt1CUNlPgF7uYdHo49wTaW6og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/GF1qg42gb3oEUtFKu5VX/hEX+8oGyO5tbsP7hNwpP8=;
 b=Ce1oN2BlblaifUbUJVIaBeBRtc42IA/IRk/IUDuAg1tmqo8Qc19tHeEUw87MordohA4Y/wjpSV6mEVl5bPXmZjdFMNzc6QWfl7p1wC64f9x2NyOqjRGlhv4h2qAq79FCAgWsTnX6qhMa5nSCiHOdqsmXk2D5FBCSUdaJef7pbwRq/e4Yi0nr9YKA31IOErfgRdqVEh7qpS6F7Rc7AxpD5JuD35c3bT7L2YPfDaV+Us5Nc3L+kJsCtTtnd6I/Ek9/Omu8rT6ZPY+xR5usxRhfgpo+yYFg90FYLdg7bjJibZAETVZTkPLQhfIa9YfHERXt2lgO3Hc+j8On550nr8YMfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7183.namprd11.prod.outlook.com (2603:10b6:8:111::10)
 by DS0PR11MB7407.namprd11.prod.outlook.com (2603:10b6:8:135::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 08:22:06 +0000
Received: from DM4PR11MB7183.namprd11.prod.outlook.com
 ([fe80::d9c7:d2fb:680d:1ee1]) by DM4PR11MB7183.namprd11.prod.outlook.com
 ([fe80::d9c7:d2fb:680d:1ee1%5]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 08:22:05 +0000
Message-ID: <b34acc81-0d7c-4e36-bfe1-2d9b1b77db35@intel.com>
Date: Mon, 13 Jul 2026 13:51:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_pm_dc: Add test to validate YUV420
 with DC3CO
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260707052028.4022700-1-jeevan.b@intel.com>
Content-Language: en-US
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
In-Reply-To: <20260707052028.4022700-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0074.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::15) To DM4PR11MB7183.namprd11.prod.outlook.com
 (2603:10b6:8:111::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7183:EE_|DS0PR11MB7407:EE_
X-MS-Office365-Filtering-Correlation-Id: 30ad5f8f-47f8-46d2-2d3d-08dee0b7d2d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|18002099003|22082099003|3023799007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: POKjMdu4ZY9nVoiIFNQS13bNTtlMpJRX1goy37XOgLpPdV3Bi87DneIE8CIIV8p+Y8zG0PYvcqtKjUl3fs9a/4DbzovZ1zWcQzIh/LUiJpW4oIFNUPR8DHTrX2dHJvaAIknEjP+JmjyiwrV6iS4XWF+AFQBYusCNFo4Gw5dD25JYBXWed0fs3NUvQpY3HgkuF+rTneyAsJ1dcildaEhmzwLlzFDW7VZbBX4vOPv2PyndKkLEjtHTDwZhYt0IPeHsN/NsKYbVhytEGZ5Vste5u5WcxYmp6lDFoXJ9lx+jqT4/tmrhDupRoV4fsbA30Kaw8Wlw6YTyK9Z55S97aMcLPxV7yCsDZNxJSn2QLe0oOoRu2gW0sMLD7mMKpTubDtIBe7xb1+khigD+WdmxPYNIZibuT5oOcclJEYpAtmgJ5+o+sy0bIJFM8+BGu85DMqehQus1yhgPnCci+uDVGBW5W4zqG+C1fp7zFZbAjOgDg/RhaxsiTkW8lpxE2HqXmklW8T+k7DftdPmSbehJRKgouQp1kleap/j4xXrVjQoORaNyYlkBtN77MdWBIdxjL9aWfnzPcJgUctjAhRPEav7Bdx32SE67qHrDxoMMHlnNpgf/LISErFDsYS/wWeUHeaNzl/MMlhQMg8E6nmdECf80GsgO461KxRXSTp2snFTWmiE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7183.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aExpOU1FL3cxSzh4SVlJY2FrYStIRkRuNmlmWVFIV0d5MTlmUUp6WTN4OFdq?=
 =?utf-8?B?V2NsSTBYaFBydU40Rm9rUmVBZkdkaTEvOVY2ckRnb3daRk9DRlVaL3g1WHNQ?=
 =?utf-8?B?aVgwUWFVOHJieFlVV0x2L1Z4TzZXZ3Q0M01uTnBScjlTb0tZZHUrQ080RVdC?=
 =?utf-8?B?b1dLaTNxK0VQRjN6SlRlOHpQZDB0SkxXZkZETU1IWGltTldvd1VZWDVtbDZO?=
 =?utf-8?B?dGd1UkJKM3haWXdaWndUc1FsYUFobFpyTWpaUGRIcFJEOEo1OTNoWUNXdUFp?=
 =?utf-8?B?TzdMWmR3N3ZYcmpMbmxVRmpKaVBvbnhkQXYySlR6ZThmUXhUalNnaU40eXpP?=
 =?utf-8?B?VDA0S2VXMUZCbjhXbStQVVlTUUhSYWR4MUNSSG85SmtHNUZUaHk3aDVvNE5H?=
 =?utf-8?B?YWUwWXUzNDNNK1hPTTI4M0ZwQTFCVWFaQXZFandCZFRZLy9GSkluMHJqNnFH?=
 =?utf-8?B?UU8yZEdyT0N0T3dCODV2UUlGaHpvdDcwWU1Ta253N29qblhMY3Fpd3hQTUEy?=
 =?utf-8?B?SWp0NXZTa0NPRDA1engxUHJnRzRXdE50YTFVeGdHUUo5UG00bklmWTRLUTRm?=
 =?utf-8?B?VG1sTmc1UHcwQ01XZlVqVjJJaG0vTFZUaUtWVVRiODF3V2Vla3NRekw2RWE2?=
 =?utf-8?B?UTlucmN6Qk1oTUZ6OVkrdGlzQ2p0MlBZcC8xdVZ0Q2EwblJUeGZ3RFJrUFg1?=
 =?utf-8?B?c3ZiYkxEbmN1WUdYb1VCMEtmRXJrdnFPeTRNUGhyMlVUNUdRSlFOVmVQTkVP?=
 =?utf-8?B?VHBERTk1OHJBKzgyZG1MejlRYzc5ZXhnS2NlbXFmZHpGRlNFRldqbW9FVFdo?=
 =?utf-8?B?NXpCbHZ6MzRURm1NUUpwYzhkWURiWG1Za2d1VGtCd2JmQWNYVEhlL3luNVVO?=
 =?utf-8?B?MW1HT05WRmJEYW5yc2Z6dVRGUncrR0xqdmFzYmVOcytVT0xHWVdXUzkyeXBa?=
 =?utf-8?B?R2IxVWtrOHA2OEJZeWZLZHBaQVIrVjlSMDZOSlU4ZmVvTXlodEk5MzRLaVk0?=
 =?utf-8?B?Q1NvTlBVOGhlcVhiMlNPSkRDQjRBMVNBUzR0NC83OEtLc0FEVEJ2SnZnYkJE?=
 =?utf-8?B?MDJEYU1ERnJDOFZ2MXZJWFd0My9JM1JidnhzZUZyU0lIU092R2R5eTUxcUts?=
 =?utf-8?B?VUJIWW9qQnBubVhLTm5YZ1pwdWNCVE1WYkZoUFNMck9YWEpOODU4ckZaQm5j?=
 =?utf-8?B?NGllZmVJWXBFSm5JREFtZk5JZVk0RGZmcnYzNnBWNTRiTUR6YkhueG84NmJs?=
 =?utf-8?B?RnFUa2RzRFVqSmx6dHBRaVpXTjEvUHRmdGwzd1NqTFBOSFhRSDdjaTgzRXpL?=
 =?utf-8?B?Rm5TY0Rlc1RPdTBtM0JxZUd3dHp4L3hmSlliSDA0N3NzV3dJUVBNZGl1K05q?=
 =?utf-8?B?RUhWT050aktkT1Vpa1VndldPK09RQmkzTnZyUGlGUGJtZ2Y3RXFvYWNCNWJU?=
 =?utf-8?B?WkdxelA3WEsrNVZzdUF2WFRmcyswcjJObDVIcy9TbnV5aWxXWmh3UG00M2M1?=
 =?utf-8?B?L09XRFI3STJETmUzenBDby90R0NiVVJzdXFzTEhMeU0yQ2xUYTFzQjVYdDQz?=
 =?utf-8?B?WUVLcCt0amgrZ1hpVzJqVmVDaUt3MnRRWVdQYnJEdGx1Y0xXb1RBV0dqajRt?=
 =?utf-8?B?eE5PcEpWd3RhSFYyVVFvQm9WUHNibXhJRlBYb3Nla1RVRGJ5MWpZVzNrVUtl?=
 =?utf-8?B?Zy9Qc0o5NktNRENTa1diWVJOUS9YdVhwQmkxZEJhTWJCYVhYVDl2MGJId1Uv?=
 =?utf-8?B?Yk1vZjdDeThTVEtGZWdkd1NRb2NTbWd2aGlnU2NJYXJDT0xmWXU5NzlFYXF1?=
 =?utf-8?B?cDQzbHRyQWJQQUx1dmJHaVZLc082dWN6SFNoQ2Ixc29LTTMyM2dNS3AvOW5y?=
 =?utf-8?B?U2QzbGlPNUdNSWFOVDBCK3VwMWtDRTdvSGNNMFB4dkF1eVVoUHo2c3F3aTJB?=
 =?utf-8?B?Qko1aFdMNkZiZGNOOU9mQmpsTjlEckRsYm4zZHZYV01QK211K2lUcjByS2Jm?=
 =?utf-8?B?ZVhEcnNwQi9OQ0N1clhORHhtQTlTMC92L3pacGh1OWNnVEUrY1BnT0R3MzV0?=
 =?utf-8?B?NGROM080Q2lUTnY3TFFlWE4xT09WTXcxWXozbkNlM2RJUlFWcXZySG5nb1U4?=
 =?utf-8?B?RUd5RjhrTEJoZFg4TEJ0Q2ZuaWlUNzlkc2YxSlVRWnd0ZThBYmhNVnFJNWxa?=
 =?utf-8?B?SjcxZnpOcEo5amh1NlJuOWRRT2UxNDYyZmtwR3VWZFFaK1AyL01QT0lkbDJK?=
 =?utf-8?B?b3oyWkc1QXR3UHVOYlZEMGRwdEJDVTdzeFpySEtNZTNVdktQTFA5eVVjVERW?=
 =?utf-8?B?eERjQ3E4NFFPaWZSQkRySlRJVEhVclR2dHFCa2xTQ2JGMDk2elVuaFptNm1v?=
 =?utf-8?Q?thFPeCc2QHuEPQf/wcrtflreggXSZeuJQH1gN?=
X-Exchange-RoutingPolicyChecked: AipJHrpfCpkaHvuZRdazoeqO3L0UP0y7AeGdD9m+lhpValw4RCUiUhhuzB03OACQHW80uHbzgxBXUYZ6tp1Lv7/AvFBFxTT3yEE3qrWab+Nt8rxqDexoftz+TtuCSBjNrZm4PU9Ek3jHiGzU0LwFwxsxhYsQdezZxNPXrU4rszyZ6GGBQbPgb9OdixCC66TRHPU5L43+SE5sM3DRmS4aiPMsPpWXmDeus00OSqK4xGQeEVBTAJSdnCsgHYZKNab0f9m4A+PyjpeiNgZVNeXhsJGXMpJvAPgJlnlt0D3c0nTCf7BJGGIX14npitCxik2r6OYMyRiZqLs7GadxnDOu8g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 30ad5f8f-47f8-46d2-2d3d-08dee0b7d2d7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7183.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 08:22:05.8184 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ry/VALv3x09wGySKEhxBwtbh6qYg01iWqHr2SXIw0LzORTLP/UV71x4tG1BRV1qkVUfeMfeEwAcZtCglQ+kXeuYFgXOqNvpFMcYmyf0NtokgfO0mDS1c/MVYyzaCwhs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7407
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

On 7/7/2026 10:50 AM, Jeevan B wrote:
> Add a new validation test to ensure YUV420 works correctly when
> DC3CO is enabled.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/intel/kms_pm_dc.c | 35 ++++++++++++++++++++++++++++-------
>   1 file changed, 28 insertions(+), 7 deletions(-)
>
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index ef53c5f96..db2601ac7 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -125,6 +125,7 @@ typedef struct {
>   	igt_display_t display;
>   	struct igt_fb fb_white, fb_rgb, fb_rgr;
>   	enum psr_mode op_psr_mode;
> +	uint32_t dc3co_fb_format;
>   	drmModeModeInfo *mode;
>   	igt_output_t *output;
>   	bool runtime_suspend_disabled;
> @@ -275,7 +276,7 @@ static void create_color_fb(data_t *data, igt_fb_t *fb, color_t *fb_color)
>   	fb_id = igt_create_fb(data->drm_fd,
>   			      data->mode->hdisplay,
>   			      data->mode->vdisplay,
> -			      DRM_FORMAT_XRGB8888,
> +			      data->dc3co_fb_format,
>   			      DRM_FORMAT_MOD_LINEAR,
>   			      fb);
>   	igt_assert(fb_id);
> @@ -300,6 +301,15 @@ static void assert_dc_counter_negative(data_t *data, int dc_flag, uint32_t prev_
>   
>   static void setup_videoplayback(data_t *data)
>   {
> +	igt_plane_t *primary;
> +
> +	primary = igt_output_get_plane_type(data->output,
> +					    DRM_PLANE_TYPE_PRIMARY);
> +	igt_require_f(igt_plane_has_format_mod(primary, data->dc3co_fb_format,
> +					       DRM_FORMAT_MOD_LINEAR),
> +					       "Primary plane does not support format %s\n",
> +					       igt_format_str(data->dc3co_fb_format));
> +
>   	color_t red_green_blue[] = {
>   		{ 1.0, 0.0, 0.0 },
>   		{ 0.0, 1.0, 0.0 },
> @@ -879,14 +889,20 @@ int igt_main()
>   	igt_describe("In this test we make sure that system enters DC3CO "
>   		     "when PSR2 or PR is active and system is in SLEEP state");
>   	igt_subtest_with_dynamic("dc3co-vpb-simulation") {
> -		static const struct dc3co_test_mode dc3co_modes[] = {
> -			{ PSR_MODE_2, "psr2" },
> -			{ PR_MODE,    "pr"   },
> +		static const struct {
> +			enum psr_mode mode;
> +			uint32_t fb_format;
> +			const char *name;
> +		} dc3co_cases[] = {
> +			{ PSR_MODE_2, DRM_FORMAT_XRGB8888, "psr2-xrgb8888" },
> +			{ PR_MODE,    DRM_FORMAT_XRGB8888, "pr-xrgb8888" },
> +			{ PSR_MODE_2, DRM_FORMAT_NV12,     "psr2-yuv420" },
>   		};
>   
> -		for (int i = 0; i < ARRAY_SIZE(dc3co_modes); i++) {
> -			const char *name = dc3co_modes[i].name;
> -			data.op_psr_mode = dc3co_modes[i].mode;
> +		for (int i = 0; i < ARRAY_SIZE(dc3co_cases); i++) {
> +			const char *name = dc3co_cases[i].name;
> +			data.op_psr_mode = dc3co_cases[i].mode;
> +			data.dc3co_fb_format = dc3co_cases[i].fb_format;

YUV420 is only tested fordc3co-vpb-simulation.
Is it possible to test it in other subtests as well?

>   
>   			igt_dynamic_f("%s", name) {
>   				igt_require_f(intel_display_ver(data.devid) >= 35,
> @@ -913,6 +929,7 @@ int igt_main()
>   		for (int i = 0; i < ARRAY_SIZE(dc3co_modes); i++) {
>   			const char *name = dc3co_modes[i].name;
>   			data.op_psr_mode = dc3co_modes[i].mode;
> +			data.dc3co_fb_format = DRM_FORMAT_XRGB8888;
>   
>   			igt_dynamic_f("%s", name) {
>   				igt_require_f(intel_display_ver(data.devid) >= 35,
> @@ -942,6 +959,7 @@ int igt_main()
>   		for (int i = 0; i < ARRAY_SIZE(dc3co_modes); i++) {
>   			const char *name = dc3co_modes[i].name;
>   			data.op_psr_mode = dc3co_modes[i].mode;
> +			data.dc3co_fb_format = DRM_FORMAT_XRGB8888;
>   
>   			igt_dynamic_f("%s", name) {
>   				igt_require_f(intel_display_ver(data.devid) >= 35,
> @@ -968,6 +986,7 @@ int igt_main()
>   		for (int i = 0; i < ARRAY_SIZE(dc3co_modes); i++) {
>   			const char *name = dc3co_modes[i].name;
>   			data.op_psr_mode = dc3co_modes[i].mode;
> +			data.dc3co_fb_format = DRM_FORMAT_XRGB8888;
>   
>   			igt_dynamic_f("%s", name) {
>   				igt_require_f(intel_display_ver(data.devid) >= 35,
> @@ -1011,6 +1030,7 @@ int igt_main()
>   		igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
>   			      "PC8+ residencies not supported\n");
>   		igt_require(intel_display_ver(data.devid) >= 20);
> +		data.dc3co_fb_format = DRM_FORMAT_XRGB8888;
>   		test_deep_pkgc_state(&data);
>   	}
>   
> @@ -1039,6 +1059,7 @@ int igt_main()
>   		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
>   					     PSR_MODE_1, NULL));
>   		data.op_psr_mode = PSR_MODE_1;
> +		data.dc3co_fb_format = DRM_FORMAT_XRGB8888;
>   		psr_enable(data.drm_fd, data.debugfs_fd, data.op_psr_mode, NULL);
>   		igt_require(!psr_disabled_check(data.debugfs_fd));
>   		test_dc5_pageflip_negative(&data, IGT_INTEL_CHECK_DC5);

