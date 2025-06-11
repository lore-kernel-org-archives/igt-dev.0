Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95492C61CE7
	for <igt-dev@archiver.kernel.org>; Wed, 11 Jun 2025 10:52:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45B8410E619;
	Wed, 11 Jun 2025 10:52:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TvnRxU8F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D502010E61B
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jun 2025 10:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749639172; x=1781175172;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=w1MuqQrSjy337MZwFH5n1SJKwku3wl8upz1X4shzOdk=;
 b=TvnRxU8FrGsFnZryC2nMIcQvf7FZSPCFVA63PNoF8YiBgtPrwn3vCPvV
 KjGJphC2xPHDPI5+QddhY5g4WGCIWTU9SCh5mutxjA0wmG2JZ/8x8aSIz
 IQpp5O4jTpBf8IJfBWoaYKN1V+2haZD5fmeBCYZEBHQc5JkKJBSHlhX4V
 PRT9d0poTih4kD3ffakytDzFk60i/Dz6lCWyGyxgt5xRc7j2xiPC1ftAZ
 5WCan2hMsTk3utYzShamAXaWI4ju0RCwzvOuRatbrWLBed5Jvm5QF1frA
 i+fkVLvK/R5GKqPLHj3BAF6MPUQALv01nmr6KxuyvFChLQsX742tzgthK Q==;
X-CSE-ConnectionGUID: PIjfZcg7Sz62vaxRqQyV2w==
X-CSE-MsgGUID: 1lgdQLYBTsKveOaKblaCjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="63186342"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="63186342"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 03:52:52 -0700
X-CSE-ConnectionGUID: tMvRDRQ1QVaxmwVIEq2kZg==
X-CSE-MsgGUID: gX30SL4dSuOdTYl5Exj1og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="147074559"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 03:52:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 03:52:51 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 03:52:51 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.63)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 03:52:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WtpFvc3vfIGGaBN62MDnRdsecHyRa6pqDf0G87boZe5IDpMB8Y1muCr7PQr2SnDo4vZEU/x07KYCLHirANr0wiVF9mAFIKDkhvE85oEOfuZoiRT1c8i0cEzfZvgcAIqisoWpncs8o/HK0i4Z/LC9A5U+1fJ2OQDN6JWz2Zy8uJzqMKk5XLGCgOHsNL0i53LNvuCV0oGhodquT8U2u601k5P1aXw5r0uzCp119Vlh1JyWFuqTzCYj12LwRYPL+VUa7YsHQOGFpkQIjIh/qnk60rWO2yE4L5mrQDPw4TgFLcSOrTOggOMeF/Pw5o7ypUJ0Swjx+4mqtPwTdRvaEEIkdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JTotipL/7aOQoPf+VVyeBh2W3pNcXubrExxmVXVEdgY=;
 b=Wn5/Z4WbFti25wlBoHlavgC6JeWZMJsGD4tHBmtnzajc3S3CCrzfmVNkGeNI3gNkq8jZsVe9HvDipQBhTU18mVH1jF9zQrP+rtXV7Agp74WF41+hTs2M3UzIATAMY2duX9sQ7wH7iXJSLTObny63ab23RCN3TfGbKTUoCeSHv8RCY2mm4Dieq8xRVfosRr6IrM3CYkvHTVTJABEowW45A2hAxb6fGD98xfS93zcGArtXw+EU6STCAXeWc9OBoQU+v34y1dEaFm9YvVd7yiHV/nKdRBKfr7D650PjjhqFAwsPl8wmKqZI8OaS5EPsNHaMe+ze6zVif64Bu6qVndvJsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by CH2PR11MB8815.namprd11.prod.outlook.com (2603:10b6:610:284::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Wed, 11 Jun
 2025 10:52:33 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%7]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 10:52:32 +0000
