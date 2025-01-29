Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 508E5C0218D
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jan 2025 04:05:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C328C10E2AC;
	Wed, 29 Jan 2025 04:05:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dmNAvO9y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE11A10E2AC
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2025 04:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738123542; x=1769659542;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=mcWSRM9NMvpaJDK838ATaUNUmRlsqecVDmpzvge2Sbk=;
 b=dmNAvO9y+7h9FhldqaK6I+EZXcUqes5zmf28fZ2F3h+spmh2U3029P5p
 DAmuV9V0JRyqsyL3tzZsqXSWAFBLrY4SVCd2pTB8tJ7Synt9QmZBtHwZN
 MH9vsHF6wHeyljqCvPCJ7asv2sQ5DbbnsWn6H7EzNOrpj2WfBy/jHKlXV
 b7m3oeUgwouuJzas9mP8IJpMH1h/FiFuKKWaai+mBwI61Zsw9ySTZAsnA
 EP8FwTUuLm4jMMxLGO5YnS+QrpVD+7XMlTODBnytsIl4wB4ILQ2vIpunN
 XH1ZfQvBx2mL0MHBRM0qNOuq9jEwc13xGdO5PxoBFpsitbJ8Ai9fQfrCq Q==;
X-CSE-ConnectionGUID: kHDiZNVpQ2CA7qjp2tvLKg==
X-CSE-MsgGUID: 3Se+Qqp+S2iMUhcjVBPVUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38512117"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="38512117"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 20:05:42 -0800
X-CSE-ConnectionGUID: AN8xohWsSM+SyhZpkttu7A==
X-CSE-MsgGUID: cVhZcfyyTMOTr4T2sGlCdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="109837785"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jan 2025 20:05:41 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 28 Jan 2025 20:05:40 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 28 Jan 2025 20:05:40 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 28 Jan 2025 20:05:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qDUjW6JJJQ8wR/r0XX4k7pcO7piMrPomdGylVMkc1GIePXurwptPoY6z13OQw9KkF+L/tPOw9a0RQb5TNIBzsC8JpCSR/WELU+RY3S6TmtmaBpZucBflmyvRoVh7xyt2b0IpvCtfGa+Ck5rHglTMIbmckB1ItP1rI2hcmh0v0X5Ye9TQ1im4mhWwgZfal/jOowjE9/VFoLDUy7y2HJbnRXf9x+7v7bCQaZ2qQqIWo5jw7EyPlPjGd+c95v+My77YOLfVrgbwFT93xeB+f9bi6RuXKrODswb/HPihujKEtsj2LNQDhZTCkL7XetlBn8/lOyyrvFizwFmvkFUKS5uBVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2wRxUuj3bB85bipbx4DoQ82JtiJ9GWKiePtYMwuLW60=;
 b=q/Itq8G6yduSEa2eqwN5JdjeNjqqTs9YqI7ywdOBvoTULjCmCedhjugfgIKEuKG2TZklj5oMPfAG5KL0v4WvNu5zzTudqIRT8QmKjwP3mC7ASYLO7FtaCmp54madMtD9I6EaxIHzz9yDN45yS5wVmYp8cOsjuCIdKmoMaJe6FmOKaF5cyCaqQio+MmIKBAyAK4R07VBfgNwbKqzUnPQXTeXJR4HXAPxH2FLxWrtH8ceM7E8MOfKIKODFPn5aoAx8OCUEppbnADqLAxOos9wN+GKaigOLGgyKxP3LXKXtU/P82ub0jMcFiiFXavTtE3MijLyq4V3rUf1sjwKdMxWLmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by CY8PR11MB7897.namprd11.prod.outlook.com (2603:10b6:930:7d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.20; Wed, 29 Jan
 2025 04:05:05 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3%6]) with mapi id 15.20.8398.014; Wed, 29 Jan 2025
 04:05:05 +0000
