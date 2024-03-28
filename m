Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3797CC54E67
	for <igt-dev@archiver.kernel.org>; Thu, 28 Mar 2024 10:33:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C490710F243;
	Thu, 28 Mar 2024 10:33:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LnHb3z6i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D86E410F243
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Mar 2024 10:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711621993; x=1743157993;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=8Y9ZQmzgZwtEp0pw2PWBP+Q3dI0LdnCoEFs+pXsTCY4=;
 b=LnHb3z6iY8j2pqcAq0Mg+nTSJvBd98ymXTSGVRcYDNB/O/eVj6P7r6kG
 QrOI3TdeMKz+j0tfrESF9j2QbgrtmfCF0L0oDSjIKFYi2lGygyqz51z2r
 ZVpPtiR7o6MgSVruhDKnLX6TKa4H+Bs08n/jJNRBbQVt2BARYhkOKEBqh
 gwlCNnU/nr6GBTJWK8m+ONCkKV3a0yNGG9zVsHBf3I/C3q2fYGvEE64rX
 esygue+hLi5aIMMu407C20OJcECGm7jqoA4WOJoZGlp2MB04x40uzl7mg
 nOqfeArp2SlIsPeKg4pYIV5E/fzyZmOLni7u/H4JSJJRkHdZpPOTR/BhH A==;
X-CSE-ConnectionGUID: nBTB2OE3Q/mqDsMbKkh7rQ==
X-CSE-MsgGUID: D40B3u3uTZKWj4ElK80Q1g==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="6627959"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="6627959"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 03:33:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="21330638"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Mar 2024 03:33:08 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 03:33:07 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 03:33:07 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 28 Mar 2024 03:33:07 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 28 Mar 2024 03:33:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V+i1etthsuMirt/gHxJya5ZstgxKVtBDKnLAvM40DRYL8+cVAp7WnkgBeoZvXQrGXPML8BSm7la2jfj5v0LL40UPu1dUqGbVPgoXK/F1JEro6BBAQ3dllbHLs9JZplI/hGQzK+w54dtJDT8syvVYoBZkb7YIcjtATaWjiSCQuExfokHHMhj2myxwJDuRvF6sk9BTrZbKqn+4wZbO8wEJebcquRMhppV40aZlE3cEl5BcAmt9L2PniBHPJSJGXeMRFlasVU6DyAqGgIkZD2ptzpbibTjK4YyHFVVXUcXx8+KLWTKV8sz7cHs+a8GXbRXdgM9ostnvy2p6gnxBwPohRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Y9ZQmzgZwtEp0pw2PWBP+Q3dI0LdnCoEFs+pXsTCY4=;
 b=E5Jkj0GKXIcE/49Z/qnDfbqoVIy/NWxIb3erRhJLUrmTrgyh5X2CMS3ukTaeAKiXASrcZPHCoB80Wj9ihlLM9G9a+8Z/8mzbgCsN8uJGXG5OyOCXhAMgzLaAucJOt5R2xOzRUW6dJir2lf7VXXIuEXQCDnrO/4May6WN7pW61SwJIqB2lirAgAG1OY/AeSYW3Md21N5AvCTB9yiqeT1XTB9FkYfcfMP8ePh1FrGgsecjDsRkgPei/5riz2O9s0pcgRLGwLk576BxqzieDm0faB4yZ3/UGoZ39N26F22QQitD2276jJ31pDAQv72sxBsRlRkIrQdC8PECHRJDlWD5oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 SA1PR11MB7109.namprd11.prod.outlook.com (2603:10b6:806:2ba::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Thu, 28 Mar
 2024 10:33:05 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::d317:e2a8:8e14:7bff]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::d317:e2a8:8e14:7bff%7]) with mapi id 15.20.7409.031; Thu, 28 Mar 2024
 10:33:04 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/2] tests/kms_pm_dc: Ensure PSR is enabled