Message-ID: <ffce4235-1ea1-4372-b40d-6106039ee097@intel.com>
Date: Wed, 11 Jun 2025 12:52:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_*: Use NEEDS_VISIBLE_VRAM flag where
 it's missing
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <matthew.auld@intel.com>
References: <20250611095711.14864-1-lukasz.laguna@intel.com>
 <20250611102730.dopm3j4tif6k7t5l@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20250611102730.dopm3j4tif6k7t5l@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0168.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::25) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|CH2PR11MB8815:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f091518-83d9-49d4-49b8-08dda8d61162
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RlpTdjliUHNiaDVrNnZJdENVQzhJakJPUWNKdDg5REhHcnhWa3ZiMUtBVXNS?=
 =?utf-8?B?UjNIU2t4d1ppUFZ6T2VZUGcrWi9tVUVMOVp2SE9DcEVHdFF6dUp2djl2QW96?=
 =?utf-8?B?aUJQYU9GbXA5ZTVVNDl6VTc1dHBiUzFRRXZoNU4xNE1BMXB6eDlZMGNiN1U4?=
 =?utf-8?B?VGIweDVtU1p6MzJmVUxXMFE1S09vRTh3cTRobWZXSkhhQTlEUDNKSDdCU21n?=
 =?utf-8?B?dG56YVFqOEwzemlZSnNoUEtNeGhHWm02bmlpNDZBeGxia1RzTG1mQjRaa09F?=
 =?utf-8?B?SnhzR2N0MUYxSW1mRzBPTEZ3VkR6RTNERHY2aFhVWVBpNGxCa0k1cVBoN0J3?=
 =?utf-8?B?YjZYYkNoenNJV0lDenRuT3FWdkZmVTR6R2wvVkxwNFhjZTBqZXZiTXZudm8w?=
 =?utf-8?B?MHZaM2J1aFEyWUQ4QmhJZnQzUVJJcUhtL0dYUVhKY2RZeEhMelR2VllOL1hj?=
 =?utf-8?B?Kzdma0JyeVlJYWlMZ25oK3pheUdpYitLeFU3K0w1eWIxWFRDT2FuSlY2ZVI1?=
 =?utf-8?B?UVBkNnJjN1RrMkFOd0pzZTB3NFNDVHNleWhhOTh2NUoyVU5ocUJXYk9NckJP?=
 =?utf-8?B?djNPNERXTExUbklpK2taVFp4TExIakVTRWhoYjlSSWxYZDQzZ2dkUTBiSmhm?=
 =?utf-8?B?bnV3VWV4OFVKWWRoeS9oUXQwbXRvYThUY2w3NmM5NWdTUXBrd3ZuWTFMeFl1?=
 =?utf-8?B?Qk1XRHJucjluZmRnTHVqRDYvM01jK1pvckpyeUhMQU5CM0wwa0VXTXZDOU95?=
 =?utf-8?B?VEprblV3K3hDTUd6cC9HamJ1QmxtYVB0ai9UcEFWU3FaY3lZOUcvdkZIajBE?=
 =?utf-8?B?UUlHN0tMWHlidnlwWGRab0lXQXhFVHhiVUpRRWdQREw5ZGswdHd4SmRKcnNi?=
 =?utf-8?B?dnRHcEJpMmdJOXBEbTRvTVA5KzJPcWNXRTZPTmQ3WHQ1WXgwK3pXK3ExYnhx?=
 =?utf-8?B?SEo4L1RFVnJ0RzBwdzI2VmlrMnRsUWJNRHU2RlRzT00yT0R4Yk84QVkxY0p3?=
 =?utf-8?B?K1o5UmVORHd5Y3VFSHJNSlZhSkMvT3NFTTF2VHdKd2UrTDNSYnRrbHRyOFhE?=
 =?utf-8?B?NldYZm9FaTJJS3pyNE1wZEtxK001ckNNazBSYVFxRE5oRUJDZ1B5QWo4NHgz?=
 =?utf-8?B?aEM3OVpFZjRSNHpQU2hRN2QvVGkxZHg4K0lvc0ZXd0cvRDNFSlpZd2NUVFNV?=
 =?utf-8?B?bjdFRzJTcFo4Y0dHUXBnQkVzNFlXdFZkZUt3RXhPWkFZWkx5NWpoWXBhaXhz?=
 =?utf-8?B?OTU3NU5nRXZFTEZWQUJOTG9zQlJMTXFpSDgyVXhPRHc2aHBLQTNRdnIraFVu?=
 =?utf-8?B?aUdwQUJ4MmUwQ3FKUFBxWEhRNGltQXRsNnhHTWVmNUJobEt1YTQvcmJkK0RR?=
 =?utf-8?B?RURVdDI4Uy9od2g4K3VjLzB1R3djbzBXbjJjL0d0cmRCZS94NE9ibVBZcVZt?=
 =?utf-8?B?dFBvOWhLM2tZWEcvVHYwR01zT3N5WXlicW1vLzZPYnBmNnVGNS9JQkJKNVpT?=
 =?utf-8?B?cTAzYWo4OTBXTC83a250UnRLT2VxNURYQTB1MWZuVzRZTFBBc05MVlFaTWh5?=
 =?utf-8?B?aERRTDlaU0VaUEhGYmlzNDlDYTZlczVpenZSTjhXSGwxci9OVjZtQjl0a290?=
 =?utf-8?B?NzRGZGh1YW0vandldTZaNnN1b2FHaDhCbEErUEFhUmoxZlU5emtjaHJCZHY5?=
 =?utf-8?B?K0QxRFRuNUJQS2F4SEsrSFN4NWRtNytPMm9aRDR5WkljR0NSbnFjeDBzZmVi?=
 =?utf-8?B?NzVDaXhTZ0tKY2ZpWTBQc1RKeTlKQjNnd1VQeThoc1NkcDg0RWdHaGE4Qmxp?=
 =?utf-8?B?WDhTczdwL1hpVUlVYjBpaXNIYW9mT0VzMkdEcVBkbmcvUUV6RWpqUCt0dnF0?=
 =?utf-8?B?YVZwL3BZSG9ONURSajYrMlRoRDBWQUNiajBaUW5qREt0TGZnWGFWb09TL2JH?=
 =?utf-8?Q?YmP3dZq8iNg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3RxR2NGT3lBS2JrZ3RYUlV2TkszbXNPcmFhdFdDVGp3NU5LUDg2UHBQdDlq?=
 =?utf-8?B?Z3o4emROdngyaE9hN1UwNE5XWEdFNS9hSnRMQzl5OXY3MG81WFBMRXMrdWtx?=
 =?utf-8?B?VWhLRzgyeEdKeUJwQ1N0c1kzZHdyM05EdytSazJOWUxxbGhVRHovaDdMdTdz?=
 =?utf-8?B?ZDBuMzQwVG42U3pYT2lYZnJsWkhwSWR1cEpFTzlrdFQvS1gweitTdlVVK0pC?=
 =?utf-8?B?VnJQbUFCUWNTbmhqR0ZGNGxma1FGRENTOW85eDg3SnBRdE8zQVBNQWR4OHB4?=
 =?utf-8?B?MjJMbE5zek9ubnQxZ202RnpISGxCU1BqYjB2NTdZa0h4cytPOG9XenFPVTJr?=
 =?utf-8?B?Y25PVElDZUI3WHdmSHZvNmtyTGg0SDIzRHErYndEaUR6ZjlyU21aY2Y0Sjhy?=
 =?utf-8?B?djhWK3JDSTJGWHA0Q2Z3c2hWS1Z6aUs0TDF0U1IzMURtbFQvRW9TU2FCekRX?=
 =?utf-8?B?czVHZldOTmM3Z3lkakhYSjlNTm1nRGlkREcxSldqdlJiVHI5OHVnRm9KNDlu?=
 =?utf-8?B?UzZ0Q1BiR0lSekl5UXRlRGRiVVJsSm9CcUFPd2Z3K0gyNDd5WmErclpRWXNV?=
 =?utf-8?B?cUxicElQZ1lPYy95VjFIZGhGZzlSZ05UdEJ5SzMza2ZNcTFEWERsYTJwdzF2?=
 =?utf-8?B?ZldLNmEyWFNPK2dZNHdXQVh1MVR2NFl5eFN0MlBHNGIxN3JlOSsrRDZ2UlA0?=
 =?utf-8?B?bzcxZVhsTHpjT1dUUXd6ZXdQbGNBUlM5b09WTXpvV0loaVlVK04yNWhpL0Ja?=
 =?utf-8?B?OXBhVnBFNHduZ1dXd3IzNWlMNStUNnk4TE8xWUZkWmJjQUhRa2E4bm4rQ1lQ?=
 =?utf-8?B?WWgrc3BrRWN2YlpiZ0lQS2trSm4zSGVtWVIvMkdxM2VSLzdZQUpkOW1HU0JC?=
 =?utf-8?B?b3dtZ0RoZjR1SEV0VXpiS2FHa1B0dE93L3FLTG9JNElQOGhBQlZpS3ZYdDYz?=
 =?utf-8?B?RmRqSjI4bnBqaTNGTm9aMERXNUR0SFh4WlQ4Y2s4eVJNSVcvdW1aclJlVHpt?=
 =?utf-8?B?aUJNQVlUaTkvU01xbiszSjlXc0RaK0tPNzZXMm9ZdHhOaTZsd1FCeFN1NlNu?=
 =?utf-8?B?QVBqRTZWZmFxQTRNT2QzSWxiWHBlRHJiVE0yRW1LY0dDZVJIa0lqNGxtRjJq?=
 =?utf-8?B?SkQwUmFVbnZlQTVacW1JYkQ3ekU5dXhEYkk0ekVBQmluamd2TEFZYURyd21m?=
 =?utf-8?B?amhoV0M5MHlwUFk4WTJFWDEwNjRpNFMxcDBONU9WUDZhcGI1R3pLTk5LY0Rl?=
 =?utf-8?B?azI5c09vcDBuQjdNcVRyNzB4Zi9LQUhVdXNkY0l3MjZRbG96aHNaNE5MT3ZE?=
 =?utf-8?B?TUlJaCtnMDZRSFpFZ05LVE82dyt1S2xXdU52b1plaSsySDUwQlRPTFQ4eXdi?=
 =?utf-8?B?WlJLQnF5NDdHa2xyRm9kakdDSkZaRjFoSlYyMmVJU3NrQ0R4TVhBWDF0VWNK?=
 =?utf-8?B?SlYzbyswUFU3NjZKZlBvaUd4UytSZmRsWC9BSjNNd0NwejVkUlBVelFTZ0c2?=
 =?utf-8?B?M3A4ZG1xSy9MRWxRWE42WkdMcEx1L0k3Z3JyeXd0STZmdjd2Y3Z2a0x1eXZa?=
 =?utf-8?B?SnpzWUxCU3lwakIzTFZVcTdkVEs3S21tVXc1NjVLU0ZsMGw5TGFKVWZRT204?=
 =?utf-8?B?M0FNUjJ2bmMwR0NYTlJVekxucFpWTUhLTWJ6RWordUgxYlcyUmhTaHpuazEx?=
 =?utf-8?B?K1o2S2RBRW9qajArdEFvQ29DYmpFU2FCM212cmRvZkdObHhwMzAwcnF3c0la?=
 =?utf-8?B?N0piTitkaFlFdnV5YTlCVndneWt3STVuaHBISXpiSTlJS3R6NjRpbG9MTmR6?=
 =?utf-8?B?dlRya3VZSlNFOWtNVi9pU0NjMCtEaFpYdGg4eGtYWjVKeEU5L05kYTZJeFJS?=
 =?utf-8?B?L2ptYUZ2YnV0RWJPa01kMGM3NFF3bzdjdzd4OGx1dTNHMllPMVNXWEdPaGxu?=
 =?utf-8?B?eTNrVnJBS1BLa0wvb0wrZEVsRGZyNnhBVUhOeit0bWZSYm9QNE02czd0Z0F6?=
 =?utf-8?B?L1RmbUlUN0dXNjg0VXpiRnI5N3FCNTcrRjF0MC9qV2E0b3k3VytudlZiQmZl?=
 =?utf-8?B?OXVIK3NPdVlwRE5GSHhaREVKNEc1TkFmS1JRdnpyOWRYK1l1TEZseGxVOUM4?=
 =?utf-8?B?dnU1K0w1RzhPaGJPdmdwVXRwZGEwa2pmT2dETkhRaU1ORlhjK2E1L3l3VFYx?=
 =?utf-8?B?T3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f091518-83d9-49d4-49b8-08dda8d61162
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 10:52:32.8293 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pljcInFJOgqm7X577DT5cKhkBVoR4tR6R0bR3KijTOU2PYgA1pjAQUmTcmJEVAibxFErRQVMwyPiWNjL8o+5LQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8815
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


