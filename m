Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8ABED58062
	for <igt-dev@archiver.kernel.org>; Mon, 25 Nov 2024 10:54:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BFA010E5FA;
	Mon, 25 Nov 2024 10:54:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SEAQsN8U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6960710E5F8;
 Mon, 25 Nov 2024 10:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732532086; x=1764068086;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=TPirYG51+HikQZSkDChGlqRIY2AalvW+byw7fhQvRAc=;
 b=SEAQsN8U0hqUossnLHOb3SaYe24qnJ+WqOuU/GS3T4Vus+EyTr0c6ahU
 ZOw9OuoDjtyydI7etkU5j9MHovrpCGmBVUvNUO8rWP1ADqUS14qd4x2eU
 htRznHWOMGPfBAyknd50M7+nKLPT94EXiKUWMV6Qsv7iZ3/lV6UnpOZ6L
 UE672BXBfne4VWhnkxs/bVUc93d2FVVIT+vE2vSGwM+RLIncJEi41NsEL
 1laRPKdldDtvnzLH5AkPiQytJVbuaAtQUxjGWW4w06zdsR06Icm293ouR
 qglLNUBYyl0YYZjqze8gPe2d6cSlBgwf85DvfPlTr45xq8qrMM5dXhjre Q==;
X-CSE-ConnectionGUID: FoaxWeteRFu8LmzA+HuKdA==
X-CSE-MsgGUID: jykD8WI+TDaLt8sOK4aQvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="36551427"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="36551427"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 02:54:46 -0800
X-CSE-ConnectionGUID: TFWJnUIYR8CC7E6sum3lHA==
X-CSE-MsgGUID: yr74ENj2S/OgKKk1yEal9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="122067207"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Nov 2024 02:54:46 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 25 Nov 2024 02:54:45 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 25 Nov 2024 02:54:45 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 25 Nov 2024 02:54:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JYmIlx+YSSCSxOjI+8yps8isUeFVxhaYFBUpiIixwHDgm7AOkTmNrfMU6F5AtdBd347uFvd1tJjmCivIoVNFCfqbuS4FtIGerf4Tl+wakUr/PLjAw95DygBWWt019jQ/u1h/6HK6gfvlP0NFGU/RpcA17UaqCrag7bbgQExRqK2CzLo1L/Yu2WUgMGy+WXYuxfTa3xyu+zAczv6v9waHJTccPzRr303DuLF6SDsaK4lMrg1qZLknjaCEqrC/6v/zrvJno/oiy+NyEihzba3imgZodFmRF7Ne28EGZfc9iu5Wh1FJGCQYmTy9ltQP/Lp/01UO62XN+LWj4jwLHE/25Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TPirYG51+HikQZSkDChGlqRIY2AalvW+byw7fhQvRAc=;
 b=F46uo3RG5E5sbwSH+hloFrKIYmZK9e63hT/8bXhMNdE+e9G89dutFmP/VeAcxBuCmQ3Er4fK3+V3lO033itTpf2vJYeyu4/rgHfzTnSXvYxkCPQ//WnMNFoNn0JhbFHBZ4ltOv4xh2f8vTLKeOlyPYAmkoCE82We1IzDqAojhiyRoF1j4SEjdN9cAkGg5oMXbzZM3z3kU2yXMIbLAYkVFDyB2k5RoV7hCr5AjnkxNuEn6q+5hf1wb128IYuCTFFqbCSuVyRUQ9M0ca560i9sM6pmoSP1R9EpzuiE/irq91r6FDQgVFN3Act/vgcL+lTmsxiiYRrxy1duix/nylCoEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB6753.namprd11.prod.outlook.com (2603:10b6:510:1c8::22)
 by CY8PR11MB7084.namprd11.prod.outlook.com (2603:10b6:930:50::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 10:54:42 +0000
Received: from PH8PR11MB6753.namprd11.prod.outlook.com
 ([fe80::2554:e827:dbde:714]) by PH8PR11MB6753.namprd11.prod.outlook.com
 ([fe80::2554:e827:dbde:714%7]) with mapi id 15.20.8182.018; Mon, 25 Nov 2024
 10:54:41 +0000
From: "Illipilli, TejasreeX" <tejasreex.illipilli@intel.com>
To: "Musial, Ewelina" <ewelina.musial@intel.com>,
 "i915-ci-infra@lists.freedesktop.org" <i915-ci-infra@lists.freedesktop.org>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Senna,
 Peter" <peter.senna@intel.com>
Subject: =?utf-8?B?UkU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBpZ3QtcnVubmVyIGZh?=
 =?utf-8?Q?ct_checking_(rev8)?=
Thread-Topic: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cmUgZm9yIGlndC1ydW5uZXIgZmFjdCBj?=
 =?utf-8?Q?hecking_(rev8)?=
Thread-Index: AQHbPLYpKuz4vNLLREOjTXBpkaa+tLLHmhUAgAABaYCAAAIEAIAAM9Dw
Date: Mon, 25 Nov 2024 10:54:41 +0000
Message-ID: <PH8PR11MB67534FEADB99B57426550F9BF22E2@PH8PR11MB6753.namprd11.prod.outlook.com>
References: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
 <173226306005.1628198.15482143446403084714@b555e5b46a47>
 <dc5e57ae-778d-4528-9fa0-6d5c11e967d5@linux.intel.com>
 <PH7PR11MB7073ADB94B82C0676DA45FD0932E2@PH7PR11MB7073.namprd11.prod.outlook.com>
 <PH7PR11MB707318C2C0FD36C1C61AFA05932E2@PH7PR11MB7073.namprd11.prod.outlook.com>
In-Reply-To: <PH7PR11MB707318C2C0FD36C1C61AFA05932E2@PH7PR11MB7073.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6753:EE_|CY8PR11MB7084:EE_
x-ms-office365-filtering-correlation-id: 38034b8b-5a4d-4f63-9dc9-08dd0d3f90ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?YTJWV1dXeXlSUWJma3F4MVFMOVhjYzcraDdXVkJyRldYOEtEbVQrbTdJOWZ4?=
 =?utf-8?B?MU0zYmJ0bEdXTmJiOUpudkYvMUVLSWgyWWNCNy93OW1rRzFmZ3RZcUVyVUxp?=
 =?utf-8?B?Snp3dzgvbHMvNSt6NjlRQzVKT0NlWGZQQVRxRmY0MzNiTDZWY2liamNsdDFX?=
 =?utf-8?B?TjRNQjExTGI5N202SHRuTlB6NXR4cW9GYUd0S1ppaTZNcmxycm5ITURuQzFt?=
 =?utf-8?B?RlFwY1Y2YVQ3NjE2QjBiSGIvWVZsZWc1SUhNRkdYYlhzcU84cEsvTGRTUlBC?=
 =?utf-8?B?WE9jSVpXNzlENzhWUnF1bkxaTEdDMElCa0xvdy83dmhXa3JvYmdvVU4zUFRo?=
 =?utf-8?B?VG1wci9EQzdDSUt4dXVoL3AzMFYzaStQb0RXT01GcnVYN3BoTFU3Y3h2TlFM?=
 =?utf-8?B?U1Y4ZWhjbFMvQU5HaUhXNW1namIzdVZjQUhaV3dIbkl5aGJkczJKTVFlNWpT?=
 =?utf-8?B?NkJqYko3cy9MWmZvenA4VHJ0aGdtOUpsM25BS1dIL1YvVjMwS1k1cmFZUFNO?=
 =?utf-8?B?R0JXTmJ6d3Yvc1Y3aHlLei9uQlFYMGpKNXlwY1hmdnBZT0VkVTVBb0FrN1Ra?=
 =?utf-8?B?cm5icEJ2cFZiUlVxOVpMb1p6U2Y1MzJRWEg3WW5SQktrejlHbFhtRXR2VTYv?=
 =?utf-8?B?bnFMSWJYdFJIZFI3RTkwaXdoK3I0aERtaklIOU9HcXZuejM2NTBkVXZiUnFn?=
 =?utf-8?B?UGRvYllmWHpuTHp0emNoZFdTMGdnbmVlM0lIWFR5MmZ4REZnVmtHcDVkWWNX?=
 =?utf-8?B?THJpU0lUL1E5UHdyM0x4MXE3a0lxRUNibktiRkE2MU1DenIvUkxleXdnTSsx?=
 =?utf-8?B?TUdHT2o0WHJER2pDYmFCbVpoMHJYaENySWJCeTdjWTZLTkx6TlYwaGpXR1NB?=
 =?utf-8?B?ME80Q2laSEF4a0hiQmhKdy93Zi9ZNXY3WXdweVhUWFdlMEFDV1hHWWVtMk1i?=
 =?utf-8?B?OEVIcFFJTmdDaTVZNHpxNkxZV0ltZkxJZERXQTE3aUdxUHdxVGtmKzVUY3U2?=
 =?utf-8?B?TGlCZXRxQjRZRWdtTE9PQm9Ya0JjZjhJSWx2L1dXZ1ZlRDhnNTZ0VTFFMjhB?=
 =?utf-8?B?UEk5eDlNRGV4dk9OelR2Vlh5Nnl2VzM3NUh6eGtINzN4cEZRQVRTeTI0c0pS?=
 =?utf-8?B?cXBwRDdETEwrcHN3RjlyVmplWDBldGhwMEZ5L0tuVkZnTzA2YXROcEpOWm9z?=
 =?utf-8?B?ZDlEWm5iNEtyZStnb0UwYmNkYXd3OTE3eTVwUk1BbHJnSGZpOXZlSXZXRGpq?=
 =?utf-8?B?K1UyUTRyWWQrb2RId24zWE9rR2hTRlZaVUtvbnNzZ0ZITnZMeUFxcVV2WEFL?=
 =?utf-8?B?NVpDdEMyY0RwRWRXWFBTTmFERzdpL1BtRXpRanB1SHJrbUZka0IwdjMxQjJr?=
 =?utf-8?B?ZWRqUno1RUQyVDJ5MGMxNHNheUw5bnNhUDNEUXR1S0NhSVBxQ1NkckFpa2lv?=
 =?utf-8?B?QWZQZGtvWjdydEZKU01TOCtMcHVJNkFRMVZkZzAzMU82dVFLajRZMVBjWm5o?=
 =?utf-8?B?ZWQ0b2svVzc1ZkxpR1ZmeUdKYkRYdFBoNyt6Ymx4OHdBQ2ZHeW9PQ1JDUlNk?=
 =?utf-8?B?WDFab0RsZUliR1ArdUNXNk9HUVloM2Fmb0Z4TVlpT25hbUJoODY2YzBkdlRL?=
 =?utf-8?B?RmNmUlh0NUtXU3N0TlJFZFBZbEtsdWJNc05Bb29ZUnRVRkZGcmNlek1zeU1Q?=
 =?utf-8?B?Uk1BV3ZMaEp4NVhTYXBkQ3BMa295S2FNOHlIU21MdHE1Q2tLS0FiS05NVVNs?=
 =?utf-8?B?WFEwSjNpNFZoRjA5ZFZKN2FZWjZuRTVycUdtaFUwb1YyTXp5d2t6NmlydkR3?=
 =?utf-8?Q?IDBirAvOPIquc+uskIiLsZEnL2C46F9t07sfs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6753.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TGMwN21KOXpQNXJQV1QzcEFUOHU3K0pvbGVOajFRbHJOMHF1MjN6L3pyajI2?=
 =?utf-8?B?VEhuUzg3Z3JhYmNEQ1VZbTVyMGtDRE9LcDAvbTYwN0haUHRnVTh5S0hTdlJF?=
 =?utf-8?B?bTd4ckFDN252NmhLeHM3SWFpMG1tWFFpQkpnRTEra052SDVyL3cydVdDQlVU?=
 =?utf-8?B?ZHZZVjQyYjVudzY1ZEtaVjVzK3V3M1RDSUR0N2RIYThvWlY1bVI4M29CQVQz?=
 =?utf-8?B?dHJRellCcWZMSUFBb3hWZzZGZUtEeWVubHJCdzIxVWRDU1k1MDBqWU5IZVdZ?=
 =?utf-8?B?d04zV1BqbHowKytza2dIaFBRUlJ1TXJWa0hBeXNXWDVkZjRzUHRuRTJlMy90?=
 =?utf-8?B?ckVWKy8zZkcvVGVUTk44YnFLN0N5V1lqbklxQmxteFJsRjhTTUlKTy84eHJ3?=
 =?utf-8?B?OWlzTFoxWi9oaG9jQmpQYkEvckdTL0lJUWV4NUFXVktVZlJRNFhjazZKVUts?=
 =?utf-8?B?eVJDcVREeG45WEo0WFQ5R05xdHpSSFgwd3BhRVpFaU5QdEJaYy92RGtrZ0Z6?=
 =?utf-8?B?TE5xd2NDZ1pBUElJc25WbXR4akI1Qmx6ako0TVVlWGJGclFyOU8wMjBRZ05t?=
 =?utf-8?B?YUwrZU5vcW5QMTlURFpXSUtudG1zNzBTMCtLQzdzLzNFdDA4SEtuYkxwbDRL?=
 =?utf-8?B?Q29oUkU0bUdrRGFqbUg2elFzaGltK3hnRkt1R2JXNVJZWWpYMlpOdm5aVjha?=
 =?utf-8?B?NGxmZFk0dFQzRE1hVWsrTHJ2ZDZVdTUyUW8va0h6dzNNZFlBQVhOOWQ4dHdU?=
 =?utf-8?B?L09za2NGbWFTbi91a2QxeFBPeUlyb0I3OVJvVC82MkZYYnpETUdjZHhYcVFq?=
 =?utf-8?B?WGVDNjgyNFJydkxXL0cxNjFJd0szZng1Um96QTlTMENlVjA0UXJtY1VNbnFQ?=
 =?utf-8?B?TVZEOEZDd21UdE9tTm9acmZ4TFZGalNrdzZXa2h1a2JqRzRlTksxM09oakpt?=
 =?utf-8?B?U0VjY2cvdHk3THdWNXZRK3R3OVg2WVpTNHRvVzZBOUcwczdMMEFwbkJZMUJw?=
 =?utf-8?B?dS9zbTEyc0dIVmxWTjFHMmQ1VHczcTZLTzBCM1pDeW81YjRHdXlCc2F3Zy9w?=
 =?utf-8?B?OHYvL1BnUnpyTjcwQU00Mko3TlRPVDZaYUpkUHpyWk56TWVJcVd4UHY1RDZH?=
 =?utf-8?B?MGNOek9QczdjcjdiT01mQ2prcWV6eEV6K0dkMDBldVRmVWdEN2xNejNoNWhJ?=
 =?utf-8?B?eWlCdVpLZFZuV3FBY2JiM3JyUHZGOTVWNFlyU3RiU0gzQy9ya0JWYnBuZFdp?=
 =?utf-8?B?QzZhTHZGNFdncUhaOG1GUTQ2YXdqQXdkd1o5RmgvTU10Z3JVaEI3NmloTGU0?=
 =?utf-8?B?MDZCZXhMQzlkcDZyVHBGSVQwcy9ZSzkwb2haVDRmWk5YSU5sWDBodmt1SFJL?=
 =?utf-8?B?MXhxUVpwTWovREszNFplKy9XNWtpSWUrTm9yZlpQbVN5MHNxZ0xBZ0FhY1NG?=
 =?utf-8?B?aWxRQUczNzc2WHhDclFtbmlsRENhYzlWcS9NUmMvbytBSGtQMTNWQUF3ak95?=
 =?utf-8?B?d3ZiNmhNeTZsU0haSjFhZmcydmJnbVRtdGwwdjR3RkVoK3kyTUZWNnBJYmd0?=
 =?utf-8?B?RFZlalVWNnZmeTNmTXd5TDZDcnpHNU10TDFlQkRUR1A2bEFoYTVQUERtcGda?=
 =?utf-8?B?RUpmVGEwMDFMNmlxYUJVMkhQbnVZT0lYTnY3QmtPbC9EZ0hDWXdqT2hsT1U3?=
 =?utf-8?B?dnFnN3pkdEszZGtIb1NHNGNZYlNTMHJjSTc2YTJZUmJRYTRBZlZZVUVlQWND?=
 =?utf-8?B?OVhCcUMyT09hdnkxb0UzeE9iaFVIRDI4bDNnUGtVd2tJMVlndlZCOGNkckFU?=
 =?utf-8?B?Y2Fsem11a1ArTGtMRURlU0NCNHJJYU9mdm9MMzgycjNPNnNHa0xCNVR1cklN?=
 =?utf-8?B?YkJnSmQxT0w5RHR2MzNaODZXVGhtYlBEMFlwaWY3RS9idU9zUWIxTzdMWGdE?=
 =?utf-8?B?cnNoc0o5OURlWDd2ckFVaFVWUmRmaXo3L1R2R2hQNUltYzNTcEtndTZhakg3?=
 =?utf-8?B?cTdsc2hBYTY3ZHU0NjhnUE1rMU9iU0VZeG8wako2d1hxYzhBWkRpNTFIbDE4?=
 =?utf-8?B?QW8yNzcvUDNBWnZBclUxWUF6MXB0SUZkQXpTR2d2a295enZRWDNvbHZTd3Zr?=
 =?utf-8?B?MkEzSm5Qd3RxM2pBczhCdUVua0ZWU1dVbDFQMTNsY0hRUzBCcUppZ01ZblI3?=
 =?utf-8?B?ZHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6753.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38034b8b-5a4d-4f63-9dc9-08dd0d3f90ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2024 10:54:41.7725 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /JkgEHrFEmbjrLqIKRlx9PIp8KMw4ieA3oAzpjKX79CY/d1/GxUcrkJwTc6K02Xs3VE7NLfhaLrCzkRDRouajDNSgO1moKHrPW7evdvCEe4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7084
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

SGkgRXdlbGluYSwNCg0KRG9uZS4NCg0KVGhhbmtzLA0KVGVqYXNyZWUNCg0KDQotLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogTXVzaWFsLCBFd2VsaW5hIDxld2VsaW5hLm11c2lhbEBp
bnRlbC5jb20+IA0KU2VudDogTW9uZGF5LCBOb3ZlbWJlciAyNSwgMjAyNCAxMjo1NyBQTQ0KVG86
IE11c2lhbCwgRXdlbGluYSA8ZXdlbGluYS5tdXNpYWxAaW50ZWwuY29tPjsgaTkxNS1jaS1pbmZy
YUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBJ
bGxpcGlsbGksIFRlamFzcmVlWCA8dGVqYXNyZWV4LmlsbGlwaWxsaUBpbnRlbC5jb20+OyBTZW5u
YSwgUGV0ZXIgPHBldGVyLnNlbm5hQGludGVsLmNvbT4NClN1YmplY3Q6IFJFOiDinJcgWGUuQ0ku
RnVsbDogZmFpbHVyZSBmb3IgaWd0LXJ1bm5lciBmYWN0IGNoZWNraW5nIChyZXY4KQ0KDQpVbmlu
dGVudGlvbmFsbHkgZHJvcHBlZCBQZXRlciBmcm9tIHByZXZpb3VzIGVtYWlsLCBzb3JyeSDwn5iK
DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBpZ3QtZGV2IDxpZ3QtZGV2LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgTXVzaWFsLCBFd2VsaW5h
DQpTZW50OiBNb25kYXksIE5vdmVtYmVyIDI1LCAyMDI0IDg6MjAgQU0NClRvOiBpOTE1LWNpLWlu
ZnJhQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7
IElsbGlwaWxsaSwgVGVqYXNyZWVYIDx0ZWphc3JlZXguaWxsaXBpbGxpQGludGVsLmNvbT4NClN1
YmplY3Q6IFJFOiDinJcgWGUuQ0kuRnVsbDogZmFpbHVyZSBmb3IgaWd0LXJ1bm5lciBmYWN0IGNo
ZWNraW5nIChyZXY4KQ0KDQpZZXMsIHdlIHJlY2VpdmVkIHlvdXIgZW1haWwuDQoNCkBJbGxpcGls
bGksIFRlamFzcmVlWCB3aGVuIHlvdSB3aWxsIGJlIGFibGUgdG8gcmV2aWV3IGl0Pw0KDQpSZWdh
cmRzLA0KRXdlbGluYQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogSTkxNS1j
aS1pbmZyYSA8aTkxNS1jaS1pbmZyYS1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24g
QmVoYWxmIE9mIFBldGVyIFNlbm5hIFRzY2h1ZGluDQpTZW50OiBNb25kYXksIE5vdmVtYmVyIDI1
LCAyMDI0IDg6MTUgQU0NClRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgSTkxNS1j
aS1pbmZyYUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNClN1YmplY3Q6IFJlOiDinJcgWGUuQ0kuRnVs
bDogZmFpbHVyZSBmb3IgaWd0LXJ1bm5lciBmYWN0IGNoZWNraW5nIChyZXY4KQ0KDQoNCkRlYXIg
STkxNSwNCg0KQ2FuIHlvdSBjb25maXJtIHlvdSByZWNlaXZlZCBteSByZXBseSB0byB0aGlzIGVt
YWlsIG9uIEZyaWRheT8NCg0KT24gMjIuMTEuMjAyNCAwOToxMSwgUGF0Y2h3b3JrIHdyb3RlOg0K
PiA9PSBTZXJpZXMgRGV0YWlscyA9PQ0KPiANCj4gU2VyaWVzOiBpZ3QtcnVubmVyIGZhY3QgY2hl
Y2tpbmcgKHJldjgpDQo+IFVSTCAgIDogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3Jn
L3Nlcmllcy8xNDA4NDEvDQo+IFN0YXRlIDogZmFpbHVyZQ0KPiANCj4gPT0gU3VtbWFyeSA9PQ0K
PiANCj4gQ0kgQnVnIExvZyAtIGNoYW5nZXMgZnJvbSBYRUlHVF84MTIxX2Z1bGwgLT4gWEVJR1RQ
V18xMjE2M19mdWxsIA0KPiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09DQo+IA0KPiBTdW1tYXJ5DQo+IC0tLS0tLS0NCj4gDQo+ICAgKipGQUlMVVJF
KioNCj4gDQo+ICAgU2VyaW91cyB1bmtub3duIGNoYW5nZXMgY29taW5nIHdpdGggWEVJR1RQV18x
MjE2M19mdWxsIGFic29sdXRlbHkgbmVlZCB0byBiZQ0KPiAgIHZlcmlmaWVkIG1hbnVhbGx5Lg0K
PiAgIA0KPiAgIElmIHlvdSB0aGluayB0aGUgcmVwb3J0ZWQgY2hhbmdlcyBoYXZlIG5vdGhpbmcg
dG8gZG8gd2l0aCB0aGUgY2hhbmdlcw0KPiAgIGludHJvZHVjZWQgaW4gWEVJR1RQV18xMjE2M19m
dWxsLCBwbGVhc2Ugbm90aWZ5IHlvdXIgYnVnIHRlYW0gKEk5MTUtY2ktaW5mcmFAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnKSB0byBhbGxvdyB0aGVtDQo+ICAgdG8gZG9jdW1lbnQgdGhpcyBuZXcgZmFp
bHVyZSBtb2RlLCB3aGljaCB3aWxsIHJlZHVjZSBmYWxzZSBwb3NpdGl2ZXMgaW4gQ0kuDQo+IA0K
PiAgIA0KPiANCj4gUGFydGljaXBhdGluZyBob3N0cyAoNCAtPiA0KQ0KPiAtLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0NCj4gDQo+ICAgTm8gY2hhbmdlcyBpbiBwYXJ0aWNpcGF0aW5nIGhv
c3RzDQo+IA0KPiBQb3NzaWJsZSBuZXcgaXNzdWVzDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0NCj4g
DQo+ICAgSGVyZSBhcmUgdGhlIHVua25vd24gY2hhbmdlcyB0aGF0IG1heSBoYXZlIGJlZW4gaW50
cm9kdWNlZCBpbiBYRUlHVFBXXzEyMTYzX2Z1bGw6DQo+IA0KPiAjIyMgSUdUIGNoYW5nZXMgIyMj
DQo+IA0KPiAjIyMjIFBvc3NpYmxlIHJlZ3Jlc3Npb25zICMjIyMNCj4gDQo+ICAgKiBpZ3RAa21z
X2JpZ19mYkA0LXRpbGVkLWFkZGZiOg0KPiAgICAgLSBzaGFyZC1sbmw6ICAgICAgICAgIFtQQVNT
XVsxXSAtPiBbRE1FU0ctV0FSTl1bMl0NCj4gICAgWzFdOiBodHRwczovL2ludGVsLWdmeC1jaS4w
MS5vcmcvdHJlZS9pbnRlbC14ZS9JR1RfODEyMS9zaGFyZC1sbmwtNi9pZ3RAa21zX2JpZ19mYkA0
LXRpbGVkLWFkZGZiLmh0bWwNCj4gICAgWzJdOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEu
b3JnL3RyZWUvaW50ZWwteGUvSUdUUFdfMTIxNjMvc2hhcmQtbG5sLTEvaWd0QA0KPiBrbXNfYmln
X2ZiQDQtdGlsZWQtYWRkZmIuaHRtbA0KPiANCj4gICAqIGlndEBrbXNfY29sb3JAY3RtLW1heDoN
Cj4gICAgIC0gc2hhcmQtYm1nOiAgICAgICAgICBbUEFTU11bM10gLT4gW0RNRVNHLVdBUk5dWzRd
ICs0IG90aGVyIHRlc3RzIGRtZXNnLXdhcm4NCj4gICAgWzNdOiBodHRwczovL2ludGVsLWdmeC1j
aS4wMS5vcmcvdHJlZS9pbnRlbC14ZS9JR1RfODEyMS9zaGFyZC1ibWctOC9pZ3RAa21zX2NvbG9y
QGN0bS1tYXguaHRtbA0KPiAgICBbNF06IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcv
dHJlZS9pbnRlbC14ZS9JR1RQV18xMjE2My9zaGFyZC1ibWctMS9pZ3RADQo+IGttc19jb2xvckBj
dG0tbWF4Lmh0bWwNCj4gDQo+ICAgKiBpZ3RAa21zX2ZsaXBAMngtZHBtcy12cy12YmxhbmstcmFj
ZUBhYi1kcDItaGRtaS1hMzoNCj4gICAgIC0gc2hhcmQtYm1nOiAgICAgICAgICBbUEFTU11bNV0g
LT4gW0lOQ09NUExFVEVdWzZdDQo+ICAgIFs1XTogaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3Jn
L3RyZWUvaW50ZWwteGUvSUdUXzgxMjEvc2hhcmQtYm1nLTEvaWd0QGttc19mbGlwQDJ4LWRwbXMt
dnMtdmJsYW5rLXJhY2VAYWItZHAyLWhkbWktYTMuaHRtbA0KPiAgICBbNl06IA0KPiBodHRwczov
L2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9pbnRlbC14ZS9JR1RQV18xMjE2My9zaGFyZC1ibWct
NC9pZ3RADQo+IGttc19mbGlwQDJ4LWRwbXMtdnMtdmJsYW5rLXJhY2VAYWItZHAyLWhkbWktYTMu
aHRtbA0KPiANCj4gICAqIGlndEB4ZV9mYXVsdF9pbmplY3Rpb25Adm0tYmluZC1mYWlsLXhlX3B0
X3VwZGF0ZV9vcHNfcHJlcGFyZToNCj4gICAgIC0gc2hhcmQtYm1nOiAgICAgICAgICBOT1RSVU4g
LT4gW0ZBSUxdWzddDQo+ICAgIFs3XTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90
cmVlL2ludGVsLXhlL0lHVFBXXzEyMTYzL3NoYXJkLWJtZy00L2lndEANCj4geGVfZmF1bHRfaW5q
ZWN0aW9uQHZtLWJpbmQtZmFpbC14ZV9wdF91cGRhdGVfb3BzX3ByZXBhcmUuaHRtbA0KDQpUaGVz
ZSBhcmUgdW5yZWxhdGVkIHRvIG15IGNoYW5nZS4gUGxlYXNlIGZpeCBhbmQgcmUtcnVuLg0KDQo+
IA0KPiAgIA0KPiAjIyMjIFdhcm5pbmdzICMjIyMNCj4gDQo+ICAgKiBpZ3RAY29yZV9ob3R1bnBs
dWdAdW5iaW5kLXJlYmluZDoNCj4gICAgIC0gc2hhcmQtYm1nOiAgICAgICAgICBbSU5DT01QTEVU
RV1bOF0gKFtJbnRlbCBYRSMzNDY4XSkgLT4gW0lOQ09NUExFVEVdWzldDQo+ICAgIFs4XTogaHR0
cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvaW50ZWwteGUvSUdUXzgxMjEvc2hhcmQtYm1n
LTQvaWd0QGNvcmVfaG90dW5wbHVnQHVuYmluZC1yZWJpbmQuaHRtbA0KPiAgICBbOV06IA0KPiBo
dHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9pbnRlbC14ZS9JR1RQV18xMjE2My9zaGFy
ZC1ibWctMi9pZ3RADQo+IGNvcmVfaG90dW5wbHVnQHVuYmluZC1yZWJpbmQuaHRtbA0KPiANCj4g
ICAqIGlndEB4ZV9leGVjX3RocmVhZHNAdGhyZWFkcy1jbS1zaGFyZWQtdm0tdXNlcnB0ci1pbnZh
bGlkYXRlOg0KPiAgICAgLSBzaGFyZC1ibWc6ICAgICAgICAgIFtETUVTRy1XQVJOXVsxMF0gKFtJ
bnRlbCBYRSMzMzcxXSAvIFtJbnRlbCBYRSMzNTE1XSkgLT4gW0RNRVNHLVdBUk5dWzExXQ0KPiAg
ICBbMTBdOiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9pbnRlbC14ZS9JR1RfODEy
MS9zaGFyZC1ibWctNC9pZ3RAeGVfZXhlY190aHJlYWRzQHRocmVhZHMtY20tc2hhcmVkLXZtLXVz
ZXJwdHItaW52YWxpZGF0ZS5odG1sDQo+ICAgIFsxMV06IA0KPiBodHRwczovL2ludGVsLWdmeC1j
aS4wMS5vcmcvdHJlZS9pbnRlbC14ZS9JR1RQV18xMjE2My9zaGFyZC1ibWctMS9pZ3RADQo+IHhl
X2V4ZWNfdGhyZWFkc0B0aHJlYWRzLWNtLXNoYXJlZC12bS11c2VycHRyLWludmFsaWRhdGUuaHRt
bA0KPiANCj4gICAqIGlndEB4ZV9mYXVsdF9pbmplY3Rpb25Adm0tYmluZC1mYWlsLXhlX3ZtYV9v
cHNfYWxsb2M6DQo+ICAgICAtIHNoYXJkLWJtZzogICAgICAgICAgW0RNRVNHLUZBSUxdWzEyXSAo
W0ludGVsIFhFIzM0NjddIC8gW0ludGVsIFhFIzM0NjhdKSAtPiBbRkFJTF1bMTNdDQo+ICAgIFsx
Ml06IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2ludGVsLXhlL0lHVF84MTIxL3No
YXJkLWJtZy00L2lndEB4ZV9mYXVsdF9pbmplY3Rpb25Adm0tYmluZC1mYWlsLXhlX3ZtYV9vcHNf
YWxsb2MuaHRtbA0KPiAgICBbMTNdOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3Ry
ZWUvaW50ZWwteGUvSUdUUFdfMTIxNjMvc2hhcmQtYm1nLTEvaWd0QA0KPiB4ZV9mYXVsdF9pbmpl
Y3Rpb25Adm0tYmluZC1mYWlsLXhlX3ZtYV9vcHNfYWxsb2MuaHRtbA0KPiANCj4gICAqIGlndEB4
ZV9tb2R1bGVfbG9hZEByZWxvYWQ6DQo+ICAgICAtIHNoYXJkLWJtZzogICAgICAgICAgW0RNRVNH
LVdBUk5dWzE0XSAoW0ludGVsIFhFIzM0NjddKSAtPiBbRE1FU0ctV0FSTl1bMTVdDQo+ICAgIFsx
NF06IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2ludGVsLXhlL0lHVF84MTIxL3No
YXJkLWJtZy04L2lndEB4ZV9tb2R1bGVfbG9hZEByZWxvYWQuaHRtbA0KPiAgICBbMTVdOiANCj4g
aHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvaW50ZWwteGUvSUdUUFdfMTIxNjMvc2hh
cmQtYm1nLTYvaWd0QA0KPiB4ZV9tb2R1bGVfbG9hZEByZWxvYWQuaHRtbA0KPiANCj4gICAqIGln
dEB4ZV9vYUBzeW5jcy11c2VycHRyLXdhaXQtY2ZnOg0KPiAgICAgLSBzaGFyZC1kZzItc2V0Mjog
ICAgIFtTS0lQXVsxNl0gKFtJbnRlbCBYRSMxMTMwXSkgLT4gW1NLSVBdWzE3XSArNyBvdGhlciB0
ZXN0cyBza2lwDQo+ICAgIFsxNl06IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2lu
dGVsLXhlL0lHVF84MTIxL3NoYXJkLWRnMi00NjYvaWd0QHhlX29hQHN5bmNzLXVzZXJwdHItd2Fp
dC1jZmcuaHRtbA0KPiAgICBbMTddOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3Ry
ZWUvaW50ZWwteGUvSUdUUFdfMTIxNjMvc2hhcmQtZGcyLTQ2My9pZw0KPiB0QHhlX29hQHN5bmNz
LXVzZXJwdHItd2FpdC1jZmcuaHRtbA0KDQpUaGVzZSBhcmUgdW5yZWxhdGVkIHRvIG15IGNoYW5n
ZS4gUGxlYXNlIGZpeCBhbmQgcmUtcnVuLg0KDQpbLi4uXQ0KDQpUaGFuayB5b3UsDQoNClBldGVy
DQo=