Message-ID: <d9470a0c-0011-4b25-b06f-1e7c96a7fc87@intel.com>
Date: Wed, 29 Jan 2025 09:34:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib: sync intel PCI ID macros with kernel
To: Matt Atwood <matthew.s.atwood@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250129003155.91475-1-matthew.s.atwood@intel.com>
Content-Language: en-US
From: "Chauhan, Shekhar" <shekhar.chauhan@intel.com>
In-Reply-To: <20250129003155.91475-1-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0129.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::8) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|CY8PR11MB7897:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b757da4-2870-4bd1-9ffb-08dd401a1c8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b3dUV1pMdDVmUWdjWE5mYWZlZlhVT1J4dllMaU5WN1lnc0RmTW55RTZPYjIy?=
 =?utf-8?B?K045bnlVQzh2UFhxME1UL3VmZjdWYmVpM09kak5aMWNXRno4M0djcWZpTXVa?=
 =?utf-8?B?NDhYVHhPVVU3RWdXcU9iNG02OXZ1S1hGYTJ3K3NVTk5oNU9nRlZSanB3dGYz?=
 =?utf-8?B?QXRWMU83VnVTeEIxZXBOTEJrYk91M25XQ3RBWmdFbzJMS0w3blBMQkJ0Wklr?=
 =?utf-8?B?RzJtRTBWQkg1dnY0WE1lZHdBMUxHRG9XL1QvTnlUU3ZRYVhQR1RyNERIMWZX?=
 =?utf-8?B?RFNRME5Bd3lBSDhZY0tXNVFiRWNRblFGUnYvUjRHdVRSMHh0V3hid2xwRjZY?=
 =?utf-8?B?K3RmMDhZS2JzcS82dlZyRUY1Z2g2TmQyajFqQWtZQktuOXhBVlh5OTlBck9l?=
 =?utf-8?B?OWZTMU90V054NWc5RXo2TEJpVEY0MnUrMFpxaTlXa1RMSlVhWXczc1Jva2sr?=
 =?utf-8?B?VXg4ODk4NEo2V2VpdXB5MGVJSUZEYzBselM5T25wOHBpRWFUdE95KzV6WEJj?=
 =?utf-8?B?ZFN4ZGs0bkJ0NkUyOEJWcWRyazRJb0k0MG1VTTVwbHRhRmYwOUpjTi9YRTgv?=
 =?utf-8?B?T1RQMEhSKzJDMXR3NjYzMGhBNVlSTGFHeTdTZEZLRmQ5Z3pCcGdYNVpxTFVj?=
 =?utf-8?B?QndsZVkyR1R1TkR2VzFIdTV2bXRQRmlxOC9OVjZNWHFEQ3QyUmg3aUJLQVlU?=
 =?utf-8?B?WklERXdIZDB6TjcrdzJZMUFDMFRQRVFIclJPd2lETWZiNVNHV2RaNUQzckpR?=
 =?utf-8?B?b3lRVnNCQmpaSW94WnZSd2ZQWFJhNTlWTUo1eDJXSHpOZ2VxUFYrZVFNKy9v?=
 =?utf-8?B?QUErcVZYUVMrQ3RYN0grMnJZSlMwcjM2TlJ6T0tMeCtqdDFwNXlQK3BPdUNu?=
 =?utf-8?B?bXBRQytOQXpKU0ZCQWRHOWV1QnlQZzRtU0NIVXkrSEt3MFFTdWpmYzZudHNS?=
 =?utf-8?B?ODllWlpCa2FGYTNxYUhJR3BYUE1JZ2VIVXA3S0F5VGJpcFA0VlBPbkpWRW1a?=
 =?utf-8?B?dUNDK1p4MlNxYnc4WFdodVdGekFxYjVieVpjRTZoWTZxS2t0RkZWeG8vN0Ru?=
 =?utf-8?B?NHJWSENxazZqVW45SUN5MmovWVFYSFZtb29sRzhiWW9MR05SL2NXYzV6ZERE?=
 =?utf-8?B?TXFneFp2V1hNbGVVV2FNSlAwdzh5MzBpY2xkY0JXaVU4LzMvQTFKZ1BlSWJK?=
 =?utf-8?B?ZHpVeXRleUIyQW9FTXV2SjFFeFNXYUljc3J2V2c1VDJCUnZXdXpmVnRuWGZl?=
 =?utf-8?B?WDhOYjBDV3BCSjVsY0dVQ29JSXBtZlM1NWhIcUZjVWtWUHcwcFZhTnd3QjBW?=
 =?utf-8?B?SmpTOStOYkxxZmpPOWhzQ1d6a3BaYUtyakd6a2I0ZnVJN0JRYzFRUXVXNStX?=
 =?utf-8?B?MjkyR1JXMGd3N2tKQUtKcjhIbm1sT2pETlVBdkgySE5lVVlDZXFiZVRYRkZR?=
 =?utf-8?B?YVJnN3BSVHNIYVNTWlIvRGM2d2x5emZsSGs2dzQ0QkdhT2YrSk5RZEhLZUEz?=
 =?utf-8?B?clVrd0JiWmFOYVBtTkE4dFVUZlJ1V08zNHZYL1ozVzlhOENaNnJabER3UFRH?=
 =?utf-8?B?eVZWOFg0ZGpKRTArbDlZcllaM2FYa2hlcnpPWmNqRjlDMncxTDBTditRYmNy?=
 =?utf-8?B?Q2ZNQ0VnTDRIRU9GMnZQN0xUdFZVekIzay95UXI3QWs4a3VrN2FOWlJRTUdB?=
 =?utf-8?B?Q1Q3dlpTNUN2QUJXV1RXQS91aHlUa2h0Z1hIakp4aE5BYTdQOXBGWUgxcSs4?=
 =?utf-8?B?T3F5YzFzdWozME5wSHdNMzQ2WXduVlI4aVF1VytycnMvUkNSd0VOekQxUlgw?=
 =?utf-8?B?TzVpbXZwdDZGSjBnY3FMQ2dITnpoT3JEMllScnNEd1UwNm5NMjdueWtDZFZ4?=
 =?utf-8?Q?jJ1S8jV9n+p4D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:ca; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWNkT3RsUlhjaGJRSi9WWGtuNmF1LzdwZXpkUHp2eDZoeGNkNkx6QmxZbStJ?=
 =?utf-8?B?U2F2VXRzTjVSMEJmN2R3MlMwNjBZdkUzR0tPU2pxZnVOVXo3UnBkOEUvK0Fy?=
 =?utf-8?B?aFhKb3M2Z1d5ZWkxY0dGWUd5aTg2OXFUNE5UTG15SGVqYWUybEExTW5PSUM4?=
 =?utf-8?B?ZkhnWVZxR1hFKy83UWJtVENwS2RHdndNVk1JOEpEeVJGZWZGNi9HdlFqZEpR?=
 =?utf-8?B?VDVmZlg0YjV1anpSR0pwNUlnWmlzcEgzNWhqUFZJb0VDSnJlbncxcmJsamRz?=
 =?utf-8?B?ZS9TaHd4cjR4bWh4R0N1bldCTlk4aTZOaEsweHhzNFJ3a1FNdm1tZzBJOTBp?=
 =?utf-8?B?QloyNzBQWWZlVVVkcWw0NlBsRENQbGovQjUwSDk0YWoxRHIvN3FxRGhldHVE?=
 =?utf-8?B?T0RDSHBlSlplVGwwU0J4dzVQclVGUkNwN09neTdJZmszWlB2aDNzakRQbjBY?=
 =?utf-8?B?WUUzb2VZbXY3TFdtWlF3M3cvYklhU0dMOWcwM3J6Z241YUs1WUlyM3RqbGJ1?=
 =?utf-8?B?eURMY1U5blZYZHpPbmxmbm55NnBkRFd0UXlVTWNjb2F0Z1NLcXVVSWplUTlI?=
 =?utf-8?B?ZFk4dE5aUzF1ZjJYTlRWRmNxL2Fwbkgwb2VMaDhqS3B5empFdytoeW5DSTVs?=
 =?utf-8?B?SkxRQ2RlV0diY2twQnlLS3U1UU4zTkc5QUdXWjB2WXRscVZvMk42eW4yKzcx?=
 =?utf-8?B?eWd0dzhvOURRQUtQSytweWRzMVFKaUduM1FrZWVzbnpRUVIvRGJwaFZmTFJE?=
 =?utf-8?B?Y2I3MjlhL3RqWm1abStBV2YwY055VEN0TUd6OG14bGJOd3BlcndLWUVML2Nv?=
 =?utf-8?B?R0tMemlvaDRxTHAzQnBKTGdQNzMyT0p5KzN6ajR5elZTaXFGWFRvWWF3VzNZ?=
 =?utf-8?B?bXhlT2V3Rk5SVXF0SndwZXRaVTNLdUJ3SUVTN3B3SnptL1M1Q1dNTWRBekhF?=
 =?utf-8?B?dVBYbWlDU0Z0aEJzWEVjZitZOXR5ekpaWkovdWtpY09seWlSdmNJem5KYjBU?=
 =?utf-8?B?MGphRDZLMlNUalNCZXA5ZW5uenpjL3NPZlpmM0Z2NHpiSzVUblRqMXE5aGxk?=
 =?utf-8?B?T05vaStUd0xBSy9yOElkV01TNDFKSGM3NUxWTlRFV1J6R1ZzOEJoQm1SM0hw?=
 =?utf-8?B?VHlxemMzSUxXTXZrYmRuQXpsZGZ4ek1ETUphY3pWOVhtVVl2dDJaTFhrYTRD?=
 =?utf-8?B?VUFRTUtjSXlUZzI2M0wydnNqb1RpSVFZT2phc3FlWjBERlhuWHdNWFFnTDRO?=
 =?utf-8?B?S1M0aGt5RjlWKzZtb3loR2FMTzZDMTBFWE1DVUpoOGNNZ0l0YlkvSUt0eUpl?=
 =?utf-8?B?Wmc1LzZZeFNvcXFiTjB3eTlGY2M2TTlhQkdWU3htMmcrUVFZS1FUZkFwRGd2?=
 =?utf-8?B?dld6WWJZTHlWVTB0eityNitWcnhYNkVIZThhaDhFbGJZcituSmJlVFA1MDhV?=
 =?utf-8?B?ZmJiU1dzeGI0dkdJUDNIMnlpRFIwME1sV3NzaWQvY25QZ0Q5RW93Z0RHQmM4?=
 =?utf-8?B?dEYzSDA2SGREQytZYm9hejlCMHBQU05WbDBkYnJDVzk4bjFBeEgxZHdoaCt6?=
 =?utf-8?B?aFRZaE5lR0ZxTDlJdDM4KzZ3QitpekhsWmthNzVsbzVnVndtTU01OUxEY1N5?=
 =?utf-8?B?dTZCNWd2aE92Zk9QU3ZUU0VhNkk0MGU5dGN2UWZEdW5oOHE3emxqZG1pVit2?=
 =?utf-8?B?dFdZb2hNb1FuU0p1WTVSSGc4ajFuOXdVeWtQTW4xemxkNCsxVGRzRzB5Wnhl?=
 =?utf-8?B?RmFOWGlKY0VsTm5zT29ybnVrRlJUaDVCeEFwY1VyRENsZFY4elphT1dKWmN2?=
 =?utf-8?B?TkxlNmZvZjNtcWZRRS9uRHAwN3pwblRoNlRDOVlFanpVYzlwaTBCbW1JWm51?=
 =?utf-8?B?WUp4YWhNRUJOc3BSVEdCTFBSRlVGUU1kWGRoSDRwMGRMMTBrSmFNaDQvNkdE?=
 =?utf-8?B?TWxUWkp3NGszeTUwQkM4elpjMkhmbkZCajU1cFAzT3ArdWxVS256R21WZHNJ?=
 =?utf-8?B?TEtYODh5TitvT09pdCtxL1lEVHY2VGhVaEZDa3NRV3VpNGNUMHVsYzNpdkZH?=
 =?utf-8?B?MDllRk5FMHdwa0hzWHVFUWtpOCtqNStqMFlIazhVdndxeVRGRWhHTUcvbEhx?=
 =?utf-8?B?SERzTVZDVlMwSEFwZ2hDUDJiVkl5ZnBUQ25WMmhpMUlIRFZiYmZBZTNyUFU1?=
 =?utf-8?B?WWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b757da4-2870-4bd1-9ffb-08dd401a1c8f
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 04:05:05.1820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: msAAy8I83DBwkGYvDDDjhgtNz/2u6RS4gJLJTV+lGfSt6+yOH0Ra2ROORCDv2jLjbJcXyjeAEbEOjE27R21+JCegmK7nazHT4VEUrwfMxCc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7897
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