On 6/11/2025 12:27, Kamil Konieczny wrote:
> Hi Lukasz,
> On 2025-06-11 at 11:57:11 +0200, Lukasz Laguna wrote:
>> Set DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM flag when creating BOs
>> that will be CPU-mapped, to ensure that the corresponding VRAM
>> allocation will use the CPU accessible part of VRAM.
>>
>> This is essential for small-bar systems, where omitting the flag may
>> cause failures or SIGBUS crashes due to the CPU accessing non-visible
>> VRAM.
>>
>> Suggested-by: Matthew Auld <matthew.auld@intel.com>
>> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
>> ---
>>   tests/intel/xe_exec_atomic.c | 2 +-
>>   tests/intel/xe_pat.c         | 3 ++-
>>   tests/intel/xe_spin_batch.c  | 3 ++-
>>   3 files changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/tests/intel/xe_exec_atomic.c b/tests/intel/xe_exec_atomic.c
>> index 825d7d190..39c739b64 100644
>> --- a/tests/intel/xe_exec_atomic.c
>> +++ b/tests/intel/xe_exec_atomic.c
>> @@ -85,7 +85,7 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
>>   	bo_size = xe_bb_size(fd, bo_size);
>>   
>>   	bo = xe_bo_create(fd, vm, bo_size, placement,
>> -			  I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS);
>> +			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> Could you split this into separate patch? imho it looks like a fix.

