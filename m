Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6FEDD609A6
	for <igt-dev@archiver.kernel.org>; Wed, 27 Nov 2024 06:56:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C88810E48A;
	Wed, 27 Nov 2024 06:56:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hwK2LhKy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D728B10E48A
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Nov 2024 06:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732690582; x=1764226582;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=ge7njg4a4r5KnbvYLoqlzFVBdBnbsbY/VQ5r+aGPDrA=;
 b=hwK2LhKyi+ol67/ueCqjR4V1Ta6tuRZdHbzKOaQq715hzND0iqXCck2P
 n1KXRlCmfTIqxfiN6LSqAmoliAvZjoyf5rhi4iYDJYer5jaAF8FEzU5Az
 EqZgRyEiPxbZ+ZUdGbDhKbZbyodKIYde5mPX3qVbs/4yGiymuaPuzNhp5
 MRB9cNCRoBVEh/FCS9fKhtzppOzTrycUFj+OksFE9TDQUi2dDDa0ERjOW
 MijK0Ru+cEOWqT9FRgk6sTMsZ43QNcGCF81t8fOodFbAMJCpmmRtb4wNv
 HKmek2BuwK0q5fu5ufXxoIV97Cbqlmg1yXH5UyzhW/IzTUA5aXr6n08Dc g==;
