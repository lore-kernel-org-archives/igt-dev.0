Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CEFEC677C4
	for <igt-dev@archiver.kernel.org>; Wed, 11 Jun 2025 07:25:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABAB210E2D9;
	Wed, 11 Jun 2025 07:24:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K67T5UWt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BC7F10E35B
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jun 2025 07:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749626698; x=1781162698;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xMmDkjXxVVbgtaAzyKzE/ovEvBVOFwE0pbmPX4ZU50A=;
 b=K67T5UWttxkzCzkQ13nYJEKlot1byh6g49s7bG/3cGTH1ihu1JsQxvzJ
 4N8m+s9tlZkLyvRkchulHibWhhp5OsA4cn0k0SjyPIhpYuOzALqlldTHQ
 vVbR4ZSQdK0XjqZLwbgHZ5wO759Xs2fiG4kwcPV007b+ynqNvQq+kl/Dd
 Vruz42ZoB3b0cJE6I2bxHtI70/DHfKnutz4v2Pg60byu+sU4ye+UfAxTb
 OiCzYCB3dZcINi3h5CawRzTLqEtZkTJTNao27acQdTS8NvMLVkqVJq5Df
 OhIfck4zOKLt2kXLucarg5LNgts9duOPzev8H3nCpcrrEd8B1GYUeJPAZ A==;
X-CSE-ConnectionGUID: b1M1bs0sQQC5imnAxXXqig==
X-CSE-MsgGUID: fsp9Q9b+SIqzFp++nMWRtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51469508"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="51469508"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 00:24:57 -0700
X-CSE-ConnectionGUID: 7Br/zzx1RkiBzxDqGAzPtg==
X-CSE-MsgGUID: a95cY06rQo+eaFlrNRyPEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="146991494"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 00:24:57 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 00:24:56 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 00:24:56 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.84)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 00:24:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aqEWhIZ5K4lhRKAGIUQZxO7sbGx4+8mzsPxbOYyHu0XBu5p5SsCUQQYhAniRvRy3kgrbsQZ/P3m0o8hJQWwFTL6BG3s39E74zM+Az3hg1VGZP6DoKcQMKsYLywRcTGsrKtAC7wfVL1GOL6f2sXdsdkAKsUxbJQFe8/cKHuEtQYq9xydA0RBeUOvnUJglz7Kkqc2mC+cU9ftPEKsp97/qagxVHsg797RFjJRJ49WWu2NSimzpLyZy3QwqVduQqp8psdyx+C38aH1pnJ0t7pci/umkVxSMM2p86F8ditNlQi5u+ZhZinonZBxI9rgPGIDiGbcmwx9ZddLDcSAHFdgmZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oDHXfw4neoZMjrtlntgi5pRzmPgUeawqvsWN6H1M7ds=;
 b=As1noLHNYj38oK/Sd6xPvaYqPxIurVhkajA/b3unN1vNLPs03CbOpR1Av4T9+7F9aBHGCHW1HeiZtMDQiC5wc6eOkCI3gFkVmy8L74bQb/igt/C3d8zmTIaT9SKeOhT0anEEutgAraCFJG78pRxsfWE04gXyNw137yOhx88EV1sdZ3yaaCv6AQ62DF/KQByhhjlOgxHfNkNjRjdpH0+Vj8I388PF76AMAEeBfsQACncz+JaC+gxD3qv0EFvsmr6HnVG9ynmRsN7fogSMBxdmDm+/65Uabb7q9gqboBUyXJuisdxU1j8Z2tIHkth+hmi8DzRV+qXdUu4GyZqZyXCy3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH7PR11MB7028.namprd11.prod.outlook.com (2603:10b6:510:20b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Wed, 11 Jun
 2025 07:24:40 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8813.024; Wed, 11 Jun 2025
 07:24:40 +0000
Message-ID: <757b2b83-d2bb-40d6-abc7-4868c62f7c86@intel.com>
Date: Wed, 11 Jun 2025 12:54:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v11 5/5] tools/gputop/gputop: Enable support for
 multiple GPUs and instances
To: "Purkait, Soham" <soham.purkait@intel.com>,
 <igt-dev@lists.freedesktop.org>, <vinay.belgaumkar@intel.com>,
 <kamil.konieczny@intel.com>, <krzysztof.karas@intel.com>,
 <zbigniew.kempczynski@intel.com>
