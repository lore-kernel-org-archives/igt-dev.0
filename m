Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C4EE7718A
	for <igt-dev@archiver.kernel.org>; Fri, 20 Dec 2024 10:50:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90B4010E263;
	Fri, 20 Dec 2024 10:50:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TBw/IV7I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 734A010E151;
 Fri, 20 Dec 2024 10:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734691804; x=1766227804;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=W5ORm6baufDHFL5Ywn0hSCoT5xACfOPDBAph6mAq6aA=;
 b=TBw/IV7I5IiQB2IEgW/O0Dvrq3gyNbfZfdwQ1PRJspmpS/BEACXwQ+C+
 GFFo+K4QZvJZXLtllBTOczvWeTQrYUuNBojs2WzL1fL2XZSPllxqQbo5l
 bCF1H0h6GU8IpoXqXpNrnnUow5XtJNcf99tdNuJxNSesd2D7gtmwbb1rE
 e86FbDLoFQiCXZyU0yzV8pjLw7fgFtJHrlyu19ZLnPdLat5eo35lCLj6r
 sQL7Yv+vk0e+SY+JaHIuHbGMYB1m8s+AHDktMLiSrbGWIwuoAd3daWI0Y
 /T9C7C6/hM4d/l4OnvEE2R3NQvbheE+TUgplrbToq5QtXGAYpJkkxyP9E A==;
X-CSE-ConnectionGUID: 0r9CdQF2QJC9K6GLRUAIRA==
X-CSE-MsgGUID: 7yAdhX0sRxy9lWtPzejoEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="38078250"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; d="scan'208";a="38078250"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 02:50:04 -0800
X-CSE-ConnectionGUID: tNnT29XrSH6n+0reRYmnmQ==
X-CSE-MsgGUID: ZhgGs/P9TIOJyQN0YchrNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102611778"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2024 02:50:04 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 20 Dec 2024 02:50:03 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 20 Dec 2024 02:50:03 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 20 Dec 2024 02:50:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W9s7ehED2dWewLcACRO8CzIjZpfh38wlb2L+qQQvE1NCP2/++Jo3rpFj0Su4ZXMgaqFFO4K4fSR10OIBrrBv7Hiq2U5iG/pYvwedrBr4OFd6/8nAkAqugvyAXZg0m+olnfP0ODnoSBhbJImsdpwg9O+NAW/SD9xG20bnthk8S1tSeWD9UC2H69QfXq/OVBkfl6sAvDOayygLOg4OY+X7gHXiqqOk5s+s8dfWlg3rs7HTHQ11ZmZgFJAVbgQ+HwE/eBBk76AaQ2zXqApmOnr9Rnh0b9ITnSCcFhNlB1KSQNClq0TheU5r9UIPkIKObjmtTQbcTEicK2LsHZ3YdKJ9Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ltTts+LZj83DBXKabQxP16AvR9i+48ZdfWQfjvOUoEM=;
 b=VnEnmH5V9vLX9s48urB9KX17/JPK/Daj0kFrcdhxMZhltxa9cgGlfLhNsu4Zm3CxIY/Y22ft208fqT91LWFeMVQOw+r+O3TCD67z9KbaTOhLYtw0xhd62sSXLwfAVqunJ7cMRcT8AIujUMq/a50Hha3AzoouJRD7161MwKMhOjjjwTsvA3sCo93u/Do8G8oABBFdMj5VFN8wIHf8S1qVD8PAPhO+VGPPMxYVPitqM0hYNeXqunCUOxzSs4mvzWanEiM6rKwy7b/GCt7HDHO8IRbIa7VXfSNnQG22GOTEn11ybVOeXSAjjWg3iQJ/XZDb+DiLrqWoGlg8O0vrT3lJhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by SJ1PR11MB6275.namprd11.prod.outlook.com (2603:10b6:a03:456::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Fri, 20 Dec
 2024 10:49:34 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0%6]) with mapi id 15.20.8272.005; Fri, 20 Dec 2024
 10:49:34 +0000
Date: Fri, 20 Dec 2024 10:49:29 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <I915-ci-infra@lists.freedesktop.org>
Subject: Re: =?utf-8?Q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_tests=2Fin?=
 =?utf-8?Q?tel=2Fgem=5Fexec=5Fbalancer?= =?utf-8?Q?=3A?= Decrease expected
 load value (rev4)
