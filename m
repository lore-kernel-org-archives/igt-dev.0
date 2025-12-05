Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E0AD2F7CA
	for <igt-dev@archiver.kernel.org>; Fri,  5 Dec 2025 09:29:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F168810E0F1;
	Fri,  5 Dec 2025 09:29:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lMGOtHO5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7961510E0F1
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Dec 2025 09:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764926959; x=1796462959;
 h=content-transfer-encoding:date:message-id:cc:subject:
 from:to:references:in-reply-to:mime-version;
 bh=ooP6O8l4AQo377l9k6D5ndcjX54ZW7GkVabGCT83f9M=;
 b=lMGOtHO5sko2HgSqedFdb9mxaaW+dzHOMWarJ7ha6xCaWr8UWD2WE/Ja
 M2+J0lyp2NVChowHNo56649A3Mc9KjcVuykkY5upMr1m1DvBIxpT3MNM2
 vcsOMhiNXFfAzPjHYGDBC7LKYlhri3gsTE/Lbo+vgKPTfy4uSwJ//WYj1
 fbCXeEmGZY0HRcMtdXhKZ6fyXor/wdLzC/M7dlwd/JaU0oLKXINvPugow
 7mJ4f4M3LguydCjw96bnDeADz0Clo6qf6kQ+OHSwKcdiA8YPugOiyYsaI
 FRERgpGqUfU1c6zMSGCVJVsa4ps5ocg7YCJwSwf9loCtAxHbWOIFY77ia g==;
X-CSE-ConnectionGUID: OvqIc3G0S++F/aI9L6ulcw==
X-CSE-MsgGUID: /Zn1vB10RHGDpJdWhDo7vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="77577417"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="77577417"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 01:29:18 -0800
X-CSE-ConnectionGUID: LgTQTTY3RQC2uz91Od5+WQ==
X-CSE-MsgGUID: gJ0wHHPLTTy5oN7h1rV8Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="195067898"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 01:29:18 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 01:29:17 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 5 Dec 2025 01:29:17 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.24) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 01:29:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UpnAgFljVRSzKlkqTbbLkU84V9OEnk2NPeZ+TlV2ssvlfEd1xIwBJWHu0//vAbLwEmId2LVrIPF5c0O2aL+wWD0YnROvnXsW2z+j5aNgxYZzLT2f0QpKBKgEXlpbGrWkqb9mXZELsLEJsHNAAo4siIlJXXxIYocL02mgzpVtEzXdWWWlgQc16cOsMF38dJ7Ux8M/+MG/bqmI2ewx5lO1foUX2VrR6N4MQ8puWppvUGlb0zYYg461OZ4qmrAlFTvEfvtL5aNqKuMTX6Aaxcyc/WjESsah3g7GaAPQEyY5IHTeORdv8DjkZImDmSaK9R8X0ghS3jijcMLqcycDS2vQkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a8RmRkqG7MV2DpKrY7zMQH0HhIDSUDLHSpw1TRVQV/w=;
 b=fZ/8Qdmg8R0IMoqrx1OV+GNByhZrxpis0ffGJk6dCXFzf12/QWCY634PWhJJyLGVzdkdPzJYEp+cTQ4/AJiuCIrHXhqMH3HBqFy2oRm8PB2BC3bWoTquIG3VhzPXsk6x7uh6GAkMlXtzPiMOJ0BAwVoWiOMIb5EA+0BvRaTE9d4/HLS+f+yKAHbJIonZxqqyAR2/OXSuamHmbTfahy1sWad0c70gE4a0GhIu0GZ72QygKoFisiNorWtFCUbCwqLDxWbyRFNbbgUHAbQIq+BVZMHaRV1tYX0QRcyOUjb8Q2WenGkEYGeAPD1jXy/G3IFhuVlIRZIwmTmt+KO9X5g2AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by PH3PPF1BAF94C4A.namprd11.prod.outlook.com (2603:10b6:518:1::d0d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 09:29:14 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0%7]) with mapi id 15.20.9343.011; Fri, 5 Dec 2025
 09:29:14 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 5 Dec 2025 11:29:13 +0100
Message-ID: <DEQ7NZ3TEKXT.2WOLP25UXM7HS@intel.com>
CC: <jeevan.b@intel.com>, <kunal1.joshi@intel.com>
Subject: Re: [PATCH i-g-t 2/2] RFC: chamelium/kms_chamelium_hpd: use helper
 function for connector lookup in DP/HDMI/VGA tests
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: Moahmmed Bilal <mohammed.bilal@intel.com>, <igt-dev@lists.freedesktop.org>
X-Mailer: aerc 0.21.0
References: <20251205074602.658783-1-mohammed.bilal@intel.com>
 <20251205074602.658783-3-mohammed.bilal@intel.com>
