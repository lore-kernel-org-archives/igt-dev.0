Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE73CCD18E
	for <igt-dev@archiver.kernel.org>; Wed, 15 Oct 2025 09:36:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D63FD10E767;
	Wed, 15 Oct 2025 09:36:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iXFd/pGu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FA5210E767
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Oct 2025 09:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760520998; x=1792056998;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=wWw1XIo4Tw12JOJpZKaY7NlaEEoP7aTuqle+Roi9lVU=;
 b=iXFd/pGuaotTEm8++RE/4PLHgO2FihZ+9N9Cl6wHsUQr8LfYbE5avTDa
 XdJl/v6lihvDH2zdxZWQUKUKySS68f3KxBW9VWKM0K6sTAeWsI6Docko6
 iPXQugdjl25R5CAHrUzmU2OG1oRLP9n6tD7DT/OnZNKURxk7fHmJ74ElH
 V+5jRDrTlTGrLWCHlpUgiBq64k7lLRAdr174wKrpa6rjePxtZTDoxtAfW
 5RFQoDtTViZ+V04El/ng8l4kTyZydqLkIVMeEBYcX/3bhxywSQR7OFCrn
 tASesQj92oUkVxqWRD6Cj0hC5U94YXyOgI/8/z6qbMZkrgZqP3sGc8D2L g==;
X-CSE-ConnectionGUID: MddWgldcT7uBys1gfi1bKQ==
X-CSE-MsgGUID: gxRyQP62Rs2AqBEIFz4bOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62588148"
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="62588148"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 02:36:38 -0700
X-CSE-ConnectionGUID: ZKoV5xDYSk605iVQ1Gyn6A==
X-CSE-MsgGUID: Ht1dndY7Tw69JDJ7LoF3pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="219272630"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 02:36:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 02:36:37 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 02:36:37 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.25) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 02:36:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mmb7ytOpfQV1x5JTQFn3VrIReqLpW8IIGxjFqQo88ccB89FX/dkRXjpoBtWljqh352BbSZK54evJExaTO6O4Mamm2BY2kP4bbLd+Cr61Xj6xmpCTdequPiGMOkGKF+u53iAQnVNpw7uGJQG5lfymBqltf8/Gf7pvnQ6cGn20M5EEJFAC9j79FT89y5KPnfE/SqHp5tcMANxTL/Mswz7EGTTF69kpDQ5mkERqkHoSpEW/fjKJ4XnTqTLbS1ymGb/uZuVo1F69uu278QSJCYrfcu0suEaBNyqumBwl0bxFKqJizeR5SwTyu0W1JUJVlN/u5CIESUuWQRsiQz/C02bJgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wWw1XIo4Tw12JOJpZKaY7NlaEEoP7aTuqle+Roi9lVU=;
 b=cvrWpjOdMbWbBdpq2mcOH2C1qP6rJqRRDeRUHakxMhF+UC2IgcesROPFa+bPK6FTsj5gkk4jBouFs4Vdf7dPE+ry6oEt1i31v9JfE2nQ63WLg2hs1GtMdqfyA8rJD7JWccsgB9zbRo0UdxQH67HXHJ6vzDHDQB10c6djhj5xVdpQYXiHsyCwPtOwTbSR2bgCCxsd6WxIxji1uUVoDRzZZ/I0PH6joTulFFzplEGCYv/HziU6s0FnrrnDMHaOlvgi5Qxsh+3cOnEBudAgP4eUstOc5Ift2Rd8nVU21Z4Jst7eUej7fHGowCuRCceHd9Oz7UnNsRf3Va3yBI0HFsOUOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 CH3PR11MB8518.namprd11.prod.outlook.com (2603:10b6:610:1b8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Wed, 15 Oct
 2025 09:36:35 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%4]) with mapi id 15.20.9203.009; Wed, 15 Oct 2025
 09:36:35 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 2/7] lib/xe/xe_eudebug: Fix token to str
