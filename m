Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C571CD37B1
	for <igt-dev@archiver.kernel.org>; Tue,  3 Sep 2024 20:55:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9C9710E48D;
	Tue,  3 Sep 2024 20:55:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lEnBwcLh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 375AB10E48D
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Sep 2024 20:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725396948; x=1756932948;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=mqdXFwmQrfl0nmqrQ3mdLMVfwIgX4RfcDIUFln7jFao=;
 b=lEnBwcLhvMvy+H2wuUGXJJzgcpi6DnDXniovFi36tMBeRTsw0pFaFhBJ
 raA6ADnq2rttUOBQR2OD3k3KvIy/J9ilB+Htq5aCZ18bxk8xXX7hvV2HQ
 Nk+J+oBhRqhgjVWN1vZpTlnecpn+8RYdrwGeurzZhWH+A77Tihl90AyUY
 9pXRe26T0OFP3pEGZA0mEbz5/gouBirxdoH8/muiw++1CL7BGP+fOK/KD
 SHC3a8l2b+ryLmALTBgxYVupCGYNAELgF6hQPpetbAO8Y92HIq8cTM1qw
 L7K+SViM8HcB/2uwc1XmWWPymGovyHkH9aHEDdZe7t+AvgvnCYCy15Unx w==;
X-CSE-ConnectionGUID: ufV/qTakRpmEwYHIx/GAfg==
X-CSE-MsgGUID: zNGmWgAsQ8aN0THcVBBWeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="34687869"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; d="scan'208";a="34687869"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 13:55:48 -0700
X-CSE-ConnectionGUID: UrXl1rT/SJO4RR8S7XD6Sg==
X-CSE-MsgGUID: ksKPYM7MTRepfDtO0CnNng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; d="scan'208";a="69823935"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Sep 2024 13:55:47 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Sep 2024 13:55:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Sep 2024 13:55:46 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 3 Sep 2024 13:55:46 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 3 Sep 2024 13:55:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iP0oP+ZOR0f8S0Wv/yPLtzSl+M4OMqk7UHWqHxmU5yy1E7SDv9xO1dvQAhzlvkM9zwyPjNZrOfQ7Y7AUy8O0Egey2au7Kyg009+Fni64TzST4WOX6ievrzoj5L0VMYVMkI1T+MedgaBzMYnHWczSOKQ4vDDptn7sWmbne9LFGq8lIXV2DiJYr3OD5vayWhTPAQPkeHNkXd82sEuE6y7CqBZ/dKZ0u8ZPfVVhn8lhNOUVmgeYfFgXnmc0rHMsqvmK4LlkOMDvVzvnGGuJ7gtKedDsv1wWxMEoCZQdvvOr3KME95rhThiMiYnuEL3OjZzD3/EfBqX07xttaZXfSPVYIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mqdXFwmQrfl0nmqrQ3mdLMVfwIgX4RfcDIUFln7jFao=;
 b=xy132LcAZJQCNvW/hmwJEMHMYpDpth+hu3Mg55HFAHCkUxv81MqAB6aCJ5//IT/RmcyukynBt5bsjBueekNuYyodgBNwBWgm0n/aQ6u9EI85Iy+OwccbVyW46VV/umKJhwnItL4LG2aCyFkSZlRW4qxB7OUzk4u/LiAGCWXXqWJwqT6r2b7O+BhQ/iGkW4MeL5L2rQUnHTItnf11ZWbyHEXzJKVovST0XbXMShptEh2H71VBSKGn2BuCAvjwM9AAEdsjEQV4WBp6itQZtavm4NOTQYRFnF0Un9IXD9vq6XZ+sVkQTxwy1S3OxS6XiopVx4tGHuexM+K62blRoj+llQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CO1PR11MB4945.namprd11.prod.outlook.com (2603:10b6:303:9c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Tue, 3 Sep
 2024 20:55:44 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%4]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 20:55:44 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v2 3/4] xe/oa: Update scripts to support BMG