CC: <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>, <ashutosh.dixit@intel.com>
References: <20250522154447.496407-1-soham.purkait@intel.com>
 <20250522154447.496407-6-soham.purkait@intel.com>
 <4c11b2be-ccc9-4cff-a389-8c908f6ee64f@intel.com>
 <9bc6c66f-8f13-4542-ad8d-c6ffdc6e8966@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <9bc6c66f-8f13-4542-ad8d-c6ffdc6e8966@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0078.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::20) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH7PR11MB7028:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e70f09b-f1b0-4a26-c245-08dda8b906ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?REZVM2JPT3VOUDhzWURRMnF2SUpjN2hSZWh6NHQ5eXBQSFhpelYrUVgxTTNO?=
 =?utf-8?B?dG0xR1BzY3NBV0liazNJQzBiNXZRL0RaTUk3SlRvTWlCdXBWc0p3UU5mVnpU?=
 =?utf-8?B?K3JiOFJzRGtrc0ZIUXB1SnVNM280TkR1MnVFMDVvRmNja2JLVExlZ0hFMExu?=
 =?utf-8?B?clFyR3UyVmh6d2gvR2ZCQVFneTNPcUw2QWRYTGxxTi81SHBiTTJaNUVRVDJ0?=
 =?utf-8?B?QzJkOGFjVjh2WElIODBZUlJaNFVqM2EwRE9NamhRTFYrdG5qSG5jR1U0dVBN?=
 =?utf-8?B?ODJ3MWdlZzVZRnJMWm5QeEZkV2lyMk1JcnZ1b2xheGZrU0ZXWFlSd1VVdGY3?=
 =?utf-8?B?a3BVMnhRT3czWisvbVJMd3Z3SXJ3emFaeDlteVpJd0FUUnNOYjJ6S0wxdUZ5?=
 =?utf-8?B?dkZ3Sm1iU0ZkVXVobjErNWwrNy9Qek1kZzRtdFJDOVJHODNpRENxa0UyQ2Fo?=
 =?utf-8?B?d3VaclJIYnVzdFZOKzM5Y2NEbExiQkVCdTNFekgrb282aVk0VFdTSnJqM2NF?=
 =?utf-8?B?MmdTaWFKL09yWnVGWTVGYU1LU3lER2IvTVh2dXBzU3JqblRNZXIzV3RIN1FT?=
 =?utf-8?B?Yjc2Z2d6alI0THl6S3ZPTXNIZGpscS9lNGk5WERoY1M0cVhVdVFRWXNGd0FR?=
 =?utf-8?B?NVFkcEhSVFpyZ3ZrdW9qaFVXWFRkYTVlUzJUTzVmNTBySmxQU1MraWxQWEZJ?=
 =?utf-8?B?b3Z4L1crKzRIRWtnUkpjckRua2g0cGxGZzBrUThzNTY1UWZsTkZsenU0QXY0?=
 =?utf-8?B?UWRxNGRWazZYdEFvNE9lbjBsVGJQYThmTmgyNzlOWUFXa3JRazhCSy9kTkxm?=
 =?utf-8?B?bHoyZUlsRkoxWWtZdkNyTGNVdlRnNnIyRlF1alVhN0JEWVhJQ3cwbjZyb2FR?=
 =?utf-8?B?V1diZmhOaGRrek14WE41NFBHalBSQkR2Y01jcWxSWElxa0VWYTNEalZnM2lS?=
 =?utf-8?B?a2xUcGVDNyt6d0NlWElvL2JVampzSmV0NzMrVFhUM3JEMW9RaTlXdEZMRmJL?=
 =?utf-8?B?WTJrZjlaVjZDUERCbndiaXpFTE1vSS9ReFp6QzRmamdHbERVVHVBL2dPaWEv?=
 =?utf-8?B?d2NhKzlXeVRSVVVPZm54a3YzNGJtQkpPbVVtbGt3NGxwKzBkUkpSYVVOeUNW?=
 =?utf-8?B?VXdtWFJjN01lR003d1YyVUY3dnRZRW1GckFvNzkvOGd1VFZONDB4dnY0VzQw?=
 =?utf-8?B?T1pqY3d6WUNIcFpvTndHN3k5L1J0TkZiNFJoR2xHeEg1ZWIvTlVJYmJ5blBu?=
 =?utf-8?B?WHlZS1hYV0I4eHFqempVT09KU3Q2clM4SnQrQS9DZ2g2TlRVb2ZkMDZwZEVT?=
 =?utf-8?B?eDU0TGFLMkR5UW0yZ2ZwTW5zb1dCZFV4Y2FXRS9uUHFIVzJrVnFKN0pvd0Ru?=
 =?utf-8?B?QXVncDdVQWFkTmdtWlpRditSSU52bUpBV0h6QjR5Uis0aTUrazVwTHFZcTNQ?=
 =?utf-8?B?TnJtM0daQzJHWjdGY1RMcXB0cUN3QTFQYlh0VDVybnFtNVl2dmdaUTBCR3hO?=
 =?utf-8?B?QzAxYTZuRHJjWnQvMXZCKy9ZR0VlN3JLcGJiU2l0S2lGUjF3M2J3dnlleGp0?=
 =?utf-8?B?TEZFUVFRRVBHbzd0QWlWdFZ3T3VBRTBTb2gweHZPdzlnSzJNdnBaaERZZGh0?=
 =?utf-8?B?em92TXhRN2JVMTR6VDJsRnR3Z0gybjZNQWlqRGVvcGFUS2h3ejFJZGRLYzhX?=
 =?utf-8?B?VGREb3c2VHY1YTgyTE9ZQjc5WEFVd2NVMWd1eDdOY01qY2trZHJ0OUlLQjFU?=
 =?utf-8?B?L1AzUkI2R2VXRmhndHF2YVBTUklOUWx0d1FOWTVyNkpic081Zm5ZYVhEZ3pL?=
 =?utf-8?B?c0ZUTysvWmtJQ3JjeWpaQVMwYkRjVXJISzdjaWV1d1NzU1lMZVVYT05XY1Yr?=
 =?utf-8?B?WTBJcDArNHU1c0VvdkxlTmtKbktKTTU5V3JhKzM4VnlsTk9CSisraXpFZ3NK?=
 =?utf-8?Q?1sDRL8PVJoA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFdJa1l0YVF0L1pVRE1YRmZ3TllDdVR6VXVoY0VkaWs5UGx1dlFGV2ZJSTZj?=
 =?utf-8?B?THVZdUN5OVgxWEoxRlBsWk84RW1OSDZmcWpSNEw1ZmlRRms0V2I4VStjaytC?=
 =?utf-8?B?YUVzdWVqRjcyb2pISkJ1Q0dhcW5NZTUxTCtxbjVtUlh6K2QrU1FRQUllQms2?=
 =?utf-8?B?UGNkZitlaFdmVzBTK2cvUEZuQ3QvNHJEUStGREs1VEUrQjZIZGlNS0srYzJv?=
 =?utf-8?B?dTdSa29Pd3Arc1RUcWR2ODd6MFc4LzZpZ1dYUUI0UkR4Ui9qT0djOGRhbkJP?=
 =?utf-8?B?RENGcDJITldqaWpzMU1hdVZEYnYwRzBLZmVQNmpQTmE0TEhJcEw2WnpCbVRU?=
 =?utf-8?B?bDZxN2cvc0xjUnY0WXozd2JzeHZ2VUNpWE1iNkY0anpNWHE5dDcxcmt4L0Ju?=
 =?utf-8?B?MnN3QVRRSEpIby9nSFZJbnkzSzhLYWpsVGg0OWpGRkw0S1BocnBVNVlwQldn?=
 =?utf-8?B?R0lvZUJiTzR1TGZNWG5qWWVKODIrS0JTbHlrYUpQRng1RkdmL1dVd3J4OC8x?=
 =?utf-8?B?Umxjd2FVSUowYnlSQjRhVTNXbW12dzd3enovc3RIM2Y2K3oxT1F3amNNNzlt?=
 =?utf-8?B?SkZQaUtCT24rWC9Ec1JjMGFneE1MTW1aaHhnRThIZGpLYUJLRHlmMkd0Unph?=
 =?utf-8?B?RTRkNXd2eUxHejhVRVdTOHcwMXZUWmhSNFVPc093a3dudndNNWM0cVRNOUE5?=
 =?utf-8?B?UnRKNzFjd09XTDk2bmlDNktFdytnYkdhZGpjQ1RETUdTMW4xeWVQYlFKWith?=
 =?utf-8?B?anZyQVhSSHVSbHVzd1BnMko3OVRLZHJMdXpCU1dOVHRkUVpyVzdReUJaZ1JM?=
 =?utf-8?B?V2dsNlZRZ0RhdVdWUGNHR1RYYkloY0xyTFY0TllWbk04amVTV2lucWN2RFRY?=
 =?utf-8?B?alp0R1cvU2tKWlhSU2MyVXRQSkU0RGN6THJoZlRwcGcrT3laZktqelhydUFs?=
 =?utf-8?B?QXE0MTBjRGc4anJEWkFHNTBkQjhnN0NWQVBlQk9GUEFrZ1cvdHIzb3NSY25I?=
 =?utf-8?B?UFhVd2hwUmJNVUtDZ29sVE5pRCt6Zzh0NGcvS294bzVEWXpMSDV5eEJsK3d6?=
 =?utf-8?B?aFkrbSs0cFFHZnA1WUVIb0JaU1V6cW8zZ1JRT2pEMkMvcDhMQVA5TUhHVkFu?=
 =?utf-8?B?Tmw4Mk9VTW5aNXROUWJHUHB1TEc3SmNBZ0ErdTB1bGNrOXZxYnZ0TGp0MFhq?=
 =?utf-8?B?Y2RwU0FSOURkODJTNW1TNG1GSkRVNDFjZVFpVHVHdk5FSVdrSXAzamxzS0dE?=
 =?utf-8?B?Z0pyNDhYaE45NHVnb0FLMVNNZ1U5VHhuUkJveERKeDFITkVUNFptVDlvRGNP?=
 =?utf-8?B?Mllhb05oOE9meERtR05HN01xUDVMVlhMUFhaZ1pUaW53MEptV3pITlA3dzll?=
 =?utf-8?B?NTZ0azhoR0IwVENqQ09uQWNQa3pKcEZraWRnalFoSnlOZFlCaTdSblJpcEV3?=
 =?utf-8?B?Z2RjSlNDZU0ycmxhaGI2TUpmdGxKNFluSDhMWEtjeG54WEJiNWNwZ1k3RjZi?=
 =?utf-8?B?ZHNaYzQvekVvQys5Zmk4QTEwRnBMUk8wb0ZVQkt1VlhxWlB0bGhUc0VjNW5i?=
 =?utf-8?B?RDhQTzh5MmZGQ0JjUDdlc2VjRWMyZzdjOTlhakZnUElmQUhvUjVlTmZwdStW?=
 =?utf-8?B?SWEwN2ZESllSSlUweVZ6VmVXUTB1NmowelJ6Z3NRaHEvOEw5SDg4cExpcEVi?=
 =?utf-8?B?OFdKL21LVXZsNDAyd1AycExiNDFibEllYms1ZjAwbVFJZi9JZUJkeHNqRURl?=
 =?utf-8?B?WmlkVWorclpMZUdrM2tuVEg0Mk03V0ZnTHpKblhRczFhS0FkbEFWTHlPOU5J?=
 =?utf-8?B?Vkgyc3hZU3c0dkJlMytTQ2FUbWRoNjNlTDZESUlsWHE4d1FFQTg4OHlQdlg0?=
 =?utf-8?B?VDlNN2FpY2ZhS1AyVW1IcXlvUXNFLzRubGpyc2hFb3p2eGtxeUJpeTEvVGYv?=
 =?utf-8?B?ZW1Od0w2WE5QN3BVNDFBNVpwSE90Y0VOY0FWZGtlUkpZMDFxWDhsYkFteEg4?=
 =?utf-8?B?WmlmWFdobFBmNmhrZC9UNkgyNldSdy9WYlFjaERsakdveXBQd203b1ZzK3A4?=
 =?utf-8?B?Z1R3WlR5bEpCZHRkNmhrekFZVDVIRk9DOGhtLzJZcU9WQ3MyTlVZTmFpVEFj?=
 =?utf-8?Q?8OCJ3vITV79kBELjerSNXNlQS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e70f09b-f1b0-4a26-c245-08dda8b906ee
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 07:24:40.0005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nJuMoIpQAy6n+OoXXYZqXdSJbs7TpXlYxMmdq1JOSiu9nmVKjUfcE0yws9eGhP79ogpHUeKH3YWQjO4y86KHMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7028
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

