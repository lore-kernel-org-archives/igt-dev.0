Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B65D3F30299
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 03:04:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2849510E07A;
	Mon, 16 Mar 2026 03:04:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="itl1fLQo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC7B910E07A
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 03:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773630244; x=1805166244;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=z7tFJ5Y9ZLojZnCUJbDF+zU8NJo2GUh17D0ej/uky/w=;
 b=itl1fLQoP90/W0w64p7bUHg64XgVWzp92SGSsIhrX7bLS/sl0wXWL4T2
 CeK3eNgZIs6e6yy8K6Mj7f0ymFIyE+l+Mb49HZOBw8j1eZV9z1Msdy6c6
 h2/SNl7G7Neq6qfig8i32wcKYHcs3e5yFUPMwunokbx4bGnxzEcKwK1sG
 Uo9aF9wrMSq6dV5DawKOdF9AEHBcEz/BDkM9GBfLcl1IRJ+A8sjmcyEuG
 z3/0wm8jtvhZe0wJNhjdmeER0r+ecNDWUkDt2JGZ5czyuffjF4vcKeCW8
 JNYw4WBMjGQE3Cmjv0yjk2nMOrGQHFJyJr7yeEPckEgZOrUDY7lCkTR3n Q==;
X-CSE-ConnectionGUID: pMMDhZh1Twui3Oxp6biY4Q==
X-CSE-MsgGUID: Kzed1Km6RY2+M+yg2FoCWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="74679495"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="74679495"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2026 20:04:03 -0700
X-CSE-ConnectionGUID: vTRoihO8Rs6VqjOCpG+Sig==
X-CSE-MsgGUID: dsz8fuVZR9WDVlzR6OG1Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="217647569"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2026 20:04:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 15 Mar 2026 20:04:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 15 Mar 2026 20:04:02 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.57) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 15 Mar 2026 20:03:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kiFLF3eSXYC08WLBCGltCGqhd20iLbn50z3X9GovHig5yDU07ZZ90lscOzPis5fUxjsLqGbFVlaAVMJi0oBbh+kwYynHwExZaSJWDwDAv9+EBTKYYfKgCw16zd8CSQfpGyI5DoFBtX0i4UOb+cDuKtfBS+lpthYYHU44yv75tSFOaDlPCnOM5BflhFgN46XfBaaHDpYqplzHT0CLeFXgH7tJoCqUvNuEUA0K49Smjp2o3aseUI8XG26b2wZm8l4IxQ5p2oqIB8iBRaK3iq7pln/b1uy/cYFJbQJSBc71Q40bXfWsyxSpkri7tjGJQQzIQirIUgxLjL5hrrrNLcG49g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z7tFJ5Y9ZLojZnCUJbDF+zU8NJo2GUh17D0ej/uky/w=;
 b=VkMt/Lxsi74zUXXTUCIK5v0CmNtxhMe6lVeeogJ4RG1ouVviKMu8cvFUmRMwy4Rsfgybk65shJcTx5k6rnABP6iEuag2OPVWDocvrMhG/IRUj9JGDqlr8+O01Tg7/02GW4dSbZ0oYZb2y+qfBqTOsWYP2EQlG515esvWAdKcxorltBRhYnjwTWvA0HO9A+kGfuZks1J7iHzD1JJxeViSCXnhggTmWylPw17vgU0URMfbHVKV6hc1XEcCPIcfg72P1Z7SM8Gw9X+CP9kyF//tMrUeiqghMMfDhksjSyIP3+Ka2KCWhdzQk/jpZMY0o6I1YNOC/TYm5e/1vKIaAyOLWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by IA3PR11MB9424.namprd11.prod.outlook.com (2603:10b6:208:583::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 16 Mar
 2026 03:03:13 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7%6]) with mapi id 15.20.9723.014; Mon, 16 Mar 2026
 03:03:13 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [i-g-t,1/6] lib/igt_edid: add EDID serial extraction helpers
Thread-Topic: [i-g-t,1/6] lib/igt_edid: add EDID serial extraction helpers
Thread-Index: AQHcr6dOyxHBbZ01Q0Chfjdsu7lR4LWmCRaAgAp55WA=
Date: Mon, 16 Mar 2026 03:03:13 +0000
Message-ID: <IA0PR11MB73073E69A3C6DF6E3C23EA44BA40A@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20260225212859.876713-2-kunal1.joshi@intel.com>
 <64b4bad8-09ff-4c5c-81d8-7d6767f4c472@intel.com>
 <b9215c41-315c-4a1c-b091-3cef36b675b5@intel.com>
