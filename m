Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 649DFC98306
	for <igt-dev@archiver.kernel.org>; Fri, 25 Sep 2026 06:52:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06C5010EA01;
	Fri, 25 Sep 2026 06:52:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qp4eQOi6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4155910E586
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Sep 2026 06:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790319088; x=1821855088;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=IxypUFAXVhzgNAK+9OrpFOF0fR4xoFCiIcBuoTse3lU=;
 b=Qp4eQOi6aKfKA2BHICFh2+Ibbz8dMIPXSflvNhnpBYQGqj9yxxK/NYfC
 TwktupUG7QAB60Rkh3LaiVDQ7WZoj7dpAf3WgEfgiCRaIvtDt0CwL57vc
 5gChtrRjnaoUCTBb2xm3dlLcexByJWGfGNmiIZGKvgHCIRZQiLCdtYWbf
 tMhGHevk+dyF7zv+NouJ6dba78fzqHETaBHhpU9voi2plDPAMS3mi7wTy
 O/ynNsru/mN0QccQ7ApzhQfQGvxnTc+48vHxyosqFnAZOJWXHcKW449al
 05da3i8FCP2Tx1PX31yavI74lgC0Uza6J3bCnombrKMLGXMpaeSFYXyh3 Q==;
X-CSE-ConnectionGUID: r58snlarTQ2On4bDNSB5EQ==
X-CSE-MsgGUID: C9Gf1rMeTZCAdGsqHqOmqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="91205315"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="91205315"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 23:50:58 -0700
X-CSE-ConnectionGUID: NeF5Vg4DQ5CXoAouR7KQJw==
X-CSE-MsgGUID: 6rXytYywQPOsPrDJOUE6iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="303760257"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 23:50:58 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 23:50:58 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 24 Sep 2026 23:50:58 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.53) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 23:50:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Km6HmU0rq+cr5qlSWwRHR4jL4I+CaemkojyGrJ9MEo0IV09U8D2sHLIFljjZOxTQAHDN6cf3PeskJqqhsSRJeXPO7UhMhXPkC50ZkUVOsDiZFHXEazLfpIsqx2cx6lEkFGdExmUaxVcUcM4ahHVlqb5TiecJdd1u2rKzznEqSjHDJ6wqszFKnYvaSmd45zn7IO00A5z/QIyZjbAG5qcywsJSAuUi2FDrQtV8o9QgUeLHW1ZcLVrG+gmhyl7ukK1pctZKnFXjac9eCjtohsStpEu939H1cIiI95fw8y1gChzvdW4eMZiSfhbkYKK4dCp2n0vIapk90oQDpQ33MmQgkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IxypUFAXVhzgNAK+9OrpFOF0fR4xoFCiIcBuoTse3lU=;
 b=dtCyygjWRq5mqfhK/P6ouf08UCqgs8dv8zXglKkj3Ez0pXniR1ryJhCU7qn1RImCXYXl1YNBcu8UblcXEIqPNKli9NdVioHh5WJJQhtz0NpKeHZ20P9dMhErXTkK9YIPBEKPeR5DK6o31nryACJyXAXgkn6oGg0JJ0tTp7m9MSw1cA5xN1EWrlfUjzz9RBdDasmJ2KKQ+evr3rfhtujNc90t3+eezMCoG2XdrDDW3N0YqIuBxD2TTYJXrz9OpOndpcHbJ4AMkZX9ai1716uV/DTh4RiAVrcv7xn3KzPtEnSBA1ycKv2/el1ZaHrQaG8UxHqNqGP9uyDlZDnlb/GiUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9013.namprd11.prod.outlook.com (2603:10b6:208:57c::9)
 by SJ2PR11MB7715.namprd11.prod.outlook.com (2603:10b6:a03:4f4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 06:50:56 +0000
Received: from IA3PR11MB9013.namprd11.prod.outlook.com
 ([fe80::218c:773:922e:7d82]) by IA3PR11MB9013.namprd11.prod.outlook.com
 ([fe80::218c:773:922e:7d82%5]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 06:50:55 +0000
From: "Gandi, Ramadevi" <ramadevi.gandi@intel.com>
To: "Patil, Shivtej Eknath" <shivtej.eknath.patil@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Konieczny,
 Kamil" <kamil.konieczny@intel.com>, "Sharma, Nishit"
 <nishit.sharma@intel.com>, "Balasubramanyam, Smitha"
 <smitha.balasubramanyam@intel.com>
Subject: RE: [PATCH v4] intel-ci: blocklist multi-queue tests on BMG, LNL, PTL
 and WCL
Thread-Topic: [PATCH v4] intel-ci: blocklist multi-queue tests on BMG, LNL,
 PTL and WCL
Thread-Index: AQHdTLY7/ffo7FbEckyUpDwvGx7SArbe2uZQ
Date: Fri, 25 Sep 2026 06:50:55 +0000
Message-ID: <IA3PR11MB901306E4A9696BFDF3F01D9685802@IA3PR11MB9013.namprd11.prod.outlook.com>
References: <20260925062206.13700-1-shivtej.eknath.patil@intel.com>
In-Reply-To: <20260925062206.13700-1-shivtej.eknath.patil@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9013:EE_|SJ2PR11MB7715:EE_
x-ms-office365-filtering-correlation-id: 770f4318-ed9d-4a20-220c-08df1ad15906
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|10067099003|56012099006|11063799006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: fKGTNYq20YSoTqhqSaz2isFm8O8WnZ8bATDnvsofc7bjIi0AjSiCVLEfTp0RPwOV2wDrxlgaTEz7sAilV4ZGd7iqHafAwq7F5xA9AqPBPVY/0vJaMAsB/zV5i9goZAlupDAGMpn5nQTgvwPYyG4c6dej9oUAYaez22iMKuXfkhtrwC0WMdK5II0quAWhX9ZNAGKAvT3+aMvsudkyoQCKRRAXfAZp5x/YQFsJy01/YCh7CGv+w3ziKJakxRWCFyCxSBx/Lvd8GDi90eRIvKId1Fatuqccb03iF1J/ndkVeSTNKK0xzSMwOeVGV8smEssAXs3z+1W/SEipMx4LNeVVWXLCreGl7CGHe74jhEVqBsnQDflVqJhjGlTySr3c8GD3NhHmNIuIZwtocoLnN4T605yRn5Z3hljeQKEF81qjffUbIwLhE494Da7+0W0wZV4wDjoFkvvLunN5AkwbxuGh/DGC2XK5OO6Xb8IppVR349gW3dMc5fsIy/EK/XwJfy5MLTTNBrLPkfpVK7w5RVn+OquEUBgyDZ96sN6X1WmXT7Uo3T4fW6QjglPHwpGxM9wgeNbn1SnJJ6cDgPBENnVMLHobYcirkvYVyt9h1LzPhXzlZPM8x/CxuPQvDS42t/arRbI748NgaPyfpNzSl0sr4R3wct5H7jkRPJanJwIQiVhXiPwP3bZ1/Y+HZ0dvs09IHgoKAqLZ30p3IN5Weu+Q/j3oEgDNUdWOFprxpQGJlPw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9013.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S0VoQnNIdEdKbUdjejU5RXJ6WTVOSkZjZXlrbUViNStpbVM3emFwRExPVTJz?=
 =?utf-8?B?eGZTVlBoNzE5UHZmcVdRbDJRdUN5SENLV2RFblE2TlVlbUFsNGt2cUVCWXBI?=
 =?utf-8?B?aE1sV25mM2JYTEFBa242R0h3UFNJTlhQSnZVRGRLYXZjdXZRUXpSMG14WHZa?=
 =?utf-8?B?N2JsVVRlcnlZTk9hUkZPWS9wTEdNZ1kyTGJSQWs4SlQzSHdNb090WmNFWjU2?=
 =?utf-8?B?QlRSdFI0ays3S3h0Z0h6d01LM1gyWU5lUGgrQnUxUGZ4OUkxV1VsY1c5THdm?=
 =?utf-8?B?NDlKVGlYT2IxazBtbVA1TmcvSkFpc1Q2Qm5aRnNlcDYxWUc4N3N2Mkc4YWtp?=
 =?utf-8?B?QTVoS25xdnhmTlkzQWoyeXVveDN5bTRUeVJlY1pKUlpIWStqVWNrNDVpWmhw?=
 =?utf-8?B?TGJmVkVQeXlhTUhmZG9qeE9BaFpCOUFUdFBvNHIxSUdFY1A4eXR5WW1zL3I4?=
 =?utf-8?B?a0xaODBXTXdnSGlwQjZBV1IzQnJPRDY4SWFjaUpJN0V0TWVyMk94Ni9pVGJh?=
 =?utf-8?B?NGZ1Skd4MC9EV0VKRk9HZHdZN2FQTmVuLytmM0FYdWNEcEo5ZVJNRDhBYlF4?=
 =?utf-8?B?U1pwY1dmNWNwUVQ4ZXl0R2lnbjc1VzUycmFQWUY3R2NTSC9xS0pQN3Q2cTRH?=
 =?utf-8?B?SUpSMjI0dU8yeHhOdFNEZTdSZGZxQUNhU3lSYitGZVhNU3FCeVdkWHVWbFRl?=
 =?utf-8?B?OUI3Y1B6NHhPVzVzRlR1QmdoQ3VWU1Q0YjdMWU9aMEVQYSs0cnZlVlUycndR?=
 =?utf-8?B?SnBDTkl2TXg5ejUrb3ZId2orczVZbXZWNnRpWnNHOFJhdW1oazg3UDY0SmVC?=
 =?utf-8?B?SVRranNjWENUOUpBd0tGQmNJbzhWZlI4aE5rU2gyWXZINHR3Z2ErOUx0WWNq?=
 =?utf-8?B?Wmo1bUZBWVJDanVuS2VWZ2RSTFhWS0pSbkZFRzNWNW82L1N5a1pqQ2NNajIx?=
 =?utf-8?B?K2xFcVcyRDZ6a3ZsVy9oUkQ4K1FYYVBNZno4QkFUVUhtMVZ4MVJKOHZ5bkhH?=
 =?utf-8?B?c2Z6MFd1ZmFEQkN1a0twMWttK3BHR0dpTkYvbkZ2eGNURFJ2L1BZT0tqOEhK?=
 =?utf-8?B?S2pLVEtLUDJhVjUrbE83dDZkSDdSUVdUSUNORGRBczl3VWw2aW1KenFlRy9Z?=
 =?utf-8?B?UTd6TWxlQ1ozc3Ayd054YmtIdWRhTHF0cHBZQXZaVmU1QXZUL1lJQ1RIMFpt?=
 =?utf-8?B?Tk5nSDg0ZXhyTEJvWG4wemdGbXF2WHZEc2k4aExNME83dFl6YXZZQVllVU9Z?=
 =?utf-8?B?eUkyMXZwQVM5QytlNjFpK3Q5NzFHeGpOb1RJTG42WGlINjd2T3dpQnRQVU1V?=
 =?utf-8?B?ZnJzbTh6Nm9oM0U1ZHp3aEQzY1c2OXFac1ZWUllnNHRIWmZ6K1l1ZmkyeDVE?=
 =?utf-8?B?Y2FYSDFyMnBhWU9WVEc4L2RlaWxzVmwxeGltS2JYTlZpcWl2N2M2MWxOV1BT?=
 =?utf-8?B?R0R6U0ZvaEFlcW9nOTRwWld0OXczZ0pXaFRuOXR5NTg5WU1VcnR6UUJpK2Ez?=
 =?utf-8?B?TUtFUVNtR2xZUHJTWUVQZm1uVlhpMlhCZzI3WFlJRFRUeUZPWURjaVFBWTZB?=
 =?utf-8?B?OGFxbXVNbmdMOVIzUnVPell5ZGZHUkpDMHJONXJDWktDY1p0dzh1cDFvT2k4?=
 =?utf-8?B?UThOc2ZPUCtzb0tsaEhBRFVzZUJ0VmZCbFZlTFdKOFZMTXRYa2FvZjhpdXVX?=
 =?utf-8?B?UTJZbXAxWnhDUmxJK0FkL2duL29JMElkYjBVdzhxaWRBZHRoZW9rQ0ZLRTQ4?=
 =?utf-8?B?eTBoSHAwU1gzT0dZdldFeEFzcGRxRnJ0NmF4L1pSaEFkN3cxb0ZuNTVFUlpP?=
 =?utf-8?B?dnF5Y1M3M0lFZHl4U2lCUUE5WWZBZkl2S1dCZVFnQUtzUFV1ODlXWkNkcVFV?=
 =?utf-8?B?OVVINTgxc0QrRS9RQThIZ1NwMGM1MC9ROUxhdUxvRzhnOHlESG84aytOcjFh?=
 =?utf-8?B?YWJicDBWZUlSV3gwbEV1U2k2VEJ3L0J5Y3dNZzkrVUkwRVQ0ZTBmTmRYQTEx?=
 =?utf-8?B?Q0ZCaUdYZlovMU9zckdHZSsveEVhWDR5ZzE5VnZ2a0V5bktjbHlCY2xxV0Fi?=
 =?utf-8?B?S3U5NXRldjI0Z0dWQlBnNGdnOGpyUnh0a3FRalVCR3NDcnBjKzMvRTFSWmhV?=
 =?utf-8?B?MmJycTU0SHQxVjBCL21nOEZCaDVwbmVoMStBM3E2cFhUY0JCam5jSUVPOGgr?=
 =?utf-8?B?N1hVdE94R3M1b0ZBbHJyMFZrUVpyeU9kVW1kc3Zkc2Nwb3lsUzVteEdOdFgz?=
 =?utf-8?B?dVBMaSs4UCtyMU5URVJSVlpYeTVJaHRER1NKaElUOGNJZFc5WUMrM2tZY3RF?=
 =?utf-8?B?enJZSE9rdjY4M1JnQ0x3QkQzWGp5bXF4bUdTNUo4NGd3T2d5QXNoZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: OVGoTRlSVYdUWBVrvJabWE4nAbc/8gm2rYAPturoToNAZqTPmwnWP+8TyGqRQkYCV/+o4st1nESIzUHiL9SwPMD07kKbM/EuZQfE+Yyi3sicBqGPMd23k3pVuATzRqyuXM192CErbQoZItLmvBGCu/+sKA5nBaW+COqoP+y+dJ/LO5ImLg1rleWujpWmmUv5KQPXl60Vo3qPw1Ep56GIBjbNkvY4JhANWwuRjQ0+bA+521DLNUiQoNWoNkMRMEizi6Ok43DqM1xciWOaTKPu0ZHyxKhp/rgIDMSbNYTcA7nRConwOU+15uzZ+nfReH25CwxGWEWBJQfkFwqibeVSMA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9013.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 770f4318-ed9d-4a20-220c-08df1ad15906
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2026 06:50:55.3435 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MJ7p8h3eNea64PvLjCUmHnPglw3Z0aFMPCFsfG7qdK9EfhxM8IvDHjSq1Ft9V+5NMdSaTdevvYjcJ3ekxdGyPguaFo3oD0Hjwurr4mFcd60=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7715
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

TEdUTS4NClJldmlld2VkLWJ5OiBHYW5kaSBSYW1hZGV2aSA8cmFtYWRldmkuZ2FuZGlAaW50ZWwu
Y29tPg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFBhdGlsLCBTaGl2
dGVqIEVrbmF0aCA8c2hpdnRlai5la25hdGgucGF0aWxAaW50ZWwuY29tPg0KPiBTZW50OiBGcmlk
YXksIFNlcHRlbWJlciAyNSwgMjAyNiAxMTo1MiBBTQ0KPiBUbzogaWd0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmc7IEtvbmllY3pueSwgS2FtaWwNCj4gPGthbWlsLmtvbmllY3pueUBpbnRlbC5j
b20+OyBTaGFybWEsIE5pc2hpdCA8bmlzaGl0LnNoYXJtYUBpbnRlbC5jb20+Ow0KPiBCYWxhc3Vi
cmFtYW55YW0sIFNtaXRoYSA8c21pdGhhLmJhbGFzdWJyYW1hbnlhbUBpbnRlbC5jb20+OyBHYW5k
aSwNCj4gUmFtYWRldmkgPHJhbWFkZXZpLmdhbmRpQGludGVsLmNvbT4NCj4gQ2M6IFBhdGlsLCBT
aGl2dGVqIEVrbmF0aCA8c2hpdnRlai5la25hdGgucGF0aWxAaW50ZWwuY29tPg0KPiBTdWJqZWN0
OiBbUEFUQ0ggdjRdIGludGVsLWNpOiBibG9ja2xpc3QgbXVsdGktcXVldWUgdGVzdHMgb24gQk1H
LCBMTkwsIFBUTCBhbmQNCj4gV0NMDQo+IA0KPiBGcm9tOiBTaGl2dGVqIFBhdGlsIDxzaGl2dGVq
LmVrbmF0aC5wYXRpbEBpbnRlbC5jb20+DQo+IA0KPiBUaGUgbXVsdGktcXVldWUgc3VidGVzdHMg
cmVxdWlyZSB4ZV9oYXNfbXVsdGlfcXVldWVfZW5naW5lKGZkKS4NCj4gDQo+IE9uIEJNRywgTE5M
LCBQVEwgYW5kIFdDTCBwbGF0Zm9ybXMgdGhlc2UgdGVzdHMgYXJlIGV4cGVjdGVkIHRvIHNraXAg
YmVjYXVzZQ0KPiBtdWx0aS1xdWV1ZSBlbmdpbmUgc3VwcG9ydCBpcyBub3QgYXZhaWxhYmxlLg0K
PiANCj4gUmVwbGFjZSBleGlzdGluZyBtdWx0aS1xdWV1ZSBzcGVjaWZpYyBibG9ja2xpc3QgcGF0
dGVybnMgd2l0aCBhIHNpbmdsZSBnZW5lcmljDQo+IG11bHRpLnF1ZXVlIHJlZ2V4IHRvIHNpbXBs
aWZ5IG1haW50ZW5hbmNlIGFuZCBzdXBwcmVzcyBleHBlY3RlZCBDSSBmYWlsdXJlcy4NCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IFNoaXZ0ZWogUGF0aWwgPHNoaXZ0ZWouZWtuYXRoLnBhdGlsQGludGVs
LmNvbT4NCj4gLS0tDQo+ICB0ZXN0cy9pbnRlbC1jaS94ZS5ibWcuY29yZS5ibG9ja2xpc3QudHh0
IHwgMTIgKysrKystLS0tLS0tICB0ZXN0cy9pbnRlbC0NCj4gY2kveGUubG5sLmNvcmUuYmxvY2ts
aXN0LnR4dCB8IDEyICsrKysrLS0tLS0tLSAgdGVzdHMvaW50ZWwtDQo+IGNpL3hlLnB0bC5jb3Jl
LmJsb2NrbGlzdC50eHQgfCAxMCArKysrKy0tLS0tDQo+ICAzIGZpbGVzIGNoYW5nZWQsIDE1IGlu
c2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2lu
dGVsLWNpL3hlLmJtZy5jb3JlLmJsb2NrbGlzdC50eHQgYi90ZXN0cy9pbnRlbC0NCj4gY2kveGUu
Ym1nLmNvcmUuYmxvY2tsaXN0LnR4dA0KPiBpbmRleCBjZDM4ZDE2ZjguLmY4M2I1NDRjYiAxMDA2
NDQNCj4gLS0tIGEvdGVzdHMvaW50ZWwtY2kveGUuYm1nLmNvcmUuYmxvY2tsaXN0LnR4dA0KPiAr
KysgYi90ZXN0cy9pbnRlbC1jaS94ZS5ibWcuY29yZS5ibG9ja2xpc3QudHh0DQo+IEBAIC0zOSwx
MyArMzksNiBAQCBpZ3RAeGVfY29tcHV0ZUBjY3MtbW9kZS1iYXNpYw0KPiAjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMNCj4g
IGlndEB4ZV92bUAuKmV4cG9ydC4qDQo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMNCj4gLSMgVGVzdHMgbm90IGFwcGxp
Y2FibGUgZm9yIHRoZSBwbGF0Zm9ybSAtDQo+ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KPiAtaWd0QHhlX2V4ZWNfbXVs
dGlfcXVldWVALioNCj4gLWlndEB4ZV9ldmljdEAuKm11bHRpKC0pP3F1ZXVlLioNCj4gLWlndEAu
KkAuKi1tdWx0aV9xdWV1ZQ0KPiAtaWd0QC4qQC4qbXVsdGktcXVldWUuKg0KPiAtIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
DQo+ICAjIEV4cGVjdGVkIHNraXBzLCBLZXJuZWwgc3VwcG9ydCBub3QgYXZhaWxhYmxlDQo+ICMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIw0KPiAgaWd0QHhlX2V1ZGVidWdALioNCj4gQEAgLTgwLDMgKzczLDggQEAgaWd0QHhl
X2ZhdWx0X2luamVjdGlvbkBleGVjLXF1ZXVlLWNyZWF0ZS1mYWlsLQ0KPiB4ZV9weHBfZXhlY19x
dWV1ZV9hZGQNCj4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KPiAgaWd0QHhlX3BtQGQzaG90LWkyYw0KPiAgIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjDQo+ICsjIEV4cGVjdGVkIHNraXAgb24gQk1HIGR1ZSB0byB1bnN1cHBvcnRlZCBtdWx0aS1x
dWV1ZSBjYXBhYmlsaXR5ICMNCj4gK011bHRpLXF1ZXVlIGlzIG5vdCBzdXBwb3J0ZWQgb24gcGxh
dGZvcm1zIG9sZGVyIHRoYW4geGUzcA0KPiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjDQo+ICtpZ3RALiptdWx0aS5xdWV1
ZS4qDQo+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMNCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsLWNpL3hlLmxubC5j
b3JlLmJsb2NrbGlzdC50eHQgYi90ZXN0cy9pbnRlbC0NCj4gY2kveGUubG5sLmNvcmUuYmxvY2ts
aXN0LnR4dA0KPiBpbmRleCBjODMwYWMzYzguLjg4MTE1ZWMyMiAxMDA2NDQNCj4gLS0tIGEvdGVz
dHMvaW50ZWwtY2kveGUubG5sLmNvcmUuYmxvY2tsaXN0LnR4dA0KPiArKysgYi90ZXN0cy9pbnRl
bC1jaS94ZS5sbmwuY29yZS5ibG9ja2xpc3QudHh0DQo+IEBAIC04MSwxMyArODEsNiBAQCBpZ3RA
eGVfY29tcHV0ZUBjY3MtbW9kZS1jb21wdXRlLWtlcm5lbA0KPiAgIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjDQo+ICBpZ3RA
eGVfdm1ALipleHBvcnQuKg0KPiAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjDQo+IC0jIFRlc3RzIG5vdCBhcHBsaWNhYmxl
IGZvciB0aGUgcGxhdGZvcm0gLQ0KPiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMNCj4gLWlndEB4ZV9ldmljdEAuKm11bHRp
cXVldWUuKg0KPiAtaWd0QHhlX2V4ZWNfbXVsdGlfcXVldWVALioNCj4gLWlndEAuKkAuKi1tdWx0
aV9xdWV1ZQ0KPiAtaWd0QC4qQC4qbXVsdGktcXVldWUuKg0KPiAtIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjDQo+ICAjIEtl
cm5lbCBzdXBwb3J0IG5vdCBhdmFpbGFibGUNCj4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KPiAgaWd0QHhlX2V1ZGVi
dWdALioNCj4gQEAgLTEwOCwzICsxMDEsOCBAQCBpZ3RAeGVfbW9kdWxlX2xvYWRAZm9yY2UtbG9h
ZA0KPiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIw0KPiAgaWd0QHhlX3BtQGQzaG90LWkyYw0KPiAgIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjDQo+ICsj
IEV4cGVjdGVkIHNraXAgb24gTE5MIGR1ZSB0byB1bnN1cHBvcnRlZCBtdWx0aS1xdWV1ZSBjYXBh
YmlsaXR5ICMNCj4gK011bHRpLXF1ZXVlIGlzIG5vdCBzdXBwb3J0ZWQgb24gcGxhdGZvcm1zIG9s
ZGVyIHRoYW4geGUzcA0KPiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjDQo+ICtpZ3RALiptdWx0aS5xdWV1ZS4qDQo+ICsj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMNCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsLWNpL3hlLnB0bC5jb3JlLmJsb2Nr
bGlzdC50eHQgYi90ZXN0cy9pbnRlbC0NCj4gY2kveGUucHRsLmNvcmUuYmxvY2tsaXN0LnR4dA0K
PiBpbmRleCAzNjI3MTE0MDYuLjM1ZGVmNmZmZSAxMDA2NDQNCj4gLS0tIGEvdGVzdHMvaW50ZWwt
Y2kveGUucHRsLmNvcmUuYmxvY2tsaXN0LnR4dA0KPiArKysgYi90ZXN0cy9pbnRlbC1jaS94ZS5w
dGwuY29yZS5ibG9ja2xpc3QudHh0DQo+IEBAIC02NSwxMSArNjUsNiBAQCBpZ3RAeGVfcG1AZDNo
b3QtaTJjDQo+ICBpZ3RAeGVfY29tcHV0ZUBjY3MtbW9kZS1iYXNpYw0KPiAgaWd0QHhlX2NvbXB1
dGVAY2NzLW1vZGUtY29tcHV0ZS1rZXJuZWwNCj4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjDQo+IC0jIFRlc3RzIG5vdCBh
cHBsaWNhYmxlIGZvciB0aGUgcGxhdGZvcm0gLQ0KPiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMNCj4gLWlndEB4ZV9leGVj
X211bHRpX3F1ZXVlQC4qDQo+IC1pZ3RALipALiptdWx0aS1xdWV1ZS4qDQo+IC0jIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMN
Cj4gICMgRXhwZWN0ZWQgc2tpcHMgYXMgdGhlIHRlc3RzIGFyZSBub3Qgc3VwcG9ydGVkIG9uIFBU
TA0KPiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMNCj4gIGlndEB4ZV9hY2Nlc3NfY291bnRlckAuKg0KPiBAQCAtOTEsMyAr
ODYsOCBAQCBpZ3RAeGVfZmF1bHRfaW5qZWN0aW9uQGV4ZWMtcXVldWUtY3JlYXRlLWZhaWwtDQo+
IHhlX3B4cF9leGVjX3F1ZXVlX2FkZA0KPiAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjDQo+ICBpZ3RALipzdXJ2aXZhYmls
aXR5LioNCj4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjDQo+ICsjIEV4cGVjdGVkIHNraXAgb24gUFRML1dDTCBkdWUgdG8g
dW5zdXBwb3J0ZWQgbXVsdGktcXVldWUgY2FwYWJpbGl0eSAjDQo+ICtNdWx0aS1xdWV1ZSBpcyBu
b3Qgc3VwcG9ydGVkIG9uIHBsYXRmb3JtcyBvbGRlciB0aGFuIHhlM3ANCj4gKyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0K
PiAraWd0QC4qbXVsdGkucXVldWUuKg0KPiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjDQo+IC0tDQo+IDIuNDMuMA0KDQo=
