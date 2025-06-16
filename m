Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A481C71155
	for <igt-dev@archiver.kernel.org>; Mon, 16 Jun 2025 13:44:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F205A10E3AF;
	Mon, 16 Jun 2025 13:44:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F8YHzgrS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20F1110E3AF
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Jun 2025 13:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750081478; x=1781617478;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=UoSSdFc6f5sJfaBB8dXlYwDnx37hAd2XlH+qiEmg0oo=;
 b=F8YHzgrS5+r7IcSpIcVCu9txxi2o011JKJGde/44EiuXXPY4LtWMaKrL
 cpBwIjuwv7Gr5JaM6Q4CHmqDZmST6MOsF3GlBYZpm7NTIvQmyTiQ9mMoB
 izC74OEEAIUjigvO3pkQMaQLJjQJPGhQ7ewAoUxugqMBTY1eea6xUw0og
 i0zV1/RYOSVxGKQM4Bm7Qby7E4Zd/oQszxl1MMnUYtB2zUS/4dliqTYst
 0000kq9GmlElbHWrIUWJhf5tXD+2vOxxXMdFr7lnrBzc+TyYHbkicqmib
 O8nu6Tl6ndD2KhDfW9O8UuAzwNjFXFkEzx1VF0WeVcnuDjWrl3lthALDF g==;
X-CSE-ConnectionGUID: +AvhM5hXRSO7JcTgm7qgtw==
X-CSE-MsgGUID: W+BtYfqcRw61+E7pzBnAzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="56025461"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208,217";a="56025461"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 06:44:38 -0700
X-CSE-ConnectionGUID: mEHlNdhNQtebI4QPXO78aw==
X-CSE-MsgGUID: DT+Qzc8wQ/ioO0J/1IdOIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
 d="scan'208,217";a="179472581"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 06:44:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 06:44:37 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 06:44:37 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.70)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 06:44:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RryNdq9QjdTuhIdDBVIBtLrT7m7ba26lo5iFzDFoH4eKwyZoTRJqEyiOxFXMkNyWZdR/A+esJbWJwIUhKUxQ2uLW2GDSkcihQeK48TBRXtrfopeDSfpzI21lklfjSZiFPyj0PY8/6BAntSMcNX2VCuVOYy0EG4ux55qbZImR2VhzGSv4fVzry5/SajoH60hTI0nDaENcu5ZkUoXFO0+Jfzls7Q3AJ4cbxPKnSww68oGdaDQL4K5qcZ+c25yiKYSq31TBQF0jbpBb2hWxEpFe7FycGyOgt89D99EJcy4r05f+hj0h1IS7I6IYxLEYMWiopKLL8BmBshvVvmaU3u3R/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9640Cx5E13zT/DhDaYZ2TU6tVSCO5KkHzLGH4RuddRM=;
 b=h/oFkPhzzMPEYc9APEcSFzBfk7GziCqf2+WKXtZ3hTigamTkbBuNgcVtn4IZ2vd1IQG3U6+ciZAZ1vWpmtK6gxeuZWy9fPDetsISjU4y9fCPgaOarft7vaC4+KFS6gCfCcqrlwmm9/g/Z/mJcdvkmAW+xdl59lMP8JQUNz8pYBff5AP5pLGRziTbRSngzWTpP4rA1xBCYTpdvYTb4nv+bEoH3Y9IjJ301aOgNb5NoKusYBzpFX7hu6hja4I13ay8khbZzQRrSRshgUd2ehwgCz3TGNHVvrDcNg5gSqhra+4tcRdBuesem9zg0zAntGm5f8ZG9jxdHLh2h/hKXSJ7qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM3PPFEF920636F.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f5d) by MW4PR11MB7161.namprd11.prod.outlook.com
 (2603:10b6:303:212::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 13:44:20 +0000
Received: from DM3PPFEF920636F.namprd11.prod.outlook.com
 ([fe80::84c:a02c:91a8:f5e]) by DM3PPFEF920636F.namprd11.prod.outlook.com
 ([fe80::84c:a02c:91a8:f5e%4]) with mapi id 15.20.8769.025; Mon, 16 Jun 2025
 13:44:20 +0000
Content-Type: multipart/alternative;
 boundary="------------waQb8OurGn8cqSHhmzsh79v6"
Message-ID: <b68059bb-779e-40b9-b0a7-fa7463b10c7a@intel.com>
Date: Mon, 16 Jun 2025 19:14:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] tests/kms_vrr/cmrr: Skip display config when commit
 already failed