In-Reply-To: <b9215c41-315c-4a1c-b091-3cef36b675b5@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|IA3PR11MB9424:EE_
x-ms-office365-filtering-correlation-id: be13b230-8648-42f5-bd9d-08de8308904a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|56012099003|22082099003|18002099003|7053199007;
x-microsoft-antispam-message-info: DepnZhhtKiRmM6Z2AtFep2U7e1kPwPVPqMS/p8MRYqU4LbilhFsbaKXJdDvwwVxocoGjSLwi7nG9zenAQzH2l3mnfOILAYPHvnLC3otBTCy+MX0GM+kBebpOOqKYjoIzoxjf1TnQP8udwvonT3Y093FRZ98ANPZG+tSNE2nZBZZdlDhcp3prfwUfibop/NnDwt4W86iH17ujMofK8Zl8SYYABSmYc7ebNv3a1NeaBw6LiEEIjYWj4ldR4uU+4wI3CarxxYwep4P/IHwDt7Fv98MnT3B0P2wzcJj81OyLUzTD0J3Vaav+MoJ9tXJZZe9rwQebWtPqEC61KoV0gGOYbqiTxpon0ZmH8dPFznKo8chuzo3aFmduq23lTIfmXOXTO74bVEZDsrfz4nHR++2/PrGAneUgGfN8fNdHx1kgd9X3EPa9mVAQUYq1N7Zt3XNLkCAgACKX0X6Dg4Vh+lNpr4C5wqafBPCqSfuTNDUEoABs/D/VTBGeXczlpwA37COezqDplrvMCMEb/NLzEmB8fMuBOyo2B/RXj7nzvQFoR9+bwnxkFDtGA2PrZj/3nY2/koE0g7XbMpCagYrGWxI52Nbmid6wlNdE7J3wDf/oeWjX5MfsRaLyXcoP9xLKt/QNseRUHKa97QTMoa+wAeY8dCNBPKiKhnQ7XHO9VA2uDTpXe8iXN2DPH46C/CqUs0TCth0aPGoRlc++RiXudsfujMlS+/u/AqYifTSGVuFul7Hv5jvB0j/xv8hOvwmLw68iWB3t1tOYIS2Y4yS1UqroOm3QN7bdmiPkvqFRZupA0i4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(56012099003)(22082099003)(18002099003)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QTBlU0s4OURxemZKTmZKUVBKNUNPUFozTTQyM2ZlTEE2czFRcm9Pa0FUVFFw?=
 =?utf-8?B?NmpNTEt3Y2t4aFRFYWxsYndScXVhSHYyZ2tHUmZMb2paRUoxUERoZW9ja1Va?=
 =?utf-8?B?RXFmMFZrZUVrTHJTOUNXdTZ5b2Y3TytrNzZaUVVndGZsM2RWVWFRMzlEVU1a?=
 =?utf-8?B?TER3dEhzaUFCWmhhWWRhYWhONTJhdGZ4THRRNzdBVlI4V2owR2g0aTlNR2hB?=
 =?utf-8?B?R2Z4R2l5T2NxS1lIZ1FrOTRRbXBJdWcva1IyNml6a0E0U3lEdDNnUm5rNkNp?=
 =?utf-8?B?V0FsNEdVUnk4eXlicHArbUU3STJUNk9DcFRQblRHRzVJNkd4SXhWU0xDWTdO?=
 =?utf-8?B?a1lWdWlnZ00xRDVETDVZUFpVZEhFcGkzNEphaDY5ZnRMeUFSMkR1bU93OE5v?=
 =?utf-8?B?M2h0anNLVCtoY0pkdzdScnVnMFI0TllyZ0ZzdlZJbkFhK1hMczhtV2hDSkVT?=
 =?utf-8?B?ZUVVNk5rdzY4ODRaZ3JURDFEVEhNdEJKSzh6eFNPNW5RbzdWM01TT2dadW5x?=
 =?utf-8?B?OEVMbjhyNk5BK1duYWpsNnV0UmM1dzFxRVZaTEFUU3NTUlN0MlROWU4yR0JL?=
 =?utf-8?B?T2pTczhaTHVyV3J4K1N3Wk42Z1N4ODBJMGo4VFljcFBIRWRoc3JxUDhoRE5X?=
 =?utf-8?B?eHJjMEZ4MnZDcEJSejlCTXVKTXlaeWdPbVRFZFcxWTZCalNaNGlPQkFWVDlS?=
 =?utf-8?B?dlo2dVQwZG1CSzMwN1BTWVBGYjB6SGYvV2h3ZDlEMkFDbTY2dFB0TlIvdmpy?=
 =?utf-8?B?SkNSUUxNbVIwSGo0NnhKZTVKaXQySUJ3dlZTN0ZIS0ZkSUNrTWMxOGo2SDRR?=
 =?utf-8?B?bjBTcEhXR1EreXFBUXRaWHh6WmtXOG50eDRxMkZJUjlDM25mRktqeHUwbDJQ?=
 =?utf-8?B?Z3RrVlg5SjZHaWVPS0xKN1kxSmVOd0VkYXVQQmxtWElyaGFpV1JRTGxPTGR1?=
 =?utf-8?B?ZldsaWc3dWF0UEJVVU1uRU1vekUzMHRubElSWXpweVB0ejZJM1htci9PS2U0?=
 =?utf-8?B?MzV6Z1pWQjVOVjdYVks3cGNabTBWSTNBVFh5MFpIVWJ4Qk9tQWNkaW1zM3V4?=
 =?utf-8?B?RXRWZGtEZ29EdFpTNmN3N0twUVU1dWJwSG1ZajJwMHlIUDZVY0RoYktObzhU?=
 =?utf-8?B?MVdlTUM3cmhHU1pTeFpOQUxnNkZJU2dMYUVndlprQVlSTlRMR3dZOCtpdC93?=
 =?utf-8?B?TXNXNmpINWlMUFUwTmEvVTRwWk80MnhPaDhGK2ZmZmZQN1RaZk1TRVBTM0Ju?=
 =?utf-8?B?a1JPb3dRUDZDQWFzOFBrYUpoVXJ4MDl6VjFhd1dreC9DTXNzOUZPc0hrdWNW?=
 =?utf-8?B?bXlmV3pyMThCSmJ1V0hqRnlVV3RkdWpTMWNaM3FHclZLdjNiNzQ0SFlNWDh3?=
 =?utf-8?B?RTBmd1hNY2sxY0JsZ3JVWnQzVGxaRmg4elJjdmlqSEJQRUVrdU13U1Z3RlNB?=
 =?utf-8?B?eEFMS3ppcnZ4TE4xUlhNVUF4Nk0xRFd5YzNhOXFGVWlOVDFzSzFLMFdzNlND?=
 =?utf-8?B?QzdlSERTNDRuVHFOR3RiZGhLNllocnV2L0xpbnRXZW1VZjdaTXZhampPRFFW?=
 =?utf-8?B?cHBYb2tTdzZVY045b0RUQWJMdEQxSHhWaGVOZW5vMVB1M05tcTc2ZzZQeFg5?=
 =?utf-8?B?ck1LdlFsUGhzUkY4RmxzZTZkMWJ5QzgyTFdKODlEZFMzQkFKeUF2U205bjdV?=
 =?utf-8?B?b2lFT0xkSVZRNm9rYzNUMEFWbjRpUWU5L283QzdCUW9xRENIZWVxcEltVkRJ?=
 =?utf-8?B?Rm9BSm9PNlFycGNvVVR2Q3c4QjBZZXFaZDdKYVEwaVl3QUF5Q1JPZEFSN0Q2?=
 =?utf-8?B?SkdZcVA5TUdtNnd6MzREQ2tyRSthMitDY2RrTDFrb0wyS0lVT2NieHF1OVZG?=
 =?utf-8?B?RDNUdzZ0STlZZE0yWGk0eHBWZ2Y1WXpvRXk0S3NFOFlrVnpaZlNHUGNLa1NB?=
 =?utf-8?B?bTczZVJLQ250cE5TY1haaEVjV0lFb2YyTzI3MUczOWZEaHpJQXYzc2k5Mnh2?=
 =?utf-8?B?RHMzL2gzS1pMRk1OTmo4VW9LanRnUlh3QXJTbSswb0RjaG9aUVRnQ2VPZTJh?=
 =?utf-8?B?bUJsUHZHNmxVK0tUbG9RL1BWWVhrL1Zld0VxOFROMXdNdkZsanRVUlFRN1pM?=
 =?utf-8?B?ZHhvdDF0WHg1WDlNWGw3aExQU3BLWG1WQjh5ZU92V1VCNWM5MEVXdm81cXBK?=
 =?utf-8?B?NUZBQ2F6akpoNXVSRDlHUkJTTmNLcUIvaTdqdWFqSVRCM0RLVnAzbkhpYTM2?=
 =?utf-8?B?SUdwcmxNeTF3azZ4RTVmd1ZLTHNPUFk5TWd6Q3p5WUpSOXQyWjlvckM5VnQr?=
 =?utf-8?B?NlhxRDRPdUpLMnNVbDl6R0lzMHpQR21jZVp2T0VwMjE5ZlJlTjBmUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ugIZyBrfh10m6d0NFX8Fhb9Yq4LLBjcYOZWaMjL/J3pS5U99ISlvXzknpGd5jVuhS+g0UoXPmLVYIfP5/D8XP3SGRqO1nK1jTeHgMD/CMcjJVNTdp0WVBhx9RXxEVGdw2D2Q6zZ02MOgyRPAraBdKkUyPc3QPh8qh6+0U8b7ZdnfjsmXXIuoyo/fsPeLAJaEpVbvqnBOGP/jZX7SK8sb1ookYdQn5FkVwE4F4wf0AdoUCDovGfOolkRToX6H3uwXWFLcT9X7ktZMm7GNKhdcjzbWkFfwbJtQlsC3Yi3pE+93Z7Gt7VWIcljy1O0JVYSFmydsnQNC2hDb0rPd+zhDAA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be13b230-8648-42f5-bd9d-08de8308904a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2026 03:03:13.6360 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T2hI/2660IkAqfTtfbHtD3iws64Mau+uHpHkuNZTrI9IvOFd4IF/3Ly6XocadRdt+Q0PEWEYqYJtqlSOW2FFHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9424
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