Hi Soham

On 6/11/2025 12:41 PM, Purkait, Soham wrote:
> 
> On 05-06-2025 22:27, Riana Tauro wrote:
>> Hi Soham
>>
>> Code looks good. Have one question and few minor comments below
>>
>> On 5/22/2025 9:14 PM, Soham Purkait wrote:
>>> Introduce vendor-agnostic support for
>>> handling multiple GPUs and instances
>>> in gputop. Improve the tool's adaptability
>>> to various GPU configurations.
>>>
>>> v2 : Fix for refactoring GPUTOP into a
>>>       vendor-agnostic tool. (Lucas)
>>>
>>> v3 : New year included in copyright. (Kamil, Riana)
>>>       Removed caps in function name. (Riana)
>>>       Struct for driver specific operations. (Riana)
>>>       Headers in alphabetical order. (Kamil, Riana)
>>>
>>> v4 : Commit description and signed-off included.
>>>
>>> v5 : Fix for proper resource cleanup. (Riana)
>>>       Use "dev_type" enum for card_type. (Krzysztof)
>>>       Add new filter to return collection
>>>       of matching devices.               (Zbigniew)
>>>
>>> v6 : Use device filter to populate the array of
>>>       cards for all supported drivers.   (Zbigniew)
>>>
>>> v7 : Use filter to find all the cards.  (Zbigniew)
>>>
>>> v8 : Removed 'drivers' array parameter from
>>>       card match function.               (Zbigniew)
>>>
>>> v10 : Resolved 'populate_devices' call with
>>>        pci subsystem filtering.          (Zbigniew)
>>>
>>> v11 : Add space after /* and before */ for better
>>>        readability.                      (Zbigniew)
>>>        Comments wrapped at 75/100.       (Riana)
>>>
>>> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
>>>
>>> Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>>> ---
>>>   tools/{ => gputop}/gputop.c | 223 +++++++++++++++++++++++++++++-------
>>>   tools/gputop/meson.build    |   6 +
>>>   tools/meson.build           |   6 +-
>>>   3 files changed, 191 insertions(+), 44 deletions(-)
>>>   rename tools/{ => gputop}/gputop.c (66%)
>>>   create mode 100644 tools/gputop/meson.build
>>>
>>> diff --git a/tools/gputop.c b/tools/gputop/gputop.c
>>> similarity index 66%
>>> rename from tools/gputop.c
>>> rename to tools/gputop/gputop.c
>>> index 43b01f566..fc3ccb83b 100644
>>> --- a/tools/gputop.c
>>> +++ b/tools/gputop/gputop.c
>>> @@ -1,6 +1,6 @@
>>>   // SPDX-License-Identifier: MIT
>>>   /*
>>> - * Copyright © 2023 Intel Corporation
>>> + * Copyright © 2023-2025 Intel Corporation
>>>    */
>>>     #include <assert.h>
>>> @@ -14,66 +14,145 @@
>>>   #include <math.h>
>>>   #include <poll.h>
>>>   #include <signal.h>
>>> +#include <stdbool.h>
>>>   #include <stdint.h>
>>>   #include <stdio.h>
>>>   #include <stdlib.h>
>>>   #include <string.h>
>>> +#include <sys/sysmacros.h>
>>
>> alphabetical
>>
>>>   #include <sys/ioctl.h>
>>>   #include <sys/stat.h>
>>>   #include <sys/types.h>
>>> -#include <unistd.h>
>>>   #include <termios.h>
>>> -#include <sys/sysmacros.h>
>>> -#include <stdbool.h>
>>> +#include <unistd.h>
>>>   +#include "drmtest.h"
>>>   #include "igt_core.h"
>>>   #include "igt_drm_clients.h"
>>>   #include "igt_drm_fdinfo.h"
>>> +#include "igt_perf.h"
>>>   #include "igt_profiling.h"
>>> -#include "drmtest.h"
>>> +#include "xe_gputop.h"
>>> +#include "xe/xe_query.h"
>>> +
>>> +/**
>>> + * Supported Drivers
>>> + *
>>> + * Adhere to the following requirements when implementing support 
>>> for the
>>> + * new driver:
>>> + * @drivers: Update drivers[] with driver string.
>>> + * @total_count: Update NUM_DRIVER with the total number of 
>>> supported drivers.
>>> + * @operations: Update the respective operations of the new driver:
>>> + * gputop_init,
>>> + * discover_engines,
>>> + * pmu_init,
>>> + * pmu_sample,
>>> + * print_engines,
>>> + * clean_up
>>> + * @devices: Update devices[] array of type "struct gputop_device" 
>>> with the
>>> + * initial values.
>>> + */
>>> +static const char * const drivers[] = {
>>> +    "xe",
>>> +    /* Keep the last one as NULL */
>>> +    NULL
>>> +};
>>> +
>>> +/**
>>> + * Number of supported drivers needs to be adjusted as per the 
>>> length of
>>> + * the drivers[] array.
>>> + */
>>> +#define NUM_DRIVER 1
>>> +
>>> +/**
>>> + * Supported operations on driver instances. Update the oprs[] array 
>>> for
>>> + * each individual driver specific function. Maintain the sequence 
>>> as per
>>> + * drivers[] array.
>>> + */
>>> +struct device_operations oprs[NUM_DRIVER] = {
>>
>> Replace oprs with ops.. generally use ops for operations
> Isn't ops more sound like options ?

Some examples like fops, pm_ops in kernel are for operations
Trivial comment upto you

>>> +    {
>>> +        xe_gputop_init,
>>> +        xe_populate_engines,
>>> +        xe_pmu_init,
>>> +        xe_pmu_sample,
>>> +        xe_print_engines,
>>> +        xe_clean_up
>>> +    }
>>> +};
>>> +
>>> +/*
>>> + * devices[] array of type struct gputop_device
>>> + */
>>> +struct gputop_device devices[] = {
>>
>> I must have commented here before. As i see this is one entry per 
>> driver right? why is it named device?
> 
> Actually this is keeping track of the devices for each driver, so the name.

yeah it tracks device count per driver. The array entries are per driver 
not device. Each entry is not a gputop_device as the name suggests

> 
> I have updated the description for better readability.
> >>
>>> +    {false, 0, NULL}
>>> +};
>>>     enum utilization_type {
>>>       UTILIZATION_TYPE_ENGINE_TIME,
>>>       UTILIZATION_TYPE_TOTAL_CYCLES,
>>>   };
>>>   -static const char *bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", 
>>> "▉", "█" };
>>> -
>>> -#define ANSI_HEADER "\033[7m"
>>> -#define ANSI_RESET "\033[0m"
>>> -
>>> -static void n_spaces(const unsigned int n)
>>> +static void gputop_clean_up(void)
>>>   {
>>> -    unsigned int i;
>>> -
>>> -    for (i = 0; i < n; i++)
>>> -        putchar(' ');
>>> +    for (int i = 0; drivers[i]; i++) {
>>> +        oprs[i].clean_up(devices[i].instances, devices[i].len);
>>> +        free(devices[i].instances);
>>> +        devices[i].driver_present = false;
>>> +        devices[i].len = 0;
>>> +    }
>>>   }
>>>   -static void print_percentage_bar(double percent, int max_len)
>>> +static int find_driver(struct igt_device_card *card)
>>>   {
>>> -    int bar_len, i, len = max_len - 1;
>>> -    const int w = 8;
>>> -
>>> -    len -= printf("|%5.1f%% ", percent);
>>> -
>>> -    /* no space left for bars, do what we can */
>>> -    if (len < 0)
>>> -        len = 0;
>>> -
>>> -    bar_len = ceil(w * percent * len / 100.0);
>>> -    if (bar_len > w * len)
>>> -        bar_len = w * len;
>>> +    for (int i = 0; drivers[i]; i++) {
>>> +        if (strcmp(drivers[i], card->driver) == 0)
>>> +            return i;
>>> +    }
>>> +    return -1;
>>> +}
>>>   -    for (i = bar_len; i >= w; i -= w)
>>> -        printf("%s", bars[w]);
>>> -    if (i)
>>> -        printf("%s", bars[i]);
>>> +/*
>>> + * If filter is not NULL i will be ignored.
>>> + */
>>> +static int populate_device_instances(const char *filter)
>>> +{
>>> +    struct igt_device_card *cards = NULL;
>>> +    struct igt_device_card *card_inplace = NULL;
>>> +    struct gputop_device *dev =  NULL;
>>> +    int driver_no;
>>> +    int count, final_count = 0;
>>
>> %s/final_count/card_count
> Here count and final_count both are keeping track of the cards but 
> final_count is the count of supported filtered devices, so the name.

Trivial comment . upto you

>>
>>> +
>>> +    count = igt_device_card_match_all(filter, &cards);
>>> +    for (int j = 0; j < count; j++) {
>>> +        if (strcmp((cards + j)->subsystem, "pci") != 0)
>>> +            continue;
>>>   -    len -= (bar_len + (w - 1)) / w;
>>> -    n_spaces(len);
>>> +        driver_no = find_driver(cards + j);
>>> +        if (driver_no < 0)
>>> +            continue;
>>>   -    putchar('|');
>>> +        dev = devices + driver_no;
>>> +        if (!dev->driver_present)
>>> +            dev->driver_present = true;
>>> +        dev->len++;
>>> +        dev->instances = realloc(dev->instances,
>>> +                     dev->len * sizeof(struct xe_gputop));
>>> +        if (!dev->instances) {
>>> +            fprintf(stderr,
>>> +                "Device instance realloc failed (%s)\n",
>>> +                strerror(errno));
>>> +            exit(EXIT_FAILURE);
>>> +        }
>>> +        card_inplace = (struct igt_device_card *)
>>> +                calloc(1, sizeof(struct igt_device_card));
>>> +        memcpy(card_inplace, cards + j, sizeof(struct 
>>> igt_device_card));
>>> +        oprs[driver_no].gputop_init((struct xe_gputop *)(dev- 
>>> >instances + dev->len - 1),
>>> +            card_inplace);
>>> +        final_count++;
>>> +    }
>>> +    if (count)
>>> +        free(cards);
>>> +    return final_count;
>>>   }
>>>     static int
>>> @@ -333,6 +412,7 @@ static void clrscr(void)
>>>   struct gputop_args {
>>>       long n_iter;
>>>       unsigned long delay_usec;
>>> +    char *device;
>>>   };
>>>     static void help(void)
>>> @@ -343,16 +423,18 @@ static void help(void)
>>>              "\t-h, --help                show this help\n"
>>>              "\t-d, --delay =SEC[.TENTHS] iterative delay as SECS 
>>> [.TENTHS]\n"
>>>              "\t-n, --iterations =NUMBER  number of executions\n"
>>> +           "\t-D, --device              Device filter\n"
>>>              , program_invocation_short_name);
>>>   }
>>>     static int parse_args(int argc, char * const argv[], struct 
>>> gputop_args *args)
>>>   {
>>> -    static const char cmdopts_s[] = "hn:d:";
>>> +    static const char cmdopts_s[] = "hn:d:D:";
>>>       static const struct option cmdopts[] = {
>>>              {"help", no_argument, 0, 'h'},
>>>              {"delay", required_argument, 0, 'd'},
>>>              {"iterations", required_argument, 0, 'n'},
>>> +           {"device", required_argument, 0, 'D'},
>>>              { }
>>>       };
>>>   @@ -360,6 +442,7 @@ static int parse_args(int argc, char * const 
>>> argv[], struct gputop_args *args)
>>>       memset(args, 0, sizeof(*args));
>>>       args->n_iter = -1;
>>>       args->delay_usec = 2 * USEC_PER_SEC;
>>> +    args->device = NULL;
>>>         for (;;) {
>>>           int c, idx = 0;
>>> @@ -383,6 +466,9 @@ static int parse_args(int argc, char * const 
>>> argv[], struct gputop_args *args)
>>>                   return -1;
>>>               }
>>>               break;
>>> +        case 'D':
>>> +            args->device = optarg;
>>> +            break;
>>>           case 'h':
>>>               help();
>>>               return 0;
>>> @@ -422,6 +508,52 @@ int main(int argc, char **argv)
>>>       n = args.n_iter;
>>>       period_us = args.delay_usec;
>>>   +    if (!populate_device_instances(args.device ? args.device
>>> +                       : "device:subsystem=pci,card=all")) {
>>> +        printf("No device found.\n");
>>> +        gputop_clean_up();
>>> +        exit(1);
>>> +    }
>>> +
>>> +    for (int i = 0; drivers[i]; i++) {
>>> +        if (devices[i].driver_present) {
>>
>> if not present continue
> It will be at the end of the outer loop if not present so it eventually 
> continues.

The comment was to reduce the indentation and improve readability

Thanks
Riana

>>>> Thanks
>> Riana
>>
>>> +            for (int j = 0; j < devices[i].len; j++) {
>>> +                if (!oprs[i].init_engines(devices[i].instances + j)) {
>>> +                    fprintf(stderr,
>>> +                        "Failed to initialize engines! (%s)\n",
>>> +                        strerror(errno));
>>> +                        gputop_clean_up();
>>> +                    return EXIT_FAILURE;
>>> +                }
>>> +                ret = oprs[i].pmu_init(devices[i].instances + j);
>>> +
>>> +                if (ret) {
>>> +                    fprintf(stderr,
>>> +                        "Failed to initialize PMU! (%s)\n",
>>> +                        strerror(errno));
>>> +                    if (errno == EACCES && geteuid())
>>> +                        fprintf(stderr,
>>> +                            "\n"
>>> +                            "When running as a normal user 
>>> CAP_PERFMON is required to access performance\n"
>>> +                            "monitoring. See \"man 7 capabilities\", 
>>> \"man 8 setcap\", or contact your\n"
>>> +                            "distribution vendor for assistance.\n"
>>> +                            "\n"
>>> +                            "More information can be found at 'Perf 
>>> events and tool security' document:\n"
>>> + "https://www.kernel.org/doc/html/latest/admin-guide/perf- 
>>> security.html\n");
>>> +
>>> +                    igt_devices_free();
>>> +                    gputop_clean_up();
>>> +                    return EXIT_FAILURE;
>>> +                }
>>> +            }
>>> +        }
>>> +    }
>>> +
>>> +    for (int i = 0; drivers[i]; i++) {
>>> +        for (int j = 0; devices[i].driver_present && j < 
>>> devices[i].len; j++)
>>> +            oprs[i].pmu_sample(devices[i].instances + j);
>>> +    }
>>> +
>>>       clients = igt_drm_clients_init(NULL);
>>>       if (!clients)
>>>           exit(1);
>>> @@ -442,14 +574,27 @@ int main(int argc, char **argv)
>>>         while ((n != 0) && !stop_top) {
>>>           struct igt_drm_client *c, *prevc = NULL;
>>> -        int i, engine_w = 0, lines = 0;
>>> +        int k, engine_w = 0, lines = 0;
>>>             igt_drm_clients_scan(clients, NULL, NULL, 0, NULL, 0);
>>> +
>>> +        for (int i = 0; drivers[i]; i++) {
>>> +            for (int j = 0; devices[i].driver_present && j < 
>>> devices[i].len; j++)
>>> +                oprs[i].pmu_sample(devices[i].instances + j);
>>> +        }
>>> +
>>>           igt_drm_clients_sort(clients, client_cmp);
>>>             update_console_size(&con_w, &con_h);
>>>           clrscr();
>>>   +        for (int i = 0; drivers[i]; i++) {
>>> +            for (int j = 0; devices[i].driver_present && j < 
>>> devices[i].len; j++) {
>>> +                lines = oprs[i].print_engines(devices[i].instances + j,
>>> +                             lines, con_w, con_h);
>>> +            }
>>> +        }
>>> +
>>>           if (!clients->num_clients) {
>>>               const char *msg = " (No GPU clients yet. Start workload 
>>> to see stats)";
>>>   @@ -457,7 +602,7 @@ int main(int argc, char **argv)
>>>                      (int)(con_w - strlen(msg) - 1), msg);
>>>           }
>>>   -        igt_for_each_drm_client(clients, c, i) {
>>> +        igt_for_each_drm_client(clients, c, k) {
>>>               assert(c->status != IGT_DRM_CLIENT_PROBE);
>>>               if (c->status != IGT_DRM_CLIENT_ALIVE)
>>>                   break; /* Active clients are first in the array. */
>>> @@ -481,11 +626,11 @@ int main(int argc, char **argv)
>>>       }
>>>         igt_drm_clients_free(clients);
>>> +    gputop_clean_up();
>>>         if (profiled_devices != NULL) {
>>>           igt_devices_configure_profiling(profiled_devices, false);
>>>           igt_devices_free_profiling(profiled_devices);
>>>       }
>>> -
>>>       return 0;
>>>   }
>>> diff --git a/tools/gputop/meson.build b/tools/gputop/meson.build
>>> new file mode 100644
>>> index 000000000..4766d8496
>>> --- /dev/null
>>> +++ b/tools/gputop/meson.build
>>> @@ -0,0 +1,6 @@
>>> +gputop_src = [ 'gputop.c', 'utils.c', 'xe_gputop.c']
>>> +executable('gputop', sources : gputop_src,
>>> +           install : true,
>>> +           install_rpath : bindir_rpathdir,
>>> +           dependencies : 
>>> [igt_deps,lib_igt_perf,lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math],
>>> +       install: true)
>>> diff --git a/tools/meson.build b/tools/meson.build
>>> index de866c392..8002f707d 100644
>>> --- a/tools/meson.build
>>> +++ b/tools/meson.build
>>> @@ -69,11 +69,6 @@ if libudev.found()
>>>              install : true)
>>>   endif
>>>   -executable('gputop', 'gputop.c',
>>> -           install : true,
>>> -           install_rpath : bindir_rpathdir,
>>> -           dependencies : 
>>> [lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math])
>>> -
>>>   intel_l3_parity_src = [ 'intel_l3_parity.c', 
>>> 'intel_l3_udev_listener.c' ]
>>>   executable('intel_l3_parity', sources : intel_l3_parity_src,
>>>          dependencies : tool_deps,
>>> @@ -122,3 +117,4 @@ endif
>>>   subdir('i915-perf')
>>>   subdir('xe-perf')
>>>   subdir('null_state_gen')
>>> +subdir('gputop')
>>