Thread-Topic: [PATCH i-g-t v2 3/4] xe/oa: Update scripts to support BMG
Thread-Index: AQHa/gS2uQAAaL6ASk+FK5SXL6VdirJGeY+AgAARrYA=
Date: Tue, 3 Sep 2024 20:55:44 +0000
Message-ID: <19471d8a8cd72221fc28795f5e54a66e1e1056ab.camel@intel.com>
References: <20240903132436.8337-1-jose.souza@intel.com>
 <20240903132436.8337-3-jose.souza@intel.com>
 <875xrczf9i.wl-ashutosh.dixit@intel.com>
In-Reply-To: <875xrczf9i.wl-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CO1PR11MB4945:EE_
x-ms-office365-filtering-correlation-id: 0b62dc3c-cf94-473e-edd6-08dccc5ac739
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?QTBmeVNlVzNaOUNxZk1xU1JiODNBc21TcDd0WkRsK1ljNjVMUDk0bTVOSEZN?=
 =?utf-8?B?MXRaLzJBUDB6aSt5RTA4Vjc5NVl1czJhZ1BHZ0NrRWFFK0ZNeGp4Ymt4azV0?=
 =?utf-8?B?NTh1Rk5TeC9ORDdGVDRiREtoaGFFRTJvY2xWVllILzJIaVZYR1Q4OEpVcW1l?=
 =?utf-8?B?N2luNWJJTncwYVVwNXRPZktuVFRjYVVYZURJeGIwSldmMUhBMHdiSWU4WWZQ?=
 =?utf-8?B?aHlXUGVmaVI0OHNJVmQvTlNSWkJzUUtHUXlwOU5iUm14aVRWVFp3cEhNMGdx?=
 =?utf-8?B?NW5PRjV3MVFhc3ZrT3NkODJleStlYlpkRDF1M05rRTl4Tk0xQlZoc0RtaVpz?=
 =?utf-8?B?d0JkYTdRVWNRZGJTbnYwbUVXclpSdjhqZ01KaFRTbWJNYTBKM3lvRVNwTTQx?=
 =?utf-8?B?TFV5NjU0UFZsSitUZ0dGWTJkb0pkZjE4WW03NWFDMkZ1Y2dHYmM1YU1ad242?=
 =?utf-8?B?aWYyeDJhN0VJbVNHZlV4R1A5NDUrTGl0WHEra1VkVnVqYzIvOG1UUFd1OEMv?=
 =?utf-8?B?elUrWWZFUytEMFltNzBYQmN3VjV0aVZVVWFNaGQxRFc1WFI3RGFVWTBCU2JB?=
 =?utf-8?B?YUo0K2xXWk1idnhrYjhQdlZ0UVlsK0p0alFQMXQzVHhZdldINXVDejlpQ1NM?=
 =?utf-8?B?cWtHRXdIeE9rb2dZdlhTV2tudkNhVERoZldLU0dEQmcwTERrblBmOFdldXJq?=
 =?utf-8?B?VlZZUzIwZklLM0NLd0VDMUVZR0xVRDBkR2VTa1ZxeUdGbkF1US9DT1VUY1pB?=
 =?utf-8?B?TWd0ZnMzYTBITzMzRVJFcllRK21kNnJwZ0JJdksrM01PaFdDTGt6R2haajEv?=
 =?utf-8?B?cENZUWV0eE5BZnF2Y0IvQmVmSzVuWWhyVEZ6MCtNaVBOZTVKaFBiQm1abWxa?=
 =?utf-8?B?YVFnSlB2TmwzSzI3akZGRW5aczQ1TGFZV2grS09Ba3I3R2pDUm9ZQmxBcXBT?=
 =?utf-8?B?ZWc1WTA5c0FiNnVSdmJhOG8vMlhXWlBvMG5ybG5tZnFRN0srTHNxREFNckFy?=
 =?utf-8?B?WGFZWThudE9GU2t5YzdaQmMzVnRBc3VhYXJzMWw0MGFpZTJvWlloTFVVVFl0?=
 =?utf-8?B?SDNNY1c5U3QyVDY4ZUtyRmpFTFg1MEdlNlBHdkh0bTJsTzBlVHUyMTJNZm1M?=
 =?utf-8?B?VGc2K0R4ck9UZEpQZ3pobXliejd2NDlkRDZnNW9scTNIZVk3NTFCTVV2MlhS?=
 =?utf-8?B?MTBoUE9yb29DeTdTVnlxTlMvR1VVUFI2TFJrSmJJdFRqemJ1NE8yMGtaNDlZ?=
 =?utf-8?B?QnRIbjduUmlkOU5wbkpJUkd0ZC9JWmRlSHc1V3F4SFdieGpMOUFwMlk3Y3ho?=
 =?utf-8?B?eE91RnJrOUVNdVNyYUp5ZUxlUFJBeWJtNWVoZWEyWmpkSzVhR3FPems4Z1Jm?=
 =?utf-8?B?cm9MKzBYZTFTb2l0MmdxZnNzOUlNSjRYSzBoYXlMSUhxdDJqNktRT0hGVWRG?=
 =?utf-8?B?aTI2L0NnRzJjMkk2QkdjaUFBMjlqdlh4ZjVEbXJCUHRpUWFraU5vdjh1KzRH?=
 =?utf-8?B?UEVNSXB4aWxQNXdUM2h3cjBhRHVoK201elpOQ1llR0ZNcklTcUNqellKUEdX?=
 =?utf-8?B?aXpNWTduU3BSSGl3SmljTkRqNDQrQ1IyOUwzcndLRGx4azVpTmFrNkkxdkFF?=
 =?utf-8?B?TTVTZmVIZU5RUDdQQnN0aWVScnd6MWVXcC80TTJMMUM4OG9hVk1tUm9laFVW?=
 =?utf-8?B?b2NTNk9ZOFNDeWZUK0pSdTdpN0tjTkNOQmNDVURRVEdtS1hHOGJaQjNaREpF?=
 =?utf-8?B?WG90aGVidGdaeXo0VTcrT0wydEF3MExQYTVLVVRaV2xEVVN6WEtBRERrSFp6?=
 =?utf-8?B?M2YvWWNFaFUraW1LMUd0YUd4ZWVTRDNmS2liZGN4TFY4d1F1REMvTHQ4dWcy?=
 =?utf-8?B?VHo2VWI5WWxwUmhqOWhUY2w5K0VtN25wcERXYW9FN0k5V0E9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TmdOcDM3VUtkNEpKblRqWmJWT25JamFwZ2ZDYUhjY255WHZqVGd0QzFRbEdi?=
 =?utf-8?B?UzV3OG9IOEFYVUhMWjd5VHFPYTU2K1YvNDBZRmdWQ2lGaVl0VVZNSWxtZmI5?=
 =?utf-8?B?TjR0NGUzZGs0U3orSHdDZE1tcTVBV0MzRmZmVkJERW16MDdTWnhLT2dJbTlo?=
 =?utf-8?B?bGhTQzlHTjM1b0hZWWtqQS90cnNDMDFCaitLYUdRcGcvYXV6MFUxemRUeHBP?=
 =?utf-8?B?WkJBVVUyMDRJOGFndXNzeWg1aVhIOVhWVEhnVXRoYVUxOGlvTjNkN3ZjT2pp?=
 =?utf-8?B?aFpqTG9ySCs2ejhBV0EyZElQUWtSS0pJZXA1WVpFUk40a1lnZy9jVGNaaWVL?=
 =?utf-8?B?a01uVk5Ea2dMaFZOQVhzd0NYakxxdjBXUkFodks2d2FNNzJLUEd2Z1ZnUHhZ?=
 =?utf-8?B?NGdkNXUrd0N4Y3d2dU02N1lKMWZVVWxqbklWVFhKeGIrYzVlNG1nc3J3WWtK?=
 =?utf-8?B?M3NWVWFMRzVjeDhRNG9ZcHFHOUZrbktTWkhIZVJaRUYyUVA4QW5hZFJYclhL?=
 =?utf-8?B?Vlh0ZFpERmJOeGF0dHU2NUM1anZDd0RiRXhBNHFFNWo1a0g2Q3pyMGdYK2xw?=
 =?utf-8?B?Tmc0Y1NmdzRjbFcwM2w0NUhCek5ZM25wVGtac3BGdDF3c2VjbXVhemd3VTdG?=
 =?utf-8?B?ekRtSy9pb3RCZUJKeFlFSnd4Y1FycStmZDZJS2Vsem9vU3pLaDdwRUFZODRa?=
 =?utf-8?B?cDhWTnplc0wxOXpvUDJMVitoa2o4MGNOMnhHVWp5WjNWTFo3bnh6aERUZGhj?=
 =?utf-8?B?RHQ5bW0zajVsOG9KT1JKL3BZak9ZbzZrVzJGK0g4R2U2OTQwTUdBYU5QdjV0?=
 =?utf-8?B?WmhPMHdWVko1cE5HbVNwMWw0bnJ0d0VpSHpHdnVBb1Qvb1ZKKzRFa3VwUXBk?=
 =?utf-8?B?Uzl5cWUvMk9scGw4Zk1uSUF1YXc1NWpqSzY3RnlKS0JpUlNNZEN5amgvSit1?=
 =?utf-8?B?MnVIOUh3K01KNGxnVG9NaHVKUWRiRnpVVm9TQXhWc01hTndOK2RyT0E0amFF?=
 =?utf-8?B?a0lwbWJ4OW9PakRQVUxOaU5vUkF1amRYd2pnWXpvRy9zeXViMGQrV1Yxc1dM?=
 =?utf-8?B?NWQrR3JtSjY5UnVxcGJEcWVkV01RM3paa0ZPNHFwbUVGU1pGcmFtSE1sK29x?=
 =?utf-8?B?K0JRWVBmOHo3SHhzMktBdEpOM3AzeW1aS00zMVZCWEZRTTcxRTJFYTRkUDQz?=
 =?utf-8?B?S3dOVkx6YVJlVzNVR3NrM09zdGxMRE5iUXJvM2p6aHRBUmUrdnlsc3hNWkdC?=
 =?utf-8?B?TjBYV3owT2daeHg1eFg4d0dsdW43RjZIRzUzMXc5OFJhWDJqa1RTdXJVaE1K?=
 =?utf-8?B?RlNxWVkxSmFmLy9HV2t3WkVwbFRxYlh0Q2ltTE9XR0JSRTRqMVdLQlBhM0R3?=
 =?utf-8?B?azJQckgyYkNHNnBMWWl5RnFXeDBFSGlzRi9pT0lsQzFXZHRoZ1VoYWpsaXdG?=
 =?utf-8?B?bEtoOUhlN2pQTkloWEROWmlSRGdNM2w4WmE1RVduQVBuTjR1RzVnSWFzRU5S?=
 =?utf-8?B?YzRGbnpKNkI2U0hRN2gyRFNHb1RNa0RHYWlad1JDaTEzS3R3U0RmNk9wd1Fh?=
 =?utf-8?B?UnBoazNYK3hUMFBrSlhrU0N6cC90UmluM0d3cFZSdWFtczBVOFBOZWx2L05u?=
 =?utf-8?B?WXdiTXU5U3B5bjBvL2l0N0pQZk1YVDhXMFhMR3VjSW81ZGhNY3pQU0lzVkhG?=
 =?utf-8?B?K2NDcU10emU4VTc4VEd0R2tXVzk2c1hnZFpobjhJMUtFNDI5TThXU2JPQmFX?=
 =?utf-8?B?V0M3YXJQVzhqOWF1OEw2a3lkNEk1S0phNlFFZGpaR0wvcjByMU9YT2ZyL24x?=
 =?utf-8?B?WlNXQ1d1NVZNZGg5b3ZmOTZ0RTB4eWNrSDVqYjdmMnFDTWE1MDRZN0VldC9E?=
 =?utf-8?B?aGt3VDUweVZXdmN4UDVHeHhOTHFselB0UDJWM0N1ajRPaFp4YU9GamRYcXRN?=
 =?utf-8?B?eTlLRmRCaU8xTTNlUTZxbXViQkw0eWlWY1NqM0NMVnpHc0ZESHN1QVlYbFFu?=
 =?utf-8?B?d09BWHZ6UlJOSWEwYkxJMThXMXZpSVpOa3VOWVJPZE1ZSXg4L1lQcEhJd3Vy?=
 =?utf-8?B?OFBxZU5FMkw4VENzelFjT3ZvSEJlcG1GT2NQWGpYYWExalBhTzdTSE0yZmZT?=
 =?utf-8?Q?ntR31iRoKaPzv60EzEiovGBPF?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <471FEC90BBD1CF4E8D9EE4F628209B57@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b62dc3c-cf94-473e-edd6-08dccc5ac739
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2024 20:55:44.0818 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yPc+s930Sl5ViOxBEqbC6qVXZ3ajvh0C0cIihKXWKoqfJQPXkNnW3kGoTqmraJoIxpVWLLFcCRpfYjNBKrkAXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4945
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