In-Reply-To: <20251205074602.658783-3-mohammed.bilal@intel.com>
X-ClientProxiedBy: WA1P291CA0008.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::19) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|PH3PPF1BAF94C4A:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c4e46bc-65ef-4afb-737d-08de33e0c129
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OGlhZmpLY2xxRUdGYVZwQndGeWx0YTc5RFVSOE16OE5WMFFrSTQyNGY4R1I1?=
 =?utf-8?B?eFlDNmllamRQc3RZbjRsRkJoY3FzdXMxc2U1dWRTZjhmbVFZbW95RHdHNkZC?=
 =?utf-8?B?QTlVdHVNaGxzSG5rVGt4MndGRndMU0g1ZDUwM0hrQ1Z6RmQxTUxLdHJUKzht?=
 =?utf-8?B?N1VNc0JXa3ViTjAwTFVBN3FCSzlKc1NrZjM0STZvSGFtOUxOYXF6RUVmWGZK?=
 =?utf-8?B?cmo1Q1l2dnhBMDRkTlRpQnB3YjFhTXN5Y000QjFqbEJQUVNMUnpjYWdVWmtL?=
 =?utf-8?B?MVZycjR6cjE4ZU1PS0xMNWVONVBkNDNkNHRqWHZsM0ZRY3hyRFpoRXg2SFBW?=
 =?utf-8?B?c0pjOElraktNK0dCVzV1YnFsWk5JQzlOU2lNVERNSnNiUUd4MmdLaHdYMERy?=
 =?utf-8?B?S21qa2prNGVyODRVdlhhRzFNRHk2d2VjT29FQ1BuMk00OGtwSDg0SjhLZm43?=
 =?utf-8?B?VFdMcUFSRG1pWUJQV3JtVFBrNStzTTB2enBwWmNYUEY2dXpLUEhuVm5HZU5y?=
 =?utf-8?B?Y0Q2Nkd4emNXZElMemRvV1BVTFdzRVVHenFZQ0RyOE5RcDVFQWJScDVhSFlB?=
 =?utf-8?B?OGlCaXN4OEh6NW8rOGRsRzhmRWppT2p0dE83K3YzNmpwb21YQTVjZ3FMdjdw?=
 =?utf-8?B?Sm9HRDN0S0RoS1h0N0p4TVlDY2I0cHRIVGZWa0UxOHpsYUFXTDJtTW1MRWk2?=
 =?utf-8?B?N1ZvOUVDWWE5YUoxQUhMUnRCSVJTRXJNajNFNUhjWkh0RDBnck92RDFOTXhz?=
 =?utf-8?B?K3FRdUNJWkZmUk10alBGV283K0pVd2FmVVlBNU1lbC9zSHFiL0NuaitnOHdw?=
 =?utf-8?B?TDRFVzhsSVQ2RExBM2lFT2xvQW44ODRLK21qcHVZYnlHUVB5S05oUE0rWVdW?=
 =?utf-8?B?TExoaUEyYWdLOHBzUmliTGpnS0YvMmFpVUdzNGFHNFdjQmZUOUNwUWxZblgr?=
 =?utf-8?B?RnVadkxrWEdHb2VkbVRpa0lOVlNaeitNLzc0K3J6UW5lMTdVT1djUE9BRmQz?=
 =?utf-8?B?aEZ0dWthcVRrQXNxMnZsclN4NW1GRnhRNkxHUHNWYmRXY1pZSzlrUlBoV0ZV?=
 =?utf-8?B?Ui9QYVkrRHd3dUx6MS9sRlhENzZIVERnMEx2REwvZ3hOMjU2bWtKc3QvbzBF?=
 =?utf-8?B?S0FWdFR1YlhKeElxcVJIWFRidUVGNWF6MHVNSWZWY2Rtc1hwUnRuNk5lM1B4?=
 =?utf-8?B?cTl4TkNZUkp1eldxejl3UkFmdXEzY0IyQUwrb3A4T04vNUlvRnM0SkViS3g0?=
 =?utf-8?B?eGttdE9DN0tGZUl5RFF3WEhFZGo0dmYvTExjY3RySm9FQlRVS212TEpoWEJC?=
 =?utf-8?B?NGEwS0ZvdnVZYWhUeTJLRTJBRjJ4bWJ0WTY4UHl6OVFKN0xEVENpditpQ3k2?=
 =?utf-8?B?UTdKTVltQ0pQa3hSOTVnamRyR2laSVZJVEpZWThyeWVMZi9hT0JGaVdEaG5j?=
 =?utf-8?B?Q25FaE1seUxpc0NtU0NTazN4VFV2VnRYd05YWEpKY0xXSWRCTlVJUFpHQk5i?=
 =?utf-8?B?RVQ5K3o0eVU3NzhXM0pLY0lZNE5EUytSTVZjNnZwRUhKdW1WTnUrbHhyb1d5?=
 =?utf-8?B?UTMrUEdFME4xWDdCYUVsbEJicUw4N2FVclplWDhHa0N0aXdRalVvQnAvV1U2?=
 =?utf-8?B?cXg3WTZYZml0YzBCbG1iTGVNOENKb2s2OHZ2Y1VNc2tYN3ZWWE9lbWJnTC90?=
 =?utf-8?B?WWwrQVVtUjQ1SkRXb29DS3p0UWJUUTduanpsMktrOENyTXhPdysvOWVpNmhv?=
 =?utf-8?B?NEp4ODRsbzdxdkxxeVhnNW4wTXdxYm1zNXV4eU42aWFZR21CdlE5SzZQb1pV?=
 =?utf-8?B?Y1ZOTkZTY1JMV1l3US85Q1I5cXB5Y29wM0ZHWmRsdEFDQk5KN3lCTjB6ckFr?=
 =?utf-8?B?cE13cXI4TTNnbDcxYk1Na3RvN0QzMTMyTGlzbytLdW5uYU4zM0MxdGFxT0FB?=
 =?utf-8?Q?Vz9el/8NOdR4Qe5v16qZthPZO6LOMwe0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ri90VVFjOTlWRDZnWGZKRWl5OFFoZW5vMUFaMUdPYnY5emxZSEtheEtoTkRO?=
 =?utf-8?B?Y05aRytHMWNaZElNVkY0YUlvYjhrR0J6UnVkTDhCYjZKcjhhK1VzWlJhc29L?=
 =?utf-8?B?dUdtejRFZE5BRURGRHArckY3WjFLUmpLaVp3L1RNZDJKeHRObS9LL0RLRTU5?=
 =?utf-8?B?cVlKdDZrc3V0S0REaWVicHZvSE5iWVhPN1BKQzJaQ1lhTWZ1akI0bjBsTG5Q?=
 =?utf-8?B?T3phbE14MGxvYXVNbGpzV3VXYlBaWmpVbkplbzFUWDVxVnZ4UEExdGhHYVk0?=
 =?utf-8?B?SlJvbmZZeC9ROU83NTREaEgwd0thOW5xdjJ6RTk3VWMxUGpqMjQ0RHplQ1R0?=
 =?utf-8?B?T0lBOHlDb2R0L3UrTUFkaXZhY0psM1UzNExPMSttdnFhakJzNmIxZzVQakRB?=
 =?utf-8?B?dFFYVXlEdDM5WVMrL2w2TklwY3RBd2pvVEVVSnpwZ2N2blNmdUZ6clhvY0Jw?=
 =?utf-8?B?S2ROditFTXVnd1FlS2JYZmZ0dmRNQzFzOThZemhrUG9xdTdodkxTR005dDNk?=
 =?utf-8?B?MEFZR2psWUt6NmVVT3diMXN5eU44VG5BM2xXTWU4VjJBMVdQQVRtNTM0a1BU?=
 =?utf-8?B?N1NpT3hHNVlET1FnL1hVTFlWMWJxK2g1VUo4bFUzK09PbVdPWDZPTHIxRGZ6?=
 =?utf-8?B?bHlteDk2NDNvbDJxcVBIb3JBYy9oSThUakVSN2NtWEswSGJLaTVnUzRadnN4?=
 =?utf-8?B?bHZtaUJWZVNabm1NMklJUkNzQVlvUmlVRjJnWXVhL0lYV2JpZ2dBSGtjTHN2?=
 =?utf-8?B?cDVLd2R0R0dnanlkbk40VzV0MmE2SkdXbW9OVzdRSVNpS0NGV3E4RW8yUjBE?=
 =?utf-8?B?ZWZpakg3a1pwczMrc1BWdUZFRFcreVJIN3BLYTJSblJBaFNEdFlKbnB3RjVY?=
 =?utf-8?B?UTNTR2k1QXVHZkpGSjE4RXJYMmJJL3FWZzRvQWY5OTJ5V1hHY3dTNkZORTkr?=
 =?utf-8?B?QzVhTHhUUXpJSEdNYXV3L3BFZjIrKzdaRjJEUW9LUzd4MFZia0ppeVRKVnE5?=
 =?utf-8?B?VFlqdGR0U3Uyb0F1b01JdDFjcDRHSm56ZkNvQlMvblFYbi9ENlVseVRWOVZQ?=
 =?utf-8?B?aEpVdWFrQ0F1OE96SE54cnVWQVdOR3cyZE55U0UrT2lUZFZFUjB6YnhCWHBj?=
 =?utf-8?B?NmhwRFRjY2RNb2EzWGdyK2hIdE1wbkhnTVNjRG05MTlja20ySHZVSUFUSnB3?=
 =?utf-8?B?Skh5ck55ZXVzbHpDclo1NUFUNXhOVVdqazFGbmt3bnZuS3M5WGpZMmFmYUI5?=
 =?utf-8?B?amljdmdsQmFwc2Mzekg1Y0Jyb2xlSEdiVmcwckNjV01JSENWUVdQWS8vZkNl?=
 =?utf-8?B?QjRiMmYyb255cE03NW1mc2J3SHQ3RlZDUi8wMlBWcXh5RHlFVVZxU3RRMWsx?=
 =?utf-8?B?KzYrNzdLMk1qU2xqMVlXVGVGbGZ5VTZHRkRLekZOVFZSRWg1QXlNbGxLZHJO?=
 =?utf-8?B?MjBrOWJzbUEvK20zTUNtWDNvTmRydzNwNWt2cWtCdHZMV2ZYN29VZWxhSU9h?=
 =?utf-8?B?RWFoOXVVa2QzQjJvZ1V2Vm9mamtPWTRzS0NaSmJ4QXlqNDBRSWQ1cmZ4dDZK?=
 =?utf-8?B?TzlRVGNVZnVWdm1zRTBXejJMM0wzMEs1VUgxNUFnaTU1TUYwWFg3cjRoeVox?=
 =?utf-8?B?MXk3OFp2dWZuSUFKN2h6OE8zbytCTWpxWDR5WDZsUWJJTWNiUlZxV2R5VjlO?=
 =?utf-8?B?blgrMFpUVk1FNjg2RG53b1NKeXJZNTJuQW04TlY0MmdnYmNVdHZaU3J4b1Q2?=
 =?utf-8?B?bGdKZGNZODFrSGs0ZVlDM21tUFBGWnNRSWJZemxWWHVBL0JhQVo4ajZCcERB?=
 =?utf-8?B?UlR0QTM3ZEVKNnVjQTFnb3ZvOFlRdlJJM2ZqQkZqck5iQ3FGcWpuQmpaeHBQ?=
 =?utf-8?B?alRzYjdYZ1dDVHExdTBBSGlQN3pIcUl1cithRDQ5L0xJNXByYjJtNEZsUVRp?=
 =?utf-8?B?V0dscEh6NmRvZnJBblFOVmpJWGxoQ09RZngxY3hxSDlDZFQxc28zdVI5N05l?=
 =?utf-8?B?SFlvWHlaRmc4ZnVLaWNEWm9tUmRSYVlRMy9GK2xuOEFMeFZ1dXROSnhVQVFq?=
 =?utf-8?B?bStJK1NIaUFnQ1IycXNtWlk2TFVqMk4xMzRwRFVrM01VMzcrZVhLOGdVM2Ja?=
 =?utf-8?B?N2FEUTJLbVpsMXRKMW55dzIwaUE0eUExd0NMZ2E2SDBXV0d5SkdsMUdRaVdT?=
 =?utf-8?B?N2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c4e46bc-65ef-4afb-737d-08de33e0c129
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 09:29:14.1120 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y5Aq9/QzibSmkR4xpCxotZFT0sE/CG6XDxxhOLUh1N55u0STmE5qtTExmtcuapv4Adc0VjqKlYDfbR35u3EZTUvDtcHxEjTxWIxBAbXUo/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF1BAF94C4A
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

