Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C682CE8D5D
	for <igt-dev@archiver.kernel.org>; Thu, 19 Sep 2024 08:36:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A49E10E6A1;
	Thu, 19 Sep 2024 08:36:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D6AGeQWt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D9310E6A1
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Sep 2024 08:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726734966; x=1758270966;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fgMCPpJ/0FLzjymg6v2eJMmyw3hWneArMo/zYtamwUI=;
 b=D6AGeQWtTOuxoJWrkxi2Mkk/jAFXbyMqFFWm86oncjzkbSGrASe0ATbx
 6avjPs12tHTleXHN8Bx1XwxwP93qOASihr7octrk3pHz2e2OdUN80gpIw
 ogoXqjtic7ZgVTZHM96uYK7F7p1aqOxfmtyR3vXE3j1dEx1m1HS9dcvEx
 63Ik+IwmsM2DYc5AJLmHuWMOYamJ8cL5j5T3yzoMfPJeRhnxZ+tAfd0mh
 R2PceiP5JTPCMurjwTetkt85lHUDqDMKmVu8mzLvygkJOApzya6P1dZ0p
 SrFswmG/sQYyU4byKeMslQEiCF7RYGZYxTDojnMIknXfzQj7T4hVK319/ A==;
X-CSE-ConnectionGUID: vUDxT4w9Ty6nSYg4cpPJxA==
X-CSE-MsgGUID: 2mKBTuCFTlyclmDaxDIpsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25204244"
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="25204244"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 01:36:05 -0700
X-CSE-ConnectionGUID: j0b/OK/JSeuTdoi5FKzHMA==
X-CSE-MsgGUID: SgIbXfTWTMqoSg9inDazfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="74400232"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2024 01:36:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 01:36:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 19 Sep 2024 01:36:05 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 19 Sep 2024 01:36:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RUqHQu/Rbm6I89vGFFs2E4pplRSveWSA5Phida8pxDK/xpI5KRGmAQX9hHdt24AO10iDAtISgPXUMY3EYyWAYGt7pB9kYahm9Rvbvf/RHcN+6GP/nYYcFtFU1yoZtYJfJTgfT0vJBmnklXo8yH82g+AerCdb6HAMlnVtw69txx6QQ8nNGvo9kejCzZflsxhHECrgrNCNedACfb1Qe3SprbZLmMIpwangfXMVaMCwAFR3JC1a6rTomLRAcR3pHZi8zi6fTup0YkdN8NMJ5o/STSvq5rPzTsrE3BAnFbK+3jCqC3w3s7qCzwJbMo19vqzrQEjZJTF4GLb3BfrT26J0gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ygG8JCU0NFF/2+SbAmb2sxDeh+momL7IlTHu9wahQhk=;
 b=lI/hVOJA9grVOKBkc8WZGMO8cIYWdiXbnwClG6futb47gAtnvirWrrrSOpz/hHaxY7b0r7g2NufKbCrTkj3PA0ZSOgvlfJSSl63y4tO+20jb1L4Ewb+su/iz+QtdfgRk8KHkoJuuPqR5Z2DVXVTurAcOnjZez3p9RsAQu26WAQzPAhKJxgWnFamBBAJ1Hw+HQkGTe51r1O7HFQwJe9FoGQf1llh5tkbqo33OHQm3ZxaJoxXWAn5ogWQF7tUhZ4BNXV7B0Cl+9kvDrnHIsQvtJMr48PzGMGGn8mmf0YIatj/a9PI3+DoUkUFdzTjZBa8iTb1tO0pUGtf6Kw3aK3h7yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 BL3PR11MB6460.namprd11.prod.outlook.com (2603:10b6:208:3bf::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Thu, 19 Sep
 2024 08:36:02 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%4]) with mapi id 15.20.7962.022; Thu, 19 Sep 2024
 08:36:02 +0000
Message-ID: <019e69ca-9868-4d51-9223-c08b0ee63cf7@intel.com>
Date: Thu, 19 Sep 2024 14:05:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_pm_residency: Print execution and
 sleep times
