Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C2DC83F0A
	for <igt-dev@archiver.kernel.org>; Tue,  8 Jul 2025 12:03:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6847C10E60D;
	Tue,  8 Jul 2025 12:03:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oq9B9UxX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03523890FE;
 Tue,  8 Jul 2025 12:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751976208; x=1783512208;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=zCllcCXNSsIRZNmmrInfLP9Z+TppqsJt8L6iIbUABxA=;
 b=Oq9B9UxXLvP8qwRkoUhacYSsVyw4lcGWB0C4/6QH3+PKHTAjC+decOrw
 sbtDFRWJqWVkEr1gZ8fx7yVjOV6srJkWrcItBolz8pCqL/Ah0DvUhPdi3
 coHpjdLvAg7uNS8gPrRssTl+KJCAP2XH2QZRMBahJLlj/Cn6MH9zN1Q2v
 UIrapjCFQbytmSp/N9VHWH5KLqRcgkCNiArpx4GHNhEfI4sZpNm7YuAxg
 jkDlHqAtGfd8L9vN+0owsAKgEtclVsfmJqK9ZWZnIZ7IOzbmXs/tY/D3O
 YUJLJ0xY4IPBrH2BG5AAqIhZzkERsNSr8Z4xRGV7AhsBpRkllpepff08T g==;
X-CSE-ConnectionGUID: rr/7vIAQS4KZAplXPvLQyQ==
X-CSE-MsgGUID: Y10iG8fKTeelV+FziHxVPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54070547"
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="54070547"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 05:03:27 -0700
X-CSE-ConnectionGUID: NpDpcOgZQBmuqKoUO+e0fQ==
X-CSE-MsgGUID: rVt/TmmyTVKoRl0B72rtpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="186502144"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 05:03:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 05:03:27 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 8 Jul 2025 05:03:27 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.64)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 05:03:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qqvHEoJTW20lkGbchRNpcGD39TlPwrhvzqWi/Tjq/3xnEOndi49VgyXgM+rlqi5HkoKWOZNtGMhWdJpHWeAhatsB94KV1qslcAXNYHgoZEQqJi5bR9cyQF1n7My43CWNmLiwlK2Bq32JeBBf/LNDMD6Kdk4PD7EUs4S2XYQeuIvHfjzQKlLNLVY9r6yIE/z2xdbn1whI1RraSsk9XMS8vzlqvGolNCRSn1+M+5Llf8cuLQ4CEXteZuC75KTsLCV4gRT6tkrtT9VyCMHiQ8PAzuOoD02xSLHot1NqPDmOpO4QoXAAaoPJw/afhb85OT+VnjTt9D1EuCtUjuLaHaFIvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zCllcCXNSsIRZNmmrInfLP9Z+TppqsJt8L6iIbUABxA=;
 b=PorW+3E9+g2WzadZiA8nPcdYh4J2K3eiWsU8Of/2WenHiOPyeekGlBkdX7FViyUMLYqrqb/Sc6YiggI4CeqoH+aUzrNl18UqrUAVgIXA8QnHBd9xVZ1eGy61MyRE7CbzIQU3ighEZrFQBVbNwxGm4t9lauaQxhH4fGSQ1kawbEoV3/A4uZ8k4GoYa1lfkoMTW2u4LEzdNO8tACnMwpGYqCww7RIL66khBj5TuASK0P3UbnWHPYAWWm0VWqZBzDfhVp3YPMsAsLgnfM43rILTCxSZMe/71djoR0TiZbPyOdmWVkFw+dIyEe2NCasrLVlbzhvK0sEE2wkGi4Nq7DWc7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5491.namprd11.prod.outlook.com (2603:10b6:610:d6::19)
 by CY8PR11MB7876.namprd11.prod.outlook.com (2603:10b6:930:7d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Tue, 8 Jul
 2025 12:03:09 +0000
Received: from CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a]) by CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a%6]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 12:03:08 +0000
From: "Ravali, JupallyX" <jupallyx.ravali@intel.com>
To: "i915-ci-infra@lists.freedesktop.org"
 <i915-ci-infra@lists.freedesktop.org>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBpOTE1LkNJLkZ1bGw6IGZhaWx1cmUgZm9yIFJlcGxhY2UgaW50?=
 =?utf-8?B?ZWxfc3lzZnNfZGVidWdmcw==?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVyZSBmb3IgUmVwbGFjZSBpbnRlbF9z?=
 =?utf-8?Q?ysfs=5Fdebugfs?=
