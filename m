Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA766C3ABC5
	for <igt-dev@archiver.kernel.org>; Thu,  8 May 2025 10:26:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1F4C10E8E1;
	Thu,  8 May 2025 10:26:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XqJVkM7o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D11410E18F
 for <igt-dev@lists.freedesktop.org>; Wed,  7 May 2025 10:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746615098; x=1778151098;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=9Obdd6rzXv1kVO2rIycFiHtUpj0J+0NiwvLMXU69lLM=;
 b=XqJVkM7onIyQaJ3CwDdm37CJlYQ8UWauE9DqFnfXaRfwYk4PlnJjLR0/
 JXjrN0W9TNQ9R8ZQkF9pHU3T605Olw4mNaf6Yjdp8K3jeK0HDsNsFWulV
 gEXpqp+T0zDSE5ki190sDfhtTG5RQt2zCwAGpl85slFqMp9AdNXP/+47L
 Xq21r5lGM9WywM5SBaCyi30dlNwBGcqNRbyPjyZTbHsGt58t1Z7FdEnpv
 /zpu9nDYM01XJnkSfQTbOuXggBFgVl2rSGeCTr2Ucg6i0vUkkYoQ/l2d1
 G1ed/x/CwzxTVd+CzVd29MVAf+mfOS9QTSXhHACo9ADXXvJrqmz9UhZdW g==;
