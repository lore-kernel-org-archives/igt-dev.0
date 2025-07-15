Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 370E6C83F21
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 12:31:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB54210E5B9;
	Tue, 15 Jul 2025 12:31:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ot6iQxGT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2811410E5B9
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 12:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752582669; x=1784118669;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EczQ3wHJVoadMsPWiWlp8scEnlLexYqqhZ8Uj+MkZJk=;
 b=Ot6iQxGTVnhTwmNg9H7dQKe23zDPCTNUnh6zMEF/Jo6vt/jsJSUnusWC
 6Yb99BLLsPifbtE0Ve/9dUe+1OXWgcpY7rziYWXrV2Z3YaH6P4/ptGaM5
 SawavqOAx+vQ1fGvRldrwsOCfjk5VQzuyw0LbzfmLIn7+Q6LEhFN32Cmn
 D2k+2TjJw1kBMjvizfNO6ntXRsZ0kKcQiROGIx9kEOYU6Gtj+wtBCYK1b
 f2RfONv0rleFbr979RXILPyGKeJ3WLhl2loLjjKJZxqsraYKAwK20kxb5
 wlKhK4KPMldVnRliEonfAcaeHnh7dHiSxLaUnZgnktOSIegy0amCzd1YC w==;
X-CSE-ConnectionGUID: +7x8OPVRQoK6ixN7BWcoRg==
X-CSE-MsgGUID: GlX1kaEaTzegwSxd0I227g==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="72251690"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="72251690"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 05:31:09 -0700
X-CSE-ConnectionGUID: 5rP2jDMCRKuqkF0D+UY1xA==
X-CSE-MsgGUID: g/4W9QLsTeSgvhH+7fUBMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="157306179"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 05:31:08 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 05:31:07 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 05:31:07 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.74)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 05:31:07 -0700
Received: from SJ0PR11MB5072.namprd11.prod.outlook.com (2603:10b6:a03:2db::18)
 by DM3PPFB7F00E099.namprd11.prod.outlook.com (2603:10b6:f:fc00::f47)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Tue, 15 Jul
 2025 12:30:52 +0000
