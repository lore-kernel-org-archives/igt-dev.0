Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD79CC54E41
	for <igt-dev@archiver.kernel.org>; Wed,  6 Mar 2024 09:59:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FF2510EC2F;
	Wed,  6 Mar 2024 09:59:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H2EuHSZ7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E3C510EC2F
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Mar 2024 09:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709719154; x=1741255154;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ltOGA74LylFkvuriQlXCYqJt2F17O3ToSrfcapDER0M=;
 b=H2EuHSZ74IHBWO2f8xVLfVrcefHjIypK0KAfXFCTnNsQiDH0d/RUl5+2
 1VeQ4ECJ1F8oaLaHrpGGwHaNGlq0dWsrVodCWc0PHwQk28rLNC1+EWK5H
 DE+Is40UBxvXebxXvMg6QAQg1/plX5IK2obz0/1SGgsxKkI3naTOR+VcE
 huyt+sZrc0FNQzEY08EKPYcbBbQPCCLFhV/zy9+mkb44lNNIml11fTji7
 r3bnc1MWe+Uh9b/nClz9fwpmyvogOZOsUGkN1A5FFk6oVRbMKYx0sr+C+
 t2ZL/1j0RuXxDv5boHg0+kZ30a2inuTGBhRks2DJjbcSy3B1IOwRvRadT w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="15038914"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; d="scan'208";a="15038914"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 01:59:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; d="scan'208";a="14269259"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Mar 2024 01:59:14 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 01:59:13 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Mar 2024 01:59:13 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Mar 2024 01:58:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cr8M8L4w1emsQKFeJAJfB8ygWsY/KQ0fXbqBHpZUMY4pdRsxGm8cdpWypm8OY5S9WmGYjHtlI/4C3AjH1JatFQGjC0SX/ukUhYv7odGBECFuETECTPnXcSZ6fXlWyFQv1EAtgQ7nTKavgLwr5TqMIoSOvW7uxjBMLBK80asCCbSmVrTvClMYewXT+pbtOSmPcqjKkIkxIoVprrNc0/wnYEoIW5zh66t+K6xFj5bTb35KSet5jToAGQ68AleHf5PrqxVMdh9yrJ2NAwnftnBxhQ8L4X4v3W98RiRY+csuTr77t7Zs4gEYQjZlKFqW/cBrsllhc5mOFCQ4BtFfPSGweA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ltOGA74LylFkvuriQlXCYqJt2F17O3ToSrfcapDER0M=;
 b=JgP5gRriQpCwkdXqmxnAF0VNs3IVfgSUL4eemHF89+jxpsYryAxNt02PjEHblLy/ryvJs8zGjbweBYhzrUOunJNhMduZGQrYcyaz7AX9K35EgISHs32gYcfoYMBHBXri6A4QAHl1nNA0qbUDqGfpm/f6PdE5n+k2orMAsaaC4gYWLBUO4De9FosyxAmwEplIdn37e5mp0PJ9j9R056tQKbYsuIJoP6Q/k4QQPUrX1wXeHkversCj+BNT4eUWGM5hvuqXPBDEcK+jnkIlRmroo13b9m1sq6BwfFM+Zb4D/Up/TI5p9vKjK6P8/OKrRIjGYD4Fy4L5tzLugqiAQw7OvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6097.namprd11.prod.outlook.com (2603:10b6:208:3d7::17)
 by DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.23; Wed, 6 Mar
 2024 09:58:29 +0000
Received: from IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::12a0:a81e:3093:97d0]) by IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::12a0:a81e:3093:97d0%3]) with mapi id 15.20.7362.019; Wed, 6 Mar 2024
 09:58:29 +0000
From: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Chris
 Wilson" <chris@chris-wilson.co.uk>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, "Dandamudi, Priyanka"
 <priyanka.dandamudi@intel.com>, "Kempczynski, Zbigniew"
 <zbigniew.kempczynski@intel.com>
Subject: RE: [PATCH i-g-t 03/24] tests/intel: Introduce Fences subcategory
Thread-Topic: [PATCH i-g-t 03/24] tests/intel: Introduce Fences subcategory
Thread-Index: AQHabiWBtNDrVMZmQEaowlLusdSoVLEnrdAAgALPJTA=
Date: Wed, 6 Mar 2024 09:58:29 +0000
Message-ID: <IA1PR11MB609780F83E60EF7EEBC4508F86212@IA1PR11MB6097.namprd11.prod.outlook.com>
References: <20240304111617.849785-1-katarzyna.piecielska@intel.com>
 <20240304111617.849785-4-katarzyna.piecielska@intel.com>
 <20240304160302.6d14b78a@maurocar-mobl2>