T24gVHVlLCAyMDI0LTA5LTAzIGF0IDEyOjUyIC0wNzAwLCBEaXhpdCwgQXNodXRvc2ggd3JvdGU6
DQo+IE9uIFR1ZSwgMDMgU2VwIDIwMjQgMDY6MjQ6MzUgLTA3MDAsIEpvc8OpIFJvYmVydG8gZGUg
U291emEgd3JvdGU6DQo+ID4gDQo+IA0KPiBUaGFua3MgZm9yIHRoZSBwYXRjaGVzIEpvc2UuIFRo
aXMgaXMgYWxzbzoNCj4gDQo+IFJldmlld2VkLWJ5OiBBc2h1dG9zaCBEaXhpdCA8YXNodXRvc2gu
ZGl4aXRAaW50ZWwuY29tPg0KPiANCj4gVGhvdWdoIG9uZSBtb3JlIGNoYW5nZSBpcyBuZWVkZWQs
IGF0IGxlYXN0IGluIElHVCwgdG8gdXNlIEJNRywgaGVyZToNCj4gDQo+IEluIGxpYi94ZS94ZV9v
YS5jOg0KPiANCj4gc3RydWN0IGludGVsX3hlX3BlcmYgKg0KPiBpbnRlbF94ZV9wZXJmX2Zvcl9k
ZXZpbmZvKHVpbnQzMl90IGRldmljZV9pZCwNCj4gew0KPiAJLi4uDQo+IA0KPiAJfSBlbHNlIGlm
IChpbnRlbF9ncmFwaGljc192ZXIoZGV2aWNlX2lkKSA+PSBJUF9WRVIoMjAsIDApKSB7DQo+IAkJ
aW50ZWxfeGVfcGVyZl9sb2FkX21ldHJpY3NfbG5sKHBlcmYpOw0KPiANCj4gCS4uLg0KPiB9DQo+
IA0KPiBJZiB0aGlzIGlzIG5vdCBuZWVkZWQgZm9yIE1lc2EsIEkgY2FuIG1ha2UgdGhlIGNoYW5n
ZSBmb3IgSUdULiBCdXQgZm9yIG5vdw0KPiB0aGlzIHNlcmllcyBpcyBSLWInZC4NCg0KDQpBcHBs
aWVkIGFsbCB0aGUgY29tbWVudHMgaW4gdjMsIHRoYW5rIHlvdS4NCg==
