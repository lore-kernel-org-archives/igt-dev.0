Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A485DCF34CA
	for <igt-dev@archiver.kernel.org>; Thu,  3 Oct 2024 22:04:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BAF810E977;
	Thu,  3 Oct 2024 22:04:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JK3sfKgf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FF0210E977
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Oct 2024 22:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727993057; x=1759529057;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2pZZAnw/iHBNVfI8Kd6ZmqYUCfM/EF3OJIoces2s6p0=;
 b=JK3sfKgfqOuELxHHcEWVOEHG/f4lYCtnKJqw2z9ZSrr0K2Ci/00FbaoU
 k/m+cJk3EKvye1Yjephxjw1Yo0hT9rhTeENkK6oSR0E9uwCSUuERmcQdC
 ATjWoiP0lgaZ0nAoefUWUOKrama2psTc3pm6wZ2rTsBVqXLB9mjK3OPQ+
 bSh5hgugT+s+KlkpioD3PBmAY3mZ1yKSDURx0CEkwCa8uwdL/zmr7H7HM
 J3VPxbJs4W5/hHovhMskIDSuV4dXM0GcK47p2w6abuq/Dm2700UpdbuyL
 R4EEotoPhDO2De8Nb+Em3Z61YelfFTy0AklL6tAW0Z1+CdZCZER1HJOL3 Q==;
X-CSE-ConnectionGUID: OhmtGVz3QVqyVKh70CPR6A==
X-CSE-MsgGUID: xX+7Vf3xS26ko0RH6Xac1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27020287"
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; d="scan'208";a="27020287"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 15:04:15 -0700
X-CSE-ConnectionGUID: U0BLpKUCROiJcIMwGAAyaQ==
X-CSE-MsgGUID: W9GNX6qzS1ecJvCCX/ryPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; d="scan'208";a="74075751"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Oct 2024 15:04:14 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 3 Oct 2024 15:04:13 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 3 Oct 2024 15:04:13 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 3 Oct 2024 15:04:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GbHxWUntm0UNDEdSzMO6o4/s4RLs+bGi5ilU0tQ32hzIgDHn5VW4tFXBm4dHY//CezJe51hal4/9Resd/Ia8TEr7a9oRSJyWrkUQmZDJm1ZBYDBdgM8Ido+4GQILnPlRlQiH9BpY4BxpUKpu7rQheD6k4TxZ9EFoqxwB2X1JY02DnS01zdZT3bDEOWpDdI+4J4VEEAadS4+B5hAJpfGw40bZxNPZ9Dt/YY8Q/I69bKH4ya3ceUweJIhKR6NEMkSr1l6WZLDjecPtz5fKHUFIzmLyanm8QoboTiKLEP/FAKfyBvxnf3bSqUYmzYLjrt3tLKQ3Eljoyw78/XsqK5xY9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/MSfnGJcu/kLjnadRozK+zk5Rog3z3iMjn6T8MN1wU=;
 b=Ufrzg4wNKtmNz0/s4XWOemO1Q98fm5pODjLhUDca0ALLXAVY9gvb4Ikg23BiF28fhcKC5YMfY7jftDfTr3ik6VgWwHjJRthWQkE28zMFccQ6dgItIfVu3LBaJ0HFur4Yph72HzOeeTVEVBrW+SO7RKfaFl+mXAbqHOk0sA8X801Kjq+KnNaR3mJ5R0+L5qOJ9Ee5Y9maiweTWN6ZueI57CSNtYa/FscHA52uP0tQGxwWAQdmFvMkayT79vPcKmqs7hYANan5loxKvfKVGr4TBb+NGYb0FNMIaiTTlvPATJCS2aX+QtEhgXGmSIm3DYkjRwPHu2h09Yuqjhh9Ytw+mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by MW4PR11MB8291.namprd11.prod.outlook.com (2603:10b6:303:20d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 22:04:09 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8026.014; Thu, 3 Oct 2024
 22:04:05 +0000
Date: Thu, 3 Oct 2024 15:04:03 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] i915/drm_fdinfo: Quiesce GPU prior to running some
 tests
Message-ID: <Zv8U07Er+w3r77bK@orsosgc001>
References: <20241002212049.769042-1-umesh.nerlige.ramappa@intel.com>
 <85ploi6qkc.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <85ploi6qkc.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BY1P220CA0008.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::16) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|MW4PR11MB8291:EE_
X-MS-Office365-Filtering-Correlation-Id: d15c19aa-5d24-4b3f-c9df-08dce3f74bfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VWlYWjZjdDlnbzdyamRRamUwb1R6MkFmaXp6eTg1VXl0TkE1L285RHpNL3Y2?=
 =?utf-8?B?SmM5dnc2L2xhVDVnYkthZkdJN2dnUEkwbXdvQ1ZUUU43V2ttMEtkYW5JbFpF?=
 =?utf-8?B?Vi9pRjJmU2VXdStFNlJWa2Y0TGZNd0k2N1V5MlVmV3RRTSsrazd0enJWa0pM?=
 =?utf-8?B?a2dmWVJ3L2xjbWRhTjJJaHhiUU1lWm92czEremNrMmlLVkd3bXZCcGUzRXJx?=
 =?utf-8?B?MGNGZVJvYWpMYTZYTHgzaE5SRW9Wb3JFZ3FPS2pPVkVTRyt0clVYTmxMVm1M?=
 =?utf-8?B?V29oL1lwWXVCRkl2dHVlVXVlL2tJaFVTbllXYVBtZm1zdEVjS1hoV1RoUnU5?=
 =?utf-8?B?d1JpYy9tQm00VWZreWNNVWx2U1cyMEdPdmxmdUhWRXdmNjNYK3RIbGRyVWV3?=
 =?utf-8?B?aGJYZWlNWUdvYmx3NGxGMDZ6V01IbmhsS205MmZFR2dZaDRxaWJ6UEMxK29L?=
 =?utf-8?B?NUMrUTgweHlMYnk2Q0RhcEdvV1pPcWNjeG9YdlNOMTdYQUdOUzcxL2RXNXFO?=
 =?utf-8?B?Qmc0STAxb1hsRzc5bDQ0WnRVTCtPc3U0aWhRVEJHUVBpaE5XVXdNYy9oUWNM?=
 =?utf-8?B?dkxOL2wzZUdzWGUxTHRXaldNbDRQbDZhWjdoNDZaN3p3V1JoTCtSb0p2ZEE1?=
 =?utf-8?B?R3VKOUJ0MU1hL1ZuTk0rRnRlTHJBMkh1RHVRTzdyRWJYZERXTEJDSU9Rd2t2?=
 =?utf-8?B?UWM1dWxwZ3BSaEIyaEt5VStrYVFDOUl0T25OUFVrMTJERCt1N3ZTTDRpWmFh?=
 =?utf-8?B?TzRQbnJoWXVIYlpTamIvYjhKQ0kvODRqUFJPM1ZGZC9BRFVyS1JoQ3hjV291?=
 =?utf-8?B?ZDRxZkw3WWJ2emtMWkRmNjFnMmpqakNYMWRva3ArSU5Vemxrd0x5OC8vMFVp?=
 =?utf-8?B?L1BiUytEU1BZN0lxZGZVeFM3UkkzdlB6cUc4QWlmakhvU20waUs3cEFFbGVY?=
 =?utf-8?B?dDUyZ1p6RmJqZWhsWEdpL1ZPaUhUSUo0Z2djTHBCY0RJNHRXMkp2NUxRR1o5?=
 =?utf-8?B?Z0JyU2ZuNE03TVAva1c2SVlwcWtvVlY1S0t2aWFEWWRoRE1jRm9OL2JkYXpT?=
 =?utf-8?B?VENsMU51aUs5ZUgyY1NjcTM0K2NBS2NsSkcvRmJNQ0JjV0JNbHE2QUkrTUt3?=
 =?utf-8?B?aXc1SENmbU9xRXRuZkFqdDJLNUVzSUtYMWRtREVIZ0s4REVrQUhvbTlOWnRD?=
 =?utf-8?B?NUxSSDlLb3krVHdKQTJyb2dNd2ZCNVFWcGRPT2xGNW83VnE4azFhcEp4OFBr?=
 =?utf-8?B?ajk4bERidHBDVGpHMVJqMmpZdko2ZVZKZHhGMmhSVTV5bGFiNWQzVXI1MHBo?=
 =?utf-8?B?cnhoRVNDV2oxY0dsRjBVMlYrSkRXdTN1VmppdTBXN0d2UGNDTC9JUEJ2K3N0?=
 =?utf-8?B?RGIySEhNUStHcHg0ZzZJaVdvUnBlaGxTaEtsZ0JQZGRrQTVwL2hqZlBJZnpH?=
 =?utf-8?B?Zm4xVndzdU5BTThXQ05aRkhZR2VVYVgyRHJLWlpxL2E5OVZtMTM1VUlYZDgr?=
 =?utf-8?B?djJiby9GekJzdEN0VWFMUzNseXVMUzFFSlJyTks4cVNjeVB1L20yNllwQnpm?=
 =?utf-8?B?QVFRdy81WTM3NTVheXJJcUU5ditlMXcyTTh6LzEyRHlmTG44VVBTa3IyYzkw?=
 =?utf-8?Q?W14SmmWQUbDfcbEx1kpI2NuYrDo9tPX/s+Z6H2LJ41fY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEdPWlpkS1ZRTFlzWlJrRUc2c0x2ZGNXZitobHhoRmpFb0FZNVZXNmNOWXlx?=
 =?utf-8?B?VzZOWWJabHFITS9xdGFYYVE3VmNFcmRnd2tSMDZBVTNFR1ZURWFhc0wySkVq?=
 =?utf-8?B?WTdwVlpMRXJMM0U2MGRKUnVGUnFrSEVHUUhhYnFVbmw3VDh4aXR3M2poYVRn?=
 =?utf-8?B?Mm9ZeDA2aElQcEdxMXVubDBiYzNEL05tNUpQMW04NUZhQ05OT25DcjZMTUhz?=
 =?utf-8?B?RHhOOHI3aERqNGx2dnBCeGQ4TUF2eThkdjNtVjFoMGxYcEFiYUhmTS9nV0Zz?=
 =?utf-8?B?d0ErUWZRZG5GTExjZDdSd2tIdmZIM0g4TVhRWkJXRFUxb2ZJRFgrY21rcENI?=
 =?utf-8?B?dGhhYnJveWpmWWNRTzV6azNXNTlNN2ZIU2VBeUtBVUo1NjFzNzNvbkwzd2dn?=
 =?utf-8?B?TUlzemQxMlhZb1JoaDBzVUtVbHZyWXBmTnYyY1Nsc1NnYmRmQ1lWSlJYdWdX?=
 =?utf-8?B?eXNmbmxtSHYrOXNHSFdld1Vid3NPT2x5RTMrY0ppZmIrekZKdGRpNU5FVHc3?=
 =?utf-8?B?OEFmWVVXRDJXTklSbnZ4NTVJaFgrZ1IyeEhRUTBFOFVCWTQyWEVRRFhqb1hm?=
 =?utf-8?B?ZFd1RHFKTTlFQ2tzOEhPampWOE9JQzhFQjVRTzJPTlh5dlJoYU5DVWlTbFhF?=
 =?utf-8?B?M3JqclA5SGg5MDJmOUsrcXkzNzI1N0ViWFZIUWlqNUVSRUlHUjdFOTBDQ2pV?=
 =?utf-8?B?UUk3QW40cGYwTlJiMzZMVExnR00waDlhOXhBbzM1LzNHNjVybE52OU1obU4x?=
 =?utf-8?B?Q1dPRXpvSW04NzQ3eFFwL3Y3NXU5TmhGcXZzZktsZ0tLbXMxWW5ybE4yRWdS?=
 =?utf-8?B?MjdQdjBtV05GbDV5RC90dlNZeWl3MndnaG15RHk4VHhlMy9HTFo5dm1DMG0y?=
 =?utf-8?B?QXI3OTVIVndLRjJodHVuSUJQcWxDbW0zM2d3SXd1cnIva2RaL0xEVzk1aGdR?=
 =?utf-8?B?QXZ4bHh5RHhrUVVwRFlwdXFGMDV3bk1tVVR2M2VZUG02ZldPTU1SRWVoOVJt?=
 =?utf-8?B?SCtmOFZBaVgyam0xTjZnUDFIWlFtOUk0NFRQMC8yMXBXQkN6eCs4VVBZZUUy?=
 =?utf-8?B?MmlkV0UzVFFTYnhFandKMG0yWDVacVFNR1NGcHRyejA0bjZUdHhnRUFybTFz?=
 =?utf-8?B?cmxPUFhGZDJ0Q3p1MFhSQjFCK2NXd1pkTFZRYVhqRlJBTUliRUtEQjkyRHRh?=
 =?utf-8?B?NS82ZWJ1T0lxSlliMUNqcGwyU3pYVlUrU2JZdlQwVGVqeWlFQU8xUmdpZ1Jj?=
 =?utf-8?B?bVhtaEhodU4yTzV3UTJYcXUzTElLb3ZqdERtVmNlQ28zejE4TEFMbGhTZEUr?=
 =?utf-8?B?N0NvN3NielZSckE2M0RGQWhETmJWQVZTUEhNMTJQZVRHSWtjalA3S1BSQlBm?=
 =?utf-8?B?NWFWOXhSU0w4aHhzdmRWT1RtWE92Q29Fem44MFEwYlAwYkdNZjRmY1NKTTY3?=
 =?utf-8?B?Z0w3OVpRRHh0NzFUWWlDVVFMRnJ6b3M2Y1JVUWtyS0gzQ3pJY3BwdkpDTldm?=
 =?utf-8?B?Q0dXTDNwSlF5MTZpNnZWdWtVUEZqTHVHTnBuS3R0WC9mUEJTbHRoVi9HQVBl?=
 =?utf-8?B?TlBDR05ZK2E2Sk1ycnJ2V1JUcjUrcGJkeXJGZ0RhV2hkT2grUkRDTEN4V0VU?=
 =?utf-8?B?SUkxb1JPSmNIVTlaWVM0K0x1bkozcnpqdnhvNTU0VldJczc1MENVeHVZQWJP?=
 =?utf-8?B?bkl4dG1kZkZhMGFjK2hISFVBZEljbmh2enJHd0ZwblhSUjJlMDRleGNkODFj?=
 =?utf-8?B?L202QnF2Y3hHWEhqeVZOajJyWm1xT1NNYWhpaHRTZzA2QXVhWWZYY1NmeGla?=
 =?utf-8?B?cFUvdUFLSVpzUWUxazVHL3dmYnRMRk1SUEhOcHpZVW1QLzBjMkNOTk8ySStm?=
 =?utf-8?B?d0lHZU8rYnNMRXJTb1lwM1o1UHVvVUxmcDRic0h3dHlnOENFbHE1Y3hwMzBi?=
 =?utf-8?B?eGs2T1pJNWdPalJiNDYyQUFWdGwwZ1NoZzZ2OFo4T1dxandDdHRkZ29taVY0?=
 =?utf-8?B?ekdiQTlhdkZtUDBQdTNWSVNoTytUbmlQRS9rYlovbTd0ckJMeEU1MTNiWG1r?=
 =?utf-8?B?azhkYTZxb1RlVysxRXB4cFo0c1lKMmR4MzF4anZaYnI2TTRDN0l1SFV4bXJG?=
 =?utf-8?B?YTQ3bnBOR0JsSy9RUTREcnd6bFp5RmV2cktORlYyR0ZqSGZqcUlBYmVuL1gw?=
 =?utf-8?Q?Bcwt6G3osFNg9oT8+W4l1e4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d15c19aa-5d24-4b3f-c9df-08dce3f74bfe
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 22:04:05.2305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y/4tGC0c6laY3s7nb/R87yVA1gPixcOUycJdxZlzyCT15ewyABzOwzzGvbykhmxzVISv5zMYeP/cwl6Y4DpuxsyvZ0HwWVgNeUkFZNOOkOU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8291
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

On Wed, Oct 02, 2024 at 04:19:31PM -0700, Dixit, Ashutosh wrote:
>On Wed, 02 Oct 2024 14:20:49 -0700, Umesh Nerlige Ramappa wrote:
>>
>> Sometimes render is still running a remnant of a prior workload when we
>> expect it to be idle. This throws some tests off. Ensure that these
>> tests wait for a quiescent state prior to checking if render is idle.
>>
>> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12179
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>
>Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Thanks

>
>Not related to this patch but little bit confusing, since I thought
>drm_fdinfo is driver/vendor agnostic. But this file is i915 specific?
>Should probably be named i915_fdinfo.c? Or if it's in intel/ directory
>should at least probably work for both i195 and xe? Anyway.

It was supposed to be driver agnostic, but interface changed for xe 
since we added 2 counters per class to indicate utilization (also units 
changed), so there is xe_drm_fdinfo.c in the tests/intel folder.

The driver/vendor-agnostic part of this feature is included as a tool 
- tools/gputop.c which can be used by other vendors too.

Regards,
Umesh