In-Reply-To: <20240304160302.6d14b78a@maurocar-mobl2>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6097:EE_|DS0PR11MB7312:EE_
x-ms-office365-filtering-correlation-id: e288aa94-6393-444a-6dff-08dc3dc3f9ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 80d9JfZW35Zhb3KlgrfFLj+FfVn7+LSKNlceZPebisQONjxuH5+niHZP+bT2Vto16+7iOaBuoNWBHy1W79Y0gk7I/rGJlaAA7A8ITTDREd01r17Ml2vwgE9bm5LWbpY+IY6XViPO9MEPNcfYwRjy2OXQiHuDLfTLVDT/wXMuFUeFyvs54EP9oYKEAwMzKm+kxz8nPfJvxAcvEWUUnEybXJiFC0hgizhfFqxrSZLb8Lc3LWCpWQrBc9JJEz3SDzZ+XR8dZ0yoOGuZl+njd4+zj4vv6FPf/c+Gg5IeFVNPEQ0jLo95t+D/yStyJFVcAHBxRHeKarsPNX60AiMqfd80c7Jf9uooTBIJQc0wxuKDuku/P+cvRyWfKiaVgvFX/n2TDNoT4iVgJjWh0P2WklD1217QQhOm6EXBUvJ0DwxWzAUz+9mfCrRu0pskv+WW8nCNUS/NZ66Ccd0rnYqPJ3i3LQNJP6kjjv5XT2ZAEYQhRKnujkZWVrANM+c73eIDDLSgeou291rkhTDAXG8zs8ZGWzJhfiXw6jvgrS+MIIky+rSW8mMoL1nd2mMLDqlWqB83R8UGwY9ddr0moNc2wp+JiMNk8zqa0LDwkAWpe/9Bx4uAXHjInBCjoFLkIN3rKFm3Fisz4kxs5e3tY8LZGfrLsxCq9OuMepdNUL+3bNSPmNK5R2BUJy091flk2eRAWIoVe5b9tuGuMMoXcu9B/8VFkHjxX7JlDEyf/yXZWXGGm40=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6097.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RDRtQjEyMmt6R0FwYkRDQVgyU2ExMVdlT1pXR09FUGNIK3poaFY0ZTR0ZmZ3?=
 =?utf-8?B?WDBRbi9RVEpvdEdyNkZ1c1RNQVhRTTBFaCt4NE9FaVZUamZtdG9OVzJLM0g3?=
 =?utf-8?B?MmltZ2dtTFk2VzNDaVZ6TTQxc05LdnE4VUlGcVVjd3JtMTE5T2phWEZHRk9z?=
 =?utf-8?B?YllLWWQxbFJORTJibGZlWDMzRTFlYmIzQkVxY29zT3FWTkdWOE80WTZPTVNR?=
 =?utf-8?B?OG1vaERyUUE1c2tjamVoTlR5ODFaMHl4Rkt0a0R5aHdjNUgrYzMvNWtHSXZu?=
 =?utf-8?B?Rzh4ZmlPZnBIRjVMRTNqZUl3aXYzK0wzMG85UXEyUnRJVC81VGFoci82WmJX?=
 =?utf-8?B?S0NkeCtqaDhHT0NzT1VGMi9TTnM4b1RwTUxHK2dsRkNQVVZjc0gxQWh4bUlW?=
 =?utf-8?B?bGM4VmpwY0R4S2RVdkRXblFVTENqMlFuSTlDU0twcDkramtId2pUbktOYjBj?=
 =?utf-8?B?L0tjUDkwT3BpTDZVNENBbEFiVGFKQU9xeGVzbDNNTDBtdjFvTVI4U045bXdm?=
 =?utf-8?B?ZkxlSGVidDIxdFdiRWtISjNNeGlpbHc0MmdWck1odDZUNWQrNDliSGhMU3Nv?=
 =?utf-8?B?U3c3THRVUlFSWERGVVBDWWRHUTFlMXFXVk5GaVc2ekhTL0lpU3RJTGdCM3ZY?=
 =?utf-8?B?OFR5Q2IrSFdxclZNNjZWcGs4WWtwN1hoS2lLTEdEd29PeWJZa1NCS2hEcDI2?=
 =?utf-8?B?WC9HTEpEbFFwci9xSXlLcmZDTmpybHUzdUVxQzVlVzQ2SDhNUkdteGsrTkpl?=
 =?utf-8?B?VDZneWZ1WGdWd1NLeTZWVlpMRHhUZjBDTFJRUDNtRWNQUDNzcUM2anJRdXpP?=
 =?utf-8?B?QS9IUEJDNUpmYWlocm95U3pPZ1UvWkE5ay91amU3SUFlaFBFQVlLUlo0M3hV?=
 =?utf-8?B?b3cwdjYvdngva2t1aFc0bUh5bDFhakZvb2dzRjNMTHQ1a3VVUmhYNVVIcFNR?=
 =?utf-8?B?YXRmaERRVytUV3RzMVFPRDZSQkpkc09vc0lHV0ZzV2VUWHBsM0dpMGRHMTdQ?=
 =?utf-8?B?a01NTmRlcjJFYmhmdDBpVWg5eXYzS1VReWF4N0p1ZGNpdWhTZGJaTis3RFhR?=
 =?utf-8?B?L3ltaElWeTZjM0ZQZjdqOU5jV2hqWFdacjYwRmx1NGRKMUlxenZJbjgvYndW?=
 =?utf-8?B?SGE3R1lMdTN0cXAxWXl5UFhDUGZFcDMxRCswcEhrNytYY1hKNzRFQXNVRHlw?=
 =?utf-8?B?RzlXczdQK3dhVU5Qckxjdm9hOTdBd0UrNWNUS28wNGpZN01MaUN6ZU54WklR?=
 =?utf-8?B?TnhFVUMvL2xmSXlrTlNzd0tIZmlBNm96VU1CcTFYOWZaS0VhTGpoLy9TZnJP?=
 =?utf-8?B?aVRvRFpvVmRtT3VwZTVMTTY0NzJlVEJuYjdLa3ZKbnlBY1Rnb29FbVFOdGta?=
 =?utf-8?B?RUdNL3JsbE9NL1JGWDF1THlnZEFFU3QxZWc2ZWlVeDBSS04zY1k4UFA0RlNP?=
 =?utf-8?B?MktsbmlqcXlBZ0prUE5CYkZxaW8xK1hiUCs1RHJkOWxIMmdQbGg4aFdrY2Jk?=
 =?utf-8?B?Vk5wRUtUYVA2WUlxVXppaGNVTldlTnpDN1ZhUHo1alJ4T0NTN2ZhR2JQQmZB?=
 =?utf-8?B?NCtROFY4TXR4azJyajBSQkhocFp1WkkxYTloQWVIcUc2cHcvQ1VEY3hNdDJR?=
 =?utf-8?B?YXhaYVB2TXhERTd0Uk9XY0xGN1VOa0tEV2xOdk9qeTlDUlloMm1TYnpiREw0?=
 =?utf-8?B?RXhWSFlCR2pXZnQzb1VxZjY3Y0NPNWd5NEwybFFYRVJuT01hb0p2TGNhbFZI?=
 =?utf-8?B?MUpyMmN6RnBVNjhZZlMwWmFVcGxKVmU3ZmFSTUp3dUZpQWN6NnJPSWRFeWlG?=
 =?utf-8?B?N1NPVWd0akl3Zk5DQVJpb0g1YXpKcU9NZUM4eHpqREdHTWhOL2FPS3plT1M1?=
 =?utf-8?B?T2FDbUJRZUc0SFpNbUFnL29YNUJ2NTZMdXd3SDlOdDhuN053STFGdUxPWUp3?=
 =?utf-8?B?RSsvRkk1ZkV0Tk5vVk5pNU5BdjZVSldwNnI2QzMrM29xSUJBMXNuQ0piUXRt?=
 =?utf-8?B?TXo5TWlSc2I3cWJlWnNQZlN6aWNGdjh3TFhtTXYyYThzZWRCbHU1NytSNCt1?=
 =?utf-8?B?SGMvdmFxdlZtMktnMk82V3Q0QUlLbDZjWFkxQWVMSWdjQld3ZnFiQitsK3FQ?=
 =?utf-8?B?RTViZ3NDYmJZTEtabnZXWTIxU3hoSE5WNkZ6L0xYUTZQYUp2QXRuM2hUeHda?=
 =?utf-8?B?WXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6097.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e288aa94-6393-444a-6dff-08dc3dc3f9ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2024 09:58:29.6393 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M5YAqUXn8g5Rk0OvlgxeGPHTq2F+nPulxQG4GALQKPi3ZVmbsAK6jTuXAfBU1Iue89etXRY3DNJAYYHVGP59nq/obLwCM0SK+f0nCCL1M0U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7312
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

