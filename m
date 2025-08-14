Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C7FCA0EDC
	for <igt-dev@archiver.kernel.org>; Thu, 14 Aug 2025 18:55:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9108410E123;
	Thu, 14 Aug 2025 18:55:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NpIIIOfs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E11C10E123
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Aug 2025 18:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755197721; x=1786733721;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RtJiY26n4GqlyRLL9SOAm5h8GgnUPYmEFRpNJz/X1/U=;
 b=NpIIIOfsJcDhyspnHvm1Pe5JVIiO/77VAFVWRTfe/V2qqN9bM+7zSfVS
 9rnsKqjOMlr5cfpnXl2UcJ3Dttcr+K5mtD2KS29Ioj/3CP/EbNmkb9ImR
 9uysoDwxXSORNZj4ub1TJx+msOrjeXYaanIdNrI2oCzfpNjMO1mvZYeGy
 Cyg4QO7dJGv/xrMoLYifV/Qq2K8JsqHMhXafVkCNpUg8sm8/cJk5/uwgR
 a9F98K5pwuwuNfVyXQImAcLcRxKbPwSd1VgoxwXmiwY8UxtUVGA93ksPU
 hft8OkJ4jEA2ZQW0L/9hwcds7E6yJWeOws+eJHyotl5534COESej9IMlK A==;
X-CSE-ConnectionGUID: XwGSt2fKRV2OmWtudU2eag==
X-CSE-MsgGUID: 8Om4YR7xRzm7pxpMj5h/ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="68127355"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="68127355"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 11:55:21 -0700
X-CSE-ConnectionGUID: SvOj+IehT9iQyvuNwsfvGQ==
X-CSE-MsgGUID: QPnwzOlgT32RHLiagdmHzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="197825530"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 11:55:20 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 11:55:20 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 14 Aug 2025 11:55:20 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.77)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 11:55:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zu4L4yDa9zfwaCVEDSTBhBgLmscqgmWQdnVv1BR0yku+KuAnB9MMtfJGAKbs79I71r8BbVprfijFG8orc0j6isTLgqhJo/eH5fgcbz+elDhRfGgHvkmGFzofrvpnc3/LHuo/gY68ls5JMvm1n56S9eTgvEtQuB30m2juXFHSVXY/KyUje7CLMPFEHjNOTAurlnzXXZitMCV7Br8Tt0FqW5SSCDSHyEQE8Jq/2Hynmsf5om3Eu3Ig0Rh8Icn9Vs6vlApC3ZcjLO/pG5rJDBYVPLbj3h6ZjrWYVpvrNUS4H1OBUYuNWH/535J6ILCMKfGPs5dVYqAT1YF8du724/XPhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RtJiY26n4GqlyRLL9SOAm5h8GgnUPYmEFRpNJz/X1/U=;
 b=VGYJzK+119iTzg731fVQoHBDwnQipHBepvAn9p24dElPq5FNwSdJPFCV8Evp/kTMx4erBDTYV4iNB0i/r8jIGiK6sDaD6v8g4kGqnJdMf8BC3LJpCFSSw0farkOm5DRLrQU7aILWwiailclDJZhS8947C2RNEXCL5PStrcIKNDZWA6gCLU9YRfrdod42JVpX2LhyKs69SU/KIJSfAQnyw2eBsGpTgQ08HeMsc32msuRpEOTCRReKvfmb0K4vEPF3AnFJU3lZEARvzLiE61Fi6Oq5TGM1jKtn4jWiGT3WLx0MGBfzGqjVu/M9kQpLcDevvuJcFo8xzgh/2nL/bwu7gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Thu, 14 Aug
 2025 18:55:17 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.9031.014; Thu, 14 Aug 2025
 18:55:17 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>, "Kempczynski, Zbigniew"
 <zbigniew.kempczynski@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gupta,
 saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>, "Cavitt,
 Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] lib/xe/xe_spin: Add switch point for preemptible spinner
Thread-Topic: [PATCH] lib/xe/xe_spin: Add switch point for preemptible spinner
Thread-Index: AQHcDGtHgRaMvpdEL0uqbWYL3+a86rRg3PaAgAGKmoCAABjeUA==
Date: Thu, 14 Aug 2025 18:55:16 +0000
Message-ID: <CH0PR11MB5444BF07A810BA8A12FD66C8E535A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250813155935.87329-2-jonathan.cavitt@intel.com>
 <buzrxspq2t2eoeeh2rverullk5o3qk6yfy4mgsrb6gmy52jf7r@z5h7ituni3hu>
 <aJ4bp3G6L1518vrr@lstrano-desk.jf.intel.com>
