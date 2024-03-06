Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43155C5475B
	for <igt-dev@archiver.kernel.org>; Wed,  6 Mar 2024 10:03:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE22E10FC06;
	Wed,  6 Mar 2024 10:03:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PcHWFccd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB7910FC06
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Mar 2024 10:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709719394; x=1741255394;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=eesWv5gJ0bIVJJLSA/rsuQmVgXnYqi8/6077cGZ1fLk=;
 b=PcHWFccd+R1ww2j7Fo2LceNMJ77OP30ZA6lg7DUo7MNEvrGutzohTnW4
 DL9NP0A+hQUTRztlPK5XsDGGfrpZP0A+U52sZdw3JU7Wq3/iUpRG7WGfD
 ropR4iruOLm8tS89VJxBUyHjyyKPae66QpO4S0VYpgZZUiQcbCAwXCHms
 qdD0ohRag2Th+2C9T/e2Tik5Y7wjnEzdWO1rBTby2b9x40c8WKzWiKxtn
 D0r5C6o7SAwVw8PfKVpnwreZniMCgHwOSudEt8/UxUxdqYKbH6I1AaEKS
 OddRFpsLpEMLSvnZeuJ0/3Ly6ht6gsP3OMfRTgbSsEoMVGGx3aMnWrJaM w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="15039966"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; d="scan'208";a="15039966"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 02:03:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; d="scan'208";a="14269905"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Mar 2024 02:03:06 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 02:03:05 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Mar 2024 02:03:05 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Mar 2024 02:03:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d8DpGfiUpAAHtCm6Xdu56+6flDhlh8Tm0Cx4AcSrmmV/Eh9lGH522T6sE4JWkHvi9dUFcAeodO+MkbZPafRREyF+7dQS/dzeEPk+I2TIdrw/NrPmqdF3zS15ZF00yztqhjpo4euDeFkeqLZ/AM/6Y82+pJgpL/QFvAvwSbN5F+SP5EE2QbBaq6Xj6HdxIvV8wkNhdsqmdxZ6THCBVhBwqGruWzqVm0GfTuW10Eqtoouv+SGem9OPW2bniQf+adJGtT0ZJPsctwX1Jdc1jLI+ldk3O/3B5qg3IUEr40Pluebbt8A3qA9H+oWA3fVcVvjoGBBLvMeu13vYq1NtTm7DnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eesWv5gJ0bIVJJLSA/rsuQmVgXnYqi8/6077cGZ1fLk=;
 b=CacEBZHI3zMW+NvuwVQ+pcs9nnfwlXayEbn6TfIGcdJh40Zjr+pNHPQk6BBHV9vkVtBIrkQZNDdehPypFWMaZ6WxoQHrt7+xc3i1SiJgci0F4DOY1AhrJML64FQTEtbY/7GYhkKRiPrpVoB7ctVoIEMVZ6C/jGML49vOjkyPiA8XC293kdzvMIavr0dVXOi/2TVyv8YC056yhODZ9XVWmGg2601CiGxUn95mqtL5J0iQVQIaX/QW7/XjQN6MWTCzeLwSbo8y4o+zSRrsN5q8odiHdA0otg1pisrbMc6gVO/3ttPAioiVGTKm9G+kJFhAjAbpXprSlPSD2b/Ff3pEYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 DM4PR11MB5969.namprd11.prod.outlook.com (2603:10b6:8:5c::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7362.24; Wed, 6 Mar 2024 10:02:58 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::d317:e2a8:8e14:7bff]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::d317:e2a8:8e14:7bff%7]) with mapi id 15.20.7362.019; Wed, 6 Mar 2024
 10:02:58 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Modem,
 Bhanuprakash" <bhanuprakash.modem@intel.com>