Thread-Index: AQHb7+Ho9FEhqrOSpkK+McamM1DuBbQn5J+w
Date: Tue, 8 Jul 2025 12:03:08 +0000
Message-ID: <CH0PR11MB54914DAEFA8BE0BCBADFB5FDEF4EA@CH0PR11MB5491.namprd11.prod.outlook.com>
References: <20250707210726.55334-1-peter.senna@linux.intel.com>
 <175193763895.141900.16796195912362119879@1538d3639d33>
 <f0f7df35-28a7-48ec-a4d7-094186233128@linux.intel.com>
In-Reply-To: <f0f7df35-28a7-48ec-a4d7-094186233128@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5491:EE_|CY8PR11MB7876:EE_
x-ms-office365-filtering-correlation-id: 3c25dfe0-e95f-47cc-9793-08ddbe1767a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|13003099007|7053199007|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?R1VaYk1PRnhBajRQTytmWGtZeWE5OXB4azN5MlNUcGhoWHlHaHJPVjhJNUlX?=
 =?utf-8?B?RVdRTmY4UVR0dU5BRXp4cGR0RzhlWGtCRXpQWkdIZUhJQytBUHJjNjNoR2hZ?=
 =?utf-8?B?NE52Zld6Yy9BblJGTHY1ZXZzRUFocC9lTHU2TEk0NFZZcHZuL2c0S200ckR4?=
 =?utf-8?B?WkphWnh6bjNQV01sbnJQMFZ0ODRnK2gvYXFuMElPZ0FldWtnQUtWQWRib08y?=
 =?utf-8?B?b2wyMU54anJpR00xWm1pZFZvdWFhNlczNmZ5NmFKVFRubEVQSXAxWVNEYnF1?=
 =?utf-8?B?d1FLalFyZjh0ZUxyMDlGZ2pweStQbXhrQ1VXamFNQVdlSk5DajRxOVRRa1VM?=
 =?utf-8?B?NlBJd0FZVDJDbDRJZnkrYkxMZU1EZ0w5ay9JU0dkQ0g2QTNGNzVTaU9FTjlN?=
 =?utf-8?B?REdCSTBlQm9ta3pobFJES0RkY0RIRzhwTytXR201SGJieDhvZU5vNjdFQXJq?=
 =?utf-8?B?bFgwZ2NDcVRIV1dzNTFrMlBNOC83eVdkVEROdVl3MkRsT28yL0pvWlRXUlli?=
 =?utf-8?B?aHFHamxXM0pLMkJCZjJuL3RCOUZpcEpxVGRyVThKa3BNdnAwL1lwYnl2NkFT?=
 =?utf-8?B?MnJkMzRtbW85dVhxSEJtT0hOc1ZyNDBpaE40bjJlcDVnQVdQNzFRQ05uYmNT?=
 =?utf-8?B?dEdldFNkUllEcmc4a3hCcXBpcDlJbnN2dGZ5V0RaNGwwakZoYVduTGVKQVl5?=
 =?utf-8?B?YzA3VStza2FkZnVQOUVwZkR5eU0yYVpRZlVYZk96dXg5bndjbldKeCt2bW15?=
 =?utf-8?B?V29QUnNuZUU3QTdzUjVHOUd1aXRPNXEva3IwSkxaL0lxektOemE2OUgxQmg1?=
 =?utf-8?B?cDlYVkpsRkNqcjlaMFUvYjJvL1VIMkw4T0VubXJ2MmVXMGQ2ellJVk1DMUJ4?=
 =?utf-8?B?T3A2UWhwUGNvLzlGTFJ5V1lWWmowYXNYOXJmZmVVL1FEYW52TFFyVWpqV1Uv?=
 =?utf-8?B?a1FGdG1LZzNKVjNCNXBWaFZMNitmL1Y2QkRib2g2SVUrK2JvR2dDejc5dS95?=
 =?utf-8?B?aEJOendwMThLNkM5SXFPYzU2MW5iMlFZbUtUL3d0TnlFRUlHVHpRYmphSFdC?=
 =?utf-8?B?YllHLy9GUEFLRUtaYkNUbkVEejlLNTY0c1d4WnRuaDZaMFZPeHorSkVENnlC?=
 =?utf-8?B?ZU5CQnZlSnlka1YrQm1aVUxhc204b1VmYUFhZjZYMTc2NFhZdTkxcGx0Y2k3?=
 =?utf-8?B?M2U5ZTlUUGVRenR6N2Jac1NqdjMvZUF6KzVjczIzc0tjNUUva2FMb1I2K3la?=
 =?utf-8?B?ci9LSllTdG1YRHE1WktqeDNXTUdKSnNiMFUrS0FhMDJTOE8rVXBOaXprb1ho?=
 =?utf-8?B?QXh4ZlBvWGQ4Nk0vYVdyOE5vdXFUcXljc2VIZ24zYkZHTm0rVDY2V0hSSk8v?=
 =?utf-8?B?MzIvNEJSS0VDZnQrTEhmdHUyWTJ1b2lLTnBlYjE0Zm5ENTVlaDl6bDhOOEtn?=
 =?utf-8?B?MzBWdER2b0FYd0VKampsaUdyamhOU0Nsbi9kRHM3QXU2OVVkSnBOZWduSmha?=
 =?utf-8?B?U0JPSStPTnBkSkRMYkcxK2U0OVBIeUhwU3IrdlB4QW1iR2dCeHJkdGVyTDFx?=
 =?utf-8?B?dWE0bE1aT1VtMVhsdDVlWUxsdXNGT2c0S2VUME9DYlNRTVhUaW9XR29OcFJQ?=
 =?utf-8?B?RXQ1bWxYUGkwcm5Uajc5ZXFNRkVDWTh2TFF0VWx5dGd6MFBMVklva21DcFdS?=
 =?utf-8?B?dG5Wamw3SFNlYlJpYWM2RytUQmRFWWc2UXRBSUFMOUprNjF0U2pyM3lrdkV2?=
 =?utf-8?B?cUpzaDJwd2wyR0s1UGVZc3htWXh1aE9RN083VnQxQlIxc2hKRGZWdDJwVGd6?=
 =?utf-8?B?ZHdEUk80WGZEUXJFdHFrTmhjN3RUK2hkRU1GcWZ1UG9RT2VpN1ZzQ0tmK0Rl?=
 =?utf-8?B?RzdmaWtQbjlpTnhLL1dUeGRXbW5VQW5qY0d6cU1jQU1rNlpyYTdpczdCUXox?=
 =?utf-8?Q?dlWW5nxZUIg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5491.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(13003099007)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Rk5EeFo5RFlMSXNzbFQrRjdqSFZhdGpoUi9DOHFzMEtOWWVCSFZIRERSVFc1?=
 =?utf-8?B?V0tMQnh4MG1Id1hLSDdPWHUzL3ZHZlBHWnYvWHFzSmk3K2ZTOGg4YXdmUktD?=
 =?utf-8?B?Vmd4ekNSdHdNNG5uTTAwTW5kZnp3UnVNOFdwc0VWdW1HVmtXQnF2d3JTbFEr?=
 =?utf-8?B?a2Yrck54TW9NdktpWmJaUURQckZmQXdreitWR1ZVdVVTNFJXalo5L1JKMlVF?=
 =?utf-8?B?K1JPcy9IVWdIclV2NnBiaWc0M2RJbmRnMW1zMVlsUVNVQUlpY2xVME1UMmRz?=
 =?utf-8?B?QW5mUXV6TVRhSTFwV1ZSWnFPOGc1aTdsYm92NWJjNkVSdmJaQXpoajA0UlRS?=
 =?utf-8?B?T29BOGE4ajAzUlpibC95QllBMGM2Y281dHdVc0FramgrOE5MTHVqOGVlSnZV?=
 =?utf-8?B?c1ZWK1lQWS9pMmpBZFN5VlptOFhYMU1kc2lxUVNqK1NSRW4zeTJZUWsyNTRZ?=
 =?utf-8?B?aXRTYlI0a28yRDZBWkwxMEtHcUQ2UG9FWGEyZHZKT1dDTk5MNEhnaU41ZmpC?=
 =?utf-8?B?R1BKQTZ3ck0wWEJmaVZBRStHbTVBeEdrbkk2ZmhCZFM3UFljb0RycUJaVnVN?=
 =?utf-8?B?WnYrS2pRMnQzZVlWY084aGQ1L0hKOUUzcjgvQVR5RmlxeVlrU2N6dTlXdjY2?=
 =?utf-8?B?WTluNTV5NVE5d1ordElVSFk1ZTBFcmN5ZFNhS1d2OU5FZEtTTEdSaU1JWDVy?=
 =?utf-8?B?SlEvR1ZQekNvUTBYdk5rRlNCL0t0THMrQlYrelVYeDhHVnowRkpETS9JL2s3?=
 =?utf-8?B?SWh2UWowaEdhL3VmTnllbk5hYzRKbTFnSzhLRkFJV0JyRHgxa0hsbzRJQUpv?=
 =?utf-8?B?VTFUZ0Mweno3eEZmN3hQQmJtSzVzeFFBUmtIc2Z5WElqVjRrNzBQT2loblk5?=
 =?utf-8?B?K09XUUQvV1JCRHdlalRtUzhkbFNhSnNsOTBrd2RjNWhzemppMnNJOUh6dlJW?=
 =?utf-8?B?VWhNMThqMElqV1dTbzlNdkJjY2pTYm5MNTllN3V2WU1Ob2VjVUp5c1R3RlFn?=
 =?utf-8?B?cTlVc3J4UmE3OU9HRWp1eTY4WjJSeVVidGFhVUVCbUZVdHRxVFpIM0ZWaW9G?=
 =?utf-8?B?bUhGRklUSlpEQzN4ckF6cmNVdmNqNFhpc2N6UzJiT3RTZFJYNmU5V3NGUzNl?=
 =?utf-8?B?UkxyMVo1aUJ6SEg0bE5lS2hsZ3ZDTS84RGlhQmFnb0ZrRmlSTTZpK2FKeDZz?=
 =?utf-8?B?enhweUVjNmkwdFdVY0ZoWll1bUV4eWhaaE5JcmRwME45dkxPeFBkL1R0RzFI?=
 =?utf-8?B?cThkckJ1OHltMlpKb3V0R0M5Y2hxdkhhTFlMVDNJaGtTVnc3bkxQTXB1MkFS?=
 =?utf-8?B?Unh3Z2hmNlZmeUZ6ME93WmVZNHhtTDZDUUJVdlVKVWdnY2JUTWdYU1JseGwv?=
 =?utf-8?B?RW4rTnNEMGlmU0RUMnNmdUlXNmppYXRucjh5RGJIUjYwbHFSeVRESUNLYU1R?=
 =?utf-8?B?NWRYWkkzdUNrbnhzc1dYSk5iNG5WZGh2ZEpyY1UyMlJJNVZpbGhjR2dZZTlC?=
 =?utf-8?B?TkRHbEZ0dlk4cmJzckdTYmJadHhiR0pXSFJYQXI3QmdnTHJQQng0UHVhUG5y?=
 =?utf-8?B?TUIzTUM2K2YwZ0VidjJqV0dkQUpZTS9TOTVKWVVqQkZRT250aHpwRFlNbjJX?=
 =?utf-8?B?SllMRERNVDZybjdZSExWQ2tPaFJ5T3dBTTdybDVMejRLR2VNSWxwU05wWkxo?=
 =?utf-8?B?NWRaeTd0Y2wxNDMrRE1lekNuU1VpZXlqa3dsbG9iMTVDZU9RMm1OTmptTVNJ?=
 =?utf-8?B?T3lUSkgwb1ptUUg1TnpNdXRrOHFiLzROUGwzT3dSZU1WRXZsamFidk5tb08w?=
 =?utf-8?B?N0dxM042akMwY21xeE1GbXZKOHpUd1VOWnNyVVF6cTh1ZllORWpSS1FUZ2Vl?=
 =?utf-8?B?RFFCeXRMa3h4bEpKUGtnM20ydUoxMGhlZ1FSMUZPMVo0bk1vbytjaTNjdUZl?=
 =?utf-8?B?RVNPOTVBdytWcXRrZDBZek9yR2xBUEJoWFdoMkdsNjZ6YUs3UjBxa0M0R0Fo?=
 =?utf-8?B?WnlZUUJRN0pxajZ3aXJqWCttanBiVkFyNFltLzNGQzBhbitDcEFTRzFRWm1p?=
 =?utf-8?B?TXA4OVNld2xrb0Nidjh3K1IvUVVWTkdyUlBKcWhKUXNvVUJ4NjlKQlBqaGQ4?=
 =?utf-8?B?UjgxaFhsczJOTTM4MDBxZUprbEJNcjMxR3ZuMmp0bFRkSjRldGxHSUlVZWha?=
 =?utf-8?Q?mQoKvkFk/cGLY4nx8MC7qHePciyz4EaCVEoerItaBpjM?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5491.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c25dfe0-e95f-47cc-9793-08ddbe1767a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2025 12:03:08.8539 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EcszZ3U06PJOKQuOEzvAb0Vz5VZ86SjQhbu77yDyM/sBv1WzYZWSlZGD3Y/Ri1j8jglFhNtMJR3YIWGsdW+lEAnfgNIjxyySY5aUyw/nqZ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7876
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

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTUxMjk3LyAt
IFJlLXJlcG9ydGVkLg0KaTkxNS5DSS5GVUxMIC0gUmUtcmVwb3J0ZWQuDQoNClRoYW5rcywNClJh
dmFsaS4NCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBJOTE1LWNpLWluZnJhIDxp
OTE1LWNpLWluZnJhLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2Yg
UGV0ZXIgU2VubmEgVHNjaHVkaW4NClNlbnQ6IDA4IEp1bHkgMjAyNSAxMzo1NQ0KVG86IGlndC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBJOTE1LWNpLWluZnJhQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZw0KU3ViamVjdDogUmU6IOKclyBpOTE1LkNJLkZ1bGw6IGZhaWx1cmUgZm9yIFJlcGxhY2Ug
aW50ZWxfc3lzZnNfZGVidWdmcw0KDQpEZWFyIEk5MTUsDQoNCk9uIDcvOC8yMDI1IDM6MjAgQU0s
IFBhdGNod29yayB3cm90ZToNCj4gPT0gU2VyaWVzIERldGFpbHMgPT0NCj4gDQo+IFNlcmllczog
UmVwbGFjZSBpbnRlbF9zeXNmc19kZWJ1Z2ZzDQo+IFVSTCAgIDogaHR0cHM6Ly9wYXRjaHdvcmsu
ZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xNTEyOTcvDQo+IFN0YXRlIDogZmFpbHVyZQ0KPiANCj4g
PT0gU3VtbWFyeSA9PQ0KPiANCj4gQ0kgQnVnIExvZyAtIGNoYW5nZXMgZnJvbSBDSV9EUk1fMTY4
MTlfZnVsbCAtPiBJR1RQV18xMzQyM19mdWxsIA0KPiA9PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+IA0KPiBTdW1tYXJ5DQo+IC0tLS0tLS0NCj4g
DQo+ICAgKipGQUlMVVJFKioNCj4gDQo+ICAgU2VyaW91cyB1bmtub3duIGNoYW5nZXMgY29taW5n
IHdpdGggSUdUUFdfMTM0MjNfZnVsbCBhYnNvbHV0ZWx5IG5lZWQgdG8gYmUNCj4gICB2ZXJpZmll
ZCBtYW51YWxseS4NCj4gICANCj4gICBJZiB5b3UgdGhpbmsgdGhlIHJlcG9ydGVkIGNoYW5nZXMg
aGF2ZSBub3RoaW5nIHRvIGRvIHdpdGggdGhlIGNoYW5nZXMNCj4gICBpbnRyb2R1Y2VkIGluIElH
VFBXXzEzNDIzX2Z1bGwsIHBsZWFzZSBub3RpZnkgeW91ciBidWcgdGVhbSAoSTkxNS1jaS1pbmZy
YUBsaXN0cy5mcmVlZGVza3RvcC5vcmcpIHRvIGFsbG93IHRoZW0NCj4gICB0byBkb2N1bWVudCB0
aGlzIG5ldyBmYWlsdXJlIG1vZGUsIHdoaWNoIHdpbGwgcmVkdWNlIGZhbHNlIHBvc2l0aXZlcyBp
biBDSS4NCj4gDQo+ICAgRXh0ZXJuYWwgVVJMOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEu
b3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMzQyMy9pbmRleC5odG1sDQo+IA0KPiBQYXJ0aWNpcGF0
aW5nIGhvc3RzICg5IC0+IDEwKQ0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4g
DQo+ICAgQWRkaXRpb25hbCAoMSk6IHNoYXJkLWdsaw0KPiANCj4gUG9zc2libGUgbmV3IGlzc3Vl
cw0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tDQo+IA0KPiAgIEhlcmUgYXJlIHRoZSB1bmtub3duIGNo
YW5nZXMgdGhhdCBtYXkgaGF2ZSBiZWVuIGludHJvZHVjZWQgaW4gSUdUUFdfMTM0MjNfZnVsbDoN
Cj4gDQo+ICMjIyBJR1QgY2hhbmdlcyAjIyMNCj4gDQo+ICMjIyMgUG9zc2libGUgcmVncmVzc2lv
bnMgIyMjIw0KPiANCj4gICAqIGlndEBrbXNfYXN5bmNfZmxpcHNAYXN5bmMtZmxpcC13aXRoLXBh
Z2UtZmxpcC1ldmVudHMtdGlsZWQtYXRvbWljQHBpcGUtYi1oZG1pLWEtMi15Og0KPiAgICAgLSBz
aGFyZC1ya2w6ICAgICAgICAgIE5PVFJVTiAtPiBbRE1FU0ctV0FSTl1bMV0NCj4gICAgWzFdOiAN
Cj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMzQyMy9z
aGFyZC1ya2wtMy9pZ3RAaw0KPiBtc19hc3luY19mbGlwc0Bhc3luYy1mbGlwLXdpdGgtcGFnZS1m
bGlwLWV2ZW50cy10aWxlZC1hdG9taWNAcGlwZS1iLWhkDQo+IG1pLWEtMi15Lmh0bWwNCj4gDQo+
ICAgKiBpZ3RAa21zX3BzckBwc3IyLWN1cnNvci1wbGFuZS1tb3ZlQGVkcC0xOg0KPiAgICAgLSBz
aGFyZC1tdGxwOiAgICAgICAgIFtQQVNTXVsyXSAtPiBbRkFJTF1bM10gKzEgb3RoZXIgdGVzdCBm
YWlsDQo+ICAgIFsyXTogaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9D
SV9EUk1fMTY4MTkvc2hhcmQtbXRscC01L2lndEBrbXNfcHNyQHBzcjItY3Vyc29yLXBsYW5lLW1v
dmVAZWRwLTEuaHRtbA0KPiAgICBbM106IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcv
dHJlZS9kcm0tdGlwL0lHVFBXXzEzNDIzL3NoYXJkLW10bHAtNS9pZ3RADQo+IGttc19wc3JAcHNy
Mi1jdXJzb3ItcGxhbmUtbW92ZUBlZHAtMS5odG1sDQoNClRoZXNlIGFyZSB1bnJlbGF0ZWQgdG8g
bXkgY2hhbmdlLiBQbGVhc2UgZml4IGFuZCByZS1ydW4uDQoNClRoYW5rIHlvdSwNCg0KUGV0ZXIN
Cg0KDQpbLi4uXQ0K