Message-ID: <s6pbr7flish45pwtysim7kwqyfmexnu3o3qbduqikzuai3cmtd@bs7nvrdqmg3d>
References: <fjysvvdi7wbyamul3gxnaitsbnsbme27ikteqelhk6ukih75vs@cynz3yfs5gmx>
 <173454331175.124020.12529213239565895722@b555e5b46a47>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <173454331175.124020.12529213239565895722@b555e5b46a47>
X-ClientProxiedBy: MI2P293CA0012.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::10) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|SJ1PR11MB6275:EE_
X-MS-Office365-Filtering-Correlation-Id: 408cb46c-8c73-40a0-1fad-08dd20e3fdad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NkNwU0doR0dFVldqRGVJM2JHSytwS2locmZuOWhxOFNLZzRlQUZpbUxuZ3M0?=
 =?utf-8?B?RHVLemtLZjNpNHNHSGljUVJxaVhHMUljcXJ3V29YYk1MVnNkdXhHWGFTTnI2?=
 =?utf-8?B?VEY0MnQvMko1Qy9DRWRCc0tybXVXeGRHMHMzdFc4clg5RFhjaTdROHhsOXor?=
 =?utf-8?B?YVpiRmlMUUUyd3pYL3JhckR3Z1ZnWndTalRIT0pWVTBiL1RIdWZGUTRXTmZj?=
 =?utf-8?B?eUpWdlJVWGwrUXdQSzVkbENNV01zZS8yQ1VFZHl5TnE3OVZZc2dpblFjSzhx?=
 =?utf-8?B?SWVyYzY2bnVlRnpnckdHZzNZMkw4aEFaQWdocURhNU0yeG0xSTRVZ2MwaG9S?=
 =?utf-8?B?Q3dLM0lIUmNSaUZyUmVnQUVwa09yWE9QdUFuVHd3ZnFwTTVyVnM5bVpOdTli?=
 =?utf-8?B?SWdaZktUTk9saU1zWi9YMG0xVk1ObTNxZ3pjQ3lDYlZoY2dVT1JsK3JSajEx?=
 =?utf-8?B?d1haV29JT1lsN3IxWElyeURSVkZVRk9KajhGdGRzWlIvRk45S1FWU1ZEc3FH?=
 =?utf-8?B?bnp4NUszaTBXR2ladVYrUHFrclJDaWlpZGd2SHpqMXUvdGt6ek1RenJHVGtF?=
 =?utf-8?B?UUV5cGdsNndwUnl1eURKK1FiVFQxMzNtREZPNVMwZjVPdFQ2R0U2VGhkMWp0?=
 =?utf-8?B?MmFkSmR0WWlHU3R4ZkVWUTlPblNncjFEUTRLRmQzRlIzT0FjQk8xOVJwOFc0?=
 =?utf-8?B?SE44YnVJK0hmT3VRbTl4bFBqbHkyNllGeWVzeFcwbGxzbThVOWYrOUM2cTVM?=
 =?utf-8?B?MklKS2owanEwU3hzSDBOc3ZzcE40YTZVSXcySjNUbFB2ZVQzWmtoc2hWcHNL?=
 =?utf-8?B?VHdaRzFGREpDZnpjK2NpS3VkcGhrbDUxbnBJRUhVR05TaWIrVDlONk01MXQv?=
 =?utf-8?B?TlpISURPZ0I2ZkpOQU11aHNVNXMwT2psS3NaekRkUHBxZElRMnJJdklUNVkz?=
 =?utf-8?B?ZmlveHRSODhzS0d3N0RUWkIzRS9zL3FpeVcwOXk0V1hCTkN5YTN6Z0JpMVJ1?=
 =?utf-8?B?Z0hGcXRseHZUMjd4K29RQ3YrdnA2dEhid1FiWmlpVGFpbFlBTko4ODB4aWVq?=
 =?utf-8?B?NGlrMFZrU1ZzNGVTMmcvSTNFanpkL2R3TEtER3JvOGdxNVdSU0ZiZGE3enhn?=
 =?utf-8?B?OHp2azZackkraEVnMUYzSXNlTnZOak5TeU12MEViMHJabFpCSzhFRCtOTHVG?=
 =?utf-8?B?UlBHeE93eEUzeHJYWGs1V2VFVUh1YTdsY1pOc2srLzd1eG5sclZ5b2dJVjlR?=
 =?utf-8?B?OWVhS2xudnJxWUV1OUpaZStNVm5yMjFOSGF0SWRxNHR0SUU4ZElIaFd3Tk5M?=
 =?utf-8?B?UWpiRk8vK095WGxsTGFlK1R1TDdaRm9DMkZFM2xTTW5FbFRhTnJUb0JQdG0z?=
 =?utf-8?B?OFhJWDAvd010VEg1Sk1nbHhUTm9FaER0amY5RnRBMHZva1ZpVlpycm05ckZX?=
 =?utf-8?B?WFUvUGJiNkp4dHY0ZTM5ZXhUZTBCWHd5UGFhWlkyQjdXKzVHNjdsRElOTlNC?=
 =?utf-8?B?VHlwdDNCRThnSWk0YnVGb21vODVBY2RaUUxNSFZCakRLQ09RTnlWMm5GQ2Nq?=
 =?utf-8?B?eG5yZTlRTVRlalR2bUNWYVpEQUN3Z3BtUnpuVzJ3TCtEQzFyQkJUQVpwdWRU?=
 =?utf-8?B?MFRxRjZnQzhtV0ZKdnNVcEZBcUVteXNmdXV5NlNaVFRxdXZ6ZGxsamxaK2xq?=
 =?utf-8?B?YjNFb2hFTnZJdDB1bGR6VEFORkpTd251WDdjNi9uTzZEd3M4V1ZDT3EzaVA4?=
 =?utf-8?B?SlEzT3RNajVVZVJ1dXNRZXNMS0g2SGw4RWVqekdpbFNldGFrVitva1ducElk?=
 =?utf-8?B?OWhxTDdkZzhBV2xrM3pHdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlVqenB4YXBjNEdWWjZkZ1pjR1Z5QnI1OTdyd1dURWQwTHhGZVNSMnIyQlBO?=
 =?utf-8?B?T09tWnpDMW5CeEI5NEd4ZUNWQlU5c3lUalBKdU9WZElJRlA5cHExcld6YlRU?=
 =?utf-8?B?S25wRmxEb2FTTExGc1hoMXROUWlQQlVnWWRkajdBVjRLVHdXeW5zT1NCQkNk?=
 =?utf-8?B?R0Ixb3gwOVlxUkI0WjFaODQxcitWY0lQRW5HOGU4bHZEZnRYZGxwMEpMcnBI?=
 =?utf-8?B?bG5WOG8zZ3U5N2M1UG94R1dseE9mT1FFdDZTaDIxK1BBcVdMUjhzOUZFcVJj?=
 =?utf-8?B?dWRGbEM0MmpndDhLRGRLcW02Rjh0elBXbEFmZm1sWXl1aUwrNkZFVlJmNzI3?=
 =?utf-8?B?bERKbzc1Mkp3SGI3UTFURFhIZnhrd2M5ZEpJVTgvZE1RWTZPMFBRSS95czMw?=
 =?utf-8?B?N2tuQ3V6MXE3YlNWM3R1YnVRdDM4VzNvOWJuaDZxMWVzUDU4eWY5TTZVd05D?=
 =?utf-8?B?VWRyc0t1OSsxQ3M2dUd0bGlzSE83elVWOWJnZ1ZEcjRaUXR2R09SZjVYbEp5?=
 =?utf-8?B?cklydlNhYmFwRlphWk5LRS9LOXJiQmdoY2RKT3NtYndTYUM2My9iby9EUWZW?=
 =?utf-8?B?NUJIcWxoZUJEVWFzRUZmWmtOOVJsemFvdVE5TzU5aFRJd1AzamRVVzJYZEhE?=
 =?utf-8?B?dHlLOWplbkhobHUrZ05zNDNDS0tVcUJMTlNDSmw4Z1BnbXNlMldGZ3RhYmhN?=
 =?utf-8?B?bXZsakI0THFia3JUa3o3cThsenltMXR0OXVYUmJzSHpxT2pRbVp0ejNHRmZ3?=
 =?utf-8?B?aFNwRDNXQmdsUzBYUGV5UGtqdFFCd0g2d1hTL2xLRmFmeTRIdjdCN3hGQ1ly?=
 =?utf-8?B?WXV0d0NCSmJ0Tk80M0ZiNi9TY2Q4YmxRRDZ6enI0bHZWTzhiSFFPNUZaUDlE?=
 =?utf-8?B?UjJ2V1ZUZklLczMrenk3eE40TXMwcEpaMC8xbjlHNHVibDVTOUtrNTZja055?=
 =?utf-8?B?Rys3N3VUVzJncUxiMFJXbmlOcGwrL0QwQVpydWhxYzNiQjRVYTN3ZTdhTkRj?=
 =?utf-8?B?bHQrd2VjdVFUTXlrMU1BUW1qd0srV1c5MklsYkJxcnU3RmNUVXgxRkVDazlD?=
 =?utf-8?B?UEkxdTJmSFZJdGRHWStBejl0YUVWTkZZb3BiSDJteUlGU1B5Mmw5cUxQMDUy?=
 =?utf-8?B?VEYvT3Q1bXhQSG11SmVFblBBU055eExTQ2JNR2l5b0JIKzNnZndaTjBqK1Vt?=
 =?utf-8?B?QldtcVlOZlY2WVFWSTRSUk11L0Z2QmhaL1R3RWwzT1VzT1JmQUdiWm5KdnV4?=
 =?utf-8?B?NCtYcFVrRENDa2g3c2VRQ2JsTVd4Z0ROSUtxYS9iWkdpYml1S3dWVVNGK1RV?=
 =?utf-8?B?ZllCSkpUS05oZG84UmRjQ0djTGJtd252dSttQ2trTlJPb2NXMDlpbTQrbHkw?=
 =?utf-8?B?a2tiSWJ1RTAwUkRHN2ZMV21OZ0dQMHdHU1c5d3NmcXJ1b3Ryd0ZpaHdXQVEw?=
 =?utf-8?B?WEpzSlZhR25KWHhqT0M3OEt4MFl2TVBZYzVWNVUvcmhyUEczQ3lkOHMxVUZS?=
 =?utf-8?B?Tm9idnFOSllsT0tycGlDUW9rRTcvdWNuK0tJU0FINThKV2VybzNkRVdKT3ZZ?=
 =?utf-8?B?T2c5Rk40NU0xUlpYSVpHK0w5cDRGYWNVbUpnSFp2bml4S0dKMHpBOGp6L1FQ?=
 =?utf-8?B?ME5oMmdBeC9uOERJbU1LK0EyYW8rTy9pQUx2OEREM1dVRXl2UzhXSEwwV29G?=
 =?utf-8?B?eE53SmVkcDZaYnpmalE4dnFPb3E0Rm43cG0yeEZScjBhTEsvbXlqcTJ6VDVq?=
 =?utf-8?B?L0UybDk4NEduRE4wR04relYvRXZlNUNNN3lNRzNuYzJua0FYWjRBMzFQWHRQ?=
 =?utf-8?B?SnJReFlaS2J0U0h1cVJqWEQyQktDMlZjUmJuS1FJVUpTcDVJZ1Z3ditnaTI3?=
 =?utf-8?B?OEFlUFlTeDhxRzgvbzd6QTRTbzdNblROMURxcnFKMzFuRk13VUNkNEo4ajFi?=
 =?utf-8?B?MkRPMUE5bkRtV2tuR2ZQK0tyNHpUWVRKaUpXMm8xNFdHS1pVL0VtRWlFcVpD?=
 =?utf-8?B?ZVFXUHVPNWNiR0JrQmx0KzlCY2NubGQwd0NEVXhkQkErOExXNU12QU1RTnds?=
 =?utf-8?B?NDhtSnJNNFl4MVZoTHFUbzZyMmxvc3d1bDZ1RFEweXdoaWduVXhHdFUvOXNR?=
 =?utf-8?B?NnYxbkRGTmQ5Vjkwbm9KbDVZSWRxazZtSVlOZHZOanltVjEzR3VVbWJMeGVr?=
 =?utf-8?B?bnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 408cb46c-8c73-40a0-1fad-08dd20e3fdad
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 10:49:34.4358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ltbt5AtGJoI5TVsGCK/94Z00z7P3UETHY7d8cWJYhtYoUEEEzZar/QSlp78+9RPGU9cUKVAR1cE5EsSFuuKlq1o9t93UAd5wwUgyyYfICtI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6275
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

On 2024-12-18 at 17:35:11 +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/gem_exec_balancer: Decrease expected load value (rev4)
> URL   : https://patchwork.freedesktop.org/series/142150/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8163 -> IGTPW_12337
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12337 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12337, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/index.html
> 
> Participating hosts (45 -> 44)
> ------------------------------
> 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12337:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_module_load@reload:
>     - bat-rpls-4:         [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/bat-rpls-4/igt@i915_module_load@reload.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/bat-rpls-4/igt@i915_module_load@reload.html
> 
>   

These are not related to my change, Please re-run.
Thank you.

-- 
Best regards,
Sebastian Brzezinka