Thread-Topic: [PATCH i-g-t 1/2] tests/kms_pm_dc: Ensure PSR is enabled
Thread-Index: AQHaf4BtN1tK43OCYkqTa5JSWz91fLFLJPuAgAHSowA=
Date: Thu, 28 Mar 2024 10:33:04 +0000
Message-ID: <8ec708d92b2b691b0bcbf2d02c7951fe20ad0f20.camel@intel.com>
References: <20240326132012.3747302-1-jouni.hogander@intel.com>
 <PH0PR11MB480610DDB438FDEB0115C277E4342@PH0PR11MB4806.namprd11.prod.outlook.com>
In-Reply-To: <PH0PR11MB480610DDB438FDEB0115C277E4342@PH0PR11MB4806.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|SA1PR11MB7109:EE_
x-ms-office365-filtering-correlation-id: 5ce1d7b3-418a-4509-3f36-08dc4f127382
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: juH8PLEOTNSRwSKIo6LMxv7meopGQbsR3E3UsHz1pewe6KcuMR2s4aIaybMW9F8rQ2w+uxjGJ2Diq0JRBsFN9t/H0Oj2Ev0fypqn8NN2nbj9DsRu2UQKsHpcGp8Xyu5g4NVZissQXrJCXLKhCYu3QdHXhB3uEnxttULaHdFECvAYcqLf5o7mRSgZhx2k1ZRQGt+az9KuwEaHZhzbTvyvfHI+p48MbclfsCQsehWU1UXWE/yh8wugWiXJysQLrFSSgXEHOywQAdT2/ci+1iPtFQca9Wj5PZhVlB2qeqMA9oxbUIWlZ5vsh4O8XKmjHbPT623C7pWgr6M6yHa4iQSfNeToWROnCIn/tB8w96dsfz8Puhkk3SrhgXoPd5E6r4s9oNAwzyp6ZjpVLzURIlj1dTb7Q/Gd5sCZU41pUxMVlEnP+UAyL3ToPpXOKnJOSoG3HDv2ipUjAcJxARWAxuCc1jr92fwB7THVKTCASzc756cKyYaVGpuu9vvZspzIIiv+6XsIjP7toDyV6FJIA6LZYjNCfeueci50rFHvTUq3uQSTZsc1AI+uCeAT9BL+voSv/99QzpJAEwsGopZikivT/tyeqWi/2tgAn6O1547a3WQagCm0Ro9P02MFi5aFyirjuSozPSigQ5/7yF/Gbq+iA1stfI41bT6OVpt7lruqnaU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NExITy94blY0clJ1anhxQnVLenBFNm1qUXFlQkdqT1R2ZlM4Z0p1QjI2bTlv?=
 =?utf-8?B?ajg2UFVjSEk2UmVqZkJHaWJ3R3hMd2YyeS9mUnZCYU9Ibm9rRXhqUmE4ZTNn?=
 =?utf-8?B?WnRmNmp4SVdxOXMxNmhFakNVZ1RDRGJVNEhTRlRIamtDbnk4c1Y5OUJMU3dq?=
 =?utf-8?B?eUVVS3UxeFBHSENCaHpXaTEwajA1eUVCaDFLOFdpVk1TaUpPQlVEQ3ZCQzBp?=
 =?utf-8?B?UHJQaEhMSE1XQks2czVraW1ZQXh6bThQcFVQMTFzQWc1ODB5Uk5PcGwwYi9h?=
 =?utf-8?B?Q1J6WS80MzJ2N3FsOWFmL3ZnTE8wR204MENjYWhwcU1FSllGcm5xUFlMRnRt?=
 =?utf-8?B?UFZPU0dNU0NZVjczMjRrYSsydDhac3gzRE92VjNqdjlWS0pyTTJ1SFlmdEZq?=
 =?utf-8?B?Wkt2R0lEWU9ldVhTUG5kbytuR05icks2N0E4S1NaOWp4Y0luRHhUSmwxSkEr?=
 =?utf-8?B?NzJYMCtmYmVjTlMzZGJOa3o2YzRYaE9pblhSN3l3QnRGL2RhNkhQVzJpdDYw?=
 =?utf-8?B?UkVDSC9LWUJtWlJQdXF6QW84ZjhZeitmczIrdStaNlE0VWY3ZGp5ZkpGUkNz?=
 =?utf-8?B?SnlaSmZVVHJaRlppOU0rM096UmxzZFhXSDlrK25PUGgvTjY4TzN6WUhqZzRY?=
 =?utf-8?B?RjRtaTZncUJPY0k4OUIxQk9JM1FUMnpybWZjSDc0eXZpTnE1L1hpRUZwV0F5?=
 =?utf-8?B?RWRCQklmaTh5MUlhTUxTdjU0b2FSWHJGSkY2QWFyZkVnNkYrMnREQXM1K2V2?=
 =?utf-8?B?SkczUEt0ODJMU2Q1NUlPckJsM1NVa0l4LzVEZ080N2hHbWFOTGJlSmxpTEhQ?=
 =?utf-8?B?VlQra3VmbEoxNzZ0TTEvU0RDTm1JV3JWRjhINEU5S3loRGtxOXpMMHJZSjZz?=
 =?utf-8?B?bjIwZFYxWHpVaEEwYzlGTnZ3SXdDcURNSnhQa0xscXVkeU9uY3VkR1c0bWdk?=
 =?utf-8?B?R0pqbU9BSG5ReGpLNHFaWi91WmpzTTgxQXB6TGhFTldnSDZFNFJPbno2R3g3?=
 =?utf-8?B?OGZJNkg3U1RCV1FHRHh1U0FwSE1vYzJTZnlqSThJalZuTldtQTZpYVVraXZQ?=
 =?utf-8?B?ZVFFL0pMQ1drcC9tTEYrckk3bWxGTGJ1dExBZVdlU2RXNk94RGhYa0F5MUhm?=
 =?utf-8?B?U1hjMXA0bzRFVDNPVWdGNEdudE1vbng0SmVHVHFNelR5cVJOR2xQL29kSGQ1?=
 =?utf-8?B?dVd1UW96VWJNQ3R1c1E4UE1VSnp2QkRGL0JMTFlsV21USWFVTG9kRm1KWnRq?=
 =?utf-8?B?dmtGRURPbXJCUm1oRmtML1JSTmVoZlFFVUs3YXFvR3dOUmlRQjhicC9aNTQv?=
 =?utf-8?B?dlQ3RWZsS3dENUZ1OGRZNUIxV05wYWt0MGJNMzhwaU0rb2Q2YS9xcmtNdjVD?=
 =?utf-8?B?ZWQ1bkpCN1dzNFg2SHpWTHNNcUNzdEJqVm82NE90SG5tbWh3Nlh0OE10Z1Vn?=
 =?utf-8?B?aTYvb29aeWVqZGFIYjl1TGtoWitPL1BRbjZLNGY5dDRQZnd6Y2RDcFh6Y1hz?=
 =?utf-8?B?WlVPMTh4VGxjdzdmVEgrZm5VSUpBcXNHZmQvcTlOc2VYaHJST253OFh4aEdr?=
 =?utf-8?B?dzZOWjFNSDFvZ0NFd0YvYTdwU3BpVzg3SlZQNDdDYVFLMlNidndDaWJ1MHJR?=
 =?utf-8?B?aHJQY2ZFYWg0YUVKZDZpZk1lbGVZTForcmF1N0NaZXpHOVg2TDJEeWt6VVgr?=
 =?utf-8?B?QUhJdC8rWmpqTGV2S2ZvRXBwRzgvcTI3bEYvZk9WSWh4djlCTnRrZUVPdFF4?=
 =?utf-8?B?RFBuY0JPQTVBZFBzSmxndGF4YWxZMkNDL3N0RHNrOC9ZYUJmTXdPZyswRERh?=
 =?utf-8?B?MVkvV3E2L05PUFJZRzBHbmlSS0srR2lxMTltS0tKdmtlOTFSUHFyT0RrUDBZ?=
 =?utf-8?B?a0xjMlJLNWZkUFJvS3RuMVptN2g0VWNrd0FkT3daV25hUXR1aHIyNllhR1Nv?=
 =?utf-8?B?eUpOdFBpSnpTK1R3ZHp4RlZ3WEVzdnhWNndJT2ZyTGRlRk90NXprR1UrNEtM?=
 =?utf-8?B?K1dSRnprUzdVWmY5NmdkN053ZG96ajNyMGk5S0RlNUtMUlFtWHpBQzVOYXd2?=
 =?utf-8?B?ZlBmS3JtKzBrRjRncXU1YVdpY0xhd2o5aWpncjU3bVFUZXRaMnN0c3dLbUpt?=
 =?utf-8?B?UUZKREJUQ3ZJNTFoWkhhKzg2SDAvMHZtSmVNTVFGUWxiNzBpZFpQRDhla2Jn?=
 =?utf-8?B?OGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8CA8BA0AA0992F4EA177312D964EE830@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ce1d7b3-418a-4509-3f36-08dc4f127382
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2024 10:33:04.5184 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7Pjg6UlIw7VuAOlr5ZNeZgr23QkHD5q8fvdR5kPUyqAyyaHTvLEHTh8jUVlt1Z7b0k4QHIwBYcOqTavQF3NHwij0bN4p3vc7eSGO0lYlwI0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7109
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