Hi Kamil,

These are all fixes addressing the same issue - just here the flag is 
incorrect and in other cases it's missing.
But if you still prefer them to be separate, I can split them.

Regards,
Lukasz

>
> Regards,
> Kamil
>
>>   
>>   	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
>>   	bind_engine = xe_bind_exec_queue_create(fd, vm, 0);
>> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
>> index 88d8de9dd..8bb0ac167 100644
>> --- a/tests/intel/xe_pat.c
>> +++ b/tests/intel/xe_pat.c
>> @@ -582,7 +582,8 @@ static void prime_self_import_coh(void)
>>   	fd1 = drm_open_driver(DRIVER_XE);
>>   	fd2 = drm_open_driver(DRIVER_XE);
>>   
>> -	dst_handle = xe_bo_create_caching(fd1, 0, size, all_memory_regions(fd1), 0,
>> +	dst_handle = xe_bo_create_caching(fd1, 0, size, all_memory_regions(fd1),
>> +					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
>>   					  DRM_XE_GEM_CPU_CACHING_WC);
>>   
>>   	dma_buf_fd = prime_handle_to_fd(fd1, dst_handle);
>> diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
>> index 21b08ba06..48a888e35 100644
>> --- a/tests/intel/xe_spin_batch.c
>> +++ b/tests/intel/xe_spin_batch.c
>> @@ -442,7 +442,8 @@ static void exec_store(int fd, struct drm_xe_engine_class_instance *eci,
>>   	vm = xe_vm_create(fd, 0, 0);
>>   	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
>>   	bb_size = xe_bb_size(fd, sizeof(*data));
>> -	bb = xe_bo_create(fd, vm, bb_size, vram_if_possible(fd, eci->gt_id), 0);
>> +	bb = xe_bo_create(fd, vm, bb_size, vram_if_possible(fd, eci->gt_id),
>> +			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>>   	bb_addr = intel_allocator_alloc_with_strategy(ahnd, bb, bb_size, 0,
>>   						      ALLOC_STRATEGY_LOW_TO_HIGH);
>>   	data = xe_bo_map(fd, bb, bb_size);
>> -- 
>> 2.40.0
>>
