Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C58C3DA64
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 19:04:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F87110E92A;
	Thu,  1 Aug 2024 19:04:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dstP9BEZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9212F10E92A
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 19:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722539066; x=1754075066;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=gKzPz/WeXBYKTC+7vN5fXwLKKni/PhZBBQs9yzhGTuo=;
 b=dstP9BEZMXbizD7ya6l80u2zh4IPdrl/hMGO27uYgcsbXDh8VUOngfJr
 Y/EmBo/bNcQBVQVWprWy9Wp8NSeAY6zRCjf3S12LGK4WnNhXDntTagG59
 O390vwZRS9ttxum7XGslaSvpVfy1GkDZEIKM5lhIsDfzPjIasWlOxO/Kn
 WqhU9nV+Em0sDHiL71aaEf3BXeHL+Er5Kxlr9S1H/V3uNp2ehj7oJn6+c
 jVRHOwg8UC1GYxzQVaBSfeN86Nfh4n29zIEOQBFe8OLThTdWU/bNGE1iz
 iQzuEro4jadwS9tGCgHi1ZkRMluHF9v5tHHjKw9rOORdEVJMIV5nW2C/2 g==;
X-CSE-ConnectionGUID: Dis6H+kOQeiWv5Hj1EpvYw==
X-CSE-MsgGUID: 0gVqs46ZTgSAiFia31rfiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="20344618"
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="20344618"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 12:04:23 -0700
X-CSE-ConnectionGUID: 0457tRKUTZ2azx+idePT8g==
X-CSE-MsgGUID: cnvtEo6HRkSbyECFd1pelg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="55063008"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 12:04:23 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 12:04:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 12:04:21 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 12:04:21 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 12:04:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m/zaCQXJKyUnBXjJTvtQDkxZRPNStAY/PSSSqVLEQOMm7IpQumknT355JAozEhx16fAC1kRotDjBeq7l9HzrUO7k5RZIUl/iLA+uToAVhFNXA3Txzl2FeLp1QkAhj23gcgFoNLY7EJ6U/5fPwZXr6Ju8iqG5UY7eXemwV+Cu9Vr26GlUBoWGRfhxxdR+ZEASALB9EXFDg3vDDSORgGG3QvSnmqNcyfyRuYXSt5dmkJvGy27rvyl7Q/PRUOpjuHn4vZEFU9KXVyyphMbe0CdpgsLzObB/CVBit4wXwJowd3hZxSLUylIBIwADJGtW4KLXngspIsTOC1zyuecFUXbJSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gKzPz/WeXBYKTC+7vN5fXwLKKni/PhZBBQs9yzhGTuo=;
 b=MBDzMXt0ygFOsC6t1fh6DYGoNEM4TfmdqjxmCfu2dzTbHUfQJgQBr9p8FqpYr+z/vv8wlVL+6GuH9hcfXiZNeNmviTvHz/YBbRt7iQTUBI9oKOxlkCTKiBQW3pUWuLnbAFhsxVzpuPC3sxdqdSQRY5t/olqOmsX1Ct0v7lAKOmwc7JFPxWqDsm8WcCCa2FRBHoefMyiAS/RVsejXYmSbQxKxrDrwI+m3NP94nOF/3X9RQU3jHt+Vs13NSYgW5chMiAfSIPkg0NNpM9texokL6aX/ddvWD+wfRREta8UHqnr5pv9/mdzg8CnjCaIPFs7ASaTL32wVe365BwPiiegpAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14)
 by DS0PR11MB7262.namprd11.prod.outlook.com (2603:10b6:8:13c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 19:04:12 +0000
Received: from IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9]) by IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9%5]) with mapi id 15.20.7807.026; Thu, 1 Aug 2024
 19:04:12 +0000
