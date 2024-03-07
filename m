Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C54DC54E49
	for <igt-dev@archiver.kernel.org>; Thu,  7 Mar 2024 09:32:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3068B11372C;
	Thu,  7 Mar 2024 09:32:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bbJzGbk+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4093111372C
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Mar 2024 09:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709803923; x=1741339923;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CUGPvpLTiFpVaS+9X3gXUpJ2uIz4aycTZUhH6MW+6KY=;
 b=bbJzGbk+XVVSLOlW2WeV5Z0TnLAmc+intJQbPxyJ+naMlmDDPTrMe9Yp
 48XFjEQNPhwgJwjOJWg/pFIDUyrkTcQz3AqU4z0kz2KrgoezoVf3Q/nYo
 mBlF3lFOk8RHbAkY1gfmxJg2xmZzhyyGx5D97sfFZmVSy5I3RfzY/8eCC
 2pzQ3tjPHMLXO07r8HyYJzjx0iObs1m8Nj2mReGpkvIF8uQnvhCz0ALGc
 g10OkPaxRxVM3XrIRzpVyWd6P7/r8SRRfsBKmaMDIv7A9Q9FEgyJlUH9c
 O5llnJGTnWH11/eGbTKQiSQE1bjyPKa/OBAMUWcTMEy6sspFKoD1ed2l2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="8282343"
X-IronPort-AV: E=Sophos;i="6.06,211,1705392000"; 
   d="scan'208";a="8282343"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 01:32:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,211,1705392000"; 
   d="scan'208";a="9970675"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Mar 2024 01:32:02 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Mar 2024 01:32:01 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Mar 2024 01:32:01 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Mar 2024 01:32:01 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Mar 2024 01:32:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X6i+2qyvvP16jbVc7TGCg7tfUvr9WJEyyXs77ne1RM5C6mxuTUHKumGRWCWtnp3iTNGbMuBsG3fkQfwPQP4LjzD11AFKOUpoi02qNjydgCHM2k/SvqwL1MhebJl6gZyIlPP+da2F19j8DQngsA959UNmhOodqkU60kid50SyId74888Sg78l7h49cJJphazBCj8iUfghHRhTG9oV6gBlNmC26FUMacL4lbVTUrjROoz4ykal3aGvHRIQ1dD04hA8HwnNGAxqQ1y6HWtpsusHkbuTrt0YZbSdjcPX4qmWF4SJ+29aTRxv6pJHrMWO6dQAUVemxqM8iVPNjujg9VO4hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CUGPvpLTiFpVaS+9X3gXUpJ2uIz4aycTZUhH6MW+6KY=;
 b=WNXUELTaaHqxX86TF3cezipIvtiVt8VcnzC2MiKP58aIt2DRdfA4pS0YLPMMkdrONVVZg9ynvF5QVbMgvbva9Vfj26I9ugY99qm26k4qRueFbb4sAsqz5YxBfnqqqVXlRcBnSwFPacayTOhElPshVbXbJ9d29YDtiK+nViwuCHbJrOxlKVIqQscWKQ9p9V7oljUzOeC0t42fk+pRH9xjDLNsrH26nbYKM/aliZmML3CFhugPg6SBIXFx6lyFzsfhgB0ZiFr/bTJE+6TnhrNzSJ3fR+dhQU/ML+L/ry1uzkMLyR4qXO53mSkLMAtUH0NKr5fv7Qyfdx8sRnisK2TDqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6097.namprd11.prod.outlook.com (2603:10b6:208:3d7::17)
 by PH8PR11MB7967.namprd11.prod.outlook.com (2603:10b6:510:25e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.6; Thu, 7 Mar
 2024 09:31:58 +0000
Received: from IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::12a0:a81e:3093:97d0]) by IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::12a0:a81e:3093:97d0%3]) with mapi id 15.20.7362.019; Thu, 7 Mar 2024
 09:31:58 +0000
From: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Stolarek,
 Karolina" <karolina.stolarek@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Subject: RE: [PATCH i-g-t 08/24] tests/intel: Introduce Blitter subcategory
Thread-Topic: [PATCH i-g-t 08/24] tests/intel: Introduce Blitter subcategory
Thread-Index: AQHabiWhdXMvvKFUOUOtQiOuJ3+BO7EnsKyAgARXlUA=
Date: Thu, 7 Mar 2024 09:31:58 +0000
Message-ID: <IA1PR11MB60974CDD365CDA9DE3D55E2186202@IA1PR11MB6097.namprd11.prod.outlook.com>
References: <20240304111617.849785-1-katarzyna.piecielska@intel.com>
 <20240304111617.849785-9-katarzyna.piecielska@intel.com>
 <20240304161317.4acc2076@maurocar-mobl2>