X-CSE-ConnectionGUID: ZXzNkDu4S+a9ZTkXwlUqnw==
X-CSE-MsgGUID: wZwp6hqOS9iw2Yp19cCNSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="59690086"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208,217";a="59690086"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 03:51:36 -0700
X-CSE-ConnectionGUID: DAQF0y6sTy6F5rfrLLIViQ==
X-CSE-MsgGUID: twZRw2dEQbu39js3eCK0gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
 d="scan'208,217";a="141044041"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 03:51:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 03:51:31 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 03:51:31 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 03:51:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SP0/o+R7jYeNukHdDJJCEwwUaJAGjMnOcmeNRiMbJ2cFUENf3Bi4ikJPZ8sxE6M5cOFkLUZj63AeMVJPJLkO6Jl90F8Fs8Mn3OyYMvDdT6HWTBSbjQ9iw3K22TEsmoRS8Q8ZCiHbvqU/2E17BU+ayBl7byGYrKqEh9ywMpRdjhZJTfU8E/4uqsMt+V60u2qj8QQhzbXRd4Q/0n0iez8GHtVbJsZEVXBrZfWRXYZzbgZWtLG/GFd8Ijx0LH2suoAqNB5pmBZaaCy96PL0/G2lt38TDgVzNH+KrvpYVCKxU9reMtZozBxjVsD3863C3UkiibMnO0xIsLCxv7/xXKOX/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=31s+znO9lD6ve57sfr4R3di1L7zuQjQlCFDktTvIqZ0=;
 b=F2yFP9tEe40SHIzVrdzlDthWaNfvEX6wH7g+liJPZaH9HOSSG10wsubwXA7OM5PnFkH5jB5FkvcONC2Pti3GRNT/RKJ1IPl8XwI+xWsYeaCA89s2Tx7F5xrahbRRP9tky6QbC5cntI5S4+mvxVNXc/kw/3j3vFSSaKDd9VAa/plNUppk+bT0BPw1Iki6czU/iJ0DXscfRmPzcmj1vRXKpgkFlf7dWjT5Eo4wU64Ygsop2i+rhc/duGXqkmBHKhGo5/KAjRvI22mt+uYmI0OUXAKOnFL7z+eODcZ1et6LDFRycrd2KbPvw6bwFa8xzewFJT9a6rk6K5mLriS5xdp/SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7766.namprd11.prod.outlook.com (2603:10b6:8:138::10)
 by IA0PR11MB7305.namprd11.prod.outlook.com (2603:10b6:208:439::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 10:51:28 +0000
Received: from DS0PR11MB7766.namprd11.prod.outlook.com
 ([fe80::2dae:96bb:6d35:f9a2]) by DS0PR11MB7766.namprd11.prod.outlook.com
 ([fe80::2dae:96bb:6d35:f9a2%4]) with mapi id 15.20.8699.034; Wed, 7 May 2025
 10:51:28 +0000
Content-Type: multipart/alternative;
 boundary="------------phSBLAF6iwCxDTlKdDo6PUX0"
Message-ID: <dd4fc81e-7b29-4bd3-b135-bc7e30861107@intel.com>
Date: Wed, 7 May 2025 16:21:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/xe_pmu: Adjust assertion to account for potential
 RPe adjustments by GuC
To: <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>,
 <vinay.belgaumkar@intel.com>
References: <20250506150617.1961348-1-sk.anirban@intel.com>
Content-Language: en-US
From: "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <20250506150617.1961348-1-sk.anirban@intel.com>
X-ClientProxiedBy: MA0P287CA0010.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::15) To DS0PR11MB7766.namprd11.prod.outlook.com
 (2603:10b6:8:138::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7766:EE_|IA0PR11MB7305:EE_
X-MS-Office365-Filtering-Correlation-Id: bbdc4dec-1545-4378-8116-08dd8d551e52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d0FqN2VoYWJBamdya3ZkeElmMTltMG1DeVlrR2xMMzlONmJJSm01cXFnWUsv?=
 =?utf-8?B?VHFzaUQ2cS9TdEhhR3VlSllhU2F5eE92dUxWRFdqME9rZTJzQ1JnYWVOUDBp?=
 =?utf-8?B?cnRoVTlNa1NpN0V0d0RkbmlpTWExUlBSZkhjV1ZqdURRK0I2NGsxNDZndjY5?=
 =?utf-8?B?L0VPQTUzcTJYRUFCZ0dOUC82YmI3akxPN2c3UzBMQnJvZGlsM1A3elhaUGtr?=
 =?utf-8?B?V3JBQUl2THY5L3VXV2ZQalprQzBkLzdjbXlBTEd2a0R3NDF0K3RwbFR5RnNL?=
 =?utf-8?B?dzZxalJSQjNtVlNRNEtxQWl4ZjRnblVQNWthdytIVXB5MFM2bzJwcEFwNlN2?=
 =?utf-8?B?OEdLMmJtbitIQUJqK3Y0SzV3NWxMNUxwM3dFWjBDbmt5SFRoVXlQd1lPdyth?=
 =?utf-8?B?cnZxN3o3cmJyc1krck5hYk1lUURWYkRNV0UyeVV1dFVVK1JtY0RDLzdtRjN2?=
 =?utf-8?B?OCtWSUhPNHh2c3dodiswRG5ka3hOamVxRHZwbk1YTFlkb29hc05mTVZlUDQ4?=
 =?utf-8?B?SHV2ZXNYUlZtSVprRk1ScUdkS0tRTXlkajJBRkg4YUU4NTB0SDJSbEZZUGpm?=
 =?utf-8?B?WEVoOWI5MmxHNFRQRWY3M3lNWU1WMDVxTzM0TjJLL1kxRTZ2eWxOZkVCS3Y1?=
 =?utf-8?B?QXRUaEhURk52R3Q5cFR6UHFVU0FSN09qK3BZc0d0VCs1aUt4NHEwTHYvOW40?=
 =?utf-8?B?anB0VW1TQ0RaYjdmaTNzUmZSeVhITHpFMzZZdFZSaFVuVjlkZkNRd1YxRksz?=
 =?utf-8?B?Vld4NU1wcjRhTDBqQ0ZMaTZmRUNvS2gzNzlmaTNUbUhwd0tTU2liYXFMczE3?=
 =?utf-8?B?ODBvakxJZG0ySnRvaUV1Rm5sTW5DRHZiZUxMaWF3WXZuUEFYbTBSRit4dUNj?=
 =?utf-8?B?c1BvdnhncU56dEp0WXpnOW8xWjFIbCtwUXM3S1BSMlpkQzdLUkozMmpsQVkz?=
 =?utf-8?B?UVFBOWdjTDNqaTEzY1pETlA5WGxSLzJ1VjBYQ1p4MDI2aFRUeE12eFdkMnBH?=
 =?utf-8?B?cEFMZFJvcjJOWks4VXRzRkhsdzZka3BnQkZaZkErMlk5TjZBVWtOckhhYmNI?=
 =?utf-8?B?YzBsNGRDN2k4Y1h2emFnUmpla282TEV5a0ptMWpyY1BsWHNYNjVPTXgzblU1?=
 =?utf-8?B?N0dQTFhmZmZKVFg4dVJXaUt1YllPSzk0akQyQzhucE0wS3ZGV1dWVGpaayt2?=
 =?utf-8?B?cjhxbW9KSnlDYmUrVGwwV0h4Rm0vdHZWdGxldjlXZm00bGt0cDFWM2hqSU1z?=
 =?utf-8?B?bUtpcmg0VUVXeVQ5NWYyenFqbmdBenlIdEcyODd2akk3bURSSE5PL2tDU2tU?=
 =?utf-8?B?SWJESkZ4U1JVd3JxQnlIK0tjcW5YemNtOHBLYzdRak5IMmNYODZWSVpoeEk4?=
 =?utf-8?B?ekVPYmtZcERQSENkVnNKd1FETVREcGhUdjk2TWNseVJWTGhocmppcitia0sz?=
 =?utf-8?B?RVNVaXE0K0Y3bVJXVDhRays2bHFpenVPTzhvMXFxQWZPSXJtbDRSTVJES2Ra?=
 =?utf-8?B?TUxIN2czVTd4T1hxbm9JN1d3Mlg1aEFadE5ON1ZIdlF5MURzNXpWRTN6SmEz?=
 =?utf-8?B?RzMvZm01VUFZTUd5cmo4MnR6bE84SUgzR1U5a0UxQmU4Y3FhQnYxSzlnYytT?=
 =?utf-8?B?VUM3MHErNTQxVUF3bWcwRFJpQk9Hc0JyNys0ZkhaSzlKWnp6UTNMMTlSUTJv?=
 =?utf-8?B?cHlNczNVWHBsY1Y5RXhYdVo2TGJqL2R1Z3pvOVpKWmZGbHkwTDJ3MEhWV2Rr?=
 =?utf-8?B?WUVEelVCK3IvNDhJVDBMOFREY29zUG1oNmF2amdHNkdFLzNMcld3dWU2cW5m?=
 =?utf-8?B?N0l2MTg2NXY0NnU1WXBaRE15WHdtTytEd051OXBXWDhJRTVxR2tzZ2JWSHZa?=
 =?utf-8?B?Q0l0b3JwcEtHcFQxY3BpQVBqZ3J3Qm52T1k2eVU4RmhUMnBYWExRSDlVQzhG?=
 =?utf-8?Q?mnkHS2wHCK4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7766.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXVteWxkaXdYMUUxRWd4QUlVSUx5ei9HZFUzVk1zTUgycUg3VzhEZGZob3c3?=
 =?utf-8?B?bnJyelgrZVZsMTZwczFMS0pTYytBR2c1QmNsMlZ6V216YjQvSW1OS1B5cVZ5?=
 =?utf-8?B?Y01uL0pLRm52VG1SRlBGMHVDbjg0QWVLYlE3ZFI3UzJ2K1o3YnBHL1ZKenRI?=
 =?utf-8?B?WEU1QzcyTTFIUDV0Nlh4NDlwT3QzbnFRTVA5RGd1M1lJM0M4bDJwTXdpWFZr?=
 =?utf-8?B?aXRNd1Q2dGtpTjI1NFNLSDRkby9wd0dKZ1VLZWNzUUd1M2tMR1ZJc2hSenFl?=
 =?utf-8?B?VWo4OUkzaTRvSjhxTGFpa3IxSmZJVS9Oa0JiODBBNDN1WnF1Uk12dE1UOXpv?=
 =?utf-8?B?Ti9IbWRWemJjVE80TEVzd2UxdzhWOWdpcHNiRVJTK3phZmZrTWF1cWhvK0dl?=
 =?utf-8?B?MjArdDVKUSttWFBCODNQd0pvNzlLTUV4TDVIalpVODdKMStsZENrdjd4MXQx?=
 =?utf-8?B?RmVwY2trS0tBZ1F3eDBvTTlXMHlIRmpLQXJWU2Vjc24wNW1LNHlaNk5JODIy?=
 =?utf-8?B?Wk5ad0FPZ0kyUlYyQlU3SWFFZ1c5WTEyQ2tVUitTbGhNNEE5QzZXR3pkUUo3?=
 =?utf-8?B?eVlQeWhoYWRJQXdPWFpYZ3hmQy9rMTlGdDBTWU9EL0hKUFlBektmV2VBNTBQ?=
 =?utf-8?B?K2xIWks1eWlGbWJ1WUowWkx5Z3FLU2VzMlUrTTEvK3gyWHVLaDV5VWo3MHdM?=
 =?utf-8?B?VW5qaUQ1bGJJQkpLWHMyYS9wZEk2cG5zNXBMRnJONUpSVGFoV3dvK1F2NmNt?=
 =?utf-8?B?NW1taHhlRGJ3NnM0V2xXUy8rKzNObTFuUWpHZ1ZYY1NFbTdRTWJTUDBNUVBE?=
 =?utf-8?B?LzVhWXdxOHBwamFac2dhR21mNzY1TXFqMFZJdEpYc3ZscFNlemtHRWcvU3hh?=
 =?utf-8?B?NFBIQ1orMXc1ajY1c0VzdFpKR0JWeGpwK3ZTNjk1ZEVNZE5XbTA3dndDRFNz?=
 =?utf-8?B?dDROMS85TUdjNFJjdnhKLzVDOUcwSnQ4Y1VQaSs3c05jVEsyaldRbVp0RGdR?=
 =?utf-8?B?MCtkYXRVSk5WRXd2RW5zWkFVQVZMZjE5S2pjK3JPUUFyeXZZSFF2SDVGOTNL?=
 =?utf-8?B?WEx4OVFBbEFZSGhaSVVUTkw4cW5uSHpCS3R5dm1xbjRPblFYYytnZUNlanBj?=
 =?utf-8?B?aXgwaGZZRDJkemxsYUtuYWIvQ3JBOGwxNjZiQk5aeFNleUxTemNIcCtMYWpo?=
 =?utf-8?B?RW5wckZGdHh2cGoyQlBQNTZ5YWhuQ1g4ekZaaFFxNVhlVU1CaEYxZ0QyMFJG?=
 =?utf-8?B?THB5RCs2ckNJeWwxVUhrVEdMbEJHMzVwbzZqdXgvd3Y0TENudGlqRDJtTDZP?=
 =?utf-8?B?RExNeGJJQm1FRndVQ2ZFZnFrNFVYMDBiV3UwaWlSTTZaSno3czFwQ3dkaC9L?=
 =?utf-8?B?SEc2T1FuZFRuSkJZWmNhdGw0NzJXay94aXNpa0pmTDE3Q3A4Y0UrM2JGRUgv?=
 =?utf-8?B?L3FSMENXY212aXBLMlBvZVRDOHg1RktrSHpLVFMwazV5TlgzWnFpNXRDMHlw?=
 =?utf-8?B?aDJCQjJudG9uZFU0SUgrUW41VzdteTBCVU9YNmpwcEVtNDd3ZTZNTGJLOXEv?=
 =?utf-8?B?akZtVWZYNU45OXRBVkpwcW5wR2xlR29UYnJTeFZwb1lsNnFBVXpVb1dERjZo?=
 =?utf-8?B?bWFlb2NTdmQyVXNmSzBHVTUrOGJxNlloUVBTNEM2WSs0d1U1Y29nanVDbjMw?=
 =?utf-8?B?bU5LNklpdmlRZmNpVkx0cFZJT05UN29CTG1uV25uRDZuY3VZNVhRai8zOUxi?=
 =?utf-8?B?UXEybUJaZVFaNWdtaU1YZU9kN1Y4RG5iUjFlVzFNc0wzbWFRUnNnL0sra1Ey?=
 =?utf-8?B?RTRnS1dOdEJUSE02ZTkzcUo0YXZBcVg3MzRmUEZwaFdEdTlNTkgvbTR5MjBV?=
 =?utf-8?B?K3VzaHd0Q2xXT0laZ3VIVXZ6NGJrTHZyQVpYdDM3cWRUYVllVVFvZkdkeVBU?=
 =?utf-8?B?YUpMQ2dIUGVzWFI4T0RsRzR0YXg1SFMzV0l6MWNXUXRkbnVhQ3VQakgyaGF0?=
 =?utf-8?B?Q3BNUDF5d1hpa1liTW94eGhHV1VDQ0ZIKzdhVlJpNTV5ZFFPVlVlWUFJK1VX?=
 =?utf-8?B?VXBZa3M0N3hldC9YYWpISy8weVJkRGw4QzA1ZmtSS0hySDFFYzlhdTFxOSt1?=
 =?utf-8?B?ZWE5bWxiY0R5VDBMaGNoTW9IRVVGR2xHVkgyc0VWVDhWSTJKdkpPNDBuTm9D?=
 =?utf-8?Q?uqVXRVeA0mNcedY5AKsP1cQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bbdc4dec-1545-4378-8116-08dd8d551e52
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7766.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 10:51:28.1497 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V3aPpIYWJLz0xVEPygS8tYdw1YitQKuPNJifyTMPpVN3Ch0oFqLXIE+ywYHZookgYiKmJmfiIlbqgq55x4L9YZ8lt/8VwJlP9VhbrgmgFFVVH5ISkoEgR4Hr53zKRVxA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7305
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Thu, 08 May 2025 10:26:12 +0000
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

--------------phSBLAF6iwCxDTlKdDo6PUX0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 06-05-2025 20:36, sk.anirban@intel.com wrote:
> From: Sk Anirban<sk.anirban@intel.com>
>
> In scenarios where the GuC adjusts the RPe, the minimum frequency may align
> with the adjusted RPe frequency. The assertion has been updated to account
> for this scenario.
>
> Signed-off-by: Sk Anirban<sk.anirban@intel.com>
> ---
>   tests/intel/xe_pmu.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
> index 094dc0c6c..2e29a4056 100644
> --- a/tests/intel/xe_pmu.c
> +++ b/tests/intel/xe_pmu.c
> @@ -390,6 +390,7 @@ static void test_gt_frequency(int fd, struct drm_xe_engine_class_instance *eci)
>   	uint32_t gt = eci->gt_id;
>   	uint32_t orig_min = xe_gt_get_freq(fd, eci->gt_id, "min");
>   	uint32_t orig_max = xe_gt_get_freq(fd, eci->gt_id, "max");
> +	uint32_t orig_rpe;
>   	uint32_t vm;
>   	int pmu_fd[2];
>   
> @@ -438,7 +439,9 @@ static void test_gt_frequency(int fd, struct drm_xe_engine_class_instance *eci)
>   	 * Restore min/max.
>   	 */
>   	igt_assert(xe_gt_set_freq(fd, gt, "min", orig_min) > 0);
> -	igt_assert(xe_gt_get_freq(fd, gt, "min") == orig_min);
> +	orig_rpe = xe_gt_get_freq(fd, gt, "rpe");
> +	igt_assert(xe_gt_get_freq(fd, gt, "min") == orig_min ||
> +		   xe_gt_get_freq(fd, gt, "min") == orig_rpe);
>   
>   	igt_info("Minimum frequency: requested %.1f, actual %.1f\n",
>   		 min[0], min[1]);

Looks good to me.

Reviewed-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>

--------------phSBLAF6iwCxDTlKdDo6PUX0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi,</p>
    <div class="moz-cite-prefix">On 06-05-2025 20:36,
      <a class="moz-txt-link-abbreviated" href="mailto:sk.anirban@intel.com">sk.anirban@intel.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250506150617.1961348-1-sk.anirban@intel.com">
      <pre wrap="" class="moz-quote-pre">From: Sk Anirban <a class="moz-txt-link-rfc2396E" href="mailto:sk.anirban@intel.com">&lt;sk.anirban@intel.com&gt;</a>

In scenarios where the GuC adjusts the RPe, the minimum frequency may align
with the adjusted RPe frequency. The assertion has been updated to account
for this scenario.

Signed-off-by: Sk Anirban <a class="moz-txt-link-rfc2396E" href="mailto:sk.anirban@intel.com">&lt;sk.anirban@intel.com&gt;</a>
---
 tests/intel/xe_pmu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 094dc0c6c..2e29a4056 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -390,6 +390,7 @@ static void test_gt_frequency(int fd, struct drm_xe_engine_class_instance *eci)
 	uint32_t gt = eci-&gt;gt_id;
 	uint32_t orig_min = xe_gt_get_freq(fd, eci-&gt;gt_id, &quot;min&quot;);
 	uint32_t orig_max = xe_gt_get_freq(fd, eci-&gt;gt_id, &quot;max&quot;);
+	uint32_t orig_rpe;
 	uint32_t vm;
 	int pmu_fd[2];
 
@@ -438,7 +439,9 @@ static void test_gt_frequency(int fd, struct drm_xe_engine_class_instance *eci)
 	 * Restore min/max.
 	 */
 	igt_assert(xe_gt_set_freq(fd, gt, &quot;min&quot;, orig_min) &gt; 0);
-	igt_assert(xe_gt_get_freq(fd, gt, &quot;min&quot;) == orig_min);
+	orig_rpe = xe_gt_get_freq(fd, gt, &quot;rpe&quot;);
+	igt_assert(xe_gt_get_freq(fd, gt, &quot;min&quot;) == orig_min ||
+		   xe_gt_get_freq(fd, gt, &quot;min&quot;) == orig_rpe);
 
 	igt_info(&quot;Minimum frequency: requested %.1f, actual %.1f\n&quot;,
 		 min[0], min[1]);</pre>
    </blockquote>
    <p>Looks good to me.</p>
    <p><span style="color: rgb(36, 36, 36); font-family: &quot;Cascadia Mono&quot;, Consolas, ui-monospace, Menlo, Monaco, monospace; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Reviewed-by: Ravi Kishore Koppuravuri <a class="moz-txt-link-rfc2396E" href="mailto:ravi.kishore.koppuravuri@intel.com">&lt;ravi.kishore.koppuravuri@intel.com&gt;</a></span></p>
  </body>
</html>

--------------phSBLAF6iwCxDTlKdDo6PUX0--
