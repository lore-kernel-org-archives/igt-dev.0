Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2808CC54ED0
	for <igt-dev@archiver.kernel.org>; Fri, 23 May 2025 07:14:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C50010E0F5;
	Fri, 23 May 2025 07:14:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JG67Upgh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D85E710EA64
 for <igt-dev@lists.freedesktop.org>; Thu, 22 May 2025 12:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747915620; x=1779451620;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=mY8JZ+GCazhxWNw4iUbRCrzO7dKVql8IO5Q/BJMzjQc=;
 b=JG67UpghjhElVeVrvtqghdk+nECWBeJ8iho3O1aL8hA87jWi2G5u9O/l
 DEg7KOYlA3L01IO6Rl2JQ/BywqZVlMFWQ6fwyLXKAQBqCnPs/xwjn/J3Z
 YAt5mTXuDE8xMFejNMJVL/LfJKUjXJMEsbUtqHUAAP8+O28jaLHPIgT+d
 Z32PZ1aTOX+8sS898FiKT8DF4pxDDZGQMTnwkZuzF2aj21E4ehQPbqWSP
 w9AsaLlJoOMW2qaavk6e0sxqxGhfFSrJNlvU8jWiWedaNtU+/6I4aeBsB
 khTYK29f/GbesrldOcBLuW6FwDo9R2oAgdFMJJY5oqkwhUy/3GV9jalX9 Q==;
