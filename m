Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1466DCA101F
	for <igt-dev@archiver.kernel.org>; Fri, 12 Sep 2025 06:33:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D80A10EBAA;
	Fri, 12 Sep 2025 06:33:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YPz3XPYW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D23B10EBAA
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Sep 2025 06:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757658820; x=1789194820;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=KViae6Z3Z5DKtwozhkkH/CJ/ciRJzJhFQtSUdCbhnVE=;
 b=YPz3XPYW4NyjJs9cKlSyOTjfxEHN1s2CjyK9ilqBjgCbt1Aw/ws0lf7C
 ALG32SqKj7nX09IBInMGVXvwRNlwF+0l9opbcDF5shis8ui8tbC/B4hml
 NILdYHcO+VG5NhSK6WAXlzrwseDojPrBDruBbm7aMPxS2E2ZtpcWJ4lnV
 BW62AfHvVx+2zWNh/w4nMzGWK9QxD7Y5TGzI70glOS7uFGfBY1nQXfHB3
 gkoCABF6eEvmkFNI00dsQLvSWpcClQB4RCxnQE9CUH4mThpjYadtZYxAO
 zgrx0IXvQQyH4IjlB2/O1fjZHA/9mvL68bEnlJl8esyVItvz3q8jhof9v A==;
X-CSE-ConnectionGUID: DUdKdPM+R4W/B0e5bVhCQA==
X-CSE-MsgGUID: iG1WrZoDRdiV6+RP8nJmew==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="59230361"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="59230361"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 23:33:40 -0700
X-CSE-ConnectionGUID: iPGPlR2URkWPxlF416sXaw==
X-CSE-MsgGUID: lIIpxE+xRDWWujr4ldmC9g==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 23:33:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 23:33:39 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 11 Sep 2025 23:33:39 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.72)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 23:33:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xpoYoDNHdmSUK9PNvjE0g2ycSaW26WQIiWyWjyKDzHWxGdd+0q9LQkgW35zu3UmCQOPIoQVZ/LF4AfDRcYmVJbjdOal/rLvud8bNQIGljTOMKzolr7ZfNH9qCWeA+GuAkrco6TqkuxMz2JqyaT/g6lNZ65K8u3UwzFCXhvZkkgK4BB+tqwD0b+v8SWUBnsh3rgqgAU1ErtqeArw3vg5HrgYf4BJ2v6DcVGJ7XxFXX24HJuRS99EKGm9y1YpesAwaG/R9x7plASyrlvB+Bjyk4tk8XtG+oj4Gu8d08CP1+Gai9y6Xf9y1OglLHTqS9i3sp7THMGOLKzOr+OESVAnUqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0jkLrbSYL3Ts4QAurrLObchI4fMsK1UAx1HOzmHUCG8=;
 b=WSd4GWv/+DRKLZWZu/7Nkv3WvpBxZds0b0kPk8kfwmuirA/Ytd6v6LLV08Bwa17DcZ+dP7GGK7gLEy3TktpspW/tgmQeXiV8RKQGp+O4JllL7PtgBome2TYzRb7znJGnCqPjRvzReAgsEsJTa5vOQ8WUaA11nMoAk2hJW9m1OdJTUxEWTYPLGcIWgX47my+8br8u2dReTyWURgkGM15EXVpec+VojBHoHxKukEeC0N5haHebfc+6CJQnIJ5H32oP5PylkdSwZx4tOoTlFoHMDNbPn5lS08YdGJNm2xwMhCegzkApdCe1fPIWaOrYI6ly3RSH/8hTLGHemvh4roNhmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 IA0PR11MB7694.namprd11.prod.outlook.com (2603:10b6:208:409::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.22; Fri, 12 Sep 2025 06:33:36 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::90cc:99cc:2d53:d848]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::90cc:99cc:2d53:d848%3]) with mapi id 15.20.9094.021; Fri, 12 Sep 2025
 06:33:36 +0000
Message-ID: <049e9a72-654c-4071-a544-7c8a38eff22b@intel.com>
Date: Fri, 12 Sep 2025 12:03:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] Revert "intel-ci: Reorder chamelium audio tests to
 fix init issue"
