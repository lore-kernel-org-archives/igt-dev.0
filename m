Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE0A4C54E5D
	for <igt-dev@archiver.kernel.org>; Thu, 14 Mar 2024 05:42:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CB5310F62E;
	Thu, 14 Mar 2024 05:42:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k+DeypZ7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE7D710F5B2;
 Thu, 14 Mar 2024 05:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710394920; x=1741930920;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3lZ+glXYXOJPo6mwR7Rk05QKdMhIdgTGt9f+1jIl4hk=;
 b=k+DeypZ7Q73ip3zxJPV4eJhG3pSarSSYjYSFhgRR9vl8guch5Wu40dFQ
 4rDlWc0KFcQ2A+gDH3OP+X+IcEqNYWgztjMOKSX0eOmMX0SyGt1lQBIwn
 sZCLElfrvT3QJD0WI7tXHuWEuXtcnRzmwZxL97FgqvbI6ZAvE9jUG8CoK
 fKT7oG/e+wpRoUxLmZzpQBEiAoBaSVTjD4IZK6hEcsYerHbRUdKbYu6Vo
 Ls/oQxT5vx/tRlzwqtZeCPeK6N3QT8gt+QFp8VXO5Cnv7OOMZCdUwiCJ2
 xvaBYUA4BLlrvH0QZpkyPAPxIk6cpJVR5/72k4IffT6vh5eEW3AyCOc+C Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="22655189"
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; d="scan'208";a="22655189"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 22:41:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; d="scan'208";a="12754449"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Mar 2024 22:41:59 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Mar 2024 22:41:57 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Mar 2024 22:41:57 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Mar 2024 22:41:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nGF5Q2HXXW0FcPkjd3leg2Wz+Nq01F6A6I8owZ6ECSaDo4BpeXlaexuLV2XolgL79Ic3KGXbQUu82KUGyS2ZZcUi4RlqYDNIu23py8EAIeU+XKhIBHMhRPdu33VTaPoY4/YKdEJETUPpdYWP718OQ3/IX894a8CFRsN47THYbxO5SRIyaejYx+DI8AoQs029nDels5zTdmZXBJ8lhgxD13OVIAvbgxhaSIBjgwmmhtD/+59EKgmfEi/MzMEv2Si6CYc8aZoW1WL7+0gGeyjdS2SQ6flqLTz9G4rgmBDDUnIaIhCEx78H1NH8K0gHdA/XAUQOueMk4gvAsPD9VasFfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3lZ+glXYXOJPo6mwR7Rk05QKdMhIdgTGt9f+1jIl4hk=;
 b=k3WCoh0WIHKFRn5Z4vimexk2DXoX7hpHbMh2BkWO/o+yG/eLZn6oNN+2dxPJL5LgDUxQixNi6Gg5mWIc4DmaRTnk38rLIV2fyunQiwObIpAYYiFrqhRECNcGJkGiw6FYkJyVauINttBHhRXaAb8taH0K90BZ8nspsGWNnIUc701cFFfyxkUqKyuqggIQPBguu+qPaChSFWUaCFGZZnWws7869lMLna+c4pxtZUF2WX5E39jXdweM/rjJKpG+D8AZAhmREhoFfkvQ5yaJS7Jf9doi8ZevR4soctJGCZ9fePZGzfcKDSf/HY9+jLuuljNoSW+qNUtmm6LFq2ZUaq9h/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB6753.namprd11.prod.outlook.com (2603:10b6:510:1c8::22)
 by MW4PR11MB6982.namprd11.prod.outlook.com (2603:10b6:303:228::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17; Thu, 14 Mar
 2024 05:41:49 +0000
Received: from PH8PR11MB6753.namprd11.prod.outlook.com
 ([fe80::872:479f:4c28:21b5]) by PH8PR11MB6753.namprd11.prod.outlook.com
 ([fe80::872:479f:4c28:21b5%6]) with mapi id 15.20.7386.016; Thu, 14 Mar 2024
 05:41:49 +0000
From: "Illipilli, TejasreeX" <tejasreex.illipilli@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "I915-ci-infra@lists.freedesktop.org" <I915-ci-infra@lists.freedesktop.org>,
 LGCI Bug Filing <lgci.bug.filing@intel.com>
Subject: =?utf-8?B?UkU6IOKclyBGaS5DSS5CQVQ6IGZhaWx1cmUgZm9yIHRlc3RzL2ludGVsLWNp?=
 =?utf-8?Q?/xe:_Block_pc8-residency_tests_on_XE?=
Thread-Topic: =?utf-8?B?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMvaW50ZWwtY2kveGU6?=
 =?utf-8?Q?_Block_pc8-residency_tests_on_XE?=
Thread-Index: AQHac3fEZ1VQMzCm6EuQA2WUmn3usbEygKoAgAQ84MA=
Date: Thu, 14 Mar 2024 05:41:49 +0000
Message-ID: <PH8PR11MB67531AD1FA5E3B09D52AE122F2292@PH8PR11MB6753.namprd11.prod.outlook.com>
References: <20240311044115.3665980-1-bhanuprakash.modem@intel.com>
 <171013609245.663129.11688182200105500883@8e613ede5ea5>
 <20240311125824.c3h6h4e4r6g22xcz@kamilkon-desk.igk.intel.com>
In-Reply-To: <20240311125824.c3h6h4e4r6g22xcz@kamilkon-desk.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6753:EE_|MW4PR11MB6982:EE_
x-ms-office365-filtering-correlation-id: 4b34067c-57bc-4b83-f493-08dc43e971bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R6ZZx+cunfAfR1ji87rHkQslbWM+fwNnVjjwszl6ix/2X2D8ksGXqzdeAWHFCdKNwMCWBpLQc+Mrdcq5qhLHRF0WuODFnR5ios+ai6csOWBLyHVhxO8LHYQXUH4z/WRCVcWYXz2m0iGXCycymmYY1HSjxjT73X/S1GF0ROqrtXYbfZF6Yc15Lrklgr+WxATr6WNnevWz8kPbHcCW1T14/dio6GnbIkUZi03sOsKlcf6Tfkhc8fa7bmekRb8f3JlhNP5RvRUKMfNS2t95MY3mCNJXzfzP2HmnRJySDoKlIHgsesxgvmkSu7ykNjFW3Pl5da1g764e7+xZgLZdXxrhc5gdcNxvqkkK69z0x41bnKUsollCfqp+iFHhVAmjWsSsfYNGmxcY00O0fnvW4Eq78u425c+A1aMCs4c6pjIrAspQGG4x6ogsTWQkrOmWAuO7CCxq8lrm1R8KbJOS0eEYbtAatjAVfw3gVSEE8L4bCIOwKr5OP4nevAxnmR1zwcXC1cUhlZjo14SzxVGNqRe+5JrgBx4sLp9iXjn0f61pPystiEdxLZwGRAyyw3cGKYloC5Pv6HHi5UcSb4d60vsPyKSa/VDCkMKH4bZVAtbrhUeav2JXzc1V96N22W/NOBed7EQzILtSKF0RiRE8IMRRPAsFNuB/+RW+940BsEjJf8w=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6753.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UU1HYStFUWQ0Tnh1UEV3aERUcW8rOHFpYlc4Qnp4bTJ5c3B0RklybEVla0lB?=
 =?utf-8?B?RXRnUlNnNk1OMnh2aWRNN0UwUFNnellFT2g3RWhGT1hRTUpHN0tJVnRSZFpZ?=
 =?utf-8?B?Nkd1cSszZ0NSTjVSOCtKdFVTZHZMM1hiaHBQQVZ4aU5mTXFmTE5BWjRrWDNs?=
 =?utf-8?B?d05iZXhncm5FNVBwTUZucnlqRXhteVNPakZiY3Q1ZDFHTXpBeXczWUxoMzJ5?=
 =?utf-8?B?QmhkNkt6bUU0KzJrUXBqQjdCT0FmS0ZxV0R6VXNlV1hJRVV2ZW1jL0w0cVNL?=
 =?utf-8?B?RVIzanA5QVhHeU1jeXAwa1NON1ExRlJuay85cDY2UmErYzZ3WDd5Z2IxelBI?=
 =?utf-8?B?TmNlNG1ZVHlxaHlWcWRSdldmM1UxOVErUmd1RFdKYnM2REJJblZmdFFjbkVr?=
 =?utf-8?B?VDZXTHdBbmc1YjdzVFJLOW9iam5rVEp4cEdBS0ZaTStQUHUvV3hSckd3cXQ1?=
 =?utf-8?B?bEwyMm5CV1dlRlVxRWxpd000RDFXQ25jSlpHeW5TVmwzaHVZRUFtdEdZZGdx?=
 =?utf-8?B?bDVBVm11em94Wlhwbmk0SE1QMVJaaUxpVmZUVFVOcU1OU3VRck9MUzdOaGxM?=
 =?utf-8?B?Q3hpY3lMMnVRdGxSN1RYendyenpiQTg4KzBRcEM1UHlZUXRiMEpzZGswYlZj?=
 =?utf-8?B?TVVZaDdDdjFLTGdyWkZYQXhmYndyVGt1MnRKalRxdmRLRUxnaHNsZS9QNFdP?=
 =?utf-8?B?SGRIUHZyajEwZFc1ODR1cHhuMmFpd1o0dHB3UVZMU013aGlud09wTXZCTXBM?=
 =?utf-8?B?OHRKK2l5V2ViVFhTdmhBU3haYXZsZUdtYUZlUGtNVXVjd2plbE9Ka0hIZEJK?=
 =?utf-8?B?S3dldWRiVW1pbjcvM045dDRFQWMyRDhTT3RwSkVlTHVqTmlwR3hZbXlET0ZB?=
 =?utf-8?B?dkFDYVd0REtVOUF3ZVRpU0FIK2w2OHJmbEsrb21vVE1YTVhVWnU1RnB1RlRr?=
 =?utf-8?B?bTlsaDM2MzJ2QWtQSEJZSW5nT1dqc2ZKcDhiZkhVenYrVm9ZYmZ5QWdVaWZx?=
 =?utf-8?B?S09xaXB3UStrVUQ2OTdkVDR2N2pEbGI4eGJMN1FSRnpyQXpoUjdhQzBsNVR6?=
 =?utf-8?B?MjRjNk1MdDRNdzFvZmNLOGROUStZMHpwWEpLRmlzZU5Bek1XSXBaZHl6S0NN?=
 =?utf-8?B?ODlpU3owb1VjQmdZdGk1VXFvMnZOODJUVi9nQWo4RDloR01VdDdla0llWTF1?=
 =?utf-8?B?MWdqNmJxY1ZSMzZyQ3VQWmtvdGNHYThvckZJekJReGZXNjd3TmluOVlmcFBj?=
 =?utf-8?B?QXl4V3dWK3ZZYTRnb0RzV1MwUUprK0FCTFk5bHNmSlVSWDJvdWpNR2VBSml2?=
 =?utf-8?B?cGJMc1VCZ1pwUXBDczRrZ21UNW5GVHlQZk0ydnZ1cnNidTJ5RTc1dXNFVzFR?=
 =?utf-8?B?Q2o3QVYwSVhQMWhEVUtGTEdmSVdzR1MzMURtZUZhaGZ1eFNaMUl3M0liSVRN?=
 =?utf-8?B?U3dVcmljWHltQXhzcjBOQVFpNk1rUTg3SHZVNFI0ZDVWSlBSNWhBdDlWdVlX?=
 =?utf-8?B?UjFVOGdjREx0a2R4NGhpaUhDcnlJQk9OMnIweTFTbVc4N0JsSkVZc3JwaGFh?=
 =?utf-8?B?Z0FnTEg0L2NucEw0M1I4MmRjTXZJM1h1TVhlNGJHRWNiZ01OQ1Btamd3MHQy?=
 =?utf-8?B?NGMwdVpQb1lEVEt0N1NNckh1dnE4QkcwTGJQcTA0UytxNkgzSUJDR1RMcjZi?=
 =?utf-8?B?cmg5L1UvOFU0elZSNStia29CbjBVVjhzM3FRbFBjVml5ay8zSFhZd3NTNDRp?=
 =?utf-8?B?YWxWd0FOQnRPbzdsVjhpb1pLdUo5US9VTnlJZWlsSWQ3OGJiMWpXOXR5Q215?=
 =?utf-8?B?Tmg1L251WitLZGZTNTBIdlhXaTRibkU3RFFFZ1AwS1pOOEJCQ01CSUpabDFX?=
 =?utf-8?B?UW1UZW5lY2R3cWtNQWNHbWNLak0vZzBEd0JVSFdKa1pMaFphZlkvZ29NZXdV?=
 =?utf-8?B?Mm91SjMrQUxOVnFGazNuUDBkVW1ZMElTcGFqbklmVncxMDY4UU1USUozSS84?=
 =?utf-8?B?eXdWa3dRMTdzVS81bU9rTTdRMFRMZGllanZZODduYXNGY0tnYVZlNnJPcGp1?=
 =?utf-8?B?dUVlZlVMeWpiZm1VRUVEZWdmd2pHMUN5V2xLU3cvZW5hek5LV05QTEMzZ3BP?=
 =?utf-8?B?MytPNm11ZWlNYzZ2YmY0aDZLeERnMnRQSHFhMzlzaGlFL05RaW5lRHhGb1px?=
 =?utf-8?B?V0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6753.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b34067c-57bc-4b83-f493-08dc43e971bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2024 05:41:49.4337 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QK+8C+7oOBULNFQdsoqVFTpi8QtbvZN4w9GfoGyDrg+ogtn6k695pEBIzH0c2JToc30xkdArpVpFSQEv3+spjtSaYThG9W9NrkIlY9kaT5c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6982
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

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTMwOTYyLyAt
IFJlLXJlcG9ydGVkLg0KDQpUaGFua3MsDQpUZWphc3JlZQ0KDQotLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KRnJvbTogS2FtaWwgS29uaWVjem55IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50
ZWwuY29tPiANClNlbnQ6IE1vbmRheSwgTWFyY2ggMTEsIDIwMjQgNjoyOCBQTQ0KVG86IGlndC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogTW9kZW0sIEJoYW51cHJha2FzaCA8YmhhbnVw
cmFrYXNoLm1vZGVtQGludGVsLmNvbT47IEk5MTUtY2ktaW5mcmFAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnOyBMR0NJIEJ1ZyBGaWxpbmcgPGxnY2kuYnVnLmZpbGluZ0BpbnRlbC5jb20+OyBJbGxpcGls
bGksIFRlamFzcmVlWCA8dGVqYXNyZWV4LmlsbGlwaWxsaUBpbnRlbC5jb20+DQpTdWJqZWN0OiBS
ZTog4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMvaW50ZWwtY2kveGU6IEJsb2NrIHBj
OC1yZXNpZGVuY3kgdGVzdHMgb24gWEUNCg0KSGkgaWd0LWRldiwNCk9uIDIwMjQtMDMtMTEgYXQg
MDU6NDg6MTIgLTAwMDAsIFBhdGNod29yayB3cm90ZToNCj4gPT0gU2VyaWVzIERldGFpbHMgPT0N
Cj4gDQo+IFNlcmllczogdGVzdHMvaW50ZWwtY2kveGU6IEJsb2NrIHBjOC1yZXNpZGVuY3kgdGVz
dHMgb24gWEUNCj4gVVJMICAgOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2Vy
aWVzLzEzMDk2Mi8NCj4gU3RhdGUgOiBmYWlsdXJlDQo+IA0KPiA9PSBTdW1tYXJ5ID09DQo+IA0K
PiBDSSBCdWcgTG9nIC0gY2hhbmdlcyBmcm9tIENJX0RSTV8xNDQxOCAtPiBJR1RQV18xMDgwMCAN
Cj4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0K
PiANCj4gU3VtbWFyeQ0KPiAtLS0tLS0tDQo+IA0KPiAgICoqRkFJTFVSRSoqDQo+IA0KPiAgIFNl
cmlvdXMgdW5rbm93biBjaGFuZ2VzIGNvbWluZyB3aXRoIElHVFBXXzEwODAwIGFic29sdXRlbHkg
bmVlZCB0byBiZQ0KPiAgIHZlcmlmaWVkIG1hbnVhbGx5Lg0KPiAgIA0KPiAgIElmIHlvdSB0aGlu
ayB0aGUgcmVwb3J0ZWQgY2hhbmdlcyBoYXZlIG5vdGhpbmcgdG8gZG8gd2l0aCB0aGUgY2hhbmdl
cw0KPiAgIGludHJvZHVjZWQgaW4gSUdUUFdfMTA4MDAsIHBsZWFzZSBub3RpZnkgeW91ciBidWcg
dGVhbSAoSTkxNS1jaS1pbmZyYUBsaXN0cy5mcmVlZGVza3RvcC5vcmcpIHRvIGFsbG93IHRoZW0N
Cj4gICB0byBkb2N1bWVudCB0aGlzIG5ldyBmYWlsdXJlIG1vZGUsIHdoaWNoIHdpbGwgcmVkdWNl
IGZhbHNlIHBvc2l0aXZlcyBpbiBDSS4NCj4gDQo+ICAgRXh0ZXJuYWwgVVJMOiANCj4gaHR0cHM6
Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMDgwMC9pbmRleC5odG1s
DQo+IA0KPiBQYXJ0aWNpcGF0aW5nIGhvc3RzICgzMSAtPiAzMCkNCj4gLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tDQo+IA0KPiAgIEFkZGl0aW9uYWwgKDEpOiBiYXQtZGcxLTcgDQo+ICAg
TWlzc2luZyAgICAoMik6IGZpLWNmbC04MTA5dSBmaS1zbmItMjUyMG0gDQo+IA0KPiBQb3NzaWJs
ZSBuZXcgaXNzdWVzDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gDQo+ICAgSGVyZSBhcmUgdGhl
IHVua25vd24gY2hhbmdlcyB0aGF0IG1heSBoYXZlIGJlZW4gaW50cm9kdWNlZCBpbiBJR1RQV18x
MDgwMDoNCj4gDQo+ICMjIyBJR1QgY2hhbmdlcyAjIyMNCj4gDQo+ICMjIyMgUG9zc2libGUgcmVn
cmVzc2lvbnMgIyMjIw0KPiANCj4gICAqIGlndEBpOTE1X3NlbGZ0ZXN0QGxpdmVAd29ya2Fyb3Vu
ZHM6DQo+ICAgICAtIGJhdC1hcmxzLTE6ICAgICAgICAgW1BBU1NdWzFdIC0+IFtETUVTRy1XQVJO
XVsyXQ0KPiAgICBbMV06IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAv
Q0lfRFJNXzE0NDE4L2JhdC1hcmxzLTEvaWd0QGk5MTVfc2VsZnRlc3RAbGl2ZUB3b3JrYXJvdW5k
cy5odG1sDQo+ICAgIFsyXTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2Ry
bS10aXAvSUdUUFdfMTA4MDAvYmF0LWFybHMtMS9pZ3RAaTkNCj4gMTVfc2VsZnRlc3RAbGl2ZUB3
b3JrYXJvdW5kcy5odG1sDQo+IA0KDQpUaGlzIGlzIHVucmVsYXRlZCB0byBjaGFuZ2UgaW4gY2kg
YmxvY2tsaXN0LA0KDQpSZWdhcmRzLA0KS2FtaWwNCg0KPiANCg0KLi4uY3V0Li4uDQoNCj4gQnVp
bGQgY2hhbmdlcw0KPiAtLS0tLS0tLS0tLS0tDQo+IA0KPiAgICogQ0k6IENJLTIwMTkwNTI5IC0+
IE5vbmUNCj4gICAqIElHVDogSUdUXzc3NTEgLT4gSUdUUFdfMTA4MDANCj4gDQo+ICAgQ0ktMjAx
OTA1Mjk6IDIwMTkwNTI5DQo+ICAgQ0lfRFJNXzE0NDE4OiAyYzI5NTdiYjFhMDA1OGVhODVjYTIx
ZDYyNzYyYWE1NGUyOGFmZjU0IEAgZ2l0Oi8vYW5vbmdpdC5mcmVlZGVza3RvcC5vcmcvZ2Z4LWNp
L2xpbnV4DQo+ICAgSUdUUFdfMTA4MDA6IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVl
L2RybS10aXAvSUdUUFdfMTA4MDAvaW5kZXguaHRtbA0KPiAgIElHVF83NzUxOiA4NjE3M2QwMWQ0
ZDM2NDQyMzdmNzgxZGM1Zjk4OTBiZDI2Yzk4OGRlIEAgDQo+IGh0dHBzOi8vZ2l0bGFiLmZyZWVk
ZXNrdG9wLm9yZy9kcm0vaWd0LWdwdS10b29scy5naXQNCj4gDQo+IA0KPiBUZXN0bGlzdCBjaGFu
Z2VzDQo+IC0tLS0tLS0tLS0tLS0tLS0NCj4gDQo+ICtpZ3RAa21zX2JpZ19qb2luZXJAMngtbW9k
ZXNldA0KPiAraWd0QGttc19iaWdfam9pbmVyQGJhc2ljDQo+ICtpZ3RAa21zX2JpZ19qb2luZXJA
aW52YWxpZC1tb2Rlc2V0DQo+IC1pZ3RAa21zX2JpZ19qb2luZXJAYmFzaWMtYmlnam9pbmVyDQo+
IC1pZ3RAa21zX2JpZ19qb2luZXJAYmFzaWMtZm9yY2Utam9pbmVyDQo+IC1pZ3RAa21zX2JpZ19q
b2luZXJAaW52YWxpZC1tb2Rlc2V0LWJpZ2pvaW5lcg0KPiAtaWd0QGttc19iaWdfam9pbmVyQGlu
dmFsaWQtbW9kZXNldC1mb3JjZS1qb2luZXINCj4gDQo+ID09IExvZ3MgPT0NCj4gDQo+IEZvciBt
b3JlIGRldGFpbHMgc2VlOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJt
LXRpcC9JR1RQV18xMDgwMC9pbmRleC5odG1sDQo=