To: <igt-dev@lists.freedesktop.org>
References: <20250616052920.3418160-1-mitulkumar.ajitkumar.golani@intel.com>
 <41e76b54-93b6-4b07-ba95-230dfa44eca5@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <41e76b54-93b6-4b07-ba95-230dfa44eca5@intel.com>
X-ClientProxiedBy: MAXP287CA0023.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::31) To DM3PPFEF920636F.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f5d)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PPFEF920636F:EE_|MW4PR11MB7161:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d08da98-10eb-453d-7fbd-08ddacdbe4fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VzF0bnF2M0VtNWRiQ01HWjhhUU9wMGtHZ1pBZVdkaldDNmUzKzMxdzVzNVVm?=
 =?utf-8?B?QWVsK0IvN3c5ejY3OGE1WVlNL1l1RUpMdHVKZlMvbmcxWlNOVjBCbmVKOXRY?=
 =?utf-8?B?Qkk1ZHhmaWJDdktDcHg5bTJ0NlZFNVNxZ0JycDF4RkRhMWRHYWJBUnVNbFJ3?=
 =?utf-8?B?cmtJR1hhTlpmY2RTSTZZREZ0Sk1hZnArNFY4SzROL0xJaEg0VEVQeVEzT2Q0?=
 =?utf-8?B?UTZSclN5Wi8yUVF0VEltSU1aNTZQL0ZoRlFuOFZQcmhMMm85TjZjL2ppanFq?=
 =?utf-8?B?NUIwR3lJOEo5RWUvTUowckhYY1Npc0NPWEFaTno1dXRiUUllSlhoVlB4VGYr?=
 =?utf-8?B?YkxHM0RUdXVkUENhdjFnYkhlMWVkU0VucWY4YkFQcVg0WVZWY2N4NXRCUkVN?=
 =?utf-8?B?R1FnWDUwVGVUbXdKRWRJd2pZazFQamVmOW1ydXF2ejNscDd2L0FVYklVeUx6?=
 =?utf-8?B?NmRVelZzNDRtOHlsZDdNQm5yNjRIOW8rbndONmw0Y0dCQ21FWlI5L2JRYTBn?=
 =?utf-8?B?VHBROEo1M1BMUlY4Z0xZWTRuRnlONVhGNFlhbEc0T0t5MkQ5NHBCNjNmYWNp?=
 =?utf-8?B?S1V0SVBtZTBjdW5rNkRQVlhISzc3THlHOGZlaTU3VnZRRkwvUXhSaEIyUUJL?=
 =?utf-8?B?OGZMb1dmd29OWXBpcURIakRLU0lMeW82WExZdUROajF5VWs3bnYyVXhkcVVJ?=
 =?utf-8?B?NWNPTW92MXBDR2hndFc1M1dqdmU4RFg4VUZTU3o5VVJBQ2RBOHlUUE5zQlFn?=
 =?utf-8?B?ZytKYkdxTmFOcG9rWEdMT28zWDREQnlKMnZEVnBpbkRoTmNITUEvb0Y0VHZ2?=
 =?utf-8?B?dThhbHN3cjYybVhHanYyUytHalRYclF1TDJ3QkZjK2NmUGFxS1p2Wlk3OFhw?=
 =?utf-8?B?R1pSUTQvWU5RaHV2a1VZK2xDa0NhemR1aENvaDZnL1JuUlhYY0taenYvaHEv?=
 =?utf-8?B?NWZRbW8wMHhzQ25Za1BTWnJrMk0yWWRZNDhvTFBrQXRGeEsrNVZ1MTBlcnZi?=
 =?utf-8?B?MEJubVdFN1lmUXhPNW5JWWJGanpoeCsxcGpsblNyV0wxV1ppR09BSm9KZGk0?=
 =?utf-8?B?TUtid1ZTRCtvTFVHRFRaMDNCdjJCaTc2b3BHcm0zY2MvUXNrd0lQV0twQmR6?=
 =?utf-8?B?YWN0MkZvQ2g3WVB6YUJsdTJ5bUs5MnIzSjJIb1ZZT3NTSUczVEloRGpzTVMx?=
 =?utf-8?B?WjhIL3B2Y3Q3Wm1HdWhQbXl4dUdObUxGY1lodXNwcFBRVDE1V3pqQmFPZFZm?=
 =?utf-8?B?K2xoTmJLTDgyS01DTHhERlMxOE5NcEdOQWhleGJ5ZUQreHdRMnBudlBQSjRX?=
 =?utf-8?B?bzg4RE1QbG16WXlON1VweE0vV0kwMzBCaXMvVHdFUFgvNHdpZ3Fod0JJcGJj?=
 =?utf-8?B?Tnd3NXRvNVZ3b3VkSDdXeEhXSDZjUUlzTFIvb3g4Rit5V1pxN21DcmZDUS9E?=
 =?utf-8?B?dEV5dXEyanRmZDlFaWh6eXRCdVI3TzJpT0x2ZktCNkhzMmJodHkrYUsxV1ZV?=
 =?utf-8?B?YTk1NWplTE9ZS1NoZ2tEelVieGczMjdRQUU1eGtQdVZFbjFSOVZpVjk1VjEv?=
 =?utf-8?B?MUFqWElsczQ2OUlCbzFYMGU3a2NjSFdRT1dKRjdPSk9kZnZHeE5iTERQQVdw?=
 =?utf-8?B?R094N1ZLRU1ZZVlQYm1QeDJXd3ZIcEpQWlFRcFNpYnMwYWlocnZ2WVpCdnZS?=
 =?utf-8?B?R1BneFhxYVlhMExBejlZM2ViajhsYXYzQ05uV2czc0VTbncxbUpCUCtTYjFy?=
 =?utf-8?B?SnJjZGw4QUJuVDQ2eG5vK3JDRENDcmtRcHI1aHlKZHUzNGRmZlIwK2UyY2hE?=
 =?utf-8?B?OHRsOHZ4bXdBaWMxSlpzU0FLSE5iM2g0R3RSZy8wdWZmUk5zUklkR2VaQlY1?=
 =?utf-8?B?SERreEIwdzU5UVBZYnRhRXkyOWRGT01vbWhsam1uU2ZuSnNzTGpzeGtFeEVt?=
 =?utf-8?Q?nm2MnkVgFgc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPFEF920636F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkxPanY3UFZNUVFobFlnVEllaC9NbTlXNTlzQnZ2SUxBNnZ5VlJJZ1V4cFlU?=
 =?utf-8?B?Um1LMklubHRKVUFmY05vTzluUlVHV0FHR1BndXhaTlVxZGpDSVFobGsxYXlw?=
 =?utf-8?B?WGoxSm4rc0FKNVdLYnBsMTE0amswWmdLeHlvQW9xQzZ0VXNPZDBNOXk5aCsw?=
 =?utf-8?B?WnFueW82aVZiUzQ5THJ5c21KSnp6WnZHcDlzLzRyNnM2YUZCUkJhV0pxQmN1?=
 =?utf-8?B?aUg5SW1qMHc2NzduNlhVazEwOWpHbng2Y0diVmc4ays2M2hBbU02NXdFamdM?=
 =?utf-8?B?UEF1YUFPTXRhNTQwa1lrUFNwUDlUdm56NTBTUHJXRDZuNEVsT1hCWW8xYkpa?=
 =?utf-8?B?WEhGV3lHN0hqUXJ3M0d3UnF5YnVDRTdyVVJDM3poeXNuYU8yYWZLa1duUWRS?=
 =?utf-8?B?azMzTVAxejVZOUJSSXZteVV1V0VJWFVjdDErbml6Rmh4Z0Z2SzEzdE01NEhx?=
 =?utf-8?B?aWhTQTlXZGJVUElqS1hrMHFCQlRmMG42WllDWjZ2V01rQ1dIbGkwRUkzWDRV?=
 =?utf-8?B?NmxjS2U4M0U2Y0t4ODd6TUUwNWdYSlFjUjlIVjROS0lBVWhKSGVnMHNWcEFJ?=
 =?utf-8?B?QkZhWlRKVkh1ZStXT1lRVWtyWGRVWlp6L3A1SGtMdHRHempIVjdTQTl2b3h3?=
 =?utf-8?B?bWczOTFhazFHSWlvNitpRUVFUGZaQzJWRDJ4QWNTV2ZQODYweURKZTBOYUh4?=
 =?utf-8?B?alBaWGZBRk0rSkw2aHBSSG15WWswOWYxbUROWEp0WXJxU1AxeGFLTkZWVXFv?=
 =?utf-8?B?aFhZS1pPTGxEb2pVaWNrUlpxMmVEUzNYazhqTzFDODU2QTErRWNTNmx2VURz?=
 =?utf-8?B?NlN0NHFaWVpwRGxKaDFha0NsWVQ1M2g4TkVrZ1duTWNVVTdnZStIa2puNGxY?=
 =?utf-8?B?bVQxTGpHNHhMYUZyTW5UcStnb0g0bk9qRGxMN3BVZENMWHZGdWhhcStFSnZ1?=
 =?utf-8?B?UDZwSmk0Mzh0dDZHYUMrWWE1S1JqRUdudGR5NmVQbG5OVG1pNmFYUFRxdUt5?=
 =?utf-8?B?ZktSK3h5V3VkOGpsd3Z6bmhZUlNPcXNDRmRJOHRuZk1zbDNUWS9RUUw2R3Jz?=
 =?utf-8?B?NVAzUFE5WnlnMUV4bjdBL0xyUjdNeXQyTXR6UkxzT21uQTI0VnB6RlZsbHJk?=
 =?utf-8?B?c1QrVmRGWURwL2FlcFZyTjhDUmpWN2wxS01sNXZiUG1NcFYzWkZ3M1REZ0h5?=
 =?utf-8?B?U3hiZncwcWVXZzdIQWVRZXBaUGFhaEY0UEZBR2VDb3A4Q1piWFdVUFd4NHhY?=
 =?utf-8?B?U2pjcnQvRDkyS2JTUC9ZNWtNUmsxRlZhL3N3SGwyOW9DcDRGZXB1MVVjQkFp?=
 =?utf-8?B?UitqS2d3UkR3Z1BrYVBaMzdPYm85YXM5VVk0dCsvYm9yL3FHeTROV0pqTHhP?=
 =?utf-8?B?VGs4a3VWc0VRNFByNWVHMDBRcUFFL2xvdWpmYmZ5TEJUaEl1ZFpRcENvT1JI?=
 =?utf-8?B?WStlQ3hsZU8zcFNiSnhUc3RJQzBLZlJ2ODJ6RldCc3ZoUlk5ak9hNmlEVUNw?=
 =?utf-8?B?Q3ByandhckFOdHBWU0Mrd3NrNXdKYmtLYWRJWHlmejZXeVZYZlptZDhQSzV0?=
 =?utf-8?B?NTR3TWdBRWVBdGlMUXd2Q0NQb210OUx2MlNCa21OaEl2VmJOZ3dOd0krc0p2?=
 =?utf-8?B?K3NFVU1MNFM4cWF4VDRFK21zVXNsWlMvM2k1RGp3LzE4WEZFUEx2MW03emNV?=
 =?utf-8?B?Z2Rsbmx4alg2WjZXcW43R2hHVGlURFVFNlB0bFhVMEdPOXB3V3lVbU5lSHFo?=
 =?utf-8?B?ZU50YUk1UEtaSkRYc1FIdkNSZHRIUlk0ZjZyZGlpSkRjL24ydFNrTmhtb0Jn?=
 =?utf-8?B?bHc2S2F3K3dncGFiaE5JZnpGRkpIMDQyc0pYQWR3QXJ5aEhRaXJkMlhFRkdv?=
 =?utf-8?B?UytWOHVXZHNsRTJUNWR3VUlLc1l0ODNHbFZyTmxNOFY2YTlTS0lkdXpCS3M2?=
 =?utf-8?B?QXVlcWl5UFEyYmZrOS9VTXkxcGwyMENhRytTRklHK21qdCtKWmR3VDlQVTJs?=
 =?utf-8?B?MHN1cGdZUzVpUWQ2Nkx5S1ZBeld1WTBsYWpTeHVncEhVejJ6NElpcmVUeWts?=
 =?utf-8?B?UnhOU3BsNFNsbUxEVTQxMzBVcS9IMzMrVGFrcFAyLzJOQlUrV2R3NUZaMklj?=
 =?utf-8?B?Q3NYN29ZenRRWXh6WVNmR2lCR0V4c2xRTXZScTMxTGJwN1RuNEtnR0FqaDdj?=
 =?utf-8?B?TXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d08da98-10eb-453d-7fbd-08ddacdbe4fa
