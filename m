Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5AB0C5475B
	for <igt-dev@archiver.kernel.org>; Wed,  6 Mar 2024 10:02:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 531EE10FD48;
	Wed,  6 Mar 2024 10:02:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KVYQd5Ia";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAA2C10FC49
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Mar 2024 10:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709719372; x=1741255372;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=B27sVhrpR/U0CLo3PsNJsmmQenp2RifmVpkQ9SL2JWI=;
 b=KVYQd5Ia7g8TEvnyvSq89MeTaUG9x71zHisTsK7LD24c4bcKA0YwO8rx
 nKIQ7rvh0zAgHZEB/n5oMF0+2iE0C1mOz3QMFCGFFWTj0Pr2IwnfejAJ5
 lRoDZwSdEVvhkE9dcEfGjqM8qlTiAzyggOdUWtYxLygCI069lDkvXpA74
 rArHUV1iqKFnX9s0tlcyA6Ku8B33vu1bx0uhLcWdse7MZ3blxXU3pJJ+v
 kDqNFewyr0aebHpNxF7Mn6G2BuM+dtllLAOtujao0UOtHmG76T2/VdbdP
 MR2tzBLWXJAGYRX5473ASHhQe+BpdE66RE6lv+zpXdT5hsw6uPzzkJCSA g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="8084366"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="8084366"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 02:02:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="9643279"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Mar 2024 02:02:43 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 02:02:39 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Mar 2024 02:02:39 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Mar 2024 02:02:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E3sAZ80Ft7mdcT3E5UzQo06h4K3MboqnpSI0i8Q6GzG6C5b7J4c/u+YqowO4ooDj3DVlb6MIUZuW/dGL3P6Um7fy9IPahw39XYgd67j1GWhCiqDk7KzhPpkvxUUq5D9Ong/bpA+GH6B3sdJ8lYQJuXyHZ4fS3Re8qB9PkGDovfvmLhQ/hEr648JbHAaj15LbSOd68QqJIB7ZpV4/5NOp406pnptyfL7St2czK4/cVn4mmdEIN6DEdZqTAR+UJ7WA7VN6yhs+YWFkklagV29lhCj8VJuCB0/g7T8WI05I+X8ecY5QmS23TjrdNv9dlNZp4BfsMYl2+5S3uzjmr81f2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B27sVhrpR/U0CLo3PsNJsmmQenp2RifmVpkQ9SL2JWI=;
 b=RrX/Ot60JOpiwDyCzW7Vo4MZCTfLfJ9V/5jbMqkJ9iczsKzfT9KQtBtl0lsMPFtYJSUtckV4gmmD8+aR13agGY8AHUt31RNfV/Yv+o9Gpw4qxMc1mnGylCvZNds6uuvZVPHecXYk6JnbODp/brN84KQzMj+Ph3Fpl+c2UkXNB5IdMipyhl0e7m5MCYZ5W2zM6TuH5K6S3Dd6h8cCSr/BgOGJZEgjCz1KwKja2R6eEQnCwzB32xqfwmcCih3+CuLFu/yJYV+b0qa1fxITvQNCNCIpDewvVIfiR8gqezcPG3Z6463LHtfj2owLLCo3vGS7/EF+UXszXCRBJqZySiwzkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 DM4PR11MB5969.namprd11.prod.outlook.com (2603:10b6:8:5c::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7362.24; Wed, 6 Mar 2024 10:02:37 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::d317:e2a8:8e14:7bff]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::d317:e2a8:8e14:7bff%7]) with mapi id 15.20.7362.019; Wed, 6 Mar 2024
 10:02:37 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Modem,
 Bhanuprakash" <bhanuprakash.modem@intel.com>