X-CSE-ConnectionGUID: 5GJCpo2FTJuS/ghbdWji9A==
X-CSE-MsgGUID: X7O8vswySGyS9yv43Qubag==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="33128012"
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; d="scan'208,217";a="33128012"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 22:56:22 -0800
X-CSE-ConnectionGUID: 3dsyN5XFT5CJlnt5YuIHiA==
X-CSE-MsgGUID: qyMH4fybQgSaQfwDnAYpDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; d="scan'208,217";a="91659177"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Nov 2024 22:56:21 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 26 Nov 2024 22:56:20 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 26 Nov 2024 22:56:20 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 26 Nov 2024 22:56:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n17zmEOOXE27ws3/Pj2Wi4j7tjApwY110bZzXWdX8QCz6hu41K5oKykQqYsjQr1kmID1DHNKBi7m38q79RNDyUb01iXd4HRBXDXMtP5xt33P0c2qSvvqIl2uY2o4KMbylZiNRKgXUCpZpWrU7vos1s2BBrH9WAMun0lGZINdokw1/tHg2p+wu0Qm9b8PM7ME+iTh9m5QYEsFq2pGEvfORThtyPMbxstYUJUoA0s44zJ19oSwW+wpun9Ds4KNQt/YvHif/rmr8dJX2kvA05muRtcepsH4qGJc+QEdDjuU/8OWe74M5PPfMavmkT1ZU4q3xzqq6qlQdcjRVNXh2fZykg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9cypXp8nsMwQRvXuPN4x8XkKvz/t0lliU5CC7LdgBWc=;
 b=KOlyChCVJFD64459ajFKsohYQ33HMkBtOxsZuVOpSDJwu0ht07tfS8CX9H5qY1mA7QB5jrvKB8m2GsV6sm/HjtRWz9y3WtRz2vL5gSf34nAC7D6FEsJvTNbd2YG9oZouQ7VPRKSokZzh5z8cxOqhX7biOpDRegObGc16lvWiBmcdBKsFzltDFvQWyAmNDbYSTm5TrlOmL5c5gATJjO/bHLie2vFTldZNu5UqgY3WLJzeaUyxY2szRtNoRyNAVLkGlI0MzfGUe/b6NqtMhYZ4vEVtun6N7+F0LMbm8C0ChvyBv7XwBQamje5DISw0aQHS5xVzvspzBhYWNKyvnash9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5627.namprd11.prod.outlook.com (2603:10b6:510:e4::9)
 by PH7PR11MB6031.namprd11.prod.outlook.com (2603:10b6:510:1d2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Wed, 27 Nov
 2024 06:56:18 +0000
Received: from PH0PR11MB5627.namprd11.prod.outlook.com
 ([fe80::3a92:35da:2c3e:b94b]) by PH0PR11MB5627.namprd11.prod.outlook.com
 ([fe80::3a92:35da:2c3e:b94b%7]) with mapi id 15.20.8207.010; Wed, 27 Nov 2024
 06:56:12 +0000
Content-Type: multipart/alternative;
 boundary="------------Xb3uOXY7ngkPoRU0NMVFf9TK"
Message-ID: <75c4f516-681e-40cb-833c-5372b7729999@intel.com>
Date: Wed, 27 Nov 2024 12:26:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel/perf_pmu: Fix Test Assertion Failure for
 semaphore-busy test
To: Matt Roper <matthew.d.roper@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <balasubramani.vivekanandan@intel.com>,
 <lucas.demarchi@intel.com>, <gustavo.sousa@intel.com>,
 <clinton.a.taylor@intel.com>, <matthew.s.atwood@intel.com>,
 <dnyaneshwar.bhadane@intel.com>, <haridhar.kalvala@intel.com>,
 <shekhar.chauhan@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <ashutosh.dixit@intel.com>
References: <20241126140913.4066558-1-ravi.kumar.vodapalli@intel.com>
 <20241126213932.GQ5725@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: "Vodapalli, Ravi Kumar" <ravi.kumar.vodapalli@intel.com>
In-Reply-To: <20241126213932.GQ5725@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: PN3PR01CA0144.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::11) To PH0PR11MB5627.namprd11.prod.outlook.com
 (2603:10b6:510:e4::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5627:EE_|PH7PR11MB6031:EE_
X-MS-Office365-Filtering-Correlation-Id: c1c3c381-3cca-4240-4348-08dd0eb093ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WnFrMnNQWHpPdFZydCtBMUNoUW1jSVVmYnFObFNNdTNKNUlwQ0ZROWJIbi92?=
 =?utf-8?B?cnFmUlJSV2V6MUpYVUl4VG5ibjRMWkpQTnBTZmxKTjBGNG1oSzFGcXZsSTV5?=
 =?utf-8?B?QTdReWlLNWhwL20vb3V0ejg1QlB4UHUzdlNLamRld1grTHo0MjFBZlpxbVdN?=
 =?utf-8?B?ZVVyQnprNkVxN3Uyc0E3cU41dzc2MjM3MlNrRG5WY2hkUk01eGw1ZDRBTElx?=
 =?utf-8?B?R3dScmtmWTdNOEM4YjU2TzNVK3MvM2NiYTMwWFZEMkVtcGl0ckJWV3hGUWZC?=
 =?utf-8?B?QWV1cy9TSlptd1QySzlOLzRKc0U0UUlGNTV1bkNjQ1RKTkRUcmY2QkxmYXRw?=
 =?utf-8?B?NHp5U3NBQzdCSjIvR0hTb3duYzBac3pHVkY1RXNUcHpUSDNzMGN0aFRzZTJy?=
 =?utf-8?B?eUJWVGFNM0FmcUNNYmc4a2ozSCsrYStmb3pHdUlJWXU0WGU3SDRuYVk1VkNp?=
 =?utf-8?B?aTJkc28wZkE4M3prb3RIMDhRbklSbmVwYlB2VVRlR05aaWdjaXdFb245V3Nk?=
 =?utf-8?B?SGI3UGZqSU5oSStweW9meU5nd0FDNGFVQm1DZjc5ejRaS0R1WWd2WkhvWVNF?=
 =?utf-8?B?UWhlT1lBeTBTVjEvbFZ2M243b3ZOZ0xxUkI2N3ZZaDJqTVYrbWUxZFVUczVx?=
 =?utf-8?B?YWNjU1hXNjNhekNleHBSdmNwSnJpSWZFYW1sRnBqYW0vTGYrQzNXMTNkSUpm?=
 =?utf-8?B?MXdsSytjN3lJdXFaVGhWeWFpaEd4UVVMWG91aUU1VEp1SU16TmVyRFlzTjc4?=
 =?utf-8?B?aEQ3VFNjUmc3a3BkTjVGYjBNYWZCbEZRaGFsSDROaGVEcXExOEZIVFFLSHYx?=
 =?utf-8?B?TWFabWhoYSttb0FhV1h3aUpnUTNDdnVnU0ZMSHZpODVOL2xqNUhweWxIUS9Y?=
 =?utf-8?B?dGprZ09GYktpMHdhQW51QW5hZzJ5TUtnQjZQZ3d1aEZWK1VmMEFYbGJpb3l0?=
 =?utf-8?B?YkV1aEFZSHVadVFhVkR4RkRCYmFkT1dnbWpVWW5RRkRSdWZaeldPVzRhYjU3?=
 =?utf-8?B?NHIzYzNXbS83b3dhRzc4cS85SVNmRXByTEpOMDZZaWQyOG9RRW1zaGVwdFZo?=
 =?utf-8?B?LzhkOUxwU3dHbW1BSXl6N05UbG5TZ0dTYXRHblNTR1ZwWEUvMDRSeDBIOXZz?=
 =?utf-8?B?anNwZ2E1SUFYT2kvbWNnUzVaMEI4dUxzOUxESk1FWXBnNllJOGQ3SWNGN3VN?=
 =?utf-8?B?ZjlmRVJwZ1UvTnovTnRES2RUU1h1SUFaVkVJaG42UzVqT3ZSVjFDWi95VU1V?=
 =?utf-8?B?YXV4OS9vcWhYMGh5bWo4aG9qcFFQQXNJWU5QRGNMckMxd3cvUE5aRUxMRUhh?=
 =?utf-8?B?c1pRZnpjekJhNGF6K05Rc2FTYTNHVUxaNnVFbE1ReWxFeWhaa1h4ZTBBZlZn?=
 =?utf-8?B?cmtFa3U2M0ZVOG5XYWwvMVJ4RTRKQUNxUTNxR0F3RTdsYklGMEZObUZmV3dt?=
 =?utf-8?B?R2pkUkloSDRWMEptNktFdzRGcXJMcjV1ZGZpYmQ4NjFsVHBaOFFYeG96ZUVR?=
 =?utf-8?B?eU50YzZWWVNrUXZkTG5rYXZ5TnROQVNjclkrR1ZtYm1sVWVxVEFiV2t4MnZp?=
 =?utf-8?B?eVhsdUU3a2Nwd3JhWlZJQ3EyRk5NRUpJTHgrZy9qMGx3QXBBTkpqRHFmMnl1?=
 =?utf-8?B?ZGxvZmQrbXRlKzVnWklFNyt0eGlYd1RCaGlOeFphYUtZNWl4VkYySmxuRFda?=
 =?utf-8?B?YjBtS08zVFBJNnJES05UQkUzTVlFZnUvbGVTMzFHY3JRaTNXWlRFVWdhTHJk?=
 =?utf-8?Q?LyYwArOjhVXV2fi/5o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5627.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXF6WUY1QnlnUmp1NlByK0F3dllmcjNPcmRaZk5nRjI2YkoyamZOUXpqMTRs?=
 =?utf-8?B?ekYzY0JtTnQ4Tk9GemJ6Qk1iTWZUazVHWGxESjRyQzduUFNick1IZGZGaHR2?=
 =?utf-8?B?K0dnL1lsOU1EQUZJZGt1eDRwQVZtMXUzbWZSYmZ5b2dOdzZyY3Z6VW82OThW?=
 =?utf-8?B?cVhsS0tlL0U3MkxEWmpGNEF6citadWtXaUlsbUl5ZU9pOU5mQXhnOVdLanFi?=
 =?utf-8?B?MFFOQ3RNUFo0YjYrT3FUS0FyZlpZUk81ZjdwODQzQnAvaTdvSmdybG9QdFdv?=
 =?utf-8?B?WkhsSGVmVk5sMTlSV2NaRXl6MXVkZXFZYStYcmE0dDRzc1Z0eGpRSUJpQVRR?=
 =?utf-8?B?V3hWc2VGNXBwVDhxNzlFVng4eG9ZeHZFdU1HY2JLbXlXSjkrR2w2NE1IYXVp?=
 =?utf-8?B?c0dEeGV4cjNENDZCY1dOajM0NjFjNllSR1ZjZ1VoYlFIU3ZpVzhETFp6N0t3?=
 =?utf-8?B?eVZSUit0NUh3TEQ0K1BIUWx1by9RRjV3d1hCRjJmeTVSSUlnS1JHZDJNRFA3?=
 =?utf-8?B?RkhjRzNORFByaDVYZlloTlBJUitOdm43bEVTcURucjV4VnRzdWUvVHRkMm9q?=
 =?utf-8?B?cm9LYXpVZGNDcW91dWI3UFRsdm9TTFVnU0FWcnIwTDNGaWR0VnFja3BkdE12?=
 =?utf-8?B?WFd3YWh6OVVaYmZXa3FWTkZaUTFsZXRLaEtkVFlHYnlLaDZ6am52SkNHY2JN?=
 =?utf-8?B?S3M0eWN1UlhLbDd2MXRZUC8xTmRHVFJOTlZRSk42QkcwandUR3R0ck5Sd2dM?=
 =?utf-8?B?T0xZbHI3bkZLSkRSVHRMYXV6Y2s5NEZOS1p5L2htT1MvVUVjVTRrbUI2aWtS?=
 =?utf-8?B?a1JIR21CZ01PaXRoK3VxcGdIS0Q1MmlBclZ5a1VLdS8rMlFaVFpnOVBnNm9o?=
 =?utf-8?B?eit2THdPYlc5ZUxqRExZa3lRb1dhT0IrWnJOTm96NHdVZXkxaXJZMEVHaEZK?=
 =?utf-8?B?YmNLR1RSWDc1dlRoUWhpTTMvbGFpM3N0cTZZb2pYcDYzTE4vVjI2YVM2OG83?=
 =?utf-8?B?UGpvSC9nMnNlZlBLTUpNemhyS05NYm5VSno3UEtjK0VQZnJIVVFLVWJYcko2?=
 =?utf-8?B?WFdJWTQ1QzdZdzF1dUlENzErREpXTWZLZFZrNGQzc3dVZzhqVVRMdTJZSkRl?=
 =?utf-8?B?Tk4wNE5hZmQ5RXI1eXBjTFNpaUlVOEFGSU4raFAxNTZKczlQYmJNVUVmVnd2?=
 =?utf-8?B?WThDZW5TSDBUZCtWNmdkaU41WWV5T0tURi9JSW9US3VmK2RqSnJETzFLMzdq?=
 =?utf-8?B?YUlybDNtTUdkYzJxOG9DbUtuMlRvZytMZ2l3R0hUTEhYbXU3ZFliSUpsejR4?=
 =?utf-8?B?RllXTDV5RzZ5K1ZFSmVuRkMyVW5TS3ZuQXRRS0FsVEVXbjZhVUJtV0JEVUZx?=
 =?utf-8?B?eEZoWmlmK3k2em16U2VWTEFEODdGYUNWSXR0c1VhbFF6NWplb21TTWRMU2pk?=
 =?utf-8?B?anhweUc0NEc4T0RmblZPblozZ0l4TkJWS3hrZzFUbXBYYkNMNWQwWmY1YUts?=
 =?utf-8?B?ME1nZ3FuNURqNkFheEpCUXdoTlpUYTAxYzlSeHZGbkdkUTN4dnZQbWhCZzdq?=
 =?utf-8?B?ek5IVUszMjZRclBtUnBJMVlzaTBmUGFWcytoYzBoQ0dsbjEya0RTdnovODM4?=
 =?utf-8?B?V2w5ekp5TC8xeHUzRXloWHl6TGFKc0o1Wmw5a0FUZEFjMkVYcklVNWdoemM5?=
 =?utf-8?B?bUROYnJ5aTV2QngreWpIdWZEV2tLVXhvZTMxWHp2MzgyUS9mNkVDdFc5eFZ4?=
 =?utf-8?B?QUtCdzlsQWxsT1k5bithNXFWNStneFN1ZnVmT2NLcVh3cnY5R0lkaC9KQ05y?=
 =?utf-8?B?UjJqNTVBSXVaRDJMbWluR2ZrMGxxQ0h1VnBuNmNJTWJ2Nllwakl0emozTDZP?=
 =?utf-8?B?N1ZhZmtZSVNod09vSzBTaFdNQzVFVkhYSlMvbFdYYWtTQ3V3ckdjUzNEa0Zo?=
 =?utf-8?B?cHloOUE2VUNNdjdIUTFqUml6b2crSkFpNEM5NnQ1MkYxYXFJUi9pcWtLZmcr?=
 =?utf-8?B?bkdJR3NBVk9TZUhqTi9jSUJPcjBpNjdOTzByUjA3UXlSampMRVlyUTZiOE4x?=
 =?utf-8?B?aGxiSmFBcTVyYXdDNEJPanVPM2lTdkdaYmNibGRqcXdESXB3bG5nbkFGb0dt?=
 =?utf-8?B?WmliU2dMcVpBSmxSVklWTzhnOXplYVd5Qk5kbFhLMGVoeHQvQ1I3cjQvMGFC?=
 =?utf-8?Q?8j1RNqDGC+6gQIotcRUtYPQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1c3c381-3cca-4240-4348-08dd0eb093ce
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5627.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2024 06:56:11.7481 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hUfQgaW5eMmzjoYDXnnMGKiaZZdIbaEvkw/6ghJCRV4OROCvNtFMZ6usRlMg1lIZ5kdljU0uX9X/jJX7U12bA7oaaRCogZLSdWg0YDDBvEc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6031
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

--------------Xb3uOXY7ngkPoRU0NMVFf9TK
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Matt,

This issue is not reproducible, tested multiple times, myself and 
Nerlige Ramappa, Umesh from
kernel-telemetry team has discussed the issue, did not found any 
permanent fix.
Please suggest what can be done.

Thanks,
Ravi Kumar V


On 11/27/2024 3:09 AM, Matt Roper wrote:
> On Tue, Nov 26, 2024 at 07:39:13PM +0530, Ravi Kumar Vodapalli wrote:
>> The tolerance limit exceeds the threshold values sometimes for test
>> igt@perf_pmu@semaphore-busy, bump up the limits slightly.
>> Also print the log in readable format in percentage instead of nanosec.
> But why is it exceeding the limits?  We're already giving 5% wiggle room
> (which seems like a lot); bumping that up to 10% will hide CI failures,
> but it doesn't really explain why the numbers are so inaccurate to begin
> with.  If there's a real bug causing the mismatch, then we should figure
> out how to fix that bug rather than just making IGT more willing to
> ignore the problem.
>
> BTW, looking through some of the results for this test in cibuglog, it
> seems like there are still cases where even the larger 10% tolerance
> still doesn't cover the gap.  E.g.,
>
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8126/shard-dg2-10/igt@perf_pmu@semaphore-busy.html
> (87.2% vs 100%)
>
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15748/shard-dg2-4/igt@perf_pmu@semaphore-busy.html
> (88.1% vs 100%)
>
> So I think we need to understand what's actually going on here and
> causing these results.  If there's a known, legitimate reason why the
> numbers are way off on specific platform(s) (e.g., some kind of
> workaround in the kernel or GuC) then it would be better to blacklist
> the test on platforms where we can't expect reliable results than to
> relax the test itself (and possibly let bugs go unnoticed on other
> platforms).
>
>
> Matt
>
>> Signed-off-by: Ravi Kumar Vodapalli<ravi.kumar.vodapalli@intel.com>
>> ---
>>   tests/intel/perf_pmu.c | 9 ++++-----
>>   1 file changed, 4 insertions(+), 5 deletions(-)
>>
>> diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
>> index bfa2d501a..7f43354fd 100644
>> --- a/tests/intel/perf_pmu.c
>> +++ b/tests/intel/perf_pmu.c
>> @@ -189,7 +189,7 @@
>>   
>>   IGT_TEST_DESCRIPTION("Test the i915 pmu perf interface");
>>   
>> -const double tolerance = 0.05f;
>> +const double tolerance = 0.1f;
>>   const unsigned long batch_duration_ns = 500e6;
>>   
>>   char *drpc;
>> @@ -287,10 +287,9 @@ static uint64_t pmu_read_multi(int fd, unsigned int num, uint64_t *val)
>>   #define __assert_within_epsilon(x, ref, tol_up, tol_down, debug_data) \
>>   	igt_assert_f((double)(x) <= (1.0 + (tol_up)) * (double)(ref) && \
>>   		     (double)(x) >= (1.0 - (tol_down)) * (double)(ref), \
>> -		     "'%s' != '%s' (%f not within +%.1f%%/-%.1f%% tolerance of %f)\n%s\n",\
>> -		     #x, #ref, (double)(x), \
>> -		     (tol_up) * 100.0, (tol_down) * 100.0, \
>> -		     (double)(ref), debug_data)
>> +		     "%.3f%% is not within tolerance limits of +%.1f%%/-%.1f%%\n%s\n", \
>> +		     (((double)((double)(x) - (double)(ref)) * 100.0) / (double)(ref)), \
>> +		     (tol_up) * 100.0, (tol_down) * 100.0, debug_data)
>>   
>>   #define assert_within_epsilon(x, ref, tolerance) \
>>   	__assert_within_epsilon(x, ref, tolerance, tolerance, no_debug_data)
>> -- 
>> 2.25.1
>>

