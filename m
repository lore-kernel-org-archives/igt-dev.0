Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF89CCD199
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 10:44:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E22F10E1EF;
	Wed, 18 Sep 2024 10:44:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T73mfDJj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A32ED10E1EF
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 10:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726656292; x=1758192292;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=S6T1js4dz0aR+eZ/4Lq2OO0roSoiTuq5aIvDFvWVqOw=;
 b=T73mfDJjfqZrqkDPUfuUrXtcBxa7k6YqVIAxyo3uZd87QPrTmwfoa51h
 G3Sw9QFrbSIaX8Tju0gAA/Kfr+CE8JZR0ihTuy5hrc4iv+n2shI3014CF
 cS61gqcxtJKlzVF4eGqKm9vbJ9U2iZerT2wCsxmWyFYSRSfOKpFy4pECk
 BVTaEgWL4oR4cKAhPWuW7N+ZpJ0qtakq79M4dm6NRscw/W85vu48tyzxQ
 PR/2O0CPHW5+Okc55wzeTvcTlFWa3ZYdq4C0XE/7qmFZ8qitiPo112aI4
 liYAEhCGBUTUFuonhoL0GMTk+sAF6S7G7MsxlareREyi/Kvu/ks3uvOxN A==;
X-CSE-ConnectionGUID: LRu0J5aTSPm+SMAq6XUMfA==
X-CSE-MsgGUID: wPcjnKxoQsGPLlxbbwlFiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25442283"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="25442283"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 03:44:51 -0700
X-CSE-ConnectionGUID: 2RCYq+BDQEmhP8tPv74guA==
X-CSE-MsgGUID: tGie4+XXTZeu5A99pS8PGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="106961456"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2024 03:44:51 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 03:44:50 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 18 Sep 2024 03:44:50 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 18 Sep 2024 03:44:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MZUvClztVRF+d0USR2aug7BLlFym2nwlnsbxKzqVrBTpBF49VMekGreFUruuUxGpRsU5394ZYxxyC5Upcdev7JiVeNCC+6KOs+eshSFkTlBfj00R9BuaJQwvemnHemfUMnqxN4BF5RL9a+4wey1x9XcRJVkOjD8tFTwZjCUJoJPugUa/JzVJBb05PAKWeBA9OTK+t3y7jXQ5qXrAV7N/bPjS4QbdFhPJnfGjYO24rYVbGmafSm3yr6drq6JSX0lMiik7WA/i3pt43GIyw6rmpozum+58bBW/R6hJRvljDzQSeECsnu7K3TKxWq/dPdzodlQEepxxuVrYf9UWTz5itQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ShAvM70iMlDv33ck1+mRLyDfX7HynvTBjbHNCxurDiI=;
 b=xRU3TBkBzlanjHDIv19OrZUT+mhXOvCiMD3VMo/BEFG600SmzkkHaZmWsi/paKw8n8I1h1YAcQIfAwZ/wQEeloJmnJIsiaoI1aYEZQ8ppUw21OvFSgI0+D+YSI7Jxcif1umrBF5NwYq8FOFrhLV1sPsCCc2pT9STkZqNxgBc9eDDEwBx+aB9UFQt8Ex8alVs7c+HHhjH4YvO9IpAvJtIGBM8/HkRmRC/rJfSOOUJwWiFrnPl/v9LydeMKVT+mVR3aPrrGawrGBJ7g4MmOoHQO5/ynAyDeTu475ODodM+Kj8Ys6R99ZKfk9giOgpQa03hVZ5FBMyTkLpSFomhMxX3sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SA1PR11MB6615.namprd11.prod.outlook.com (2603:10b6:806:256::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.19; Wed, 18 Sep
 2024 10:44:42 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%4]) with mapi id 15.20.7962.025; Wed, 18 Sep 2024
 10:44:42 +0000
