Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D709CCD199
	for <igt-dev@archiver.kernel.org>; Mon, 20 Oct 2025 14:36:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2963C10E45E;
	Mon, 20 Oct 2025 14:36:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KxTvcuA2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F0CC10E45E
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Oct 2025 14:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760970965; x=1792506965;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3HnrB0XmyMSwx/RcF0/6Y+JLcP5AMLtTGtlstHEtuaU=;
 b=KxTvcuA2IJh3sleWvZSlSzyznj4K49Nznxl5Fc980cZMCFgcwHjMbbjB
 AsCf7uiW8FWosxlhxXrURidyOyigmVH2MNJO2u2SSEm22Q120lJgssByb
 ryocU27WVwhd3evYcmGi2B/4v9tZRbbeNboj10SnwaIvE0KfefwPFtmcD
 AWYy5jrr+6wZ0Ece31PtsxdaCXQ5udBy8Uflq01e41g54XXo5FAWJp5/y
 IrJQL++Szc8/lXgp/VvQ6kzmvgdCPV4v0geYljjHcPqDXySFpbwTkLkjk
 onEe6I2W1HX64SH0umyiF4vJH1T5KitxHzFGubrohwz+2dMqmRwG85F+S g==;
X-CSE-ConnectionGUID: m0xI4eEgTU24396HlYhgmw==
X-CSE-MsgGUID: r06aLmogQfy0HKwahcCSJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="85707945"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="85707945"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 07:36:05 -0700
X-CSE-ConnectionGUID: El/qXpM8TJu5svZS6TpEPg==
X-CSE-MsgGUID: yoBBcSN+Spi0zQpU9Q/Bvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="183185963"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 07:36:04 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 07:36:04 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 07:36:04 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.26) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 07:36:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qaRrVaniXBntWHjC/Pu9vXLFWnNoWej/OGLi3310s3GoseWmpwB0RRBrUJ4N4nNS70YFITlG8/guufowHgDLo3XsUpHsFHbRYNC3Y0KrsunhhARkRcKmEpr9Kyb+FLnC+J8fWr5KXXyDmve277MUfOFD4dYHHaBlxJGv6WSNuEwj4uLOJsVKQNUCG5mh654/qfCzp73FGd82LY4poW4eyqExICCt1f+dZfAPpXMA62Ik5xpBs4ig0G1TQ8kVAMzHIxogKxfQw7S7AvBYWynTB5lj0rzgXBHjvlGfyfSWzXVve6tpYnxYL6N6T1WHv35d6K/CeiCJ19l6U178rlF6OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pIjno6BG1ig8ewKIutha06vosod8BlNLyimdRNBu8d4=;
 b=IZyzDvwIV5U0Pus1qkiAboc/O5XaKSj3oBEqnJsSz1ztAPdECOb49JyT6NKjWJnJoxELkkPFS/9IJ+Kk9hUlIWgCAJhwrJDyOYtREwhCCKNEaLSd5HIhdjbP/+aQaIDglboEUPR4t0DJnT3dheOX5TujPa0gr5qdlWpRDQ7Ij/fXE0f+qA8TjBlBlJH+uaRI3ZUmfgNOxxgZsWTHL/Rb3mkEANMzdyDlBs8bKLd79lcw4IigERWA5QItSGgBZ6MmKzkydAFjFX0cgQfvSJAGo0g6j7EXNbk4Ctyj29aoQSz+gX8s5DK/yGq7c4grzWiBPlLX2EGxq7S4GsBTT9VLbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by IA0PR11MB7282.namprd11.prod.outlook.com (2603:10b6:208:43a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 14:36:02 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%5]) with mapi id 15.20.9228.016; Mon, 20 Oct 2025
 14:36:02 +0000
Message-ID: <3b2a0e54-bddd-4c71-9caf-7c8bbd826d7c@intel.com>
Date: Mon, 20 Oct 2025 16:35:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/3] lib/xe/xe_sriov_debugfs: Add PF
 restore_auto_provisioning helpers
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>
References: <20251018161549.999459-1-marcin.bernatowicz@linux.intel.com>
 <20251018161549.999459-2-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20251018161549.999459-2-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR02CA0043.eurprd02.prod.outlook.com
 (2603:10a6:802:14::14) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|IA0PR11MB7282:EE_
