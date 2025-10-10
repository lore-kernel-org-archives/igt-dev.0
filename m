Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D17C2CCD187
	for <igt-dev@archiver.kernel.org>; Fri, 10 Oct 2025 22:29:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 886B110E2B5;
	Fri, 10 Oct 2025 22:29:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iGZAm9dB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C96AF10E2B5
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Oct 2025 22:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760135372; x=1791671372;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0rtOSgF9AMx7jJeqLl+EkmZ56Dsv4s1myQLei0DjC/8=;
 b=iGZAm9dBuGtK1Rbir7FdOF4OxA0U7cpkRlAr+HFC0s80BMRlG0MHtf01
 TM0rb5XgPfO4eJly3uTHEz7uogf/+0V+bQZcrBoRUOGUBH4/FvX+oeqc9
 m2SUUTlNjoZk73O2VVNrqHUs6wQKZZsy19gv1r5snyfI2u25vrkYAV39j
 djCrIns4WZoEhgqHr3GsTNsHrxPgibTLyg23C4kPUl8MLYQE1sb5f1Dbk
 LVqOAz8ONa6h1Nr3hRJa92RLdwWExyBhQSGS9l4CfCSqceGz1Bpz1YHae
 n4Bwu5OsBz0X1pwbFFavgRJNgQF71+dW1oZij8dfM1JmLhh03PVA1TxT7 g==;
X-CSE-ConnectionGUID: eRdJ00pASlmxbsQvbERg7A==
X-CSE-MsgGUID: o+s5q2zxRVyQUoVRad9Eqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="62400060"
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; d="scan'208";a="62400060"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 15:29:32 -0700
X-CSE-ConnectionGUID: tcNASjmKQIqoYGhmkVMKYg==
X-CSE-MsgGUID: fj/e2vSrTTKjekuHlFF0Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; d="scan'208";a="180908584"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 15:29:32 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 15:29:31 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 10 Oct 2025 15:29:31 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.62) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 15:29:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h2nwDDBRkDRyS5NH19QRAjOU+2C0vDFrQtzBUg9Hzx2/Oqci3XDGivmGfyBfd5OxCtyCv4cNigxns4yBMkmBDwsDl8zySfg7tjg108ltDKLGOFK4n6v1I/nbyd6Sqd5/CKf4CZq9kFop5hq8f2EHC9i3ODZ3Dapa3TlKBbGq2K2WwS3p2aiySS7IRBZ+iBJyJXSeFw1RPE8MudSubkXPmaL4QytY+mHy6DHg8zjmNxMPs1VQWCNvS7t5RpAFvSJjtpGuaSYxEHl1LkbYuueDmq18a0+SeAy+06flG2DFHDBZryt4n+FUVXHpZsWBaHNjONgPhaqCofSjxF2fGYQUSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VKMCXRPHxNT3IPc+fSqAQjLD7bXGUs1Ow4kSij3+FUQ=;
 b=jtETpW9uQqlhJeLclkPsqag6i7LzBRxiP76dyuZ4uTSfcXaT8G7baqXmkBAjpj9sBZQ7yswjJX7eXpgKqSVQ4tOZYXc9Kv/MZYHgrfKHM7cgWRrzVCOYnyPUdn0Brbaamsau1s+bRA3vOc2biuvd7i9uaL3G2rPr3OthjK1MeI92kQ/xTfwE3F42NHSizyaRsOAj1sqfTz8dHEAESKKIogD20YiMokQpnnwZERGKDYFeZ2cgDBRhAh7psfnljzvqJhL0OmllSfC700yMUS7vQcuKpIAujtM4y59v2NfXEH8CJDEeNNLUK6zq8/6AqWbn0JR3CobXPRHEHwAoWP6tXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CY5PR11MB6307.namprd11.prod.outlook.com (2603:10b6:930:21::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 22:29:29 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 22:29:29 +0000
Date: Fri, 10 Oct 2025 15:29:27 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 14/18] tests/intel/xe_oa: Convert MMIO trigger
 tests to take OA unit arguments
Message-ID: <aOmIxy6CxPPSt5F0@soc-5CG1426VCC.clients.intel.com>
References: <20251008211806.625154-1-ashutosh.dixit@intel.com>
 <20251008211806.625154-15-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251008211806.625154-15-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0321.namprd03.prod.outlook.com
 (2603:10b6:303:dd::26) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CY5PR11MB6307:EE_