Thread-Topic: [PATCH i-g-t 2/7] lib/xe/xe_eudebug: Fix token to str
Thread-Index: AQHcPO5ojuN8MHhmGUK6knkbOGF7k7TBqI+AgAFLfPA=
Date: Wed, 15 Oct 2025 09:36:34 +0000
Message-ID: <DS0PR11MB72645EA54513F8230C4CDFE6D9E8A@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20251014093848.2394531-3-mika.kuoppala@linux.intel.com>
 <20251014134825.2398331-1-mika.kuoppala@linux.intel.com>
In-Reply-To: <20251014134825.2398331-1-mika.kuoppala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|CH3PR11MB8518:EE_
x-ms-office365-filtering-correlation-id: 97107193-89c1-4772-2a6c-08de0bce54fa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?MFkwVEYrUWdIRnMxTFUySWlNT0tYWld2YVpTMm1aTUU5T25kZFdBVU9MbTcy?=
 =?utf-8?B?ZFZrZmRqaWdsNjVSLzN2NmQ3TmZiYUZrUm9yNUx0bndwbGJqRmtHei9rTmVU?=
 =?utf-8?B?eUVacGlLY0cvZ1F5VVlDU1FxSVlFd1NVT1ZVSWNjQUdWNllaMk94c3hmMThD?=
 =?utf-8?B?TTMyZlJyVFd1TkU2cmtMTCs0MGN2VGtnQ0FWZlVvckNWZWJ1UXJiclJhaDZr?=
 =?utf-8?B?NDBVR0xJYnVod0hhRjFmOU9hNlppOFdDclZZY1VucVJub0l3RjhEQUpKUStT?=
 =?utf-8?B?a1FleWh3RnNiRjVPZUZqYWhRRFp2cHp5cnpDQmtyOEhIYWhVMmtKR1NDbXov?=
 =?utf-8?B?OEhXY3BRQTQ5M3dJYkt5VU1iOEpJeGNHZ2xXN2thbHZJSWkxWG5jSTFYdXhu?=
 =?utf-8?B?cGhyYjJVYTBuS3VxQWw4b3dpMC9BQnFhQi85ejFpZEVwTkxLM1liK2RGZ3pm?=
 =?utf-8?B?aElxOGc2RUJIT094UjRjbkEySzNYdzFjUXFXRlM0SG9xekx4eXI1T0FSSzBO?=
 =?utf-8?B?ZFJZNlRHR3ZaR3pLNGNYa3NFUjUwaUlueUs1bjQ4V0U3dkhhcjZOWlpadG12?=
 =?utf-8?B?bW1tL2xtY3hBM0xucTJYUE9XREE2WTdwTkMvUmVoSUQ2STAvdUQ3VzZjYkZv?=
 =?utf-8?B?NHNQMHlabCtwRllpMEdRQlNpa1JuRUNmMU5mY3hYTStLQmVSRVIzTXlxRXBt?=
 =?utf-8?B?WXBBdERsSm5reXBTK1h0VDJtckViYUFlRlRxbHJ6K2E5T2EvRlBHd1hLL2xx?=
 =?utf-8?B?RjJxcVVNcnI1MktFQ3drdGRKYUhJQ2hUeEczdHlNOEc1a1VJaWR5RE1VZ0pq?=
 =?utf-8?B?dW5EK3F0eTZCc2EwM0YrVFdXZTl5QnZaTll3Q3AxbG4wOGNVOVBiOVpmUXdi?=
 =?utf-8?B?SEowbnVZcDN1ZDRJejJXdFZicXFZRXZDdkI2ZVMrZC83QmtKVHpqd2FPbElL?=
 =?utf-8?B?ejVuSTFheGVSUVpvWmxQWUJmc2tHaW1zLzVGcGV3Q2gwYmlIR3hBT2VhbDhQ?=
 =?utf-8?B?ODRHM2RqcW5IOUlaMEpXYXdQOVlmMDYzaXEyM0JMNW9XSy9ieXI2VkRDQWts?=
 =?utf-8?B?blZFSnJUR1BlNGFvWDZrUlZmdEh5SGREZkljUWM0KzFNNDBFbjdTaXFyeTdo?=
 =?utf-8?B?aE1sTnI2OXBFbnV0R2lJNjJwY1VDM25DVFNVTTRqQ010WjJodENJZ3pKZG8x?=
 =?utf-8?B?L0QrZFM0Z055RFhZN3Z6TlZMaGtKZzhUWmczQWY5Z3dRa2dmZjI1ZXZ4T05h?=
 =?utf-8?B?TVRqNFgweURtOW8zN1hUSUsrVmZnbUdpekxyempkRThmQ3UveW95ZHhLMmts?=
 =?utf-8?B?cmhXcDNtdjdJbEJITDRMZFRYbmJ5OGJOUE1sOFhUYm5XdE5IU3ZyZFFjcUg4?=
 =?utf-8?B?Tlh1WDJoeEgwdFJjUFZuUW5rV3lSdUhtcnZiTlIrQ21lWjMrZ1JpcmdUNXdG?=
 =?utf-8?B?amNDVzd5cDVva0JNZjFYR09iNFJ0RTA1UnhIdE1WUStKdGlTV1dENW5ZVFVq?=
 =?utf-8?B?UVhJSjdEOGQxcGhwcG1OODVRa1N3dnVQbkM4Z3JWSlNxdmI0alM0QXhyWVNa?=
 =?utf-8?B?TmFOcmFkb3RlakZiYUg3ajB4ZldVUnJXd3BTaDBMWEkrS3cvcFhtdUdpeGlM?=
 =?utf-8?B?V0t0ZFFvWkhFbDlXTzQ4bk9jRmphSnYySkYrKzM4MVp4bE1GQ0dTWlRhM2oz?=
 =?utf-8?B?eC91VmIxUlRqRERSdmhKbGNUSUpZZDhOOFBJOGVxWXErSkphM1l3eEF6TlBX?=
 =?utf-8?B?VDVMZXhzejE4QWVpQ0ViK0RaS2xPa0l3YWZ0N2pJOHVaOG90Q3FoaUIzUC83?=
 =?utf-8?B?YW9heGhLbnIvWVR4ejhMU0pwdk9kNitodkpicms0Wnd3TTRxb0dGTTlEejFD?=
 =?utf-8?B?blhHekptODRYeUNWSktlTk94NFlIaUFyZEFhYzB4YU1UeWRxK3EycUY1L2NG?=
 =?utf-8?B?NjZhODduejRHV2FhWjNQYVNEZnpGbVVGQkFDQ2xEdTlySGRsRWgzK1h3TFRQ?=
 =?utf-8?B?TVBIWFFuaG1MSDB0Tmo0RFFjTGRCeGQxYU1aUnhvdzN2aWNBd2ROMlFNOWxj?=
 =?utf-8?Q?hRDlXg?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VHhHYm10NmR3UVU1RlVWOFQ0Q256T1EwaTdDOUFCbnh6cSt3TEs3eG8ySjM4?=
 =?utf-8?B?VzBDQ1NNWDNhOTNlcFE4V1gzU01iQ0t1K0s4ZkpEaGFncjVPTjNqSGE4MENm?=
 =?utf-8?B?Nnk4Y3ZtOVdPbzJrY2tZelQrRER2LzRNRzVPRm5DdS9xV3cxcXpCQ2FvVWpn?=
 =?utf-8?B?TlFwTlpWRkRSMXV4R2lBMXFWNE1EQjVYQU5KOGxaVUhBaE5oMklKZ2JYU1NI?=
 =?utf-8?B?cEdGUktOYisvWVAybzlKYTBTaW52c1NyNHVnZkRtNU5XOXVBVWViNCszRThN?=
 =?utf-8?B?YnVLRE9heGdOTVdwMGQ4UTdKeE9ZTkxRWXR1Q1ZRTDQ0Uk1QNnY5Ti90ZGQ4?=
 =?utf-8?B?OFBlWjlNVlkzdlpwYUhMeGNMZlVmbGpBWTd5dlFwMUtTRXpMOXdXR3N6dEZD?=
 =?utf-8?B?eGZPMGs1ZDZhbEh0bWRKd2JVcFhqWXZpS1NYV0ZOaEhrVnZ5anJMYi9FVUU5?=
 =?utf-8?B?OHN6MkR0MFRMV3B2MC9VU3UrZXhWNTVpRTFXbHNtbUV2VU1JNmdpa0dCcXlq?=
 =?utf-8?B?Q2c5TkFkK0ZOb1RjdndpQ0JoYllObG82SDF0MFRVWFhnTFNReWR1c3VpZnA5?=
 =?utf-8?B?NGdtSzVuSEsweCt6czJTRWxscGp3MHNhT3BGcDhYUEZiT203dzBLREVRTFZn?=
 =?utf-8?B?MHVxNjFMZGtkZTlFR25obmNJVE9oQVpTWktMN3dnYzlsa1JyK3hiTTlSK0ZY?=
 =?utf-8?B?VXRmQ2YvU2FIUGNFOVo5aXNzZ2VqZmx4cmtMOGtlQVpzSzNYaEtIM0hyc2RG?=
 =?utf-8?B?QzJxUURjdkZPMTc1SXlDbnN1bzAwN1J3ZWZyeGtmVlUwR2JwWkN2R0N2RnFF?=
 =?utf-8?B?c3A2cW9UZTJNN1V6V0dURVdWWFNudnZHZlJ2MU9SV0pTT0FRTk1IRHozQ3JG?=
 =?utf-8?B?SStpaytoaTdsRi9Qa2lxcGNreVBUcGxzUGVjTkluVXduUFc2TWxZRVJCWFJO?=
 =?utf-8?B?c0VwMFhwNG1TUlU3c1drcXVSbzRaYXRmOGZiTUR4dEN4Tk82cCs4S2ZBdUtF?=
 =?utf-8?B?VVBiTnVwQ2EvQkVIK2FtYlMxR3FwWjMvdm5GbmM2QWlGMUVLcjJXVlVHZ3cw?=
 =?utf-8?B?RzJtTjNYNHgxTWlubDNWT1hqWmFDZDM5c29RWGg4SVArMVJOemxkVktWZzBK?=
 =?utf-8?B?NWYySy9YYnBiaEpNc3JrUnQzNzRYd0xybzQ3YU5xRzdnZVEzT250YTRBV2tl?=
 =?utf-8?B?RTQxcWJpUzZwVGR4RHFnSHFPRHFaYXE3a1dxa1E1ckwwaUZXLzJ2NXIveWll?=
 =?utf-8?B?Qks4TDVRdTFBSEg3MEhLZVBFV1lRNVYyUXNMdGhJUzVoeHhBVFEyK2pkYmU2?=
 =?utf-8?B?aWpZcVMxOFVSSmgva05wNEhMbHg2ZFcvS1FMY0ZGYnA2WGpMVU53blNnSTNo?=
 =?utf-8?B?L09Od3FwZHE1Nkt4TTRUMGpMWjR5SVdNYjE0QVk0ZlU2Nkt1bGxpM213Sm4r?=
 =?utf-8?B?UjJQZm5qMHlhUmZYYzc4RU1rdjUrSmdwV1UwbWlMZ2VDSUJTYnh3Rkt2cWdJ?=
 =?utf-8?B?T2o2V001cmJGbkVxQ21qQVhJaXFOVkZEN05Rc251Z1VtU0VWUlpVNUhBQVRj?=
 =?utf-8?B?N1lmWTV4d3ljWXVscEsxSGI5NEVhNWpuU0kzanhPc1FVREdqU0NlODk1Mi9L?=
 =?utf-8?B?SDBzUm96aXNNMjJyc0tQVGNHK2U3eUp0dWczZWlYSXJHWkZEL2VOcUV3Q1dw?=
 =?utf-8?B?cUZ4ckZKL1lWeE5FN2xnZXMrTi9zd2d0cldaa0pNRjBKa21nTlUxLys1R0k5?=
 =?utf-8?B?cDczbHZLMG93S3ZJemEwNVVibng3VEFsQUNQd2E4UlUxdkYyaTZiV09COEYr?=
 =?utf-8?B?bko3bWdiN0RmM01SQVFxclFsbVFsTWxZTHdIMnArMk51dWwzRW9PMmxCbURn?=
 =?utf-8?B?L0Z0dXNuamtYcmlsY1MzWjhaQTVUMFJGUTdPdDVyRDlkbWFPd0UrSmxFcnRS?=
 =?utf-8?B?QjFMbG1MVFl6d0xWSC9UZ0dlZ2JGU1dWREVYZS9hREl0aG5SaGtHbUwrRFNY?=
 =?utf-8?B?dmxZamhITG1lM29YV1lzaS9zcmdvam1NRDE5Qy8xUThBUkExR0FnUGxob21y?=
 =?utf-8?B?OVhIb293QUVTTm9IRU94d3UydVUrelhKUFZGeG13RGFsc25WdUQvYzJMd3Ba?=
 =?utf-8?B?U25jbWtOTTlYeDVGUS9xUGtjQnFsRTU0QXR5OElDQ2RrMm5OM2tXMDM2ZTFL?=
 =?utf-8?B?ZGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97107193-89c1-4772-2a6c-08de0bce54fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2025 09:36:34.9709 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B+G8116uEvk5KdiRR6x5SuEJJzCTvDQuwzAZYl2k+MTwzOdG8oMZ76LnPWz4ds7QQB7llauOhe5pMjMKuNEpLYB6VIYsNMKKSZjhGhfPzPWFfrB+xNiwYbhmP90vmm6i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8518
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