T24gV2VkLCAyMDI0LTAzLTI3IGF0IDA2OjQyICswMDAwLCBUaGFzbGVlbSwgTW9oYW1tZWQgd3Jv
dGU6DQo+IExHVE06DQo+IFJldmlld2VkLWJ5OiBNb2hhbW1lZCBUaGFzbGVlbSA8bW9oYW1tZWQu
dGhhc2xlZW1AaW50ZWwuY29tPg0KDQpUaGFuayB5b3UgTW9oYW1tZWQgZm9yIHJldmlld2luZyBt
eSBwYXRjaGVzLiBUaGVzZSBhcmUgbm93IHB1c2hlZCB0bw0KbWFzdGVyLg0KDQpCUiwNCg0KSm91
bmkgSMO2Z2FuZGVyDQoNCj4gDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IGlndC1kZXYgPGlndC1kZXYtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFs
ZiBPZg0KPiBKb3VuaSBIw7ZnYW5kZXINCj4gU2VudDogVHVlc2RheSwgTWFyY2ggMjYsIDIwMjQg
Njo1MCBQTQ0KPiBUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEhvZ2Fu
ZGVyLCBKb3VuaSA8am91bmkuaG9nYW5kZXJAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0gg
aS1nLXQgMS8yXSB0ZXN0cy9rbXNfcG1fZGM6IEVuc3VyZSBQU1IgaXMgZW5hYmxlZA0KPiANCj4g
SW4gY2VydGFpbiBjYXNlcyBQU1Igc3VwcG9ydCBpcyBpbmZvcm1lZCwgYnV0IGl0IGRvZXNuJ3Qg
Z2V0IGVuYWJsZWQNCj4gZHVlIHRvIHNvbWUgbGltaXRhdGlvbnMuIFRoaXMgaXMgY2F1c2luZyBm
YWlsdXJlcyB3aGljaCBhcmUgYWN0dWFsbHkNCj4ganVzdCBleHBlY3RlZCBiZWhhdmlvdXIuIEZp
eCB0aGlzIGJ5IGNoZWNraW5nIFBTUiBpcyByZWFsbHkgZW5hYmxlZA0KPiBhbmQgc2tpcCBpbiBj
YXNlIGl0IGlzIG5vdA0KPiANCj4gQ2xvc2VzOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5v
cmcvZHJtL2ludGVsLy0vaXNzdWVzLzk3MzcNCj4gU2lnbmVkLW9mZi1ieTogSm91bmkgSMO2Z2Fu
ZGVyIDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+DQo+IC0tLQ0KPiDCoHRlc3RzL2ludGVsL2tt
c19wbV9kYy5jIHwgMiArKw0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4g
DQo+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC9rbXNfcG1fZGMuYyBiL3Rlc3RzL2ludGVsL2tt
c19wbV9kYy5jIGluZGV4DQo+IDdkZWViZjgzZC4uMTc2ZjdhMDRiIDEwMDY0NA0KPiAtLS0gYS90
ZXN0cy9pbnRlbC9rbXNfcG1fZGMuYw0KPiArKysgYi90ZXN0cy9pbnRlbC9rbXNfcG1fZGMuYw0K
PiBAQCAtMzk5LDYgKzM5OSw3IEBAIHN0YXRpYyB2b2lkIHRlc3RfZGNfc3RhdGVfcHNyKGRhdGFf
dCAqZGF0YSwgaW50DQo+IGRjX2ZsYWcpDQo+IMKgwqDCoMKgwqDCoMKgwqBkY19jb3VudGVyX2Jl
Zm9yZV9wc3IgPSByZWFkX2RjX2NvdW50ZXIoZGF0YS0+ZGVidWdmc19mZCwNCj4gZGNfZmxhZyk7
DQo+IMKgwqDCoMKgwqDCoMKgwqBzZXR1cF9vdXRwdXQoZGF0YSk7DQo+IMKgwqDCoMKgwqDCoMKg
wqBzZXR1cF9wcmltYXJ5KGRhdGEpOw0KPiArwqDCoMKgwqDCoMKgwqBpZ3RfcmVxdWlyZSghcHNy
X2Rpc2FibGVkX2NoZWNrKGRhdGEtPmRlYnVnZnNfZmQpKTsNCj4gwqDCoMKgwqDCoMKgwqDCoGln
dF9hc3NlcnQocHNyX3dhaXRfZW50cnkoZGF0YS0+ZGVidWdmc19mZCwgZGF0YS0NCj4gPm9wX3Bz
cl9tb2RlLCBOVUxMKSk7DQo+IMKgwqDCoMKgwqDCoMKgwqBjaGVja19kY19jb3VudGVyKGRhdGEs
IGRjX2ZsYWcsIGRjX2NvdW50ZXJfYmVmb3JlX3Bzcik7DQo+IMKgwqDCoMKgwqDCoMKgwqBjbGVh
bnVwX2RjX3BzcihkYXRhKTsNCj4gQEAgLTYwNSw2ICs2MDYsNyBAQCBzdGF0aWMgdm9pZCB0ZXN0
X3BrZ2Nfc3RhdGVfcHNyKGRhdGFfdCAqZGF0YSkNCj4gwqDCoMKgwqDCoMKgwqDCoHByZXZfdmFs
dWUgPSByZWFkX3BrZ2NfY291bnRlcihkYXRhLT5kZWJ1Z2ZzX3Jvb3RfZmQpOw0KPiDCoMKgwqDC
oMKgwqDCoMKgc2V0dXBfb3V0cHV0KGRhdGEpOw0KPiDCoMKgwqDCoMKgwqDCoMKgc2V0dXBfcHJp
bWFyeShkYXRhKTsNCj4gK8KgwqDCoMKgwqDCoMKgaWd0X3JlcXVpcmUoIXBzcl9kaXNhYmxlZF9j
aGVjayhkYXRhLT5kZWJ1Z2ZzX2ZkKSk7DQo+IMKgwqDCoMKgwqDCoMKgwqBpZ3RfYXNzZXJ0KHBz
cl93YWl0X2VudHJ5KGRhdGEtPmRlYnVnZnNfZmQsIGRhdGEtDQo+ID5vcF9wc3JfbW9kZSwgTlVM
TCkpOw0KPiDCoMKgwqDCoMKgwqDCoMKgcHNyX2RwbXMoZGF0YSwgRFJNX01PREVfRFBNU19PRkYp
Ow0KPiDCoMKgwqDCoMKgwqDCoMKgaWd0X3dhaXQoKGN1cl92YWx1ZSA9IHJlYWRfcGtnY19jb3Vu
dGVyKGRhdGEtDQo+ID5kZWJ1Z2ZzX3Jvb3RfZmQpKSA+IHByZXZfdmFsdWUsDQo+IC0tDQo+IDIu
MzQuMQ0KPiANCg0K
