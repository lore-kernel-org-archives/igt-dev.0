Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48727C02198
	for <igt-dev@archiver.kernel.org>; Fri, 14 Feb 2025 10:25:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0749C10EC34;
	Fri, 14 Feb 2025 10:25:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D381wNFU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B4E10EC34
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Feb 2025 10:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739528746; x=1771064746;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=4fmiUtCU1A0jyw8TCYbTUA+9pBI506UaMphTTgY/8Jg=;
 b=D381wNFUTG4IHf2EmMl/Rqt6xJJROQswS2cyk82fK1L2ZZIpAMYlYdIZ
 e8hCeVxM3sOHSYaOwgV/cwSr12h4xgzOCONj5MrylIZCrgKyYze3ZHNcm
 u4GrKZnaG709PasO9MxXO8XVfpu2eifMtiyxUEvZuEy3DHXoSzIhFAD2A
 EBOoHJvTjDrjy0MUo1FG1iHEnQTAJpSfwtEv3CAV5SYpE+lHWjXrNo13c
 Yd37j8EtWnJTk++DY9jQYcS6dmewsxXsRmTl8Zl/uZLP5xGHUB+T77E/s
 tlF0/LL+cCro55/SCPHyOszkQvZE/Tr06vzu8Nb4GXHI1vcySR7MKGTDn Q==;
X-CSE-ConnectionGUID: dVPRgygtQeCKV504CHOFCA==
X-CSE-MsgGUID: S8FXfb25TT64TUxGHhnYNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40392706"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="40392706"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 02:25:45 -0800
X-CSE-ConnectionGUID: 5bgbHsZgSWmRCUeYoiD29g==
X-CSE-MsgGUID: eVDAjsfvTHGTrqlgHBdojA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114319714"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2025 02:25:45 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 14 Feb 2025 02:25:44 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 14 Feb 2025 02:25:44 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Feb 2025 02:25:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VJOhtwp/HHukpww052G8t73qqPdWa6YBaL2ySERO0aZeX2QMeGtlo7yMvJIv+wCvqHynjjvWpNSjtzPr5x2229DASLlElAqgEkZQeM4BSa4AS+6koQkqw3Xnjwftm8cYeu+ZYhrO9/JgMt2+hjFwz25D7/u+RaQLpWWdpd/waOElj1Ki7RmxFTVs7y2ztUFvjdxmXfK/xJOjQ8ZOOWA124ftA2ueG1k+TG1nk2Cmzua7Z2O379pnypQnt3G9mKw/8u2HMmo1TWDbuAglG1kOaTKT5el0/8EpYNcIApJMB6zEdY6fEa8dzKvTHmyhkPXUWx7Wu2mTKSKyi+FFhF3LfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4fmiUtCU1A0jyw8TCYbTUA+9pBI506UaMphTTgY/8Jg=;
 b=Z8HaxAbTT3m9Gbf73UNAb40CssnVckVS3m5Davk3pgaANnkGpe/av6zCuwLtmBPJ3KP/PTkb+mLRL34iahfgiVY+XIylkP0AkowKHMcFlhvtPeMRvRmunRbVQb3ZQDCkecx2ZgRzlULBD+os5iaOVQ00hJvWopV9HUIwJfM410MazoUXMOY0fu+0MYunX62yV/HjjbxOLAu2c11IG9L9wd8Uty7D/r03GRWE91gR4QuAQxOCxv1FfJjf9G0ZUMxAY2yyXF+6XpeCnifl0hiQ8A3Lxr6ToYlXv03j0E50yJFFi0LxvV0jaF0M0xZJpQ8zhkfKQGnM+6HStagIeL+vyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6097.namprd11.prod.outlook.com (2603:10b6:208:3d7::17)
 by SN7PR11MB7018.namprd11.prod.outlook.com (2603:10b6:806:2ad::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Fri, 14 Feb
 2025 10:25:36 +0000
Received: from IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::8f29:c6c9:9eb2:6392]) by IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::8f29:c6c9:9eb2:6392%6]) with mapi id 15.20.8445.008; Fri, 14 Feb 2025
 10:25:36 +0000
From: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Tahvanainen, Jari"
 <jari.tahvanainen@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms: Drop 'Functionality' and 'Test category'
 from documentation
Thread-Topic: [PATCH i-g-t] tests/kms: Drop 'Functionality' and 'Test
 category' from documentation