UmV2aWV3ZWQtYnk6IERvbWluaWsgS2Fyb2wgUGnEhXRrb3dza2kgPGRvbWluaWsua2Fyb2wucGlh
dGtvd3NraUBpbnRlbC5jb20+DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJv
bTogTWlrYSBLdW9wcGFsYSA8bWlrYS5rdW9wcGFsYUBsaW51eC5pbnRlbC5jb20+DQo+IFNlbnQ6
IFR1ZXNkYXksIE9jdG9iZXIgMTQsIDIwMjUgMzo0OCBQTQ0KPiBUbzogaWd0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcNCj4gQ2M6IE1pa2EgS3VvcHBhbGEgPG1pa2Eua3VvcHBhbGFAbGludXgu
aW50ZWwuY29tPjsgUGlhdGtvd3NraSwgRG9taW5paw0KPiBLYXJvbCA8ZG9taW5pay5rYXJvbC5w
aWF0a293c2tpQGludGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIGktZy10IDIvN10gbGliL3hl
L3hlX2V1ZGVidWc6IEZpeCB0b2tlbiB0byBzdHINCj4gDQo+IFdlIHByaW50IHRva2VuIHR5cGVz
IHRvIHNlZSBjbGllbnQvc2VydmVyIGZsb3cuIFRoZSBwcmludG91dHMgd2VyZSBvZmYNCj4gYnkg
b25lLiBGaXggYXJyYXkgaW5kZXhpbmcuDQo+IA0KPiB2MjogcmVtb3ZlIGNsaWVudF9mZCAoRG9t
aW5paykNCj4gDQo+IENjOiBEb21pbmlrIEthcm9sIFBpxIV0a293c2tpIDxkb21pbmlrLmthcm9s
LnBpYXRrb3dza2lAaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBNaWthIEt1b3BwYWxhIDxt
aWthLmt1b3BwYWxhQGxpbnV4LmludGVsLmNvbT4NCj4gLS0tDQo+ICBsaWIveGUveGVfZXVkZWJ1
Zy5jIHwgMjIgKysrKysrKysrKysrKysrKysrKy0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDE5IGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbGliL3hlL3hl
X2V1ZGVidWcuYyBiL2xpYi94ZS94ZV9ldWRlYnVnLmMNCj4gaW5kZXggNGJmNjk3YTQ1ZS4uZjFk
ZmZlNGZmYiAxMDA2NDQNCj4gLS0tIGEvbGliL3hlL3hlX2V1ZGVidWcuYw0KPiArKysgYi9saWIv
eGUveGVfZXVkZWJ1Zy5jDQo+IEBAIC00MSw2ICs0MSw3IEBAIHN0cnVjdCBtYXRjaF9kdG8gew0K
PiAgCXVpbnQ2NF90ICpiaW5kX29wX3NlcW5vOw0KPiAgfTsNCj4gDQo+ICsjZGVmaW5lIFRPS0VO
X05PTkUgIDANCj4gICNkZWZpbmUgQ0xJRU5UX1BJRCAgMQ0KPiAgI2RlZmluZSBDTElFTlRfUlVO
ICAyDQo+ICAjZGVmaW5lIENMSUVOVF9GSU5JIDMNCj4gQEAgLTUxLDYgKzUyLDcgQEAgc3RydWN0
IG1hdGNoX2R0byB7DQo+ICBzdGF0aWMgY29uc3QgY2hhciAqdG9rZW5fdG9fc3RyKHVpbnQ2NF90
IHRva2VuKQ0KPiAgew0KPiAgCXN0YXRpYyBjb25zdCBjaGFyICogY29uc3Qgc1tdID0gew0KPiAr
CQkibm9uZSIsDQo+ICAJCSJjbGllbnQgcGlkIiwNCj4gIAkJImNsaWVudCBydW4iLA0KPiAgCQki
Y2xpZW50IGZpbmkiLA0KPiBAQCAtNTksOCArNjEsMTIgQEAgc3RhdGljIGNvbnN0IGNoYXIgKnRv
a2VuX3RvX3N0cih1aW50NjRfdCB0b2tlbikNCj4gIAkJImRlYnVnZ2VyIHN0YWdlIiwNCj4gIAl9
Ow0KPiANCj4gLQlpZiAodG9rZW4gPj0gQVJSQVlfU0laRShzKSkNCj4gKwlpZ3RfYXNzZXJ0KHRv
a2VuKTsNCj4gKw0KPiArCWlmICh0b2tlbiA+PSBBUlJBWV9TSVpFKHMpKSB7DQo+ICsJCWlndF93
YXJuKCJ0b2tlbiBvdXRzaWRlIG9mIGJvdW5kcyAlbGRcbiIsIHRva2VuKTsNCj4gIAkJcmV0dXJu
ICJ1bmtub3duIjsNCj4gKwl9DQo+IA0KPiAgCXJldHVybiBzW3Rva2VuXTsNCj4gIH0NCj4gQEAg
LTMzNCwxOCArMzQwLDI1IEBAIHN0YXRpYyB1aW50NjRfdCBfX3dhaXRfdG9rZW4oaW50IHBpcGVb
Ml0sIGNvbnN0DQo+IHVpbnQ2NF90IHRva2VuLCBpbnQgdGltZW91dF9tcykNCj4gDQo+ICBzdGF0
aWMgdWludDY0X3QgY2xpZW50X3dhaXRfdG9rZW4oc3RydWN0IHhlX2V1ZGVidWdfY2xpZW50ICpj
LCBjb25zdCB1aW50NjRfdA0KPiB0b2tlbikNCj4gIHsNCj4gLQl1aW50NjRfdCByZXQgPSBfX3dh
aXRfdG9rZW4oYy0+cF9pbiwgdG9rZW4sIGMtPnRpbWVvdXRfbXMpOw0KPiArCXVpbnQ2NF90IHJl
dCA9IDA7DQo+ICsNCj4gKwlpZ3RfZGVidWcoImNsaWVudDogJWQgd2FpdGluZyB0b2tlbiAlc1xu
IiwgYy0+cGlkLA0KPiB0b2tlbl90b19zdHIodG9rZW4pKTsNCj4gDQo+ICsJcmV0ID0gX193YWl0
X3Rva2VuKGMtPnBfaW4sIHRva2VuLCBjLT50aW1lb3V0X21zKTsNCj4gIAlpZiAocmV0ID09IERF
QURfQ0xJRU5UKQ0KPiAgCQlpZ3RfYXNzZXJ0KGMtPmFsbG93X2RlYWRfY2xpZW50KTsNCj4gDQo+
ICAJcmV0dXJuIHJldDsNCj4gKw0KPiAgfQ0KPiANCj4gIHN0YXRpYyB1aW50NjRfdCB3YWl0X2Zy
b21fY2xpZW50KHN0cnVjdCB4ZV9ldWRlYnVnX2NsaWVudCAqYywgY29uc3QgdWludDY0X3QNCj4g
dG9rZW4pDQo+ICB7DQo+IC0JdWludDY0X3QgcmV0ID0gX193YWl0X3Rva2VuKGMtPnBfb3V0LCB0
b2tlbiwgYy0+dGltZW91dF9tcyk7DQo+ICsJdWludDY0X3QgcmV0ID0gMDsNCj4gKw0KPiArCWln
dF9kZWJ1ZygiZGVidWdnZXI6ICVkIHdhaXRpbmcgdG9rZW4gJXNcbiIsIGdldHBpZCgpLA0KPiB0
b2tlbl90b19zdHIodG9rZW4pKTsNCj4gDQo+ICsJcmV0ID0gX193YWl0X3Rva2VuKGMtPnBfb3V0
LCB0b2tlbiwgYy0+dGltZW91dF9tcyk7DQo+ICAJaWYgKHJldCA9PSBERUFEX0NMSUVOVCkNCj4g
IAkJaWd0X2Fzc2VydChjLT5hbGxvd19kZWFkX2NsaWVudCk7DQo+IA0KPiBAQCAtMzU0LDYgKzM2
Nyw5IEBAIHN0YXRpYyB1aW50NjRfdCB3YWl0X2Zyb21fY2xpZW50KHN0cnVjdA0KPiB4ZV9ldWRl
YnVnX2NsaWVudCAqYywgY29uc3QgdWludDY0X3QgdG9rDQo+IA0KPiAgc3RhdGljIHZvaWQgdG9r
ZW5fc2lnbmFsKGludCBwaXBlWzJdLCBjb25zdCB1aW50NjRfdCB0b2tlbiwgY29uc3QgdWludDY0
X3QNCj4gdmFsdWUpDQo+ICB7DQo+ICsJaWd0X2RlYnVnKCIlZCBzaWduYWxsaW5nIHRva2VuICVz
IHdpdGggJWxkXG4iLA0KPiArCQkgIGdldHBpZCgpLCB0b2tlbl90b19zdHIodG9rZW4pLCB2YWx1
ZSk7DQo+ICsNCj4gIAlwaXBlX3NpZ25hbChwaXBlLCB0b2tlbik7DQo+ICAJcGlwZV9zaWduYWwo
cGlwZSwgdmFsdWUpOw0KPiAgfQ0KPiAtLQ0KPiAyLjQzLjANCg0K