X-MS-Exchange-CrossTenant-AuthSource: DM3PPFEF920636F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 13:44:19.9734 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gKKeX/qq3QsiO5ZAq5Tvkv4c7PuvpH1xHFIJ1MYUnn9Dp9igoUHu84pcaoG7YCKK5dHoBKFlYLFn6rOgb26ZMZIHc5qf3lt8tpMoSHyujCo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7161
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

--------------waQb8OurGn8cqSHhmzsh79v6
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 6/16/2025 7:11 PM, Naladala, Ramanaidu wrote:
>
>
> On 6/16/2025 10:59 AM, Mitul Golani wrote:
>> Don't prepare display pipe when commit already failed for tweaked
>> display mode. In this case display commit may already been rejected,
>> and still test tries to set display params on the same. If corresponding
>> CMRR mode is not found and tweaked mode is already failed to commit then
>> better further operation should be skipped.
>>
>> Signed-off-by: Mitul Golani<mitulkumar.ajitkumar.golani@intel.com>
>> ---
>>   tests/kms_vrr.c | 14 ++++++++------
>>   1 file changed, 8 insertions(+), 6 deletions(-)
>>
>> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
>> index d371d9d7f..01e5f73c0 100644
>> --- a/tests/kms_vrr.c
>> +++ b/tests/kms_vrr.c
>> @@ -920,13 +920,15 @@ test_cmrr(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
>>   	}
>>   
>>   	igt_output_override_mode(output, &mode);
>> -	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>>   
>> -	prepare_test(data, output, pipe);
>> -	result = flip_and_measure_cmrr(data, output, pipe, TEST_DURATION_NS * 2);
>> -	igt_assert_f(result > 75,
>> -		     "Refresh rate (%u Hz) %"PRIu64"ns: Target CMRR on threshold not reached, result was %u%%\n",
>> -		     mode.vrefresh, igt_kms_frame_time_from_vrefresh(mode.vrefresh), result);
>> +	if (!igt_display_try_commit2(&data->display, COMMIT_ATOMIC)) {
>> +		prepare_test(data, output, pipe);
>> +		result = flip_and_measure_cmrr(data, output, pipe, TEST_DURATION_NS * 2);
>> +		igt_assert_f(result > 75,
>> +			     "Refresh rate (%u Hz) %"PRIu64"ns: Target CMRR on threshold not reached, result was %u%%\n",
>> +			     mode.vrefresh, igt_kms_frame_time_from_vrefresh(mode.vrefresh),
>> +			     result);
>> +	}
>>   }