In-Reply-To: <20240304161317.4acc2076@maurocar-mobl2>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6097:EE_|PH8PR11MB7967:EE_
x-ms-office365-filtering-correlation-id: af3f77fc-31a4-48c3-b074-08dc3e896f99
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: D4mrrgEW50+RaA/oOANzn+4VmXDyAIjHA3epa/RYApOap6S9MYx7/opF9RPm6wHTe05mJYVEY4OesPTOpyoiiUtGtEcLC/X0fNikRa6FIEdwoUHZDOn+rnWuwBAH7WKOku2KnVU4nDovfuQmtHuCVPAE+vdr/sm8ajUHmLMHebPZkzLdnhIcTCFZpDB5Nt3qfVUly4UWuISkxVugOEJ7dMBO679ve5G9Hg3pmDFiI2r76c4YrRaZKmQmkTy9Vtke+uVmP4xij5KqKDGr/bIKXBv/3yk3mIlP1bRYA/alyGqHFxoyIfqTpuG02VSOYlSX9NjTPKQ+LxRyul3S3akLGS2JZxUSqWtZxs2/k/dtkCfMcbMBtqTNu1uYlhjeuFyY429oP5hRandOT3UOi2DmLzwPsKrDLoLNQZlgo3dyuCES8KdBbY70ZgHzBP0t6ozsmnvSEm4t+SVwVwdezdmBRpZB41p5gwzNhh0guu80QAIbrQ74ia32dRJ9nWfZHz5hhqNISIiehMRjhgalb+/wnGEMjfqdKeud1aBxVSoPEGBbAUYDzeVxy2M55eDy+4VvF6KqPfm+8gATYXIJ1n9DtLrNmnR2ACIu0evMDsSo8hg0WVO9w8ZxrIOtHu+kCmXgc6XIoPZ2UEjp/Rh6ZWtM8nLyOhWdLwWFuw6bJwTeuGL/4lyzuUcA2JInMRV4LoTuwyhCKZCOAROG1Ht3+7kw8Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6097.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Yzg3ZVdzRFlqUFhjSGI2WjVjLzhwV253YmZuZEFWQlMvTDhMT1RoalRMZU5o?=
 =?utf-8?B?dDhWZi92c2svR2hLMjMvQ1lzNnVaR3lySW9YS0Fsc2E1c2ZObU41Z0xxTXIr?=
 =?utf-8?B?YnB0d214SXBGOGlsY0YvWHhNMkxiWWFXNjY3cUNmSUwrU3cwcGp3TTYxT2d3?=
 =?utf-8?B?d0owWEpWWDRTMUY4WnVnZmljakU3WVo1N2J6R0dPc1VhWW9jb21TYUM0SlpS?=
 =?utf-8?B?MWNNUlMrRW1PS0RURndmRzAwYUUyNHpBODZKa1RZek01ZDB6NmMrZ21adFJm?=
 =?utf-8?B?emtOZDFrY011dU9zQmtxakp1dUtwVDhDS0dhSllyaW5KVXdpN1UyU0tIUWw3?=
 =?utf-8?B?cE9icGMrVmh4QXBtbTRXOVNvQVRaSlQ5cVBmSTF0L1hKVDU4NVdHLzlQKy9x?=
 =?utf-8?B?aFFvNEwvUDdZdU5RSmdaWlRmeDF6RHZiU0l4a01OOEFZalp1Nm9OQWViQWdF?=
 =?utf-8?B?amZzZkRrR1dIN1Y2aXJ0L2JBem12bkRNNlpNZjZ1TkhCRktuT0JNZzRkQm9q?=
 =?utf-8?B?Vi9UVEF1R28yV2Z0ZXgreGh5M3JzSzdHS08zMXU1K3plUkZpOVBSMzZZeWdX?=
 =?utf-8?B?dzlJN1NIcWlNa2JvNmwwZHZsSENFYkYxQkMxT1UyOUdEbUYxSzEwZ2FERHhU?=
 =?utf-8?B?SGxBaTNzQVJsY3poZDRtak1UOVl1UDRmSGlicktnSXkvQS9nWENLSkZTS3Bk?=
 =?utf-8?B?RjdsbFNCYlJCV3pTNWI5dkw3SHdMWU9PVUtsRzhqcERmV3RNeEhwVUhPTWxy?=
 =?utf-8?B?anU4U1JNSFhwR256Uk11b2JhU2djc083Q29JWENZcE1jRHhmc1l0ZTN1YTVs?=
 =?utf-8?B?RHd3dDNyRmRYOWlGNGltZ1pSU2dtODNSQlJBbnhPK1lRY2wvc0pTb0ZHc3dH?=
 =?utf-8?B?NlpoYmlQaklwQkEzSGVLalRna2ljeFprdjhKTnphVFU1ZHVUVHdCS2ZvcWNl?=
 =?utf-8?B?ZTdOVVE0TFJXdnVDbmNSQ25pTi9XRmJqRTdyOXl6dng1VFFWVE5kVHJYVU82?=
 =?utf-8?B?OWVpYjN1bUVQUDZCcm53Mmt4NUM0bDhFRzM5L3p1WURJV3BTdklDMEEram5S?=
 =?utf-8?B?MWZndHhuWnJpd1NqbGZvd08xMGlBZkhENEhQSmlxWVZjSy93Sy9rRmhlWFNL?=
 =?utf-8?B?YllzSDhicGNRcjhwYUF3L0NjT21TdE9iaVpHQWx6U0NXYUlJNDFzdmw4WWQy?=
 =?utf-8?B?UjBScmIyN2lVbGh3bFNjUnNKK212dGFLcXhwR25vVlA0MUg5REdkSVJqYmRJ?=
 =?utf-8?B?QXUwdjk3ZmkxMm9sOVczdDVrMDRDOXIyZVFSQlAxc0U3QVBvSmxhbzZoRnlK?=
 =?utf-8?B?U2lTaFYxQzBYT3gwenJtd2t6anlNT293VlBEVlU4TW4xWGo3MW1PU1AwMDhv?=
 =?utf-8?B?Z0xxQjJCbEVrUmN3dVRNK2k2OGwwaUpYK3lUM1lwMkNlVUcvRlNXa2cxYkg0?=
 =?utf-8?B?UlJ3MWs3TjhoQ0JhS0NhOW1qRU12YXg5dEM4UTdEWk9SZHBTRGNEQU9CU05h?=
 =?utf-8?B?WGNvM0x1c3VKNkczSTkrSmllMHdHR1BRN0Q2Q2daeFgwbzcwUW0rN2tZWXVD?=
 =?utf-8?B?QTVZaGN5Sk1kYW1mTDZza2IyOFoyd2lXbnkwWTNucGtkSFpxTzZlWTcvTjZG?=
 =?utf-8?B?aVcwS3F1ajdzU2RUbUl6cHBWMW1PSFZDclRCV1NnZ3RJNmNneDhUQXpXaThp?=
 =?utf-8?B?MVNLc000Ulg0VDl0NDNkam5UOFpNSzNyc0dRV1R0S0ZZZ29ER2RHR3pRSXRD?=
 =?utf-8?B?MGNQZjRYUnNYbXgwL0toZEFLVlZMajJMR2NLK2Yzd1VOV2JxL3dPV0VvWVB1?=
 =?utf-8?B?NlJYazN4QmE1SVQ5UFFwN1JpMGVKWko1dWU1eXlxS1VHUEJaQ3pRVWRrSzlj?=
 =?utf-8?B?ZmV4UWVLWEZaUWFibVlORCs2MUVNWEhYT0kvbENsZmdEREV0cE1hakhJRkdl?=
 =?utf-8?B?VldIMWJSbTBJN3JpbzRNZHM5SE1yR0g5R3ltSGQ5TTlFUzJjVVc2OUg1RVl6?=
 =?utf-8?B?YVpWNzVnbk5hRmNqY1NSTkgzQzZLZEh6bDY5akpBREl2R3VTd04xa3kwb09T?=
 =?utf-8?B?cUljK1Y0TlNGeWRkS0crbGljU1FPaUJIZWQ0YmZVWUd5T2h3Q1UyVllXVGYw?=
 =?utf-8?B?Vzd2QTdhZ0hOR0xyT1BHbUtHRDRYVkFVdyt6UUlQaTZpcFh3MUR1T2VLbCs5?=
 =?utf-8?B?aWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6097.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af3f77fc-31a4-48c3-b074-08dc3e896f99
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2024 09:31:58.3084 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MWgyKsR2PKirsgUi0pPE7RT+7nX4qq5P8gJS6D1QKtarI2I6yVuadXtUjIm88IgVpYueodPJulVC0BH8WPfn7benVl3Bzvxf3IsJ0VmeJHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7967
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

