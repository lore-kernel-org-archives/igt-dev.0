Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D72BF8D76E
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 19:53:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E95A10E10F;
	Thu, 16 Apr 2026 19:53:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MW0YWAhE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F9C310E10F
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 19:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776369224; x=1807905224;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=fxjoXYBnmrC52GrCNdb822b+2cavbMY5O2GCRXgl14s=;
 b=MW0YWAhETehY4Zwz0CbatCrNn88cbicueidYsy33ZaHvXhzve0FsSAy3
 cECXZIzTZXZ29XIVjWe5qncopHfXt+HnqaXGr+SjmbDuEx+yfxNC4OLYS
 sgxH4yDL7CJksvEnKDLLEagHG1UtASD9XgYshlt3sEbpTKxbUVErXkf8b
 sqJ7Z6MVv4NVeol0zfnAjAkkaWd5HOZvsF9zZtu279HFC26xCK09TCwex
 uj924Tbe2J0Xzv+d4IkZriZ4eRwhMt7gqDQUyz6szEIN1OdlV38NQVwUx
 R2uam+VyMERfeMYqQyO+uIRIzXReCsBnhWNgodI8sC6nyCmeq4RtL5IMs g==;
X-CSE-ConnectionGUID: ODos4tXFSrC0xVcNmPkxsg==
X-CSE-MsgGUID: VGntWh7HRb22GLLYnvUdCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="76549150"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="76549150"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 12:53:44 -0700
X-CSE-ConnectionGUID: XYs4UaiuSFW7XDLuYsuWDQ==
X-CSE-MsgGUID: xitnN1M1TleKKsZC7CTNmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="235203512"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 12:53:43 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 12:53:42 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 16 Apr 2026 12:53:42 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.65) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 12:53:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P0ulsMRE1/MdvK4STiIdxOfoLg18e8uMyqtI87pgZGwMvVWRPfBLQWySCvVhi6i7nnEoOMlvsQxtH5F6C3ZSE0gvBrIrdaLdQwqyxjLmRqJnQ1zN3FC4YweMOMa7673F3LrLfDSD8z2nnyIWuL7/5jNXBhQlm6pwSo8AZdcFeM1tE1dUulkO63Y0bBubFaKyBUy5qLdYL3CJN8X3UKVWl5fWyLS4HkvbXnjqq+MwU0Eizc7CYObQr/ADqTvdrDCtt/q0n3EA5n0aYCEHELwsJk/bXn+J2AQOC6lUXrMbIrKFODhZj/yHeUG3IFYpI/77s0Nb5qbdX/m6Fn9u0pxUNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eFlqZ1ho0h+n4OLXVBLygAXn1sO3f1q5tO0A0I3JoGk=;
 b=TJEESkChKmhHqvY766mRXoA79ZvuUE0WWzx3/o04C6W4zRyF5Nza7CJJWuxeUJdlVSc1WcXZER4JUQ3TSGrNWH2exH4OyHBjIRnGAwJ3uuNNyqcNvj2ReTIBX7AT66hWAWNOYIAvzBaB0LGbk/N/OJRCGUwmlbtvThfFjj46gAaNDzudcS8a3S+sGaEDzt9Y/ql7rWPtlwQoIPPwiRwKOdzBmQDSvjdp0Cn28/WpHCnUd18MTt0gcIn02ddbRjWuvMiEICOFk543LmysgHBjz3GToQWNuXQvvdHUD4mlA1BgubqSiM9eEC5f0QcxLX8wXkB4VzxJ9iMi+4Wp6gq1uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by MW4PR11MB6763.namprd11.prod.outlook.com (2603:10b6:303:20b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Thu, 16 Apr
 2026 19:53:37 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%5]) with mapi id 15.20.9818.017; Thu, 16 Apr 2026
 19:53:37 +0000
Message-ID: <b486302d-7017-4e8d-8aca-9c890783f97a@intel.com>
Date: Fri, 17 Apr 2026 01:23:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 2/4] tests/intel/kms_sharpness_filter: refactor
 test_sharpness_filter function
To: <igt-dev@lists.freedesktop.org>
References: <20260416155421.2000-1-juhapekka.heikkila@gmail.com>
 <20260416155421.2000-3-juhapekka.heikkila@gmail.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260416155421.2000-3-juhapekka.heikkila@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0038.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::18) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|MW4PR11MB6763:EE_