--------------Xb3uOXY7ngkPoRU0NMVFf9TK
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <font face="Calibri">Hi Matt,<br>
      <br>
      This issue is not reproducible, tested multiple times, myself and
      Nerlige Ramappa, Umesh from<br>
      kernel-telemetry team has discussed the issue, did not found any
      permanent fix.<br>
      Please suggest what can be done.<br>
      <br>
      Thanks,<br>
      Ravi Kumar V</font><br>
    <br>
    <br>
    <div class="moz-cite-prefix">On 11/27/2024 3:09 AM, Matt Roper
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20241126213932.GQ5725@mdroper-desk1.amr.corp.intel.com">
      <pre wrap="" class="moz-quote-pre">On Tue, Nov 26, 2024 at 07:39:13PM +0530, Ravi Kumar Vodapalli wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">The tolerance limit exceeds the threshold values sometimes for test
igt@perf_pmu@semaphore-busy, bump up the limits slightly.
Also print the log in readable format in percentage instead of nanosec.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
But why is it exceeding the limits?  We're already giving 5% wiggle room
(which seems like a lot); bumping that up to 10% will hide CI failures,
but it doesn't really explain why the numbers are so inaccurate to begin
with.  If there's a real bug causing the mismatch, then we should figure
out how to fix that bug rather than just making IGT more willing to
ignore the problem.

