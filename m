Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99266EF5865
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 05:12:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DAB010E219;
	Mon, 23 Feb 2026 05:12:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fd7IJklj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0411D10E219
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 05:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771823547; x=1803359547;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PPigj0PJSPRFEjOaw4MC1OUp7Amgrw5xpUOYoj4LV2c=;
 b=fd7IJkljV3AO1yMOz3vc/szmpTHoZJAHqohZbqmaYYLh7/cJ6QpOryVK
 TeKK7iq+l1BudU7GbM5713/c9T68fVxC6AUtgK7Q2UmCeJR1aMUAwHxPh
 gN5nhkxuWzXYwwF5sWJZQMlqnTw0+rA2J5oFnvcl05IhOEVdHCGB0NTXs
 tqnY+JixtFx6WnIOzbhOSBWyKtCK93J98GPW6JsMwTJZ0/iY4HUVblwQB
 xi2kj+PR6KjbPdwUtJiPY6kerQom5oAvkVN66HzEKMc67tbsUVJBGZxV9
 1sMg7aGO8beff9VldJb19izCtJdCxV/pc3uTEHtSH+HilUqawy57g94dq w==;
X-CSE-ConnectionGUID: fE52IudaSFqdNZj6YR930A==
X-CSE-MsgGUID: X8DuYjiRQ0iXOX+LoWdzLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72519285"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="72519285"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 21:12:22 -0800
X-CSE-ConnectionGUID: IStswyO5TOee5aQynylKBQ==
X-CSE-MsgGUID: l4ZhC7hwRim+y7Tc0KkwyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="219570861"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 21:12:21 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 22 Feb 2026 21:12:20 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 22 Feb 2026 21:12:20 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.6) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 22 Feb 2026 21:12:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MqgAklKlD+NeVRQfvksrW4joOESyqTUPe3uI4a5eggHAvBDq92poCLnAoYXqVH1EjRBPy40HO/GCfl+tP2naQJqZrZeQjBSbq8eJZHHPiEYd5esVfhCtwz7zY0sL4oFLXH7hJkfiRQmyY2Yp36Fi2Ej4oh+iUhXrZWHRkuqJ+BNJdCrHvD4MU6MrVbnE4D9GWHHft6/0QLKqwIv5kFcynCgBoF/owTS32eGomOCeTcwNW4Z7uCzspbINfsj09TXg3nMxAxxpZyvInUQMAWibcizgZXKpysjr3FManOENWtf6I2ya6RteNfMt/xhCL/HmRn4wHLw7skW6U3diij+ojA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PPigj0PJSPRFEjOaw4MC1OUp7Amgrw5xpUOYoj4LV2c=;
 b=K576RuWT1u0nX7ATZCBgYXRplxNRGPfZMXQy+KXRWe9i/rL8mFQYbqx9rhd2VGR6QZgNwbvc5Y8hbkbcKvNCUpVsZ1znMRseylsTAwpVsvSu/v3ObP4+zVdw5iGJCLzWLEtzLJUK7ZJpgnJPqZPut7j6RkvFpsJR/W7R7hlIrys5upp/O1L/DvUlelCKc/PQXIZY2GTlROHsyVMSdrz6CfJG42PK87DLUhRzAdg8LJjrgDKlh2dj6H4GKmGV/6AobB82Iak+2e1Mb0NEsq1LXvpF+JBBmkVoRkXtH9BANaZIS2ooDPLmUDoH5I+YohIlrWD8cll7QbSH3KKz3EkxSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by PH7PR11MB7663.namprd11.prod.outlook.com (2603:10b6:510:27c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 05:12:16 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a%5]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 05:12:16 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "Yadav, Arvind" <arvind.yadav@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Sharma, Nishit"
 <nishit.sharma@intel.com>
Subject: RE: [PATCH i-g-t v3 8/8] tests/intel/xe_madvise: Add
 per-vma-protection subtest
Thread-Topic: [PATCH i-g-t v3 8/8] tests/intel/xe_madvise: Add
 per-vma-protection subtest
Thread-Index: AQHcn7YnKrittt3nUE+mqbq+4OMT6LWPxnEA
Date: Mon, 23 Feb 2026 05:12:16 +0000
Message-ID: <BL1PR11MB5525F9B4AF295889FB7006228477A@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20260217023423.2632617-1-arvind.yadav@intel.com>
 <20260217023423.2632617-9-arvind.yadav@intel.com>
