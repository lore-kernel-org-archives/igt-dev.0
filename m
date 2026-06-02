Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F5FCD6E4A
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jun 2026 12:19:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A8CD1139E3;
	Tue,  2 Jun 2026 12:19:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AmgJinPF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A5181139E2
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jun 2026 12:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780402734; x=1811938734;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Lby7imO7e80/JtfBqgjLNsugYqOkk6ePe+c6Eg89eVk=;
 b=AmgJinPF6MnlayanWxQxMWWxXf4vzVcyYywG1Kj+CvKXVlQOE4Mrllkv
 j8uf6TmfP++p/Tzv8XNjl1HLcb7t0fF0Fg652oQLtgeQPPJR3wXql2IKG
 Y8ecy1na3PlEhjaaQ7AFGtpIrshwfnNB+pgtJFILAb6/X9miuJu0MnEqC
 AuNazvkIWpquaawYTMkcVPN+rZ5Dbe4rSe59nPMZu0LneypTHT2WNAqOK
 1zhgTmWlCeamyEHyVAiZ2ekHYbSnHEFNpPH5M4Zrm303Gjdx8g09SXe9F
 yJvRTOjf8pGNvAprBv1dsgxIbM+AIY9WrPWRyoxcEazruRNzN1k3xpgvC Q==;
X-CSE-ConnectionGUID: dorurozsTAi8KvmEr/ojkw==
X-CSE-MsgGUID: HUU4z67JRX2ohcSFXn0aSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81047569"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="81047569"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 05:18:53 -0700
X-CSE-ConnectionGUID: wjzgky8+SKy9UWpiHJvOYA==
X-CSE-MsgGUID: AAw8PD7EQ6uauXOGyWGoRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="248967373"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 05:18:53 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 2 Jun 2026 05:18:52 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 2 Jun 2026 05:18:52 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.63) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 2 Jun 2026 05:18:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TC2eGo4wjlcxu0fOZXQQ69c7ev9+0DxtcXKaLk+oihelg5MLIWhwg9WANpoc5yqaR4a1H5j6F8fJknSQ2cMPVTkMrEXlnjcT+XgpyqL/52v9XlKGY7VwOPvzU0yZNZTtDvAwXydNP77tQHjYAp00eeUdhZk5cF1N+oRaW6+XCTzBPa1Rf2+FMthTrSAbitKJKXnHUq5N0yoJHy7iufphDmpLaIsIiNLwh4IYhZvVdKrckyI1fHNj8KuYDS7qbekA6WjIxhWjQXspPj2++peqNwBlkbi5WkrSzCC0k1d/NxiamRTbD8cYMcmAecJfbSNa95dHkQy2a/QZSVmaz1Ebyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lby7imO7e80/JtfBqgjLNsugYqOkk6ePe+c6Eg89eVk=;
 b=KS777NkHyWDbzG6yU8TKia1rvq5U6e5NHHiOh6NtzGlFOu4Fm20qGiClkWJcYsS9U0dxglbuD1vuJjtYS2zgetl1OQVgbgXPfUe6nB5OgjGR71lK1zjs/Exrbvlf0Gy+HYZukGDkb8T2caKGSwtDoQHqIftw7VKp6Nzl7Px/O6RuGxHz+znu1hr3Z7GtTv1R/201JVwmMyJlhG5xaYUJBpWaPdWAJQHAniHIjK+L3CYe+f4I/H1k9M1wH49nKtw5y9nvUk8lSjilwge+ZwpLoKeyOZzmMvTufKj09d7K0Gf7kpU33hbZqNzL0FxUE4y5Tsnyztiz4t67MxRljB2JgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by CY5PR11MB6258.namprd11.prod.outlook.com (2603:10b6:930:25::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Tue, 2 Jun 2026
 12:18:48 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%5]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 12:18:48 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Naladala, Ramanaidu"
 <ramanaidu.naladala@intel.com>
Subject: RE: [PATCH i-g-t v1 2/3] tests/intel/kms_pipe_stress: fix plane
 source crop and separate cursor loop
Thread-Topic: [PATCH i-g-t v1 2/3] tests/intel/kms_pipe_stress: fix plane
 source crop and separate cursor loop
Thread-Index: AQHc7aY1gTwLzlbb9EiPNuHRhAc6/rYqy7oAgABsocA=
Date: Tue, 2 Jun 2026 12:18:48 +0000
Message-ID: <PH7PR11MB6796B555FFFC6F1D69CB647AE5122@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20260527071940.3285269-1-sowmiya.s@intel.com>
 <20260527071940.3285269-3-sowmiya.s@intel.com>
 <14099ad6-d967-4a3b-ac64-999d1006ea0b@intel.com>