Message-ID: <fa200796-2d22-410e-b5e8-996fbe8571ba@intel.com>
Date: Wed, 18 Sep 2024 16:14:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 3/3] tests/kms_joiner: Add subtests for force
 ultrajoiner validation
To: Karthik B S <karthik.b.s@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <santhosh.reddy.guddati@intel.com>, <kunal1.joshi@intel.com>
References: <20240918073413.28598-1-karthik.b.s@intel.com>
 <20240918073413.28598-4-karthik.b.s@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240918073413.28598-4-karthik.b.s@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0082.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::12) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|SA1PR11MB6615:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b1be8ea-b1fd-45f4-d945-08dcd7cee6f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QXFsZVJ2TTIrMDJEdUFxamdPWEcxRmFsRHF5cnFBS0FpTHE1ajZWWGgzbkZT?=
 =?utf-8?B?UzQ5azUzRGVyOExaUmpnYXpyM3R1bFdBM05IbEtrTnFUN0hxUWJGYVV6d3Zj?=
 =?utf-8?B?VGI1SVUzNlhtYUZ2bWkzVDlsYUVIdmNKUENwZU9JaUVBSUo5b0JhV1htc3lB?=
 =?utf-8?B?cEoyVmRxV1J3dHUrTWlPaUJJYUNYVktIQ2ovWlE0dG9nOURkMm1lUzZ3WWRF?=
 =?utf-8?B?dDVIYXRTYS9OQ3U5ZXZCTytObzllRFRmY2tuQlNuWU9HdUVidFhZdXJXRzh2?=
 =?utf-8?B?U0VvQW9DY0o0akt2OE96eEhPd1FvM0pROGRaVDJyeW1jcDF3MFRmSzJsZXhU?=
 =?utf-8?B?V1ZZQmtZNUI5N0c3aFBoQ0tYbVVyNjFiM21UM0E1cFRBdFJQS2l0RWNrTkRy?=
 =?utf-8?B?YVduQi9XVndWc3MxMlBRTEgxTUgrSXRianMrVzZrQkFOQzZIQ29HRFRSRmp3?=
 =?utf-8?B?SjlsRzF4bU9ySEcyQ3RVK2toZDVpR0RLaWM1THBwMkZUTnJEbXpuVWd4Q0Mx?=
 =?utf-8?B?ZE1nR0JrMTNHSXNGUmZkQWY0T1FlNDhoZlZuWHB0SFd3ZWZRbXY4NVdpSmpq?=
 =?utf-8?B?cXljK1AraGwrdlRGdUxLZ1VrRHFkeS9NYmJLSG90ckhnT3FsNnErM0laSytl?=
 =?utf-8?B?eVBkdm1CeHRPZHVJRjcvMVc3ejkzTkg4UjVYb0graE1NM0tzYnBKb2p6dU1q?=
 =?utf-8?B?ZitkQi9JWXJqZVkyODM2eUZ6WFpSVnJqTkE4dDIzdGRXa293RlVZTkRaaGtF?=
 =?utf-8?B?b1NKYURHSWUrTmg4NjJISWF4UHJuWVFiSFJVTmRyKzVYd1RnNFY4bng1WVFD?=
 =?utf-8?B?TGR5YjBrZ1plTDI4QVFLcU9RUTh4eVV2RGxHZTdIcHRkZVBtWGIwd29RUHVj?=
 =?utf-8?B?by9UT1lPdm1yUElGYVREeGowcnFWT0UwYUlEay82ajhMQ2RJUmNDTVMvdHJw?=
 =?utf-8?B?bk1waTNMVVd4TU9VSmJnNVlnQ2MrYkhUVTFWdWErYlZVUWNzVzl0RThSZmJ6?=
 =?utf-8?B?ckVMeEFUQzN4cjg0OGI0QUh3dStpd2g4NlNvYjlrMGFLWENxZmgrcGRzay9u?=
 =?utf-8?B?SjhuNG0zZll6QVlNL0EwWEZ6bG9ZZkVqWGIrajl4aWU4YmQ0L2lsODR4bDNK?=
 =?utf-8?B?ekMvbk9TTVUvclpJR1VhRFhNMExGL1J4ZlNXNVZ4V0NnbU04WDl3ZEwzMlZS?=
 =?utf-8?B?NlNXNGVMNDVtNDUyNDh0MHpTQlBIa1NYbkVFaEJ5c2R2d2kxTlNuQy9CUG4x?=
 =?utf-8?B?c0ErMGp1Y0JJTlVBNEErMkJaOVFvZ0V4cU15eE9NcGZCVE9hNUoxbDVsV25C?=
 =?utf-8?B?MkM4U2xXTmZrQmJ4Nm1vUHJoYTladlhWNkFhc3BNTUJ3ektnanc5YWNTbURq?=
 =?utf-8?B?RzRYaEhzV1Z2VVMxeE9QVWNhVFlzcUJmcnBMRTNITDcza3Z3NXMrZmhMRW0x?=
 =?utf-8?B?cUd3bnR2TCsxWHc3UDQrc1crTlF5T0xma0JUdWR6alpkd1JYR1R1QzRSYm9Y?=
 =?utf-8?B?aktpTHV1OU1uL0pkQlh6cXNzQTNWL3hPWWFVazFWdzRKNjhqQjdHWjE0amdC?=
 =?utf-8?B?dkNkUjRWYVJ2Yi9qVlBJcTNaRVRtRk1rSDlRSkRDVHA5ODF5OHNicndzZlBC?=
 =?utf-8?B?L3Fhd3lWenBkTVZsYmZNSWdSQlBxbDQ2WEFWdmZ4dW14MjMwV1FKREFpWmt4?=
 =?utf-8?B?T1JEdEpKYk5HaGJ0dGRQS0ZXMjBqNEZRbTZFMHlpNXdSMXQ1V09iRERBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZE5xVWgxamJJaEgzMW9pMktUNDJtNUZKaURLeTFhWTJ4eDZCZGdkZU5LZXdL?=
 =?utf-8?B?eXVrRThRNG02MU9kSHlxS09TNDYydzhnOVRzMUV0djhvTHZiWlRkL3Jhdzdw?=
 =?utf-8?B?Q1NvL2ViSzNtcUw0WjhMMTJyRHA0WDVoUDBwb1NuNTZKU21YNWxzQjZ6aHV1?=
 =?utf-8?B?V2hBOFl0L0ZzVXdPUU9YWW01SkFTbEVOSlpTYWZWTVN2cU5EVG1tdVR1bW5v?=
 =?utf-8?B?RWcyMXpTVlNxMUF0NXNRRzRBWVNodjlVa1hsN0w1elBkY0wwM0xzTTR2djVj?=
 =?utf-8?B?elp4c242WWJRQXBEeUdKek5Fd1dXYnlGNFVYU252OWRRcFduVW5TaTBXUE9j?=
 =?utf-8?B?Y0haWitwa2tMQWswY290dWxtTmNibDdySXNaZ2hScXowTVJYKzNMYTNWd2lM?=
 =?utf-8?B?ckpUNmJieUtkOTJlZm5uaFVRQ0pPSTFNMHZoSkE3MnIxQTU3RjRNKzQzbzFh?=
 =?utf-8?B?bkh0R1FNY3NHMDFMTnAyWmQyTDRxaHRYQm9OalZxaVB6YkJVY21Xd0l0Y1N2?=
 =?utf-8?B?bHN5MFJkR3pNUHl1WXlQd0Z2dWhaV09vT1BqT2YwTGFmaEZSVW0zRkUwMkdS?=
 =?utf-8?B?SnhybThhYjJlbEl3OThrSjJiS1VxOHlpV3NZbEZYMGdrQnVTdXhZUFZVZ1d3?=
 =?utf-8?B?bU5TTGdxZDd3YkpGdGhWZmJYUVc2OXRLSE90aXIzNWMySHkwQ2hoenJHOGU5?=
 =?utf-8?B?V3RqS3BLRDIxczRYVWx3aGR1UnVHWnJJTFhTL0E0TzFJY3NuZERwRUF2aDdU?=
 =?utf-8?B?WW5UMUFHSzBxYkVSRWppVjRROFBJMVJjOVhWUFBsR2Z4andkVUExM2MrTDNF?=
 =?utf-8?B?ZVl5ZFpxNVpORjRSRzlPOGVBQ0p6U1l3WDBzcXc3RjBWTUYyNDBmZ1IzN2tn?=
 =?utf-8?B?SW5qa053dDhxYkRWdWEvWWJIM0x5bXE0VC8xVVJtTHdoWjY5emlVNFFuRExo?=
 =?utf-8?B?MUlmYmZVaXczTG1zRFlEL1lpUWtLYVV3TE9UZGFlUlVZcFZzMUptbDlVRGtB?=
 =?utf-8?B?MU9DT3RNbHR1QjZHYjhMUFhKdWhDckFqWUVSTitJRlgrb2RoQ1YxWTM2T2pq?=
 =?utf-8?B?KzhKVHczemtJZEp4UllNU0hjdUhPbnp0UTFIdkZxeHN4WXUxVVhWMk5PYW15?=
 =?utf-8?B?WnBKOWtEWnlYQUk1SzhIamxiUVVTZml6MGtaRWtmVExjaS85djNHTWhwUDBS?=
 =?utf-8?B?NG1TTndxSzBoaE15L3A1SkI2ZlZhc0tCU0hqVitXR3RYenVJVjE0eHBkN2xK?=
 =?utf-8?B?QnVnVXp5YklYYVR6YklWaThMZlVtUi8xWUpTTDNsY3dYbFZrNXJiS1o2emxB?=
 =?utf-8?B?clZUOTNSYm1JeCtTTHBjaU5vTzVoWEFmdzkzWjlXMEZTenJhR3dyR09IWkZN?=
 =?utf-8?B?SmJNVUluV0JaMkR1ZUdjQml1cXNMeWRtZ3BWc3BuaHA2WHdoUDZzV0o1elM0?=
 =?utf-8?B?cXVhTGR5U0h5YWQ5RlMwSlQyRVBmd3ZCTzBZQW9XVEFzUUtmZUtMbkduQ0lM?=
 =?utf-8?B?TnROOFYwdzVjL2s5VGhycE5ZUEh0RUFVN2pHTFNyL1p6dTBaVXMzK3l0MHdl?=
 =?utf-8?B?NkR0dnltaW9aN1RsRjh6MWFSQXpZd1N6V3YwY3JVY2V2dFNYaitxbkIwWVl0?=
 =?utf-8?B?UnlWZmQwNjlrcFJOWXVhcHcrUHlJU3RodFFwbXJ4SmlWTTMzUWU5MkRtYy84?=
 =?utf-8?B?aHBrZlZhWHNyR1V0dDBHb3ZyM0ZWMFRDL2kyZ0oxL0s4N3ZhVmZFeUgwWklm?=
 =?utf-8?B?N1VpRW5yVXBCTkp4ZkExYS91OWxlZ0JRN0pnV1g3eHMrclU4QlV1MXc5UXJT?=
 =?utf-8?B?dTVMalgwNlVkQjFPd3FnWnI2akc0YjNBU2loTU1VR2hHMVhwR3F4aFhndGZC?=
 =?utf-8?B?SlBNYzU2Wk00RW4rb1QrWkJWcmFNK2pMaFMycWdFMHJPTHJZdnhhekVpQ3h2?=
 =?utf-8?B?bUR1UWJldFpxNkdkSnFIZlpLT2tKdUF1UVFhcFh5dGdRN29vb2pLb3pzTnZY?=
 =?utf-8?B?R0kzODM0b2krRGk3K0tNZTVVR2EyakQvWE1jRlZTNi9jK3pySkhOckZiYURH?=
 =?utf-8?B?b1A0ZlNkcDVCVU1PWXVWMjQyeXY1dVRYREdWN0dLRmVncXpHYkZnV1lzUUxQ?=
 =?utf-8?B?MisrUk0wZXQ1QllJVVJsOTBKa0VwRjNDL2FGQlQ1TUV4U3VVc2dqcmdqODJ6?=
 =?utf-8?B?clE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b1be8ea-b1fd-45f4-d945-08dcd7cee6f9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 10:44:42.1561 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KAB6JDLq1r6NFQfBzyzQqA5eB0HMayjs4v91JOz0la+NovWerf5OyCwZuh/lq5O9xWU6dq+EDvhxj5llCS47X9rpvM+L93LCkXvFz9JCgMs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6615
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