On 1/29/2025 6:01, Matt Atwood wrote:
> lib: sync PCI ID macros with kernel
>
> Sync with kernel commit:
> 16016ade13f6 ("drm/xe/ptl: Update the PTL pci id table")

Can we have a simpler commit description, something like: "Sync PCI IDs 
of various platforms with the Xe-KMD."

Reason being: The structural modifications below aren't really a part of 
the kernel commit mentioned.

>
> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> ---
>   lib/pciids.h | 73 ++++++++++++++++++++++++++++++++++++++--------------
>   1 file changed, 53 insertions(+), 20 deletions(-)
>
> diff --git a/lib/pciids.h b/lib/pciids.h
> index 7883384ac..4736ea525 100644
> --- a/lib/pciids.h
> +++ b/lib/pciids.h
> @@ -717,37 +717,66 @@
>   	MACRO__(0xA7AB, ## __VA_ARGS__)
>   
>   /* DG2 */
> -#define INTEL_DG2_G10_IDS(MACRO__, ...) \
> -	MACRO__(0x5690, ## __VA_ARGS__), \
> -	MACRO__(0x5691, ## __VA_ARGS__), \
> -	MACRO__(0x5692, ## __VA_ARGS__), \
> +#define INTEL_DG2_G10_D_IDS(MACRO__, ...) \
>   	MACRO__(0x56A0, ## __VA_ARGS__), \
>   	MACRO__(0x56A1, ## __VA_ARGS__), \
> -	MACRO__(0x56A2, ## __VA_ARGS__), \
> +	MACRO__(0x56A2, ## __VA_ARGS__)
> +
> +#define INTEL_DG2_G10_E_IDS(MACRO__, ...) \
>   	MACRO__(0x56BE, ## __VA_ARGS__), \
>   	MACRO__(0x56BF, ## __VA_ARGS__)
>   
> -#define INTEL_DG2_G11_IDS(MACRO__, ...) \
> -	MACRO__(0x5693, ## __VA_ARGS__), \
> -	MACRO__(0x5694, ## __VA_ARGS__), \
> -	MACRO__(0x5695, ## __VA_ARGS__), \
> +#define INTEL_DG2_G10_M_IDS(MACRO__, ...) \
> +	MACRO__(0x5690, ## __VA_ARGS__), \
> +	MACRO__(0x5691, ## __VA_ARGS__), \
> +	MACRO__(0x5692, ## __VA_ARGS__)
> +
> +#define INTEL_DG2_G10_IDS(MACRO__, ...) \
> +	INTEL_DG2_G10_D_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_DG2_G10_E_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_DG2_G10_M_IDS(MACRO__, ## __VA_ARGS__)
> +
> +#define INTEL_DG2_G11_D_IDS(MACRO__, ...) \
>   	MACRO__(0x56A5, ## __VA_ARGS__), \
>   	MACRO__(0x56A6, ## __VA_ARGS__), \
>   	MACRO__(0x56B0, ## __VA_ARGS__), \
> -	MACRO__(0x56B1, ## __VA_ARGS__), \
> +	MACRO__(0x56B1, ## __VA_ARGS__)
> +
> +#define INTEL_DG2_G11_E_IDS(MACRO__, ...) \
>   	MACRO__(0x56BA, ## __VA_ARGS__), \
>   	MACRO__(0x56BB, ## __VA_ARGS__), \
>   	MACRO__(0x56BC, ## __VA_ARGS__), \
>   	MACRO__(0x56BD, ## __VA_ARGS__)
>   
> -#define INTEL_DG2_G12_IDS(MACRO__, ...) \
> -	MACRO__(0x5696, ## __VA_ARGS__), \
> -	MACRO__(0x5697, ## __VA_ARGS__), \
> +#define INTEL_DG2_G11_M_IDS(MACRO__, ...) \
> +	MACRO__(0x5693, ## __VA_ARGS__), \
> +	MACRO__(0x5694, ## __VA_ARGS__), \
> +	MACRO__(0x5695, ## __VA_ARGS__)
> +
> +#define INTEL_DG2_G11_IDS(MACRO__, ...) \
> +	INTEL_DG2_G11_D_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_DG2_G11_E_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_DG2_G11_M_IDS(MACRO__, ## __VA_ARGS__)
> +
> +#define INTEL_DG2_G12_D_IDS(MACRO__, ...) \
>   	MACRO__(0x56A3, ## __VA_ARGS__), \
>   	MACRO__(0x56A4, ## __VA_ARGS__), \
>   	MACRO__(0x56B2, ## __VA_ARGS__), \
>   	MACRO__(0x56B3, ## __VA_ARGS__)
>   
> +#define INTEL_DG2_G12_M_IDS(MACRO__, ...) \
> +	MACRO__(0x5696, ## __VA_ARGS__), \
> +	MACRO__(0x5697, ## __VA_ARGS__)
> +
> +#define INTEL_DG2_G12_IDS(MACRO__, ...) \
> +	INTEL_DG2_G12_D_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_DG2_G12_M_IDS(MACRO__, ## __VA_ARGS__)
> +
> +#define INTEL_DG2_D_IDS(MACRO__, ...) \
> +	INTEL_DG2_G10_D_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_DG2_G11_D_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_DG2_G12_D_IDS(MACRO__, ## __VA_ARGS__)
> +
>   #define INTEL_DG2_IDS(MACRO__, ...) \
>   	INTEL_DG2_G10_IDS(MACRO__, ## __VA_ARGS__), \
>   	INTEL_DG2_G11_IDS(MACRO__, ## __VA_ARGS__), \
Although the DG2 IDs look clean to me, but mind explaining me why are we 
creating these sub-defines for DG2_D / DG2_E / DG2_M
> @@ -782,9 +811,12 @@
>   	INTEL_ARL_S_IDS(MACRO__, ## __VA_ARGS__)
>   
>   /* MTL */
> -#define INTEL_MTL_IDS(MACRO__, ...) \
> +#define INTEL_MTL_U_IDS(MACRO__, ...) \
>   	MACRO__(0x7D40, ## __VA_ARGS__), \
> -	MACRO__(0x7D45, ## __VA_ARGS__), \
> +	MACRO__(0x7D45, ## __VA_ARGS__)
> +
> +#define INTEL_MTL_IDS(MACRO__, ...) \
> +	INTEL_MTL_U_IDS(MACRO__, ## __VA_ARGS__), \
>   	MACRO__(0x7D55, ## __VA_ARGS__), \
>   	MACRO__(0x7D60, ## __VA_ARGS__), \
>   	MACRO__(0x7DD5, ## __VA_ARGS__)

Following up on my last comment, if we are creating sub-defines, the 
design isn't followed here in MTL. MTL_IDS extends to MTL_U_IDS and a 
bunch of singletons. Or, if there's a reason behind doing so, please 
help me understand.

> @@ -817,19 +849,20 @@
>   	MACRO__(0xE20B, ## __VA_ARGS__), \
>   	MACRO__(0xE20C, ## __VA_ARGS__), \
>   	MACRO__(0xE20D, ## __VA_ARGS__), \
> -	MACRO__(0xE212, ## __VA_ARGS__)
> +	MACRO__(0xE210, ## __VA_ARGS__), \
> +	MACRO__(0xE212, ## __VA_ARGS__), \
> +	MACRO__(0xE215, ## __VA_ARGS__), \
> +	MACRO__(0xE216, ## __VA_ARGS__)
>   
>   /* PTL */
>   #define INTEL_PTL_IDS(MACRO__, ...) \
>   	MACRO__(0xB080, ## __VA_ARGS__), \
>   	MACRO__(0xB081, ## __VA_ARGS__), \
>   	MACRO__(0xB082, ## __VA_ARGS__), \
> +	MACRO__(0xB083, ## __VA_ARGS__), \
> +	MACRO__(0xB08F, ## __VA_ARGS__), \
>   	MACRO__(0xB090, ## __VA_ARGS__), \
> -	MACRO__(0xB091, ## __VA_ARGS__), \
> -	MACRO__(0xB092, ## __VA_ARGS__), \
>   	MACRO__(0xB0A0, ## __VA_ARGS__), \
> -	MACRO__(0xB0A1, ## __VA_ARGS__), \
> -	MACRO__(0xB0A2, ## __VA_ARGS__), \
>   	MACRO__(0xB0B0, ## __VA_ARGS__)
>   
>   #endif /* __PCIIDS_H__ */

-- 
-shekhar