LGTM,
Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com> 
<mailto:ramanaidu.naladala@intel.com>
  
  static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *output)

--------------waQb8OurGn8cqSHhmzsh79v6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/16/2025 7:11 PM, Naladala,
      Ramanaidu wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:41e76b54-93b6-4b07-ba95-230dfa44eca5@intel.com">
      
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 6/16/2025 10:59 AM, Mitul Golani
        wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:20250616052920.3418160-1-mitulkumar.ajitkumar.golani@intel.com">
        <pre wrap="" class="moz-quote-pre">Don't prepare display pipe when commit already failed for tweaked
display mode. In this case display commit may already been rejected,
and still test tries to set display params on the same. If corresponding
CMRR mode is not found and tweaked mode is already failed to commit then
better further operation should be skipped.

Signed-off-by: Mitul Golani <a class="moz-txt-link-rfc2396E" href="mailto:mitulkumar.ajitkumar.golani@intel.com" moz-do-not-send="true">&lt;mitulkumar.ajitkumar.golani@intel.com&gt;</a>
---
 tests/kms_vrr.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index d371d9d7f..01e5f73c0 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -920,13 +920,15 @@ test_cmrr(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	}
 
 	igt_output_override_mode(output, &amp;mode);
-	igt_display_commit2(&amp;data-&gt;display, COMMIT_ATOMIC);
 