From: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Manszewski, Christoph" <christoph.manszewski@intel.com>
CC: "Patelczyk, Maciej" <maciej.patelczyk@intel.com>, "Hajda, Andrzej"
 <andrzej.hajda@intel.com>, "Kempczynski, Zbigniew"
 <zbigniew.kempczynski@intel.com>, "Piatkowski, Dominik Karol"
 <dominik.karol.piatkowski@intel.com>, "Sikora, Pawel"
 <pawel.sikora@intel.com>, "Kuoppala, Mika" <mika.kuoppala@intel.com>, "Mun,
 Gwan-gyeong" <gwan-gyeong.mun@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>, Kolanupaka Naveena
 <kolanupaka.naveena@intel.com>
Subject: Re: [PATCH i-g-t v2 39/66] tests/xe_exec_sip: Check if we reset due
 to unhandled attention
Thread-Topic: [PATCH i-g-t v2 39/66] tests/xe_exec_sip: Check if we reset due
 to unhandled attention
Thread-Index: AQHa4nZ0HUfyo1ztMk2zrTe8avuv57ISxkKA
Date: Thu, 1 Aug 2024 19:04:12 +0000
Message-ID: <20f27cc9b7f0c16800512f3f7e865e0a08aa0b32.camel@intel.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
 <20240730114523.334156-40-christoph.manszewski@intel.com>
