Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A1D5CD98F9
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jun 2026 04:41:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA33D10EBCF;
	Thu, 18 Jun 2026 04:41:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G0Tamnfd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27BCE10EBCF
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2026 04:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781757669; x=1813293669;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LjtA0kaiNrHkYeY6ZPtvGhPIIGye7PSUwUw/xuFofms=;
 b=G0TamnfdS8l5Nb6I+0NvighSJKYGuU2EsKUlRb5lYrLue0m3PUv5xPmI
 Z7HqeVgcfq5vz6EHvf66wJHrsk+MujcMDBXts4p0YcsjjJjTQjBB3iiYZ
 gbuxk41ApfdCipG2+eN4+v+K9DJDl7W2pY74G0h3rN4s8kOgi1xxjMUgP
 pH3BnvZvHDL8FxPfPaxr37jpJcQKlMH9Ea/mJHEGUVKJwwkIRDcjOzvh/
 ka/aGyMmxYWz9NFkk3ZNimZKm18Y9advu0dQepsRDjSYitXuB6N2wejo3
 uc74E3wJAUMTynBppIENvkEhNT/pPGvqDmshQ0Y8GCmYa7aU7NaN4uEKN w==;
X-CSE-ConnectionGUID: zvdDBHbsRRC0jumo5c/yow==
X-CSE-MsgGUID: F9MYzTfoQPqWIs+MpwFmPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="85138654"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="85138654"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 21:41:09 -0700
X-CSE-ConnectionGUID: 48m/6GNfRFyu9dBq++HU/g==
X-CSE-MsgGUID: Z3G/RoP1RSOssx29Rfp3QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="245888207"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 21:41:08 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 21:41:08 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 17 Jun 2026 21:41:08 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.56) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 21:41:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ee5FI08ZFx9B5g07V8q2pBwgJYoyKy/9OnQo85xCr7D28AhidFD5MW4WZS4IQM7zAgf35+4FgPUVeELhaP4AciE5tTpMVuz5giaAuDz4LS9magfYV6FdpJpmYTkqyn664oX9gt3pIaNPjoMA1RAF7rA3s9R9oJeVqkNKagOiBzf5QgzUsaU8wVkWX0tJnDAT1oA3anshZbjT5RQLAyccBCOZJBDaQRknwxGJG9UHITOsSxp/Q9faOMAxmfiVo+Aqai017EmISTJ6bzZTXhut7m+kE+51Vqw1mT9ZZN2IhuMItcY9vzFkgpM4EWhucS70bx/7aMPxh7YYmG+SzGNpwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LX7wJrt/25JxW3TkFD7xa0vxBgMUHfcRvqKfPVHWwtE=;
 b=L14JuUwsCub+J0R49OeCse6JQPtOXNw8zzS2MaDxfrptuJJ78wagxMDN/vEaO5Hq9XVw2I4dkIfVaR58OR3pygUKrLLeZ4OhYFDf6Lk3L0hXt29rbUhRM4uyMwiYYV3FhCOEL8z0KvHajdGZd2sBE4X/hRHJ6l+2LBdB3vOodcxKBggMWkO4wZCCkcVakBqSvIWCjua2lXn0GmdiRzLHWkxzeKysLybGQTLsc3yHDCvK4BfJt1fXVBUbaag1/X9DfONFqFqJXZdGHQ/CbPKNe+pirJwSqXd2VgiVAP+ygJhccHTTNYPGRZq/+/Hw3RyqVPBxDFyhVgos5Ilb4JLrXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7183.namprd11.prod.outlook.com (2603:10b6:8:111::10)
 by CH3PR11MB7369.namprd11.prod.outlook.com (2603:10b6:610:14d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 04:41:05 +0000
Received: from DM4PR11MB7183.namprd11.prod.outlook.com
 ([fe80::d9c7:d2fb:680d:1ee1]) by DM4PR11MB7183.namprd11.prod.outlook.com
 ([fe80::d9c7:d2fb:680d:1ee1%5]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 04:41:05 +0000
Message-ID: <92e5ac33-edad-4dc4-aed3-0a29d1bf9fb4@intel.com>
Date: Thu, 18 Jun 2026 10:10:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v9 0/7] Enable and Add new tests for DC3CO
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <animesh.manna@intel.com>, <mohammed.thasleem@intel.com>
References: <20260609034650.2281712-1-jeevan.b@intel.com>
Content-Language: en-US
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
In-Reply-To: <20260609034650.2281712-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0012.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::13) To DM4PR11MB7183.namprd11.prod.outlook.com
 (2603:10b6:8:111::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7183:EE_|CH3PR11MB7369:EE_
X-MS-Office365-Filtering-Correlation-Id: e01bc367-3851-43f5-ae08-08deccf3cee0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|18002099003|22082099003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: HGlM2uOyEWqN9omIII7RRmhSe1nh8rwIee23p3at8dmbbPl2KUPkUflv4CbyS5HG6DsxqzKU/MoWqSvTz8glLifDIqGwA5CwaBw2I1zhV/oyM4p3FUr1EMgB0yJghuA551zbhkFdMBbRcRjhawyV/eT8Cvmj02Q+RO1+W1CaOzIcCTDzfxjmtOgMN4ieCFWZ8mTqJnjm3nU9O8jZtc+Y0kyBeVBkAxsAN0V/wjDSDlO8xvS5//B5+2gmoulP+GXPz/gL7Y1/NXe4pz6meIgn1p8iaZUZw8mB52DpHBS6CO0/OpLPIAYrvq73YULo5PciQWMSxbQISzeaz8XJp7SCxFMe2XVGztxmDStaLUoYUibfz28ZKLW7aVwcuZGRv4S1Uq+vPv9va2Frfa4ymIIFujzDfHggJj+ZkPxzbB8nfM++g+MOP1PqfXD3acFX+6MQnhCng2AqHo+n3wQsj+JqYFAWmpcaZPhH2NaUpUOjoHvnI/0Hw16+8OnDvW3ARY0YkGdfoCra0yAXhiJiTVu2LO67Z90EABUzeYEGsU8VsHIs6H2Aqa3gSuGhUQaPjUUD11VyUucMTyX+2fFZuQMEYamT6mPh3nM2qhS+VLiA4i0gL7ooxgvX2Wy0hS4T5UTGISb57cAL/SrOWNqzIXFrkBRUQxVcIUx0X9PQ33ALJB9DaGbV9kEEAFADDvQ6PBTQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7183.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(18002099003)(22082099003)(3023799007)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVJYanRESGRIOGtZWXJXWThEWEoxY3dZaElncTNha0RrZWZxUXhvN05NalFX?=
 =?utf-8?B?ZCtDVEp4VTVlMDBuWWVPUEcwb3MwVzNpbms5ZWJNdTR0R3FMb0wwU0pYcHhW?=
 =?utf-8?B?ZWtSREFOZVJ6Q2RDOEU2cFVvMWt2V1BydVFrTHdlcHUyMFN5R3dHd0VCSDNT?=
 =?utf-8?B?eUNERTMvR2Z1QWZOeFYrSGpyMzhQMWdCcU1RSzdlL3NMcy91VW5MczNRUGt1?=
 =?utf-8?B?bHVSWndWQzNHVEVTNS9yRXRISEpIZFN1UlhNNnRMZUpucEp5NGZxM1ZidUx4?=
 =?utf-8?B?MUpaS1lnUTNyYlROS2ExODR4UzFuZGJUN0E5WXhVZXhSZUhNNHVSNVoxQUs3?=
 =?utf-8?B?TUFubWdKbVZpSWp6ZDVQaklQRlJ4ekJ1Sk5NaEJvQW9LcHpsY21SUGdCc1RP?=
 =?utf-8?B?Nmg5MkNnRlM4ek5IaEhhVFZYbHY1ZmNvSzBGejBGYVA1di92dGRScjAwNHFj?=
 =?utf-8?B?aUR0L1JNVnNTKzRNa0xWcm1kTmFWbUFqUGFrdEhvdnhMbGJlRENtRjA3aXQw?=
 =?utf-8?B?N1BjdEF6Rmo1SzQ1Mzg1K0JRY2VmeWVEZ29IOXhoQUFGMXE0N01LWk1lc0U3?=
 =?utf-8?B?allzK0tQVG5RVlUwbWIwTHMrSGJKamowUDVYaFRrMHVQOW5YeWthNGI5R2RL?=
 =?utf-8?B?OUV4UlNKanNrQnNLU05WdnJpVm80NTdoc2pVU0VyNG5BWWxQYkY4SkI3Szhj?=
 =?utf-8?B?a2tyQTFHdmVYaXNNR1B3NTBmSFZwTlEzL3doY2hjeUhqWHdyaEJYOGlpdzls?=
 =?utf-8?B?cEZJb3MrUzVKaXAxNWNOazIrTWJ3ZUd3Ymk1T1lGclVDQXpxWXNwVU5aeU14?=
 =?utf-8?B?OXNqb2h1RURsU2ZDbnB6aFZvVmFwYzVOcEE0bFFMUEJPY3E1Tms5MDdKTGJj?=
 =?utf-8?B?dWRoYTJDbkx5TWZFbnVBY24rYnV1QWtxbGtMT2xLd0V2Tk1BR09GMXRDUmxM?=
 =?utf-8?B?ZzJBeVdRN3RjakVHSTFFT2k0Yld6dHM0SmpidXgySmdKVkdDTHNlODJTZVNY?=
 =?utf-8?B?ZUJPaVkrbXZGckl0bnJYdEVBb3dCT2VFRGtZaXlEWkdPUnpmN0ZCQ0FlcXdp?=
 =?utf-8?B?WmIxTUIrN0pqV3Z4eE5WNFJ2YUJHNGFMRHBxTUhJNGo4ME0ranU2bVdpeWpP?=
 =?utf-8?B?L3NkQjAweG5UOVdseVNZNzRpeUlqWUp5bm9DVDZ0aGZscUIvQjhxMTV3M3lw?=
 =?utf-8?B?R3RFcUJBeFZjMi9WY0dyN0hhVVJRS3Jrc0M3WUMyVGlPdFFhWEFuOG9ZeTQ2?=
 =?utf-8?B?L3ZRN0NvUW9MTWd1OFFMQjRXcEFkYVRkYnY1NjRIWnJzcGpsSWtQd3dyN2k4?=
 =?utf-8?B?TVhXR2tJb0V1QVZzWklab1Izdmlrb2xvSnFvZjdveCtjKzBXUHFoR2w1ZHA4?=
 =?utf-8?B?ZUFRc2NIWWNvT1lxSWxFWFhMb0tBV1RTaGhLb1c4K0hSWUdXY1lBbUViK1VV?=
 =?utf-8?B?RmxGdGJtN1BoTktTOWE5SkR4Z09ZMmlDSHNxVW1XcVl4bkU0OHhQa0p1bkI4?=
 =?utf-8?B?TUlZYjA0cHQ3dEowYzNZWDRQdGVmZUxNMVVZNmgvMkpkdlZnYVdNTEdXVlBi?=
 =?utf-8?B?Wm11TDZ0RHJNNkNrdGtmZWVjUkJ3N05ENlYydlZ6Uyt4VGZVdC9hUHRLRzdp?=
 =?utf-8?B?S05RaWJQdk9lRG9UcElQZG1hTXo5VStEUkdkTXJFOHY4WXIzUlhCQ01FTXhX?=
 =?utf-8?B?NUhpODVjbFpuOGdVNEh5M0JWR0dWaEtZRC9ESlJDbkw3MWdxditXOFFOdnNp?=
 =?utf-8?B?ZUNMcmU1UFRadUlsM2p1QTZiM29ScU5KU2dnajBUN2ljY1pENXRndXk0UzBv?=
 =?utf-8?B?ZCtaT1J0cGEvZkcyMHd6clpTcUtOenZrQ20xc05yV1FoUDYvakpxZ3RyZ0Zh?=
 =?utf-8?B?cTA3Qy96dDl1ZmVkNVQzRjFCRG9IVkxDbjNWaUc1S1BncTFzaFhTaUl0SVNw?=
 =?utf-8?B?cWNHRWQvbS9SZnhWbnd6dzN1T1YwRjl5UFp6SFlFWCtJbGY0cmpXWkl0dk9M?=
 =?utf-8?B?Yk5CazducVVDUk1wNHJMamp3WDd1d3BxaGwyWDNqQWs4TFliQUNuYmw1Vlpy?=
 =?utf-8?B?VHoxZUtNOVp1ZGtjRjJ3MHgvSGcvYVR5ZXNQRy81NHZOQXNGNjJ5M3V6aDNx?=
 =?utf-8?B?N1ZIZUhVUCt6UHM3TTZoOTRmTmJneEpMZVRZOU90Z3J4MUlYZWk4LzFzdmpz?=
 =?utf-8?B?QXI3cVhKeURHR1VJdWFwam5ZaVlGSkc0VDJQRlZJUVFBWTFNUWUzZUZuMERi?=
 =?utf-8?B?aXdxV2t3SFFXS2p3bEFPQXJSWHNZK2VTeHcxNFFkelJTVElDeEdoY0d4UGVv?=
 =?utf-8?B?UDZCVzg1TjVsTGVNOTJIUWs0V2ZkRGVteWpwUUlWNG01bmduN0hxbll2VHZY?=
 =?utf-8?Q?P57QB1um8wahLIiXW0BnxiDbbVohUygwqaMU8?=
X-Exchange-RoutingPolicyChecked: TqmE/DjSHhcBv3LC4t4/hcegShW9X87iYQku0popn4f7XKMK2bh8y9W+5vwAKe5AsAF0Sou4+OD+/uOK0QoWyLEIeB6V0UipKPYbyGFUOSCEEC9BnbDnznkVTz/c+hDrkeUEXbNwze80sOUpAu+OC99yvUwYCmpDfLhqSGT7a2RObs3YYp86QU4rBJ4ThsHkrqwndR8OJZ5Fx6ejWSu3tsOC82jZNd8mt6pH9JcEu2/0AOkT738D78WrwyqnWKmyr9lnnH9pH2Eka3D+SZzeZy3xlPqjS4puoI2bEo+I2k1uvECQNQuvb/yEfL9Wkva2jtd73tbgaPjZz/PmTgeEJw==
X-MS-Exchange-CrossTenant-Network-Message-Id: e01bc367-3851-43f5-ae08-08deccf3cee0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7183.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 04:41:05.4298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bc4azTaKVeqiaSc+qEp9jFPUeC2zADmN5QPlrL9DxHvpAaXkRag83rxA2FDaUlqJiA9mfi7dU3FJIADnjtRWvihWH2AQdWAQUlCLaJF2YvmqdPEONdK5RqFRfigBRYdb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7369
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

On 6/9/2026 9:16 AM, Jeevan B wrote:
> Enable DC3CO tests for PSR/PR for display versions >= 35, add a new
> test for DC3CO to validate frame drops, and test DC3CO with LOBF.
>
> v3: Adds a test to verify DC3CO continues to function properly
>      after a DC6 power cycle and rename function name in first patch.
> v4: Add a new test to verify DC3CO continues to funct
> v5: Addressed review comments, clarified platform support wording.
>      Simplified PSR mode handling and fixed output-aware PSR checks.
>      Cleaned up and aligned new DC3CO test flows and guards.
> v6: Addressed review comments.
> v7: Fix framedrop test logic and dynamic block.
> v8: Update commit message and test description.
> v9: Replaced hardcoded values with global constants and updated
>      logic for framedrop test.
>
> Jeevan B (7):
>    tests: s/check_dc_counter/assert_dc_counter
>    tests/intel/kms_pm_dc: Replace require with proper assertion
>    tests/intel/kms_pm_dc: Enable DC3CO test for PSR2/PR modes
>    tests/kms_vrr: Add new test for DC3CO validation with LOBF
>    tests/intel/kms_pm_dc: Add dc3co framedrop validation test
>    tests/intel/kms_pm_dc: Add new test for DC3CO recovery after DC6
>    tests/intel/kms_pm_dc: Add dc3co-vpb-framegap subtest
>
>   tests/intel/kms_pm_dc.c | 322 +++++++++++++++++++++++++++++++++++++---
>   tests/kms_vrr.c         |  34 +++++
>   2 files changed, 338 insertions(+), 18 deletions(-)

LGTM.
Acked-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>