On 9/18/2024 1:04 PM, Karthik B S wrote:
> Extend the ultrajoiner subtests to validate ultrajoiner on a non
> ultrajoiner supported display using force joiner.
>
> v2: Rebase
>
> v3: Add display version check for ultrajoiner
>
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>   tests/intel/kms_joiner.c | 120 +++++++++++++++++++++++++++++++++------
>   1 file changed, 102 insertions(+), 18 deletions(-)
>
> diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
> index e193f9071..e498ac542 100644
> --- a/tests/intel/kms_joiner.c
> +++ b/tests/intel/kms_joiner.c
> @@ -35,6 +35,7 @@
>    */
>   
>   #include "igt.h"
> +#include "xe/xe_query.h"
>   
>   /**
>    * SUBTEST: invalid-modeset-big-joiner
> @@ -51,15 +52,24 @@
>    * SUBTEST: basic-ultra-joiner
>    * Description: Verify the basic modeset on ultra joiner mode on all pipes
>    *
> - * SUBTEST: invalid-modeset-force-joiner
> - * Description: Verify if modeset on adjacent pipe is declined when force joiner modeset is active.
> - *		Force joiner applies bigjoiner functionality to non-bigjoiner outputs,
> + * SUBTEST: invalid-modeset-force-big-joiner
> + * Description: Verify if modeset on adjacent pipe is declined when force big joiner modeset is active.
> + *		Force big joiner applies bigjoiner functionality to non-bigjoiner outputs,
>    *		so test exclusively targets non-bigjoiner outputs.
>    *
> - * SUBTEST: basic-force-joiner
> - * Description: Verify basic modeset in force joiner mode across all pipes.
> + * SUBTEST: basic-force-big-joiner
> + * Description: Verify basic big joiner modeset in force joiner mode across all pipes.
>    *		Force joiner applies bigjoiner functionality to non-bigjoiner outputs thus,
>    *		the test exclusively targets non-bigjoiner outputs.
> + *
> + * SUBTEST: basic-force-ultra-joiner
> + * Description: Verify basic ultra joiner modeset in force joiner mode across all pipes.
> + *		Force joiner applies bigjoiner functionality to non-bigjoiner outputs thus,
> + *		the test exclusively targets non-bigjoiner outputs.
> + *
> + * SUBTEST: invalid-modeset-force-ultra-joiner
> + * Description: Verify if the modeset on the other pipes are rejected when
> + *              the pipe A is active with force ultra joiner modeset.
>    */
>   IGT_TEST_DESCRIPTION("Test joiner / force joiner");
>   
> @@ -111,6 +121,19 @@ static void enable_force_joiner_on_all_non_big_joiner_outputs(data_t *data)
>   	}
>   }
>   
> +static void enable_force_joiner_on_all_non_ultra_joiner_outputs(data_t *data)
> +{
> +	bool status;
> +	igt_output_t *output;
> +	int i;
> +
> +	for (i = 0; i < data->non_ultra_joiner_output_count; i++) {
> +		output = data->non_ultra_joiner_output[i];
> +		status = kmstest_force_connector_joiner(data->drm_fd, output->config.connector, 4);

Use JOINED_PIPES_ULTRA_JOINER.

As discussed offline, ultrajoiner requires DSC so need  to add check for 
that. Otherwise looks good to me.

Regards,

Ankit

> +		igt_assert_f(status, "Failed to toggle force joiner\n");
> +	}
> +}
> +
>   static enum pipe get_next_master_pipe(data_t *data, uint32_t available_pipe_mask)
>   {
>   	if ((data->master_pipes & available_pipe_mask) == 0)
> @@ -297,23 +320,36 @@ static void test_joiner_on_last_pipe(data_t *data, bool force_joiner)
>   	}
>   }
>   
> -static void test_ultra_joiner(data_t *data, bool invalid_pipe, bool two_display)
> +static void test_ultra_joiner(data_t *data, bool invalid_pipe, bool two_display, bool force_joiner)
>   {
> -	int i, j, k, ret;
> +	int i, j, k, ret, count;
>   	igt_output_t *output, *non_ultra_joiner_output;
>   	igt_plane_t *primary;
>   	igt_output_t **outputs;
>   	igt_fb_t fb;
>   	drmModeModeInfo mode;
>   
> -	outputs = data->ultra_joiner_output;
> +	if (force_joiner) {
> +		outputs = data->non_ultra_joiner_output;
> +		count = data->non_ultra_joiner_output_count;
> +	} else {
> +		outputs = data->ultra_joiner_output;
> +		count = data->ultra_joiner_output_count;
> +	}
> +
>   	igt_display_reset(&data->display);
>   	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>   
> -	for (i = 0; i < data->ultra_joiner_output_count; i++) {
> +	for (i = 0; i < count; i++) {
>   		output = outputs[i];
> -		igt_require(ultrajoiner_mode_found(data->drm_fd, output->config.connector, max_dotclock, &mode));
> -		igt_output_override_mode(output, &mode);
> +
> +		if (!force_joiner) {
> +			igt_require(ultrajoiner_mode_found(data->drm_fd, output->config.connector, max_dotclock, &mode));
> +			igt_output_override_mode(output, &mode);
> +		} else {
> +			mode = *igt_output_get_mode(output);
> +		}
> +
>   		for (j = 0; j < data->n_pipes; j++) {
>   			/* Ultra joiner is only valid on PIPE_A */
>   			if (invalid_pipe && j == PIPE_A)
> @@ -374,14 +410,15 @@ static void test_ultra_joiner(data_t *data, bool invalid_pipe, bool two_display)
>   
>   igt_main
>   {
> -	bool force_joiner_supported;
> -	int i, j;
> +	bool force_joiner_supported, ultra_joiner_supported, is_dgfx;
> +	int i, j, display_ver;
>   	igt_output_t *output;
>   	drmModeModeInfo mode;
>   	data_t data;
>   
>   	igt_fixture {
>   		force_joiner_supported = false;
> +		ultra_joiner_supported = false;
>   		data.big_joiner_output_count = 0;
>   		data.ultra_joiner_output_count = 0;
>   		data.non_big_joiner_output_count = 0;
> @@ -397,6 +434,11 @@ igt_main
>   		igt_require(data.display.is_atomic);
>   		max_dotclock = igt_get_max_dotclock(data.drm_fd);
>   
> +		is_dgfx = is_xe_device(data.drm_fd) ? xe_has_vram(data.drm_fd) : gem_has_lmem(data.drm_fd);
> +		display_ver = intel_display_ver(intel_get_drm_devid(data.drm_fd));
> +		if ((is_dgfx && display_ver == 14) || (display_ver > 14))
> +			ultra_joiner_supported = true;
> +
>   		for_each_connected_output(&data.display, output) {
>   			bool ultrajoiner_found = false, bigjoiner_found = false;
>   			drmModeConnector *connector = output->config.connector;
> @@ -461,7 +503,7 @@ igt_main
>   			igt_require_f(data.n_pipes > 3,
>   				      "Minimum 4 pipes required\n");
>   			igt_dynamic_f("single-joiner")
> -				test_ultra_joiner(&data, false, false);
> +				test_ultra_joiner(&data, false, false, false);
>   	}
>   
>   	igt_describe("Verify if the modeset on the adjoining pipe is rejected "
> @@ -487,15 +529,15 @@ igt_main
>   		igt_require_f(data.n_pipes > 3, "Minimum of 4 pipes are required\n");
>   
>   		igt_dynamic_f("ultra_joiner_on_invalid_pipe")
> -			test_ultra_joiner(&data, true, false);
> +			test_ultra_joiner(&data, true, false, false);
>   		if (data.non_ultra_joiner_output_count > 0) {
>   			igt_dynamic_f("2x")
> -				test_ultra_joiner(&data, false, true);
> +				test_ultra_joiner(&data, false, true, false);
>   		}
>   	}
>   
>   	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
> -	igt_subtest_with_dynamic("basic-force-joiner") {
> +	igt_subtest_with_dynamic("basic-force-big-joiner") {
>   		igt_require_f(force_joiner_supported,
>   			      "force joiner not supported on this platform or none of the connected output supports it\n");
>   		igt_require_f(data.non_big_joiner_output_count > 0,
> @@ -516,7 +558,7 @@ igt_main
>   		}
>   	}
>   
> -	igt_subtest_with_dynamic("invalid-modeset-force-joiner") {
> +	igt_subtest_with_dynamic("invalid-modeset-force-big-joiner") {
>   		igt_require_f(force_joiner_supported,
>   			      "force joiner not supported on this platform or none of the connected output supports it\n");
>   		igt_require_f(data.non_big_joiner_output_count > 0,
> @@ -539,6 +581,48 @@ igt_main
>   		}
>   	}
>   
> +	igt_describe("Verify the basic modeset on ultra joiner mode on all pipes");
> +	igt_subtest_with_dynamic("basic-force-ultra-joiner") {
> +		igt_require_f(force_joiner_supported,
> +			      "force joiner not supported on this platform or none of the connected output supports it\n");
> +		igt_require_f(ultra_joiner_supported,
> +			      "Ultra joiner not supported on this platform\n");
> +		igt_require_f(data.non_ultra_joiner_output_count > 0,
> +			      "No non ultra joiner output found\n");
> +		igt_require_f(data.n_pipes > 3,
> +			      "Minimum 4 pipes required\n");
> +		igt_dynamic_f("single") {
> +			enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
> +			test_ultra_joiner(&data, false, false, true);
> +			igt_reset_connectors();
> +		}
> +	}
> +
> +	igt_subtest_with_dynamic("invalid-modeset-force-ultra-joiner") {
> +		igt_require_f(force_joiner_supported,
> +			      "force joiner not supported on this platform or none of the connected output supports it\n");
> +		igt_require_f(ultra_joiner_supported,
> +			      "Ultra joiner not supported on this platform\n");
> +		igt_require_f(data.non_ultra_joiner_output_count > 0,
> +			      "Non ultra joiner output not found\n");
> +		igt_require_f(data.n_pipes > 3,
> +			      "Minimum of 3 pipes are required\n");
> +
> +		igt_dynamic_f("ultra_joiner_on_invalid_pipe") {
> +			enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
> +			test_ultra_joiner(&data, true, false, true);
> +			igt_reset_connectors();
> +		}
> +
> +		if (data.non_ultra_joiner_output_count > 1) {
> +			igt_dynamic_f("2x") {
> +				enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
> +				test_ultra_joiner(&data, false, true, true);
> +				igt_reset_connectors();
> +			}
> +		}
> +	}
> +
>   	igt_fixture {
>   		igt_display_fini(&data.display);
>   		drm_close_driver(data.drm_fd);
