Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52FBAE674B2
	for <igt-dev@archiver.kernel.org>; Mon, 22 Dec 2025 14:04:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C99E10E6B4;
	Mon, 22 Dec 2025 14:04:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="khosIdM0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F55A10E6B4
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Dec 2025 14:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766412294; x=1797948294;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=gUwKtRvRxEOqiKhEQ7KJwrmk9y0YOiV8zvxAecz7N8g=;
 b=khosIdM0fD7VJbf2rSQ/hUmQWou35dSPbmrZOCFsmOnJYjmcIdWipthD
 7ZnZWgKzxIJwzRCdZywJuMgb1jpKKHbRmc3BTerOV99J5LsEtfe99MAiW
 dmx+hEBMBKebYMEv87vU7+pZ6U8eQ+yBOydnYEtM5mcjPzTUHhGLIPrAj
 bRQYeGF7rgtRKAjm4vOjcI2xeiJJvtU+mtayMtfWUvM0kYtcRtW7QZF1X
 FJfgchK1djiN5whPopSIED6frAvyzP9cxRFtHrgoOyIquMOhfdRgx32ZK
 K5puoNd6g4FDRj0prBzhDs+nSTQZFCn9B6sB9QX2oEwRNqRjojkEDGZv4 g==;
X-CSE-ConnectionGUID: Nt5gN/G7RrKzXSrb9GbJiw==
X-CSE-MsgGUID: RGDv2bDyR3GTZpr2hIlYnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="93737175"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; d="scan'208";a="93737175"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 06:04:54 -0800
X-CSE-ConnectionGUID: d5aOwCI7TnSHPt2kHhgHDg==
X-CSE-MsgGUID: TyFzIu8KQ6ujvql6XxRgYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; d="scan'208";a="199567179"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 06:04:53 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 22 Dec 2025 06:04:53 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 22 Dec 2025 06:04:53 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.33) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 22 Dec 2025 06:04:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VtwrPPEYKQmQ1nuWXwVaVy5LSH3spYqIESOcJTbYtoZyvHnCJiLBiAv5vkqMtxwgAtgp1+PCAoNWaGx+4qQBMJb+p7oj8c2R+Xl0q66MYBVRU1HKru+xQZ8dwdyfoJ8BZMcOStXUi2+e3OEyXs8XobTqk7JY6v7k7serou66VYUTgAPMkTUYOyF05onPM+ZKyj3O+DecZ9qJRd2i6SxVBe8ePS+ZUBuqmzVUTV9SDMN18WYOHMJvO/qTjZ82fvcBWP+O0H5Iq45tvkENGBHqySGHqQQJBJb1H4ijBZVoZ9ugBH/I2/WAnwgGHpFKx0MDkGWeUqfb1nj7KzFd+pdQtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C8U8vy8DoyHJ02tYtX80tq8ejj41HtORrYPhzmNqjsc=;
 b=BIloSdY2B95OQ+dFerWb2A2n8OVRz6wM+ucn5J18BYPvrLAawQD/mA+9p/7x2rDIzy1uYwg7edR+DRmElWtiTO6ZHNmkIgOsR9L3jhfx3HtzQ2UCnJ9bRJOXlOtK15MJSUH/zz9lK7iOCD8+hnGQKMoUVdfSEHZgtYVsykEc0sqA2a4XORni7fNBbUclw4WyEM1p/maRkVj0EDjYo+ZG67z9rLRgqcRwybdLTs3bOW7dbGOq2Z0T0uk73u1lDj/jQ5I9q7slYCRjYF4xnjwBzRza5k5TkgUQqSL+nZmy+zUYrIP0qYtlMTY9yjC/ViULpc/RjI8HRsHxg/NuYznjuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DS4PPF1DFB73954.namprd11.prod.outlook.com (2603:10b6:f:fc02::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 14:04:51 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b%3]) with mapi id 15.20.9434.009; Mon, 22 Dec 2025
 14:04:51 +0000
Message-ID: <ce7d6156-0183-429b-82ed-9832850649ea@intel.com>
Date: Mon, 22 Dec 2025 19:34:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t,v7 6/8] tests/kms_color: Add Intel plane pipeline
 tests with LUT1D and CTM