X-MS-Office365-Filtering-Correlation-Id: d00750ca-8634-491f-c2d6-08de084c7a18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ejQ1T2xpZDBTbjJ6aUl1SElkY1lCS1RGTFBmUHVXaWpLOUswN1labS9SM2Fl?=
 =?utf-8?B?N1BLZmVDdk0rTXQzOWFROWR4LzlUcW9BTkpPalhZZkk4dWpFSStnejg1R3VJ?=
 =?utf-8?B?Rk9MTGtPcDIzSFV2RDNZTjZUY0ltUGsrSGtUVDkwOUJnemJ0WmkxS1o3OVlU?=
 =?utf-8?B?UFV4VWJnbjVQVjV5NU0zanB3K2hsWEJiOWJVemVLNXVNemozNUxHNjBSbjRV?=
 =?utf-8?B?TnQ5WnpHUVl6Yy80SUlSbHVldUR6Nmw4KzlNUWtvRXpqMzcwSUM0R3p1am9y?=
 =?utf-8?B?SzdRZll1TGxwTFg1bWZHQVNLVTFLdEdENWw5VFE4OE1rcGFuVUpSb3gvcmRJ?=
 =?utf-8?B?QUY2WHVxR1VyRENmSk5KZHFhdi9UbVZCditUVHkwbUtRN2FRa0J0ajk0Vm53?=
 =?utf-8?B?U0tPYTNFZFNyamF3b3JtNFBRaVBiK0ZCbXZCV000QzE2ekRZbUZHK2I3ZHJD?=
 =?utf-8?B?and2MTR1NWNqYW5Ga0RpWHp2SUl1SGMwL09TL1VWemdSelNGWjRSK1BDeGE2?=
 =?utf-8?B?ZWwyNFVtRkljV3NlUCttNWM2RGNuTVZoZlhqYjJGbXBwQi9KMFdsdU40MVNY?=
 =?utf-8?B?QWMzSGM0a2oyM1JVSzk2SGh0allWeWVjTlNCWFBZeWhaUU5xQkUrd2FYYXd3?=
 =?utf-8?B?V1pxL2tTZmdGOERhV2Y3U0hwbURYdjM5dFJqbEVZVXg4aGNiQjVQbXJPMW1O?=
 =?utf-8?B?QWlNbndhbjluTk9lMlFrMVlCMXQ5UW1kVDFXaWg5RU93cGRDMHg4S09FN2tS?=
 =?utf-8?B?NnFtVU9ZZE9QMkxaTGxYdHJLOTFRTVNHQTNtaTlrbFNnTTFMS0hINmZCR0o0?=
 =?utf-8?B?RUlHdXljeHpCODJndmttTTB1VXJEVnhtUHRTOW9EeDBEcFp1K3dxSit2NWx4?=
 =?utf-8?B?VFRhUjFpcHJBazBNZERVYURGNGlmYWl3Nk5tM3llSnhaeXpqeXdvZlhWMjF0?=
 =?utf-8?B?VWFaYjQxTzJlcW9ONmNnR29qU3NKN0xOWVAwZmliNnMrdFlYVHR4SldmMGlk?=
 =?utf-8?B?a01Bb2t1OVJYVEZqc2ljbzB4dWR4L3IyYmNaMlNOU09Ydzl4QXRNWVQvTWN1?=
 =?utf-8?B?cG4zRXp0d2tlTUs0UzhYbXdMVVZPUkNsT0IvVloxczlsa2lILzBGNVl2K0h4?=
 =?utf-8?B?NEVYV29ZNmV6RFFWb0QzOHpycDNBVkVBRXc3VHNqMnJha1l1NzQ4am5HckpY?=
 =?utf-8?B?S1lNNG9URitzMW5IRTFHb3JBZ1RFVkd1RE4rNmM0Y0tQOFdLUGx0bUhhY0VV?=
 =?utf-8?B?bVNRY0d5VVpaUEx5alhCNGRFcmJUZW53VGpLdXZ5eDUrcVJUVC9mWHJoajdq?=
 =?utf-8?B?Q2hhQnRvdVY2cWlOYnV0TEpSUlFIcjRxT2ZHbkV3Z3lYL2srR0dvUm1tUXNG?=
 =?utf-8?B?R3M0djFROXBWc2IyaHpoeUFrRldDWW1QOXB1VGtscTNJYXR2Si9rTW4rZEJI?=
 =?utf-8?B?eDE5dWxqMEdxMDNuRFlpVEE1S1l0Q3RaZVp0c0ZUQVhEN2t3NDhpZk82S0dB?=
 =?utf-8?B?MWFaZXRvcEV2WmI5SVpyRmkyc2FwTUtJS2g4cDYxU0xKbGZWTjdiTmpoZlV1?=
 =?utf-8?B?dTZDd0NPaEFxV1hGdFhSc3dINUppWnZHcXRMcWgwZ2ZpZWd2bDBaU0xDcjlY?=
 =?utf-8?B?Nk1jSmdTTUN6UFcydDIzaUZSRkdtaEhKMUVaQnh5bkR0VEJjT1ptaXpKc0J5?=
 =?utf-8?B?U0NTRDdBNUpheUh0eU1uUDd1SGE5NFl1NDhLUXpydXcvbGpMa1NzcVlmQkR6?=
 =?utf-8?B?clNWbjNHVUM5TWd5N0pqQ1dXTVRoczNjVExtMVZFTmg4SnAzZXdRUjlpa092?=
 =?utf-8?B?MHA1VytGaEx2TFZsU1dONk1Gb1BzNVFPNVZqQXlPVWs3cXM4MFloUWpha2NL?=
 =?utf-8?B?aWMwcW9UL2J2K1V2RDM5bFQ2K1ZYSTlsZzhXOTZsaWxSR1ZweHZSbVorTjMr?=
 =?utf-8?Q?4c6S55NAlyWCZ8zF6JhzoMO4/aM092vm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0RpYmUvd2lTV2RaNnIwajQ1TUVTenljU3E0NXZPUnhaSmtMak5ucjg0R1hm?=
 =?utf-8?B?WTJmVDVvY016OHBHbFRqYzF3bjMvK3NGazhJTE0rei9QbDA3NFc3M2duZU1Q?=
 =?utf-8?B?dDdXWExpcmRPUldWN1hYU0x5ME5JSzVDOFNWNW1mcU9tUEZZTXl5M0RPdnRS?=
 =?utf-8?B?aGtNUWpDbU14TmtSeVpnSllYTjVLbitqUEF3VEN2TkZWWTlIajFldWVlUEtv?=
 =?utf-8?B?cTlWY1dTYk1kcW9jcFB5TFM2Ky93b2NtcG5LVlgxQkdJdmFoV3FZZW1XZHBR?=
 =?utf-8?B?S0hhakhqdk1TbXZvZzEyWHVLRm5JTUZuWDZ6WXRNd0FrRVQ2d3QvZ1E4ZTJD?=
 =?utf-8?B?bWs3SjJlRTBCeHNPMHp4RXp0bW56NW5kaHY4eFJHVnhrdnFLbTI4c2Nrb0ZX?=
 =?utf-8?B?TXdVcnB2RjlnSHB6VkJBSDgxVDc4ekxMSUVxU011R0MwRlZjS3BJdEd1R1Qx?=
 =?utf-8?B?MEdtbzhKSWYyTFB5VkZiTnlTR2ZmdWswZnJIdERqajEyRWxiMmpMQXFFRUxl?=
 =?utf-8?B?NXU0aDV1c2Q3RFFhNkNiQWtlN0F2OXA3OVMzajgwS0hTbkZCUDZJRHV1ZC92?=
 =?utf-8?B?Z3RkYUEzUU5teTFnbUYrT1llazFiQ20zMGt1M0cxdUN3Z3Nqd2ZIVG03U1VD?=
 =?utf-8?B?UGVTckQwS21YUzN4WHAwdmZvRXR4dExUenc4bncwVkhFRWRKdlFyUm16ZHpV?=
 =?utf-8?B?TFhucXl0bk5NZW55ZGdSUFNkNWlXaHFBQXRHL2xMbDVnTVhGTC9hV0dIMEVz?=
 =?utf-8?B?dUNxZzYyNVIxdDcyZ1lQOUU5aGRGTHNwUEgrdFlRV0tsRHdpR1JtaG5TN3hZ?=
 =?utf-8?B?UnNRTlRJTWI3YlB3NjhDZzFRLy9XQ1NDRkhpKzdhdXlyaWVxY08yMDBkTmNU?=
 =?utf-8?B?L1pIOTdNRW9ZT2hQeURMc3k2U0tCZkhnT3pFbjNheU1TVmFXS1hvZWVUcENz?=
 =?utf-8?B?OGVWdDNORjAxbXdzWDgrS2k5V2FPcnFRTjcrd29OOHF4QUkxUDBoenV0Sjcz?=
 =?utf-8?B?RUUxVVlLbnpwT3NHbmxHTDRxc0o1MnZDclpjY3B0Q3UzUlpUUWl3dkFYeW1G?=
 =?utf-8?B?SEFyU3pMS3NPL0NLSTR5YTgrNkJHSjRHb0dBQ3JhNVdVSUJoK1JtdzJ0Z05E?=
 =?utf-8?B?TkVyZ0JoS2lVUXMzSVZNM01rbG9aMEdkUVhDWExsS0E1K2dLMTR1QkVpRmFX?=
 =?utf-8?B?TFhKTXhBUVd2dEYrUjV0ZVJFazBpMXpVR0VIYmNMNTlFcHZIYy9Jbkk4THdl?=
 =?utf-8?B?ZDRvOFRGY0VVM3hiMWw0SDhYYXNRUVpnZVhTMFVIbFluelM3UXFLYnNaUHFN?=
 =?utf-8?B?RHMxSGFJc0U5Nmw0bkdIdlRKS0RUSXZjK0xrMmovOG5jS2RiaTJhVlpucU45?=
 =?utf-8?B?WE9OZ1BxNlFrL0FxdGhNY2R3cE0xMUNOYUQvNVJjUVc2b0F6U0ZHc0VIWU1B?=
 =?utf-8?B?Z25DR2hleUI2NXpvVnVVdUFoK0pnNlFIT0dHYmErZUpQM1drZWZoV1dLMXd5?=
 =?utf-8?B?TnJ0aUJKVm1EU05meXFWb0dSYms0NGVCL0c3eTl3NkUyN3RZZnNiTmt6a3do?=
 =?utf-8?B?RDhlaWNmeUZaOC9NaXVxY2FnOWppeHNicWhERm1ITjJMUXVGVmRyN3BaditP?=
 =?utf-8?B?N09YS01PY1d2MEV4aHJPTTZlQll3Tnc5MHJUZyszOVlPa2JadWQrTWUyYU5r?=
 =?utf-8?B?MWRPWEpOcXpNVktlS0Z2cmlVMEhEUkJ2aEkxQXVCajRXMUVqOGJqbkJPNDdi?=
 =?utf-8?B?ZlRrN0cyUXl2Tm8zcUFRbXg1d0dha21mcWY5bDJZWkFmYkZVcEQ4eTZpdTRJ?=
 =?utf-8?B?eTNlSmU3YWhuVXkxL1VwZitpOERyN0ljY2VOSVpjY3REQWRFRi84QUJUY3ZB?=
 =?utf-8?B?N1dFZ01lN2lOSzF3bkJ0LzBhZ3dxeTlTSDlxWkRUWjR2WCsxZWZyTVh0RFdB?=
 =?utf-8?B?V2ZPSlI5dUhkK1JaVVBzOGIzQUFSWGVjdlN3MzB0VVZmMUVJWWxrZStyZXhq?=
 =?utf-8?B?TEM5UjRWcVhTbzZicU9qcHdPc011alc4UE16T1N1ZjNlZzZ3Nm1oZERveEp4?=
 =?utf-8?B?WUhlZG4yaU5Ra0d4OVVPS3pqVjBRbVpPc1ZpRVowZHBxRlhEdWlXRXNWZHN0?=
 =?utf-8?B?S2JGenhOZlZEaVFBNzBVUXZFTUQxU1RhTy93Z0ZjTlRkVU5LMWlsaWgvUVUr?=
 =?utf-8?Q?IWsnHO1QciFrLdc4TPVk9bw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d00750ca-8634-491f-c2d6-08de084c7a18
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 22:29:29.3831 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cgPOAGP8LR8gsMJwm6diBpKXeKSv4SdHbcW4QUf6zxw0OsVUzT0LzaJYU8aLnO+2nhsIrtOyRKDXesA57ca/ikEr/Ritht1tFKrxrybXkBM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6307
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