X-CSE-ConnectionGUID: 3vILBcFLQASt5/n4dQIe6g==
X-CSE-MsgGUID: 23RgWK50T5ajv1QP2Gdprw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="61340665"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208,217";a="61340665"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 05:07:00 -0700
X-CSE-ConnectionGUID: qkQD+ELkRdOIxKw8uwCkXA==
X-CSE-MsgGUID: Bq+RWBW8TAeUOL79vjO11w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
 d="scan'208,217";a="141635967"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 05:06:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 05:06:58 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 05:06:58 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 05:06:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RYR7j09Xd6NqRDwHF4ltoPIu8FKd0PPM1fVwenNmlPatxwD+SMv2Ab75YsNPFI8kdllfbR4BUzJFREsK6bSZr7q0Iq3WVukSaaVjLo/O54/BtwhO7fpiJ53pZLsE0CyYtu1BFi27WTaET6jdXhbk010RY2xPWQhXY69WOVxNLCdqvue1hZxcXUPoKlARG+mckydSdNZNrmQaaOAas/5SrJOzZwifWiSS7ZTtWA0o3MxuZwl1/bvYqJ9T5NoHiVukUmodBNBJnmJ8H0gQmbY01kLrV7mny6GwmPdpGEUtJ2o36OlUOsa2w4dHuVZOb57065Azar3Og5xFlpSFB5zUGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bmve6gU3msDVN2QH/K/ska6ef7ARlgJ1MlErvZpU+JE=;
 b=KIZfVevsDA4G9ZbJ/ybI/XiXxROiurABYZjS0PhZqZcFGfXQBt17EH+Th21lwuRFp51IUW0znEX83+nhcqkjLj1tcFQfeeXhjEg1Zpv8g4K81dR4GO/N1jxKdaynU86zENzV4RWiNvl/9goofKhJghTKD9RdTMlBrE6sOB4c0u2uY1lZeTJu8lGIcjUia/RRwbO7akzM7W5INOVR9e/hciixYama6VSIRtEfJUJ9GU52iEDH1WtiZwxBcIrYtrQn2BNxrnZzzl9xGw/u28mEPjLnDFKvHzxLzlDszkLPg2TIbH1QpBipU4ZNW0D/eba3afIEZOiEj3VHnOZRMCxAFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7766.namprd11.prod.outlook.com (2603:10b6:8:138::10)
 by IA1PR11MB7270.namprd11.prod.outlook.com (2603:10b6:208:42a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Thu, 22 May
 2025 12:06:28 +0000
Received: from DS0PR11MB7766.namprd11.prod.outlook.com
 ([fe80::2dae:96bb:6d35:f9a2]) by DS0PR11MB7766.namprd11.prod.outlook.com
 ([fe80::2dae:96bb:6d35:f9a2%4]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 12:06:28 +0000
Content-Type: multipart/alternative;
 boundary="------------sUvwLGKjMHUrXQfqHsSMcZLn"
Message-ID: <0fd8107d-1e9b-4d80-888a-5da580a57ff8@intel.com>
Date: Thu, 22 May 2025 17:36:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/xe_pmu: Ensure consistent GPU frequency comparison
To: <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>,
 <vinay.belgaumkar@intel.com>
References: <20250520171641.2421623-1-sk.anirban@intel.com>
Content-Language: en-US
From: "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <20250520171641.2421623-1-sk.anirban@intel.com>
X-ClientProxiedBy: MA0PR01CA0029.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::11) To DS0PR11MB7766.namprd11.prod.outlook.com
 (2603:10b6:8:138::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7766:EE_|IA1PR11MB7270:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ede605a-f8cc-4ef1-723c-08dd992914bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NHU5ZFhMK2tXVWFyaDNUT3JyYkFINnBEaGlzL0NrNVkycVh6QU9NZSs2K2Qy?=
 =?utf-8?B?ckNUVEc4MGFDL2M5em9QNTBEV0hzOGdGZ210d2NZTmhtMUZ4WE5acVZQUUVS?=
 =?utf-8?B?OU1mcU12cHlxRGtxUkhZMTNRKzQ4bFhrZHVkKzNWeTlIWS9pNWhpTExUV3lK?=
 =?utf-8?B?VlNmSFpJUHpZVnRDYUQyL2tzUEdLUUhLMHFrUVNpMHFjSGVjeUlvUklzdFRh?=
 =?utf-8?B?andXN3JLRTRnZFBRRXBBdngrNlZHWWh2TUxVZHF1WTJxVS82K3diOXY4ZWRJ?=
 =?utf-8?B?V1hZTzFhN3NuUmQwanh3WVdLVFR1bG1MRnFCRHVLUVU0WnhOTHVaeVhVdnYy?=
 =?utf-8?B?L3l4aUE5dnNLejBLMG1JTWRpSXRTUmNKa0N4RmR1YWVkSXBBZWxDNjNSR241?=
 =?utf-8?B?aGRVT2N5dHJHcmM2Z0pnQ1pwZjN4cXdKb2cyTGdvZjAveERneDZvSTZCajlm?=
 =?utf-8?B?TXhlRnA4OGw2NGMwUGV5VWlnSUlEdkRjN0hWTU0zKzk0cHlTdnRWRG9YQU9F?=
 =?utf-8?B?U0FkZmo5TldwYW5EYjgvcllXcldnblAvUWkwWjF1bEt3SDFiRUc4U1lEV25m?=
 =?utf-8?B?MjBGNHVoMU14WDZzT1pBdTc4QUxiVkc1UXkxOVFYNTVzbi9uY213UUd3dnRp?=
 =?utf-8?B?dzNNM21NQThRK0gxRVpCTWlaUlZXSVFoYXhac1RkdHI0am81WVBibDBRN3FU?=
 =?utf-8?B?NlpFZjNvd0tKSlRuUFhtSnNIdWY2dUoyNGNUVHFTZEQ5R05kWDExdDl3eFpG?=
 =?utf-8?B?bmwvclM4allmYjNDOWxSbFhLaHNsWnYvNHIxTitnYkhJUVd1c3dUdTNvbVNN?=
 =?utf-8?B?ZVlWTWlGNmdTVllUM3dvaEExemNVRmhBV1hjUFlwVE1ZMUFDcFBMMUY5aVdr?=
 =?utf-8?B?eUU3N3FjOWh6MFlqREptSVhUMkUxVWc5YzNSZzd1K0lIRXhDL1NZa1F5UEtO?=
 =?utf-8?B?TW9seGhIdHlIWS9XVnJ2NnBZUjhIb21Da0V4eTBIT3ppR2hZNmd5U0M2OUpy?=
 =?utf-8?B?WkQyOUFMVDRhR3oyeitXT013UzNOUVk5UnFmMjY5UHA3eUhYalFkMDZ1RmZF?=
 =?utf-8?B?Q1FsNDNtMGFKbkhNNmNmdkd1RVIycFpKZ2t6QXpsdXBLUjFrVVh2WDFrbnNq?=
 =?utf-8?B?Z3dERGFmTllGUU1GdVlqcjBGK0UyZjlPc0EwQ084SjluR2cwWTZ1WXF3SnNn?=
 =?utf-8?B?dExnWWFZMGY2NGZYNlFTVkszZUUwWkhhNzBrWC95QkhHTVNWS2VrbktWL3JC?=
 =?utf-8?B?d1JqUjEvcFhZS1ZNU08yWGROL1o0SmpuaHlzalJqbnpjc2NKMlpSNGVpR3Jt?=
 =?utf-8?B?eThtYTNoZENjeEZQeDcxSmxQTGRKTDB1NXArVnk5NzlRL1hORzNJT21VaUtI?=
 =?utf-8?B?MlZZemRZNFFDN3M1V3JFajhQTmdXT1dKNC9ad2Z5VHBoc1N1M2NDRUZ1VlFS?=
 =?utf-8?B?SW96akxZcmxBZUJFQkk3eXFzN3hTQjdUUFRZVWhLY1pmMEJaRzByZTZ0cmR3?=
 =?utf-8?B?bHYxYkNMRUs3OU5raUxqMmJQdHZsaGFYUm1lbVRER1NvRUtpRDFGWlRwOUtx?=
 =?utf-8?B?QjFZNzhkUUhEZlp0dFc1MzJkMlN6eEhpUWd6ZDg4VE1pOE5VYzdJL2JRMHZr?=
 =?utf-8?B?MTVpQVpGZDJ2dzBxUmREMGFJbStZd3dua1MrQ0tYYXloOXg2VmJ6SG9QdXVj?=
 =?utf-8?B?QVhpdW0zZHlYVkt0QnRxZGI3cUZZdHlOUk9UOFMwbkJ1ZWFOazZaclk5enRM?=
 =?utf-8?B?ZU9UdUlIM3haaWorMFdGa2M3Nno5Q3JSVGx0VmNkTWplanZvRENmcnBFOW43?=
 =?utf-8?B?L01wajBNaUJ2blBkejB3Z1RZZS9GazY1Nk5zczk0aTZ6ejBINjdxcTVhR1c2?=
 =?utf-8?B?TENNSmZYTHZneXF0WU5KeXdXUFNrRUp5M3p4TnRZcGNHMFNEME1mVWhobmRR?=
 =?utf-8?Q?ki96HdQzwzA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7766.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clhQUjVKeXZ4NGNkTjFKK2VFSkdVQVdhMmF4OGV0dVJUU1psZzJ2MnpQc1JB?=
 =?utf-8?B?N1l4U2E4VEJSNGhqUWpOVnNVL3M5WVQ3U0ZLWmdkcFZzcnJHNEZBY3RpSHla?=
 =?utf-8?B?TEF0VGx5anZSSXJEeDZPdVRFSmNYa0FVQkJlbThYYjU3UGZmdityMFFEYzRM?=
 =?utf-8?B?VkduVSsyL1Z4Z2hrcURIUzE4ZGFrdUI3K0xYWVhpVVlYa1hTckdZRGk4YWh2?=
 =?utf-8?B?ZTMvT2VoU28xelRleFArOGxuU3ZwSGVTZmpJbjdFSTFqZ011eG42cC9yMGt5?=
 =?utf-8?B?UzVCZjg2VGJ0TVFYbkc4NGgybHhkSlIrampuaVplTUpHZ202YngyQW1lcHdo?=
 =?utf-8?B?NlkxVW1hQ0h4OStYVUpkc0xNaVk0VW5wUEhRYUhjRWdhc05XY0JLZllGWkRx?=
 =?utf-8?B?NHFLRmZUNEFTQkZhOTNRUTZUVzIyYUtjTDFtVnRqWjdVNkg3U09EOWpGQTR6?=
 =?utf-8?B?MFFFMjM3YWVKZkc2VGJDNy8raWg4OCthczVPR0J0QlBHb25PYmZsakQ2VHNM?=
 =?utf-8?B?YnptWmdYdlE5bUcrNmt4YkdIdUY2bmFOR3ZzbFQ5RjVpL1owNWlkZ1doYnE2?=
 =?utf-8?B?N0RWYkNINzZQQVpLdWg1K0g0UW1EMEp1azhhOWhCeVlpUU5wSzd4RkpOdXp2?=
 =?utf-8?B?V0VDQ3dzRkVQU0Y5QWxqVzQ1NUR3RUYwRTU1K1pMOUFYWFVJZEdWelhXbjhG?=
 =?utf-8?B?WjBTNWVrQjQ4K04rNytidFJQOWxOanpobnhkNm5Oa0ljYTBoWHErRGxhRjVj?=
 =?utf-8?B?N0ZRcXk0VThiUHRXN2xlTlBab2VFTExubmJEaDZVeXJMeTNRUUpVZnRmT1JP?=
 =?utf-8?B?SnhSRnhyV2ZnQVkyY3FTSTUrL0tsYXZKSUQ3M2FpNkExSmdxcDZxb0g2QkZC?=
 =?utf-8?B?R3NRUkVjVHVxMERoMEI4Skk2OUg5b08rdmR6SXdGelR5dzZLbGV3eDdnMFZ5?=
 =?utf-8?B?dXBiN2grcDlueERKdFlGWlpDbitpV0ZuY3doOTdyRVRhRkRsdW1oL3NiOGxG?=
 =?utf-8?B?RTJ6c3JFNmxoQm41M3FpY3ZjYjdYOTl1TENYK3dBYlZvRHA4cXVSNGY0RmxI?=
 =?utf-8?B?SkhEd252eWhBcWY1aktqRWFpOFVTRWxiRU1yQVVlelFBOVA3YjVrdmFGK2xZ?=
 =?utf-8?B?T1hTN2k2RnZvN2xiZ256WEtsYjVqMG9SWEpIelJjamUxeU9kcUpta1hEak44?=
 =?utf-8?B?ci9kTWZOUDRQa1JETWY2NnhGSnM5TU12R05NYmZFdzJQT3NNWFFnT2dYSDBN?=
 =?utf-8?B?WllTTEFrbzRiRFNVS2JuNGhrOFoxYTcwWS9kNjhSak9XMFBaTEZ3VHdKSm9D?=
 =?utf-8?B?UElKQjZZM08rNzdjR3hobm94UXo1MUM0Y0tnVFdoM00vU1FKVWVLTWptQkJ3?=
 =?utf-8?B?RngrcGVsUnJSK1lPOEd1eUtzUng1YXhpb2Q3QUljajExemVNR3JWSTlrd1g4?=
 =?utf-8?B?ajNRa1hHdjdrdkkxZDFGeGlHKzBYMHV6SElKOGpxTXdSWWpIV0E5S0FhNG94?=
 =?utf-8?B?anl4emtjeEd6Y0VWMlp5WHQ5M1oxZzlneVY0UjFlbStaZnRuN20yRGs1bWI2?=
 =?utf-8?B?WmNBdC9EUXhkSURaWXFYOS9YeTJXZGJyQU8xOExRODcxSXVXZWt6b3FuOWFR?=
 =?utf-8?B?UjVXOW9IR1RSZzBPUGZrU051VzcxWXlxM0R6VTQrQzRGVlB2cnlwaEUwQ1Rs?=
 =?utf-8?B?UWtXRWRwVWNEelh1WGg5c2l1WFpNdXdCRzZwWEw5WTRuWUM1WThiM0ZkcldZ?=
 =?utf-8?B?cy9sY1JOaHcxZndmeXFIdFNpblhINTIrRy9QWGQwVUNuK1pHOEdlS0tLQVQr?=
 =?utf-8?B?akR1YnVxSjIrY1dEd20ybTc1NVRGWUQrU2FHS0FpSTNmTGZTdmhyRmNpZWEy?=
 =?utf-8?B?VmtURHE0endBM29SdGg1TmNxaGttL1gzdGIyRFZldVlQRHQ0SUJ2TDJPK0Ft?=
 =?utf-8?B?L2xNcGo3dm56MVpCSDBFdmh4QjVzYVhvblEyeWZGTzhtWTJWczFpS2ZkNXZ4?=
 =?utf-8?B?cUYvL2FXSjV6bU1sMG8reUc3a3pPZ1JmRHRTZjM3R0dhTmtLbmhZcy9hN1hM?=
 =?utf-8?B?TzdCVE9BWFdTTkIzWUZUcjVRWU84UnBLemlsR3RmTlZoL1ZPemljaGxWbkVi?=
 =?utf-8?B?bFFBa2UwTklGb2d3ZWpLZUthd3EvajlTWllpS1liQTBJNENlU3NEZkRUdmpi?=
 =?utf-8?Q?yG/jm+L6HKYla5eLUURb/0s=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ede605a-f8cc-4ef1-723c-08dd992914bf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7766.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 12:06:28.2172 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GFWvIwJhzQJX1bFWDmZ6HErrJ/nuRP4J0RF8D7/SG4/TjNURj8d1ohTOpp/me58/NdP38bENbPkh7PZiLRgF6woKScO5mRAGsF352MQ6p6CXfGB4TsnAwEG/tOhjTnvE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7270
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Fri, 23 May 2025 07:14:42 +0000
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

--------------sUvwLGKjMHUrXQfqHsSMcZLn
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 20-05-2025 22:46, sk.anirban@intel.com wrote:
> From: Sk Anirban<sk.anirban@intel.com>
>
> Fetch the minimum frequency only once during GPU frequency restoration.
> This avoids inconsistencies caused by potential changes in the minimum
> frequency between multiple fetches.
>
> Signed-off-by: Sk Anirban<sk.anirban@intel.com>
> ---
>   tests/intel/xe_pmu.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
> index c49cceff5..f830c5de8 100644
> --- a/tests/intel/xe_pmu.c
> +++ b/tests/intel/xe_pmu.c
> @@ -390,6 +390,7 @@ static void test_gt_frequency(int fd, struct drm_xe_engine_class_instance *eci)
>   	uint32_t gt = eci->gt_id;
>   	uint32_t orig_min = xe_gt_get_freq(fd, eci->gt_id, "min");
>   	uint32_t orig_max = xe_gt_get_freq(fd, eci->gt_id, "max");
> +	uint32_t current_min;
>   	uint32_t orig_rpe;
>   	uint32_t vm;
>   	int pmu_fd[2];
> @@ -440,8 +441,8 @@ static void test_gt_frequency(int fd, struct drm_xe_engine_class_instance *eci)
>   	 */
>   	igt_assert(xe_gt_set_freq(fd, gt, "min", orig_min) > 0);
>   	orig_rpe = xe_gt_get_freq(fd, gt, "rpe");
> -	igt_assert(xe_gt_get_freq(fd, gt, "min") == orig_min ||
> -		   xe_gt_get_freq(fd, gt, "min") == orig_rpe);
> +	current_min = xe_gt_get_freq(fd, gt, "min");
> +	igt_assert(current_min == orig_min || current_min == orig_rpe);
>   
>   	igt_info("Minimum frequency: requested %.1f, actual %.1f\n",
>   		 min[0], min[1]);

It looks good to me.

Reviewed-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>

--------------sUvwLGKjMHUrXQfqHsSMcZLn
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi,</p>
    <div class="moz-cite-prefix">On 20-05-2025 22:46,
      <a class="moz-txt-link-abbreviated" href="mailto:sk.anirban@intel.com">sk.anirban@intel.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250520171641.2421623-1-sk.anirban@intel.com">
      <pre wrap="" class="moz-quote-pre">From: Sk Anirban <a class="moz-txt-link-rfc2396E" href="mailto:sk.anirban@intel.com">&lt;sk.anirban@intel.com&gt;</a>

Fetch the minimum frequency only once during GPU frequency restoration.
This avoids inconsistencies caused by potential changes in the minimum
frequency between multiple fetches.

Signed-off-by: Sk Anirban <a class="moz-txt-link-rfc2396E" href="mailto:sk.anirban@intel.com">&lt;sk.anirban@intel.com&gt;</a>
---
 tests/intel/xe_pmu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index c49cceff5..f830c5de8 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -390,6 +390,7 @@ static void test_gt_frequency(int fd, struct drm_xe_engine_class_instance *eci)
 	uint32_t gt = eci-&gt;gt_id;
 	uint32_t orig_min = xe_gt_get_freq(fd, eci-&gt;gt_id, &quot;min&quot;);
 	uint32_t orig_max = xe_gt_get_freq(fd, eci-&gt;gt_id, &quot;max&quot;);
+	uint32_t current_min;
 	uint32_t orig_rpe;
 	uint32_t vm;
 	int pmu_fd[2];
@@ -440,8 +441,8 @@ static void test_gt_frequency(int fd, struct drm_xe_engine_class_instance *eci)
 	 */
 	igt_assert(xe_gt_set_freq(fd, gt, &quot;min&quot;, orig_min) &gt; 0);
 	orig_rpe = xe_gt_get_freq(fd, gt, &quot;rpe&quot;);
-	igt_assert(xe_gt_get_freq(fd, gt, &quot;min&quot;) == orig_min ||
-		   xe_gt_get_freq(fd, gt, &quot;min&quot;) == orig_rpe);
+	current_min = xe_gt_get_freq(fd, gt, &quot;min&quot;);
+	igt_assert(current_min == orig_min || current_min == orig_rpe);
 
 	igt_info(&quot;Minimum frequency: requested %.1f, actual %.1f\n&quot;,
 		 min[0], min[1]);</pre>
    </blockquote>
    <p>It looks good to me.</p>
    <p><span style="color: rgb(36, 36, 36); font-family: &quot;Cascadia Mono&quot;, Consolas, ui-monospace, Menlo, Monaco, monospace; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Reviewed-by: Ravi Kishore Koppuravuri <a class="moz-txt-link-rfc2396E" href="mailto:ravi.kishore.koppuravuri@intel.com">&lt;ravi.kishore.koppuravuri@intel.com&gt;</a></span><span style="white-space: pre-wrap">
</span></p>
  </body>
</html>

--------------sUvwLGKjMHUrXQfqHsSMcZLn--