Subject: Re: [PATCH i-g-t 1/2] tests/intel-ci/xe: Block PSR + DRRS tests
Thread-Topic: [PATCH i-g-t 1/2] tests/intel-ci/xe: Block PSR + DRRS tests
Thread-Index: AQHabh1umvSoSNzvj0KEH+wN37L5Q7EqfpiA
Date: Wed, 6 Mar 2024 10:02:37 +0000
Message-ID: <2abfb531ea9929247167030d5eba37127138f558.camel@intel.com>
References: <20240304101252.3242812-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20240304101252.3242812-1-bhanuprakash.modem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|DM4PR11MB5969:EE_
x-ms-office365-filtering-correlation-id: e3c1371c-463a-4ed7-e3e7-08dc3dc48d57
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4f11Z/a13TIOqFO8RUAtYE3L4k4/xIzPpn4w/IIxV3y54u4AtSkAZmvEfX95eJqwzNVqSa1TeueM0W9k0kl81JPDAjahecwjP/eUpwIRboUPll0EIBQOOBNELzmF7xwe++BThYTx3SYeyELAEHGB6fACcudljL5ZuEWhDzBzq8PAhg3sftEpx6Dv7FQWO2ysctNb3TkWj3G2+bz0AuQTyg7pDLzUmBgaM5EEVfx4sl9nWxJomkZEmG1reUFZqio+j2SaTHD4AjaEM67h8d3RJZZlec2A9wvzeKX/lnxAi3TkLf9zFhQ1uKaOyS9Ow6nG39/A9jc1JN0yrTFMLQeMJUOO8AESa+IP5DereNe4/kiQEOBjDXB1UlBQXfZgucHigrK18stfLGujNtFVuF3xGLqXseweHdySMK/ZabU7XBSSS9FmVGPKg+xFypDDMqZMZFLGdbLloPfuM1UgFGbE+mW97f+pgv8r5d2tZJHKgj/udfrbKNGhucvnp9pD6Wv2XQUlW3wd/UbkiVdzhhBhovqt2eU7PBg1shYENIytgfMN50lkVY+e9HlPLCOzzvyG2UnMIyT+L042jLnUcnZ8HwMpRkexHV4MZsxRJahzUzYh0ojyGzlwGp+JTGH9F/YDeddjvI3NSPGaPfreCacHlc2/vJqmr824LIjAB6wlGr7QlbrgqpIxCE1p3AQN1S/LccKg88npc94bzfk/J7VzTg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UXZUVFhyLzlSMTBvZFZHTnpmdE81NFZYb2loMHQ4T05yeXRxNlExbFJURHJJ?=
 =?utf-8?B?RTM5L1Bja2QxL09NYjB1YzBiWXpQSTFTYlRNMWdsM0t2TUdxeE5vK3BXWVp6?=
 =?utf-8?B?TjZ4c29zNEtSVG8rUTF2VHR6VzlIem9yR253ZVRUaXZxaHlaVytqVkVrWnlX?=
 =?utf-8?B?dEsrMXNLejhIdGdIR1MzaTV4dDBERUNtV3RWWGNLdnRMOUFPbEFuR3BhM3JW?=
 =?utf-8?B?R05udWJqU1V5eFR6UXM2dDVldzJsdFVnT3o3dVN0TVNiUm5CY3NHVm5vaURu?=
 =?utf-8?B?eUR0UUtURjV5RFZPaHFqbG9Ma0dqR0xFRm9ZWTljbXpXQUN4cnlFMU5LRm5Y?=
 =?utf-8?B?NGJBSDg4TXZmYjNsVjBsTlYweGZLSWZtUS8ycExDN3NXUVJGeEtTaml4LzZk?=
 =?utf-8?B?OTRtdDY2VDJTdkFneDFXRm9iWU9ZRURjbjFRRHNzMFBOL293Ym1kbjBmcDBV?=
 =?utf-8?B?V2lPMTBYOUgyM2M0aVVhYk1PMDZPNHZFZjVOcnFHR1k4d3cxTDB6L3JVNmF5?=
 =?utf-8?B?ai9pOVM4SFdERWtOcXljUCtjQ0RUaDNGaGZGVm5OVmJSenN3V25xWHNmcW9n?=
 =?utf-8?B?OXFzdWY5eGFxNmUwc2FvMG82MVpLdTFWaE1sbUdZcENPTHU2dDBNQldJZE5Z?=
 =?utf-8?B?b1oxWmI2SFFzc0tDNEZ4c1czQWtFYXVMYUZBUDNMRXZjdlh1R1R1WE9WeXdD?=
 =?utf-8?B?elRRd1c3djNwdXZCRlhkQys4ZTcwMXViTW9VS3JubmZoZFZGRTBlNnJrKzlj?=
 =?utf-8?B?YnUrOFRNK1JpUnJqajlQODhRSklESUx2TEVMMzNQYUk1WEJIK1VjaGF3bjNj?=
 =?utf-8?B?WkVGYkRBT2svSFNGNjJXTXpiL2JyeTlVQldTRmFuMFRSWHlJNXNScE8vYmxu?=
 =?utf-8?B?OTBUME0zdE52NHNId21WTW5SKzkvSmZvMmNhNC8wRkJEdldHQUErRWNiQVho?=
 =?utf-8?B?STFYMEZPS2N2UUZERmZDVnVSMnRSdTBrMFBvTS9mUmQ3YUNvR3VlTnBBeHZk?=
 =?utf-8?B?TmlMbmFPOXRQK1ZrZnlGSWZTRHRwdy85M09Ud3QxUUNkRmg2NWJiMy91VUk2?=
 =?utf-8?B?QTF1S2RXY3Z3bTBJNFl3bVJuaklTQllRV0k4d3VtZC9WZGNTNW9EZWZZVjNN?=
 =?utf-8?B?Y3Q1YjFmOFRiRm5LL29CclZwWFRPSFMzbWtnTXhvZ0hhREJJM2Z0ejlML3Jr?=
 =?utf-8?B?bnB3Vms3R2lQTTVhWVhoeW9kdFowd2lwUDVBTTVlZlROWVY3QmJOZ242V1lL?=
 =?utf-8?B?ZU1nSnVpOWFBQk1sNk1SODdqR1J5VE5mL01TUkxWREY3MitGOUhwZHRDVTNK?=
 =?utf-8?B?WXJCeUVYbjhNRTRKeDFoYWkzdks1OFBtWVFHeEtvUkpOTjBMbytxS0xEdEFs?=
 =?utf-8?B?bEF1dUd5L0VqdEQxNDlLaG03a0R2c2t6aW9zU1hTNzlnYkM0VEhSUE1VeG1r?=
 =?utf-8?B?aFJMYVVOdTI5bDRJdG4rVy9Ya3Jla3RVNmk4SlRpVVQvclBHbmJoQzY2Wlhp?=
 =?utf-8?B?OWlEZmxqWDljQ2p3WFVTRXpGVkFreDNXbHJUWHJxa1c4Y3FKN1VROUtrMlRu?=
 =?utf-8?B?Wk5CeVROdVQ2VkhmUmNyS1Fid0oyTDVFUmJEeGd2eDFSWFUyUmVUSnYrVWZC?=
 =?utf-8?B?RzlxSkRUMGlWQ1ZYYStTQmlHR3RWejN2YlRwZnkxVnhHRGlwWFcybDdYNnFD?=
 =?utf-8?B?MDFpeVhXdytKZUJ2bUdCRmJReXZEaS94NjVuZkhxZmhWSHhkakN2SjlvV1Zp?=
 =?utf-8?B?RXFrb3dwZHhmUXNpcnJoZnlSYWhlRUZWUHVuODBMZWtmd1FmUFNVd3Vybnk2?=
 =?utf-8?B?ODk5dFZGZTFJKzFKTWxSL3dFNC9wMWw3WndpNzNKeS9nN1RldTBLUXRqSFJI?=
 =?utf-8?B?bXMyWHY4VlB3VEw0YjBQUEJPamllMGJDTnpLRTZoVURpSTMyaUVWK3h5N2lD?=
 =?utf-8?B?WWhjaXE4MmhWZ0NkejFpTnBXTnpKblZ4NzRLRVczb01qOCtFYWJvejV2L2FC?=
 =?utf-8?B?NEVRVjJIa0l5bks2c2ViN1h5VG1yVDVveVpsQzNUSHI4LzJMQmNBUDdvaFFF?=
 =?utf-8?B?by9jYW5ncW1Xb1lKMEYraW9NSmk3VmVpMFVaMlljUEgvMC9JUHcyN3VhTG1x?=
 =?utf-8?B?V25QMnJ4cEtHZjAxdWJxVEhxZG5yQ3lYeGhMN0twWDZWcUdMSENYL2NCaWwx?=
 =?utf-8?B?WGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <311A6E4EF669D0419A54DB1210B8FBD6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3c1371c-463a-4ed7-e3e7-08dc3dc48d57
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2024 10:02:37.3498 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mFAn5VyxNKwUlzkcJpqg2nXLSowuq6H3WcPclOGsz96rRfc60b+FYcL3i2yE/7kIqIvcIV5mi+49lZxszXOY3WBG9es2NhJ94KhzuiPTPvg=
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
c2gubW9kZW1AaW50ZWwuY29tPg0KDQpBY2tlZC1ieTogSm91bmkgSMO2Z2FuZGVyIDxqb3VuaS5o
b2dhbmRlckBpbnRlbC5jb20+DQo+IC0tLQ0KPiDCoHRlc3RzL2ludGVsLWNpL3hlLmJsb2NrbGlz
dC50eHQgfCA0ICsrKysNCj4gwqAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwtY2kveGUuYmxvY2tsaXN0LnR4dCBiL3Rlc3RzL2lu
dGVsLQ0KPiBjaS94ZS5ibG9ja2xpc3QudHh0DQo+IGluZGV4IGNkODk2MGM2NC4uYmMxMzI1YmFl
IDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9pbnRlbC1jaS94ZS5ibG9ja2xpc3QudHh0DQo+ICsrKyBi
L3Rlc3RzL2ludGVsLWNpL3hlLmJsb2NrbGlzdC50eHQNCj4gQEAgLTcyLDYgKzcyLDEwIEBAIGln
dEBrbXNfcm90YXRpb25fY3JjQGV4aGF1c3QtZmVuY2VzDQo+IMKgaWd0QGttc19wbV9scHNwQHNj
cmVlbnMtZGlzYWJsZWQNCj4gwqBpZ3RAa21zX3BtX3JwbUAoZmVuY2VzfGZlbmNlcy1kcG1zfHBt
LWNhY2hpbmd8cG0tdGlsaW5nKQ0KPiDCoCMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KPiArIyBLTVM6IEludmFsaWQgY29t
Ym86LSBQU1IgKyBEUlJTIGNhbid0IGJlIHRlc3RlZCB0b2dldGhlcg0KPiArIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjDQo+
ICtpZ3RAa21zX2Zyb250YnVmZmVyX3RyYWNraW5nQChmYmNwc3JkcnJzfHBzcmRycnMpLioNCj4g
KyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIw0KPiDCoCMgS01TOiBZZXQgdG8gYWRkL21pc3NpbmcgWEUgc3VwcG9ydA0KPiDC
oCMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIw0KPiDCoGlndEBrbXNfcHJpbWVALioNCg0K