To: <igt-dev@lists.freedesktop.org>
References: <20250911175841.1298783-1-jeevan.b@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250911175841.1298783-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0171.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::17) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|IA0PR11MB7694:EE_
X-MS-Office365-Filtering-Correlation-Id: 738dd391-c35e-4491-5a88-08ddf1c64d81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZWdwcHZNMmxHRHc3Vkk5SFZ1QW9ZQXgrZ1Y2OExhWk0xRDU0M21KOVBDYTNy?=
 =?utf-8?B?WHFiajZHTGxHUklhSHcxM3RGc3NVdmNSaFlpekZxWVV0MWpUVVc4bXI2SW9E?=
 =?utf-8?B?MHpWVXZ5S2MxWFJkMEMwMml2Wlg1cTZiTnh2bDdoMncxY3JON3NvYXovNzJl?=
 =?utf-8?B?cEZnLzdGUzFNUTJ1TVlsQXdSQUFrK2wrZFF0QjRMOFJtWG9MdU1jTzg5QlBI?=
 =?utf-8?B?MGlPd0RzWHA3WWVvZVorUGI5elNRbXRuREVNUHlsMG9walBUczlIMzVZTUIy?=
 =?utf-8?B?TVNxR3pFMS8zSmNnQ3FkdGxRS2lLNWxzV0dNT1dzZTNpV1lveDJobWMvcHoz?=
 =?utf-8?B?K1RBQzVtTzUzcXNNUm13UjR3eEJSTEc1bEhmRUp4bmhEK0REUENHdS9MNFJh?=
 =?utf-8?B?NDRhbDcrWVFGbVUyVkFoOU1CRzEyQlZJL2lQNzlwK2s2eGlibmFaU2V6UkxF?=
 =?utf-8?B?THhPNFF2Ujc4VHRISm8yYmtqdEFkRVBPdGpkM3UrR0VtSWNFbGF1L055WEpV?=
 =?utf-8?B?bkxjM1NURzg4NnUwVGV4b1EyU2lqQU5nZE8rdjRFTEVycXhONm1CUmwvY3cx?=
 =?utf-8?B?cEx4Y2ZTT0RCODE1Q2pGVTM4U0JTT1h2Q0o5YkxoVTJhdHFQdS82Wm5nSlVi?=
 =?utf-8?B?bWhFUlRiS1FpN3ltSFl3VXAyYkNRNUxlQzFoL3hEVTZVU0lrRmxuNkpXbE1D?=
 =?utf-8?B?eHhhN0pZNzUwTTVPNVlKa29XMUwxQ2RxWkpoZ2VMUkJ6Vmx1aFFVcUdkSXYv?=
 =?utf-8?B?Rk16ekpxVVIvZzlaWGs4WmhmWWJ6M0dGcTMySGgrR21JdkNwUklLRExCamxT?=
 =?utf-8?B?cmE3R3kxTHllOGhRUkt4bU9nQTlWdG91OVhsNFVRUzc3VE0zVFVBVG1ZQ2dv?=
 =?utf-8?B?aTlaQmMxUndsVlFFckNXNkFzcXZCekw4ZUdjVXRiejVKUlRDc1N6NUh0M2Va?=
 =?utf-8?B?RTZpYWRYMFpNRndaYWlCTzZheHZDOGh2d2tmN0cwakRNRzlFd3p4UVJ3a0lU?=
 =?utf-8?B?c1lXZjI5b054R093MHBLSW83cWlPaXFweEZNWS9zSmhnVDJiRjlKT3lhVmZ2?=
 =?utf-8?B?UUZtbE9ZS1QxdGg5blVpV21yVHY1RitkOWpvd2FHc0ExTE0rYVdBblpuZWdS?=
 =?utf-8?B?ZjJ6enJDYTdlcmlvSitRL05GK1g5akNJbU5ZU2VBbFBtS21pZWlIUDJXQUxp?=
 =?utf-8?B?OGozMXFJQ3NGTWJpYzVodTNuWTMrUk9zeDlwbWhlMHlJNnpMNDc0cnYrSFVU?=
 =?utf-8?B?MVZrQmt2dStZaEhGUXRFbi92RmxFZG5DT09JNkZSZzNpUlRtbWdoUGpmeVpo?=
 =?utf-8?B?QjZLRHF6dzhPenJIOU1pb1J2V3lObHdHQys4ekp6TWcxQTBoS3NaSDBKb3Z4?=
 =?utf-8?B?aHA1VlExUEVHK3hpUWVERUJhL3BiY1pvMVF3RjVOdTFVK2x3NllWVHpKWjZS?=
 =?utf-8?B?UU1IOUpscnZXU21xcGpVTXhud09jVVFmcCtIeXZmT3l0QnoyUlBuSElTa3Z5?=
 =?utf-8?B?Wng5UmRkZ3FFeHdQOVFQMmc0YVJTMDBYcjJmS1Rrc2FCUkd4UEp4WHBiMUZW?=
 =?utf-8?B?dVZXbzFvSy95MFIrSHFuQ0l5Uysya0RCRFVzTGVyVjdPYjJFVzlBNkdMMHVD?=
 =?utf-8?B?eGFXYS95ZzUvMmZ6aTRHQzI5ZUVHcFBwUmppQnBVR2FHYytBZFNXMEZBMi9a?=
 =?utf-8?B?MVc2WE80cjk5aUY4VElwMC9nME5tZ2gyR1c0NXR4R1ZVMVZOcS9JUTZ2Tzh0?=
 =?utf-8?B?RXpVbExnaGtkMWk5RU1zSEdwV1UyYWxGd25NRTJhdDhUV0xMc29STHM3am5U?=
 =?utf-8?B?RFBHKzlkYVhtL3Myako4d1grWmdNVlNnTng1MnFsc09HbXZvMjkvUVNId0NN?=
 =?utf-8?B?T1BVUHZSam5QQm0xTWxickpGUCtYM2xaUXFaR01JcnZ6VDdsWWk3dFZtWHVL?=
 =?utf-8?Q?5yuwg+kpu6E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MU9hRTNyR0NodjhwYzJFbGwrSWpjbE1KUGhjRll1T2pFMUdlTGl4UFY5ZzY2?=
 =?utf-8?B?WEh6ZDBZbTh0RUY5aHVwbWhZc0p4czRVL0RmNGZ5c1FKWjdBN1JHci8zdEg0?=
 =?utf-8?B?QnNmSEc0cml1cFI0bmM2UWJFWG82TUl4bVMrRDlEVTBVcHdoNEM4Q1FEQ0ov?=
 =?utf-8?B?T3Y1Qkd1bllMdlJpY250M0VHTmVuNlFTa2xZYmtZZzNsb2ZRZ0I1NUY0Snhp?=
 =?utf-8?B?UThXSFRIVno2QU9nVFREWFN4V0pmd0lHdzM4V0JWWEs2QjJ1SWdaUW5lSU5l?=
 =?utf-8?B?RFdHV3VuVDc3YWJaWmFyOWcxdWZTanNiSDE0eGpreVBFbEpMdmsvejZ6YkpM?=
 =?utf-8?B?Nmw0UHF5amFUdWZadkhEYktRR0tseEd4UlQyenprMCtnOUR1aGVxOW9HcUFr?=
 =?utf-8?B?OXNqMURMMFdZZ2MwNFFPYWYzOGlUZ21rR0xpRTZWMHNOb2I5NVd5OW9vQkRl?=
 =?utf-8?B?NFBtVlBaR2p4dDBPQk9iK3NSK1NNUFVVSmJRU0VNUE5CVnJOQm5rVmNvMHNO?=
 =?utf-8?B?Q01RRnUzOUoxb1pLNk9PczA1NUFMVkVTWWROQ1dMZnczQW5sOEVyQWtrdmZQ?=
 =?utf-8?B?cVZYemFHQjRMR2dMaStiZ1RHZDNPQW9DSVcreXBRZmFTV1huL3lhQytMenZD?=
 =?utf-8?B?V204d0ZpMWRrREY0bmF3c2pLQ0hsSm1BeEpEelRsa3d6YXBDZW9xV3NCYkk3?=
 =?utf-8?B?TjRkUHl5TDRwc0xPRXlUT0w3Z2JqeDAzbXpQMlBVNDRLdlZ4am14dG9TZXY5?=
 =?utf-8?B?aWJJMFRNTlcvVCtoL1U0a1BxcGQzVzRBTUE5THNkd1NuVnBXVFdTTTFncHY5?=
 =?utf-8?B?Mm1Rcm5ySEVVL2QvQXBBNlhGTTFNa3RqRUo3N0VrZDRvZStCeTk2N2JHVysz?=
 =?utf-8?B?R2hnMzJ2TlBwL1JTRnJPbDhIVDMzK1JiNnJFQzJjOTFHUVhNVXNlWld2dDhy?=
 =?utf-8?B?dkhCdFZtUVFlWFFNci9tRU9DSCs3cHBidFYySDdiaTFsUldtMXl5VGRBRngx?=
 =?utf-8?B?ZnNFbHpDYWNiVWx1cTIvQysvbmxIdlpIMWw4dmMwd0luWTZRZHFQVUZMMmRW?=
 =?utf-8?B?NE52NklZaHIvcGhzamxZNWN4UHVJTjlBMGdNTzV5MGk5RWJldVdwUzl4bW1x?=
 =?utf-8?B?YW1IZk1jNC8rbUN4eFk1VTNmSHNBWmQ4QnN2VGU3czBWeTBXZ0tHbC9FMS9v?=
 =?utf-8?B?dDVLWlBTYlBEUStlZ1laTWxvODB0Kzk1L3ZXbG55S2ZhUnlWdDN5MFRmMFB3?=
 =?utf-8?B?cGlPSUkrdjNFd0JqeHpObzZqbDVIZkNjdldrNW90RTIyWlZXVEhrYjJxQ2hK?=
 =?utf-8?B?KzJNNmRGcmsvOFdTYVZvL1o2dWN4aGZSV1NIZC8xbjlKUE9lUUVYVTlVcm1n?=
 =?utf-8?B?WHBsV2RvVi8xMGhOMmdTbndrSXUvK01ic2w3QjFRWUtKUXRMejFHS2VpOFEx?=
 =?utf-8?B?OUljU1FIRHp4RE8zcE1ZTHUvTDNjL2JXQ2o2dVhxVmtqQVVpbURNN1owRmF1?=
 =?utf-8?B?OGQzODZDc3JFUW9aY1NuSTVZbElIWktsSndHMG4vQlZmeTkwNTlvREZVaEhV?=
 =?utf-8?B?Wm1VeUxXV2RsdGJ2SzkwZWo2ZXhtek5mTWVTVC8zcG03NnNLUTh4RFhCY0NR?=
 =?utf-8?B?TGNZZGZMV0NXWk5oUm9zOWpFTDhMNGsveTMwZjBQTEpXem1xR1dsR0NZQ2t1?=
 =?utf-8?B?LzVSbkRSZDZ4VWJOeS95WUwxOG0ram1KcElqSDkvQytoY1IwdC9zRU5ieTkx?=
 =?utf-8?B?OStNb2VrWDgrajRHR0VZT0RDQ0gxMG1nWXNtQ2Zta1NJQk9XblRvTDBnMnVY?=
 =?utf-8?B?dGV0WVFKYU1IbTlseTlJSjFCL1V2NUM4dkQvaE8wcW9FZHNsTy9TckJMWDdH?=
 =?utf-8?B?Z2MxblRVUUorOXdGQ2tmUTRFbkdRZkhtWktKQVdXY1FnMWlqT1AzUEkwMlJJ?=
 =?utf-8?B?eGhicnJ1WHYrSlBiY0p0RWY4ODFDWmd1eUlIU0N0bG5pbjhXMkhKR0t0OS9O?=
 =?utf-8?B?bDUxYVIyUzl6dUdMQ1ZxOTBrSDBuVTJMWVlCL1RSZmlGZVVMY0Zoa0VMOG1Y?=
 =?utf-8?B?VXlSTS9aN3B4MVJaME11ZzRNUU8ycVN6MWYzTU9tN1M1V2NoZU0zUXd6bkFw?=
 =?utf-8?B?NWh5ZWhBcFEzZm5MK28zK2liQmZROWpNdlpTOE1NOWtYRlJ4dEsra2VwTEh0?=
 =?utf-8?Q?Y3gr06O4DFFcprDj45xxKDs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 738dd391-c35e-4491-5a88-08ddf1c64d81
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 06:33:36.6110 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b3zi/ZQa55pNjqqJnqXzUiJXEdkYB4pcBGwvfohWYzq+j/cuGRiqYlxoNbzE41s1zDsGOkaPYxSa/eZsFHtGK01hutyj0PPyV68i6XRJvNQrv7dnzdPMTi0OEiqOUEpt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7694
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