U3VyZSwgSSB3aWxsIGZpeCB0aGF0Lg0KS2FzaWENCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCkZyb206IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8bWF1cm8uY2hlaGFiQGxpbnV4LmludGVs
LmNvbT4gDQpTZW50OiBNb25kYXksIE1hcmNoIDQsIDIwMjQgNDoxMyBQTQ0KVG86IFBpZWNpZWxz
a2EsIEthdGFyenluYSA8a2F0YXJ6eW5hLnBpZWNpZWxza2FAaW50ZWwuY29tPg0KQ2M6IGlndC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBLZW1wY3p5bnNraSwgWmJpZ25pZXcgPHpiaWduaWV3
LmtlbXBjenluc2tpQGludGVsLmNvbT47IFN0b2xhcmVrLCBLYXJvbGluYSA8a2Fyb2xpbmEuc3Rv
bGFyZWtAaW50ZWwuY29tPjsgS2FtaWwgS29uaWVjem55IDxrYW1pbC5rb25pZWN6bnlAbGludXgu
aW50ZWwuY29tPg0KU3ViamVjdDogUmU6IFtQQVRDSCBpLWctdCAwOC8yNF0gdGVzdHMvaW50ZWw6
IEludHJvZHVjZSBCbGl0dGVyIHN1YmNhdGVnb3J5DQoNCk9uIE1vbiwgIDQgTWFyIDIwMjQgMTE6
MTY6MDEgKzAwMDANCkthdGFyenluYSBQaWVjaWVsc2thIDxrYXRhcnp5bmEucGllY2llbHNrYUBp
bnRlbC5jb20+IHdyb3RlOg0KDQo+IExldCdzIGludHJvZHVjZSBCbGl0dGVyIHN1YmNhdGVnb3J5
Lg0KDQpTYW1lIGhlcmU6IGJsaXR0ZXIgaXMgdXNlZCBvbiB0d28gZGlmZmVyZW50IGhpZXJhcmNo
aWNhbCBsZXZlbHMuDQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEthdGFyenluYSBQaWVjaWVsc2th
IDxrYXRhcnp5bmEucGllY2llbHNrYUBpbnRlbC5jb20+DQo+IENjOiBaYmlnbmlldyBLZW1wY3p5
xYRza2kgPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVsLmNvbT4NCj4gQ2M6IEthcm9saW5hIFN0
b2xhcmVrIDxrYXJvbGluYS5zdG9sYXJla0BpbnRlbC5jb20+DQo+IENjOiBLYW1pbCBLb25pZWN6
bnkgPGthbWlsLmtvbmllY3pueUBsaW51eC5pbnRlbC5jb20+DQo+IENjOiBNYXVybyBDYXJ2YWxo
byBDaGVoYWIgPG1hdXJvLmNoZWhhYkBsaW51eC5pbnRlbC5jb20+DQo+IC0tLQ0KPiAgdGVzdHMv
aW50ZWwvZ2VtX2V4ZXJjaXNlX2JsdC5jICAgICAgfCAxNCArKysrKysrLS0tLS0tLQ0KPiAgdGVz
dHMvaW50ZWwvZ2VtX3NldF90aWxpbmdfdnNfYmx0LmMgfCAgMyArKysNCj4gIHRlc3RzL2ludGVs
L2dlbjlfZXhlY19wYXJzZS5jICAgICAgIHwgIDMgKysrDQo+ICAzIGZpbGVzIGNoYW5nZWQsIDEz
IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMv
aW50ZWwvZ2VtX2V4ZXJjaXNlX2JsdC5jIA0KPiBiL3Rlc3RzL2ludGVsL2dlbV9leGVyY2lzZV9i
bHQuYyBpbmRleCA0YTliYzM3MjkuLmY4ZmM2ODlmZiAxMDA2NDQNCj4gLS0tIGEvdGVzdHMvaW50
ZWwvZ2VtX2V4ZXJjaXNlX2JsdC5jDQo+ICsrKyBiL3Rlc3RzL2ludGVsL2dlbV9leGVyY2lzZV9i
bHQuYw0KPiBAQCAtMTQsMTggKzE0LDE4IEBADQo+ICAgKiBURVNUOiBnZW0gZXhlcmNpc2UgYmx0
DQo+ICAgKiBEZXNjcmlwdGlvbjogRXhlcmNpc2UgYmxpdHRlciBjb21tYW5kcw0KPiAgICogRmVh
dHVyZTogYmxpdHRlcg0KPiAtICogUnVuIHR5cGU6IEZVTEwNCj4gKyAqIFN1Yi1jYXRlZ29yeTog
QmxpdHRlcg0KPiArICogQ2F0ZWdvcnk6IERlc2t0b3AgY2xpZW50DQo+ICsgKiBGdW5jdGlvbmFs
aXR5OiBibGl0dGVyDQo+ICAgKiBUZXN0IGNhdGVnb3J5OiBHRU1fTGVnYWN5DQo+ICsgKiBSdW4g
dHlwZTogRlVMTA0KPiAgICoNCj4gICAqIFNVQlRFU1Q6IGZhc3QtY29weQ0KPiAtICogRGVzY3Jp
cHRpb246DQo+IC0gKiAgIENoZWNrIGZhc3QtY29weSBibGl0DQo+IC0gKiAgIGJsaXR0ZXINCj4g
KyAqIERlc2NyaXB0aW9uOiBDaGVjayBmYXN0LWNvcHkgYmxpdCBibGl0dGVyDQo+ICAgKg0KPiAg
ICogU1VCVEVTVDogZmFzdC1jb3B5LWVtaXQNCj4gLSAqIERlc2NyaXB0aW9uOg0KPiAtICogICBD
aGVjayBtdWx0aXBsZSBmYXN0LWNvcHkgaW4gb25lIGJhdGNoDQo+IC0gKiAgIGJsaXR0ZXINCj4g
KyAqIERlc2NyaXB0aW9uOiBDaGVjayBtdWx0aXBsZSBmYXN0LWNvcHkgaW4gb25lIGJhdGNoIGJs
aXR0ZXINCj4gKyAqDQo+ICAgKi8NCj4gIA0KPiAgSUdUX1RFU1RfREVTQ1JJUFRJT04oIkV4ZXJj
aXNlIGJsaXR0ZXIgY29tbWFuZHMiKTsgZGlmZiAtLWdpdCANCj4gYS90ZXN0cy9pbnRlbC9nZW1f
c2V0X3RpbGluZ192c19ibHQuYyANCj4gYi90ZXN0cy9pbnRlbC9nZW1fc2V0X3RpbGluZ192c19i
bHQuYw0KPiBpbmRleCA5MDc3ZTBmM2YuLjI4NDY5ZjVmMyAxMDA2NDQNCj4gLS0tIGEvdGVzdHMv
aW50ZWwvZ2VtX3NldF90aWxpbmdfdnNfYmx0LmMNCj4gKysrIGIvdGVzdHMvaW50ZWwvZ2VtX3Nl
dF90aWxpbmdfdnNfYmx0LmMNCj4gQEAgLTYxLDYgKzYxLDkgQEANCj4gICAqIFRFU1Q6IGdlbSBz
ZXQgdGlsaW5nIHZzIGJsdA0KPiAgICogRGVzY3JpcHRpb246IENoZWNrIGZvciBwcm9wZXIgc3lu
Y2hyb25pemF0aW9uIG9mIHRpbGluZyBjaGFuZ2VzIHZzLiB0aWxlZCBncHUgYWNjZXNzLg0KPiAg
ICogRmVhdHVyZTogYmxpdHRlciwgZ3R0DQo+ICsgKiBGdW5jdGlvbmFsaXR5OiB0aWxpbmcNCj4g
KyAqIFN1Yi1jYXRlZ29yeTogQmxpdHRlcg0KPiArICogQ2F0ZWdvcnk6IERlc2t0b3AgY2xpZW50
DQo+ICAgKiBSdW4gdHlwZTogRlVMTA0KPiAgICoNCj4gICAqIFNVQlRFU1Q6IHRpbGVkLXRvLXRp
bGVkDQo+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC9nZW45X2V4ZWNfcGFyc2UuYyANCj4gYi90
ZXN0cy9pbnRlbC9nZW45X2V4ZWNfcGFyc2UuYyBpbmRleCAzM2ZmNmJjYjUuLjUwOWEyZTgwZiAx
MDA2NDQNCj4gLS0tIGEvdGVzdHMvaW50ZWwvZ2VuOV9leGVjX3BhcnNlLmMNCj4gKysrIGIvdGVz
dHMvaW50ZWwvZ2VuOV9leGVjX3BhcnNlLmMNCj4gQEAgLTM2LDYgKzM2LDkgQEANCj4gIC8qKg0K
PiAgICogVEVTVDogZ2VuOSBleGVjIHBhcnNlDQo+ICAgKiBGZWF0dXJlOiBibGl0dGVyLCBjb21t
YW5kX3BhcnNlcg0KPiArICogU3ViLWNhdGVnb3J5OiBCbGl0dGVyDQo+ICsgKiBGdW5jdGlvbmFs
aXR5OiBjb21tYW5kX3BhcnNlcg0KPiArICogQ2F0ZWdvcnk6IERlc2t0b3AgY2xpZW50DQo+ICAg
KiBSdW4gdHlwZTogRlVMTA0KPiAgICoNCj4gICAqIFNVQlRFU1Q6IGFsbG93ZWQtYWxsDQo=