Subject: Re: [PATCH i-g-t 2/2] tests/intel-ci: Block PSR + DRRS tests
Thread-Topic: [PATCH i-g-t 2/2] tests/intel-ci: Block PSR + DRRS tests
Thread-Index: AQHabh15OgLOYimdHkC6yLCOxH2oXLEqfrKA
Date: Wed, 6 Mar 2024 10:02:58 +0000
Message-ID: <92ef40ea6a522274521e46070f5b7476aec47771.camel@intel.com>
References: <20240304101252.3242812-1-bhanuprakash.modem@intel.com>
 <20240304101252.3242812-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20240304101252.3242812-2-bhanuprakash.modem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|DM4PR11MB5969:EE_
x-ms-office365-filtering-correlation-id: e3ede35b-42d3-4661-82f7-08dc3dc499b8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fS4M13jN715I20Mhnf2y2Fze9JTTNkhg426bCNuqgYUisyeq5lzpvMoImKyc/8AkjD0p4FhKshIdkFl69JZhE1QFiiC/uCvVdw2O9D7KM/zAwMA8sQdBXsbsNygVnWm1bt9tvo9Cw2k43oOAhM7LYfd0RZMEKyouhC4rdc+BSMj4HIH/t/TcuQAi+gppP/5mIEBujd6Z9Sfo8iAMwp1UCMm6OG8oX9X2iy/MrTlGw5+g9eV+8jxw20Vk7erfCrfW0AK25BLazfgs9T/jXmUFDZWnclkm9fbOeg3GBYTOZN5UKNyRzEBX3FYpIwY5iL+JRvIUGh+YJatRDqkfsqkOSwwPqk3KUQND6vEGpbCw9lZiSzpFtuDTIZa8WfzbgYpbVLnGZWac0CHzlI4qlrIDyOjM3Btdd5yK7fIJ9BOjRCo4P+EnDLIF+odrl4b9w6oD8dYFyoz1nqvAFACGC4AgelsAtdXAzNzox1R8SVhhQGCn0puDJBUqajyfT3uoVGkKaB7jMYqcC00c5gjIxqZaDpJ/urkNSwy2WBtpPzL5xDLIQ7g0bi2xAniXO4trUkp80rZJorHaDyQuvaVJTznVJZhJTvlSRfrY7CMO1PEZ95td2rj8IW6BFSsagC0GJZgSh2tJWNz9L4DOA+iz7qbtZUrlPoP4kvHvr48mrmOBMij99gpoJPiTFd7fI8nRB+XCpCUpJfDB3xqzRqBGreZZwg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NjV4Ry9rTzI3WHpIL0YyaXJZR0RqT0hzM0VsL0xIa3JaU3Z6OVEyWmtZRnhV?=
 =?utf-8?B?YmJaOFlzcFFGdXpuMDJlSzdCZXk3NFBscDBBOE9sMElvZmROZzMvNEpqdnNH?=
 =?utf-8?B?NTRYZUFYSS9QVVJuUzEyYXVPWUVDYVNaV0JJK0NKM3R2cnZUYjBYcitXWWlE?=
 =?utf-8?B?Q0ZtR3pBb0dVQVY4MTRNcjIwcDdVYUM4cjBYMko2TTF6QlA3Z3JpOHR6dTFW?=
 =?utf-8?B?RjFNNHBYb3EzTmpWb2V5YmtYNEhrSjFrL2htckprUUExa0JHeFJyVHR2Yng4?=
 =?utf-8?B?NmxnZVhvVFNBeDI5bml5U0VhLzZpSHhsVGtKRmtQNWtia2NHN21hUlh2ckcz?=
 =?utf-8?B?T1JScVhJTDBkaXlQMzNhaVRmZTBMMVZXaGFKZ0xqcXVMbWJiMUZhbnZta0lU?=
 =?utf-8?B?WVVCdEljUmtyMHFnYVBNWW5SUkttMnZ6WFowWitQbEtUTGMzNWpneW5jTVZh?=
 =?utf-8?B?SUJPVzI0cE41QWRaNmJsYVVibzNmRWJudS9jTERzZzJSU2Z3NHdTcFk2ekhI?=
 =?utf-8?B?NzJwWDN3ekxvektYdlUvcTlxZ2ZReTJFbnJNTUtkNENSUTgvYzFOeXRNLyts?=
 =?utf-8?B?L0pFUjNNYlA0dmt5UktQTFR4eVBNVHM0MndCVUJ1ZDNUdlpKR1JwLy82R1Vr?=
 =?utf-8?B?UndYTFVSeGlqSzZZNkF4Rk12NmRQb2Z0MDhLWitmaVlOV2gzcjliUzZMcjhR?=
 =?utf-8?B?am5mM2k4UFJPV1dwZGRGL2VHL3pHOVRXUkVKZS9Qa3dQd1d4VkRQaVVDNTNJ?=
 =?utf-8?B?U0F2QVB2ZFozTThzN3ZGd244MVMzMUJuU0lmekwvNzZralNaTjhmckdrcXdt?=
 =?utf-8?B?NW1wdmtucGNMNXNyYXRPWnc3cmswWlBqaFZ2clcyb0tLalNrRmhOUXcxWGNO?=
 =?utf-8?B?Mkg4Y0QvNGhEc0tSSUQ0ZEpPQUdNYWxPYlpER0FGaDB2dGNIVVVHTmhlemE2?=
 =?utf-8?B?a0V1dU1pVytqbmllY2htc1p5dk50NTduKzIySUpDUFN3L1ZjMGIyTHNMRURl?=
 =?utf-8?B?ZFhyajh1cDdCM1J4SElzdWxPTFA2bVYxcHdidGk5VUZ6VTQ3NytBWE9WL0xs?=
 =?utf-8?B?bFczdEltS2VzWUY5aHVReWYxZ3JNclVtUU5jRGlJa2ZuK2dLemJBbkJ3QkNF?=
 =?utf-8?B?NHdvd3ZDNDh5L2dXWHd4M21BS043QmNWVnl2M1lveFlYU1ZTVnZNWkIyTklV?=
 =?utf-8?B?Y2gzd2pKNTJZb1BGalo5VGhxQk9vQUxoYnRVNDN6NEIwMmJaN1BwZDc1alUy?=
 =?utf-8?B?Wm10TXZUd2lZZ2IvL0VzendCT2lsNXpIYURqTHd6UUFTUXNsQVZNNG1QVkVJ?=
 =?utf-8?B?bHVWUkh4R0ZSS09aaVJoZjRqcGtNN0RTdE9SVklmelpkcHZrbk04R29vNTBK?=
 =?utf-8?B?TlA2bHFTU1QxLzdVREloRy94WkdqYnlONXZzTUNRc1BGRCtzY1lBLzJqT1lq?=
 =?utf-8?B?SERmWVJOcEg4TTZtT0dzVm9lV2gvZU1Id1pzOTN2UnphK2h2djlXTmZvNm5r?=
 =?utf-8?B?ZVNsZTNtUnh4bWxyaUN1UXk0VVEwZFV4b3J0ZW8zWHgvbDRCczVhaElWVUR6?=
 =?utf-8?B?TVNPdjJUVmhUVXRySTVYdnQ0RG5VRE82V2RtVTQ4SnZJcHNlK2x6OTdEVXFC?=
 =?utf-8?B?WVFzWExJbklZZXZJNDhZOUFoS1RpQ21uMm9YdkJMN00xVXZBdlViUWtpZ3lR?=
 =?utf-8?B?elcyTWRDUlhhbFhDYnZhemF5dWdLM2VPQW9xNkc0T1lheFluMEZqSGIwYzk5?=
 =?utf-8?B?bThjMWhZaEYrTDFoMlhxZDFtNnJLWnBQZUt3eWp6b1NSRW52bVAza1F4YTBn?=
 =?utf-8?B?eDFTVkFqR0xPT3Fhd0F5Z3dBSnc4b0NGbGM0NXNBMUlhRTdjUm50QUxyak1O?=
 =?utf-8?B?NTZkdkFtMjRUOTdMcHRNdTN1ZjdpZTdka29waVU3MnFuVmtsOVQ5Q2wrNUtR?=
 =?utf-8?B?VURFcC9lVGJPdmxoSzAzM29mc2JjdXFGcGM0MnpJOWhlb2RMRERkaFA1QXNF?=
 =?utf-8?B?S0lJdWg5MkYrRnl5aG5kcitpTWc0SlNyT0xaZ2I1aVZZZzdVcm1Jek83V1dV?=
 =?utf-8?B?dnRTU3BTRnpWQXN2amZwT1ZMWjdLcTREV2ZLL2JmTjdJT0NCKzNmRGl0TUVR?=
 =?utf-8?B?Z3ZrekNFMzFKQkE1NUNpTk9yTW1uOFRPT1JiWjNlZkZBYllabk1NcGlHajJi?=
 =?utf-8?B?TlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D986E115CDB74945B6AFCEF9C4466688@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3ede35b-42d3-4661-82f7-08dc3dc499b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2024 10:02:58.1339 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0lQbroQkQVtGVow35+A7jg6O6yVzvzE1bjND3rquCGVLPlQPstbDB8g5oHg5EUnkeH6R33IiVMw5twuDOR38BfOml4KkCNM6rGMS+pbb3Hc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5969
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

T24gTW9uLCAyMDI0LTAzLTA0IGF0IDE1OjQyICswNTMwLCBCaGFudXByYWthc2ggTW9kZW0gd3Jv
dGU6DQo+IEFzIERyaXZlciBwcmVmZXJzIFBTUiBvdmVyIERSUlMsIHdlIGNhbid0IGVuYWJsZSBQ
U1IgJiBEUlJTDQo+IHRvZ2V0aGVyLiBIZW5jZSBibG9jayBQU1IgKyBEUlJTIHN1YnRlc3RzIGlu
IENJLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQmhhbnVwcmFrYXNoIE1vZGVtIDxiaGFudXByYWth
c2gubW9kZW1AaW50ZWwuY29tPg0KQWNrZWQtYnk6IEpvdW5pIEjDtmdhbmRlciA8am91bmkuaG9n
YW5kZXJAaW50ZWwuY29tPg0KDQo+IC0tLQ0KPiDCoHRlc3RzL2ludGVsLWNpL2JsYWNrbGlzdC50
eHQgfCA1ICsrKysrDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsLWNpL2JsYWNrbGlzdC50eHQgYi90ZXN0cy9pbnRlbC0N
Cj4gY2kvYmxhY2tsaXN0LnR4dA0KPiBpbmRleCA0NDI3ODA0ZDUuLjRmZGVmYjkwZCAxMDA2NDQN
Cj4gLS0tIGEvdGVzdHMvaW50ZWwtY2kvYmxhY2tsaXN0LnR4dA0KPiArKysgYi90ZXN0cy9pbnRl
bC1jaS9ibGFja2xpc3QudHh0DQo+IEBAIC03Myw2ICs3MywxMSBAQCBpZ3RAZ2VtX2V4ZWNfYWxp
Z25tZW50QHBpLXNoYXJlZA0KPiDCoCMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjDQo+IMKgaWd0QGttc19mcm9udGJ1ZmZlcl90cmFja2luZ0AuKmRycnMuKg0K
PiDCoCMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjDQo+ICsj
IEludmFsaWQgY29tYm86LSBQU1IgKyBEUlJTIGNhbid0IGJlIHRlc3RlZA0KPiArIyB0b2dldGhl
cg0KPiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMNCj4g
K2lndEBrbXNfZnJvbnRidWZmZXJfdHJhY2tpbmdAKGZiY3BzcmRycnN8cHNyZHJycykuKg0KPiAr
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMNCj4gwqAjIFRl
bmRzIHRvIGdlbmVyYXRlIGludmFsaWQgY29uZmlndXJhdGlvbnMNCj4gwqAjIHVzaW5nIENDUyBw
bGFuZXMgb3IgY29uZmlndXJhdGlvbnMgdGhhdA0KPiDCoCMgZXhjZWVkIEhXIGNhcGFiaWxpdGll
cyByZXN1bHRpbmcgaW4gc3BvcmFkaWMNCg0K