On Wed, Oct 08, 2025 at 02:18:01PM -0700, Ashutosh Dixit wrote:
>Convert MMIO trigger tests to take 'struct drm_xe_oa_unit *' arguments, to
>enable them to be run on all OA units.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> tests/intel/xe_oa.c | 41 ++++++++++++++++++++++-------------------
> 1 file changed, 22 insertions(+), 19 deletions(-)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index 1b16893de3..a3f4a80d6a 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -3992,11 +3992,12 @@ static u32 oa_get_mmio_base(const struct drm_xe_engine_class_instance *hwe)
>  * SUBTEST: oa-regs-whitelisted
>  * Description: Verify that OA registers are whitelisted
>  */
>-static void test_oa_regs_whitelist(const struct drm_xe_engine_class_instance *hwe)
>+static void test_oa_regs_whitelist(struct drm_xe_oa_unit *oau)
> {
>-	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
>+	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
>+	struct drm_xe_engine_class_instance *hwe = oa_unit_engine(oau);
> 	uint64_t properties[] = {
>-		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
>+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
> 		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
> 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
> 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(test_set->perf_oa_format),
>@@ -4010,8 +4011,7 @@ static void test_oa_regs_whitelist(const struct drm_xe_engine_class_instance *hw
> 	u32 mmio_base;
>
> 	/* FIXME: Add support for OAM whitelist testing */
>-	if (hwe->engine_class != DRM_XE_ENGINE_CLASS_RENDER &&
>-	    hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
>+	if (oau->oa_unit_type != DRM_XE_OA_UNIT_TYPE_OAG)
> 		return;
>
> 	mmio_base = oa_get_mmio_base(hwe);
>@@ -4039,10 +4039,12 @@ static void test_oa_regs_whitelist(const struct drm_xe_engine_class_instance *hw
> }
>
> static void
>-__test_mmio_triggered_reports(struct drm_xe_engine_class_instance *hwe)
>+__test_mmio_triggered_reports(struct drm_xe_oa_unit *oau)
> {
>-	struct intel_xe_perf_metric_set *test_set = default_test_set;
>+	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
>+	struct drm_xe_engine_class_instance *hwe = oa_unit_engine(oau);
> 	uint64_t properties[] = {
>+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
> 		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
> 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
> 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(test_set->perf_oa_format),
>@@ -4144,10 +4146,12 @@ __test_mmio_triggered_reports(struct drm_xe_engine_class_instance *hwe)
> }
>
> static void
>-__test_mmio_triggered_reports_read(struct drm_xe_engine_class_instance *hwe)
>+__test_mmio_triggered_reports_read(struct drm_xe_oa_unit *oau)
> {
>-	struct intel_xe_perf_metric_set *test_set = default_test_set;
>+	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
>+	struct drm_xe_engine_class_instance *hwe = oa_unit_engine(oau);
> 	uint64_t properties[] = {
>+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
> 		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
> 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
> 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(test_set->perf_oa_format),
>@@ -4240,8 +4244,7 @@ __test_mmio_triggered_reports_read(struct drm_xe_engine_class_instance *hwe)
>  * Description: Test MMIO trigger functionality with read system call
>  */
> static void
>-test_mmio_triggered_reports(struct drm_xe_engine_class_instance *hwe,
>-			    bool with_read)
>+test_mmio_triggered_reports(struct drm_xe_oa_unit *oau, bool with_read)
> {
> 	struct igt_helper_process child = {};
> 	int ret;
>@@ -4251,9 +4254,9 @@ test_mmio_triggered_reports(struct drm_xe_engine_class_instance *hwe,
> 		igt_drop_root();
>
> 		if (with_read)
>-			__test_mmio_triggered_reports_read(hwe);
>+			__test_mmio_triggered_reports_read(oau);
> 		else
>-			__test_mmio_triggered_reports(hwe);
>+			__test_mmio_triggered_reports(oau);
> 	}
> 	ret = igt_wait_helper(&child);
> 	write_u64_file("/proc/sys/dev/xe/observation_paranoid", 1);
>@@ -5275,19 +5278,19 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
> 		}
>
> 		igt_subtest_with_dynamic("oa-regs-whitelisted")
>-			__for_one_hwe_in_oag(hwe)
>-				test_oa_regs_whitelist(hwe);
>+			__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
>+				test_oa_regs_whitelist(oau);
>
> 		igt_subtest_with_dynamic("mmio-triggered-reports") {
> 			igt_require(HAS_OA_MMIO_TRIGGER(devid));
>-			__for_one_hwe_in_oag(hwe)
>-				test_mmio_triggered_reports(hwe, false);
>+			__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
>+				test_mmio_triggered_reports(oau, false);
> 		}
>
> 		igt_subtest_with_dynamic("mmio-triggered-reports-read") {
> 			igt_require(HAS_OA_MMIO_TRIGGER(devid));
>-			__for_one_hwe_in_oag(hwe)
>-				test_mmio_triggered_reports(hwe, true);
>+			__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
>+				test_mmio_triggered_reports(oau, true);
> 		}
> 	}
>
>-- 
>2.48.1
>