In-Reply-To: <20240730114523.334156-40-christoph.manszewski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7864:EE_|DS0PR11MB7262:EE_
x-ms-office365-filtering-correlation-id: 7c5a4d88-953e-4dcc-596a-08dcb25cbb1a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dUJFb28rMk1qd1VMelBmMmxQV3I1Wmh3MUlXaEI4YzJOclNBclZQMmZQU1d4?=
 =?utf-8?B?dWVjWTJlZzJnWTJEQ011VGtOQ1pERm1OK1QwVFA3U2hTUDBTQWpLSm9uaXJq?=
 =?utf-8?B?U2s0SG03MThDYlplVjFNd1JzRVJUaXIra2RhS1NLTGdqUzdVNFJlTWlKYlpI?=
 =?utf-8?B?aURQelNOcENGQVJIMDRodjBCS0hPUnFlLzVsNmFacGxwSTRRM01SWWZhMGxu?=
 =?utf-8?B?NDhSRTVqY1NEU09mVm1qUktSTm9sd1VqUDVkYUVoS1lUK0JvbWFPQXF6aGZT?=
 =?utf-8?B?U3dXN0t0KzUxM084VnlsOTMvNVVtbjYxTStmejJycTFJUUptWWFWMUpScWNk?=
 =?utf-8?B?NUNnekJ1bEoxTVRzcHowT2NINldTdmtOMTdJYzJyTGxhVkdQbjUvOVp5dTVa?=
 =?utf-8?B?Zlo0RmFSUnZlVnFpT3FCZGZaTWM3Z0k1QW80bVJ0VFVUYkMvcnk0UGJwZkRq?=
 =?utf-8?B?U3FKSWl0MGdPUWRkaTRybzNNVHpWb1lxQlVCb2lYWC8zWVhFdnh0akUvd29P?=
 =?utf-8?B?aVdqYmRRanNLcm5GVUhjMHJaTWJHcXhmeWJQY0tIK1NBaDhoTzFJSy9zalRq?=
 =?utf-8?B?ejNPUkpacElIT1Vjb3o3SWhISkJPbjhsRUZYR1g5Wi9wdFhKanJQVHkzV2hS?=
 =?utf-8?B?S3ZzVEFLMlRpbFE4azlqUWNMclFOc0dzcFpGN1J2b1NZb1R5QTQvVHNwdm9U?=
 =?utf-8?B?ditsUCtoQSt1SjFKMkVFZnoyZWNUbUZlcWpoT3VaalBCYm1LNlo4dGZaUTNK?=
 =?utf-8?B?dm44RlNzUVJ4U1MvSmQ5elZYRUZPMXZxWXdPUVVpVngxbmFpendGclJyUlRZ?=
 =?utf-8?B?c2FoSVN1b2U1ei9GYXVwL3VacDR1b2tqeEtYdE55UCtUaXE4cmZRVm5CTzZU?=
 =?utf-8?B?Ty9QYTM5N05GSmp3RDEzSDFIc2RiMGFLY3JKVVQwbzk4R05NNi9Vam1IZ0tG?=
 =?utf-8?B?TXc5bTN4b09kWEFBSTVnV2dPK3JNVmdTVFIrS040czlsSjQwNmlaTTV4ajJt?=
 =?utf-8?B?MEN0ZCtLNThJM2x1a2pBelZ1RVRTTXA4TG5sWi9EZUtHVUhYeWFzOHlZSGQ4?=
 =?utf-8?B?ZzBMS01BY0FlUWtJcmZHL2tJTVUzWW00RTVsQWl5OVhRdFp0RHVtc1VsNXFm?=
 =?utf-8?B?eUg0SWlVRkhhTE1YbDQ3djZOak14NnM2cFB0VkZOWU9iTC9Ka2tPOEJJU2ox?=
 =?utf-8?B?dGU1NjRDWW9GbllwUXl4OVBaRFZQUENJR2kyTndLVHB3aWk0NFJxbHIyZ3Yr?=
 =?utf-8?B?ekxkeGhwWnVZOFpmS2xHK1hVdVBPOS94MUtWZjI0eTVPNkJ3U1dvT1dQbk9E?=
 =?utf-8?B?TTl2dmxBUEJVYjF5Nk5HQmZhK1lhTDIxK0hjNmE0R3FZSXQxYjN6Z1NtdjJQ?=
 =?utf-8?B?WFBobmtNM2ZuRUtYSE9ObmhyaDB1dFZVOEo4NDJVTkV2L2wrOWcwYUc1cUhT?=
 =?utf-8?B?U0VpVFJVcDZia3MwT2R4NEF4emdSTzh0L0ptUFNRc2h3aGFWdndOb2FRb2J6?=
 =?utf-8?B?cEVzY2RQSG1lRndzRTh6d0dvUk9EVUJjZDlNZVppVmZjOE1iZG5yejlTSk04?=
 =?utf-8?B?bHV5bDNkWTVMWlhWKzlqQjNzQkVrYjdOdXRoNzc3TytxWmtMRmh5T2RIN3ZD?=
 =?utf-8?B?dFVlZ2xRRmNtUkNLU3gvaStTNHg2WGovb202L1J2TW1BNldVK2NjK0FrL0ds?=
 =?utf-8?B?aE0xd1J5RjdjZnNtL3drazY0bDQ0WlJYRkNwL295ZG5qUThLaTNmZU1SWXR6?=
 =?utf-8?B?OHZkWkRwUldtSE1XcDVxRW9ad1dlZHZMa0IvUWNyLzNSL3dZRzczOHFsdzBE?=
 =?utf-8?B?QkxDODFMdU1BWmFFRmYyc2E4bm1nWTR0S2hLai96RG9DbjR3Z0ZBMVhGZmkx?=
 =?utf-8?B?TFk4RFdZYW9wdFd6RWVVWnZLNjVCRFhBU2VRbEZXQnVtSHc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WWo0NlFUcW5VZ1g1TDNrMDN6V1F0eWVmYWxmc3pBVFZBOFFmK3BFWndNdEdU?=
 =?utf-8?B?WTQydnB3enp1dko0dWFiMVRraTZTMkdUM3YrRVhHMWp4cG5ZTER2dmJpWTdp?=
 =?utf-8?B?WS9HcHEwc1djc3VFMm1qNzhNbDdPbXVmbStsU1h4UUU4anZ5T1FucVkyS2VJ?=
 =?utf-8?B?b2kxNkxjSFkxZXRObXhuYnpSczZuRWllN3p2OVZ5UFpqTFlQQVd2bjNhekcz?=
 =?utf-8?B?eFNRWDl6OXI1M0xsTFdESzZpd0Q3Y2VuMEtZY2QwTXprWmxsQ2FFYy9FOGh5?=
 =?utf-8?B?SC8weVJyYTZyeDhYQzRndUJGd0V3RzgxaGVJMW43SkJRbVJDQ2p6V2haZHlV?=
 =?utf-8?B?b2dhV3MzUW5aOFFQclJBbExVVzRLdzZsNTdVZFdYQXBzRmpmaWpmOGdSWU1W?=
 =?utf-8?B?MjBpMThwR2NTanJYUWExNmNVazRSdEJYUEMyNFJTdXREQkdWdGR1VGpqMmJE?=
 =?utf-8?B?Wm1aRWlKS2ZzZWJhS3JJK0tSYmJxZDVkUzVnSnRad3FJdVVpUWFYZXJpQXVG?=
 =?utf-8?B?bTY3WHJPaFg2TFFySUtQQm5YL2txa2dBUmZyY09QOXFadkRwUGRwV3owRUlx?=
 =?utf-8?B?NUtjQU5NOENuZENFVkhqcFdHaktRL0NrQ0NaRWI3ejVyUWZHcVplY3VoMkJs?=
 =?utf-8?B?NGMxTEpzWlRKaEFvaUloblBSVVRldDlQTERTODR3VDNIY2tQc3BBY29sMDEw?=
 =?utf-8?B?S1R5RGQzeDBNcndTYnlRVFlIUE5mUW56QVZiUlM4MmNxMGJTTGNZb1VkbXhp?=
 =?utf-8?B?dVNUNUM5TVJNYWdhZ1dHSnp4Nm52OGIzR00yK2VtNUo4dVVKaGJGOHk2UXA3?=
 =?utf-8?B?eWFvSHZqM0VGSnJpUzM3VlZIZno1WjllTmlWTVN3L3lWMWl3Uy9INEJGc1Qx?=
 =?utf-8?B?cXlCN2o4YVpJOWlWNTZtOWRyR2dJdW9nenVtQlY4SWtmOE55ZVA2N0pNK0VK?=
 =?utf-8?B?L1V3VWZQbXdNdGwwZTVoQWFJeUZqWG1QbG5GcGhCT3dzQmVYb0E4cCtxSm9W?=
 =?utf-8?B?bUhBZnVrMzE5ZjJ0ZmYxN0lzWVZtbEtNMzFKcXBGaHRSV0ZScFJFZkR2UEdl?=
 =?utf-8?B?RzNxYmo2ZUlxRHkwSDBPVVgvcTlTZmNyejVHRTdhZ3RhUWJGL3VXUHNyemE1?=
 =?utf-8?B?aTZxUXVNLytySXBrbzdmKzhXazdvamFqUDBocDlyd0VQdzRoWkpHeSswanZH?=
 =?utf-8?B?TGVrc1lVT2xLMmZseDg5bS9oR2VDdkFHWExZTllDWFFMMzB6NzdFV3FHOVdD?=
 =?utf-8?B?SzJqSEN0Y0tCRTNQYkV2RHNDNWZ4OXMvQkllNjVyeEN0bVZBT2VxN3o4bmVz?=
 =?utf-8?B?V3U4UXFhKy9LVy9nWC9ncnJkMXB1UjdHWFEzTTYvamZCUURUTmQ2YkxSMVQy?=
 =?utf-8?B?QUdqTmo3VkFtZmhRSXQ0S1Q2WUErUnlEQWY2TXdUWng3SW9na3AwcTN0akVL?=
 =?utf-8?B?aE50WGRIZmJzU0tkazBBSWVUMExERlJ0a2lrK0RPdWVWZFdqWGFqOGFLTlhQ?=
 =?utf-8?B?cEF5R2dGemlWOUJSakN6NWNOak5ZaHhZV3Q0WDlnM1Z2ejVhVFJnQmxnOHZp?=
 =?utf-8?B?YWdCZnVTSmxzS05zQ2drcHQzbnloQ05FV0wydGJuNUx1ZUh1ejJvNjVTYU8r?=
 =?utf-8?B?K0JnQ3AzN2lrYzNSU3NPdTJTUE8wQVZ5dG9ZLzViZWZla05xTVFKVnBKckor?=
 =?utf-8?B?aFVmbmZ5clJJK0tSL0hwd2RZcFBPRFhSdVJ3WW0vVzc0SGFzaDRpbGxORGJV?=
 =?utf-8?B?RStRaE0ydlhZL3ZnRm9aMlVzQjRUdzZySWZCcmx0RFB0U0FEL04xQlJwK2du?=
 =?utf-8?B?eWdhd3dsbVQwVzNLUDIvRXloK3NCNUYwamhoU0pmcGc2VmFKMlhiclhRSlZH?=
 =?utf-8?B?alVoZlZxQnM2aTZHQlozSElDSGp0em4yQzBGeFlDMm4vS0RCeEczcXFuTDc1?=
 =?utf-8?B?cVVaQm0rdGNwS1dQS3J6L3RPZEZjbTlrV2F5dFNlcmhDSHRLNTJTRDRSb1N3?=
 =?utf-8?B?VXZFMjVvaE5Ed0FzclV2c1Fyb3hCblc1bmNEWFBBWmRLcHJ2TUN3QTl6SHBC?=
 =?utf-8?B?K3huUnNZNnFSWGlKSjdyTWNDZk1JWEhYS0hHTVp4a08rUGFNTG1vdWMvdG1J?=
 =?utf-8?B?clZsTmVzNFMyam45SW0yODRTVEhPaHQvczBBN3BTeDhrMFBZMXV2UFAydXN2?=
 =?utf-8?Q?4tF6vQRYk8nCV8Of6Hpfyoo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A1942F0F93D4DF4AA59F535B65C16316@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c5a4d88-953e-4dcc-596a-08dcb25cbb1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2024 19:04:12.5225 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sQT5ms1SwCFtlLmCGqTNCIgdW19wR4ZqSb107xAvavwNmlt7ALbwQ+qnaS52KixKRXhJsP5gzyUBxYzNS4jtChYKO/jzM5/wZyD998YX4Rk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7262
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

