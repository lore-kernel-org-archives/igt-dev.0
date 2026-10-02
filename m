Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622A5CA5FD4
	for <igt-dev@archiver.kernel.org>; Fri,  2 Oct 2026 14:23:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EED4410F89E;
	Fri,  2 Oct 2026 14:23:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GHNHSO0h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FDF410E5DF
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Oct 2026 14:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790950984; x=1822486984;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=phEXIj9KIloc9ezn961WDXTaOkw5UIsgn0bsaUKPlds=;
 b=GHNHSO0hoElSisNqwR1tG5D74eRRkSauObhGjamct83tjlyyIc5r1v+j
 nvvetcRnRi5WPyOLlrO2bFMuyHwCMCtWJImvuonmJkXjE8GoAkPx9BywQ
 sPsCdAP535uKgw49Z2sfHUHc9z6sPYLYGvp9SNmt7LHkjnp1W81OoBX2H
 IYOqw/ztvhXU9if4gUQG2mGADCJkOpa6obTRQxRE4X3Y97wogPcbwWFQM
 kyIrpqcQlchS8qCsoofc71U8TMSLKaMa7LwIsEszeOy41i/XVVUxPRfEm
 Z4wLG1KtiWSjSBSBkn6w84QM/gLHjk49S/AX6CXRFab6Ru5yttAhZzIMS A==;
