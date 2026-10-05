Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A86FFCA5FF0
	for <igt-dev@archiver.kernel.org>; Mon,  5 Oct 2026 14:36:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E81110ED49;
	Mon,  5 Oct 2026 14:36:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HIAdI+kU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 195AC10ED49
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Oct 2026 14:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791210923; x=1822746923;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HCcUrpxRgs6T2waLLpWvKnuEzqUS4FG6FMxLxlU0xVA=;
 b=HIAdI+kUViVYXMvklS11fifrsCvYnO4GoRBvGVvSLJ6WiRnthisg1M/L
 j7y9YdW6EXAAO2zsr8+a9LdCjVyafgwctYvwJClkho4l+XBPAQ2ALmcyX
 I2JRlXD0hc6WRQ10LV1q8kKZnUHDNE89quHDf0ZXgsKNM4EkQawe5COW9
 hklSGLLl7koX6wMDXhUn55X0u+Fa+gcLSOMyRyaGEqz5FyhrXjbVxk6dZ
 e++pNB/WMgsOo7pMrZUnBKklVMYYfEB13D13bRy0a60MfCfNT1p+FADQm
 JXPuCY/XHRtNgd09uk/zYSS9TPoTLDjfrzu5lRAMJFyTa1aLrpEXmacRc A==;
X-CSE-ConnectionGUID: 68EiSjL4QnSIbwlMzOuW2g==
X-CSE-MsgGUID: k4fraI6tRmu1G7VS87NN0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="117400413"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="117400413"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 07:34:45 -0700
X-CSE-ConnectionGUID: Mlxqo2U5RRGboX/u9TG26A==
X-CSE-MsgGUID: n/1SPbJpQPSEWIGo0Wfn0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="304787103"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 07:34:45 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 07:34:44 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 5 Oct 2026 07:34:44 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.24) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 07:34:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JLqtSm8uBmYKCk25R49BYTxRAH0i/G5EjKWVIE9P4zTYskWIFtrnXiaYpgV7tx8smSzcFQ7vZUpCDy7H1lDeIqP8SX0kGYu7aNT2dJt6WnNLfklTNm5tJDugaPmI3n08On8VBx8yi61lnfdrkFf/9hkFpXFS/Nvg48kvYVMZgoSeraEaYHAtKhFwHSVENeP/Y24UMczdfUiNWm3RKnqOl6YWvlExx53upcEhWG6neSkP45Bg7977WVLI1wfSZxTTs1HRxLpW/Zu2BzwbrpKAi4iJRosiq1G3sRHYZImxElVd8js0Cqf6fV+NZ4PdKNLXcibTNnmJErXdlLDBJgk0eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z7w8phNEjeKMHF9Bg9wVD60MjjPOCW/5z41SPOMiSwk=;
 b=azhTae3wRy18HsIrvW/ddAQ0zxfcMv832KqWz2WjFsuRw4ZJHaElLPWS3cZ8X2pRc84Dshdk949c5LTvfoUUwoYot0AJFrJKql1cGja4R8QpGR11BzR6/dRdRMnR5qid3g3ioUfMfMSr065X6oeCbUyrq7yQMwOOpiCVl6m6KV/xR7kehgXY9VrNO6oth902fvLJn1RyZ/byYH0yiHkJGPUxFqH1GJZX3d113Akkst426IVrPl0EaCrpQtfEDPN82ZuFO0lYs1mMYUBwM0+faTWmCndP0HtNdz0DHIUetjxbOt+HWWMwA7Iq3vfoJI7C6yCtpzHb/rttF5S2qX/ZZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9037.namprd11.prod.outlook.com (2603:10b6:208:580::14)
 by DM3PPF4D011AE7D.namprd11.prod.outlook.com (2603:10b6:f:fc00::f20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 14:34:30 +0000
Received: from IA3PR11MB9037.namprd11.prod.outlook.com
 ([fe80::397:50af:2184:932c]) by IA3PR11MB9037.namprd11.prod.outlook.com
 ([fe80::397:50af:2184:932c%6]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 14:34:30 +0000
Message-ID: <f3794783-c9a3-4641-b979-530b6599bb8c@intel.com>
Date: Mon, 5 Oct 2026 20:04:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 5/5] tests/intel: Add oversubscribe concurrent
 bind stress subtest
To: Sobin Thomas <sobin.thomas@intel.com>, <igt-dev@lists.freedesktop.org>,
 <matthew.brost@intel.com>
CC: <priyanka.dandamudi@intel.com>
References: <20260922110438.2402109-1-sobin.thomas@intel.com>
 <20260922110438.2402109-6-sobin.thomas@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260922110438.2402109-6-sobin.thomas@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0299.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:220::11) To IA3PR11MB9037.namprd11.prod.outlook.com
 (2603:10b6:208:580::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9037:EE_|DM3PPF4D011AE7D:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cb54c90-80fa-46b3-0102-08df22edc3bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|6133799003|22082099003|18002099003|10067099003|4143699003|56012099006|260925021311599003|260925021911599003|260925022911599003|11063799006;
X-Microsoft-Antispam-Message-Info: RxUhxqYqMo9lIFUHEPDOkw18HYACWyZ2NP4Cuhrmz/PlmmJNlFveknb+oc4w1fApOUMVjktoz/AW77x0zmsDZAlE34tJD1UtD+yr775wKfLrZwgKml1cDgtAs3YJsg377w7DzXyn5ugoandln+dTs/v75SpJw0f5OEAEnN/m9iGUl49CVVpLK5GNtfDuVQiagb5SOoe7Swjaz5FX1t8OE77MRVjZtKyxZJlijjTsEY0xoDQkUI7pGeC1CUkYt1zUkDEr9ckgJKI7YEnWbt1ILO6i5xVoDE1iTOmtrj06YXtntjEiG4d1hXeObvq2Vv2pejahNMcIWFagH9I54QISqYEJY+FADETshptbD3/328OZv9oVBiqNhqN7U9E39k0qAd7RwkBCUaGWGBRLfN8q2k0IRzNaLP2a6m4atyccUaBwsgZRxaBpexsUqb9mfEVWIX9G4ugkO7e+c2EZoXH1/LqgjwjPJu3a1YiyJ8/hf48mnUvStz3c3a5dWnTyFpcFieAVfyrfFvHX0tOv3UtvlfoHStlVs1mTzf+O0WeQpPXzVb8zWtCAeS5D7Q6KBSu5LSsEfN+whcAPyN1bE6Qj2MCX+GirwLPtvWopJwlsPs+QK2mt8MZsVXlBQrIfIUsZZIhCBXPnjbmJn5sSNTDsWPN/lXTYNf7yniSbJtu4gGQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9037.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(22082099003)(18002099003)(10067099003)(4143699003)(56012099006)(260925021311599003)(260925021911599003)(260925022911599003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aytkYjUzRnBLMms3TzA1TDBOSjZkN1hmbFBuLzlGc0xJL2NTOFl3ZTExU09m?=
 =?utf-8?B?K2d1YUtrSDNWekhSdkQ4N21kRjBYTnJ4ZkkyOERWQkZFNS9Ja2xvZFRFSG5K?=
 =?utf-8?B?dWpML0Rqd0VEa2laZURiYTB2YzhLWVRVTVZEM21wejJ4NHVweUoyQ09paDBh?=
 =?utf-8?B?SmRCQWlaVHRxZkU0NFJqZnJvSjM2MWF5eEE1SHNmVkVzZ3JtQ0prZ3ZhdnZK?=
 =?utf-8?B?ZGFwTmZZdnBxN1FYZ0JUZWhRNDcwOWJIS2h0eXNhckY4bXlXUzg4VjhORmpz?=
 =?utf-8?B?WFVDS0ZFUXEyTW4xVmhCQ0ZqVVVNMmNKQ2I4dGErdUxBRk9MV014Y1d4c29x?=
 =?utf-8?B?Mjc2dDIyN21hWXdGeThTc3hvakdDNGlURmlwRkVHWXF5aVVwUFBCZ25DYW8r?=
 =?utf-8?B?dzdYa2YyNHMvZGltWTVESFk3NUdaOHBIVHNlYTYxWHBrOElaaUFVM2lmOVEy?=
 =?utf-8?B?a0VlUDhWeCtpUTdKUUhVTHRRdVg2MVdQNy9RZzVObExrM0lTOG4xOVhHQ2Nn?=
 =?utf-8?B?cXFOL1VyZDJZUWlQS2RQanRjanJnNk1MeHNCNHJWcUxOQm84cnZOVzZ2eEEx?=
 =?utf-8?B?NW1FTDV4N2lxMUYrL1FKVEdyRlNvY0Y1MEtaVyt1YktDa0JjZ3NGekhYZ0Zi?=
 =?utf-8?B?aVVCMi85RFpNVnVXaVgxdk9EL0llKzR0MnRRbktqdFlobHA4TUljL1BoSDk4?=
 =?utf-8?B?VXJwK0hkZXU4R3hyY1VTMmNGRk9HTEljdHkyVEVNdm4zT2l1OHIvK0swNDZ4?=
 =?utf-8?B?Nm0rN05KeG1YWjFOSElhSjNFeEFLNGx5V0lFRWlwYXdpMjc3RG02WlVpRnBj?=
 =?utf-8?B?OGhCR0NLN2xRSEJUZUZHenFHSHYyb1RUK3htd0ZqZitOaFFxME5MSmVmL1ho?=
 =?utf-8?B?aFR4WGFCNVh3dW4zVGN4c0RHV0pOanA3RzltSWlyTWo5dGVnc0dFbGRBeHdY?=
 =?utf-8?B?TXU3WmhSQ2NjdHBPUEhnUExVd1lMNUkwMnNBRWNmVFFaUzJuSjhIOUhKd0xh?=
 =?utf-8?B?NVJSNWt3UnZ3NVVKaXpjZ29rdVIrQmdnajhRTGE1L1dMUFR2RFprVVNBajcy?=
 =?utf-8?B?Q2ZOZU9uQlowandPTk1sOU11SGhFbzd6emxWZTZ6RWg4SnlTYTJsODZKa21F?=
 =?utf-8?B?L2hXUXp1c0Y1V1hZM3NvM0xyR0ROQU5zMW9oRWlFbVpaVzhDMDBjSEVoWFlh?=
 =?utf-8?B?TjNvU2xzSm1BUXVEemtqMmlPSkRlam1udmdHem8rRjJ0RnRZV0g0dFpoUXh3?=
 =?utf-8?B?WDhISkdUNTJKWTVuMFJKV1hOQzhBVy9qcENUd28xdWJueXM4L0pEV1BNb2M3?=
 =?utf-8?B?TGdNV2JkcmtSaFV2ZjA3SUU0KzBNSFM5RUlzTFJWQ3orY09La0JVYnpJa01u?=
 =?utf-8?B?Nk94MjlFeDZZcUsySnVodzRoSW5hd1l1THpRdDZFamQ5RTdqUWNROUJDV1VY?=
 =?utf-8?B?T2IyY0l2RzlySXRkekU5NzBYY3JhMVNpckdNYjQ1cUhrNDF4NHlpWGZwN0ZC?=
 =?utf-8?B?T3MvazBhU3RveWFNY3RvT2VOZVJhZEV1c3ZEWEM4Rk5VTFlVb0VoTzJLOVB6?=
 =?utf-8?B?RHI4VDJySnpGcnlvc1VKY1VCam02bTZINkkyek5lZ1BGbUk5ZDYzUE9Vd0dX?=
 =?utf-8?B?NTZaRVN5VW8vaDhIMS9UcDI5L1UwYzlNTnEySGpQSjQ4R25BR3BSSGNCRk0v?=
 =?utf-8?B?a3BaMkFzMEhCalBCTGVaU1BsTTFnYmpmVnp5U3F2Z2g5U0wzSTJCK29ST2Jr?=
 =?utf-8?B?ZS9LZ29DSDZqS0Z1RVVKNm5TOTdMTjlWZmE2TkI0Y3VwcmZwTnpTMEJIcUtT?=
 =?utf-8?B?T01RdWZLdTVjdHR3Wi9ESHRYQWRUL2xkU3k5R0pmNFpqMGRlN3NmRUt2YTFy?=
 =?utf-8?B?RHZtTzFOeFFKMFRQVXZJd1ZaK3lQbzV1dlpCZDA2MGNtSGZ1TDRrMWNpekU4?=
 =?utf-8?B?OHV5MzRGcFZJNHo3V1JCSE9YMFhwSjU1WGMrQit1YVY1bGIvWXcxcTRyaitq?=
 =?utf-8?B?UCtHYmxjbDRFNm1WNUcvOHdpaC9NRVJlS2twcWZ5RVlFbTRIV2NwdXhVZ3V1?=
 =?utf-8?B?S0dYRVlpTEpTd2RCSHovUS80VW94ZDZwQURNbFVQMUEyQU95RThCNmpTdGkv?=
 =?utf-8?B?ckNleklERUV2YTk5R2FrWEkwNXJGd3A3NEp0Ujc5ZUhrNUxIVzNpQ3ZkUEZD?=
 =?utf-8?B?UzZHT0tka2w4ZHlSbEtBcXhML2hTaEc5SFYzaTZHYVJBelBJWHhTM0VJNnJ3?=
 =?utf-8?B?SWRINllDNDMyRUEvN3FyQzgrdHRjSUd6bXFKYit4WmI0NTNFNWwxaFViaEdM?=
 =?utf-8?B?RnR5dm1vNEsyRlV4SCtWVmhIZVNDeUhoUFVPaHdqTlk5V1RLc2lYQT09?=
X-Exchange-RoutingPolicyChecked: nrimZHY5r54wsmyy11t9Yy831U3+ES5ygVH2XkyJNKuGsniinzSYIV5hExgZJdjEXY6D14k+qpviBFMFOBfHkasE2eD777lwVPjsy1CNCLvKiz1ARTgVXxNq+G+kGNRzWY3s2xFDX/tNi5u1JES7Hr6punSOP/tzCwnjVFaqkebFMNjXiN57m6HZQBTMr3Qf1QKPwvh+2iaBfYxvCC5rCFS93Rf8kzpIZblpAWFz8rNeoBAeIiNylktxXIshdQqf9FmOWhy2t4B/FqdgOeOxvDeSuauRZZOONfE8wJd/pO75hUWWdEJiGhmT2V3IFioY6CqFEQi1FilGDq6E/jiTdg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cb54c90-80fa-46b3-0102-08df22edc3bd
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9037.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 14:34:30.1632 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ejy97/PNi8mtnr9e2r2ywWsLquj0cl0LA5N3/wqkzaQQppN/P3RiS7vNrRTCv7aLJWZZIDFBFScckXCCq54UuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF4D011AE7D
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


On 9/22/2026 4:34 PM, Sobin Thomas wrote:
> Add test for oversubscribing VRAM in multi process environment that
> creates VM, bind large BOs and submit workloads nearly simultaneously.
>
> Previous coverage lacked a scenario combining multi-process bind
> with VRAM oversubscription. This generates memory pressure with
> multi-process VM Bind activity and concurrent submission, exercising
> the bind pipeline under eviction pressure.
>
> v3: Fixed minor nits
> v4: Refactoring of the create_bo ( Nishit)
>      Fix child process exit deadlock in release_ready_processes() (Nishit)
>
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>   tests/intel/xe_bo_alloc.c | 533 +++++++++++++++++++++++++++++++++++++-
>   1 file changed, 532 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/xe_bo_alloc.c b/tests/intel/xe_bo_alloc.c
> index d8368087b..2ee468c62 100644
> --- a/tests/intel/xe_bo_alloc.c
> +++ b/tests/intel/xe_bo_alloc.c
> @@ -29,6 +29,17 @@
>   #define THREAD_VA_STRIDE GB(1)
>   #define SZ_4K_SHIFT	12
>   #define MAX_ALLOCATIONS 50000
> +#define INT_ADD_CNT 4
> +#define TIMEOUT_NS (30ULL * 1000000000ULL)
> +#define MAX_SRAM_TEST_SIZE GB(32)
> +#define GPR_RX_ADDR(x)          (0x600 + (x) * 8)
> +#define MAX_PROCS 20
> +
> +#define EXEC_DATA_ADDR		0x100000ULL
> +#define EXEC_RESULT_ADDR	0x200000ULL
> +#define EXEC_BATCH_ADDR		0x300000ULL
> +#define EXEC_UFENCE_ADDR	0x400000ULL
> +#define STRESS_BIND_ADDR	0x40000000ULL
>   
>   /**
>    * SUBTEST: all-sizes-once
> @@ -76,14 +87,48 @@
>    * Description: Test 50 random BO allocation sizes in test table with a thread per engine,
>    * leak the binding, unaligned bind addresses
>    * Test category: stress test
> + *
> + * SUBTEST: test_vm_oversubscribe_concurrent_bind
> + * Description: Test enough random BO allocation sizes, bound as arrays of binds, to trigger
> + * evictions with 2 processes per engine, leak the BO munmap / gem close, unaligned bind addresses
> + * Test category: stress test
>    */
>   
>   #define GB(x) (1024ULL * 1024ULL * 1024ULL * (x))
>   #define MIN_BUFS_PER_PROC 2
>   
>   #define N_ALLOC_SIZES	256
> +#define USER_FENCE_VALUE 0xdeadbeefdeadbeefull
> +
>   static uint64_t *alloc_sizes;
>   
> +struct gem_bo {
> +	uint32_t handle;
> +	uint64_t size;
> +	uint32_t *ptr;
> +	uint64_t addr;
> +};
> +
> +struct xe_oversubscribe_ctx {
> +	uint32_t vm_id;
> +	uint32_t exec_queue_id;
> +};
> +
> +struct mem_bind_sync {
> +	struct gem_bo *bufs;
> +	int n_bufs;
> +	uint64_t *binds_ufence;
> +};
> +
> +struct process_data {
> +	pthread_mutex_t mutex;
> +	pthread_cond_t cond;
> +	int ready;
> +	int failed;
> +	pthread_barrier_t barrier;
barrier not initialized but used. I think it's not required
> +	bool go;
> +};
> +
>   /*
>    * Data-driven subtest matrix.
>    *
> @@ -103,7 +148,8 @@ enum test_type {
>   	TYPE_ALL_SIZES,
>   	TYPE_RANDOM_SIZE,
>   	TYPE_ARRAY_BIND,
> -	TYPE_THREAD
> +	TYPE_THREAD,
> +	TYPE_OVERSUBSCRIBE,
>   };
>   
>   struct test_case {
> @@ -114,6 +160,14 @@ struct test_case {
>   	bool requires_evict_ram;
>   };
>   
> +struct oversubscribe_params {
> +	int n_proc;
> +	int n_vram_bufs;
> +	int n_sram_bufs;
> +	uint64_t vram_size;
> +	uint64_t sram_size;
> +	uint64_t total_vram_demand;
> +};
>   #define LEAK_BINDING		(0x1 << 0)
>   #define LEAK_BO			(0x1 << 1)
>   #define EVICT			(0x1 << 2)
> @@ -244,6 +298,478 @@ static int __xe_vm_bind_array(int fd, uint32_t vm,
>   	return 0;
>   }
>   
> +static void init_pdata(struct process_data *pdata)
> +{
> +	pthread_mutexattr_t mattr;
> +	pthread_condattr_t cattr;
> +
> +	pthread_mutexattr_init(&mattr);
> +	igt_assert_eq(pthread_mutexattr_setpshared(&mattr, PTHREAD_PROCESS_SHARED), 0);
> +	igt_assert_eq(pthread_mutexattr_setrobust(&mattr, PTHREAD_MUTEX_ROBUST), 0);
> +	igt_assert_eq(pthread_mutex_init(&pdata->mutex, &mattr), 0);
> +	pthread_mutexattr_destroy(&mattr);
> +
> +	pthread_condattr_init(&cattr);
> +	igt_assert_eq(pthread_condattr_setpshared(&cattr, PTHREAD_PROCESS_SHARED), 0);
> +	igt_assert_eq(pthread_cond_init(&pdata->cond, &cattr), 0);
> +	pthread_condattr_destroy(&cattr);
> +	pdata->ready = 0;
> +	pdata->failed = 0;
> +	pdata->go = false;
> +}
> +
> +static void process_ready_and_wait(struct process_data *pdata)
> +{
> +	int ret = pthread_mutex_lock(&pdata->mutex);
> +
> +	if (ret == EOWNERDEAD)
> +		igt_assert_eq(pthread_mutex_consistent(&pdata->mutex), 0);
> +	else
> +		igt_assert_eq(ret, 0);
> +	pdata->ready++;
> +	pthread_cond_broadcast(&pdata->cond);
> +	while (!pdata->go)
> +		pthread_cond_wait(&pdata->cond, &pdata->mutex);
> +	pthread_mutex_unlock(&pdata->mutex);
> +}
> +
> +static void process_setup_failed(struct process_data *pdata)
> +{
> +	int ret = pthread_mutex_lock(&pdata->mutex);
> +
> +	if (ret == EOWNERDEAD)
> +		igt_assert_eq(pthread_mutex_consistent(&pdata->mutex), 0);
> +	else
> +		igt_assert_eq(ret, 0);
> +	pdata->failed++;
> +	pthread_cond_broadcast(&pdata->cond);
> +	pthread_mutex_unlock(&pdata->mutex);
> +}
> +
> +static void release_ready_processes(struct process_data *pdata, int n_proc)
> +{
> +	struct timespec timeout;
> +	int ret;
> +
> +	ret = pthread_mutex_lock(&pdata->mutex);
> +	if (ret == EOWNERDEAD)
> +		igt_assert_eq(pthread_mutex_consistent(&pdata->mutex), 0);
> +	else
> +		igt_assert_eq(ret, 0);
> +
> +	clock_gettime(CLOCK_REALTIME, &timeout);
> +	timeout.tv_sec += 30;
> +	/*
> +	 * Wait until all children have either reached VM Bind rendevouz
> +	 * Or, failed setup and exited the test path.
> +	 */
> +	while (pdata->ready + pdata->failed < n_proc) {
> +		ret = pthread_cond_timedwait(&pdata->cond, &pdata->mutex, &timeout);
> +		if (ret == EOWNERDEAD) {
> +			igt_assert_eq(pthread_mutex_consistent(&pdata->mutex), 0);

If pthread_cond_timedwait() returned EOWNERDEAD (a lock holder died) 
code made the mutex consistent

but it is checking igt_assert_eq(ret, 0) which will fail as ret is still 
EOWNERDEAD, so in case of EOWNERDEAD it should continue to check

ret    if (ret == EOWNERDEAD) {

igt_assert_eq(pthread_mutex_consistent(&pdata->mutex), 0);

continue;                 /* re-check loop condition */

}

> +		} else if (ret == ETIMEDOUT) {
> +			igt_warn("Timeout waiting for the child process: ready=%d, failed =%d, expected=%d",
> +			pdata->ready, pdata->failed, n_proc);
> +			break;
> +		}
> +		igt_assert_eq(ret, 0);
> +	}
> +
> +	igt_debug("Process rendezvous: ready=%d failed=%d total = %d\n",
> +		  pdata->ready, pdata->failed, n_proc);
> +
> +	/* Release every successful child into VM_Bind at same time*/
> +	pdata->go = true;
> +	pthread_cond_broadcast(&pdata->cond);
> +	pthread_mutex_unlock(&pdata->mutex);
> +}
> +
> +static int build_add_batch(struct gem_bo *batch_bo, struct gem_bo *integers_bo,
> +			   struct gem_bo *result_bo, int ints_to_add)
> +{
> +	int pos = 0;
> +	int i;
> +	uint64_t tmp_addr;
> +
> +	batch_bo->ptr[pos++] = MI_LOAD_REGISTER_MEM_CMD | MI_LRI_LRM_CS_MMIO | 2;
> +	batch_bo->ptr[pos++] = GPR_RX_ADDR(0);
> +	tmp_addr = integers_bo->addr + 0 * sizeof(uint32_t);
> +	batch_bo->ptr[pos++] = tmp_addr & 0xFFFFFFFF;
> +	batch_bo->ptr[pos++] = (tmp_addr >> 32) & 0xFFFFFFFF;
> +	for (i = 1; i < ints_to_add; i++) {
> +		/* r1 = integers_bo[i] */
> +		batch_bo->ptr[pos++] = MI_LOAD_REGISTER_MEM_CMD | MI_LRI_LRM_CS_MMIO | 2;
> +		batch_bo->ptr[pos++] = GPR_RX_ADDR(1);
> +		tmp_addr = integers_bo->addr + i * sizeof(uint32_t);
> +		batch_bo->ptr[pos++] = tmp_addr & 0xFFFFFFFF;
> +		batch_bo->ptr[pos++] = (tmp_addr >> 32) & 0xFFFFFFFF;
> +		/* r0 = r0 + r1 */
> +		batch_bo->ptr[pos++] = MI_MATH(4);
> +		batch_bo->ptr[pos++] = MI_MATH_LOAD(MI_MATH_REG_SRCA, MI_MATH_REG(0));
> +		batch_bo->ptr[pos++] = MI_MATH_LOAD(MI_MATH_REG_SRCB, MI_MATH_REG(1));
> +		batch_bo->ptr[pos++] = MI_MATH_ADD;
> +		batch_bo->ptr[pos++] = MI_MATH_STORE(MI_MATH_REG(0), MI_MATH_REG_ACCU);
> +	}
> +	/* result_bo[0] = r0 */
> +	batch_bo->ptr[pos++] = MI_STORE_REGISTER_MEM_GEN8 | MI_LRI_LRM_CS_MMIO;
> +	batch_bo->ptr[pos++] = GPR_RX_ADDR(0);
> +	tmp_addr = result_bo->addr + 0 * sizeof(uint32_t);
> +	batch_bo->ptr[pos++] = tmp_addr & 0xFFFFFFFF;
> +	batch_bo->ptr[pos++] = (tmp_addr >> 32) & 0xFFFFFFFF;
> +
> +	batch_bo->ptr[pos++] = MI_BATCH_BUFFER_END;
> +	while (pos % 4 != 0)
> +		batch_bo->ptr[pos++] = MI_NOOP;
> +	return pos;
> +}
> +
> +static void create_exec_queue(int fd, struct xe_oversubscribe_ctx *ctx)
> +{
> +	ctx->exec_queue_id = xe_exec_queue_create(fd, ctx->vm_id,
> +						  &xe_engine(fd, 0)->instance, 0);
> +}
> +
> +static uint64_t *
> +vm_bind_bo_batch(int fd, struct xe_oversubscribe_ctx *ctx, struct gem_bo *bos, int size,
> +		 int *out_err)
> +{
> +	uint64_t *ufence;
> +	struct drm_xe_sync bind_sync;
> +	struct drm_xe_vm_bind_op *binds;
> +	int i;
> +
> +	binds = calloc(size, sizeof(*binds));
> +	igt_assert(binds);
> +
> +	ufence = calloc(1, sizeof(*ufence));
> +	igt_assert(ufence);
> +	bind_sync = (struct drm_xe_sync) {
> +		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		.addr = to_user_pointer(ufence),
> +		.timeline_value = 1,
> +	};
> +
> +	for (i = 0; i < size; i++) {
> +		binds[i] = (struct drm_xe_vm_bind_op) {
> +			.obj = bos[i].handle,
> +			.obj_offset = 0,
> +			.range = bos[i].size,
> +			.addr = bos[i].addr,
> +			.op = DRM_XE_VM_BIND_OP_MAP,
> +			.flags = 0,
> +		};
> +	}
> +	*out_err = __xe_vm_bind_array(fd, ctx->vm_id, binds, size, &bind_sync, 1);
> +	free(binds);
> +	return ufence;
> +}
> +
> +/* Returns 1 (caller should skip exec) on an allowed OOM error, 0 otherwise. */
> +static int bind_bos(int fd, struct xe_oversubscribe_ctx *ctx, struct gem_bo *bufs,
> +		    struct mem_bind_sync *bind, int *bind_err, bool allow_oom)
> +{
> +	if (!bind->n_bufs)
> +		return 0;
> +
> +	bind->binds_ufence = vm_bind_bo_batch(fd, ctx, bufs, bind->n_bufs, bind_err);
> +
> +	if (*bind_err) {
> +		if (allow_oom) {
> +			igt_assert_f(*bind_err == -ENOMEM || *bind_err == -ENOSPC,
> +				     "Unexpected bind error: %d (%s)\n",
> +				     *bind_err, strerror(-*bind_err));
> +			igt_debug("Bind failed with expected OOM (%s), skipping exec\n",
> +				  strerror(-*bind_err));
> +			return 1;
> +		}
> +
> +		igt_assert_f(false, "Unexpected bind error: %d", *bind_err);
> +	}
> +
> +	xe_wait_ufence(fd, bind->binds_ufence, 1, 0, TIMEOUT_NS);
> +	return 0;
> +}
> +
> +static int fill_random_integers(struct gem_bo *int_bo, int ints_to_add)
> +{
> +	uint32_t expected_result = 0;
> +	char expr[256];
> +	int len = 0;
> +
> +	for (int i = 0; i < ints_to_add; i++) {
> +		uint32_t random_int = rand() % 8;
> +
> +		int_bo->ptr[i] = random_int;
> +		expected_result += random_int;
> +
> +		len += snprintf(expr + len, sizeof(expr) - len, "%s%u",
> +				i ? " + " : "", random_int);
> +	}
> +	igt_debug("%s = %u\n", expr, expected_result);
> +	return expected_result;
> +}
> +
> +static void cleanup_bo_resources(int fd, struct gem_bo *bo)
> +{
> +	if (bo->ptr) {
> +		igt_assert_eq(munmap(bo->ptr, bo->size), 0);
> +		bo->ptr = NULL;
> +	}
> +	if (bo->handle)
> +		gem_close(fd, bo->handle);
> +}
> +
> +static int create_test_bos(int fd, struct xe_oversubscribe_ctx *ctx,
> +			   struct mem_bind_sync *bind, uint32_t placement,
> +			   uint64_t *addr)
> +{
> +	const char *mem_type = (placement & vram_memory(fd, 0)) ? "VRAM" : "SRAM";
> +	int ret;
> +
> +	for (int i = 0; i < bind->n_bufs; i++) {
> +		struct gem_bo *bo = &bind->bufs[i];
> +
> +		bo->size = GB(1);
> +		ret = __xe_bo_create_caching(fd, ctx->vm_id, bo->size, placement, 0,
> +					     DRM_XE_GEM_CPU_CACHING_WC, &bo->handle);
> +		if (ret) {
> +			int saved_errno = errno; /* capture before anything can clobber it */
> +
> +			bind->n_bufs = i;
> +			if (saved_errno == ENOMEM || saved_errno == ENOSPC) {
> +				/* Continue on OOM, expected when oversubscribing the VM */
> +				igt_debug("%s allocation failed at buffer %d (OOM)\n", mem_type, i);
> +				break;
> +			}
> +			/* We are returning as this is a fail scenario */
> +			igt_warn("%s allocation failed at buffer %d: %s\n",
> +				 mem_type, i, strerror(saved_errno));
> +			return -saved_errno;
> +		}
> +		bo->ptr = NULL;
> +		bo->addr = *addr;
> +		*addr += bo->size;
> +		igt_debug("%s buffer %d created at 0x%016lx\n", mem_type, i, bo->addr);
> +	}
> +	return 0;
> +}
> +
> +static void cleanup_sram_vram_objs(int fd, struct mem_bind_sync *vram_bind,
> +				   struct mem_bind_sync *sram_bind)
> +{
> +	for (int i = 0; i < vram_bind->n_bufs; i++)
> +		gem_close(fd, vram_bind->bufs[i].handle);
> +	for (int i = 0; i < sram_bind->n_bufs; i++)
> +		gem_close(fd, sram_bind->bufs[i].handle);
> +	free(vram_bind->bufs);
> +	free(sram_bind->bufs);
> +	if (vram_bind->binds_ufence)
> +		free(vram_bind->binds_ufence);
> +	if (sram_bind->binds_ufence)
> +		free(sram_bind->binds_ufence);
> +}
> +
> +static void create_bo(int fd, uint32_t vm, struct gem_bo *bo, uint64_t size,
> +		      uint64_t addr, bool map_now)
> +{
> +	bo->size = ALIGN(size, 4096);
> +	bo->handle = xe_bo_create_caching(fd, vm, bo->size, system_memory(fd), 0,
> +					  DRM_XE_GEM_CPU_CACHING_WC);
> +	igt_assert(bo->handle);
> +	bo->addr = addr;
> +	if (map_now) {
> +		bo->ptr = xe_bo_map(fd, bo->handle, bo->size);
> +		igt_assert(bo->ptr != MAP_FAILED);
> +	} else {
> +		bo->ptr = NULL;
> +	}
> +}
> +
> +static bool calc_oversubscribe_params(int fd, struct oversubscribe_params *p)
> +{
> +	uint64_t target_vram, target_sram;
> +	uint64_t total_vram_bufs, total_sram_bufs, max_by_mem;
> +
> +	p->vram_size =  xe_visible_available_vram_size(fd, 0);

Sizing used xe_visible_available_vram_size() gives 
vram.cpu_visible_available; which can be small

to accomodate big BOs or 2x demand, it should be xe_available_vram_size 
which gives vram.total_available;

> +	p->sram_size = (uint64_t)igt_get_avail_ram_mb() << 20;
> +	/*
> +	 * Dynamically cap VRAM oversubscription so the overflow into system
> +	 * RAM stays within 25% of available RAM. On small-VRAM platforms
> +	 * the 2x target fits within the cap and behavior is
> +	 * unchanged; on large-VRAM platforms (e.g. PVC) this prevents OOM.
> +	 */
> +
> +	target_vram = min(p->vram_size * 2, p->vram_size + p->sram_size / 4);
> +	target_sram = min_t(uint64_t, p->sram_size * 50 / 100,
> +			    MAX_SRAM_TEST_SIZE);
> +	total_vram_bufs = target_vram / GB(1);
> +	total_sram_bufs = target_sram / GB(1);
> +	max_by_mem = min(total_vram_bufs / MIN_BUFS_PER_PROC,
> +			 total_sram_bufs / MIN_BUFS_PER_PROC);
> +
> +	p->n_proc = min_t(int, max_by_mem, MAX_PROCS);
> +	if (p->n_proc <= 0)

On low ram machines it might execute single-process but above in 
description mentioned 2 process, so

condition p->n_proc < 2 should be checked.

> +		return false;
> +	p->n_vram_bufs = max_t(int, 2, total_vram_bufs / p->n_proc);
> +	p->n_sram_bufs = max_t(int, 2, total_sram_bufs / p->n_proc);
> +	p->total_vram_demand = (uint64_t)p->n_proc * p->n_vram_bufs * GB(1);
> +	return true;
> +}
> +
> +static void test_vm_oversubscribe_concurrent_bind(int fd)
> +{
> +	struct oversubscribe_params p;
> +	struct process_data *pdata;
> +
> +	igt_require_f(calc_oversubscribe_params(fd, &p),
> +		      "Not enough VRAM/RAM for oversubscription test\n");
> +
> +	igt_debug("VRAM size: %" PRIu64 "MB, System RAM available: %" PRIu64 "MB\n",
> +		  p.vram_size >> 20, p.sram_size >> 20);
> +
> +	igt_debug("n_proc = %d\n", p.n_proc);
> +	igt_debug("VRAM: %" PRIu64 "GB\n", p.vram_size >> 30);
> +	igt_debug("VRAM demand: %" PRIu64 "MB (%.2fx oversubscription)\n",
> +		  p.total_vram_demand >> 20, (double)p.total_vram_demand / p.vram_size);
> +	igt_debug("Processes=%d VRAM_bufs=%d SRAM_bufs=%d\n", p.n_proc,
> +		  p.n_vram_bufs, p.n_sram_bufs);
> +
> +	pdata = mmap(NULL, sizeof(*pdata), PROT_READ | PROT_WRITE,
> +		     MAP_SHARED | MAP_ANONYMOUS, -1, 0);
> +	igt_assert(pdata != MAP_FAILED);
> +	init_pdata(pdata);
> +
> +	igt_fork(child, p.n_proc) {
> +		struct xe_oversubscribe_ctx ctx = {0};
> +		int rc, ret, fd_c;
> +		uint64_t addr = STRESS_BIND_ADDR;
> +		uint32_t expected_result = 0;
> +		struct gem_bo integers_bo = {0}, result_bo = {0}, batch_bo = {0};
> +		struct gem_bo *vram_bufs, *sram_bufs;
> +		int pos = 0;
> +		struct mem_bind_sync vram_bind = {0};
> +		struct mem_bind_sync sram_bind = {0};
> +		struct drm_xe_sync batch_syncs[1];
> +		struct drm_xe_exec exec;
> +		struct gem_bo ufence_bo = {0};
> +		int vram_bind_err = 0, sram_bind_err = 0;
> +
> +		vram_bufs = calloc(p.n_vram_bufs, sizeof(*vram_bufs));
> +		sram_bufs = calloc(p.n_sram_bufs, sizeof(*sram_bufs));
> +		srand(child);
> +
> +		fd_c = drm_open_driver(DRIVER_XE);
> +
> +		igt_assert(vram_bufs && sram_bufs);
> +
> +		ctx.vm_id = xe_vm_create(fd_c, DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE, 0);
> +		create_exec_queue(fd_c, &ctx);
> +		vram_bind.bufs = vram_bufs;
> +		vram_bind.n_bufs = p.n_vram_bufs;
> +		sram_bind.bufs = sram_bufs;
> +		sram_bind.n_bufs = p.n_sram_bufs;
> +
> +		ret = create_test_bos(fd_c, &ctx, &vram_bind, vram_memory(fd_c, 0), &addr);
> +		if (ret) {
> +			process_setup_failed(pdata);
> +			goto cleanup;
> +		}
> +
> +		ret = create_test_bos(fd_c, &ctx, &sram_bind, system_memory(fd_c), &addr);
> +		if (ret) {
> +			process_setup_failed(pdata);
> +			goto cleanup;
> +		}
> +
> +		if (!vram_bind.n_bufs || !sram_bind.n_bufs) {
> +			igt_debug("No BOs allocated; VRAM/SRAM unavailable, skipping\n");
> +			process_setup_failed(pdata);
> +			goto cleanup;
> +		}

When a child hit an allocation failure it called process_setup_failed(), 
jumped to cleanup, and exited normally (status 0).

The parent only waited for children to exit — it never checked whether 
any test executed. So a run where every child failed

still it'll be reported as PASS. Instead a counter e.g. failed_count 
should be incremented in process_setup_failed() and after cleanup:

failed_count value must be checked so that user knows during setup/bo 
creation fault happened

something like: igt_assert_f(pdata->fault_count == 0,
              "%d child(ren) hit unexpected setup errors\n", 
pdata->fault_count);

> +
> +		/*
> +		 * All allocations are complete. Report Ready and wait until every
> +		 * child has either reached this point or repported a setup failure.
> +		 */
> +
> +		 process_ready_and_wait(pdata);
> +
> +		/*
> +		 * VM_Bind starts only after the parent releases all ready
> +		 * childen.
> +		 */
> +
> +		if (bind_bos(fd_c, &ctx, vram_bufs, &vram_bind, &vram_bind_err, true))
> +			goto cleanup;
> +
> +		if (bind_bos(fd_c, &ctx, sram_bufs, &sram_bind, &sram_bind_err, false))
> +			goto cleanup;
> +
> +		create_bo(fd_c, ctx.vm_id, &integers_bo, 4096, EXEC_DATA_ADDR, true);
> +		expected_result = fill_random_integers(&integers_bo, INT_ADD_CNT);
> +		igt_debug("%d\n", expected_result);
> +		create_bo(fd_c, ctx.vm_id, &result_bo, 4096, EXEC_RESULT_ADDR, false);
> +		create_bo(fd_c, ctx.vm_id, &batch_bo, 4096, EXEC_BATCH_ADDR, true);
> +		pos = build_add_batch(&batch_bo, &integers_bo, &result_bo, INT_ADD_CNT);
> +
> +		igt_assert(pos * sizeof(int) <= batch_bo.size);
> +
> +		xe_vm_bind_lr_sync(fd_c, ctx.vm_id, integers_bo.handle, 0, integers_bo.addr,
> +				   integers_bo.size, 0);
> +		xe_vm_bind_lr_sync(fd_c, ctx.vm_id, result_bo.handle, 0, result_bo.addr,
> +				   result_bo.size, 0);
> +		xe_vm_bind_lr_sync(fd_c, ctx.vm_id, batch_bo.handle, 0, batch_bo.addr,
> +				   batch_bo.size, 0);
> +		create_bo(fd_c, ctx.vm_id, &ufence_bo, 4096, EXEC_UFENCE_ADDR, true);
> +
> +		memset(ufence_bo.ptr, 0, ufence_bo.size);
> +		xe_vm_bind_lr_sync(fd_c, ctx.vm_id, ufence_bo.handle, 0, ufence_bo.addr,
> +				   ufence_bo.size, 0);
> +
> +		batch_syncs[0] = (struct drm_xe_sync){
> +			.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> +			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +			.addr = ufence_bo.addr,
> +			.timeline_value = USER_FENCE_VALUE,
> +		};
> +
> +		exec = (struct drm_xe_exec) {
> +			.exec_queue_id = ctx.exec_queue_id,
> +			.num_syncs = 1,
> +			.syncs = (uintptr_t)batch_syncs,
> +			.address = batch_bo.addr,
> +			.num_batch_buffer = 1,
> +		};
> +
> +		rc = igt_ioctl(fd_c, DRM_IOCTL_XE_EXEC, &exec);
> +		igt_assert_f(rc == 0, "xe_exec failed unexpectedly: %s (%d)\n",
> +			     strerror(errno), errno);
> +		xe_wait_ufence(fd_c, (uint64_t *)ufence_bo.ptr, USER_FENCE_VALUE, ctx.exec_queue_id,
> +			       TIMEOUT_NS);
> +		result_bo.ptr = xe_bo_map(fd_c, result_bo.handle, result_bo.size);
> +		igt_assert(result_bo.ptr != MAP_FAILED);
> +		igt_assert_eq(result_bo.ptr[0], expected_result);
Here child should report completion also, something like 
child_completion(pdata) { pdata->child_completed++;}
> +cleanup:
> +		cleanup_bo_resources(fd_c, &ufence_bo);
> +		cleanup_bo_resources(fd_c, &result_bo);
> +		cleanup_bo_resources(fd_c, &batch_bo);
> +		cleanup_bo_resources(fd_c, &integers_bo);
> +		cleanup_sram_vram_objs(fd_c, &vram_bind, &sram_bind);
> +		xe_exec_queue_destroy(fd_c, ctx.exec_queue_id);
> +		xe_vm_destroy(fd_c, ctx.vm_id);
> +		drm_close_driver(fd_c);
> +	}
> +
> +	release_ready_processes(pdata, p.n_proc);
> +	igt_waitchildren();

If a child is killed or blocked before reporting, the parent timed out 
after 30 s,

it releases the rest and calls igt_waitchildren() which could wait 
forever/hung. Here all forked children

should be killed first.

Both counters updated above will be checked in assertion to know the 
real cause of error

igt_assert_f(pdata->fault_count == 0,
              "%d child(ren) hit unexpected setup errors\n", 
pdata->fault_count);
igt_assert_f(pdata->child_completed >= 2,
              "Need >=2 processes to complete the oversubscribed submit, 
got %d\n",
              pdata->child_completed);

> +	igt_reset_timeout();
> +
> +	pthread_cond_destroy(&pdata->cond);
> +	pthread_mutex_destroy(&pdata->mutex);
> +	igt_assert_eq(munmap(pdata, sizeof(*pdata)), 0);
> +}
> +
>   static void alloc_sizes_init(void)
>   {
>   	int i;
> @@ -986,6 +1512,7 @@ static const struct test_case test_matrix[] = {
>   	{ "threads-leak-binding-rand-sizes-50", 50, LEAK_BINDING, TYPE_THREAD, false },
>   	{ "threads-leak-binding-rand-sizes-50-unaligned", 50, LEAK_BINDING | UNALIGNED,
>   	  TYPE_THREAD, false },
> +	{ "test_vm_oversubscribe_concurrent_bind", 0, 0, TYPE_OVERSUBSCRIBE, false},
>   };
>   
>   int igt_main()
> @@ -1011,6 +1538,10 @@ int igt_main()
>   				run_threaded_bo_alloc_test(fd, t->count, t->flags);
>   			}
>   			break;
> +		case TYPE_OVERSUBSCRIBE:
> +			igt_subtest_f("%s", t->name)
> +				test_vm_oversubscribe_concurrent_bind(fd);
> +			break;
>   		case TYPE_ALL_SIZES:
>   		case TYPE_RANDOM_SIZE:
>   		case TYPE_ARRAY_BIND:
