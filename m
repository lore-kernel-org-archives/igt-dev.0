Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2EB606A31C
	for <igt-dev@archiver.kernel.org>; Thu, 12 Nov 2026 09:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MG4gOWt3
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EB8310E4C4;
	Thu, 12 Nov 2026 09:22:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA4FB10E529
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Nov 2026 09:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794475273; x=1826011273;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=LSJs2SvG+zf+Pt9/7MTD1BtO+403TU7h1X8gt9gV0vs=;
 b=MG4gOWt3eHHHv9GU91TtMvMt+WxDiBHrrGnDJj3YSAspdMtvoTCgZwoQ
 t48wrXhz/XTuaTvr1Gf28oYXtrVReCMEt1MRrOUh8GzSA8j0G+NgQfwUS
 QG8Qe3BJOsV8N3HpYq15hf0O4yk/4liFRfQRggwxRbdu4v1BFMEXHRg2K
 LTFoZwwhcCuZOZwiL7jpEyGPKwEXwALTO5OyXgm2MdHKkExnJ6EV2PY97
 rL6Rx/PGgCLhj/NyhtmtnOx43Ji8GHEqyIEvvUJjubCSzD+WJ/sd0qiai
 O/7nwohCeYwGnmQVYufejk8mGwcAJuFKceJ80804+feYuNI0LtIYR+Qj7 w==;
X-CSE-ConnectionGUID: dfWtwRNfRBK/+R9AFocLVw==
X-CSE-MsgGUID: spmtXp+qS+qsXbWCaNPlgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3351734"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3351734"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 01:21:12 -0800
X-CSE-ConnectionGUID: A++7Cz+RTr6GDRtMWyIBpQ==
X-CSE-MsgGUID: pxS1h1H/QiqlU4vcQVntfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8932283"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 01:21:12 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 01:21:12 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 12 Nov 2026 01:21:12 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.25) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 01:21:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ab3YK9NxQqmT7YVot3AAoGI0aA5E5MGjVUW4E+HGcF9n1RaTPp++pce33SXpuQ4nFajGc24XcmuT5paB2tJhUt5aySFuDPe25kX+wUaFr+RZNCe5QRvAG8yipQFcaWmcJA0uL6+M4XlsM0OGnjbyZUmXeZZlBJaK6BrJpwBqmpwAn7v/OEtM30Ljyk4D3bX14y90A6Gx9uX3oNdpwD77l+CeMNpWFqxJNcAlkjAXYMVmZKHgyv32p08hLokNPbgUPrs2DzYZB4S+hTTvZutjo/vVWFp6E1ll8n/SuVTp5iIPzbGSSy9KSc9ZWzUUZwVokGBh5E7pnpLmuYRQs+J74A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LSJs2SvG+zf+Pt9/7MTD1BtO+403TU7h1X8gt9gV0vs=;
 b=eXZ88KvyxOEVv5jfgeTGIi+y4+vvMc52B2C+L25r7mZOp33nX9ltcUxq0jmoD4jXasdU0v4SA0p8GX/ubhH5zmopOaZQkaqHnNrSKY+GQIW7J9u1TSgSNtBqfRXKgGfnpxIgzMssZGNfTRPf6NIKBxEcdwJxMhjXavhjzf5KHH+mnSASkOTAA8hQMjUg+C/5pXQlS0/cIjY7k1VRRt64hpyRBSyvaBXSV374u2vzkITyMhQaCo7Yy3xnc9FFGPWdopswkOaYnn9VZ4d2c7GVf4s0fg55M0qzk5+Ka9ik9epQPtPgw3U6r0XnvFr0zgpX26Kz+QHSbQIYbuXPn/suKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB6570.namprd11.prod.outlook.com (2603:10b6:303:1e3::6)
 by DS4PR11MB857251.namprd11.prod.outlook.com (2603:10b6:8:503::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 12 Nov
 2026 09:21:08 +0000
Received: from MW4PR11MB6570.namprd11.prod.outlook.com
 ([fe80::63e8:6dc8:402b:36d1]) by MW4PR11MB6570.namprd11.prod.outlook.com
 ([fe80::63e8:6dc8:402b:36d1%6]) with mapi id 15.21.0615.007; Thu, 12 Nov 2026
 09:21:08 +0000
From: "Kahola, Mika" <mika.kahola@intel.com>
To: "B S, Karthik" <karthik.b.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] tests/intel/kms_joiner: Continue after unsupported
 eDP pair
Thread-Topic: [PATCH i-g-t] tests/intel/kms_joiner: Continue after unsupported
 eDP pair
Thread-Index: AQHdbdKWgZZwD0YBu0Oc0h2ovQXqdLcocC2AgAG9SXA=
Date: Thu, 12 Nov 2026 09:21:08 +0000
Message-ID: <MW4PR11MB65705EE88B396119F8A94763EF702@MW4PR11MB6570.namprd11.prod.outlook.com>
References: <20261106093819.2897358-1-mika.kahola@intel.com>
 <295f9446-9602-4a5e-b4a6-d9243cea2c89@intel.com>
In-Reply-To: <295f9446-9602-4a5e-b4a6-d9243cea2c89@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB6570:EE_|DS4PR11MB857251:EE_
x-ms-office365-filtering-correlation-id: fc427335-e4dd-4e69-2fb7-08df409e48fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|38070700021|10067099003|4143699003|11063799006|56012099006|261022105027099003|261028144727099003|261026140227099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003|3023799007;
x-microsoft-antispam-message-info: yVipWgpcgYvIs9oDiwKIMYo5DbF+DV3wyP/Y+DjNKU5NTi6JizC7IDpLsrNQibu/OuXGbmExcKbAO1L2tmBk8NaqBp74bgfDdBkGeM8uSEtPE08Ml9Le+imb6wdI2KcDoHgSwVbmP54cX8Hg79Nwl/VFXNwrfOPNPo5R1Z98DjxqNBOVyU+mlvHc/9dNG6jXJSsMegUjyLuiMTHcmIu54N1DCD2gcQ2PAu30HoCVYr2Xs5iOjKEMFVHstzLxHsSYlYDqhTigfHNy+6BDUZWa3DItBoWKRVeOc6SHlahRaT6iWWBrAZJr5hxU+GCFIJ1gWhU31ml+CRLouKbfSlBgc7iXCcJbDbDCDOCg1Yq3V6ohuuePj10vessf3bYoVgFmQbh6Zsd41NLGLDjgbEq5sro4ozgQWZ5OxHQW0qlJYAreGwI0tIQXvxw3VKY3yw5UAHawUJ3ESepLEvmP6L4Qrw+GZgjRAvcTnq7ERlr10klNqRXh1k03097Lj+0fbor9yfgUAzFNqymt8za07TQ0KLfQAsdhsFHIoR/mabgiAgFUppKAhsorMF3590/c9mwYaj2KrBwB3jKuqpXG9ItD9/TH5XTNjRnTvzbp9/i+0QoyU6LaPHAu5XPM4GT+rrZxi0eNYGf6BEEEFj4DBQkEHKU/d03X/dtE65E7mEOCp+IcopBN9VgymJViF6XzzBd6+r+7TNzKnd7eII+Z885Ph3zCQFslCbmVABTFXGKbapk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6570.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(38070700021)(10067099003)(4143699003)(11063799006)(56012099006)(261022105027099003)(261028144727099003)(261026140227099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z01pR2xCRGFnWXBVSkt5cVJSc0dXV0t2djNaa1Roakk1VEhLYTllckw0QzIy?=
 =?utf-8?B?U2IzMTlmU21tQnhTZjBZZEhldVJIdU5weUZPVzVpR0xZU2JIWmlHdmh4M3FL?=
 =?utf-8?B?dHhqVXJaQW0wTTMyM2YyYVB6ayt6QnNrc0tmSjN1M0VKd3JmMXRyazdEQjZ1?=
 =?utf-8?B?RGlTN0szVDErSmJwSHRUKzFRZXk4emRUTE5oOFRacFk4N2NwVVpDQW1ZNEZ2?=
 =?utf-8?B?Y0xwbUVackI2Q1NGWTBBVk5xcE1wSjBOZlRhSENPUGlsMXJ2NjhaeVBTTEVj?=
 =?utf-8?B?SVNWNi90ZTVqUTRUNTcvRlErOVJDR1Z0Z2V3azd6WW1NUjl6cE9TVWFWK1M3?=
 =?utf-8?B?NFRONFJiRnFacFR0ajJvUjhjZndRMHpaTWh0Wnl0MERIajIyRXJvbmJuZXYx?=
 =?utf-8?B?bjduR1BUVEp2SzZaR2g5WW4rL2l3Z0dYKys3U1RJc1hybXpyVlVFMTdwNzZr?=
 =?utf-8?B?cm5HOUFGa0RmblRZU1YyaGMyRVFBYlpIUTk5aFhDbklpUGNhWFQySXRUbi9L?=
 =?utf-8?B?OGJkbGMwWjhxT2hGTW5YUWZHY09qTWVYUXRsRTVJUjNTZjdKWUV4c05lZnB6?=
 =?utf-8?B?WU4wL1JqUlBCd2FvbWl3eC9JRGJhajlkNGlRRk5SUDhORDVqVFZSZ21pR1py?=
 =?utf-8?B?MkFXK3lKNkJqSGtqaW9YbUYrZ1BkdTQ1NWVLV2hFME4ycXhsczlzZ3BsVlZw?=
 =?utf-8?B?aVJQN3RodWk1S2FXL1FFejlZQlUvRFRWYUlxSElPUCtJOFVqQmRwUTMzQyty?=
 =?utf-8?B?STdid1Y5SUtWUzBVMmQvQlJmYStYM3VhRDZDVnlJN2hyWXdlSVlvK25pMC9j?=
 =?utf-8?B?ODlDTk4zeFRpTGF0dHJaaDZObHNaai9xUkRBV0g0TVZXc1FaM3MzUE5PYitU?=
 =?utf-8?B?dnh6bjVSN3VsUytvYUJpcXBvY1JwMGhYODM0WThwdW9oNXJva1hkWGRsWThO?=
 =?utf-8?B?Y1NRQmlxNHdBYUN5aHFMd0RuMy8xajQyeG9ZVjhYc2tuYkkwSkppdXFGNzRC?=
 =?utf-8?B?THd2dWU1SndSaDR1RXhaNkJ6Snhic1Bad1ovZFBpYW44SDlVaWU1K0FwYkVJ?=
 =?utf-8?B?WGhLUXJxdjNrRHptWVpDd2FwWlFSWEVhWVAxem5TcnJobWpyRHNuNTJwZk1N?=
 =?utf-8?B?VURWV2pKekx3NFlTMGc2Y2h2cDNySXQrckU2dkxIaDFhMXI2bXVVOFM3SEI4?=
 =?utf-8?B?Q1djdVBtQmgyMUNSU29odVczeVhkQVJPeXc1N1lObGEzQ1hkajJZSDdLY215?=
 =?utf-8?B?cVhSajBKM1RKRE9uVE8zdnhHM01oNEtGSzRPVHh1R2gxTEFySlVaTlUwUHQv?=
 =?utf-8?B?eWw5ZVpHZTJIM255cnAwU0IycFArWnNjendDZUNrQ1EzcFZ4NlVhQkJ0Y0Vm?=
 =?utf-8?B?eldjMW56L3h4SXlHcFJLVnFiK2hHamNRR1lBdjVVSmZNTWNheWlET2JTWno3?=
 =?utf-8?B?VmdZRnpXNS9ic3VoakMzNXUwQVBoRFhkL1lmem1wK3kyamNzbUJPMGxicWd4?=
 =?utf-8?B?NGJVWVNRdDdpUjBDVWs4VG5ONGVMdk9TUW90c1NxR3hIeHI0RDV1a1JldFM2?=
 =?utf-8?B?U1pFR1NSZDZBT3Bmc1FVMi9sSzU2Q21oL1Q1UHAybGl6SUhOWUVjdTlEQ0dS?=
 =?utf-8?B?emxWMkZ3bzUzdzRNZDB0NUE2YjJHa0ZsQlNtQXBRc0J6RlhVM0V4ZUh4SENl?=
 =?utf-8?B?UVZXSGhzOHRLckZzS05hdnVpKzhOSjdzVVNwLy9GVVgzMXc4Vk1nK1dJRzc4?=
 =?utf-8?B?M3FITzlHdHpoK1ZLVU05bEM0SlEwVlIzT2JYODdOMGhGU2xBYVdmbitsMkwz?=
 =?utf-8?B?V280V2thWlo3YXRqRTBySkx1aUdTNWVrQWV4ckpyZjFkQjlCZlErYXkrRWsr?=
 =?utf-8?B?TGhzclYyUVBOamRKeGlYR2lQbUJjSHVEekFDWFpYTkJ4UUhsaEQ5eFB1UUxE?=
 =?utf-8?B?MHRILzZ4dzFhb2hFQTdSUmQ0WXp5RWM3aEgwYUNWOCs3UFg4S1JFUTVXTHl0?=
 =?utf-8?B?emhMeEpXRnlFTEhGSjhWTXhNN3dLZVNFR21aU1ZuUWNGbE5WaTR1WjZCMzBh?=
 =?utf-8?B?bU9kSWFxeFBuNUgzQnNzUm9jNG0vOTBwT05TdTZCTmV1R3U1UHNSU0dvT3Q3?=
 =?utf-8?B?eTJKUlBXMDllOGlGb21TaHlFVG5xZ3VsQTdTeURseE03bkVpamQ3YmVZdTYw?=
 =?utf-8?B?a0pxbzRkWnZ6UkJRUzRlNERLanA3NHk5MFMzd0tGRVJPazkvZzhxSUQzRk5w?=
 =?utf-8?B?NkYydVdTU0dKZldWcmtrS0JNM2N6eHVlYUZqNjRBMVdvTUJlVU9JdWRVY0tz?=
 =?utf-8?B?OW1ZelJDUExLcVFYajkyaVBKaFlHUkxWRUc3a2NWdUpGekFvMnZVZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Wiq86eAgnQNgw/KTRqhEfkoIgs/YpEHbZVLUiUmPA3b2MI76sK1zWS5KX2/rUu0wH79PnDacdeTMX1q/CJkWT+Cn5Dg+bNgRWqlPQ71nodQP8s7PYHNbfXrFPSwEqysTo72n4tJ7m5CxULGAhuTZ5OgZaqW/QC/ufdnH8Xo7iCCwVcy/Noy8Bk4XYzsHrT6pxulKPk8G4SUYYdyzdzIww/B52UJihn7bRG9FTueRzPmxn82sk1eUr9p0Yjd1+PqL1DaXk0BlM9lesQ1wszIc1iq/jQ+WIeTesa1mgWK7IHGe2/qbrP/vXqaMwnvclxkU2Ah++S02/1ntmTs++9US0A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6570.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc427335-e4dd-4e69-2fb7-08df409e48fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2026 09:21:08.3153 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ++Pd036IVPD8rY3/le2czTVOg65R+caRWObHenmd3cUkml/5RsCcz9AfJs88OTEFKbibbhaXs0fgU/mIBe/01g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB857251
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCIFMsIEthcnRoaWsgPGthcnRo
aWsuYi5zQGludGVsLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCAxMSBOb3ZlbWJlciAyMDI2IDgu
MjkNCj4gVG86IEthaG9sYSwgTWlrYSA8bWlrYS5rYWhvbGFAaW50ZWwuY29tPjsgaWd0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCBpLWctdF0gdGVzdHMv
aW50ZWwva21zX2pvaW5lcjogQ29udGludWUgYWZ0ZXIgdW5zdXBwb3J0ZWQgZURQIHBhaXINCj4g
DQo+IEhpIE1pa2EsDQo+IA0KPiBPbiAwNi0xMS0yMDI2IDE1OjA4LCBNaWthIEthaG9sYSB3cm90
ZToNCj4gPiBDb250aW51ZSB0ZXN0aW5nIGFmdGVyIHRoZSBrZXJuZWwgcmVqZWN0cyBhbiBlRFAg
am9pbmVyIHBpcGUgcGFpci4NCj4gSU1ITywgd2UgY291bGQgYWRkIGEgbGl0dGxlIGNvbnRleHQg
YXMgdG8gd2hlcmUgdGhpcyBpcyBjaGFuZ2UgaXMgY29taW5nDQo+IGZyb20uDQo+ID4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBNaWthIEthaG9sYSA8bWlrYS5rYWhvbGFAaW50ZWwuY29tPg0KPiA+IC0t
LQ0KPiA+ICAgdGVzdHMvaW50ZWwva21zX2pvaW5lci5jIHwgMjIgKysrKysrKysrKysrKysrKysr
KystLQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwva21zX2pvaW5lci5jIGIvdGVz
dHMvaW50ZWwva21zX2pvaW5lci5jDQo+ID4gaW5kZXggZmNlMjRmMmJkLi45MjRmZDBmMWQgMTAw
NjQ0DQo+ID4gLS0tIGEvdGVzdHMvaW50ZWwva21zX2pvaW5lci5jDQo+ID4gKysrIGIvdGVzdHMv
aW50ZWwva21zX2pvaW5lci5jDQo+ID4gQEAgLTI3Nyw3ICsyNzcsNyBAQCBzdGF0aWMgdm9pZCBz
d2l0Y2hfbW9kZXNldF91bHRyYV9qb2luZXJfYmlnX2pvaW5lcihkYXRhX3QgKmRhdGEsIGlndF9v
dXRwdXRfdCAqbw0KPiA+DQo+ID4gICBzdGF0aWMgdm9pZCB0ZXN0X3NpbmdsZV9qb2luZXIoZGF0
YV90ICpkYXRhLCBpbnQgb3V0cHV0X2NvdW50LCBib29sIGZvcmNlX2pvaW5lcikNCj4gPiAgIHsN
Cj4gPiAtCWludCBpOw0KPiA+ICsJaW50IGksIHJldDsNCj4gPiAgIAllbnVtIGhhcmR3YXJlX3Bp
cGUgcGlwZSwgbWFzdGVyX3BpcGU7DQo+ID4gICAJdWludDMyX3QgYXZhaWxhYmxlX3BpcGVfbWFz
ayA9IEJJVChkYXRhLT5uX3BpcGVzKSAtIDE7DQo+ID4gICAJaWd0X291dHB1dF90ICpvdXRwdXQ7
DQo+ID4gQEAgLTMwMSw3ICszMDEsMjUgQEAgc3RhdGljIHZvaWQgdGVzdF9zaW5nbGVfam9pbmVy
KGRhdGFfdCAqZGF0YSwgaW50IG91dHB1dF9jb3VudCwgYm9vbCBmb3JjZV9qb2luZXINCj4gPiAg
IAkJCWlndF9jcmVhdGVfcGF0dGVybl9mYihkYXRhLT5kcm1fZmQsIG1vZGUtPmhkaXNwbGF5LCBt
b2RlLT52ZGlzcGxheSwgRFJNX0ZPUk1BVF9YUkdCODg4OCwNCj4gPiAgIAkJCQkJICAgICAgRFJN
X0ZPUk1BVF9NT0RfTElORUFSLCAmZmIpOw0KPiA+ICAgCQkJaWd0X3BsYW5lX3NldF9mYihwcmlt
YXJ5LCAmZmIpOw0KPiA+IC0JCQlpZ3RfZGlzcGxheV9jb21taXQyKCZkYXRhLT5kaXNwbGF5LCBD
T01NSVRfQVRPTUlDKTsNCj4gPiArCQkJaWYgKGZvcmNlX2pvaW5lciAmJg0KPiA+ICsJCQkgICAg
b3V0cHV0LT5jb25maWcuY29ubmVjdG9yLT5jb25uZWN0b3JfdHlwZSA9PSBEUk1fTU9ERV9DT05O
RUNUT1JfZURQKSB7DQo+ID4gKwkJCQlyZXQgPSBpZ3RfZGlzcGxheV90cnlfY29tbWl0MigmZGF0
YS0+ZGlzcGxheSwgQ09NTUlUX0FUT01JQyk7DQo+ID4gKwkJCQlpZiAocmV0ID09IC1FSU5WQUwp
IHsNCj4gDQo+IFdlIG5lZWQgdG8gZW5jb2RlIHRoZSBmdWxsIHJlc3RyaWN0aW9uIHRoYXQgaXRz
IGFsbG93ZWQgb25seSBvbiBQaXBlQQ0KPiBoZXJlIHJhdGhlciB0aGFuIGp1c3QgYSBibGFua2V0
IHNraXAgb24gYWxsIHBpcGVzIGluY2x1ZGluZyBBL0INCj4gY29tYmluYXRpb24/IE1heSBiZSBp
bnN0ZWFkIG9mIHRoaXMgSSB3b3VsZCBzdWdnZXN0IGV2ZW4ganVzdCBza2lwcGluZw0KPiBvdGhl
ciBwaXBlcyBpZiBvdXRwdXQgaXMgZURQLg0KDQpJdCB0dXJuZWQgb3V0IHRoYXQgUFRMKyBwbGF0
Zm9ybSB0aGUgQStCIHBpcGUgcGFpciBpcyBzdXBwb3J0ZWQgaWYgdHJhbnNjb2RlciBBIGlzIGlu
IHVzZS4gSW4gY2FzZSBvZiB0cmFuc2NvZGVyIEIgdGhlIHBpcGUgcGFpcnMgQitDIGlzIGFsc28g
c3VwcG9ydGVkLg0KDQpUaGUgaWRlYSBvZiBhZGRpbmcgdGhpcyBjaGVjayB3YXMgdG8gY2hlY2sg
aWYga2VybmVsIHN1cHBvcnRzIHRoZSByZXF1ZXN0ZWQgcGlwZSBjb21iaW5hdGlvbiBhbmQgaWYg
bm90LCB3ZSBza2lwIGluc3RlYWQgb2YgYSBmYWlsdXJlIHdoaWNoIGluIHRoaXMgY2FzZSB3b3Vs
ZCBiZSBmYWxzZSBwb3NpdGl2ZS4gVGhlIElHVCB0ZXN0IGl0c2VsZiBpcyBhIGJsYWNrIGJveCB0
ZXN0aW5nIGluIG5hdHVyZSBhbmQgaXQgc2hvdWxkIHRyeSBhbGwgY29tYmluYXRpb25zIHJhdGhl
ciB0aGFuIGxpbWl0aW5nIHRoZSB0ZXN0IGNhc2VzLg0KDQpZb3UncmUgcmlnaHQgdGhhdCB0aGlz
IHdvdWxkIGJlIG5lZWRlZCBmb3Igb3RoZXIgY2FzZXMgdGhhdCBqdXN0IGVEUC4NCg0KVGhhbmtz
IGZvciB0aGUgcmV2aWV3IQ0KDQotTWlrYS0NCg0KPiANCj4gQWxzbyBUaGlzIGNoZWNrIHdvdWxk
IGJlIG5lZWRlZCBmb3Igb3RoZXIgY2FzZXMgd2l0aCBlRFAgYXMgd2VsbCwgc28NCj4gdGhpcyBj
aGVjayBjb3VsZCBiZSBhZGRlZCBtYXkgYmUgc29tZXdoZXJlIGluIHRoZSBzZXR1cF9waXBlIG9y
IGFueQ0KPiBvdGhlciBpbml0aWFsIHNldHVwIGZ1bmN0aW9ucz8NCj4gDQo+IFJlZ2FyZHMsDQo+
IEthcnRoaWsuQi5TDQo+ID4gKwkJCQkJaWd0X2luZm8oIktlcm5lbCByZWplY3RlZCBlRFAgZm9y
Y2Ugam9pbmVyIG9uIHBpcGUgcGFpciAlcy8lczsgY29udGludWluZ1xuIiwNCj4gPiArCQkJCQkJ
IGttc3Rlc3RfcGlwZV9uYW1lKHBpcGUpLA0KPiA+ICsJCQkJCQkga21zdGVzdF9waXBlX25hbWUo
cGlwZSArIDEpKTsNCj4gPiArCQkJCQlpZ3RfZGlzcGxheV9yZXNldCgmZGF0YS0+ZGlzcGxheSk7
DQo+ID4gKwkJCQkJaWd0X3BsYW5lX3NldF9mYihwcmltYXJ5LCBOVUxMKTsNCj4gPiArCQkJCQlp
Z3RfcmVtb3ZlX2ZiKGRhdGEtPmRybV9mZCwgJmZiKTsNCj4gPiArCQkJCQljb250aW51ZTsNCj4g
PiArCQkJCX0NCj4gPiArCQkJCWlndF9hc3NlcnRfZihyZXQgPT0gMCwNCj4gPiArCQkJCQkgICAg
ICJlRFAgZm9yY2Ugam9pbmVyIG1vZGVzZXQgZmFpbGVkIG9uIHBpcGUgcGFpciAlcy8lczogJWRc
biIsDQo+ID4gKwkJCQkJICAgICBrbXN0ZXN0X3BpcGVfbmFtZShwaXBlKSwNCj4gPiArCQkJCQkg
ICAgIGttc3Rlc3RfcGlwZV9uYW1lKHBpcGUgKyAxKSwgcmV0KTsNCj4gPiArCQkJfSBlbHNlIHsN
Cj4gPiArCQkJCWlndF9kaXNwbGF5X2NvbW1pdDIoJmRhdGEtPmRpc3BsYXksIENPTU1JVF9BVE9N
SUMpOw0KPiA+ICsJCQl9DQo+ID4gICAJCQlpZ3RfZGlzcGxheV9yZXNldCgmZGF0YS0+ZGlzcGxh
eSk7DQo+ID4gICAJCQlpZ3RfcGxhbmVfc2V0X2ZiKHByaW1hcnksIE5VTEwpOw0KPiA+ICAgCQkJ
aWd0X3JlbW92ZV9mYihkYXRhLT5kcm1fZmQsICZmYik7DQo=