X-CSE-ConnectionGUID: IZc1pgMFR6OnIhepF2S0Eg==
X-CSE-MsgGUID: mG242wS5QmaYMJXkQR1pbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="79277625"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; d="scan'208";a="79277625"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2026 07:23:03 -0700
X-CSE-ConnectionGUID: T4NtJzEcSTO7ty4+73UOJA==
X-CSE-MsgGUID: pwd506KRRYm8eA1O8Q/s5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; d="scan'208";a="276384021"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2026 07:23:03 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 2 Oct 2026 07:22:57 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 2 Oct 2026 07:22:57 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.49)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 2 Oct 2026 07:22:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UoO/f6a/LxOrwY0OR/1hxzW3TtrxmQzQVpyrcmoj8xV98zkOt+2x6sun2zth7ig4qwHbnQl3Ra86tqZGMBD2iBiaG/ja3Sb2ShL366ZwFXl10kyuphaRRLPaBdbaahk0MupTMiIJo5adiAzfBn3izd8bSQt5SrTp3tCQaSXo394UTvQB28xlC9qk9LUB4upRCBeSLBYaXjFZ5tiGD0tnDAHOw3riJh/k8bOrE9B5pZsfgUyftPH8ehvfFk+2+kzx9I0NzmBnj8qgKEL3Efb5ldDROcnz6z2hMI4kdJklTi4mAvkJ0HLP76BzdpXuUi6c4mNunYKFiP8u1UMquurFgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=phEXIj9KIloc9ezn961WDXTaOkw5UIsgn0bsaUKPlds=;
 b=M7/m/FPlIzNMC8edlgZAMcoHlGP1JmF0FNesVhxTsQq9u/3jVjW6trwRT7vLl4QPQM3sfbFwffLPIEuD23z76KiV2q4DybDu09TJXiGIjvxUFaZnJkLnTl/8edUayn6HiKeU3BQ/QNDozVAxBmD2636LA8hf8mPbgpJ89CO+bi3ZctScbitqoiyVpMnJi0mJPMddf4iSC6QgqoEtEk52bS+kulbFWgK5geEiCp//+SLme7jqpE0JXUC6ArtG/k8cYKT4ireG2zyEgrkSescQ/8lTL1I8riVJ2w15PY07iQPIneF0yf/3qNu1YXivSyjR2A/D0Xucz2nCDK0BJJwCxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5663.namprd11.prod.outlook.com (2603:10b6:a03:3bc::9)
 by PH0PR11MB7470.namprd11.prod.outlook.com (2603:10b6:510:288::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Fri, 2 Oct
 2026 14:22:51 +0000
Received: from SJ0PR11MB5663.namprd11.prod.outlook.com
 ([fe80::e4cb:d003:6475:26bd]) by SJ0PR11MB5663.namprd11.prod.outlook.com
 ([fe80::e4cb:d003:6475:26bd%5]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 14:22:51 +0000
From: "Knop, Ryszard" <ryszard.knop@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
CC: "vitaly.prosyak@amd.com" <vitaly.prosyak@amd.com>
Subject: Re: [PATCH i-g-t v1] runner/executor: Fix writing endtime
Thread-Topic: [PATCH i-g-t v1] runner/executor: Fix writing endtime
Thread-Index: AQHdUm6+oXdGl5JaaUCkQPTt8bDsA7bqTiQA
Date: Fri, 2 Oct 2026 14:22:51 +0000
Message-ID: <fef4bfbc4f427da23f5a50786afe46de60d144d8.camel@intel.com>
References: <20261002130522.42708-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20261002130522.42708-1-kamil.konieczny@linux.intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5663:EE_|PH0PR11MB7470:EE_
x-ms-office365-filtering-correlation-id: a765c3d6-8a57-412d-7d00-08df2090a480
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|10067099003|11063799006|56012099006|6133799003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: 6glJLJdHUKyxqZ0qnG8uyxQfmPMriUk6mwuK4PtE+CCoBT+aa5YQhPpE0pEMnf1gZ8v3ABwgN0Jjp2zhJtuVsYWzjGV/Ml8jteC78rfgUOscBe90IXrziXrILWYFETxXDtniIrCwRfzJhInSASsGdMQ8wS/LolDbpWNki8k66qeVhNFLpgav/H+2btnL3wp4M2r8o8riR4Bytv8Eqt2/zPng/hH/R75jRERSYb6obwMfLVD+F3CHJFWmjb4MA0nZta1NjvakVLl/zHYLDgVrMrn0GnhaZBgxSM8OA5xG2ssGw++YW9w/3yPrPe8DlMqDz0HadWuAzYGLcyepMUMq/BBXN7x2t7mvzJQxEbZ1ITCB5O8tKYhCdP1Z07nLd077DnS5gdvLDIG2eyAVVX7rS3hjJBgNbg+zQ/fDYxKQ7wVD2xto8zhNw+2wFGB2uzam94ZrQGwKo9XZHhJr2B11457Y6H+B3VILQfR7hb6Ls6TiaFyfEYFojdPWMOisCPZhlS0fFc6tE4hKvdfHgUEnZXh3U4LBRl9i+liafzpzyd0eqrTtT/SeO2RLoCnCrYFjwR4n+NBfOcfxEjLlDOZ3A7aRJ0DFbQj1uwNrxlXNbmG4yuQj7fknI5JIa/+Kl3Cmvm2uRz7PA3ZeT9T6Fd4zyZXoIk+J61K5FjwtaK3xsjAikXYfLdo5GQftARMcgCIY4vmm5DW1J4UJso3/NUWFrVCt9B8Dp3QVvf3iZ0B40P0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5663.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b05BUWdmaVZTNlpBR2tYUFVuU0RhTTdBcHhFSzBuVml1YnIwOHJXQmx5Ky9E?=
 =?utf-8?B?OVBMRTB2WDlsYU5yT2o3cGI3SHI3RFlFQTJoOWxYOC9ZdjhUSmhIc2VMZlo0?=
 =?utf-8?B?WmpTWTlaeHJQYTJwWDhzb0RaMk02MmhwdFNRM0FZSjA5MmViVndaRkIyZ21p?=
 =?utf-8?B?YTMzelp2QktMU2pKV2FUWkp5cjYwSVRVV1V4ZXdwcEdsWTBIUzVRQ21TeWVJ?=
 =?utf-8?B?aVhrZVVWV2dSTCtDYXluZEZrSy84R1dxaUFqNFN2aTRDZENrQ1ZsTm14YURL?=
 =?utf-8?B?MEpZUUhweTllNmpsOHI5VGl5SG1yOHI3VHczQmFxUmV4eE1sTkFNUGdjd3VK?=
 =?utf-8?B?Mjk1SlhKVEJ0dFlKZVJwUGZaSzZ6N2hzSUJQWnJKUVJmRTFyQ21VNzN0S1BM?=
 =?utf-8?B?UTNqTWtaY3huQkQwbktEeHBUa1QyUHFHRVFPWDRkcTJyQnNmaVpUczlTTUhZ?=
 =?utf-8?B?N0g2M21USkNRYmFBWkdjK1h1bDlUVlYwQW5za01LTUJFZTFldzYrc3h4U0h3?=
 =?utf-8?B?YlJldno4NzgrZ3FGZk9SclFzMy9WV1ZhNFdqN1BmZE13OWtGeEtsY2pXdnV6?=
 =?utf-8?B?ejFka0dNVmVYVXBKMTFIRG05M2tHS0JNSC9XRGc1MTZhK25uR1dWcEhjNTBy?=
 =?utf-8?B?RVp4NjAxcDl6Q1VHMjZlQXpvaW1vZmpYS2crQzZqRE9saGFtQk9kUEtKQkVy?=
 =?utf-8?B?enNKRXBpYmtHTHEvTGhnSWtpS1VuSVVjekx3c3R1SXkyUUZXT1RseUxLckx2?=
 =?utf-8?B?NGdHMzFXaFNJb3hPR3BFVjlKME5uSS9rYjFnWnczT0s4ZmEzT0NFNm9ZcWZC?=
 =?utf-8?B?bUJDeGVoenZ6WlFpZ2xpUnlOZ2dPdnZXUVh6ZmRMUEYrTGFkQ1lGNXpNQXJC?=
 =?utf-8?B?VnUzRC9MMU9sZGFDU2U5RGNNemNpZE94UitVRWVSS0FtaVFUMkl1d1JXUllJ?=
 =?utf-8?B?TVhOU01DL0dxVHhzZDZKa0wzZEE0QU9LUyttQWRHZUYwTmpPRzZ3dWxRMXIw?=
 =?utf-8?B?eXVmZXdrdFFzSk50cVJ5T2NTL2hYdGY2eU5KNzdkM0JsQW1VNkFXcHJhM1dJ?=
 =?utf-8?B?TURZNlRlcVphQVJranM4d2lVVHhQelpzUmw4aXh4azlFdHBOdEpxR1l2UXVu?=
 =?utf-8?B?RVY2VUF3NFU3RXdBRVVaYWp4QkQzcWowSEtFVXFNdW04UmhMVlhLc1M4c3Rx?=
 =?utf-8?B?Ry9kM09xbWdmaDRTellrTklPRTh1cUFrdGxKOHgrb2g2OFczcjZyVVRkcjk0?=
 =?utf-8?B?MWJ3RkJPdk1mRnhzUHFQUjAxMzhpSnNSdWJwQ3l3dSt0NGo0ZEhadFNmVmh4?=
 =?utf-8?B?aHkvMTYvbnR1N0xqN3RQSllCOC9xSXlmc1NPZVlOZnNwUjJHeGZvZllnZjdW?=
 =?utf-8?B?RzJUOVQ1MjE4L2diUWpwNERxUFFURFdta05SaDhPbDBXVE0vTTF1ZmF5Q05U?=
 =?utf-8?B?UmZNdmY4QlhmV1cxdzZnMHNBelo2OEVQSXVOVWZLNXlYL1c4cld0dHhzQ2dH?=
 =?utf-8?B?YlREVzJoVkVZaDJGYlQxRXliaWV6UkpPb2VVQWJjcmNwTlloZnhrdVU0dFlB?=
 =?utf-8?B?TFNtNnlXeHhrcXgvV05jOW1DQ2NZMjViMTdURjBrQytrN3ExbnEyaEQ1OHlG?=
 =?utf-8?B?eURCa2xNdUxIempIN2h6ZUY4QmdzL3RtYW9rV2Q1M2gyVEJDWUZ0ZWhSTXF5?=
 =?utf-8?B?anlUVjlTWGNROEN0Y1pCdXZuaE9SVUZmaGw2bmlhT1EwMTVPU0Ezb1h2Zzd5?=
 =?utf-8?B?THF4SWFnRit5REl4cnBhaCs4WDlvUWZTZHRKZXI0SFJBaTcrbytyQ0pRZHpp?=
 =?utf-8?B?SDBYTTd0cEgrWU1UOHlwbHFyMjV2d0NUY3F0b1VtNVM1OXp1N09Nak1MaW9W?=
 =?utf-8?B?UmVhSGtRQ0tPUlFsNGxia2t6bmRaUW9GSTM4cGZLRWliek1zQ0ZaZDdMKy9G?=
 =?utf-8?B?ZTRtSGtVYkFwaG4zSXA0QW1uVFBNQk5TdGhvQnBXbExSTE1SOXhtZHhGWVVy?=
 =?utf-8?B?WjBQOGROV2xoVzNmSW0rbDdVU3V6RlBoTHZjSUxuQmliUlh0K2pRNGgyNkFu?=
 =?utf-8?B?bXAwdVBqNHhYdGJLcVNzcFYwSDI3QWhCUVVvVE1nV0JxRGtaNUxmV2pJbTRk?=
 =?utf-8?B?akhIV3JBWnhHZ01vRUdCUmNEMHArR0VEVWFDUFJzWWw2SmxBdy9BL0k1Z25I?=
 =?utf-8?B?cE9PK2o2LzdBRTk5QVNEeUJQRUNiZlRyaEtnaTgzTFBaQkxoUW1nUThLem1s?=
 =?utf-8?B?b1dpcXgrTnZZVFJxdU0xd2pRQmJab3o5UVFCaGl4emJIRVdReDllRGJYQzYv?=
 =?utf-8?B?K0hKeFdQY3dlN2xNVU1tcDEyNlJxOENPQXQzdXF4RmJMM2lDSXdnNVVvYUt5?=
 =?utf-8?Q?fr8B1FVMkn+N3Zks=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <979591ED30DE434B959BE8C4B3E8FE72@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: PTq6epCiiKzf855ZX65dqtwq/Zs7pRjKGyj8geEcBJNkmXPdQVbOiO6z9FV++nv7+6Ja48ZZ+4fIGicqvtFnbIRfkcFGy+TUf+dzgfr0UyHf3gMPIk0qo26GYmDuex0CIKIu7+QWTD+WbFB+BPdQ271Y++3hvma8tF/YepUseRnjXVKGtvCKxC+u4v3L41pKQmTe75T+r2CUzIJcEJifaADJYG2zeaM5v5Y08QE2U4eh1zbIXall+uxyF8+SiSEqaDNAJvTA6gOyzg81I+zsSx2PkWHd7gz/hDKM9kDRskHKXqEHCPYserbHKlMHxYhAJLb9hyyTi4C6mPwjBWx/zQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5663.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a765c3d6-8a57-412d-7d00-08df2090a480
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2026 14:22:51.7062 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ai3RvbaTKgAt1buzq8LuKB3u8B4HmxIdX7xfTUOgJMMBOij5Ua+wcEQ+lFOEuNsgYVQA+P8c6g6CIEeK9VIevg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7470
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

KzENCg0KUmV2aWV3ZWQtYnk6IFJ5c3phcmQgS25vcCA8cnlzemFyZC5rbm9wQGludGVsLmNvbT4N
Cg0KT24gRnJpLCAyMDI2LTEwLTAyIGF0IDE1OjA1ICswMjAwLCBLYW1pbCBLb25pZWN6bnkgd3Jv
dGU6DQo+IFdoZW4gb3B0aW9uIC0tc2F2ZS1yZXN1bHRzLWFmdGVyLWVhY2gtdGVzdCBpcyBzZXQs
IGZpbGUNCj4gZW5kdGltZS50eHQgaXMgcmV3cml0dGVuIHdpdGggY3VycmVudCB0aW1lLCBidXQg
T19FWENMIG9wdGlvbg0KPiB3aWxsIG1ha2Ugb3BlbiBmYWlsIGFuZCB0aGlzIGluIHR1cm4gcHJl
dmVudCBjcmVhdGluZyBwYXJ0aWFsDQo+IHJlc3VsdHMuanNvbiB3aXRoIGFscmVhZHkgZXhlY3V0
ZWQgdGVzdHMsIGV4Y2VwdCB0aGUgdmVyeSBmaXJzdA0KPiB0ZXN0LiBGaXggaXQgYW5kIHVzZSBP
X1RSVU5DIGluc3RlYWQuDQo+IA0KPiBDYzogUnlzemFyZCBLbm9wIDxyeXN6YXJkLmtub3BAaW50
ZWwuY29tPg0KPiBDYzogVml0YWx5IFByb3N5YWsgPHZpdGFseS5wcm9zeWFrQGFtZC5jb20+DQo+
IEZpeGVzOiA4ZDMyODRiNWFlMTYgKCJydW5uZXI6IENyZWF0ZSByZXN1bHRzIGFmdGVyIGVhY2gg
dGVzdHMgZW5kIikNCj4gU2lnbmVkLW9mZi1ieTogS2FtaWwgS29uaWVjem55IDxrYW1pbC5rb25p
ZWN6bnlAbGludXguaW50ZWwuY29tPg0KPiAtLS0NCj4gIHJ1bm5lci9leGVjdXRvci5jIHwgMiAr
LQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvcnVubmVyL2V4ZWN1dG9yLmMgYi9ydW5uZXIvZXhlY3V0b3IuYw0KPiBp
bmRleCBiYmUwMTFjYmMuLjgxMDNjMmE1MiAxMDA2NDQNCj4gLS0tIGEvcnVubmVyL2V4ZWN1dG9y
LmMNCj4gKysrIGIvcnVubmVyL2V4ZWN1dG9yLmMNCj4gQEAgLTI0ODAsNyArMjQ4MCw3IEBAIHN0
YXRpYyBpbnQgb3Blbl9jb21tc19pZl92YWxpZChpbnQgcmVzZGlyZmQsIHNpemVfdCB0ZXN0aWR4
KQ0KPiAgDQo+ICBzdGF0aWMgaW50IHdyaXRlX2VuZHRpbWUoaW50IHJlc2RpcmZkLCBkb3VibGUg
YV90aW1lKQ0KPiAgew0KPiAtCWludCB0aW1lZmQgPSBvcGVuYXQocmVzZGlyZmQsICJlbmR0aW1l
LnR4dCIsIE9fQ1JFQVQgfCBPX1dST05MWSB8IE9fRVhDTCwgMDY2Nik7DQo+ICsJaW50IHRpbWVm
ZCA9IG9wZW5hdChyZXNkaXJmZCwgImVuZHRpbWUudHh0IiwgT19DUkVBVCB8IE9fV1JPTkxZIHwg
T19UUlVOQywgMDY2Nik7DQo+ICANCj4gIAlpZiAodGltZWZkID49IDApIHsNCj4gIAkJZHByaW50
Zih0aW1lZmQsICIlZlxuIiwgYV90aW1lKTsNCg==