In-Reply-To: <20260217023423.2632617-9-arvind.yadav@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|PH7PR11MB7663:EE_
x-ms-office365-filtering-correlation-id: eb6c8223-7fac-4229-0834-08de729a1ce1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?R2xIR29mMjlqcnYwZ0VnbG1va0U4amNrQ1F4b0lhdjYvRWNYSHBTQi9hUExG?=
 =?utf-8?B?bFBuTTNBRys1TmcyQm5qRUdZUEJEaFFsK1NKTU9xR2Z6UTdCMGZQT01WWi9y?=
 =?utf-8?B?MytRUVJ2RitjQUZ5VGhZWHhlcXVFdzNSVUl1MVUyVnk0MDk5a29ocDRhbm5M?=
 =?utf-8?B?TFN0WUlRL3FKdUNDUFNRZ0hCeFQ5Mk1LSDQ0OVhqNWxjcy8vREF3ZURDYnhF?=
 =?utf-8?B?Nlk4NGpNbnprOUd1KzNnczJpaDZMWTVpaEZhQXY5ZVRTTW1GV0tkRnFmekwy?=
 =?utf-8?B?NXI2b2wrZ3dZQ3R5N3drdXIvQVpmZE1sTTdJZTlZeTZyT1pRdG9hWXdseDdY?=
 =?utf-8?B?ZUNHKzhrUHUyVm5MRjRQeDBxYlAzWDAxUkpFRFhvOXpCaCtMZWxndlVYZ2RD?=
 =?utf-8?B?RC9jT0F6MGYyREs0aWc1Y2l1WExDVjhyVXFvdzNiK2Jqck9GN3prMGFTREtI?=
 =?utf-8?B?TXdQMW5hbGhFdC92eWVtOGRJaSt0UmhwUUdFdFZIams4QUJEY0FxbEFHa3U5?=
 =?utf-8?B?L2JnT3pKR0RrNFdETUNYMElZMlR1S1ROR0VycUk0clcvVzFXalZreDJ4RUQ5?=
 =?utf-8?B?bXBmQTBOWTQya1dDZUV0U0YzMEhwb1ppRGZUQ3l3T1BRS2dqUHhSM0podFUw?=
 =?utf-8?B?aFVXMVJiNVFzczIwRUNpcW8vT2dURTNIYnZjMEltV3hxOVFwbFVTVXY3UW45?=
 =?utf-8?B?LzBPK3EvVzZIbEFKN1FEOXlUNmptSEtGODhQSE1SQzExVlhTTnErKzM4M0xG?=
 =?utf-8?B?NVhrYlY3c09SM1lFQ2RMV0Q3aXVRbDY2Z1RPeGdCT0RsV3NiZ2ZKU0JGUVZL?=
 =?utf-8?B?R0FSV0swN1NNeFJlZWQweUNobk9hc2VZVTdBcytlU1UvY0xibTJLamhxRGhY?=
 =?utf-8?B?OXFwQnJFNGV1VE0yTTFRVk0zK0FBZ0JVTEs5bEJzaEJEMDJwd2NES3RvMWFZ?=
 =?utf-8?B?L0ZXSE5HaHpkVjJjTTMxNEIxOFREbUY0UUJJRVlUUDk1Nys4YTNLaW1RMU1q?=
 =?utf-8?B?QWtOdjA0bElrQzRPQmM0WnRPaWpzMXhMa29xZjlYSjRONklwUWVWdU9GWHpG?=
 =?utf-8?B?d2c2RGRwV2VHSmkycnpVSnNEWWVBQzBObE1Ub2wyamJkMENUcDNNcHJ1ZG0x?=
 =?utf-8?B?dmdRRkUzRXRrbXNJeGszWElndmloWjVzWGhhQlV0ay93N1VTV0k4d0dHRXhq?=
 =?utf-8?B?bktJT25HdWxiWUl6eWxFQTFpbEdKMXBRamlSUjlkTldtV2ZFdjQvTzJneU15?=
 =?utf-8?B?anNpQUJ0dVYvQjR5cnU1eUk0TlhHeUFpcHR1eFhBN0pvMnRodWtwMkQ4RjIy?=
 =?utf-8?B?R3dMOHFaTVN0VDd0MHF3VjUweTV5Y0hOakZqZm9sYmVZT3NqcU04eUExSnls?=
 =?utf-8?B?QXU1b3lsbEJuNGprN1NlUy9XTTNWbXRkUThmMjNybUJJZ1AvWkZnRzYxNTJR?=
 =?utf-8?B?M1Y1S1htRDhjaDIyZTlpbWFCTEg4WlRIWWpxOTh2ZlBLUGZCS2p1cFJjb0F2?=
 =?utf-8?B?MnIvTDhtakJnanRKUnRmVDV2K3FxWVV3MGw5anpBN25BMU9RU0VpQWJYTEhx?=
 =?utf-8?B?bmJqUWxyY0grSTYrTUVOenQxSjd5NjkrRy9DY0E5UXgvaXVYWmlnQUNDODkv?=
 =?utf-8?B?N09wdjZlSnN0MjB4Z1g3UHhQZXExSWJZZm44WVRGWU5SM0UwZVJOc0l1bERR?=
 =?utf-8?B?SUxxN0xNdXpoalBDTG5rSlhTc0ZhSnk2QVBadEJVeU53Wm96d2s3cVErSk4w?=
 =?utf-8?B?TFFWRzM0THYyaTBicFhoek1GWnJQL2xLL21va0Z5dkIxOUNndTNudklaaFNJ?=
 =?utf-8?B?bnpPZmxRQjI2ZlRlcVpjeFg0eGVHTEVNYnhZWCtoTVA3Nlc1NUMxbnhyTzUy?=
 =?utf-8?B?YXpmQlNCTGtCNmF1MWgrTHVrVENWZjhHYWtDL2FhK1hjM0pzQWFVdUZ2VDQx?=
 =?utf-8?B?a3ZJaTlhcUVldFJNeXFaZDZCNzVPeFh2dHVxQzFKcmtKV1N4MjEyWUMvNmxy?=
 =?utf-8?B?WWRYZ3Q0RHlYQXRDbFRnaVVIYW5rNXRUS3lQNDNKdjN4ZlMvZXM1RlN2VXJY?=
 =?utf-8?B?WWtMWll4RGdFK1lMZ0FUb1l4dmxxYkhFamRCeVp5U2dTWWRZcFpKVmVtdHRK?=
 =?utf-8?B?dU1LbGpWbDVhaEZLZ0hEcUN5QkNUN2lacTdvQkxCcXhLVm9Ydzlselh3ZXJZ?=
 =?utf-8?Q?0cjKMQm2oJtucf1NOmxVciQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UUN3S28rZkRQRzBtbjBrU3BpR2ZRcENRaGZON2szSDBYUzhTdHZYTGNUK1Vo?=
 =?utf-8?B?OU9lWkhoOFE0VzBqU1JndkZXUGhnaHFmYmhLU2pPMlJ0aWd5UzcxMW9wY2Ju?=
 =?utf-8?B?dG5WWnFQSmRTM2lNbEUwSFJiUnhwbXR6dWNUSlJ0S2ppWG9RNEVkTTBVNWhh?=
 =?utf-8?B?NFpYeVVqakR6NmxQa3FqWFVtNTVKOC83WW5rU2VhQU02VzFZVXZQWFpzQ1dl?=
 =?utf-8?B?TFNQYnJxZmQrc1JUcTlnRDlUUm0wVUhET2xKTXhuRFhLa3EzNEZBaXNXR0FT?=
 =?utf-8?B?cEJRMlBlMlFNSmJkTFpHTDBRTWRaZlpQT2VwcnBmVXYzOE9lQTlsV2svUVdS?=
 =?utf-8?B?eHJRZ1RmaGR2WFpSZ0ZFQk53bjk1RTdmUzZZLzVaWXIxeFgzczUvM21zVk5w?=
 =?utf-8?B?T2svRVp3TnBlNEhGdnpJZ2xrNTJiaGwwME85R1ppVDJXVzlHVFpWajJIU2JZ?=
 =?utf-8?B?YWN1V2NxZ1ptSi9OQ3FmWUFZSHJTRFZ4c2lvYkZLYWloZU96cUxnMFhpUWlj?=
 =?utf-8?B?K3l0VlpPU0JZemJDNjdLKzJLUVRUR3o5bTJLbjZGM0NsbVZVTFBhanc4dk5D?=
 =?utf-8?B?ZHBRdnZQbnB4cHU4NG44VXBsY0dVSkw1MkRqOUNmN3FUVTJ4K3A2YnYvRmxm?=
 =?utf-8?B?Yjh0T1J4MnM1QTgxemxaS28zL1dYQ3JCWTczNEJGMEhnL0crbUh1R1R5cjFa?=
 =?utf-8?B?cS9uSlBXZmhiNHZYMGpuS2xIdlpzOFJSUGp4WE9mTGVxdVFmZ0VURTlyZ0hO?=
 =?utf-8?B?Y3huckZuaHk3eUJnMUFpa0V6TExIMEVWZkhZck5LMDBscHQrQk56dHBYSGRU?=
 =?utf-8?B?RDRNaE4xbDg4NGpNdjZzSWVka3k4Sk1SdVFKUnVZR1Q5QTZwNkFrT3drUFYr?=
 =?utf-8?B?OGtzdExQSEpzZGwzRFVFcnc0anRJWXhRV2prVk9yVjU2b0xYV2tZZ3RxVjho?=
 =?utf-8?B?V2tkM1dhS1UvSUpRVjFiS0hPQUpqU1g1NnE2bnRnSFpLRUVjaUZoZDF2Qzdy?=
 =?utf-8?B?ZjM5bWIrMDdoZmNzeDlnbE1BaXB0Kyt5MXhTazRiWW9xWE01S1FpbTFkNTZD?=
 =?utf-8?B?N2M1ZHRsN1BuMEp1WnNFTGcvbTBZcmpzWCtPUmxDWERLWng4N1I2bGJrYjJU?=
 =?utf-8?B?UWxxaThBSXJ2REdLaHJxRkNwc3VIQkx2cHNvQXhtMVpUS0JGamd6ZXRncmt1?=
 =?utf-8?B?K2FSTWZ1dyswLzdYVXZ2UnBMQnBSVEJ6em84eEJoNmc4QU5CR2xMYnpMZmQy?=
 =?utf-8?B?aml5MkMvd2REczlrbDNpQVc4dlk3aGg2ekpYeUxrNk9DcjV2VGI4SnFVUWov?=
 =?utf-8?B?RW9JQ2lMejJWQTQzY09yelVrVFRjUnZXTFd3ZzYwcGdudm94TUF5WCs3aU5H?=
 =?utf-8?B?NE1PVUZqdnZtWjRjZ29TOEQ1NGVDb0hZbjdkdEQxN3BFYlNaZGx0VW14WkR6?=
 =?utf-8?B?S2d2VitYQlZ1U21qNGNSTjN0TS9qL0hEUjBYUDlGcWNTZ25sN1kyMVAxWHFM?=
 =?utf-8?B?NU9SNVhrVUcxczliRmRJai9BZG5sWVJ0Wm1MSEZCdUVrYXB6TEpaZjZlTkRU?=
 =?utf-8?B?aytXZlhTV3JkdEp1U2NvMy8wYjB5SFd6MHhlbTh1c0hPMU1jNVQyYTB0Mm8y?=
 =?utf-8?B?b0hJdWVlTVR3ZDFiR056QU01UmY5RVlVM3QrZXFVQnpnb1VxdzRxcG94cGZL?=
 =?utf-8?B?S0I1QldzYk1kaFNOY3lScHo5VXRVZHFtZ25qWFFKMUZYYTEzV0RUTmJOSmlv?=
 =?utf-8?B?Z2l2eDNFejcyeTdVYmo5cXVSUTBHQmdEaWV3RmVRbkMvdjVCV0s3b1RqRWRw?=
 =?utf-8?B?bmYxQmZaaldYQ1Ava2tTTVFJQWhIK1VxK24yZHZoUmdJeElleFFDS1dHSnlY?=
 =?utf-8?B?bXNQMzI4UGgxQytaS3VXV1BIV3JUVk8vMjIyZGx6N1VzdzFuMElmR0Y1WGZQ?=
 =?utf-8?B?VWJNcTIwaitpc25qZ25WV25Hc2UzTmFIc2N6a3lIOEI0dm8vdWVKdGJaZk1v?=
 =?utf-8?B?TTEwM0krMkR1NlA3aVltcTJxeWJ5Q2tmb2RnRFBmYWhyUFhidFVjaEJFODN3?=
 =?utf-8?B?bSt2bjVCYTY5Q0owSGJoL3F5cUVCb1lwQ0JScnBpejBucjlZbjI5RmxBQncx?=
 =?utf-8?B?MjVmRXdXcXpPUUM4R3VmZnRLVEJYZUkxZURuR1NaN1gxbGE3VkJ0ZEdoTWxX?=
 =?utf-8?B?RHBRcU1KVlZ4dm5RZUV5cmJrcUd4YnhIMUJZeldFcEQxdFJCOGt3TGhDQXgw?=
 =?utf-8?B?TmhXV3BZSmxqVVlLQmVNWGVySTlnSjcvVHhld0ZoVzBObFhodjBSYmUvaTk4?=
 =?utf-8?B?b3ZIVlJROWZzMC95dDRLaG0ySk5KOTM1L1JhenFkdUZVMHBpcEppdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb6c8223-7fac-4229-0834-08de729a1ce1
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2026 05:12:16.8066 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AebOVCii9vHYgGsH8T/qVIjUyh+/Gp33dWi0hGIH9K411bir83MoE47VhxUPJi5hzwJeVzT0pHrlQkRR4fBxc4SVYW5l8t9JBg5rz1/kNcU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7663
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWWFkYXYsIEFydmluZCA8
YXJ2aW5kLnlhZGF2QGludGVsLmNvbT4NCj4gU2VudDogVHVlc2RheSwgMTcgRmVicnVhcnksIDIw
MjYgMDg6MDQgQU0NCj4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBC
cm9zdCwgTWF0dGhldyA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+OyBHaGltaXJheSwgSGltYWwg
UHJhc2FkDQo+IDxoaW1hbC5wcmFzYWQuZ2hpbWlyYXlAaW50ZWwuY29tPjsgdGhvbWFzLmhlbGxz
dHJvbUBsaW51eC5pbnRlbC5jb207DQo+IFNoYXJtYSwgTmlzaGl0IDxuaXNoaXQuc2hhcm1hQGlu
dGVsLmNvbT47IEd1cnJhbSwgUHJhdmFsaWthDQo+IDxwcmF2YWxpa2EuZ3VycmFtQGludGVsLmNv
bT4NCj4gU3ViamVjdDogW1BBVENIIGktZy10IHYzIDgvOF0gdGVzdHMvaW50ZWwveGVfbWFkdmlz
ZTogQWRkIHBlci12bWEtcHJvdGVjdGlvbg0KPiBzdWJ0ZXN0DQo+IA0KPiBUaGlzIHRlc3QgdmFs
aWRhdGVzIHRoYXQgYSBXSUxMTkVFRCBWTUEgcHJvdGVjdHMgYSBzaGFyZWQgQk8gZnJvbSBiZWlu
Zw0KPiBwdXJnZWQgZXZlbiB3aGVuIG90aGVyIFZNQXMgYXJlIG1hcmtlZCBET05UTkVFRC4gVGhl
IHRlc3QgY3JlYXRlcyBhIEJPDQo+IHNoYXJlZCBhY3Jvc3MgdHdvIFZNcywgbWFya3MgVk1BMSBh
cyBET05UTkVFRCB3aGlsZSBrZWVwaW5nIFZNQTIgYXMNCj4gV0lMTE5FRUQsIHRoZW4gdHJpZ2dl
cnMgbWVtb3J5IHByZXNzdXJlLiBUaGUgQk8gc2hvdWxkIHN1cnZpdmUgYW5kIEdQVQ0KPiBleGVj
dXRpb24gc2hvdWxkIHN1Y2NlZWQuIEFmdGVyIG1hcmtpbmcgYm90aCBWTUFzIGFzIERPTlRORUVE
IGFuZA0KPiB0cmlnZ2VyaW5nIHByZXNzdXJlIGFnYWluLCB0aGUgQk8gc2hvdWxkIGJlIHB1cmdl
ZCwgZGVtb25zdHJhdGluZyB0aGF0IGFsbA0KPiBWTUFzIG11c3QgYmUgRE9OVE5FRUQgZm9yIHRo
ZSBCTyB0byBiZSBwdXJnZWFibGUuDQo+IA0KPiBDYzogTmlzaGl0IFNoYXJtYSA8bmlzaGl0LnNo
YXJtYUBpbnRlbC5jb20+DQo+IENjOiBQcmF2YWxpa2EgR3VycmFtIDxwcmF2YWxpa2EuZ3VycmFt
QGludGVsLmNvbT4NCj4gQ2M6IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29t
Pg0KPiBDYzogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwu
Y29tPg0KPiBDYzogSGltYWwgUHJhc2FkIEdoaW1pcmF5IDxoaW1hbC5wcmFzYWQuZ2hpbWlyYXlA
aW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBBcnZpbmQgWWFkYXYgPGFydmluZC55YWRhdkBp
bnRlbC5jb20+DQo+IC0tLQ0KPiAgdGVzdHMvaW50ZWwveGVfbWFkdmlzZS5jIHwgMTE2DQo+ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQs
IDExNiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfbWFk
dmlzZS5jIGIvdGVzdHMvaW50ZWwveGVfbWFkdmlzZS5jIGluZGV4DQo+IDRlN2RmNTRhNy4uMmU1
MTJlZGM0IDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9pbnRlbC94ZV9tYWR2aXNlLmMNCj4gKysrIGIv
dGVzdHMvaW50ZWwveGVfbWFkdmlzZS5jDQo+IEBAIC01NjgsNiArNTY4LDExNiBAQCBzdGF0aWMg
dm9pZCB0ZXN0X3Blcl92bWFfdHJhY2tpbmcoaW50IGZkLCBzdHJ1Y3QNCj4gZHJtX3hlX2VuZ2lu
ZV9jbGFzc19pbnN0YW5jZSAqaA0KPiAgCXhlX3ZtX2Rlc3Ryb3koZmQsIHZtMik7DQo+ICB9DQo+
IA0KPiArLyoqDQo+ICsgKiBTVUJURVNUOiBwZXItdm1hLXByb3RlY3Rpb24NCj4gKyAqIERlc2Ny
aXB0aW9uOiBXSUxMTkVFRCBWTUEgcHJvdGVjdHMgQk8gZnJvbSBwdXJnaW5nOyBib3RoIERPTlRO
RUVEDQo+ICttYWtlcyBCTyBwdXJnZWFibGUNCj4gKyAqIFRlc3QgY2F0ZWdvcnk6IGZ1bmN0aW9u
YWxpdHkgdGVzdA0KPiArICovDQo+ICtzdGF0aWMgdm9pZCB0ZXN0X3Blcl92bWFfcHJvdGVjdGlv
bihpbnQgZmQsIHN0cnVjdA0KPiArZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZSAqaHdlKSB7
DQo+ICsJdWludDMyX3Qgdm0xLCB2bTIsIGV4ZWNfcXVldWUsIGJvLCBiYXRjaF9ibywgYmluZF9l
bmdpbmU7DQo+ICsJdWludDY0X3QgZGF0YV9hZGRyMSA9IFBVUkdFQUJMRV9BRERSOw0KPiArCXVp
bnQ2NF90IGRhdGFfYWRkcjIgPSBQVVJHRUFCTEVfQUREUjI7DQo+ICsJdWludDY0X3QgYmF0Y2hf
YWRkciA9IFBVUkdFQUJMRV9CQVRDSF9BRERSOw0KPiArCXNpemVfdCBkYXRhX3NpemUgPSBQVVJH
RUFCTEVfQk9fU0laRTsNCj4gKwlzaXplX3QgYmF0Y2hfc2l6ZSA9IFBVUkdFQUJMRV9CT19TSVpF
Ow0KPiArCXN0cnVjdCBkcm1feGVfc3luYyBzeW5jWzJdID0gew0KPiArCQl7IC50eXBlID0gRFJN
X1hFX1NZTkNfVFlQRV9VU0VSX0ZFTkNFLA0KPiArCQkgIC5mbGFncyA9IERSTV9YRV9TWU5DX0ZM
QUdfU0lHTkFMLA0KPiArCQkgIC50aW1lbGluZV92YWx1ZSA9IFBVUkdFQUJMRV9GRU5DRV9WQUwg
fSwNCj4gKwkJeyAudHlwZSA9IERSTV9YRV9TWU5DX1RZUEVfU1lOQ09CSiwNCj4gKwkJICAuZmxh
Z3MgPSBEUk1fWEVfU1lOQ19GTEFHX1NJR05BTCB9LA0KPiArCX07DQo+ICsJc3RydWN0IGRybV94
ZV9leGVjIGV4ZWMgPSB7DQo+ICsJCS5udW1fYmF0Y2hfYnVmZmVyID0gMSwNCj4gKwkJLm51bV9z
eW5jcyA9IDEsDQo+ICsJCS5zeW5jcyA9IHRvX3VzZXJfcG9pbnRlcigmc3luY1sxXSksDQo+ICsJ
fTsNCj4gKwl1aW50MzJfdCAqZGF0YSwgKmJhdGNoOw0KPiArCXVpbnQ2NF90IHZtX3N5bmMgPSAw
Ow0KPiArCXVpbnQzMl90IHJldGFpbmVkLCBzeW5jb2JqOw0KPiArCWludCBiLCByZXQ7DQo+ICsN
Cj4gKwkvKiBDcmVhdGUgdHdvIFZNcyBhbmQgYmluZCBzaGFyZWQgZGF0YSBCTyAqLw0KPiArCWRh
dGEgPSBwdXJnZWFibGVfc2V0dXBfdHdvX3Ztc19zaGFyZWRfYm8oZmQsICZ2bTEsICZ2bTIsICZi
bywNCj4gKwkJCQkJCSBkYXRhX2FkZHIxLCBkYXRhX2FkZHIyLA0KPiArCQkJCQkJIGRhdGFfc2l6
ZSwgdHJ1ZSk7DQo+ICsJbWVtc2V0KGRhdGEsIDAsIGRhdGFfc2l6ZSk7DQo+ICsJYmluZF9lbmdp
bmUgPSB4ZV9iaW5kX2V4ZWNfcXVldWVfY3JlYXRlKGZkLCB2bTIsIDApOw0KPiArDQo+ICsJLyog
Q3JlYXRlIGFuZCBiaW5kIGJhdGNoIEJPIGluIFZNMiAqLw0KPiArCWJhdGNoX2JvID0geGVfYm9f
Y3JlYXRlKGZkLCB2bTIsIGJhdGNoX3NpemUsIHZyYW1faWZfcG9zc2libGUoZmQsIDApLA0KPiAr
DQo+IAlEUk1fWEVfR0VNX0NSRUFURV9GTEFHX05FRURTX1ZJU0lCTEVfVlJBTSk7DQo+ICsJYmF0
Y2ggPSB4ZV9ib19tYXAoZmQsIGJhdGNoX2JvLCBiYXRjaF9zaXplKTsNCj4gKw0KPiArCXN5bmNb
MF0uYWRkciA9IHRvX3VzZXJfcG9pbnRlcigmdm1fc3luYyk7DQo+ICsJdm1fc3luYyA9IDA7DQo+
ICsJeGVfdm1fYmluZF9hc3luYyhmZCwgdm0yLCBiaW5kX2VuZ2luZSwgYmF0Y2hfYm8sIDAsIGJh
dGNoX2FkZHIsDQo+IGJhdGNoX3NpemUsIHN5bmMsIDEpOw0KPiArCXhlX3dhaXRfdWZlbmNlKGZk
LCAmdm1fc3luYywgUFVSR0VBQkxFX0ZFTkNFX1ZBTCwgMCwNCj4gTlNFQ19QRVJfU0VDKTsNCj4g
Kw0KPiArCS8qIE1hcmsgVk1BMSBhcyBET05UTkVFRCwgVk1BMiBzdGF5cyBXSUxMTkVFRCAqLw0K
PiArCXJldGFpbmVkID0geGVfdm1fbWFkdmlzZV9wdXJnZWFibGUoZmQsIHZtMSwgZGF0YV9hZGRy
MSwgZGF0YV9zaXplLA0KPiArDQo+IERSTV9YRV9WTUFfUFVSR0VBQkxFX1NUQVRFX0RPTlRORUVE
KTsNCj4gKwlpZ3RfYXNzZXJ0X2VxKHJldGFpbmVkLCAxKTsNCj4gKw0KPiArCS8qIFRyaWdnZXIg
cHJlc3N1cmUgLSBCTyBzaG91bGQgc3Vydml2ZSAoVk1BMiBwcm90ZWN0cykgKi8NCj4gKwl0cmln
Z2VyX21lbW9yeV9wcmVzc3VyZShmZCwgdm0xKTsNCj4gKw0KPiArCXJldGFpbmVkID0geGVfdm1f
bWFkdmlzZV9wdXJnZWFibGUoZmQsIHZtMiwgZGF0YV9hZGRyMiwgZGF0YV9zaXplLA0KPiArDQo+
IERSTV9YRV9WTUFfUFVSR0VBQkxFX1NUQVRFX1dJTExORUVEKTsNCj4gKwlpZ3RfYXNzZXJ0X2Vx
KHJldGFpbmVkLCAxKTsNCj4gKw0KPiArCS8qIEdQVSB3b3JrbG9hZCAtIHNob3VsZCBzdWNjZWVk
ICovDQo+ICsJYiA9IDA7DQo+ICsJYmF0Y2hbYisrXSA9IE1JX1NUT1JFX0RXT1JEX0lNTV9HRU40
Ow0KPiArCWJhdGNoW2IrK10gPSBkYXRhX2FkZHIyOw0KPiArCWJhdGNoW2IrK10gPSBkYXRhX2Fk
ZHIyID4+IDMyOw0KPiArCWJhdGNoW2IrK10gPSBQVVJHRUFCTEVfVEVTVF9QQVRURVJOOw0KPiAr
CWJhdGNoW2IrK10gPSBNSV9CQVRDSF9CVUZGRVJfRU5EOw0KPiArDQo+ICsJc3luY29iaiA9IHN5
bmNvYmpfY3JlYXRlKGZkLCAwKTsNCj4gKwlzeW5jWzFdLmhhbmRsZSA9IHN5bmNvYmo7DQo+ICsJ
ZXhlY19xdWV1ZSA9IHhlX2V4ZWNfcXVldWVfY3JlYXRlKGZkLCB2bTIsIGh3ZSwgMCk7DQo+ICsJ
ZXhlYy5leGVjX3F1ZXVlX2lkID0gZXhlY19xdWV1ZTsNCj4gKwlleGVjLmFkZHJlc3MgPSBiYXRj
aF9hZGRyOw0KPiArDQo+ICsJcmV0ID0gX194ZV9leGVjKGZkLCAmZXhlYyk7DQo+ICsJaWd0X2Fz
c2VydF9lcShyZXQsIDApOw0KPiArCWlndF9hc3NlcnQoc3luY29ial93YWl0KGZkLCAmc3luY29i
aiwgMSwgSU5UNjRfTUFYLCAwLCBOVUxMKSk7DQo+ICsNCj4gKwltdW5tYXAoZGF0YSwgZGF0YV9z
aXplKTsNCj4gKwlkYXRhID0geGVfYm9fbWFwKGZkLCBibywgZGF0YV9zaXplKTsNCj4gKwlpZ3Rf
YXNzZXJ0X2VxKGRhdGFbMF0sIFBVUkdFQUJMRV9URVNUX1BBVFRFUk4pOw0KPiArDQo+ICsJLyog
TWFyayBib3RoIFZNQXMgRE9OVE5FRUQgKi8NCj4gKwlyZXRhaW5lZCA9IHhlX3ZtX21hZHZpc2Vf
cHVyZ2VhYmxlKGZkLCB2bTIsIGRhdGFfYWRkcjIsIGRhdGFfc2l6ZSwNCj4gKw0KPiBEUk1fWEVf
Vk1BX1BVUkdFQUJMRV9TVEFURV9ET05UTkVFRCk7DQo+ICsJaWd0X2Fzc2VydF9lcShyZXRhaW5l
ZCwgMSk7DQo+ICsNCj4gKwkvKiBUcmlnZ2VyIHByZXNzdXJlIC0gQk8gc2hvdWxkIGJlIHB1cmdl
ZCAqLw0KPiArCXRyaWdnZXJfbWVtb3J5X3ByZXNzdXJlKGZkLCB2bTEpOw0KPiArDQo+ICsJcmV0
YWluZWQgPSB4ZV92bV9tYWR2aXNlX3B1cmdlYWJsZShmZCwgdm0yLCBkYXRhX2FkZHIyLCBkYXRh
X3NpemUsDQo+ICsNCj4gRFJNX1hFX1ZNQV9QVVJHRUFCTEVfU1RBVEVfV0lMTE5FRUQpOw0KPiAr
CWlndF9hc3NlcnRfZXEocmV0YWluZWQsIDApOw0KPiArDQo+ICsJLyogR1BVIHdvcmtsb2FkIC0g
c2hvdWxkIGZhaWwgb3Igc3VjY2VlZCB3aXRoIE5VTEwgcmViaW5kICovDQo+ICsJYmF0Y2hbM10g
PSBQVVJHRUFCTEVfREVBRF9QQVRURVJOOw0KPiArDQo+ICsJcmV0ID0gX194ZV9leGVjKGZkLCAm
ZXhlYyk7DQo+ICsJLyogRXhlYyBvbiBwdXJnZWQgQk8g4oCUIG1heSBzdWNjZWVkIChzY3JhdGNo
IHJlYmluZCkgb3IgZmFpbCwgYm90aCBPSw0KPiArKi8NCj4gKw0KPiArCW11bm1hcChkYXRhLCBk
YXRhX3NpemUpOw0KPiArCW11bm1hcChiYXRjaCwgYmF0Y2hfc2l6ZSk7DQo+ICsJZ2VtX2Nsb3Nl
KGZkLCBibyk7DQo+ICsJZ2VtX2Nsb3NlKGZkLCBiYXRjaF9ibyk7DQo+ICsJc3luY29ial9kZXN0
cm95KGZkLCBzeW5jb2JqKTsNCj4gKwl4ZV9leGVjX3F1ZXVlX2Rlc3Ryb3koZmQsIGJpbmRfZW5n
aW5lKTsNCj4gKwl4ZV9leGVjX3F1ZXVlX2Rlc3Ryb3koZmQsIGV4ZWNfcXVldWUpOw0KPiArCXhl
X3ZtX2Rlc3Ryb3koZmQsIHZtMSk7DQo+ICsJeGVfdm1fZGVzdHJveShmZCwgdm0yKTsNCj4gK30N
Cj4gKw0KPiAgaW50IGlndF9tYWluKCkNCj4gIHsNCj4gIAlzdHJ1Y3QgZHJtX3hlX2VuZ2luZV9j
bGFzc19pbnN0YW5jZSAqaHdlOyBAQCAtNjA4LDYgKzcxOCwxMiBAQA0KPiBpbnQgaWd0X21haW4o
KQ0KPiAgCQkJYnJlYWs7DQo+ICAJCX0NCj4gDQo+ICsJaWd0X3N1YnRlc3QoInBlci12bWEtcHJv
dGVjdGlvbiIpDQo+ICsJCXhlX2Zvcl9lYWNoX2VuZ2luZShmZCwgaHdlKSB7DQo+ICsJCQl0ZXN0
X3Blcl92bWFfcHJvdGVjdGlvbihmZCwgaHdlKTsNCj4gKwkJCWJyZWFrOw0KPiArCQl9DQo+ICsN
ClJldmlld2VkLWJ5OiBQcmF2YWxpa2EgR3VycmFtIDxwcmF2YWxpa2EuZ3VycmFtQGludGVsLmNv
bT4NCj4gIAlpZ3RfZml4dHVyZSgpIHsNCj4gIAkJeGVfZGV2aWNlX3B1dChmZCk7DQo+ICAJCWRy
bV9jbG9zZV9kcml2ZXIoZmQpOw0KPiAtLQ0KPiAyLjQzLjANCg0K