QmFzZWQgb24gdGhlIHJlc3BvbnNlIA0KDQpSZXZpZXdlZC1ieTogQXJ1biBSIE11cnRoeSA8YXJ1
bi5yLm11cnRoeUBnbWFpbC5jb20+DQoNClRoYW5rcyBhbmQgUmVnYXJkcywNCkFydW4gUiBNdXJ0
aHkNCi0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
IEZyb206IEpvc2hpLCBLdW5hbDEgPGt1bmFsMS5qb3NoaUBpbnRlbC5jb20+DQo+IFNlbnQ6IE1v
bmRheSwgTWFyY2ggOSwgMjAyNiA0OjMyIFBNDQo+IFRvOiBNdXJ0aHksIEFydW4gUiA8YXJ1bi5y
Lm11cnRoeUBpbnRlbC5jb20+OyBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJq
ZWN0OiBSZTogW2ktZy10LDEvNl0gbGliL2lndF9lZGlkOiBhZGQgRURJRCBzZXJpYWwgZXh0cmFj
dGlvbiBoZWxwZXJzDQo+IA0KPiBIZWxsbyBBcnVuLA0KPiANCj4gVGhhbmtzIGZvciBsb29raW5n
IGF0IHRoZSBwYXRjaGVzLA0KPiANCj4gT24gMDktMDMtMjAyNiAxNTowMCwgTXVydGh5LCBBcnVu
IFIgd3JvdGU6DQo+ID4gT24gMjYtMDItMjAyNiAwMjo1OCwgS3VuYWwgSm9zaGkgd3JvdGU6DQo+
ID4+IEFkZCBoZWxwZXJzIHRvIGV4dHJhY3Qgc2VyaWFsIGlkZW50aWZpY2F0aW9uIGZyb20gRURJ
RCBkYXRhLg0KPiA+Pg0KPiA+PiDCoCAtIGVkaWRfZ2V0X3NlcmlhbF9zdHJpbmcoKTogZXh0cmFj
dCBBU0NJSSBzZXJpYWwgZnJvbSBkZXNjcmlwdG9yDQo+ID4+IDB4RkYNCj4gPj4gwqAgLSBlZGlk
X2dldF9zZXJpYWxfbnVtYmVyKCk6IGV4dHJhY3QgMzItYml0IHNlcmlhbCBmcm9tIEVESUQgaGVh
ZGVyDQo+ID4+IMKgIC0gZWRpZF9nZXRfYW55X3NlcmlhbCgpOiBjb252ZW5pZW5jZSBoZWxwZXIg
dGhhdCB0cmllcyBBU0NJSSBzZXJpYWwNCj4gPj4gwqDCoMKgIGZpcnN0LCB0aGVuIGZhbGxzIGJh
Y2sgdG8gMzItYml0IGhlYWRlciBzZXJpYWwgZm9ybWF0dGVkIGFzIGhleA0KPiA+Pg0KPiA+PiBU
aGVzZSBhcmUgbmVlZGVkIGJ5IHRoZSBjb25uZWN0b3IgaGVscGVyIGFuZCBVU0I0IHN3aXRjaCB0
ZXN0IHN1aXRlDQo+ID4+IGZvciBFRElELWJhc2VkIGRpc3BsYXkgdmVyaWZpY2F0aW9uIGFmdGVy
IGRvY2svdW5kb2NrIGV2ZW50cy4NCj4gPj4NCj4gPj4gU2lnbmVkLW9mZi1ieTogS3VuYWwgSm9z
aGkgPGt1bmFsMS5qb3NoaUBpbnRlbC5jb20+DQo+ID4+IC0tLQ0KPiA+PiDCoCBsaWIvaWd0X2Vk
aWQuYyB8IDkxDQo+ID4+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrDQo+ID4+IMKgIGxpYi9pZ3RfZWRpZC5oIHzCoCA1ICsrKw0KPiA+PiDCoCAyIGZp
bGVzIGNoYW5nZWQsIDk2IGluc2VydGlvbnMoKykNCj4gPj4NCj4gPj4gZGlmZiAtLWdpdCBhL2xp
Yi9pZ3RfZWRpZC5jIGIvbGliL2lndF9lZGlkLmMgaW5kZXgNCj4gPj4gYzY4Y2NmNjcxLi5lN2Zj
YmYwYjkgMTAwNjQ0DQo+ID4+IC0tLSBhL2xpYi9pZ3RfZWRpZC5jDQo+ID4+ICsrKyBiL2xpYi9p
Z3RfZWRpZC5jDQo+ID4+IEBAIC0yNDksNiArMjQ5LDk3IEBAIHZvaWQgZWRpZF9nZXRfbW9uaXRv
cl9uYW1lKGNvbnN0IHN0cnVjdCBlZGlkDQo+ID4+ICplZGlkLCBjaGFyICpuYW1lLCBzaXplX3Qg
bmFtZV9zaXplDQo+ID4+IMKgwqDCoMKgwqAgbmFtZVswXSA9ICdcMCc7DQo+ID4+IMKgIH0NCj4g
Pj4gwqAgKy8qKg0KPiA+PiArICogZWRpZF9nZXRfc2VyaWFsX3N0cmluZzoNCj4gPj4gKyAqIEBl
ZGlkOiBFRElEIHN0cnVjdHVyZQ0KPiA+PiArICogQHNlcmlhbDogYnVmZmVyIHRvIHdyaXRlIHNl
cmlhbCBzdHJpbmcNCj4gPj4gKyAqIEBzZXJpYWxfc2l6ZTogc2l6ZSBvZiBzZXJpYWwgYnVmZmVy
OyBtdXN0IGJlID4gMQ0KPiA+PiArICoNCj4gPj4gKyAqIEV4dHJhY3QgdGhlIHNlcmlhbCBzdHJp
bmcgZnJvbSBFRElEIGRlc2NyaXB0b3IgYmxvY2sgdHlwZSAweEZGLg0KPiA+PiArICogVGhlIGRl
c2NyaXB0b3IgcGF5bG9hZCBpcyBhIDEzLWJ5dGUgZml4ZWQtd2lkdGggZmllbGQ7IHRyYWlsaW5n
DQo+ID4+ICsgKiB3aGl0ZXNwYWNlIGlzIHN0cmlwcGVkIGFuZCB0aGUgcmVzdWx0IGlzIE5VTC10
ZXJtaW5hdGVkLg0KPiA+PiArICogQHNlcmlhbCBpcyBsZWZ0IGVtcHR5IHdoZW4gbm8gMHhGRiBk
ZXNjcmlwdG9yIGlzIGZvdW5kLg0KPiA+PiArICovDQo+ID4+ICt2b2lkIGVkaWRfZ2V0X3Nlcmlh
bF9zdHJpbmcoY29uc3Qgc3RydWN0IGVkaWQgKmVkaWQsDQo+ID4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgY2hhciAqc2VyaWFsLCBzaXplX3Qgc2VyaWFsX3NpemUpDQo+ID4gV2Ug
YXJlIHRyeWluZyB0byBnZXQgdGhlIHRpbWluZ3Mgc28gcmF0aGVyIHRoYW4gYSBnZW5lcmljIG5h
bWUNCj4gPiBzZXJpYWxfc3RyaW5nLCBjYW4gdGhpcyBiZSByZXBsYWNlZCB3aXRoIGdldF9kZXRh
aWxlZF90aW1pbmdzID8NCj4gU3BlYyBzZWN0aW9uIDMuMTAuMy4xDQo+IGRlZmluZXMgdGFnIEZG
aCBhcyBEaXNwbGF5IFByb2R1Y3QgU2VyaWFsIE51bWJlciBEZXNjcmlwdG9yLCBub3QgYSBkZXRh
aWxlZA0KPiB0aW1pbmcgZGVzY3JpcHRvcg0KPiANCj4gU2VjdGlvbiAzLjEwLjMNCj4gTm90ZXMg
ZGlzcGxheSBkZXNjcmlwdG9ycyBhcmUgbm90IGEgZGV0YWlsZWQgdGltaW5nLg0KPiA+PiArew0K
PiA+PiArwqDCoMKgIHNpemVfdCBjb3B5X2xlbiwgaSwgbjsNCj4gPj4gKw0KPiA+PiArwqDCoMKg
IGlndF9hc3NlcnQoZWRpZCk7DQo+ID4+ICvCoMKgwqAgaWd0X2Fzc2VydChzZXJpYWwpOw0KPiA+
PiArwqDCoMKgIGlndF9hc3NlcnQoc2VyaWFsX3NpemUgPiAxKTsNCj4gPj4gK8KgwqDCoCBzZXJp
YWxbMF0gPSAnXDAnOw0KPiA+PiArDQo+ID4+ICvCoMKgwqAgZm9yIChpID0gMDsgaSA8IERFVEFJ
TEVEX1RJTUlOR1NfTEVOOyBpKyspIHsNCj4gPj4gK8KgwqDCoMKgwqDCoMKgIGNvbnN0IHVpbnQ4
X3QgKmQgPSAoY29uc3QgdWludDhfdA0KPiA+PiArKikmZWRpZC0+ZGV0YWlsZWRfdGltaW5nc1tp
XTsNCj4gPj4gKw0KPiA+PiArwqDCoMKgwqDCoMKgwqAgaWYgKGRbMF0gIT0gMHgwMCB8fCBkWzFd
ICE9IDB4MDAgfHwgZFsyXSAhPSAweDAwKQ0KPiA+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBj
b250aW51ZTsNCj4gPj4gKw0KPiA+PiArwqDCoMKgwqDCoMKgwqAgaWYgKGRbM10gIT0gRURJRF9E
RVRBSUxfTU9OSVRPUl9TRVJJQUwgfHwgZFs0XSAhPSAweDAwKQ0KPiA+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBjb250aW51ZTsNCj4gPj4gKw0KPiA+PiArwqDCoMKgwqDCoMKgwqAgLyogRGVz
Y3JpcHRvciBzdHJpbmcgcGF5bG9hZCBpcyAxMyBieXRlcyBzdGFydGluZyBhdCBkWzVdICovDQo+
ID4+ICvCoMKgwqDCoMKgwqDCoCBjb3B5X2xlbiA9IHNlcmlhbF9zaXplIC0gMSA8IDEzID8gc2Vy
aWFsX3NpemUgLSAxIDogMTM7DQo+ID4+ICvCoMKgwqDCoMKgwqDCoCBtZW1jcHkoc2VyaWFsLCAm
ZFs1XSwgY29weV9sZW4pOw0KPiA+IENhbiBzdHJuY3B5KCkgYmUgdXNlZCBpbnN0ZWFkPw0KPiBz
dHJuY3B5KCkgaXMgbm90IGEgYmV0dGVyIGZpdCBoZXJlLiBUaGUgRURJRCBzZXJpYWwgZmllbGQg
aXMgYSBmaXhlZC13aWR0aCAxMy1ieXRlDQo+IHBheWxvYWQsIG5vdCBhIE5VTC10ZXJtaW5hdGVk
IEMgc3RyaW5nLiBDb3B5aW5nIHRoZSBib3VuZGVkIHBheWxvYWQgd2l0aA0KPiBtZW1jcHkoKSwg
dGhlbiBleHBsaWNpdGx5IE5VTC10ZXJtaW5hdGluZyB0aGUgZGVzdGluYXRpb24gYW5kIHRyaW1t
aW5nDQo+IHRyYWlsaW5nIHdoaXRlc3BhY2UvbmV3bGluZSwgbWF0Y2hlcyB0aGUgRURJRCBlbmNv
ZGluZyBiZXR0ZXIuDQo+ID4+ICvCoMKgwqDCoMKgwqDCoCBzZXJpYWxbY29weV9sZW5dID0gJ1ww
JzsNCj4gPj4gKw0KPiA+PiArwqDCoMKgwqDCoMKgwqAgZm9yIChuID0gc3RybGVuKHNlcmlhbCk7
DQo+ID4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbiA+IDAgJiYgaXNzcGFjZSgodW5zaWdu
ZWQgY2hhcilzZXJpYWxbbiAtIDFdKTsgbi0tKQ0KPiA+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBzZXJpYWxbbiAtIDFdID0gJ1wwJzsNCj4gPj4gKw0KPiA+PiArwqDCoMKgwqDCoMKgwqAgcmV0
dXJuOw0KPiA+PiArwqDCoMKgIH0NCj4gPj4gK30NCj4gPj4gKw0KPiA+PiArLyoqDQo+ID4+ICsg
KiBlZGlkX2dldF9zZXJpYWxfbnVtYmVyOg0KPiA+PiArICogQGVkaWQ6IEVESUQgc3RydWN0dXJl
DQo+ID4+ICsgKg0KPiA+PiArICogRXh0cmFjdCB0aGUgMzItYml0IHNlcmlhbCBudW1iZXIgZnJv
bSB0aGUgRURJRCBiYXNlIGJsb2NrIGhlYWRlcg0KPiA+PiArICogKGJ5dGVzIDEy4oCTMTUsIHRo
ZSBtYW51ZmFjdHVyZXIvcHJvZHVjdCBzZWN0aW9uKS7CoCBUaGlzIGlzDQo+ID4+ICtkaWZmZXJl
bnQNCj4gPj4gKyAqIGZyb20gdGhlIEFTQ0lJIHNlcmlhbCBzdHJpbmcgaW4gZGVzY3JpcHRvciBi
bG9jayAweEZGLg0KPiA+PiArICoNCj4gPj4gKyAqIFJldHVybnM6IDMyLWJpdCBzZXJpYWwgbnVt
YmVyIChsaXR0bGUtZW5kaWFuKSwgMCBpZiBhYnNlbnQuDQo+ID4+ICsgKi8NCj4gPj4gK3VpbnQz
Ml90IGVkaWRfZ2V0X3NlcmlhbF9udW1iZXIoY29uc3Qgc3RydWN0IGVkaWQgKmVkaWQpIHsNCj4g
Pj4gK8KgwqDCoCByZXR1cm4gKHVpbnQzMl90KWVkaWQtPnNlcmlhbFswXSB8DQo+ID4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoCAoKHVpbnQzMl90KWVkaWQtPnNlcmlhbFsxXSA8PCA4KSB8DQo+ID4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoCAoKHVpbnQzMl90KWVkaWQtPnNlcmlhbFsyXSA8PCAxNikg
fA0KPiA+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqAgKCh1aW50MzJfdCllZGlkLT5zZXJpYWxbM10g
PDwgMjQpOyB9DQo+ID4+ICsNCj4gPj4gKy8qKg0KPiA+PiArICogZWRpZF9nZXRfYW55X3Nlcmlh
bDoNCj4gPiBObyBkZXNjcmlwdGlvbiBhZGRlZD8NCj4gRGVzY3JpcHRpb24gb2YgdGhlIGZ1bmN0
aW9uIGlzIHByZXNlbnQgYmVsb3cNCj4gDQo+IFRoYW5rcyBhbmQgUmVnYXJkcw0KPiBLdW5hbCBK
b3NoaQ0KPiA+DQo+ID4NCj4gPiBUaGFua3MgYW5kIFJlZ2FyZHMsDQo+ID4gQXJ1biBSIE11cnRo
eQ0KPiA+IC0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4+ICsgKiBAZWRpZDogRURJRCBzdHJ1Y3R1
cmUNCj4gPj4gKyAqIEBzZXJpYWw6IGJ1ZmZlciB0byB3cml0ZSBzZXJpYWwgc3RyaW5nDQo+ID4+
ICsgKiBAc2VyaWFsX3NpemU6IHNpemUgb2Ygc2VyaWFsIGJ1ZmZlcjsgbXVzdCBiZSA+IDENCj4g
Pj4gKyAqDQo+ID4+ICsgKiBDb252ZW5pZW5jZSBoZWxwZXIgdGhhdCB0cmllcyB0byBleHRyYWN0
IGEgc2VyaWFsIGlkZW50aWZpZXIgZnJvbQ0KPiA+PiBFRElELg0KPiA+PiArICogRmlyc3QgdHJp
ZXMgdGhlIEFTQ0lJIHNlcmlhbCBzdHJpbmcgZGVzY3JpcHRvciAoMHhGRikuIElmIHRoYXQgaXMN
Cj4gPj4gZW1wdHksDQo+ID4+ICsgKiBmYWxscyBiYWNrIHRvIHRoZSAzMi1iaXQgaGVhZGVyIHNl
cmlhbCBudW1iZXIgZm9ybWF0dGVkIGFzIDgtY2hhcg0KPiA+PiBoZXguDQo+ID4+ICsgKiBJZiBu
ZWl0aGVyIHNvdXJjZSBwcm92aWRlcyBhIHVzYWJsZSBzZXJpYWwgKG5vIDB4RkYgZGVzY3JpcHRv
cg0KPiA+PiBhbmQgdGhlDQo+ID4+ICsgKiBoZWFkZXIgc2VyaWFsIGlzIDApLCBAc2VyaWFsIGlz
IGxlZnQgZW1wdHkuDQo+ID4+ICsgKi8NCj4gPj4gK3ZvaWQgZWRpZF9nZXRfYW55X3NlcmlhbChj
b25zdCBzdHJ1Y3QgZWRpZCAqZWRpZCwNCj4gPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBj
aGFyICpzZXJpYWwsIHNpemVfdCBzZXJpYWxfc2l6ZSkgew0KPiA+PiArwqDCoMKgIHVpbnQzMl90
IHNlcmlhbF9udW07DQo+ID4+ICsNCj4gPj4gK8KgwqDCoCBpZ3RfYXNzZXJ0KGVkaWQpOw0KPiA+
PiArwqDCoMKgIGlndF9hc3NlcnQoc2VyaWFsKTsNCj4gPj4gK8KgwqDCoCBpZ3RfYXNzZXJ0KHNl
cmlhbF9zaXplID4gMSk7DQo+ID4+ICsNCj4gPj4gK8KgwqDCoCBlZGlkX2dldF9zZXJpYWxfc3Ry
aW5nKGVkaWQsIHNlcmlhbCwgc2VyaWFsX3NpemUpOw0KPiA+PiArwqDCoMKgIGlmIChzZXJpYWxb
MF0pDQo+ID4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm47DQo+ID4+ICsNCj4gPj4gK8KgwqDCoCBz
ZXJpYWxfbnVtID0gZWRpZF9nZXRfc2VyaWFsX251bWJlcihlZGlkKTsNCj4gPj4gK8KgwqDCoCBp
ZiAoc2VyaWFsX251bSAhPSAwKQ0KPiA+PiArwqDCoMKgwqDCoMKgwqAgc25wcmludGYoc2VyaWFs
LCBzZXJpYWxfc2l6ZSwgIiUwOFgiLCBzZXJpYWxfbnVtKTsgfQ0KPiA+PiArDQo+ID4+IMKgIHN0
YXRpYyB2b2lkIGVkaWRfc2V0X21mZyhzdHJ1Y3QgZWRpZCAqZWRpZCwgY29uc3QgY2hhciBtZmdb
c3RhdGljDQo+ID4+IDNdKQ0KPiA+PiDCoCB7DQo+ID4+IMKgwqDCoMKgwqAgZWRpZC0+bWZnX2lk
WzBdID0gKG1mZ1swXSAtICdAJykgPDwgMiB8IChtZmdbMV0gLSAnQCcpID4+IDM7DQo+ID4+IGRp
ZmYgLS1naXQgYS9saWIvaWd0X2VkaWQuaCBiL2xpYi9pZ3RfZWRpZC5oIGluZGV4DQo+ID4+IGJl
MGNjZjUyOS4uZDllMzk2MDY1IDEwMDY0NA0KPiA+PiAtLS0gYS9saWIvaWd0X2VkaWQuaA0KPiA+
PiArKysgYi9saWIvaWd0X2VkaWQuaA0KPiA+PiBAQCAtNDU3LDUgKzQ1NywxMCBAQCB2b2lkICpk
aXNwaWRfYmxvY2tfdGlsZWQodm9pZCAqcHRyLA0KPiA+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGludCBoc2l6ZSwgaW50IHZzaXplLA0KPiA+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGNvbnN0IGNoYXIgKnRvcG9sb2d5X2lkKTsNCj4gPj4gwqAgdm9pZCBlZGlkX2dldF9t
b25pdG9yX25hbWUoY29uc3Qgc3RydWN0IGVkaWQgKmVkaWQsIGNoYXIgKm5hbWUsDQo+ID4+IHNp
emVfdCBuYW1lX3NpemUpOw0KPiA+PiArdm9pZCBlZGlkX2dldF9zZXJpYWxfc3RyaW5nKGNvbnN0
IHN0cnVjdCBlZGlkICplZGlkLA0KPiA+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGNoYXIgKnNlcmlhbCwgc2l6ZV90IHNlcmlhbF9zaXplKTsgdWludDMyX3QNCj4gPj4gK2VkaWRf
Z2V0X3NlcmlhbF9udW1iZXIoY29uc3Qgc3RydWN0IGVkaWQgKmVkaWQpOyB2b2lkDQo+ID4+ICtl
ZGlkX2dldF9hbnlfc2VyaWFsKGNvbnN0IHN0cnVjdCBlZGlkICplZGlkLA0KPiA+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGNoYXIgKnNlcmlhbCwgc2l6ZV90IHNlcmlhbF9zaXplKTsNCj4g
Pj4gwqAgwqAgI2VuZGlmDQo=
