Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA33D0C5F8
	for <igt-dev@archiver.kernel.org>; Fri, 25 Oct 2024 09:55:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5504410EA5A;
	Fri, 25 Oct 2024 09:55:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ALyDXwsg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCFFA10EA5A
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Oct 2024 09:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729850113; x=1761386113;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=v5sqSn+kEs/nWHoUEVx0UAnhVdsmUt8ZXmyw9IZL04g=;
 b=ALyDXwsgvGSfi3J2K8SDKt7h2QbVvVrBKoyyN6/kZLqk3BDBHpaLRb+9
 bzqSKHUi9pCUKP8hcWqevg+vn7Tjzwk/I458QT5wml7MOgYwEXoRHGlfu
 lRqMWhKFJynnLKrDSl5/1CVBhB4EUeqfMljJ7NkxjmhBza3A6GrlrQfiT
 VrUyGZ4HR41UH6rKiUUva1+T8REQfh2PK14jv7GkTtMJUvfBjcwcFa0it
 kE/9hLtDeVyBw73bw9Vfrr8RzDFJg3iOnxsEJp1Sb4j7lDLwFkowrgI01
 q7luffjp8HRTeEX4qQADHi/nnRPwB0i6aAD4jHhdQ0OWmWHKZkWypWXeT w==;
X-CSE-ConnectionGUID: BAkAtkaFRHW3D7CK3IHg+w==
X-CSE-MsgGUID: HF4dAEyWQxaKi3B41PoEkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29458302"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29458302"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 02:55:13 -0700
X-CSE-ConnectionGUID: a5GyXEQpTu+wkSn9eRxLHw==
X-CSE-MsgGUID: znbdKJxgRRyiIrSzP19bgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; d="scan'208";a="80531021"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Oct 2024 02:55:12 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 25 Oct 2024 02:55:11 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 25 Oct 2024 02:55:11 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 25 Oct 2024 02:55:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QVo8K62hlJstBu/E8C5s+FFc6SAuwQ3MJXgyUe6/gr9yh68B77YVx+PEwH281+1jqEZGDtaB2Pqo5vCyaBCYRXApBd5OgKqgB5MlxVtU5C+tP/jhtY9pzwQH3Aik2lZPhc+eCRf2bPVKOrpytWaU36+d2KEv3bv3JWpzm743HYtvIcNga0SxnVbPxxKqU5uM9tpN+nYyNP2Mmch8Gm9sJPkOB0PCcCCA2Zsh3nQk1ivkVePMeqYf2YHaOnQiLMsncct+0oV3DP5Y767FTRFMInSjgsPcc1EwpxNEemJNStYy8k19l48++yvQR5nuUlGiXS/L9pW5bYTTSAsTp3SX3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v5sqSn+kEs/nWHoUEVx0UAnhVdsmUt8ZXmyw9IZL04g=;
 b=gtwPymjJ5ksv1csrBjdU5+ZPdTRjiZAbS2W2KkI/0ZZTWt8BQtCvP1xtRdiodI4cMuJeTKBLoAPtPJoxh1tz4bSzD1M8yucTOqTtsKw2fUZcZxP1w1DFEwBLjehHwEodPTIr6pqL5ykQnZ+G73cjdp5gvWPOtjnvIREByjh7wSwgtrvZkJZWC1hhvQGbCl1kJX4lHMqLiimIjmuTo2rI/5xoE2LEo+xK3Ae9VBlH46UUpD27G7f0BVmZm+CP6blqUSTaoK7ZwiVOwB0/kFyuEJnlEEBdKIUZrvgxQTuk+ic+1Xpxgf1XyWmclW4kUutu6anl4LwOMWwLAVgBHNcePQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14)
 by SJ0PR11MB5005.namprd11.prod.outlook.com (2603:10b6:a03:2d3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Fri, 25 Oct
 2024 09:55:09 +0000
Received: from IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9]) by IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9%5]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 09:55:09 +0000
From: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Sokolowski, Jan" <jan.sokolowski@intel.com>
Subject: Re: [PATCH i-g-t v2 1/2] /lib/xe/xe_eudebug: Add trigger removal
 method
Thread-Topic: [PATCH i-g-t v2 1/2] /lib/xe/xe_eudebug: Add trigger removal
 method