X-MS-Office365-Filtering-Correlation-Id: 52dc7685-bab2-4cab-f16a-08de0fe5fe1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R2NCZEFtNEdEWGd2Um9DSU5HSUFEL0MybVArWXQ0bWUzeVM3M3hlNUJmUlFn?=
 =?utf-8?B?WktZNGhhRFRWbkdaSUdnY28ycGUwN0NJM2VSY0s4bDQ2V1ZJM3B1S24vbXdB?=
 =?utf-8?B?RGhJUFVjK1lrODc3TTJnOGdEcVdRMndsTlNXRVczL0JNTDQzL0Ivd0VrQnhw?=
 =?utf-8?B?Q3hQOFdFaEozUXg4endVRUFOeitlMUp3WkZTNmU0dS9VeU1XWjBJaVVwVnRh?=
 =?utf-8?B?cXpqVFF0UTV4YVBVT04yLy9PUmZueHArQXltMklSL1Qwa0huWENvYlpUdXlQ?=
 =?utf-8?B?Nk5rendubVRQZmJ2R09ETm9iQ3ZLdnhWbHhUYXVFaWNnTksxSkh6VXhra3JV?=
 =?utf-8?B?QkxFRkMvYzNrdEYwdmNvSThUVDZqQ2pRQ25oZFFKVXJ5dFNyd1RNL1duU2RQ?=
 =?utf-8?B?UCs5REhydVFybTRtdk5DWVlKc2JrTkhiSGRoUUVDbFhjaHZDNFBud0R0bkJK?=
 =?utf-8?B?VFYydkhYMjFBaVo2QzJNcm1qMzJHcm0rQzkyYkhEeTM2emRnL25mTGUzMzBo?=
 =?utf-8?B?a01WMVFJTnZKd3RJakpCejVuK3pIWWNRd3VJaDYxTkhHRTdTWm1Xa2lNcjRN?=
 =?utf-8?B?L3RTTWFjVHBmMG9VYlAyZklhaFR4dWFnOFM3b2E5QWNGVHcranE5NE45Y2c4?=
 =?utf-8?B?MzRMeGVFRldNRWNPSXZaVHZ2NUdZSEUxTkw5dlFmeG80c0NtNXFsalFQMWZS?=
 =?utf-8?B?T0l6cllWbVBIdHNyTzhmc3dJL3pjakRKeEJPY1BGMEMrSVoxODBSeW1ROVli?=
 =?utf-8?B?UldVblk2bjJaaUZiZFFFVlpkUHBSSmp1UkNVYnZNNUd2ZER1S2NPT21GQmdD?=
 =?utf-8?B?UStLazRJekEwa2FFeEVXZEhtcVN1eDU5eDdhVTIxZ3U5UGVEdlZ1TVJaU1Jy?=
 =?utf-8?B?ckRvRVhlaENkUGhIL2JOdDcreWZlZ0dUbytDWVgyUkx4bnFoQWgyUUNmWTNF?=
 =?utf-8?B?YnZ1NEczeEphL1krdUJ6MHNtMTZVdk9pd1kvUGhwTzhxc1lMSmFvRHNXemVo?=
 =?utf-8?B?OWUxRlovNlNlWHB1S3ZXR0FqQXZBWVJHWXlBNWRpNzg0RHZzamd6cnV1VUxx?=
 =?utf-8?B?RktXRDROTEFtVHJvSjB4d3E1azQxaUh1bGxQSzlEK1NNZVFKV2NpaCtoUGZt?=
 =?utf-8?B?OFZLNi9DRS9nM2ZtZ1JCNW41czlwclZhMGVWdUtBMFJ2Wk5VTjFMS2JtU2h2?=
 =?utf-8?B?UThpT3ZTNnBkY1M3STN2V08xZktZZ25hOTBFaC9IVThjZFNiYklyck1EK3dO?=
 =?utf-8?B?Y1JVK2hwMk0xRDB2bXY1enNqUEZWdC9RdUVEUVY2U1gvWDVHaXJ2UGNMRW5x?=
 =?utf-8?B?TzhVL2JYTzE1b0xkaWY5aW9VNFhGYWdid212ZkZVZnJBanlLck5NUVY5VzZw?=
 =?utf-8?B?RVppdXRuRm0rbWNSeE05RVNXU3dYQm1sTXBKMm1tMnBrT3hhcXRTQUJvcExp?=
 =?utf-8?B?R2tCYThFM204VFQ2eGY0RUFmSGdCM3VlR0dkamRVU205dnpHNTNjbjFQbnFj?=
 =?utf-8?B?eUZGT3RHMThrT29UMTFUdUw5TTV1L3gxZXg0VzJ0NFh6VG8yRXcvMUJEWWVT?=
 =?utf-8?B?ZVVvSm1RN1RTU0RlNUxCR1crN0h0NGRObFhFNWRRc0cwWFFoT2VuRWQ1Y25Z?=
 =?utf-8?B?SE0rb0QvNUZySEw5Q2hwWE5MRmlQVGhZeGp4T1cxV0JMNEluU1lGRnh1QVg4?=
 =?utf-8?B?emxCMklkSldVK0RtQThueEpwVFNnZmZTL0lnczJEZEllU1lYNm9YL2lIVWE3?=
 =?utf-8?B?UFkyV2hQME53QWRkdHVuSjZkUkNnMzlPa0ZaaWlRQWp0R1hUR1NVZHFZWGgw?=
 =?utf-8?B?ZHo2aGJ1UXdrNUFQTWlrVDJBMmVMdG9CMU5zYWc5bjlCeW9SOXA4bG9EcTcr?=
 =?utf-8?B?RUZuZXBWakxDNFpURG5TR3RwVSt6cWtEeTRkZ0M2ZzJVUHVRR0tCUHF5Z2d0?=
 =?utf-8?Q?PS62Cbi+i9to+uslCILLViCx+YK5URFC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y05zMUt1NDQ5MFY1YU1qbUJNVVEvbVdJOVBIM2FUSFJWRldady94eFh5YTE3?=
 =?utf-8?B?QUkxQ0xqaHN2ZjFnME16TGNJMWJlQXd3cW5LOFdZM0Q2QXVyYm04QWFoT3Rp?=
 =?utf-8?B?YVZPLzlKaTBpRC9BTnhvYUVoUWt6Y2c0Q0drUWpiLzA3YnE2R3F1SmgwSllr?=
 =?utf-8?B?QUhEZ0FtNHhBY1NwU25tSmxKNENiQmVzalkrUU1xVktCWFVFMmx3T1JLQ00v?=
 =?utf-8?B?OVNIZXUvRnlvWGUzbElEcSs4dWxGZHhldG9BZ3UyZTAzbDJWU0tHbld0NFNa?=
 =?utf-8?B?NXRPYjdpMWxCOFN6WG9hSjRyK24yYkZ1YW9RaStSMm1LY1o5dXdTR1c1c1Bz?=
 =?utf-8?B?cVkwRjA0UGxYbkxDM2FRT3E1Tk5xZHozSGVSNko4MG9HQ3ZIOUQrQmJzOVRh?=
 =?utf-8?B?WHozZnk4TTlGQVB0WnE3ZWdqeDQwYk5BUmoyUXdRa09yWG9DUUdQZUkrWDhZ?=
 =?utf-8?B?cHFlNEQzNXdhNWt4Y0ZrZWw1UFE3QXBOd29KRVJlZUVnalRVekZuYnNWZ2pW?=
 =?utf-8?B?QmN5OEdFRFBWeUJRY2Q5MXZKUWs3VEVzcEcxc1lwd1RSWHlPT0EyLy8yQkI1?=
 =?utf-8?B?aVVycUVmMUp5NU90NGU0djhVczJRaGpWNG1GT01yZFVXVzJsS0NxRUZ1OVds?=
 =?utf-8?B?T1hSU3pGWlVJZkw2U1VrREMxL3RIaFJSVGhvU3M0MzlFSGxSK2hYZ2ZKcUVE?=
 =?utf-8?B?MlA0TVh4ME1MMi9sWWF1MVhpR2haa2R4Vkl2OEhlaGFvbXlpSzZhNGkxOHF0?=
 =?utf-8?B?RTV0TFpKRFQzMzY5TlpRWldkUjBIREVUbGEza3R3SU1tcjZsZW0vWHZaYUlw?=
 =?utf-8?B?RkVUZ0hibTM4a0QyQ3lSTnFOYjM0L21UNitkT3VJOGcxQ0haUzZLb01xSjUy?=
 =?utf-8?B?OTZVQ2Mzc0N6bFViVkRMK2I2VXhKN1dFQS9YWjI0aWk3SGY5SG9oUmxlSndr?=
 =?utf-8?B?bkFxdGoyQmlPRWlwMkJqSTRNckZCSHJEODlPc2VBTVZLcGhPdEFwRWdLNS9H?=
 =?utf-8?B?eUlaeENRVVZlWU1QbHZWay9VS1ZRSHo2N3dxM2RWYUhSRjVyK3kvblVZQ1pT?=
 =?utf-8?B?N09FeXVkRk5Td0NPYS9VeGs3cWJ0Y3VhWVV0c3Y0NEhXKzQvaW9NekFQNTN2?=
 =?utf-8?B?MnkycVlFSWZ3QXBXTHpJQjd1UVJsa1ZmdTJacEtQcmRIWldBUVhVQWphZkpq?=
 =?utf-8?B?Z0k3UTVubmE0K0d1QnYrVGRDWmNGbHpZRHpLMTJuQnZRQWhGazVtUW9yYnZw?=
 =?utf-8?B?RGRTZFlrN3RzYkI3bmxmem1kc2ZVYUduaGE1SllMNmMyRmNyY2FvTTdLdEFk?=
 =?utf-8?B?dG9sVWdrRUlwcXk2WHBBbWw1czh2allzRmVMMGNFajVNTG9XNVNRdXNzeEVI?=
 =?utf-8?B?SktvYWNJUkxwM3U0YjlpY2trTHFWTXRiaU1oVkM4b1psQ0xYQ3JlSVVISldh?=
 =?utf-8?B?NEJ0bnJJODhQczNLYzJ4aE9ha2Q3a3BZcG4vcFVSSFlPNDlMdmw1Q3pWT0lT?=
 =?utf-8?B?c0lzNnpNZ0VsSVBUZ0ZlaHZZUGhyTzVKb1lwaklXRVJxYzg1SmdoRFhJQ0dH?=
 =?utf-8?B?cDV0ZVg3R3d0cFJSdTJuZHFJZFBGbmdOQVcxTUJvakxKNDdZbDZEcHBmU20v?=
 =?utf-8?B?MHlLRERSS0N4cTd3a0FXWnV0VXBYZDh1RFdRbEZqSEcwK0ZNOEx6akU0TTB4?=
 =?utf-8?B?UWtvYjZzMEdoWUxPaHpveE44TmdBMTBsL2ZIRytXanhFRXBaOW93MWljMHdQ?=
 =?utf-8?B?UWtZUWIwZEpJSERlRGtvZy9mQWJQUklIZXM1K2REc2VTbDdNWi9lZGQzbTI0?=
 =?utf-8?B?cDRLNGttdTZzQUR2MWlMTmxsZnFCcWpzMzdwOVY3UzR2WTE3YlVpTXpJdkd5?=
 =?utf-8?B?aktseUpiNERTTzdHd1p0aHhGUlhxRStRNEhrUFczdEhscm1UMjlNeEtYSUE5?=
 =?utf-8?B?Tm1VVDZ6TTZvUENIMUtpNzBuaXppMHcxOGVZNkZ4aG9NTk5GY0pST2xOY0I3?=
 =?utf-8?B?TnpHdjFjREJaS0J3L2JkN1VsanplVG5ZbEFLWHhZZFJiT1UxQ09vMHRleldD?=
 =?utf-8?B?U24raDBBNGVOS3VYTHpYMWVrRnljNnEvdzJsd1dRR2M4VjZUV1M5UEprb1JQ?=
 =?utf-8?B?TlJicm0zOWhXSy95S3RocWk0THl1YkgxVTlCaUN1TEx4RCtPSTVLWC81OGRW?=
 =?utf-8?B?WWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 52dc7685-bab2-4cab-f16a-08de0fe5fe1d
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 14:36:02.1848 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tvzitQRfvfH4Op1Bukx3Ov0YOXzvV9c6oDflhKWWjjDgayEGD8uziny56hdegLagpdmc7hgIHEg3zc0LFBL+BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7282
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


