Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E80CED62A
	for <igt-dev@archiver.kernel.org>; Wed,  9 Oct 2024 08:28:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB6F010E686;
	Wed,  9 Oct 2024 08:28:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ad7oyexJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B972110E686
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Oct 2024 08:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728462480; x=1759998480;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=rdLnwd0uKaG4liW1PE+PZmRitF2Y2GJNemVWJ0LElBQ=;
 b=ad7oyexJ26mWDxNB/M5loqfJ9uD5o3b4m4zSj4d90A3joOeyxxwFM44a
 J5kSxTlQ1GaZjKNsxDn522OOP7UUHUYEqgYLc4n506YCcsIPxzRxUtNIc
 YznnB3TIIlKOTedkiaa5QBpDF7Zmltei2qKyjr4scdWjqPOe4Dzh14htx
 1s4stIdUWrZpotLJjMFXen4wohOyyIUkSQdtpq0X3OEDFYHQXlAh76slk
 90XuVCsrcWgUISH9QobncPsGfbeoFPHJAAh2uGjzi2Ck7c3hDrrlp0fSy
 V41HCIl1cXnqiHKG5PnSCB/Bjt/vtn6k8OT9h90MJVvR73NlWUENIafC5 g==;
X-CSE-ConnectionGUID: GB7ffPhCRQOecfpj16CW9Q==
X-CSE-MsgGUID: NoUzeZQ1TlS2LsnAbb4UEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="39101398"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="39101398"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 01:27:59 -0700
X-CSE-ConnectionGUID: Ypg45ocVRj6KYnGl3C9kYQ==
X-CSE-MsgGUID: ZTgP9/SFQyaAeFv7iTgFPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="113662410"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2024 01:27:59 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 01:27:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 01:27:58 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 9 Oct 2024 01:27:58 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 01:27:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hxKXsHBcOvzDpyVOH5MW0wKc9jvGUhTC3u0eV2vHf01rLyTm00GCTCpXDPKk+DakdkbJul2uEWYL7MRtXeA2lm5S4bXGuP1Q47zTRY6rH0/46sdoAQ1/Gp0v0PKZIRiCkjYFH177V2lWUh0I9r73y5hQ1dlypjTzARN16Ux9NjU8zHs+MQGaXnsNB0JZPVYhDzo3wwIAQ5GBc6odIeULpA8lDqM9RO0nOcdE9MoI8uQclIE0qHKlGlmrNMEB2vvINHXXym2vcTnciF41koDb+yUBgIeH417vtt3V0ni28jciyhWXRkNsgA/8uwSNr8pgRH9Ni+knOWBZuTu0K9b4Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NcsdO0yUgyN6P+DaZKSGPYYzfmUw2jlzUdQHoA6fC3k=;
 b=lpK7bGFjWOmqIh16fDda92aj7D+/3JJ4JGGo8iLX2cRviDPjtqRE+fr2VqcIy4oENXUQJE9dW7i9t26odI4teW4Z9Cm2MEybKtjbyx60mdpG9WGXNp6cy5GB8dfnyyW/eQ67QojWVSfLy6KjqbhToaxG+A+obwNWSt79JHjHwQuoOHEpdY/zqDJ4j5KdrMLvba7Sd5IQWoy3lnXo5VKP4rCTDVMrbdsBc535hKcbd+MxytCpwM23ZtX/g6J9BTr2tnKefUEjYqLqAKw1wzTB0MX//K1oS3Kn/VIxacm4/JVaJQz05JhDBbhaADKaBHwKe/jI032zQO3n0iQYtnsvtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by CH3PR11MB7250.namprd11.prod.outlook.com (2603:10b6:610:149::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Wed, 9 Oct
 2024 08:27:56 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695%5]) with mapi id 15.20.8026.020; Wed, 9 Oct 2024
 08:27:56 +0000
Date: Wed, 9 Oct 2024 10:27:51 +0200
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmbw==?= =?utf-8?Q?r?=
 tests/syncobj_timeline: Update invalid-wait-zero-handles test
Message-ID: <nbtzcqkxonzyvtbrejxsjgqncugihn5wuaihzc3o2nxfi4l2f3@ijasmzy7jzhd>
References: <20241007102611.23544-2-krzysztof.niemiec@intel.com>
 <172840618165.1204975.2490725611636979414@2413ebb6fbb6>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <172840618165.1204975.2490725611636979414@2413ebb6fbb6>