Content-Language: en-GB
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20251219112606.1330425-1-swati2.sharma@intel.com>
 <20251219112606.1330425-7-swati2.sharma@intel.com>
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20251219112606.1330425-7-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0030.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::14) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|DS4PPF1DFB73954:EE_
X-MS-Office365-Filtering-Correlation-Id: 09994f1c-04de-41d6-f46d-08de41631339
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?blhrNFQ4SmQ0a3NhWjF6MXRZRENPemlVcTA3SFd1RTE3STJhRGtRbVhrTzFR?=
 =?utf-8?B?dlNEWi93OThzVGdIZ09zaVNoRzlURGtmMDFhR1hEdnFBS1dBNUZROFNPK3Vn?=
 =?utf-8?B?MnJUYXJCOER5RGhSMlVkVzhGY25WeUdMM1ZOUW54ZHhVdmdVM3RnR3ZpY2Rz?=
 =?utf-8?B?UGhhcmI4QXAyMWoxc0E3bEZTcUZaWVNDRXhmc296UTFFc3p0WlRubE9QQkpx?=
 =?utf-8?B?clZ3c0ppVktOZHkwNldRQ00xeGVLREF1a2prckl0YXYzSUMvNUxqSThkeHJW?=
 =?utf-8?B?MXY0UDRWZUo5eEplZ2tuZ2tBYlFSRWdYL1U4ZVp5NjVtcFlqRWJISDQxbndR?=
 =?utf-8?B?cW90VExkN2E4dG43eEFzZXQvTXJ3TWR1Smk0NFJTL2xCZjgzVlJKZUFjWm9U?=
 =?utf-8?B?aXp3RnBBRC84c2lCVTV2UkVMbkp6Z0Nnb3dlbGw3QVMyR2lsMWFDSmdUbFNW?=
 =?utf-8?B?dEhuVEJoTExJakdMVWJFczJCTEZMbFFtQm0rdVVVMzJnSXUxeUk3ZjZHRFFG?=
 =?utf-8?B?R2VDaksyYTlMV2x5cnpRUC9PMkdPd3hJMTdQVFQzZjB2WFBmdDVrZmlmU3Bp?=
 =?utf-8?B?S0hsMHRpdndHVWhsR1VQU2NHRlYzckpqbHJMdDJIRWRUK2lIS0VlQUs5WVFh?=
 =?utf-8?B?ampvNXpHTDVlN1dNMHNHT2x6bi94N093Z0ViNkd1bHNBYlNiaTVZMXJVQnk3?=
 =?utf-8?B?ZEE3Q0hRT2tDYXFWT3F1WFh3TUdsVWR5Znlpb0U2RXpoaFM0MmFNY1RGMEV3?=
 =?utf-8?B?cG9CT3FPTm81MUxQM1R3SjhTcmw0c0lwL0kwLzVtZ2VJQWhOK0hBbFZ1T2p3?=
 =?utf-8?B?M0VralorREJPT3REN3E2TEoxOHZrNDRYVW1wZlpGcGNGeURJVzNRVmxqblJr?=
 =?utf-8?B?OFZVVmdNZU14VkhreThrMElMMWFkbWVEYTRRL2JxclRCRHZ0QzZjd1krMXNZ?=
 =?utf-8?B?bzJtdFJJU1J1VUs0UVMvaWt4SzFJSEd5QUM4R0ZqU2VUUnIwVll1WVpPTXZq?=
 =?utf-8?B?aUlpK3JVTjhsUFpqUDRGZWRMTVhsOFcwcFdhN05Ka1l6SFpGQUJpS0VlaURT?=
 =?utf-8?B?akFXSGF3V1pBaGZwdXRoc1F2eFlXVmZUaUh3Qit5V2hpcGhOYUJidVF2Rkdo?=
 =?utf-8?B?UWVseE5VOWpWaG9OUmNJNFJsL3d3T2EvS1V4ek4yZjhPVWN0SnByLzFNRFg5?=
 =?utf-8?B?bWVZQUljOVVpN2xQOVpvUjhrZDBCQVdtNGdlejU0QnV2MEpBTm1FcjF2Um1u?=
 =?utf-8?B?R0IwcVFtY25ETU9SYjhVb0FoQ1FDYlJBWTlGdjJwaUZSSEwxbVlkUVpRUTZm?=
 =?utf-8?B?NS9Yd2lWaUFhMW5FRVVUeUdGcU9VZC93S3Q0em9LUVdaWEd5VkJqRFV5R1ph?=
 =?utf-8?B?VTJ6VC9oV0JZN3FDbVBpdStPM2taSnRrU0svTXhaUmhQbXpBYnh2YjdqR2Rj?=
 =?utf-8?B?K3o3QUtkMDZJWDhZUGJGMnBUV3lnWE94eVZnMW8zYy9uU3AzY2p4d0puNFp5?=
 =?utf-8?B?T29EbFBxODZqbTUwMm9QanVTbkYwRjJvNU11ckNaZU1vcHVKUFFDY0h0K1Yr?=
 =?utf-8?B?bzdKQmthQVR3OFMxWENndGR5d3BEKy9mdmpNUkN1Kzc2K0JpajYrSStuZjl4?=
 =?utf-8?B?R2gwNVJuRE1ZWDV3YWZjT3E0MTF4b3ZDOVFuSEZXZE84QWN3dWd0eCtob2Vv?=
 =?utf-8?B?eVNySDQwRmlkemt6aHBVS25uc0JyK1FhWW43b2VmKysxZUNzRTNwRms5ZGtS?=
 =?utf-8?B?K1pRTWp0WnR6R1JsTTdBeTlNZmdYaXhMdmI4RHhZUmZudE96aGJwd09NQXNw?=
 =?utf-8?B?dURPSVQyVDhUdDRBUnJ2cW9oQVFkZmdvMnhpUCtKZGRYbmQzRG5RV0lGRU9H?=
 =?utf-8?B?NlkzN1NZaCtsNjZqYllRM2NZVlVCU0hrUVpVNFFrdzdibkFPZHJoR3F2clBU?=
 =?utf-8?Q?lORx1ZJk5v4vczimmq8U7NVrNkN6o3U6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWU5bnhTOE1Yd0syTWYzNjQyakJmQzBZbWJiUGpmRW40Z2grdG1lVkdHeGlw?=
 =?utf-8?B?THpyY01FQW9aQUFmMVZuNmhrRFFqUnR1NWsrWEIwRFBVY3l2WGlIakZ0OUVE?=
 =?utf-8?B?MXQ2WUV1alZCb1ZqSmpkbWxIZ2czanZtQmtlQU9WZlpTWFkwczI0U0c4eUNP?=
 =?utf-8?B?dFJnRkpJZE0vRzhSWlY0TEJUVzFRU1dOMi9IYlQvK0lRMmFkaUtOWHJDbzU5?=
 =?utf-8?B?REZXWThIY0hTM29ZQ255bXVVdXFLOUdnWkx3dE1IWENEUGtJVzRNVjhYODEy?=
 =?utf-8?B?Y0xnYnBtcTdHTVBJVHNmRTNVNENnalNoMEZ6dk42Yy9aRkZ6RE9lUEJGTmE3?=
 =?utf-8?B?ZWpiWGVFQmxNYk9URkhFbUJ2V1FsaWJqeGhuUE9kd0EraTIrTk1CUkkzb1Q0?=
 =?utf-8?B?dVowb05ST0EyZU5vQTFQbkNkU2VTSmFkcUJyOTBCVUVldVFvM2cybGpQSmV0?=
 =?utf-8?B?VHdNRVlwNTNueEJoNnN1ZFJXNVgwY0ZyYTJZYU85TTJPWVRsUTdtNGJ0MG1o?=
 =?utf-8?B?Wis1QzNRR0NNTXdxMVdXSDcxaFI1emtnYmg0bGdVeHRBVENwTTAwUmNPem56?=
 =?utf-8?B?VzA0TFFkb2FRcDlUajd2UGVNSHVvWXdtWXpFOVlYUmVwR0ZscDV2bld6L3pS?=
 =?utf-8?B?T3kwR3NGeTF3Wlh4SGl5NVUrL0graFJJd1VXWWZPUExDM1FTeTg0TlRUYWxL?=
 =?utf-8?B?bGxtd1hKdmdzZXp5dnN1NkhtTkJSS3RaaXgzVzI1d0lSODVIN1VWMWpiRUNQ?=
 =?utf-8?B?R0lCcUx4SFNZMFVxRWR5TFN1RHkya2grQUpTbnhWV3lRL3U3ZE9HcEsrTDZZ?=
 =?utf-8?B?NmtnVDVJaGFDNWdkdnIvUzFleGRtY2tNMUR1WGEzTmYvSXcyV2h5dm1VckQ4?=
 =?utf-8?B?bGp1L2hsYml4c29NRkYzZGtZK0d6dllmRHpEbXU3OWY5UWU1VjBWMTJUdExX?=
 =?utf-8?B?VnM0aHpwRlVKK2FYcDRCRkRacmo5VkxscklRNExOSFAzNlNOdkFyN0haMHFV?=
 =?utf-8?B?MkdzZVNmMnpiWG5zRmtTRkFVWnhNY0hGOXB0aVBmNVU1MU9vTlZHa2tzeFMz?=
 =?utf-8?B?bDZ4MFFzaU5kZGRYblMzb2hKMXY2dGk1OGJnenlBRDg1VDRCeWNsVUlKWGk2?=
 =?utf-8?B?U1o3M3c5dldIaTBaRExsVDFvWWd5Nzg5N1EzaGNTWkx5aVFxVHJ1cWF4Zjh2?=
 =?utf-8?B?YWdyTVFZVklTQlgxMWl0Y2dvOXFqdUsrR25yekwvMEpscEVsMDFpSStxRDI4?=
 =?utf-8?B?RzFLeEpQMjlhK21UVkFZb0FkOE9oYzJVWXloNWl3TlNiMFFHdGJBcGdteEtQ?=
 =?utf-8?B?V2JIN2FaTnNaVWNXTnBQbUk3NENxczc5Rys3TmNSWENHVktkL2lieCtYTDNU?=
 =?utf-8?B?b2hJcmFrRXNIdUprczV2ZHBINHYrckdZRWFZU1YrWVNweWd3TVlnQU5iRVd3?=
 =?utf-8?B?U3k1WnQ1NWJaNndwSzJvWUp5bFAzMk04S3YzTndvTTBrc1o4U2JUdDk5SVc3?=
 =?utf-8?B?RCtWOUUwakFlSzlPVHQxbkF2VGFlUHVPNVJZTkhvMXp6UGs5eis4NlJNV3NJ?=
 =?utf-8?B?d1JWNUhOeDNSVXlSYUNUOENaTVRaMmkzWVJ5cUQvSVV1bEhqcmgyTmYwYkpp?=
 =?utf-8?B?UnQ2VDE4czZrOXNtKzg2MGhPSzJwRTJvT3ZjS04zM3duOGt4UHAyemhOeEJq?=
 =?utf-8?B?Q0xqY2l1WG9pMVlWZ0J6TnJpU2RJd1cwNWVXY0VpV2ZqT1d6UnhPTG4yVE1m?=
 =?utf-8?B?ODk3dFN0MlA4S1V3cFU5VEloQUhPck9SeVRWOUVFMUQrUTQ4cjAyc3J0YTZE?=
 =?utf-8?B?aHhaekFJbC96bUU2U3ZaY0pOUGdGRCtUREFQYWZVVWlJL2ZLWTZ6T0JIaHdw?=
 =?utf-8?B?cW9VWWorS3JmMFV2TVA1UTE1QXFpN0pQQnoycGMxcVRUanJtYXoveDVIUVRT?=
 =?utf-8?B?ZXV0STBxWDk0a0hFMXMwMFBwelNvMmNieWVadzYwQ01OQzBDRk9LZmJwN1M1?=
 =?utf-8?B?Yno5T2VBNGkvY0djZzJTS1R3WlFHa0J6d2ZVc2VaZ21hWlJXc21QYnZzeFVx?=
 =?utf-8?B?MFMweWMzQVhLWmtwWUNVM3Zrclc1eDRBZERLV0lscGo1STBsNytxVkY3aEpW?=
 =?utf-8?B?YUJIb2xvNndXR2tzWEpBQTNBOUVVRWtjMy9DclpXaTFNZ3RjODhDbjNxOW1E?=
 =?utf-8?B?TDJFckpiVjd5UG5TeExmdUJHU3ZxSkNEOHVXWmVLMHJ1Q3lWSjdJekRXa2Na?=
 =?utf-8?B?ZTFQblZZTW9PM0ZYVlpyYktJUmMxQVVJUldMSUhqNEZHVGZzVFNxQWhQYzdW?=
 =?utf-8?B?Um1kWmprTUJQeWhkMHd3T2xLWWkrNEU1ZjlTRFhRVnZISXBObitQcTZUczhz?=
 =?utf-8?Q?bMSOIIuSE08jn7jc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 09994f1c-04de-41d6-f46d-08de41631339
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 14:04:51.6254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KOEpmPWaxMop0p2A7v7v80hICFoqK6WQ/uzqzxqMOSuJ0jmHMm/wdT7roISVKMzB214N2VSQ/UJ7AeMbkYqe5k85FwOjoBDp7CZkJp9oId4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF1DFB73954
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