BTW, looking through some of the results for this test in cibuglog, it
seems like there are still cases where even the larger 10% tolerance
still doesn't cover the gap.  E.g.,

<a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8126/shard-dg2-10/igt@perf_pmu@semaphore-busy.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8126/shard-dg2-10/igt@perf_pmu@semaphore-busy.html</a>
(87.2% vs 100%)

<a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15748/shard-dg2-4/igt@perf_pmu@semaphore-busy.html">https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15748/shard-dg2-4/igt@perf_pmu@semaphore-busy.html</a>
(88.1% vs 100%)

So I think we need to understand what's actually going on here and
causing these results.  If there's a known, legitimate reason why the
numbers are way off on specific platform(s) (e.g., some kind of
workaround in the kernel or GuC) then it would be better to blacklist
the test on platforms where we can't expect reliable results than to
relax the test itself (and possibly let bugs go unnoticed on other
platforms).


Matt

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
Signed-off-by: Ravi Kumar Vodapalli <a class="moz-txt-link-rfc2396E" href="mailto:ravi.kumar.vodapalli@intel.com">&lt;ravi.kumar.vodapalli@intel.com&gt;</a>
---
 tests/intel/perf_pmu.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
index bfa2d501a..7f43354fd 100644
--- a/tests/intel/perf_pmu.c
+++ b/tests/intel/perf_pmu.c
@@ -189,7 +189,7 @@
 
 IGT_TEST_DESCRIPTION(&quot;Test the i915 pmu perf interface&quot;);
 