To: "Poosa, Karthik" <karthik.poosa@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>
References: <20240919063352.1607048-1-karthik.poosa@intel.com>
 <6374b703-48ee-45eb-9529-f2bf04622ff8@intel.com>
 <b1011235-0cb1-4531-956b-5ae3cb2e4c2e@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <b1011235-0cb1-4531-956b-5ae3cb2e4c2e@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0095.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::6) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|BL3PR11MB6460:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a50eb12-808d-4656-2005-08dcd88617f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y0h2Z2NuVkVKbDRWS0FEQ1RFQ0R3dEtYMjNob0JWNDZRc28vNkFMMGVmeUQ1?=
 =?utf-8?B?dnVVOXo0M2dmd1dTVitlUVp1OHhnVUgrYk9vdEJPcSsvb1NuM1h0Mkl5NW95?=
 =?utf-8?B?d1czUVRLaGlHazVpK2MxZzVwTkFIN3NwK28wNCtXOHlZYjRVdlRuYzllRTNS?=
 =?utf-8?B?eHhwZWRrTnBRSVVpUnpqMWFya1NjM2R3TkNwQXZBUlJ6QnFyVVpYTld4N0k3?=
 =?utf-8?B?VXlPbVJvbE01TVRHLytmOHQvcVdYTGZFWHQxczZMemIrWE5yVU0zRW0vQzh6?=
 =?utf-8?B?ZmJXa1FYSlJFNTFqSXlmZ2RDUFNGUGxYdnp3M1VwVW12WkZIaXFhMkJFVWR2?=
 =?utf-8?B?ZGpyR1NkcTQ0cXJmT1VHcHVVWDh1WDhtbi81emdLL3hpRnhTSFBhVXJreUY3?=
 =?utf-8?B?NVNoaHpBbURrRTBreTNxa1ppTFdHU2thTGo4N0JSNk05cnV3OVdtcVo2NUtl?=
 =?utf-8?B?UzAwSkRSc0wyUUhQbC9FSEsveHRWMFNzYVZja2l5MkQxaTF6MTNkUW5DdnNU?=
 =?utf-8?B?UE9jcDZ6UFJvbVRScDZCSG01N2FuZllJZThVTlN6Y0tndFl5ZjJPOUd4RTZr?=
 =?utf-8?B?ZVNHcnJCWTluRkZiaTdTUVVsMjBTcG1xbHIyQXNvZ3JjaG0zUkZSM1BwNkNo?=
 =?utf-8?B?TVgzeTR4elI3NytycDMxUzRWOXBDOUNZNGhKdnI5c2ZBbHJGV1RuTW82QVQy?=
 =?utf-8?B?R1d6eUFzVmViSzJmZzg1U09BVHNlZzFCRUIvUXk2L0FMcUxkTEQ0TkcxQno1?=
 =?utf-8?B?QVNraUNOOWpjMm50Wm9TdHdZT2h4TjBFMHN0NFdIc1BtUjl6dmRZQWtma2pw?=
 =?utf-8?B?Q2pVTGdSVUdyWWtYaThGTWdLZDVIYmZXQ2RWdkwrYytZYWRTM0lhVG9hZWxt?=
 =?utf-8?B?Ky9pWExQVnVXQk9xNkMyRk1FcGFCRURCUXFhZG5KY0t6ajNOWFM2eFZoZjdU?=
 =?utf-8?B?TVc4cGdENElBUEhZbzNxcWw0UlFXT2dIQnE2eEpVVTlRNTA3RGszSGh6Mno5?=
 =?utf-8?B?bUlhZDFxV3RpbldWWC9GTG9jV04xTVdHcC8rVDlEWnAybEFIN1M5a2JYYUhQ?=
 =?utf-8?B?OFErLzg2WnBwQzNDNEk3aW5EdTlySlJGUGdBNGZ3MnZsRi9IZnl6VFlPeFB4?=
 =?utf-8?B?WUxEd0dwMDRNWGtCNjhwd1NqWEJaTUY5SXBGM0VFNFhNTGNCMUVnbFkzcHdJ?=
 =?utf-8?B?enZDdUNYUWRmWHVxSFNKMnNSd2N2Ry9mVnRqQ01pWUsrb24vdnlYUkpNcmxL?=
 =?utf-8?B?Z3N3dEI1SzJUUWhXQmlSc2l3bVJNajU2WlNJWURHbGh6bENHakJ3dTN1QnM4?=
 =?utf-8?B?RlkyTUU2QUdxTWtHYjFhcHNuUnNUTjVHQVBHRGJsQVgrVGp5R3gySmN1VVBC?=
 =?utf-8?B?NndZVG40ejkzSldySElqSk9Ic3M4aUJJbFFnS2RRejI0dFltdzBSTlJvc1Z5?=
 =?utf-8?B?c1ZUOWQ1QXVkSHRUb3dIclVITTQrak9vWktRdWZBb2lwUzlHZjJEYjMyYThr?=
 =?utf-8?B?MndhWmtKSThnckxrZi9zM0dVYitiQm1DaFBIclRNNG1ZRFlTUGY4ZFFIcjlY?=
 =?utf-8?B?aWxPN1RsaXorMW9KSnVueGhWTVArUHhZdUU5WlFXRzVENGJ2am1xWElCb1JT?=
 =?utf-8?B?WmR0dVBBY2dRMGFpZUhIWlFRRHhYenJla0xOV3o1d2lKd0N1L0JGYzFOOE16?=
 =?utf-8?B?VUdSV2RXbnRWWXNzOTNUVTdNWmJtaEdiSUFRaVVUanF6ZnRxUllrUC9CcVBO?=
 =?utf-8?B?YkJBa3VQU2RiMG9BMzZGL1V2QUlVbWxyR1dpVkd1SUFZOTlFWTdMRFpJS1Rr?=
 =?utf-8?B?TURsS0RNb3A2YVdRZU5WQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2s5dHZnUXBIcEJwV1BZSjBwOXA4a3ZCR0hwUkxFbDR2aUx6bDVDR3dWT3I2?=
 =?utf-8?B?U1dYUk8yS0NlbmFBLzVhcnJBUWs2Snl5V3JGdUFXVUo3RmtRNnFpcHVTZkMv?=
 =?utf-8?B?bXQvUkU0SWYrV1FVdE9aaHlvYkFxMW53NmllNEV6emU3eDdFWnNXbC83V2JE?=
 =?utf-8?B?YU5sMHVrYUVXZEw5WjIvMXNrQ3JnQUludGFMUW5rZDVKUU5pUXA3QkRSRldG?=
 =?utf-8?B?ZUtHcEVFLzFMQjZ4eEZha1EzQlRBVEgyamFtRm04WGtzaFdmQ01Ncmt0TmNm?=
 =?utf-8?B?QkUxcmEwbEx3VWZKQXB1TDVYendMbnlwYnJtQm9LS2JQNnVKdHlSNTRYc2dH?=
 =?utf-8?B?VGRCcVlnTVlMaUgzYWpXWTFJK1pzdjVHSWxzZjc1OWExbG5lM1IrY0NJejNP?=
 =?utf-8?B?Vm92SGdBM080aVBtUFE4OG9henJVa09rZ2hoNXFGY3Z0d3lJSHVobHVJZ1NV?=
 =?utf-8?B?VGF1NHdiOEE2WUw1YVROMnFaSkthdWU5TVhONS96K0dsV3pDcTZGZ0RIY0VX?=
 =?utf-8?B?YitnNkpJa21RSVJBZ25jV284QWd2Z0JxVWNmMURZbS9CMWV0UjBnQzJEVEtB?=
 =?utf-8?B?WEkrck1adG9ZTm5nWUZUcnpLMFR1UE5WK3VoZHZOdjZzSFpmRGM3RWtvZE85?=
 =?utf-8?B?eGg1T3dnVzNHVllYNGV3RVdRWFV2V2VpRWhIczMrYllGOHFmajBHb2VTTkM0?=
 =?utf-8?B?Z1JGdXJRZUQwb0VCVnJZNUpld3VqYmtmU3hqYlZDSXMyNC9pamZoMXB3ZTV2?=
 =?utf-8?B?U0huVnc1VjR6Wnc4SE8zdzQxRWFxTitPYnFCZml4c2JvK0htek1wdTZabENw?=
 =?utf-8?B?MU94OEw0ZUVmckZqcm9PSEwzanZmTVI4OStrVXNoOFhPd2lHamJ5N1pIN1J0?=
 =?utf-8?B?SC9FTGtzSGlWNXYxQUhRR3NHd3VSZFEwTjd0Uk51L0tIRVV5MXg5cTVBOTBw?=
 =?utf-8?B?V3UxNWdlY1o3dFp6b05yc1JKSVUxNlZ6NXJWWVNPNXNtNmVMb0UwRHIwdjUw?=
 =?utf-8?B?bXR0bWExVkIreTM3Z0pFUDN6Rnc3N3NNZUFOM29WYzNER0s0MllmYUpVeVV4?=
 =?utf-8?B?QU1XZWV6NC80dXdrRVRrODhLdXpsV3p3TFNlYnNhaWd4OFk0UCtvZWhJdVp2?=
 =?utf-8?B?enE3SFp1Szg4ZHl5VnZYRTJ6b1JnbnE2R21oMTdldThJS1RUY2JseTBWSU1j?=
 =?utf-8?B?c0s2U2J0bHkzL0VsQUhjYklwaWVMNGQxcnNSU3hqOVBNQzNZc1BDWjMwTXg4?=
 =?utf-8?B?elVBUW9FSmVBMmpVK2VOc3gzUEk4ZUdtOVlRYm1FVGhEUnBONytDSHBNYU05?=
 =?utf-8?B?Q1RrZTA4cCs5cThKUkx2SnlhcUtUeTJ2VFFlSUNCa3llV0EwNHlERlVqdnhL?=
 =?utf-8?B?R2ZYNVNabE5COHh2ZGhId0lubTQ0NDNHOWRmUEkrRW1qYUY0L202SkM2Nk55?=
 =?utf-8?B?VkJtdWxlaHJyVjBCaGJRR3BCWTIyT1hBMXJXblo0cSt3ZzhQRXVIbTdkeUZs?=
 =?utf-8?B?d0toNCtBTUtxcis5dnN6clJTM2VuVlJaZ1RCK0tzUUJpSXg5bk9ZNmQydkJG?=
 =?utf-8?B?UFlzM1A0WW9SZFdaT1QzblNCNkZvczVPRi9zSktLaWllYjhJOXlkRzJmamYw?=
 =?utf-8?B?VVlRQnlJYTM5eDVaWEdMVFVPSzBFeXNldlRsbFBhUEIzV1NYZGEyY1pjNEhS?=
 =?utf-8?B?WXRzL1pwdCtuZDFyS0Fid2VhcmJSSGh5cEJ4bFZJQ3dSVHBJOFRLR2lRSllo?=
 =?utf-8?B?Y2NRbUZuNTdBSTdiY3d4a3pEcTBGZy9nemgvUHN0Mm5HUkxnUXRYbW1oN1kx?=
 =?utf-8?B?OTZPeXVPRnBqb1UxKytwNXVHd2hnc3ZNcHFjTTEzRmJnd000bU40aUZOVm93?=
 =?utf-8?B?dndIWW12bVVMZmZDbk1aL2Ewb2NEbEtIM0gxV01UY2pvRUw3WXNwdmZyWVpy?=
 =?utf-8?B?V0hqWkhFWXN0M25RTnNlSDRCK0RWbSswdjVDcUcwbDcyNVZ6Y2tZQjIzQTR1?=
 =?utf-8?B?RDgxM2twbW1IbkthcmdubUF3eFc4UFVZWjBET1RreGpYKzBCdFE2T0tvUXl1?=
 =?utf-8?B?dUd3ckNoeHJyQzArYzM5SmJiM3pWa25SMmdsRUlHZ3FteDFhc2Y3YnVmTVov?=
 =?utf-8?Q?lgq743p0KZzxFC9LUpY9yjJZn?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a50eb12-808d-4656-2005-08dcd88617f5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 08:36:02.2456 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R+oEtTjCKvFfevz8Ah0dc5UvM9a5eHJrlBBIM8BbwIay+Z7nYeVwEBQ8zkfyta0Qqb3NDWd5uOsFv+e7zvlfXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6460
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



