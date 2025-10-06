Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EFCDCAC5B8
	for <igt-dev@archiver.kernel.org>; Mon,  6 Oct 2025 07:55:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D168010E326;
	Mon,  6 Oct 2025 07:55:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hoe6R3Ns";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9765110E15A
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Oct 2025 07:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759737306; x=1791273306;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZaH4aKIcXVinFugbUKfed4nlIqtjCNLWkIgr8jrO/4k=;
 b=hoe6R3Ns/8Q23nktNIvJSko3sZCzmOIc5tm7QEZSzQG+aB/YE+aAaDVi
 395xrTgMKicC2jbl87WkGMQP8bgD4KchJuTWIB2njfp+sohUB/F+6zUnQ
 L7yXuaoNksiDOIu+2rHjXZWzCPUDdQPEvZNgtGN+Kqrzyi0S2VTZ6Z1Ja
 IjlA0GArEHK6R9wlRjjAR4oZaAEMWZd1AW8uDK8nU5S4aPB6VQAuFDj41
 X80QFaiYwt/OE/hrCUB+B/sJt4r8nsHJOzAUMkKKHPbvPeByjBiXXU3gl
 rVb9m92KsqSzE/KVNqV7C2X7qwNy+U5rkk/pMyRa0ibYlh+K4nkFaOz55 Q==;
X-CSE-ConnectionGUID: rTTqdzotQpC+oiTQnR7trQ==
X-CSE-MsgGUID: bE1whuiSQxuRt0VBQuOcTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="61813115"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="61813115"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 00:55:05 -0700
X-CSE-ConnectionGUID: ztJT85KaRV+QnrAGBd0usw==
X-CSE-MsgGUID: zNZD6uorTpCtk5PHbCUSdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="179639444"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 00:55:04 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 00:55:03 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 6 Oct 2025 00:55:03 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.18) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 00:55:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gOHv1B9IpzcnWut6amDZOsWxLKQQhAnN15mRM74PtKLt9/zU3XFLYCfec2rjkiNmSm1sbAMijjnv44zj1KZKkHlJgLgpBtzxJSUj2c3d0843VB/k+ilC3FuqzzDcZ2Rl4P6CvhnwkoHzNSLJ0HXVNPMNKyFy44pcarbIiWWb/FxZohGCsJEpwOfTUpkBWITW/B7A9RGN7bmcI1P+61zl4HyYD7IC3kC/gKeEXEtF8E6igE4I3rauVOI23iFT2VKVC+vkPPoVv6cOPOIDp2bjt03I1y41M7qeLJUmFXHJHiMH6Vcn1JIbftqrFIjuyv1Q6jCK1Okt7U0RAuGau8VMrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZaH4aKIcXVinFugbUKfed4nlIqtjCNLWkIgr8jrO/4k=;
 b=X59Dr7avvkbdCX3FlsBrLOd05w47Ti26FyQ5YHx8l5bUGowpjPEpl4UkZUdliwynROlu83XUV++IuJ/CqMTqZ0gACxCHvCZsngPFAe9SkqG9IVc9zNXZHUI4+9uMKNj7ppaGZ5Vnv9m3iY+cK1yQz2rHT+jjsioorcYelvJWTY1Kn7tXMzABkx165EqDWf/YPF8pQmDMa00evoocLS8Wr0Z3O4Y1oSDUJFJll0cDDGCcBTud/CTpbFYCS+RMr/IXgUtU7uWyESJDdHfKGDY0xwgUjWh31eqz++7mJBV6cQObmO9Gp7YHdrWUb7bQDW3lO7VOkgneu4KgdrBKdtOirQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by DS0PR11MB7735.namprd11.prod.outlook.com (2603:10b6:8:dd::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.20; Mon, 6 Oct 2025 07:55:02 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%4]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 07:55:01 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Uttamchand, Gajendra" <gajendra.uttamchand@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Uttamchand, Gajendra" <gajendra.uttamchand@intel.com>
Subject: RE: [PATCH v4 i-g-t 5/6] benchmarks/intel_latency: Add
 xe_bo_create_destroy test
