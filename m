Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 835A3C61DE1
	for <igt-dev@archiver.kernel.org>; Sun, 30 Aug 2026 19:40:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B05A10E44C;
	Sun, 30 Aug 2026 19:40:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IP2mBulv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C56110E44C
 for <igt-dev@lists.freedesktop.org>; Sun, 30 Aug 2026 19:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788118795; x=1819654795;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hJSXoa6aMUO/XDwlkldSQRlUDAMLK6mQpgOT2DSv7Yg=;
 b=IP2mBulv98EX3/m/jukpa/i62jDpP4Lv7v0LmWw1jLd7zusPnGQOsE3G
 Yv2oxSTxSzHT38p4YwKmMUDj/ZWvuGw4p1s1qV7GjRWIK4eqKknrLkK0S
 l0SLmbHF0KnmTbJZ5QyGTX8juOaJO3pg99yNv+DoQLvp33qIbY23/Gowb
 SrRsJNNsCzYGsATqgxeLWQiz9SYDV9bbNxkWsJ8ERWm7AwdAPx5oZ6+3P
 xhYYCmcoSixhA37NnvXpwhDomC1rLNFIpiTJltRrG0/NGAYKu7J0WTZCm
 3Hq3xirWj1to1oa6E084VNqM1Y+AxNIcFql1OQdVoh89SEVqBR+Fco53y Q==;
X-CSE-ConnectionGUID: jrQXUg0XSuKdFUj1sqtkYg==
X-CSE-MsgGUID: KB+Loej8RuGuyBFVN+hhHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="99693101"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="99693101"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 12:39:55 -0700
X-CSE-ConnectionGUID: bWxCplDtSrmt13yUTk0Yuw==
X-CSE-MsgGUID: E6sJLA1xTR6IKwxqi9UvLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="269199991"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 12:39:54 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 30 Aug 2026 12:39:54 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 30 Aug 2026 12:39:54 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.51) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 30 Aug 2026 12:39:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MB+r6vD178RTsahiP0Tc3znTEDgHXn1+Uck5pxWXGELyfKRUMYQlnUbU4SCqEeng3CtMmVhoKas3OwIuCydD8hDua9enRdV0eLWn5osT4r30HwOL705m5ENC5PKg15pbQmvhoytGP0rYuYd5eBVr0UghkD7DU0GRC32l5o6ZKJ+SLyhP0Lxsqc9Kg6jO54oamSXySh0Vsk4g5Ig2TubRmXJcxo8+jGogORxFrulkoSn1g7EU3r7AcrHOLwR+pkdpXGuxYnN6gliRUiUeKH3TpoKpAQ2NUl1tv+Ytu5ePks6JK2gwPF68b32UYPf0a27Sn3NxEbl+RwqK1+Ey1gda5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fD0sh+3Atrc0k4EWBsUENDUIGlaAEdUg5zQr1TTrV0c=;
 b=J9vns2clr/YRZR9cGgaOmuunpH24Z3kdfgeF/slldctKlgcvASyYTBG/U17KY+uNmTme8SPV5tTZsu7ScsAc7zVpiVOM6euE2Iql/WnxMiz6+lUvS3+1Aj6gVo4PCOaZuH3C3xBAOQNuttfKdmgNjJwZVJ6/E79X9vUvkF27TECxq6zu3imvtN36DCXS+6Oz8KEIPijm7b6kFCgeUnZpYPdf+h5Tv5wmlqm4Px+Gs9I869ZTDJ+B7ylndnxs3xw+0ffJnahejlDn96c8L53ZPrXucWY0GMTJmOKkiio5z4rM+cKV8coRB75Sqy8Sy7CsoRGwnQobFuCBz0b3LeiTKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4913.namprd11.prod.outlook.com (2603:10b6:303:9f::20)
 by DM3PPF529E923C8.namprd11.prod.outlook.com (2603:10b6:f:fc00::f22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Sun, 30 Aug
 2026 19:39:44 +0000
Received: from CO1PR11MB4913.namprd11.prod.outlook.com
 ([fe80::938d:6d4c:e26f:ed03]) by CO1PR11MB4913.namprd11.prod.outlook.com
 ([fe80::938d:6d4c:e26f:ed03%5]) with mapi id 15.21.0360.008; Sun, 30 Aug 2026
 19:39:44 +0000
Message-ID: <ef627eb6-a33f-4066-bc96-2629f6ee395a@intel.com>
Date: Mon, 31 Aug 2026 01:09:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 15/17] tests/kms_ccs: limit #outputs tested
 during suspend