-const double tolerance = 0.05f;
+const double tolerance = 0.1f;
 const unsigned long batch_duration_ns = 500e6;
 
 char *drpc;
@@ -287,10 +287,9 @@ static uint64_t pmu_read_multi(int fd, unsigned int num, uint64_t *val)
 #define __assert_within_epsilon(x, ref, tol_up, tol_down, debug_data) \
 	igt_assert_f((double)(x) &lt;= (1.0 + (tol_up)) * (double)(ref) &amp;&amp; \
 		     (double)(x) &gt;= (1.0 - (tol_down)) * (double)(ref), \
-		     &quot;'%s' != '%s' (%f not within +%.1f%%/-%.1f%% tolerance of %f)\n%s\n&quot;,\
-		     #x, #ref, (double)(x), \
-		     (tol_up) * 100.0, (tol_down) * 100.0, \
-		     (double)(ref), debug_data)
+		     &quot;%.3f%% is not within tolerance limits of +%.1f%%/-%.1f%%\n%s\n&quot;, \
+		     (((double)((double)(x) - (double)(ref)) * 100.0) / (double)(ref)), \
+		     (tol_up) * 100.0, (tol_down) * 100.0, debug_data)
 
 #define assert_within_epsilon(x, ref, tolerance) \
 	__assert_within_epsilon(x, ref, tolerance, tolerance, no_debug_data)
-- 
2.25.1

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------Xb3uOXY7ngkPoRU0NMVFf9TK--