On 9/19/2024 1:44 PM, Poosa, Karthik wrote:
> That is debug patch, we dont need it here.
This would be useful only for monitoring the timeouts.
If the intention of the patch is same,

LGTM
Reviewed-by: Riana Tauro <riana.tauro@intel.com>

> 
> On 19-09-2024 12:37, Riana Tauro wrote:
>> Hi Karthik
>>
>> you had sent a patch with assert prior to this. Don't we need
>> that?
>>
>> Thanks,
>> Riana
>>
>> On 9/19/2024 12:03 PM, Karthik Poosa wrote:
>>> Print the workload execution and sleep times of the test to help 
>>> diagnose
>>> timeouts.
>>> This will show how long the workload ran and how long the test slept.
>>>
>>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>>> ---
>>>   tests/intel/xe_pm_residency.c | 4 +++-
>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/tests/intel/xe_pm_residency.c 
>>> b/tests/intel/xe_pm_residency.c
>>> index 0e687558b..3c3b33ab1 100644
>>> --- a/tests/intel/xe_pm_residency.c
>>> +++ b/tests/intel/xe_pm_residency.c
>>> @@ -139,7 +139,7 @@ static void exec_load(int fd, struct 
>>> drm_xe_engine_class_instance *hwe, unsigned
>>>           elapsed = igt_nsec_elapsed(&tv);
>>>           igt_assert_eq(data->data, done[1]);
>>>   -        igt_debug("Execution took %.3fms (submit %.1fus, wait 
>>> %.1fus)\n",
>>> +        igt_info("Execution took %.3fms (submit %.1fus, wait 
>>> %.1fus)\n",
>>>                 1e-6 * elapsed,
>>>                 1e-3 * submit,
>>>                 1e-3 * (elapsed - submit));
>>> @@ -150,6 +150,8 @@ static void exec_load(int fd, struct 
>>> drm_xe_engine_class_instance *hwe, unsigned
>>>            * Execute the above workload for ~1% of the elapsed time 
>>> and sleep for
>>>            * the rest of the time (~99%)
>>>            */
>>> +        igt_info("Sleeping for %ld ms\n", ((elapsed / 10)/1000));
>>> +
>>>           usleep(elapsed / 10);
>>>       } while (!READ_ONCE(*done));