-	prepare_test(data, output, pipe);
-	result = flip_and_measure_cmrr(data, output, pipe, TEST_DURATION_NS * 2);
-	igt_assert_f(result &gt; 75,
-		     &quot;Refresh rate (%u Hz) %&quot;PRIu64&quot;ns: Target CMRR on threshold not reached, result was %u%%\n&quot;,
-		     mode.vrefresh, igt_kms_frame_time_from_vrefresh(mode.vrefresh), result);
+	if (!igt_display_try_commit2(&amp;data-&gt;display, COMMIT_ATOMIC)) {
+		prepare_test(data, output, pipe);
+		result = flip_and_measure_cmrr(data, output, pipe, TEST_DURATION_NS * 2);
+		igt_assert_f(result &gt; 75,
+			     &quot;Refresh rate (%u Hz) %&quot;PRIu64&quot;ns: Target CMRR on threshold not reached, result was %u%%\n&quot;,
+			     mode.vrefresh, igt_kms_frame_time_from_vrefresh(mode.vrefresh),
+			     result);
+	}
 }</pre>
      </blockquote>
    </blockquote>
    <pre wrap="" class="moz-quote-pre">LGTM,
<span class="reviewed-by"><span style="font-family:Consolas;color:#333333">Reviewed-by: Naladala Ramanaidu <a href="mailto:ramanaidu.naladala@intel.com">&lt;ramanaidu.naladala@intel.com&gt;</a></span></span>
 
 static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *output)
</pre>
    <blockquote type="cite" cite="mid:41e76b54-93b6-4b07-ba95-230dfa44eca5@intel.com">
      <blockquote type="cite" cite="mid:20250616052920.3418160-1-mitulkumar.ajitkumar.golani@intel.com">
      </blockquote>
    </blockquote>
  </body>
</html>

--------------waQb8OurGn8cqSHhmzsh79v6--
