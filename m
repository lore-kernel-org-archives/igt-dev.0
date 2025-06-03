Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 340A6C5AD49
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 06:38:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C796410E0B9;
	Tue,  3 Jun 2025 06:38:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KK2vUc0+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD4CB10E0B9
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 06:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748932712; x=1780468712;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JGpjroaq/qnPb7PzR76dSB1f12NRyRoI2utS60teJw4=;
 b=KK2vUc0+m3CGsRix6rUy7IIOilNGqom1+2Jf5wCNp91BfXM0rz5GO+Cz
 6tcpuYadO+kW1UnSRxqBL3CSyIQq6tdKjAn/MM/s/ugihg8TWLKy82BLz
 Ynnnsxf+bOlVAGb3fno97vqGRv3IXtND2Nkybm4USZFqXthTnJTispK6n
 z+eYhDVKlw2dOevfXmeRFY8tO53mwbfOAjFLjwgA0A1mr98Ax5yHZejOD
 sXYO8vJnV2BpPXV8QJzePsDaUJuL2Mu9DFIF7Id493+M63/YmSTpL+F/U
 uffrF0gFoGfJPRNt1fB1K8i4G08BWpQTI4xR+xIEHAbwoYe+z3tTlSkp+ w==;
X-CSE-ConnectionGUID: WatuVLPxS0qflvaQbHV/Pg==
X-CSE-MsgGUID: PhixLHDHRs29fP2Wgus4rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="61222537"
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="61222537"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 23:38:27 -0700
X-CSE-ConnectionGUID: BJN4Q37aR36FYfsvCmrgbg==
X-CSE-MsgGUID: PwXY3WNwTbSYbCT7EveJjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="144799815"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 23:38:27 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 2 Jun 2025 23:38:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 2 Jun 2025 23:38:26 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.88)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 2 Jun 2025 23:38:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uXxNQFNjctvU5r4jm2sPRgGzzQcuPfHHAw09RsfVz5ESJmgmD2SzAnaMtcK1HNUFQ+LXrys7u141I9Xorc/lx66w0Y5TSaFa3ApnMLyY90jeb6bN+Be0ZPDELFbmaFIHKSoLCspQOfe4NXt5zDeppxem2PvM8WRY5sW2KBSjrATiQrXVOZ6cbaixIVJcnIwIpynjaWMksONKB3Nzo0aXuZ32R6HoPN3q5mOFzVcuNOcATJ1dUIeyFdPzjIcTQrjM+/PMG8BARcY33/tTh5gOcBDrsJV+YbobVqw0EMk21FXpfBOIITsO5OdaSTzezagPBjrwFri8xcX5jsYMwobdnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H/GfAF/BrtZsXt+ot2mDMJ6fLrQwaKmjRk2wR+xctgg=;
 b=P/lgmqJgDE9YamwJO+k2fMAOJEUTtmsf3Yo5DTAKjfd8gM+w76nYKqITiFl96Wt2hNdAghSxpl7O+J5kuD4GHCaXy0gPBe+jtH4T1M/LQfB3D6eUkAkD/DNMfweVfhgK28icdarwYOE36nPnKOq7vjXGcWobECL4Yi5oocvh7g3p5I+I/81/iYZJ5RJnqharRDOWoIY85LYY5M7eeCNobg90W+/MfvtturEBJEN8eLwhStXromTM1nz9DP+ZXeRH5u60XH6UzvFk30tXck+Ukf80nUO7GI2jr3z5JlINCpkV+0ecjrrSQtZ9Kw88fGQQ89g3y5zOJ0KioDVeZG58rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS4PPF69154114F.namprd11.prod.outlook.com (2603:10b6:f:fc02::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.25; Tue, 3 Jun
 2025 06:37:37 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8769.025; Tue, 3 Jun 2025
 06:37:37 +0000
Message-ID: <4f14b209-a6a5-4764-9414-3f0c49119517@intel.com>
Date: Tue, 3 Jun 2025 12:07:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 4/4] tests/intel/xe_pmu: Add multi client engine
 activity test
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <soham.purkait@intel.com>
References: <20250529065359.915117-1-riana.tauro@intel.com>
 <20250529065359.915117-5-riana.tauro@intel.com>
 <aDieB2lFm07cGubp@unerlige-desk.amr.corp.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aDieB2lFm07cGubp@unerlige-desk.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0172.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::16) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS4PPF69154114F:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d08587e-0532-4a05-cd77-08dda269211a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aU9lM0l6TWtwUEROU1Nwd0lDZklPVmxoaTlqL3JxNFBVbGlBZFdSR1dwREF4?=
 =?utf-8?B?ZHkyUzhWZkdLTW41WGVmdkFBeW9FSCt6dmY2UVFQSzdKMXFwSW91UmNmUjZr?=
 =?utf-8?B?QXFmVGFtdWZiditEKzd5YnFraCtMRHIrd3RhR0ZuaTgwYUYwejRodWJmZVZJ?=
 =?utf-8?B?d055ajFPb3poejhheDhJTTRTREdMYU9lNTFKK1BYbHRxOUJRaDBWc1NvWlhz?=
 =?utf-8?B?Y09lWnJyb2Zmbk9TbU1NdXdZSGVzNGpBVFY5enVpL05KTTMwZlR0MDFPc1pC?=
 =?utf-8?B?cXFQbVJxYThWZ0d4NENQbUo5ZHFDNTUvTEtxaW5na2dqdVZmNzcySkl5NjZJ?=
 =?utf-8?B?eGo4ODV1bTg3dE53cmIvYVhacEVaMjRLQ1RFOHhiYzZzZ1A2NHA2RlVsMG9k?=
 =?utf-8?B?aGw1YWRVYWhLVGoyS3BrWVF4WGJkNlNrM3JWam5lTWxieGNCcmZ4endtcnRz?=
 =?utf-8?B?bEhlZDZYL0pwYmt3cFJGLzhYY1BuKzkvd1FEZldzczcwQkx4SUs4aGhCVFA5?=
 =?utf-8?B?MGk5TXJPcnhjYzJhMXZ0RkI2ODRwTlRIWVFqRUo5cVJWN1dYanByaUYyWFZD?=
 =?utf-8?B?M2R6bUxQZTRvNUhUaU10SUdJOEdGTWowMzRmbVptT0hPVGdXTjBNVVY5Mk1H?=
 =?utf-8?B?ZDFpVzlzZElyMklFSGZyNUI5bVNENEVRK2RIenV5eDhmOEw4cGRBL0l6UmYx?=
 =?utf-8?B?YTdKZ1d6VDl3bVZxZ0ZQWEYzZnpQdC9SYkZpd1NZaTA1SFdpeGZLQlpBbmZS?=
 =?utf-8?B?YVVSZDNzTHl2NDZ6eXNzREhvcXRSM0xDYUp4Y2RWQkZlRW9OZUVjanA3L01L?=
 =?utf-8?B?WEhqYTcwWXlQdmN4NXNCYVlNMG4wTEJzYmZsMTV2RzlVSnkzdmNVdnY1NmlI?=
 =?utf-8?B?eVh2Q1FsbkczS21qRlVoandlZXVJZ2xEMHBoV3NhNXFSVzdyNndqRDNocHpI?=
 =?utf-8?B?WUFaYTZBK3lXTkNZNHVLdEN2dVByL01YdmtNd3c0N0JxKzM1WFRTWVh0bEFz?=
 =?utf-8?B?dDRjMFJnZG9JKy9lYzY2Y29MZm9aS01zck14b2pjY2R6UDNNM3ROM3MzOTRP?=
 =?utf-8?B?RlR6QzB1THkvNkp1MnFsZ09IY05FZEtDUEpGcFJmTVZJSjRRaXdKbzl3OWxB?=
 =?utf-8?B?QnBXV3N6KzVIQ1I3aHM0MmhqSWx5Q1k0VWRkaU1zSXJXYTVwUGJkUU9BY1Jw?=
 =?utf-8?B?LzFxZVRRTUZ1dmJCa1lWaWlqM0R0VkhLUUxhSjZzMXRnc0FBS3VQU0JPNm9B?=
 =?utf-8?B?YTc2RXJIMXJEcXYzdjRkZnVQSVc4bFdSS0l4NmNzeFJyUGlXR29tOWI0RWtv?=
 =?utf-8?B?VTFTMDI3WC9CUGVyOW5xTFZSbHA3VFNBc3NwdUkvUFZIUFhnU00rNWZDelNW?=
 =?utf-8?B?dDN0M3VLYVhiWkhHUHBnL0VzNDFiYlBxMVdsOTJZUVdBNGJPODg4eDB6L0xk?=
 =?utf-8?B?b1BDanVMUko2dXAxVUJ2Ni9BVzlUb2U3bWJJOFIxWU9POTE4NXV2eVhaZitt?=
 =?utf-8?B?andxME9EK2FqaGdzRkM1OTFWZk40VTBBZmoxODUrNkt6SXB5cWc3bkRNdkph?=
 =?utf-8?B?N3NNbGt2R0hLaFJOODNJN2xFZ3hZVHhkL0hnd3pncUpSa0llQUUyZDI1QUNv?=
 =?utf-8?B?bVNXZTJ0NnRJbi9FOG9LVFhhM3owR1pKMDc1ZkoxMVFXVy9sRVVEVGxpUG8v?=
 =?utf-8?B?Y3VwcStHdmx2c0JORmszQlZkTWhrbE1EU3Y0UllHWkVVQTIyc244ZVlJNmpt?=
 =?utf-8?B?U3QzeGVHeklBZlJBdms1cHg0ckQxV3hoUUNoMndaYjhOdlc1OFhBOG81NlVK?=
 =?utf-8?B?bzZUUzdldUZzYzhWSVRFbmFwdEdmUDhvMFJFVllwS1VzRDN4YXNDV3pqU2dk?=
 =?utf-8?B?ZWtJcUdQY0pteW9XWjRSUzE4WUt4V2dxNHJtUVVrQjQycHc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWp0QzJaekpuMU9CYWxCTXNFNVF4dkEwVlhDYkNIaUEvdmlUSC9LQXQzcDVS?=
 =?utf-8?B?TStGaWhyOWFUWlF3SWMrcUtwM2pIV2FWRzIrV2RXYWZPRXU4WGoycmQ4ME0z?=
 =?utf-8?B?SU1UcVptTTZBS0t5SkdFTk9NMXFsNlRSNTRzRFNHbWdzS0FrK0hpblZoRGVW?=
 =?utf-8?B?dFlleCtqTDNwNWZYcmUyeW4wQmxyN1BCNTdjSy9MbVRWWjdkc1pPZmFqRGN4?=
 =?utf-8?B?RzlPb1duOTQyVi80OVErR1laaEtSR2tsZTk2aityWmtPNjh0Nkk3UTViUGNP?=
 =?utf-8?B?Qi9kTzJmd09xMWFKT21hZFFWT0VFSG9ZWWd0WkV6SDNsUVNjYXQvNHQxUXBG?=
 =?utf-8?B?dTd3Z3hDTjV5TStsd1NlbmJKT0ZFOVV5dWtDM2g1dXZLZWp1TGpCMitrUGpK?=
 =?utf-8?B?d0Z1SXIzQW9TNG5mZ05KdlkxM1lGeFZZV3hvRzhHeEY0Zml4V254NzlieTNO?=
 =?utf-8?B?M0w5Q2h6b2pwSSs4SStPVlRPQWFVVytta0JvUlB3eDlpcUYxcVBRSlpDcC9B?=
 =?utf-8?B?bGUyelhZSkhTSW83UktiQytBemlaeXdmREVhMCtVRTIyR1NDdVdSQzU3NWRl?=
 =?utf-8?B?eDlDWi92QUczRDIrY1JmcjNxa3gvQnhCZ0FnZHJybDYvNHA0dWVtYXBSUS9Q?=
 =?utf-8?B?V3dhbjExR0NBV3FWVWFGRnRKS0ZiaUVmL2swOWluQ0VBVnFmNGlwRVRZeFlt?=
 =?utf-8?B?THNZOE9yK3BYcERBZC9OOEJuVXJ3SVpyOU9NMEUyYmQvTDR3ZXMxZSt3eUx0?=
 =?utf-8?B?RWFxZ2RiUnI4ZGk0N2d5Q3VZVWFrN2RGOGR1T2kvSjV2dmFYRk9jZlc4djJ4?=
 =?utf-8?B?QXhtcHNRNUQxeUZoRGFjS0NJQk5IL2lxWGl5Y3lPZE5xcUN2SVRaOU0rY2Ft?=
 =?utf-8?B?QUNuUlFGTTFtQ2dCRkdTa0RWYlVCdlVXVHpVeThlaTgyNVJWUkFCYS8yL3BZ?=
 =?utf-8?B?US9SSkZ6STRoVGZmSGEwSzQzV29WN29UUjZwYS9DVHJvcUhXWk9zZlFVdmxV?=
 =?utf-8?B?SnJFZzArVGgvZ2tZSFhoeUdMa0EveTVnM1JGdE9GbFpQTWs0ZllMWHlDY1hh?=
 =?utf-8?B?U1QxWkVIa0hPckRzdGJ0dFJFVnUxWWVOaStIS0RyQkJkZzNBR0xxOGlZeXZh?=
 =?utf-8?B?dy9CZk11VkhrbmtBK1hsOFVTK3lEUzVBM09DYklJeEZkM2VpR3NtSlZaRWlT?=
 =?utf-8?B?WG9rUEFnVWpaTnE2eU9DNGxLc0ZkYkYyN1BoSjhHcUowYllxY1gzdmMrb3pT?=
 =?utf-8?B?eS96VXpzZXpRS3hyQk1aelp0ai9nK0VXYUNTK29FWmxYUk5GL1RqVCtXbklp?=
 =?utf-8?B?b1FCZGRDSldpU2hkNkdsTHNQdzV2c2k4cGpYUXZYT3g2eWoyT2Iza1dPMnBu?=
 =?utf-8?B?N0VPclA1SlJlZWVHMmt5Vm1ObU1NVUU3aXNuenpmdDFSQlVqZE00K1ZyQzBz?=
 =?utf-8?B?Umx4KzljQXFPVTZ5NE05MEU4ZmxoY1hhVnBwQUNmRDJoS25iK0hGRktiRWpP?=
 =?utf-8?B?UFN4RFBwTWlXZFF4bWFRQlJEbE81c2FvS0dqN2NhRGpja2FLMjJLcnVPK0Rk?=
 =?utf-8?B?OE9IUDhreUlSTGozdnZaQ21TM292UWR6TklwaXA3aGlpYkl0REdIMjB1ZVlF?=
 =?utf-8?B?aGFZcXc2UnFvczFRWHltNTBWQ3lsZ2ZuVFFlbmY5RlFhWisrWVlQbUhDby9x?=
 =?utf-8?B?WUR0K0xJd1FUV1JoZUJ3SmNybmNTZ2VRY3k3YnlEVTdNS1dzYU1pTEFXdWZy?=
 =?utf-8?B?aFpJejMvTXhhbFFnb2FJU3VWWHoxckN0R1ZGN3gyL0RvcVppekEra1JhUFRR?=
 =?utf-8?B?WFZsSjAwOVVRbVRLREVPaERPbW5ZRkhzOTQzTnI1SmlCOFFIRCtQZTNnZmZP?=
 =?utf-8?B?ZnB1dEgya21SanRyTjlOVklwNGQwVnl0MERxeVhtd3YwbE50VGZQbERWUnVN?=
 =?utf-8?B?SktyeFY5T0lOWXBBdGNPR3FIME9WNk9RVW1pdVp4OVlHUURtQVVGVTBuTmJK?=
 =?utf-8?B?QStxN3RJQ0xNVWtnYkQ3a1A0bXBsVFNhUER5M2wzYXV2UHh2VElCdlBsWFdv?=
 =?utf-8?B?QndFR2UyRmdLOVp1ZjVkdnhGU0pTbTFwSE9SWENQRnE1TEhTdjE4elBaZW81?=
 =?utf-8?Q?R6ZcvsBDc49D8NOOr3F3YRzvp?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d08587e-0532-4a05-cd77-08dda269211a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 06:37:37.1101 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9SzsseJASsN7glsQlQW2pXtiTb9hAgYt8SKCkggJu2E8Ft7+rmsk75HIk2fnVO0JwBd6ZjyixN0ZhluBxTQySw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF69154114F
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