Thread-Index: AQHbJg2L2Ia971QB90KvbLl/DM/ooLKXO9aA
Date: Fri, 25 Oct 2024 09:55:09 +0000
Message-ID: <5172f06ba0cc45587cf724035740bf961cd3949f.camel@intel.com>
References: <20241024120851.328536-1-jan.sokolowski@intel.com>
In-Reply-To: <20241024120851.328536-1-jan.sokolowski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7864:EE_|SJ0PR11MB5005:EE_
x-ms-office365-filtering-correlation-id: 6529fc86-cf8a-4424-8204-08dcf4db1c69
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WlRWL3lVekdmOXZxUDg0K2ZXNFpwOUFvb3ZpWmc1WjhtTStEeFhhRTcybGtt?=
 =?utf-8?B?bW54SENUalZKVWE5R3NRREJDUFFpU2l5L2xnRUVRbDRtblUySUtpY0xoUUs5?=
 =?utf-8?B?cFh6RU5SS1pseFYrazB4R1EwdE1ZNVJOdHhoNHpSM0ZRVzRMdjJCZFlPK1Z3?=
 =?utf-8?B?QkZOdHMxMFlleC9meHo0WW1HSFFCTndocnpMdnd0UWVvQlF4U2JQVnJhRndt?=
 =?utf-8?B?WlUvM25GWC9DUmd5Y2R3cUE1RnlTVmxhVlEzK2lIMlFPVjJ5N0M4cllsYi95?=
 =?utf-8?B?azU3YXE4ak94RkFINWdIRkFPZ2FGQnVvaVRFSGpwZkw1bkdoOGJSelVUOHV0?=
 =?utf-8?B?M2ZaMzQvMythRWVvTmRxVVVyNlpsN3V6K25DeTdNRmZHWHd6dzR3d0lGZ0dt?=
 =?utf-8?B?bjBRTUt1Mm5RNkJxbUMwZlIwd1dLaU5tMHRrditXaUlyckxyYnlmYzFmRFQy?=
 =?utf-8?B?cDNydmRsZU5EUk1zSnhJMVNjZitGY0cxM29xQnZYN2dLUmcvOGFreE96Nmo4?=
 =?utf-8?B?Q25OSkYwOWxNcUFJWGI0V0JQQWQwRkd0RFA4TUZ3di9VOVVxYUd5SmtBVHlB?=
 =?utf-8?B?L3FsV25Cd20rNHFYREU2ZktWWm1Ha0svWWNZRWJSYWh2U244aU9aaGR4Qzlm?=
 =?utf-8?B?K002Tk5XTU9pNm5NYnVHR2JPK0NrNHU2OW1HYlVwZVNxRGJkeXBLYTFFNXZy?=
 =?utf-8?B?WEoyWFE2WnNwb3pFazdlZ2VXNnBBMlZvdW1sYW1qM3BQcW9YZWQ1aFFISnBo?=
 =?utf-8?B?ZEI4ZVJaTHlpN1VxUDRnTDVRT1NRTDlLWnp4UFQzd2dGamNEcjdzZ0xXZk0y?=
 =?utf-8?B?S3lzdW9ZNms0TXpjWkFOKzFvNEVNM3BLb3lGU2pTcm5ReENsTXBOVTRaRGFV?=
 =?utf-8?B?cG1LUXgvQXNScnAxWUpXRW5RcE1mdjdpMW1vL3pJUXhna2U5UGJ1UThxTENu?=
 =?utf-8?B?ZS9GN29HWUswMGhTTnUxZlVVY3JhQkVMUWFPT3FieG1hd2NBNmo4NW9YRlZW?=
 =?utf-8?B?b1pabjUyZFdOYm4vUUxTaytkVzNzeC92QnBrRjMvQkx2MW94K0ZreG9mcU9F?=
 =?utf-8?B?eis0cWhZaExKVlVvb2ErYUJQQTNERkk0QndZczRGeklFWjJsVVRJQk1laFRV?=
 =?utf-8?B?bm5XcEdJTS9HQ0I2Q29aM1YwclhlZldMME9BWXpmYW91T1Jid3pwMHNuT3ps?=
 =?utf-8?B?UTdhNDRScjNQZ21sYUVJNTN6QkRZeDRMNlUzVnc5NGRzYkJ0a3JGWWQxSWFi?=
 =?utf-8?B?ZjhSZ1UxM3pHdHJhZjZIcm9lZ0ZqVzRjOFp6VnF2RGZXWnZISFZtMENLZVVt?=
 =?utf-8?B?ejlCTW95eWJPUlVFWTBMVVBjV3RCUng3WnNpUTUyaWpianFZVkc4NHc3V2E4?=
 =?utf-8?B?VFFCVE5xNVpMOWpqa2cyQWNua2RldWVpY2ZPVWhSbTNjeXhsYUI1RFkvSUFI?=
 =?utf-8?B?YUwzUDRxM1d4S1NXMkR6OHYwLzQyVnoyMDRqcDJVSnFCS3p0MGkyZ2ZNeXYr?=
 =?utf-8?B?eFNobVloOWEzb0I1b0VWekFWRVVyb0EwcWRDM3ZieCtId0Z1TlFDMlBHWTg2?=
 =?utf-8?B?ZUVIalJkRzJsb0RWQkdPRHd3cHQzU1ovMTlkSzdCZ2sxaHpSbjdDM2ZZS29W?=
 =?utf-8?B?dy9Na0NPVGcxeUU5WkpiMUZxTG9pdmx6bXIwc2VFekRLeWlFTUQxVWJvY2Zo?=
 =?utf-8?B?QU5iK0FkQjdXZ2dBY2VLT0RId0JGL25NRDIzV1pKYS9yZ2tEcnpoMDE0clVZ?=
 =?utf-8?B?YWRRSUhTcTF2SEFuZWNRQWgwUjIwdWF2Wis0UXB6Q1NxcVlBTHRXWjFHaWEy?=
 =?utf-8?Q?DcWs3jUWqAzRBxweWOyNq+YZTvafiDOKRcXq8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dytEQVU1VlRrUlI5YmJ2T09HOHRBVERQVkJCN0YyRUhrNklTZGova2RVbTVR?=
 =?utf-8?B?OGRIN1k1ZHdKSXgvdG96Ly9TREwvZTh3SVJ3MGZ5NUNVY2ZmWHVsVk5aTnhk?=
 =?utf-8?B?Z21pQnFQWll1QU9iV0VjeUhrMU9TZ3crWGdXcEpXQ1NMcHdNM09CMG1YLzRW?=
 =?utf-8?B?Wlo2NDRYWktwVi94RjBpQ2ltdTBFL3ZBK3Y4UmtkK2lMTUFyVjY0ZWNOR3N6?=
 =?utf-8?B?c1RYQjVPUFUvMGdqQisrZzB2NlBMT2VUWkRNU1NmUkkvTXRtUDY0K2IrZ244?=
 =?utf-8?B?UVpUcUtKeS84Yy80WVByZDJvS2M2YldwaEtCazc3SGJ3UXh2ZlpadzJLZkJ3?=
 =?utf-8?B?TndjM2d4czJSbTVicUdWMmJ1YTJYZllLdTZUT3NQMlJBclJvWGVUeXl5d0Nk?=
 =?utf-8?B?QXJqY1dVVE1IZ2E5NStsczRxRUNSS2hsTUhjZ0FCcTNCSVo1dTljdGU3WXhF?=
 =?utf-8?B?K3NGZEJtaGZLbjBuQUNPeWJQVTg3ZWRMN1F6Sm5ueVlqemo3OW9RYWttZWNo?=
 =?utf-8?B?MHhmMUxzbWdlYUh1RmpBUDd2b1FvME1XTDBWaFhSKzZ0NmtCYkRGdnFGWE54?=
 =?utf-8?B?eFNYOXRaVXNvVllGdCtwbWNyQk85MmcvSkowU0JRNjdZQmZ4Y3VsSWcvVXlM?=
 =?utf-8?B?MFJiZ1RhOEVOV0xPVzhsWlloRGxBSnc0eWkzQ1U2aWc1WTZLeHRIM1RIQ0lq?=
 =?utf-8?B?Wkw4ODhuNFQ3bE5oYWpIYWFNdHdKZlVqdHpwdTc0Nlc2a2RTUXE3bFk3eVlP?=
 =?utf-8?B?OXlTV3VLU3Z5UVNYKzRzNnhEamFYTUxIUEs2N1VZZmpNUnd0QTdkN3ZoZmx4?=
 =?utf-8?B?bG9Fem5zVEU5cS9oMEVZQmJIeDM3NGthNFZhVXA1QWRFeHFSUDhSVnA1eGRY?=
 =?utf-8?B?YmNPaUhYRklVNlhRb3pGVGlVdFhGRlBTemVWVkRCRVVzbFF2TmFHZEl4dVFj?=
 =?utf-8?B?UVlHYXBqdEhwbnlPbzBKZnI5QjJSS0FnYWdEV2pMUTNESFVISVliVkFtMW1v?=
 =?utf-8?B?SDJ2OFZkZkwzclU1VjQrMnJPNXVqamRPNVNKNU9wTStmNE9UTDlUbjZ1NVRN?=
 =?utf-8?B?TkZEWUtvMDZPVVR1R1p3aFc5NDFTcGpvWCtzTXc5b0REZGVrRURpaE1ER0Nv?=
 =?utf-8?B?Ny9pVmwxaGFKOXJ6TmdqeDdaU3FrdzlGRnJqVmVpcDVSbmhGNG1RWmFtcW0y?=
 =?utf-8?B?YjJUM01Rb0wvdmozMDNFYUNsd3d4Y3RxOVBXZEluVWJhYkE4SklIV09SMDNt?=
 =?utf-8?B?emdPb0Rsdk44SURrNVlrQTRQK1hpQXhycTFsQk9kK2orWWFoUlhhT1VqaXEr?=
 =?utf-8?B?WStHdXBzRnIwdGJjLzJTWTB5TDdPSWcrOHlMMGhpc2RUdk5YWmhEcEtac2l0?=
 =?utf-8?B?YWw3cmxnVjZtRW84TCtRaHpoS2JQY1RCcWc2TzZTeGtvYjU5Z1RYYTRhRFgv?=
 =?utf-8?B?dnNNaUF0aWJCb2Q4U3RYNzFncFM5cy9sRUJaclZrUjhEY05reGE5OFA0RTNh?=
 =?utf-8?B?ZDhBK2F4cUxvelc0aWR6V2czQXFGMDZodk8xVldSbktLZkRlRWJ5OEdoK2Ns?=
 =?utf-8?B?SWJGQldIeUEzOEU1Q2IweHgwTm1HVWtyQ0V3UU1sanRyMlI3QnJCV0RackZw?=
 =?utf-8?B?SXpURU1JR3RoTzlsbGNORDBmbjlNV2lBY3pGS09mQlgxYTVGZmFPbk5uRDhs?=
 =?utf-8?B?QWRlQldWcEJ3TG1JTGw3elFBdk96MTMwdkYyQk9SOGRrNUwrMFVZRFdMUGlL?=
 =?utf-8?B?MFVYd1B0Wm5RY2wzaDJSUmVPR3VLbGtaMEIyTFlGOUpMZWxTa3Jhb2ZLdDd6?=
 =?utf-8?B?NnNGTEhXYXY3V1ErSUNBUnRLeTIzbkJmNmtvbFNXUjVYbmNxWGhLMm1rME9H?=
 =?utf-8?B?V1VGR283NjcwaXBUQ1B5Q092VmJsTEc5MXJFaVpleTdKYnN3VEFBeGJXRXY4?=
 =?utf-8?B?bUxBeG81TVFLbXh1WDBQeWFpZFB2UFl5ZGR3bXFHNklwNG5MZThwVndBV3NJ?=
 =?utf-8?B?b2RpN0dROHo1L294TjNzandPRmltSHdjWFhUVjhlV2NqT3UydDVzcCtQQVFN?=
 =?utf-8?B?NWxJQ1RnRXNFUURBL285MVo2RWs0Q0lvbEk3KzdhSU5jOFphVEs0VGdxU0Q0?=
 =?utf-8?B?a2I4dk1zYW1GYUhhaWg2TjlRMUVRWWpkUmZMS1oxeXlZdURMM3prZllDU01w?=
 =?utf-8?Q?1y7vG/RiY9ryWBJaTG9wT5E=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2D1D5FA2CF4DE34496EA351AF50ACF57@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6529fc86-cf8a-4424-8204-08dcf4db1c69
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2024 09:55:09.0865 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sNAFHqADjtTTyqYGaWRMLFZmNQ8dcnMG2Xj7WPWl1PEJo4G7Y4QGJHxLP7lcDxbQsZUPkvfyKsdGyCtjMpAbJripcNH33EeIaZ2nrB22p1U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5005
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