In-Reply-To: <14099ad6-d967-4a3b-ac64-999d1006ea0b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: swati2.sharma@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|CY5PR11MB6258:EE_
x-ms-office365-filtering-correlation-id: 34b7cb40-5660-42ae-ff05-08dec0a119ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|10070799003|376014|1800799024|38070700021|11063799006|3023799007|22082099003|18002099003|56012099006|4143699003;
x-microsoft-antispam-message-info: G4iBdzYvAr8o8AgQSAf6Igc0T0DpW8ow7XpPY5Y8tilSzh7cX2QZisIZvprzWZlIJmaOTW/BXBeHnzaAdaAl4ksuLhW5LdNAqYiJUf/VrTLm727Pj5cgTFoH4iqWAxi45L4w+Y3oXeoZ5A5a8C8xNMQ6UoAwaQbhDcD2OBLdqYZCwSWgjR0I5WUjOwxH/r11m8P5iTLsBM50HaTJv2EDkrzI2UEvLxcE4icU4atd8Ni1FMtMCQYb5Y1WM6vac6nqe+5Frh/J/IzMq0KPYtHRdmw/6hgY9KKeN/d+J82gnbP2jaa36vBzlU75YWSqpAzu6gMWqoeU0PxiwNWhVYdD5zrgXlUdYW5nNVTOqosnGUbXzmG0oJhJEdLOj3cyDJHcbuqKApKdq1Gdk0nivb0XVokvwtv8nroFoZmTu5hYN+Ezr9tHZ9vk10J94iEZs9Fot9y/fRpzgbpIo1HoTjUPJNsX18FxTJWTQtGnVfW6S5R/WzIw9pGcn0pblHIHHd4ZHRGnoYvcCz0G0XZq448Yv8n/icMj/HN07i80DP6vkqwNRKfPg9ivbXBbCH2LrbMOemoT9w92xmG+L4v44iEKcESJ9mnItfFcfgOZed3LjMxlomNP2Feo6/CP2qOXLcQo6zjAPQnqcSPBr7pWhSfVk59CaVa/mgMArjBJV92g0JtB+Cb16Qok70CZf7sl4go7REEymBZbNo/xr5H3vJ8bkXhOvK1K3iU8PCviS/0SgM+RZMwT6oJvhgLBFoxOEK4d
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(376014)(1800799024)(38070700021)(11063799006)(3023799007)(22082099003)(18002099003)(56012099006)(4143699003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cVYyVzhZcis1bk0yLzIrT0Y2c3YrWmkzKzduN1V3blhQR0xlM1pMWTdNK0lS?=
 =?utf-8?B?UlNoaGVTUTREaDlzVGpHRjYzR2grbmJnK1Fib3FqUjV5RElIcmJycGlPRkJV?=
 =?utf-8?B?ZnVDSk9razkwclREb05jOUJzZll3QTlkZGFkNEl1TzJybjNVSDVXRmdrUlhL?=
 =?utf-8?B?Tlhhcm1Gcm1BVHBIbys0bTZOMDFMOHA0Rlk2TWZ5Y3BrWlZMNnUvRHJBSk5n?=
 =?utf-8?B?MC8rbEYxV3k1REsvUk9WOCt0QlNCdHRLNjA4dzFvU2x0dTNOTFZwbTlOeDVB?=
 =?utf-8?B?c2Q0MzhaS0syUVVOVHQvQVRmb2ptbU1nNFRUdTJJVUxLdmp1TXg5bXJvTlRi?=
 =?utf-8?B?YmRhaFFIc243Zk9ST1luQVRYdTdQbEJjOVh2ZGpWa041b0RXMG5JNktxQ0dx?=
 =?utf-8?B?Y1d3cEt3alovWTl0alpDUmNmVmhuUDV5Vm9SalNxVVhrMmFaSkExbGNScC9F?=
 =?utf-8?B?TExGbDRNSGdlc21jVDM0MmhRVlNMZDlySS9FRUh1WFRUMXNURHlzRXhPOTF5?=
 =?utf-8?B?RnFYc0dkUUxiMzVZOFM3QUJVanJFNWRMMEo5NVhUS1J6bnRYSUR3MDN4UWw4?=
 =?utf-8?B?cGRVaklpUmV3bldzUDB5dmNTbEhjZkg3UFdnS0dZMmJ4TlkvNklYSnBKMXJ6?=
 =?utf-8?B?eTJJRHprSTl3QnVJQi9Vc3NNQm56TTQ2a0ZhaHNjeTdvWlRZQWZBQzNnOVVL?=
 =?utf-8?B?VElxclQ1c1pBcG5kT1hXSGExSW5vNk1tMG9iUVgvMUxRc2NDaEpuN2wxTU5v?=
 =?utf-8?B?cS9MRUc5VGo5ekVxMW1kaEl5K3Nlbk9LQndVRFhKS0svQzQySklxS3JkY2Q3?=
 =?utf-8?B?TGFZYnNqV3Q1UUs3K1d4M09qU3hpRXpaZWxVbjdzcDhJK2pUb3BtUGJPdkpm?=
 =?utf-8?B?YmtoUFRrNVJLT2YwcDgxRHMwa2RsbUNtQW5LdWN5NUxZUktDa1lLWDRqYmh3?=
 =?utf-8?B?QW5DNE9uemxjc01PSG4yR0xiazlvM0JqQWo3dWZ6T3BwV1FpMHdFWlZEanNU?=
 =?utf-8?B?R3ZFWURTTmpuQno1bWozVU5wZ0c2OTZUOWJidDhNcTVHbmsxZ0FZbVNVUjJC?=
 =?utf-8?B?Q3ZqV2xXV1RDOTQ4aHV5OWluNmZYOTBTb3JSZTVVdk1iYVVUVFZodlRHQzBl?=
 =?utf-8?B?TEw4dkl6dmRnUnFFY3pvZXJDcGlQZ1ZJL1A2dzVKMzJ5aXlxcHM5bWJ3emhQ?=
 =?utf-8?B?YnZwbElVWUN1TUhYRWUrbndNVWRnaldiK09nZUVXVUhDdlZscmhYeUNMTTNR?=
 =?utf-8?B?N2YzREtSSkw5cU1yUkJtR2phZ1h1WkNTSmUweXFTL2ZFQVExNVZheTY2b1kw?=
 =?utf-8?B?Ti9SbGJQNDlJaWVZOFp6TU9jZFJxZ05ONnRPcTBMTzVSdjhNWlNReVNoY1c0?=
 =?utf-8?B?dTNINHM2MVNuYUt2UUN5dnhqN1pPaG1HOFVHUGVneStldzhNTGUzb1lQMy9L?=
 =?utf-8?B?dlVlK0RROGtMa1l1Sm9FVmdHTW14R3ZkRFN6Tm84djVqQ1RZZk1zQWRIUjRa?=
 =?utf-8?B?eTVJc3pHdW01MWNINU5IRlV2NkJMY2VCVkE4OU0vUzZoV2hVcWRyQjAxL21R?=
 =?utf-8?B?U0JTb3l5b0VOSi94ZjVuUVRra2JTN0tXUU0rUjdNM0xUbHF6clcxM3NUV1Zz?=
 =?utf-8?B?V3BLaDdGcjc3YkNiVndVVWdUR3BVbHBISHRIT1FFOU9DNXYzRWszNGIzNXhi?=
 =?utf-8?B?dHBPK3loM3E1aXBwakJ4UzVtUFlENW0yVlFXa3B6czdwbGNlMkE2UGtGRVUv?=
 =?utf-8?B?bWdmRUZxVlB6M2x6RE8rRkIrTTR6ZGczUFY5dmhyUnZGb3pBRXhqVjhEM0dQ?=
 =?utf-8?B?a3FQTmxQQ01JL1hhNUFFYlZhZHBPWGpWQUZWN1RpaEFpa0tJYlB3bzZOMnhQ?=
 =?utf-8?B?SDBoVkhpYTFrZHhudWZXOFQzUjhtREJscG91VjVIbFBNU3hVcHlyOUo1NDN0?=
 =?utf-8?B?S0FuTThxb2NjeW90cDVrVzRHcmgvMWhhZ3NOUUtMNGpqb2ZxTWdPU0k1NWZE?=
 =?utf-8?B?aFE5VmlhM0c0MTFqQTJWdUt1dHRocnBBcDZYWVhJcW02NTg2Y0xrVE0wRDFY?=
 =?utf-8?B?MmY4eEVRZ1RLdmU0ZXpMZHVKZWV2ZU8xR0N4K3BlN2M2a05xaWR1TnVxdHBH?=
 =?utf-8?B?bHpNQy92b0RST0o5ZVNRTHRTRUJyZWd1eEVpZTZPNHRuRnFQcXk0TjFyY2Zz?=
 =?utf-8?B?V2t0Wi9tbWR6L0JncWo3OVo0b1R1Q1YrZytoeEJHbGxFOVVDTGF1M2RjeGJi?=
 =?utf-8?B?eTJhTEp0eVJVY3ltblREWkFBMEtUSzFmbkR2UE5DTE9obTB2QjJqbTAvRnFM?=
 =?utf-8?B?TzFrSzRxRm9PeHB3dUdtQWFNMHd6b1JBUXVlQlVKbWtHUnZQK3NLZEZGQjMv?=
 =?utf-8?Q?bblnIWCDCgdXoC90k20nEB22GpJBDd1jPkvJ1?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: roBXeXUmCgA/IgIWrk+lnFCiuuU6CxYivCw+l/xdBudGgr6yS8K3Y5nmGytZJbwIGTeU37+Lzf4M1Co7HziE2VSDISZs1UUahF6vR+sZIxSY+LCdYeKJSWHIz/HzJxpCQtK0suqYrZjYIUzkEW/QHuQ3ti0knZMYt1K671guX7H0E/N1iEdVkAsjJlONVwvhQbrygr19YTOHY28VMh54Q5Q9CEeYk2lf9GZmd8Eq2Qyhx27hWQSIkvdZA4ZxDzRAbnq/9UJLbVyDSxQnrlk9fCqfgvx11iifgPn5ZFuGVuW6lssyVM/qe3/Gc2HYo/Hnp8wgzSDPeOjZe/Qn/dU+wQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34b7cb40-5660-42ae-ff05-08dec0a119ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2026 12:18:48.5698 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KMzok6bN+2VK85FgF70+miQDSbVK1NH9K91Gn99rCGsH7e1k10ukxgsw6X94kqor73H/HPJ1nRpgNx/sPFAJKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6258
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

SGkgQFNoYXJtYSwgU3dhdGkyLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZy
b206IFNoYXJtYSwgU3dhdGkyIDxzd2F0aTIuc2hhcm1hQGludGVsLmNvbT4NCj4gU2VudDogMDIg
SnVuZSAyMDI2IDExOjE5DQo+IFRvOiBTLCBTb3dtaXlhIDxzb3dtaXlhLnNAaW50ZWwuY29tPjsg
aWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEIgUywgS2FydGhpayA8a2FydGhp
ay5iLnNAaW50ZWwuY29tPjsgTmFsYWRhbGEsIFJhbWFuYWlkdQ0KPiA8cmFtYW5haWR1Lm5hbGFk
YWxhQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCBpLWctdCB2MSAyLzNdIHRlc3Rz
L2ludGVsL2ttc19waXBlX3N0cmVzczogZml4IHBsYW5lIHNvdXJjZQ0KPiBjcm9wIGFuZCBzZXBh
cmF0ZSBjdXJzb3IgbG9vcA0KPiANCj4gSGkgU293bWl5YQ0KPiANCj4gT24gMjctMDUtMjAyNiAx
Mjo0OSBwbSwgU293bWl5YSBTIHdyb3RlOg0KPiA+IFBhc3MgMy80IGRlc3RpbmF0aW9uIHNpemUg
YXMgaW5pdGlhbCBzb3VyY2UgY3JvcCB0bw0KPiA+IHVuaXZlcnNhbF9wbGFuZV9zZXRfZmIoKSB0
byBhdm9pZCBhbiBpbW1lZGlhdGUgZG93bnNjYWxlLiBLZWVwIHNvdXJjZQ0KPiA+IGluIHN5bmMg
d2l0aCBpZ3RfZmJfc2V0X3NpemUoKSBpbiB0aGUgcmVkdWN0aW9uIGxvb3Agc28gdGhlIGRvd25z
Y2FsZQ0KPiA+IHJhdGlvIG5ldmVyIGV4Y2VlZHMgdGhlIGhhcmR3YXJlIGxpbWl0ICh+M3gpLg0K
PiA+DQo+ID4gTW92ZSBjdXJzb3IgaGFuZGxpbmcgb3V0IG9mIHRoZSBvdmVybGF5IGxvb3AgaW50
byBhIGRlZGljYXRlZCBzZWNvbmQNCj4gPiBmb3JfZWFjaF9wbGFuZV9vbl9jcnRjIGxvb3Agd2l0
aCBhIERSTV9NT0RFX0FUT01JQ19URVNUX09OTFkNCj4gY29tbWl0LklmDQo+ID4gdGhlIHRlc3Qg
Y29tbWl0IHJlamVjdHMgdGhlIGN1cnNvciAoZS5nLiB1bnN1cHBvcnRlZCBmb3JtYXQgb3INCj4g
PiBtb2RpZmllciksIGRpc2FibGUgaXQgZ3JhY2VmdWxseSBzbyB0aGUgZmluYWwgY29tbWl0IHdp
dGggb25seSBvdmVybGF5DQo+ID4gcGxhbmVzIGNhbiBzdWNjZWVkLg0KPiBQbGVhc2Ugc3BsaXQg
dGhlIHBhdGNoIGludG8gMg0KVGhleSBhcmUgbG9naWNhbGx5IGluc2VwYXJhYmxlIOKAlCBib3Ro
IGZpeCB0aGUgcGxhbmUgbG9vcCB0aGF0IG9ubHkgYmVjYW1lIHJlYWNoYWJsZSBhZnRlciAwMDAx
LiBTcGxpdHRpbmcgdGhlbSB2aW9sYXRlcyBpbmRlcGVuZGVudC1hcHBsaWNhYmlsaXR5IGJlY2F1
c2UgMDAwMiBhbG9uZSBsZWF2ZXMgdGhlIGN1cnNvciBjb21taXQgdW5ndWFyZGVkLiBUaGUgc2Vy
aWVzIHNob3VsZCBzdGF5IGFzIHRocmVlIHBhdGNoZXMNCg0KUmVnYXJkcywNClNvd21peWEuDQo+
ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBTb3dtaXlhIFMgPHNvd21peWEuc0BpbnRlbC5jb20+DQo+
ID4gLS0tDQo+ID4gICB0ZXN0cy9pbnRlbC9rbXNfcGlwZV9zdHJlc3MuYyB8IDExMCArKysrKysr
KysrKysrKysrKysrKystLS0tLS0tLS0tLS0tDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgNjggaW5z
ZXJ0aW9ucygrKSwgNDIgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMv
aW50ZWwva21zX3BpcGVfc3RyZXNzLmMNCj4gPiBiL3Rlc3RzL2ludGVsL2ttc19waXBlX3N0cmVz
cy5jIGluZGV4IDg3MjRhNjc0Yy4uYTg0NDMzYjlkIDEwMDY0NA0KPiA+IC0tLSBhL3Rlc3RzL2lu
dGVsL2ttc19waXBlX3N0cmVzcy5jDQo+ID4gKysrIGIvdGVzdHMvaW50ZWwva21zX3BpcGVfc3Ry
ZXNzLmMNCj4gPiBAQCAtNDI1LDU3ICs0MjUsODMgQEAgc3RhdGljIGludCBjcnRjX3N0cmVzcyhz
dHJ1Y3QgZGF0YSAqZGF0YSwgaWd0X291dHB1dF90DQo+ICpvdXRwdXQsDQo+ID4gICAJaWYgKCFk
YXRhLT5udW1fcGxhbmVzW2NydGMtPnBpcGVdIHx8ICFuZXdfbW9kZSkNCj4gPiAgIAkJcmV0dXJu
IDA7DQo+ID4NCj4gPiAtCWZvcl9lYWNoX3BsYW5lX29uX2NydGMoY3J0YywNCj4gPiAtCQkJICAg
ICAgIHBsYW5lKSB7DQo+ID4gKwkvKiBTZXQgdXAgb3ZlcmxheS9wcmltYXJ5IHBsYW5lcyB1cCB0
byB0aGUgY29uZmlndXJlZCBsaW1pdC4gKi8NCj4gPiArCWZvcl9lYWNoX3BsYW5lX29uX2NydGMo
Y3J0YywgcGxhbmUpIHsNCj4gPiAgIAkJaW50IHBsYW5lX3dpZHRoLCBwbGFuZV9oZWlnaHQ7DQo+
ID4gLQkJaWYgKHBsYW5lLT50eXBlID09IERSTV9QTEFORV9UWVBFX0NVUlNPUikgew0KPiA+IC0J
CQljdXJzb3JfcGxhbmVfc2V0X2ZiKHBsYW5lLA0KPiA+IC0JCQkJCSAgICAmZGF0YS0+Y3Vyc29y
X2ZiW2NydGMtPnBpcGVdLA0KPiA+IC0JCQkJCSAgICBjdXJzb3Jfd2lkdGgsIGN1cnNvcl9oZWln
aHQpOw0KPiA+IC0JCQlwbGFuZV93aWR0aCA9IGN1cnNvcl93aWR0aDsNCj4gPiAtCQkJcGxhbmVf
aGVpZ2h0ID0gY3Vyc29yX2hlaWdodDsNCj4gPiAtCQl9IGVsc2Ugew0KPiA+IC0JCQl1bml2ZXJz
YWxfcGxhbmVfc2V0X2ZiKHBsYW5lLA0KPiA+IC0JCQkJCSAgICAgICAmZGF0YS0+ZmJbY3J0Yy0+
cGlwZSAqDQo+IE1BWF9QTEFORVMgKyBpXSwNCj4gPiAtCQkJCQkgICAgICAgbW9kZS0+aGRpc3Bs
YXksIG1vZGUtPnZkaXNwbGF5KTsNCj4gPg0KPiA+IC0JCQlwbGFuZV93aWR0aCA9IChtb2RlLT5o
ZGlzcGxheSAqIDMpIC8gNDsNCj4gPiAtCQkJcGxhbmVfaGVpZ2h0ID0gKG1vZGUtPnZkaXNwbGF5
ICogMykgLyA0Ow0KPiA+ICsJCWlmIChwbGFuZS0+dHlwZSA9PSBEUk1fUExBTkVfVFlQRV9DVVJT
T1IpDQo+ID4gKwkJCWNvbnRpbnVlOw0KPiA+DQo+ID4gLQkJCXJldCA9IHRyeV9wbGFuZV9zY2Fs
aW5nKGRhdGEsIHBsYW5lLCBwbGFuZV93aWR0aCwNCj4gcGxhbmVfaGVpZ2h0KTsNCj4gPiArCQlw
bGFuZV93aWR0aCA9IChtb2RlLT5oZGlzcGxheSAqIDMpIC8gNDsNCj4gPiArCQlwbGFuZV9oZWln
aHQgPSAobW9kZS0+dmRpc3BsYXkgKiAzKSAvIDQ7DQo+ID4NCj4gPiAtCQkJd2hpbGUgKHJldCkg
ew0KPiA+IC0JCQkJaWYgKHBsYW5lX3dpZHRoIDw9IGN1cnNvcl93aWR0aCB8fA0KPiBwbGFuZV9o
ZWlnaHQgPD0gY3Vyc29yX2hlaWdodCkNCj4gPiAtCQkJCQlicmVhazsNCj4gPiArCQkvKg0KPiA+
ICsJCSAqIFNldCB0aGUgc291cmNlIGNyb3AgdG8gbWF0Y2ggdGhlIGluaXRpYWwgZGVzdGluYXRp
b24NCj4gPiArCQkgKiBzaXplIChubyB1cHNjYWxpbmcpLiAgS2VlcGluZyBzb3VyY2UgPT0gZGVz
dGluYXRpb24NCj4gPiArCQkgKiBwcmV2ZW50cyB0aGUgZG93bnNjYWxlIHJhdGlvIGZyb20gZXhj
ZWVkaW5nIHRoZQ0KPiA+ICsJCSAqIGhhcmR3YXJlIGxpbWl0ICh+M8OXKSB3aGVuIHRoZSBkZXN0
aW5hdGlvbiBpcyBoYWx2ZWQNCj4gPiArCQkgKiBpbiB0aGUgcmVkdWN0aW9uIGxvb3AgYmVsb3cu
DQo+ID4gKwkJICovDQo+ID4gKwkJdW5pdmVyc2FsX3BsYW5lX3NldF9mYihwbGFuZSwNCj4gPiAr
CQkJCSAgICAgICAmZGF0YS0+ZmJbY3J0Yy0+cGlwZSAqIE1BWF9QTEFORVMgKyBpXSwNCj4gPiAr
CQkJCSAgICAgICBwbGFuZV93aWR0aCwgcGxhbmVfaGVpZ2h0KTsNCj4gPg0KPiA+IC0JCQkJcGxh
bmVfd2lkdGggLz0gMjsNCj4gPiAtCQkJCXBsYW5lX2hlaWdodCAvPSAyOw0KPiA+ICsJCXJldCA9
IHRyeV9wbGFuZV9zY2FsaW5nKGRhdGEsIHBsYW5lLCBwbGFuZV93aWR0aCwNCj4gcGxhbmVfaGVp
Z2h0KTsNCj4gPg0KPiA+IC0JCQkJcmV0ID0gdHJ5X3BsYW5lX3NjYWxpbmcoZGF0YSwgcGxhbmUs
DQo+IHBsYW5lX3dpZHRoLCBwbGFuZV9oZWlnaHQpOw0KPiA+ICsJCXdoaWxlIChyZXQpIHsNCj4g
PiArCQkJaWYgKHBsYW5lX3dpZHRoIDw9IGN1cnNvcl93aWR0aCB8fCBwbGFuZV9oZWlnaHQgPD0N
Cj4gY3Vyc29yX2hlaWdodCkNCj4gPiArCQkJCWJyZWFrOw0KPiA+DQo+ID4gLQkJCQlpZ3RfaW5m
bygiUmVkdWNlZCBwbGFuZSAlZCBzaXplIHRvICVkeCVkXG4iLA0KPiA+IC0JCQkJCSBwbGFuZS0+
aW5kZXgsIHBsYW5lX3dpZHRoLA0KPiBwbGFuZV9oZWlnaHQpOw0KPiA+IC0JCQl9DQo+ID4gLQkJ
CWlmIChyZXQpIHsNCj4gPiAtCQkJCWlndF9pbmZvKCJQbGFuZSAlZCBwaXBlICVkIHRyeSBjb21t
aXQgZmFpbGVkLA0KPiBleGl0aW5nXG4iLCBpLA0KPiA+IC0JCQkJCSBjcnRjLT5waXBlKTsNCj4g
PiAtCQkJCWRhdGEtPm51bV9wbGFuZXNbY3J0Yy0+cGlwZV0gPSBpOw0KPiA+IC0JCQkJaWd0X2lu
Zm8oIk1heCBudW0gcGxhbmVzIGZvciBwaXBlICVkIHNldCB0bw0KPiAlZFxuIiwNCj4gPiAtCQkJ
CQkgY3J0Yy0+cGlwZSwgaSk7DQo+ID4gLQkJCQkvKg0KPiA+IC0JCQkJICogV2UgaGF2ZSBub3cg
ZGV0ZXJtaW5lZCBtYXggYW1vdW50IG9mDQo+IGZ1bGwgc2l6ZWQgcGxhbmVzLCB3ZSB3aWxsIGp1
c3QNCj4gPiAtCQkJCSAqIGtlZXAgaXQgaW4gbWluZCBhbmQgYmUgc21hcnRlciBuZXh0IHRpbWUu
DQo+IEFsc28gbGV0cyByZW1vdmUgdW5uZWVkZWQgZmJzLg0KPiA+IC0JCQkJICogRG9uJ3QgZGVz
dHJveSBjdXJzb3JfZmIgYXMgd2lsbCB0YWtlIGNhcmUNCj4gYWJvdXQgaXQgYXQgdGhlIGVuZC4N
Cj4gPiAtCQkJCSAqLw0KPiA+ICsJCQlwbGFuZV93aWR0aCAvPSAyOw0KPiA+ICsJCQlwbGFuZV9o
ZWlnaHQgLz0gMjsNCj4gPiArDQo+ID4gKwkJCS8qIEtlZXAgc291cmNlIGNyb3AgaW4gc3luYyB3
aXRoIHRoZSByZWR1Y2VkDQo+IGRlc3RpbmF0aW9uLiAqLw0KPiA+ICsJCQlpZ3RfZmJfc2V0X3Np
emUoJmRhdGEtPmZiW2NydGMtPnBpcGUgKiBNQVhfUExBTkVTICsNCj4gaV0sDQo+ID4gKwkJCQkJ
cGxhbmUsIHBsYW5lX3dpZHRoLCBwbGFuZV9oZWlnaHQpOw0KPiA+ICsNCj4gPiArCQkJcmV0ID0g
dHJ5X3BsYW5lX3NjYWxpbmcoZGF0YSwgcGxhbmUsIHBsYW5lX3dpZHRoLA0KPiBwbGFuZV9oZWln
aHQpOw0KPiA+ICsNCj4gPiArCQkJaWd0X2luZm8oIlJlZHVjZWQgcGxhbmUgJWQgc2l6ZSB0byAl
ZHglZFxuIiwNCj4gPiArCQkJCSBwbGFuZS0+aW5kZXgsIHBsYW5lX3dpZHRoLCBwbGFuZV9oZWln
aHQpOw0KPiA+ICsJCX0NCj4gPiArCQlpZiAocmV0KSB7DQo+ID4gKwkJCWlndF9pbmZvKCJQbGFu
ZSAlZCBwaXBlICVkIHRyeSBjb21taXQgZmFpbGVkLA0KPiBleGl0aW5nXG4iLCBpLA0KPiA+ICsJ
CQkJIGNydGMtPnBpcGUpOw0KPiA+ICsJCQlkYXRhLT5udW1fcGxhbmVzW2NydGMtPnBpcGVdID0g
aTsNCj4gPiArCQkJaWd0X2luZm8oIk1heCBudW0gcGxhbmVzIGZvciBwaXBlICVkIHNldCB0byAl
ZFxuIiwNCj4gPiArCQkJCSBjcnRjLT5waXBlLCBpKTsNCj4gPiArCQkJLyoNCj4gPiArCQkJICog
V2UgaGF2ZSBub3cgZGV0ZXJtaW5lZCBtYXggYW1vdW50IG9mIGZ1bGwgc2l6ZWQNCj4gcGxhbmVz
LCB3ZSB3aWxsIGp1c3QNCj4gPiArCQkJICoga2VlcCBpdCBpbiBtaW5kIGFuZCBiZSBzbWFydGVy
IG5leHQgdGltZS4gQWxzbyBsZXRzDQo+IHJlbW92ZSB1bm5lZWRlZCBmYnMuDQo+ID4gKwkJCSAq
IERvbid0IGRlc3Ryb3kgY3Vyc29yX2ZiIGFzIHdpbGwgdGFrZSBjYXJlIGFib3V0IGl0IGF0DQo+
IHRoZSBlbmQuDQo+ID4gKwkJCSAqLw0KPiA+ICsJCQlpZ3RfcGxhbmVfc2V0X2ZiKHBsYW5lLCBO
VUxMKTsNCj4gPiArCQkJY2xlYW51cF9wbGFuZV9mYnMoZGF0YSwgY3J0YywgaSwgTUFYX1BMQU5F
Uyk7DQo+ID4gKwkJfQ0KPiA+ICsNCj4gPiArCQlpZiAoKytpID49IGRhdGEtPm51bV9wbGFuZXNb
Y3J0Yy0+cGlwZV0pDQo+ID4gKwkJCWJyZWFrOw0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArCS8qDQo+
ID4gKwkgKiBBbHdheXMgYXR0ZW1wdCB0byBlbmFibGUgdGhlIGN1cnNvciBwbGFuZS4gIEZpcnN0
IHZhbGlkYXRlIGl0IHdpdGgNCj4gPiArCSAqIGEgVEVTVF9PTkxZIGNvbW1pdDogc29tZSBmb3Jt
YXQvbW9kaWZpZXIgY29tYmluYXRpb25zIChlLmcuDQo+ID4gKwkgKiBYUkdCODg4OCwgNC10aWxl
ZCkgYXJlIG5vdCBhY2NlcHRlZCBieSB0aGUgY3Vyc29yIGhhcmR3YXJlLg0KPiA+ICsJICogSWYg
dGhlIHRlc3QgY29tbWl0IHJlamVjdHMgdGhlIGN1cnNvciwgZ3JhY2VmdWxseSBkaXNhYmxlIGl0
IHNvDQo+ID4gKwkgKiB0aGUgZmluYWwgYWN0dWFsIGNvbW1pdCB3aXRoIG9ubHkgb3ZlcmxheSBw
bGFuZXMgY2FuIHN1Y2NlZWQuDQo+ID4gKwkgKi8NCj4gPiArCWZvcl9lYWNoX3BsYW5lX29uX2Ny
dGMoY3J0YywgcGxhbmUpIHsNCj4gPiArCQlpZiAocGxhbmUtPnR5cGUgPT0gRFJNX1BMQU5FX1RZ
UEVfQ1VSU09SKSB7DQo+ID4gKwkJCWN1cnNvcl9wbGFuZV9zZXRfZmIocGxhbmUsDQo+ID4gKwkJ
CQkJICAgICZkYXRhLT5jdXJzb3JfZmJbY3J0Yy0+cGlwZV0sDQo+ID4gKwkJCQkJICAgIGN1cnNv
cl93aWR0aCwgY3Vyc29yX2hlaWdodCk7DQo+ID4gKwkJCWlmIChpZ3RfZGlzcGxheV90cnlfY29t
bWl0X2F0b21pYygmZGF0YS0+ZGlzcGxheSwNCj4gPiArDQo+IERSTV9NT0RFX0FUT01JQ19URVNU
X09OTFkgfA0KPiA+ICsNCj4gRFJNX01PREVfQVRPTUlDX0FMTE9XX01PREVTRVQsIE5VTEwpKSB7
DQo+ID4gICAJCQkJaWd0X3BsYW5lX3NldF9mYihwbGFuZSwgTlVMTCk7DQo+ID4gLQkJCQljbGVh
bnVwX3BsYW5lX2ZicyhkYXRhLA0KPiA+IC0JCQkJCQkgIGNydGMsDQo+ID4gLQkJCQkJCSAgaSwN
Cj4gPiAtCQkJCQkJICBNQVhfUExBTkVTKTsNCj4gPiArCQkJCWlndF9pbmZvKCJDdXJzb3IgZmIg
bm90IHN1cHBvcnRlZCBieSBodw0KPiAoZm9ybWF0L21vZGlmaWVyKSwNCj4gPiArZGlzYWJsaW5n
XG4iKTsNCj4gPiAgIAkJCX0NCj4gPiAtDQo+ID4gLQkJCWlmICgrK2kgPj0gZGF0YS0+bnVtX3Bs
YW5lc1tjcnRjLT5waXBlXSkNCj4gPiAtCQkJCWJyZWFrOw0KPiA+ICsJCQlicmVhazsNCj4gPiAg
IAkJfQ0KPiA+ICAgCX0NCj4gPg0K