PiBMZXQncyBpbnRyb2R1Y2UgJ0ZlbmNlcycgc3ViY2F0ZWdvcnkgdG8gYWxsb3cgYmV0dGVyIGFs
aWdubWVudCBiZXR3ZWVuIA0KPiBpOTE1IGFuZCBYRS4NCj4gDQoNCllvdSBhZGRlZCBhbHJlYWR5
IGEgYnVja2V0IGF0IEZ1bmN0aW9uYWxpdHkgbGV2ZWwgYWxzbyBjYWxsZWQgImZlbmNlcyIuDQoN
CldoaWxlIHRoaXMgd29ya3MgZmluZSBmb3IgaWd0X2RvYyB0b29scywgaXQgaXMgY29uZnVzaW5n
IGZvciBwZW9wbGUgdG8gaGF2ZSB0aGUgc2FtZSBuYW1lIG1lYW5pbmcgZGlmZmVyZW50IHRoaW5n
cy4gQWxzbywgc29tZSBJbnRlbCBDSSB0b29scyBkb24ndCBhbGxvdyB0d28gYnVja2V0cyB3aXRo
IHRoZSBzYW1lIG5hbWUuIFNvLCBwbGVhc2UgZWl0aGVyIGNoYW5nZSB0aGUgdGVybSBvbiBwYXRj
aCAyIG9yIGhlcmUuDQoNClJlZ2FyZHMsDQpNYXVybw0KDQpbS2F0YXJ6eW5hXSBZb3UncmUgcmln
aHQg8J+YiiBJIHdpbGwga2VlcCAnZmVuY2VzJyBhcyBmdW5jdGlvbmFsaXR5IGFuZCBmaW5kIG90
aGVyIHN1YmNhdGVnb3JpZXMgZm9yIHRob3NlIHRlc3RzLg0KQlRXIHRoZXJlIGlzIG9uZSB0ZXN0
cyB0aGF0IHdhcyBhZGRlZCB0byB0aGlzIGNvbW1pdCBieSBtaXN0YWtlIC0gdGVzdHMvaW50ZWwv
Z2VtX3ZtX2NyZWF0ZS5jIC0gYmVsb25ncyB0byBjb250ZXh0cw0KDQpLYXNpYQ0KPiBTaWduZWQt
b2ZmLWJ5OiBLYXRhcnp5bmEgUGllY2llbHNrYSA8a2F0YXJ6eW5hLnBpZWNpZWxza2FAaW50ZWwu
Y29tPg0KPiBDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+DQo+IENj
OiBLYW1pbCBLb25pZWN6bnkgPGthbWlsLmtvbmllY3pueUBsaW51eC5pbnRlbC5jb20+DQo+IENj
OiBQcml5YW5rYSBEYW5kYW11ZGkgPHByaXlhbmthLmRhbmRhbXVkaUBpbnRlbC5jb20+DQo+IENj
OiBNYXVybyBDYXJ2YWxobyBDaGVoYWIgPG1hdXJvLmNoZWhhYkBsaW51eC5pbnRlbC5jb20+DQo+
IENjOiBaYmlnbmlldyBLZW1wY3p5xYRza2kgPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVsLmNv
bT4NCj4gLS0tDQo+ICB0ZXN0cy9pbnRlbC9nZW1fZmVuY2VfdGhyYXNoLmMgICAgICAgfCAgMyAr
KysNCj4gIHRlc3RzL2ludGVsL2dlbV9mZW5jZV91cGxvYWQuYyAgICAgICB8ICAzICsrKw0KPiAg
dGVzdHMvaW50ZWwvZ2VtX2ZlbmNlZF9leGVjX3RocmFzaC5jIHwgIDMgKysrDQo+ICB0ZXN0cy9p
bnRlbC9nZW1fdm1fY3JlYXRlLmMgICAgICAgICAgfCAxMCArKysrLS0tLS0tDQo+ICB0ZXN0cy9p
bnRlbC9wcmltZV9idXN5LmMgICAgICAgICAgICAgfCAgMiArLQ0KPiAgNSBmaWxlcyBjaGFuZ2Vk
LCAxNCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rl
c3RzL2ludGVsL2dlbV9mZW5jZV90aHJhc2guYyANCj4gYi90ZXN0cy9pbnRlbC9nZW1fZmVuY2Vf
dGhyYXNoLmMgaW5kZXggNGNiM2Q4NDJiLi4wYzliZTkyZGYgMTAwNjQ0DQo+IC0tLSBhL3Rlc3Rz
L2ludGVsL2dlbV9mZW5jZV90aHJhc2guYw0KPiArKysgYi90ZXN0cy9pbnRlbC9nZW1fZmVuY2Vf
dGhyYXNoLmMNCj4gQEAgLTQ2LDYgKzQ2LDkgQEANCj4gIC8qKg0KPiAgICogVEVTVDogZ2VtIGZl
bmNlIHRocmFzaA0KPiAgICogRmVhdHVyZTogZ3R0LCBzeW5jaHJvbml6YXRpb24NCj4gKyAqIFN1
Yi1jYXRlZ29yeTogRmVuY2VzDQo+ICsgKiBDYXRlZ29yeTogRGVza3RvcCBjbGllbnQNCj4gKyAq
IEZ1bmN0aW9uYWxpdHk6IHN5bmNocm9uaXphdGlvbg0KPiAgICogUnVuIHR5cGU6IEZVTEwNCj4g
ICAqDQo+ICAgKiBTVUJURVNUOiBiby1jb3B5DQo+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC9n
ZW1fZmVuY2VfdXBsb2FkLmMgDQo+IGIvdGVzdHMvaW50ZWwvZ2VtX2ZlbmNlX3VwbG9hZC5jIGlu
ZGV4IGIyMzljMGU3OC4uMDc0OTA4ZDgxIDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9pbnRlbC9nZW1f
ZmVuY2VfdXBsb2FkLmMNCj4gKysrIGIvdGVzdHMvaW50ZWwvZ2VtX2ZlbmNlX3VwbG9hZC5jDQo+
IEBAIC00Myw2ICs0Myw5IEBADQo+ICAjaW5jbHVkZSAiaTkxNS9nZW1fY3JlYXRlLmgiDQo+ICAv
KioNCj4gICAqIFRFU1Q6IGdlbSBmZW5jZSB1cGxvYWQNCj4gKyAqIFN1Yi1jYXRlZ29yeTogRmVu
Y2VzDQo+ICsgKiBDYXRlZ29yeTogRGVza3RvcCBjbGllbnQNCj4gKyAqIEZ1bmN0aW9uYWxpdHk6
IHN5bmNocm9uaXphdGlvbg0KPiAgICogUnVuIHR5cGU6IEZVTEwNCj4gICAqDQo+ICAgKiBTVUJU
RVNUOiBwZXJmb3JtYW5jZQ0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwvZ2VtX2ZlbmNlZF9l
eGVjX3RocmFzaC5jIA0KPiBiL3Rlc3RzL2ludGVsL2dlbV9mZW5jZWRfZXhlY190aHJhc2guYw0K
PiBpbmRleCAwOThmMjJlZjQuLmIyNmViNzc4MCAxMDA2NDQNCj4gLS0tIGEvdGVzdHMvaW50ZWwv
Z2VtX2ZlbmNlZF9leGVjX3RocmFzaC5jDQo+ICsrKyBiL3Rlc3RzL2ludGVsL2dlbV9mZW5jZWRf
ZXhlY190aHJhc2guYw0KPiBAQCAtMzcsNiArMzcsOSBAQA0KPiAgICogVEVTVDogZ2VtIGZlbmNl
ZCBleGVjIHRocmFzaA0KPiAgICogRGVzY3JpcHRpb246IFRlc3QgZXhlY2J1ZiBmZW5jZSBhY2Nv
dW50aW5nLg0KPiAgICogRmVhdHVyZTogZ3R0LCBzeW5jaHJvbml6YXRpb24NCj4gKyAqIFN1Yi1j
YXRlZ29yeTogRmVuY2VzDQo+ICsgKiBDYXRlZ29yeTogRGVza3RvcCBjbGllbnQNCj4gKyAqIEZ1
bmN0aW9uYWxpdHk6IHN5bmNocm9uaXphdGlvbg0KPiAgICogUnVuIHR5cGU6IEZVTEwNCj4gICAq
DQo+ICAgKiBTVUJURVNUOiAyLXNwYXJlLWZlbmNlcw0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50
ZWwvZ2VtX3ZtX2NyZWF0ZS5jIGIvdGVzdHMvaW50ZWwvZ2VtX3ZtX2NyZWF0ZS5jIA0KPiBpbmRl
eCA4ODM0Yzk4N2YuLmQzZDAzZWI3MyAxMDA2NDQNCj4gLS0tIGEvdGVzdHMvaW50ZWwvZ2VtX3Zt
X2NyZWF0ZS5jDQo+ICsrKyBiL3Rlc3RzL2ludGVsL2dlbV92bV9jcmVhdGUuYw0KPiBAQCAtMzAs
MjIgKzMwLDIwIEBADQo+ICAvKioNCj4gICAqIFRFU1Q6IGdlbSB2bSBjcmVhdGUNCj4gICAqIENh
dGVnb3J5OiBTZXJ2ZXINCj4gLSAqIEZ1bmN0aW9uYWxpdHk6IGNvbnRleHQgbWFuYWdlbWVudA0K
PiAtICogUnVuIHR5cGU6IEZVTEwNCj4gLSAqIFN1Yi1jYXRlZ29yeTogQ29tcHV0ZQ0KPiArICog
RnVuY3Rpb25hbGl0eTogY29tcHV0ZQ0KPiArICogU3ViLWNhdGVnb3J5OiBDb250ZXh0DQo+ICsg
KiBGZWF0dXJlOiBtYXBwaW5nDQo+ICAgKiBUZXN0IGNhdGVnb3J5OiBHRU1fTGVnYWN5DQo+ICsg
KiBSdW4gdHlwZTogRlVMTA0KPiAgICoNCj4gICAqIFNVQlRFU1Q6IGNyZWF0ZS1leHQNCj4gLSAq
IEZlYXR1cmU6IG1hcHBpbmcNCj4gICAqDQo+ICAgKiBTVUJURVNUOiBleGVjYnVmDQo+ICAgKiBG
ZWF0dXJlOiBjbWRfc3VibWlzc2lvbiwgbWFwcGluZw0KPiAgICoNCj4gICAqIFNVQlRFU1Q6IGlu
dmFsaWQtY3JlYXRlDQo+IC0gKiBGZWF0dXJlOiBtYXBwaW5nDQo+ICAgKg0KPiAgICogU1VCVEVT
VDogaW52YWxpZC1kZXN0cm95DQo+IC0gKiBGZWF0dXJlOiBtYXBwaW5nDQo+ICAgKg0KPiAgICog
U1VCVEVTVDogaXNvbGF0aW9uDQo+ICAgKiBGZWF0dXJlOiBjb250ZXh0LCBtYXBwaW5nDQo+IGRp
ZmYgLS1naXQgYS90ZXN0cy9pbnRlbC9wcmltZV9idXN5LmMgYi90ZXN0cy9pbnRlbC9wcmltZV9i
dXN5LmMgaW5kZXggDQo+IDkwZDc5ODY0Zi4uYTRlZGIwZTBhIDEwMDY0NA0KPiAtLS0gYS90ZXN0
cy9pbnRlbC9wcmltZV9idXN5LmMNCj4gKysrIGIvdGVzdHMvaW50ZWwvcHJpbWVfYnVzeS5jDQo+
IEBAIC0zMyw3ICszMyw3IEBADQo+ICAgKiBGZWF0dXJlOiBwcmltZQ0KPiAgICogRnVuY3Rpb25h
bGl0eTogYnVmZmVyIG1hbmFnZW1lbnQNCj4gICAqIFJ1biB0eXBlOiBGVUxMDQo+IC0gKiBTdWIt
Y2F0ZWdvcnk6IERSTQ0KPiArICogU3ViLWNhdGVnb3J5OiBGZW5jZXMNCj4gICAqIFRlc3QgY2F0
ZWdvcnk6IEdFTV9MZWdhY3kNCj4gICAqDQo+ICAgKiBTVUJURVNUOiBhZnRlcg0K