Thread-Index: AQHbe6nlRH1hDhqauUWDDOxnCAEG/7NB0pUAgASceACAAC6v4A==
Date: Fri, 14 Feb 2025 10:25:36 +0000
Message-ID: <IA1PR11MB60971275D3EBF5AE5C8A5EB886FE2@IA1PR11MB6097.namprd11.prod.outlook.com>
References: <20250210105646.307902-1-swati2.sharma@intel.com>
 <20250211091138.kppr5lzhvnyharsp@kamilkon-desk.igk.intel.com>
 <47345d63-1927-4871-85ec-5083ca601ba1@intel.com>
In-Reply-To: <47345d63-1927-4871-85ec-5083ca601ba1@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6097:EE_|SN7PR11MB7018:EE_
x-ms-office365-filtering-correlation-id: 0515040c-2fd4-48ad-41b1-08dd4ce1eba9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MlBkN2JZOGR6MEJ5OVpSdmg0WVJFRjM2eWQ5N3c5R1F0eis2Wk1vb1lGWUhV?=
 =?utf-8?B?a0NEOHRTclBjeVJnelR2TVVWU25ZOXdHZ3orc0w1aDgrOUJJK3ZCWmpmR0hU?=
 =?utf-8?B?cjVSWlIyQ0Y3RkJ0ckEwdExVaEZGa1k0ZHZSVzFvdkdCenpuL3poR1hQRXRE?=
 =?utf-8?B?ZEZ3Z2toL2lHMHpBNDl3cXR3L1dhTUN5bWFCTW9zRUxOQWdIcHk4ZURWaGxj?=
 =?utf-8?B?eVV0U01yR2RTRnVMT051WVd1UlBPeHd1NEc5WG1JbHBCTTBhTVVnYThUaWR1?=
 =?utf-8?B?c0c3Tkx6Q254aGVUQ3E5anVTTzlpNER2S3FlUnlNaWRrUlB5TlE1WXhhT1dG?=
 =?utf-8?B?UjI4SzZJVGRCUW9Ld1RPRHUyRnFhQXFwSHFlelFOZDJUaFdMRTU3MHZZK2lC?=
 =?utf-8?B?a0Y5c1p1UjZ3VWg2d29UcUdlZ1VnazBDVEFGcmE4OTdNQXd6MXZSWFdkQVFz?=
 =?utf-8?B?em83UUNER3hDdDBSRy9nVUxGdFFtT0hjL2V6Q2dmUlFRbEUxZzF5OEh0RE9L?=
 =?utf-8?B?ODdhSTlnRHU3MFBwMFhYUEhwV1UxYnBQdWMyQ2NtMlMySlhOdmhZYUovam5p?=
 =?utf-8?B?VGN5QW9CNkcvUVM4bXdIQmZTelZRckQ4c1RFWHhnM1Q3bzQ4SlNMSnZKT3dE?=
 =?utf-8?B?dFBoVFNZNjIwZnlHSTVoNzBVQkJmYUlNUHFlMlJLdzFENkZuaTUyRHdkSlZ4?=
 =?utf-8?B?cnYrUXJsTDk4QjJjcFN0bFZ4RXVqRzlhWjVuMVpuTS91bUhOVld1SldiSHhM?=
 =?utf-8?B?em1DenRObWwyaGhUcHNMSUNWVndKcVBZaUtZbklJcnJmeDRVbXhUOGM5Q0RI?=
 =?utf-8?B?aC92Z1ZDaXVGOEd2SmR1bU02UXRFZVN1c2JxcHJuVWFEQVlobVZ5TnpmOHRS?=
 =?utf-8?B?SldRbFBYMC9IL2NXdEgzckZ6YUJ6SXhzdDFIOXpvcnJqY1Q4K2F3cDlkTUtj?=
 =?utf-8?B?Q1BFS2QxZlBZWlVteFBaOWRDMVFyVTJGbXZWTTR2b3FIYWZPQ0RSdjZWaDYw?=
 =?utf-8?B?YTJtbVJQU2lnUUxabjZ6WXRlMEdtZCtCQlNDbjdHNlZmQmNIVSsybEQyTGtV?=
 =?utf-8?B?enFpTC9KanNnVE5Bb2ZpTVQ0U1dEM2xFRHJtV05WcnpJeW5DUXJaSE9rWTk5?=
 =?utf-8?B?ampJek9uQUlSQUgrMHpOc1grbnRlWEQxbU5QNEV2d1Q4ZWI5Q0owOGVTSXRC?=
 =?utf-8?B?WTgvYTV1bEs2TmZTdFV0bGNRUEFLUEJyMXlZMzN5SW5TUzgwUnQycUFzd1RW?=
 =?utf-8?B?VnRUVFdLQzVkcnNGeWZPd3haUnRDbi9ycXJXb3liWWtYUWJnMjBjMUxrSTVD?=
 =?utf-8?B?UEZCQ3RCN1dBS1Nha2wvbE52aDdsL25ZZ09STmwrVU9DaUFuVVVhS3JGYVBw?=
 =?utf-8?B?THk0clMvS25XWjZSN1h3MHM0Ym8wV2M0d2xrSUJSRXR3aGdUcXM0MXFIK3d4?=
 =?utf-8?B?U01LT3U2QmVtaitvYUtzdUp2L0sybGc5b0g2WTRTKzMxYk5jUzVvR1ZrSE1Y?=
 =?utf-8?B?Q3pncjJhbUFoU2QyZ1FCczBkK05JaEo1Rmo1dlNkanhibE1sb2ZXQ2Y4MENw?=
 =?utf-8?B?cG1ZbTZZQ2FKa1VwL281ZHE4MVFWd2VqK2YwVytxTkY3ZHk5QWhBUkgrc2JW?=
 =?utf-8?B?ekVoQXJMQytIWXVQS3h0OFgralFkb0JWa2RyMUpUMnNtdzZ2a3FNMVIvUERO?=
 =?utf-8?B?S2RWUnhoN2xzalJDa2tBSHp5by9GZS9MeUFFWTFDY2ozV29TY0l6QkZZTVow?=
 =?utf-8?B?UXd0RHZEQ3FPUWw1QkZ0WTAwd3Zyb3AvV09rTGM5bzRLb3R3MzNVd0dIWDVI?=
 =?utf-8?B?K1Mrd2I0dUl2d1pvNzRXRVQrTVBtYVcvVXBqNTNvbldqOVJrbjJ5SXhnbnlF?=
 =?utf-8?B?Q1VVbGtnZHZ2M1dmZ3Z0QXlZYXZkb1IxTVE2N1d4aC9XbGpIdmYyL2x5UFhI?=
 =?utf-8?Q?YDAb0TVf8l7nJ7TeOGwC1LP/LXIP0MJB?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6097.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M2xjL0ZSU0tXblBYcWQveWw2b29YbndDS0x6TTBQZUNuUWY2c1F4bUZBeWVm?=
 =?utf-8?B?N2hHQkZZeFJuR1lsSEFBU3BtbmpKbzB0cnUyL3gwSkp2WkJpTTdaUjdnMUpH?=
 =?utf-8?B?MGMrQ0djT011dlBNREJOWEw2aUZCYzBPSXhCb2JYVUM4UldBM2pGaGJvRUtm?=
 =?utf-8?B?SElDTjdjQU00Y2ZCOGhhOXQ1Y2ptSDZrdXUzcUNYeTViU20yQjQzOWdiYTNz?=
 =?utf-8?B?UVpOMHBKUWt3ZVZ5YUhYYzRoU3hxcGZsckE4Vjc5RUdUYk8wWUl2Zk1qT3p2?=
 =?utf-8?B?d1JqRCtTN0pHb2NMbUJjSWFSdjd2OEpJNWdTS0dod29YWUZheEFXTC80cGF1?=
 =?utf-8?B?S3BqU25UVVRDSFp4NTRpZFJicU5UTUhEVWhXUjVtSkdSdFdPaEpyaDVNUjhX?=
 =?utf-8?B?Y1laTkN0S1N2TVVvSDB5ZWNTbDlFYUV1RXl3Z3hQaDh6RWNiTjlwa0tOTnpH?=
 =?utf-8?B?ckxTa2dRcUpwSFVmbk5JUnRleHVCZ1ZRN2JLZUUvYzJaZURqdTVtYVpxeDJ5?=
 =?utf-8?B?VzkrZlN0MWtDZmhpMGU0bUg0TVg2aHI0bUY3Zm01dVdsZWFPT1VMdmtHbDlw?=
 =?utf-8?B?K01ZaWRySWgwREpWMDF1anRCalQxNmV1cUFjTXN6OFZGRHY1eWd2ZXdjNVRi?=
 =?utf-8?B?YW42UjZ2UGhzeDRHZnA4cVd2TlFRK0RTQTZrTUt2aUFidnlJUXora085ajZk?=
 =?utf-8?B?cXBqc1lrVCtaSUFWd3labk1lTFd6U1FKeDVqT0RFQTY0emlVTUU4QjZiYUs1?=
 =?utf-8?B?VUJtUXp3ckhKcWRuVmM3UGsrK3hwcTQ3ck0xV3lhS0cvODB5ek94QXZydXJ4?=
 =?utf-8?B?NzlXdngzVlpmblJNOTlad201Z2NkdHBNbDRCUThqaXU5K0ZxdE1YSGhwQkl4?=
 =?utf-8?B?MnZ3eTZBQk5UeXN3NlZNT3JjRVNxT1RVMEY5S2JZNUxQTUhyNTVjQS9iamdM?=
 =?utf-8?B?VFBDNXlISW16empwV1lHSnZtZ2tRdnNFaW5EclNuc1lWcGRXdEU1MlpjUExZ?=
 =?utf-8?B?Tm1aTmRteU9jMTN4TnhRY0grMXRKODkrTUxBL0tablRCZ0xoMGNVZEtkdzNr?=
 =?utf-8?B?aUY0R1lnWlM4VktvNTJlZ1JtdmpSUkQxNlkxMHcvTHIrb1pJTmExekdhUSt0?=
 =?utf-8?B?YWNLNnhrRW90bHVSRFdEd0VLS3l5aGlYUDMwVjB4QnhuMERIMnh2MFlsamJJ?=
 =?utf-8?B?SFFsZk13b014ZXhURUxqVlFkU1pPYVBKZkNMRHlEMmx6eDUzdzJQNWNHZDBr?=
 =?utf-8?B?a3htTElJZUhTY0FoclJZd2ZzYUFydEtrUXpwNmJaL3lsZURVZ25LTXdyVUND?=
 =?utf-8?B?QmRxTlg0N1RDNVFEbDc5ckxoSWlvdjQ2ZkNyOXNkQmRwMU9zWFppQURLdi90?=
 =?utf-8?B?cjQxS2RRQVpqR2JjMWQxR0ZqY2I2OExkNzZ5eXBuVmhRaUx5M0t4ZFA1SGZF?=
 =?utf-8?B?SGN4d2ZaWGU0V0ZWRFRVR2NtOWN1ZXQ3WVN3dVNHSTQ2RktsbFVHWExIclFq?=
 =?utf-8?B?UDRXeDNGcnN6NUJtbFhPK2ltQVNwWFFjZWw4M3hibTE0QVRMMy9vdnNwdWJ3?=
 =?utf-8?B?Vkp4VlRodmZFSnR6Ry83ODhndi9CS3NJNFFtVzJEMmNoR05KTWN0ZWNEWnY1?=
 =?utf-8?B?akl2bU84V0d4TENlSGYwVmdMSkxFYVgvcGlPbC9jZ2J6d3JzRzVXaUp2V2ta?=
 =?utf-8?B?WVNYZk5vVDU3bW1qaFFPZWxPbFl6RHFQdEU0STU3VnJoeWhZUWREajdsbG8v?=
 =?utf-8?B?K3pmZW8zbXN3U2lidGpUTlpGWW1hYjR6R0JUc3ljcUFENUw2NzVFcCt2V0Q0?=
 =?utf-8?B?UTlObWcreVlIYWM3TVZJQUJjK2JveEhEOVdsRzA2MEVXZjc5NFlMbU9ObFZK?=
 =?utf-8?B?RktzOUthdTl1S2JuSEdEc21KK0RWYTNVbDBwU0JaZVQrYXhwYngrU1BncXVD?=
 =?utf-8?B?OTc5OEMxNEtPY2QwbVlBM2N3d29zcjZodUQwM2hsRU9oS1VJS1prNnlvbXJz?=
 =?utf-8?B?Z21PV3lGdmE3dDNKRDZMNmp3bXhHTlkzeXhmbU43NlNrRzU5dnhkSm5DVERu?=
 =?utf-8?B?UTFiT21ISEdsaUpTMDNTeHFuRjRJWTl2Mm83SHZ2c1RxOXR6dGdmNVpzY2pE?=
 =?utf-8?B?aWdxRmI5QW5XSGFwNS9icGpadlNFVCtQT09nTDdxVWh0cWNBYSsraGJSOS9S?=
 =?utf-8?B?NVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6097.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0515040c-2fd4-48ad-41b1-08dd4ce1eba9
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 10:25:36.1009 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pwbehlmMYS+uSgj5GPUn08cj4ajh6bBQnXTNWPiETPYbSgOnSJ2aydzrPQU/MqOvDPF8F1lWeCcdeTKB1sa46dMUKTMRZ0jn1NvbJFOmLQA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7018
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

DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBTaGFybWEsIFN3YXRpMiA8c3dh
dGkyLnNoYXJtYUBpbnRlbC5jb20+IA0KU2VudDogRnJpZGF5LCBGZWJydWFyeSAxNCwgMjAyNSA4
OjM3IEFNDQpUbzogS2FtaWwgS29uaWVjem55IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwu
Y29tPjsgaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFRhaHZhbmFpbmVuLCBKYXJpIDxq
YXJpLnRhaHZhbmFpbmVuQGludGVsLmNvbT47IFBpZWNpZWxza2EsIEthdGFyenluYSA8a2F0YXJ6
eW5hLnBpZWNpZWxza2FAaW50ZWwuY29tPg0KU3ViamVjdDogUmU6IFtQQVRDSCBpLWctdF0gdGVz
dHMva21zOiBEcm9wICdGdW5jdGlvbmFsaXR5JyBhbmQgJ1Rlc3QgY2F0ZWdvcnknIGZyb20gZG9j
dW1lbnRhdGlvbg0KDQpIaSBLYW1pbA0KDQpPbiAxMS0wMi0yMDI1IDAyOjQxIHBtLCBLYW1pbCBL
b25pZWN6bnkgd3JvdGU6DQo+IEhpIFN3YXRpLA0KPiBPbiAyMDI1LTAyLTEwIGF0IDE2OjI2OjQ2
ICswNTMwLCBTd2F0aSBTaGFybWEgd3JvdGU6DQo+PiAnRnVuY3Rpb25hbGl0eScgc29sZWx5IGRl
cGVuZHMgdXBvbiBkZXZlbG9wZXIncyBpbnRlcnByZXRhdGlvbiBhbmQgDQo+PiAnVGVzdCBjYXRl
Z29yeScgaXMgbm90IHVzZWQuIExldCdzIHJlbW92ZSB0aGVtIGZyb20gdGhlIGttcyB0ZXN0cyAN
Cj4+IGRvY3VtZW50YXRpb24gc28gdGhhdCBkb2N1bWVudGF0aW9uIGNhbiBiZSBtYWRlIHByZWNp
c2Ugd2hpY2ggaXMgZWFzeSANCj4+IHRvIG1haW50YWluLg0KPj4NCj4gK2NjIEphcmkgYW5kIEth
dGFyenluYQ0KPiBDYzogSmFyaSBUYWh2YW5haW5lbiA8amFyaS50YWh2YW5haW5lbkBpbnRlbC5j
b20+DQo+IENjOiBLYXRhcnp5bmEgUGllY2llbHNrYSA8a2F0YXJ6eW5hLnBpZWNpZWxza2FAaW50
ZWwuY29tPg0KPg0KPiBPbmUgbW9yZSB0aGluZyBpcyB0aGF0IHN1Y2ggY2hhbmdlIHNob3VsZCBh
bHNvIHVwZGF0ZSAqanNvbiBmb3IgDQo+IGV4YW1wbGU6DQo+DQo+IGdyZXAgRnVuY3Rpb25hbGl0
eSB0ZXN0cy9pbnRlbC8qanNvbg0KPg0KPiB0ZXN0cy9pbnRlbC9pOTE1X3Rlc3RfY29uZmlnLmpz
b246ICJGdW5jdGlvbmFsaXR5Ijogew0KQ2hhbmdlIGhhcyBiZWVuIGRvbmUgb25seSBmb3IgS01T
IGRvY3VtZW50YXRpb24uDQo+IHRlc3RzL2ludGVsL2ttc190ZXN0X2NvbmZpZy5qc29uOiAgIkZ1
bmN0aW9uYWxpdHkiOiB7DQpGb3IgS01TLCB0aGlzIGZpZWxkIGlzIG5vdCAibWFuZGF0b3J5Ii4g
U28sIG5vIGNoYW5nZSByZXF1aXJlZCB0aGVyZS4NCklmIG5lZWRlZCwgSSBjYW4gcmVtb3ZlLg0K
DQooS2FzaWEpIEkgcmVtZW1iZXIgdGhhdCAnRnVuY3Rpb25hbGl0eScgZmllbGQgaXMgbm90IG5l
ZWRlZC4gTWF5YmUgaXQgd291bGQgYmUgZ29vZCB0byByZW1vdmUgaXQgZnJvbSBrbXMganNvbiBm
aWxlLg0KSG93ZXZlciwgSSBhbSBub3Qgc3VyZSBpZiB0aGlzIHdpbGwgbm90IGFmZmVjdCBidWls
ZGluZyBhbGwgZG9jdW1lbnRhdGlvbi4gSmFyaSAtIGNvdWxkIFlvdSBsb29rIGF0IHRoaXMgcHJv
cG9zYWw/DQoNCkthc2lhDQoNCj4gdGVzdHMvaW50ZWwveGVfdGVzdF9jb25maWcuanNvbjogICAi
RnVuY3Rpb25hbGl0eSI6IHsNCj4NCj4gUmVnYXJkcywNCj4gS2FtaWwNCj4NCj4+IFNpZ25lZC1v
ZmYtYnk6IFN3YXRpIFNoYXJtYSA8c3dhdGkyLnNoYXJtYUBpbnRlbC5jb20+DQo+PiAtLS0NCj4+
ICAgdGVzdHMvY2hhbWVsaXVtL2ttc19jaGFtZWxpdW1fYXVkaW8uYyAgIHwgICA1IC0NCj4+ICAg
dGVzdHMvY2hhbWVsaXVtL2ttc19jaGFtZWxpdW1fY29sb3IuYyAgIHwgICAyIC0NCj4+ICAgdGVz
dHMvY2hhbWVsaXVtL2ttc19jaGFtZWxpdW1fZWRpZC5jICAgIHwgIDExIC0tDQo+PiAgIHRlc3Rz
L2NoYW1lbGl1bS9rbXNfY2hhbWVsaXVtX2ZyYW1lcy5jICB8ICAxMSAtLQ0KPj4gICB0ZXN0cy9j
aGFtZWxpdW0va21zX2NoYW1lbGl1bV9ocGQuYyAgICAgfCAgMjYgLS0tLS0NCj4+ICAgdGVzdHMv
ZmJkZXYuYyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAyIC0NCj4+ICAgdGVzdHMvaW50
ZWwvaTkxNV9waXBlX3N0cmVzcy5jICAgICAgICAgIHwgICAzIC0NCj4+ICAgdGVzdHMvaW50ZWwv
a21zX2JpZ19mYi5jICAgICAgICAgICAgICAgIHwgIDExIC0tDQo+PiAgIHRlc3RzL2ludGVsL2tt
c19idXN5LmMgICAgICAgICAgICAgICAgICB8ICAgMyAtDQo+PiAgIHRlc3RzL2ludGVsL2ttc19j
Y3MuYyAgICAgICAgICAgICAgICAgICB8ICAgNCAtDQo+PiAgIHRlc3RzL2ludGVsL2ttc19jZGNs
ay5jICAgICAgICAgICAgICAgICB8ICAgMiAtDQo+PiAgIHRlc3RzL2ludGVsL2ttc19kaXJ0eWZi
LmMgICAgICAgICAgICAgICB8ICAgMyAtDQo+PiAgIHRlc3RzL2ludGVsL2ttc19kcF9saW5rdHJh
aW5fZmFsbGJhY2suYyB8ICAgMiAtDQo+PiAgIHRlc3RzL2ludGVsL2ttc19kcmF3X2NyYy5jICAg
ICAgICAgICAgICB8ICAgMiAtDQo+PiAgIHRlc3RzL2ludGVsL2ttc19kc2MuYyAgICAgICAgICAg
ICAgICAgICB8ICAgMiAtDQo+PiAgIHRlc3RzL2ludGVsL2ttc19mYl9jb2hlcmVuY3kuYyAgICAg
ICAgICB8ICAgMiAtDQo+PiAgIHRlc3RzL2ludGVsL2ttc19mYmNvbl9mYnQuYyAgICAgICAgICAg
ICB8ICAgNSAtDQo+PiAgIHRlc3RzL2ludGVsL2ttc19mZW5jZV9waW5fbGVhay5jICAgICAgICB8
ICAgMiAtDQo+PiAgIHRlc3RzL2ludGVsL2ttc19mbGlwX3NjYWxlZF9jcmMuYyAgICAgICB8ICAx
MiAtLQ0KPj4gICB0ZXN0cy9pbnRlbC9rbXNfZmxpcF90aWxpbmcuYyAgICAgICAgICAgfCAgIDIg
LQ0KPj4gICB0ZXN0cy9pbnRlbC9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYyAgfCAxNDcgLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+PiAgIHRlc3RzL2ludGVsL2ttc19qb2luZXIuYyAgICAg
ICAgICAgICAgICB8ICAgMiAtDQo+PiAgIHRlc3RzL2ludGVsL2ttc19sZWdhY3lfY29sb3JrZXku
YyAgICAgICB8ICAgMiAtDQo+PiAgIHRlc3RzL2ludGVsL2ttc19tbWFwX3dyaXRlX2NyYy5jICAg
ICAgICB8ICAgMiAtDQo+PiAgIHRlc3RzL2ludGVsL2ttc19waXBlX2JfY19pdmIuYyAgICAgICAg
ICB8ICAgMiAtDQo+PiAgIHRlc3RzL2ludGVsL2ttc19wbV9iYWNrbGlnaHQuYyAgICAgICAgICB8
ICAgNSAtDQo+PiAgIHRlc3RzL2ludGVsL2ttc19wbV9kYy5jICAgICAgICAgICAgICAgICB8ICAg
OCAtLQ0KPj4gICB0ZXN0cy9pbnRlbC9rbXNfcG1fbHBzcC5jICAgICAgICAgICAgICAgfCAgIDIg
LQ0KPj4gICB0ZXN0cy9pbnRlbC9rbXNfcG1fcnBtLmMgICAgICAgICAgICAgICAgfCAgMTUgLS0t
DQo+PiAgIHRlc3RzL2ludGVsL2ttc19wc3IuYyAgICAgICAgICAgICAgICAgICB8ICAzMyAtLS0t
LS0NCj4+ICAgdGVzdHMvaW50ZWwva21zX3BzcjJfc2YuYyAgICAgICAgICAgICAgIHwgIDI1IC0t
LS0NCj4+ICAgdGVzdHMvaW50ZWwva21zX3Bzcl9zdHJlc3NfdGVzdC5jICAgICAgIHwgICAyIC0N
Cj4+ICAgdGVzdHMvaW50ZWwva21zX3B3cml0ZV9jcmMuYyAgICAgICAgICAgIHwgICAyIC0NCj4+
ICAgdGVzdHMva21zXzNkLmMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAyIC0NCj4+ICAg
dGVzdHMva21zX2FkZGZiX2Jhc2ljLmMgICAgICAgICAgICAgICAgIHwgIDE3IC0tLQ0KPj4gICB0
ZXN0cy9rbXNfYXN5bmNfZmxpcHMuYyAgICAgICAgICAgICAgICAgfCAgIDQgLQ0KPj4gICB0ZXN0
cy9rbXNfYXRvbWljLmMgICAgICAgICAgICAgICAgICAgICAgfCAgIDQgLQ0KPj4gICB0ZXN0cy9r
bXNfYXRvbWljX2ludGVycnVwdGlibGUuYyAgICAgICAgfCAgIDYgLQ0KPj4gICB0ZXN0cy9rbXNf
YXRvbWljX3RyYW5zaXRpb24uYyAgICAgICAgICAgfCAgIDQgLQ0KPj4gICB0ZXN0cy9rbXNfYncu
YyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgLQ0KPj4gICB0ZXN0cy9rbXNfY29sb3Iu
YyAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgLQ0KPj4gICB0ZXN0cy9rbXNfY29uY3VycmVu
dC5jICAgICAgICAgICAgICAgICAgfCAgIDIgLQ0KPj4gICB0ZXN0cy9rbXNfY29udGVudF9wcm90
ZWN0aW9uLmMgICAgICAgICAgfCAgIDcgLS0NCj4+ICAgdGVzdHMva21zX2N1cnNvcl9jcmMuYyAg
ICAgICAgICAgICAgICAgIHwgICA1IC0NCj4+ICAgdGVzdHMva21zX2N1cnNvcl9lZGdlX3dhbGsu
YyAgICAgICAgICAgIHwgICAyIC0NCj4+ICAgdGVzdHMva21zX2N1cnNvcl9sZWdhY3kuYyAgICAg
ICAgICAgICAgIHwgICAyIC0NCj4+ICAgdGVzdHMva21zX2Rpc3BsYXlfbW9kZXMuYyAgICAgICAg
ICAgICAgIHwgICAzIC0NCj4+ICAgdGVzdHMva21zX2RpdGhlci5jICAgICAgICAgICAgICAgICAg
ICAgIHwgICAyIC0NCj4+ICAgdGVzdHMva21zX2RwX2F1eF9kZXYuYyAgICAgICAgICAgICAgICAg
IHwgICAyIC0NCj4+ICAgdGVzdHMva21zX2ZlYXR1cmVfZGlzY292ZXJ5LmMgICAgICAgICAgIHwg
ICA3IC0tDQo+PiAgIHRlc3RzL2ttc19mbGlwLmMgICAgICAgICAgICAgICAgICAgICAgICB8ICAx
NCAtLS0NCj4+ICAgdGVzdHMva21zX2ZsaXBfZXZlbnRfbGVhay5jICAgICAgICAgICAgIHwgICAy
IC0NCj4+ICAgdGVzdHMva21zX2ZvcmNlX2Nvbm5lY3Rvcl9iYXNpYy5jICAgICAgIHwgICAzIC0N
Cj4+ICAgdGVzdHMva21zX2dldGZiLmMgICAgICAgICAgICAgICAgICAgICAgIHwgICA0IC0NCj4+
ICAgdGVzdHMva21zX2hkbWlfaW5qZWN0LmMgICAgICAgICAgICAgICAgIHwgICAzIC0NCj4+ICAg
dGVzdHMva21zX2hkci5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEwIC0tDQo+PiAgIHRl
c3RzL2ttc19pbnZhbGlkX21vZGUuYyAgICAgICAgICAgICAgICB8ICAgMiAtDQo+PiAgIHRlc3Rz
L2ttc19sZWFzZS5jICAgICAgICAgICAgICAgICAgICAgICB8ICAgMiAtDQo+PiAgIHRlc3RzL2tt
c19tdWx0aXBpcGVfbW9kZXNldC5jICAgICAgICAgICB8ICAgMiAtDQo+PiAgIHRlc3RzL2ttc19w
YW5lbF9maXR0aW5nLmMgICAgICAgICAgICAgICB8ICAgMiAtDQo+PiAgIHRlc3RzL2ttc19waXBl
X2NyY19iYXNpYy5jICAgICAgICAgICAgICB8ICAgNSAtDQo+PiAgIHRlc3RzL2ttc19wbGFuZS5j
ICAgICAgICAgICAgICAgICAgICAgICB8ICAgNyAtLQ0KPj4gICB0ZXN0cy9rbXNfcGxhbmVfYWxw
aGFfYmxlbmQuYyAgICAgICAgICAgfCAgIDIgLQ0KPj4gICB0ZXN0cy9rbXNfcGxhbmVfY3Vyc29y
LmMgICAgICAgICAgICAgICAgfCAgIDIgLQ0KPj4gICB0ZXN0cy9rbXNfcGxhbmVfbG93cmVzLmMg
ICAgICAgICAgICAgICAgfCAgIDMgLQ0KPj4gICB0ZXN0cy9rbXNfcGxhbmVfbXVsdGlwbGUuYyAg
ICAgICAgICAgICAgfCAgIDMgLQ0KPj4gICB0ZXN0cy9rbXNfcGxhbmVfc2NhbGluZy5jICAgICAg
ICAgICAgICAgfCAgIDYgLQ0KPj4gICB0ZXN0cy9rbXNfcHJvcF9ibG9iLmMgICAgICAgICAgICAg
ICAgICAgfCAgIDIgLQ0KPj4gICB0ZXN0cy9rbXNfcHJvcGVydGllcy5jICAgICAgICAgICAgICAg
ICAgfCAgIDIgLQ0KPj4gICB0ZXN0cy9rbXNfcm90YXRpb25fY3JjLmMgICAgICAgICAgICAgICAg
fCAgIDUgLQ0KPj4gICB0ZXN0cy9rbXNfc2NhbGluZ19tb2Rlcy5jICAgICAgICAgICAgICAgfCAg
IDIgLQ0KPj4gICB0ZXN0cy9rbXNfc2VsZnRlc3QuYyAgICAgICAgICAgICAgICAgICAgfCAgIDIg
LQ0KPj4gICB0ZXN0cy9rbXNfc2VxdWVuY2UuYyAgICAgICAgICAgICAgICAgICAgfCAgIDIgLQ0K
Pj4gICB0ZXN0cy9rbXNfc2V0bW9kZS5jICAgICAgICAgICAgICAgICAgICAgfCAgIDMgLQ0KPj4g
ICB0ZXN0cy9rbXNfc3lzZnNfZWRpZF90aW1pbmcuYyAgICAgICAgICAgfCAgIDIgLQ0KPj4gICB0
ZXN0cy9rbXNfdGlsZWRfZGlzcGxheS5jICAgICAgICAgICAgICAgfCAgIDMgLQ0KPj4gICB0ZXN0
cy9rbXNfdHZfbG9hZF9kZXRlY3QuYyAgICAgICAgICAgICAgfCAgIDIgLQ0KPj4gICB0ZXN0cy9r
bXNfdmJsYW5rLmMgICAgICAgICAgICAgICAgICAgICAgfCAgMTAgLS0NCj4+ICAgdGVzdHMva21z
X3Zyci5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA5IC0tDQo+PiAgIHRlc3RzL2ttc193
cml0ZWJhY2suYyAgICAgICAgICAgICAgICAgICB8ICAgMiAtDQo+PiAgIHRlc3RzL3Rlc3RkaXNw
bGF5LmMgICAgICAgICAgICAgICAgICAgICB8ICAgMiAtDQo+PiAgIDgxIGZpbGVzIGNoYW5nZWQs
IDU1MiBkZWxldGlvbnMoLSkNCj4+DQo+IC4uLmN1dC4uLg0KPg0KDQo=