X-MS-Office365-Filtering-Correlation-Id: ef1c5271-f631-42f8-a442-08de9bf1d985
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: CtKyXxGAlXgP2cg4JKUnxrVCHzjTkw+ozsMk6jypetA7lrEmlm4ZJXMPiqEjGmO+wJseDSIkxYPeIvXC11KlJIDCjDCIDlGPrMD8PBUUz+6pTl3EpndlsOFNRRUZPOLjovJp6BVHwlrqMy5zKDOrKVbdBBJxD/4bgI3kgwGnidr4j3qVFfXhc7You45eI+uVI2USfro4lc46+6SORSY4XVy8Eo9OQXiZQVcidNhtCuA2p/1DNACDRFLHkg+dMLvhFM6WB7RF7vrIu8oBPPslMiELKbV+j3YiYj5iqkEUMIKefa9MiHssVOA/TzsOn7icz0URhaMdvsPHEhusKxZzzTAMPmgL74g+6o+lnNLvlTMM4MXqBPBs9IvgfS4F8+eGQxwMMfcLPJ7dguuZgLAc31FE51k7HxMGG36Vn0amAUyT+eku5gEqjVBbb47uBr4ZWhPBVxuTBQLQwrND9IXpy/Ov2U5Er5TA61lT+oJphv5u5IL7b5Gpri0jvjkydCJ81GLVSOOpxl66HkvuYBecADYGucUIS+Uc3OQ/WYEEtWo9ya6m7kS4ufVh55ylxsRzYkGe9lsGHxWs86uFN0JJNNnIYBHjDCUN6ppSbhX5aoq7lgDLBPgP+eWEfem5VdI/j82Hgeht/V/Ub1QLIwVKhlEPaBgSmRaSjXX69qF4EewLvI8x48cVz42wZDzIVDrcr0hOk6e6LNSy8MAt0bqB8D4+bq1EpfG6NsqOYmRIdQ8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFByUHFtaXh1UEQvcHlSNU1DaDFUUzBDMkRHUmYwU0U1Q1k4NndrOHhvYUsy?=
 =?utf-8?B?a0VEc3hvTTR0U0RaVnlTcmQ1UVZWblFKcklBLzBlZUNveUdBMm1VUjgrYVh6?=
 =?utf-8?B?ZnVNSGkwTnNlZWczKzVJYTRLak9YYTFwWlkwTG15R0d1ZnRYbWlRWVI3MktO?=
 =?utf-8?B?ZHR0akVQRndTeXF1MEpSTDRxV2wzRWNxbWgzZDFid00wU0I0aGNpN0RSekMy?=
 =?utf-8?B?alFqMGEya1RBNWx5TThkS3RzekgyTXdyV2tOSDBnVnhmdUVwcTZ5Z05CcmtF?=
 =?utf-8?B?RkFLMnZqOUN5SHJrT3FzUWRrV20vOXlGaGtTZ3VSUXJOMTBwVS9YVmZTbUE5?=
 =?utf-8?B?Q24yOS9XUFZISWFmYlpsQjhiK1N0eVBnMy9lbEJWV0d4Q3VKV25YdS9hTzlq?=
 =?utf-8?B?b1E1TWdQZkd1ZEJueG9GYWwzU3liT2lJREFGUlJBanBFWUxGQysyZEdjQzFq?=
 =?utf-8?B?K1VRa0VZMmZzejhjRDI4VW1UNzVLRVlicXY4Z0RreVlhYTBiN0hRTDJhb08r?=
 =?utf-8?B?UXNXQVBCdkZIZzcwU3dhSGM0ajB2dWJpWDk4SzBWMTUvMEUraW1aclZiOVF3?=
 =?utf-8?B?TDhwWlUrMy8vWFV0d3d3UDJ2Z2tud0dVamFuVkhXWlA5RWQ1UThuYThIZ3FN?=
 =?utf-8?B?Zzc3MzFnb015RS9sU0NjbHhIN1RmSEtOM2kvb0dhMzRNelgxWjBPRHJQSUVv?=
 =?utf-8?B?N3d0cUVUdUJBRlVtWHZTSG5SKzBZblVFL2M5ak5lUzJ4Z0NKRjEzb1psdU9F?=
 =?utf-8?B?K3U2RW1zQnFOODVhM3JZV3k4U1NSeE53Z0NXMlVxK1Mva0dhUmhLMjl1UjVF?=
 =?utf-8?B?Y1ZuU0FjVnFpZnlxUHoxdEpGYnZ3M3VWWlorWmxUT2tFVFBwT25nSW05U1NF?=
 =?utf-8?B?YXlaaWFTTUR4aUo1RG9ybFBVRFBUcnFMbjRFb1FPNUFBa0V5T2xGeUloMjZu?=
 =?utf-8?B?Wm5SdDk4Lzd2VW4xT251eEZZblEzWGoxaW5GeitUOFhpM2hvdDFtOWNrbHcw?=
 =?utf-8?B?cy9Va0xxOXRMWC9Qa25yZDZ2TFMrVGxHL0VYSGhtMXJSR2s2dnNObWRFNlNS?=
 =?utf-8?B?R25FMDBWNmNiTDFhQ3Z5OFQzckFhRHpGNnVLVUQ1YVdabkg1MzhGYVVyb2lT?=
 =?utf-8?B?VlZyOWxvS2tiYm1mTEFCVGQ4Z0pCeUt1V3lWRTRNOVNwQUVlRmhib1Fjc01y?=
 =?utf-8?B?VzZpRVl0ZXZUdFVpUm91b3FOVzdmR0NsTG5pR3V1aFZxMEIwSXo5V1B1UWN0?=
 =?utf-8?B?WXFxZGxUTW5CbUhmNEdHQm9BQnNWNVFBV1hZUkxXdnk0R01kZjFaYXljTHpx?=
 =?utf-8?B?RDAzSlBMY012cHFyRTMyQmZJdGs3bFdjNHB0a2U4aVp2V0M5Mlg0dGpiajZ6?=
 =?utf-8?B?SHNicFpERG1lWEFOSUlucGx0YVFKK1VnWTZXZDlTZWhVZVVzKzJ3T2xNRk5y?=
 =?utf-8?B?ZHBYRkdEYzNXSEg5SmxzTndCOE9KS0lPcjMrZUZjS3lMcytpcmxIQnIxSTBw?=
 =?utf-8?B?TnRMQ3EyN0cvVFlXL3NaN2RGR0k0RVZiVGJFdkdKZXRLVmE5SHpHSlViL3Yx?=
 =?utf-8?B?UzlRTzA0QVJDc2hOTW1pc3QrcUp4Y0ZtUnpodXM2Q1g4ajBBUUpJTkJFTjQ1?=
 =?utf-8?B?a0FmYWtTTDcranZqbVBuakpGN0RXcWNyYWs5Y3MyT2VmR1F6ZDRtMTJtK29V?=
 =?utf-8?B?dmlHN3R6ZG02TE0rRnJEVmZPS01VSGFaWEJXaTFtcWJ1bDBFZVE1c2o3QkZ1?=
 =?utf-8?B?WW1PMXVCOUZWOGhDZ3BRUGZFYmtnNlZHRjBrQ253cmJFaHowSWs1QzUxd3lv?=
 =?utf-8?B?YXk5TXc3SUd5eENuTkFsWCtaYjRNMkpkNWEzWE5uUUFvMVorRDVYTGZ0UlFQ?=
 =?utf-8?B?UHVJeWZVNkhwOE05VWdhcEpRVDNQNlFaaTNVVzB4U0hBQkxjNlJ5N2V3a2pM?=
 =?utf-8?B?aXFLdDlTU2lXZnp3YUZoME5EM3R5L1pONW5ZQndTL0Y4Rm92cnczbElxWkow?=
 =?utf-8?B?U09tUXI2aVQ5U2hEM0hqeExvRUxxYllMLzhEVmcyYzJhYWVrNFdiUU9ZdmRz?=
 =?utf-8?B?Vld5VGFlcFIwSFhWNzdldlpFMzJMNk9BVXA1b0xHQXJ6V3lwZUlLTlJBeVRz?=
 =?utf-8?B?eDhsRXlRSTZWZnZUV3JMZGpaWVQ0amY4ek4xTnAzbTZJb1FYczBjb2Jjajlm?=
 =?utf-8?B?WG9RRzdPWGRSOXRBZnVwcFRGTDhrcWJQMGJVNHFQNVYxQVZSS2FkaVVGa01C?=
 =?utf-8?B?NTh2ZTl6R2lTUkZac1ZKUGlHc0kyUWlYUGdXTk5ESHRDb1E5dG93bjNER1Jk?=
 =?utf-8?B?Ly9PQ20yNnZhVmJUU1NyOFNkUjJDdXQyendIUFc5bk5scGp5VnBKZz09?=
X-Exchange-RoutingPolicyChecked: ODEuwx6fWmoYckfjfzNBOzxZPAuJdj1TjCYbi7czBPai1YC6GjzzsVsAqUSJCNVllzpUsS48vXKIMehysucwsyRvIc5e03sg9VsjGyzdfzS2udxFxHvhVcRQEGEHfvkiJc2KPp8v7GFtHFsHfX1yXVObYdwURy+qwPqEHIGJPtQEXi68l3e3Rgrg3db5TFM2e19axaYYQL24yk4QaDGoIQZ89e5VnH/WkF6n5ZoxbLWkf+i2AwhmqXiADNgc280lFP+rkyh/Cif+rwmuqRUhGfVdgF/T4xI5Mytiw3mZ88pk1XD44g1Ku2y2IFvF/2ZN8N5C88A4i1W5Uejm+RfBlA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ef1c5271-f631-42f8-a442-08de9bf1d985
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 19:53:37.5305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4xheAKiZbldkFQARETF10/48wq3o4oSRiL2ht52NRrzf5gyE9YELfb2XqrgyenZY3DYTCEKG/HyEEflGEhU27w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6763
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


On 16-04-2026 09:24 pm, Juha-Pekka Heikkila wrote:
> refactor to make it look more nice
Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

>
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>   tests/intel/kms_sharpness_filter.c | 108 ++++++++++++++++-------------
>   1 file changed, 59 insertions(+), 49 deletions(-)
>
> diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
> index baf9bc141..b1c80eecd 100644
> --- a/tests/intel/kms_sharpness_filter.c
> +++ b/tests/intel/kms_sharpness_filter.c
> @@ -88,15 +88,6 @@ IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
>   #define MAX_PIXELS_FOR_3_TAP_FILTER	(1920 * 1080)
>   #define MAX_PIXELS_FOR_5_TAP_FILTER	(3840 * 2160)
>   #define NROUNDS				10
> -#define INVALID_TEST ((type == TEST_INVALID_FILTER_WITH_SCALER) \
> -		   || (type == TEST_INVALID_FILTER_WITH_PLANE) \
> -		   || (type == TEST_INVALID_PLANE_WITH_FILTER) \
> -		   || (type == TEST_INVALID_FILTER_WITH_SCALING_MODE))
> -#define SET_PLANES ((type == TEST_FILTER_UPSCALE) \
> -		||  (type == TEST_FILTER_DOWNSCALE) \
> -		||  (type == TEST_INVALID_FILTER_WITH_SCALER) \
> -		||  (type == TEST_INVALID_FILTER_WITH_PLANE) \
> -		||  (type == TEST_INVALID_FILTER_WITH_SCALING_MODE))
>   
>   enum test_type {
>   	TEST_FILTER_BASIC,
> @@ -326,12 +317,37 @@ static int test_filter_toggle(data_t *data)
>   	return ret;
>   }
>   
> -static void test_sharpness_filter(data_t *data,  enum test_type type)
> +static bool is_invalid_test(enum test_type type)
> +{
> +	switch (type) {
> +	case TEST_INVALID_FILTER_WITH_SCALER:
> +	case TEST_INVALID_FILTER_WITH_PLANE:
> +	case TEST_INVALID_PLANE_WITH_FILTER:
> +	case TEST_INVALID_FILTER_WITH_SCALING_MODE:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static bool needs_extra_planes(enum test_type type)
> +{
> +	switch (type) {
> +	case TEST_FILTER_UPSCALE:
> +	case TEST_FILTER_DOWNSCALE:
> +	case TEST_INVALID_FILTER_WITH_SCALER:
> +	case TEST_INVALID_FILTER_WITH_PLANE:
> +	case TEST_INVALID_FILTER_WITH_SCALING_MODE:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static void test_sharpness_filter(data_t *data, enum test_type type)
>   {
>   	igt_output_t *output = data->output;
>   	drmModeModeInfo *mode = data->mode;
> -	int height = mode->hdisplay;
> -	int width =  mode->vdisplay;
>   	igt_crc_t ref_crc, crc;
>   	igt_pipe_crc_t *pipe_crc = NULL;
>   	int ret;
> @@ -342,57 +358,31 @@ static void test_sharpness_filter(data_t *data,  enum test_type type)
>   		      "No requested format/modifier on pipe %s\n",
>   		      igt_crtc_name(data->crtc));
>   
> -	setup_fb(data->drm_fd, height, width, data->format, data->modifier, &data->fb[0]);
> +	setup_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
> +		 data->format, data->modifier, &data->fb[0]);
>   	igt_plane_set_fb(data->plane[0], &data->fb[0]);
>   
>   	if (type == TEST_FILTER_ROTATION) {
> -		if (igt_plane_has_rotation(data->plane[0], data->rotation))
> -			igt_plane_set_rotation(data->plane[0], data->rotation);
> -		else
> -			igt_skip("No requested rotation on pipe %s\n",
> -				 igt_crtc_name(data->crtc));
> +		igt_skip_on_f(!igt_plane_has_rotation(data->plane[0],
> +						      data->rotation),
> +			      "No requested rotation on pipe %s\n",
> +			      igt_crtc_name(data->crtc));
> +		igt_plane_set_rotation(data->plane[0], data->rotation);
>   	}
>   
>   	if (type == TEST_INVALID_FILTER_WITH_SCALING_MODE)
>   		igt_require_f(has_scaling_mode(output), "No connecter scaling mode found on %s\n", output->name);
>   
> -	if (SET_PLANES)
> +	if (needs_extra_planes(type))
>   		set_planes(data, type);
>   
>   	set_filter_strength_on_pipe(data);
>   
> -	if (!INVALID_TEST && data->filter_strength != 0)
> -		igt_debug("Sharpened image should be observed for filter strength > 0\n");
> -
>   	if (type == TEST_INVALID_FILTER_WITH_SCALING_MODE)
>   		ret = igt_display_try_commit_atomic(&data->display, 0, NULL);
>   	else
>   		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
>   
> -	if (type == TEST_FILTER_DPMS || type == TEST_FILTER_SUSPEND) {
> -		pipe_crc = igt_crtc_crc_new(data->crtc,
> -					    IGT_PIPE_CRC_SOURCE_AUTO);
> -		igt_pipe_crc_collect_crc(pipe_crc, &ref_crc);
> -	}
> -
> -	if (type == TEST_FILTER_DPMS) {
> -		kmstest_set_connector_dpms(data->drm_fd,
> -					   output->config.connector,
> -					   DRM_MODE_DPMS_OFF);
> -		kmstest_set_connector_dpms(data->drm_fd,
> -					   output->config.connector,
> -					   DRM_MODE_DPMS_ON);
> -	}
> -
> -	if (type == TEST_FILTER_SUSPEND)
> -		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> -					      SUSPEND_TEST_NONE);
> -
> -	if (type == TEST_FILTER_DPMS || type == TEST_FILTER_SUSPEND) {
> -		igt_pipe_crc_collect_crc(pipe_crc, &crc);
> -		igt_assert_crc_equal(&crc, &ref_crc);
> -	}
> -
>   	if (type == TEST_FILTER_TOGGLE)
>   		ret |= test_filter_toggle(data);
>   
> @@ -408,13 +398,33 @@ static void test_sharpness_filter(data_t *data,  enum test_type type)
>   		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
>   	}
>   
> -	if (INVALID_TEST)
> +	if (type == TEST_FILTER_DPMS || type == TEST_FILTER_SUSPEND) {
> +		pipe_crc = igt_crtc_crc_new(data->crtc,
> +					    IGT_PIPE_CRC_SOURCE_AUTO);
> +		igt_pipe_crc_collect_crc(pipe_crc, &ref_crc);
> +
> +		if (type == TEST_FILTER_DPMS) {
> +			kmstest_set_connector_dpms(data->drm_fd,
> +						   output->config.connector,
> +						   DRM_MODE_DPMS_OFF);
> +			kmstest_set_connector_dpms(data->drm_fd,
> +						   output->config.connector,
> +						   DRM_MODE_DPMS_ON);
> +		} else {
> +			igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> +						      SUSPEND_TEST_NONE);
> +		}
> +
> +		igt_pipe_crc_collect_crc(pipe_crc, &crc);
> +		igt_assert_crc_equal(&crc, &ref_crc);
> +		igt_pipe_crc_free(pipe_crc);
> +	}
> +
> +	if (is_invalid_test(type))
>   		igt_assert_eq(ret, -EINVAL);
>   	else
>   		igt_assert_eq(ret, 0);
>   
> -	/* clean-up */
> -	igt_pipe_crc_free(pipe_crc);
>   	cleanup(data);
>   }
>   