Received: from SJ0PR11MB5072.namprd11.prod.outlook.com
 ([fe80::a14a:e00c:58fc:e4f8]) by SJ0PR11MB5072.namprd11.prod.outlook.com
 ([fe80::a14a:e00c:58fc:e4f8%4]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 12:30:52 +0000
From: "Grzelak, Michal" <michal.grzelak@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, "B, Jeevan"
 <jeevan.b@intel.com>
CC: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "B S, Karthik" <karthik.b.s@intel.com>,
 "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_setmode: Find compatible mode for eDP
 before selecting default mode
Thread-Topic: [PATCH i-g-t] tests/kms_setmode: Find compatible mode for eDP
 before selecting default mode
Thread-Index: AQHb3CS1vhaalwZI70qcTFCp8stWSrQGHwmAgCuVQwCAAZotAA==
Date: Tue, 15 Jul 2025 12:30:51 +0000
Message-ID: <SJ0PR11MB50723625F88EF2AE1CDAEC3F8F57A@SJ0PR11MB5072.namprd11.prod.outlook.com>
References: <20250613054848.3279961-1-jeevan.b@intel.com>
 <SJ0PR11MB507248333ECA5D7E74CE9B118F70A@SJ0PR11MB5072.namprd11.prod.outlook.com>
 <20250714115612.xouhsgkko26zs5fu@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20250714115612.xouhsgkko26zs5fu@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5072:EE_|DM3PPFB7F00E099:EE_
x-ms-office365-filtering-correlation-id: 1eafe811-8486-48fe-8dae-08ddc39b6fea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ejFBZU1wa2kyaG81cnZ1MTJ3clhrcDNnWGZWWkh6RzNWaVpHcm9CWkFPQktS?=
 =?utf-8?B?VHZOaEpIcVdLb25wb0E0ckRQNklIQldBZUtzU0tKYStBTm1oQW1jZlU2Nnph?=
 =?utf-8?B?eERScHVUdmR5RC9ybmhkalo5aEtnWGEvTFd3eWxFYWoySWk4eng3U0ZTZTAw?=
 =?utf-8?B?UDAvS20rRjdTNXdLTkVSeGRyUkV2c0RUaHRkQUw2aENsanNMTHVOU3NUWThz?=
 =?utf-8?B?UXE5b3EvM3d4cm5vTnN3ZUlEQWVKQTFSM1RTZ2lhblpmMlVtKzE2L0xkUDdS?=
 =?utf-8?B?NU1RNkJCTEtzUG1rWDZQZkl0a2lmeEFUako1TS96cjNMbDJrc0JwcXF3bnoy?=
 =?utf-8?B?NmNmTFZkTWZLMmd4YkN1SUgzSnpPTjF5ZVBmTXQ5cXFBUW5Hb2FkRk94NWpB?=
 =?utf-8?B?eXBDdXdzeGFHTS9ZM003aDNlcDRpY1ZaZ2tPdHcrVWxWSVJUd3hTTUFZaFll?=
 =?utf-8?B?V2ZvbG15NVlDdWRJVWFiUGMrd2s0YWVwM3NFUlpKTnRXNkR4Zlo4SUVHQ2RJ?=
 =?utf-8?B?NktTbFR6aXYxa0tDbXIvdUxWZlRubG1rd0VwaWN1ZGdJVE1kTDdvU0wyQWNk?=
 =?utf-8?B?OThEck5MN3N3R21SVm1EMG13RWNJNFZ6YmFvSCtHSUxqM25LRVVreE1UTE83?=
 =?utf-8?B?UEY1bksrMjBDNzZUQVVTT0NiemJVdzAxWFlyeEo4S0FLK0N2ampjUGFHTzRq?=
 =?utf-8?B?dGZ4NVVqdk9Wc2prQk5OdktKdndPQjRqWTVMbjM4UTRoWG1WVkRJbURyYzBt?=
 =?utf-8?B?TnZiYTFKalRWQ1Q4cHYybjFKcDBrdU9KSWwvaGd2d1o0K1FpTllWa3ZKZmNF?=
 =?utf-8?B?d01JQlB3U1JyMW56enpUazJKTkhoNUZacElzRENRT3k4S3NHcU1DVllhL01x?=
 =?utf-8?B?bm5EenpCQjZLNG45N3F1bFJUdEMzTGNJMTRSZHhqL1ZHU3R4Y21DaW1LL2l1?=
 =?utf-8?B?UC9jcEpBWWNSQ1BhemlreVJ0eVdLNGxPeXBqWUlDZmpCRXNDVUJoK2RpYmxw?=
 =?utf-8?B?K3ptaU9vQ0I1UXZta1RjeFZiM3lFaEdTODFPUWM5MjhBcHdQbnZEYkJRVjd3?=
 =?utf-8?B?TEE5c013V0NWUERibjZzRURuWjUxcllUdWU5ckg0emtNaUFjdUt0MEFtZXdo?=
 =?utf-8?B?Y0MxSzBMTlRLdjVWeFRMRkxBL0lSWWh5cjZvOHNvTnRaR0pVaGwzV3pxTGRv?=
 =?utf-8?B?Y0NFMk5iZDJ6LzdXaExkOEtqclpHVGJObG5zenl1akF0US91T21GRXlqYWMv?=
 =?utf-8?B?THpWQ2J6NUkwblVqekh2N1JpbFJBdFd2TytnN1pmUWU4cENjdUM4QnhRVjQ2?=
 =?utf-8?B?WDBTT3lNVlY4MDdkVE5qbG5BMTdyVkQrbDF0ajZ6R0pZNkprSzJQUm1QamNF?=
 =?utf-8?B?d0owVU1TcU1KQU52N2x1M3pxY0VuZGhRMFhKS05oTEFiU0VtSW5URENveEd4?=
 =?utf-8?B?eFNsVVg4bEcyYmNkZnU2ckZWeUgyV0NMbzljeDEzSDlFNWJxQUlzN3lPUjda?=
 =?utf-8?B?aTdOQTFzRHliZVZid0hqaTNkeU9EL2oxcWsyVUIzSU50RkNrSHB6aG13R3Y1?=
 =?utf-8?B?a0dkRnFkUEMwb2FUZlROcEtEN3N2amFBcyt1dEtvNS8rMUc4b1ZXSHdhM1g0?=
 =?utf-8?B?ekc0WVFJMHFBWlcxaUtVanFpa3NpVVdUdTY0OU5VY0gySkZNZlRHNzl4d0NI?=
 =?utf-8?B?UnorWjdnZFN3SkZzb1RsSmg4L0tnalE2L0ovQVNEdFl6ekhnN09pT1d6RFll?=
 =?utf-8?B?cSt5bytzTFBzdXRldENKYVptSW4zYkhyTWk1aUlxallCUzg2RmYxd0tpRmlW?=
 =?utf-8?B?MGVJUzgxZUhpOXROOXJzNnZEM25lVlVoQmJWTGZmZnJpSFliQWx1MzVSNmpC?=
 =?utf-8?B?UW1sV1FBV2w3Rk5qc0l5MTRCbkN4aDhJVkxqbldLM3RxTnhhaFNUbFBZelFi?=
 =?utf-8?B?R3A4dHdaYWkrUTd6RzI1aFIxSzRLeC9BekF1MmNuMDJSNi9zTDdadlpVeHIw?=
 =?utf-8?B?YzN4OXR4ZTNnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5072.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OXcrTDFBeHdlTFlKV2s4dGxyMkRrbGxZdVBWdlk3OVV2Z3B2ZE9RbnVQS29T?=
 =?utf-8?B?QmpOVlU4ZmticVE4S05aV1NQQ0dkMzFBSUFXS0RvWU53Qm5NbmcwaVdBcUx4?=
 =?utf-8?B?dTZiUTg4NlY4Z0hEVjlEUXlyVVVnZ3JucVY5YUxTRnRBeE5aY29GVkpkMVIz?=
 =?utf-8?B?TWNaUXkxMWwvSS92TTVNVEhTNm9TdzFOMER0TFpRQ2FUMXBObGRpMWJFaGkr?=
 =?utf-8?B?MTJlYVNWcmtPTzZtMGZVOWhtVUtRbFNwTStRdGNPUE5kQTBPYll3ZUV0TVg2?=
 =?utf-8?B?RmMxYnNKeHAza2NBMSs3TG1PZk91Wkowa1F4b2RJR0VzdjQwSVVyZndoYzBw?=
 =?utf-8?B?VU5MVDM0QlNGNGcvVmlzK21KemNGQ1hTekx2Ym11OStLQ2hIRkpLOEt2bUtZ?=
 =?utf-8?B?WW9CTzBrNE12bFVoSXEyZzcxQTdmd2NNc2xSNDY0dUJ6MTJNZWJ3TkpmcWdM?=
 =?utf-8?B?dDB6cW9LWVhjZS9tb2RRNGUvdUpsZnh2Ty94SlpGb1hsSmpQQnRCajJSYnN0?=
 =?utf-8?B?bVZSNTUvV2RqZ0xESmZpclJqK1M1NzgwZmoyeFJ4QVM2cUlnN3pBdlVSZjBv?=
 =?utf-8?B?aksyaUN2cGhremhBL2NleCtGV1B0UFRVbkV1QmZ1VE1YcnR1Qkh2VFpLL3RZ?=
 =?utf-8?B?UHlYNTl3U255OTFVS01USWV4WW5KMjdURFZleDY1KzQxNHNDZnJZeDJwbVRC?=
 =?utf-8?B?Q2grUWxmOW05SUF2bnlqMlBIYXc4N3hvRzllWXR1eGxLK2JEMXkvYWQwZENV?=
 =?utf-8?B?V2lFaCsvd0MzY28vN2p5SlNJUzFYQlY5dkhhayt6N3J2RkxYeTU1RmJDSnAw?=
 =?utf-8?B?WTZENmpWK0IyR2RpTXNTZktPMTZrVnBQOXgrMk92L0FkMDNuTkZUaGg4M1d0?=
 =?utf-8?B?eWlDTW1aV1h5d1FXMXRQYzhHenNIb1VtcE1XSC91SEVKZ0ZFc0VVckVnWmQv?=
 =?utf-8?B?TnpzZlJUR2lPYU93NU9Ubm9xS1lIakZtY05OT0FhczFJMndMT3pOQk9Td0c4?=
 =?utf-8?B?U1A2V2tQNndHcWFHUC9rVzB4YUIveXVBR0RVMEJHRjhSVEhJUmVBOWplaWll?=
 =?utf-8?B?OWxabFZZa1FIbUtlb0xHUDNXQTJEeDQ2YmhCTkRLM2hETzI2anI1SU1PQThz?=
 =?utf-8?B?ZFl4TkJEZUsrbGVzZkhDTHp3ZDgyd3ZkdDRMYlJNRjhyRWlBdGYzMSs0Ujh1?=
 =?utf-8?B?SzluclRyNTAyaUtCZi95ejZzOVdHakxHZnk5eUNpZlYxR0VMUHJ1OFRWV2FB?=
 =?utf-8?B?UXQwTmZ2ZURPQ3A2U2JIcysxdnhGTG1VV3lXWTAxbjJXSjFQbXFRSnRyQVZy?=
 =?utf-8?B?S0VxVGVMUFdRQzVVMWdiVkJXeTdkMnc4M21tTCsxM2RKTmpuWGNtVFdxVGRp?=
 =?utf-8?B?WUFJc1R2aXcvTHdkcENmNFpNUW1maitDZ0lNY2tuTkRIQmhJbkN2WUFwZkpK?=
 =?utf-8?B?bUdRMkFqL2tHMy9kNXlSdnpzWjJaSXJROEJ1NGFjSG9RbitLT0Y3VEY0ZmZl?=
 =?utf-8?B?bFB6N3JUM3l3dUNISUpkM2lscGl5TWtUQkw4My9JMkpFbVBSUVlXa2JWcGFn?=
 =?utf-8?B?VWRHRmN6MTIraVo3VXA5TnJ1SW4xRnlLOUhlTlFnT3hoTTcvWC9oRGJ4cWtX?=
 =?utf-8?B?K0s3bUhETi9zK29OZUVrN3ZTanBET0JxN3dEWlNBeXFPM002VGV2U2MzNTF5?=
 =?utf-8?B?ZjU5T2YwcWMxRFZRbmdKMFU4Q1lNak9EZFlVV3ZIeTh3YS9NL3lBbVpBWDhG?=
 =?utf-8?B?UnVtemx4N3Q3RjFiU3YzRUE2a0VUTVNzREc4Ynpzc00waEVXRDZUL1FId1lR?=
 =?utf-8?B?WVZoSEkyWHpDNFZ1cXhKVTVXR1RWU21POWp3TXB4YzgwcWQ4MGIwQWFHRUZY?=
 =?utf-8?B?K3NENmE2ejlDTEVTU0tmaUVEd1JxTUdJSVo3T0ppRGpVTGRYdXAxOUsrUk0z?=
 =?utf-8?B?cFJLZWM0VkRMSUZHMGFNbGovUStmbWE3MHk5a3dSRWZFbVFEdTdKTmRtOUMw?=
 =?utf-8?B?cmd2YUJBQWZOaXpMNlFUS3hISVBLUVloaUh2MTFwRGVUdElGZlM0SnhNTUVi?=
 =?utf-8?B?TG5YNEhVT1d0WEVWQlVwcTNrY29PangySzNZamVHdkdTTFovM2RLWVV4SFM4?=
 =?utf-8?Q?RZN2pJctDSbSSbJbYEioibL9B?=
arc-seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M9RKVjLzZ8BPTy+ESkBWy5iAvsYmXXO6I66ab7Ktuz3v8NHF0j4qO5GKHv7KVK4SZsNeH2g991DUTPO8jwchimdXd+ZzVIMTrmquaNhuurtKisqVYEDrUmqUuRWY37Xnv4XVUBPmZEeqhfIKWA2U0Tg/gSuq8Sr1HEwyD09Uke7kxzYqPZVdF7tAce5HCLChmhfLDlwNXAkUEuqm8azQhIYm4dtgcbss1kDRzeba2AUECBo7LTXR4GG0uDv3YtHcp/EAdjnomXMkprVdMlHK5Hx3K34v2rifyWV3LphiZe8J3t9kesrw5G5ice/UqpeSn/R76AdhCie50pGlEhOWuA==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=913pQwvMc6wC2k1R9BUGrlpFJ35x0FW/SAKxMvRbrWI=;
 b=wKaMQCxiOaZjRahN5robe/ZR2PvzNi2NbL95cV0w61m2B+e0tIZHzah671gNTZzPiLbb9AVbocaBFUPbwODwrPSMToYVJwDxNLuLjohNJaO139L9jdVjBwPy1XUDJJcCbYDA5TjB73n8JCiYMmyxeAIKM6GzUf5eKk5lv1tmMhH8u1K7fRQcfAZT/YY53UkjRxWzYqzwpBuVSU6YPw30SMpfzPsO+xNIW686obOvv84kp1kiGTux70CYuvoibGyUEoKpmTrP1ODwEPa0JQmXS83vvEGIvYKLeOvkftjHniQBf8/qrJBM+o8eO7SJpmHARMTeF3W1fCcnbI60BO7HPQ==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: SJ0PR11MB5072.namprd11.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: 1eafe811-8486-48fe-8dae-08ddc39b6fea
x-ms-exchange-crosstenant-originalarrivaltime: 15 Jul 2025 12:30:52.0866 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: VvLgOZAfNPD62WnmEl9qplmTOYsOmO6Zh+B3CQp6zHP32g/BaWyG6CPzl72L8rSj/wzfuc6GoSDn4wuCIyMHocXAwNFrFSrAYL8fAnV5b18=
x-ms-exchange-transport-crosstenantheadersstamped: DM3PPFB7F00E099
x-originatororg: intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
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

SGkgS2FtaWwsDQoNCj4gRnJvbTogS2FtaWwgS29uaWVjem55IDxrYW1pbC5rb25pZWN6bnlAbGlu
dXguaW50ZWwuY29tPg0KPiBTZW50OiBNb25kYXksIEp1bHkgMTQsIDIwMjUgMTo1NiBQTQ0KPiBU
bzogR3J6ZWxhaywgTWljaGFsIDxtaWNoYWwuZ3J6ZWxha0BpbnRlbC5jb20+DQo+IENjOiBCLCBK
ZWV2YW4gPGplZXZhbi5iQGludGVsLmNvbT47IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
OyBCIFMsIEthcnRoaWsgPGthcnRoaWsuYi5zQGludGVsLmNvbT47IFNoYXJtYSwgU3dhdGkyICA8
c3dhdGkyLnNoYXJtYUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggaS1nLXRdIHRl
c3RzL2ttc19zZXRtb2RlOiBGaW5kIGNvbXBhdGlibGUgbW9kZSBmb3IgZURQIGJlZm9yZSBzZWxl
Y3RpbmcgZGVmYXVsdCBtb2RlDQo+DQo+IEhpIEdyemVsYWssLA0KPiBPbiAyMDI1LTA2LTE2IGF0
IDE4OjM1OjI2ICswMDAwLCBHcnplbGFrLCBNaWNoYWwgd3JvdGU6DQo+ID4gSGkgSmVldmFuLA0K
PiA+DQo+ID4gPkZyb206IGlndC1kZXYgPGlndC1kZXYtYm91bmNlc0BsaXN0cy5mcmVlZGVza3Rv
cC5vcmc+IE9uIEJlaGFsZiBPZiBKZWV2YW4gQg0KPiA+ID5TZW50OiBGcmlkYXksIEp1bmUgMTMs
IDIwMjUgNzo0OSBBTQ0KPiA+ID5UbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4g
PiA+Q2M6IEIsIEplZXZhbiA8amVldmFuLmJAaW50ZWwuY29tPg0KPiA+ID5TdWJqZWN0OiBbUEFU
Q0ggaS1nLXRdIHRlc3RzL2ttc19zZXRtb2RlOiBGaW5kIGNvbXBhdGlibGUgbW9kZSBmb3IgZURQ
IGJlZm9yZSBzZWxlY3RpbmcgZGVmYXVsdCBtb2RlDQo+ID4gPg0KPiA+ID5UaGlzIGNoYW5nZSBm
aW5kcyBhIGNvbW1vbiBtb2RlIGZvciBlRFAgYmVmb3JlIGZhbGxpbmcgYmFjayB0byBkZWZhdWx0
IG1vZGUuDQo+ID4gPkl0IGF2b2lkcyB1bm5lY2Vzc2FyeSBmYWlsdXJlcyBieSBub3Qgc2VsZWN0
aW5nIGFuIHVuc3VwcG9ydGVkIG1vZGUgZm9yIGVEUC4NCj4gPiA+DQo+ID4gPlNpZ25lZC1vZmYt
Ynk6IEplZXZhbiBCIDxqZWV2YW4uYkBpbnRlbC5jb20+DQo+ID4gPi0tLQ0KPiA+ID4gdGVzdHMv
a21zX3NldG1vZGUuYyB8IDE1ICsrKysrKysrKysrKysrKw0KPiA+ID4gMSBmaWxlIGNoYW5nZWQs
IDE1IGluc2VydGlvbnMoKykNCj4gPiA+DQo+ID4gPmRpZmYgLS1naXQgYS90ZXN0cy9rbXNfc2V0
bW9kZS5jIGIvdGVzdHMva21zX3NldG1vZGUuYyBpbmRleCA0ODRjM2E5NWYuLjZlN2U1OTQyYSAx
MDA2NDQNCj4gPiA+LS0tIGEvdGVzdHMva21zX3NldG1vZGUuYw0KPiA+ID4rKysgYi90ZXN0cy9r
bXNfc2V0bW9kZS5jDQo+ID4gPkBAIC0yNTIsNiArMjUyLDIxIEBAIHN0YXRpYyB2b2lkIGdldF9t
b2RlX2Zvcl9jcnRjKHN0cnVjdCBjcnRjX2NvbmZpZyAqY3J0YywNCj4gPiA+ICAgICAgICAgICAg
ICAgICAgIGdvdG8gZm91bmQ7DQo+ID4gPiAgIH0NCj4gPiA+DQo+ID4gPisgIC8qDQo+ID4gPisg
ICAqIElmIGVEUCBpcyBwcmVzZW50LCB0cnkgaXRzIG1vZGVzIHRvIGZpbmQgYSBjb21wYXRpYmxl
IG9uZS4NCj4gPiA+KyAgICovDQo+ID4gPisgIGZvciAoaW50IGMgPSAwOyBjIDwgY3J0Yy0+Y29u
bmVjdG9yX2NvdW50OyBjKyspIHsNCj4gPiA+KyAgICAgICAgICBkcm1Nb2RlQ29ubmVjdG9yICpj
b25uID0gY3J0Yy0+Y2NvbmZzW2NdLmNvbm5lY3RvcjsNCj4gPiA+KyAgICAgICAgICBpZiAoY29u
bi0+Y29ubmVjdG9yX3R5cGUgPT0gRFJNX01PREVfQ09OTkVDVE9SX2VEUCkgew0KPiA+ID4rICAg
ICAgICAgICAgICAgICAgZm9yIChpID0gMDsgaSA8IGNvbm4tPmNvdW50X21vZGVzOyBpKyspIHsN
Cj4gPiA+KyAgICAgICAgICAgICAgICAgICAgICAgICAgbW9kZSA9ICZjb25uLT5tb2Rlc1tpXTsN
Cj4gPiA+KyAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKGNydGNfc3VwcG9ydHNfbW9kZShj
cnRjLCBtb2RlKSkNCj4gPiA+KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnb3Rv
IGZvdW5kOw0KPiA+ID4rICAgICAgICAgICAgICAgICAgfQ0KPiA+ID4rICAgICAgICAgIGJyZWFr
Ow0KPg0KPiBVZ2gsIHNvcnJ5IGZvciBub3QgcmVhZGluZyB5b3VyIGNvZGUgY2xvc2UgZW5vdWdo
LCBvbmUgbml0IGhlcmUuDQo+IFdoeSAnYnJlYWsnID8gQ291bGQgaXQgaGF2ZSBhbnkgbW9yZSBl
RFAgY29ubmVjdG9ycz8NCg0KSW4gbXkgb3Bpbmlvbiwgd2Ugc2hvdWxkIGFzc3VtZSB0aGF0IHdl
IGFyZSBkZWFsaW5nIHdpdGgNCm11bHRpcGxlIGVEUCBjb25uZWN0b3JzIGFuZCB0ZXN0IGFnYWlu
c3QgdGhhdC4gQnV0IHRvIGJlIHN1cmUsDQpsZXQncyBhc2sgSmVldmFuIGZvciBpbnB1dCwgYXMg
aGUgaXMgdGhlIGF1dGhvciBvZiB0aGUgcGF0Y2guDQoNCkJlc3QgcmVnYXJkcywNCk1pY2hhxYIN
Cg0KPiA+ID4rICAgICAgICAgIH0NCj4gPiA+KyAgfQ0KPiA+ID4rDQo+ID4gPiAgIC8qDQo+ID4g
PiAgICAqIElmIG5vbmUgaXMgZm91bmQgdGhlbiBqdXN0IHBpY2sgdGhlIGRlZmF1bHQgbW9kZSBm
cm9tIGFsbCBjb25uZWN0b3JzDQo+ID4gPiAgICAqIHdpdGggdGhlIHNtYWxsZXN0IGNsb2NrLCBo
b3BlIHRoZSBvdGhlciBjb25uZWN0b3JzIGNhbiBzdXBwb3J0IGl0IGJ5DQo+ID4gPi0tDQo+ID4g
PjIuMjUuMQ0KPiA+DQo+ID4gVGhpcyBwYXRjaCBsb29rcyBnb29kIHRvIG1lLg0KPiA+IFJldmll
d2VkLWJ5OiBNaWNoYcWCIEdyemVsYWsgPG1pY2hhbC5ncnplbGFrQGludGVsLmNvbT4NCj4gPg0K
PiA+IEJlc3QgcmVnYXJkcywNCj4gPiBNaWNoYcWCDQo=