T24gVHVlLCAyMDI0LTA3LTMwIGF0IDEzOjQ0ICswMjAwLCBDaHJpc3RvcGggTWFuc3pld3NraSB3
cm90ZToNCj4gRnJvbTogRG9taW5payBHcnplZ29yemVrIDxkb21pbmlrLmdyemVnb3J6ZWtAaW50
ZWwuY29tPg0KPiANCj4gQWRkIGJyZWFrcG9pbnQtd2FpdHNpcCB0ZXN0IHdoaWNoIGNoZWNrcyB3
aGV0aGVyIHdlIHJlc2V0IHVwb24NCj4gdW5oYW5kbGVkIGF0dGVudGlvbi4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IERvbWluaWsgR3J6ZWdvcnplayA8ZG9taW5pay5ncnplZ29yemVrQGludGVsLmNv
bT4NCj4gQ2M6IENocmlzdG9waCBNYW5zemV3c2tpIDxjaHJpc3RvcGgubWFuc3pld3NraUBpbnRl
bC5jb20+DQo+IC0tLQ0KPiAgdGVzdHMvaW50ZWwveGVfZXhlY19zaXAuYyB8IDIxICsrKysrKysr
KysrKysrKysrKystLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfZXhlY19zaXAuYyBi
L3Rlc3RzL2ludGVsL3hlX2V4ZWNfc2lwLmMNCj4gaW5kZXggZTUyODg5ODE4Li4xYjBhY2NiM2Ig
MTAwNjQ0DQo+IC0tLSBhL3Rlc3RzL2ludGVsL3hlX2V4ZWNfc2lwLmMNCj4gKysrIGIvdGVzdHMv
aW50ZWwveGVfZXhlY19zaXAuYw0KPiBAQCAtNDAsNiArNDAsNyBAQA0KPiAgI2RlZmluZSBTSEFE
RVJfV0FJVCAyDQo+ICAjZGVmaW5lIFNJUF9XUklURSAzDQo+ICAjZGVmaW5lIFNJUF9OVUxMIDQN
Cj4gKyNkZWZpbmUgU0lQX1dBSVQgNQ0KPiAgDQo+ICBzdGF0aWMgc3RydWN0IGludGVsX2J1ZiAq
DQo+ICBjcmVhdGVfZmlsbF9idWYoaW50IGZkLCBpbnQgd2lkdGgsIGludCBoZWlnaHQsIHVpbnQ4
X3QgY29sb3IpDQo+IEBAIC05Nyw3ICs5OCw5IEBAIHN0YXRpYyBzdHJ1Y3QgZ3BncHVfc2hhZGVy
ICpnZXRfc2lwKGludCBmZCwgY29uc3QgaW50IHNpcHR5cGUsDQo+ICAJc3dpdGNoIChzaXB0eXBl
KSB7DQo+ICAJY2FzZSBTSVBfV1JJVEU6DQo+ICAJCWJyZWFrOw0KPiAtCS8qIFRPRE86IEFkZCBh
bHRlcm5hdGl2ZSBTSVAgaW5zdHJ1Y3Rpb25zIGhlcmUgKi8NCj4gKwljYXNlIFNJUF9XQUlUOg0K
PiArCQlncGdwdV9zaGFkZXJfX3dhaXQoc2lwKTsNCj4gKwkJYnJlYWs7DQo+ICAJfQ0KPiAgDQo+
ICAJZ3BncHVfc2hhZGVyX19lbmRfc3lzdGVtX3JvdXRpbmUoc2lwLCBzaGFkZXJ0eXBlID09IFNI
QURFUl9CUkVBS1BPSU5UKTsNCj4gQEAgLTIxMSwxMiArMjE0LDIwIEBAIHhlX3N5c2ZzX2dldF9q
b2JfdGltZW91dF9tcyhpbnQgZmQsIHN0cnVjdCBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNl
ICplY2kpDQo+ICAgKiBTVUJURVNUOiBicmVha3BvaW50LXdyaXRlc2lwDQo+ICAgKiBEZXNjcmlw
dGlvbjogVGVzdCB0aGF0IHdlIGVudGVyIFNJUCBhZnRlciBoaXR0aW5nIGJyZWFrcG9pbnQgaW4g
c2hhZGVyLg0KPiAgICoNCj4gKyAqIFNVQlRFU1Q6IGJyZWFrcG9pbnQtd2FpdHNpcA0KPiArICog
RGVzY3JpcHRpb246IFRlc3QgdGhhdCB3ZSByZXNldCBhZnRlciBzZWVpbmcgdGhlIGF0dGVudGlv
biB3aXRob3V0IHRoZSBkZWJ1Z2dlci4NCj4gKyAqDQo+ICAgKi8NCj4gIHN0YXRpYyB2b2lkIHRl
c3Rfc2lwKGludCBzaGFkZXIsIGludCBzaXAsIHN0cnVjdCBkcm1feGVfZW5naW5lX2NsYXNzX2lu
c3RhbmNlICplY2kpDQo+ICB7DQo+ICAJdW5zaWduZWQgaW50IHRocmVhZHMgPSA1MTI7DQo+ICAJ
dW5zaWduZWQgaW50IGhlaWdodCA9IG1heF90KHRocmVhZHMsIEhFSUdIVCwgdGhyZWFkcyAqIDIp
Ow0KPiAgCXVuc2lnbmVkIGludCB3aWR0aCA9IFdJRFRIOw0KPiArCXN0cnVjdCBkcm1feGVfZXh0
X3NldF9wcm9wZXJ0eSBleHQgPSB7DQo+ICsJCS5iYXNlLm5hbWUgPSBEUk1fWEVfRVhFQ19RVUVV
RV9FWFRFTlNJT05fU0VUX1BST1BFUlRZLA0KPiArCQkucHJvcGVydHkgPSBEUk1fWEVfRVhFQ19R
VUVVRV9TRVRfUFJPUEVSVFlfRVVERUJVRywNCj4gKwkJLnZhbHVlID0gRFJNX1hFX0VYRUNfUVVF
VUVfRVVERUJVR19GTEFHX0VOQUJMRSwNCj4gKwl9Ow0KPiAgCXN0cnVjdCB0aW1lc3BlYyB0cyA9
IHsgfTsNCj4gIAl1aW50MzJfdCBleGVjX3F1ZXVlX2lkLCBoYW5kbGUsIHZtX2lkOw0KPiAgCXN0
cnVjdCBpbnRlbF9iYiAqaWJiOw0KPiBAQCAtMjI4LDYgKzIzOSw3IEBAIHN0YXRpYyB2b2lkIHRl
c3Rfc2lwKGludCBzaGFkZXIsIGludCBzaXAsIHN0cnVjdCBkcm1feGVfZW5naW5lX2NsYXNzX2lu
c3RhbmNlICplDQo+ICAJZmQgPSBkcm1fb3Blbl9kcml2ZXIoRFJJVkVSX1hFKTsNCj4gIAl4ZV9k
ZXZpY2VfZ2V0KGZkKTsNCj4gIA0KPiArDQpFeHRyYSBuZXcgbGluZS4NCg0KUmVnYXJkcywNCkRv
bWluaWsNCj4gIAl2bV9pZCA9IHhlX3ZtX2NyZWF0ZShmZCwgMCwgMCk7DQo+ICANCj4gIAkvKiBH
ZXQgdGltZW91dCBmb3Igam9iLCBhbmQgYWRkIDRzIHRvIGVuc3VyZSB0aW1lb3V0IHByb2Nlc3Nl
cyBpbiBzdWJ0ZXN0LiAqLw0KPiBAQCAtMjM1LDcgKzI0Nyw5IEBAIHN0YXRpYyB2b2lkIHRlc3Rf
c2lwKGludCBzaGFkZXIsIGludCBzaXAsIHN0cnVjdCBkcm1feGVfZW5naW5lX2NsYXNzX2luc3Rh
bmNlICplDQo+ICAJdGltZW91dCAqPSBOU0VDX1BFUl9NU0VDOw0KPiAgCXRpbWVvdXQgKj0gaWd0
X3J1bl9pbl9zaW11bGF0aW9uKCkgPyAxMCA6IDE7DQo+ICANCj4gLQlleGVjX3F1ZXVlX2lkID0g
eGVfZXhlY19xdWV1ZV9jcmVhdGUoZmQsIHZtX2lkLCBlY2ksIDApOw0KPiArCWV4ZWNfcXVldWVf
aWQgPSB4ZV9leGVjX3F1ZXVlX2NyZWF0ZShmZCwgdm1faWQsIGVjaSwNCj4gKwkJCQkJICAgICBo
YXNfZGVidWdnZXIoZmQpID8NCj4gKwkJCQkJICAgICB0b191c2VyX3BvaW50ZXIoJmV4dCkgOiAw
KTsNCj4gIAlpYmIgPSBpbnRlbF9iYl9jcmVhdGVfd2l0aF9jb250ZXh0KGZkLCBleGVjX3F1ZXVl
X2lkLCB2bV9pZCwgTlVMTCwgNDA5Nik7DQo+ICANCj4gIAlpZ3RfbnNlY19lbGFwc2VkKCZ0cyk7
DQo+IEBAIC0yOTIsNiArMzA2LDkgQEAgaWd0X21haW4NCj4gIA0KPiAgCQl0ZXN0X3JlbmRlcl9h
bmRfY29tcHV0ZSgiYnJlYWtwb2ludC13cml0ZXNpcCIsIGZkLCBlY2kpDQo+ICAJCQl0ZXN0X3Np
cChTSEFERVJfQlJFQUtQT0lOVCwgU0lQX1dSSVRFLCBlY2kpOw0KPiArDQo+ICsJCXRlc3RfcmVu
ZGVyX2FuZF9jb21wdXRlKCJicmVha3BvaW50LXdhaXRzaXAiLCBmZCwgZWNpKQ0KPiArCQkJdGVz
dF9zaXAoU0hBREVSX0JSRUFLUE9JTlQsIFNJUF9XQUlULCBlY2kpOw0KPiAgCX0NCj4gIA0KPiAg
CWlndF9maXh0dXJlDQoNCg==