X-ClientProxiedBy: MI2P293CA0015.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::9) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|CH3PR11MB7250:EE_
X-MS-Office365-Filtering-Correlation-Id: f8a04631-9748-4620-37e1-08dce83c46ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RVdOMUpUN1BvWTdERzdLVnpUYVdzcXRuVHBTL1o5L3dBc1FSbHhIaEdodktt?=
 =?utf-8?B?cVhYUk9xOXZVWjFFcFJ3RzRNaWlXR2dqNmdkaDB6UHo0cFFiSDdpNWhycWRy?=
 =?utf-8?B?dzVvY2VFT0lPWHpoeEpKdDhtVUp1NjR4TzIrSzJZQlJsd0I3NXZJVFExT1ha?=
 =?utf-8?B?UnZTWVVHSkFleWFnbXFJQXZrSHpndTdXSFdIVW1uM1dLRVdPejlIYmhVTk5C?=
 =?utf-8?B?VTJkSzYyTEJRZjdnZEJqYW1kdkhQSDNCR05QMCtQUzl2OEdPSy9JTkJOZjV0?=
 =?utf-8?B?ZWVaVVEvZGlJRytLeVcxZXhaMXJMYU1FSlY2YjlnTEZMaFpEc3J0S25wSHdN?=
 =?utf-8?B?YjJ2eUJqYzdjdC9EWGNxTEtUdlhjQkNaRUt3am8yZVBFcUYxY0Z1cm1GUXg1?=
 =?utf-8?B?ckxXWkZ3dEJ1TzM1cm5iY0dFT0sxYVB3bER2YklNQXZYRmlwVHBBM09GcEo3?=
 =?utf-8?B?NDhTa0xZUlR6aENUeDdVZ3VRcE9mbS84V2Jkb3dybVYyeWpvSDNFZ2hxbE5X?=
 =?utf-8?B?a3ViMVdxNlpMb3ZKd2pIenBNZGR1WHh5VlJjUDcydCtjRElKM3ZwT2tBSTZj?=
 =?utf-8?B?YmlCN042OVpWQm5rbVhsU1pFbHZNcXJ2eGJ6dWZGMHRwM2YyOE1nNXRoeEVn?=
 =?utf-8?B?dXQwbkZHeURVYklJcjR0cjE4SWgzZ01aOTJJZFI2d1ZUMXJNdWczcnNZY0Jw?=
 =?utf-8?B?V24wMzVEaVg4OGR0UDBNaU5wWXQ3bk40N2JLNXppNGkwN2VsaWNZRm45QXRa?=
 =?utf-8?B?YUo1QWdoenBuRGhyVW9vU05uM2FrbGo4RFBFamNXZVN1ZHVyQnpyanMxV1Fy?=
 =?utf-8?B?cFVUSERCZHdtRnErQkUrNmdhYWF6OEZtaHM0VkVyeWFZdUpSMzlvb3NOWEti?=
 =?utf-8?B?QXNPbEY0OEI2OFlUV2k3alo4V3ZXaFNTd1ZGdXhGdzUyaGl6UkJxTG1mblNV?=
 =?utf-8?B?YTJ3WjgvZVp0aE1nVk40TVE0K2hYUTF0Y0NvN3NHenVwbUxKSDEzMExQR3Bj?=
 =?utf-8?B?UXBaUkQyK0ZlTzhuenp5aXU2NnR5bTlOTmM1S1lsRTNRMzhkeHkxdzJ1ZlJx?=
 =?utf-8?B?M1hNeE5teUZkTWZHbjM5eTBveENrTUNrSkJHK3gvSVdScWk3U2R4b1BoUS9G?=
 =?utf-8?B?QTl5TEhBSVpHRUdvVzgzSDJHTkVQNWV3UnU4dHc2c3FLT2RqUEI0Rjl5cU1I?=
 =?utf-8?B?NjZhTWRuZVFrZHQ2emFaSkhldnVIdGllRFkzWncrRmRVbHp3VU5RS203UGkw?=
 =?utf-8?B?WlJtYytRRGc2cThldDdjcWdVaEVvWGtBazBkNURKallhbmx3U3M0MDFtWGFX?=
 =?utf-8?B?TDY2a1Q4NVp6M3N0NWRBOUJXb1dxdW9uMFYzOGc3V3BHSENoSFpxT0g3UnV0?=
 =?utf-8?B?Nk5CWXZHNElTc3YzeDhsZ0gyaUJ5QzYxQ2QxaUNvcFRXQ0JxU0dnNWg1MUlQ?=
 =?utf-8?B?YW5IcEtYWmkrUTdvNUVIQWdMWVJ4eVkwNitQTktZNWx6ZEpYQmpENGZZN3pC?=
 =?utf-8?B?a1ZVeGFQd1BCSmU4SnBGTHdKWE4xL25USVZIcGJqSmlUTUwzQTUvb2c5WGhn?=
 =?utf-8?B?eExCZk1SNDJzOUxFakdqMEVFdVZDYU1hZ1pkNncxdEh4ekpnTTFoSEF5R1VF?=
 =?utf-8?Q?77L7FpAxvcyLHuSTbY28x2nKjwlKEaQXFDa1sjKkfxYI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDMrS0R4N1N6c3h1aHBsZFJISFdnUnVNdlR2b2Rvbm9FNGF5NHVtTDQ2YXo1?=
 =?utf-8?B?Wi9FSllCb0ZRa3VTN1FzMVJiYlhaWWpQYTl5ZmFwcjNYWkp4MEgya1lsZkkv?=
 =?utf-8?B?cHVLSGtZWFJ0NXgrSUJORlBCd2lib0ttSE9LVktmVWJaVDBxMzNMY0R0akVt?=
 =?utf-8?B?eHdEem4vUmdFK2t2NzNtMmpBZjZoYVRWcWU4aTcrajl6YlE5M2c2MU5VRENl?=
 =?utf-8?B?UUJ2NWY4cHRQMDBORUpiRlI5d0NnZXhOMCtDaWJIRzdLbEFHaTRNQ2FnTDdp?=
 =?utf-8?B?WHYvSkNpWWR3d3NGNHhJbGVvTHBwcFZ1YkVnMVVKKzVXVDhxMkFGdUxnbHFY?=
 =?utf-8?B?SFBna0tibGZHU0F3ZzFFUlYzSjNzQmpFSHlsL2FjbDhBOGYyZFB0Q1BScUs5?=
 =?utf-8?B?YnBLTThQcTdNYURwd3ZURUxsMXM4SFZnbEc3TG1OOE03RjhXZWxTbVZwc3J1?=
 =?utf-8?B?TkVXdno5Vm9uY2FFSTRZNFdmNDZCOGN2TDBWYzZwanJtZkIyenhiczhTanRB?=
 =?utf-8?B?clVIK2Y0NHVJOVdSNlJyNGNMQWlFYU54Vyt1QjI1MlhSbkJ6dnE4NnBaNTlL?=
 =?utf-8?B?SjdMRC8rekp1M2pBcDBCL1c1ZUtwYy85SmE0SVRUazlHMVRNTzhiRzJUM3o4?=
 =?utf-8?B?WU1zbEJQNlZSeFF0QVJ4aTU2Y01COVBNS2xTL2tCYXNUOWRtTTA2TklkYWJq?=
 =?utf-8?B?UTdqYzNXYzNLWEtBWXViNWNOUHV2T1pHSHJoWTZEWldGclZmaWU3OEhLQVFx?=
 =?utf-8?B?NVkwL1dXVm8zMVJkZ3NHUXd4WXZRSFNrNUppUGxWckZKQWxwbjA4Z1FBbWNI?=
 =?utf-8?B?eVAvTUlqU2J1dG5vU3N0Y0JLT1k4OGQ5dnNZR1h3SVdDVDliNzV3dWF6VE53?=
 =?utf-8?B?KzFSZVFHZzZ3WlZyWlk5M2M3ZnY1MUQzNUw5ZGkvMDdOVnoyY0lKRlV1TnpZ?=
 =?utf-8?B?NHFKTHhTQkdpWjNNUkVUeHB6Q2pCU1hIcTZ1b24zWEFmcnU4Q29pN0dUc2g1?=
 =?utf-8?B?Qm9VeWRlMmw1M1hid0wyc2JMa1VBTkdYSXdOQ0lkRHduamxuSlJCNWxYL3Ay?=
 =?utf-8?B?Zyt2QVFsUXhvSkN5MGdTeHFta3VkWXJicjNadWJHeEJlMDRhVzA2anl1S1Yz?=
 =?utf-8?B?R2lKLy96RWhrVzRoWTRjK09KYU0zZTc4YkdiKzZLM3Y4Uyt3b0lvM1dMRUtS?=
 =?utf-8?B?ekprTDZaMU1OVFNzYy95M25UZmcvelN0OUp1NllsYVBCR3VadW0vVTJMZTh1?=
 =?utf-8?B?MVI1NmQ5RFZ2TC9pK0VPRTNVUEUwVWtZNHU1SFRqM0R2NWp1TlFZUEZvTVFq?=
 =?utf-8?B?bGpES05MZy9paGhId2hIWUpkcExUSWdldjgxZEhzbER4T3J4TmMxWWRNVnhD?=
 =?utf-8?B?eCt6c3l6V3liNGxwc0ZtdWlXWWxrYktzckc4MU5idUNuYWY3dWI5eFVrbURr?=
 =?utf-8?B?dlZReHVkZzd6d2JOZzlTVGg1NGpRREthSHNvV05iV2gvS1hYME5hUkx2dXR3?=
 =?utf-8?B?b3ZNb3ovSzhiUm5VTE96UkcybWR2UHpvR203bmFkVnBvZWVhdXl6ditZRXVG?=
 =?utf-8?B?NENMTWtGdlNnei82U2JibVJHbytkYU5qQXZWZGtBdC9mWFQ1T05nM3RzNlpB?=
 =?utf-8?B?cmw5WnBKNDlDL2k2WEVJUFJRNXE2RWozb2RuK0hYMUV3YTJQU3QzbUIvMDZS?=
 =?utf-8?B?dDFhUCt6Y0lXT3JVbXltcTRqb3lwQ1RKZ0Z0V3Ryd1FQT3Z2R3pzUnpJYnJ0?=
 =?utf-8?B?Q1ZJdGtIZ1JsTktVRnNyUTZnbmloT1A5NkZBVkRyTzJpVFUzdk8vM0NxTEpl?=
 =?utf-8?B?MXBnbVZuQy9ENmxPdE5KbnhoVjByRG82d2RydkwvN1RlZVVqWnRHbXlPOEJw?=
 =?utf-8?B?N0E0Zkw4MjVRdkgvTnJ2dkNXQ0d3T1hTZ0Y2WGp0TVI0WlNYQ2VQK0FON0Fs?=
 =?utf-8?B?R21WVmYwS0wvbHQxSk5XK2FQdzI5Rko5QWtSanBrV2lISHY2VThuRXNLeG9P?=
 =?utf-8?B?N002K0ZaOThOeWNuMjhlV2VIS2VzUXhHdUpLbjhhZGdVRHFUaFRWc1dRTGNk?=
 =?utf-8?B?RWJqRW44dndmSStZTUtRV2dKQy9SSzNsYXNMNDUyUG14c0dmaGx2L1ppNVQr?=
 =?utf-8?B?UnNvV0xTTmFrYXNYVUxXcWRRNDZnUU5qWWg3UkkwRjQ2NWZzZ2t3YVY1MjRi?=
 =?utf-8?B?enc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f8a04631-9748-4620-37e1-08dce83c46ed
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 08:27:56.9009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DgQ1EtUjt6n3pMoGhOxrZ0nQTGmQq/htt+ELc/N2NppQ8NxlNrcqujHhymCllUnEHRhZAKO2MYvXf37O2W97MOVsn6vSR/GtNL2Ee4P2kXM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7250
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

On 2024-10-08 at 16:49:41 GMT, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/syncobj_timeline: Update invalid-wait-zero-handles test
> URL   : https://patchwork.freedesktop.org/series/139622/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_15485_full -> IGTPW_11877_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11877_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11877_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11877/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   Additional (1): shard-snb-0 
>   Missing    (1): shard-glk 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11877_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_lmem_swapping@parallel-random-engines:
>     - shard-dg1:          NOTRUN -> [INCOMPLETE][1] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11877/shard-dg1-14/igt@gem_lmem_swapping@parallel-random-engines.html
> 
>   * igt@i915_selftest@live:
>     - shard-snb:          NOTRUN -> [ABORT][2]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11877/shard-snb4/igt@i915_selftest@live.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>     - shard-snb:          [PASS][3] -> [FAIL][4] +1 other test fail
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-snb6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11877/shard-snb7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_15485_full and IGTPW_11877_full:
> 
> ### New IGT tests (1) ###
> 
>   * igt@syncobj_timeline@wait-zero-handles:
>     - Statuses : 4 pass(s)
>     - Exec time: [0.0] s
> 
>   
> 

Regressions unrelated, new test passes.

Thanks
Krzysztof

> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11877_full that come from known issues:
> 

(snip)

> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11877/index.html