T24gVGh1LCAyMDI0LTEwLTI0IGF0IDEyOjA4ICswMDAwLCBKYW4gU29rb2xvd3NraSB3cm90ZToN
Cj4gQWRkIG1ldGhvZCB4ZV9ldWRlYnVnX2RlYnVnZ2VyX3JlbW92ZV90cmlnZ2VyIHRvIHJlbW92
ZQ0KPiB0cmlnZ2VyIGZyb20gbGlzdCBvZiB0cmlnZ2Vycy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IEphbiBTb2tvbG93c2tpIDxqYW4uc29rb2xvd3NraUBpbnRlbC5jb20+DQo+IFJldmlld2VkLWJ5
OiBEb21pbmlrIEdyemVnb3J6ZWsgPGRvbWluaWsuZ3J6ZWdvcnpla0BpbnRlbC5jb20+DQoNCk5v
dCBzdXJlIHdoeSB5b3UgYWRkIHRoaXMgcmIgYmVmb3JlaGFuZCwgYnV0IGFueXdheSB5b3UgY2Fu
IGtlZXAgaXQgZm9yIGJvdGguIHYyIGxvb2tzIGdvb2QgdG8gbWUuDQoNClJlZ2FyZHMsDQpEb21p
bmlrDQo+IFNpZ25lZC1vZmYtYnk6IERvbWluaWsgR3J6ZWdvcnprIDxkb21pbmlrLmdyemVnb3J6
ZWtAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGxpYi94ZS94ZV9ldWRlYnVnLmMgfCAzMCArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysNCj4gIGxpYi94ZS94ZV9ldWRlYnVnLmggfCAgMiArKw0K
PiAgMiBmaWxlcyBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
bGliL3hlL3hlX2V1ZGVidWcuYyBiL2xpYi94ZS94ZV9ldWRlYnVnLmMNCj4gaW5kZXggMzY3NjNh
MTg0Li43NGFhMjYwMjQgMTAwNjQ0DQo+IC0tLSBhL2xpYi94ZS94ZV9ldWRlYnVnLmMNCj4gKysr
IGIvbGliL3hlL3hlX2V1ZGVidWcuYw0KPiBAQCAtMTIyNiw2ICsxMjI2LDM2IEBAIHZvaWQgeGVf
ZXVkZWJ1Z19kZWJ1Z2dlcl9hZGRfdHJpZ2dlcihzdHJ1Y3QgeGVfZXVkZWJ1Z19kZWJ1Z2dlciAq
ZCwNCj4gIAlpZ3RfZGVidWcoImFkZGVkIHRyaWdnZXIgJXBcbiIsIHQpOw0KPiAgfQ0KPiAgDQo+
ICsvKioNCj4gKyAqIHhlX2V1ZGVidWdfZGVidWdnZXJfcmVtb3ZlX3RyaWdnZXI6DQo+ICsgKiBA
ZDogcG9pbnRlciB0byB0aGUgZGVidWdnZXINCj4gKyAqIEB0eXBlOiB0aGUgdHlwZSBvZiB0aGUg
ZXZlbnQgd2hpY2ggYWN0aXZhdGVzIHRoZSB0cmlnZ2VyLg0KPiArICogQGZuOiBmdW5jdGlvbiB0
byBiZSByZW1vdmVkIHdoZW4gZXZlbnQgb2YgQHR5cGUgd2FzIHJlYWQgYnkgdGhlIGRlYnVnZ2Vy
Lg0KPiArICoNCj4gKyAqIFJlbW92ZXMgZnVuY3Rpb24gQGZuIGZyb20gdGhlIGxpc3Qgb2YgdHJp
Z2dlcnMgYWN0aXZhdGVkIHdoZW4gZXZlbnQgb2YNCj4gKyAqIEB0eXBlIGhhcyBiZWVuIHJlYWQg
Ynkgd29ya2VyLg0KPiArICovDQo+ICt2b2lkIHhlX2V1ZGVidWdfZGVidWdnZXJfcmVtb3ZlX3Ry
aWdnZXIoc3RydWN0IHhlX2V1ZGVidWdfZGVidWdnZXIgKmQsDQo+ICsJCQkJCWludCB0eXBlLCB4
ZV9ldWRlYnVnX3RyaWdnZXJfZm4gZm4pDQo+ICt7DQo+ICsJc3RydWN0IGV2ZW50X3RyaWdnZXIg
KnQ7DQo+ICsJYm9vbCBmb3VuZCA9IGZhbHNlOw0KPiArDQo+ICsJaWd0X2xpc3RfZm9yX2VhY2hf
ZW50cnkodCwgJmQtPnRyaWdnZXJzLCBsaW5rKSB7DQo+ICsJCWlmICh0eXBlID09IHQtPnR5cGUg
JiYgZm4gPT0gdC0+Zm4pIHsNCj4gKwkJCWlndF9saXN0X2RlbCgmdC0+bGluayk7DQo+ICsJCQlm
b3VuZCA9IHRydWU7DQo+ICsJCQlicmVhazsNCj4gKwkJfQ0KPiArCX0NCj4gKwlpZiAoZm91bmQp
IHsNCj4gKwkJaWd0X2RlYnVnKCJyZW1vdmVkIHRyaWdnZXIgJXBcbiIsIHQpOw0KPiArCQlmcmVl
KHQpOw0KPiArCX0gZWxzZSB7DQo+ICsJCWlndF9kZWJ1ZygidHJpZ2dlciBvZiB0eXBlICVkIHdh
cyBub3QgcmVtb3ZlZCBhcyBpdCdzIG5vdCBpbiB0aGUgbGlzdFxuIiwgdHlwZSk7DQo+ICsJfQ0K
PiArfQ0KPiArDQo+ICAvKioNCj4gICAqIHhlX2V1ZGVidWdfZGVidWdnZXJfc3RhcnRfd29ya2Vy
Og0KPiAgICogQGQ6IHBvaW50ZXIgdG8gdGhlIGRlYnVnZ2VyDQo+IGRpZmYgLS1naXQgYS9saWIv
eGUveGVfZXVkZWJ1Zy5oIGIvbGliL3hlL3hlX2V1ZGVidWcuaA0KPiBpbmRleCA2ZTQ2NjYzMzMu
LjlhYWRiZTg0NyAxMDA2NDQNCj4gLS0tIGEvbGliL3hlL3hlX2V1ZGVidWcuaA0KPiArKysgYi9s
aWIveGUveGVfZXVkZWJ1Zy5oDQo+IEBAIC0xNTAsNiArMTUwLDggQEAgdm9pZCB4ZV9ldWRlYnVn
X2RlYnVnZ2VyX2RldGFjaChzdHJ1Y3QgeGVfZXVkZWJ1Z19kZWJ1Z2dlciAqZCk7DQo+ICB2b2lk
IHhlX2V1ZGVidWdfZGVidWdnZXJfc2V0X2RhdGEoc3RydWN0IHhlX2V1ZGVidWdfZGVidWdnZXIg
KmMsIHZvaWQgKnB0cik7DQo+ICB2b2lkIHhlX2V1ZGVidWdfZGVidWdnZXJfYWRkX3RyaWdnZXIo
c3RydWN0IHhlX2V1ZGVidWdfZGVidWdnZXIgKmQsIGludCB0eXBlLA0KPiAgCQkJCSAgICAgeGVf
ZXVkZWJ1Z190cmlnZ2VyX2ZuIGZuKTsNCj4gK3ZvaWQgeGVfZXVkZWJ1Z19kZWJ1Z2dlcl9yZW1v
dmVfdHJpZ2dlcihzdHJ1Y3QgeGVfZXVkZWJ1Z19kZWJ1Z2dlciAqZCwgaW50IHR5cGUsDQo+ICsJ
CQkJICAgICB4ZV9ldWRlYnVnX3RyaWdnZXJfZm4gZm4pOw0KPiAgdm9pZCB4ZV9ldWRlYnVnX2Rl
YnVnZ2VyX3NpZ25hbF9zdGFnZShzdHJ1Y3QgeGVfZXVkZWJ1Z19kZWJ1Z2dlciAqZCwgdWludDY0
X3Qgc3RhZ2UpOw0KPiAgdm9pZCB4ZV9ldWRlYnVnX2RlYnVnZ2VyX3dhaXRfc3RhZ2Uoc3RydWN0
IHhlX2V1ZGVidWdfc2Vzc2lvbiAqcywgdWludDY0X3Qgc3RhZ2UpOw0KPiAgDQoNCg==