In-Reply-To: <aJ4bp3G6L1518vrr@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SJ2PR11MB7573:EE_
x-ms-office365-filtering-correlation-id: 073f648a-ded5-4ad7-cfa9-08dddb641c06
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?aitTb3BkTUxCNk8zbDg0QW5STDFqekllTGdVd0xqcy9nYTlFakFwQ1JqTlpp?=
 =?utf-8?B?ZlpZcHdBZkU1dzJLYnhDdmlwdElQbmF2Y2M1SmZ6TW1UOGV0b1RnYTJsTjRy?=
 =?utf-8?B?bFF4MjJnbThKM2JWc3FOZ3RvSzFvdHZ4Mk0xMUtGRUt4d2tySDFyeGZHMHNm?=
 =?utf-8?B?Yk1HNEtaL0tpSzZhZENkU2ZkTHdicks0a3EvejJtTWVhRCtneVQ2aGhuSm5F?=
 =?utf-8?B?V3lRakNJcG4xYWY4Z3hTRXppYldCbUlYTGwvK1dyMmNEWVpKY0VnTjZTREdF?=
 =?utf-8?B?QVZaZ0JRMTB2bUFzZzdWdWRLSUk3Q0phS1J2YnduUnBNeDl0aCtCTFRsMXVr?=
 =?utf-8?B?eDRKOUVHbkFGakEyQ1R3QnNERkZaRHFOUjR0QktyL3JqVkVBM2w5VEliVzBa?=
 =?utf-8?B?dlhlYlgrSWVkQjZubEJpUDcySzRZNGhmTGhiUjBQL3pvWkorS1RzY094QXZy?=
 =?utf-8?B?YjFnL1p0aGZRbm9mQldmV2dlSHUybGxXWEhEaG1uYktmeE9wL0VwWGRHTEdU?=
 =?utf-8?B?NzVHdGNOWW15bjFvMUFUUTl4NEVyL3hQWGRBZlZidTNjQ1pzV3BpcU5Rczly?=
 =?utf-8?B?dVV0YnZUbWVjSGJVakxjZ3k0YlNZclVKaTZmTEU2ZVBVY1ZncWZ4SVhCTVN2?=
 =?utf-8?B?cm1yS3ZacE5RSmhtTHpUa2hxMmg0UkZPMlo3ZFhoNGZpamFwZmtzODRnU0JE?=
 =?utf-8?B?TzlUWGM0V1lscy8zK3dmUFdjNTZPMnlFL0lCblVSeEVUWHo5dlRMNHBJRmVI?=
 =?utf-8?B?R0s0U2JJczc4NFp2MlNCSWVNMXRmdVFrWnFGak9rd2VQVFZWWUd0Q2NiYzB6?=
 =?utf-8?B?c0Nnclk3bzJNaWZDWk44VDdUK29wd1U0VnFIZlo2TUNkckw3NHlydndjU2Mv?=
 =?utf-8?B?bXJoQ3RacHkyUjdjSFVpZTd6Z2xoNDFkYmtqdzgzUTBqK0c2Njc3ZkJ2ZjhH?=
 =?utf-8?B?amFqTDBFMXQ0dHlsQlJ1L1FoTzJQb2Q0Z3EwY2lRZ08zdFNWZzlYMHFYeEVj?=
 =?utf-8?B?UUV5bFhMVjZCU2hsa0FGOWlweEg1d3V4ME5DdlROZ2c2dUNmamIxK3hReDVB?=
 =?utf-8?B?RTRidHVSc2dTSUVVTU9YdWtxd3gxSHhaRFVLVDJLNFJ3aVk4N2IrT2NKSEtw?=
 =?utf-8?B?ZFpHMUFxeWRNSnYzWXJOZHMyYzBaVktLcFBkdHhpUmllZTdRdy9oRVZZWDd0?=
 =?utf-8?B?U1pCQUwwazh1Tm5NMWpTc2hNcC9FT0VtQmhHRUNBY284SWtyRUcxcnVKZWNa?=
 =?utf-8?B?WmVjd3p0a1FxWmlOa3FiZ0xVNGtYNjYyeVR4RjNGY2ljbUxLOWorakdmN25V?=
 =?utf-8?B?Rzk3MkdjMU9qamlQc2ZTS0RxQnp6b0MzZDhPSjhLUFpXeTJ5T0liM0JiUlRU?=
 =?utf-8?B?S2Z0TGowbTdDam1zeVhDOTFQRWhWUXBpdU5hR0ltRHViME0weHRmUExvSmFv?=
 =?utf-8?B?LzVua0lGd1dzUk4vZFkyWUtCTjZqRHBBbXNHUTF6eklhVEIwd3Q1SG9aRCti?=
 =?utf-8?B?ODd0UnFZcDFrdTN4R0pqYkt1elBLcVVxc1RqRHU5UjB5RkFUUktKNkVFYmtj?=
 =?utf-8?B?RjNUUTZSTFFUN3oydXVMOS94WDZaQTNpN2FwdWZZYm9tM1VYc0czM2lEYUNK?=
 =?utf-8?B?Ry9WV3lndkU0aGlveWJVTitUbjBxeGxqTlFrU04wallhcWdhbUV4VWsvNHEy?=
 =?utf-8?B?ZUpnQmxWcTFOQmcxTkFOWFpQWEVzMG04TlpTcE9UcmViL21zK0xyQitwY2h1?=
 =?utf-8?B?bDVCRDVaUVgzSXJvV1c2MXlkSFU4OFo0R3ZIcGpWZzFSVVNGT3FuNFVhVCtz?=
 =?utf-8?B?ZHBuZDNJb1hHZTdsNlQ2TjlNWFhEZ082UFpSd0RUQ2dVWUVtaFhqMVhGc3Rh?=
 =?utf-8?B?c09tRjI1YnVvekcwT3kyTytJeW5lMzJoekdSem42Mm1lNjRGT0VOTFk4NkNw?=
 =?utf-8?Q?Ej0RgNhavOw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c3ZlaHdqRHdMSTMrRjg4aVVzM0lEd2FDNjJ0NHdkMVcyalJkdjNTS1BTOUJD?=
 =?utf-8?B?U2FGRGFLM25kdThrZFJlUGRpRGUyZ1JJTE4vZUVrZm9yaXRETTFMdENNL0M0?=
 =?utf-8?B?eW1pSGdDd1ZFS29yZmxkZWV3NVNNcVp5YitlWkRqUzY2N0lucHUyL2JqbWl1?=
 =?utf-8?B?ZTVWZjgwNTBkbVBQazlLZkFxUmF6NEEvbzVBdUhrRUdmaE1pSHRScHhLVlhR?=
 =?utf-8?B?TEdqd2JIeDRuK2FheUpVWVlaYWVCNnpvTjdNb0JIam1BaXpDdEQ0dzNPV2pq?=
 =?utf-8?B?T2d1STA3aUF5KzZxUmFZUXc5aXNJWW9UZjFOdVF3UUlUSTc4ZUF4MkFOT08y?=
 =?utf-8?B?OFltWis1Q05VUjNQeUMwTzV0bFpsUXMrMW1RWUVMbzFRM0xPazc5U0VGclJC?=
 =?utf-8?B?bk1GanR5alF3QUp2bkVZNitqV2ZMSnB5Q0YxREIyT2pXanVqYXRUSXg2bHBP?=
 =?utf-8?B?TWxXNUExUmM1NlVaVHlkTEpQNTZycnVWbTJOV2ZIYUh1SG8yelpOVkVPRE1L?=
 =?utf-8?B?aC9CMUUvWVB3ZEY2a0pnNHRjbkZ1Sm9QODZOTk5uZkZmV1RRRFVTUWp2MnNM?=
 =?utf-8?B?Y285UjFWY2hSak1NNlhzNDBUa01oN1Q2VWorMWwrV3ZITXdmM0pickpvSUFz?=
 =?utf-8?B?ekFaWXl0MXVZV0hWTGsrWE1kOHBxU3FQMkJna3Z0THdmcVM2THYyK3Vwengr?=
 =?utf-8?B?V3VVK250QThiN21KaEQzSTBubVhOVUo2Nk5pUk9NYm1sbnRCNndud3RZaC9J?=
 =?utf-8?B?eFMrUWUvZC9yaVFvbWJJWTVwM3JVdFN2RUhmYmRsZE5NNTZ1bXRaem1WL0hw?=
 =?utf-8?B?VmhCMzJnRWdhOTRhTERaWml5U3NFTGt4R3FqWTZZT1pSazJITC9LdC8zd0tw?=
 =?utf-8?B?eXhLcFZGd3lpd3BlZVlhdzlSeTFlNHlrZEthcUR0TjF0Umwrc1VmWU5hTkNP?=
 =?utf-8?B?a0dkbHhnNFZRcnRGQ3BlSlo3NzBXZTZnbStVRkVTUjYwenF4NzlKK3haRHlw?=
 =?utf-8?B?d2VEbFc5RnFoWHB6WjY3a2VMMHZiYW9vZ1pNQ1dleFo0Z2Q0a3BCNEtCSlVU?=
 =?utf-8?B?MmUxSDZvZ0tXWnEzSHFDbCtaeVhVN252cHVXN1dhUGxjQmVEYlg0VElGQzVn?=
 =?utf-8?B?d2lqZDBnSkhKZEkzS0padndKVHdwdWxVbjlVOHVZbElCaXlGSG9rVkpvbGFL?=
 =?utf-8?B?N2ZjOWRvV0NiT3d1dS84SjA5djYwWmdqYWNDRWlEaTZGQmNYWmd1RlJUaW1C?=
 =?utf-8?B?dGxLa2p3ajIxUTI5QmhGNjQwR2x5ZnFVUm9KcFk4alpEaE4xL2hUdTJXTUtK?=
 =?utf-8?B?MVhGUUhybzl4cUhFY25OaGwwU0VtNDNhT0EvLzlrVWJBVlUrM3RaeWdkeXBr?=
 =?utf-8?B?Tkl4Y0crWFBqZzNQbVlJUDVJZnlpN1NyRkNlalR1d3ZoTzFhS1BrUytZc290?=
 =?utf-8?B?SWdsV0trM2FQaVZrdXFlcDFMWGhvL1UxaVpaeW16cnZDSzMzT2dsNFQwSE5i?=
 =?utf-8?B?cVVyMHhQUGt0N2VmZFhteWZIOVVPckV5SHpkcFRocTJHVEFqZFZXbmZQUW5q?=
 =?utf-8?B?WnpLK2pLQXdpYXpPZjgwektXcEVrSnNIWXBNSHQydFdMMWlEZEp0UjRpVDB0?=
 =?utf-8?B?alMrbkhGVWZNMjFUUkFEbC9kbFJsT1g2cWMzUkI0dktnNFEvTHVrNXkxTjFs?=
 =?utf-8?B?Z3lPRHJLbVNmL3VUQ2htdWNGbGMwK2V0L0dBd1U5WEhFNUxtay8yait1dnNr?=
 =?utf-8?B?UjZCY20xRjl3VWpycUhRWExYcFduUE1mYTNDekhLQTNqeCt1MU9VNGZSMDl6?=
 =?utf-8?B?NDdCendWSjNPWVp5U3FwQTNMTWFFckVVNDRqYy9mRzRTN3owU2U3aDF0M3ow?=
 =?utf-8?B?UEZzelplQVBabnVEYUFLT2FibTE0TGJXK0VXUVoxQ1REV2JxUnNONXF2ZE03?=
 =?utf-8?B?bTVEcUt4Zis0QVF2cnBDdUFhWStKejRrY3ZGU1AxejcySjlVVUl4NnVoSEto?=
 =?utf-8?B?UFJyRW9paDRNUmJrdVpSOEhvQkRxSFZrQy91ajRyUEwyeGIvT2JNdVNDRFdp?=
 =?utf-8?B?WkpsdGNMOUZ0bVQvNUh5aURsU1EwU0J4ZzQybEFnd0tVSERmOG1rcVRYZG1t?=
 =?utf-8?B?NHZ4M0Z5YjlXRDZMTmtvSHRpNnQ2T29FdU1jdU1sTVQ0OTJxTDI2SzlpcUFO?=
 =?utf-8?B?c3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 073f648a-ded5-4ad7-cfa9-08dddb641c06
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2025 18:55:16.9554 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y4JYuTREwNmztumTq3YHCjpSx1UoAkrZxkvCVLo5lHss5QSPrn8YFQy2OrNXKrNzn6p40o2KWipNGtkoo6Tgv4OBmkLqKShEFdaSDQ+lG8s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7573
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEJyb3N0LCBNYXR0aGV3IDxtYXR0aGV3
LmJyb3N0QGludGVsLmNvbT4gDQpTZW50OiBUaHVyc2RheSwgQXVndXN0IDE0LCAyMDI1IDEwOjI0
IEFNDQpUbzogS2VtcGN6eW5za2ksIFpiaWduaWV3IDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRl
bC5jb20+DQpDYzogQ2F2aXR0LCBKb25hdGhhbiA8am9uYXRoYW4uY2F2aXR0QGludGVsLmNvbT47
IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBHdXB0YSwgc2F1cmFiaGcgPHNhdXJhYmhn
Lmd1cHRhQGludGVsLmNvbT47IFp1bywgQWxleCA8YWxleC56dW9AaW50ZWwuY29tPjsgVmlzaHdh
bmF0aGFwdXJhLCBOaXJhbmphbmEgPG5pcmFuamFuYS52aXNod2FuYXRoYXB1cmFAaW50ZWwuY29t
Pg0KU3ViamVjdDogUmU6IFtQQVRDSF0gbGliL3hlL3hlX3NwaW46IEFkZCBzd2l0Y2ggcG9pbnQg
Zm9yIHByZWVtcHRpYmxlIHNwaW5uZXINCj4gDQo+IE9uIFdlZCwgQXVnIDEzLCAyMDI1IGF0IDA3
OjUxOjMxUE0gKzAyMDAsIFpiaWduaWV3IEtlbXBjennFhHNraSB3cm90ZToNCj4gPiBPbiBXZWQs
IEF1ZyAxMywgMjAyNSBhdCAwMzo1OTozNlBNICswMDAwLCBKb25hdGhhbiBDYXZpdHQgd3JvdGU6
DQo+ID4gPiBGcm9tOiBOaXJhbmphbmEgVmlzaHdhbmF0aGFwdXJhIDxuaXJhbmphbmEudmlzaHdh
bmF0aGFwdXJhQGludGVsLmNvbT4NCj4gPiA+IA0KPiA+ID4gV2hlbiAncHJlZW1wdCcgb3B0aW9u
IGlzIHNwZWNpZmllZCwgaW5zZXJ0IGEgTUlfU0VNQVBIT1JFX1dBSVQNCj4gPiA+IGNvbW1hbmQg
aW4gdGhlIHNwaW5uZXIgYmF0Y2ggYnVmZmVyLiBUaGlzIHByb3ZpZGVzIHRoZSBzd2l0Y2gNCj4g
PiA+IHBvaW50IGZvciBwcmVlbXB0aW9uIHRvIGhhcHBlbiBpbiBtdWx0aSBxdWV1ZSBtb2RlLg0K
PiA+ID4gDQo+ID4gPiBBZGRpdGlvbmFsbHksIGFsbG93IHRoZSB1c2VyIHRvIGNvbnRyb2wgdGhl
IHByZWVtcHQgd2FpdCBjb25kaXRpb24uDQo+ID4gPiANCj4gPiA+IENsb3NlczogaHR0cHM6Ly9n
aXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS94ZS9rZXJuZWwvLS9pc3N1ZXMvNTc4Mw0KPiA+ID4g
U2lnbmVkLW9mZi1ieTogTmlyYW5qYW5hIFZpc2h3YW5hdGhhcHVyYSA8bmlyYW5qYW5hLnZpc2h3
YW5hdGhhcHVyYUBpbnRlbC5jb20+DQo+ID4gPiBDYzogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5i
cm9zdEBpbnRlbC5jb20+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKb25hdGhhbiBDYXZpdHQgPGpv
bmF0aGFuLmNhdml0dEBpbnRlbC5jb20+DQo+ID4gPiAtLS0NCj4gPiA+ICBpbmNsdWRlL2ludGVs
X2dwdV9jb21tYW5kcy5oIHwgIDEgKw0KPiA+ID4gIGxpYi94ZS94ZV9zcGluLmMgICAgICAgICAg
ICAgfCA0MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0NCj4gPiA+ICBsaWIv
eGUveGVfc3Bpbi5oICAgICAgICAgICAgIHwgIDMgKysrDQo+ID4gPiAgMyBmaWxlcyBjaGFuZ2Vk
LCA0NSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gPiANCj4gPiA+IGRpZmYgLS1n
aXQgYS9pbmNsdWRlL2ludGVsX2dwdV9jb21tYW5kcy5oIGIvaW5jbHVkZS9pbnRlbF9ncHVfY29t
bWFuZHMuaA0KPiA+ID4gaW5kZXggY2QyODFiYTg5ZC4uNTE1OGJiMGVhMCAxMDA2NDQNCj4gPiA+
IC0tLSBhL2luY2x1ZGUvaW50ZWxfZ3B1X2NvbW1hbmRzLmgNCj4gPiA+ICsrKyBiL2luY2x1ZGUv
aW50ZWxfZ3B1X2NvbW1hbmRzLmgNCj4gPiA+IEBAIC0xMjMsNiArMTIzLDcgQEANCj4gPiA+ICAj
ZGVmaW5lIE1JX1NFTUFQSE9SRV9XQUlUCU1JX0lOU1RSKDB4MWMsIDIpIC8qIEdFTjgrICovDQo+
ID4gPiAgI2RlZmluZSBNSV9TRU1BUEhPUkVfV0FJVF9UT0tFTglNSV9JTlNUUigweDFjLCAzKSAv
KiBHRU4xMisgKi8NCj4gPiA+ICAjZGVmaW5lICAgTUlfU0VNQVBIT1JFX1BPTEwJCSgxIDw8IDE1
KQ0KPiA+ID4gKyNkZWZpbmUgICBNSV9TRU1BUEhPUkVfUVVFVUVfU1dJVENIX01PREUJKDEgPDwg
MTEpDQo+ID4gPiAgI2RlZmluZSAgIE1JX1NFTUFQSE9SRV9TQURfR1RfU0RECSgwIDw8IDEyKQ0K
PiA+ID4gICNkZWZpbmUgICBNSV9TRU1BUEhPUkVfU0FEX0dURV9TREQJKDEgPDwgMTIpDQo+ID4g
PiAgI2RlZmluZSAgIE1JX1NFTUFQSE9SRV9TQURfTFRfU0RECSgyIDw8IDEyKQ0KPiA+ID4gZGlm
ZiAtLWdpdCBhL2xpYi94ZS94ZV9zcGluLmMgYi9saWIveGUveGVfc3Bpbi5jDQo+ID4gPiBpbmRl
eCAyNWY3NTU1ZTI3Li5kNjI5NTJiNTM5IDEwMDY0NA0KPiA+ID4gLS0tIGEvbGliL3hlL3hlX3Nw
aW4uYw0KPiA+ID4gKysrIGIvbGliL3hlL3hlX3NwaW4uYw0KPiA+ID4gQEAgLTMwLDcgKzMwLDYg
QEANCj4gPiA+ICANCj4gPiA+ICBlbnVtIHsgU1RBUlRfVFMsIE5PV19UUyB9Ow0KPiA+ID4gIA0K
PiA+ID4gLQ0KPiA+ID4gIHVpbnQzMl90IHhlX3NwaW5fbnNlY190b190aWNrcyhpbnQgZmQsIGlu
dCBndF9pZCwgdWludDY0X3QgbnNlYykNCj4gPiA+ICB7DQo+ID4gPiAgCXVpbnQzMl90IHRpY2tz
ID0geGVfbnNlY190b190aWNrcyhmZCwgZ3RfaWQsIG5zZWMpOw0KPiA+ID4gQEAgLTU3LDYgKzU2
LDcgQEAgdm9pZCB4ZV9zcGluX2luaXQoc3RydWN0IHhlX3NwaW4gKnNwaW4sIHN0cnVjdCB4ZV9z
cGluX29wdHMgKm9wdHMpDQo+ID4gPiAgDQo+ID4gPiAgCXNwaW4tPnN0YXJ0ID0gMDsNCj4gPiA+
ICAJc3Bpbi0+ZW5kID0gMHhmZmZmZmZmZjsNCj4gPiA+ICsJc3Bpbi0+d2FpdF9jb25kID0gMDsN
Cj4gPiA+ICAJc3Bpbi0+dGlja3NfZGVsdGEgPSAwOw0KPiA+ID4gIA0KPiA+ID4gIAlpZiAob3B0
cy0+Y3R4X3RpY2tzKSB7DQo+ID4gPiBAQCAtMTY3LDYgKzE2NywyNCBAQCB2b2lkIHhlX3NwaW5f
aW5pdChzdHJ1Y3QgeGVfc3BpbiAqc3Bpbiwgc3RydWN0IHhlX3NwaW5fb3B0cyAqb3B0cykNCj4g
PiA+ICAJCQkJICAgb3B0cy0+bWVtX2NvcHktPmRzdC0+bW9jc19pbmRleDsNCj4gPiA+ICAJfQ0K
PiA+ID4gIA0KPiA+ID4gKwkvKg0KPiA+ID4gKwkgKiBJbnNlcnQgYSBNSV9TRU1BUEhPUkVfV0FJ
VF9DTUQgaW5zdHJ1Y3Rpb24gd2l0aCBjb25kaXRpb24gY29udHJvbGxlZA0KPiA+ID4gKwkgKiBi
eSB0aGUgdXNlci4gSXQgYWxzbyBhY3RzIGFzIGEgcXVldWUgc3dpdGNoIHBvaW50IGluIG11bHRp
IHF1ZXVlIG1vZGUuDQo+ID4gPiArCSAqLw0KPiA+ID4gKwlpZiAob3B0cy0+cHJlZW1wdCkgew0K
PiA+ID4gKwkJdWludDY0X3Qgd2FpdF9hZGRyID0gb3B0cy0+YWRkciArIG9mZnNldG9mKHN0cnVj
dCB4ZV9zcGluLCB3YWl0X2NvbmQpOw0KPiA+ID4gKw0KPiA+ID4gKwkJc3Bpbi0+YmF0Y2hbYisr
XSA9IE1JX1NFTUFQSE9SRV9XQUlUX0NNRCB8DQo+ID4gPiArCQkJCU1JX1NFTUFQSE9SRV9QT0xM
IHwNCj4gPiA+ICsJCQkJTUlfU0VNQVBIT1JFX1FVRVVFX1NXSVRDSF9NT0RFIHwNCj4gPiANCj4g
PiBUaGlzIGJpdCBpcyBub3QgZG9jdW1lbnRlZCBmb3IgcHJldmlvdXMgcGxhdGZvcm1zIHNvIGlz
IGl0IHNhZmUgdG8NCj4gPiBzZXQgaXQ/DQo+ID4gDQo+IA0KPiBZZXMsIEknbSBsb29raW5nIGF0
IGJzcGVjIDQ1NzQ5IGFuZCBub3Qgc2VlaW5nIGJpdCAxMQ0KPiAoTUlfU0VNQVBIT1JFX1FVRVVF
X1NXSVRDSF9NT0RFKSBkZWZpbmVkLiBBbHNvIEkgdGhvdWdoIFNFTUFQSE9SRXMgd2VyZQ0KPiBh
bHdheXMgcHJlZW1wdGFibGUgdG9vLiBHb3QgYSBic3BlYyBsaW5rIHRvIGV4YWN0bHkgd2hhdCB0
aGlzIG5ldyBiaXRzDQo+IGRvZXM/DQo+IA0KPiA+IEJUVyBzaW1pbGFyIGVmZmVjdCB3YXMgYWRk
aW5nIE1JX0FSQl9DSEVDSyAoaW4gdGVybSB0ZXN0IGlzIGFsc28NCj4gPiBwYXNzaW5nIGhlcmUp
Lg0KPiA+IA0KPiANCj4gWWVzLCBhcmIgY2hlY2tzIGFyZSBhbHNvIHByZWVtcHQgcG9pbnRzIHRv
by4NCg0KVGhpcyBpcyBjb3JyZWN0LiAgSXQgdHVybnMgb3V0IHRoaXMgcGF0Y2ggd2FzIG92ZXJs
eSBjb21wbGljYXRlZCBmb3Igd2hhdCBJIHdhcyBsb29raW5nDQpmb3IgaXQgdG8gZG8sIHNvIEkn
dmUgc3VibWl0dGVkIGEgc2ltcGxpZmllZCB2ZXJzaW9uIHRoYXQgb25seSBkb2VzIHdoYXQgaXMg
bmVjZXNzYXJ5IHRvDQpmaXggdGhlIGlzc3VlIGluIHRoZSBjbG9zZXMgdGFnOiBodHRwczovL3Bh
dGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzE1Mjk2Mi8NCi1Kb25hdGhhbiBDYXZpdHQN
Cg0KPiANCj4gQWxzbyBpbiBnZW5lcmFsIEknbSBqdXN0IGNvbmZ1c2VkIGJ5IGhvdyB4ZV9zcGlu
X3ByZWVtcHRfd2FpdCAvIG5vd2FpdA0KPiBmdW5jdGlvbnMgd291bGQgYmUgdXNlZCBpbiBJR1Rz
LiBDYW4geW91IGV4cGxhaW4/DQo+IA0KPiBNYXR0DQo+IA0KPiA+IElmIG15IG5pdCBpcyBub3Qg
YXBwbHlpbmcgaGVyZSwgY29kZSBsZ3RtOg0KPiA+IA0KPiA+IFJldmlld2VkLWJ5OiBaYmlnbmll
dyBLZW1wY3p5xYRza2kgPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVsLmNvbT4NCj4gPiANCj4g
PiAtLQ0KPiA+IFpiaWduaWV3DQo+ID4gDQo+ID4gPiArCQkJCU1JX1NFTUFQSE9SRV9TQURfRVFf
U0REIHwNCj4gPiA+ICsJCQkJMzsNCj4gPiA+ICsJCXNwaW4tPmJhdGNoW2IrK10gPSAwOw0KPiA+
ID4gKwkJc3Bpbi0+YmF0Y2hbYisrXSA9IHdhaXRfYWRkcjsNCj4gPiA+ICsJCXNwaW4tPmJhdGNo
W2IrK10gPSB3YWl0X2FkZHIgPj4gMzI7DQo+ID4gPiArCQlzcGluLT5iYXRjaFtiKytdID0gMDsN
Cj4gPiA+ICsJfQ0KPiA+ID4gKw0KPiA+ID4gIAlzcGluLT5iYXRjaFtiKytdID0gTUlfQ09ORF9C
QVRDSF9CVUZGRVJfRU5EIHwgTUlfRE9fQ09NUEFSRSB8IDI7DQo+ID4gPiAgCXNwaW4tPmJhdGNo
W2IrK10gPSAwOw0KPiA+ID4gIAlzcGluLT5iYXRjaFtiKytdID0gZW5kX2FkZHI7DQo+ID4gPiBA
QCAtMjA3LDYgKzIyNSwyOCBAQCB2b2lkIHhlX3NwaW5fZW5kKHN0cnVjdCB4ZV9zcGluICpzcGlu
KQ0KPiA+ID4gIAlXUklURV9PTkNFKHNwaW4tPmVuZCwgMCk7DQo+ID4gPiAgfQ0KPiA+ID4gIA0K
PiA+ID4gKy8qKg0KPiA+ID4gKyAqIHhlX3NwaW5fcHJlZW1wdF93YWl0Og0KPiA+ID4gKyAqIEBz
cGluOiBwb2ludGVyIHRvIHNwaW5uZXIgbWFwcGVkIGJvDQo+ID4gPiArICoNCj4gPiA+ICsgKiBN
YWtlIHRoZSBzcGlubmVyIHdhaXQgb24gdGhlIHByZWVtcHRpb24gc2VtYXBob3JlLg0KPiA+ID4g
KyAqLw0KPiA+ID4gK3ZvaWQgeGVfc3Bpbl9wcmVlbXB0X3dhaXQoc3RydWN0IHhlX3NwaW4gKnNw
aW4pDQo+ID4gPiArew0KPiA+ID4gKwlzcGluLT53YWl0X2NvbmQgPSAxOw0KPiA+ID4gK30NCj4g
PiA+ICsNCj4gPiA+ICsvKioNCj4gPiA+ICsgKiB4ZV9zcGluX3ByZWVtcHRfbm93YWl0Og0KPiA+
ID4gKyAqIEBzcGluOiBwb2ludGVyIHRvIHNwaW5uZXIgbWFwcGVkIGJvDQo+ID4gPiArICoNCj4g
PiA+ICsgKiBNYWtlIHRoZSBzcGlubmVyIGRvIG5vdCB3YWl0IG9uIHRoZSBwcmVlbXB0aW9uIHNl
bWFwaG9yZS4NCj4gPiA+ICsgKi8NCj4gPiA+ICt2b2lkIHhlX3NwaW5fcHJlZW1wdF9ub3dhaXQo
c3RydWN0IHhlX3NwaW4gKnNwaW4pDQo+ID4gPiArew0KPiA+ID4gKwlzcGluLT53YWl0X2NvbmQg
PSAwOw0KPiA+ID4gK30NCj4gPiA+ICsNCj4gPiA+ICAvKioNCj4gPiA+ICAgKiB4ZV9zcGluX2Ny
ZWF0ZToNCj4gPiA+ICAgKiBAb3B0OiBjb250cm9sbGluZyBvcHRpb25zIHN1Y2ggYXMgYWxsb2Nh
dG9yIGhhbmRsZSwgZXhlY19xdWV1ZSwgdm0gZXRjDQo+ID4gPiBkaWZmIC0tZ2l0IGEvbGliL3hl
L3hlX3NwaW4uaCBiL2xpYi94ZS94ZV9zcGluLmgNCj4gPiA+IGluZGV4IGMyMTk5ZDBhYTIuLmVh
ZjJhNDA5ZTAgMTAwNjQ0DQo+ID4gPiAtLS0gYS9saWIveGUveGVfc3Bpbi5oDQo+ID4gPiArKysg
Yi9saWIveGUveGVfc3Bpbi5oDQo+ID4gPiBAQCAtNjQsNiArNjQsNyBAQCBzdHJ1Y3QgeGVfc3Bp
biB7DQo+ID4gPiAgCXVpbnQ2NF90IHBhZDsNCj4gPiA+ICAJdWludDMyX3Qgc3RhcnQ7DQo+ID4g
PiAgCXVpbnQzMl90IGVuZDsNCj4gPiA+ICsJdWludDMyX3Qgd2FpdF9jb25kOw0KPiA+ID4gIAl1
aW50MzJfdCB0aWNrc19kZWx0YTsNCj4gPiA+ICAJdWludDY0X3QgZXhlY19zeW5jOw0KPiA+ID4g
IAl1aW50MzJfdCB0aW1lc3RhbXA7DQo+ID4gPiBAQCAtNzYsNiArNzcsOCBAQCB2b2lkIHhlX3Nw
aW5faW5pdChzdHJ1Y3QgeGVfc3BpbiAqc3Bpbiwgc3RydWN0IHhlX3NwaW5fb3B0cyAqb3B0cyk7
DQo+ID4gPiAgYm9vbCB4ZV9zcGluX3N0YXJ0ZWQoc3RydWN0IHhlX3NwaW4gKnNwaW4pOw0KPiA+
ID4gIHZvaWQgeGVfc3Bpbl93YWl0X3N0YXJ0ZWQoc3RydWN0IHhlX3NwaW4gKnNwaW4pOw0KPiA+
ID4gIHZvaWQgeGVfc3Bpbl9lbmQoc3RydWN0IHhlX3NwaW4gKnNwaW4pOw0KPiA+ID4gK3ZvaWQg
eGVfc3Bpbl9wcmVlbXB0X3dhaXQoc3RydWN0IHhlX3NwaW4gKnNwaW4pOw0KPiA+ID4gK3ZvaWQg
eGVfc3Bpbl9wcmVlbXB0X25vd2FpdChzdHJ1Y3QgeGVfc3BpbiAqc3Bpbik7DQo+ID4gPiAgDQo+
ID4gPiAgLyoNCj4gPiA+ICAgKiB4ZV9jb3JrOiBoaWdoZXIgbGV2ZWwgQVBJIHRoYXQgc2ltcGxp
ZmllcyBleGVjJ2luZyBhbiB4ZV9zcGluIGJ5IHRha2luZyBjYXJlDQo+ID4gPiAtLSANCj4gPiA+
IDIuNDMuMA0KPiA+ID4gDQo+IA0K
