Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 031E5C021B3
	for <igt-dev@archiver.kernel.org>; Fri, 21 Feb 2025 16:46:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD1E710EAFD;
	Fri, 21 Feb 2025 16:46:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xwzh63Ok";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70D4410EAFD
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2025 16:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740156414; x=1771692414;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=A+ppMYaDdNA2jAMMyqmCJJdwKJUb/72aS9LOa9x6HeQ=;
 b=Xwzh63OkTtiyAf3PGW+hWG9n6D5XyKazFuZRh75ROV7Czbixt2eX/199
 PNEoOIc+wrQ8PQ5xcGrAHUk2EZS5czrPBLFHCEAEsLwKic/k050LamoBH
 3+82kWou6ysijuNZHa8HsFxsFJHLZEoMwxAVEEValPaO/avBE8OTpuRZI
 4QdYWm0wem98duUnzhtSkS84yPh7GtEMF3OiW/dIP+yuTj1+oLieVi7xj
 qQhhBnZMnDRW9Q4Hjz1KhyRYN5Iww/Cux9tICsGT0XYKtzYYs30iAnISO
 N0Xe05qZaw2Y3ZEhTlzHIeXOdqrj4Y9OIJiy6p4hCt5xNQLs28t+p2ej0 g==;
X-CSE-ConnectionGUID: M9iZcqRdQY+I9dwUL190ag==
X-CSE-MsgGUID: TcON65G/QpWlFKAOnrcysg==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="51971565"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="51971565"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 08:46:54 -0800
X-CSE-ConnectionGUID: 8YSWzvBJTge3UqdJZp4scQ==
X-CSE-MsgGUID: fakt7sSGS4eXUG9u69OVLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="120654102"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 08:46:53 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 21 Feb 2025 08:46:52 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 21 Feb 2025 08:46:52 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 21 Feb 2025 08:46:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nbH81zlpJVjuojsPTRZpFvg8r9lPUNMETMzU5ph6I/hmOoVmeoK146DZazvoihEw/NTlKxgph5PCbcANVZpzk7YcHI2vwFnII7bYUjmJNc1N3JW3jcy4nWgWunW1YpyvXfbn2t+Q0719W5Pg0XuZkR+RxF0v5UM2NsGJvJPx2UWY+g3BsNdb4Uu94xjQGYy1h1H7kRcjR6m0sxDM71ZvYfv9v//GjTuw5qSw5r3vQdG85GeO7IeCrBHjGISyyLkgJApLpq4PgbIXvkKfNFvJDdVZUMCVXRaIiOLBY+fqrznHD63y1km1KODvXLulFVHCn/2qbW3bQeIt74KDh1XM9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=39NdtHQEj5EUcfaJvTuhYa+6ms48hfHNvY/Y8kPbEA0=;
 b=wdaWhguPr0jm57m+47y7Ck2ebsh1fKSXQeIMcGIn5OXKMARsG5ogtpLsSq5+G4w5ERW0zlxWyyT8z6RE/fkIxsbRbWmNHEJ/iznUiSacYcyO14ofJJSRQunjhUOV77qNQX8wWRxLaaq7QLrVtbA+M21QqjnHim8qXKemTffrYXkdDzC1b1r6TMn5N9VbUFGfoDJeqsW3w3kFmLC0K7IoyOjxu00T0kHpraX8Jd+WQVq6yGzzXCMglmPuFbLqlvWjfVwR2FGicwC2BTkU0le41TTwuZJKqMvSzStdlqBWkvfLKFeVdtdw7bsFijPsf0Kc0Qxl9GOmIjZwzebgQD6L/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by CYXPR11MB8661.namprd11.prod.outlook.com (2603:10b6:930:e4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Fri, 21 Feb
 2025 16:45:56 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.8466.016; Fri, 21 Feb 2025
 16:45:56 +0000
Message-ID: <9937b0e4-fe26-468d-aed2-0430f4459389@intel.com>
Date: Fri, 21 Feb 2025 11:45:50 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/xe_exec_capture: Skip checks on VF devices
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Lukasz Laguna <lukasz.laguna@intel.com>, =?UTF-8?Q?Micha=C5=82_Wajdeczko?=
 <michal.wajdeczko@intel.com>
References: <20250219115314.180382-1-marcin.bernatowicz@linux.intel.com>
 <20250219115314.180382-3-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <20250219115314.180382-3-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0052.namprd03.prod.outlook.com
 (2603:10b6:303:8e::27) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|CYXPR11MB8661:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cc68602-55e3-481c-4e8c-08dd52973631
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SFFEbVBlalpPL2ZPVDFxNUN6ZkZuckliTjM2anBpZ1V2M0kyeWxPWUo2VW5k?=
 =?utf-8?B?RU1iT0dqUE5acGJ1OHdwQlJ6V3N1eDJ5YzUrbDdXbzVBNlpGWG9vVmdwR2Nq?=
 =?utf-8?B?c1FjcWVqOGh4TDV0Nk5QeC9RYktlTzRhZjZRbVZjend6aFRkdEErRHZDR2JV?=
 =?utf-8?B?NEcyelgwUmorWlBCSDY0M2VXS1g0NDBBQzN1RzZHaWhsRVltS1U0R2dlWURj?=
 =?utf-8?B?UVQvMjFwd01QT010LzlZTHY2ZDllbFB1Z2dWcUUxMGpybUVPeUVzYjljR1ZK?=
 =?utf-8?B?YVVhcW0zN29BZjh1bWo4RjVXWU5KSFB5WGRVNFBneXdOOW1OQkJhZTBwUS9C?=
 =?utf-8?B?TEs5MERnWVZoZkdsNStSRlF0aGNJaGtWTC9DN1ZEMnh0OVhxcnJubllWZ3ZU?=
 =?utf-8?B?dTZFcWxWV1NqUjA5Y25SbE9IQ2lHZjdQWE95VDlCYTZLbHJjM2tnYS8yYllJ?=
 =?utf-8?B?d3NjYWp1NFJOTVRreXBheFd4c1JhUVFJdU1OeTNwMTlmdEtuQ1Z1d0RCTlpl?=
 =?utf-8?B?blIxdm5UeS9QSHFNa2RKKy9UaFgzTXJDNlMvV2Q2ZWIrU1g0NzJ1VHcyWFVi?=
 =?utf-8?B?OTllcnA2REdQVzF5Mk0waDROQzdadENReGZZaHF5VlFmK2ZaZ0dPY28zVjdy?=
 =?utf-8?B?L2FIWjNNQ2x3cHBNRytHMzRZL2g4RTV4UmZ4bE5VTFk2MkJxRXQrZVVnTHZR?=
 =?utf-8?B?TTYvaTl5RjZNS1Zpb3ZDeUZsWXZ2M0V0Qkp3NEZHdWV3MmxiYlR1ZzZ1bTBk?=
 =?utf-8?B?SWdrNFZKTnFpL255RnRrRnRxbG83SnJ1ZHlJVzVNUEJuWWVqUWw0K1M5a25k?=
 =?utf-8?B?RUpUK2JDZFNld2p3aEMva1hSY2hvdjB3VHRiejI1YkVsT1hJVjRsUVYxdGh5?=
 =?utf-8?B?US9qbG1Ra2xveVo2MUlsa1hwcmh5UkYyK1ZBWk51Rmt5cjFxS3crR0FrTXpL?=
 =?utf-8?B?L2N0ZXVPaVJxYWg0aWE0Tll0K1VkUEQvTFBuNzZneEZ0T1B1UzJoL2xlNnlk?=
 =?utf-8?B?VmZRZjd4NGIvRk1Dek9DUkQ1NHVwZWVZUWhLaFJWS1YyczBVako4cUovSmNt?=
 =?utf-8?B?MUQvM0ZYSWhqbkh2eXhnbHhvVXFnUGxmVkFkYVVMMFkvQi92MmdGYVVwQktS?=
 =?utf-8?B?bVltdWZmU0U1d0FQRi93bkFZZmlPVU9zOEpiZWJjUFZmMDZoNFdqV0ZoaXlZ?=
 =?utf-8?B?Z1hkOHIweUx6WWFCS0Q3VTRQN0NDT0pjRmxVMlFjKzRQYURlbCtmdnBuRGxI?=
 =?utf-8?B?dlRjSnR6Vy9lQ2M1R0ZnRWZKdVIzRU5RSlpHZ3ZDdXBNM0VOM3FSNkRGcjVI?=
 =?utf-8?B?RUJxTUlsRWlHcTFVNmZkY3ltV2ZRS05lQUhhQVRUc2Jyb000ZCtuUTc1YUpD?=
 =?utf-8?B?NmFlQVdPVTQ5cm16V29RV0JuK2dSR21OUDNOdlBrMFplWTBsOFdYSkxnTTNx?=
 =?utf-8?B?QnpCSXdNWUllRTgwNW9KOWYxZHBtOHUzWFQ0aWdaSFBJM29UYUU0ekFicUJM?=
 =?utf-8?B?ZHVZYXowdEdIU1o3aXBhdGkwSGpFY0Z0eXZJUlZNWFFuaEtFeFFnR3hxMFA3?=
 =?utf-8?B?VmNuWjJuQUlnajJEam9MRE5FQTFha1J6bEFRcUtZVjhQcGhKeGRrM1lBVUZD?=
 =?utf-8?B?ZEFzU2NHTm1tUVVvMjJlZVF0TFNDQ1pGUVNLajFXV0lVR1ZRSjhzYzRnc29B?=
 =?utf-8?B?ZDRabkVYK0c1STRoL2ZpOXl3K01rdVpQRStaSlpwb2RxMUFFdFJaMmlKd0Ev?=
 =?utf-8?B?NzU3MXFkdzFqMW01a3dKZG1tOThKNWVBei9aYjBNQXV2YmJzT2lCb0lnSnQy?=
 =?utf-8?B?WkZEOXFUUzg4dEVYWjFrZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFJ5S2R1WEZqZVFaZFNCVFhiUnVha1dBYU1MZEdpSlZmTnd0RkZEV3FkZlVO?=
 =?utf-8?B?QXdpTmpxd25lSEFCN3BFRDlaNGZ1WHFWelNDS01sM0U1bCsrM1BEeHNpYlkv?=
 =?utf-8?B?RWxrOUF2QkduRDkxVnRjR1NPeEVVZUZzb2V3NlhFdWNERDg2ZXMzcVc4aU84?=
 =?utf-8?B?MVAyYURqUjBVSmQyWE5WbkRpcXVQalVXaTJRZ0U3R2w0TW1UWVo2TVdFOW1E?=
 =?utf-8?B?aFBaK29Za2JnamFYcjBaS0l0UDB0ME13UG5jMGpwU2V1VDVqVkVRWlF5cmtQ?=
 =?utf-8?B?Wk1Ba1dUOUJxTStWcU0yTisxTmgzdWhkdVNFVVVYU3JVK1VOM1VZUmNWTW9q?=
 =?utf-8?B?WVZtcjM4MkFOK2Zja0JIbHUwWWpSaGJTQzkrR0RXRmtpWkc4UGFNRlkzbVd1?=
 =?utf-8?B?UTgzMFVEVXRIZ0ZyZ280c3M2TlkvUTVRdzJsTFFjSExzc0oxWldocEhHL09O?=
 =?utf-8?B?VkU2dzNXRmp1U0ZqdVRHVW50Y1lpbUYzcjdOenMweXFrbnZ3elNQdG4rTE16?=
 =?utf-8?B?RmVDaVU4aU5zeDVwRnJsMmVEN09tTGloT2dXYmc4Q1JudVlVS3FsZWhBUFVC?=
 =?utf-8?B?ZSt1Qys3QmF6K1IzZzhINDRITEd2WHdxc0VROFBYZXpPM1RIRmw5RUovSmJN?=
 =?utf-8?B?cjl4WEZwTkFTWFJSaWcvS1FJS3JiS1hDdnJKN1dUTE9MeWsrNVJmV2VCelpn?=
 =?utf-8?B?czZydUJrckJTUmRkMnRUZWQ0Wk9SWkkvNHhwd2RlMTQrU3htNDBMdzlVUXFn?=
 =?utf-8?B?aXlxZ29BS1BGRVhHZEE1WXBIMEh2cVp6a0o4SGt3dmYrNnUzbC9kUDdMNitF?=
 =?utf-8?B?YTB0TjJHbUJxblNQTXVuZ1JmcmxIWnNCTnZENE9hNVJ5U2dDeXdFa0dmZnN0?=
 =?utf-8?B?R1d0QzdXRlArVmJpeFIzTHM5STRMb0h1ZHdOb3RyandBNjdZeklpdlEzeThz?=
 =?utf-8?B?bmdxdlA3blhzZ3FSMlM0SnlZMG1GUnBmTU1BRE1ydkRleFpMbStXT2c0bldK?=
 =?utf-8?B?dlc1OVBqdHlXL3BIWUFsWENVTWRGdDNFNnBrV0ZRZkVYL0RQdkwvbytaMXZH?=
 =?utf-8?B?T29OUzVtVGF2V1hIMkdsRXZoZXllVVd4QkpsOEpMdlBxMTFOYkhUcXE3cGtt?=
 =?utf-8?B?c05Xajk0UUQxVTAwMDkwVjM5aTE1K0hyZkZyZWlXblU3cUIwdS8zdXdBeDNu?=
 =?utf-8?B?ZFpMSWhybVVqNU05dG1TdGhKalVMbGdOVTM1M0puRkVjL0VydnMxbUoxTmhF?=
 =?utf-8?B?dlNTZUVrY3poMTdYdC92VHFNRnNvMm9YSGpVTzYveFRUVk9wRTZXcFU0Ry83?=
 =?utf-8?B?Sm1yOG44anZnSzdOYnlPbVhlNE9jTjdnUWdERUd5ZFdZY0ovVXR4SEhFYm5s?=
 =?utf-8?B?QjRXMHYybTViMW1CbFppLzdubFZld3dzU3dJYjJDa0UySURWSTFpT1BRK2pr?=
 =?utf-8?B?N0UxR3lzbEdTL0ptWkpoTXV0dU9VS0hDdElqdVEwbVNnS3ZXRXBZNzlnSWZC?=
 =?utf-8?B?bEpvWFRJaHpyQ2RsOWVIcFptRm8yRUlHT3BFYngwdkxHcjNrSGxDUHRDMERN?=
 =?utf-8?B?TXFmdGdnc1laZm9SSVFpaXV5TXE3M0RhOXcwTGZWRFF2RU50SDF0alZaQlN0?=
 =?utf-8?B?cUNvTWdMMm42am5nUmdXcm5GTWJkMkNSdWdDeXpqWDZIV3d2WkVDVHJRZTg1?=
 =?utf-8?B?TDRvcld4ZWxtbEVnQklkVXpyWVdJanE0TU5EeXpBeDV1ckIvQThlQWVaaTlt?=
 =?utf-8?B?ZzFpV0U1R1J4RWJKaWR3enpjM2JFQXZqUFRyNkxVL0ljZmxRRHNDaDdGR2Nw?=
 =?utf-8?B?cVR1eGNRSFgyYnpPdGNTMkRhTVVFY0hIalQ4VG9uMndTcDU5dkc0M3g3c2Jt?=
 =?utf-8?B?RFNzbTdNaFBVcXVuVTAvelNFckw1STBoaTV4aTJqV0lxTVdYS28zZWt1NlN2?=
 =?utf-8?B?aW5sY1JJNlBzRFVxVDZ2dGV0azJKU3RESTY0Y3NHNklORlhaak1tWlNwaysw?=
 =?utf-8?B?ai90MEJsb1BZY205dnZKUE1yR1NrUVk2Q2VaZC9hVXpnYzMzZXp6dUJjOVJz?=
 =?utf-8?B?TU9yd1pRbmdwQy93cjdLWE56NzR6UTVOamp0VDY2M2FNaHdhSDFMK092K2dS?=
 =?utf-8?B?S1NaZFl4M0hrVkl3SFY1Z1dRUU5mU0hHMERtMThrTEtpVXFQakNRTHBFcTh6?=
 =?utf-8?B?OUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cc68602-55e3-481c-4e8c-08dd52973631
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 16:45:56.1367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nbQN5K/4ZNnpb39ePn+WGOiwn0x4tbRF7I+TbCJBN2oS9eCPSMNcDU0nyfhUSZubMHWYoy9oLmpwM3WP0zoElg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8661
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

LGTM
Reviewed-by: Zhanjun Dong <zhanjun.dong@intel.com>

Regards,
Zhanjun Dong


On 2025-02-19 6:53 a.m., Marcin Bernatowicz wrote:
> If the device is a Virtual Function, skip certain devcoredump validation
> steps that are not applicable in this context.
> 
> These changes align with kernel updates introduced in:
> 
> Link: https://patchwork.freedesktop.org/patch/msgid/20241022010116.342240-2-zhanjun.dong@intel.com
> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>   tests/intel/xe_exec_capture.c | 36 ++++++++++++++++++++++-------------
>   1 file changed, 23 insertions(+), 13 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_capture.c b/tests/intel/xe_exec_capture.c
> index 2c79c1802..fe1ae677e 100644
> --- a/tests/intel/xe_exec_capture.c
> +++ b/tests/intel/xe_exec_capture.c
> @@ -20,6 +20,7 @@
>   
>   #include "igt.h"
>   #include "igt_device.h"
> +#include "igt_sriov_device.h"
>   #include "igt_sysfs.h"
>   #include "lib/igt_syncobj.h"
>   #include "lib/intel_reg.h"
> @@ -434,6 +435,7 @@ static void test_card(int fd)
>   	char *single_line_buf =  (char *)malloc(LINE_BUF_SIZE);
>   	char temp[MAX_TEMP_LEN];
>   	char path[MAX_SYSFS_PATH_LEN];
> +	const bool is_vf_device = intel_is_vf_device(fd);
>   
>   	igt_assert_f(single_line_buf, "Out of memory.\n");
>   
> @@ -466,19 +468,27 @@ static void test_card(int fd)
>   		igt_assert_f((start_line = access_devcoredump(path, lines, single_line_buf)) > 0,
>   			     "Devcoredump not exist, errno=%d.\n", errno);
>   
> -		sprintf(temp, "instance=%d", hwe->engine_instance);
> -		check_item_str(&regex, lines, "(physical),", INDEX_ENGINE_PHYSICAL,
> -			       INDEX_ENGINE_INSTANCE, temp, false);
> -		check_item_str(&regex, lines, "(physical),", INDEX_ENGINE_PHYSICAL,
> -			       INDEX_ENGINE_NAME, xe_engine_class_name(hwe->engine_class), true);
> -
> -		check_item_str(&regex, lines, "Capture_source:", INDEX_KEY, INDEX_VALUE,
> -			       "GuC", false);
> -
> -		check_item_u64(&regex, lines, "ACTHD:", addr,
> -			       addr + BATCH_DW_COUNT * sizeof(u32), INDEX_KEY, INDEX_VALUE);
> -		check_item_u64(&regex, lines, "RING_BBADDR:", addr,
> -			       addr + BATCH_DW_COUNT * sizeof(u32), INDEX_KEY, INDEX_VALUE);
> +		if (!is_vf_device) {
> +			sprintf(temp, "instance=%d", hwe->engine_instance);
> +			check_item_str(&regex, lines, "(physical),",
> +				       INDEX_ENGINE_PHYSICAL,
> +				       INDEX_ENGINE_INSTANCE, temp, false);
> +			check_item_str(&regex, lines, "(physical),",
> +				       INDEX_ENGINE_PHYSICAL, INDEX_ENGINE_NAME,
> +				       xe_engine_class_name(hwe->engine_class),
> +				       true);
> +
> +			check_item_str(&regex, lines,
> +				       "Capture_source:", INDEX_KEY,
> +				       INDEX_VALUE, "GuC", false);
> +
> +			check_item_u64(&regex, lines, "ACTHD:", addr,
> +				       addr + BATCH_DW_COUNT * sizeof(u32),
> +				       INDEX_KEY, INDEX_VALUE);
> +			check_item_u64(&regex, lines, "RING_BBADDR:", addr,
> +				       addr + BATCH_DW_COUNT * sizeof(u32),
> +				       INDEX_KEY, INDEX_VALUE);
> +		}
>   		check_item_u64(&regex, lines, "length:", addr,
>   			       addr + BATCH_DW_COUNT * sizeof(u32), INDEX_VALUE, INDEX_KEY);
>   