Hi Moahmmed

On Fri Dec 5, 2025 at 8:46 AM CET, Moahmmed Bilal wrote:
> From: Mohammed Bilal <mohammed.bilal@intel.com>
>
> Use the new get_port() helper to retrieve the appropriate connector for e=
ach
> hotplug subtest, ensuring consistent connector handling across DP/HDMI/VG=
A
> tests. Also remove the per-connector igt_fixture blocks, as they were bei=
ng
> executed regardless of which subtest was run. The helper-based approach a=
voids
> unwanted fixture execution and keeps connector selection simple and relia=
ble.
>
> Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
> ---
>  tests/chamelium/kms_chamelium_hpd.c | 411 +++++++++++++++++++---------
>  1 file changed, 288 insertions(+), 123 deletions(-)
>
> diff --git a/tests/chamelium/kms_chamelium_hpd.c b/tests/chamelium/kms_ch=
amelium_hpd.c
> index 3c8af63bd..840363311 100644
> --- a/tests/chamelium/kms_chamelium_hpd.c
> +++ b/tests/chamelium/kms_chamelium_hpd.c
> @@ -440,7 +440,6 @@ static void test_hpd_storm_detect(chamelium_data_t *d=
ata,
>  	igt_hpd_storm_set_threshold(data->drm_fd, 1);
>  	chamelium_fire_hpd_pulses(data->chamelium, port, width, 10);
>  	igt_assert(igt_hpd_storm_detected(data->drm_fd));
> -
Please preserve the existing line breaks.

>  	mon =3D igt_watch_uevents();
>  	chamelium_fire_hpd_pulses(data->chamelium, port, width, 10);
> =20
> @@ -478,156 +477,327 @@ IGT_TEST_DESCRIPTION("Testing HPD with a Chameliu=
m board");
>  igt_main
>  {
>  	chamelium_data_t data;
> -	struct chamelium_port *port;
> -	int p;
> =20
>  	igt_fixture {
>  		chamelium_init_test(&data);
>  	}
> =20
> -	igt_describe("DisplayPort tests");
> -	igt_subtest_group {
> -		igt_fixture {
> -			chamelium_require_connector_present(
> -				data.ports, DRM_MODE_CONNECTOR_DisplayPort,
> -				data.port_count, 1);
> -		}
> +igt_describe("DP tests");
> =20
> -		igt_describe(test_basic_hotplug_desc);
> -		connector_subtest("dp-hpd", DisplayPort)
> -			test_hotplug(&data, port, HPD_TOGGLE_COUNT_DP_HDMI,
> -				     TEST_MODESET_OFF);
> +	igt_describe(test_basic_hotplug_desc);
> +	igt_subtest("dp-hpd")
> +	{
> +		struct chamelium_port *hport =3D
> +			get_port(data.ports, data.port_count, DRM_MODE_CONNECTOR_DisplayPort)=
;
> =20
> -		igt_describe(test_basic_hotplug_desc);
> -		connector_subtest("dp-hpd-fast", DisplayPort) test_hotplug(
> -			&data, port, HPD_TOGGLE_COUNT_FAST, TEST_MODESET_OFF);
> +		if (!hport)
> +			igt_skip("DP connector not available\n");
> =20
> -		igt_describe(test_basic_hotplug_desc);
> -		connector_subtest("dp-hpd-enable-disable-mode", DisplayPort)
> -			test_hotplug(&data, port, HPD_TOGGLE_COUNT_FAST,
> -				     TEST_MODESET_ON_OFF);
> +		test_hotplug(&data, hport, HPD_TOGGLE_COUNT_DP_HDMI, TEST_MODESET_OFF)=
;
> +	}
> =20
> -		igt_describe(test_basic_hotplug_desc);
> -		connector_subtest("dp-hpd-with-enabled-mode", DisplayPort)
> -			test_hotplug(&data, port, HPD_TOGGLE_COUNT_FAST,
> -				     TEST_MODESET_ON);
> +	igt_describe(test_basic_hotplug_desc);
> +	igt_subtest("dp-hpd-fast")
> +	{
> +		struct chamelium_port *hport =3D
> +			get_port(data.ports, data.port_count, DRM_MODE_CONNECTOR_DisplayPort)=
;
> =20
> -		igt_describe(test_hotplug_for_each_pipe_desc);
> -		connector_subtest("dp-hpd-for-each-pipe", DisplayPort)
> -			test_hotplug_for_each_pipe(&data, port);
> +		if (!hport)
> +			igt_skip("DP connector not available\n");
> =20
> -		igt_describe(test_suspend_resume_hpd_desc);
> -		connector_subtest("dp-hpd-after-suspend", DisplayPort)
> -			test_suspend_resume_hpd(&data, port, SUSPEND_STATE_MEM,
> -						SUSPEND_TEST_NONE);
> +		test_hotplug(&data, hport, HPD_TOGGLE_COUNT_FAST, TEST_MODESET_OFF);
> +	}
> =20
> -		igt_describe(test_suspend_resume_hpd_desc);
> -		connector_subtest("dp-hpd-after-hibernate", DisplayPort)
> -			test_suspend_resume_hpd(&data, port, SUSPEND_STATE_DISK,
> -						SUSPEND_TEST_DEVICES);
> +	igt_describe(test_basic_hotplug_desc);
> +	igt_subtest("dp-hpd-enable-disable-mode")
> +	{
> +		struct chamelium_port *hport =3D
> +			get_port(data.ports, data.port_count, DRM_MODE_CONNECTOR_DisplayPort)=
;
> =20
> -		igt_describe(test_hpd_storm_detect_desc);
> -		connector_subtest("dp-hpd-storm", DisplayPort)
> -			test_hpd_storm_detect(&data, port,
> -					      HPD_STORM_PULSE_INTERVAL_DP);
> +		if (!hport)
> +			igt_skip("DP connector not available\n");
> =20
> -		igt_describe(test_hpd_storm_disable_desc);
> -		connector_subtest("dp-hpd-storm-disable", DisplayPort)
> -			test_hpd_storm_disable(&data, port,
> -					       HPD_STORM_PULSE_INTERVAL_DP);
> +		test_hotplug(&data, hport, HPD_TOGGLE_COUNT_FAST, TEST_MODESET_ON_OFF)=
;
>  	}
> =20
> -	igt_describe("HDMI tests");
> -	igt_subtest_group {
> -		igt_fixture {
> -			chamelium_require_connector_present(
> -				data.ports, DRM_MODE_CONNECTOR_HDMIA,
> -				data.port_count, 1);
> -		}
> +	igt_describe(test_basic_hotplug_desc);
> +	igt_subtest("dp-hpd-with-enabled-mode")
> +	{
> +		struct chamelium_port *hport =3D
> +			get_port(data.ports, data.port_count, DRM_MODE_CONNECTOR_DisplayPort)=
;
> +
> +		if (!hport)
> +			igt_skip("DP connector not available\n");
> =20
> -		igt_describe(test_basic_hotplug_desc);
> -		connector_subtest("hdmi-hpd", HDMIA)
> -			test_hotplug(&data, port, HPD_TOGGLE_COUNT_DP_HDMI,
> -				     TEST_MODESET_OFF);
> +		test_hotplug(&data, hport, HPD_TOGGLE_COUNT_FAST, TEST_MODESET_ON);
> +	}
> +
> +	igt_describe(test_hotplug_for_each_pipe_desc);
> +	igt_subtest("dp-hpd-for-each-pipe")
> +	{
> +		struct chamelium_port *hport =3D
> +			get_port(data.ports, data.port_count, DRM_MODE_CONNECTOR_DisplayPort)=
;
> =20
> -		igt_describe(test_basic_hotplug_desc);
> -		connector_subtest("hdmi-hpd-fast", HDMIA) test_hotplug(
> -			&data, port, HPD_TOGGLE_COUNT_FAST, TEST_MODESET_OFF);
> +		if (!hport)
> +			igt_skip("DP connector not available\n");
> =20
> -		igt_describe(test_basic_hotplug_desc);
> -		connector_subtest("hdmi-hpd-enable-disable-mode", HDMIA)
> -			test_hotplug(&data, port, HPD_TOGGLE_COUNT_FAST,
> -				     TEST_MODESET_ON_OFF);
> +		test_hotplug_for_each_pipe(&data, hport);
> +	}
> =20
> -		igt_describe(test_basic_hotplug_desc);
> -		connector_subtest("hdmi-hpd-with-enabled-mode", HDMIA)
> -			test_hotplug(&data, port, HPD_TOGGLE_COUNT_FAST,
> -				     TEST_MODESET_ON);
> +	igt_describe(test_suspend_resume_hpd_desc);
> +	igt_subtest("dp-hpd-after-suspend")
> +	{
> +		struct chamelium_port *hport =3D
> +			get_port(data.ports, data.port_count, DRM_MODE_CONNECTOR_DisplayPort)=
;
> =20
> -		igt_describe(test_hotplug_for_each_pipe_desc);
> -		connector_subtest("hdmi-hpd-for-each-pipe", HDMIA)
> -			test_hotplug_for_each_pipe(&data, port);
> +		if (!hport)
> +			igt_skip("DP connector not available\n");
> =20
> -		igt_describe(test_suspend_resume_hpd_desc);
> -		connector_subtest("hdmi-hpd-after-suspend", HDMIA)
> -			test_suspend_resume_hpd(&data, port, SUSPEND_STATE_MEM,
> -						SUSPEND_TEST_NONE);
> +		test_suspend_resume_hpd(&data, hport, SUSPEND_STATE_MEM, SUSPEND_TEST_=
NONE);
> +	}
> =20
> -		igt_describe(test_suspend_resume_hpd_desc);
> -		connector_subtest("hdmi-hpd-after-hibernate", HDMIA)
> -			test_suspend_resume_hpd(&data, port, SUSPEND_STATE_DISK,
> -						SUSPEND_TEST_DEVICES);
> +	igt_describe(test_suspend_resume_hpd_desc);
> +	igt_subtest("dp-hpd-after-hibernate")
> +	{
> +		struct chamelium_port *hport =3D
> +			get_port(data.ports, data.port_count, DRM_MODE_CONNECTOR_DisplayPort)=
;
> =20
> -		igt_describe(test_hpd_storm_detect_desc);
> -		connector_subtest("hdmi-hpd-storm", HDMIA)
> -			test_hpd_storm_detect(&data, port,
> -					      HPD_STORM_PULSE_INTERVAL_HDMI);
> +		if (!hport)
> +			igt_skip("DP connector not available\n");
> =20
> -		igt_describe(test_hpd_storm_disable_desc);
> -		connector_subtest("hdmi-hpd-storm-disable", HDMIA)
> -			test_hpd_storm_disable(&data, port,
> -					       HPD_STORM_PULSE_INTERVAL_HDMI);
> +		test_suspend_resume_hpd(&data, hport, SUSPEND_STATE_DISK, SUSPEND_TEST=
_DEVICES);
>  	}
> =20
> -	igt_describe("VGA tests");
> -	igt_subtest_group {
> -		igt_fixture {
> -			chamelium_require_connector_present(
> -				data.ports, DRM_MODE_CONNECTOR_VGA,
> -				data.port_count, 1);
> -		}
> +	igt_describe(test_hpd_storm_detect_desc);
> +	igt_subtest("dp-hpd-storm")
> +	{
> +		struct chamelium_port *hport =3D
> +			get_port(data.ports, data.port_count, DRM_MODE_CONNECTOR_DisplayPort)=
;
> +
> +		if (!hport)
> +			igt_skip("DP connector not available\n");
> =20
> -		igt_describe(test_basic_hotplug_desc);
> -		connector_subtest("vga-hpd", VGA) test_hotplug(
> -			&data, port, HPD_TOGGLE_COUNT_VGA, TEST_MODESET_OFF);
> +		test_hpd_storm_detect(&data, hport, HPD_STORM_PULSE_INTERVAL_DP);
> +	}
> +
> +	igt_describe(test_hpd_storm_disable_desc);
> +	igt_subtest("dp-hpd-storm-disable")
> +	{
> +		struct chamelium_port *hport =3D
> +			get_port(data.ports, data.port_count, DRM_MODE_CONNECTOR_DisplayPort)=
;
> =20
> -		igt_describe(test_basic_hotplug_desc);
> -		connector_subtest("vga-hpd-fast", VGA) test_hotplug(
> -			&data, port, HPD_TOGGLE_COUNT_FAST, TEST_MODESET_OFF);
> +		if (!hport)
> +			igt_skip("DP connector not available\n");
> =20
> -		igt_describe(test_basic_hotplug_desc);
> -		connector_subtest("vga-hpd-enable-disable-mode", VGA)
> -			test_hotplug(&data, port, HPD_TOGGLE_COUNT_FAST,
> -				     TEST_MODESET_ON_OFF);
> +		test_hpd_storm_disable(&data, hport, HPD_STORM_PULSE_INTERVAL_DP);
> +	}
> =20
> -		igt_describe(test_basic_hotplug_desc);
> -		connector_subtest("vga-hpd-with-enabled-mode", VGA)
> -			test_hotplug(&data, port, HPD_TOGGLE_COUNT_FAST,
> -				     TEST_MODESET_ON);
> +igt_describe("HDMI tests");
> =20
> -		igt_describe(test_suspend_resume_hpd_desc);
> -		connector_subtest("vga-hpd-after-suspend", VGA)
> -			test_suspend_resume_hpd(&data, port, SUSPEND_STATE_MEM,
> -						SUSPEND_TEST_NONE);
> +	igt_describe(test_basic_hotplug_desc);
> +	igt_subtest("hdmi-hpd")
> +	{
> +		struct chamelium_port *hport =3D
> +			get_port(data.ports, data.port_count, DRM_MODE_CONNECTOR_HDMIA);
> =20
> -		igt_describe(test_suspend_resume_hpd_desc);
> -		connector_subtest("vga-hpd-after-hibernate", VGA)
> -			test_suspend_resume_hpd(&data, port, SUSPEND_STATE_DISK,
> -						SUSPEND_TEST_DEVICES);
> +		if (!hport)
> +			igt_skip("HDMI connector not available\n");
> =20
> -		igt_describe(test_hpd_without_ddc_desc);
> -		connector_subtest("vga-hpd-without-ddc", VGA)
> -			test_hpd_without_ddc(&data, port);
> +		test_hotplug(&data, hport, HPD_TOGGLE_COUNT_DP_HDMI, TEST_MODESET_OFF)=
;
> +	}
> +
> +	igt_describe(test_basic_hotplug_desc);
> +	igt_subtest("hdmi-hpd-fast")
> +	{
> +		struct chamelium_port *hport =3D
> +			get_port(data.ports, data.port_count, DRM_MODE_CONNECTOR_HDMIA);
> +
> +		if (!hport)
> +			igt_skip("HDMI connector not available\n");
> +
> +		test_hotplug(&data, hport, HPD_TOGGLE_COUNT_FAST, TEST_MODESET_OFF);
> +	}
> +
> +	igt_describe(test_basic_hotplug_desc);
> +	igt_subtest("hdmi-hpd-enable-disable-mode")
> +	{
> +		struct chamelium_port *hport =3D
> +			get_port(data.ports, data.port_count, DRM_MODE_CONNECTOR_HDMIA);
> +
> +		if (!hport)
> +			igt_skip("HDMI connector not available\n");
> +
> +		test_hotplug(&data, hport, HPD_TOGGLE_COUNT_FAST, TEST_MODESET_ON_OFF)=
;
> +	}
> +
> +	igt_describe(test_basic_hotplug_desc);
> +	igt_subtest("hdmi-hpd-with-enabled-mode")
> +	{
> +		struct chamelium_port *hport =3D
> +			get_port(data.ports, data.port_count, DRM_MODE_CONNECTOR_HDMIA);
> +
> +		if (!hport)
> +			igt_skip("HDMI connector not available\n");
> +
> +		test_hotplug(&data, hport, HPD_TOGGLE_COUNT_FAST, TEST_MODESET_ON);
> +	}
> +
> +	igt_describe(test_hotplug_for_each_pipe_desc);
> +	igt_subtest("hdmi-hpd-for-each-pipe")
> +	{
> +		struct chamelium_port *hport =3D
> +			get_port(data.ports, data.port_count, DRM_MODE_CONNECTOR_HDMIA);
> +
> +		if (!hport)
> +			igt_skip("HDMI connector not available\n");
> +
> +		test_hotplug_for_each_pipe(&data, hport);
> +	}
> +
> +	igt_describe(test_suspend_resume_hpd_desc);
> +	igt_subtest("hdmi-hpd-after-suspend")
> +	{
> +		struct chamelium_port *hport =3D
> +			get_port(data.ports, data.port_count, DRM_MODE_CONNECTOR_HDMIA);
> +
> +		if (!hport)
> +			igt_skip("HDMI connector not available\n");
> +
> +		test_suspend_resume_hpd(&data, hport, SUSPEND_STATE_MEM, SUSPEND_TEST_=
NONE);
> +	}
> +
> +	igt_describe(test_suspend_resume_hpd_desc);
> +	igt_subtest("hdmi-hpd-after-hibernate")
> +	{
> +		struct chamelium_port *hport =3D
> +			get_port(data.ports, data.port_count, DRM_MODE_CONNECTOR_HDMIA);
> +
> +		if (!hport)
> +			igt_skip("HDMI connector not available\n");
> +
> +		test_suspend_resume_hpd(&data, hport, SUSPEND_STATE_DISK, SUSPEND_TEST=
_DEVICES);
> +	}
> +
> +	igt_describe(test_hpd_storm_detect_desc);
> +	igt_subtest("hdmi-hpd-storm")
> +	{
> +		struct chamelium_port *hport =3D
> +			get_port(data.ports, data.port_count, DRM_MODE_CONNECTOR_HDMIA);
> +
> +		if (!hport)
> +			igt_skip("HDMI connector not available\n");
> +
> +		test_hpd_storm_detect(&data, hport, HPD_STORM_PULSE_INTERVAL_HDMI);
> +	}
> +
> +	igt_describe(test_hpd_storm_disable_desc);
> +	igt_subtest("hdmi-hpd-storm-disable")
> +	{
> +		struct chamelium_port *hport =3D
> +			get_port(data.ports, data.port_count, DRM_MODE_CONNECTOR_HDMIA);
> +
> +		if (!hport)
> +			igt_skip("HDMI connector not available\n");
> +
> +		test_hpd_storm_disable(&data, hport, HPD_STORM_PULSE_INTERVAL_HDMI);
> +	}
> +
> +igt_describe("VGA tests");
> +
> +	igt_describe(test_basic_hotplug_desc);
> +	igt_subtest("vga-hpd")
> +	{
> +		struct chamelium_port *hport =3D
> +			get_port(data.ports, data.port_count, DRM_MODE_CONNECTOR_VGA);
> +
> +		if (!hport)
> +			igt_skip("VGA connector not available\n");
> +
> +		test_hotplug(&data, hport, HPD_TOGGLE_COUNT_VGA, TEST_MODESET_OFF);
> +	}
> +
> +	igt_describe(test_basic_hotplug_desc);
> +	igt_subtest("vga-hpd-fast")
> +	{
> +		struct chamelium_port *hport =3D
> +			get_port(data.ports, data.port_count, DRM_MODE_CONNECTOR_VGA);
> +
> +		if (!hport)
> +			igt_skip("VGA connector not available\n");
> +
> +		test_hotplug(&data, hport, HPD_TOGGLE_COUNT_FAST, TEST_MODESET_OFF);
> +	}
> +
> +	igt_describe(test_basic_hotplug_desc);
> +	igt_subtest("vga-hpd-enable-disable-mode")
> +	{
> +		struct chamelium_port *hport =3D
> +			get_port(data.ports, data.port_count, DRM_MODE_CONNECTOR_VGA);
> +
> +		if (!hport)
> +			igt_skip("VGA connector not available\n");
> +
> +		test_hotplug(&data, hport, HPD_TOGGLE_COUNT_FAST, TEST_MODESET_ON_OFF)=
;
> +	}
> +
> +	igt_describe(test_basic_hotplug_desc);
> +	igt_subtest("vga-hpd-with-enabled-mode")
> +	{
> +		struct chamelium_port *hport =3D
> +			get_port(data.ports, data.port_count, DRM_MODE_CONNECTOR_VGA);
> +
> +		if (!hport)
> +			igt_skip("VGA connector not available\n");
> +
> +		test_hotplug(&data, hport, HPD_TOGGLE_COUNT_FAST, TEST_MODESET_ON);
> +	}
> +
> +	igt_describe(test_suspend_resume_hpd_desc);
> +	igt_subtest("vga-hpd-after-suspend")
> +	{
> +		struct chamelium_port *hport =3D
> +			get_port(data.ports, data.port_count, DRM_MODE_CONNECTOR_VGA);
> +
> +		if (!hport)
> +			igt_skip("VGA connector not available\n");
> +
> +		test_suspend_resume_hpd(&data, hport, SUSPEND_STATE_MEM, SUSPEND_TEST_=
NONE);
> +	}
> +
> +	igt_describe(test_suspend_resume_hpd_desc);
> +	igt_subtest("vga-hpd-after-hibernate")
> +	{
> +		struct chamelium_port *hport =3D
> +			get_port(data.ports, data.port_count, DRM_MODE_CONNECTOR_VGA);
> +
> +		if (!hport)
> +			igt_skip("VGA connector not available\n");
> +
> +		test_suspend_resume_hpd(&data, hport, SUSPEND_STATE_DISK, SUSPEND_TEST=
_DEVICES);
> +	}
> +
> +	igt_describe(test_hpd_without_ddc_desc);
> +	igt_subtest("vga-hpd-without-ddc")
> +	{
> +		struct chamelium_port *hport =3D
> +			get_port(data.ports, data.port_count, DRM_MODE_CONNECTOR_VGA);
> +
> +		if (!hport)
> +			igt_skip("VGA connector not available\n");
> +
> +		test_hpd_without_ddc(&data, hport);
> +	}
> +
> +	igt_describe(test_hotplug_for_each_pipe_desc);
> +	igt_subtest("vga-hpd-for-each-pipe")
> +	{
> +		struct chamelium_port *hport =3D
> +			get_port(data.ports, data.port_count, DRM_MODE_CONNECTOR_VGA);
> +
> +		if (!hport)
> +			igt_skip("VGA connector not available\n");
> +
> +		test_hotplug_for_each_pipe(&data, hport);
>  	}
> =20
>  	igt_describe("Tests that operate on all connectors");
> @@ -643,15 +813,10 @@ igt_main
> =20
>  		igt_describe(test_suspend_resume_hpd_common_desc);
>  		igt_subtest("common-hpd-after-hibernate")
> -			test_suspend_resume_hpd_common(&data,
> -						       SUSPEND_STATE_DISK,
> +			test_suspend_resume_hpd_common(&data, SUSPEND_STATE_DISK,
>  						       SUSPEND_TEST_DEVICES);
>  	}
> =20
> -	igt_describe(test_hotplug_for_each_pipe_desc);
> -	connector_subtest("vga-hpd-for-each-pipe", VGA)
> -		test_hotplug_for_each_pipe(&data, port);
> -
>  	igt_fixture {
>  		igt_display_fini(&data.display);
>  		drm_close_driver(data.drm_fd);
This appears quite repetitive. You might want to define this
once, perhaps something like this:

```
#define connector_test(name, connector_type, test_fn, ...) \
	igt_subtest(name) \
	{ \
		struct chamelium_port *hport =3D \
			get_port(data.ports, data.port_count, \
				 DRM_MODE_CONNECTOR_##connector_type); \
\
		if (!hport) \
			igt_skip("%s connector not available\n", #connector_type); \
\
		test_fn(&data, hport, ##__VA_ARGS__); \
	}
```

BR
Seba
