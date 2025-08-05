Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6325EC87FD1
	for <igt-dev@archiver.kernel.org>; Tue,  5 Aug 2025 04:39:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 061E110E241;
	Tue,  5 Aug 2025 04:39:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rg9NDwBS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACB4610E241
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Aug 2025 04:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754368791; x=1785904791;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TpuipcQP1xeHc7uhfzWVygxMjnax+I3D8Ewy8z+nPkI=;
 b=Rg9NDwBSsrBIJM9XT3r/g2b2gUCzq4TTi9cTgL6uWyRUYSVss2OeCDCR
 vKcymCdCF/M/Px5dQxN/I+1sCUaCxB/qeltQQfV4C9MC7HSHdfLZ03sgC
 cqsSM9QHRbZiyL7TgtAJTSIx9jqjOvS7erF4ePA+q2vytZE/7g+yoJR6q
 Y/wENWX9xK0PoEMXXZX3X2mw5oOEP7yABK9U4PTBBm9cFrT+amAe1BMNS
 lveTBclkQMVQgGXdxMALZupOQ+t9yOwk8nuCl1ZIBAi5GF7/y3lVxIxAa
 aYCiVAVHCAsdvIpyMGSoAwYc97nL4r9kFc28+aoRQVnfe6fi1JpxK5t09 g==;
X-CSE-ConnectionGUID: N/ojRXloTz2SEgAyRYM8Cw==
X-CSE-MsgGUID: zj/ZxdgBSb+JpWwBrxwKhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="55688740"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="55688740"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 21:39:50 -0700
X-CSE-ConnectionGUID: qUP6Lhh0T+aZA8oqbE9WSw==
X-CSE-MsgGUID: 7QkRmupWR3mSLRsQEIQAwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="169645878"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 21:39:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 21:39:49 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 4 Aug 2025 21:39:49 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.89)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 21:39:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ciPGK4xxvkk/7wO+muNEuwS848XeGW3rHTQkYe3s14DaBM16PsPtykEKah6ayRbiKfc0ORqXKMYRfWa7eI3uTxbS8cBqJMwpTnknyvf+tvHehz+kQ3FX1KkdyUmpbMSZM7TxQIvM88ZJVpMssQzmtbPCqRyCfN3EALrigmvP0ppHJgYl/5msMUeCu41NcWuNMedCIUgejk+kiU3007+gWubhGzqL+A/bnzP3Ro6qjgtgpbBhlm5OMsMdMcNjsbz2uoo1j4LiPYXGIp8bkdCR8mCk//gx8aPhi4uL+LI8dFjMu8ZSwlFNSTloCaxL42AOxGM/1ftOMVbtDtoDoYRkjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1qQCPMOaMfIlwxaFlf2L8QiN3IW0RxWgJj9V5NGK6vo=;
 b=a6+T8UfhuDOw5oQ/9AG1UHggy2Aq8Sjv9L6Cr7ts9MT1zksk7ECRMhqi9tpRTJOetjqCIFGQgHCzruVJVPrU/C5oKvDhOVBoxljlRwPRzftwzN/wzYP8M66K2850/TWEuhGhU8TSoYKuEwlHdZCYLd5QuSVQ/hP5qlWPVVeTQbhx/X+d+zSHvaWl51xunlUVMmSQ8E6YPZUfjyH737DPpzex2siIHnB+Fr05m8vGAEan3jANMIdWayGlvSVHOCXerpzOl/pQsidhHiEQ5zWG//qkEF81hLhi2AmevtxsyWOPaALu12Td4brf0V2Oz/vLDjkpOvRbdasbAiRT7V+GGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 MW4PR11MB6716.namprd11.prod.outlook.com (2603:10b6:303:20d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Tue, 5 Aug
 2025 04:39:46 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 04:39:46 +0000
Message-ID: <625599c9-3f35-40c4-b274-cb5c824a2308@intel.com>
Date: Tue, 5 Aug 2025 10:09:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel/xe_configfs: Add i2c adapter check in
 survivability mode
To: Sk Anirban <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <raag.jadav@intel.com>
References: <20250804192424.3727427-2-sk.anirban@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250804192424.3727427-2-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1P287CA0021.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::29) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|MW4PR11MB6716:EE_
X-MS-Office365-Filtering-Correlation-Id: 8836d918-cc2f-4735-b427-08ddd3da1a97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SUkwZ2tkRFQweDJySEVwZzh5aFdkYlNINzRhcHVidTA1K2gwSVF6cDlUblFF?=
 =?utf-8?B?QjFDZ3R2djVVKzdMckxNekx5aG0xaDU2aEJDU2U0ZEtNK0h5VkVqd3VkbU5L?=
 =?utf-8?B?WXVpUzV4bWh4Z3ByZk1NVW0vUlhQWGZmaW1vUDlaRVdMb25WbzhweHBJdVhm?=
 =?utf-8?B?clJZWUhVdVpycGorM3lSS3JPa0lDdElVU3Y2YU4xQXFyMmNxZmFzSFRydFVU?=
 =?utf-8?B?WlBRY1FUc3dNQlJFOXkzT05BOXU2bjk0T0hkbjV2dllzVm10OEFlb2svbE5K?=
 =?utf-8?B?NG1BdGFGNFBhYzdzTUczanozb0MvdFM0NzhZM1Z0YlRYNThyRm5nNmlVZkN6?=
 =?utf-8?B?MW1tS1dTdGs5UzN2TG1qS2lORzhnaWgvUGc0Nzk0YWV1R0x0a2I5Q2Q4Um05?=
 =?utf-8?B?REpiZ2RNSWhmSlpWOGROajdWdlFzalNvdG85MDZScTdoUGVBRFZ3TTFwQ3BU?=
 =?utf-8?B?U2ZmSjBlQndBUmo0Z3ZNWXJyYSszRmpIV3RNQlBZT2VTRUMzTHptbWZpTEVF?=
 =?utf-8?B?Q1dmdEdaNHc3QWMwLysyS1ZBamNac2JNdStsT2c2MWFUS2ZlUnhiWVB1VUdE?=
 =?utf-8?B?TXZFV2RzT3hkNFQ3TFpjWFNnNU9icy9sb1FZU1ZTVWdDUlYrOFZLUUhjMHRq?=
 =?utf-8?B?SUYrTkN1aWMvNGtvZmlSVTRXM2N6UE0xZmp3R3lDWjdMR1h6dFVma1BHOTVO?=
 =?utf-8?B?QnZOVlRuOXpDWVVpZ2h6RW5QcndqMUMvajdzMGJibFBBdEcramtHaFBXeTEv?=
 =?utf-8?B?UjhzeFppcUkyRUNOMzhPYWkwY0dQSmNxNmJnY3FHcTNJZU9jdlgraWpWMTNv?=
 =?utf-8?B?TG5ZbzFUeGtaRU5UZmsvbmhuVHZ6QUxEUWlTM3BpVUZxR0xIYUtkL3RGd2dz?=
 =?utf-8?B?TmR2cVkrSW9WYkQxR0ZobU82VytZeGxCTWpyaXdUcU41SXRvMkZVanlPM1Jm?=
 =?utf-8?B?NUZsdXFzSzN5dEZaNlEvVEVQRjUyREo4NGJpNWZtTkM5ME83QnZjUXhESUdB?=
 =?utf-8?B?Y25CS0hDNE9LLy9zR0Rsd3RxMXZwaHNtZnJ1OGhSODRMUXJnQS9jdGVtSFlx?=
 =?utf-8?B?TVBvYStKL0Y4QlVNUUM4Sm85MUFETkJZOHpYQS92WUV1Tm9JeVlnR0Rua3FB?=
 =?utf-8?B?UVFHMUZSQ0pkaFZYei95RkxoN3RnMW5GdkQrOVd0SXMrQmFQODhQWWlwOGpB?=
 =?utf-8?B?Q1VmRlZBRDZETjB6K2l2ZFl0cFRydGlqczAvYmlmN3NjWk1ER2xQR0VXQ2tl?=
 =?utf-8?B?ZzE1VUU0QzF6ZElzNVdWZ0ZhMlZzZS9uZWpNRTFFWFVONHVaZUpPVklDWUNj?=
 =?utf-8?B?SUxndFcwVEdPeUVteXVlRVlTVkt5dS9XdWFZci83MUFIMVFaRUhmNDByQXRY?=
 =?utf-8?B?eGdBQWpkVlhMRWtlM2xTQzgyTnh4QVpINlIvaFY1dmdFWTN6aERpOHlGa24w?=
 =?utf-8?B?UHJMQ0R4QWcvVjUxcVEyNU5jaXpnWDNkZ1R4TzZ1ZzQ4dHh1Y0NmS0VjbFV6?=
 =?utf-8?B?VWkvMDRMamJHejV6UHYwUEtyS1A0ZnR1d1BzeEVzTS94RFhDVFpuWTdXZTVu?=
 =?utf-8?B?dEJNY3BRVWY0UHZ3MXRZM1FRSVJQNEhZZzUxdmlKRWdaUHhsZ2o5SDMxNGtw?=
 =?utf-8?B?VkxkUUFYc1ZZM3hxUGkxbjF1eFBQMzFOUG1ycGxxWlhZOFhIYWladWdTckZN?=
 =?utf-8?B?aGJjWUVVSkxrRkdRTWdkZC9tSXpvZkRuQmxGUnYzQzFzNFhXQ0NueThhUFcx?=
 =?utf-8?B?OEJvMVBQMlBrcE02NXpoc3dWMXByOUgwUDRRb0xPYVkySm1oS2VMVndWTVoy?=
 =?utf-8?B?b2gzdnIxdHlyYXZQK011MXhXVFBKVC9JazdJK251SnI5TEtqWlFWRzN5RGsr?=
 =?utf-8?B?MlcyVzRadmZSN014MkN6cWxEaEIyUnpGb25TTGdhNndhdWVkMWlCcHhCOW1w?=
 =?utf-8?Q?n93kdrQEiXU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3QwTVFLUFJlVlJRSFVlZzRVT1BRS3VJa0dsNWxIdWwzSGV6dEJlOU9tOXR4?=
 =?utf-8?B?czV3WDBmMU5QSnZEWms4Z2tZbnVQTnZiY3hDZVl1bUNnTjUzeW9vVFREaWhZ?=
 =?utf-8?B?N21QMWZZMDdFVHpzazFHcGFmbEFwcDE3OVBXNnpMWWtUbW9MSTNiTmpEbFM3?=
 =?utf-8?B?SDc5dlMzY3U5eExSakczODcrVU9xaXNuVHljb0d5MTFEVnFLeHdVUG15RkRX?=
 =?utf-8?B?NTVuSUh0OGQ3Rk52cEMwcXRzdHNrdnI4YklwU0FxZlVkYUdTZXA0UVJGUTFz?=
 =?utf-8?B?a1pXU0JkMTJKVzZwZUI4V0JWb1EvVTJWd2FzUHh5Sms2TVp3K0lxZGZBb1Fz?=
 =?utf-8?B?aVNtRjFzWjNRVnZaa0w5YXNSd2JZSDBQUy9rT3BDN3dQdm40WGMvZlV4c095?=
 =?utf-8?B?VForZjBRS3dVMjhTQjZWeWFyakZ0YWpCZ3RHR0NlU1VKZlExeWVKRHovckNW?=
 =?utf-8?B?Z05yV25RaUUzWDY0NkJqTGgzeEJtd2lwajRhYnlSY0s2MFlsVXM4WDArS09p?=
 =?utf-8?B?amdOdEpDSkFRSkpDWmVYWXY0RlRIc3NLem9HM1JMZXNiNzBVbjVvRjQ5VGpx?=
 =?utf-8?B?T0x0elJGSk94K1NvZnNYM2JkVk9naG0vVTk1b2pwN2VnNU9MNFdjdk1pbzJC?=
 =?utf-8?B?M0tLLzRKU2hvYzZHOFFkdVZUa2VnUU5EaG56akdUZ0VkZVdrWjR1NVRNUHZs?=
 =?utf-8?B?OFh5MmpncHY5cnYyN3Z0WjBENjFCSnpkd1dsNHB1TThEZXRIZnpnWXdNWkp0?=
 =?utf-8?B?ZzREZHFiWlZDY3A2ZkxYbnF1c3lLWTRSZlVKdHlFZkhMMnVmemF0bFAxY1hy?=
 =?utf-8?B?ZnNqU0JOQWxibXhpRmo2L1Bwb0xGMW5MaTZhMkw0dGpxMkhvdTBJVUNOOEl0?=
 =?utf-8?B?bndyWUZ6ZU5Cb3dkdUErTXU1WjZNbkZQQVhJWndLemlEeUlOYmJmQmlyZG4x?=
 =?utf-8?B?cXNLenEveXhwbVBLV3JMSm5jY3p0OTI3bVpnWFdJZk9vN3l6bFM4MXBIREdH?=
 =?utf-8?B?Q0s2dkZSTUo4NXlsenBZcW5JNGZaVFNQNGh3MkFiNEpaV1lyUFI2SGJvNEpM?=
 =?utf-8?B?M2NxNXZEZkN2emkxQzBSa2hWckYwSHJobzVxUEF1TGtrTGs1UjdDMGNyd0p5?=
 =?utf-8?B?cy9lTUlNSFdEaU9hYi9USHFtZnljMU1lZkRhYnhCZ0hmZGtidnNhdkFCcHh6?=
 =?utf-8?B?K0I1ditCMkN6Qjh4blBGZXNPOXJrWTh6aXBLQlYwQ0hGd0VjUXdHN1BlbXdL?=
 =?utf-8?B?d2IvWVNMUVl1azhaRDZmaVJIMGxwMGcwb1dYUHIxTEx0NkRuNzRKVGhTTGtL?=
 =?utf-8?B?UlRhVTFxbDlLUUZuNkhWS3NXbHFzV0NoMkFxTlRyY01zOUFqU3dkQlFaSmdQ?=
 =?utf-8?B?QVk5L3Z6a0E1OFB3TXZHazJpSEcrSUN4MTF3L0d6ZVg4TmVYVVlFM1dWOXdQ?=
 =?utf-8?B?aExSUERrQzB2Nkt0aURYUVp5V3BwNndHZEkvVE02M3lra1ZTWWM1M3Y1QUZZ?=
 =?utf-8?B?WGIyWjVvd2RmekNySnV3L2FGcGppQ1FXak8zT0lJWXM0Mm9qOWxrdkFzandL?=
 =?utf-8?B?b3NrZmtRY2E5c2NzZXkrZEswU2tuaThlcTJSN2p1T2tJYnd5bStwekwxR1dF?=
 =?utf-8?B?WlIzU0JzZ0xIbGlwU1RZSHNJbmozcjRjOE9LckQvS1pSTW14YnVldlAySStj?=
 =?utf-8?B?Umdia3Erc0huK3FOaDNyeWZmNnNYTWl5aDliTDdoTXo4bFhsQUN2eVcxb1N5?=
 =?utf-8?B?WGRCUWIzSWFPMWdLa0txaFdmeG40dkJWQzZoOXJvK0dCKzBqUHhSbFJXR3lF?=
 =?utf-8?B?NGtDRVl6VisyckttN2lwVjBodmFPRGIzbTYycllqbmRVbHpLc081anpXYm14?=
 =?utf-8?B?K3RMK1Z4NkVoU3AwYmVpbVlGaDBlR2R2NVdvd253ZGRsUGkrNkVIQ2tENXdW?=
 =?utf-8?B?TkxLb01HdzJQR01WczBBeFkwMkFRWnhxcTl1NW5ORExwbHlEMFpxWStrUTND?=
 =?utf-8?B?Z0ttcDYxZXFaYWlvd1NvVTlwMGUraHlGV2tlSGhWSEdzM1ZzWHF5OWlXNjA3?=
 =?utf-8?B?bitRZ2xyWDIzaGVYeVJiRlFEQlo4YnpabktOZVB4bDJSMU9YNWc0MXFhUndY?=
 =?utf-8?Q?3MNz1h5oNQXRU9yaaIylGBSgG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8836d918-cc2f-4735-b427-08ddd3da1a97
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 04:39:46.0306 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 62JHPSbZM+VezY2iotrNxQ/n4Pm0jRTwh/zWwH3aO9UZ3l/3808bV7telFU+F6yGitwL5k/R94A300IZ8wnxZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6716
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

Hi Anirban


On 8/5/2025 12:54 AM, Sk Anirban wrote:
> Add i2c adapter presence check in survivability mode to ensure
> the Add-In Management Controller (AMC) can receive firmware updates
> when the device is in survivability mode.
> 
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   tests/intel/xe_configfs.c | 50 ++++++++++++++++++++++++++++++++++-----

Don't add this in configfs file. Let's create a new test for 
survivability and move runtime survivability and i2c check there.
Configfs here shouldn't be checking the entire functionality of
survivability mode. This is only to have basic checks

Thanks
Riana
>   1 file changed, 44 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
> index 5c65cd01d..a3af84b6a 100644
> --- a/tests/intel/xe_configfs.c
> +++ b/tests/intel/xe_configfs.c
> @@ -2,7 +2,9 @@
>   /*
>    * Copyright © 2025 Intel Corporation
>    */
> +#include <dirent.h>
>   #include <limits.h>
> +#include <fcntl.h>
>   
>   #include "igt.h"
>   #include "igt_configfs.h"
> @@ -24,6 +26,34 @@
>   
>   static char bus_addr[NAME_MAX];
>   
> +static int find_i2c_adapter(struct pci_device *pci_xe)
> +{
> +	char device_path[PATH_MAX];
> +	struct dirent *dirent;
> +	int i2c_adapter = -1;
> +	DIR *device_dir;
> +
> +	igt_require(igt_kmod_load("i2c-dev", NULL) == 0);
> +
> +	snprintf(device_path, sizeof(device_path), "/sys/bus/pci/devices/%s/%s.%hu", bus_addr,
> +		 "i2c_designware", (pci_xe->bus << 8) | (pci_xe->dev));
> +	device_dir = opendir(device_path);
> +
> +	if (!device_dir)
> +		return -1;
> +
> +	while ((dirent = readdir(device_dir))) {
> +		if (strncmp(dirent->d_name, "i2c-", 4) == 0) {
> +			sscanf(dirent->d_name, "i2c-%d", &i2c_adapter);
> +			closedir(device_dir);
> +			return i2c_adapter;
> +		}
> +	}
> +
> +	closedir(device_dir);
> +	return i2c_adapter;
> +}
> +
>   static void restore(int sig)
>   {
>   	/* Restore after survivability mode */
> @@ -42,10 +72,12 @@ static void set_survivability_mode(int configfs_device_fd, bool value)
>    * SUBTEST: survivability-mode
>    * Description: Validate survivability mode by setting configfs
>    */
> -static void test_survivability_mode(int configfs_device_fd)
> +static void test_survivability_mode(int configfs_device_fd, struct pci_device *pci_xe)
>   {
>   	char path[PATH_MAX];
> -	int fd;
> +	int file_fd, i2c_adapter;
> +
> +	i2c_adapter = find_i2c_adapter(pci_xe);
>   
>   	/* Enable survivability mode */
>   	set_survivability_mode(configfs_device_fd, true);
> @@ -53,9 +85,13 @@ static void test_survivability_mode(int configfs_device_fd)
>   	/* check presence of survivability mode sysfs */
>   	snprintf(path, PATH_MAX, "/sys/bus/pci/devices/%s/survivability_mode", bus_addr);
>   
> -	fd = open(path, O_RDONLY);
> -	igt_assert_f(fd >= 0, "Survivability mode not set\n");
> -	close(fd);
> +	file_fd = open(path, O_RDONLY);
> +	igt_assert_f(file_fd >= 0, "Survivability mode not set\n");
> +
> +	if (i2c_adapter >= 0)
> +		igt_assert_f(find_i2c_adapter(pci_xe) >= 0, "Failed to find i2c adapter in survivability mode\n");
> +
> +	close(file_fd);
>   }
>   
>   /**
> @@ -120,9 +156,11 @@ static int create_device_configfs_group(int configfs_fd, int fd)
>   igt_main
>   {
>   	int fd, configfs_fd, configfs_device_fd;
> +	struct pci_device *pci_xe;
>   
>   	igt_fixture {
>   		fd = drm_open_driver(DRIVER_XE);
> +		pci_xe = igt_device_get_pci_device(fd);
>   		configfs_fd = igt_configfs_open("xe");
>   		igt_require(configfs_fd != -1);
>   		configfs_device_fd = create_device_configfs_group(configfs_fd, fd);
> @@ -132,7 +170,7 @@ igt_main
>   	igt_subtest("survivability-mode") {
>   		igt_require(IS_BATTLEMAGE(intel_get_drm_devid(fd)));
>   		igt_install_exit_handler(restore);
> -		test_survivability_mode(configfs_device_fd);
> +		test_survivability_mode(configfs_device_fd, pci_xe);
>   	}
>   
>   	igt_describe("Validate engines_allowed with invalid options");