On 12/19/2025 4:56 PM, Swati Sharma wrote:
> For now, Intel plane color pipeline contains 3 colorops:
> Pre-csc gamma (1D LUT) --> CTM 3x4 --> Post-csc gamma (1D LUT)
> 
> These tests follow a common flow: primary plane is configured with a
> deterministic test pattern, one or more colorops are enabled in a
> specific order on the plane color pipeline, and the corresponding
> color properties are programmed with known transformation values.
> The output is then validated by comparing the resulting frame
> against the expected transformed output using CRC based
> verification.
> 
> Separate subtests exercise different valid combinations of the
> available colorops to ensure correct programming, ordering, and
> interaction of plane color pipeline elements:
>    igt@kms_color@plane-lut1d
>    igt@kms_color@plane-lut1d-pre-ctm3x4
>    igt@kms_color@plane-lut1d-post-ctm3x4
>    igt@kms_color@plane-lut1d-ctm3x4
>    igt@kms_color@plane-ctm3x4-lut1d
>    igt@kms_color@plane-lut1d-lut1d
>    igt@kms_color@plane-lut1d-ctm3x4-lut1d
> 
> v2: -add new tests pre/post ctm (Chaitanya)
>      -remove redundant code (Chaitanya)
>      -create plane tests subtest_group (Chaitanya)
>      -add/use transfer linear/max func (Chaitanya)
>      -improve commit message (Chaitanya)
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   lib/igt_color.c   |  19 ++++++
>   lib/igt_color.h   |   6 ++
>   tests/kms_color.c | 146 ++++++++++++++++++++++++++++++++++++++++++++--
>   tests/meson.build |   2 +-
>   4 files changed, 168 insertions(+), 5 deletions(-)
> 
> diff --git a/lib/igt_color.c b/lib/igt_color.c
> index a34872763..4d94421ba 100644
> --- a/lib/igt_color.c
> +++ b/lib/igt_color.c
> @@ -19,6 +19,9 @@
>   const struct igt_color_tf srgb_eotf = {2.4f, (float)(1/1.055), (float)(0.055/1.055), (float)(1/12.92), 0.04045f, 0, 0};
>   const struct igt_color_tf bt2020_inv_oetf = {(float)(1/0.45f), (float)(1/1.0993f), (float)(0.0993f/1.0993f), (float)(1/4.5f), (float)(0.081), 0, 0};
>   
> +const struct igt_color_tf linear_tf = {1.0f, 0.0f, 1.0f, 1.0f, 1.0f, 0.0f, 0.0f};
> +const struct igt_color_tf max_tf = {1.0f, 0.0f, 1.0f, 0.0f, 1.0e-6f, 0.0f, 0.0f};
> +
>   const struct igt_color_tf_pq pq_eotf = {-107/128.0f, 1.0f, 32/2523.0f, 2413/128.0f, -2392/128.0f, 8192/1305.0f };
>   
>   igt_1dlut_t igt_1dlut_srgb_inv_eotf = { {
> @@ -27,6 +30,12 @@ igt_1dlut_t igt_1dlut_srgb_inv_eotf = { {
>   igt_1dlut_t igt_1dlut_srgb_eotf = { {
>   } };
>   
> +igt_1dlut_t igt_1dlut_linear = { {
> +} };
> +
> +igt_1dlut_t igt_1dlut_max = { {
> +} };
> +
>   static float clamp(float val, float min, float max)
>   {
>   	return ((val < min) ? min : ((val > max) ? max : val));
> @@ -130,6 +139,16 @@ void igt_color_srgb_inv_eotf(igt_pixel_t *pixel)
>   	igt_color_inv_tf(pixel, &srgb_eotf);
>   }
>   
> +void igt_color_linear(igt_pixel_t *pixel)
> +{
> +	igt_color_tf(pixel, &linear_tf);
> +}
> +
> +void igt_color_max(igt_pixel_t *pixel)
> +{
> +	igt_color_tf(pixel, &max_tf);
> +}
> +
>   void igt_color_bt2020_inv_oetf(igt_pixel_t *pixel)
>   {
>   	igt_color_tf(pixel, &bt2020_inv_oetf);
> diff --git a/lib/igt_color.h b/lib/igt_color.h
> index 45cf8f3c7..919330c8b 100644
> --- a/lib/igt_color.h
> +++ b/lib/igt_color.h
> @@ -45,6 +45,9 @@ typedef struct igt_1dlut {
>   extern igt_1dlut_t igt_1dlut_srgb_inv_eotf;
>   extern igt_1dlut_t igt_1dlut_srgb_eotf;
>   
> +extern igt_1dlut_t igt_1dlut_linear;
> +extern igt_1dlut_t igt_1dlut_max;
> +
>   typedef struct igt_matrix_3x4 {
>   	/*
>   	 * out   matrix          in
> @@ -93,6 +96,9 @@ void igt_colorop_set_3dlut(igt_display_t *display,
>   void igt_color_srgb_inv_eotf(igt_pixel_t *pixel);
>   void igt_color_srgb_eotf(igt_pixel_t *pixel);
>   
> +void igt_color_max(igt_pixel_t *pixel);
> +void igt_color_linear(igt_pixel_t *pixel);
> +
>   void igt_color_pq_inv_eotf(igt_pixel_t *pixel);
>   void igt_color_pq_eotf(igt_pixel_t *pixel);
>   
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index 85c7d89d6..711e2503e 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -32,6 +32,8 @@
>   
>   #include "kms_color_helper.h"
>   
> +#define MAX_COLOROPS	5
> +
>   /**
>    * SUBTEST: degamma
>    * Description: Verify that degamma LUT transformation works correctly
> @@ -76,7 +78,23 @@
>    * @gamma-lut:          Gamma LUT
>    */
>   
> -IGT_TEST_DESCRIPTION("Test Color Features at Pipe level");
> +/**
> + * SUBTEST: plane-%s
> + * Description: Test plane color pipeline with colorops: %arg[1].
> + *
> + * arg[1]:
> + *
> + * @lut1d:				1D LUT
> + * @lut1d-pre-ctm3x4:			1D LUT PRE CTM 3x4
> + * @lut1d-post-ctm3x4:			1D LUT POST CTM 3x4
> + * @ctm3x4:				3X4 CTM
> + * @lut1d-ctm3x4:			1D LUT --> 3X4 CTM
> + * @ctm3x4-lut1d:			3X4 CTM --> 1D LUT
> + * @lut1d-lut1d:			1D LUT --> 1D LUT
> + * @lut1d-ctm3x4-lut1d:			1D LUT --> 3X4 CTM --> 1D LUT
> + */
> +
> +IGT_TEST_DESCRIPTION("Test Color Features at Pipe and Plane level");
>   
>   static bool test_pipe_degamma(data_t *data,
>   			      igt_plane_t *primary)
> @@ -709,7 +727,6 @@ static void test_pipe_limited_range_ctm(data_t *data,
>   }
>   #endif
>   
> -__maybe_unused
>   static bool ctm_colorop_only(kms_colorop_t *colorops[])
>   {
>   	int i;
> @@ -720,7 +737,6 @@ static bool ctm_colorop_only(kms_colorop_t *colorops[])
>   	return true;
>   }
>   
> -__maybe_unused
>   static bool test_plane_colorops(data_t *data,
>   				const color_t *fb_colors,
>   				const color_t *exp_colors,
> @@ -913,7 +929,6 @@ run_ctm_tests_for_pipe(data_t *data, enum pipe p,
>   	test_cleanup(data);
>   }
>   
> -__maybe_unused
>   static void run_plane_color_tests(data_t *data,
>   				  const color_t *fb_colors,
>   				  const color_t *exp_colors,
> @@ -1267,6 +1282,126 @@ run_tests_for_pipe(data_t *data)
>   	}
>   }
>   
> +static void
> +run_tests_for_plane(data_t *data)
> +{
> +	static const color_t colors_rgb[] = {
> +	        { 1.0, 0.0, 0.0 },
> +	        { 0.0, 1.0, 0.0 },
> +	        { 0.0, 0.0, 1.0 },
> +	};
> +	static const color_t colors_red_to_blue[] = {
> +		{ 0.0, 0.0, 1.0 },
> +		{ 0.0, 1.0, 0.0 },
> +		{ 0.0, 0.0, 1.0 },
> +	};
> +	const igt_matrix_3x4_t ctm_red_to_blue = { {
> +		0.0, 0.0, 0.0, 0.0,
> +		0.0, 1.0, 0.0, 0.0,
> +		1.0, 0.0, 1.0, 0.0,
> +	} };
> +	const igt_matrix_3x4_t ctm_linear = { {
> +		1.0, 0.0, 0.0, 0.0,
> +		0.0, 1.0, 0.0, 0.0,
> +		0.0, 0.0, 1.0, 0.0,
> +	} };
> +	kms_colorop_t lut1d_linear = {
> +		.type = KMS_COLOROP_CUSTOM_LUT1D,
> +		.name = "Pre/Post CSC GAMMA (linear LUT)",
> +		.lut1d = &igt_1dlut_linear,
> +		.transform = &igt_color_linear,
> +	};
> +	kms_colorop_t lut1d_max = {
> +		.type = KMS_COLOROP_CUSTOM_LUT1D,
> +		.lut1d = &igt_1dlut_max,
> +		.name = "Pre/Post CSC GAMMA (max LUT)",
> +		.transform = &igt_color_max,
> +	};
> +	kms_colorop_t ctm_3x4 = {
> +		.type = KMS_COLOROP_CTM_3X4,
> +		.name = "CTM 3X4 (red to blue)",
> +		.matrix_3x4 = &ctm_red_to_blue,
> +	};
> +	kms_colorop_t ctm_3x4_linear = {
> +		.type = KMS_COLOROP_CTM_3X4,
> +		.name = "CTM 3X4 (linear)",
> +		.matrix_3x4 = &ctm_linear,
> +	};
> +
> +	struct {
> +		const char *name;
> +		const color_t *fb_colors;
> +		const color_t *exp_colors;
> +		kms_colorop_t *colorops[MAX_COLOROPS];
> +	} plane_colorops_tests[] = {
> +		{ .name = "lut1d",
> +		  .fb_colors = colors_rgb,
> +		  .exp_colors = colors_rgb,
> +		  .colorops = { &lut1d_max, NULL },
> +		},
> +		{ .name = "lut1d-pre-ctm3x4",
> +		  .fb_colors = colors_rgb,
> +		  .exp_colors = colors_rgb,
> +		  .colorops = { &lut1d_max, &ctm_3x4_linear, NULL },
> +		},
> +		{ .name = "lut1d-post-ctm3x4",
> +		  .fb_colors = colors_rgb,
> +		  .exp_colors = colors_rgb,
> +		  .colorops = { &ctm_3x4_linear, &lut1d_max, NULL },
> +		},
> +		{ .name = "ctm3x4",
> +		  .fb_colors = colors_rgb,
> +		  .exp_colors = colors_red_to_blue,
> +		  .colorops = { &ctm_3x4, NULL },
> +		},
> +		{ .name = "lut1d-ctm3x4",
> +		  .fb_colors = colors_rgb,
> +		  .exp_colors = colors_red_to_blue,
> +		  .colorops = { &lut1d_max, &ctm_3x4, NULL },
> +		},
> +		{ .name = "ctm3x4-lut1d",
> +		  .fb_colors = colors_rgb,
> +		  .exp_colors = colors_red_to_blue,
> +		  .colorops = { &ctm_3x4, &lut1d_max, NULL },
> +		},
> +		{ .name = "lut1d-lut1d",
> +		  .fb_colors = colors_rgb,
> +		  .exp_colors = colors_rgb,
> +		  .colorops = { &lut1d_linear, &lut1d_max, NULL },
> +		},
> +		{ .name = "lut1d-ctm3x4-lut1d",
> +		  .fb_colors = colors_rgb,
> +		  .exp_colors = colors_red_to_blue,
> +		  .colorops = { &lut1d_linear, &ctm_3x4, &lut1d_max, NULL },
> +		},
> +	};
> +
> +	igt_fixture() {
> +		int has_plane_color_pipeline;

This should be initialized to 0.

> +
> +		if (drmSetClientCap(data->display.drm_fd, DRM_CLIENT_CAP_ATOMIC, 1) == 0)
> +			data->display.is_atomic = 1;
> +

We should be good without this because igt_display_require already calls 
this.

> +		if (drmSetClientCap(data->display.drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
> +			has_plane_color_pipeline = 1;
> +
> +		igt_display_require(&data->display, data->display.drm_fd);

 From a brief look, this atleast leaks things allocated with 
drmGetPlane() which are freed in igt_display_fini(). This suggests that 
we should eventually have a completely a different test 
(kms_color_pipeline).

For now, a simple hack  would be to call igt_display_fini() before this 
instance of igt_display_require(). So that all resources allocated by 
the first igt_display_require() are cleared. Still fragile but works for 
now, I guess.

==
Chaitanya


> +
> +		data->display.has_plane_color_pipeline = has_plane_color_pipeline;
> +
> +		igt_require(data->display.is_atomic);
> +	}
> +
> +	for (int i = 0; i < ARRAY_SIZE(plane_colorops_tests); i++) {
> +		igt_describe_f("Test plane color pipeline with colorops: %s", plane_colorops_tests[i].name);
> +		igt_subtest_with_dynamic_f("plane-%s", plane_colorops_tests[i].name)
> +			run_plane_color_tests(data,
> +					      plane_colorops_tests[i].fb_colors,
> +					      plane_colorops_tests[i].exp_colors,
> +					      plane_colorops_tests[i].colorops);
> +	}
> +}
> +
>   int igt_main()
>   {
>   	data_t data = {};
> @@ -1283,6 +1418,9 @@ int igt_main()
>   	igt_subtest_group()
>   		run_tests_for_pipe(&data);
>   
> +	igt_subtest_group()
> +		run_tests_for_plane(&data);
> +
>   	igt_subtest_group()
>   		run_invalid_tests_for_pipe(&data);
>   
> diff --git a/tests/meson.build b/tests/meson.build
> index ae48dfe04..5ffbf1a81 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -378,7 +378,7 @@ extra_sources = {
>   	'core_hotunplug': [ 'core_hotunplug.c' ],
>   	'dumb_buffer': ['dumb_buffer.c' ],
>   	'testdisplay': [ 'testdisplay_hotplug.c' ],
> -	'kms_color':  [ 'kms_color_helper.c' ],
> +	'kms_color':  [ 'kms_color_helper.c','kms_colorop_helper.c' ],
>   	'kms_colorop':  [ 'kms_colorop_helper.c' ],
>   	'kms_chamelium_audio': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_chamelium_color':  [ 'kms_color_helper.c', join_paths ('chamelium', 'kms_chamelium_helper.c') ],

