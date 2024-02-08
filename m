Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D207C4828F
	for <igt-dev@archiver.kernel.org>; Thu,  8 Feb 2024 16:03:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D8410E93D;
	Thu,  8 Feb 2024 16:03:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jxd3iXFI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A526510E93D
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Feb 2024 16:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707408234; x=1738944234;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uKU8lMNtQtB7sKTkXB7VRiq89IjwFxPCteO7cvX1dio=;
 b=jxd3iXFIF9jt5Q3o0x6dKxWqYZ3+CkH9W+KdHhGQfXVgtPh/GDtunXht
 rI5MAv61EY19Mfvf3iNTsEmfgRkpu4ZM1pVM5DBiN7iEZEYSXJtUE+kZ7
 GuUQ71YGzZLwzC6aYhCG1ph0qeKvzZh9Aee828efE0Hejfue9HlHHFSes
 9ZiaNSnMikzjWo9BenEqLSEAyw2b4GIINCs8V+qHUc+bIYqmWyA92GBGW
 0JkPmw1rrHL9kF/ht5f/vzLthNvsK9GGgyH9kSaGYKScj+jZUWZ2w7B1e
 iLJcRZjGHPn0DSQZRHWwqQXrKdInkEgUvXsLp2GI9d6HSWuHnYMhdOlI1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1402876"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1402876"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 08:03:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; d="scan'208";a="39121538"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Feb 2024 08:03:53 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 8 Feb 2024 08:03:52 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 8 Feb 2024 08:03:51 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 8 Feb 2024 08:03:51 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 8 Feb 2024 08:03:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L3/gDEMykOEx5O4yzbhX3z1Av4NaP6ukuV2z4fi4Wz+qgE5amoMXs8DemlFZMuYonOx9QDHzpxsY++mGg764l/1QFPhxJfTEpnqgVqwkz/d8dtKtTk4KDjwZ8Ycv60NIMkliWJQn6nBTkVJ+/7CQZa/VuwYbcfWZ9Xo7ZeZUaKud6E/NXJcc8dogeAl+H8hFYk152fT+21wQK5nIXJikfOR+H3FvidJZJSPrMjdqTbA9Unh+lIM/iSswbMlEx/YAfndXwGniLPyB1OG7CIam2t0U2h9+NCoyN7Uwg5PZPHZViuL8pVZNXl7zOwjJdlHwN3s6uHycNIBxoU9gi7Y62g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uKU8lMNtQtB7sKTkXB7VRiq89IjwFxPCteO7cvX1dio=;
 b=Q+cnfP4BpnOuYHWXgfTT6ICh19Nwa1/fS73om+zTOkUq/u5t9JNk6k/a52pOfr2jtdPNaDwhqludod24h40OyVaXRmKlluwl20B7qVUQzGC10ToG13oHJAFELXf7GLA2UOfHAgjXI8pzfR13EWNlDv+wj4ufCz5qxokw4dvBu58QC7X6gSGLNKiPBeJRrrThwQDb2Oe1fC5MLAJRjb0fYD8n9gVEDaDPxnBb4LTh8lsDNyMgGZsS20z2Za8GFYQEC3rlXQggMwfcR+aeHt+JiTXkSYHd1t8oq6sX4KRsgd86W0gCdjCBwQrm5iaQCWaYY3VwQTiQW1O10CAalXCDvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB6789.namprd11.prod.outlook.com (2603:10b6:a03:47f::11)
 by SA1PR11MB6992.namprd11.prod.outlook.com (2603:10b6:806:2b6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.39; Thu, 8 Feb
 2024 16:03:49 +0000
Received: from SJ0PR11MB6789.namprd11.prod.outlook.com
 ([fe80::879e:1ed3:5c7d:2cd9]) by SJ0PR11MB6789.namprd11.prod.outlook.com
 ([fe80::879e:1ed3:5c7d:2cd9%4]) with mapi id 15.20.7249.038; Thu, 8 Feb 2024
 16:03:49 +0000
From: "Kulkarni, Vandita" <vandita.kulkarni@intel.com>
To: "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "B S,
 Karthik" <karthik.b.s@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_async_flip: Reduce the clobbering area
 used for CRC test
Thread-Topic: [PATCH i-g-t] tests/kms_async_flip: Reduce the clobbering area
 used for CRC test
Thread-Index: AQHaWofbHCcHJt83d0emAjLKGTzGaLEAe6SAgAAYCkA=
Date: Thu, 8 Feb 2024 16:03:49 +0000
Message-ID: <SJ0PR11MB67899FCB90CF101777DDA1C98D442@SJ0PR11MB6789.namprd11.prod.outlook.com>
References: <20240208121039.13701-1-vandita.kulkarni@intel.com>
 <84ddef1c-d502-470d-8b05-2432416b8f9a@gmail.com>
In-Reply-To: <84ddef1c-d502-470d-8b05-2432416b8f9a@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6789:EE_|SA1PR11MB6992:EE_
x-ms-office365-filtering-correlation-id: 8769ddee-f7bd-45c3-69d3-08dc28bf89c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AZxgXssO+uSVGxwbWgsNbvBi53fEJZJBWvtn9eZDKk1GnI2agNDFz7Xe94h3M5CtgYwEoYXH6pz0M03uHchutKFTqhuqaiH9rJeESCGc6PcCPazlWn5Cs+/V2vcQ/CNFrYQkXMUWY8PKJ9Q6V3ipkQUDnHGFFiuQ19T162M1B6QlR9WfkgdFpbSi9KE0Ju/7FmMEMc2oH1+arEpft7NqOXpfsnCIRf+X/cLNtCmHxGvdYFwHE0i3gnobgyrQctVjbS1fBoc79t1XjSA7NkP4KrugdVBvJUpbU6ll/EBPQP2YfJ0yi1egv1WAMvKNEolePXouyIn/mY9+EmxMFEyC27H4IiVVM5p1RrMyjeaUOGgPnIcuRs32Ye0by2DToGBypkkCJzN8xF+9YqAB39bE0Y5nXsSEPEwgpPDNJngJLdUC2cVbW8d+6efyiE7YIsUTAE9sqZw7g9azo66pFrC5c7n9MzvAr4bbWXV6E1XYnriF35iT0DRu5uHUBYsQnMOTKoKt7AX8nJsVkUH0YXrFlsFfGiLeZgt7GZOlKvoMKtEO9h0CaRstS15Aat42mhm+6aUGtvrTk19GL1uDYLugOiCcIJ3EnNkHl3Idwji87NimtjXAViA9kg6jImOIt1IA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB6789.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(136003)(376002)(346002)(396003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(5660300002)(41300700001)(2906002)(52536014)(8676002)(4326008)(55016003)(8936002)(86362001)(83380400001)(82960400001)(38070700009)(66476007)(110136005)(66946007)(64756008)(26005)(7696005)(6506007)(71200400001)(53546011)(76116006)(66446008)(316002)(122000001)(38100700002)(54906003)(478600001)(66556008)(9686003)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MjhJQ09LRHMwbnB6dHdPdUlZSTVmNllHTURDNTY3dEF1cEIxWU9RMytGQWtp?=
 =?utf-8?B?QTJFYitXSW1FeEZaaE8ybWpUZjhucTRvUit1RzhoNDd5d0J4RTIwcVBoYktP?=
 =?utf-8?B?c2hVc0hvT1Vob0R2Ulp1dXdqTGlTdUhEczY3eVIvRVcvbVQ0UkhOcWR5ejVK?=
 =?utf-8?B?dGVuVUsvWnFVaWZYTWhYeGs3S1ZIN0xFR3RrUEdkK2lQWWxOUFJ3NGtOYWFO?=
 =?utf-8?B?b3FPUXMzMU9QSm1IRk1WWVpYR244cUltSWRmTXFqTXhiQ2Q3VFlvYjY4TWxF?=
 =?utf-8?B?azJCbWh5dkUxYWwwNmU4bHFiNGNMbUNaVnV3eHhqTHlkT1VtSEdWUUN5bllj?=
 =?utf-8?B?Y2pYK1QvcFliR1RobmdJeGNEdGk2RG02VmRnQ2RmMDl1Zm1FTGpxZjFCOE50?=
 =?utf-8?B?dWs4MU5KcC80Mk0vdFB5RWdpb3hhNXFrY0tMemhtaWtPcW1TSGNKSXUvQ0Rs?=
 =?utf-8?B?ZFhUUDVLNUoxYU5RZDl2QXp5a2tvdFJWQlBRMFFEa2dKRWR6a0w4N3lSN3cz?=
 =?utf-8?B?UVBFbjJ0TkF1a1k2bjhZN3Nza09pcUpVRmxQYTFpa2JGZW1neURvT0hUWVM0?=
 =?utf-8?B?RFBBMittTXlXQUNRSFZqR3VFclZRL3loNTE0czk3cVkwUThzd0FmTzBOVm9L?=
 =?utf-8?B?WU5haFBiZ2lNREg0R2tEVVhRVlFobFpYdDVwOXZEMk1QT005ZytPUTlIUkJG?=
 =?utf-8?B?T3hxSW9lM0ExbmZNVStibFZTTUMyQ3kwNm5ISGFUMDdEOGFLM3RJRnNmYUlY?=
 =?utf-8?B?Q05hbXBCZmtXbWJXYXB3MlF6N0pldk5mb1IyaUJRU1dnU21wT1Y1K2tJSDRE?=
 =?utf-8?B?Wlcybmg4NkpiV0d4U3U5MmEwZ1B5WUFiczZ5QnZsbEpxZWY1ZWtVWHFEN3Ja?=
 =?utf-8?B?M0NPc2tqa0FJSTFXSVZtYkhuRmwwOVI4WkZJTFc5TzJLNktOQ0hDd2xTdDBa?=
 =?utf-8?B?NzJtNVZJUkdYRUYxSGNvTDJhclJHODFVNWpnVzc1V25STjNEY0FzL1JNaDM2?=
 =?utf-8?B?N0RNeXlQd1FaYlBSeTFnOUJHRkUyQWxpc1N3aDNwVkJ0WE9MbG9qMjVUNG94?=
 =?utf-8?B?aVVSWEx2cW15bWh0bjd2emlXckhnUFZHQU92czlYcEptaG5GYTk1OGVQaXV0?=
 =?utf-8?B?blcyTEZuS3hzS3dwa3JocFZkWGJ2NVlHOGY5dE5BSWIyNk1VYklORDBjWUgv?=
 =?utf-8?B?a240TFF1ZGd0WlMxMDB2cUoyR1ZUTVltb1FGMDMyZHlNb3pGOTNqbGswejNK?=
 =?utf-8?B?ZXJSbmxQSXl6Vm55TGZLMEZvMjRnci9DVVMzdVZqUWZ5MDY3Mlc3V3EycTBT?=
 =?utf-8?B?R0JsdXh4bmI4eG55bEtQUnRJdTFRRlJCZmM1U005aGJzNXFxUlQ2dFcvYlRj?=
 =?utf-8?B?UHlPREhvSUlnNE4xRnFUSlVPTm9nQVVucEUyMVJIWWdzRnE4TC83UmNNS2pS?=
 =?utf-8?B?M2NPUXFtVHdBeFdIMkFjcFRBNGpRTmliS25DbmhDMk44NlBxSlZvZzRkWDJ1?=
 =?utf-8?B?dTdqR2NxVTdsN0oxZGxtdm4xMWs1bjdzN21GSDJmM3RmSFdHMGtRUkZXMFR3?=
 =?utf-8?B?TmFGQkRhN21FQ3JEc1pkb1FCM0F6TjhsV2prZVRXWVZyWFFOelFtS2o0NHdM?=
 =?utf-8?B?UGIvc2E1NG1MVWxrcWovank5aU9memJmbmZCYSsxeFJueitsVEc1KzRYZVhI?=
 =?utf-8?B?bDEyaGFhMGozelVwTlAwNGFBMDJzNEpBd3ZtUjFsbEM3RGxoNkJEbVJsSTRK?=
 =?utf-8?B?ZENVY1B0RHpGQVlqT01wOEN6NnVDdnRVK0RlUGNkMEZqMHdOcjkyN0REWmtE?=
 =?utf-8?B?L2d1RmN0ZWcxWXltc0hFaU5JLythakJ4VUNMNExTeDBlTHdiNytBaTF5Yzhn?=
 =?utf-8?B?S2hFT2tOUHkrRkRTb0NCTHJnb2swSm5ySHh3VENJbnM4d01oMDlRMlpoR2VF?=
 =?utf-8?B?bzJ0Q2dOYkNsbDUvalFjalFoTEVEWXc0aENsTnBZeEVBb3FLUHVGUEdMeVpp?=
 =?utf-8?B?RnhqS3QxUkEzaHZPZEh2VzNwSGFkZ3JWdFgxTTdzZXJUeS96UDBpZ1BtZzNh?=
 =?utf-8?B?WlJZY1hWamowalRJem9QL2VhaTdYNWU1Mzl2cWd2QlVQZjVYT3haUEpmY1dJ?=
 =?utf-8?B?NVFvRjhoaHhzZkVnNUFYVVY2NkUyWjRoSkhPUlVZcytxWHpTZzEydzQybExZ?=
 =?utf-8?B?eFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6789.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8769ddee-f7bd-45c3-69d3-08dc28bf89c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2024 16:03:49.4373 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TIkhIp3BdDnRG6oQeBMeGab4g7+3aNhhhqiGcHQhYCoHeh1qnEfXu+YMniVvU4yfVmuLgi+3DEjrh9GLZ1ZTw38d2GW+fJALtDPOToT2igk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6992
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKdWhhLVBla2thIEhlaWtraWxh
IDxqdWhhcGVra2EuaGVpa2tpbGFAZ21haWwuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgRmVicnVh
cnkgOCwgMjAyNCA3OjM5IFBNDQo+IFRvOiBLdWxrYXJuaSwgVmFuZGl0YSA8dmFuZGl0YS5rdWxr
YXJuaUBpbnRlbC5jb20+OyBpZ3QtDQo+IGRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6
IHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tOyBCIFMsIEthcnRoaWsgPGthcnRoaWsuYi5z
QGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCBpLWctdF0gdGVzdHMva21zX2FzeW5j
X2ZsaXA6IFJlZHVjZSB0aGUgY2xvYmJlcmluZyBhcmVhDQo+IHVzZWQgZm9yIENSQyB0ZXN0DQo+
IA0KPiBIaSBWYW5kaXRhLA0KPiANCj4gT24gOC4yLjIwMjQgMTQuMTAsIFZhbmRpdGEgS3Vsa2Fy
bmkgd3JvdGU6DQo+ID4gT24gc29tZSBwbGF0Zm9ybXMgd2NfbW1hcCB3cml0ZSB0YWtlcyBsb25n
ZXIgdG8gcGFpbnQgdGhlIGZiLCB3aGljaCB3ZQ0KPiA+IGFyZSB1c2luZyB0byBjbG9iYmVyIHRo
ZSBhbHJlYWR5IHNjYW5uZWQgYnVmZmVyIGZvciBDUkMuIEhlbmNlDQo+ID4gcmVkdWNpbmcgdGhl
IGNsb2JiZXJlZCBhcmVhLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogVmFuZGl0YSBLdWxrYXJu
aSA8dmFuZGl0YS5rdWxrYXJuaUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gICB0ZXN0cy9rbXNf
YXN5bmNfZmxpcHMuYyB8IDQgKystLQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS90ZXN0cy9rbXNfYXN5
bmNfZmxpcHMuYyBiL3Rlc3RzL2ttc19hc3luY19mbGlwcy5jIGluZGV4DQo+ID4gYTAzNDlmYTAz
Li4yZTU5NjA5NDMgMTAwNjQ0DQo+ID4gLS0tIGEvdGVzdHMva21zX2FzeW5jX2ZsaXBzLmMNCj4g
PiArKysgYi90ZXN0cy9rbXNfYXN5bmNfZmxpcHMuYw0KPiA+IEBAIC01ODksNyArNTg5LDcgQEAg
c3RhdGljIHZvaWQgdGVzdF9jcmMoZGF0YV90ICpkYXRhKQ0KPiA+DQo+ID4gICAJd2hpbGUgKGNs
b2NrX21zKCkgLSBzdGFydCA8IDIwMDApIHsNCj4gPiAgIAkJLyogZmlsbCB0aGUgbmV4dCBmYiB3
aXRoIHRoZSBleHBlY3RlZCBjb2xvciAqLw0KPiA+IC0JCXBhaW50X2ZiKGRhdGEsICZkYXRhLT5i
dWZzW2ZyYW1lXSwgMSwgaGVpZ2h0LCAweGZmMDAwMGZmKTsNCj4gPiArCQlwYWludF9mYihkYXRh
LCAmZGF0YS0+YnVmc1tmcmFtZV0sIDEwLCAxMCwgMHhmZjAwMDBmZik7DQo+IA0KPiBIZXJlIHJl
YWxseSBpcyBuZWVkZWQgdG8gYmUgcGFpbnRlZCBmdWxsIGhlaWdodCBvZiB0aGUgZnJhbWVidWZm
ZXIgYW5kIHRoYXQNCj4gd2lkdGggY2FuIGJlIGtlcHQgYXQgMSBhcyBhbnkgbnVtYmVyIGhpZ2hl
ciB3aWxsIGp1c3QgaW5jcmVhc2UgdGhlIHdvcmsuDQo+IA0KPiBGb3IgYXN5bmMgZmxpcCBwYXJ0
IG9mIGZiIHdoaWNoIHdpbGwgYmVjb21lIHZpc2libGUgaXMgbm90IGtub3duIGhlcmUgc28gdGhl
DQo+IGZ1bGwgaGVpZ2h0IG9mIHRoZSBmYiBuZWVkIHRvIGJlIHBhaW50ZWQgb24gdG8gY2F0Y2gg
aWYgdGhlcmUgd2FzIHNvbWV0aGluZw0KPiBnb2luZyB3cm9uZy4NClRoYW5rcyBKUCBmb3IgdGhl
IGZlZWRiYWNrLCB5b3UgYXJlIHJpZ2h0LCBmb3IgYXN5bmMgZmxpcCB3ZSBtaWdodCBub3Qga25v
dyBpZg0KdGhlIHByZXZpb3VzIGZiIGlzIHN0aWxsIGJlaW5nIHNjYW5uZWQgdW50aWwgd2UgY2hl
Y2sgdGhlIGxhc3QgbGluZS4NClRoaXMgbWlnaHQgbm90IGJlIHRoZSBzb2x1dGlvbiB0aGVuLg0K
DQpPdGhlciBvcHRpb24ob24gbm9uIGZpeGVkIHBhbmVscykgd2hlcmUgd2UgY2FuIG9wdGltaXpl
IGlzIGJ5IHNlbGVjdGluZyB0aGUNCnNtYWxsZXN0IG1vZGUsIHdoZXJlIGFzICBub3cgbW9kZVsw
XSBpcyBiZWluZyBwaWNrZWQuDQpJbmNhc2Ugd2UgcGljayB0aGUgc21hbGxlc3QgbW9kZSB3ZSBt
aWdodCBoYXZlIHRvIHdyaXRlIGEgbmV3IGNhc2UgdG8gdGVzdA0KYXN5bmMgZmxpcHMgd2l0aCBi
aWdqb2luZXIuDQpBbHNvIGl0IGlzIHJlYWxseSBub3QgY2xlYXIgb24gd2hpY2ggcGxhdGZvcm1z
IGFuZCBkcml2ZXJzLCBob3cgbXVjaCB0aW1lIGl0IHdvdWxkIHRha2UgdG8NCnBhaW50IDF4aCBm
Yi4gSSB3aWxsIHRyeSB0byBjaGVjayBmdXJ0aGVyIG9uIHRoaXMuDQoNClRoYW5rcywNClZhbmRp
dGENCj4gDQo+ID4NCj4gPiAgIAkJZGF0YS0+ZmxpcF9wZW5kaW5nID0gdHJ1ZTsNCj4gPiAgIAkJ
cmV0ID0gZHJtTW9kZVBhZ2VGbGlwKGRhdGEtPmRybV9mZCwgZGF0YS0+Y3J0Y19pZCwNCj4gPiBk
YXRhLT5idWZzW2ZyYW1lXS5mYl9pZCwgQEAgLTYwMCw3ICs2MDAsNyBAQCBzdGF0aWMgdm9pZA0K
PiA+IHRlc3RfY3JjKGRhdGFfdCAqZGF0YSkNCj4gPg0KPiA+ICAgCQkvKiBjbG9iYmVyIHRoZSBw
cmV2aW91cyBmYiB3aGljaCBzaG91bGQgbm8gbG9uZ2VyIGJlDQo+IHNjYW5uZWQgb3V0ICovDQo+
ID4gICAJCWZyYW1lID0gIWZyYW1lOw0KPiA+IC0JCXBhaW50X2ZiKGRhdGEsICZkYXRhLT5idWZz
W2ZyYW1lXSwgMSwgaGVpZ2h0LCByYW5kKCkpOw0KPiA+ICsJCXBhaW50X2ZiKGRhdGEsICZkYXRh
LT5idWZzW2ZyYW1lXSwgMTAsIDEwLCByYW5kKCkpOw0KPiA+ICAgCX0NCj4gPg0KPiA+ICAgCWln
dF9waXBlX2NyY19zdG9wKGRhdGEtPnBpcGVfY3JjKTsNCg0K