To: =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <nemesa.garg@intel.com>, <karthik.b.s@intel.com>
References: <20260821124834.1974029-1-michal.grzelak@intel.com>
 <20260821124834.1974029-16-michal.grzelak@intel.com>
Content-Language: en-GB
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <20260821124834.1974029-16-michal.grzelak@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0166.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::9) To CO1PR11MB4913.namprd11.prod.outlook.com
 (2603:10b6:303:9f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4913:EE_|DM3PPF529E923C8:EE_
X-MS-Office365-Filtering-Correlation-Id: 5134cff9-4135-4738-9eb8-08df06ce70fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|11063799006|4143699003|6133799003|56012099006|10067099003|5023799004|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: f/lXpWAYAWrXm+pbNLPoo7cyYeaZCg+2G2Ds2jXvlNsnhw1YNM82EfFzlrVdQUpzK36PflhJXhwNrAMy75QQvrYe6JFzE1ulogu9CDfOobfPFSCsSOkFyloLw5lQIE9iz2ec1jSiTFVczPueDZn7g+4Eq4YyE+maM2OM4MfQhLkD7evEoVUkf7ZXCGskpkVK2Olfh/P3iHlHxpjxGf473ff3hkz0jhND/1rF4DKbvCI2IIsLu4jG9Iaf6HN6NyHLQlJ7KEpCem//1xQAi9aB3QKTU7DRIjgIBzL0Oz4sCuTyQqZSzi+BxawQ7k8O9Yonwyl5K3jwzhU+EGjL5DOJqtNHQGNuwSPaDx4WtW2f5ohBEzgfV1C2Bv5CWffeWp5iN4bJlA32cSvnTDyM5+O6F/3fHY6ooYLNyMl1pMtYiR3f9P0BAJZ5tBzBjWsh/jlBIowDrud7Cv10ONqiKEukDgRtFWLR3A3OEIrIz0i1UFIyMwH9fpiXqJf9SBcTnWQJdgtM8Xx2EklvlLvm13fmBolRjZv01jtguJHyQHhx2NI7ISXnHMa5n3JcJDjgMGemkOMv3N+zPJa+6tJZARUaqLINtQeUi9yi7k0VEzsCnU8npxcT5+8kPUDQ9ph7AHVaC9OwtRgwCTKmzyeEA8TDd41hC/MafZlP1mvFFWg5Jls=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4913.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(11063799006)(4143699003)(6133799003)(56012099006)(10067099003)(5023799004)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTM5L21Ec2xwTDlhRDdhSTNVNHVBemNzaU4rcFdkKzZtTUI5VFF6SFA2VWp1?=
 =?utf-8?B?Z3VIWXNBODhyWit4L0VrUHROTXNMZm5WWmtDRVV6OVNXL1UvQTRDQXRZKyti?=
 =?utf-8?B?Mjk1OEd6QXVpbnN1Rmtpamg4cGo5dGJ5c2ZnQk9KeFE5MTBZR05nYjZiclhD?=
 =?utf-8?B?aWdFU29JVVBsdmVrQVhuZERVVURHYk5xQ0VpMWZZNzF1L1lGT1F6VjNCWUtq?=
 =?utf-8?B?VmV4dDZIMHJ0UGNLQnl4eGIyVUplN3BtdTIyOGV5QVFHbnE0UngrZklyTzh5?=
 =?utf-8?B?d2VOZ0pud1F1QjJiR2h6NjFUdWljTitqOXFDVFdtWE4ya3plK3docDdHTWRT?=
 =?utf-8?B?TllvTTdKazF3aEp6MnM5ajkwdWEyRmJ3RXAxK3N1bThvMjJFS0dVNm8xUlU3?=
 =?utf-8?B?L2JwaEwzRFB3b2NFTlZIc2M1cFRYeW9rUzAvN29ONFBkK3AwUTlYRXZyd1Zv?=
 =?utf-8?B?OHdabGk2L2FXZ2Y3MmQvL1B6dmdaSnB6cXplYXdlQ2hkTVNmZ2srdUM4aWZV?=
 =?utf-8?B?L0podlZLSWNOVUVRRGVqSmJjQUVhTWFlQ004UW1UQ0NjdThRU2YzaWVhdVhQ?=
 =?utf-8?B?dTh3a3B1eGpjT3oxNXdYdjVzMG1UejBFQmkwb1YrVUpaeUg3SXFyMTVDZFdi?=
 =?utf-8?B?c09PS0I5c0prcG1YcXBGa2tBblljeTlndHE3QnlMeHlwRk5qdEI4YlZldTJu?=
 =?utf-8?B?dTdmOVFGQXdCMVZmV3J2RFJsZ29JdVZJeGtWS0V5bzc4MnRRM0JzRUJoQXlJ?=
 =?utf-8?B?VG1IY252NGx4T0pEMDZwMFdmZDBoZnk3M1h4cUlRR3NjanE2cERLQjhYVHl0?=
 =?utf-8?B?OUNaV1BQOVVtVTVaZlJScnlFazdaVDA5SHZCbjVNbHRCcWpsS3A0SEZmZURt?=
 =?utf-8?B?TGtUNVlKYnpNS3dYbkdqNWZxOGUxVXJETjlON01ORzFDeVlCN1ZVVm8zUHQr?=
 =?utf-8?B?cS9SZHpMUWxRdjVYTFdNK2pBRGtGam9kZlpkR2tIalVLblJCZmdUaDJ4ek16?=
 =?utf-8?B?Y3FDOHUvR09TaVl5RitMZHdXbkxjMjBLSkRLamwzRjB5SmozdXh2K0wzOGs2?=
 =?utf-8?B?b2dUeWtCdlg0ZklreEF2ZFBFME1iQS9QamNacmRVelFvTnNJcEoxSDB4dWZW?=
 =?utf-8?B?Qi9KQTBVNkJIRUZRY3l3M0o4T013Z0FTT05zV3RJbzJONEtrYWkvbkppNWQ0?=
 =?utf-8?B?bFZ5M3RLWUt1amplOUtaQnByTkw0R0dzVmRDSkNGT090a3ZKbU81Q0UxdXZ3?=
 =?utf-8?B?dHZZU1BFa3hGaGlvT1A3Wm90QmJscExpWHFsM1RBNDZ6dXNrYnlvd2lTTytp?=
 =?utf-8?B?VGo1OVhPSzc5UkppV3pVMWhVdHZaZWp4M1ZCSFo2cHpFQkQ0YUppazloWEIy?=
 =?utf-8?B?WjNLaVo5bmkzckIyaDh1dXQvK1FRL3Fmay91QnRjL3dTTjdlcnB2OS9BdlpC?=
 =?utf-8?B?YXU5cTFhcXhMblhBTnFWcVkycWtKWEZXdDM3WEFpODJzK3JtVmwydmZnWTg4?=
 =?utf-8?B?VVBzTGhwK3ZlaHQrNVV4Rk1rS01KdG9XNWp5Q1lqTmxtZGQwdjVhTStMY3A3?=
 =?utf-8?B?dkVqR0lLUWZwVWgrYzNLYTZoY0c5TC9wcWZZd0hIR01pK3FoRGlzSlh5N0Fx?=
 =?utf-8?B?ckFCWkd2akxkSjgxVUE2RGtwTitTVzNVd2xmdlM4aXJrZlhoQkJpdkhwYVdR?=
 =?utf-8?B?Uzl0L3dOSlNhR1dwU3RGMklXNUdhd2hubHgrZzd5OHhKa3AxQ21FakxpcFQv?=
 =?utf-8?B?Q0hoQTlyQWd1TEkxbjdsdkxUWklYZ09tMEJQMjR6ZmN0blZ5bGgzUnc4cHdS?=
 =?utf-8?B?OVJISk5na1BIUHFqQWdZUUNpcWMwVUlWUWRvQnFDT3JNYXZMWmNqWFBWNlUv?=
 =?utf-8?B?SHF3b3dVZXhXYU04NVZtZUpGVFg0ZlVRajJSTUt1NU01VmJoY013a081a05t?=
 =?utf-8?B?bHBXcEovY1laVjN5aS9Zck5SRno0Uk1ONjlhTHdMcS9ZZlpWWE03eWJPRnRR?=
 =?utf-8?B?L0s3RlBGUG02S2lTbzZvVzc4N3lMZ0lqMm1JRk1MREU1RnhGTDd2dkFMMFFB?=
 =?utf-8?B?bUlZZ1I2dU5vbGNIK2JyY1E1UHlXbmlzMkhWRTVhWTlIaGw4ODViK3Q1RDNU?=
 =?utf-8?B?VmIwYVBzeFZqYjc5S2ZHQjZYVWRQOFZtZGQwRmxmRmZqOXhCakgxTlQ4R2VL?=
 =?utf-8?B?NUVsenVaZDdqSWdLRVYrMlBmWnREK2puRitXWkhhVkp3RngxWkkwdzc2S1lW?=
 =?utf-8?B?WW9ZRFFZcFVpNHljTTdhTVFpY2VUalhUaFRjajdLSG1HWUVLZmU3MXc5WGd5?=
 =?utf-8?B?bTRBTy9NaCsweFlPcGhmSTBYd1psSEdoS2J5bEF2eU04YmNseDk3V1RKdmV6?=
 =?utf-8?Q?VS0gD2KIXtozls5M=3D?=
X-Exchange-RoutingPolicyChecked: INOI6zUqSPDnhFFdSph1f4dqy4eKzUJt0tdhWaJs97LW4iECmq1TD4tDFz2JyJkaX8XtbD0MCDYn70Rb/rGkgHtG8Q9Y5xot4VjzVPeUB3N1jO4lnlBQTnR0AMC8lxOunRHvX2IHO8Axl9Sntip1D3Y8BC5g/QC65hCRbtJusfcnXTt6vJWrRqQtByL5VbgBk5J1UWDU2BnxmMX+b2i3nYEs9b8p7wdPa4Q+FJE98srIt35AlK0jSrER0cnr50GdAttFB58W00ihYFSnRbXtWQ/xrpXQoWMVeD3CDpz5EFlXpB8d272JrO8o4izxLoy6exoljwn6gk3Rx1h1XaZM1Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5134cff9-4135-4738-9eb8-08df06ce70fc
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4913.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2026 19:39:43.9753 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nCmGeN7JsiKQ4ncjSS/BQV7GBKU4udvdMcigWagh9e0ajKcf7DKDGkdI3oNHS8IJ/dCYzCzbvEOtSLwPNHvqV7KmxiSwF/v6I2q67DSjmzM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF529E923C8
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


On 21-08-2026 06:18 pm, Michał Grzelak wrote:
> Each suspend test is executed per output. Limit number of outputs tested
> to 3 by default. Add command-line option enabling execution on every
> output.
-->any reason setting to 3 outputs?
> v1->v2
> - fix off-by-one error
>
> Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
> ---
>   tests/intel/kms_ccs.c | 16 +++++++++++++++-
>   1 file changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
> index 9ac0ac8e2b..11bc30769c 100644
> --- a/tests/intel/kms_ccs.c
> +++ b/tests/intel/kms_ccs.c
> @@ -141,6 +141,8 @@
>    * @yf-tiled-ccs:              YF tiled ccs
>    */
>   
> +#define OUTPUT_LIMIT 3
> +
>   #define SDR_PLANE_BASE	3
>   
>   IGT_TEST_DESCRIPTION("Test render compression (RC), in which the main surface "
> @@ -188,6 +190,7 @@ typedef struct {
>   	enum igt_commit_style commit;
>   	int fb_list_length;
>   	bool do_hibernate;
> +	bool all_outputs;
>   	struct {
>   		struct igt_fb fb;
>   		int width, height;
> @@ -1128,6 +1131,7 @@ static void test_output(data_t *data, const int testnum)
>   {
>   	igt_crtc_t *crtc;
>   	uint16_t dev_id;
> +	int output_count = 0;
-->IMO: Seems output never reset between modifiers iterations, check this..
>   
>   	igt_fixture()
>   		dev_id = intel_get_drm_devid(data->drm_fd);
> @@ -1153,6 +1157,12 @@ static void test_output(data_t *data, const int testnum)
>   			}
>   
>   			for_each_connected_output(&data->display, data->output) {
> +				if (!data->all_outputs && (data->flags & TEST_SUSPEND) &&
> +				    output_count >= OUTPUT_LIMIT)
> +					continue;
> +
> +				output_count++;
> +
>   				for_each_crtc(&data->display, crtc) {
>   					if (!igt_crtc_connector_valid(crtc, data->output))
>   						continue;
> @@ -1221,6 +1231,9 @@ static int opt_handler(int opt, int opt_index, void *opt_data)
>   	case 'r':
>   		data->do_hibernate = true;
>   		break;
> +	case 'n':
> +		data->all_outputs = true;
> +		break;
>   	default:
>   		return IGT_OPT_HANDLER_ERROR;
>   	}
> @@ -1234,9 +1247,10 @@ static const char *help_str =
>   "  -c\t\tCheck the presence of compression meta-data\n"
>   "  -s <seed>\tSeed for random number generator\n"
>   "  -r\t\tOn suspend test do full hibernate with reboot\n"
> +"  -n\t\tRun on all connectors. (By default suspend subtests will run on 2 connectors)\n"
IMO: this should be 3 connectors as per description.
>   ;
>   
> -int igt_main_args("csr:", NULL, help_str, opt_handler, &data)
> +int igt_main_args("csrn:", NULL, help_str, opt_handler, &data)
>   {
>   	igt_fixture() {
>   		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