Thread-Topic: [PATCH v4 i-g-t 5/6] benchmarks/intel_latency: Add
 xe_bo_create_destroy test
Thread-Index: AQHcJ9SClCYnjK7wLUWToxdkBpKrLLS03SmQ
Date: Mon, 6 Oct 2025 07:55:01 +0000
Message-ID: <CH3PR11MB8434080A3E3827314BF4686D8DE3A@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250908144314.42275-9-gajendra.uttamchand@intel.com>
 <20250917131003.71762-8-gajendra.uttamchand@intel.com>
 <20250917131003.71762-13-gajendra.uttamchand@intel.com>
In-Reply-To: <20250917131003.71762-13-gajendra.uttamchand@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|DS0PR11MB7735:EE_
x-ms-office365-filtering-correlation-id: aafca7f2-e053-484b-b5a7-08de04ada77f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?bnRlSU1haGUyelFMRDY2TXU0cWJldXRvcjRlNkE2MGRQNEsvQTYxSmI4d2lw?=
 =?utf-8?B?NDVUZjJKL3BYeUpoalpCQUFPR0hhdnRhbjNRNDM5UjlOaGpNZWF1ZmhhUHBx?=
 =?utf-8?B?TzdCVVNlWDcvdzRrQlhyZHZ3L0MyYkl0aG5DaHdOWDFXQ1lNV2J2akczZ0lG?=
 =?utf-8?B?aXNjRmMzVzIrM0xlRnRQQm0xZDJWa3E5WnoyTEM3VUlFdlptV0wvdVdLLzl2?=
 =?utf-8?B?bHllT0JxYjVMMmU4aHpFR0hNYlJTMnYvK0ZLaExXb2dURTcwMzBuUk9yRStV?=
 =?utf-8?B?ajErazIwT1lGS1o0MVlOMVhaazZ5Kzd1ZloxSVg1N3U0dEJjM0xHbkx1QUZV?=
 =?utf-8?B?NGJ6NVdwLzNuUXJSZDdWSmJ5akJXZzBvbFB0aVZGQ2xSemY3T1FQU0s5R1hJ?=
 =?utf-8?B?emNMTXlrMUNQbGdIaHkwZHNuTk4wT3cyZzZQNWFvZXJLazZUeVBhMnZHSlJu?=
 =?utf-8?B?RnI4UVNBTE5UTzN2N2ZOTDBXZGF1TE5RbTRCdlJIdWJPdXJBQTdYNG1DM3d5?=
 =?utf-8?B?WnF1NFByT3ozVXFkUks1M3k5NmZhRXRTRmFySmZ5MmZLZUF5SUJQSEdJbURk?=
 =?utf-8?B?SGtUVXp3dmViOSsyZitzaWxSWSs3U01HQ0FpenN4bjZwYkRnRzhUZ2VuMEtY?=
 =?utf-8?B?Z29TR0pmdFI3NS9WRnBiRzAvRTBHOEoyUnd5dENyRTZudFRBQ3VuNjNDcUwz?=
 =?utf-8?B?SEQ0dnBjOUxETC9LVEsxZ0xrbVJUeDVEbHk5bFZmdnZOaXI1QTNpS2VLR016?=
 =?utf-8?B?cEhBTkxJbkJ6bzNPYkgweVNmN1dCbGpJd3F6KzkwOHRvUmpRVlBGejlQWmtl?=
 =?utf-8?B?ZFBQemFoZ01OSlBnOVRnajZ6bzhCcGh2aXhXZ1o3My9NWUQzaHZXbnVWSDlS?=
 =?utf-8?B?SEp6aEhmZXM2ZHVhQlRNWGUreUphN242Q2xxeWpFKzBYVHVoekp1ckVQbk5Y?=
 =?utf-8?B?eEcwQnFkNjNWT1UxSkFiWFc0b0QvcklGMWJGaUl2TVBtZ3BLN0VZQmdsZFc0?=
 =?utf-8?B?V0R3djZhcGlGSXQ5b0xtcll4OFFDZHk3akMrdXhPOTA3NlU0aFNSZUY1WUFW?=
 =?utf-8?B?Nk9uSWpTbEsyekpsazJmUittUnVNVE9wTTEvQnJ3NDFiNmF5S2tWYTRIejdM?=
 =?utf-8?B?VjJrNTBTUnp2bk5nT0s2cldEcjVQeCt1L2tCUU5LMHMvN0dsQ0U4VTFLd1dJ?=
 =?utf-8?B?ZDV4YjNJZ1hNOEpIYzZnWWlKOHRvd3QxL3R5NlV5V0VnM2VXbUtJN25BY0tH?=
 =?utf-8?B?bm5jSkNCaUhNTmx0VWFoR1dISEVYaU5kbXkvNEtZVzcwYk5DWm9HMVJ5eTN6?=
 =?utf-8?B?azVHYVZLNmZYZmhnbmZmK01iZnNkUkdiUFVvTnhvRmZCb2NXS2xGMWVZVUd2?=
 =?utf-8?B?dW9YTDRBZVYxSnU1RkVBb0k2VDdWMUJKcWxlZ2xTVHlzOFdWT1l4Z0lsRkNG?=
 =?utf-8?B?cW9IaDd2bXE4aCtHWFpvVUpaSllSYklCdm1GV3dlR1dnTE16VVViMzN0dDRM?=
 =?utf-8?B?TFU5N0JEdEJIdjhWTU9waGluV3NwaEhMZ3pTT0VKY1FFeVZGMnFjY3poS3Fz?=
 =?utf-8?B?RFk2cldQWG9tU29JS2NmUHhHUWkzeHJqKys0cnFPVFowZFB1Zk5QVXFYbUkx?=
 =?utf-8?B?TjNFZ0crY0JGejlZSHNPeDNORU9pTEdFOVlJTGVkSEVKUWFPSjFackFXK2lF?=
 =?utf-8?B?aWpEYlpVYStEeEFneU12RFZxL3hSZWdEcFVtbU9MME40TE1PSU5qejI1eXpR?=
 =?utf-8?B?REI2eGNyaFZpQ3lJS2N6bk1jUjhsT1M0S25QcXRwNmE0MmtSR1EzRFFyYTlm?=
 =?utf-8?B?K0h1SlRqRWNHbjhrWVpReEFHQ2JlTWFjdm1lV1BBYVh6K2plaUxUckt4eGpu?=
 =?utf-8?B?aEFSOHRSOUZlelVJd1pHT2haQmI0V1hSQkZJOGNpcWJueGNkYkpFNEFCaFBx?=
 =?utf-8?B?cEp2SUM5N0xGSEQvUldiVjlvbHFLRFkvcWpNVDYvNWhCamt4YzZHd0oxcFRX?=
 =?utf-8?B?Vmh6N05HUzZHdUlDeXcvYTdnelhVa1lvc3FJbkYvdXAvdHVRbFRjZjNxaW1B?=
 =?utf-8?Q?FqzfWr?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y2txTXZYV0lTUVNmczhINjQrVzRzZm1nSmJZVDBoUDlRMWx6Y2dxMEVCbGVK?=
 =?utf-8?B?WFMxVmJ1TWZzU2NsTDZMdDdzS0JrVWZxZ3R5eFBtamNSVSszN1dOc0xTWlRR?=
 =?utf-8?B?S0lVeUNXOTdmMGQ0NWFaRnFoMVZ6ODFkaWVpNXFKSUwyUXF3ckdJOXppWkhZ?=
 =?utf-8?B?c3BBeUFrWUkrS2JQOHl2MjZHYzQvL2NIcTl6Yk5mWDFjK0pHNTdZRjdqV2Fu?=
 =?utf-8?B?VU9TOTFIVWR2aXNYSktyWDltMFhNaWkyY2lXYXp3TU5nend4dWNGZmVGaVBP?=
 =?utf-8?B?UGc4Tk10dlBjaVBUKzZ5czJ6cThyWlBIMmRvYzJKakdWc0xLY1VVdHdKcFIz?=
 =?utf-8?B?cTE4ODZIY2JWeGpEa1lLN2l2YWttbEJjQ3hyYzdPaXVGbTdxaC9RRmVIdmFn?=
 =?utf-8?B?TWpJV3l2TzFmNTREZkdUOWY0M0p3RFUvakYyREk1bU5WR3FlenBvTzJjbG04?=
 =?utf-8?B?QWhMRUZsbGU3Smh0UHVIai9ZTjFEQTI5UTMrQnRjaFdabTd6S1EvUXBtMGY0?=
 =?utf-8?B?N3JaVjZkRHpHTjM0VnA2aUJGNml1UUNLcVZEUGVROHR4UjlBVVd5ZmJnZXpk?=
 =?utf-8?B?YkJQNTdCaW55dDNSTUkvT1dTR0tBSStCS0RzeXFySHVSR0tLRktTWDE1amxO?=
 =?utf-8?B?YmFtQmIzUU5LdjYzdGhCWlN1T0tvMkZoNWRiZjN0M2ZtTDNjQTcxOVVqNjhl?=
 =?utf-8?B?bzlUMng1bWx1aDdrMzFiZjhXRWd3ZzFWbEI5ZVF4YlE1Y1ZpT3dselRyMFlR?=
 =?utf-8?B?M0J5OXhXM1E0aGZ4elhkN0tjU0RUbEVJOFplVlFwN3FDWmd3bE05VitGTzd3?=
 =?utf-8?B?NGo1TU1xcGVhdm82RlE1dDcrWWQ0eThNVjBTdFRCa3NsRWFvaThFWDBDcHh5?=
 =?utf-8?B?Y2RSbFpBejRPOUU1TDhxU0FWTXJ2S0VwVmZ1cTVjMHpkaURXYnkwOEM2ZWpZ?=
 =?utf-8?B?bmNWVlFwelhMYmVzS1U2VC9qUUlJbEV0aW1EcVVEOVZpc1FxekVqVEZOdGhm?=
 =?utf-8?B?VTZhR2xIK0VndEV1dGFmcVdtYjNLdkNxM0N4bExKZTBIeEMzS3RZd3cwOVpF?=
 =?utf-8?B?SnRiajQxdmp5WmVZdlFQR0Z4U1I3Q0VUSlF4WTRaNGRLV0liL3VsTE9DdDdl?=
 =?utf-8?B?VEV3bGdmUkJBa0tmbWlNSk02c0xMNFZsUmVSTUtZNTdXUFJxVDVZMUZqMHVz?=
 =?utf-8?B?L1ZENk5IZitaZG9KQ255L3RMQVZKeWdwajltZjNMM3N5RXZQV0tLTENZUEZZ?=
 =?utf-8?B?b1BmVFB3cEdNMll4RzAwOC9ZZGVScVl2d3AxQlRXNDZBZzlPSDlCM1RGR1c4?=
 =?utf-8?B?YVFMeU5SK0I5RGcvc1lhMnpKYVg4L3JmekVZaUJrelNBZ2ttSDJhZUk3ckVM?=
 =?utf-8?B?NXdhK2VybEJQTXFzZFZObFcxREs2bG51Vjc2UU91THpjYjJQOG1JRmU1VUZq?=
 =?utf-8?B?cVlOM3dPSXN4Z0JWRnJxcnNNb2dtMHNWOG9FTFhCSE9vbkE1TG1aZ0ZUVklQ?=
 =?utf-8?B?YWw4YlBqQ1ZRWkdaVGNXNkRZb1h2azJtU3I2Ulc5bG1ITkhSWHNyVFdNcUY3?=
 =?utf-8?B?Z2lCM0wybUpUYjl0a1RmUStvdHV3K3J5MFFxa1NwaTlMRGNEMVoyOERmWGxJ?=
 =?utf-8?B?VVA1ZDMyV0tNWnhLQ2ltOTduZHI0c1FxbDlhRU9oZGZTa3RXR2hEbGlhbFhk?=
 =?utf-8?B?c2RqVnVJWlJYRkNZVlViaDdQMlNkN2ZTVEZ0cXl6MlFickFVVlZGVktMcWdV?=
 =?utf-8?B?QVU2U09MOG1kR0VmTW42cVJTTjJrSmRKZXZraGo0ZzR0WFAvaTdMeFpoU0NC?=
 =?utf-8?B?QmZ3ODdncGZzUGh3cVllWldvMzhjTDhRMzQyMVltaXhzVUlsMFBtRUhmUjEy?=
 =?utf-8?B?aFpXZGh6d0lQYU5yaThTbFFKNWRVKzBrUFVpY1hUYWNGa0NDTXZodW9ndDVi?=
 =?utf-8?B?TmRwQXpaTkdXZmFTamhtRW5WMGJ5QW1icndhd3lySzFxVXpTT2ZCL1JkZkx6?=
 =?utf-8?B?ZFBCcGZIOVhWVGZWK3VwL2pYTWdKNTgwWWs1bE5GblNGNUJzYWtQOCtWQXN3?=
 =?utf-8?B?ZU5LdDhENGY2WEk1SkpxYXIwRlBTU2srSVZuR3ZyZFFDSVkzcGdTbU9KdEpH?=
 =?utf-8?B?Y3ppbFJTMnBya01pQkZWc2NFeUNCUFdodXE0SFQwa29FNWxMc0lRU2pIa1Ra?=
 =?utf-8?B?OHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aafca7f2-e053-484b-b5a7-08de04ada77f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2025 07:55:01.8717 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IoQmZw7vm+mh5rOb3BJScYduD0j4liLz8/E+3K1IUmEearUSgxATapA+n264s7cGLKP0hp0anQDZ/WWp/xctIjOPbeM+232ufGjrkAc31pQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7735
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaWd0LWRldiA8aWd0LWRl
di1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+IEdhamVuZHJh
IFV0dGFtY2hhbmQNCj4gU2VudDogMTcgU2VwdGVtYmVyIDIwMjUgMDY6NDAgUE0NCj4gVG86IGln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBVdHRhbWNoYW5kLCBHYWplbmRyYSA8
Z2FqZW5kcmEudXR0YW1jaGFuZEBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCB2NCBpLWct
dCA1LzZdIGJlbmNobWFya3MvaW50ZWxfbGF0ZW5jeTogQWRkDQo+IHhlX2JvX2NyZWF0ZV9kZXN0
cm95IHRlc3QNCj4gDQo+IEFkZCBidWZmZXIgb2JqZWN0IGxpZmVjeWNsZSBsYXRlbmN5IHRlc3Qg
Zm9yIHRoZSBYRSBkcml2ZXIuDQo+IE1lYXN1cmVzIGFsbG9jYXRpb24gYW5kIGRlYWxsb2NhdGlv
biB0aW1pbmcgZm9yIGJ1ZmZlciBvYmplY3RzIGFjcm9zcw0KPiBkaWZmZXJlbnQgc2l6ZXMgYW5k
IHVzYWdlIHBhdHRlcm5zLg0KPiANCj4gRGVmYXVsdHM6IGJ1ZmZlciBzaXplcyBmcm9tIDRLQiB0
byA4TUIsIDEzIHJlcGV0aXRpb25zLCAxMDAwIGl0ZXJhdGlvbnMgcGVyDQo+IHJlcGV0aXRpb24s
IDIgc2Vjb25kcyBwZXIgc2FtcGxlLCBzaW5nbGUgQ1BVLg0KPiBQYXJhbGxlbGlzbSBpcyBjb25m
aWd1cmFibGUgdmlhIGNvbW1hbmQtbGluZSBvcHRpb25zLg0KPiANCj4gSW1wb3J0YW50IGZvciBh
cHBsaWNhdGlvbnMgd2l0aCBkeW5hbWljIGJ1ZmZlciBtYW5hZ2VtZW50IGFuZCBoZWxwcw0KPiBp
ZGVudGlmeSBtZW1vcnkgYWxsb2NhdGlvbiBib3R0bGVuZWNrcyBpbiBncmFwaGljcyB3b3JrbG9h
ZHMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBHYWplbmRyYSBVdHRhbWNoYW5kIDxnYWplbmRyYS51
dHRhbWNoYW5kQGludGVsLmNvbT4NCj4gLS0tDQo+ICAuLi4vaW50ZWxfbGF0ZW5jeS94ZV9ib19j
cmVhdGVfZGVzdHJveS5jICAgICAgfCAxMzAgKysrKysrKysrKysrKysrKysrDQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMTMwIGluc2VydGlvbnMoKykNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBiZW5jaG1h
cmtzL2ludGVsX2xhdGVuY3kveGVfYm9fY3JlYXRlX2Rlc3Ryb3kuYw0KPiANCj4gZGlmZiAtLWdp
dCBhL2JlbmNobWFya3MvaW50ZWxfbGF0ZW5jeS94ZV9ib19jcmVhdGVfZGVzdHJveS5jDQo+IGIv
YmVuY2htYXJrcy9pbnRlbF9sYXRlbmN5L3hlX2JvX2NyZWF0ZV9kZXN0cm95LmMNCj4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwLi5mNmMyNGQwYWQNCj4gLS0tIC9kZXYv
bnVsbA0KPiArKysgYi9iZW5jaG1hcmtzL2ludGVsX2xhdGVuY3kveGVfYm9fY3JlYXRlX2Rlc3Ry
b3kuYw0KPiBAQCAtMCwwICsxLDEzMCBAQA0KPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IE1JVA0KPiArLyoNCj4gKyAqIENvcHlyaWdodCDCqSAyMDI1IEludGVsIENvcnBvcmF0aW9uDQo+
ICsgKi8NCj4gKw0KPiArI2luY2x1ZGUgImlndC5oIg0KPiArI2luY2x1ZGUgImlndF9zeW5jb2Jq
LmgiDQo+ICsjaW5jbHVkZSAieGUveGVfaW9jdGwuaCINCj4gKyNpbmNsdWRlICJ4ZS94ZV9xdWVy
eS5oIg0KPiArDQo+ICsjZGVmaW5lIE9CSkVDVF9TSVpFICgxIDw8IDIzKQ0KPiArDQo+ICtzdGF0
aWMgZG91YmxlIGVsYXBzZWQoY29uc3Qgc3RydWN0IHRpbWVzcGVjICpzdGFydCwNCj4gKwkJCSAg
Y29uc3Qgc3RydWN0IHRpbWVzcGVjICplbmQpDQo+ICt7DQo+ICsJcmV0dXJuIChlbmQtPnR2X3Nl
YyAtIHN0YXJ0LT50dl9zZWMpICsgMWUtOSAqIChlbmQtPnR2X25zZWMgLQ0KPiArc3RhcnQtPnR2
X25zZWMpOyB9DQo+ICsNCj4gK3N0YXRpYyB2b2lkIHRlc3RfYm9fY3JlYXRlKGludCBmZCwgdWlu
dDMyX3Qgdm0sIGludCBzaXplKSB7DQo+ICsJdWludDMyX3QgYm87DQo+ICsJdWludDY0X3QgYm9f
c2l6ZSA9IHhlX2JiX3NpemUoZmQsIHNpemUpOw0KPiArDQo+ICsJLy9ibyA9IHhlX2JvX2NyZWF0
ZShmZCwgdm0sIGJvX3NpemUsIHN5c3RlbV9tZW1vcnkoZmQpLCAwKTsNClJlbW92ZSB0aGlzIGNv
bW1lbnQuIEFsc28gcmVtb3ZlIGFsbCB0aGUgdW5zdXNlZCBhcmd1bWVudCBvcHRpb25zIHByZXNl
bnQgaW4gdGhlIG1haW4uDQo+ICsJYm8gPSB4ZV9ib19jcmVhdGUoZmQsIDAsIGJvX3NpemUsIHZy
YW1faWZfcG9zc2libGUoZmQsIDApLA0KPiArDQo+IAlEUk1fWEVfR0VNX0NSRUFURV9GTEFHX05F
RURTX1ZJU0lCTEVfVlJBTSk7DQo+ICsJZ2VtX2Nsb3NlKGZkLCBibyk7DQo+ICsNCj4gK30NCj4g
Kw0KPiAraW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQ0KPiArew0KPiArCWludCBmZCA9
IGRybV9vcGVuX2RyaXZlcihEUklWRVJfWEUpOw0KPiArCWludCBzaXplID0gMDsNCj4gKwlpbnQg
YnVzeSA9IDA7DQo+ICsJaW50IHJlcHMgPSAxMzsNCj4gKwlpbnQgbmNwdXMgPSAxOw0KPiArCWlu
dCBjLCBuLCBzOw0KPiArCXVpbnQzMl90IHZtOw0KPiArDQo+ICsJd2hpbGUgKChjID0gZ2V0b3B0
KGFyZ2MsIGFyZ3YsICJzOmI6cjpmIikpICE9IC0xKSB7DQo+ICsJCXN3aXRjaCAoYykgew0KPiAr
CQljYXNlICdzJzoNCj4gKwkJCXNpemUgPSBhdG9pKG9wdGFyZyk7DQo+ICsJCQlicmVhazsNCj4g
Kw0KPiArCQljYXNlICdyJzoNCj4gKwkJCXJlcHMgPSBhdG9pKG9wdGFyZyk7DQo+ICsJCQlpZiAo
cmVwcyA8IDEpDQo+ICsJCQkJcmVwcyA9IDE7DQo+ICsJCQlicmVhazsNCj4gKw0KPiArCQljYXNl
ICdmJzoNCj4gKwkJCW5jcHVzID0gc3lzY29uZihfU0NfTlBST0NFU1NPUlNfT05MTik7DQo+ICsJ
CQlicmVhazsNCj4gKw0KPiArCQljYXNlICdiJzoNCj4gKwkJCWJ1c3kgPSB0cnVlOw0KPiArCQkJ
YnJlYWs7DQo+ICsNCj4gKwkJZGVmYXVsdDoNCj4gKwkJCWJyZWFrOw0KPiArCQl9DQo+ICsJfQ0K
PiArDQo+ICsJaWYgKHNpemUgPT0gMCkgew0KPiArCQlmb3IgKHMgPSA0MDk2OyBzIDw9ICBPQkpF
Q1RfU0laRTsgcyA8PD0gMSkgew0KPiArCQkJaWd0X3N0YXRzX3Qgc3RhdHM7DQo+ICsNCj4gKwkJ
CWlndF9zdGF0c19pbml0X3dpdGhfc2l6ZSgmc3RhdHMsIHJlcHMpOw0KPiArDQo+ICsJCQlmb3Ig
KG4gPSAwOyBuIDwgcmVwczsgbisrKSB7DQo+ICsJCQkJdm0gPSB4ZV92bV9jcmVhdGUoZmQsIDAs
IDApOw0KPiArCQkJCXN0cnVjdCB0aW1lc3BlYyBzdGFydCwgZW5kOw0KPiArCQkJCXVpbnQ2NF90
IGNvdW50ID0gMDsNCj4gKw0KPiArCQkJCWNsb2NrX2dldHRpbWUoQ0xPQ0tfTU9OT1RPTklDLCAm
c3RhcnQpOw0KPiArCQkJCWRvIHsNCj4gKwkJCQkJZm9yIChjID0gMDsgYyA8IDEwMDA7IGMrKykN
Cj4gKwkJCQkJCXRlc3RfYm9fY3JlYXRlKGZkLCB2bSwgcyk7DQo+ICsNCj4gKwkJCQkJY291bnQg
Kz0gYzsNCj4gKwkJCQkJY2xvY2tfZ2V0dGltZShDTE9DS19NT05PVE9OSUMsDQo+ICZlbmQpOw0K
PiArCQkJCX0gd2hpbGUgKGVuZC50dl9zZWMgLSBzdGFydC50dl9zZWMgPCAyKTsNCj4gKw0KPiAr
CQkJCXhlX3ZtX2Rlc3Ryb3koZmQsIHZtKTsNCj4gKwkJCQlpZ3Rfc3RhdHNfcHVzaF9mbG9hdCgm
c3RhdHMsIGNvdW50IC8NCj4gZWxhcHNlZCgmc3RhcnQsICZlbmQpKTsNCj4gKwkJCX0NCj4gKwkJ
CXByaW50ZigiJWZcbiIsIGlndF9zdGF0c19nZXRfdHJpbWVhbigmc3RhdHMpKTsNCj4gKwkJCWln
dF9zdGF0c19maW5pKCZzdGF0cyk7DQo+ICsJCX0NCj4gKwl9IGVsc2Ugew0KPiArCQlkb3VibGUg
KnNoYXJlZDsNCj4gKw0KPiArCQlzaGFyZWQgPSBtbWFwKDAsIDQwOTYsIFBST1RfV1JJVEUsIE1B
UF9TSEFSRUQgfA0KPiBNQVBfQU5PTiwgLTEsIDApOw0KPiArDQo+ICsJCXZtID0geGVfdm1fY3Jl
YXRlKGZkLCAwLCAwKTsNCj4gKw0KPiArCQlmb3IgKG4gPSAwOyBuIDwgcmVwczsgbisrKSB7DQo+
ICsJCQltZW1zZXQoc2hhcmVkLCAwLCA0MDk2KTsNCj4gKw0KPiArCQkJaWd0X2ZvcmsoY2hpbGQs
IG5jcHVzKSB7DQo+ICsJCQkJc3RydWN0IHRpbWVzcGVjIHN0YXJ0LCBlbmQ7DQo+ICsJCQkJdWlu
dDY0X3QgY291bnQgPSAwOw0KPiArDQo+ICsJCQkJY2xvY2tfZ2V0dGltZShDTE9DS19NT05PVE9O
SUMsICZzdGFydCk7DQo+ICsJCQkJZG8gew0KPiArCQkJCQlmb3IgKGMgPSAwOyBjIDwgMTAwMDsg
YysrKQ0KPiArCQkJCQkJdGVzdF9ib19jcmVhdGUoZmQsIGJ1c3ksIHNpemUpOw0KPiArDQo+ICsJ
CQkJCWNvdW50ICs9IGM7DQo+ICsJCQkJCWNsb2NrX2dldHRpbWUoQ0xPQ0tfTU9OT1RPTklDLA0K
PiAmZW5kKTsNCj4gKwkJCQl9IHdoaWxlIChlbmQudHZfc2VjIC0gc3RhcnQudHZfc2VjIDwgMik7
DQo+ICsNCj4gKwkJCQlzaGFyZWRbY2hpbGRdID0gY291bnQgLyBlbGFwc2VkKCZzdGFydCwNCj4g
JmVuZCk7DQo+ICsJCQl9DQo+ICsJCQlpZ3Rfd2FpdGNoaWxkcmVuKCk7DQo+ICsNCj4gKwkJCWZv
ciAoaW50IGNoaWxkID0gMDsgY2hpbGQgPCBuY3B1czsgY2hpbGQrKykNCj4gKwkJCQlzaGFyZWRb
bmNwdXNdICs9IHNoYXJlZFtjaGlsZF07DQo+ICsNCj4gKwkJCXByaW50ZigiJTcuM2ZcbiIsIHNo
YXJlZFtuY3B1c10pOw0KPiArCQl9DQo+ICsJCXhlX3ZtX2Rlc3Ryb3koZmQsIHZtKTsNCj4gKwkJ
bXVubWFwKHNoYXJlZCwgNDA5Nik7DQo+ICsJfQ0KPiArDQo+ICsJY2xvc2UoZmQpOw0KPiArCXJl
dHVybiAwOw0KPiArfQ0KPiAtLQ0KPiAyLjQzLjANCg0K