On 10/18/2025 18:15, Marcin Bernatowicz wrote:
> Add helpers to access <debugfs>/sriov/restore_auto_provisioning on PF:
>
>   - xe_sriov_pf_debugfs_supports_restore_auto_provisioning()
>   - xe_sriov_pf_debugfs_restore_auto_provisioning()
>
> They allow tests to check and trigger PF restore of default
> auto-provisioning state after VF teardown.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> ---
>   lib/xe/xe_sriov_debugfs.c | 40 +++++++++++++++++++++++++++++++++++++++
>   lib/xe/xe_sriov_debugfs.h |  2 ++
>   2 files changed, 42 insertions(+)
>
> diff --git a/lib/xe/xe_sriov_debugfs.c b/lib/xe/xe_sriov_debugfs.c
> index a33300e47..a8514a98f 100644
> --- a/lib/xe/xe_sriov_debugfs.c
> +++ b/lib/xe/xe_sriov_debugfs.c
> @@ -620,3 +620,43 @@ uint64_t xe_sriov_vf_debugfs_get_selfconfig(int vf, enum xe_sriov_shared_res res
>   
>   	return value;
>   }
> +
> +/**
> + * xe_sriov_pf_debugfs_supports_restore_auto_provisioning - Check if PF
> + * supports restoring the default auto-provisioning state via debugfs.
> + * @pf: PF device file descriptor
> + *
> + * The helper probes for a writable
> + * <debugfs>/sriov/restore_auto_provisioning attribute on the PF.
> + *
> + * Return: true if the attribute exists and is writable, false otherwise.
> + */
> +bool xe_sriov_pf_debugfs_supports_restore_auto_provisioning(int pf)
> +{
> +	return igt_debugfs_exists(pf, "sriov/restore_auto_provisioning", O_WRONLY);
> +}
> +
> +/**
> + * xe_sriov_pf_debugfs_restore_auto_provisioning - Request PF to restore the
> + * default auto-provisioning state after VF teardown.
> + * @pf: PF device file descriptor
> + *
> + * This helper writes "1" to <debugfs>/sriov/restore_auto_provisioning.
> + * Intended for use in test teardown after disabling VFs, so future
> + * provisioning starts from a clean, default state.
> + *
> + * Return: 0 on success, or a negative errno on failure.
> + */
> +int xe_sriov_pf_debugfs_restore_auto_provisioning(int pf)
> +{
> +	int dirfd = igt_debugfs_dir(pf);
> +	int ret;
> +
> +	igt_assert_fd(dirfd);
> +
> +	ret = igt_sysfs_write(dirfd, "sriov/restore_auto_provisioning", "1", 1);
> +
> +	close(dirfd);
> +
> +	return ret == 1 ? 0 : ret;
> +}
> diff --git a/lib/xe/xe_sriov_debugfs.h b/lib/xe/xe_sriov_debugfs.h
> index 4983afbb3..989c937a7 100644
> --- a/lib/xe/xe_sriov_debugfs.h
> +++ b/lib/xe/xe_sriov_debugfs.h
> @@ -43,5 +43,7 @@ int __xe_sriov_vf_debugfs_get_selfconfig(int vf, enum xe_sriov_shared_res res,
>   					 unsigned int gt_num, uint64_t *value);
>   uint64_t xe_sriov_vf_debugfs_get_selfconfig(int vf, enum xe_sriov_shared_res res,
>   					    unsigned int gt_num);
> +bool xe_sriov_pf_debugfs_supports_restore_auto_provisioning(int pf);
> +int xe_sriov_pf_debugfs_restore_auto_provisioning(int pf);
>   
>   #endif /* __XE_SRIOV_DEBUGFS_H__ */
