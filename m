Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48445E6F084
	for <igt-dev@archiver.kernel.org>; Tue, 23 Dec 2025 11:11:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E304610E29E;
	Tue, 23 Dec 2025 11:11:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mskwbtUG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A67EF10E29E
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Dec 2025 11:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766488301; x=1798024301;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=GTEvO1CVGmfa4gAb/vSiSIBRePGuGZUlSAwoqWqkPiE=;
 b=mskwbtUGF8Gnii3SnUWEQ1r/SOETjTrAWHkEhfNRp6EutuHaCHxQBlpN
 wGV2OXnHWrYfV9FoxoVcze7VDNy9l0S/B7u9+znWjaycQjl6HQKmQZrBm
 wSoNdgGf2XdJ2c2SlbZ+p0XQOpphxWxuwsUHHdafe6yKeVh5D/CfRnVS0
 kAXOP2krpPqG+nGQPXIQWK0lZdZRaIYd3kV8KBTKXDEPhzYdcUxZhdQUy
 35C/9+X+W0Lvv6YxuahCr2mIaPp2DrOXSKkYih1Wuouf3majyIQN2T8RQ
 9Eap9uiokmUTLa8C/0BGV3KN4KLrzt+srmixxA+FS9420yKZVi/bEeJVF g==;
X-CSE-ConnectionGUID: RHFzcCM3SaCaciuc+CIsrA==
X-CSE-MsgGUID: Ai69XFbQQLi6d6JrscJ5Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="85751748"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; d="scan'208";a="85751748"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2025 03:11:40 -0800
X-CSE-ConnectionGUID: JPGHyi9fS/eV5Yrw4PWurw==
X-CSE-MsgGUID: lPLyGu7XQRmYGp2SFTU4hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; d="scan'208";a="200060338"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2025 03:11:40 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 23 Dec 2025 03:11:39 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 23 Dec 2025 03:11:39 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.68) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 23 Dec 2025 03:11:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mYrM4qgMtN+qK7DO4utFNU4eO4pYCXtvDzeLvovDkuDulFvV+OzFYrL6fwn40H1FlTL3KlRBd2HGKVQhK9GZzLH+hD0Is6ig33zpri9uyIq7rby1pfLR7B2lBcHNn2M8DuoEnfOnoVcQAhepQshlHW5m/08u1HT0tw5l3tPu2VcsFZu++iReRGF1vSQqICDmmZF9mqTUWzkK5XvfIDjuilPX76ewz3BaWIPzQT9/4ezmCz4hqDee4rAJ4r7MvM9+y0qwC7qQHCi3xYEjg49BKGprJqP6p8ttVyuV4G5s3TZJm4FWSNvsSJvGNKX0fA5tnQ8HJx+c25INArbAPv3qSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nr3cd6I3wpqFhX/tgBC1aoWmIKe+6BJJJd7Bdsrxbh8=;
 b=X970W4ym2HRXUW21A+vt3e6YxRoX5z/f7ECwjkOSmMK8wXwNth1NIk7ZGMNo4iEHHM+nz7M8M8VRNPX0MRM7ZhD/MkV/VoHDc6qds2spuQbH+kMZ0GeF77wTFjq3n23HrGTDJBFf2oNBxq0mn2l140DX/eXF4P9h0BpVI9nsbItP0QLfzaOgd6AVBWV5YwRkcYlR+wxcfD/BRDlZZk7uRAz28gSjLKTD59kwZ99/XJpMZ4WZSjj+a0zR+vuRq6zAsTCn5tarq83zLEp96OhVHyB96Tsuf1fpdyn6a6MjqZr1UvVZZerILUjmUmTovSjPtWFhS2eAlLI7MnlfXbuLyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) by SA0PR11MB4653.namprd11.prod.outlook.com
 (2603:10b6:806:94::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Tue, 23 Dec
 2025 11:11:32 +0000
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::e17c:d0f4:db8b:d7e6]) by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::e17c:d0f4:db8b:d7e6%3]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 11:11:32 +0000
Message-ID: <34707b30-98f1-4744-929e-19fbf8515b76@intel.com>
Date: Tue, 23 Dec 2025 12:11:27 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/intel_compute: Select engine class by engine
 accessibility
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20251223102243.113720-2-zbigniew.kempczynski@intel.com>
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Content-Language: en-GB
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20251223102243.113720-2-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0232.eurprd07.prod.outlook.com
 (2603:10a6:802:58::35) To SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7DCFBC32A:EE_|SA0PR11MB4653:EE_
X-MS-Office365-Filtering-Correlation-Id: f1d45d68-f7ee-4ee1-665f-08de4214071a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YkVvS2tER1p3MlpaVjBPRExqdU1GTGFWU0RaWW5LcGlvbXZ1ZmdFK1pNdG9T?=
 =?utf-8?B?WjMxTXBxU3Jya0pPVUhlZlRHSkwyTloydCtUV2xIUUhvOXpZZHEzdkptdzky?=
 =?utf-8?B?UmlCZDRhRGNDVG9UNnJhczJZTXZPZkRWSXN4MmZOL2hQcnhWQVFJWEhjTzVV?=
 =?utf-8?B?eiswYTZyc1hEMmdVTWJ6K1NFbjdZSGlTQnVmdUE3V3Q2NW00ME5ndXJ2c2gr?=
 =?utf-8?B?bFY2dXBsREJSQnU3S0x5T1V3RVRLODRuaTBxUUdtakg5a042ekNQRXNiNGJ5?=
 =?utf-8?B?U0pCWWhIZW9CN1EvOTBHL1lnVWdHN0J4QTBVR1NoaXlRUXdlOGRjZ1R5ZUlU?=
 =?utf-8?B?WTgvK3grek1FMVJRY2JMZmVTMVFNbmJOOHBqSi9ka0JaMkkrMkRmMzRxN1B0?=
 =?utf-8?B?b1lVeUExc1JweXVMbVREQjJGbWQwVDZSL0laSGtlS0FmNmFVeUlLODZHRDlv?=
 =?utf-8?B?eWtuN1VYZWNuVnYweWxmR09PbmhxdmRiMEhwdDR6NTVRbmFqSWk0T1MvMUFm?=
 =?utf-8?B?SVgwczVDekY2RTR2ZndLb0djK29GdnNZMTRRWEM5MU9sRXNPeHNMUUhwdzgx?=
 =?utf-8?B?Ny9QTW4rNGhabFR4RkVhM3hhSHVmRWd0cjllTGRFekw3TFUxY2ducFNSeWhV?=
 =?utf-8?B?WUxSbldMTzJCOGRveEQ2YWxHQU45cUpkUmVkbE12dElCZkgycUlCMUVUbDBQ?=
 =?utf-8?B?MDR2NmR1dlFNdmVMUXVubS9leXB3THUzM1FTazZYOFhCNy95NEZod3hONDRW?=
 =?utf-8?B?WEFoMlc3NENrYVRhcDVxaktOZWpHbkVSR3piT2ZBZXdIQm15V01ycDRkT0pN?=
 =?utf-8?B?YS9qdjJnTjlCZVZaUHU3K2gyK2ZZeUVHZGY0RUIyNTUwYjNmRkpndjg1cC9h?=
 =?utf-8?B?Vk1YcXYxZDFXb3RxUXVUUk02SHlsa05lUFBSSHBiQ0VlWXVITkxEN1J3a3hr?=
 =?utf-8?B?MVVuZDdTRUtLQlRyeWY5dWxEM2JnZzRxTEhpdEw5SzY0dGNhdWk4dmdVMWxz?=
 =?utf-8?B?L1VaZmhBdS9ZN3BzWk1wKzZveGw2Qm1jZzZqVXpKNkY1Umh3OHMrUFFzZFpi?=
 =?utf-8?B?UnRobHkxcUx0cld3a3B1UjR3QnUvZC9PZXJ3Qzh1RGlYd25HdkpXVDg0SkRS?=
 =?utf-8?B?MVRjOG9jMHYyYUxTNmVsUjU2cWVZRUdWeHBQeTFGTGVUQ1E5OHQrZXhQLytZ?=
 =?utf-8?B?VTA5Z2E1VXIrQjVhV25YRWEvSXdiMUlVcDlHbVAwTjhMZU94aFZhb2wxd3Za?=
 =?utf-8?B?OG9rU3MxQUJVWmh1ODVienJqb09FZjUrREFsVS9zeXVtTHIwVDBTUnZzWFhO?=
 =?utf-8?B?aHdhbXFwTFVvSlZ2MWV6VVdJVVZzV0NVZVBwR1k3WUlYR0VMWjA0Vjd4dlRn?=
 =?utf-8?B?eDcreFlLQjdqL1NlQ1E2WEtKSnZtTTRiZnFnMnV5UmtBQnhlQXNBUTh6WnVq?=
 =?utf-8?B?aFIvcllySDNIVkdheDFUY2NUR0FOYklUVkRFYVhKM3kvMW52bldQU3NTUlhm?=
 =?utf-8?B?RHVIUC9Mbnp3eTBENXZnWUF4cm9FUGRjSG8wdlM1MU1wTU5vWDhSbEg2ZGQ1?=
 =?utf-8?B?elBlTmN3MWxlbGlUWXZ1eDVxNGJhVnpnSEwra0RyTGJ4T282cHYxeVlRQmt3?=
 =?utf-8?B?dzVWcWdCNFZNbVZ6d1VQcU5YdG9RRVV4c1hGcElKWDZmY2JLMGdiSWlsWnlU?=
 =?utf-8?B?bWVzY0lmcU5oMGl0dXh1Qk9jb0lqMDkvb2N4RUh2R1VPZFYrRCsxR3ZybElN?=
 =?utf-8?B?dS9DdHJvL1NKNS9rUVdsMldtbkxON3B5L0cwV1FHSmpWYko2amRPQjJFUjZN?=
 =?utf-8?B?UlUxdlRCY3o3RDNHMkhhVlJvUHJPeWZjOGVtek9VQzhPdlFnYjAyZ2I2MVlQ?=
 =?utf-8?B?RnFtRXh0NkpLeWNsbTVGREpzSUdtaG5zd0xLQjhNVnAyN0poT0NoSExOMEhH?=
 =?utf-8?Q?TbdKd7zKoVr37O6updc2pOzX2uZFus3Y?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF7DCFBC32A.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejhkTG4wcXF6UURNVzBmSHN3ZkhPTDFkb1orK2N2SURkb2oxQVNNc3VlQ3I2?=
 =?utf-8?B?cndZNkNRNXZNQlFEYjE3bWhBK2FaZFFGSEJCN3Y1T2lQYXh4cmV4RG5HeWcw?=
 =?utf-8?B?Rlg1SEUxVWMrdUNPTFYrV2xYTWdoL3lrbGlQYmRvSjd0Uko1bFZ4VzNrazI4?=
 =?utf-8?B?NlpDR3VOakxKQWJDdG93Y0N0N09IamV1Wmtac3lSZmVraTZiMUN1bCs2ZUhQ?=
 =?utf-8?B?SkR4OWtFc21JSjVFczhabnFkalJCcC9Mb3FBSWtJUHY5RlI4d3J6M0ZndS9W?=
 =?utf-8?B?c0FyUlg3ckVKMEgzOUp3dUl5ajBLMDZ2b1dRUC8vamtMZ3Y4WnhPQU42L0ts?=
 =?utf-8?B?SjNxaThESVY5UWc5UXdRKzBqcEdVc2M4SGpZelBncjZ0QzBjeGdZaE00RndO?=
 =?utf-8?B?TlNoUG5VYXMxMmtHNFB6SmRreXZBTnFlUUk5Q3dlVE5sUCtGUjRiUW9wcFZy?=
 =?utf-8?B?R29FcStXUFlVYXJTQW4rY2NPNFkxUnVrSWV2QVI5ZFVQVUFnVmZOWDdXWWFm?=
 =?utf-8?B?QVM3UmNFSmN3aGpUdXYyMDlqQm5rMmd2bHlKUWE1TlBDWDJ4MG1ML0liQXl5?=
 =?utf-8?B?cEFYdm1qZzU2OERrbVkydnowbjJHbUp3eDRXOTZGbnp4dWtXMWJ2c0N3aHdS?=
 =?utf-8?B?a3UyczNnTkVnUEhScC9kdVV2clQwSUU1K3ZrT2FoZXdBMjJaSFV3T3EzYXh5?=
 =?utf-8?B?c1QzOVg4RFdaUmdZVDhZV1RMVDVTM0FvTWlZSUcwUGdOZ00zN0l1eXhBc0Nj?=
 =?utf-8?B?Qlkva21TbHplRjF4RXJDNHZQd2RjaE1SRTZCNE5XK0k5ZmpRelZKcFkyYjJM?=
 =?utf-8?B?MHRDcTFJSEVPVDBrc2tJVWRoN0I0dkRuVkFYNmZDODNzTGErWW9JMUFFanlv?=
 =?utf-8?B?ZlNqZDVvSTJuTWlQOWUwbjUzOWw2bm9GK3ZRT3k4MjRZYlY5c1ZzeGN4b2lT?=
 =?utf-8?B?alN4Y1hUbUZRb3dZNEJ2dW9TNGFLK3U1R3l1V1BCUFVZRm1USlgxQTdjZUhB?=
 =?utf-8?B?U0tqR1ViMkF6OWNUOWxWbzFWOGUzWWFIR1FWNXFCT0xzVHVYYzRaM0N6S084?=
 =?utf-8?B?T1BNenh0UFNIMmJ4UWtnWU5Cd3Vrc2x3bXRITmRhVTl4QWFsY3lqVGJGK3ky?=
 =?utf-8?B?bjdaUzh6M3BHdjhKTzByL1Z2NytYUmpNQ3R3RGtHcXhZQ1doRmg0WkIwTEFZ?=
 =?utf-8?B?WHA1QlhveFIxKzQ5UEh6NTk0N3lBRFZGRGhPTUYrbWVvaityRUFrUERxdXZM?=
 =?utf-8?B?ZmZBdkRsVW9QeExRc2R5cVZsZUF0Z3MyMnVNRTFJRFRjZllDdlUvamduWWU3?=
 =?utf-8?B?VDZNY3lsd1Y2VW53Wnk1TVNTVzlOTHIxQ3Ywb0Y3MjdOa09Xc0J3dmdodVc1?=
 =?utf-8?B?VXBNNkJLcVhzeU9ESVY2RTVBdnYwWm1pZ3JzNzlldDVMdlZnd3l3SHE2L0cw?=
 =?utf-8?B?Y3EySko4SWNUQXpXR2NtYk1Jc1BhNnh6d25mcUdDeG5BbFdNczVsNExkYjAx?=
 =?utf-8?B?SUN2ZkRwSnN5QTl3bVVvRitSNEp6Mmdrc1ljZnZISVpqZUNZWHQrclI5YlZ3?=
 =?utf-8?B?V3BVZ1dSdTFQMmxhdFFkUUZEVERQcXNmVFlrMDM4clYwUXBKOGxIZUFydFdF?=
 =?utf-8?B?T25pcDcyNGZqTG9zUHplLzNNcmZFdXJFVzJTbkVZenpUZExHTFR2RVNEZWhu?=
 =?utf-8?B?UTAwRjFzQXpsQXBIMVVRK05YRno2K0hYdEFHUWVKWGM5TStucUxmNlVrdW9N?=
 =?utf-8?B?MFNMUi95V3cvN0xBNEYrSDBHV2ZRbmpMaXhYL2ZabDdDYTBOYzFRVXhIblVa?=
 =?utf-8?B?NWJLVTZiUGZhTU12TG1Rb0pBOWJRdDZnamxxN0RHdytXK1M2OHFKMmtvbEdR?=
 =?utf-8?B?RjN5UHdHNGlBMlJKS0hiamcrTHloMXFZYWl2OUllMlNNdTFXb3VkbVdLazJ6?=
 =?utf-8?B?Ui96L0x0YllqZk50R3pzT3ZNK0xLekxGKzJxUjZERDRibnM4NzgweTMrd2l5?=
 =?utf-8?B?b2ZUa1dXMy9KRFR4SkdLbFlQa1JmWDRyaEZrSE4wbWZ1UzE4cHRSN1F0aThw?=
 =?utf-8?B?T3dMdnladFNxUE94WUlPTVJBZnZXRXB6a3luYW5ob1RKOHJIQ01PVXJVRzUv?=
 =?utf-8?B?VkpLRjllNnVFaGdkOTJsZ3JZeW5nTDRmS2dmV1hNYWZFYzhLd04zTmMvQks2?=
 =?utf-8?B?MGY4UnM2UE0yeGlSa0lOaGoySGdheTVyRGtxcitZQVh1VkhXQk8wQWZ4b1Mw?=
 =?utf-8?B?RjlpK3BPODMwNTgrSzZkT01URkVEY0xwZDhRbUlXSlN3Vmplb29YQTZOcFg5?=
 =?utf-8?B?VDR3NXVyeVJZdEtJdXBaVWxER2pBRFRqSE5HM2kvNys0bSswNWNsdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1d45d68-f7ee-4ee1-665f-08de4214071a
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 11:11:32.2317 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AVz3/OUmhhHCwP+qzmh3F3WCVOLtIr7NRvRzTf1j3EnarcP29LQ4XJOD9hVPooqnnnp3hdRULtl87RypFHN54Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4653
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


W dniu 23.12.2025 o 11:22, Zbigniew Kempczyński pisze:
> Stop hardcoding engine class selection based on rel/ver. Instead
> select compute engine class if it is available, otherwise try to
> use render engine.
>
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>   lib/intel_compute.c | 29 +++++++++++++++++++----------
>   1 file changed, 19 insertions(+), 10 deletions(-)


Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