On 5/29/2025 11:18 PM, Umesh Nerlige Ramappa wrote:
> On Thu, May 29, 2025 at 12:23:59PM +0530, Riana Tauro wrote:
>> Add a test to validate engine activity by opening multiple
>> PMU clients and check that they do not interfere with
>> each other
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> tests/intel/xe_pmu.c | 60 ++++++++++++++++++++++++++++++++++++++++++++
>> 1 file changed, 60 insertions(+)
>>
>> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>> index 21b294167..225b3b42e 100644
>> --- a/tests/intel/xe_pmu.c
>> +++ b/tests/intel/xe_pmu.c
>> @@ -46,6 +46,10 @@
>>  * SUBTEST: engine-activity-suspend
>>  * Description: Test to validate engine activity on all engines before 
>> and after s2idle
>>  *
>> + * SUBTEST: engine-activity-multi-client
>> + * Description: Test to validate engine activity with multiple PMU 
>> clients and check that
>> + *        they do not interfere with each other
>> + *
>>  * SUBTEST: engine-activity-after-load-start
>>  * Description: Validates engine activity when PMU is opened after 
>> load started
>>  *
>> @@ -612,6 +616,58 @@ static void engine_activity_load_start(int fd, 
>> struct drm_xe_engine_class_instan
>>     assert_within_epsilon(engine_active_ticks, engine_total_ticks, 
>> tolerance);
>> }
>>
>> +static void engine_activity_multi_client(int fd, struct 
>> drm_xe_engine_class_instance *eci,
>> +                     int num_clients)
>> +{
>> +    uint64_t before[num_clients][2], after[num_clients][2], 
>> pmu_fd[num_clients][2];
> 
> This can be
> 
> struct client {
>      uint64_t before;
>      uint64_t after;
>      int pmu_fd;
> }[num_clients];
> 
> Also, if num_clients is only ever going to be 2, you could drop the 
> parameter to this function and just use 2 internally (maybe as a macro).

Sure will do that. Thank you for the review
Thanks
Riana
> 
> Otherwise, the test/logic LGTM, with or without the above change, this is
> 
> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> 
> Thanks,
> Umesh
> 
> 
>> +    uint64_t ahnd, config, engine_active_ticks, engine_total_ticks;
>> +    struct xe_cork *cork = NULL;
>> +    uint32_t vm;
>> +    int i = 0;
>> +
>> +    vm = xe_vm_create(fd, 0, 0);
>> +    ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
>> +
>> +    for (i = 0; i < num_clients; i++) {
>> +        config = get_event_config(eci->gt_id, eci, "engine-active- 
>> ticks");
>> +        pmu_fd[i][0] = open_group(fd, config, -1);
>> +        config = get_event_config(eci->gt_id, eci, "engine-total- 
>> ticks");
>> +        pmu_fd[i][1] = open_group(fd, config, pmu_fd[i][0]);
>> +    }
>> +
>> +    cork = xe_cork_create_opts(fd, eci, vm, 1, 1, .ahnd = ahnd);
>> +    xe_cork_sync_start(fd, cork);
>> +
>> +    for (i = 0; i < num_clients; i++)
>> +        pmu_read_multi(pmu_fd[i][0], 2, before[i]);
>> +
>> +    usleep(SLEEP_DURATION * USEC_PER_SEC);
>> +
>> +    for (i = 0; i < num_clients; i++)
>> +        pmu_read_multi(pmu_fd[i][0], 2, after[i]);
>> +
>> +    end_cork(fd, cork);
>> +    xe_cork_destroy(fd, cork);
>> +    xe_vm_destroy(fd, vm);
>> +    put_ahnd(ahnd);
>> +
>> +    for (i = 0; i < num_clients; i++) {
>> +        engine_active_ticks = after[i][0] - before[i][0];
>> +        engine_total_ticks = after[i][1] - before[i][1];
>> +
>> +        igt_debug("Client %d: Engine active ticks:  after %ld, before 
>> %ld delta %ld\n",
>> +              i + 1, after[i][0], before[i][0], engine_active_ticks);
>> +
>> +        igt_debug("Client %d Engine total ticks: after %ld, before 
>> %ld delta %ld\n",
>> +              i + 1, after[i][1], before[i][1], engine_total_ticks);
>> +
>> +        close(pmu_fd[i][0]);
>> +        close(pmu_fd[i][1]);
>> +
>> +        assert_within_epsilon(engine_active_ticks, 
>> engine_active_ticks, tolerance);
>> +    }
>> +}
>> +
>> static void test_gt_c6_idle(int xe, unsigned int gt)
>> {
>>     int pmu_fd;
>> @@ -889,6 +945,10 @@ igt_main
>>     test_each_engine("engine-activity-after-load-start", fd, eci)
>>         engine_activity_load_start(fd, eci);
>>
>> +    igt_describe("Validate multiple PMU clients do not interfere with 
>> each other");
>> +    test_each_engine("engine-activity-multi-client", fd, eci)
>> +        engine_activity_multi_client(fd, eci, 2);
>> +
>>     igt_subtest_group {
>>         int render_fd;
>>
>> -- 
>> 2.47.1
>>