Hi Jeevan,

On 11-09-2025 23:28, Jeevan B wrote:
> This reverts commit 939fac7f7b11a8902ebcf9a4bc9c26c14e87e8a6.
> 
> Reordering the tests is not a valid solution. A proper fix to handle
> the initialization issue is being worked on separately.
> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>

LGTM,
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>> ---
>   tests/intel-ci/i915.chamelium-only.testlist | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel-ci/i915.chamelium-only.testlist b/tests/intel-ci/i915.chamelium-only.testlist
> index 22e12108d..fa4e4e588 100644
> --- a/tests/intel-ci/i915.chamelium-only.testlist
> +++ b/tests/intel-ci/i915.chamelium-only.testlist
> @@ -1,6 +1,8 @@
>   igt@kms_feature_discovery@chamelium
>   igt@kms_chamelium_audio@dp-audio
>   igt@kms_chamelium_audio@dp-audio-edid
> +igt@kms_chamelium_audio@hdmi-audio
> +igt@kms_chamelium_audio@hdmi-audio-edid
>   igt@kms_chamelium_color@ctm-0-25
>   igt@kms_chamelium_color@ctm-0-50
>   igt@kms_chamelium_color@ctm-0-75
> @@ -56,8 +58,6 @@ igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe
>   igt@kms_chamelium_hpd@hdmi-hpd-storm
>   igt@kms_chamelium_hpd@hdmi-hpd-storm-disable
>   igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode
> -igt@kms_chamelium_audio@hdmi-audio
> -igt@kms_chamelium_audio@hdmi-audio-edid
>   igt@kms_chamelium_hpd@vga-hpd
>   igt@kms_chamelium_hpd@vga-hpd-after-suspend
>   igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode

