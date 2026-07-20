Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA1A7C4451B
	for <igt-dev@archiver.kernel.org>; Mon, 20 Jul 2026 06:27:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 668DB10E6A3;
	Mon, 20 Jul 2026 06:27:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kOLXltym";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8761F10E698
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jul 2026 06:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784528849; x=1816064849;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GS6oJGyZ5lnpPBphpmf/dtYJtzVz34AjoUcI7zaTMRs=;
 b=kOLXltymGWEiSAYAR1QSX39eOhCGNiF4pPQIk9ZRuZgJ6XDWOPUm5/q0
 iYdPe17g8kbXy3wN6eyGFUsEc4mFO3o0nihJivPmo1KSl/B2/w7IbzShD
 hwHofxPHnpceJYMwnCNJnSqNL2IwQc3C5tTfBXDx8jniBvSCisJoIjTkv
 yjQU/1GE6fDVi8Y6WmV6Pyudjh16bKrG7cxdromHHJ/b2fZDyrG92mPPh
 Qz2MaV6qNZLc/X988ZGg1+ykgGbMy1ciPxjG36AhMWEGZyxxvxbtjldVO
 zwBOS8WP97H9A7x1Rgy0O1aVH2R2Oe8EltOQOy7c0+M1vpPol1fGeMszs Q==;
X-CSE-ConnectionGUID: HChXX8HWSWqdUD31OBts7A==
X-CSE-MsgGUID: ELe+SFfISgyYOtAPW/QsQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="96467503"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="96467503"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2026 23:27:28 -0700
X-CSE-ConnectionGUID: BC3/7usXTMukT5ByIPKElA==
X-CSE-MsgGUID: PeXIIsJRSCSHtQR6Nwyidw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="295573291"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2026 23:27:28 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 19 Jul 2026 23:27:27 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Sun, 19 Jul 2026 23:27:27 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.14) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 19 Jul 2026 23:27:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iq6HfJ6xqQUpBiRF2EVRDCTzp/SPeIgzkNQeKetky1uFGKfRXVaK4RaQOVwNliUQ3e4/umw8Uzh9jD0W096+0jrUO6O8BMqFRgxVfWk+4QHStvigO8XZng9jrJRvKYmr/WzOkuQK/Lp7Du+tY/ucNrbBPy53WCvK75KfAmXa/GXM2B4UQXDBhDhV6+SYXHFRqwmLcwAzp9TYZjgLcNV6NycJkgrPQc/Wer5rzp1h8/V4RNxaj8Q8CGcsy8cBthBgZ/xFO2fvDRjouePy9/sHxtgrDl6XJXuWeQuhfZ+DVkqUzYCvBDtmQylohD6KBCQvqBMzoLayT9awyrdDtvuyvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gLWAUsKzSQ0wuTlxZovbMVsLFn3Sf23uDkx1NqwbgyQ=;
 b=TZpyIDtHCzEN1TASXpbEjRW1gDAAKgwmErbdVg/h0ptzGFGb+qD55rjP7mJMI6Sig0gIKklmWpBaeYmLVUZH5Vk1CEUry2/n9BajIRL8GVyuQ/FgTsopQxSELWnXXZfI0gyYtnwrw8/8NlL4CZVSsMa9Hl2IFHwXNleoi8fRKHMVDr9zN82OJAIatGqcqkBXh9Ro6sqiQWcrDOY2W7x6alj+K0fIRnMTPHpJgWIXXlI7gisQ8sHzCuZiDEPPSTR2I8DWLS3vrcIDT/KQmw39Yqf3g2VcCZwzpvv2BkvNy+fy82UjxbN7V6Eq51qGyoieWo5ZzZ5g6t1orWc9tREwNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by SJ0PR11MB4957.namprd11.prod.outlook.com (2603:10b6:a03:2df::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.16; Mon, 20 Jul
 2026 06:27:19 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0223.013; Mon, 20 Jul 2026
 06:27:19 +0000
Date: Mon, 20 Jul 2026 06:27:08 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v3 17/31] tools/intel_error_decode: link with
 minimal sub-libraries
Message-ID: <csksq542cd62jji2in3lkcmag2umillrttz6p7vgpo2yinct4m@qwm5vfz7pgsc>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1784117512.git.sebastian.brzezinka@intel.com>
 <d67b2dfd656e75571edcd45e17ee1507edc9fb7b.1784117512.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <d67b2dfd656e75571edcd45e17ee1507edc9fb7b.1784117512.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: TL2P290CA0021.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::15) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|SJ0PR11MB4957:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bb86d0e-de4e-4a7b-b69c-08dee627f32b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|6133799003|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: J8oFR8O4sNGLnyCqc4uSCwiVdDVXlkx4Bb2+tyu5GvmGbB83sUJYHeBjI9lNERKperynrwdcWIRnh2St+Fx8O3BTfYXojkwL2k+t0hQAUpuycfkTlCX2iZ9kMd1K7e+KVkkrpQ9Vh0aezxHPCH+y9+zZTyvZyr5u3/7YfJgJWXKdvSc835r53fRjDYfKm+igyCZ14gsIp36W87p8DlNPJZGHIogGW4//lktlpdK30AVUWMrDXWr8V3diV7BnWdxYG+zVbRkownWJjhUqfDXbonFoLjcRFQil+fuNtxv2kjyuFqJOKXN8bKjUEZ74fK4uMhAdRJb5MbSNS8F8ytm3eZcaxcxg28yUwPX9fJVtriIwEyyWxHS0/NkLcMUNgbtxMaG/ITji9H534AbuJZN51hiqO8ZTtoAD299DJElyNSk++MV0aWcm2wejY2Sr9SAe18jXFy76FlDtP2zx/rcKjzNGl7WBFB5j70ity0PWxE90nQhVVyUatzxe+Wx3FjAc0T5TnDlU8EWbaCvFwwDWW/BQlm6ds5v2BMHqB1h6pgx/k1oEAFxGyuJJV38Nhh3SvVobGWC39+MlpBsO2gg7Qwsod0864oQ/5FeZG70Ifuhk1ZPewHT/iYM5eZGrXhPZITahfQErwvmmzcCc1tZE0DayuDomo28EOSQRITiNtbc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZytTRkdkL0NYcHUrSHlpbWR3QUw3WmRJdmtnNS82U3EzZERURTJ3U01vVEd6?=
 =?utf-8?B?R0VLNmN4Z3c0bjE0Z3Z0WGVSeEJXS01Ed2gyQ0YrUGNJeXE1MmpGVFNhSkNx?=
 =?utf-8?B?MnhmYlhDY0NnYktQbzBocW8yb25ySUpodFFESjFlcmJ5YVd4aGFwOWRhOTFL?=
 =?utf-8?B?ZFRRekJwUnhlV0tWYVlkaDFKamxVczRpNXhQd3lrcmtUSjFpaUEzYkRmUVVv?=
 =?utf-8?B?czNoL0RveXdKdlp6OXNqd3BBVzhuK0Y1UVNuUlU1RG1JYm9GdTNCVGlqTUlU?=
 =?utf-8?B?UVVzZ3VBMkdHWDlyTDhTT2VDQWN0SVFBaVpJZlpaS3EvMFp1eWFkem5ESGF4?=
 =?utf-8?B?RXRQdWJIVmVaY2haVldlSTFUMGhwQzlGRXViTzhidlBHRjRtR0E1RW11eUUz?=
 =?utf-8?B?czNKYkxqNG9RSElRZnU5SThjYlI4QnMxTXZRd3Z3dW5ERzMzaEVBbDZlNW9w?=
 =?utf-8?B?QjlSZXpiYTdTNy9wRmxPYkpVTVc0ZUc5RHFwY29tc25xSkF0V1V0UitIUkZS?=
 =?utf-8?B?Sm1SMlE4ZVllcEo3TTBZQkk4ck9nV2hNTzNSVGh6Y3hMTjArK0IvSllWbWZK?=
 =?utf-8?B?S0tjUE5MNWFOTWJReUE2NUd2MFhKRmVlQWxjQ0p4aHJpOG1CckpSRkNvQVRn?=
 =?utf-8?B?MGhtdkkzem1VQ0xmVFBGNG9DNUpNQVJoSXVreVJKa3ZxUEdPMjZnd3VYRmdp?=
 =?utf-8?B?T0dqRlBsMndmUm5temgvVEVCbDE1WVZIUUdaeE81emRWR0Erc3IrbkNNVjFJ?=
 =?utf-8?B?VVNVMFpWQ250SUh3dk9jcm9Jb3ZqbHJEMkJHeXhnQjlKTnhOSnBMMm5PK2NL?=
 =?utf-8?B?ZkxWVWRkdmFQYTVKVUhXSVhCTDV4VUUwcVUzd2RCcTYwN2lCeUdLc3h2OUFh?=
 =?utf-8?B?aTA5aDdzb2NtN01OSGdVbnZxczlpUHpSeDYxZmdTY3VFTGZvUktYbXZQTWts?=
 =?utf-8?B?YmJSTE50Y3ZsRE81THE2NDdpRFkrMld4eGg4SG1JaUxMdFl0RUsyOTRHcDhl?=
 =?utf-8?B?VVhHaHIrWFp4VXFqNGM3cDNZdnpLYy9TUUx6QnZic25BaUZHTHAzOThMYWdB?=
 =?utf-8?B?OFQzcVl2YkhPOEhWQXdCdTdxTmFZYzNYR1g3ZXFaUkFpUTh1SmJBU0lRUEJV?=
 =?utf-8?B?KzJqS0JnT3JJWCtsSVE0a0VMTUMvMGRaeHFQYUE0emdMejZmUzlQT0tja3dy?=
 =?utf-8?B?M2FXMlBvdkc3Q1NqUzlNUTQ4L09jY0VjdFZhbGRsVU55OVhSRHZRSG1HVlRo?=
 =?utf-8?B?aVBrV29QMFVucVE1aVJ5Q2RMTS9kODFHTVdVYkE4YlNJZmduaGltNUxYVTdO?=
 =?utf-8?B?REgrNk5tU0ZpNXlXVDIvcG1mUkQzOEF6RnNDUmpUVWZIZE1BQnhFcEk5eUM0?=
 =?utf-8?B?QjR4aktSczNZSXA2VWR3SVg5Qk0zMjJDdVljRkdPTzJ3TUVxUTQ5bzJaOXlv?=
 =?utf-8?B?bW5ESys1ZUgzOS9UL3U0Tkd6RmZsanYzQzdZc21FaWlEd2RFRU1jaW5PQWRU?=
 =?utf-8?B?VG9GTlc0b21UL3BwbG1QV3BoNGhnNnYwcm9EWjhxekI0Y3FSbkx5TEZQdTMx?=
 =?utf-8?B?VFJlcTJZaEp6dUN5dTVRR25aK2dZbWpxd0w3TFhObGZtd3ZGWTBpdVppUTJD?=
 =?utf-8?B?VFBVNzJRUUx3YWQwM3dHNmVhUWdDUE5OK2R2cUcvZDhaT0Y4MzNCM3ZlZ3RX?=
 =?utf-8?B?RFA4Z0x4VzdRNjVrakU2Y2kyaWNjTlYySjhHUG1PL1pGTHZScEQ4MGlEMmNU?=
 =?utf-8?B?Qk9CTXNDdXZjL0Q3Rk5JOWl5c2M3WU5IQ0lleGFIQzJ4RjN1aVVpNkdrd2dM?=
 =?utf-8?B?RGNMVWdPV3I3OHBMeDErZTVPMzgzeU1vM1hOM2QxRmFRbk5YcTRzU09QQU5U?=
 =?utf-8?B?Ung5VHJNTUNLNXZraXY1QTRBRWlZTS85ckQ2c1NiMTQrbGg0U1dERVlTOUlU?=
 =?utf-8?B?eHZmQlhwMnFhWmxOa3djUXVrTFF6UXIybEhGR1ZINEdBYWIxWlRpYU5lQ3dE?=
 =?utf-8?B?UEJDWmVGQnRZZUI5blptOFhHbUM1Vml6OS8wTnI4bDkydTRNZTI3Z0ZZV00r?=
 =?utf-8?B?N045endIN21Rc01TSWUvSkhNdXRuTzhBNld6UDdoaEZLRVJjckd1Wm8zSjNj?=
 =?utf-8?B?Q1JPVjNwUFdpUUNlbWRjKzVNMVRiandrUlpTSUI2cnF5L1NldWJQUzJDelNu?=
 =?utf-8?B?S1Fyd2hCYVM5bjFyZC9YMVJsQVhmV0RkTzIzRkFXZEZ2NExucG5LSlI1TlpE?=
 =?utf-8?B?QlJhN2xCcUcrakltWFVXeWI0Qi9KK1B3MEE5djYxSE0wNDNZYWlrK0xBOUFM?=
 =?utf-8?B?bVdFcTR4MXkwMkVqMUYvS0wzY2N1cCtiMjFjUkprU0pTREtDYmU0Z0lxbjFN?=
 =?utf-8?Q?IZgMgn6VFP+rdLBs=3D?=
X-Exchange-RoutingPolicyChecked: Ym+HSRNIKpknupP8fCdzmPK7L7jMEWKrJmyE0fvGYxLR1YD5spxPoxf0jqmlZAUtm3tZRn/AtwBehVutuXw7h6IktVnvlV4o8zhX6kVB0PtgAAkCHlIDV+fx2aTshp8uTX+uKI3nCTNxi2UHZBx5rMSTlEGvEAc7xjKe4SNUp3wRsSKzNaknci6zHwEPAW9n4aui/NPDOCujKwIf4gbhPi36wnE7RhLM6lyX23Nbn//4aKInkHs7D1ZmOZ1D3Y60eNhpAg3f+7wwBpAbsF+TfUPsgBavLTnkEvTuKQPpcSxGFokotTJGAHGvKoPXF5WRhpZyQzQAbDZven7c+c/sXQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bb86d0e-de4e-4a7b-b69c-08dee627f32b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 06:27:19.3373 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2M7WDlJEzZnHAeUms3+gGGUF2B3V3WcwHD4Q4/yZlUSjraXwQOyK0anoaWvpuILZVTTiY707SGudHAOESsaNBZXPuZAO812MYp9IEZLy1R8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4957
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

Hi,

On 2026-07-15 at 14:15:27 +0200, Sebastian Brzezinka wrote:
> intel_error_decode needs the batch decoder, chipset tables and zlib for
> compressed error state handling, but not the full libigt.so stack.
> 
> Switch to linking against lib_i915_decode plus the minimal helper
> libraries it relies on.
> 
> ldd before: 35  (ldd | wc -l)
> ldd after:   4  (ldd | wc -l)
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---
>  tools/meson.build | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/meson.build b/tools/meson.build
> index 467b8eea1..b04754c5e 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -20,7 +20,6 @@ tools_progs = [
>  	'intel_display_bandwidth',
>  	'intel_display_crc',
>  	'intel_display_poller',
> -	'intel_error_decode',
>  	'intel_forcewaked',
>  	'intel_framebuffer_dump',
>  	'intel_gpu_time',
> @@ -84,6 +83,11 @@ executable('intel_dump_decode', 'intel_dump_decode.c',
>  	   install_rpath : bindir_rpathdir,
>  	   install : true)
>  
> +executable('intel_error_decode', 'intel_error_decode.c',
> +	   dependencies : [lib_i915_decode, pciaccess, zlib, libdrm],
> +	   install_rpath : bindir_rpathdir,
> +	   install : true)
> +
>  if libudev.found()
>  	intel_dp_compliance_src = [
>  		'intel_dp_compliance.c',
> -- 
> 2.53.0
> 

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
